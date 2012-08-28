local T, C, L, G = unpack(Tukui)
if C.nisha.markbar ~= true then return end
----------------------------------------------------------------------------------------
--	Mark Bar(by Smelly)
----------------------------------------------------------------------------------------
local button_size = 20

local markbarbutton = CreateFrame("Button", "markbarbutton", UiParent)
markbarbutton:Height(16)
markbarbutton:Width(16)
markbarbutton:SetTemplate("Default")
markbarbutton:Point("BOTTOMRIGHT", G.Panels.DataTextRight, "BOTTOMLEFT", 17, 20 )
markbarbutton:EnableMouse(true)
markbarbutton:SetAlpha(0)
markbarbutton:SetScript("OnEnter", function()
	markbarbutton:FadeIn()
end)

markbarbutton:SetScript("OnLeave", function()
	markbarbutton:FadeOut()
end)

local markbarbutton_tex = markbarbutton:CreateTexture(nil, "OVERLAY")
markbarbutton_tex:SetTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
markbarbutton_tex:SetPoint("TOPLEFT", markbarbutton, "TOPLEFT", 1, -1)
markbarbutton_tex:SetPoint("BOTTOMRIGHT", markbarbutton, "BOTTOMRIGHT", -2, 2)

local MarkBarBG = CreateFrame("Frame", "MarkBarAnchor", PetBattleHider)
MarkBarBG:SetTemplate("Transparent")
MarkBarBG:Size((button_size * 5) + 15, (button_size * 2) + 6)
MarkBarBG:Point("BOTTOMRIGHT", G.Panels.RightChatBackground, "BOTTOMLEFT", -13, 0 )
MarkBarBG:SetFrameLevel(0)
MarkBarBG:Animate(0, -200, 0.5)
MarkBarBG:Hide()

local icon = {}
local mark = {}
for i = 0, 8 do
	mark[i] = CreateFrame("Button", "mark"..i, MarkBarBG)
	mark[i]:SetTemplate("Transparent")
	mark[i]:Size(button_size-1, button_size-1)
	if i == 1 then
		mark[i]:SetPoint("TOPLEFT", MarkBarBG, "TOPLEFT", 3, -3)
	elseif i == 5 then
		mark[i]:SetPoint("TOP", mark[1], "BOTTOM", 0, -3)
	else
		mark[i]:SetPoint("LEFT", mark[i-1], "RIGHT", 3, 0)
	end
	mark[0]:SetPoint("TOPLEFT", mark[4], "TOPRIGHT", 3, 0)
	mark[0]:Size(button_size, (button_size*2))
	mark[i]:EnableMouse(true)
	mark[i]:SetScript("OnEnter", T.SetModifiedBackdrop)
	mark[i]:SetScript("OnLeave", T.SetOriginalBackdrop)
	mark[i]:SetScript("OnMouseUp", function() SetRaidTarget("target", i) end)

	icon[i] = CreateFrame("Button", "icon"..i, MarkBarBG)
	if i == 0 then
		icon[i]:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
	else
		icon[i]:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	end
	icon[i]:Size(button_size - 5, button_size - 5)
	icon[i]:Point("CENTER", mark[i])

	-- Set up each button
	if i == 1 then
		icon[i]:GetNormalTexture():SetTexCoord(0, 0.25, 0, 0.25)
	elseif i == 2 then
		icon[i]:GetNormalTexture():SetTexCoord(0.25, 0.5, 0, 0.25)
	elseif i == 3 then
		icon[i]:GetNormalTexture():SetTexCoord(0.5, 0.75, 0, 0.25)
	elseif i == 4 then
		icon[i]:GetNormalTexture():SetTexCoord(0.75, 1, 0, 0.25)
	elseif i == 5 then
		icon[i]:GetNormalTexture():SetTexCoord(0, 0.25, 0.25, 0.5)
	elseif i == 6 then
		icon[i]:GetNormalTexture():SetTexCoord(0.25, 0.5, 0.25, 0.5)
	elseif i == 7 then
		icon[i]:GetNormalTexture():SetTexCoord(0.5, 0.75, 0.25, 0.5)
	elseif i == 8 then
		icon[i]:GetNormalTexture():SetTexCoord(0.75, 1, 0.25, 0.5)
	end
end

markbarbutton:SetScript("OnClick", function()
	if MarkBarBG:IsVisible() then
		MarkBarBG:SlideOut()
	else
		MarkBarBG:SlideIn()
	end
end)