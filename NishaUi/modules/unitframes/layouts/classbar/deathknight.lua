local T, C, L, G = unpack( Tukui )


if( T.myclass == "DEATHKNIGHT" ) then
		if C.unitframes.showstatuebar then
			TukuiStatueBar:ClearAllPoints()
			TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
			TukuiStatueBar:CreateBackdrop("Default")
			TukuiStatueBar:Size(233, 3)
		end
	if( C["classbar"].deathknight ~= true ) then
		G.UnitFrames.Player.Runes:Kill()
		for i = 1, 6 do
			G.UnitFrames.Player.Runes[i]:Kill()
		end
	else

		G.UnitFrames.Player.Runes:ClearAllPoints()
		G.UnitFrames.Player.Runes:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.Runes:Size( 233, 11 )
		G.UnitFrames.Player.Runes:CreateBackdrop("Default")

		for i = 1, 6 do
			if( i == 1 ) then
				G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player.Runes, "TOPLEFT", 1, -11 )
				G.UnitFrames.Player.Runes[i]:Size( T.Scale( 38 ), 11 )
			elseif( i == 2 or i == 3 ) then
				G.UnitFrames.Player.Runes[i]:Size( T.Scale( 37 ), 11 )
				G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player.Runes, "TOPLEFT", 1, -11 )
			else
				G.UnitFrames.Player.Runes[i]:Point( "LEFT", G.UnitFrames.Player.Runes[i - 1], "RIGHT", 2, 0 )
				G.UnitFrames.Player.Runes[i]:Size( T.Scale( 38 ), 11 )
			end
		end
	end
end