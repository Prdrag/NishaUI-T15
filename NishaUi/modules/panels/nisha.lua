local T, C, L, G = unpack( Tukui )

local color = RAID_CLASS_COLORS[T.myclass]

-------------------------------------------------------
-- locals
-------------------------------------------------------
local function ModifiedBackdrop(self)
	local color = RAID_CLASS_COLORS[T.myclass]
	self:SetBackdropColor(color.r*.15, color.g*.15, color.b*.15)
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end
local function OriginalBackdrop(self)
	self:SetTemplate("Default")
end

local Downfall = CreateFrame("Frame", "Downfall", UIParent)
-------------------------------------------------------
-- ToolTip
-------------------------------------------------------
local function AMEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_addon, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_addon2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function AMLeave(self)
  GameTooltip:Hide()
end

local function MoveEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_move, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_move2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function MoveLeave(self)
  GameTooltip:Hide()
end

local function ConfigEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_config, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_config2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function ConfigLeave(self)
  GameTooltip:Hide()
end

local function hbEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_bind, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_bind2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function hbLeave(self)
  GameTooltip:Hide()
end

local function RLEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_reload, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_reload2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function RLLeave(self)
  GameTooltip:Hide()
end
local function helpEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_help, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_help2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function helpLeave(self)
  GameTooltip:Hide()
end

local function abEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(T.cStart..L.nisha_ab, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_ab2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.downfall)
  GameTooltip:Show()
end

local function abLeave(self)
  GameTooltip:Hide()
end
-------------------------------------------------------
-- Panels & Buttons
------------------------------------------------------
local main = CreateFrame("StatusBar", "TukuiMainButton", UIParent, "SecureActionButtonTemplate")
main:SetTemplate("Default")
main:Size(85 ,235)
main:Point("RIGHT", UiParent, "RIGHT", -3, 0)
main:SetFrameLevel(10)
main:CreateShadow()
main:Animate(200, 0, 1)
main:Hide()

local Downfall = CreateFrame("Button", "Downfall", TukuiMinimap, "SecureActionButtonTemplate")
Downfall:Height(25)
Downfall:Width(25)
Downfall:SetFrameLevel(4)
Downfall:SetTemplate("Default")
Downfall:Point("TOPRIGHT", TukuiMinimap, "BOTTOMLEFT", 27, 27 )
Downfall:EnableMouse(true)
Downfall:HookScript("OnEnter", ModifiedBackdrop)
Downfall:HookScript("OnLeave", OriginalBackdrop)
Downfall:SetScript("OnClick", function()
if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	if main:IsVisible() then
		main:SlideOut()
	else
		main:SlideIn()
	end
end)


local Downfall_tex = Downfall:CreateTexture(nil, "OVERLAY")
Downfall_tex:SetTexture(C.media.downfall)
Downfall_tex:SetPoint("TOPLEFT", Downfall, "TOPLEFT", 1, -1)
Downfall_tex:SetPoint("BOTTOMRIGHT", Downfall, "BOTTOMRIGHT", -2, 2)

local logo = CreateFrame("StatusBar", "Logo", UIParent, "SecureActionButtonTemplate")
logo:SetTemplate("Default")
logo:Size(30, 30)
logo:Point("TOP", main, "TOP", 0, -4)
logo:SetFrameStrata("HIGH")
logo:SetParent(main)

local logo_tex = logo:CreateTexture(nil, "OVERLAY")
logo_tex:SetTexture(C.media.downfall)
logo_tex:SetPoint("TOPLEFT", logo, "TOPLEFT", 2, -2)
logo_tex:SetPoint("BOTTOMRIGHT", logo, "BOTTOMRIGHT", -2, 2)

for i = 1, 8 do
	Downfall[i] = CreateFrame("Button", "Downfall"..i, main, "SecureActionButtonTemplate")
	Downfall[i]:Height((main:GetHeight()/8)-5)
	Downfall[i]:Width(main:GetWidth()-8)
	Downfall[i]:SetTemplate("Default")
	Downfall[i]:EnableMouse(true)
	Downfall[i].Text = Downfall[i]:CreateFontString(nil, "OVERLAY")
	Downfall[i].Text:SetFont(unpack(T.Fonts.movers.setfont))
	Downfall[i].Text:Point("CENTER", 1, 1)
	if i == 1 then
		Downfall[i]:Point("TOP", logo, "BOTTOM", 0, -10)
		Downfall[i]:SetScript("OnEnter", AMEnter)
		Downfall[i]:SetScript("OnLeave", AMLeave)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart..L.nisha_addon3)
		Downfall[i]:SetScript("OnMouseDown", function()
		 if addonBG:IsShown() then
			addonBG:Hide()
		 else
			addonBG:Show()
		 end
		end)
	elseif i == 2 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/moveui")
		Downfall[i]:Point("TOPRIGHT", Downfall1, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:SetScript("OnEnter", MoveEnter)
		Downfall[i]:SetScript("OnLeave", MoveLeave)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart..L.nisha_move3)
	elseif i == 3 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/kb")
		Downfall[i]:Point("TOPRIGHT", Downfall2, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:SetScript("OnEnter", hbEnter)
		Downfall[i]:SetScript("OnLeave", hbLeave)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart..L.nisha_bind3)
	elseif i == 4 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/tc")
		Downfall[i]:Point("TOPRIGHT", Downfall3, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:SetScript("OnEnter", ConfigEnter)
		Downfall[i]:SetScript("OnLeave", ConfigLeave)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart..L.nisha_config3 )
	elseif i == 5 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/rl")
		Downfall[i]:Point("TOPRIGHT", Downfall4, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:SetScript("OnEnter", RLEnter)
		Downfall[i]:SetScript("OnLeave", RLLeave)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart..L.nisha_reload3)		
	elseif i == 6 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/debuffs")
		Downfall[i]:Point("TOPRIGHT", Downfall5, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart.."Raid Debuffs")
	elseif i == 7 then
		Downfall[i]:SetAttribute("type", "macro")
		Downfall[i]:SetAttribute("macrotext", "/abconfig")
		Downfall[i]:Point("TOPRIGHT", Downfall6, "BOTTOMRIGHT", 0, -3)
		Downfall[i]:HookScript("OnEnter", ModifiedBackdrop)
		Downfall[i]:HookScript("OnLeave", OriginalBackdrop)
		Downfall[i].Text:SetText(T.cStart.."Actionbars")
	end
end

