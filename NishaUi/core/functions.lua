local T, C, L = unpack(Tukui)
T.GetNishaUIVersion = GetAddOnMetadata( "NishaUi", "Version" )
T.StatColor = T.RGBToHex(unpack(C.media.datatextcolor2))
T.StatColorEnd = "|r"

-- Define action bar default buttons size
T.buttonsize = T.Scale(C.actionbar.buttonsize)
T.buttonspacing = T.Scale(C.actionbar.buttonspacing)
T.petbuttonsize = T.Scale(C.actionbar.petbuttonsize)
T.petbuttonspacing = T.Scale(C.actionbar.buttonspacing)
if C.font.font == true then
	T.SetDefaultActionButtonCooldownFont = C.media.pixelfont
	T.SetDefaultActionButtonCooldownFontSize = 25
else
	T.SetDefaultActionButtonCooldownFont = C.media.font
	T.SetDefaultActionButtonCooldownFontSize = 20
end
T.panelcolor = T.RGBToHex( unpack( C["media"].datatextcolor1 ) )

local color = RAID_CLASS_COLORS[T.myclass]
T.cStart = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)

----------------------------------------------------------------------------------------
--	UTF functions
----------------------------------------------------------------------------------------
T.UTF = function(string, i, dots)
	if not string then return end
	local bytes = string:len()
	if bytes <= i then
		return string
	else
		local len, pos = 0, 1
		while (pos <= bytes) do
			len = len + 1
			local c = string:byte(pos)
			if c > 0 and c <= 127 then
				pos = pos + 1
			elseif c >= 192 and c <= 223 then
				pos = pos + 2
			elseif c >= 224 and c <= 239 then
				pos = pos + 3
			elseif c >= 240 and c <= 247 then
				pos = pos + 4
			end
			if len == i then break end
		end
		if len == i and pos <= bytes then
			return string:sub(1, pos - 1)..(dots and "..." or "")
		else
			return string
		end
	end
end
--------------------------------------------------------------------------------------------
-- Grid theme indicator section
--------------------------------------------------------------------------------------------

-- position of indicators
T.countOffsets = {
	TOPLEFT = {6*C["unitframes"].gridscale, 1},
	TOPRIGHT = {-6*C["unitframes"].gridscale, 1},
	BOTTOMLEFT = {6*C["unitframes"].gridscale, 1},
	BOTTOMRIGHT = {-6*C["unitframes"].gridscale, 1},
	LEFT = {6*C["unitframes"].gridscale, 1},
	RIGHT = {-6*C["unitframes"].gridscale, 1},
	TOP = {0, 0},
	BOTTOM = {0, 0},
}

-- skin the icon
T.CreateAuraWatchIcon = function(self, icon)
	icon:SetTemplate("Default")
	icon.icon:Point("TOPLEFT", 1, -1)
	icon.icon:Point("BOTTOMRIGHT", -1, 1)
	icon.icon:SetTexCoord(.08, .92, .08, .92)
	icon.icon:SetDrawLayer("ARTWORK")
	if (icon.cd) then
		icon.cd:SetReverse()
	end
	icon.overlay:SetTexture()
end

-- create the icon
T.createAuraWatch = function(self, unit)
	local auras = CreateFrame("Frame", nil, self)
	auras:SetPoint("TOPLEFT", self.Health, 2, -2)
	auras:SetPoint("BOTTOMRIGHT", self.Health, -2, 2)
	auras.presentAlpha = 1
	auras.missingAlpha = 0
	auras.icons = {}
	auras.PostCreateIcon = T.CreateAuraWatchIcon

	if (not C["unitframes"].auratimer) then
		auras.hideCooldown = true
	end

	local buffs = {}

	if (T.buffids["ALL"]) then
		for key, value in pairs(T.buffids["ALL"]) do
			tinsert(buffs, value)
		end
	end

	if (T.buffids[T.myclass]) then
		for key, value in pairs(T.buffids[T.myclass]) do
			tinsert(buffs, value)
		end
	end

	-- "Cornerbuffs"
	if (buffs) then
		for key, spell in pairs(buffs) do
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = spell[1]
			icon.anyUnit = spell[4]
			icon:Width(14)
			icon:Height(14)
			icon:SetPoint(spell[2], 0, 0)

			local count = icon:CreateFontString(nil, "OVERLAY")
			count:SetFont(C["media"].uffont, 12, "THINOUTLINE")
			count:SetPoint("CENTER", unpack(T.countOffsets[spell[2]]))
			icon.count = count

			auras.icons[spell[1]] = icon
		end
	end
	
	self.AuraWatch = auras
