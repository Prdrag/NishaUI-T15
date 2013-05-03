local T, C, L, G = unpack( Tukui )

if C["unitframes"].raidunitdebuffwatch == true then
	-- Class buffs { spell ID, position [, {r,g,b,a}][, anyUnit] }
	-- It use oUF_AuraWatch lib, for grid indicator
	do
		T.buffids = {
			PRIEST = {
				{6788, "TOPRIGHT", {1, 0, 0}, true},			-- Weakened Soul
				{33076, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},		-- Prayer of Mending
				{139, "BOTTOMLEFT", {0.4, 0.7, 0.2}}, 			-- Renew
				{17, "TOPLEFT", {0.81, 0.85, 0.1}, true},		-- Power Word: Shield
				{10060, "TOP", {0.89, 0.1, 0.1}},				-- Power Infusion
				{33206, "BOTTOM", {0.89, 0.1, 0.1}, true},		-- Pain Suppress
				{47788, "BOTTOM", {0.86, 0.52, 0}, true},			-- Guardian Spirit
			},
			DRUID = {
				{774, "TOPRIGHT", {0.8, 0.4, 0.8}},				-- Rejuvenation
				{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}},			-- Regrowth
				{94447, "TOPLEFT", {0.4, 0.8, 0.2}},			-- Lifebloom
				{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},			-- Wild Growth
			},
			PALADIN = {
				{53563, "TOPRIGHT", {0.7, 0.3, 0.7}},			-- Beacon of Light
				{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true},		-- Hand of Protection
				{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},	-- Hand of Freedom
				{1038, "BOTTOMRIGHT", {0.93, 0.75, 0}, true},	-- Hand of Salvation
				{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},	-- Hand of Sacrifice
				{65148, "BOTTOMLEFT", {0.89, 0.1, 0.1}},		-- Sacred Shield
			},
			SHAMAN = {
				{61295, "TOPRIGHT", {0.7, 0.3, 0.7}},			-- Riptide 
				{974, "BOTTOMLEFT", {0.2, 0.7, 0.2}, true},		-- Earth Shield
				--{16236, "TOPLEFT", {0.4, 0.7, 0.2}},			-- Ancestral Fortitude is gone
				{51945, "BOTTOMRIGHT", {0.7, 0.4, 0}},			-- Earthliving
			},
			
			MONK = {
				{119611, "TOPLEFT", {0.8, 0.4, 0.8}},	--Erneuernder Nebel
				{116849, "TOPRIGHT", {0.2, 0.8, 0.2}},	-- Lebenskokon 
				{124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}}, -- Erneuernder Nebel
				{115176, "TOP", {0.81, 0.85, 0.1}, true}, -- Zenmeditation
				{124081, "BOTTOMRIGHT", {0.7, 0.4, 0}}, -- Zensphäre
			},
			DEATHKNIGHT = {
				{49016, "TOPRIGHT", {0.89, 0.89, 0.1}},			-- Unholy Frenzy
			},
			HUNTER = {
				{34477, "TOPRIGHT", {0.2, 0.2, 1}},				-- Misdirection
			},
			MAGE = {
				{111264, "TOPRIGHT", {0.2, 0.2, 1}},			-- Ice Ward
			},
			ROGUE = {
				{57933, "TOPRIGHT", {0.89, 0.1, 0.1}},			-- Tricks of the Trade
			},
			WARLOCK = {
				{20707, "TOPRIGHT", {0.7, 0.32, 0.75}},			-- Soulstone
			},
			WARRIOR = {
				{114030, "TOPLEFT", {0.2, 0.2, 1}},				-- Vigilance
				{3411, "TOPRIGHT", {0.89, 0.1, 0.1}},			-- Intervene
			},
			ALL = {
				{14253, "TOP", {0, 1, 0}}, -- Abolish Poison
				{23333, "BOTTOM", {1, 0, 0}}, -- Warsong flag xD
			},
		}
	end
	
	-- Dispellable & Important Raid Debuffs we want to show on Grid!
	-- It use oUF_RaidDebuffs lib for tracking dispellable / important
	do
		local ORD = oUF_RaidDebuffs

		if not ORD then return end
		
		ORD.ShowDispelableDebuff = true
		ORD.FilterDispellableDebuff = true
		ORD.MatchBySpellName = true
		ORD.DeepCorruption = true
		
		local function SpellName(id)
			local name = select(1, GetSpellInfo(id))
			return name	
		end

		T.debuffids = {
		-----------------------------------------------------------------
		-- Kun-Lai Summit
		-----------------------------------------------------------------
			-- Sha of Anger
			SpellName(119622),	-- Growing Anger
			SpellName(119626),	-- Aggressive Behavior
			SpellName(119488),	-- Unleashed Wrath
			-- Salyis's Warband
			SpellName(121787),  -- Stomp (3 sec stun) 
		-----------------------------------------------------------------
		-- Mogu'shan Vaults
		-----------------------------------------------------------------
			-- The Stone Guard
			SpellName(116281),	-- Cobalt Mine Blast
			SpellName(130395),  -- Jasper Chains
			SpellName(125206),  -- Rend Flesh
			-- Feng the Accursed
			SpellName(116784),	-- Wildfire Spark
			SpellName(116417),	-- Arcane Resonance
			SpellName(131790),  -- Arcane Shock
			SpellName(116942),  -- Flaming Spear
			SpellName(131788),  -- Lightning Lash
			-- Gara'jal the Spiritbinder
			SpellName(116161),	-- Crossed Over
			SpellName(116000),  -- Voodoo Dolls
			-- The Spirit Kings
			SpellName(117708),	-- Maddening Shout
			SpellName(118303),	-- Fixate
			SpellName(118048),	-- Pillaged
			SpellName(118135),	-- Pinned Down
			-- Elegon
			SpellName(117878),	-- Overcharged
			SpellName(117949),	-- Closed Circuit
			SpellName(132222),	-- Destabilizing Energies
			-- Will of the Emperor
			SpellName(116835),	-- Devastating Arc
			SpellName(116778),	-- Focused Defense
			SpellName(116525),	-- Focused Assault
			SpellName(116829),  -- Focused Energy
		-----------------------------------------------------------------
		-- Heart of Fear
		-----------------------------------------------------------------
			-- Imperial Vizier Zor'lok
			SpellName(122761),	-- Exhale
			SpellName(122740),	-- Convert
			SpellName(123812),	-- Pheromones of Zeal
			-- Blade Lord Ta'yak
			SpellName(123180),	-- Wind Step
			SpellName(123474),	-- Overwhelming Assault
			-- Garalon
			SpellName(122835),	-- Pheromones
			SpellName(123081),	-- Pungency
			-- Wind Lord Mel'jarak
			SpellName(122125),	-- Corrosive Resin Pool
			SpellName(121885), 	-- Amber Prison
			SpellName(131813),  -- Wind Bomb   
			-- Amber-Shaper Un'sok
			SpellName(121949),	-- Parasitic Growth
			-- Grand Empress Shek'zeer
			SpellName(123707),  -- Eyes of the Empress
			SpellName(123788),	-- Cry of Terror
			SpellName(124849),	-- Consuming Terror
			
		-----------------------------------------------------------------
		-- Terrace of Endless Spring
		-----------------------------------------------------------------
			-- Protectors of the Endless
			SpellName(117436),	-- Lightning Prison
			SpellName(118091),	-- Defiled Ground
			SpellName(117519),	-- Touch of Sha
			-- Tsulong
			SpellName(122752),	-- Shadow Breath
			SpellName(123011),	-- Terrorize
			SpellName(122777),	-- Nightmares
			-- Lei Shi
			SpellName(123121),	-- Spray
			SpellName(123705),  -- Scary Fog  
			-- Sha of Fear
			SpellName(119985),	-- Dread Spray
			SpellName(119086),	-- Penetrating Bolt
			SpellName(119775),	-- Reaching Attack
			-----------------------------------------------------------------
			--Throne of Thunder
			-----------------------------------------------------------------
			--Jin'rokh
			-- Jin'rokh the Breaker
			SpellName(137162),	-- Static Burst (Tank switch)
			SpellName(138349),	-- Static Wound (Tank stacks)
			SpellName(137371),	-- Thundering Throw (Tank stun)
			SpellName(138732),	-- Ionization (Heroic - Dispel)
			SpellName(137422),	-- Focused Lightning (Fixated - Kiting)
			SpellName(138006),	-- Electrified Waters (Pool)
			--Horridon
			SpellName(136723),	-- Sand Trap
			SpellName(136767),	-- Triple Puncure
			SpellName(136645),	-- Living Poison				
			SpellName(136719),	-- Blazing Sunlight				
			SpellName(136587),	-- Venom Bolt Volley				
			SpellName(136710),	-- Deadly Plague				
			SpellName(136513),	-- Hex of Confusion
			SpellName(136708),	-- Stone Gaze (Stun - Dispel)
			SpellName(136654),	-- Rending Charge (DoT)			
			--Council of Elders				
			SpellName(136922),	--Frostbite				
			SpellName(136917),	-- Biting Cold
			SpellName(136922),	-- Frostbite (DoT)
			SpellName(136521),	-- Quicksand
			SpellName(137359),	-- Marked Soul (Fixated - Kiting)
			SpellName(136903),	-- Frigid Assault
			SpellName(137641),	-- Soul Fragment (Heroic)
			--Tortos
			SpellName(136753),	-- Slashing Talons (Tank DoT)
			SpellName(135251),	-- Snapping Bite
			SpellName(140701),	-- Crystal Shell: Full Capacity! (Heroic)
			--Megaera				
			SpellName(137731),	-- Ignite Flesh (Tank stacks)
			SpellName(139843),	-- Arctic Freeze (Tank stacks)
			SpellName(139840),	-- Rot Armor (Tank stacks)
			SpellName(134391),	-- Cinder (DoT - Dispell)
			SpellName(139857),	-- Torrent of Ice (Fixated - Kiting)
			SpellName(140179),	-- Suppression (Heroic - Dispell)
			--Ji-Kun			
			SpellName(134366),	-- Talon Rake (Tank stacks)
			SpellName(140092),	-- Infected Talons (Tank DoT)
			SpellName(134256),	-- Slimed (DoT)
			--Durumu the Forgotten			
			SpellName(133768),	-- Arterial Cut (Tank DoT)
			SpellName(133767),	-- Serious Wound (Tank stacks)
			SpellName(133798),	-- Life Drain (Stun)
			SpellName(133597),	-- Dark Parasite (Heroic - Dispel)
			--Primordius
			SpellName(136050),	-- Malformed Blood (Tank stacks)
			SpellName(136228),	-- Volatile Pathogen (DoT)
			--Dark Animus
			SpellName(136903),	-- Matter Swap
			SpellName(138569),	-- Explosive Slam (Tank stacks)
			SpellName(138659),	-- Touch of the Animus (DoT)
			--Iron Qon
			SpellName(134691),	-- Impale			
			SpellName(134647),	-- Scorched			
			SpellName(139193),	-- Arcing Lightning
			SpellName(136192),	-- Lightning Storm (Stun)
			--Twin Consorts				
			SpellName(137408),	-- Fan of Flames (Tank stacks)
			SpellName(136722),	-- Slumber Spores (Dispel)
			SpellName(137341),	-- Beast of Nightmares (Fixate)
			SpellName(137360),	-- Corrupted Healing (Healer stacks)
			--Lei Shen
			SpellName(135000),	-- Decapitate (Tank only)
			SpellName(136478),	-- Fusion Slash (Tank only)
			SpellName(136914),	-- Electrical Shock (Tank staks)
			SpellName(135695),	-- Static Shock (Damage Split)
			SpellName(136295),	-- Overcharged
			SpellName(139011),	-- Helm of Command (Heroic)
		}


		T.ReverseTimer = {
			[89421] = true, -- Sinestra (Wrack)
		},
		
		ORD:RegisterDebuffs(T.debuffids)
	end
end