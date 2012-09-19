local T, C, L, G = unpack(Tukui)

StaticPopupDialogs["NISHAUIDISABLE_RAID"] = {
	text = L.popup_2raidactive,
	button1 = "DPS - TANK",
	button2 = "HEAL",
	OnAccept = function() DisableAddOn("NishaUi_Raid_Healing") EnableAddOn("NishaUi_Raid") ReloadUI() end,
	OnCancel = function() EnableAddOn("NishaUi_Raid_Healing") DisableAddOn("NishaUi_Raid") ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,	
}

T.CreatePopup["DISABLED_TUKUI_NAMEPLATES"] = {
	question = L.Popups_disable_tukui_nameplates,
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["nameplate"] ) ) then
				TukuiConfigPublic["nameplate"] = {}
			end
			TukuiConfigPublic["nameplate"]["enable"] = false
			TukuiConfigPublic["nameplate"]["nishastyle"] = true
		end
		ReloadUI()
	end,
}