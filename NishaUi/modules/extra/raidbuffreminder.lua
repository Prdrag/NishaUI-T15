local T, C, L, G = unpack(Tukui)

--Locals
--Setup Caster Buffs
local function SetCasterOnlyBuffs()
	Spell1Buff = {
		77747, -- Burning Wrath
		109773, -- Dark Intent
		1459, -- Arcane Brilliance
		61316, -- Dalaran Brilliance
	}
	Spell2Buff = { --Total Stats
		24907, -- Moonkin Aura
		51470, -- Elemental Oath
		49868, -- Mind Quickening
	}
	Spell3Buff = { --Total Stats
		117667, --Legacy of The Emperor
		1126, 	-- Mark of The Wild
		20217, 	-- Blessing Of Kings
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding Shout
		-- 6307, -- Imp. Blood Pact
		21562, -- Power Word: Fortitude
	}
	Spell5Buff = { --Total Mana
		116956, --Grace of Air
		19740, -- Blessing of Might
	}
	Spell6Buff = { --Crit
		1459, -- Arcane Brilliance
		24932, -- Leader of The Pact
		116781, -- Legacy of the White Tiger
	}
end

--Setup everyone else's buffs
local function SetBuffs()
	Spell1Buff = { -- Attack Speed
		30809, -- Unleashed Rage
		113742, -- Swiftblade's Cunning
		55610, -- Improved Icy Talons
	}
	Spell2Buff = { -- 5% crit
		61316, -- Dalaran Brilliance
		1459, -- Arcane Brilliance
		24932, -- Leader of The Pact
		116781, -- Legacy of the White Tiger
	}
	Spell3Buff = { --Total Stats
		1126, -- "Mark of the wild"
		20217, --"Greater Blessing of Kings",
		117667, --Legacy of The Emperor
	}
	Spell4Buff = { --Total Stamina
		469, -- Commanding Shout
		-- 6307, -- Imp. Blood Pact
		21562, -- Power Word: Fortitude
	}
	Spell5Buff = { --Mastery
		116956, --Grace of Air
		19740, -- Blessing of Might
	}
	Spell6Buff = { --Total AP
		19506, -- Trueshot Aura
		6673, -- Battle Shout
		57330, -- Horn of Winter
	}
end


--Main Script
local function OnAuraChange(self, event, arg1, unit)
	if (event == "UNIT_AURA" and arg1 ~= "player") then 
		return
	end
	
	--If We're a caster we may want to see differant buffs
	if T.Role == "Caster" or T.Role == "Healer" then 
		SetCasterOnlyBuffs()
	else
		SetBuffs()
	end
	
	
	for i, Spell1Buff in pairs(Spell1Buff) do
		local spellname = select(1, GetSpellInfo(Spell1Buff))
		if UnitAura("player", spellname) then
			Spell1Frame:SetAlpha(1)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
			Spell1Frame.id = Spell1Buff
			break
		else
			Spell1Frame:SetAlpha(0.2)
			Spell1Frame.t:SetTexture(select(3, GetSpellInfo(Spell1Buff)))
		end
		Spell1Frame.id = Spell1Buff
	end	
	
	for i, Spell2Buff in pairs(Spell2Buff) do
		local spellname = select(1, GetSpellInfo(Spell2Buff))
		if UnitAura("player", spellname) then
			Spell2Frame:SetAlpha(1)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
			Spell2Frame.id = Spell2Buff
			break
		else
			Spell2Frame:SetAlpha(0.2)
			Spell2Frame.t:SetTexture(select(3, GetSpellInfo(Spell2Buff)))
		end
		Spell2Frame.id = Spell2Buff
	end	
	
	for i, Spell3Buff in pairs(Spell3Buff) do
		local spellname = select(1, GetSpellInfo(Spell3Buff))
		if UnitAura("player", spellname) then
			Spell3Frame:SetAlpha(1)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
			Spell3Frame.id = Spell3Buff
			break
		else
			Spell3Frame:SetAlpha(0.2)
			Spell3Frame.t:SetTexture(select(3, GetSpellInfo(Spell3Buff)))
		end
		Spell3Frame.id = Spell3Buff
	end
	
	for i, Spell4Buff in pairs(Spell4Buff) do
		local spellname = select(1, GetSpellInfo(Spell4Buff))
		if UnitAura("player", spellname) then
			Spell4Frame:SetAlpha(1)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
			break
		else
			Spell4Frame:SetAlpha(0.2)
			Spell4Frame.t:SetTexture(select(3, GetSpellInfo(Spell4Buff)))
			Spell4Frame.id = Spell4Buff
		end
	end
	
	for i, Spell5Buff in pairs(Spell5Buff) do
		local spellname = select(1, GetSpellInfo(Spell5Buff))
		if UnitAura("player", spellname) then
			Spell5Frame:SetAlpha(1)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
			Spell5Frame.id = Spell5Buff
			break
		else
			Spell5Frame:SetAlpha(0.2)
			Spell5Frame.t:SetTexture(select(3, GetSpellInfo(Spell5Buff)))
		end
		Spell5Frame.id = Spell5Buff
	end	
	
	for i, Spell6Buff in pairs(Spell6Buff) do
		local spellname = select(1, GetSpellInfo(Spell6Buff))
		if UnitAura("player", spellname) then
			Spell6Frame:SetAlpha(1)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
			Spell6Frame.id = Spell6Buff
			break
		else
			Spell6Frame:SetAlpha(0.2)
			Spell6Frame.t:SetTexture(select(3, GetSpellInfo(Spell6Buff)))
		end
		Spell6Frame.id = Spell6Buff
	end	
