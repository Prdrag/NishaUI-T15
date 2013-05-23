local T, C, L, G = unpack(Tukui)
local NamePlates, addonName = CreateFrame('frame', 'Nameplates', UIParent), select(1, ...)

-- config --
local NATIVE_FONT = CreateFont('NATIVE_FONT')
NATIVE_FONT:SetFont(select(1, ChatFrame1:GetFont()), 10, 'OUTLINE')
NATIVE_FONT:SetShadowColor(0,0,0,1)
NATIVE_FONT:SetShadowOffset(1, -1)
local background_color = {0, 0, 0}
local goodR, goodG, goodB = unpack(C.nameplate.goodcolor)
local badR, badG, badB = unpack(C.nameplate.badcolor)
local transitionR, transitionG, transitionB = unpack(C.nameplate.transitioncolor)
local filter_by_health = true
-- spell filter (for resto druid) - modify it or change empty table ()
local FilterSpellsCashe = {}
--[[
local FilterSpellsCashe = { 
	[770] = true, -- faerie fire
	[8921] = true, -- moonfire
	[5211] = true, -- stun
	[33786] = true, -- cyclone
	[2637] = true, -- sleep
	[339] = true, -- roots
}
]]
-- config --

-- locals

local _G = _G
local UnitGUID = UnitGUID
local GetTime = GetTime
local GetSpellInfo = GetSpellInfo
local GetRaidTargetIndex = GetRaidTargetIndex
local UnitPlayerControlled = UnitPlayerControlled
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local UnitDebuff = UnitDebuff
local UnitExists = UnitExists
local UnitIsFriend = UnitIsFriend
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName
local UnitPlayerControlled = UnitPlayerControlled
local UnitLevel = UnitLevel
local GetCVar = GetCVar
local band = bit.band
local strsplit = strsplit
local match = string.match
local wipe = table.wipe
local tonumber = tonumber
local tostring = tostring
local GetNumGroupMembers = GetNumGroupMembers
local GetNumBattlefieldScores = GetNumBattlefieldScores
local GetSpellTexture = GetSpellTexture
local IsInInstance = IsInInstance
local select = select

-- defined locals
local playerFaction = select(1, UnitFactionGroup('player')) == 'Horde' and 1 or 0
local playerGUID = UnitGUID('player')

local ScheduleFrame = CreateFrame('frame', 'ScheduleFrame', UIParent)
local ScheduleFrameActive = false
local timeToUpdate = 0
	
local fixvalue = function(val)
	if(val >= 1e6) then
		return ('%.2f'..SECOND_NUMBER_CAP):format(val / 1e6):gsub('%.?0+(['..FIRST_NUMBER_CAP..SECOND_NUMBER_CAP..'])$', '%1')
	elseif(val >= 1e4) then
		return ('%.1f'..FIRST_NUMBER_CAP):format(val / 1e3):gsub('%.?0+(['..FIRST_NUMBER_CAP..SECOND_NUMBER_CAP..'])$', '%1')
	else
		return val
	end
end

local NamePlateList = {}
local BGHealersList = {}
local GroupMembersList = {}
local AuraDurationsCache = {}
local DebuffCache = {}
local GroupTargetList = {}
local RaidIconGUID = {}
local NameGUID = {}
local AuraList = {}
local Aura_Spellid = {}
local Aura_Expiration = {}
local Aura_Stacks = {}
local Aura_Caster = {}
local Aura_Duration = {}
local Aura_Texture = {}
local IconFrameList = {}
local GUIDIgnoreCast = {}
local PlateHooks = {}

local RaidIconCoordinates = {
	[0] = 	{ [0] = 'STAR', 	[.25] = 'MOON', 	},
	[.25] = { [0] = 'CIRCLE', 	[.25] = 'SQUARE', 	},
	[.5] = 	{ [0] = 'DIAMOND', 	[.25] = 'CROSS', 	},
	[.75] = { [0] = 'TRIANGLE', [.25] = 'SKULL', 	}, 
}

local RaidTargetMask = { STAR = 0x00000001, CIRCLE = 0x00000002, DIAMOND = 0x00000004, TRIANGLE = 0x00000008, MOON = 0x00000010, SQUARE = 0x00000020, CROSS = 0x00000040, SKULL = 0x00000080, }
local RaidIconIndex = { 'STAR', 'CIRCLE', 'DIAMOND', 'TRIANGLE', 'MOON', 'SQUARE', 'CROSS', 'SKULL', }

local ScheduleHide = function(frame, elapsed)
	if elapsed == 0 then 
		frame:Hide()
		IconFrameList[frame] = nil
	else
		IconFrameList[frame] = elapsed
		frame:Show()
		if not ScheduleFrameActive then 
			ScheduleFrame:SetScript('OnUpdate', function(self)
				local curTime = GetTime()
				if curTime < timeToUpdate then return end
				local framecount = 0
				timeToUpdate = curTime + 1
				for frame, elapsed in pairs(IconFrameList) do
					if elapsed < curTime then 
						NamePlates:UpdateAuraWidget(frame:GetParent(), frame:GetParent().guid)
						frame:Hide() 
						IconFrameList[frame] = nil
					else 
						if frame.Poll then 
							frame.Poll(frame, elapsed) 
						end
						framecount = framecount + 1 
					end
				end
				if framecount == 0 then ScheduleFrame:SetScript('OnUpdate', nil) ScheduleFrameActive = false end
			end)
			ScheduleFrameActive = true
		end
	end
end

local InvalidCastCheck = function(self) if self.guid and GUIDIgnoreCast[self.guid] then GUIDIgnoreCast[self.guid] = nil end end

local UpdateIcon = function(self, texture, expiration, stacks)
	if self and texture and expiration then
		self.icon:SetTexture(texture)
		if stacks > 1 then self.stack:SetText(stacks)	else self.stack:SetText('') end
		local timeleft = ceil(expiration-GetTime())
		if timeleft > 60 then self.expired:SetText(ceil(timeleft/60)..'m') else self.expired:SetText(ceil(timeleft)) end
		self:Show()
		ScheduleHide(self, expiration)
	else 
		ScheduleHide(self, 0)
	end
end

local TogglePlate = function(self, hide) if hide == true then self:Hide() else self:Show() end end

