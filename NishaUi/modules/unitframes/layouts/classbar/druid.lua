local T, C, L, G = unpack( Tukui )


if( T.myclass == "DRUID" ) then
	if( C["classbar"].druid ~= true ) then
		G.UnitFrames.Player.EclipseBar:Kill()
	else					
		local SPELL_POWER_ECLIPSE = SPELL_POWER_ECLIPSE
		
		G.UnitFrames.Player.DruidManaBackground:Kill()
		G.UnitFrames.Player.EclipseBar:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.EclipseBar:Size(233, 11)
		G.UnitFrames.Player.EclipseBar:CreateBackdrop("Default")
		G.UnitFrames.Player.EclipseBar:SetFrameStrata("LOW")
		G.UnitFrames.Player.EclipseBar.LunarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
		G.UnitFrames.Player.EclipseBar.SolarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
		G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar.Text:SetPoint( "TOP", G.UnitFrames.Player.EclipseBar, 0, 25 )
		G.UnitFrames.Player.EclipseBar.Text:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Player.EclipseBar.Text:SetShadowOffset( T.mult, -T.mult )
		
		TukuiWildMushroomBar:ClearAllPoints()
		TukuiWildMushroomBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		TukuiWildMushroomBar:SetBackdrop(nil)
		TukuiWildMushroomBar:Size(233, 3)
		for i = 1, 3 do
			TukuiWildMushroomBar[i]:SetFrameLevel(8)
			TukuiWildMushroomBar[i]:CreateBackdrop("Default")
			if( i == 1 ) then
				TukuiWildMushroomBar[i]:Point("TOPLEFT", TukuiWildMushroomBar, "BOTTOMLEFT", 0, 3)
				TukuiWildMushroomBar[i]:Size(223/3, 3)
			else
				TukuiWildMushroomBar[i]:Point( "LEFT", TukuiWildMushroomBar[i - 1], "RIGHT", 5, 0 )
				TukuiWildMushroomBar[i]:Size(223/3, 3)
			end
		end
		local DPowerStatus = CreateFrame("StatusBar", "DPowerStatus", G.UnitFrames.Player.EclipseBar)
		DPowerStatus:Point("TOPLEFT", G.UnitFrames.Player.EclipseBar, "TOPLEFT", 2, -2)
		DPowerStatus:Point("BOTTOMRIGHT", G.UnitFrames.Player.EclipseBar, "BOTTOMRIGHT", -2, 2)
		
		DPowerStatus.t = DPowerStatus:CreateFontString(nil, "OVERLAY")
		DPowerStatus.t:SetPoint("CENTER")
		DPowerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
		
		local t = 0
		DPowerStatus:SetScript("OnUpdate", function(self, elapsed)
			t = t + elapsed;
			if (t > 0.07) then
				local power = UnitPower('player', SPELL_POWER_ECLIPSE)
				local maxPower = UnitPowerMax('player', SPELL_POWER_ECLIPSE)				
				DPowerStatus:SetMinMaxValues(-maxPower, maxPower)
				DPowerStatus:SetValue(power)
				DPowerStatus.t:SetText(power)
			end
		end)	
	end
end