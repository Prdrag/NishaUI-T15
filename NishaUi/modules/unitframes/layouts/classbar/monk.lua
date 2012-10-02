local T, C, L, G = unpack( Tukui )
local maxChi = UnitPowerMax("player", SPELL_POWER_LIGHT_FORCE)

if T.myclass == "MONK" then
	if( C["classbar"].monk ~= true ) then
		G.UnitFrames.Player.HarmonyBar:Kill()
		TukuiStatueBar:Kill()
	else
		G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
		G.UnitFrames.Player.HarmonyBar:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.HarmonyBar:Size(233, 11)
		G.UnitFrames.Player.HarmonyBar:CreateBackdrop("Default")
		if C.unitframes.showstatuebar then
			TukuiStatueBar:ClearAllPoints()
			TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
			TukuiStatueBar:CreateBackdrop("Default")
			TukuiStatueBar:Size(233, 3)
		end
		if maxChi == 4 then 
			for i = 1, 4 do
				if i == 1 then
					G.UnitFrames.Player.HarmonyBar[i]:Point("TOPLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", 0, 11)
					G.UnitFrames.Player.HarmonyBar[i]:Size(230/4, 11)
				else
					G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i-1], "RIGHT", 1, 0)
					G.UnitFrames.Player.HarmonyBar[i]:Size(228/4, 11)
				end
			end
		elseif maxChi == 5 then
			for i = 1, 5 do
				if i == 1 then
					G.UnitFrames.Player.HarmonyBar[i]:Point("TOPLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", 1, 11)
					G.UnitFrames.Player.HarmonyBar[i]:Size(228/5, 11)
				elseif i == 3 then
					G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i-1], "RIGHT", 1, 0)
					G.UnitFrames.Player.HarmonyBar[i]:Size(227/5, 11)
				else
					G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i-1], "RIGHT", 1, 0)
					G.UnitFrames.Player.HarmonyBar[i]:Size(227/5, 11)
				end
			end
		end
	end
end