end

local RBRWidth = ((TukuiMinimap:GetWidth() - 6) / 6) + 4
local bsize = ((TukuiMinimap:GetHeight() - 9) / 6)

local raidbuff_reminder = CreateFrame('Frame', 'RaidBuffReminder', Minimap)
raidbuff_reminder:SetTemplate('Default')
raidbuff_reminder:Width(RBRWidth)
raidbuff_reminder:Point('TOPLEFT', TukuiMinimap, 'TOPRIGHT', 4, 0)
raidbuff_reminder:Point('BOTTOMLEFT', TukuiMinimap, 'BOTTOMRIGHT', 4, 0)

raidbuff_reminder:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_INVENTORY_CHANGED")
raidbuff_reminder:RegisterEvent("UNIT_AURA")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_ENABLED")
raidbuff_reminder:RegisterEvent("PLAYER_REGEN_DISABLED")
raidbuff_reminder:RegisterEvent("PLAYER_ENTERING_WORLD")
raidbuff_reminder:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
raidbuff_reminder:RegisterEvent("CHARACTER_POINTS_CHANGED")
raidbuff_reminder:RegisterEvent("ZONE_CHANGED_NEW_AREA")
raidbuff_reminder:SetScript("OnEvent", OnAuraChange)
raidbuff_reminder:SetScript("OnMouseUp", microMenuGenerator)



--Function to create buttons
local function CreateButton(name, relativeTo, firstbutton, lastbutton)
	local button = CreateFrame("Button", name, RaidBuffReminder)
	button:SetTemplate('Default')
	button:Size(RBRWidth - 4)
	if firstbutton == true then
		button:Point("TOP", relativeTo, "TOP", 0, -2)
	else
		button:Point("TOP", relativeTo, "BOTTOM", 0, -1)
	end
	
	if lastbutton == true then
		button:Point("BOTTOM", RaidBuffReminder, "BOTTOM", 0, 2)
	end
	
	button.t = button:CreateTexture(name..".t", "OVERLAY")
	button.t:SetTexCoord(.08, .92, .08, .92)
	button.t:Point("TOPLEFT", 2, -2)
	button.t:Point("BOTTOMRIGHT", -2, 2)
	button:SetScript("OnMouseUp", microMenuGenerator)
	
	return button
end

--Create Buttons
do
CreateButton("Spell1Frame", RaidBuffReminder, true)
CreateButton("Spell2Frame", Spell1Frame, false)
CreateButton("Spell3Frame", Spell2Frame, false)
CreateButton("Spell4Frame", Spell3Frame, false)
CreateButton("Spell5Frame", Spell4Frame, false)
CreateButton("Spell6Frame", Spell5Frame, false, true)
end

