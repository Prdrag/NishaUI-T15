local T, C, L, G = unpack( Tukui )

TukuiAurasPlayerBuffs:ClearAllPoints()
TukuiAurasPlayerDebuffs:ClearAllPoints()
TukuiAurasPlayerBuffs:SetPoint("TOPRIGHT", TukuiMinimap, "TOPLEFT", -17, 0 )
TukuiAurasPlayerDebuffs:SetPoint("TOP", TukuiAurasPlayerBuffs, "BOTTOM", 0, -84)