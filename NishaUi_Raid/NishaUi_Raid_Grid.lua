local T, C, L, G = unpack( Tukui )
if C.unitframes.raid ~= true then return end

if C.unitframes.grid == true then
	--------------------------------------------------------------
	--Header
	--------------------------------------------------------------
	local width, height, showParty, showRaid, showPlayer, xOffset, yOffset, point, columnSpacing, columnAnchorPoint

		width = T.Scale( (C.chat.width/5)-6 )
		height = T.Scale( 30 )
		showParty = true
		showRaid = true
		showPlayer = true
		xOffset = T.Scale( 7 )
		yOffset = T.Scale( -5 )
		point = "LEFT"
		columnSpacing = T.Scale( 4 )
		columnAnchorPoint = "TOP"

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
			"initial-width", T.Scale( width ),
			"initial-height", T.Scale( height ),
			"showParty", true,
			"showRaid", true,
			"showPlayer", true,
			"showSolo", true,
			"xoffset", T.Scale( 6 ),
			"yOffset", T.Scale( -6 ),
			"point", point,
			"groupFilter", "1,2,3,4,5,6,7,8",
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"maxColumns", 8,
			"unitsPerColumn", 5,
			"columnSpacing", T.Scale( columnSpacing ),
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
			self.Power:Kill()
			self:SetFrameLevel(1)
			local color = RAID_CLASS_COLORS[T.myclass]
			self:HighlightUnit(color.r,color.g,color.b,1)
			
	--------------------------------------------------------------
	-- health
	--------------------------------------------------------------
			self.Health:ClearAllPoints()
			self.Health:SetAllPoints( self )
			self.Health:CreateBackdrop("Default")
			self.Health:SetFrameLevel(1)
			
			self.Health.value:Point( "CENTER", self.Health, 1, -8 )
			self.Health.value:SetFont(unpack(T.Fonts.uGeneral.setfont))
			self.Health.PostUpdate = T.PostUpdateHealthRaid
			self.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )
			if( C["raidframes"].unicolor == true ) then
				self.Health:SetStatusBarColor(.3, .3, .3, 1)
				self.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
				self.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))	
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
			
			local ReadyCheck = self.Health:CreateTexture(nil, "OVERLAY")
			ReadyCheck:Height(12*C["unitframes"].gridscale*T.raidscale)
			ReadyCheck:Width(12*C["unitframes"].gridscale*T.raidscale)
			ReadyCheck:SetPoint("CENTER", 0, -8) 	
			self.ReadyCheck = ReadyCheck

			-- Master looter
			self.MasterLooter = self.Health:CreateTexture(nil, "OVERLAY")
			self.MasterLooter:SetSize(12, 12)
			self.MasterLooter:SetPoint("TOPRIGHT", self.Health, 3, 8)
			
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
		if C.chat.background then
			raid:SetPoint("BOTTOMLEFT", TukuiChatBackgroundLeft, "TOPLEFT", 2, 5)
		else
			raid:SetPoint("BOTTOMLEFT", G.Panels.DataTextLeft, "TOPLEFT", 2, 150)
		end
	end )
end