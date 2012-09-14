local T, C, L, G = unpack( Tukui )

if T.myclass == "WARRIOR" then
	TukuiStatueBar:ClearAllPoints()
	TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
	TukuiStatueBar:CreateBackdrop("Default")
	TukuiStatueBar:Size(233, 3)
end