local UpdateShowing = function(self)
	local _, maxh = self.health:GetMinMaxValues()
	TogglePlate(self, (maxh < 10) and true)
end

local UpdateHealthValue = function(self)
	local _, maxh = self.health:GetMinMaxValues()
	local val = self.health:GetValue()
	if C.nameplate.show_hp_value == true then
		self.health.value:Show()
		self.health.value:SetText(string.format("%s - %d%%", fixvalue(val), math.floor((val/maxh)*100)))
	else
		self.health.value:Hide()
	end
end

function NamePlates:UpdateAuraWidget(self, guid)
	local widget = self.AuraWidget
	if not widget then return end
	local AuraIconFrames = widget.AuraIconFrames
	local AurasOnUnit = AuraList[guid]
	local AuraSlotIndex = 1
	local instanceid
	
	DebuffCache = wipe(DebuffCache)
	local debuffCount = 0
	if AurasOnUnit then
		widget:Show()
		for instanceid in pairs(AurasOnUnit) do
			local aura = {}
			local aura_instance_id = guid..instanceid
			aura.spellid, aura.expiration, aura.stacks, aura.caster, aura.duration, aura.texture, aura.type, aura.target = Aura_Spellid[aura_instance_id], Aura_Expiration[aura_instance_id], Aura_Stacks[aura_instance_id], Aura_Caster[aura_instance_id], Aura_Duration[aura_instance_id], Aura_Texture[aura_instance_id]
			if tonumber(aura.spellid) then
				aura.name = GetSpellInfo(tonumber(aura.spellid))
				aura.unit = self.unit
				if aura.expiration > GetTime() then
					debuffCount = debuffCount + 1
					DebuffCache[debuffCount] = aura
				end
			end
		end
	end
	
	if debuffCount > 0 then 
		for index = 1, #DebuffCache do
			local cachedaura = DebuffCache[index]
			if cachedaura.spellid and cachedaura.expiration then 
				UpdateIcon(AuraIconFrames[AuraSlotIndex], cachedaura.texture, cachedaura.expiration, cachedaura.stacks) 
				AuraSlotIndex = AuraSlotIndex + 1
			end
			if AuraSlotIndex > C.nameplate.debuffscount then break end
		end
	end
	
	for AuraSlotIndex = AuraSlotIndex, C.nameplate.debuffscount do UpdateIcon(AuraIconFrames[AuraSlotIndex]) end
	
	DebuffCache = wipe(DebuffCache)
end

local CreateAuraIcon = function(parent)
	local button = CreateFrame('Frame', nil, parent)
	button:SetSize(20, 20)
	button:SetScript('OnHide', function() if parent.guid then NamePlates:UpdateAuraWidget(parent, parent.guid) end end)
	
	button.bg = button:CreateTexture(nil, 'BACKGROUND')
	button.bg:SetTexture(unpack(background_color))
	button.bg:SetAllPoints(button)
	
	button.border = button:CreateTexture(nil, 'BACKGROUND')
	button.border:SetDrawLayer('BACKGROUND', 2)
	button.border:SetTexture(unpack(background_color))
	button.border:SetPoint('TOPLEFT',button,'TOPLEFT', T.mult,-T.mult)
	button.border:SetPoint('BOTTOMRIGHT',button,'BOTTOMRIGHT',-T.mult,T.mult)
	
	button.icon = button:CreateTexture(nil, 'BORDER')
	button.icon:SetPoint('TOPLEFT',button,'TOPLEFT', T.mult*2,-T.mult*2)
	button.icon:SetPoint('BOTTOMRIGHT',button,'BOTTOMRIGHT',-T.mult*2,T.mult*2)
	button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	
	button.expired = button:CreateFontString(nil, 'OVERLAY')
	button.expired:SetPoint('CENTER', 1, 1)
	button.expired:SetJustifyH('CENTER')	
	button.expired:SetFontObject(NATIVE_FONT)
	button.expired:SetShadowColor(0, 0, 0, 0)
	
	button.stack = button:CreateFontString(nil,'OVERLAY')
	button.stack:SetFontObject(NATIVE_FONT)
	button.stack:SetShadowColor(0, 0, 0, 0)
	button.stack:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 1, 1)
	
	button.Poll = parent.PollFunction
	button:Hide()
	
	return button
end

local VirtualSetAura = function(guid, spellid, expiration, stacks, caster, duration, texture)
	local filter = false
	if (caster == playerGUID) then filter = true end
	if #FilterSpellsCashe > 0 then filter = FilterSpellsCashe[spellid] ~= nil end
	if filter ~= true then return end

	if guid and spellid and caster and texture then
		local aura_id = spellid..(tostring(caster or 'UNKNOWN_CASTER'))
		local aura_instance_id = guid..aura_id
		AuraList[guid] = AuraList[guid] or {}
		AuraList[guid][aura_id] = aura_instance_id
		Aura_Spellid[aura_instance_id] = spellid
		Aura_Expiration[aura_instance_id] = expiration
		Aura_Stacks[aura_instance_id] = stacks
		Aura_Caster[aura_instance_id] = caster
		Aura_Duration[aura_instance_id] = duration
		Aura_Texture[aura_instance_id] = texture
	end
end

local SearchNameplate = function(guid, raidIcon, sourceName, raidIconFlags)
	local frame
	if raidIconFlags and type(raidIconFlags) == 'number' then
		local UnitIcon
		for iconname, bitmask in pairs(RaidTargetMask) do if band(raidIconFlags, bitmask) > 0  then UnitIcon = iconname break end end	
		for frame, _ in pairs(NamePlateList) do
			frame = _G[frame]
			if frame and frame:IsShown() and frame.isMarked and (frame.raidIconType == UnitIcon) then return frame end
		end	
	end

	if raidIcon then
		for frame, _ in pairs(NamePlateList) do 
			frame = _G[frame] 
			if frame and frame:IsShown() and frame.isMarked and (frame.raidIconType == raidIcon) then return frame end 
		end
	end
	
	if guid then
		for frame, _ in pairs(NamePlateList) do 
			frame = _G[frame] 
			if frame and frame:IsShown() and frame.guid == guid then return frame end 
		end
	end
	
	if sourceName then
		local SearchFor = strsplit('-', sourceName)
		for frame, _ in pairs(NamePlateList) do 
			frame = _G[frame] 
			if frame and frame:IsShown() and frame.health.name:GetText() == SearchFor and frame.hasClass then return frame end 
		end
	end
