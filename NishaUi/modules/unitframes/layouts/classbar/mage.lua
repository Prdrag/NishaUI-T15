local T, C, L, G = unpack( Tukui )

if( T.myclass == "MAGE" ) then
	if( C["classbar"].mage ~= true ) then
		G.UnitFrames.Player.ArcaneChargeBar:Kill()
	else
		G.UnitFrames.Player.ArcaneChargeBar:ClearAllPoints()
		G.UnitFrames.Player.ArcaneChargeBar:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.ArcaneChargeBar:Size( 233, 11)
		G.UnitFrames.Player.ArcaneChargeBar:CreateBackdrop("Default")

		for i = 1, 6 do
			if( i == 1 ) then
				G.UnitFrames.Player.ArcaneChargeBar[i]:SetPoint( "TOPLEFT", G.UnitFrames.Player.ArcaneChargeBar, "BOTTOMLEFT", 0, 11)
				G.UnitFrames.Player.ArcaneChargeBar[i]:Size(228/6, 11)
			elseif i == 5 then
				G.UnitFrames.Player.ArcaneChargeBar[i]:Point( "LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 2, 0 )
				G.UnitFrames.Player.ArcaneChargeBar[i]:Size(228/6, 11)
			else
				G.UnitFrames.Player.ArcaneChargeBar[i]:Point( "LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 1, 0 )
				G.UnitFrames.Player.ArcaneChargeBar[i]:Size(228/6, 11)
			end
		end
	end
end