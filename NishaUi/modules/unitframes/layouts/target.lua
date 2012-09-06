local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Target
--------------------------------------------------------------
do
	do
		G.UnitFrames.Target:SetBackdrop( nil )
		G.UnitFrames.Target:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Target.shadow:Kill()
		G.UnitFrames.Target.panel:Kill()
	end
--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.Target.Health:Size( 233, 30 )
		G.UnitFrames.Target.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Target.Health:SetFrameLevel(4)
		G.UnitFrames.Target.Health:CreateBackdrop("Default")
		G.UnitFrames.Target.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Target.Health.colorTapping = false
			G.UnitFrames.Target.Health.colorDisconnected = false
			G.UnitFrames.Target.Health.colorClass = false
			G.UnitFrames.Target.Health:SetStatusBarColor(.3, .3, .3, 1)
			G.UnitFrames.Target.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
			G.UnitFrames.Target.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Target.Health.colorDisconnected = true
			G.UnitFrames.Target.Health.colorTapping = true
			G.UnitFrames.Target.Health.colorClass = true
			G.UnitFrames.Target.Health.colorReaction = true
		end

		G.UnitFrames.Target.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Target.Name:ClearAllPoints()
		G.UnitFrames.Target.Name:SetPoint("LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1)
		G.UnitFrames.Target.Name:SetShadowOffset( 1.25, -1.25 )

		G.UnitFrames.Target.Health.value = T.SetFontString( G.UnitFrames.Target.Health,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Target.Health.value:Point( "RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1 )
		G.UnitFrames.Player.Health.PostUpdate = T.PostUpdateHealth
	end
--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do
		G.UnitFrames.Target.Power:Size( 233, 5 )
		G.UnitFrames.Target.Power:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point( "TOPRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 0, -5 )
		G.UnitFrames.Target.Power:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Target.Power:CreateBackdrop("Default")

		G.UnitFrames.Target.Power.value = T.SetFontString( G.UnitFrames.Target.Health,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Target.Power.value:Point( "LEFT", G.UnitFrames.Player.Health, "LEFT", 4, 1 )
		G.UnitFrames.Player.Power.PreUpdate = T.PreUpdatePower
		G.UnitFrames.Player.Power.PostUpdate = T.PostUpdatePower
	end
	
--------------------------------------------------------------
-- portraits
--------------------------------------------------------------
	do	
		if C["unitframes"].charportrait == true and C["unitframes"].classicons == true then
			G.UnitFrames.Target.Portrait:ClearAllPoints()
			G.UnitFrames.Target.Portrait:SetAllPoints( G.UnitFrames.Target.Health )
			G.UnitFrames.Target.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Target.Portrait.SetAlpha = T.dummy
			G.UnitFrames.Target.Portrait:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel() )
			G.UnitFrames.Target.Health:ClearAllPoints()
			G.UnitFrames.Target.Health:SetPoint("TOPLEFT", 0, 0)
			G.UnitFrames.Target.Health:SetPoint("TOPRIGHT")
		elseif C["unitframes"].charportrait == true and C["unitframes"].classicons ~= true then
			G.UnitFrames.Target.Portrait:ClearAllPoints()
			G.UnitFrames.Target.Portrait:CreateBackdrop("Default")
			G.UnitFrames.Target.Portrait:Size(40, 40)
			G.UnitFrames.Target.Portrait:Point("TOPLEFT", G.UnitFrames.Target.Health, "TOPRIGHT", 7, 0)
			G.UnitFrames.Target.Health:SetPoint("TOPLEFT", 0, 0)
			G.UnitFrames.Target.Health:SetPoint("TOPRIGHT")
		end
	end
--------------------------------------------------------------
-- classicons
--------------------------------------------------------------
	do
		if( C["unitframes"].classicons == true ) then
			local classicon = CreateFrame( "Frame", G.UnitFrames.Target:GetName() .. "_ClassIconBorder", G.UnitFrames.Target )
			classicon:SetTemplate("Default")
			classicon:Size(44, 44)
			classicon:Point("TOPLEFT", G.UnitFrames.Target.Health, "TOPRIGHT", 5, 2)
			local class = classicon:CreateTexture( G.UnitFrames.Target:GetName() .. "_ClassIcon", "ARTWORK" )
			class:Point( "TOPLEFT", 2, -2 )
			class:Point( "BOTTOMRIGHT", -2, 2 )
			G.UnitFrames.Target.ClassIcon = class

			G.UnitFrames.Target:EnableElement( "ClassIcon" )
		end
	end
--------------------------------------------------------------
-- combat feedback
--------------------------------------------------------------
	do
		if( C["unitframes"].combatfeedback == true ) then
			G.UnitFrames.Target.CombatFeedbackText:SetFont(unpack(T.Fonts.uGeneral.setfont))
		end
	end

--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
	do
		if( C["unitframes"].unitcastbar == true ) then
			local cbtaranchor = CreateFrame("Frame", "ctbarMover", UIParent)
			if C["unitframes"].cbicons == true then
				cbtaranchor:Size(C.castbar.targetwidth, T.Scale(C.castbar.targetheight))
				cbtaranchor:Point("TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -16 )
			else
				cbtaranchor:Size(C.castbar.targetwidth, T.Scale(C.castbar.targetheight))
				cbtaranchor:Point("TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -16 )
			end
			cbtaranchor:SetTemplate("Default")
			cbtaranchor:SetBackdropBorderColor(1, 0, 0, 1)
			cbtaranchor:SetFrameStrata("HIGH")
			cbtaranchor:EnableMouse(true)
			cbtaranchor:SetClampedToScreen(true)
			cbtaranchor:SetMovable(true)
			cbtaranchor:Hide()
			cbtaranchor.text = T.SetFontString(cbtaranchor, C.media.uffont, 12)
			cbtaranchor.text:SetPoint("CENTER")
			cbtaranchor.text:SetText("Move Target-Castbar")
			tinsert(T.AllowFrameMoving, cbtaranchor)
			
			G.UnitFrames.Target.Castbar:ClearAllPoints()
			G.UnitFrames.Target.Castbar:SetHeight(C.castbar.targetheight)
			G.UnitFrames.Target.Castbar:Point( "CENTER", cbtaranchor, "CENTER", 0, 0 )
			G.UnitFrames.Target.Castbar:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames.Target.Castbar:CreateBackdrop("Default")
			G.UnitFrames.Target.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			if( C["unitframes"].cbicons == true ) then
				G.UnitFrames.Target.Castbar:Width( C.castbar.targetwidth )

				G.UnitFrames.Target.Castbar.button:ClearAllPoints()
				G.UnitFrames.Target.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Target.Castbar, "LEFT", -5, 0 )
				G.UnitFrames.Target.Castbar.button:Size( C.castbar.targetheight + 4 )
			else
				G.UnitFrames.Target.Castbar:Width(C.castbar.targetwidth + 27 )
			end

			G.UnitFrames.Target.Castbar.PostCastStart = T.PostCastStart
			G.UnitFrames.Target.Castbar.PostChannelStart = T.PostCastStart

			G.UnitFrames.Target.Castbar.Time = T.SetFontString( G.UnitFrames.Target.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Target.Castbar.Time:Point( "RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 1 )

			G.UnitFrames.Target.Castbar.Text = T.SetFontString( G.UnitFrames.Target.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Target.Castbar.Text:Point( "LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 1 )
			
			G.UnitFrames.Player.Castbar.CustomTimeText = T.CustomCastTimeText
			G.UnitFrames.Player.Castbar.CustomDelayText = T.CustomCastDelayText

		end
	end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
	do
		if( C["unitframes"].targetauras == true ) then
			G.UnitFrames.Target.Debuffs:SetHeight( C.auras.debuffsize )
			G.UnitFrames.Target.Debuffs:SetWidth( 230 )
			G.UnitFrames.Target.Debuffs.size = C.auras.debuffsize
			G.UnitFrames.Target.Debuffs.num = 8
			G.UnitFrames.Target.Debuffs.spacing = 3

			G.UnitFrames.Target.Buffs:SetHeight( C.auras.buffsize )
			G.UnitFrames.Target.Buffs:SetWidth( 230 )
			G.UnitFrames.Target.Buffs.size = C.auras.buffsize
			G.UnitFrames.Target.Buffs.num = 8
			G.UnitFrames.Target.Buffs.spacing = 3

			G.UnitFrames.Target.Buffs:ClearAllPoints()
			G.UnitFrames.Target.Buffs:Point( "BOTTOMLEFT", G.UnitFrames.Target, "TOPLEFT", -2, 5 )
			G.UnitFrames.Target.Buffs.ClearAllPoints = T.dummy
			G.UnitFrames.Target.Buffs.SetPoint = T.dummy

			G.UnitFrames.Target.Debuffs:ClearAllPoints()
			G.UnitFrames.Target.Debuffs:Point( "BOTTOMRIGHT", G.UnitFrames.Target.Buffs, "TOPRIGHT", 7, 3 )
			G.UnitFrames.Target.Debuffs.ClearAllPoints = T.dummy
			G.UnitFrames.Target.Debuffs.SetPoint = T.dummy
			G.UnitFrames.Target.Debuffs.onlyShowPlayer = C.auras.onlyselfdebuffs
			G.UnitFrames.Target.Buffs.onlyShowPlayer = C.auras.onlyselfbuffs

			if( G.UnitFrames.Target.Buffs or G.UnitFrames.Target.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.Target.Buffs, G.UnitFrames.Target.Debuffs } ) do
					if( not frames ) then return end
				if G.UnitFrames.Target.DeBuffs then
					frames:Size( 230, C.auras.debuffsize )
					frames.size = C.auras.debuffsize
					frames.num = 8
				elseif G.UnitFrames.Target.buffs then
					frames:Size( 230, C.auras.buffsize )
					frames.size = C.auras.debuffsize
					frames.num = 8
				end
					hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
				end
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Target:Size( 233, 30 )
	end
end