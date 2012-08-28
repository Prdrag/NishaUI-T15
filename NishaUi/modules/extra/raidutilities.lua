local T, C, L, G = unpack( Tukui )
if C.unitframes.raid == true then
	TukuiRaidUtilityShowButton:Size(176, 23)
	TukuiRaidUtilityShowButton:ClearAllPoints()
	TukuiRaidUtilityShowButton:Point("TOP", TukuiMinimap, "BOTTOM", 0, -3)
	TukuiRaidUtility:ClearAllPoints()
	TukuiRaidUtility:Point("TOP", TukuiMinimap, "BOTTOM", 0, -3)
end