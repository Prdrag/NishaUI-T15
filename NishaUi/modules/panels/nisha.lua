local T, C, L, G = unpack( Tukui )

local color = RAID_CLASS_COLORS[T.myclass]
local cStart = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)

-- main frame
local NishaUIMainFrame = CreateFrame("Frame", "NishaUIMainFrame", UIParent)
NishaUIMainFrame:SetSize(650, 350)
NishaUIMainFrame:SetPoint("CENTER")
NishaUIMainFrame:SetTemplate("Transparent")
NishaUIMainFrame:CreateShadow("Default")
NishaUIMainFrame:Hide()
NishaUIMainFrame:SetFrameLevel(10)
NishaUIMainFrame:SetFrameStrata("BACKGROUND")

local function Buttonshow(self)
	TukuiToggle1:FadeIn()
	TukuiToggle2:FadeIn()
	TukuiToggle3:FadeIn()
	TukuiToggle4:FadeIn()
	TukuiToggle5:FadeIn()
	TukuiToggle6:FadeIn()
	TukuiToggle1:SetBackdropBorderColor(color.r, color.g, color.b)
	TukuiToggle2:SetBackdropBorderColor(color.r, color.g, color.b)
	TukuiToggle3:SetBackdropBorderColor(color.r, color.g, color.b)
	TukuiToggle4:SetBackdropBorderColor(color.r, color.g, color.b)
	TukuiToggle5:SetBackdropBorderColor(color.r, color.g, color.b)
	TukuiToggle6:SetBackdropBorderColor(color.r, color.g, color.b)
end

local function Buttonhide(self)
	TukuiToggle1:FadeOut()
	TukuiToggle2:FadeOut()
	TukuiToggle3:FadeOut()
	TukuiToggle4:FadeOut()
	TukuiToggle5:FadeOut()	
	TukuiToggle6:FadeOut()	
	TukuiToggle1:SetTemplate("Default")
	TukuiToggle2:SetTemplate("Default")
	TukuiToggle3:SetTemplate("Default")
	TukuiToggle4:SetTemplate("Default")
	TukuiToggle5:SetTemplate("Default")
	TukuiToggle6:SetTemplate("Default")
end

local NishaUIMainFrameIconTopLeft = CreateFrame("Frame", "PulseTest", NishaUIMainFrame)
NishaUIMainFrameIconTopLeft:Size(44, 44)
NishaUIMainFrameIconTopLeft:SetTemplate("Default")
NishaUIMainFrameIconTopLeft:Point("BOTTOMRIGHT", NishaUIMainFrame, "TOPRIGHT", 0, 3)
NishaUIMainFrameIconTopLeft:SetFrameStrata("HIGH")
NishaUIMainFrameIconTopLeft:CreateShadow("Default")

NishaUIMainFrameIconTopLeft.Background = NishaUIMainFrameIconTopLeft:CreateTexture(nil, "ARTWORK")
NishaUIMainFrameIconTopLeft.Background:Point("TOPLEFT", 2, -2)
NishaUIMainFrameIconTopLeft.Background:Point("BOTTOMRIGHT", -2, 2)
NishaUIMainFrameIconTopLeft.Background:SetTexture(C["media"].pulse)

local NishaUIMainFrameIconTopRight = CreateFrame("Frame", "PulseTest", NishaUIMainFrame)
NishaUIMainFrameIconTopRight:Size(44, 44)
NishaUIMainFrameIconTopRight:SetTemplate("Default")
NishaUIMainFrameIconTopRight:Point("BOTTOMLEFT", NishaUIMainFrame, "TOPLEFT", 0, 3)
NishaUIMainFrameIconTopRight:SetFrameStrata("HIGH")
NishaUIMainFrameIconTopRight:CreateShadow("Default")

NishaUIMainFrameIconTopRight.Background = NishaUIMainFrameIconTopRight:CreateTexture(nil, "ARTWORK")
NishaUIMainFrameIconTopRight.Background:Point("TOPLEFT", 2, -2)
NishaUIMainFrameIconTopRight.Background:Point("BOTTOMRIGHT", -2, 2)
NishaUIMainFrameIconTopRight.Background:SetTexture(C["media"].pulse)

local NishaUIMainFrameTitle = CreateFrame("Frame", "TukuiInstallTitle", NishaUIMainFrame)
NishaUIMainFrameTitle:SetTemplate("Transparent")
NishaUIMainFrameTitle:Size(NishaUIMainFrame:GetWidth( ) - 92, 30)
NishaUIMainFrameTitle:Point("BOTTOM", NishaUIMainFrame, "TOP", 0, 3)
NishaUIMainFrameTitle:SetFrameStrata("HIGH")
NishaUIMainFrameTitle:CreateShadow("Default")

