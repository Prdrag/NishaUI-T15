local T, C, L, G = unpack( Tukui )

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()
TukuiAurasPlayerBuffs:SetPoint( "TOPRIGHT", TukuiMinimap, "TOPLEFT", -17, 0 )
TukuiAurasPlayerDebuffs:SetPoint( "TOPRIGHT", TukuiMinimap, "TOPLEFT", -17, -167 )
