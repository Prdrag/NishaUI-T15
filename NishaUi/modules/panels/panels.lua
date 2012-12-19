local T, C, L, G = unpack( Tukui )

------------------------------
-- actionbars
------------------------------
local mover = CreateFrame("Frame", "TukuiBar1Mover", UIParent)
mover:SetTemplate("Default")
mover:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) + 2, ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ) + 2)
mover:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 48)
mover:SetMovable(true)
mover:SetClampedToScreen(true)
mover:SetFrameLevel(10)
mover:SetBackdropBorderColor(1,0,0)
mover.text = T.SetFontString(mover, unpack(T.Fonts.movers.setfont))
mover.text:SetPoint("CENTER")
mover.text:SetText("Move Actionbar")
mover:Hide()
tinsert(T.AllowFrameMoving, mover)

G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint("BOTTOMLEFT", mover, 0, 0)
G.ActionBars.Bar1:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) + 2, ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ) + 2)
G.ActionBars.Bar1:CreateShadow("Default")
G.ActionBars.Bar1:SetTemplate("Transparent")

G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetAllPoints( G.ActionBars.Bar1 )
if T.lowversion then
	TukuiBar2:SetAlpha(1)
end

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetAllPoints( G.ActionBars.Bar1 )

local TukuiSplitBarLeft = CreateFrame( "Frame", "TukuiSplitBarLeft", UIParent, "SecureHandlerStateTemplate" )
TukuiSplitBarLeft:SetTemplate("Default")
TukuiSplitBarLeft:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight())
TukuiSplitBarLeft:Point("BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0)
TukuiSplitBarLeft:CreateShadow( "Default" )
TukuiSplitBarLeft:SetFrameStrata("BACKGROUND")

local TukuiSplitBarRight = CreateFrame( "Frame", "TukuiSplitBarRight", UIParent, "SecureHandlerStateTemplate" )
TukuiSplitBarRight:SetTemplate("Default")
TukuiSplitBarRight:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight())
TukuiSplitBarRight:Point("BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0)
TukuiSplitBarRight:CreateShadow( "Default" )
TukuiSplitBarRight:SetFrameStrata("BACKGROUND")

local TukuiRightBar = CreateFrame( "Frame", "TukuiRightBar", UIParent, "SecureHandlerStateTemplate" )
TukuiRightBar:SetTemplate("Default")
if not C["actionbar"].vertical_rightbars then
	TukuiRightBar:Size(( T.buttonsize * 12 + T.buttonspacing * 13 ) + 2,  ( T.buttonsize*3 + T.buttonspacing * 13 ) + 2)
	TukuiRightBar:Point("BOTTOMRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", 0, 3)
else
	TukuiRightBar:Size(( T.buttonsize*3 + T.buttonspacing * 4 ) + 2, ( T.buttonsize * 12 + T.buttonspacing * 13 ) + 2)
	TukuiRightBar:Point("RIGHT", UIParent, "RIGHT", -8, 0)
end

TukuiRightBar:CreateShadow( "Default" )
TukuiRightBar:SetFrameStrata("BACKGROUND")
if not C["chat"].background then
	TukuiRightBar:ClearAllPoints()
	TukuiRightBar:Point("RIGHT", UIParent, "RIGHT", -8, 0)
	if not C["actionbar"].vertical_rightbars then
		C["actionbar"].vertical_rightbars = true
	end
end

if C.nisha.naga == true then
	local nagaFrameanchor = CreateFrame("Frame","NagaFrameanchor",UIParent, "SecureHandlerStateTemplate")
	nagaFrameanchor:SetTemplate("Default")
	nagaFrameanchor:Size((T.buttonsize * 3) + (T.buttonspacing * 4), 20)
	nagaFrameanchor:Point("CENTER", UIParent, "CENTER", 0, 0)
	nagaFrameanchor:SetMovable(true)
	nagaFrameanchor:SetFrameLevel(10)
	nagaFrameanchor:SetBackdropBorderColor(1,0,0)
	nagaFrameanchor.text = T.SetFontString(nagaFrameanchor, unpack(T.Fonts.movers.setfont))
	nagaFrameanchor.text:SetPoint("CENTER")
	nagaFrameanchor.text:SetText("Move Naga")
	nagaFrameanchor:Hide()
	tinsert(T.AllowFrameMoving, nagaFrameanchor )

	local nagaFrame = CreateFrame("Frame", "NagaBar", UIParent)
	nagaFrame:SetPoint("TOP", nagaFrameanchor, "BOTTOM", 0, -3)
	nagaFrame:SetTemplate("Default")
	nagaFrame:SetWidth((T.buttonsize * 3) + (T.buttonspacing * 4))
	nagaFrame:SetHeight((T.buttonsize * 4) + (T.buttonspacing * 5))
end

G.ActionBars.Pet:ClearAllPoints()
if( C["actionbar"].vertical_rightbars == true ) then
	G.ActionBars.Pet:Width( ( T.petbuttonsize + T.buttonspacing * 2 ) + 2 )
	G.ActionBars.Pet:Height( ( T.petbuttonsize * NUM_PET_ACTION_SLOTS + T.buttonspacing * 11 ) + 2 )
else
	G.ActionBars.Pet:Width( ( T.petbuttonsize * NUM_PET_ACTION_SLOTS + T.buttonspacing * 11 ) + 2 )
	G.ActionBars.Pet:Height( ( T.petbuttonsize + T.buttonspacing * 2 ) + 2 )
end
G.ActionBars.Pet:SetPoint( "BOTTOM", TukuiRightBar, "TOP", 0, 3 )
G.ActionBars.Pet:CreateShadow( "Default" )
G.ActionBars.Pet:SetTemplate( "Default" )

------------------------------
-- chat
------------------------------
if( C["chat"].background == true ) then
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"].width, C["chat"].height)
G.Panels.LeftChatBackground:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
G.Panels.LeftChatBackground:CreateShadow("Default")
G.Panels.LeftChatBackground:SetTemplate("Transparent")

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"].width, C["chat"].height)
G.Panels.RightChatBackground:SetPoint( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )


G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:SetPoint( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:CreateOverlay( G.Panels.LeftChatTabsBackground )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:SetPoint( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:CreateOverlay( G.Panels.RightChatTabsBackground )

if C.nisha.chatbg == true then
	if not TukuiChatBackgroundLeft.bg then
	TukuiChatBackgroundLeft.bg = TukuiChatBackgroundLeft:CreateTexture(nil, 'LOW')
	-- TukuiChatBackgroundLeft.bg:SetTemplate("Transperant")
	TukuiChatBackgroundLeft.bg:SetInside()
end
	if (select(2, UnitClass("player")) == "DEATHKNIGHT") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\dk.tga") end
	if (select(2, UnitClass("player")) == "DRUID") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\druid.tga") end
	if (select(2, UnitClass("player")) == "HUNTER") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\hunter.tga") end
	if (select(2, UnitClass("player")) == "MAGE") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\mage.tga") end
	-- if (select(2, UnitClass("player")) == "MONK") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\alliance.tga") end
	if (select(2, UnitClass("player")) == "PALADIN") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\paladin.tga") end
	if (select(2, UnitClass("player")) == "PRIEST") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\priest.tga") end
	if (select(2, UnitClass("player")) == "ROGUE") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\rogue.tga") end
	if (select(2, UnitClass("player")) == "SHAMAN") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\shaman.tga") end
	if (select(2, UnitClass("player")) == "WARLOCK") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\warlock.tga") end
	if (select(2, UnitClass("player")) == "WARRIOR") then TukuiChatBackgroundLeft.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\warrior.tga") end
	TukuiChatBackgroundLeft.bg:SetAlpha(0.5)

	if not TukuiChatBackgroundRight.bg then
		TukuiChatBackgroundRight.bg = TukuiChatBackgroundRight:CreateTexture(nil, 'LOW')
		TukuiChatBackgroundRight.bg:SetInside()
		TukuiChatBackgroundRight.bg:SetAlpha(0.5)
	end

	if UnitFactionGroup("player") == "Horde" then
		TukuiChatBackgroundRight.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\horde.tga")
	else 
		TukuiChatBackgroundRight.bg:SetTexture("Interface\\Addons\\NishaUI\\medias\\textures\\chat\\alliance.tga")
	end
end

------------------------------
-- datatext panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextLeft:SetPoint( "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextLeft:CreateOverlay( G.Panels.DataTextLeft )

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextRight:SetPoint( "BOTTOM", G.Panels.RightChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextRight:CreateOverlay( G.Panels.DataTextRight )
end
if( C["datatext"]["battleground"] == true ) then
	G.Panels.BattlegroundDataText:SetFrameStrata( "HIGH" )
	G.Panels.BattlegroundDataText:SetFrameLevel( 0 )
	G.Panels.BattlegroundDataText:CreateOverlay( G.Panels.BattlegroundDataText )
end

------------------------------
-- minimap
------------------------------
G.Panels.DataTextMinimapLeft:ClearAllPoints()
G.Panels.DataTextMinimapLeft:SetPoint( "BOTTOM", TukuiMinimap, "TOP", 0, -15 )
G.Panels.DataTextMinimapLeft:SetFrameLevel(5)
--------------------------------------------------------------
-- classbarmover
--------------------------------------------------------------
local anchor = CreateFrame("Frame", "cbMover", UIParent)
anchor:Size(233, 11)
if (T.myclass == "PRIEST" or T.myclass == "MONK" or T.myclass == "WARRIOR" or T.myclass == "DRUID" or T.myclass == "DEATHKNIGHT" or T.myclass == "MAGE") then
	anchor:Point("BOTTOM", TukuiPlayer, "TOP", 0, 18)
else
	anchor:Point("BOTTOM", TukuiPlayer, "TOP", 0, 7)
end
anchor:SetTemplate("Default")
anchor:SetBackdropBorderColor(1, 0, 0, 1)
anchor:SetFrameStrata("HIGH")
anchor:SetClampedToScreen(true)
anchor:SetMovable(true)
anchor:Hide()
anchor.text = T.SetFontString(anchor, C.media.uffont, 12)
anchor.text:SetPoint("CENTER")
anchor.text:SetText("Move Classbar")
tinsert(T.AllowFrameMoving, anchor)

------------------------------
-- Filger
------------------------------
local PlayerBuffs = CreateFrame("Frame","FilgerPlayerBuffs",UIParent, "SecureHandlerStateTemplate")
PlayerBuffs:SetTemplate("Default")
PlayerBuffs:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
PlayerBuffs:Point("CENTER", UIParent, "CENTER", 0, 100)
PlayerBuffs:SetMovable(true)
PlayerBuffs:SetFrameLevel(10)
PlayerBuffs:SetBackdropBorderColor(1,0,0)
PlayerBuffs.text = T.SetFontString(PlayerBuffs, unpack(T.Fonts.movers.setfont))
PlayerBuffs.text:SetPoint("CENTER")
PlayerBuffs.text:SetText("Move Player Buffs")
PlayerBuffs:Hide()
tinsert(T.AllowFrameMoving, PlayerBuffs)

local PlayerProccs = CreateFrame("Frame","FilgerPlayerProccs",UIParent, "SecureHandlerStateTemplate")
PlayerProccs:SetTemplate("Default")
PlayerProccs:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
PlayerProccs:Point("CENTER", UIParent, "CENTER", 0, 150)
PlayerProccs:SetMovable(true)
PlayerProccs:SetFrameLevel(10)
PlayerProccs:SetBackdropBorderColor(1,0,0)
PlayerProccs.text = T.SetFontString(PlayerProccs, unpack(T.Fonts.movers.setfont))
PlayerProccs.text:SetPoint("CENTER")
PlayerProccs.text:SetText("Move Player Proccs")
PlayerProccs:Hide()
tinsert(T.AllowFrameMoving, PlayerProccs )

local PlayerCD = CreateFrame("Frame","FilgerPlayerCD",UIParent, "SecureHandlerStateTemplate")
PlayerCD:SetTemplate("Default")
PlayerCD:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
PlayerCD:Point("CENTER", UIParent, "CENTER", 0, 200)
PlayerCD:SetMovable(true)
PlayerCD:SetFrameLevel(10)
PlayerCD:SetBackdropBorderColor(1,0,0)
PlayerCD.text = T.SetFontString(PlayerCD, unpack(T.Fonts.movers.setfont))
PlayerCD.text:SetPoint("CENTER")
PlayerCD.text:SetText("Move PlayerCD")
PlayerCD:Hide()
tinsert(T.AllowFrameMoving, PlayerCD)

local TargetDebuffs = CreateFrame("Frame","FilgerTargetDebuffs",UIParent, "SecureHandlerStateTemplate")
TargetDebuffs:SetTemplate("Default")
TargetDebuffs:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
TargetDebuffs:Point("CENTER", UIParent, "CENTER", 0, 250)
TargetDebuffs:SetMovable(true)
TargetDebuffs:SetFrameLevel(10)
TargetDebuffs:SetBackdropBorderColor(1,0,0)
TargetDebuffs.text = T.SetFontString(TargetDebuffs, unpack(T.Fonts.movers.setfont))
TargetDebuffs.text:SetPoint("CENTER")
TargetDebuffs.text:SetText("Move Target Debuffs")
TargetDebuffs:Hide()
tinsert(T.AllowFrameMoving, TargetDebuffs)

local PVEDebuffs = CreateFrame("Frame","FilgerPVEDebuffs",UIParent, "SecureHandlerStateTemplate")
PVEDebuffs:SetTemplate("Default")
PVEDebuffs:Size(75, 75)
PVEDebuffs:Point("CENTER", UIParent, "CENTER",  0, 300)
PVEDebuffs:SetMovable(true)
PVEDebuffs:SetFrameLevel(10)
PVEDebuffs:SetBackdropBorderColor(1,0,0)
PVEDebuffs.text = T.SetFontString(PVEDebuffs, unpack(T.Fonts.movers.setfont))
PVEDebuffs.text:SetPoint("CENTER")
PVEDebuffs.text:SetText("Move PvE Debuffs")
PVEDebuffs:Hide()
tinsert(T.AllowFrameMoving, PVEDebuffs)

local specialprocicon = CreateFrame("Frame","Filgerspecialprocicon",UIParent, "SecureHandlerStateTemplate")
specialprocicon:SetTemplate("Default")
specialprocicon:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
specialprocicon:Point("CENTER", UIParent, "CENTER",  0, 350)
specialprocicon:SetMovable(true)
specialprocicon:SetFrameLevel(10)
specialprocicon:SetBackdropBorderColor(1,0,0)
specialprocicon.text = T.SetFontString(specialprocicon, unpack(T.Fonts.movers.setfont))
specialprocicon.text:SetPoint("CENTER")
specialprocicon.text:SetText("Move Special Proccs")
specialprocicon:Hide()
tinsert(T.AllowFrameMoving, specialprocicon)

local targetbufficon = CreateFrame("Frame","Filgertargetbufficon",UIParent, "SecureHandlerStateTemplate")
targetbufficon:SetTemplate("Default")
targetbufficon:Size(C.filger.iconsize + 10, C.filger.iconsize + 10)
targetbufficon:Point("CENTER", UIParent, "CENTER",  0, 400)
targetbufficon:SetMovable(true)
targetbufficon:SetFrameLevel(10)
targetbufficon:SetBackdropBorderColor(1,0,0)
targetbufficon.text = T.SetFontString(targetbufficon, unpack(T.Fonts.movers.setfont))
targetbufficon.text:SetPoint("CENTER")
targetbufficon.text:SetText("Move Target Buffs")
targetbufficon:Hide()
tinsert(T.AllowFrameMoving, targetbufficon)

local toastframemover = CreateFrame("Frame","BNtoastframemover", UIParent, "SecureHandlerStateTemplate")
toastframemover:SetTemplate("Default")
toastframemover:Size(BNToastFrame:GetWidth(), BNToastFrame:GetHeight())
toastframemover:Point( "BOTTOMLEFT", G.Panels.LeftChatBackground, "BOTTOMRIGHT", 3, 0)
toastframemover:SetMovable(true)
toastframemover:SetFrameLevel(10)
toastframemover:SetBackdropBorderColor(1,0,0)
toastframemover.text = T.SetFontString(toastframemover, unpack(T.Fonts.movers.setfont))
toastframemover.text:SetPoint("CENTER")
toastframemover.text:SetText("Move BNToastframe")
toastframemover:Hide()
tinsert(T.AllowFrameMoving, toastframemover)