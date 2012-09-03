local T, C, L, G = unpack(Tukui)
if T.client ~= "deDE" then
	T.AnnounceSpells = {
		["Misdirection"] = "player",
		["Rebirth"] = "player",
		["Soulstone Resurrection"] = "player",
		
		-- Monk
		["Zen Meditation"] = "player", 
		["Fortifying Brew"] = "player",
		["Avert Harm"] = "player", 
		
		-- Deathknight
		["Anti-Magic Shell"] = "player", 
		["Vampiric Blood"] = "player",
		["Raise Ally"] = "player",
		["Icebound Fortitude"] = "player", 
		
		-- Paladin
		["Ardent Defender"] = "player",
		["Divine Protection"] = "player", 
		
		-- Warrior
		["Last Stand"] = "player",
		["Shield Wall"] = "player",
		["Rallying Cry"] = "player",
		["Skull Banner"] = "player",
		["Demoralizing Banner"] = "player",
		
		--Druid:
		["Might of Ursoc"] = "player",
		["Survival Instincts"] = "player",
		
		--["Power Infusion"] = "mouseover",
		--["Pain Suppression"] = "mouseover",
	}
else
	T.AnnounceSpells = {
		["Irreführung"] = "player",
		["Wiedergeburt"] = "player",
		["Seelensteinauferstehung"] = "player",
		
		-- Monk
		["Zenmeditation"] = "player", 
		["Stärkendes Gebräu"] = "player",
		["Schaden abwenden"] = "player", 
		
		-- Deathknight
		["Antimagische Hülle"] = "player", 
		["Vampirblut"] = "player",
		["Verbündeten erwecken"] = "player",
		["Eisige Gegenwehr"] = "player", 
		
		-- Paladin
		["Unermüdlicher Verteidiger"] = "player",
		["Göttlicher Schutz"] = "player", 
		
		-- Warrior
		["Letztes Gefecht"] = "player",
		["Schildwall"] = "player",
		["Schädelbanner"] = "player",
		["Anspornender Schrei"] = "player",
		
		--Druid:
		["Might of Ursoc"] = "player",
		["Überlebensinstinkte"] = "player",
		
		--["Power Infusion"] = "mouseover",
		--["Pain Suppression"] = "mouseover",
	}
end