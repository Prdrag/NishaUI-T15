local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Pet
--------------------------------------------------------------

do
	do
		G.UnitFrames.Pet:SetBackdrop( nil )
		G.UnitFrames.Pet:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Pet.shadow:Kill()
		G.UnitFrames.Pet.panel:Kill()
	end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.Pet.Health:Size( 130, 20 )
		G.UnitFrames.Pet.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Pet.Health:SetFrameLevel( 5 )
		G.UnitFrames.Pet.Health:CreateBackdrop("Default")
		G.UnitFrames.Pet.Health.bg:SetTexture( 0.6, 0.6, 0.6 )

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Pet.Health.colorTapping = false
			G.UnitFrames.Pet.Health.colorDisconnected = false
			G.UnitFrames.Pet.Health.colorClass = false
			G.UnitFrames.Pet.Health:SetStatusBarColor(.3, .3, .3, 1)
			G.UnitFrames.Pet.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Pet.Health.colorDisconnected = true
			G.UnitFrames.Pet.Health.colorTapping = true
			G.UnitFrames.Pet.Health.colorClass = true
			G.UnitFrames.Pet.Health.colorReaction = true
		end

		G.UnitFrames.Pet.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Pet.Name:SetShadowOffset( 1.25, -1.25 )
	end

--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do
		G.UnitFrames.Pet.Power:Kill()
		local PetPower = CreateFrame( "StatusBar", nil, G.UnitFrames.Pet )
		PetPower:Size( 130, 4 )
		PetPower:Point( "TOP", G.UnitFrames.Pet.Health, "BOTTOM", 0, -5 )
		PetPower:SetStatusBarTexture(C["media"].normTex)
		PetPower:CreateBackdrop("Default")

		local PetPowerBackground = PetPower:CreateTexture( nil, "BORDER" )
		PetPowerBackground:SetAllPoints( PetPower )
		PetPowerBackground:SetTexture(C["media"].normTex)
		PetPowerBackground.multiplier = 0.1

		PetPower.frequentUpdates = true
		PetPower.colorDisconnected = true

		if( C["unitframes"].showsmooth == true ) then
			PetPower.Smooth = true
		end

		if( C["unitframes"].unicolor == true ) then
			PetPower.colorTapping = true
			PetPower.colorClass = true
			PetPower.colorReaction = true
			PetPowerBackground.multiplier = 0.1
		else
			PetPower.colorPower = true
		end

		G.UnitFrames.Pet.Power = PetPower
		G.UnitFrames.Pet.Power.bg = PetPowerBackground

		G.UnitFrames.Pet:EnableElement( "Power" )

	end
	
--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
	do
		if(C["unitframes"].unitcastbar == true) then
			G.UnitFrames.Pet.Castbar:ClearAllPoints()
			G.UnitFrames.Pet.Castbar:Point("TOPLEFT", G.UnitFrames.Pet.Health, 0, 0)
			G.UnitFrames.Pet.Castbar:Point("BOTTOMRIGHT", G.UnitFrames.Pet.Health, 0, 0)

		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Pet:Size( 130, 20 )
	end
end

--------------------------------------------------------------
-- Pet Target
--------------------------------------------------------------
do

end

