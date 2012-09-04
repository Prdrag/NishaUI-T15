local T, C, L, G = unpack( Tukui )
--------------------------------------------------------------
--Header
--------------------------------------------------------------
local width, height, showParty, showRaid, showPlayer, xOffset, yOffset, point, columnSpacing, columnAnchorPoint

	if C.unitframes.gridvertical then
		point = "TOP"
		columnAnchorPoint = "LEFT"
		pa1, pa2, px, py = "TOPLEFT", "TOPRIGHT", 3, 0
	else
		point = "LEFT"
		columnAnchorPoint = "TOP"
		pa1, pa2, px, py = "TOPLEFT", "BOTTOMLEFT", 0, -3
	end
	
	width = T.Scale( C.raidframes.width * T.raidscale )
	height = T.Scale( C.raidframes.height * T.raidscale )	

	T.RaidFrameAttributes = function()
		return
		"TukuiRaid",
		nil,
		"custom [petbattle] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth( header:GetAttribute( "initial-width" ) )
			self:SetHeight( header:GetAttribute( "initial-height" ) )
		]],
		"initial-width", T.Scale( width * C["raidframes"].gridscale * T.raidscale ),
		"initial-height", T.Scale( height * C["raidframes"].gridscale * T.raidscale ),
		"showParty", true,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", true,
		"xoffset", T.Scale(7),
		"yOffset", T.Scale(-7),
		"point", point,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", T.Scale(3),
		"columnAnchorPoint", columnAnchorPoint
	end

T.PostUpdateRaidUnit = function( self )
		self.panel:Kill()
		local panel = CreateFrame("Frame", nil, self)
		panel:SetTemplate()
		panel:Point("TOPRIGHT", self, "TOPRIGHT", 2, 2)
		panel:Point("BOTTOMLEFT", self, "BOTTOMLEFT", -2, -2)
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		self.panel = panel
		
		self:SetBackdropColor( 0.0, 0.0, 0.0, 0.0 )
		
		self:SetFrameLevel(1)
		local color = RAID_CLASS_COLORS[T.myclass]
		self:HighlightUnit(color.r,color.g,color.b,1)

--------------------------------------------------------------
-- health
--------------------------------------------------------------
		self.Health:ClearAllPoints()
		if C.raidframes.powerbars then
			self.Health:SetPoint("TOPLEFT")
			self.Health:SetPoint("TOPRIGHT")
			self.Health:Height(C.raidframes.height-8)
		else
			self.Health:SetAllPoints( self )
			self.Health:CreateBackdrop("Default")
		end
		self.Health:SetFrameLevel(1)
		if C.raidframes.powerbars then
			self.Power:ClearAllPoints()
			self.Power:Point("TOPLEFT", self.Health, "BOTTOMLEFT", 1, -3)
			self.Power:Point("TOPRIGHT", self.Health, "BOTTOMRIGHT", -1, -3)
			self.Power:SetFrameLevel(2)
			self.Power:CreateBackdrop("Default")
		else
			self.Power:Kill()
		end
		
		self.Health.value:Point( "CENTER", self.Health, 1, -8 )
		self.Health.value:SetFont(unpack(T.Fonts.uGeneral.setfont))
		self.Health.PostUpdate = T.PostUpdateHealthRaid
		self.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )
		
		if( C["raidframes"].unicolor == true ) then
			self.Health:SetStatusBarColor(.3, .3, .3, 1)
			self.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
			if C["unitframes"].gradienthealth ~= true then
				self.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))	
			else
				self.Health.bg:SetVertexColor(T.cStart)
			end
		end
		
	if( C["unitframes"].gradienthealth == true and C["unitframes"].unicolor == true ) then
		self:HookScript( "OnEnter", function( self )
			if( not UnitIsConnected( self.unit ) or UnitIsDead( self.unit ) or UnitIsGhost( self.unit ) ) then return end
			local hover = RAID_CLASS_COLORS[select( 2, UnitClass( self.unit ) )]
			-- if( not hover ) then return end
			self.Health:SetStatusBarColor( hover.r, hover.g, hover.b )
			self.Health.classcolored = true
		end )

		self:HookScript( "OnLeave", function( self )
			if( not UnitIsConnected( self.unit ) or UnitIsDead( self.unit ) or UnitIsGhost( self.unit ) ) then return end
			local r, g, b = oUFTukui.ColorGradient( UnitHealth( self.unit ), UnitHealthMax( self.unit ), unpack( C["unitframes"].gradient ) )
			self.Health:SetStatusBarColor( r, g, b )
			self.Health.classcolored = false
		end )
	end

--------------------------------------------------------------
-- name
--------------------------------------------------------------
		self.Name:SetParent( self.Health )
		self.Name:ClearAllPoints()
		self.Name:SetPoint( "TOP", 0, 8 )
		self.Name:SetPoint( "BOTTOM" )
		self.Name:SetPoint( "LEFT", 4, 0 )
		self.Name:SetPoint( "RIGHT" )
		self.Name:SetShadowOffset( 1.25, -1.25 )
		self.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))