end

local UpdateDebuffs = function(self)
	local guid = self.guid
	if not guid then
		if self.hasClass then guid = NameGUID[self.health.name:GetText()] elseif self.isMarked then guid = RaidIconGUID[self.raidIconType] end
		if guid then self.guid = guid else self.AuraWidget:Hide() return end
	end
	NamePlates:UpdateAuraWidget(self, guid)
end

local UpdateAurasByUnit = function(unit)
	if UnitIsFriend('player', unit) then return end
	local guid = UnitGUID(unit)
	
	if guid and AuraList[guid] then
		local unit_aura_list = AuraList[guid]
		for aura_id, aura_instance_id in pairs(unit_aura_list) do
			Aura_Spellid[aura_instance_id] = nil
			Aura_Expiration[aura_instance_id] = nil
			Aura_Stacks[aura_instance_id] = nil
			Aura_Caster[aura_instance_id] = nil
			Aura_Duration[aura_instance_id] = nil
			Aura_Texture[aura_instance_id] = nil
			unit_aura_list[aura_id] = nil
		end
	end
	
	for index = 1, 40 do
		local name , _, texture, count, dispelType, duration, expirationTime, unitCaster, _, _, spellid, _, isBossDebuff = UnitDebuff(unit, index)
		if not name then break end
		AuraDurationsCache[spellid] = duration
		VirtualSetAura(guid, spellid, expirationTime, count, UnitGUID(unitCaster or ''), duration, texture)
	end	

	local raidicon, name
	if UnitPlayerControlled(unit) then name = select(1, UnitName(unit)) end
	raidicon = RaidIconIndex[GetRaidTargetIndex(unit) or '']
	if raidicon then RaidIconGUID[raidicon] = guid end
	local frame = SearchNameplate(guid, raidicon, name)
	if frame then UpdateDebuffs(frame) end
end

local UpdateAuraByLookup = function(guid)
 	if guid == UnitGUID("target") then
		UpdateAurasByUnit("target")
	elseif guid == UnitGUID("mouseover") then
		UpdateAurasByUnit("mouseover")
	elseif GroupTargetList[guid] then
		local unit = GroupTargetList[guid]
		if unit then
			local unittarget = UnitGUID(unit.."target")
			if guid == unittarget then UpdateAurasByUnit(unittarget) end
		end		
	end
end

local UpdateAuraFunc = function(self)
	local parent = self:GetParent()
	local guid = parent.guid
	self.unit = parent.unit
	self.guidcache = guid
	
	if parent.isTarget then UpdateAurasByUnit('target')
	elseif parent.isMouseover then UpdateAurasByUnit('mouseover') end
	
	local raidicon, name
	if parent.isMarked then 
		raidicon = parent.raidIconType 
		if guid and raidicon then RaidIconGUID[raidicon] = guid end 
	end
	
	local frame = SearchNameplate(guid, raidicon, parent.health.name:GetText())
	if frame then UpdateDebuffs(frame) end
end

local Schedule = function(self, object)
	if not self.queue then self.queue = {} end
	self.queue[object] = true
	if object.OldShow then object.Show = object.OldShow object:Show() end
	if object.OldTexture then object:SetTexture(object.OldTexture) end
end

local CreateVirtualFrame = function(parent, point)
	if point == nil then point = parent end
	
	if point.backdrop then return end
	point.backdrop = parent:CreateTexture(nil, 'BORDER')
	point.backdrop:SetPoint('TOPLEFT', point, 'TOPLEFT', -T.mult*3, T.mult*3)
	point.backdrop:SetPoint('BOTTOMRIGHT', point, 'BOTTOMRIGHT', T.mult*3, -T.mult*3)
	point.backdrop:SetTexture(unpack(C.media.backdropcolor))
	point.backdrop:SetDrawLayer('BORDER', -8)

	if point.GetValue then
		point.light = parent:CreateTexture(nil, 'BORDER')
		point.light:SetPoint('TOPLEFT', point, 'TOPLEFT', -T.mult*5, T.mult*5)
		point.light:SetPoint('BOTTOMRIGHT', point, 'BOTTOMRIGHT', T.mult*5, -T.mult*5)
		point.light:SetTexture(C.media.highlight)
		point.light:SetDrawLayer('ARTWORK', 7)
	end
	
	point.bordertop = parent:CreateTexture(nil, "BORDER")
	point.bordertop:SetPoint("TOPLEFT", point, "TOPLEFT", -T.mult*2, T.mult*2)
	point.bordertop:SetPoint("TOPRIGHT", point, "TOPRIGHT", T.mult*2, T.mult*2)
	point.bordertop:SetHeight(T.mult)
	point.bordertop:SetTexture(unpack(C.media.backdropcolor))
	point.bordertop:SetDrawLayer("BORDER", -7)
	
	point.borderbottom = parent:CreateTexture(nil, "BORDER")
	point.borderbottom:SetPoint("BOTTOMLEFT", point, "BOTTOMLEFT", -T.mult*2, -T.mult*2)
	point.borderbottom:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", T.mult*2, -T.mult*2)
	point.borderbottom:SetHeight(T.mult)
	point.borderbottom:SetTexture(unpack(C.media.backdropcolor))
	point.borderbottom:SetDrawLayer("BORDER", -7)
	
	point.borderleft = parent:CreateTexture(nil, "BORDER")
	point.borderleft:SetPoint("TOPLEFT", point, "TOPLEFT", -T.mult*2, T.mult*2)
	point.borderleft:SetPoint("BOTTOMLEFT", point, "BOTTOMLEFT", T.mult*2, -T.mult*2)
	point.borderleft:SetWidth(T.mult)
	point.borderleft:SetTexture(unpack(C.media.backdropcolor))	
	point.borderleft:SetDrawLayer("BORDER", -7)
	
	point.borderright = parent:CreateTexture(nil, "BORDER")
	point.borderright:SetPoint("TOPRIGHT", point, "TOPRIGHT", T.mult*2, T.mult*2)
	point.borderright:SetPoint("BOTTOMRIGHT", point, "BOTTOMRIGHT", -T.mult*2, -T.mult*2)
	point.borderright:SetWidth(T.mult)
	point.borderright:SetTexture(unpack(C.media.backdropcolor))
	point.borderright:SetDrawLayer("BORDER", -7)	
