local T, C, L, G = unpack(Tukui)

----------------------------------------------------------------------------------------
--	Test and move Blizzard Extra Action Button
----------------------------------------------------------------------------------------
SlashCmdList.TEST_EXTRABUTTON = function()
	if ExtraActionBarFrame:IsShown() then
		ExtraActionBarFrame:Hide()
	else
		ExtraActionBarFrame:Show()
		ExtraActionBarFrame:SetAlpha(1)
		ExtraActionButton1:Show()
		ExtraActionButton1:SetAlpha(1)
		ExtraActionButton1.icon:SetTexture("Interface\\Icons\\INV_Pet_DiseasedSquirrel")
		ExtraActionButton1.icon:Show()
		ExtraActionButton1.icon:SetAlpha(1)
	end
end
SLASH_TEST_EXTRABUTTON1 = "/xb"


-- switch to heal layout via a command
SLASH_TUKUIHEAL1 = "/heal"
SlashCmdList.TUKUIHEAL = function()
	DisableAddOn("NishaUi_Raid")
	EnableAddOn("NishaUi_Raid_Healing")
	ReloadUI()
end

-- switch to dps layout via a command
SLASH_TUKUIDPS1 = "/dps"
SlashCmdList.TUKUIDPS = function()
	DisableAddOn("NishaUi_Raid_Healing")
	EnableAddOn("NishaUi_Raid")
	ReloadUI()
end
SLASH_CLEARCOMBAT1 = "/clc"
SlashCmdList.CLEARCOMBAT = function() 
	CombatLogClearEntries() 
	print ("Combatlog cleared")
end
