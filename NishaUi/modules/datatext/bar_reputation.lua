local T, C, L, G = unpack(Tukui) 
if not C["datatext"].exprepbars == true then return end
if T.level == MAX_PLAYER_LEVEL then
	TukuiPlayer_Reputation:Kill()
end
local dtext = C["datatext"].expreptext

if not dtext then
	height = 10
else
	height = 20
end

local rep = CreateFrame("Frame", "TukuiReputation", UIParent)
if T.level ~= MAX_PLAYER_LEVEL then
	rep:SetTemplate("Default")
	rep:CreateShadow("Default")
	rep:Size(TukuiBar1:GetWidth(), height)
	rep:Point("BOTTOM", UIParent, "BOTTOM", 0, 3)
else
	if C["datatext"].exprepbars then
		rep:SetTemplate("Default")
		rep:CreateShadow("Default")
		rep:Size(TukuiBar1:GetWidth(), height)
		rep:Point("BOTTOM", UIParent, "BOTTOM", 0, 3)
	else
		rep:SetTemplate("Default")
		rep:CreateShadow("Default")
		rep:Size(TukuiBar1:GetWidth(), height)
		rep:Point("BOTTOM", UIParent, "BOTTOM", 0, 3)
	end
end
rep:EnableMouse(true)

local bar = CreateFrame("StatusBar", "TukuiReputationBar", rep)
bar:SetPoint("TOPLEFT", rep, 2, -2)
bar:SetPoint("BOTTOMRIGHT", rep, -2, 2)
bar:SetStatusBarTexture(C["media"].normTex)
rep.bar = bar

local text = bar:CreateFontString(nil, "LOW")
text:SetFont(unpack(T.Fonts.dFont.setfont))
text:Point("CENTER", rep, 0, 1)
rep.text = text

local factioncolors = {
	{ r = .9, g = .3, b = .3 }, -- Hated
	{ r = .7, g = .3, b = .3 }, -- Hostile
	{ r = .7, g = .3, b = .3 }, -- Unfriendly
	{ r = .8, g = .7, b = .4 }, -- Neutral
	{ r = .3, g = .7, b = .3 }, -- Friendly
	{ r = .3, g = .7, b = .3 }, -- Honored
	{ r = .3, g = .7, b = .3 }, -- Revered
	{ r = .3, g = .9, b = .3 }, -- Exalted
}

local function event(self, event, ...)
	local _, id, min, max, value = GetWatchedFactionInfo()
	local colors = factioncolors[id]
	
	bar:SetMinMaxValues(min, max)
	bar:SetValue(value)
	
	if id > 0 then
    if dtext then
		  text:SetText((value - min) .. " / " .. (max - min))
    else
		  text:SetText(" ")
    end
		bar:SetStatusBarColor(colors.r, colors.g, colors.b)
		
		rep:Show()
	else
		rep:Hide()
	end
end

rep:HookScript("OnEnter", function()
	local name, id, min, max, value = GetWatchedFactionInfo()
	local colors = factioncolors[id]
	
	local perMax = max - min
	local perGValue = value - min
	local perNValue = max - value
	
	local perGain = format("%.1f%%", (perGValue / perMax) * 100)
	local perNeed = format("%.1f%%", (perNValue / perMax) * 100)

	GameTooltip:SetOwner(rep, "ANCHOR_BOTTOM", -T.buttonspacing, -(rep:GetHeight() - height + T.buttonspacing))
	GameTooltip:ClearLines()
	GameTooltip:AddLine("Reputation:|r")
	GameTooltip:AddLine" "
	GameTooltip:AddDoubleLine("Faction: |r", name, 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine("Standing: |r", _G['FACTION_STANDING_LABEL'..id], 1, 1, 1, colors.r, colors.g, colors.b)
	GameTooltip:AddDoubleLine("Gained: |r", value - min .. " (" .. perGain .. ")", 1, 1, 1, 1, 1, 1)
	GameTooltip:AddDoubleLine("Needed: |r", max - value .. " (" .. perNeed .. ")", 1, 1, 1, .8, .2, .2)
	GameTooltip:AddDoubleLine("Total: |r", max - min, 1, 1, 1, 1, 1, 1)
	
	GameTooltip:Show()
end)
rep:HookScript("OnLeave", function() GameTooltip:Hide() end)

rep:RegisterEvent("UPDATE_FACTION")
rep:RegisterEvent("PLAYER_ENTERING_WORLD")
rep:HookScript("OnEvent", event)