-- Adding in ALL RAID BUFFS
local AllBuffs = {
	["10ap"] = {
		57330,						-- Horn of Winter
		19506,						-- Trueshot Aura
		6673,						-- Battle Shout
	},
	["10as"] = {
		55610,						-- Unholy Aura
		128432,						-- Cackling Howl (Hunterpet)
		128433,						-- Serpent's Swiftness (Hunterpet)
		113742,						-- Swiftblade's Cunning
		30809,						-- Unleashed Rage
	},
	["10sp"] = {
		1459,						-- Arcane Brilliance
		77747,						-- Burning Wrath
		109773,						-- Dark Intent
		61316,						-- Dalaran Brilliance
	},
	["5sh"] = {
		24907,						-- Moonkin Aura
		49868,						-- Mind Quickening
		51470,						-- Elemental Oath
	},
	["5csc"] = {
		17007,						-- Leader of the Pack
		90309,						-- Terrifying Roar (Hunterpet)
		24604,						-- Furious Howl (Hunterpet)
		1459,						-- Arcane Brilliance
		116781,						-- Legacy of the White Tiger
		61316,						-- Dalaran Brilliance
	},
	["3kmr"] = {
		93435,						-- Roar of Courage (Hunterpet)
		128997,						-- Spirit Beast Blessing
		19740,						-- Blessing of Might
		116956,						-- Grace of Air
	},
	["5sai"] = {
		1126,						-- Mark of the Wild
		90363,						-- Embrace of the Shale Spider (Hunterpet)
		115921,						-- Legacy of the Emperor
		20217,						-- Blessing of Kings
	},
	["10s"] = {
		90364,						-- Qiraji Fortitude
		21562,						-- Power Word: Fortitude
		469,						-- Commanding Shout
	},
}

local function LabelType(bufftype)
	if bufftype == "10ap" then
		return "+10% Attack Power"
	elseif bufftype == "10as" then
		return "+10% Melee & Ranged Attack Speed"
	elseif bufftype == "10sp" then
		return "+10% Spell Power"
	elseif bufftype == "5sh" then
		return "+5% Spell Haste"
	elseif bufftype == "5csc" then
		return "+5% Critical Strike Chance"
	elseif bufftype == "3kmr" then
		return "+3000 Mastery Rating"
	elseif bufftype == "5sai" then
		return "+5% Strength, Agility, Intellect"
	elseif bufftype == "10s" then
		return "+10% Stamina"
	else
		return "ERROR"
	end
end
-------------------------
-- Buff Check Functions
-------------------------
local function AnotherOnAuraChange(self, event, arg1, unit)
	for key, value in pairs(AllBuffs) do
		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."mini"..i].spell = v
			if UnitAura("player", spellname) then
				_G[key.."mini"..i]:SetAlpha(1)
			else
				_G[key.."mini"..i]:SetAlpha(0.2)
			end
		end

		for i, v in ipairs(value) do
			local spellname = select(1, GetSpellInfo(v))
			_G[key.."Frame"].spell = v
			if UnitAura("player", spellname) then
				_G[key.."Frame"]:SetAlpha(1)
				-- _G[key.."Frame"].t:SetDesaturated(nil)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
				break
			else
				_G[key.."Frame"]:SetAlpha(0.2)
				-- _G[key.."Frame"].t:SetDesaturated(1)
				_G[key.."Frame"].t:SetTexture(select(3, GetSpellInfo(v)))
			end
		end
	end
end

local bufftrackersummary = CreateFrame("Frame", "BuffTrackerSummary", UIParent)
bufftrackersummary:Size(500, 250)
bufftrackersummary:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
bufftrackersummary:SetTemplate("Transparent")
bufftrackersummary:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
bufftrackersummary:RegisterEvent("UNIT_INVENTORY_CHANGED")
bufftrackersummary:RegisterEvent("UNIT_AURA")
bufftrackersummary:RegisterEvent("PLAYER_REGEN_ENABLED")
bufftrackersummary:RegisterEvent("PLAYER_REGEN_DISABLED")
bufftrackersummary:RegisterEvent("PLAYER_ENTERING_WORLD")
bufftrackersummary:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
bufftrackersummary:RegisterEvent("CHARACTER_POINTS_CHANGED")
bufftrackersummary:RegisterEvent("ZONE_CHANGED_NEW_AREA")
bufftrackersummary:SetScript("OnEvent", AnotherOnAuraChange)

--DERP BLIZZ, cant make good spell id's
local str = "spell:%s"
local BadTotems = {
	[8076] = 8075,
	[8972] = 8071,
	[5677] = 5675,
}
local SetupTooltip = function(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 0, 0)
	
	if BadTotems[self.spell] then
		GameTooltip:SetHyperlink(format(str, BadTotems[self.spell]))
	else
		GameTooltip:SetHyperlink(format(str, self.spell))
	end
	
	GameTooltip:Show()
end

