local T, C, L, G = unpack( Tukui )


if( T.myclass == "SHAMAN" ) then
	if( C["classbar"].shaman ~= true ) then
		for i = 1, 4  do
			G.UnitFrames.Player.TotemBar[i]:Kill()
		end
	else	
		local totembg = CreateFrame("Frame", "totembg", UIParent)
		totembg:Size(233, 11)
		totembg:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		totembg:SetTemplate("Default")
		totembg:CreateBackdrop("Default")
	
		for i = 1, 4  do
			if i == 1 then
				G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
				G.UnitFrames.Player.TotemBar[i]:SetPoint( "TOPLEFT", totembg, "TOPLEFT", 0, 0)
				G.UnitFrames.Player.TotemBar[i]:Size(223/4, 11)
			else
				G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
				G.UnitFrames.Player.TotemBar[i]:Point("LEFT", G.UnitFrames.Player.TotemBar[i-1], "RIGHT", 3, 0)
				G.UnitFrames.Player.TotemBar[i]:Size(223/4, 11)
			end
		end
	end
end