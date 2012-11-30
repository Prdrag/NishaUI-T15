local T, C, L, G = unpack( Tukui )

if IsAddOnLoaded("Grid") or IsAddOnLoaded("Grid2") or IsAddOnLoaded("HealBot") or IsAddOnLoaded("VuhDo") or IsAddOnLoaded("oUF_Freebgrid") then
	C.unitframes.raid = false
end

if IsAddOnLoaded("DocsDebugRunes") then
	C.classbar.deathknight = false
end

if IsAddOnLoaded("Omen") or IsAddOnLoaded("sThreatMeter2") or IsAddOnLoaded("SkadaThreat") or IsAddOnLoaded("RecountThreat") then
	C.nisha.threatbar = false
end

if IsAddOnLoaded("DBM-SpellTimers") or IsAddOnLoaded("alRaidCD") then
	C.nisha.raidcd = false
end

if IsAddOnLoaded("MikScrollingBattleText") or IsAddOnLoaded("Parrot") or IsAddOnLoaded("xCT") or IsAddOnLoaded("sct") then
	C.combattext.enable = false
end

if IsAddOnLoaded("Clique") or IsAddOnLoaded("sBinder") then
	C.nisha.click2cast = false
end