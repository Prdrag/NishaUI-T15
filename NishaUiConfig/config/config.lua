local C = {}
local class = RAID_CLASS_COLORS[select(2,UnitClass("player"))] -- Do not remove this line, it is what is required to add class color for the datatext.^

C["unitframes"] = {
	["enable"] = true,
	["healthBgColor"] = {.6, .6, .6, 1},
	["healthcolor"] = {0.2, 0.2, 0.2},						-- Default is {.3, .3, .3, 1},	
	["classbar"] = true,
	["classicons"] = true,
	["charportrait"] = false,
	["unicolor"] = true,
	["cbicons"] = true,
	["unitcastbar"] = true,
	["combatfeedback"] = false,
	["raidunitdebuffwatch"] = true,
	["auratimer"] = true,
	["totdebuffs"] = true,                        
	["raid"] = true,
	["showtotalhpmp"] = false,
	["gradienthealth"] = true,
	["gradient"] = {
		4.5, 0.1, 0.1,
		0.6, 0.3, 0.3,
		0.2, 0.2, 0.2,
	},
	["healcomm"] = false,
	["maxraidplayers"] = true,
	["showraidpets"] = false,
	["raidalphaoor"] = 0.4,
	["perconly"] = false,
	["iconspvp"] = true, 
	["showsmooth"] = true,
	["hidepower"] = false,
	["showsymbols"] = true,
	["showrange"] = true,
	["grid"] = true,
}

C["highlight"] = {
	["OriginalStyle"] = true,         -- Set to true for Blizzards original Proc highlight.
	["FlashButton"] = false,           -- Set to true to make the entire button to flash.
	["FlashBorder"] = false,            -- Set to true to make the button border flash.
	["FlashBorderSize"] = 3,           -- Set the size of the border to flash, if FlashBorder is enabled.
	["FlashBorderColor"] = {1, 1, 0},  -- Color of flash border
}

C["nisha"] = {
	["click2cast"] = false,
	["markbar"] = false,
	["raidcd"] = false,
	["threatbar"] = true,
	["afkscreen"] = true,
	["sesenable"] = true,										-- enable specswitcher
	["sesenablegear"] = true,									-- enable gearslots
	["sesgearswap"] = true,										-- enable automatic geearswap
	["sesset1"] = 1,											-- set 1st set (1 - 10)
	["sesset2"] = 2,											-- set 2nd set (1 - 10)
	["ilvlr"] = true,
	["chatbg"] = false,
	["naga"] = false,
	["combatlog"] = true,
}

C["nameplate"] = {
	["enable"] = false,                        	 -- enable nice skinned nameplates that fit into tukui
	["debuffs"] = false,
	["nishastyle"] = true,
	["height"] = 9,									-- Nameplate height
	["width"] = 130,								-- Nameplate width
	["combat"] = false,								-- Automatically show nameplate in combat
	["showhealth"] = false,							-- Numeral health value
	["showcastbarname"] = false,					-- Show castbar name
	["nameabbrev"] = false,							-- Display the abbreviated names
	["aurassize"] = 20,								-- Debuffs size
	["goodcolor"] = {75/255,  175/255, 76/255},	        -- good threat color (tank shows this with threat, everyone else without)
	["badcolor"] = {0.78, 0.25, 0.25},			        -- bad threat color (opposite of above)
	["transitioncolor"] = {218/255, 197/255, 92/255},	-- threat color when gaining threat
	["healericon"] = false,							-- Show icon above enemy healers nameplate in battlegrounds
	["showcastbarname"] = false,
	["enhancethreat"] = true,			                -- threat features based on if your a tank or not
	["adwidth"] = 3,
	["adheight"] = 3,
	["classicons"] = true,
}

C["announcements"] = {
	["interrupts"] = true,						-- Announce in party/raid when you interrupt
	["spells"] = true,							-- Announce in party/raid when you cast some spell
	["announcechannel"] = "SAY"					-- set announcechannel
}

C["classbar"] = {
	["monk"] = true,
	["druid"] = true,
	["shaman"] = true,
	["priest"] = true,
	["warlock"] = true,
	["deathknight"] = true,
	["paladin"] = true,
	["rogue"] = true,
	["mage"] = true,
	["stagger"] = true,
	["vengeance"] = true,
}