local function CreateBuffArea(bufftype, relativeTo, column)
	local bigButton = CreateFrame("Frame", bufftype.."Frame", BuffTrackerSummary)
	if column == 1 then
		bigButton:Size(40, 40)
		bigButton:SetPoint("TOPLEFT", BuffTrackerSummary, "TOPLEFT", 14, -14)
		bigButton:SetTemplate("Default")
	elseif column == 2 then
		bigButton:Size(40, 40)
		bigButton:SetPoint("TOPLEFT", BuffTrackerSummary, "TOPLEFT", 280, -14)
		bigButton:SetTemplate("Default")
	else
		bigButton:Size(40, 40)
		bigButton:SetPoint("TOPLEFT", relativeTo, "BOTTOMLEFT", 0, -16)
		bigButton:SetTemplate("Default")
	end
	bigButton.t = bigButton:CreateTexture(bufftype..".t", "OVERLAY")
	bigButton.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	bigButton.t:Point("TOPLEFT", 2, -2)
	bigButton.t:Point("BOTTOMRIGHT", -2, 2)
	
	local littlebutton = {}
	for i, v in pairs(AllBuffs[bufftype]) do
		littlebutton[i] = CreateFrame("Frame", bufftype.."mini"..i, bufftrackersummary)		
		if i == 1 then
			littlebutton[i]:Size(20, 20)
			littlebutton[i]:SetPoint("BOTTOMLEFT", bigButton, "BOTTOMRIGHT", 3, 0)
			littlebutton[i]:SetTemplate("Default")
		else
			littlebutton[i]:Size(20, 20)
			littlebutton[i]:SetPoint("LEFT", littlebutton[i-1], "RIGHT", 3, 0)
			littlebutton[i]:SetTemplate("Default")
		end
		littlebutton[i].t = littlebutton[i]:CreateTexture(nil, "OVERLAY")
		littlebutton[i].t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		littlebutton[i].t:Point("TOPLEFT", 2, -2)
		littlebutton[i].t:Point("BOTTOMRIGHT", -2, 2)
		littlebutton[i].t:SetTexture(select(3, GetSpellInfo(v)))
		
		littlebutton[i]:EnableMouse(true)
		littlebutton[i]:SetScript("OnEnter", SetupTooltip)
		littlebutton[i]:SetScript("OnLeave", GameTooltip_Hide)
	end
	
	bigButton.text = bigButton:CreateFontString(nil, "OVERLAY")
	bigButton.text:SetPoint("TOPLEFT", bigButton, "TOPRIGHT", 3, -1)
	bigButton.text:SetFont(C["media"].font, 13)
	bigButton.text:SetText(LabelType(bufftype))
	
	bigButton:EnableMouse(true)
	bigButton:SetScript("OnEnter", SetupTooltip)
	bigButton:SetScript("OnLeave", GameTooltip_Hide)
end

--ORDER MATTERS!
CreateBuffArea("10ap", nil, 1)
CreateBuffArea("10as", "10apFrame", nil)
CreateBuffArea("10sp", "10asFrame", nil)
CreateBuffArea("5sh", "10spFrame", nil)
CreateBuffArea("5csc", "5shFrame", 2)
CreateBuffArea("3kmr", "5cscFrame", nil)
CreateBuffArea("5sai", "3kmrFrame", nil)
CreateBuffArea("10s", "5saiFrame", nil)

bufftrackersummary:Hide()

local bufftracker_toggle = CreateFrame("Frame", "BuffTrackerToggle", raidbuff_reminder)
bufftracker_toggle:Size(raidbuff_reminder:GetWidth(), 9)
bufftracker_toggle:SetPoint("TOP", raidbuff_reminder, "BOTTOM", 0, -2)
bufftracker_toggle:SetTemplate("Default")
bufftracker_toggle.text = bufftracker_toggle:CreateFontString(nil, "OVERLAY")
bufftracker_toggle.text:SetPoint("CENTER")
bufftracker_toggle.text:SetFont(C["media"].font, C["datatext"].fontsize, "THINOUTLINE")
bufftracker_toggle.text:SetText("|cff319f1b+|r")
-- bufftracker_toggle:CreateShadow("Default")

local function ToggleBuffTracker()
	if bufftrackersummary:IsShown() then
		bufftrackersummary:Hide()
		bufftracker_toggle:ClearAllPoints()
		bufftracker_toggle:Point("TOP", raidbuff_reminder, "BOTTOM", 0, -2)
		bufftracker_toggle.text:SetText("|cff319f1b+|r")
	else
		bufftrackersummary:Show()
		bufftracker_toggle:ClearAllPoints()
		bufftracker_toggle:Point("TOP", raidbuff_reminder, "BOTTOM", 0, -2)
		bufftracker_toggle.text:SetText("|cff9a1212-|r")
		bufftracker_toggle:SetScript("OnEnter", nil)
		bufftracker_toggle:SetScript("OnLeave", nil)
	end
end
bufftracker_toggle:SetScript("OnMouseDown", ToggleBuffTracker)