end

local SetVirtualBorderColor = function(self, r, g, b) 
	self.bordertop:SetTexture(r, g, b)
	self.borderbottom:SetTexture(r, g, b)
	self.borderleft:SetTexture(r, g, b)
	self.borderright:SetTexture(r, g, b)
end

local GetFilter = function(self, ...)
	local name = self.health.name:GetText()
	self.health:Show()
	self.highlight:SetTexture(1, 1, 1, 0.15)	
	if BGHealersList[name] and C.nameplate.show_healer_icon then self.healerIcon:Show() else self.healerIcon:Hide() end
end

local ForEachPlate = function(func, ...)
	for frame, _ in pairs(NamePlateList) do
		frame = _G[frame]
		if frame and frame:IsShown() then func(frame, ...) end
	end
end

local GetRaidIcon = function(self)
	self.isMarked = self.raidicon:IsShown() or false
	if self.isMarked then
		local x, y = self.raidicon:GetTexCoord()
		self.raidIconType = RaidIconCoordinates[x][y]	
	else
		self.isMarked = nil
		self.raidIconType = nil
	end
end

local GetGUID = function(self, ...)
	if UnitExists('target') and self:GetAlpha() == 1 and UnitName('target') == self.health.name:GetText() then
		self.guid = UnitGUID('target')
		self.unit = 'target'
		UpdateAurasByUnit('target')
		self.health.shadow:SetAlpha(1)
	elseif self.highlight:IsShown() and UnitExists('mouseover') and UnitName('mouseover') == self.health.name:GetText() then
		self.guid = UnitGUID('mouseover')
		self.unit = 'mouseover'
		UpdateAurasByUnit('mouseover')
		self.health.shadow:SetAlpha(0)
	else
		self.unit = nil
		self.health.shadow:SetAlpha(0)
	end	
end

local UpdateThreat = function(self)
	if self.hasClass then return end
	if C.nameplate.enhancethreat ~= true then
		if self.threat:IsShown() then
			local _, val = self.threat:GetVertexColor()
			if val > .7 then
				SetVirtualBorderColor(self.health, unpack(C.media.backdropcolor))
				self.health:SetSize(C.nameplate.width, C.nameplate.height)
			else
				self.health:SetStatusBarColor(1, 0, 0)
				self.health.healthbg:SetTexture(1, 0, 0)
				SetVirtualBorderColor(self.health, unpack(C.media.backdropcolor))
				self.health:SetSize(C.nameplate.width, C.nameplate.height * 1.2)
			end
		else
			SetVirtualBorderColor(self.health, unpack(C.media.backdropcolor))
			self.health:SetSize(C.nameplate.width, C.nameplate.height)
		end
		else
		if not self.threat:IsShown() then
			if InCombatLockdown() and self.isFriendly ~= true then
				-- No Threat
				if T.Role == "Tank" then
					self.health:SetStatusBarColor(badR, badG, badB)
					self.health.healthbg:SetTexture(badR, badG, badB, 0.5)
				else
					self.health:SetStatusBarColor(goodR, goodG, goodB)
					self.health.healthbg:SetTexture(goodR, goodG, goodB, 0.5)
				end
			else
				-- Set colors to their original, not in combat
				self.health:SetStatusBarColor(1, 0, 0)
				self.health.healthbg:SetTexture(1, 0, 0)
				SetVirtualBorderColor(self.health, unpack(C.media.backdropcolor))
				self.health:SetSize(C.nameplate.width, C.nameplate.height * 1.2)
			end
		else
			-- Ok we either have threat or we're losing/gaining it
			local r, g, b = self.threat:GetVertexColor()
			if g + b == 0 then
				-- Have Threat
				if T.Role == "Tank" then
					self.health:SetStatusBarColor(goodR, goodG, goodB)
					self.health.healthbg:SetTexture(goodR, goodG, goodB, 0.5)
				else
					self.health:SetStatusBarColor(badR, badG, badB)
					self.health.healthbg:SetTexture(badR, badG, badB, 0.5)
				end
			else
				-- Losing/Gaining Threat
				self.health:SetStatusBarColor(transitionR, transitionG, transitionB)
				self.health.healthbg:SetTexture(transitionR, transitionG, transitionB, 0.5)
			end
		end
	end
end

local StopCastAnimation = function(self) self.castbar:Hide() self.castbar:SetScript('OnUpdate', nil) end

local StartCastAnimation = function(self, spellName, spellID, icon, startTime, endTime, notInterruptible, channel)
	if not (tonumber(GetCVar('showVKeyCastbar')) == 1) or not spellName then return end
	local castbar = self.castbar

	castbar.name:SetText(spellName)
	castbar.icon:SetTexture(icon)
	castbar.endTime = endTime / 1e3
	castbar.startTime = startTime / 1e3
	castbar.max = castbar.endTime - castbar.startTime
	castbar:SetMinMaxValues(0, castbar.max)
	
	castbar:Show()
	
	if notInterruptible then 
		castbar.shield:Show()
		castbar:SetStatusBarColor(0.78, 0.25, 0.25, 1)
	else 
		castbar.shield:Hide()
		castbar:SetStatusBarColor(1, 208/255, 0)
	end
	
	if channel then 
		castbar:SetScript('OnUpdate', function(self, elapsed)
			local duration = self.endTime - GetTime()
			if duration < 0 then
				StopCastAnimation(self:GetParent())
			else 
				self:SetValue(duration) 
				self.time:SetFormattedText('%.1f ', duration)
			end
		end)
	else 
		castbar:SetScript('OnUpdate', function(self, elapsed)
			local duration = GetTime() - self.startTime
			if duration > self.max then
				StopCastAnimation(self:GetParent())
			else 
				self:SetValue(duration)
				self.time:SetFormattedText('%.1f ', (self.endTime - self.startTime) - duration)
			end
		end)
	end	
end