local NishaUIMainFrameTitleText = NishaUIMainFrameTitle:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameTitleText:SetFont(C.media.font, 20, "OUTLINE")
NishaUIMainFrameTitleText:SetPoint("CENTER", NishaUIMainFrameTitle, 0, 0)
NishaUIMainFrameTitleText:SetText("Nisha|cffc41f3bUI|r - Help")

-- main frame - navigation
local NishaUIMainFrameNavigation = CreateFrame("Frame", "NishaUIMainFrameNavigation", NishaUIMainFrame)
NishaUIMainFrameNavigation:SetSize(180, 342)
NishaUIMainFrameNavigation:SetPoint("LEFT", 4, 0)
NishaUIMainFrameNavigation:SetTemplate("Transparent")

-- main frame - content
local NishaUIMainFrameContent = CreateFrame("Frame", "NishaUIMainFrameContent", NishaUIMainFrame)
NishaUIMainFrameContent:SetSize(458, 342)
NishaUIMainFrameContent:SetPoint("RIGHT", -4, 0)
NishaUIMainFrameContent:SetTemplate("Transparent")

local NishaUIMainFrameContentScrollFrame = CreateFrame("ScrollFrame", "NishaUIMainFrameContentScrollFrame", NishaUIMainFrameContent, "UIPanelScrollFrameTemplate")
NishaUIMainFrameContentScrollFrame:SetPoint("TOPLEFT", NishaUIMainFrameContent, "TOPLEFT", 10, -10)
NishaUIMainFrameContentScrollFrame:SetPoint("BOTTOMRIGHT", NishaUIMainFrameContent, "BOTTOMRIGHT", -30, 10)
NishaUIMainFrameContentScrollFrameScrollBar:SkinScrollBar()

local NishaUIMainFrameContentScrollFrameBackground = CreateFrame("Frame", "NishaUIMainFrameContentScrollFrameBackground", NishaUIMainFrameContentScrollFrame)
NishaUIMainFrameContentScrollFrameBackground:SetPoint("TOPLEFT")
NishaUIMainFrameContentScrollFrameBackground:SetWidth(NishaUIMainFrameContentScrollFrame:GetWidth())
NishaUIMainFrameContentScrollFrameBackground:SetHeight(NishaUIMainFrameContentScrollFrame:GetHeight())
NishaUIMainFrameContentScrollFrame:SetScrollChild(NishaUIMainFrameContentScrollFrameBackground)
	
local NishaUIMainFrameContentTitle = NishaUIMainFrameContentScrollFrameBackground:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameContentTitle:SetFont(unpack(T.Fonts.cGeneral.setfont))
NishaUIMainFrameContentTitle:SetPoint("TOP", NishaUIMainFrameContentScrollFrameBackground, "TOP", 0, -10)

local NishaUIMainFrameContentText1 = NishaUIMainFrameContentScrollFrameBackground:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameContentText1:SetJustifyH("LEFT")
NishaUIMainFrameContentText1:SetFont(unpack(T.Fonts.cGeneral.setfont))
NishaUIMainFrameContentText1:SetWidth(NishaUIMainFrameContentScrollFrameBackground:GetWidth() - 20)
NishaUIMainFrameContentText1:SetPoint("TOPLEFT", NishaUIMainFrameContentScrollFrameBackground, "TOPLEFT", 20, -45)

local NishaUIMainFrameContentText2 = NishaUIMainFrameContentScrollFrameBackground:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameContentText2:SetJustifyH("LEFT")
NishaUIMainFrameContentText2:SetFont(unpack(T.Fonts.cGeneral.setfont))
NishaUIMainFrameContentText2:SetWidth(NishaUIMainFrameContentScrollFrameBackground:GetWidth() - 30)
NishaUIMainFrameContentText2:SetPoint("TOPLEFT", NishaUIMainFrameContentText1, "BOTTOMLEFT", 0, -20)

local NishaUIMainFrameContentText3 = NishaUIMainFrameContentScrollFrameBackground:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameContentText3:SetJustifyH("LEFT")
NishaUIMainFrameContentText3:SetFont(unpack(T.Fonts.cGeneral.setfont))
NishaUIMainFrameContentText3:SetWidth(NishaUIMainFrameContentScrollFrameBackground:GetWidth() - 30)
NishaUIMainFrameContentText3:SetPoint("TOPLEFT", NishaUIMainFrameContentText2, "BOTTOMLEFT", 0, -20)