end

----------------------------------------------------------------------------------------
--	Player's Role and Talents spent
----------------------------------------------------------------------------------------
T.CheckForKnownTalent = function(spellid)
	local wanted_name = GetSpellInfo(spellid)
	if not wanted_name then return nil end
	local num_tabs = GetNumSpecializations()
	for t = 1, num_tabs do
		local num_talents = GetNumTalents(t)
		for i = 1, num_talents do
			local name_talent, _, _, _, current_rank = GetTalentInfo(t, i)
			if name_talent and name_talent == wanted_name then
				if current_rank and current_rank > 0 then
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

local RoleUpdater = CreateFrame("Frame")
local function CheckRole(self, event, unit)
	local tree = GetSpecialization()
	local resilience
	local resilperc = GetCombatRatingBonus(COMBAT_RATING_RESILIENCE_PLAYER_DAMAGE_TAKEN)
	if resilperc > GetDodgeChance() and resilperc > GetParryChance() and UnitLevel("player") == MAX_PLAYER_LEVEL then
		resilience = true
	else
		resilience = false
	end
	if ((T.myclass == "PALADIN" and tree == 2) or (T.myclass == "WARRIOR" and tree == 3) or (T.myclass == "DEATHKNIGHT" and tree == 1) or (T.myclass == "MONK" and tree == 1)) and resilience == false
	or (T.myclass == "DRUID" and tree == 3 and GetBonusBarOffset() == 3) then
		T.Role = "Tank"
	elseif ((T.myclass == "PALADIN" and tree == 1) or (T.myclass == "DRUID" and tree == 4) or (T.myclass == "SHAMAN" and tree == 3) or (T.myclass == "PRIEST" and tree ~= 3) or (T.myclass == "MONK" and tree == 2)) then
		T.Role = "Healer"
	else
		local playerint = select(2, UnitStat("player", 4))
		local playeragi = select(2, UnitStat("player", 2))
		local base, posBuff, negBuff = UnitAttackPower("player")
		local playerap = base + posBuff + negBuff

		if (((playerap > playerint) or (playeragi > playerint)) and not (T.myclass == "SHAMAN" and tree ~= 1 and tree ~= 3) and not (UnitBuff("player", GetSpellInfo(24858)) 
		or UnitBuff("player", GetSpellInfo(115070)))) or T.myclass == "ROGUE" or T.myclass == "HUNTER" or (T.myclass == "SHAMAN" and tree == 2) then
			T.Role = "Melee"
		else
			T.Role = "Caster"
		end
	end
end
RoleUpdater:RegisterEvent("PLAYER_ENTERING_WORLD")
RoleUpdater:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
RoleUpdater:RegisterEvent("PLAYER_TALENT_UPDATE")
RoleUpdater:RegisterEvent("CHARACTER_POINTS_CHANGED")
RoleUpdater:RegisterEvent("UNIT_INVENTORY_CHANGED")
RoleUpdater:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
RoleUpdater:SetScript("OnEvent", CheckRole)
CheckRole()


function T.SetModifiedBackdrop( self )
	local color = RAID_CLASS_COLORS[T.myclass]
	self:SetBackdropColor(color.r * 0.15, color.g * 0.15, color.b * 0.15 )
	self:SetBackdropBorderColor( color.r, color.g, color.b )
end

