local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Focus
--------------------------------------------------------------
do
	do
		G.UnitFrames.Focus:SetBackdrop( nil )
		G.UnitFrames.Focus:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Focus.shadow:Kill()
	end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.Focus.Health:Size( 200, 26 )
		G.UnitFrames.Focus.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Focus.Health:SetFrameLevel( 5 )
		G.UnitFrames.Focus.Health:CreateBackdrop("Default")
		G.UnitFrames.Focus.Health.bg:SetVertexColor(.5, .5, .5)

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Focus.Health.colorTapping = false
			G.UnitFrames.Focus.Health.colorDisconnected = false
			G.UnitFrames.Focus.Health.colorClass = false
			G.UnitFrames.Focus.Health:SetStatusBarColor(unpack(C["unitframes"].healthcolor))
			G.UnitFrames.Focus.Health.bg:SetTexture(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Focus.Health.colorDisconnected = true
			G.UnitFrames.Focus.Health.colorTapping = true
			G.UnitFrames.Focus.Health.colorClass = true
			G.UnitFrames.Focus.Health.colorReaction = true
		end

		G.UnitFrames.Focus.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Focus.Name:SetShadowOffset( 1.25, -1.25 )
		G.UnitFrames.Focus.Health.value = T.SetFontString( G.UnitFrames.Focus.Health,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Focus.Health.value:Point( "LEFT", G.UnitFrames.Focus.Health, "LEFT", 4, 1 )
		G.UnitFrames.Focus.Health.PostUpdate = T.PostUpdateHealth
	end

--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do
		G.UnitFrames.Focus.Power:Size( 200, 5 )
		G.UnitFrames.Focus.Power:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Focus.Power:ClearAllPoints()
		G.UnitFrames.Focus.Power:Point( "TOPRIGHT", G.UnitFrames.Focus.Health, "BOTTOMRIGHT", 0, -5 )
		G.UnitFrames.Focus.Power:SetFrameLevel( G.UnitFrames.Focus.Health:GetFrameLevel() + 2 )
		G.UnitFrames.Focus.Power:CreateBackdrop("Default")
		G.UnitFrames.Focus.Power.value:SetFont(unpack(T.Fonts.uGeneral.setfont))
	end

--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
	do
		if( C["unitframes"].unitcastbar == true ) then
			G.UnitFrames.Focus.Castbar:ClearAllPoints()
			G.UnitFrames.Focus.Castbar:SetHeight( 20 )
			G.UnitFrames.Focus.Castbar:Point( "TOPLEFT", G.UnitFrames.Focus, "BOTTOMLEFT", 0, -16 )
			G.UnitFrames.Focus.Castbar:CreateBackdrop("Default")

			G.UnitFrames.Focus.Castbar.bg:Kill()

			G.UnitFrames.Focus.Castbar.bg = G.UnitFrames.Focus.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.Focus.Castbar.bg:SetAllPoints( G.UnitFrames.Focus.Castbar )
			G.UnitFrames.Focus.Castbar.bg:SetTexture( C["media"].normTex)
			G.UnitFrames.Focus.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			G.UnitFrames.Focus.Castbar.Time = T.SetFontString( G.UnitFrames.Focus.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Focus.Castbar.Time:Point( "RIGHT", G.UnitFrames.Focus.Castbar, "RIGHT", -4, 1 )

			G.UnitFrames.Focus.Castbar.Text = T.SetFontString( G.UnitFrames.Focus.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.Focus.Castbar.Text:Point( "LEFT", G.UnitFrames.Focus.Castbar, "LEFT", 4, 1 )

			G.UnitFrames.Focus.Castbar.PostCastStart = T.PostCastStart
			G.UnitFrames.Focus.Castbar.PostChannelStart = T.PostCastStart

			if( C["unitframes"].cbicons == true ) then
				G.UnitFrames.Focus.Castbar:Width( 173 )

				G.UnitFrames.Focus.Castbar.button:ClearAllPoints()
				G.UnitFrames.Focus.Castbar.button:SetPoint( "LEFT", G.UnitFrames.Focus.Castbar, "RIGHT", 5, 0 )
				G.UnitFrames.Focus.Castbar.button:Size( 24 )
			else
				G.UnitFrames.Focus.Castbar:Width( 200 )

				G.UnitFrames.Focus.Castbar.button:Kill()
			end
		end
	end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
	do
		G.UnitFrames.Focus.Debuffs:SetHeight( 30 )
		G.UnitFrames.Focus.Debuffs:SetWidth( 200 )
		G.UnitFrames.Focus.Debuffs.size = 30
		G.UnitFrames.Focus.Debuffs.num = 5
		G.UnitFrames.Focus.Debuffs.spacing = 3

		G.UnitFrames.Focus.Debuffs:ClearAllPoints()
		G.UnitFrames.Focus.Debuffs:Point( "LEFT", G.UnitFrames.Focus, "RIGHT", 5, 0 )
		G.UnitFrames.Focus.Debuffs.ClearAllPoints = T.dummy
		G.UnitFrames.Focus.Debuffs.SetPoint = T.dummy

		G.UnitFrames.Focus.Debuffs.initialAnchor = "LEFT"
		G.UnitFrames.Focus.Debuffs["growth-x"] = "RIGHT"

		if( G.UnitFrames.Focus.Debuffs ) then
			for _, frames in pairs( { G.UnitFrames.Focus.Debuffs } ) do
				if( not frames ) then return end

				frames:Size( 200, 30 )
				frames.size = 30
				frames.num = 5

				hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
			end
		end
	end

--------------------------------------------------------------
-- size
--------------------------------------------------------------
	do
		G.UnitFrames.Focus:Size( 200, 26 )
	end
end