C["font"] = {
	["font"] = false,
	["datatextfontsize"] = 12,
	["unitframefontsize"] = 12,
	["nameplatefontsize"] = 12,
	["skinfontsize"] = 12,
	["chattabfontsize"] = 12,
	["actionbuttonfontsize"] = 12,
}

C["raidframes"] = {
	["unicolor"] = true,
	-- ["verticalgrid"] = false,
	["mouseoverhighlight"]= true,
	["gridscale"] = 1,
	["healcomm"] = true,
	["powerbars"] = false,
	["height"] = 42,
	["width"] = 72,
}

C["combattext"] = {
	["enable"] = true,							-- Global enable combat text
	["blizzheadnumbers"] = false,				-- Use blizzard damage/healing output(above mob/player head)
	["damagestyle"] = true,					-- Change default damage/healing font above mobs/player heads(you need to restart WoW to see changes)
	["damage"] = true,							-- Show outgoing damage in it's own frame
	["healing"] = true,							-- Show outgoing healing in it's own frame
	["showhots"] = true,						-- Show periodic healing effects in healing frame
	["showoverhealing"] = true,				-- Show outgoing overhealing
	["petdamage"] = true,						-- Show your pet damage
	["dotdamage"] = true,						-- Show damage from your dots
	["damagecolor"] = true,					-- Display damage numbers depending on school of magic
	["critprefix"] = "*",						-- Symbol that will be added before crit
	["critpostfix"] = "*",						-- Symbol that will be added after crit
	["icons"] = true,							-- Show outgoing damage icons
	["iconsize"] = 16,							-- Icon size of spells in outgoing damage frame, also has effect on dmg font size
	["treshold"] = 1,							-- Minimum damage to show in damage frame
	["healtreshold"] = 1,						-- Minimum healing to show in incoming/outgoing healing messages
	["scrollable"] = false,						-- Allows you to scroll frame lines with mousewheel
	["maxlines"] = 15,							-- Max lines to keep in scrollable mode(more lines = more memory)
	["timevisible"] = 3,						-- Time(seconds) a single message will be visible
	["stopvespam"] = false,					-- Automaticly turns off healing spam for priests in shadowform
	["dkrunes"] = true,						-- Show deathknight rune recharge
	["killingblow"] = false,					-- Tells you about your killingblows
	["mergeaoespam"] = true,					-- Merges multiple aoe damage spam into single message
	["mergeaoespamtime"] = 3,				-- Time in seconds aoe spell will be merged into single message(works only with ["damage"] = true)
	["dispel"] = true,							-- Tells you about your dispels(works only with ["damage"] = true)
	["interrupt"] = true,						-- Tells you about your interrupts(works only with ["damage"] = true)
	["direction"] = "bottom",					-- Scrolling Direction("top"(goes down) or "bottom"(goes up))
}

C["tooltip"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	["ilvl"] = false,
	["talent"] = false,
	["symbosis"] = false,
	["icon"] = false,
	["symbosis"] = false,
	["reforge"] = false,
}

C["auras"] = {
	["debuffsize"] = 25,
	["buffsize"] = 25,
	["player"] = true,                                  -- enable tukui buffs/debuffs
	["consolidate"] = true,                             -- enable downpdown menu with consolidate buff
	["flash"] = true,  	                                -- flash warning for buff with time < 30 sec
	["onlyselfbuffs"] = false,
	["onlyselfdebuffs"] = false,
}

C["classtimer"] = {
	["enable"] = false,											-- enable classtimer
	["targetdebuffs"] = false,									-- target debuffs above target (looks crappy imo)
	["playercolor"] = {.2, .2, .2, 1 },							-- playerbarcolor
	["targetbuffcolor"] = { 70/255, 150/255, 70/255, 1 },		-- targetbarcolor (buff)
	["targetdebuffcolor"] = { 150/255, 30/255, 30/255, 1 },		-- targetbarcolor (debuff)
	["trinketcolor"] = {75/255, 75/255, 75/255, 1 },			-- trinketbarcolor
	["spark"] = true,
	["barheight"] = 17,
} 

