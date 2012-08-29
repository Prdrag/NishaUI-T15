local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Arena
--------------------------------------------------------------
do
	for i = 1, 5 do
		do
			G.UnitFrames["Arena" .. i]:SetBackdrop( nil )
			G.UnitFrames["Arena" .. i]:SetBackdropColor( 0, 0, 0 )
			G.UnitFrames["Arena" .. i].shadow:Kill()
		end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
		do
			G.UnitFrames["Arena" .. i].Health:Size( 200, 30 )
			G.UnitFrames["Arena" .. i].Health:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Arena" .. i].Health:SetFrameLevel( 5 )
			G.UnitFrames["Arena" .. i].Health:CreateBackdrop("Default")
			G.UnitFrames["Arena" .. i].Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

			if( C["unitframes"].unicolor == true ) then
				G.UnitFrames["Arena" .. i].Health.colorTapping = false
				G.UnitFrames["Arena" .. i].Health.colorDisconnected = false
				G.UnitFrames["Arena" .. i].Health.colorClass = false
				G.UnitFrames["Arena" .. i].Health:SetStatusBarColor(.3, .3, .3, 1)
				G.UnitFrames["Arena" .. i].Health.bg:SetTexture( 0.6, 0.6, 0.6 )
				G.UnitFrames["Arena" .. i].Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
			end

			G.UnitFrames["Arena" .. i].Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames["Arena" .. i].Name:SetShadowOffset( 1.25, -1.25 )
			G.UnitFrames["Arena" .. i].Name:Point( "CENTER", G.UnitFrames["Arena" .. i].Health, "CENTER", 0, 1 )
		end

--------------------------------------------------------------
-- power
--------------------------------------------------------------
		do
			G.UnitFrames["Arena" .. i].Power:Size( 200, 2 )
			G.UnitFrames["Arena" .. i].Power:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Arena" .. i].Power:ClearAllPoints()
			G.UnitFrames["Arena" .. i].Power:Point( "TOPRIGHT", G.UnitFrames["Arena" .. i].Health, "BOTTOMRIGHT", 0, -7 )
			G.UnitFrames["Arena" .. i].Power:SetFrameLevel( G.UnitFrames["Arena" .. i].Health:GetFrameLevel() + 2 )
			G.UnitFrames["Arena" .. i].Power:CreateBackdrop("Default")
		end

--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
		do
			if( C["unitframes"].unitcastbar == true ) then
				G.UnitFrames["Arena" .. i].Castbar:ClearAllPoints()
				G.UnitFrames["Arena" .. i].Castbar:SetHeight( 20 )
				G.UnitFrames["Arena" .. i].Castbar:Point( "TOPRIGHT", G.UnitFrames["Arena" .. i], "BOTTOMRIGHT", 0, -16 )
				G.UnitFrames["Arena" .. i].Castbar:CreateBackdrop("Default")

				G.UnitFrames["Arena" .. i].Castbar.bg:Kill()

				G.UnitFrames["Arena" .. i].Castbar.bg = G.UnitFrames["Arena" .. i].Castbar:CreateTexture( nil, "BORDER" )
				G.UnitFrames["Arena" .. i].Castbar.bg:SetAllPoints( G.UnitFrames["Arena" .. i].Castbar )
				G.UnitFrames["Arena" .. i].Castbar.bg:SetTexture( C["media"].normTex)
				G.UnitFrames["Arena" .. i].Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

				G.UnitFrames["Arena" .. i].Castbar.Time = T.SetFontString( G.UnitFrames["Arena" .. i].Castbar,unpack(T.Fonts.uGeneral.setfont))
				G.UnitFrames["Arena" .. i].Castbar.Time:Point( "RIGHT", G.UnitFrames["Arena" .. i].Castbar, "RIGHT", -4, 1 )

				G.UnitFrames["Arena" .. i].Castbar.Text = T.SetFontString( G.UnitFrames["Arena" .. i].Castbar,unpack(T.Fonts.uGeneral.setfont))
				G.UnitFrames["Arena" .. i].Castbar.Text:Point( "LEFT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", 4, 1 )

				G.UnitFrames["Arena" .. i].Castbar.PostCastStart = T.PostCastStart
				G.UnitFrames["Arena" .. i].Castbar.PostChannelStart = T.PostCastStart

				if( C["unitframes"].cbicons == true ) then
					G.UnitFrames["Arena" .. i].Castbar:Width( 173 )

					G.UnitFrames["Arena" .. i].Castbar.button:ClearAllPoints()
					G.UnitFrames["Arena" .. i].Castbar.button:SetPoint( "RIGHT", G.UnitFrames["Arena" .. i].Castbar, "LEFT", -5, 0 )
					G.UnitFrames["Arena" .. i].Castbar.button:Size( 24 )
				else
					G.UnitFrames["Arena" .. i].Castbar:Width( 200 )

					G.UnitFrames["Arena" .. i].Castbar.button:Kill()
				end
			end
		end
		
		do
			G.UnitFrames["Arena" .. i].PVPSpecIcon:ClearAllPoints()
			G.UnitFrames["Arena" .. i].PVPSpecIcon:Point( "LEFT", G.UnitFrames["Arena" .. i], "RIGHT", 5, 0 )
			G.UnitFrames["Arena" .. i].PVPSpecIcon:Size(30)
			G.UnitFrames["Arena" .. i].PVPSpecIcon:CreateShadow(nil)
		end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
		do
			G.UnitFrames["Arena" .. i].Debuffs:SetHeight( 30 )
			G.UnitFrames["Arena" .. i].Debuffs:SetWidth( 200 )
			G.UnitFrames["Arena" .. i].Debuffs.size = 30
			G.UnitFrames["Arena" .. i].Debuffs.num = 5
			G.UnitFrames["Arena" .. i].Debuffs.spacing = 3

			G.UnitFrames["Arena" .. i].Debuffs:ClearAllPoints()
			G.UnitFrames["Arena" .. i].Debuffs:Point( "LEFT", G.UnitFrames["Arena" .. i].PVPSpecIcon, "RIGHT", 5, 0 )
			G.UnitFrames["Arena" .. i].Debuffs.ClearAllPoints = T.dummy
			G.UnitFrames["Arena" .. i].Debuffs.SetPoint = T.dummy

			G.UnitFrames["Arena" .. i].Debuffs.initialAnchor = "LEFT"
			G.UnitFrames["Arena" .. i].Debuffs["growth-x"] = "RIGHT"

			if( G.UnitFrames["Arena" .. i].Debuffs ) then
				for _, frames in pairs( { G.UnitFrames["Arena" .. i].Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 200, 30 )
					frames.size = 28
					frames.num = 5

					hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
				end
			end
		end

--------------------------------------------------------------
-- trinket
--------------------------------------------------------------
		do
			G.UnitFrames["Arena" .. i].Trinket:ClearAllPoints()
			G.UnitFrames["Arena" .. i].Trinket:Point( "RIGHT", G.UnitFrames["Arena" .. i], "LEFT", -5, 0 )
			G.UnitFrames["Arena" .. i].Trinket:Size(30)
		end

			TukuiPrepArena1:CreateBackdrop("Default")
			TukuiPrepArena2:CreateBackdrop("Default")
			TukuiPrepArena3:CreateBackdrop("Default")
			TukuiPrepArena4:CreateBackdrop("Default")
			TukuiPrepArena5:CreateBackdrop("Default")

		------------------------------
		-- size
		------------------------------
		do
			G.UnitFrames["Arena" .. i]:Size( 200, 30 )
		end
	end
end