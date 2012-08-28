local T, C, L, G = unpack( Tukui )

------------------------------
-- actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 48)
G.ActionBars.Bar1:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) + 2, ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ) + 2)
G.ActionBars.Bar1:CreateShadow("Default")
G.ActionBars.Bar1:SetTemplate("Transparent")

G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetAllPoints( G.ActionBars.Bar1 )

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
if (T.myclass == "PRIEST" or T.myclass == "MONK" or T.myclass == "WARRIOR" or T.myclass == "DRUID") then
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
PlayerBuffs:Size(C.filger.iconsize, C.filger.iconsize)
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
PlayerProccs:Size(C.filger.iconsize, C.filger.iconsize)
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
PlayerCD:Size(C.filger.iconsize, C.filger.iconsize)
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
TargetDebuffs:Size(C.filger.iconsize, C.filger.iconsize)
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
PVEDebuffs:Point("CENTER", UIParent, "CENTER",  0, 40)
PVEDebuffs:SetMovable(true)
PVEDebuffs:SetFrameLevel(10)
PVEDebuffs:SetBackdropBorderColor(1,0,0)
PVEDebuffs.text = T.SetFontString(PVEDebuffs, unpack(T.Fonts.movers.setfont))
PVEDebuffs.text:SetPoint("CENTER")
PVEDebuffs.text:SetText("Move PvE Debuffs")
PVEDebuffs:Hide()
tinsert(T.AllowFrameMoving, PVEDebuffs)

local Petbuffs = CreateFrame("Frame","FilgerPetbuffs",UIParent, "SecureHandlerStateTemplate")
Petbuffs:SetTemplate("Default")
Petbuffs:Size(C.filger.iconsize, C.filger.iconsize)
Petbuffs:Point("CENTER", UIParent, "CENTER",  0, 300)
Petbuffs:SetMovable(true)
Petbuffs:SetFrameLevel(10)
Petbuffs:SetBackdropBorderColor(1,0,0)
Petbuffs.text = T.SetFontString(Petbuffs, unpack(T.Fonts.movers.setfont))
Petbuffs.text:SetPoint("CENTER")
Petbuffs.text:SetText("Move PvE Debuffs")
Petbuffs:Hide()
tinsert(T.AllowFrameMoving, Petbuffs)

local EmbedRightBackground = CreateFrame( "Frame", "EmbedRightBackground", UIParent )
EmbedRightBackground:Size( C["chat"].width, C["chat"].height - 10)
EmbedRightBackground:Point( "BOTTOMRIGHT", G.Panels.RightChatBackground, "BOTTOMRIGHT", -2, -5 )
EmbedRightBackground:SetTemplate( "Transparent" )
EmbedRightBackground:SetFrameStrata( "MEDIUM" )
EmbedRightBackground:SetFrameLevel( 3 )
EmbedRightBackground:Hide()

EmbedRightBackground:RegisterEvent("PLAYER_ENTERING_WORLD")
EmbedRightBackground:RegisterEvent("PLAYER_LOGIN")
if C["skin"].combattoggle == true then
	EmbedRightBackground:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	EmbedRightBackground:RegisterEvent( "PLAYER_REGEN_DISABLED" )
end

EmbedRightBackground:SetScript( "OnEvent", function( self, event )
	if( C["chat"].background == true or C["addonskins"]["combattoggle"] == true ) then
		if( event == "PLAYER_LOGIN" ) then
			EmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_ENTERING_WORLD" ) then
			EmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		end
	end

	if C["skin"].combattoggle == true then
		if( event == "PLAYER_REGEN_ENABLED" ) then
			EmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_REGEN_DISABLED" ) then
			EmbedRightBackground:Show()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Show() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Show() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( true ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Show() end
		end
	end
end )