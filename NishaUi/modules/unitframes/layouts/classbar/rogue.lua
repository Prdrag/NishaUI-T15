local T, C, L, G = unpack( Tukui )


if( T.myclass == "ROGUE" ) then
	if( C["classbar"].rogue ~= true ) then
		G.UnitFrames.Player.ComboPointsBar:Kill()
	else	
		G.UnitFrames.Player.ComboPointsBar:ClearAllPoints()
		G.UnitFrames.Player.ComboPointsBar:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.ComboPointsBar:Size( 233, 11)
		G.UnitFrames.Player.ComboPointsBar:SetFrameStrata("LOW")
		G.UnitFrames.Player.ComboPointsBar:CreateBackdrop("Default")
		for i = 1, 5  do
			
			if i == 1 then
				G.UnitFrames.Player.ComboPointsBar[i]:Point("TOPLEFT", G.UnitFrames.Player.ComboPointsBar, "BOTTOMLEFT", 1, 11)
				G.UnitFrames.Player.ComboPointsBar[i]:Size(220/5, 11)
			else
				G.UnitFrames.Player.ComboPointsBar[i]:Point("LEFT", G.UnitFrames.Player.ComboPointsBar[i-1], "RIGHT", 3, 0)
				G.UnitFrames.Player.ComboPointsBar[i]:Size(220/5, 11)
			end
		end		
	end
end