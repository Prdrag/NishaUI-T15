local T, C, L, G = unpack( Tukui )

local maxChi = UnitPowerMax("player", SPELL_POWER_CHI)

if T.myclass == "MONK" then
	if( C["classbar"].monk ~= true ) then
		G.UnitFrames.Player.HarmonyBar:Kill()
		TukuiStatueBar:Kill()
	else
		G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
		G.UnitFrames.Player.HarmonyBar:SetPoint( "BOTTOMLEFT", cbMover, "TOPLEFT", 0, 0 )
		G.UnitFrames.Player.HarmonyBar:Size( 233, 11 )
		G.UnitFrames.Player.HarmonyBar:CreateBackdrop( "Default" )

		local maxChi = UnitPowerMax( "player", SPELL_POWER_CHI )

		for i = 1, maxChi do
			if( maxChi == 4 ) then
				if( i == 4 or i == 3 ) then
					G.UnitFrames.Player.HarmonyBar[i]:Size( ( 233 / 4 ) - 1, 11 )
				else
					G.UnitFrames.Player.HarmonyBar[i]:Size( 233 / 4, 11 )
				end
			elseif( maxChi == 5 ) then
				if( i == 5 ) then
					G.UnitFrames.Player.HarmonyBar[i]:Size( T.Scale( 232 / 5 ) - 1, 11 )
				else
					G.UnitFrames.Player.HarmonyBar[i]:Size( T.Scale( 232 / 5 ), 11 )
				end
			end

			if( i == 1 ) then
				G.UnitFrames.Player.HarmonyBar[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", 0, 0 )
			else
				G.UnitFrames.Player.HarmonyBar[i]:Point( "LEFT", G.UnitFrames.Player.HarmonyBar[i - 1], "RIGHT", 1, 0 )
			end
		end

		if( C["unitframes"]["showstatuebar"] == true ) then
			G.UnitFrames.Player.Statue:ClearAllPoints()
			G.UnitFrames.Player.Statue:Size( 233, 2 )
			G.UnitFrames.Player.Statue:Point( "TOPRIGHT", G.UnitFrames.Player.Power, "BOTTOMRIGHT", 0, -7 )
			G.UnitFrames.Player.Statue:CreateBackdrop( "Default" )
			G.UnitFrames.Player.Statue.backdrop:CreateShadow( "Default" )
		end
	end
end