function T.SetOriginalBackdrop( self )
	local color = RAID_CLASS_COLORS[T.myclass]
	if( C["general"].classcolortheme == true ) then
		self:SetBackdropBorderColor( color.r, color.g, color.b )
	else
		self:SetTemplate( "Default" )
	end
end

function T.update_alpha( self )
	if( self.parent:GetAlpha() == 0 ) then
		self.parent:Hide()
		self:Hide()
	end
end

function T.fadeOut( self )
	UIFrameFadeOut( self, 0.4, 1, 0 )
	self.frame:Show()
end

function T.fadeIn( p )
	p.frame = CreateFrame( "Frame", nil, p )
	p.frame:Hide()
	p.frame.parent = p
	p.frame:SetScript( "OnUpdate", T.update_alpha )
	p:SetScript( "OnShow", function()
		p.frame:Hide()
		UIFrameFadeIn( p, 0.4, 0, 1 )
	end )
	p.fadeOut = T.fadeOut
end

-- just for creating text
T.SetFontString = function(parent, fontName, fontHeight, fontStyle)
	local fs = parent:CreateFontString(nil, "OVERLAY")
	fs:SetFont(fontName, fontHeight, fontStyle)
	fs:SetJustifyH("LEFT")
	fs:SetShadowColor(0, 0, 0)
	fs:SetShadowOffset(1.25, -1.25)
	return fs
end

T.PostCastStart = function(self, unit, name, rank, castid)
	if unit == "vehicle" then unit = "player" end

	if self.interrupt and UnitCanAttack("player", unit) then
		self:SetStatusBarColor(1,.2,.2,1)
	else
		self:SetStatusBarColor(.4, .4, .4,0.5)	
	end
end