--------------------------------------------------------------
-- debuffs
--------------------------------------------------------------
		if C["unitframes"].raidunitdebuffwatch == true then
			self.RaidDebuffs:Kill()
			
			-- Raid Debuffs (big middle icon)
			local RaidDebuffs = CreateFrame('Frame', nil, self)
			RaidDebuffs:Height(24)
			RaidDebuffs:Width(24)
			RaidDebuffs:Point('CENTER', self.Health, 1,0)
			RaidDebuffs:SetFrameStrata(self.Health:GetFrameStrata())
			RaidDebuffs:SetFrameLevel(self.Health:GetFrameLevel() + 2)
			
			RaidDebuffs:SetTemplate("Default")
			
			RaidDebuffs.icon = RaidDebuffs:CreateTexture(nil, 'OVERLAY')
			RaidDebuffs.icon:SetTexCoord(.1,.9,.1,.9)
			RaidDebuffs.icon:Point("TOPLEFT", 2, -2)
			RaidDebuffs.icon:Point("BOTTOMRIGHT", -2, 2)
			
			RaidDebuffs.count = RaidDebuffs:CreateFontString(nil, 'OVERLAY')
			RaidDebuffs.count:SetFont(C["media"].uffont, 12, "THINOUTLINE")
			RaidDebuffs.count:SetPoint('BOTTOMRIGHT', RaidDebuffs, 'BOTTOMRIGHT', 0, 2)
			RaidDebuffs.count:SetTextColor(1, .9, 0)
			
			RaidDebuffs:FontString('time', C["media"].uffont, 12, "THINOUTLINE")
			RaidDebuffs.time:SetPoint('CENTER')
			RaidDebuffs.time:SetTextColor(1, .9, 0)
			
			self.RaidDebuffs = RaidDebuffs
		end

--------------------------------------------------------------
-- icons
--------------------------------------------------------------
		local leader = self.Health:CreateTexture( nil, "OVERLAY" )
		leader:Height( 12 * T.raidscale )
		leader:Width( 12 * T.raidscale )
		leader:SetPoint( "TOPLEFT", 0, 6 )
		self.Leader = leader

		local LFDRole = self.Health:CreateTexture(nil, "OVERLAY")
		LFDRole:Height(15*T.raidscale)
		LFDRole:Width(15*T.raidscale)
		LFDRole:Point("TOPLEFT", 1, -1)
		LFDRole.Override = T.RoleIconUpdate
		self:RegisterEvent("UNIT_CONNECTION", T.RoleIconUpdate)
		self.LFDRole = LFDRole

		local MasterLooter = self.Health:CreateTexture( nil, "OVERLAY" )
		MasterLooter:Height( 12 * T.raidscale )
		MasterLooter:Width( 12 * T.raidscale )
		self.MasterLooter = MasterLooter
		self:RegisterEvent( "PARTY_LEADER_CHANGED", T.MLAnchorUpdate )
		self:RegisterEvent( "PARTY_MEMBERS_CHANGED", T.MLAnchorUpdate )

		local Resurrect = CreateFrame( "Frame", nil, self.Health )
		Resurrect:SetFrameLevel( self.Health:GetFrameLevel() + 1 )
		Resurrect:Size( 20 )
		Resurrect:SetPoint( "CENTER" )

		local ResurrectIcon = Resurrect:CreateTexture( nil, "OVERLAY" )
		ResurrectIcon:SetAllPoints()
		ResurrectIcon:SetDrawLayer( "OVERLAY", 7 )
		self.ResurrectIcon = ResurrectIcon
		
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
		
	if C["raidframes"].healcomm then
		local mhpb = CreateFrame('StatusBar', nil, self.Health)
		if C["unitframes"].gridhealthvertical then
			mhpb:SetOrientation("VERTICAL")
			mhpb:SetPoint('BOTTOM', self.Health:GetStatusBarTexture(), 'TOP', 0, 0)
			mhpb:Width(C.raidframes.width*T.raidscale)
			mhpb:Height(C.raidframes.height*T.raidscale)		
		else
			mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			mhpb:Width(C.raidframes.width*T.raidscale)
		end				
		mhpb:SetStatusBarTexture(C.media.normTex)
		mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)

		local ohpb = CreateFrame('StatusBar', nil, self.Health)
		if C["unitframes"].gridhealthvertical then
			ohpb:SetOrientation("VERTICAL")
			ohpb:SetPoint('BOTTOM', mhpb:GetStatusBarTexture(), 'TOP', 0, 0)
			ohpb:Width(C.raidframes.width*T.raidscale)
			ohpb:Height(C.raidframes.height*T.raidscale)
		else
			ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
			ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
			ohpb:Width(C.raidframes.width*T.raidscale)
		end
		ohpb:SetStatusBarTexture(C.media.normTex)
		ohpb:SetStatusBarColor(0, 1, 0, 0.25)

		self.HealPrediction = {
			myBar = mhpb,
			otherBar = ohpb,
			maxOverflow = 1,
		}
	end
end
--------------------------------------------------------------
local RaidPosition = CreateFrame( "Frame" )
RaidPosition:RegisterEvent( "PLAYER_LOGIN" )
RaidPosition:SetScript( "OnEvent", function( self, event )
	local raid = G.UnitFrames.RaidUnits
	if( C["unitframes"].showraidpets == true ) then
		local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end
	raid:ClearAllPoints()
	raid:SetPoint("BOTTOM", G.ActionBars.Bar1, "TOP", 0, 33)
end )