local NishaUIMainFrameContentText4 = NishaUIMainFrameContentScrollFrameBackground:CreateFontString(nil, "OVERLAY")
NishaUIMainFrameContentText4:SetJustifyH("LEFT")
NishaUIMainFrameContentText4:SetFont(unpack(T.Fonts.cGeneral.setfont))
NishaUIMainFrameContentText4:SetWidth(NishaUIMainFrameContentScrollFrameBackground:GetWidth() - 30)
NishaUIMainFrameContentText4:SetPoint("TOPLEFT", NishaUIMainFrameContentText3, "BOTTOMLEFT", 0, -20)

-- main frame - navigation - buttons
local NishaUIMainFrameNavigationButtonAttributes = {
	[1] = {"/nhelp 1"},
	[2] = {"/nhelp 2"},
	[3] = {"/nhelp 3"},
	[4] = {"/nhelp 4"},
	[5] = {"/nhelp 5"},
	[6] = {"/nhelp 6"},
	[7] = {"/nhelp 7"},
}

local NishaUIMainFrameNavigationButtonTexts = {
	[1] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Slashcommands"},
	[2] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Unitframes"},
	[3] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Chat"},
	[4] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Skins"},
	[5] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Actionbars"},
	[6] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Bug Reports & Suggestions"},
	[7] = {T.RGBToHex(unpack(C["media"].datatextcolor2)).."Credits"},
}

local NishaUIMainFrameNavigationButton = CreateFrame("Button", "NishaUIMainFrameNavigationButton", NishaUIMainFrameNavigation)
for i = 1, 7 do
	NishaUIMainFrameNavigationButton[i] = CreateFrame("Button", "NishaUIMainFrameNavigationButton" .. i, NishaUIMainFrameNavigation, "SecureActionButtonTemplate")
	NishaUIMainFrameNavigationButton[i]:SetTemplate("Default")
	NishaUIMainFrameNavigationButton[i]:Size(NishaUIMainFrameNavigation:GetWidth() - 8, 24)
	NishaUIMainFrameNavigationButton[i]:Point("TOP", NishaUIMainFrameNavigation, "TOP", 0, -4, true)
	NishaUIMainFrameNavigationButton[i].Text = T.SetFontString(NishaUIMainFrameNavigationButton[i], unpack(T.Fonts.cGeneral.setfont))
	NishaUIMainFrameNavigationButton[i]:SetFrameLevel(NishaUIMainFrameNavigation:GetFrameLevel() + 1)
	NishaUIMainFrameNavigationButton[i].Text:Point("CENTER", NishaUIMainFrameNavigationButton[i], "CENTER", 0, 1)
	NishaUIMainFrameNavigationButton[i].Text:SetText(unpack( NishaUIMainFrameNavigationButtonTexts[i]))

	if i == 1 then
		NishaUIMainFrameNavigationButton[i]:Point("TOP", NishaUIMainFrameNavigation, "TOP", 0, -5)
	else
		NishaUIMainFrameNavigationButton[i]:Point("TOP", NishaUIMainFrameNavigationButton[i - 1], "BOTTOM", 0, -3)
	end
	NishaUIMainFrameNavigationButton[i]:SetAttribute("type", "macro")
	NishaUIMainFrameNavigationButton[i]:SetAttribute("macrotext", unpack( NishaUIMainFrameNavigationButtonAttributes[i]))
	NishaUIMainFrameNavigationButton[i]:CreateOverlay(NishaUIMainFrameNavigationButton[i])
	NishaUIMainFrameNavigationButton[i]:HookScript("OnEnter", T.SetModifiedBackdrop)
	NishaUIMainFrameNavigationButton[i]:HookScript("OnLeave", T.SetOriginalBackdrop)
end

---------------------------------------------------------------------------------------------
-- functions
---------------------------------------------------------------------------------------------
local nhelpcontentclose = CreateFrame("Button", "NishaUIMainFrameContentCloseButton", NishaUIMainFrameContentScrollFrameBackground, "UIPanelCloseButton")
nhelpcontentclose:SetPoint("TOPRIGHT", NishaUIMainFrameContentScrollFrameBackground, "TOPRIGHT")
nhelpcontentclose:SkinCloseButton()
nhelpcontentclose:SetScript("OnClick", function()
	NishaUIMainFrame:Hide()
	Buttonhide()
end )

