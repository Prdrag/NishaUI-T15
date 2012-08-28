local T, C, L, G = unpack(Tukui)

---------------------------------------------------------------
-- Minimap
---------------------------------------------------------------
G.Maps.Minimap:ClearAllPoints()
G.Maps.Minimap:Size( 176, 176)
G.Maps.Minimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -40, -5)
Minimap:Size(176, 176)

local MinimapToggleButton = CreateFrame( "Button", "MinimapToggleButton", UIParent )
MinimapToggleButton:Size( 11, 30 )
MinimapToggleButton:SetPoint( "TOPLEFT", TukuiAurasPlayerBuffs, "TOPRIGHT", 3, 0 )
MinimapToggleButton:SetTemplate("Default")
MinimapToggleButton:CreateShadow( "Default" )
MinimapToggleButton:CreateOverlay( MinimapToggleButton )
MinimapToggleButton:FadeOut()

MinimapToggleButton.Text = T.SetFontString( MinimapToggleButton, unpack(T.Fonts.uGeneral.setfont))
MinimapToggleButton.Text:Point( "CENTER", MinimapToggleButton, "CENTER", 2, 0.5 )
MinimapToggleButton.Text:SetText( "|cffFF0000-|r" )

MinimapToggleButton:SetScript( "OnMouseDown", function()
	if InCombatLockdown() then return end
	if( TukuiMinimap:IsVisible() ) then
		TukuiMinimap:Hide()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:Point( "TOPRIGHT", -16, -2 )
		TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", -16, -142 )
		MinimapToggleButton.Text:SetText( "|cff00FF00+|r" )
	else
		TukuiMinimap:Show()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", TukuiMinimap, "TOPLEFT", -17, 0 )
		TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", TukuiMinimap, "TOPLEFT", -17, -167 )
		MinimapToggleButton.Text:SetText( "|cffFF0000-|r" )
	end
end )

MinimapToggleButton:SetScript( "OnEnter", function( self )
	if( InCombatLockdown() ) then return end
	MinimapToggleButton:FadeIn()
	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SHOW_HIDE_MINIMAP )
	GameTooltip:Show()
end )

MinimapToggleButton:SetScript( "OnLeave", function( self )
	if InCombatLockdown() then return end
	MinimapToggleButton:FadeOut()
	GameTooltip:Hide()
end )