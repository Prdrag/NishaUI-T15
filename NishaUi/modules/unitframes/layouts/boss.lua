local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Boss
--------------------------------------------------------------

do
	for i = 1, MAX_BOSS_FRAMES do
		do
			G.UnitFrames["Boss" .. i]:SetBackdrop( nil )
			G.UnitFrames["Boss" .. i]:SetBackdropColor( 0, 0, 0 )
			G.UnitFrames["Boss" .. i].shadow:Kill()
		end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
		do
			G.UnitFrames["Boss" .. i].Health:Size( 200, 30 )
			G.UnitFrames["Boss" .. i].Health:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Boss" .. i].Health:SetFrameLevel( 5 )
			G.UnitFrames["Boss" .. i].Health:CreateBackdrop("Default")
			G.UnitFrames["Boss" .. i].Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

			if( C["unitframes"].unicolor == true ) then
				G.UnitFrames["Boss" .. i].Health.colorTapping = false
				G.UnitFrames["Boss" .. i].Health.colorDisconnected = false
				G.UnitFrames["Boss" .. i].Health.colorClass = false
				G.UnitFrames["Boss" .. i].Health:SetStatusBarColor(.3, .3, .3, 1)
				G.UnitFrames["Boss" .. i].Health.bg:SetTexture( 0.6, 0.6, 0.6 )
				G.UnitFrames["Boss" .. i].Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
			end

			G.UnitFrames["Boss" .. i].Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames["Boss" .. i].Name:SetShadowOffset( 1.25, -1.25 )
			G.UnitFrames["Boss" .. i].Name:Point( "CENTER", G.UnitFrames["Boss" .. i].Health, "CENTER", 0, 1 )

			G.UnitFrames["Boss" .. i].Health.value = T.SetFontString( G.UnitFrames["Boss" .. i].Health,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames["Boss" .. i].Health.value:Point( "RIGHT", G.UnitFrames["Boss" .. i].Health, "RIGHT", -4, 1 )
		end
--------------------------------------------------------------
-- power
--------------------------------------------------------------
		do
			G.UnitFrames["Boss" .. i].Power:Size( 200, 2 )
			G.UnitFrames["Boss" .. i].Power:SetStatusBarTexture(C["media"].normTex)
			G.UnitFrames["Boss" .. i].Power:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Power:Point( "TOPRIGHT", G.UnitFrames["Boss" .. i].Health, "BOTTOMRIGHT", 0, -7 )
			G.UnitFrames["Boss" .. i].Power:SetFrameLevel( G.UnitFrames["Boss" .. i].Health:GetFrameLevel() + 2 )
			G.UnitFrames["Boss" .. i].Power:CreateBackdrop("Default")

			G.UnitFrames["Boss" .. i].Power.value = T.SetFontString( G.UnitFrames["Boss" .. i].Health,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames["Boss" .. i].Power.value:Point( "LEFT", G.UnitFrames["Boss" .. i].Health, "LEFT", 4, 1 )
		end
--------------------------------------------------------------
-- castbar
---------------------------------------------------------------
		do
			if( C["unitframes"].unitcastbar == true ) then
				G.UnitFrames["Boss" .. i].Castbar:ClearAllPoints()
				G.UnitFrames["Boss" .. i].Castbar:SetHeight( 20 )
				G.UnitFrames["Boss" .. i].Castbar:Point( "TOPRIGHT", G.UnitFrames["Boss" .. i], "BOTTOMRIGHT", 0, -16 )
				G.UnitFrames["Boss" .. i].Castbar:CreateBackdrop("Default")

				G.UnitFrames["Boss" .. i].Castbar.bg:Kill()

				G.UnitFrames["Boss" .. i].Castbar.bg = G.UnitFrames["Boss" .. i].Castbar:CreateTexture( nil, "BORDER" )
				G.UnitFrames["Boss" .. i].Castbar.bg:SetAllPoints( G.UnitFrames["Boss" .. i].Castbar )
				G.UnitFrames["Boss" .. i].Castbar.bg:SetTexture( C["media"].normTex)
				G.UnitFrames["Boss" .. i].Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

				G.UnitFrames["Boss" .. i].Castbar.Time = T.SetFontString( G.UnitFrames["Boss" .. i].Castbar,unpack(T.Fonts.uGeneral.setfont))
				G.UnitFrames["Boss" .. i].Castbar.Time:Point( "RIGHT", G.UnitFrames["Boss" .. i].Castbar, "RIGHT", -4, 1 )

				G.UnitFrames["Boss" .. i].Castbar.Text = T.SetFontString( G.UnitFrames["Boss" .. i].Castbar,unpack(T.Fonts.uGeneral.setfont))
				G.UnitFrames["Boss" .. i].Castbar.Text:Point( "LEFT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", 4, 1 )

				G.UnitFrames["Boss" .. i].Castbar.PostCastStart = T.PostCastStart
				G.UnitFrames["Boss" .. i].Castbar.PostChannelStart = T.PostCastStart

				if( C["unitframes"].cbicons == true ) then
					G.UnitFrames["Boss" .. i].Castbar:Width( 173 )

					G.UnitFrames["Boss" .. i].Castbar.button:ClearAllPoints()
					G.UnitFrames["Boss" .. i].Castbar.button:SetPoint( "RIGHT", G.UnitFrames["Boss" .. i].Castbar, "LEFT", -5, 0 )
					G.UnitFrames["Boss" .. i].Castbar.button:Size( 24 )
				else
					G.UnitFrames["Boss" .. i].Castbar:Width( 200 )

					G.UnitFrames["Boss" .. i].Castbar.button:Kill()
				end
			end
		end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
		do
			G.UnitFrames["Boss" .. i].Debuffs:SetHeight( 30 )
			G.UnitFrames["Boss" .. i].Debuffs:SetWidth( 200 )
			G.UnitFrames["Boss" .. i].Debuffs.size = 30
			G.UnitFrames["Boss" .. i].Debuffs.num = 4
			G.UnitFrames["Boss" .. i].Debuffs.spacing = 3

			G.UnitFrames["Boss" .. i].Debuffs:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Debuffs:Point( "LEFT", G.UnitFrames["Boss" .. i], "RIGHT", 5, 0 )
			G.UnitFrames["Boss" .. i].Debuffs.ClearAllPoints = T.dummy
			G.UnitFrames["Boss" .. i].Debuffs.SetPoint = T.dummy

			G.UnitFrames["Boss" .. i].Buffs:SetHeight(30)
			G.UnitFrames["Boss" .. i].Buffs:SetWidth( 200 )
			G.UnitFrames["Boss" .. i].Buffs.size = 30
			G.UnitFrames["Boss" .. i].Buffs.num = 4
			G.UnitFrames["Boss" .. i].Buffs.spacing = 3

			G.UnitFrames["Boss" .. i].Buffs:ClearAllPoints()
			G.UnitFrames["Boss" .. i].Buffs:Point( "RIGHT", G.UnitFrames["Boss" .. i], "LEFT", -5, 0 )
			G.UnitFrames["Boss" .. i].Buffs.ClearAllPoints = T.dummy
			G.UnitFrames["Boss" .. i].Buffs.SetPoint = T.dummy

			G.UnitFrames["Boss" .. i].Debuffs.initialAnchor = "LEFT"
			G.UnitFrames["Boss" .. i].Debuffs["growth-x"] = "RIGHT"

			G.UnitFrames["Boss" .. i].Buffs.initialAnchor = "RIGHT"
			G.UnitFrames["Boss" .. i].Buffs["growth-x"] = "LEFT"
			
			-- an option to show only our debuffs on target
			G.UnitFrames["Boss" .. i].Debuffs.onlyShowPlayer = true

			if( G.UnitFrames["Boss" .. i].Debuffs or G.UnitFrames["Boss" .. i].Buffs ) then
				for _, frames in pairs( { G.UnitFrames["Boss" .. i].Debuffs, G.UnitFrames["Boss" .. i].Buffs } ) do
					if( not frames ) then return end

					frames:Size( 200, 32)
					frames.size = 32
					frames.num = 4
					
					hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
				end
			end
		end

--------------------------------------------------------------
-- altpowerbar
--------------------------------------------------------------
		do
			G.UnitFrames["Boss" .. i].AltPowerBar:SetStatusBarTexture(C["media"].normTex)
		end

		------------------------------
		-- size
		------------------------------
		do
			G.UnitFrames["Boss" .. i]:Size( 200, 30 )
		end
	end
end