local nhelpcontent = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent_text3)
	NishaUIMainFrameContentText3:SetText(L.helpcontent_text4)
	NishaUIMainFrameContentText4:SetText("Nisha")
end

local nhelp7content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent7_text1)
	NishaUIMainFrameContentText1:SetText("")
	NishaUIMainFrameContentText2:SetText(L.helpcontent7_text2)
	NishaUIMainFrameContentText3:SetText(L.helpcontent7_text3)
	NishaUIMainFrameContentText4:SetText(L.helpcontent7_text4)
end

local nhelp6content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent6_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent6_text2)
	NishaUIMainFrameContentText2:SetText("")
	NishaUIMainFrameContentText3:SetText(L.helpcontent6_text3)
	NishaUIMainFrameContentText4:SetText(L.helpcontent6_text4)
end

local nhelp5content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent5_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent5_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent5_text3)
	NishaUIMainFrameContentText3:SetText(L.helpcontent5_text4)
	NishaUIMainFrameContentText4:SetText(L.helpcontent5_text5)
end

local nhelp4content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent4_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent4_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent4_text3)
	NishaUIMainFrameContentText3:SetText("")
	NishaUIMainFrameContentText4:SetText("")
end

local nhelp3content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent3_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent3_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent3_text3)
	NishaUIMainFrameContentText3:SetText(L.helpcontent3_text4)
	NishaUIMainFrameContentText4:SetText(L.helpcontent3_text5)
end

local nhelp2content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent2_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent2_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent2_text3)
	NishaUIMainFrameContentText3:SetText("")
	NishaUIMainFrameContentText4:SetText(L.helpcontent2_text4)
end

local nhelp1content = function()
	NishaUIMainFrameContentTitle:SetText(L.helpcontent1_text1)
	NishaUIMainFrameContentText1:SetText(L.helpcontent1_text2)
	NishaUIMainFrameContentText2:SetText(L.helpcontent1_text3)
	NishaUIMainFrameContentText3:SetText(L.helpcontent1_text4)
	NishaUIMainFrameContentText4:SetText(L.helpcontent1_text5)
end

-- slash command
local nhelp = NishaUIHelp or function() end
NishaUIHelp = function(msg)
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end

	if msg == "1" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp1content()
		Buttonhide()
	elseif msg == "2" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp2content()
		Buttonhide()
	elseif msg == "3" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp3content()
		Buttonhide()
	elseif msg == "4" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp4content()
		Buttonhide()
	elseif msg == "5" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp5content()
		Buttonshow()
	elseif msg == "6" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp6content()
		Buttonhide()
	elseif msg == "7" then
		if not NishaUIMainFrame:IsVisible() then return end
		nhelp7content()
		Buttonhide()
	else
		if NishaUIMainFrame:IsVisible() then
			NishaUIMainFrame:Hide()
		else
			NishaUIMainFrame:Show()
			nhelpcontent()
		end
	end
end

SlashCmdList.NishaUIHelp = NishaUIHelp
SLASH_NishaUIHelp1 = "/nhelp"

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

local pulse = CreateFrame("Frame", "pulse", UIParent)
-------------------------------------------------------
-- ToolTip
-------------------------------------------------------
local function AMEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_addon, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_addon2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function AMLeave(self)
  GameTooltip:Hide()
end

local function MoveEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_move, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_move2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function MoveLeave(self)
  GameTooltip:Hide()
end

local function ConfigEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_config, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_config2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function ConfigLeave(self)
  GameTooltip:Hide()
end

local function hbEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_bind, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_bind2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function hbLeave(self)
  GameTooltip:Hide()
end

local function RLEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_reload, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_reload2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function RLLeave(self)
  GameTooltip:Hide()
end
local function helpEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_help, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_help2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
  GameTooltip:Show()
end

local function helpLeave(self)
  GameTooltip:Hide()
end

local function abEnter(self)
  GameTooltip:SetOwner(TukuiTooltipAnchor, "ANCHOR_NONE", T.Scale(5), T.Scale(5))
  GameTooltip:SetText(cStart..L.nisha_ab, 1, 1, 1)  -- This sets the top line of text, in gold.
  GameTooltip:AddLine(L.nisha_ab2, 1, 1, 1)
  GameTooltip:AddTexture(C.media.pulse)
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

