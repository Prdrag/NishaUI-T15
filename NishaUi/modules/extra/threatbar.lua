local T, C, L, G = unpack( Tukui )

if C.nisha.threatbar then
G.Misc.ThreatBar:Kill()
	local aggroColors = {
		[1] = {12/255, 151/255,  15/255},
		[2] = {166/255, 171/255,  26/255},
		[3] = {163/255,  24/255,  24/255},
	}

	-- create the bar
	local TukuiThreatBar = CreateFrame("StatusBar", "TukuiThreatBar", UIParent)
	TukuiThreatBar:SetStatusBarTexture(C.media.blank)
	TukuiThreatBar:GetStatusBarTexture():SetHorizTile(false)
	TukuiThreatBar:SetBackdrop({bgFile = C.media.blank})
	TukuiThreatBar:SetBackdropColor(0, 0, 0, 0)
	TukuiThreatBar:SetMinMaxValues(0, 100)
	TukuiThreatBar:SetFrameLevel(2)
	TukuiThreatBar:SetOrientation("VERTICAL")

	local TukuiThreatBarBG = CreateFrame("Frame", nil, TukuiThreatBar)
	TukuiThreatBarBG:SetTemplate("Default")
	TukuiThreatBarBG:SetFrameLevel(0)
	TukuiThreatBarBG:Size(10, 5)
	TukuiThreatBarBG:Point("TOPRIGHT", G.Panels.RightChatBackground, "TOPLEFT", -3, 0)
	TukuiThreatBarBG:Point("BOTTOMRIGHT", G.Panels.RightChatBackground, "BOTTOMLEFT", -3, 0)

	-- TukuiThreatBar.text = T.SetFontString(TukuiThreatBar, C.media.font, 12)
	-- TukuiThreatBar.text:Point("CENTER", TukuiThreatBar, "CENTER", 0, 0)

	TukuiThreatBar:Point("TOPLEFT", TukuiThreatBarBG, 2, -2)
	TukuiThreatBar:Point("BOTTOMRIGHT", TukuiThreatBarBG, -2, 2)

	-- event func
	local function OnEvent(self, event, ...)
		local party = GetNumGroupMembers()
		local raid = GetNumGroupMembers()
		local pet = select(1, HasPetUI())
		if event == "PLAYER_ENTERING_WORLD" then
			self:Hide() -- hide
			self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		elseif event == "PLAYER_REGEN_ENABLED" then
			self:Hide() -- hide
		elseif event == "PLAYER_REGEN_DISABLED" then
			if party > 0 or raid > 0 or pet == 1 then
				self:Show()
			else
				self:Hide() -- hide
			end
		else
			if (InCombatLockdown()) and (party > 0 or raid > 0 or pet == 1) then
				self:Show()
			else
				self:Hide() -- hide
			end
		end
	end

	local function OnUpdate(self, event, unit)
		if UnitAffectingCombat(self.unit) then
			local _, _, threatpct, rawthreatpct, _ = UnitDetailedThreatSituation(self.unit, self.tar)
			local threatval = threatpct or 0
			
			self:SetValue(threatval)
			-- self.text:SetFormattedText("%3.1f", threatval)
			
			local r, g, b = oUFTukui.ColorGradient(threatval,100, 0,.8,0,.8,.8,0,.8,0,0)
			self:SetStatusBarColor(r, g, b)
			
			if threatval > 0 then
				self:SetAlpha(1)
			else
				self:SetAlpha(0) -- 0
			end		
		end
	end

	TukuiThreatBar:RegisterEvent("PLAYER_ENTERING_WORLD")
	TukuiThreatBar:RegisterEvent("PLAYER_REGEN_ENABLED")
	TukuiThreatBar:RegisterEvent("PLAYER_REGEN_DISABLED")
	TukuiThreatBar:SetScript("OnEvent", OnEvent)
	TukuiThreatBar:SetScript("OnUpdate", OnUpdate)
	TukuiThreatBar.unit = "player"
	TukuiThreatBar.tar = TukuiThreatBar.unit.."target"
	TukuiThreatBar.Colors = aggroColors
	TukuiThreatBar:SetAlpha(0)
end