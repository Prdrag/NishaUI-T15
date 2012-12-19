local T, C, L, G = unpack( Tukui )

if( T.myclass == "MAGE" ) then
	if( C["classbar"].mage ~= true ) then
		G.UnitFrames.Player.ArcaneChargeBar:Kill()
		if T.level == 90 then
			G.UnitFrames.Player.RunePower:Kill()
		end
	else
		if T.level == 90 then
			G.UnitFrames.Player.RunePower:ClearAllPoints()
			G.UnitFrames.Player.RunePower:SetPoint("TOPLEFT", G.UnitFrames.Player.ArcaneChargeBar, "BOTTOMLEFT", 0, -7)
			G.UnitFrames.Player.RunePower:SetBackdrop(nil)
			G.UnitFrames.Player.RunePower:Size(239, 3)
			for i = 1, 2 do
				G.UnitFrames.Player.RunePower[i]:SetFrameLevel(8)
				G.UnitFrames.Player.RunePower[i]:CreateBackdrop("Default")
				if( i == 1 ) then
					G.UnitFrames.Player.RunePower[i]:Point("TOPLEFT", G.UnitFrames.Player.ArcaneChargeBar, "BOTTOMLEFT", 0, -5)
					G.UnitFrames.Player.RunePower[i]:Size(227/2, 3)
				else
					G.UnitFrames.Player.RunePower[i]:Point( "LEFT", G.UnitFrames.Player.RunePower[i - 1], "RIGHT", 5, 0 )
					G.UnitFrames.Player.RunePower[i]:Size(227/2, 3)
				end
			end
		end
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