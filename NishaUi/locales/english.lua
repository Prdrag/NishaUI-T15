local T, C, L = unpack(Tukui)

if T.client ~= "deDE" then
	L.mail_need = "Need a mailbox."
	L.mail_messages = "Messages"
	L.chat_whispers = "Whispers"
	L.edit = " NishaUi|r"
	L.buffs_min_abbr = "m."
	L.buffs_hour_abbr = "h."
	L.buffs_day_abbr = "d."
	L.hello = "Hello "
	L.hello2 = "!|r Thank you for using"
	L.hello3 = " Nisha UI|r ".. GetAddOnMetadata( "NishaUi", "Version" ) ..". For detailed Information visit"
	L.hello4 = " http://www.pulse-guild.de|r."
	L.actionbars_locked = "Actionbars |cffe45050Locked|r"
	L.actionbars_unlocked = "Actionbars |cff50e468Unlocked|r"
	L.bags_buyslot = "Buy Bankslot"
	L.nisha_addon = "NishaUI Addonmanager"
	L.nisha_move = "Move NishaUI"
	L.nisha_config = "NishaUI Ingame Config"
	L.nisha_bind = "NishaUI Bind Hotkeys"
	L.nisha_reload = "Reload NishaUI"
	L.nisha_help = "NishaUI Help"
	L.nisha_ab = "Pulse Actionbars"
	
	L.Popups_disable_tukui_nameplates = "Tukui nameplates are active. They will be disabled and the NishaUi nameplates will be enabled."

	L.nisha_addon2 = "Enable/disable addons ingame"
	L.nisha_move2 = "Move the elements of NishaUI"
	L.nisha_config2 = "Configure your NishaUI"
	L.nisha_bind2 = "Set keybinds for your spells"
	L.nisha_reload2 = "Reloads the ui"
	L.nisha_help2 = "show the NishaUI helpframe"

	L.nisha_addon3 = "Addons"
	L.nisha_move3 = "MoveUI"
	L.nisha_config3 = "Config"
	L.nisha_bind3 = "Keybinds"
	L.nisha_reload3 = "ReloadUI"
	L.nisha_help3 = "Help"
	L.nisha_movenhb = "Move Actionbar"
	
	L.Tooltip_LOADING_TALENT = "Loading Talents..."
	L.Tooltip_NO_TALENTS = "No Talents"
	L.Tooltip_ITEMID = "Item ID:"
	
	L.COMBATTEXTKILLINGBLOW = "Killing Blow"
	L.COMBATTEXTALREADYUNLOCKED = "Combat text already unlocked."
	L.COMBATTEXTALREADYLOCKED = "Combat text already locked."
	L.COMBATTEXTTESTDISABLED = "Combat text test mode disabled."
	L.COMBATTEXTTESTENABLED = "Combat text test mode enabled."
	L.COMBATTEXTTESTUSEUNLOCK = "Type /xct unlock to move and resize combat text frames."
	L.COMBATTEXTTESTUSELOCK = "Type /xct lock to lock combat text frames."
	L.COMBATTEXTTESTUSETEST = "Type /xct test to toggle combat text testmode."
	L.COMBATTEXTPOPUP = "To save combat text window positions you need to reload your UI."
	L.COMBATTEXTUNSAVED = "Combat text window positions unsaved, don't forget to reload UI."
	L.COMBATTEXTUNLOCKED = "Combat text unlocked."
	
	L.MISCBINDEROPEN = "Mouse Bindings"
	L.popupsettingsdbm = "Need to change the position of elements DBM."
	
	-------------------------------------------------
	-- Helpframe
	-------------------------------------------------
	L.helpcontent_button1 = "Show Anchors"

	L.helpcontent_text1 = "General"
	L.helpcontent_text2 = "Welcome to the HelpPanel from NishaUI!\nThis Panel will help you to find the importants settings and commands for NishaUI :)"
	L.helpcontent_text3 = "Please select a category."
	L.helpcontent_text4 = "Have Fun !"

	L.helpcontent7_text1 = "Credits"
	L.helpcontent7_text2 = "Special thanks goes to Tukz."
	L.helpcontent7_text3 = "And the following people:"
	L.helpcontent7_text4 = "Sinaris, Elv, nightcracker, Eclipse, Hydra, Asphyxia, Jasje, Epicgrimm, JerichoHM and all others who help Tukz and the Editors for the awesome Tukui"

	L.helpcontent6_text1 = "Bug Reports & Suggestions"
	L.helpcontent6_text2 = "Bug Reports can be made on two boards. The first one is the Tukui-Forum in the thread Bug Reports and Errors. Please read first the post about, how to create a bug report. The other board is on nisha.com in the forums."
	L.helpcontent6_text3 = "Suggestions can be in http://pulse-guild.de in the forum."
	L.helpcontent6_text4 = "PMs or ingame whisper are not observed, because the other users should also see your suggestions."

	L.helpcontent5_text1 = "Actionbars"
	L.helpcontent5_text2 = "The standard Layout is one bottombar and one rightbar. But you find some buttons to toggle more actionbars. These buttons are only shown, when your mouse cursor is over them"
	L.helpcontent5_text3 = "To lock the actionbars, there is a button above the right side of right infopanel"
	L.helpcontent5_text4 = "You have the possibility to swap your mainbar with the upper bar. Another option is that you can set your rightbars permanently vertical. If this option is disable your rightbars will be shown over the right chat."
	L.helpcontent5_text5 = "There is even an option to change the style of the actionbars. The three options are gradient, inverted gradient & gloss."

	L.helpcontent4_text1 = "Skins, Addons"
	L.helpcontent4_text2 = "The entire UI has skinned frames for all default Blizzardframes. If you want the skinned frames you can disable it in the ingame-Config in the subsection Skins. Uncheck Enable Blizzard-Skin."
	L.helpcontent4_text3 = "For next the most common Addons, like DBM, DXE, Recount, Skada and so on, are skinned per default. You deactivate every skin seperatly if you do not use the corresponding Addon."

	L.helpcontent3_text1 = "Chat"
	L.helpcontent3_text5 = ""
	L.helpcontent3_text2 = "To resize the backgrounds properly you have @ingame-Config in the subsection Chat the possibility to adjust the size of the backgrounds."
	L.helpcontent3_text3 = "You have as well the options to allign the text of the right chat."
	L.helpcontent3_text4 = "If you don't want the right chatbackground open the panels.lua @Tukui\modules\panels and search for TukuiChatRight, TukuiTabsRight. Add an Framename:SetAlpha(0)."

	L.helpcontent2_text1 = "Unitframes"
	L.helpcontent2_text2 = "For first you have Frames for player, pet, target, target of target, boss , focus, focustarget, party, raid and arena."
	L.helpcontent2_text3 = "You can disable or enable any options in the ingame config at the subsection Unitframes."
	L.helpcontent2_text4 = "For the Heal-Layout you can adjust Gridonly or not. Use for it the option Enable Grid only for Heal-Layout."

	L.helpcontent1_text1 = "Slashcommands"
	L.helpcontent1_text2 = "/nhelp => Open this panel\n/resetui => Reset the position of the entire UI\n/install => Reinstall the entire UI"
	L.helpcontent1_text3 = "/moveui or /mtukui => Enable movers to place the UI-Elements\n/hb => Set keybindings via hoverbind\n/rl => Reloads the UI"
	L.helpcontent1_text4 = "/heal => Switch to Heal-Layout\n/dps => Switch to DPS-Layout\n/tc => Open ingame-Config"
	L.helpcontent1_text5 = "/am => Open Addonmanager\n/version => Shows the versionframe\n/ali -> opens a grid over the screen, which allows you adjusting the frames"

	if TukuiConfigUILocalization then
		--------------------------------------------------------------------------
		--general
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.font = "Font"
		TukuiConfigUILocalization.fontfont = "Change UI Font(true is pixel)"
		TukuiConfigUILocalization.fontdatatextfontsize = "Fontsize of the datatext"
		TukuiConfigUILocalization.fontunitframefontsize = "Fontsize of the unitframes"
		TukuiConfigUILocalization.fontnameplatefontsize = "Fontsize of the nameplates"
		TukuiConfigUILocalization.fontchattabfontsize = "Fontsize of the chattab"
		TukuiConfigUILocalization.fontactionbuttonfontsize = "Fontsize of the actionbars"
		TukuiConfigUILocalization.fontskinfontsize = "Fontsize of the addonskins"
		--------------------------------------------------------------------------
		--filger
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.filger = "Filger"
		TukuiConfigUILocalization.filgerenable = "Enable Filger"
		TukuiConfigUILocalization.filgerfilgerconfig = "Config-Mod"
		TukuiConfigUILocalization.filgericonsize = "Size of the Icons"
		TukuiConfigUILocalization.filgershowtooltip = "Show the Toolip"
		TukuiConfigUILocalization.filgermaxtesticon = "Number auf Icons in Configmode"
		TukuiConfigUILocalization.filgerbarwidth = "Width of the Bars"
		
		TukuiConfigUILocalization.filgerprocs = "Enable Procs"
		TukuiConfigUILocalization.filgerbuffs = "Enable Buffs"
		TukuiConfigUILocalization.filgerdebuffbars = "EnableDebuffs"
		TukuiConfigUILocalization.filgercd = "Enable CD's"
		TukuiConfigUILocalization.filgerspecialbuff = "Enable SpecialBuffs"
		TukuiConfigUILocalization.filgerpvepvpdebuffs = "Enable Pve/PvP Debuffs"
		TukuiConfigUILocalization.filgertargetbuffs = "Enable Target Buffs"

		TukuiConfigUILocalization.filgerproccdirection = "Direction of Procs"
		TukuiConfigUILocalization.filgerbuffdirection = "Direction of Buffs"
		TukuiConfigUILocalization.filgerspecialbuffdirection = "Direction of SpecialBuffs"
		TukuiConfigUILocalization.filgerdebuffdirection = "Direction of Debuffs"
		TukuiConfigUILocalization.filgercddirection = "Direction of CD's"
		TukuiConfigUILocalization.filgerpvepvpdirection = "Direction of Pve/PvP Debuffs"
		TukuiConfigUILocalization.filgertargetbuffdirection = "Direction of Target Buffs"
		--------------------------------------------------------------------------
		--nisha
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.nisha = "Extras"
		TukuiConfigUILocalization.nishaclick2cast = "Enable click-to-cast"
		TukuiConfigUILocalization.nishamarkbar = "Enable the markbar"
		TukuiConfigUILocalization.nisharaidcd = "Enable the timer for raidcds"
		TukuiConfigUILocalization.nishathreatbar = "Enable the Nishastyle threatbar"
		TukuiConfigUILocalization.nishailvlr = "Enable durability and ilvl in charpanel"
		TukuiConfigUILocalization.nishasesenable = "Enable Specswitcherplugin"
		TukuiConfigUILocalization.nishasesenablegear = "Enable Equipmentsetbuttons"
		TukuiConfigUILocalization.nishasesgearswap = "Enable automatic setswap on respec"
		TukuiConfigUILocalization.nishasesset1 = "Set set for first spec (must be an value between 1 - 10)"
		TukuiConfigUILocalization.nishasesset2 = "Set set for second spec (must be an value between 1 - 10)"
		TukuiConfigUILocalization.nishanaga = "Enable Nagalayout (all bars have to be on)"
		--------------------------------------------------------------------------
		--classtimer
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.classtimer = "Classtimer"
		TukuiConfigUILocalization.classtimerenable = "Enable den Classtimer"
		TukuiConfigUILocalization.classtimertargetdebuffs = "Show debuffs on target frame"
		TukuiConfigUILocalization.classtimerplayercolor = "Color of the playerbars"
		TukuiConfigUILocalization.classtimertargetbuffcolor = "Color of the targetbuffsbar"
		TukuiConfigUILocalization.classtimertargetdebuffcolor = "Color of the targetdebuffsbars"
		TukuiConfigUILocalization.classtimertrinketcolor = "Color of the trinketbars"
		TukuiConfigUILocalization.classtimerspark = "Enable a Spark"
		TukuiConfigUILocalization.classtimerbarheight = "Height of the timerbars"
		--------------------------------------------------------------------------
		--Raidbuffreminder
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.buffreminder = "Raidbuffreminder"
		TukuiConfigUILocalization.buffreminderraidbuffreminder = "Enable Raidbuffreminder"
		--------------------------------------------------------------------------
		--nameplates
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.nameplatenishastyle = "Enable Nishastyle"
		TukuiConfigUILocalization.nameplatedebuffs = "Show Debuffs on the Nameplates(Turn Nameplates off)"
		TukuiConfigUILocalization.nameplateshowcastbarname = "Show castbar name"
		TukuiConfigUILocalization.nameplatewidth = "Nameplates width"
		TukuiConfigUILocalization.nameplateheight = "Nameplates height"
		TukuiConfigUILocalization.nameplateaurassize = "Debuffs size"
		TukuiConfigUILocalization.nameplatenameabbrev = "Display abbreviated names"
		TukuiConfigUILocalization.nameplateadwith = "Additional width if nameplate is the target"
		TukuiConfigUILocalization.nameplateadheight = "Additional height if nameplate is the target"
		TukuiConfigUILocalization.nameplateclassicons = "Enable Classicons in nameplates"
		TukuiConfigUILocalization.nameplatehealericon = "Enable Healericon in nameplates"
		--------------------------------------------------------------------------
		--classbar
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.classbar = "Classbar"
		TukuiConfigUILocalization.classbarmonk = "Enable Harmonybar(Monk)"
		TukuiConfigUILocalization.classbardruid = "Enable Eclipsebar(Druid)"
		TukuiConfigUILocalization.classbardeathknight = "Enable Runebar(Deathknight)"
		TukuiConfigUILocalization.classbarshaman = "Enable Totembar(Shaman)"
		TukuiConfigUILocalization.classbarpaladin = "Enable Holy Powerbar (Paladin)"
		TukuiConfigUILocalization.classbarwarlock = "Enable Speccbar(Warlock)"
		TukuiConfigUILocalization.classbarpriest = "Enable Shadoworbbar(Priest)"
		TukuiConfigUILocalization.classbarrogue = "Enable Combobar(Rogue)"
		TukuiConfigUILocalization.classbarmage = "Enable Arcanechargebar(Mage)"
		TukuiConfigUILocalization.classbarebwidth = "Width of classbar from moonkins and monks"
		TukuiConfigUILocalization.classbarwidth = "Width of classbars runes/shards/shrooms etc."
		TukuiConfigUILocalization.classbarheight = "Height of classbars"
		TukuiConfigUILocalization.classbarvengeance = "Enable the Vengeancebar"
		--------------------------------------------------------------------------
		--Announcements
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.announcements = "Announcements"
		TukuiConfigUILocalization.announcementsinterrupts = "Announce successful interrupts"
		TukuiConfigUILocalization.announcementsspells = "Announce spells"
		TukuiConfigUILocalization.announcementschannel = "Channel you want to announce (SAY/PARTY/RAID)"
		--------------------------------------------------------------------------
		--Raidframes
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.raidframes = "Raidframes"
		TukuiConfigUILocalization.raidframesunicolor = "Off for classcolor"
		TukuiConfigUILocalization.raidframesverticalgrid = "Sort the Raidframe vertical"
		TukuiConfigUILocalization.raidframesgridscale = "Grid Scale"
		TukuiConfigUILocalization.raidframesmouseoverhighlight = "Enable mouseover highlight on raid frames (heal layout only)"
		TukuiConfigUILocalization.raidframesheight = "Height of Raidframes"
		TukuiConfigUILocalization.raidframeswidth = "Width of Raidframes"
		TukuiConfigUILocalization.raidframespowerbars = "Enable Powerbars in Raidframe"
		TukuiConfigUILocalization.raidframeshealcomm = "Enable Healcomm in Raidframe"
		--------------------------------------------------------------------------
		--auras
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.aurasonlyselfdebuffs = "Display only our own debuffs applied on target"
		TukuiConfigUILocalization.aurasonlyselfbuffs = "Display only our own buffs applied on target"
		TukuiConfigUILocalization.aurasdebuffsize = "Size of the Debuffs"
		TukuiConfigUILocalization.aurasbuffsize = "Size of the Buffs"
		--------------------------------------------------------------------------
		--castbar
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.castbar = "Castbar"
		TukuiConfigUILocalization.castbarclasscolor = "Castbar in classcolor"
		TukuiConfigUILocalization.castbarticks = "Show Ticks"
		TukuiConfigUILocalization.castbarnointerruptcolor = "Color if spell cant interrupt"
		TukuiConfigUILocalization.castbarcastbarcolor = "Choose color of the castbar"
		TukuiConfigUILocalization.castbarplayerheight = "Height of the player castbar"
		TukuiConfigUILocalization.castbarplayerwidth = "Width of the player castbar"
		TukuiConfigUILocalization.castbartargetheight = "Height of the target castbar"
		TukuiConfigUILocalization.castbartargetwidth = "Width of the target castbar"
		--------------------------------------------------------------------------
		--skin
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.skin = "Skins"
		TukuiConfigUILocalization.skinbigwigsreskin = "Reskin Big Wigs frames to match Tukui"
		TukuiConfigUILocalization.skinomenreskin = "Reskin Omen frames to match Tukui"
		TukuiConfigUILocalization.skinrecountreskin = "Reskin Recount frames to match Tukui"
		TukuiConfigUILocalization.skinskadareskin = "Reskin Skada frames to match Tukui"		
		TukuiConfigUILocalization.skindbmreskin = "Reskin Deadly Boss Mods frames to match Tukui"
		TukuiConfigUILocalization.skinweakaurasreskin = "Reskin WeakAuras to match Tukui |cFFFF0000*New*|r"
		TukuiConfigUILocalization.skincliquereskin = "Reskin Clique to match Tukui |cFFFF0000*New*|r"
		--------------------------------------------------------------------------
		--datatext
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.datatextexprepbars = "Enable experience and reputation bar"
		TukuiConfigUILocalization.datatextexpreptext = "Enable text on experience and reputation bars"
		--------------------------------------------------------------------------
		--chat
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.chatwidth = "Height of the chat"
		TukuiConfigUILocalization.chatheight= "Width of the chat"
		--------------------------------------------------------------------------
		--actionbars
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.actionbarvertical_rightbars = "Vertical or horizontal right bars"
		TukuiConfigUILocalization.actionbarmainswap = "Swap bottom actionbars (main bar on top)"
		TukuiConfigUILocalization.actionbarmicromenu = "Enable the micromenubar"
		TukuiConfigUILocalization.actionbarmicromenumouseover = "Only show the micromenu when mouseover"
		TukuiConfigUILocalization.actionbarhpetbar = "Enable horizontal perbar"
		TukuiConfigUILocalization.actionbarsidebar1mouseover = "Enable rightbar on mouseover"
		TukuiConfigUILocalization.actionbarvertical_shapeshift = "Enable vertical Shapeshiftbar"
		--------------------------------------------------------------------------
		--unitframes
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.unitframesclassicons = "Enable classicons"
		TukuiConfigUILocalization.unitframeshealthBgColor = "Color of the Background of your Health"
		TukuiConfigUILocalization.unitframesshowraidpets = "Show Pets in raid"
		TukuiConfigUILocalization.unitframesgradienthealth = "Enable gradient for Health"
		TukuiConfigUILocalization.unitframesgradient = "Color auf the gradient health"
		TukuiConfigUILocalization.unitframespetshow = "Enable pet"
		TukuiConfigUILocalization.unitframestotshow = "Enable target of target"
		TukuiConfigUILocalization.unitframesstyle = "Choose between 1 and 2"
		TukuiConfigUILocalization.unitframesshowhp = "Enable hp/mp on Unitframes"
		TukuiConfigUILocalization.unitframesperconly = "Show only percentage on the unitframes |cFFFF0000*New*|r"
		TukuiConfigUILocalization.unitframeshealthcolor = "Color of the healthbar|cFFFF0000*New*|r"
		--------------------------------------------------------------------------
		--threatbar
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.threatbar = "Threatbar |cFFFF0000*New*|r"
		TukuiConfigUILocalization.threatbarenable = "Enable the threatbar"
		--------------------------------------------------------------------------
		--combattext
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.combattext = "Combat Text"
		TukuiConfigUILocalization.combattextenable = "Enable Combat Text"
		TukuiConfigUILocalization.combattextblizzheadnumbers = "Use blizzard damage/healing output (above mob/player head)"
		TukuiConfigUILocalization.combattextdamagestyle = "Change default damage/healing font above mobs/player heads (you need to restart WoW to see changes)"
		TukuiConfigUILocalization.combattextdamage = "Show outgoing damage in it's own frame"
		TukuiConfigUILocalization.combattexthealing = "Show outgoing healing in it's own frame"
		TukuiConfigUILocalization.combattexthots = "Show periodic healing effects in healing frame"
		TukuiConfigUILocalization.combattextoverhealing = "Show outgoing overhealing"
		TukuiConfigUILocalization.combattextpetdamage = "Show your pet damage"
		TukuiConfigUILocalization.combattextdotdamage = "Show damage from your dots"
		TukuiConfigUILocalization.combattextdamagecolor = "Display damage numbers depending on school of magic"
		TukuiConfigUILocalization.combattextcritprefix = "Symbol that will be added before crit"
		TukuiConfigUILocalization.combattextcritpostfix = "Symbol that will be added after crit"
		TukuiConfigUILocalization.combattexticons = "Show outgoing damage icons"
		TukuiConfigUILocalization.combattexticonsize = "Icon size of spells in outgoing damage frame, also has effect on dmg font size"
		TukuiConfigUILocalization.combattexttreshold = "Minimum damage to show in damage frame"
		TukuiConfigUILocalization.combattexthealtreshold = "Minimum healing to show in incoming/outgoing healing messages"
		TukuiConfigUILocalization.combattextscrollable = "Allows you to scroll frame lines with mousewheel"
		TukuiConfigUILocalization.combattextmaxlines = "Max lines to keep in scrollable mode (more lines = more memory)"
		TukuiConfigUILocalization.combattexttimevisible = "Time(seconds) a single message will be visible"
		TukuiConfigUILocalization.combattextstopvespam = "Automaticly turns off healing spam for priests in shadowform"
		TukuiConfigUILocalization.combattextdkrunes = "Show deathknight rune recharge"
		TukuiConfigUILocalization.combattextkillingblow = "Tells you about your killingblows"
		TukuiConfigUILocalization.combattextmergeaoespam = "Merges multiple aoe damage spam into single message"
		TukuiConfigUILocalization.combattextmergeaoespamtime = "Time in seconds aoe spell will be merged into single message"
		TukuiConfigUILocalization.combattextdispel = "Tells you about your dispels"
		TukuiConfigUILocalization.combattextinterrupt = "Tells you about your interrupts"
		TukuiConfigUILocalization.combattextdirection = "Scrolling Direction('top'(goes down) or 'bottom'(goes up))"
		--------------------------------------------------------------------------
		--tooltip
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.tooltiptalent = "Show the Talentspecialization |cFFFF0000*New*|r"
		TukuiConfigUILocalization.tooltipilvl = "Show the average itemlevel |cFFFF0000*New*|r"
		TukuiConfigUILocalization.tooltipsymbosis = "Show the abilty you get from Symbiosis |cFFFF0000*New*|r"
		TukuiConfigUILocalization.tooltipicon = "Show the icon in Ablilty-tooltips |cFFFF0000*New*|r"
		TukuiConfigUILocalization.tooltipreforge = "Show what is refoged in gear tooltip |cFFFF0000*New*|r"
	end	
end