local CastBar_OnValueChanged = function(self)
	local channel
	local spell, _, name, icon, start, finish, _, spellid, nonInt = UnitCastingInfo('target')
	
	if not spell then 
		spell, _, name, icon, start, finish, spellid, nonInt = UnitChannelInfo('target') 
		channel = true 
	end	
	
	if spell then 
		StartCastAnimation(self:GetParent():GetParent(), spell, spellid, icon, start, finish, nonInt, channel) 
	else 
		StopCastAnimation(self:GetParent():GetParent()) 
	end
end

local UpdateCastInfo = function(event, ignoreInt, unit)
	unit = unit or 'target'
	if event == 'UPDATE_MOUSEOVER_UNIT' then unit = 'mouseover' end
	local GUID = UnitGUID(unit)
	if not GUID then return end
	
	UpdateAuraByLookup(GUID)

	if not ignoreInt then UpdateAurasByUnit(unit) end
	local targetPlate
	if UnitIsPlayer(unit) then
		targetPlate = SearchNameplate(_,_,select(1, UnitName(unit)))
	else
		targetPlate = SearchNameplate(GUID)
	end
	
	local channel
	local spell, _, name, icon, start, finish, _, spellid, nonInt = UnitCastingInfo(unit)
	
	if not spell then 
		spell, _, name, icon, start, finish, spellid, nonInt = UnitChannelInfo(unit) 
		channel = true 
	end	
	
	if event == 'UPDATE_MOUSEOVER_UNIT' then nonInt = false end

	if spell and targetPlate then 
		StartCastAnimation(targetPlate, spell, spellid, icon, start, finish, nonInt, channel) 
	elseif targetPlate then
		StopCastAnimation(targetPlate)
	end
end

local CastBar_OnShow = function(self)
	self:ClearAllPoints()
	self:SetSize(self:GetParent().health:GetWidth(), C.nameplate.castbarheight)
	self:SetPoint('TOP', self:GetParent().health, 'BOTTOM', 0, -8)
	self:SetStatusBarTexture(C.media.normTex)
	self:GetStatusBarTexture():SetHorizTile(true)
	if self.shield:IsShown() then self:SetStatusBarColor(0.78, 0.25, 0.25, 1) else self:SetStatusBarColor(1, 208/255, 0) end
	
	SetVirtualBorderColor(self, unpack(background_color))
	
	self.icon:SetSize(10 + self:GetParent().health:GetHeight() + 8, 10 + self:GetParent().health:GetHeight() + 8)
	SetVirtualBorderColor(self.icon, unpack(background_color))
end

local HealthBar_OnShow = function(self)
	self = self:GetParent():GetParent()
	self.health:ClearAllPoints()
	self.health:SetSize(C.nameplate.width, C.nameplate.height)
	self.health:SetPoint('BOTTOM', self, 'BOTTOM', 0, 5)
	self.health:GetStatusBarTexture():SetHorizTile(true)

	self.health.backdrop:SetPoint('TOPLEFT', -T.mult*3, T.mult*3)
	self.health.backdrop:SetPoint('BOTTOMRIGHT', T.mult*3, -T.mult*3)
	
	self.hasClass = false	
	local r, g, b = self.health:GetStatusBarColor()
	for class, _ in pairs(RAID_CLASS_COLORS) do
		local r, g, b = floor(r * 100 + 0.5) / 100, floor(g * 100 + 0.5) / 100, floor(b * 100 + 0.5) / 100
		if RAID_CLASS_COLORS[class].r == r and RAID_CLASS_COLORS[class].g == g and RAID_CLASS_COLORS[class].b == b then
			self.hasClass = true
			self.health:SetStatusBarColor(unpack(oUFTukui.colors.class[class]))
		end
	end
	
	if not self.hasClass then
		self.isPlayer = nil
		local color
		if g+b == 0 then -- hostile
			color = {r=1, g=0, b=0}
			r,g,b = color.r, color.g, color.b
		elseif r+b == 0 then -- friendly npc
			color = {r=0, g=1, b=0}
			r,g,b = color.r, color.g, color.b
		elseif r+g > 1.95 then -- neutral
			color = {r=1, g=1, b=0}
			r,g,b = color.r, color.g, color.b
		elseif r+g == 0 then -- friendly player
			color = {r=0, g=1, b=.5}
			r,g,b = color.r, color.g, color.b
		end
		self.health:SetStatusBarColor(r, g, b)
	end
	
	self.health.color = {r, g, b}
	self.health.healthbg:SetTexture(r, g, b)
	self.health.healthbg:SetAlpha(.2)
	self.highlight:ClearAllPoints()
	self.highlight:SetAllPoints(self.health)	
	local level, elite, mylevel = tonumber(self.health.level:GetText()), self.health.elite:IsShown(), UnitLevel('player')
	self.health.level:ClearAllPoints()
	self.health.level:SetPoint('RIGHT', self.health, 'LEFT', -2, 0)
	
	if C.nameplate.show_level then
		self.health.level:SetTextColor(self.health.level:GetTextColor())
		if self.health.boss:IsShown() then
			self.health.level:SetText('boss')
			self.health.level:SetTextColor(0.8, 0.05, 0)
			self.health.level:Show()
		elseif not elite and level == mylevel then
			self.health.level:Hide()
		elseif level then
			self.health.level:SetText(level..(elite and '+' or ''))
			self.health.level:Show()
		end	
	else
		self.health.level:Hide()
	end
	
	for object in pairs(self.queue) do
		object.OldShow = object.Show
		object.Show = function() end
		if object:GetObjectType() == 'Texture' then object.OldTexture = object:GetTexture() object:SetTexture(nil) end
		object:Hide()
	end
end

