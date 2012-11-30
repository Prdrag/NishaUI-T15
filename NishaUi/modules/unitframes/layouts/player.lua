local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Player
--------------------------------------------------------------
do
	do
		G.UnitFrames.Player:SetBackdrop( nil )
		G.UnitFrames.Player:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Player.shadow:Kill()
		G.UnitFrames.Player.panel:Kill()
	end
--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.Player.Health:Size( 233, 30 )
		G.UnitFrames.Player.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Player.Health:SetFrameLevel( 5 )
		G.UnitFrames.Player.Health:CreateBackdrop("Default")
		G.UnitFrames.Player.Health.bg:SetVertexColor(.5, .5, .5)

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Player.Health.colorTapping = false
			G.UnitFrames.Player.Health.colorDisconnected = false
			G.UnitFrames.Player.Health.colorClass = false
			G.UnitFrames.Player.Health:SetStatusBarColor(unpack(C["unitframes"].healthcolor))
			G.UnitFrames.Player.Health.bg:SetTexture(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Player.Health.colorDisconnected = true
			G.UnitFrames.Player.Health.colorTapping = true
			G.UnitFrames.Player.Health.colorClass = true
			G.UnitFrames.Player.Health.colorReaction = true
		end

			G.UnitFrames.Player.Health.value = T.SetFontString( G.UnitFrames.Player.Health,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Player.Health.value:Point( "RIGHT", G.UnitFrames.Player.Health, "RIGHT", -4, 1 )
			G.UnitFrames.Player.Health.PostUpdate = T.PostUpdateHealth
	end
--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do
		G.UnitFrames.Player.Power:Size( 233, 5 )
		G.UnitFrames.Player.Power:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point( "TOPRIGHT", G.UnitFrames.Player.Health, "BOTTOMRIGHT", 0, -6 )
		G.UnitFrames.Player.Power:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Player.Power:CreateBackdrop("Default")
		
		G.UnitFrames.Player.Power.frequentUpdates = true
		G.UnitFrames.Player.Power.colorDisconnected = true
		G.UnitFrames.Player.Power.colorTapping = true
		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Player.Power.colorClass = true
		else
			G.UnitFrames.Player.Power.colorPower = true
		end
		
		G.UnitFrames.Player.Power.bg:SetAllPoints(power)
		G.UnitFrames.Player.Power.bg:SetTexture(normTex)
		G.UnitFrames.Player.Power.bg.multiplier = 0.3

		G.UnitFrames.Player.Power.value = T.SetFontString( G.UnitFrames.Player.Health, unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Player.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
		G.UnitFrames.Player.Power.PreUpdate = T.PreUpdatePower
		G.UnitFrames.Player.Power.PostUpdate = T.PostUpdatePower
	end
--------------------------------------------------------------
-- portraits
--------------------------------------------------------------
	do
		if C["unitframes"].charportrait == true and C["unitframes"].classicons == true then
			G.UnitFrames.Player.Portrait:SetAllPoints( G.UnitFrames.Player.Health )
			G.UnitFrames.Player.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Player.Portrait.SetAlpha = T.dummy
			G.UnitFrames.Player.Portrait:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() )
			G.UnitFrames.Player.Portrait.SetFrameLevel = T.dummy

			G.UnitFrames.Player.Health:ClearAllPoints()
			G.UnitFrames.Player.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.Health:SetPoint( "TOPRIGHT" )
		elseif C["unitframes"].charportrait == true and C["unitframes"].classicons ~= true then
			G.UnitFrames.Player.Portrait:ClearAllPoints()
			G.UnitFrames.Player.Portrait:CreateBackdrop("Default")
			G.UnitFrames.Player.Portrait:Size(40, 40)
			G.UnitFrames.Player.Portrait:Point("TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -7, 0)
			G.UnitFrames.Player.Health:SetPoint("TOPLEFT", 0, 0)
			G.UnitFrames.Player.Health:SetPoint("TOPRIGHT")
		end
	end
--------------------------------------------------------------
-- Vengeance bar
--------------------------------------------------------------
		if C.classbar.vengeance == true and T.Role == "Tank" then		
			G.UnitFrames.Player.VengeanceBar = CreateFrame("Frame", G.UnitFrames.Player:GetName().."_VengeanceBar", G.UnitFrames.Player)
			G.UnitFrames.Player.VengeanceBar:CreateBackdrop("Default")
			G.UnitFrames.Player.VengeanceBar:SetPoint("BOTTOMLEFT", G.UnitFrames.Player, "TOPLEFT", 0, 7)
			G.UnitFrames.Player.VengeanceBar:SetSize(233, 10)

			G.UnitFrames.Player.VengeanceBar.Bar = CreateFrame("StatusBar", nil, G.UnitFrames.Player.VengeanceBar)
			G.UnitFrames.Player.VengeanceBar.Bar:SetPoint("LEFT", G.UnitFrames.Player.VengeanceBar, "LEFT", 0, 0)
			G.UnitFrames.Player.VengeanceBar.Bar:SetSize(233, 10)
			G.UnitFrames.Player.VengeanceBar.Bar:SetStatusBarTexture(C.media.normTex)
			G.UnitFrames.Player.VengeanceBar.Bar:SetStatusBarColor(T.color.r, T.color.g, T.color.b)

			G.UnitFrames.Player.VengeanceBar.bg = G.UnitFrames.Player.VengeanceBar.Bar:CreateTexture(nil, "BORDER")
			G.UnitFrames.Player.VengeanceBar.bg:SetAllPoints()
			G.UnitFrames.Player.VengeanceBar.bg:SetTexture(C.media.normTex)
			G.UnitFrames.Player.VengeanceBar.bg:SetVertexColor(T.color.r, T.color.g, T.color.b, 0.2)

			G.UnitFrames.Player.VengeanceBar.Text = T.SetFontString(G.UnitFrames.Player.VengeanceBar.Bar, unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Player.VengeanceBar.Text:SetPoint("CENTER", G.UnitFrames.Player.VengeanceBar.Bar, "CENTER", 0, 0)
			G.UnitFrames.Player:EnableElement("VengeanceBar")
		end
--------------------------------------------------------------
-- classicons
--------------------------------------------------------------
	do
		if( C["unitframes"].classicons == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Player:GetName() .. "_ClassIconBorder", G.UnitFrames.Player )
			classicon:SetTemplate("Default")
			classicon:Size(44, 44)
			classicon:Point("TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -5, 2)
			local class = classicon:CreateTexture( G.UnitFrames.Player:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			G.UnitFrames.Player.ClassIcon = class

			G.UnitFrames.Player:EnableElement( "ClassIcon" )
		end
	end
	
	do
		local RaidDebuffs = CreateFrame('Frame', nil, G.UnitFrames.Player)
		RaidDebuffs:Height(44)
		RaidDebuffs:Width(44)
		RaidDebuffs:Point("TOPRIGHT", G.UnitFrames.Player.Health, "TOPLEFT", -5, 2)
		RaidDebuffs:SetFrameStrata(G.UnitFrames.Player.Health:GetFrameStrata())
		RaidDebuffs:SetFrameLevel(G.UnitFrames.Player.Health:GetFrameLevel() + 2)
		
		RaidDebuffs:SetTemplate("Default")
		
		RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, 'OVERLAY')
		RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
		RaidDebuffs.icon:Point("TOPLEFT", 2, -2)
		RaidDebuffs.icon:Point("BOTTOMRIGHT", -2, 2)
		
		RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
		RaidDebuffs.count:SetFont(C["media"].uffont, 14, "THINOUTLINE")
		RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
		RaidDebuffs.count:SetTextColor(1, .9, 0)
		
		RaidDebuffs:FontString('time', C["media"].uffont, 16, "THINOUTLINE")
		RaidDebuffs.time:SetPoint('CENTER')
		RaidDebuffs.time:SetTextColor(1, .9, 0)			
		G.UnitFrames.Player.RaidDebuffs = RaidDebuffs
		G.UnitFrames.Player:EnableElement("RaidDebuffs")
	end
	
		if C.unitframes.iconspvp == true then
			G.UnitFrames.Player.Status = T.SetFontString(G.UnitFrames.Player.Health, unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Player.Status:SetPoint("CENTER", G.UnitFrames.Player.Health, "CENTER", 0, 0)
			G.UnitFrames.Player.Status:SetTextColor(0.69, 0.31, 0.31)
			G.UnitFrames.Player.Status:Hide()
			G.UnitFrames.Player.Status.Override = T.dummy

			G.UnitFrames.Player.Status.Update = CreateFrame("Frame", nil, G.UnitFrames.Player)
			G.UnitFrames.Player.Status.Update:SetScript("OnUpdate", function(self, elapsed) T.UpdatePvPStatus(self:GetParent(), elapsed) end)

			G.UnitFrames.Player:SetScript("OnEnter", function(self) FlashInfo.ManaLevel:Hide() self.Status:Show() UnitFrame_OnEnter(self) end)
			G.UnitFrames.Player:SetScript("OnLeave", function(self) FlashInfo.ManaLevel:Show() self.Status:Hide() UnitFrame_OnLeave(self) end)
		end
--------------------------------------------------------------
-- combopoints
--------------------------------------------------------------	
		TukuiCombo:ClearAllPoints()
		TukuiCombo:SetPoint("CENTER", cbMover, "CENTER", 0, 0)
		TukuiCombo:Size( 233, 11)
		TukuiCombo:SetFrameStrata("LOW")
		TukuiCombo:CreateBackdrop("Default")
		for i = 1, 5  do
			
			if i == 1 then
				TukuiCombo[i]:Point("TOPLEFT", TukuiCombo, "BOTTOMLEFT", 1, 11)
				TukuiCombo[i]:Size(220/5, 11)
			else
				TukuiCombo[i]:Point("LEFT", TukuiCombo[i-1], "RIGHT", 3, 0)
				TukuiCombo[i]:Size(220/5, 11)
			end
		end
--------------------------------------------------------------
-- combat icon
--------------------------------------------------------------
	do
		G.UnitFrames.Player.Combat:Size( 19 )
		G.UnitFrames.Player.Combat:ClearAllPoints()
		G.UnitFrames.Player.Combat:SetPoint( "CENTER", 0, 0 )
		G.UnitFrames.Player.Combat:SetVertexColor( 0.69, 0.31, 0.31 )
	end
--------------------------------------------------------------
-- mana flash
--------------------------------------------------------------
	do
		G.UnitFrames.Player.FlashInfo:ClearAllPoints()
		G.UnitFrames.Player.FlashInfo:SetAllPoints( G.UnitFrames.Player.Health )
		G.UnitFrames.Player.FlashInfo:SetFrameLevel( G.UnitFrames.Player.Health:GetFrameLevel() + 2 )

		G.UnitFrames.Player.FlashInfo.ManaLevel:ClearAllPoints()
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetPoint( "CENTER", 0, 1 )
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont(unpack(T.Fonts.uGeneral.setfont) )
		
	end


--------------------------------------------------------------
-- combat feedback
--------------------------------------------------------------
	do
		if( C["unitframes"].combatfeedback == true ) then
			G.UnitFrames.Player.CombatFeedbackText:SetFont(unpack(T.Fonts.uGeneral.setfont))
		end
	end
--------------------------------------------------------------
-- druidmana
--------------------------------------------------------------
	do
		if( T.myclass == "DRUID" ) then
			G.UnitFrames.Player.DruidManaText:SetFont(unpack(T.Fonts.uGeneral.setfont))
		end
	end
--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
	do
		if C["unitframes"].unitcastbar == true then
			local cbaranchor = CreateFrame("Frame", "cbarMover", UIParent)
			if C["unitframes"].cbicons == true then
				cbaranchor:Size(C.castbar.playerwidth, T.Scale(C.castbar.playerheight))
				cbaranchor:Point("BOTTOM", G.ActionBars.Bar1, "TOP", 0, 5 )
			else
				cbaranchor:Size(C.castbar.playerwidth, T.Scale(C.castbar.playerheight))
				cbaranchor:Point("BOTTOM", G.ActionBars.Bar1, "TOP", 0, 5 )
			end
			cbaranchor:SetTemplate("Default")
			cbaranchor:SetBackdropBorderColor(1, 0, 0, 1)
			cbaranchor:SetFrameStrata("HIGH")
			cbaranchor:EnableMouse(true)
			cbaranchor:SetClampedToScreen(true)
			cbaranchor:SetMovable(true)
			cbaranchor:Hide()
			cbaranchor.text = T.SetFontString(cbaranchor, C.media.uffont, 12)
			cbaranchor.text:SetPoint("CENTER")
			cbaranchor.text:SetText("Move Castbar")
			tinsert(T.AllowFrameMoving, cbaranchor)
					
			G.UnitFrames.Player.Castbar:ClearAllPoints()
			G.UnitFrames.Player.Castbar:SetHeight(cbaranchor:GetHeight())
			G.UnitFrames.Player.Castbar:Point( "CENTER", cbaranchor, "CENTER", 14, 0 )
			G.UnitFrames.Player.Castbar:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames.Player.Castbar:CreateBackdrop("Default")
			G.UnitFrames.Player.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05, .2 )
			
			local Spark = G.UnitFrames.Player.Castbar:CreateTexture(nil, "OVERLAY")
			Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
			Spark:SetVertexColor(1, 1, 1)
			Spark:SetBlendMode("ADD")
			Spark:Width(14) 
			Spark:Height(G.UnitFrames.Player.Castbar:GetHeight() * 2)
			Spark:Point("LEFT", G.UnitFrames.Player.Castbar:GetStatusBarTexture(), "RIGHT", -6, 0)

			G.UnitFrames.Player.Castbar.Spark = Spark

			if( C["unitframes"].cbicons == true ) then
				G.UnitFrames.Player.Castbar:SetWidth(C.castbar.playerwidth-27)

				G.UnitFrames.Player.Castbar.button:ClearAllPoints()
				G.UnitFrames.Player.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Player.Castbar, "LEFT", -5, 0 )
				G.UnitFrames.Player.Castbar.button:Size( C.castbar.playerheight + 4)
			else
				G.UnitFrames.Player.Castbar:SetWidth(C.castbar.playerwidth)
			end

			G.UnitFrames.Player.Castbar.Time = T.SetFontString( G.UnitFrames.Player.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Player.Castbar.Time:Point( "RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 1 )
		
			G.UnitFrames.Player.Castbar.Text = T.SetFontString( G.UnitFrames.Player.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Player.Castbar.Text:Point( "LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 1 )

			if( C["unitframes"].cblatency == true ) then
				G.UnitFrames.Player.Castbar.SafeZone:SetTexture(C["media"].normTex)
				G.UnitFrames.Player.Castbar.SafeZone:SetVertexColor( 0.8, 0.2, 0.2, 0.75 )
				G.UnitFrames.Player.Castbar.SafeZone:SetBlendMode("ADD")
				
			end
		G.UnitFrames.Player.Castbar.CustomTimeText = T.CustomCastTimeText
	    G.UnitFrames.Player.Castbar.CustomDelayText = T.CustomCastDelayText
        G.UnitFrames.Player.Castbar.PostCastStart = T.PostCastStart
        G.UnitFrames.Player.Castbar.PostChannelStart = T.PostCastStart
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Player:Size( 233, 30 )
	end


end