local pulse = CreateFrame("Button", "pulse", TukuiMinimap, "SecureActionButtonTemplate")
pulse:Height(25)
pulse:Width(25)
pulse:SetFrameLevel(10)
pulse:SetTemplate("Default")
pulse:Point("TOPRIGHT", TukuiMinimap, "BOTTOMLEFT", 27, 27 )
pulse:EnableMouse(true)
pulse:HookScript("OnEnter", ModifiedBackdrop)
pulse:HookScript("OnLeave", OriginalBackdrop)
pulse:SetScript("OnClick", function()
if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	if main:IsVisible() then
		main:SlideOut()
	else
		main:SlideIn()
	end
end)


local pulse_tex = pulse:CreateTexture(nil, "OVERLAY")
pulse_tex:SetTexture(C.media.pulse)
pulse_tex:SetPoint("TOPLEFT", pulse, "TOPLEFT", 1, -1)
pulse_tex:SetPoint("BOTTOMRIGHT", pulse, "BOTTOMRIGHT", -2, 2)

local logo = CreateFrame("StatusBar", "Logo", UIParent, "SecureActionButtonTemplate")
logo:SetTemplate("Default")
logo:Size(30, 30)
logo:Point("TOP", main, "TOP", 0, -4)
logo:SetFrameStrata("HIGH")
logo:SetParent(main)

local logo_tex = logo:CreateTexture(nil, "OVERLAY")
logo_tex:SetTexture(C.media.pulse)
logo_tex:SetPoint("TOPLEFT", logo, "TOPLEFT", 2, -2)
logo_tex:SetPoint("BOTTOMRIGHT", logo, "BOTTOMRIGHT", -2, 2)

for i = 1, 7 do
	pulse[i] = CreateFrame("Button", "pulse"..i, main, "SecureActionButtonTemplate")
	pulse[i]:Height((main:GetHeight()/8)-5)
	pulse[i]:Width(main:GetWidth()-8)
	pulse[i]:SetTemplate("Default")
	pulse[i]:EnableMouse(true)
	pulse[i].Text = pulse[i]:CreateFontString(nil, "OVERLAY")
	pulse[i].Text:SetFont(unpack(T.Fonts.movers.setfont))
	pulse[i].Text:Point("CENTER", 1, 1)
	if i == 1 then
		pulse[i]:Point("TOP", logo, "BOTTOM", 0, -10)
		pulse[i]:SetScript("OnEnter", AMEnter)
		pulse[i]:SetScript("OnLeave", AMLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_addon3)
		pulse[i]:SetScript("OnMouseDown", function()
		 if addonBG:IsShown() then
			addonBG:Hide()
		 else
			addonBG:Show()
		 end
		end)
	elseif i == 2 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/moveui")
		pulse[i]:Point("TOPRIGHT", pulse1, "BOTTOMRIGHT", 0, -3)
		pulse[i]:SetScript("OnEnter", MoveEnter)
		pulse[i]:SetScript("OnLeave", MoveLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_move3)
	elseif i == 3 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/kb")
		pulse[i]:Point("TOPRIGHT", pulse2, "BOTTOMRIGHT", 0, -3)
		pulse[i]:SetScript("OnEnter", hbEnter)
		pulse[i]:SetScript("OnLeave", hbLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_bind3)
	elseif i == 4 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/tc")
		pulse[i]:Point("TOPRIGHT", pulse3, "BOTTOMRIGHT", 0, -3)
		pulse[i]:SetScript("OnEnter", ConfigEnter)
		pulse[i]:SetScript("OnLeave", ConfigLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_config3 )
	elseif i == 5 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/rl")
		pulse[i]:Point("TOPRIGHT", pulse4, "BOTTOMRIGHT", 0, -3)
		pulse[i]:SetScript("OnEnter", RLEnter)
		pulse[i]:SetScript("OnLeave", RLLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_reload3)		
	elseif i == 6 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/nhelp")
		pulse[i]:Point("TOPRIGHT", pulse5, "BOTTOMRIGHT", 0, -3)
		pulse[i]:SetScript("OnEnter", helpEnter)
		pulse[i]:SetScript("OnLeave", helpLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart..L.nisha_help3)		
	elseif i == 7 then
		pulse[i]:SetAttribute("type", "macro")
		pulse[i]:SetAttribute("macrotext", "/debuffs")
		pulse[i]:Point("TOPRIGHT", pulse6, "BOTTOMRIGHT", 0, -3)
		-- pulse[i]:SetScript("OnEnter", helpEnter)
		-- pulse[i]:SetScript("OnLeave", helpLeave)
		pulse[i]:HookScript("OnEnter", ModifiedBackdrop)
		pulse[i]:HookScript("OnLeave", OriginalBackdrop)
		pulse[i].Text:SetText(cStart.."Raid Debuffs")
	end
end