local StylePlate = function(self)
	local f1, f2 = self:GetChildren()
	local health, old_castbar = f1:GetChildren()
	local name = f2:GetRegions()
	local threat, hpborder, highlight, level, bossicon, raidicon, elite = f1:GetRegions()
	local _, cbborder, cbshield, cbicon = old_castbar:GetRegions()
	
	if not self.health then
		self.health = health
		self.health:SetStatusBarTexture(C.media.normTex)

		self.health:CreateShadow("Default")
		self.health.shadow:ClearAllPoints()
		self.health.shadow:SetPoint('TOPLEFT', self.health, -5, 5)
		self.health.shadow:SetPoint('BOTTOMRIGHT', self.health, 5, -5)	
		self.health.shadow:SetBackdropBorderColor(1, 1, 1, 0.75)
		self.health.shadow:SetFrameLevel(0)
		self.health.shadow:SetAlpha(0)
		
		self.health.healthbg = self.health:CreateTexture(nil, 'BORDER')
		self.health.healthbg:SetAllPoints(self.health)
		self.health.healthbg:SetTexture(0, 0, 0, .25)
		self.health.healthbg:SetDrawLayer('BORDER', 6)
		
		CreateVirtualFrame(self.health)
	end
	
	if not self.health.value then
		self.health.value = self.health:CreateFontString(nil, "OVERLAY")	
		self.health.value:SetPoint("CENTER", self.health, 'CENTER')
		self.health.value:SetFontObject(NATIVE_FONT)
	end
	
	if not self.health.level then
		self.health.level = level
		self.health.level:SetFontObject(NATIVE_FONT)
		self.health.level:SetShadowOffset(0, 0)
		self.health.boss = bossicon
		self.health.elite = elite
	end	
	
	if not self.health.name then
		self.health.name = name
		self.health.name:SetPoint('BOTTOMLEFT', self.health, 'TOPLEFT', -10, 3)
		self.health.name:SetPoint('BOTTOMRIGHT', self.health, 'TOPRIGHT', 10, 3)
		self.health.name:SetFontObject(NATIVE_FONT)
		self.health.name:SetShadowOffset(0, 0)
	end
	
	highlight:SetTexture(1, 1, 1, .15)
	self.highlight = highlight	
	
	if not self.castbar then
		self.old_castbar = old_castbar
		self.castbar = CreateFrame('Statusbar', nil, self)
		self.castbar:SetFrameLevel(old_castbar:GetFrameLevel())
		self.castbar:SetFrameStrata(old_castbar:GetFrameStrata())
		CreateVirtualFrame(self.castbar)	
		self.castbar:Hide()
	end
	
	if not self.castbar.time then
		self.castbar.time = self.castbar:CreateFontString(nil, 'ARTWORK')
		self.castbar.time:SetPoint('RIGHT', self.castbar, 'LEFT', -1, 0)
		self.castbar.time:SetFontObject(NATIVE_FONT)
		self.castbar.time:SetShadowOffset(0, 0)
	end	
	
	if not self.castbar.name then
		self.castbar.name = self.castbar:CreateFontString(nil, 'ARTWORK')
		self.castbar.name:SetPoint('TOP', self.castbar, 'BOTTOM', 0, -3)
		self.castbar.name:SetFontObject(NATIVE_FONT)
		self.castbar.name:SetShadowOffset(0, 0)
	end	
	
	if not self.castbar.icon then
		old_castbar:SetAlpha(0)
		old_castbar:SetScale(0.000001)
		cbicon:ClearAllPoints()
		cbicon:SetPoint('TOPLEFT', self.health, 'TOPRIGHT', 8, 0)		
		cbicon:SetTexCoord(.1, .9, .1, .9)
		cbicon:SetDrawLayer('OVERLAY')
		cbicon:SetParent(self.castbar)
		self.castbar.icon = cbicon
		self.castbar.shield = cbshield
		CreateVirtualFrame(self.castbar, self.castbar.icon)
	end
	
	if not self.raidicon then
		raidicon:ClearAllPoints()
		raidicon:SetPoint('BOTTOM', self.health, 'TOP', 0, 16)
		raidicon:SetSize(25, 25)
		raidicon:SetTexture([[Interface\AddOns\Tukui\medias\textures\raidicons.blp]])
		self.raidicon = raidicon
	end	
	
	if not self.healerIcon then
		self.healerIcon = self:CreateTexture(nil, 'ARTWORK')
		self.healerIcon:SetPoint('BOTTOM', self.health, 'TOP', 0, 16)
		self.healerIcon:SetSize(35, 35)
		self.healerIcon:SetTexture([[Interface\LFGFrame\UI-LFG-ICON-RoleS]])
		self.healerIcon:SetTexCoord(0.26171875, 0.5234375, 0, 0.26171875)
	end	
	
	if not self.AuraWidget then
		self.AuraWidget = CreateFrame('frame', nil, self)
		self.AuraWidget:SetHeight(32) 
		self.AuraWidget:Show()
		self.AuraWidget:SetPoint('BOTTOMRIGHT', self.health, 'TOPRIGHT', 0, 10)
		self.AuraWidget:SetPoint('BOTTOMLEFT', self.health, 'TOPLEFT', 0, 10)		
		
		self.AuraWidget.PollFunction = function(self, elapsed)
			local timeleft = ceil(elapsed-GetTime())
			if timeleft > 60 then self.expired:SetText(ceil(timeleft/60)..'m') else self.expired:SetText(ceil(timeleft)) end
		end
		self.AuraWidget.AuraIconFrames = {}
		local AuraIconFrames = self.AuraWidget.AuraIconFrames
		for index = 1, C.nameplate.debuffscount do AuraIconFrames[index] = CreateAuraIcon(self.AuraWidget)  end
		local FirstRowCount = min(C.nameplate.debuffscount/2)
		
		AuraIconFrames[1]:SetPoint('RIGHT', self.AuraWidget, -1, 0)
		for index = 2, C.nameplate.debuffscount do AuraIconFrames[index]:SetPoint('RIGHT', AuraIconFrames[index-1], 'LEFT', -3, 0) end		
		
		self.AuraWidget._Hide = self.AuraWidget.Hide
		self.AuraWidget.Hide = function() if self.AuraWidget.guidcache then self.AuraWidget.unit = nil end self.AuraWidget:_Hide() end
		self.AuraWidget:SetScript('OnHide', function() for index = 1, C.nameplate.debuffscount do ScheduleHide(AuraIconFrames[index], 0) end end)	
	end
		
	Schedule(self, threat)
	Schedule(self, hpborder)
	Schedule(self, cbshield)
	Schedule(self, cbborder)
	Schedule(self, bossicon)
	Schedule(self, elite)
	
	HealthBar_OnShow(self.health)
	CastBar_OnShow(self.castbar)
	if not PlateHooks[self] then
		self.castbar:HookScript('OnShow', CastBar_OnShow)
		old_castbar:HookScript('OnValueChanged', CastBar_OnValueChanged)
		self.health:HookScript('OnShow', HealthBar_OnShow)
		self:HookScript('OnHide', function(self)
			local self = self:GetParent()
			if not self.health then return end
			--self.health:SetStatusBarColor(unpack(self.health.color))
			self.highlight:Hide()
			self.castbar:Hide()
			self.unit = nil
			self.isMarked = nil
			self.raidIconType = nil
			self.guid = nil
			self.hasClass = nil
			self.customScale = nil
			self.health.color = nil
			self.health.shadow:SetAlpha(0)
			SetVirtualBorderColor(self.health, unpack(background_color))
			if self.icons then for _,icon in ipairs(self.icons) do icon:Hide() end end	
		end)
	end	
	NamePlateList[self:GetName()] = true
