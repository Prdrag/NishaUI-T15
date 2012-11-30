local T, C, L, G = unpack( Tukui )


if( T.myclass == "PRIEST" ) then
	if( C["classbar"].priest ~= true ) then
		G.UnitFrames.Player.ShadowOrbsBar:Kill()
	else	
		G.UnitFrames.Player.ShadowOrbsBar:ClearAllPoints()
		G.UnitFrames.Player.ShadowOrbsBar:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.ShadowOrbsBar:Size( 233, 11)
		G.UnitFrames.Player.ShadowOrbsBar:SetFrameStrata("LOW")
		G.UnitFrames.Player.ShadowOrbsBar:CreateBackdrop("Default")
		if C.unitframes.showstatuebar then
			TukuiStatueBar:ClearAllPoints()
			TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
			TukuiStatueBar:CreateBackdrop("Default")
			TukuiStatueBar:Size(233, 3)
		end
		for i = 1, 3  do
			
			if i == 1 then
				G.UnitFrames.Player.ShadowOrbsBar[i]:SetPoint( "TOPLEFT", G.UnitFrames.Player.ShadowOrbsBar, "TOPLEFT", 0, 0 )
				G.UnitFrames.Player.ShadowOrbsBar[i]:Size(224/3, 11)
			else
				G.UnitFrames.Player.ShadowOrbsBar[i]:Point("LEFT", G.UnitFrames.Player.ShadowOrbsBar[i-1], "RIGHT", 3, 0)
				G.UnitFrames.Player.ShadowOrbsBar[i]:Size(224/3, 11)
			end
		end
	end
end