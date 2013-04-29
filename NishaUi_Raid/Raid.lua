local T, C, L, G = unpack( Tukui )
if C.unitframes.raid ~= true then return end
if C.unitframes.grid ~= true then
	T.PostUpdateRaidUnit = function( self )
		self.panel:Kill()
		self.Health:Kill()
		self.Health.bg:Kill()
		self.Power:Kill()
		self.Power.bg:Kill()
		return self
	end

	local ADDON_NAME, ns = ...
	local oUF = oUFTukui or oUF
	assert(oUF, "NishaUI was unable to locate oUF install.")

	ns._Objects = {}
	ns._Headers = {}

	local backdrop = {
		bgFile = C["media"].blank,
		insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult},
		}

	local function Shared(self, unit)
		self.colors = T.oUF_colors
		self:RegisterForClicks("AnyUp")
		self:SetScript('OnEnter', UnitFrame_OnEnter)
		self:SetScript('OnLeave', UnitFrame_OnLeave)
		
		self.menu = T.SpawnMenu
		
		local t = CreateFrame("Frame", nil, self)
		t:SetTemplate("Default")
		t:Width(120)
		t:Height(20)
		t:Point("CENTER", self)
		t:SetFrameLevel(0)
		self.t = t		

		local health = CreateFrame('StatusBar', nil, self)
		health:SetFrameLevel(t:GetFrameLevel() + 1)
		health:SetFrameStrata(t:GetFrameStrata())
		health:Point("TOPLEFT", t, 2, -2)
		health:Point("BOTTOMRIGHT", t, -2, 2)
		health:SetStatusBarTexture(C["media"].normTex)
		self.Health = health
		
		local healthBG = health:CreateTexture(nil, 'BORDER')
		healthBG:SetAllPoints()
		self.Health.bg = healthBG
		
		health.PostUpdate = T.PostUpdatePetColor
		health.frequentUpdates = true
		
		if C["unitframes"].showsmooth == true then
			health.Smooth = true
		end

		if C["unitframes"].unicolor == true then
			health.colorDisconnected = false
			health.colorClass = false
			health:SetStatusBarColor(unpack(C["unitframes"].healthcolor))
			healthBG:SetTexture(1, 1, 1)
			healthBG:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			healthBG:SetTexture(.1, .1, .1)
			health.colorDisconnected = true	
			health.colorClass = true
			health.colorReaction = true		
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


		local tt = CreateFrame("Frame", nil, self)
		tt:SetTemplate("Default")
		tt:Width(60)
		tt:Height(7)
		tt:Point("LEFT", t, "BOTTOMLEFT", 5, 0)
		tt:SetFrameLevel(health:GetFrameLevel() + 2)
		self.tt = tt

		local power = CreateFrame("StatusBar", nil, self)
		power:SetFrameLevel(health:GetFrameLevel() + 5)
		power:Height(3)
		power:Point("TOPLEFT", tt, "TOPLEFT", 2, -2)
		power:Point("BOTTOMRIGHT", tt, "BOTTOMRIGHT", -2, 2)
		power:SetStatusBarTexture(C["media"].normTex)
		self.Power = power
		
		local powerBG = power:CreateTexture(nil, "BORDER")
		powerBG:SetAllPoints()
		powerBG:SetTexture(C["media"].normTex)
		powerBG.multiplier = 0.3
		self.Power.bg = powerBG	

		power.frequentUpdates = true
		power.colorDisconnected = true

		if C["unitframes"].showsmooth == true then
			power.Smooth = true
		end

		if C["unitframes"].unicolor == true then
			power.colorClass = true
		else
			power.colorPower = true		
		end
		
		local name = health:CreateFontString(nil, 'OVERLAY')
		name:SetFont(unpack(T.Fonts.uName.setfont))
		name:Point("LEFT", t, "RIGHT", 4, 1)
		self:Tag(name, '[Tukui:getnamecolor][Tukui:namemedium][Tukui:dead][Tukui:afk]')
		self.Name = name
		
		if C["unitframes"].showsymbols == true then
			RaidIcon = health:CreateTexture(nil, 'OVERLAY')
			RaidIcon:Height(16)
			RaidIcon:Width(16)
			RaidIcon:SetPoint("CENTER", t, "TOP")
			RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\media\\textures\\raidicons.blp") -- thx hankthetank for texture
			self.RaidIcon = RaidIcon
		end
		
		if C["unitframes"].aggro == true then
			table.insert(self.__elements, T.UpdateThreat)
			self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
			self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
		end
		
		local LFDRole = health:CreateTexture(nil, "OVERLAY")
		LFDRole:Height(6)
		LFDRole:Width(6)
		LFDRole:Point("TOPLEFT", 2, -2)
		LFDRole:SetTexture("Interface\\AddOns\\Tukui\\media\\textures\\lfdicons.blp")
		self.LFDRole = LFDRole
		
		local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
		ReadyCheck:Height(12)
		ReadyCheck:Width(12)
		ReadyCheck:SetPoint('CENTER')
		self.ReadyCheck = ReadyCheck
		
		--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
		--picon:SetPoint('CENTER', self.Health)
		--picon:SetSize(16, 16)
		--picon:SetTexture[[Interface\AddOns\Tukui\media\textures\picon]]
		--picon.Override = T.Phasing
		--self.PhaseIcon = picon
		
		self.DebuffHighlightAlpha = 1
		self.DebuffHighlightBackdrop = true
		self.DebuffHighlightFilter = true
		
		if C["unitframes"].showrange == true then
			local range = {insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor}
			self.Range = range
		end

		return self
	end

	oUF:RegisterStyle("TukuiDpsPR10", Shared)
	oUF:Factory(function(self)
		oUF:SetActiveStyle("TukuiDpsPR10")

		local raid = self:SpawnHeader("oUF_TukuiDpsPR10", nil, "custom [@raid26,exists] hide;show", 
			'oUF-initialConfigFunction', [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute('initial-width'))
				self:SetHeight(header:GetAttribute('initial-height'))
			]],
			'initial-width', T.Scale(120),
			'initial-height', T.Scale(22),	
			"showParty", true, 
			"showRaid", true,
			"showSolo", true,
			"showPlayer", C["unitframes"].showplayerinparty, 
			"groupFilter", "1,2,3,4,5,6,7,8", 
			"groupingOrder", "1,2,3,4,5,6,7,8",
			"groupBy", "GROUP",
			"yOffset", T.Scale(-5)
		)
		raid:SetPoint('TOPLEFT', UIParent, 8, -320)
	end)
end