end

local CheckHealersList = function()
	for i = 1, GetNumBattlefieldScores() do
		local name, _, _, _, _, faction, _, _, class, damageDone, healingDone, _, _, _, _, talentSpec = GetBattlefieldScore(i)
		if name then
			name = name:match('(.+)%-.+') or name
			if damageDone < healingDone and playerFaction == faction then
				BGHealersList[name] = true
			else
				BGHealersList[name] = nil
			end
		end
	end
end

local UpdateRoster = function()
	local groupType, groupSize, unitId, unitName
	if IsInRaid() then 
		groupType = 'raid'
		groupSize = GetNumGroupMembers() - 1
	elseif IsInGroup() then 
		groupType = 'party'
		groupSize = GetNumGroupMembers(LE_PARTY_CATEGORY_HOME) 
	else 
		groupType = 'solo'
		groupSize = 1
	end
	
	GroupMembersList = wipe(GroupMembersList)
	
	if groupType then
		for index = 1, groupSize do
			unitId = groupType..index	
			unitName = UnitName(unitId)
			if unitName then
				GroupMembersList[unitName] = unitId
			end
		end
	end	
end

NamePlates.updateAll = function(self)
	playerFaction = select(1, UnitFactionGroup('player')) == 'Horde' and 1 or 0
	playerGUID = UnitGUID('player')

	for _, v in pairs({NamePlateList, BGHealersList, GroupMembersList, AuraDurationsCache, DebuffCache, GroupTargetList, RaidIconGUID, NameGUID,
	AuraList, Aura_Spellid, Aura_Expiration, Aura_Stacks, Aura_Caster, Aura_Duration, Aura_Texture, IconFrameList, GUIDIgnoreCast, PlateHooks}) do v = {} end
	
	timeToUpdate = 0
	self.numChildren = -1
	ScheduleFrameActive = false
	UpdateRoster()

	self:SetScript('OnUpdate', function(self, elapsed)
		if self.numChildren == nil then self.numChildren = -1 end
		if WorldFrame:GetNumChildren() ~= self.numChildren then
			self.numChildren = WorldFrame:GetNumChildren()
			for index = 1, select('#', WorldFrame:GetChildren()) do
				local frame = select(index, WorldFrame:GetChildren())
				local f1, f2 = frame:GetChildren()
				local threat
				if (f1) then
					threat = f1:GetRegions()
				end
				if not NamePlateList[frame:GetName()] and (frame:GetName() and frame:GetName():find('NamePlate%d')) and threat and threat:GetObjectType() == 'Texture' then
					StylePlate(frame)
					frame.threat = threat
				end
			end
		end	
		
		ForEachPlate(GetFilter)
		--if filter_by_health then ForEachPlate(UpdateShowing) end
		
		self.elapsed = elapsed + (self.elapsed or 0 )
		if self.elapsed > .2 then
			ForEachPlate(GetGUID)
			ForEachPlate(UpdateHealthValue)
			ForEachPlate(UpdateThreat)
			ForEachPlate(GetRaidIcon)
			ForEachPlate(InvalidCastCheck)
			self.elapsed = 0
		end
	end)	
	
	local inInstance, instanceType = IsInInstance()
	if inInstance and instanceType == 'pvp' then
		self.CheckHealerTimer = self.CheckHealerTimer or CreateFrame('frame', 'CheckHealerTimer')
		self.CheckHealerTimer:SetScript('OnUpdate', function(self, elapsed)
			if self.st == nil then self.st = 0 end
			self.st = self.st + elapsed
			if self.st > 1 then self.st = 0 CheckHealersList() end
		end)
		CheckHealersList()
	else
		if self.CheckHealerTimer then self.CheckHealerTimer:SetScript('OnUpdate', nil) end
	end
	
	self:RegisterEvent('GROUP_ROSTER_UPDATE')
	self:RegisterEvent('PARTY_CONVERTED_TO_RAID')
	self:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
	self:RegisterEvent('PLAYER_TARGET_CHANGED')
	self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
	self:RegisterEvent('UNIT_TARGET')
	self:RegisterEvent('UNIT_AURA')
end

