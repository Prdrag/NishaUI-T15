local T, C, L, G = unpack( Tukui )

if( T.myclass == "WARLOCK" ) then
	if( C["classbar"].warlock ~= true ) then
		G.UnitFrames.Player.WarlockSpecBars:Kill()
	else
		G.UnitFrames.Player.WarlockSpecBars:ClearAllPoints()
		G.UnitFrames.Player.WarlockSpecBars:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		G.UnitFrames.Player.WarlockSpecBars:Size( 233, 11)
		G.UnitFrames.Player.WarlockSpecBars:SetFrameStrata("LOW")
		G.UnitFrames.Player.WarlockSpecBars:CreateBackdrop("Default")
		for i = 1, 4  do
			
			if i == 1 then
				G.UnitFrames.Player.WarlockSpecBars[i]:Point("TOPLEFT", G.UnitFrames.Player.WarlockSpecBars, "BOTTOMLEFT", 0, 11)
				G.UnitFrames.Player.WarlockSpecBars[i]:Size(233/4, 11)
			else
				G.UnitFrames.Player.WarlockSpecBars[i]:Point("LEFT", G.UnitFrames.Player.WarlockSpecBars[i-1], "RIGHT", 3, 0)
				G.UnitFrames.Player.WarlockSpecBars[i]:Size(233/4, 11)
			end
		end	

		local wlPowerStatus = CreateFrame("StatusBar", "wlPowerStatus", G.UnitFrames.Player.WarlockSpecBars)
		wlPowerStatus:Point("TOPLEFT", G.UnitFrames.Player.WarlockSpecBars, "TOPLEFT", 2, -2)
		wlPowerStatus:Point("BOTTOMRIGHT", G.UnitFrames.Player.WarlockSpecBars, "BOTTOMRIGHT", -2, 2)
		wlPowerStatus.t = wlPowerStatus:CreateFontString(nil, "OVERLAY")
		wlPowerStatus.t:SetPoint("CENTER")
		wlPowerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
		
		local function showpower()
			local spec = GetSpecialization()
			local SPEC_WARLOCK_DEMONOLOGY = SPEC_WARLOCK_DEMONOLOGY
			local SPEC_WARLOCK_DESTRUCTION = SPEC_WARLOCK_DESTRUCTION
			local SPEC_WARLOCK_AFFLICTION = SPEC_WARLOCK_AFFLICTION
			
			if spec == SPEC_WARLOCK_DEMONOLOGY then
				local SPELL_POWER_DEMONIC_FURY = SPELL_POWER_DEMONIC_FURY
				local power = UnitPower("player", SPELL_POWER_DEMONIC_FURY)
				local maxPower = UnitPowerMax("player", SPELL_POWER_DEMONIC_FURY)
				wlPowerStatus:SetMinMaxValues(0, maxPower)
				wlPowerStatus:SetValue(power)
				wlPowerStatus.t:SetText(power)
			elseif spec == SPEC_WARLOCK_DESTRUCTION then
				local maxPower = UnitPowerMax("player", SPELL_POWER_BURNING_EMBERS, true)
				local power = UnitPower("player", SPELL_POWER_BURNING_EMBERS, true)
				local numBars = floor(maxPower / MAX_POWER_PER_EMBER)
				for i = 1, numBars do
					wlPowerStatus:SetMinMaxValues((MAX_POWER_PER_EMBER * i) - MAX_POWER_PER_EMBER, MAX_POWER_PER_EMBER * i)
					wlPowerStatus:SetValue(power)
				end
				wlPowerStatus.t:SetText(power)
			elseif spec == SPEC_WARLOCK_AFFLICTION then
				wlPowerStatus.t:SetText(power)
			end
		end
		
		local function createBars()
			wlPowerStatus:RegisterEvent('UNIT_POWER')
			wlPowerStatus:RegisterEvent("PLAYER_TALENT_UPDATE")
			wlPowerStatus:SetScript("OnEvent", showpower)
			showpower()
		end
		wlPowerStatus:RegisterEvent("PLAYER_ENTERING_WORLD")
		wlPowerStatus:SetScript("OnEvent",function(self,event)
			if event == "PLAYER_ENTERING_WORLD" then
				createBars()
				showpower()
			end
		end)
	end
end		