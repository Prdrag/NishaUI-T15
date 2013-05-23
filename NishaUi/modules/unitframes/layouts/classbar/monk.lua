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
	
	-- shifu
	local spirit = { [69680] = 'storm', [69791] = 'fire', [69792] = 'earth' }
	local Shifu = CreateFrame('frame', 'Shifu', UIParent)
	Shifu.spirits = {}

	Shifu:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
	Shifu:RegisterEvent('PLAYER_TOTEM_UPDATE')
	Shifu:RegisterEvent('PLAYER_TARGET_CHANGED')
	Shifu:SetPoint('TOPRIGHT', G.UnitFrames.Player.HarmonyBar, 'TOPLEFT', -12, -3)
	Shifu:SetSize(20, 20)
	
	Shifu.button = CreateFrame("Button", "Shifubutton", Shifu)
	Shifu.button:EnableMouse(true)
	Shifu.button:Height(22)
	Shifu.button:Width(22)
	Shifu.button:SetPoint('CENTER', Shifu, 'CENTER', 0, 0)
	Shifu.button:SetTemplate("Default")
		-- since 5.1, DestroyTotem is restricted/protected with Blizzard UI only, so, use some kind of hack ...
		-- local t = TotemFrameTotem1
		-- t:ClearAllPoints()
		-- t:SetParent(Shifu.button)
		-- t:SetAllPoints(Shifu.button)
		-- t:SetFrameLevel(Shifu.button:GetFrameLevel() + 1)
		-- t:SetFrameStrata(Shifu.button:GetFrameStrata())
		-- t:SetAlpha(0)
		
		-- Shifu.button:Hide()
	
	Shifu.spellType = Shifu.button:CreateTexture(nil, 'OVERLAY')
	Shifu.spellType:SetSize(20, 20)
	Shifu.spellType:SetPoint('CENTER', 0, 0)
	Shifu.spellType:SetTexCoord(.1, .9, .1, .9)
	Shifu.spellType:SetDrawLayer('OVERLAY', 1)
	
	Shifu.button:Hide()
	Shifu.spellType:Hide()

	local checkTarget = function(self)
		 local target = UnitGUID("target")
		 self.spellType:Hide()
		 self.button:Hide()
		 if target then
			  for name, t in pairs(self.spirits) do
				   if t.target == target then
						self.spellType:SetTexture(t.icon)
						self.spellType:Show()
						self.button:Show()
						return
				   end
			  end
		 end     
	end

	Shifu:SetScript('OnEvent', function(self, sevent, ...)
		 local playerGUID = UnitGUID("player")
		 if sevent == 'COMBAT_LOG_EVENT_UNFILTERED' then
			  if select(4, ...) == playerGUID then
				   local event = select(2, ...)
				   if event == "SPELL_SUMMON" then
						local dest, dstName = select(8, ...)
						if bit.band(tonumber(dest:sub(5,5), 16), 0x7) == 0x3 then
							 local guid = tonumber(dest:sub(6,10), 16)
							 if spirit[guid] then
								  self.spirits[dstName] = {}
								  self.last = self.spirits[dstName]
							 end
						end
				   elseif event == 'SPELL_CAST_SUCCESS' then
						local spellid = select(12, ...)
						if spellid == 137639 then
							 local dest, dstName = select(8, ...)
							 if self.last then
								  self.last.target = dest
								  self.last = nil
							 end
						end
				   end
				   checkTarget(self)
			  end
		 elseif sevent == 'PLAYER_TARGET_CHANGED' then
			  checkTarget(self)
		 elseif sevent == 'PLAYER_TOTEM_UPDATE' then
			  local foundSpirits = {}
			  for i = 1, MAX_TOTEMS do
				   local haveTotem, name, _, _, icon = GetTotemInfo(i)
				   if haveTotem and name and self.spirits[name] then
						self.spirits[name].icon = icon
						foundSpirits[name] = true
				   end
			  end
			  for name, t in pairs(self.spirits) do
				   if not foundSpirits[name] then
						self.spirits[name] = nil
				   end
			  end
			  checkTarget(self)
		 end
	end)
	
end