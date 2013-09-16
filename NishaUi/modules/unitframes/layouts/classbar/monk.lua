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
						G.UnitFrames.Player.HarmonyBar[i].width = G.UnitFrames.Player.HarmonyBar[i]:GetWidth()
					elseif( maxChi == 5 ) then
						if( i == 5 ) then
							G.UnitFrames.Player.HarmonyBar[i]:Size( T.Scale( 232 / 5 ) - 1, 11 )
						else
							G.UnitFrames.Player.HarmonyBar[i]:Size( T.Scale( 232 / 5 ), 11 )
						end
						G.UnitFrames.Player.HarmonyBar[i].width = G.UnitFrames.Player.HarmonyBar[i]:GetWidth()
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
		if (T.myname == "Nìshâ" or T.myname == "Nìsha") and T.myrealm == "Blackmoore" then
			---------------------------------------------------------
			--Powerbar
			---------------------------------------------------------
			local ShortValue = function( v )
				if( v >= 1e6 ) then
					return ( "%.1fm" ):format( v / 1e6 ):gsub( "%.?0+([km])$", "%1" )
				elseif( v >= 1e3 or v <= -1e3 ) then
					return ( "%.1fk" ):format( v / 1e3 ):gsub( "%.?0+([km])$", "%1" )
				else
					return v
				end
			end
			
			local sPowerBG = CreateFrame("Frame", "sPowerBG",G.UnitFrames.Player.HarmonyBar)
			sPowerBG:Size( 237, 17 )
			sPowerBG:Point("TOPLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", -2, -4)
			sPowerBG:SetTemplate( "Default" )
			local sPowerStatus = CreateFrame("StatusBar", "sPowerStatus", sPowerBG)
			sPowerStatus:SetStatusBarTexture(C["media"].normTex)
			sPowerStatus:SetFrameLevel(10)
			sPowerStatus:Point("TOPLEFT", sPowerBG, "TOPLEFT", 2, -2)
			sPowerStatus:Point("BOTTOMRIGHT", sPowerBG, "BOTTOMRIGHT", -2, 2)
			sPowerStatus.t = sPowerStatus:CreateFontString(nil, "OVERLAY")
			sPowerStatus.t:SetPoint("CENTER", -10, 0)
			sPowerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
			sPowerStatus.t:SetShadowOffset(0.5, -0.5)
			sPowerStatus.t:SetShadowColor(0,0,0)		
			sPowerStatus.tt = sPowerStatus:CreateFontString(nil, "OVERLAY")
			sPowerStatus.tt:SetPoint("CENTER", 4, 0)
			sPowerStatus.tt:SetFont(unpack(T.Fonts.dFont.setfont))
			sPowerStatus.tt:SetShadowOffset(0.5, -0.5)
			sPowerStatus.tt:SetShadowColor(0,0,0)		
			sPowerStatus.tz = sPowerStatus:CreateFontString(nil, "OVERLAY")
			sPowerStatus.tz:SetPoint("CENTER", 16, 0)
			sPowerStatus.tz:SetFont(unpack(T.Fonts.dFont.setfont))
			sPowerStatus.tz:SetShadowOffset(0.5, -0.5)
			sPowerStatus.tz:SetShadowColor(0,0,0)
			local color = RAID_CLASS_COLORS[T.myclass]
			sPowerStatus:SetStatusBarColor(color.r, color.g, color.b)
			local t = 0
			sPowerStatus:SetScript("OnUpdate", function(self, elapsed)
				t = t + elapsed;
				if (t > 0.07) then
					sPowerStatus:SetMinMaxValues(0, UnitPowerMax("player"))
					local power = UnitPower("player")
					local activeRegen = floor(GetPowerRegen())
					sPowerStatus:SetValue(power)
					sPowerStatus.t:SetText(ShortValue(power))
					sPowerStatus.tt:SetText(" | ", activeRegen)
					sPowerStatus.tz:SetText(activeRegen)
				end
			end)
			sPowerStatus:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
			sPowerBG:RegisterEvent("PLAYER_ENTERING_WORLD")
			sPowerBG:RegisterEvent("UNIT_DISPLAYPOWER")			
		end
	end
end