C["filger"] = {
	["enable"] = false,
	["filgerconfig"] = false,
	["iconsize"] = 37,
	["barwidth"] = 181,
	["maxtesticon"] = 5,
	["showtooltip"] = false,
	["buffdirection"] = "RIGHT",
	["proccdirection"] = "RIGHT",
	["cddirection"] = "RIGHT",
	["debuffdirection"] = "RIGHT",
	["pvepvpdirection"] = "RIGHT",
	["targetbuffdirection"] = "RIGHT",
	["specialbuffdirection"] = "RIGHT",
	["buffs"] = true,
	["procs"] = true,	
	["debuffbars"] = true,	
	["cd"] = true,		
	["specialbuff"] = true,	
	["pvepvpdebuffs"] = true,	
	["targetbuffs"] = true,	
}

C["buffreminder"] = {
	["raidbuffreminder"] = true,
}

C["castbar"] = { 
	["classcolor"] = false,
	["castbarcolor"] = {.2, .2, .2,1}, -- color if classcolor = false
	["nointerruptcolor"] = {1,.2,.2,1}, -- color of casts which can't be interrupted
	["ticks"] = true,
	["playerheight"] = 20,
	["playerwidth"] = 374,
	["targetheight"] = 20,
	["targetwidth"] = 206,
}

C["skin"] = {
	["bigwigsreskin"] = true,
	["dbmreskin"] = true,
	["omenreskin"] = true,
	["recountreskin"] = true,
	["skadareskin"] = true,
	["weakaurasreskin"] = true,
	["cliquereskin"] = true,
}

C["datatext"] = {
	["bags"] = 0,
	["fps_ms"] = 1,
	["system"] = 2,
	["gold"] = 6,
	["wowtime"] = 7,
	["guild"] = 4,
	["dur"] = 3,
	["friends"] = 5,
	["power"] = 0,
	["haste"] = 0,
	["crit"] = 0,
	["hit"] = 0,
	["mastery"] = 0,
	["battleground"] = false,
	["time24"] = false,
	["localtime"] = true,
	["fontsize"] = 12,
	["exprepbars"] = true,								-- enable experience and reputation bar
	["expreptext"] = true,								-- enable text on experience and reputation bars
}

C["actionbar"] = {
	["enable"] = true,                                  -- enable tukui action bars
	["hotkey"] = true,                                  -- enable hotkey display because it was a lot requested
	["showgrid"] = true,                                -- show grid on empty button
	["buttonsize"] = 27,                                -- normal buttons size
	["petbuttonsize"] = 27,                             -- pet & stance buttons size
	["buttonspacing"] = 4,                              -- buttons spacing
	["vertical_rightbars"] = false,						-- vertical or horizontal right bars
	["ownshdbar"] = true,                              -- use a complete new stance bar for shadow dance (rogue only)
	["mainswap"] = false,
	["micromenumouseover"] = true,
	["micromenu"] = false,
	["vertical_shapeshift"] = true,	
}

C["chat"] = {
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
	["justifyRight"] = true,
}

C["media"] = {
	-- colors	
	["backdropcolor"] = { .08, .08, .08, 1 }, 								-- background color of tukui panels
	["fadedbackdropcolor"] = { .03, .03, .03, .7 }, 
	["bordercolor"] = { .2, .2, .2, 1 },  									-- border color of tukui panels
	["font"] = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]], 	-- general font of tukui
	["uffont"] = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]],	-- general font of unitframes
	["pixelfont"] = [[Interface\AddOns\nishaui\medias\fonts\visitor2.ttf]], -- general font of unitframes
	["empath"] = [[Interface\AddOns\Tukui\medias\textures\empath]],
	["striped"] = [[Interface\AddOns\nishaui\medias\textures\striped]],
	["normTex"] = [[Interface\AddOns\nishaui\medias\textures\normTex2]],
	["blank"] = [[Interface\BUTTONS\WHITE8X8]],
	["downfall"] = [[Interface\AddOns\nishaui\medias\textures\downfall]],
	["combattextfont"] = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]],
	["wowlogo"] = [[Interface\Glues\Common\Glues-WoW-MPLogo.blp]],
	["datatextcolor1"] = {class.r, class.g, class.b},
	["datatextcolor2"] = {1, 1, 1},
	["combattextfontsize"] = 20,
	["combattextfontstyle"] = "OUTLINE",
	["combattextfontshadow"] = false,
}
TukuiEditedDefaultConfig = C