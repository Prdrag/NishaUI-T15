local T, C, L = unpack(Tukui)
T.GetNishaUIVersion = GetAddOnMetadata( "NishaUi", "Version" )
T.StatColor = T.RGBToHex(unpack(C.media.datatextcolor2))
T.StatColorEnd = "|r"

-- Define action bar default buttons size
T.buttonsize = T.Scale(C.actionbar.buttonsize)
T.buttonspacing = T.Scale(C.actionbar.buttonspacing)
T.petbuttonsize = T.Scale(C.actionbar.petbuttonsize)
T.petbuttonspacing = T.Scale(C.actionbar.buttonspacing)

T.panelcolor = T.RGBToHex( unpack( C["media"].datatextcolor1 ) )
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
	or (T.myclass == "DRUID" and tree == 2 and GetBonusBarOffset() == 3) then
		T.Role = "Tank"
	elseif ((T.myclass == "PALADIN" and tree == 1) or (T.myclass == "DRUID" and tree == 3) or (T.myclass == "SHAMAN" and tree == 3) or (T.myclass == "PRIEST" and tree ~= 3) or (T.myclass == "MONK" and tree == 2)) then
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
				end
					
			else
				for _, panels in pairs( panelstomove ) do
					panels:Hide()
					BNtoastframemover:Hide()
				end
			end
		end
	else
		local panelstomove = {FilgerPlayerBuffs, FilgerPlayerDebuffs, FilgerPlayerProccs, FilgerPlayerCD, RaidCD, cbarMover, ctbarMover, FilgerPVEDebuffs, MicroAnchormover, FilgerPetbuffs}
		if FilgerPlayerBuffs or FilgerPlayerDebuffs or FilgerPlayerProccs or FilgerPlayerCD or FilgerTargetDebuffs or RaidCD or cbarMover or ctbarMover or FilgerPVEDebuffs or MicroAnchormover or FilgerPetbuffs then
			if MOVE_UI then
				for _, panels in pairs( panelstomove ) do
					panels:Show()
					BNtoastframemover:Show()
				end
			else
				for _, panels in pairs( panelstomove ) do
					panels:Hide()
					BNtoastframemover:Hide()
				end
			end
		end
	end
end

hooksecurefunc(_G.SlashCmdList, "MOVING", MoveUI)