NamePlates:SetScript('OnEvent', function(self, event, ...)
	if event == 'GROUP_ROSTER_UPDATE' or event == 'PARTY_CONVERTED_TO_RAID' then
		UpdateRoster()
	elseif event == 'UPDATE_MOUSEOVER_UNIT' then
		UpdateCastInfo(event, true)
	elseif event == 'PLAYER_TARGET_CHANGED' then
		UpdateCastInfo(event)
	elseif event == 'COMBAT_LOG_EVENT_UNFILTERED' then
		local _, subEvent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellid, spellName, _, auraType, stackCount  = ...

		if event == 'SPELL_AURA_APPLIED' or event == 'SPELL_HEAL' or event == 'SPELL_DAMAGE' or event == 'SPELL_MISS' then GUIDIgnoreCast[sourceGUID] = spellName end
		
		if subEvent == 'SPELL_AURA_APPLIED' or subEvent == 'SPELL_AURA_REFRESH' then
			local duration = AuraDurationsCache[spellid]
			local texture = GetSpellTexture(spellid)
			VirtualSetAura(destGUID, spellid, GetTime() + (duration or 0), 1, sourceGUID, duration, texture)
		elseif subEvent == 'SPELL_AURA_APPLIED_DOSE' or subEvent == 'SPELL_AURA_REMOVED_DOSE' then
			local duration = AuraDurationsCache[spellid]
			local texture = GetSpellTexture(spellid)
			VirtualSetAura(destGUID, spellid, GetTime() + (duration or 0), stackCount, sourceGUID, duration, texture)
		elseif subEvent == 'SPELL_AURA_BROKEN' or subEvent == 'SPELL_AURA_BROKEN_SPELL' or subEvent == 'SPELL_AURA_REMOVED' then
			if destGUID and spellid and AuraList[destGUID] then
				local aura_instance_id = tostring(destGUID)..tostring(spellid)..(tostring(caster or 'UNKNOWN_CASTER'))
				local aura_id = spellid..(tostring(caster or 'UNKNOWN_CASTER'))
				if AuraList[destGUID][aura_id] then
					Aura_Spellid[aura_instance_id] = nil
					Aura_Expiration[aura_instance_id] = nil
					Aura_Stacks[aura_instance_id] = nil
					Aura_Caster[aura_instance_id] = nil
					Aura_Duration[aura_instance_id] = nil
					Aura_Texture[aura_instance_id] = nil
					AuraList[destGUID][aura_id] = nil
				end
			end
		elseif subEvent == 'SPELL_CAST_START' then
			local spell, _, icon, _, _, _, castTime, _, _ = GetSpellInfo(spellid)
			
			if GUIDIgnoreCast[sourceGUID] == spell then GUIDIgnoreCast[sourceGUID] = nil return end
			
			local foundPlate = nil

			if not (castTime > 0) then return end		
			if band(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then 
				if band(sourceFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) > 0 then 
					foundPlate = SearchNameplate(_, _, sourceName)
				elseif band(sourceFlags, COMBATLOG_OBJECT_CONTROL_NPC) > 0 then 
					foundPlate = SearchNameplate(sourceGUID)
					if not foundPlate then 
						foundPlate = SearchNameplate(_, _, _, sourceRaidFlags) 
					end
				else 
					return	
				end
			else 
				return 
			end	
			
			if not foundPlate or not foundPlate:IsShown() then return end
			
			if foundPlate.unit == 'mouseover' then
				UpdateCastInfo('UPDATE_MOUSEOVER_UNIT', true)	
			elseif foundPlate.unit == 'target' then
				UpdateCastInfo('PLAYER_TARGET_CHANGED')
			else
				foundPlate.guid = sourceGUID
				local currentTime = GetTime() * 1e3
				StartCastAnimation(foundPlate, spell, spellid, icon, currentTime, currentTime + castTime, false, false)
			end		
		elseif subEvent == 'SPELL_CAST_FAILED' or subEvent == 'SPELL_INTERRUPT' or subEvent == 'SPELL_CAST_SUCCESS' or subEvent == 'SPELL_HEAL' then
			local foundPlate = nil
			if sourceGUID == playerGUID and subEvent == 'SPELL_CAST_FAILED' then return end
			if band(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then 
				
				for iconname, bitmask in pairs(RaidTargetMask) do
					if band(destRaidFlags, bitmask) > 0  then
						RaidIconGUID[iconname] = destGUID
						raidicon = iconname
						break
					end
				end
			
				if band(sourceFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) > 0 then 
					foundPlate = SearchNameplate(sourceGUID, raidicon, sourceName)
				elseif band(sourceFlags, COMBATLOG_OBJECT_CONTROL_NPC) > 0 then 
					foundPlate = SearchNameplate(sourceGUID, raidicon, sourceName)
				else 
					return	
				end
			else 
				return 
			end	

			if foundPlate and foundPlate:IsShown() then 
				foundPlate.guid = sourceGUID
				StopCastAnimation(foundPlate)
			end		
		else
			if band(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then 
				if band(sourceFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) > 0 then 
					foundPlate = SearchNameplate(_,_,sourceName)
				elseif band(sourceFlags, COMBATLOG_OBJECT_CONTROL_NPC) > 0 then 
					foundPlate = SearchNameplate(_,_,_,sourceRaidFlags) 
				else 
					return	
				end
			else 
				return 
			end	
			
			if foundPlate and foundPlate:IsShown() and foundPlate.unit ~= 'target' then 
				foundPlate.guid = sourceGUID
			end			
		end

		if subEvent == 'SPELL_AURA_APPLIED' or subEvent == 'SPELL_AURA_REFRESH' or subEvent == 'SPELL_AURA_APPLIED_DOSE' or subEvent == 'SPELL_AURA_REMOVED_DOSE' or subEvent == 'SPELL_AURA_BROKEN' or subEvent == 'SPELL_AURA_BROKEN_SPELL' or subEvent == 'SPELL_AURA_REMOVED' then
			if (band(destFlags, COMBATLOG_OBJECT_REACTION_FRIENDLY) == 0) and auraType == 'DEBUFF' then		
				UpdateAuraByLookup(destGUID)
				local name, raidicon
				if band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) > 0 then 
					local rawName = strsplit('-', destName)
					NameGUID[rawName] = destGUID
					name = rawName
				end
				for iconname, bitmask in pairs(RaidTargetMask) do
					if band(destRaidFlags, bitmask) > 0  then
						RaidIconGUID[iconname] = destGUID
						raidicon = iconname
						break
					end
				end
				
				local frame = SearchNameplate(destGUID, raidicon, name)	
				if frame then UpdateDebuffs(frame) end				
			end
		end
		
	elseif event == 'PLAYER_LOGIN' then
		NamePlates.updateAll(self)
	elseif event == 'UNIT_TARGET' then
		GroupTargetList = wipe(GroupTargetList)
		for name, unitid in pairs(GroupMembersList) do if UnitExists(unitid..'target') then GroupTargetList[UnitGUID(unitid..'target')] = unitid..'target' end end
		UpdateCastInfo(event, _, ...)
	elseif event == 'UNIT_AURA' then
		local unit = ...
		if unit == 'target' or unit == 'focus' then UpdateAurasByUnit(unit) end
		if UnitExists(unit..'target') then UpdateCastInfo(event, _, unit..'target') end
		if UnitExists(unit) then UpdateCastInfo(event, _, unit) end
	end
end)

NamePlates:RegisterEvent('PLAYER_LOGIN')
NamePlates.updateAll(NamePlates)