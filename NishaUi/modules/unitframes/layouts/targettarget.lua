local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Target of Target
--------------------------------------------------------------

do
	do
		if not T.lowversion then
			G.UnitFrames.TargetTarget:SetBackdrop( nil )
			G.UnitFrames.TargetTarget:SetBackdropColor( 0, 0, 0 )
			G.UnitFrames.TargetTarget.shadow:Kill()
			G.UnitFrames.TargetTarget.panel:Kill()
		end
	end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.TargetTarget.Health:Size( 130, 20 )
		G.UnitFrames.TargetTarget.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.TargetTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.TargetTarget.Health:CreateBackdrop("Default")
		G.UnitFrames.TargetTarget.Health.bg:SetVertexColor(.5, .5, .5)

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.TargetTarget.Health.colorTapping = false
			G.UnitFrames.TargetTarget.Health.colorDisconnected = false
			G.UnitFrames.TargetTarget.Health.colorClass = false
			G.UnitFrames.TargetTarget.Health:SetStatusBarColor(unpack(C["unitframes"].healthcolor))
			G.UnitFrames.TargetTarget.Health.bg:SetTexture(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.TargetTarget.Health.colorDisconnected = true
			G.UnitFrames.TargetTarget.Health.colorTapping = true
			G.UnitFrames.TargetTarget.Health.colorClass = true
			G.UnitFrames.TargetTarget.Health.colorReaction = true
		end

		G.UnitFrames.TargetTarget.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.TargetTarget.Name:SetShadowOffset( 1.25, -1.25 )
	end
--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do	
		local power = CreateFrame('StatusBar', nil, TukuiTargetTarget.Health)
		power:Point("TOPLEFT", G.UnitFrames.TargetTarget.Health, "BOTTOMLEFT", 0, -5)
		power:Point("TOPRIGHT", G.UnitFrames.TargetTarget.Health, "BOTTOMRIGHT", 0, -5)
		power:SetStatusBarTexture(unpack(T.Textures.statusBars))
		power:Height(5)


		local powerBG = power:CreateTexture(nil, 'BORDER')
		powerBG:SetAllPoints(power)
		powerBG:SetTexture(C["media"].normTex)
		powerBG.multiplier = 0.3
		
		power:CreateBackdrop("Default")
		power:CreateShadow()

		power.frequentUpdates = true
		power.colorDisconnected = true

		if( C["unitframes"].showsmooth == true ) then
			power.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			power.colorTapping = true
			power.colorClass = true
			power.colorReaction = true
			-- TargetTargetPowerBackground.multiplier = 0.1
		else
			power.colorPower = true
		end

		G.UnitFrames.TargetTarget.Power = power
		G.UnitFrames.TargetTarget.Power.bg = powerBG

		G.UnitFrames.TargetTarget:EnableElement( "Power" )
	end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
	do
	if not T.lowversion then
		if( C["unitframes"].totdebuffs == true ) then
			G.UnitFrames.TargetTarget.Debuffs:SetHeight( 25 )
			G.UnitFrames.TargetTarget.Debuffs:SetWidth( 130 )
			G.UnitFrames.TargetTarget.Debuffs.size = 25
			G.UnitFrames.TargetTarget.Debuffs.num = 3
			G.UnitFrames.TargetTarget.Debuffs.spacing = 3

			G.UnitFrames.TargetTarget.Debuffs:ClearAllPoints()
			G.UnitFrames.TargetTarget.Debuffs:Point( "RIGHT", G.UnitFrames.TargetTarget, "LEFT", -5, -3 )
			G.UnitFrames.TargetTarget.Debuffs.ClearAllPoints = T.dummy
			G.UnitFrames.TargetTarget.Debuffs.SetPoint = T.dummy

			G.UnitFrames.TargetTarget.Debuffs.initialAnchor = "RIGHT"
			G.UnitFrames.TargetTarget.Debuffs["growth-x"] = "LEFT"

			if( G.UnitFrames.TargetTarget.Debuffs ) then
				for _, frames in pairs( { G.UnitFrames.TargetTarget.Debuffs } ) do
					if( not frames ) then return end

					frames:Size( 130, 25 )
					frames.size = 25
					frames.num = 3

					hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
				end
			end
		end
	end
	end

	--------------------
	-- size
	--------------------
	do
		G.UnitFrames.TargetTarget:Size( 130, 20 )
	end
end