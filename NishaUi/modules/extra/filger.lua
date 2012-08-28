local T, C, L, G = unpack(Tukui)
if C.filger.enable ~= true then return end
local _, ns = ...

--[[
	
	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	
]]

ns.Filger_Settings = {
	configmode = C.filger.filgerconfig,
}


ns.Filger_Spells = {
		["MONK"] = { 
		{
			Name = "Monk Procs",
			Direction = C.filger.proccs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Combobreaker: Blackout-Kick
			{ spellID = 116768, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },				
			-- Combobreaker: Tigerpalm
			{ spellID = 118864, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },				
			-- Spinning Crane Kick
			{ spellID = 101546, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		
		{
			Name = "Buffs and Debuffs CC",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },
			
			-- Zensphere
			{ spellID = 124081, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tigereye Brew
			{ spellID = 125195, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tiger Power
			{ spellID = 125359, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shuffle
			{ spellID = 115307, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Guard 
			{ spellID = 118636, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guard
			{ spellID = 115295, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elusive Brew
			{ spellID = 128939, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dancing Steel
			{ spellID = 120032, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Windsong
			{ spellID = 104509, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fortifying Brew
			{ spellID = 120954, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Touch of Karma
			{spellID = 125174, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Avert Harm
			{spellID = 115213, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Diffuse Magic
			{spellID = 122783, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },

		},
		{
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },
			
			-- Xuen
			{ spellID = 123904, size = C.filger.iconsize, filter = "CD" },
			-- Touch Kharma
			{ spellID = 115288, size = C.filger.iconsize, filter = "CD" },			
			-- Risin Sun Kick
			{ spellID = 107428, size = C.filger.iconsize, filter = "CD" },			
			-- Keg Smash
			{ spellID = 121253, size = C.filger.iconsize, filter = "CD" },			
			-- Spear Hand Strike
			{ spellID = 116705, size = C.filger.iconsize, filter = "CD" },			
			-- Zen Meditation
			{ spellID = 115176, size = C.filger.iconsize, filter = "CD" },			
			-- Fortifying Brew
			{ spellID = 115203, size = C.filger.iconsize, filter = "CD" },			
			-- Fists of Fury
			{ spellID = 113656, size = C.filger.iconsize, filter = "CD" },
		},
		
		{
			Name = "Debuff",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerTargetDebuffs, "LEFT", 0, 0 },
			
			-- Risin Sun Kick
			{ spellID = 107428, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Dizzying Haze
			{ spellID = 123727, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Breath of Fire
			{ spellID = 123725, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
		}
	},
    ["DEATHKNIGHT"] = {  -------------------------------------------------------------------------------------------------------- Deathknight
		{
			Name = "Deathknight Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Killing Machine
			{ spellID = 51124, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Freezing Fog
			{ spellID = 59052, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Succor
			{ spellID = 101568, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },	
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },

			-- Bone Shield
			{ spellID = 49222, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Victory
			{ spellID = 102432, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			--Lichborne
			{ spellID = 49039, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Summon Gargoyle
			{ spellID = 49206, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Necrotic Strike
			{ spellID = 73975, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Plague
			{ spellID = 59879, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 59921, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = C.filger.cd,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },

			--Death Grip
			{ spellID = 49576, size = C.filger.iconsize, filter = "CD" },	
		},
        {		
			Name = "Pet",
			Direction = C.filger.pet,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerPetbuffs, "RIGHT", 0, 0 },
			
			--Shadow infusion
			{ spellID = 91342, size = C.filger.iconsize, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Dark Transformation
			{ spellID = 63560, size = C.filger.iconsize, unitId = "pet", caster = "player", filter = "BUFF" },
		},
	},
	["SHAMAN"] = { -------------------------------------------------------------------------------------------------------- Shaman
		{
			Name = "Shaman Procs",
			Direction = C.filger.procs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Maelstorm Weapon
			{ spellID = 53817, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- istic Rage
			{ spellID = 30823, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16246, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			-- { spellID = 51562, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Spiritswalkers Grace
			{ spellID = 79206, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Hex
			{ spellID = 51514, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Storm Strike
			{ spellID = 17364, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},
	 ["MAGE"] = { -------------------------------------------------------------------------------------------------------- Mage
		{
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },

			-- Water Elemental Freeze
			{ spellID = 33395, size = C.filger.iconsize, filter = "CD" },
			-- Blast Wave
			{ spellID = 11113, size = C.filger.iconsize, filter = "CD" },
			-- Mana shield
			{ spellID = 1463, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},	
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },
			
			-- Frostfire Bolt aka Glyph of Frostfire
			{ spellID = 44614, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			--Slow
			{ spellID = 31589, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			--Innervate
			{ spellID = 29166, size = C.filger.iconsize, unitId = "player", caster = "all", filter = "BUFF"},
			--Icy Veins
			{ spellID = 12472, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			--Frostbomb
			{ spellID = 112948, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Impact
			--MOP{ spellID = 64343, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Mage Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },
			
			--Brain Freeze
			{ spellID = 57761, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hot Streak
			--MOP{ spellID = 44448, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pyroblast!
			--MOP{ spellID = 92315, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			--Heating up
			{ spellID = 48107, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deep Freeze
			{ spellID = 44572, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			--Arcane Blast
			{ spellID = 30451, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "DEBUFF" },
			--Fingers Of Frost
            { spellID = 44544, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF"},
		},
	},
	["PRIEST"] = { -------------------------------------------------------------------------------------------------------- Priest
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },


			-- Prayer of Mending
			{ spellID = 41635, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },

			-- Mind Blast
			{ spellID = 8092, size = C.filger.iconsize, filter = "CD" },
		},	
	    {
			Name = "Priest Procs",
			Direction = C.filger.proccs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Surge of Light
			--MOP{ spellID = 88688, size = C.filger.iconsize, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			--MOP{ spellID = 63735, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Orb
			{ spellID = 77487, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			--MOP{ spellID = 81700, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81662, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dispersion
			{ spellID = 47585, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},	

		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Shackle undead
			{ spellID = 9484, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			--{ spellID = 589, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			--{ spellID = 2944, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			--{ spellID = 34914, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Prayer of Mending
			{ spellID = 41635, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit
			{ spellID = 47788, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression
			{ spellID = 33206, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield
			{ spellID = 17, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew
			{ spellID = 139, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
		},
	},
	["WARLOCK"] = { -------------------------------------------------------------------------------------------------------- Warlock
		{
			Name = "Warlock Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			--Devious Minds
			{ spellID = 70840, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 84254, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 117828, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- DS: Instability
			{ spellID = 113858, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- DS: Knowledge
			{ spellID = 113861, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 122355, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },
			
			-- Fear
			{ spellID = 5782, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadowburn
			{ spellID = 17877, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = {"RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Haunt
			{ spellID = 48181, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Corruption
			{ spellID = 172, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Agony
			{ spellID = 980, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },			
			-- Curse of Exhaustion
			{ spellID = 18223, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },	
			-- Seed of Corruption
			{ spellID = 27243, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Shadowflame
			{ spellID = 47960, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },	
		},
        {
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },

			-- SoulBurn
			{ spellID = 74434, size = C.filger.iconsize, filter = "CD" },
			-- Conflag
			{ spellID = 17962, size = C.filger.iconsize, filter = "CD" },
			-- DS:Instability
			{ spellID = 113858, size = C.filger.iconsize, filter = "CD" },
			-- Havoc
			{ spellID = 80240, size = C.filger.iconsize, filter = "CD" },
			-- Sacrificial Pact
			{ spellID = 108416, size = C.filger.iconsize, filter = "CD" },
			-- UR
			{ spellID = 104773, size = C.filger.iconsize, filter = "CD" },
			-- Dark Regeneration
			{ spellID = 108359, size = C.filger.iconsize, filter = "CD" },
			-- AV
			{ spellID = 108505, size = C.filger.iconsize, filter = "CD" },
			-- DS: Knowledge
			{ spellID = 113861, size = C.filger.iconsize,filter = "CD"},
			-- Hand of Gul'dan
			{ spellID = 105174, size = C.filger.iconsize, filter = "CD"},
		},
	},
	["DRUID"] = { -------------------------------------------------------------------------------------------------------- Druid
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },

			-- Lifebloom
			{ spellID = 33763, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation
			{ spellID = 774, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Regrowth
			{ spellID = 8936, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth
			{ spellID = 48438, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			
		},
		{
			Name = "Druid Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Eclipse (Lunar)
			{ spellID = 48518, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)
			{ spellID = 48517, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars
			{ spellID = 93400, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Savage Roar
			{ spellID = 52610, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Survival Instincts
			{ spellID = 61336, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tree of Life
			{ spellID = 33891, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16870, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, size = C.filger.iconsize, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin
			{ spellID = 22812, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Incarnation
			{ spellID = 102560, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nature's Vigil
			{ spellID = 124974, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Solar Empowerment
			{ spellID = 129633, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lunar Empowerment
			{ spellID = 129632, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Astral Empowerment
			{ spellID = 130238, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Celestial Alignment
			{ spellID = 112071, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Hibernate
			{ spellID = 2637, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone
			{ spellID = 33786, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire
			{ spellID = 8921, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunfire
			{ spellID = 93402, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Insect Swarm
			{ spellID = 5570, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rake
			{ spellID = 1822, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rip
			{ spellID = 1079, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Lacerate
			{ spellID = 33745, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pounce Bleed
			{ spellID = 9007, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mangle
			{ spellID = 33876, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Faerie Fire
			{ spellID = 770, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },

			-- Celestial Alignment
			{ spellID = 112071, size = C.filger.iconsize, filter = "CD" },
			-- Incarnation
			{ spellID = 102560, size = C.filger.iconsize, filter = "CD" },
			-- Nature's Vigil
			{ spellID = 124974, size = C.filger.iconsize, filter = "CD" },
			-- Force of Nature
			{ spellID = 33831, size = C.filger.iconsize, filter = "CD" },
		},
	},
	["HUNTER"] = { -------------------------------------------------------------------------------------------------------- Hunter
		{
			Name = "Hunter Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Lock and Load
			{ spellID = 56453, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			{ spellID = 6150, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot
			{ spellID = 53224, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rapid Fire
			{ spellID = 3045, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ready, Set, Aim
			{ spellID = 82925, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},	
        {		
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Wyvern Sting
			{ spellID = 19386, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Cooldown",
			Direction = C.filger.cd,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },
			
			-- Bad Manner
			{ spellID = 90337, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "CD" },
			-- Roar of Sacrifice
			{ spellID = 53480, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "CD" },
		},
	},
	["ROGUE"] = { -------------------------------------------------------------------------------------------------------- Rogue
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },

			-- Sprint
			{ spellID = 2983, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{ spellID = 58426, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Recuperate
			{ spellID = 73651, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- hemo bleed
			{ spellID = 16511, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Cheap shot
			{ spellID = 1833, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison
			{ spellID = 2818, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison
			{ spellID = 5760, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison
			{ spellID = 3409, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison
			--MOP{ spellID = 13218, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- garrote silence
			{ spellID = 1330, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},
	["PALADIN"] = { -------------------------------------------------------------------------------------------------------- Paladin
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },

			-- Beacon of Light -- player
			{ spellID = 53563, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Inquisition
			{ spellID = 84963, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Judgements of the Pure
			{ spellID = 53657, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 3,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Beacon of Light -- target
			{ spellID = 53563, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "BUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Fist of Justice
		    { spellID = 105593, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Seal of Truth Aka Censure
			{ spellID = 31803, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "Paladin Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Infusion of Light
			{ spellID = 54149, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Crusader
			--{ spellID = 94686, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Art of War
			{ spellID = 87138, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hand of Light 
			{ spellID = 90174, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = C.filger.cd,
			Interval = 10,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },
			
			-- judgement
			{ spellID = 20271, size = C.filger.iconsize, filter = "CD" },
			-- crusader strike
			{ spellID = 35395, size = C.filger.iconsize, filter = "CD" },	
			--exorzismus
			{ spellID = 879, size = C.filger.iconsize, filter = "CD" },		
			-- hammer of wtrath
			{ spellID = 24275, size = C.filger.iconsize, filter = "CD" },		
		},
	},
	["WARRIOR"] = {  -------------------------------------------------------------------------------------------------------- Warrior
		{
			Name = "Warrior Procs",
			Direction = C.filger.proccs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerProccs, "LEFT", 0, 0 },

			-- Sudden Death
			{ spellID = 52437, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slam!
			{ spellID = 46916, size = C.filger.iconsize, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sword and Board
			{ spellID = 50227, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Reserve
			{ spellID = 64568, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious
			{ spellID = 32216, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Victorious
			{ spellID = 125831, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
        {		
			Name = "Buffs and Debuffs",
			Direction = C.filger.buffs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerBuffs, "LEFT", 0, 0 },
			
			-- Last Stand
			{ spellID = 12975, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall
			{ spellID = 871, size = C.filger.iconsize, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "Buffs and Debuffs",
			Direction = C.filger.debuffs,
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", FilgerTargetDebuffs, "RIGHT", 0, 0 },

			-- Hamstring
			{ spellID = 1715, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, size = C.filger.iconsize, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Collosus Smash
			{ spellID = 86346, size = C.filger.iconsize, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "COOLDOWN",
			Direction = C.filger.cd,
			Interval = 10,
			Mode = "ICON",
			setPoint = { "LEFT", FilgerPlayerCD, "LEFT", 0, 0 },
			
			-- Recklesness
			{ spellID = 1719, size = C.filger.iconsize, filter = "CD" },
			-- Berserker rage
			{ spellID = 18499, size = C.filger.iconsize, filter = "CD" },	
			--Last Stand
			{ spellID = 12975, size = C.filger.iconsize, filter = "CD" },		
			-- Taunt
			{ spellID = 355, size = C.filger.iconsize, filter = "CD" },		
			-- Commanding Shout
			{ spellID = 469, size = C.filger.iconsize, filter = "CD" },	
           -- Heroic Leap			
			{ spellID = 6544, size = C.filger.iconsize, filter = "CD" },		
		},
    },
-----------------------------------------------------------------------------------------------------------------------
-- dont touch anything below or else ill ass rape you aight!
-----------------------------------------------------------------------------------------------------------------------	
	["ALL"] = {
		{
			Name = "PVPYOTAR",
			Direction = "RIGHT",
			Interval = 2,
			Mode = "ICON",
			setPoint = { "CENTER", FilgerPVEDebuffs , "CENTER", 0, 0 },
			
		-- Firelands	
		--Shannox
			-- Magma Rupture
			{ spellID = 99840, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crystal Prison Trap 
			{ spellID = 99837, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jagged Tear
			{ spellID = 99936, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Lord Rhyolith	
			-- Eruption
			{ spellID = 98492, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Alysrazor	
			-- Blazing Power
			{ spellID = 99461, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Alysra's Razor
			{ spellID = 100029, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Beth'tilac	
			-- The Widow's Kiss
			{ spellID = 99476, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate (Heroic)
			{ spellID = 99526, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Volatile Poison (Heroic)
			{ spellID = 99278, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Baleroc	
			-- Torment
			{ spellID = 99256, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tormented
			{ spellID = 99257, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blaze of Glory
			{ spellID = 99252, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Majordomo Staghelm	
			-- Searing Seeds
			{ spellID = 98450, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Orbs
			{ spellID = 98451, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Ragnaros	
			-- Blazing Heat
			{ spellID = 100460, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate
			{ spellID = 99849, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

--   INCOMPLETE, NEED LOTS OF TEST AND FEED BACK  -- 
-- Dragon Soul
		--Morchok
			-- Safe
			{ spellID = 103541, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Warning
			{ spellID = 103536, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Danger
			{ spellID = 103534, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crush Armor
			{ spellID = 33661, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warlord Zon'ozz
			-- Disrupting Shadows
			{ spellID = 103434, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Yor'sahj the Unsleeping
			-- Deep Corruption
			{ spellID = 103628, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Hagara the Stormbinder
			-- Frostflake
			{ spellID = 109325, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Target
			{ spellID = 105285, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Ice
			{ spellID = 105289, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Tomb
			{ spellID = 104451, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Storm
			{ spellID = 105465, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Watery Entrenchment
			{ spellID = 105259, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Ultraxion
			-- Looming Darkness
			{ spellID = 106498, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Burst
			{ spellID = 106415, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fading Light
			{ spellID = 109075, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gift of Life
			{ spellID = 105896, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of Dreams
			{ spellID = 105900, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Source of Magic
			{ spellID = 105903, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warmaster Blackhorn
			-- Sunder Armor
			{ spellID = 108043, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 108046, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Brutal Strike
			{ spellID = 107567, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Degeneration
			{ spellID = 107558, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Spine of Deathwing
			-- Searing Plasma
			{ spellID = 105479, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fiery Grip
			{ spellID = 105490, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Grasping Tendrils
			{ spellID = 105563, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Madness of Deathwing
			-- Degenerative Bite
			{ spellID = 105841, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blistering heat
			{ spellID = 105445, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Mists of Pandaria
			-- Sleight of Hand
			{ spellID = 118162, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Exhale
			{ spellID = 122760, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Exhale
			{ spellID = 122761, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Convert
			{ spellID = 122740, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Wind Step
			{ spellID = 123180, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Overwhelming Assault
			{ spellID = 123474, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Pheromones
			{ spellID = 122835, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pungency
			{ spellID = 123081, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Corrosive Resin Pool
			{ spellID = 122125, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Prison
			{ spellID = 121885, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Parasitic Growth
			{ spellID = 121949, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cobalt Mine Blast
			{ spellID = 116281, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Wildfire Spark
			{ spellID = 116784, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crossed Over
			{ spellID = 116161, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Fixate
			{ spellID = 118303, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Overcharged
			{ spellID = 117878, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Closed Circuit
			{ spellID = 117949, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devastating Arc
			{ spellID = 116835, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Focused Assault
			{ spellID = 116525, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Prison
			{ spellID = 117436, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Defiled Ground
			{ spellID = 118091, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Touch of Sha
			{ spellID = 117519, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Shadow Breath
			{ spellID = 122752, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Spray
			{ spellID = 123121, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },			
			-- Dread Spray
			{ spellID = 119985, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Penetrating Bolt
			{ spellID = 119086, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
}

local _, ns = ...
local f_s = ns.Filger_Settings;
local Filger_Spells = ns.Filger_Spells;

SpellActivationOverlayFrame:SetFrameStrata("BACKGROUND")
local class = select(2, UnitClass("player"))
local classcolor = RAID_CLASS_COLORS[class]
local active, bars = {}, {}
local MyUnits = {
	player = true,
	vehicle = true,
	pet = true,
}

local function OnUpdate(self, elapsed)
	local time = self.filter == "CD" and (self.expirationTime + self.duration - GetTime()) or (self.expirationTime - GetTime())
	if self:GetParent().Mode == "BAR" then
		self.statusbar:SetValue(time)
		if time <= 60 then
			self.time:SetFormattedText("%.1f", time)
		else
			self.time:SetFormattedText("%d:%.2d", time/60, time%60)
		end
	end
	if (time < 0 and self.filter == "CD") then
		local id = self:GetParent().Id
		for index, value in ipairs(active[id]) do
			local spn = GetFilgerData(value.data)
			if self.spellName == spn then
				tremove(active[id], index)
				break
			end
		end
		self:SetScript("OnUpdate", nil)
		Update(self:GetParent())
	end
end

function Update(self)
	local id = self.Id
	if not bars[id] then
		bars[id] = {}
	end
	for index, value in ipairs(bars[id]) do
		value:Hide()
	end
	local bar
	for index, value in ipairs(active[id]) do
		bar = bars[id][index]
		if not bar then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			bar:Width(value.data.size)
			bar:Height(value.data.size)
			bar:SetScale(1)
			bar:SetTemplate("Transparent")

			if index == 1 then
				bar:Point(unpack(self.setPoint))
			else
				if self.Direction == "UP" then
					bar:Point("BOTTOM", bars[id][index-1], "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" then
					bar:Point("LEFT", bars[id][index-1], "RIGHT", self.Mode == "ICON" and self.Interval or value.data.barWidth + self.Interval, 0)
				elseif self.Direction == "LEFT" then
					bar:Point("RIGHT", bars[id][index-1], "LEFT", self.Mode == "ICON" and -self.Interval or -(value.data.barWidth + self.Interval), 0)
				else
					bar:Point("TOP", bars[id][index-1], "BOTTOM", 0, -self.Interval)
				end
			end

			if bar.icon then
				bar.icon = _G[bar.icon:GetName()]
			else
				bar.icon = bar:CreateTexture("$parentIcon", "ARTWORK")
				bar.icon:Point("TOPLEFT", 2, -2)
				bar.icon:Point("BOTTOMRIGHT", -2, 2)
				bar.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if self.Mode == "ICON" then
				bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate")
				bar.cooldown:SetAllPoints(bar.icon)
				bar.cooldown:SetReverse()

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar.cooldown:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(unpack(T.Fonts.aHotkey.setfont))
					bar.count:Point("TOPLEFT", 1, -1)
					bar.count:SetJustifyH("CENTER")
				end
			else
				if bar.statusbar then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar)
					bar.statusbar:Width(value.data.barWidth - 2)
					bar.statusbar:Height(value.data.size - 10)
					bar.statusbar:SetStatusBarTexture(C.media.normTex)
					bar.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)
					if self.IconSide == "LEFT" then
						bar.statusbar:Point("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 2)
					elseif self.IconSide == "RIGHT" then
						bar.statusbar:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 2)
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(0)

				if bar.bg then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame", "$parentBG", bar.statusbar)
					bar.bg:Point("TOPLEFT", -2, 2)
					bar.bg:Point("BOTTOMRIGHT", 2, -2)
					bar.bg:SetFrameStrata("BACKGROUND")
					bar.bg:SetTemplate("Transparent")
				end

				if bar.background then
					bar.background = _G[bar.background:GetName()]
				else
					bar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND")
					bar.background:SetAllPoints()
					bar.background:SetTexture(C.media.texture)
					bar.background:SetVertexColor(classcolor.r, classcolor.g, classcolor.b,  0.25)
				end

				if bar.time then
					bar.time = _G[bar.time:GetName()]
				else
					bar.time = bar.statusbar:CreateFontString("$parentTime", "ARTWORK")
                    bar.time:SetFont(unpack(T.Fonts.aHotkey.setfont))
					bar.time:Point("RIGHT", bar.statusbar, 0, 0)
				end

				if bar.count then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "ARTWORK")
					bar.count:SetFont(unpack(T.Fonts.aHotkey.setfont))
					bar.count:SetPoint("TOPLEFT", -2, 2)
					bar.count:SetJustifyH("CENTER")
				end

				if bar.spellname then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "ARTWORK")
					bar.spellname:SetFont(unpack(T.Fonts.aHotkey.setfont))
					bar.spellname:Point("LEFT", bar.statusbar, 2, 0)
					bar.spellname:Point("RIGHT", bar.time, "LEFT")
					bar.spellname:SetJustifyH("LEFT")
				end
			end
			tinsert(bars[id], bar)
		end

		bar.spellName = value.data.displayName

		bar.icon:SetTexture(value.icon)
		bar.count:SetText(value.count > 1 and value.count or "")
		if self.Mode == "BAR" then
			bar.spellname:SetText(value.data.displayName)
		end
		if value.duration > 0 then
			if self.Mode == "ICON" then
				CooldownFrame_SetTimer(bar.cooldown, value.data.filter == "CD" and value.expirationTime or (value.expirationTime - value.duration), value.duration, 1)
				bar.count:SetParent(bar.cooldown)
				if value.data.filter == "CD" then
					bar.expirationTime = value.expirationTime
					bar.duration = value.duration
					bar.filter = value.data.filter
					bar:SetScript("OnUpdate", OnUpdate)
				end
			else
				bar.statusbar:SetMinMaxValues(0, value.duration)
				bar.expirationTime = value.expirationTime
				bar.duration = value.duration
				bar.filter = value.data.filter
				bar:SetScript("OnUpdate", OnUpdate)
			end
		else
			if self.Mode == "ICON" then
				bar.cooldown:Hide()
				bar.count:SetParent(bar)
			else
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(1)
				bar.time:SetText("")
				bar:SetScript("OnUpdate", nil)
			end
		end

		bar:Show()
	end
end

local function OnEvent(self, event, ...)
	local unit = ...
	if ((unit == "target" or unit == "player" or unit == "pet" or unit == "focus") or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "SPELL_UPDATE_COOLDOWN" ) then
		local data, name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn
		local id = self.Id
		for i = 1, #Filger_Spells[class][id], 1 do
			data = Filger_Spells[class][id][i]

			name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, filgerId = GetFilgerData(data)

			if not active[id] then
				active[id] = {}
			end

			for index, value in ipairs(active[id]) do
				if data.filgerId == value.data.filgerId then
					tremove(active[id], index)
				end
			end

			if data.filter == "CD" then
				if (name and ((enabled or 0) > 0 and (duration or 0) > 1.5)) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start, displayName = spn, filgerId = filgerId })
				end
			elseif data.filter == "BUFF" then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitBuff(data.unitId, spn)
				if (name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster])) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start})
				end
			elseif data.filter == "DEBUFF" then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitDebuff(data.unitId, spn)
				if (name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all" ) or MyUnits[caster])) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start})
				end
			end
		end
		Update(self)
	end
end

function GetFilgerData(data)
	local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn, filgerId

	if data.spellID then
		filgerId = data.spellID
		spn, _, icon = GetSpellInfo(data.spellID)
		if not spn then
			print("|cffff0000WARNING: spellID "..data.spellID.." no longer exists!|r")
		end
		if data.filter == "BUFF" then
			name, rank, _, count, debuffType, duration, expirationTime, caster, isStealable = UnitBuff(data.unitId, spn)
		elseif data.filter == "DEBUFF" then
			name, rank, _, count, debuffType, duration, expirationTime, caster, isStealable = UnitDebuff(data.unitId, spn)
		elseif data.filter == "CD" then
			start, duration, enabled = GetSpellCooldown(spn)
		end
	elseif data.slotID then
		filgerId = data.slotID
		if data.filter == "CD" then
			slotLink = GetInventoryItemLink("player", data.slotID)

			if slotLink then
				spn, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
				start, duration, enabled = GetInventoryItemCooldown("player", data.slotID)
			end
		end
		count = 0
		caster = "all"
	elseif data.itemID then
		filgerId = data.itemID
		if data.filter == "CD" then
			start, duration, enabled = GetItemCooldown(data.itemID)
			spn, _, _, _, _, _, _, _, _, icon = GetItemInfo(data.itemID)
		end
	end

	if not count then
		count = 0
	end

	if not duration then
		duration = 0
	end

	if not start then
		start = 0
	end

	if not enabled then
		enabled = 0
	end

	if not data.displayName then
		data.displayName = spn
	end

	if not data.filgerId then
		data.filgerId = filgerId
	end

	return spn, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, filgerId
end

if Filger_Spells and Filger_Spells["ALL"] then
	if not Filger_Spells[class] then
		Filger_Spells[class] = {}
	end
	local didMerge
	for i = 1, #Filger_Spells["ALL"], 1 do
		didMerge = false
		for j = 1, #Filger_Spells[class], 1 do
			local baseTable = Filger_Spells[class][j]
			local addTable = Filger_Spells["ALL"][i]
			if baseTable["Name"] and addTable["Name"] and baseTable["Name"] == addTable["Name"] then
				for k = 1, #addTable, 1 do
					if addTable[k].spellID or addTable[k].slotID or addTable[k].itemID then
						table.insert(baseTable, addTable[k])
					end
				end

				didMerge = true
			end
		end

		if not didMerge then
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		end
	end
end

if Filger_Spells and Filger_Spells[class] then
	for index in pairs(Filger_Spells) do
		if index ~= class then
			Filger_Spells[index] = nil
		end
	end
	local data, frame
	for i = 1, #Filger_Spells[class], 1 do
		data = Filger_Spells[class][i]

		frame = CreateFrame("Frame", "FilgerAnchor"..i, UIParent)
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Interval = data.Interval or 3
		frame.Mode = data.Mode or "ICON"
		frame.setPoint = data.setPoint or "CENTER"
		frame:Width(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 100)
		frame:Height(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 20)
		frame:Point(unpack(data.setPoint))

		if (f_s.configmode) then
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if not active[i] then
					active[i] = {}
				end
				_, _, spellIcon = GetFilgerData(data)
				table.insert(active[i], {data = data, icon = spellIcon, count = 9, duration = 0, expirationTime = 0})
			end
			Update(frame)
		else
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if data.filter == "CD" then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
					break
				end
			end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", OnEvent)
		end
	end
end