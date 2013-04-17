local T, C, L, G = unpack( Tukui )
if C.classbar.stagger == true then	
	local parent, ns = ...
	local oUF = ns.oUF or oUFTukui
	local tree = GetSpecialization()
	
	oUF.colors.Stagger = {.52, 1, .52, 1, .98, .22, 1, .42, .42}

	local staggerSpells = {
		[GetSpellInfo(124275)] = true,
		[GetSpellInfo(124274)] = true,
		[GetSpellInfo(124273)] = true,
	}
	---------------------------------------------------------
	--Stagger
	---------------------------------------------------------
	local ShortValue = function( v )
		if( v >= 1e6 ) then
			return ( "%.1fm" ):format( v / 1e6 ):gsub( "%.?0+([km])$", "%1" )
		elseif( v >= 1e3 or v <= -1e3 ) then
			return ( "%.1fk" ):format( v / 1e3 ):gsub( "%.?0+([km])$", "%1" )
		else
			return v
		end
	end
	
	local StaggerBG = CreateFrame("Frame", "StaggerBG",G.UnitFrames.Player.HarmonyBar)
	StaggerBG:Size( 237, 13 )
	StaggerBG:Point("TOPLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", -2, -23)
	StaggerBG:SetTemplate( "Default" )
	StaggerBG:Hide()
		
	local function builtstagger(self)
		local StaggerStatus = CreateFrame("StatusBar", "StaggerStatus", StaggerBG)
		StaggerStatus:SetStatusBarTexture(C["media"].normTex)
		StaggerStatus:SetFrameLevel(10)
		StaggerStatus:Point("TOPLEFT", StaggerBG, "TOPLEFT", 2, -2)
		StaggerStatus:Point("BOTTOMRIGHT", StaggerBG, "BOTTOMRIGHT", -2, 2)

		StaggerStatus.t = StaggerStatus:CreateFontString(nil, "OVERLAY")
		StaggerStatus.t:SetPoint("CENTER", 0, 0)
		StaggerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
		StaggerStatus.t:SetShadowOffset(0.5, -0.5)
		StaggerStatus.t:SetShadowColor(0,0,0)

		local function UpdateMaxValues(self)
			local stagger = self.Stagger
			if(stagger) then
				local maxhealth = UnitHealthMax("player");
				stagger:SetMinMaxValues(0, maxhealth);
			end
		end
				
		local t = 0
		StaggerStatus:SetScript("OnUpdate", function(self, elapsed)
			t = t + elapsed;
			if (t > 0.07) then
				local stagger = self.Stagger or self
				local curStagger = UnitStagger("player")
				local maxhealth = UnitHealthMax("player");
				local activeRegen = floor(curStagger)
				local _, maxStagger = stagger:GetMinMaxValues()
				StaggerStatus:SetMinMaxValues(0, maxhealth)
				
				StaggerStatus:SetValue((maxhealth-maxhealth) + curStagger)
				StaggerStatus.t:SetText(ShortValue(activeRegen))
				local r, g, b = oUF.ColorGradient(curStagger, maxStagger, unpack(oUF.colors.Stagger))
				StaggerStatus:SetStatusBarColor(r, g, b);
			end
		end)
	end
	
	local function enable(self)
		if T.Role == "Tank" then
			builtstagger()
			StaggerBG:Show()
		else
			StaggerBG:Hide()
		end
	end
	
	local frame = CreateFrame("Frame", nil, UiParent)
	frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
	frame:RegisterEvent("CHARACTER_POINTS_CHANGED")
	frame:SetScript("OnEvent", enable)
end