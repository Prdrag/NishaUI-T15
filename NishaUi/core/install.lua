local T, C, L, G = unpack( Tukui )
local color = RAID_CLASS_COLORS[T.myclass]
local cStart = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)

-------------------------------------------
-- move anchors
-------------------------------------------
if C.loot.lootframe == true then
	TukuiRollAnchor:ClearAllPoints()
	TukuiRollAnchor:Point("CENTER", UIParent, "CENTER", 0, 50)
end

local function NishaUICVars()
	SetCVar( "Maxfps", 999 )
	SetCVar( "autoDismountFlying", 0 )
	SetCVar( "guildMemberNotify", 1 )
	SetCVar( "chatBubblesParty", 1 )
	SetCVar( "chatBubbles", 1 )
	SetCVar( "cameraDistanceMax", 50 )
	SetCVar( "cameraDistanceMaxFactor", 3.4 )
	SetCVar("profanityFilter", 0)
	SetCVar("taintLog", 1)
	-- SetAutoDeclineGuildInvites(1)
	SetCVar("showTutorials", 0)
	SetCVar("gameTip", "0")
	SetCVar("ConversationMode", "inline")
	SetCVar("WhisperMode", "inline")
	SetCVar("BnWhisperMode", "inline")
	SetCVar("nameplateShowFriends", 0)
	SetCVar("nameplateShowFriendlyPets", 0)
	SetCVar("nameplateShowFriendlyGuardians", 0)
	SetCVar("nameplateShowFriendlyTotems", 0)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowEnemyPets", 0)
	SetCVar("nameplateShowEnemyGuardians", 0)
	SetCVar("nameplateShowEnemyTotems", 0)
	SetCVar("lootUnderMouse", 1)
end

G.Install.Frame:SetTemplate("Transparent")
G.Install.StatusBar:SetStatusBarTexture(C["media"].normTex)

local viconl = CreateFrame("Frame", "NinjaPullVersion", G.Install.Frame)
viconl:SetTemplate("Transparent")
viconl:Size(64, 64)
viconl:Point("BOTTOMRIGHT", G.Install.Frame, "TOPRIGHT", 0, 2)
viconl:SetFrameStrata("HIGH")
viconl:CreateShadow("Default")

viconl.bg = viconl:CreateTexture(nil, "ARTWORK")
viconl.bg:Point("TOPLEFT", 2, -2)
viconl.bg:Point("BOTTOMRIGHT", -2, 2)
viconl.bg:SetTexture(C["media"].pulse)

local viconr = CreateFrame("Frame", "NinjaPullVersion", G.Install.Frame)
viconr:SetTemplate("Transparent")
viconr:Size(64, 64)
viconr:Point("BOTTOMLEFT", G.Install.Frame, "TOPLEFT", 0, 2)
viconr:SetFrameStrata("HIGH")
viconr:CreateShadow("Default")

viconr.bg = viconr:CreateTexture(nil, "ARTWORK")
viconr.bg:Point("TOPLEFT", 2, -2)
viconr.bg:Point("BOTTOMRIGHT", -2, 2)
viconr.bg:SetTexture(C["media"].pulse)

local title = CreateFrame("Frame", "InstallTitle", G.Install.Frame)
title:SetTemplate("Transparent")
title:Size(G.Install.Frame:GetWidth() - 130, 30)
title:Point("BOTTOM", G.Install.Frame, "TOP", 0, 2)
title:SetFrameStrata("HIGH")
title:CreateShadow("Default")

local name = title:CreateFontString(nil, "OVERLAY")
name:SetFont(C.media.font, 12, "OUTLINE")
name:SetPoint("CENTER", title, 0, 0)
name:SetText("|cffc41f3bPulse|rUI")

local UIOnLogon = CreateFrame( "Frame" )
UIOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
UIOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )
	print(L.hello ..cStart .. T.myname.. L.hello2 ..cStart .. L.hello3 ..cStart .. L.hello4)
	if( TukuiSaved == nil ) then
		TukuiSaved = {}
		TukuiSaved = {
			["bottomrows"] = 2,
			["rightbars"] = 1,
			["splitbars"] = false,
			["actionbarsLocked"] = false,
		}
		NishaUICVars()
	end
	
	if (IsAddOnLoaded("NishaUi_Raid") and IsAddOnLoaded("NishaUi_Raid_Healing")) then
		StaticPopup_Show("NISHAUIDISABLE_RAID")
	end
end )