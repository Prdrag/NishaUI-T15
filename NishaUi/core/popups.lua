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