-- display seconds to min/hour/day
T.FormatTime = function(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%d"..T.StatColor..L.buffs_day_abbr, ceil(s / day))
	elseif s >= hour then
		return format("%d"..T.StatColor..L.buffs_hour_abbr, ceil(s / hour))
	elseif s >= minute then
		return format("%d"..T.StatColor..L.buffs_min_abbr, ceil(s / minute))
	elseif s >= minute / 12 then
		return floor(s)
	end
	return format("%.1f", s)
end

T.SkinAura = function (self, button)
	button.count:SetFont(unpack(T.Fonts.bCount.setfont))
	button.remaining:SetFont(unpack(T.Fonts.bCount.setfont))
end

hooksecurefunc(T, "PostNamePosition", function(self)
	self.Name:ClearAllPoints()
	if (self.Power.value:GetText() and UnitIsEnemy("player", "target") and C["unitframes"].targetpowerpvponly == true) or (self.Power.value:GetText() and C["unitframes"].targetpowerpvponly == false) then
		self.Name:SetPoint("LEFT", self.Health, "LEFT", 4, 1)
	else
		self.Power.value:SetAlpha(0)
		self.Name:SetPoint("LEFT", self.Health, "LEFT", 4, 1)
	end
end)

local MOVE_UI = false

local function MoveUI()
	if InCombatLockdown() then return end
	if MOVE_UI then MOVE_UI = false else MOVE_UI = true end
	
		local defsize = 16
	local w = tonumber( string.match( ( { GetScreenResolutions() } )[GetCurrentResolution()], "(%d+)x+%d" ) )
	local h = tonumber( string.match( ( { GetScreenResolutions() } )[GetCurrentResolution()], "%d+x(%d+)" ) )
	local x = tonumber( gridsize ) or defsize

	function Grid()
		ali = CreateFrame( "Frame", nil, UIParent )
		ali:SetFrameLevel( 0 )
		ali:SetFrameStrata( "BACKGROUND" )

		for i = - ( w / x / 2 ), w / x / 2 do
			local Aliv = ali:CreateTexture( nil, "BACKGROUND" )
			Aliv:SetTexture( .3, 0, 0, .7 )
			Aliv:Point( "CENTER", UIParent, "CENTER", i * x, 0 )
			Aliv:SetSize( 1, h )
		end

		for i = - ( h / x / 2 ), h / x / 2 do
			local Alih = ali:CreateTexture( nil, "BACKGROUND" )
			Alih:SetTexture( .3, 0, 0, .7 )
			Alih:Point( "CENTER", UIParent, "CENTER", 0, i * x )
			Alih:SetSize( w, 1 )
		end
	end

	if( Ali ) then
		if( ox ~= x ) then
			ox = x
			ali:Hide()
			Grid()
			Ali = true
		else
			ali:Hide()
			Ali = false
		end
	else
		ox = x
		Grid()
		Ali = true
	end
	if T.myclass == "MONK" or T.myclass == "DRUID" or T.myclass == "WARLOCK" or T.myclass == "DEATHKNIGHT" or T.myclass == "PALADIN" or T.myclass == "PRIEST" or T.myclass == "SHAMAN" or T.myclass == "ROGUE" then
	local panelstomove = {cbMover, FilgerPlayerBuffs, FilgerPlayerDebuffs, FilgerPlayerProccs, FilgerPlayerCD, FilgerTargetDebuffs, RaidCD, cbarMover, ctbarMover, FilgerPVEDebuffs, MicroAnchormover, FilgerPetbuffs}
		if cbMover or FilgerPlayerBuffs or FilgerPlayerDebuffs or FilgerPlayerProccs or FilgerPlayerCD or FilgerTargetDebuffs or RaidCD or cbarMover or ctbarMover or FilgerPVEDebuffs or MicroAnchormover or FilgerPetbuffs then
			if MOVE_UI then
				for _, panels in pairs( panelstomove ) do
					panels:Show()
					BNtoastframemover:Show()
					if C["classtimer"].enable then
						Classtimermover:Show()
					end
				end
					
			else
				for _, panels in pairs( panelstomove ) do
					panels:Hide()
					BNtoastframemover:Hide()
					if C["classtimer"].enable then
						Classtimermover:Hide()
					end
				end
			end
		end
	else
		local panelstomove = {FilgerPlayerBuffs, FilgerPlayerDebuffs, FilgerPlayerProccs, FilgerTargetDebuffs, FilgerPlayerCD, RaidCD, cbarMover, ctbarMover, FilgerPVEDebuffs, MicroAnchormover, FilgerPetbuffs}
		if FilgerPlayerBuffs or FilgerPlayerDebuffs or FilgerPlayerProccs or FilgerPlayerCD or FilgerTargetDebuffs or RaidCD or cbarMover or ctbarMover or FilgerPVEDebuffs or MicroAnchormover or FilgerPetbuffs then
			if MOVE_UI then
				for _, panels in pairs( panelstomove ) do
					panels:Show()
					BNtoastframemover:Show()
					if C["classtimer"].enable then
						Classtimermover:Show()
					end
				end
			else
				for _, panels in pairs( panelstomove ) do
					panels:Hide()
					BNtoastframemover:Hide()
					if C["classtimer"].enable then
						Classtimermover:Hide()
					end
				end
			end
		end
	end
end

hooksecurefunc(_G.SlashCmdList, "MOVING", MoveUI)

local ShortValueNegative = function( v )
	if( v <= 999 ) then return v end
	if( v >= 1000000 ) then
		local value = string.format( "%.1fm", v / 1000000 )
		return value
	elseif( v >= 1000 ) then
		local value = string.format( "%.1fk", v / 1000 )
		return value
	end
end

local ShortValue = function( v )
	if( v >= 1e6 ) then
		return ( "%.1fm" ):format( v / 1e6 ):gsub( "%.?0+([km])$", "%1" )
	elseif( v >= 1e3 or v <= -1e3 ) then
		return ( "%.1fk" ):format( v / 1e3 ):gsub( "%.?0+([km])$", "%1" )
	else
		return v
	end
end

local function PostUpdateHealth( health, unit, min, max)
		if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
			if not UnitIsConnected(unit) then
				health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_offline.."|r")
			elseif UnitIsDead(unit) then
				health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_dead.."|r")
			elseif UnitIsGhost(unit) then
				health.value:SetText("|cffD7BEA5"..L.unitframes_ouf_ghost.."|r")
			end
		else
			local r, g, b
			
			-- overwrite healthbar color for enemy player (a tukui option if enabled), target vehicle/pet too far away returning unitreaction nil and friend unit not a player. (mostly for overwrite tapped for friendly)
			-- I don't know if we really need to call C["unitframes"].unicolor but anyway, it's safe this way.
			if (C["unitframes"].unicolor ~= true and C["unitframes"].enemyhcolor and unit == "target" and UnitIsEnemy(unit, "player") and UnitIsPlayer(unit)) or (C["unitframes"].unicolor ~= true and unit == "target" and not UnitIsPlayer(unit) and UnitIsFriend(unit, "player")) then
				local c = T.UnitColor.reaction[UnitReaction(unit, "player")]
				if c then 
					r, g, b = c[1], c[2], c[3]
					health:SetStatusBarColor(r, g, b)
				else
					-- if "c" return nil it's because it's a vehicle or pet unit too far away, we force friendly color
					-- this should fix color not updating for vehicle/pet too far away from yourself.
					r, g, b = 75/255,  175/255, 76/255
					health:SetStatusBarColor(r, g, b)
				end					
			end

			if min ~= max then
				local r, g, b
				r, g, b = oUFTukui.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
				if unit == "player" then
					if C["unitframes"].showtotalhpmp == true and C["unitframes"].perconly~= true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
					elseif C["unitframes"].perconly ~= true and C["unitframes"].showtotalhpmp ~= true then	
						health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
					elseif C["unitframes"].perconly == true and C["unitframes"].showtotalhpmp ~= true then				
						health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
					end				
				elseif unit == "target" then
					if C["unitframes"].showtotalhpmp == true and C["unitframes"].perconly~= true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
					elseif C["unitframes"].perconly == true and C["unitframes"].showtotalhpmp ~= true then				
						health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
					elseif C["unitframes"].perconly ~= true and C["unitframes"].showtotalhpmp ~= true then	
						health.value:SetFormattedText("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
					end
				else
					health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
				end
			else
				if unit == "player" then
					if C["unitframes"].showtotalhpmp == true and C["unitframes"].perconly~= true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
					elseif C["unitframes"].perconly ~= true and C["unitframes"].showtotalhpmp ~= true then	
						health.value:SetText("|cff559655"..ShortValue(max).."|r")
					elseif C["unitframes"].perconly == true and C["unitframes"].showtotalhpmp ~= true then				
						health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
					end				
				elseif unit == "target" then
					if C["unitframes"].showtotalhpmp == true and C["unitframes"].perconly~= true then
						health.value:SetFormattedText("|cff559655%s|r |cffD7BEA5|||r |cff559655%s|r", ShortValue(min), ShortValue(max))
					elseif C["unitframes"].perconly == true and C["unitframes"].showtotalhpmp ~= true then				
						health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
					elseif C["unitframes"].perconly ~= true and C["unitframes"].showtotalhpmp ~= true then	
						health.value:SetText("|cff559655"..ShortValue(max).."|r")
					end
				else
					health.value:SetText("|cff559655"..floor(min / max * 100).."%|r")
				end
			end
		end
	end

hooksecurefunc( T, "PostUpdateHealth", PostUpdateHealth )

local function PostUpdateHealthRaid( health, unit, min, max )
	if( not UnitIsConnected( unit ) or UnitIsDead( unit ) or UnitIsGhost( unit ) ) then
		if( not UnitIsConnected( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_offline .. "|r" )
		elseif( UnitIsDead( unit ) ) then
			health.value:SetText("|cffD7BEA5" .. L.unitframes_ouf_dead .. "|r" )
		elseif( UnitIsGhost( unit ) ) then
			health.value:SetText( "|cffD7BEA5" .. L.unitframes_ouf_ghost .. "|r" )
		end
	else
		if( not UnitIsPlayer( unit ) and UnitIsFriend( unit, "player" ) and C["unitframes"]["unicolor"] ~= true ) then
			local c = T.UnitColor.reaction[5]
			local r, g, b = c[1], c[2], c[3]
			health:SetStatusBarColor( r, g, b )
			health.bg:SetTexture( 0.1, 0.1, 0.1 )
		end

		if C["unitframes"].gradienthealth == true and C["unitframes"].unicolor == true  then
			if( not UnitIsConnected( unit ) or UnitIsDead( unit ) or UnitIsGhost( unit ) ) then return end
			if( not health.classcolored ) then
				local r, g, b = oUFTukui.ColorGradient( min, max, unpack( C["unitframes"].gradient ) )
				health:SetStatusBarColor( r, g, b )
			end
		end
		
		if( min ~= max ) then
			health.value:SetText( "|cff559655-" .. ShortValueNegative( max - min ) .. "|r" )
		else
			health.value:SetText( " " )
		end
	end
end

hooksecurefunc( T, "PostUpdateHealthRaid", PostUpdateHealthRaid)

-- function to update power text on unit frames
local function PostUpdatePower(power, unit, min, max)
	local self = power:GetParent()
	local pType, pToken = UnitPowerType(unit)
	local color = T.UnitColor.power[pToken]

	if color then
		power.value:SetTextColor(color[1], color[2], color[3])
	end

	if not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) or not UnitIsConnected(unit) then
		power.value:SetText()
	elseif UnitIsDead(unit) or UnitIsGhost(unit) then
		power.value:SetText()
	else
		if min ~= max then
				if unit == "target" then
					power.value:SetText(" ")
				elseif unit == "player" then
					if C["unitframes"].showtotalhpmp == true then
						power.value:SetFormattedText("%s |cffD7BEA5|||r %s", ShortValue(max - (max - min)), ShortValue(max))
					else
						power.value:SetText(ShortValue(min))
					end
				elseif(unit and unit:find("arena%d")) or unit == "focus" or unit == "focustarget" then
					power.value:SetText(ShortValue(min))
				else
					power.value:SetText(" ")
				end
		else
			if unit == "player" or unit == "pet" or unit == "focus" or unit == "focustarget" or (unit and unit:find("arena%d")) then
				power.value:SetText(ShortValue(min))
			else
				power.value:SetText(" ")
			end
		end
	end
	if self.Name then
		if unit == "target" then T.PostNamePosition(self, power) end
	end
end
hooksecurefunc( T, "PostUpdatePower", PostUpdatePower)


-- create a skin for all unitframes buffs/debuffs
T.PostCreateAura = function(self, button)
	button:SetTemplate("Default")
	
	button.remaining = T.SetFontString(button, C["media"].font, C["unitframes"].auratextscale, "THINOUTLINE")
	button.remaining:Point("CENTER", 1, 0)
	
	button.cd.noOCC = true -- hide OmniCC CDs, because we  create our own cd with CreateAuraTimer()
	button.cd.noCooldownCount = true -- hide CDC CDs, because we create our own cd with CreateAuraTimer()
	
	button.cd:SetReverse()
	button.icon:Point("TOPLEFT", 2, -2)
	button.icon:Point("BOTTOMRIGHT", -2, 2)
	button.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	button.icon:SetDrawLayer('ARTWORK')
	
	button.count:Point("BOTTOMRIGHT", 3, 3)
	button.count:SetJustifyH("RIGHT")
	button.count:SetFont(C["media"].font, 9, "THICKOUTLINE")
	button.count:SetTextColor(0.84, 0.75, 0.65)
	
	button.overlayFrame = CreateFrame("frame", nil, button, nil)
	button.cd:SetFrameLevel(button:GetFrameLevel() + 1)
	button.cd:ClearAllPoints()
	button.cd:Point("TOPLEFT", button, "TOPLEFT", 2, -2)
	button.cd:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
	button.overlayFrame:SetFrameLevel(button.cd:GetFrameLevel() + 1)	   
	button.overlay:SetParent(button.overlayFrame)
	button.count:SetParent(button.overlayFrame)
	button.remaining:SetParent(button.overlayFrame)
			
	button.Glow = CreateFrame("Frame", nil, button)
	button.Glow:Point("TOPLEFT", button, "TOPLEFT", -3, 3)
	button.Glow:Point("BOTTOMRIGHT", button, "BOTTOMRIGHT", 3, -3)
	button.Glow:SetFrameStrata("BACKGROUND")	
	button.Glow:SetBackdrop{edgeFile = C["media"].glowTex, edgeSize = 3, insets = {left = 0, right = 0, top = 0, bottom = 0}}
	button.Glow:SetBackdropColor(0, 0, 0, 0)
	button.Glow:SetBackdropBorderColor(0, 0, 0)
	
	local Animation = button:CreateAnimationGroup()
	Animation:SetLooping("BOUNCE")

	local FadeOut = Animation:CreateAnimation("Alpha")
	FadeOut:SetChange(-.9)
	FadeOut:SetDuration(.6)
	FadeOut:SetSmoothing("IN_OUT")

	button.Animation = Animation
end


T.UpdatePvPStatus = function(self, elapsed)
	if self.elapsed and self.elapsed > 0.2 then
		local unit = self.unit
		local time = GetPVPTimer()

		local min = format("%01.f", floor((time / 1000) / 60))
		local sec = format("%02.f", floor((time / 1000) - min * 60))
		if self.Status then
			local factionGroup = UnitFactionGroup(unit)
			if UnitIsPVPFreeForAll(unit) then
				if time ~= 301000 and time ~= -1 then
					self.Status:SetText(PVP.." ".."["..min..":"..sec.."]")
				else
					self.Status:SetText(PVP)
				end
			elseif factionGroup and UnitIsPVP(unit) then
				if time ~= 301000 and time ~= -1 then
					self.Status:SetText(PVP.." ".."["..min..":"..sec.."]")
				else
					self.Status:SetText(PVP)
				end
			else
				self.Status:SetText("")
			end
		end
		self.elapsed = 0
	else
		self.elapsed = (self.elapsed or 0) + elapsed
	end
end

-- update cd, border color, etc on buffs / debuffs
T.PostUpdateAura = function(self, unit, icon, index, offset, filter, isDebuff, duration, timeLeft)
	local _, _, _, _, dtype, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, icon.filter)
	if icon then
		if(icon.filter == "HARMFUL") then
			if(not UnitIsFriend("player", unit) and icon.owner ~= "player" and icon.owner ~= "vehicle") then
				icon.icon:SetDesaturated(true)
				icon:SetBackdropBorderColor(unpack(C.media.bordercolor))
			else
				local color = DebuffTypeColor[dtype] or DebuffTypeColor.none
				icon.icon:SetDesaturated(false)
				icon:SetBackdropBorderColor(color.r * 0.8, color.g * 0.8, color.b * 0.8)
			end
		else
			if (isStealable or ((T.myclass == "MAGE" or T.myclass == "PRIEST" or T.myclass == "SHAMAN") and dtype == "Magic")) and not UnitIsFriend("player", unit) then
				if not icon.Animation:IsPlaying() then
					icon.Animation:Play()
				end
			else
				if icon.Animation:IsPlaying() then
					icon.Animation:Stop()
				end
			end
		end
		
		if duration and duration > 0 then
			if C["unitframes"].auratimer == true then
				icon.remaining:Show()
			else
				icon.remaining:Hide()
			end
		else
			icon.remaining:Hide()
		end
	 
		icon.duration = duration
		icon.timeLeft = expirationTime
		icon.first = true
		icon:SetScript("OnUpdate", CreateAuraTimer)
	end
end