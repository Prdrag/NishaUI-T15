local T, C, L, G = unpack( Tukui )

if IsAddOnLoaded("Stuf") or IsAddOnLoaded("PitBull4") or IsAddOnLoaded("ShadowedUnitFrames") then
	C.unitframes.enable = false
end

if IsAddOnLoaded("Grid") or IsAddOnLoaded("Grid2") or IsAddOnLoaded("HealBot") or IsAddOnLoaded("VuhDo") or IsAddOnLoaded("oUF_Freebgrid") then
	C.raidframe.raid = false
end

if IsAddOnLoaded("TidyPlates") or IsAddOnLoaded("Aloft") or IsAddOnLoaded("dNamePlates") or IsAddOnLoaded("caelNamePlates") then
	C.nameplate.enable = false
end

if IsAddOnLoaded("Dominos") or IsAddOnLoaded("Bartender4") or IsAddOnLoaded("RazerNaga") then
	C.actionbar.enable = false
end

if IsAddOnLoaded("DocsDebugRunes") then
	C.classbar.deathknight = false
end

if IsAddOnLoaded("Mapster") then
	C.map.enable = false
end

if IsAddOnLoaded("Prat-3.0") or IsAddOnLoaded("Chatter") then
	C.chat.enable = false
end

if IsAddOnLoaded("TipTac") or IsAddOnLoaded("FreebTip") or IsAddOnLoaded("bTooltip") or IsAddOnLoaded("PhoenixTooltip") or IsAddOnLoaded("Icetip") then
	C.tooltip.enable = false
end

if IsAddOnLoaded("Omen") or IsAddOnLoaded("sThreatMeter2") or IsAddOnLoaded("SkadaThreat") or IsAddOnLoaded("RecountThreat") then
	C.pulse.threatbar = false
end

if IsAddOnLoaded("DBM-SpellTimers") or IsAddOnLoaded("alRaidCD") then
	C.pulse.raidcd = false
end

if IsAddOnLoaded("TipTacTalents") then
	C.tooltip.talent = false
end

if IsAddOnLoaded("AdiBags") or IsAddOnLoaded("ArkInventory") or IsAddOnLoaded("cargBags_Nivaya") or IsAddOnLoaded("cargBags") or IsAddOnLoaded("Bagnon") or IsAddOnLoaded("Combuctor") or IsAddOnLoaded("TBag") then
	C.bag.enable = false
end

if IsAddOnLoaded("MikScrollingBattleText") or IsAddOnLoaded("Parrot") or IsAddOnLoaded("xCT") or IsAddOnLoaded("sct") then
	C.combattext.enable = false
end

if IsAddOnLoaded("Clique") or IsAddOnLoaded("sBinder") then
	C.pulse.click2cast = false
end