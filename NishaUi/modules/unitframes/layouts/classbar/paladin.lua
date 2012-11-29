local T, C, L, G = unpack( Tukui )

if( T.myclass == "PALADIN" ) then
	if( C["classbar"].paladin ~= true ) then
		G.UnitFrames.Player.HolyPower:Kill()
		for i = 1, 5 do
			G.UnitFrames.Player.HolyPower[i]:Kill()
		end
	else
		if T.level >= 85 then
			G.UnitFrames.Player.HolyPower:ClearAllPoints()
			G.UnitFrames.Player.HolyPower:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
			G.UnitFrames.Player.HolyPower:Size( 233, 11)
			G.UnitFrames.Player.HolyPower:SetFrameStrata("LOW")
			G.UnitFrames.Player.HolyPower:CreateBackdrop("Default")
			for i = 1, 5  do
					G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )
				if i == 1 then
					G.UnitFrames.Player.HolyPower[i]:Point("TOPLEFT", G.UnitFrames.Player.HolyPower, "BOTTOMLEFT", 0, 11)
					G.UnitFrames.Player.HolyPower[i]:Size(227/5, 11)
				else
					G.UnitFrames.Player.HolyPower[i]:Point("LEFT", G.UnitFrames.Player.HolyPower[i-1], "RIGHT", 1, 0)
					G.UnitFrames.Player.HolyPower[i]:Size(228/5, 11)
				end
				G.UnitFrames.Player.HolyPower[i].width = G.UnitFrames.Player.HolyPower[i]:GetWidth()
			end
		else
			G.UnitFrames.Player.HolyPower:ClearAllPoints()
			G.UnitFrames.Player.HolyPower:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
			G.UnitFrames.Player.HolyPower:Size( 233, 11)
			G.UnitFrames.Player.HolyPower:SetFrameStrata("LOW")
			G.UnitFrames.Player.HolyPower:CreateBackdrop("Default")
			for i = 1, 3  do
					G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )
				if i == 1 then
					G.UnitFrames.Player.HolyPower[i]:Point("TOPLEFT", G.UnitFrames.Player.HolyPower, "BOTTOMLEFT", 0, 11)
					G.UnitFrames.Player.HolyPower[i]:Size(230/3, 11)
				else
					G.UnitFrames.Player.HolyPower[i]:Point("LEFT", G.UnitFrames.Player.HolyPower[i-1], "RIGHT", 1, 0)
					G.UnitFrames.Player.HolyPower[i]:Size(230/3, 11)
				end
			end
		end
	end
end