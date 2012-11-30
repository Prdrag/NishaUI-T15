local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Position
--------------------------------------------------------------
local FramePositions = CreateFrame( "Frame" )
FramePositions:RegisterEvent( "PLAYER_ENTERING_WORLD" )
FramePositions:SetScript( "OnEvent", function( self, event, addon )
	G.UnitFrames.Player:ClearAllPoints()
	G.UnitFrames.Target:ClearAllPoints()
	G.UnitFrames.TargetTarget:ClearAllPoints()
	G.UnitFrames.Pet:ClearAllPoints()
	G.UnitFrames.Focus:ClearAllPoints()
	G.UnitFrames.FocusTarget:ClearAllPoints()
	if not T.lowversion then
		if IsAddOnLoaded("NishaUI_Raid") then
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -250 , 250 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 250 , 250 )
		elseif IsAddOnLoaded("NishaUI_Raid_Healing") then
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -359 , 350 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 359 , 350 )
		else
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -359 , 350 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 359 , 350 )
		end

		G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -49 )
		G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -49 )
		G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
		G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )
	else
		if IsAddOnLoaded("NishaUI_Raid") then
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -130 , 270 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 130 , 270 )
		elseif IsAddOnLoaded("NishaUI_Raid_Healing") then
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -359 , 350 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 359 , 350 )
		else
			G.UnitFrames.Player:SetPoint( "TOP", UIParent, "BOTTOM", -130 , 270 )
			G.UnitFrames.Target:SetPoint( "TOP", UIParent, "BOTTOM", 130 , 270 )
		end

		G.UnitFrames.TargetTarget:SetPoint( "TOPRIGHT", G.UnitFrames.Target, "BOTTOMRIGHT", 0, -49 )
		G.UnitFrames.Pet:SetPoint( "TOPLEFT", G.UnitFrames.Player, "BOTTOMLEFT", 0, -49 )
		G.UnitFrames.Focus:SetPoint( "TOP", UIParent, "BOTTOM", -450, 600 )
		G.UnitFrames.FocusTarget:SetPoint( "TOP", G.UnitFrames.Focus, "BOTTOM", 0 , -43 )
	end
	

	for i = 1, MAX_BOSS_FRAMES do
		G.UnitFrames["Boss" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 600 , 800 )
		else
			G.UnitFrames["Boss" .. i]:SetPoint( "TOP", G.UnitFrames["Boss" .. i - 1], "BOTTOM", 0, -43 )
		end
	end

	for i = 1, 5 do
		G.UnitFrames["Arena" .. i]:ClearAllPoints()
		if( i == 1 ) then
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", UIParent, "BOTTOM", 600 , 800 )
		else
			G.UnitFrames["Arena" .. i]:SetPoint( "TOP", G.UnitFrames["Arena" .. i - 1], "BOTTOM", 0, -43 )
		end
	end

end )