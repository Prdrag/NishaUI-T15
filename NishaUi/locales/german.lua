local T, C, L, G = unpack( Tukui )

if T.client == "deDE" then
	L.mail_need = "Benötigt einen Postkasten"
	L.mail_messages = "Nachricht"
	L.chat_whispers = "Flüster"
	L.buffs_min_abbr = "m."
	L.buffs_hour_abbr = "h."
	L.buffs_day_abbr = "d."
	L.edit = " NishaUi|r"
	L.hello = "Hallo "
	L.hello2 = "!|r Danke das Du"
	L.hello3 = " Nisha UI|r ".. GetAddOnMetadata( "NishaUi", "Version" ) .." verwendest. Weitere Information findest du unter"
	L.hello4 = " http://www.hnd-guild.de|r."
	L.actionbars_locked = "Aktionsleisten |cffe45050gesperrt|r"
	L.actionbars_unlocked = "Aktionsleisten |cff50e468entsperrt|r"
	L.bags_buyslot = "Kaufe Bankfach"
	L.nisha_addon = "NishaUI Addonmanager"
	L.nisha_move = "Move NishaUI"
	L.nisha_config = "NishaUI Ingame Config"
	L.nisha_bind = "NishaUI Bind Hotkeys"
	L.nisha_reload = "Reload NishaUI"
	L.nisha_help = "NishaUI Help"
	L.nisha_ab = "NishaUI Actionbars"
	
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
	
	L.Tooltip_LOADING_TALENT = "Lade Talente..."
	L.Tooltip_NO_TALENTS = "Keine Talente"
	L.Tooltip_ITEMID = "Item ID:"
	
	-- Combat text
	L.COMBATTEXTKILLINGBLOW = "Todesstoß"
	L.COMBATTEXTALREADYUNLOCKED = "Kampftext bereits freigegeben."
	L.COMBATTEXTALREADYLOCKED = "Kampftext bereits gespert."
	L.COMBATTEXTTESTDISABLED = "Kampftext Testmodus deaktiviert."
	L.COMBATTEXTTESTENABLED = "Kampftext Testmodus aktiviert."
	L.COMBATTEXTTESTUSEUNLOCK = "Gib '/xct unlock' ein um die Kampftext Fenster freizugeben um sie verschieben und verändern zu können."
	L.COMBATTEXTTESTUSELOCK = "Gib '/xct lock' ein um den Kampftext Testmodus zu sperren."
	L.COMBATTEXTTESTUSETEST = "Gib '/xct test' ein um den Kampftext Testmodus zu aktivieren."
	L.COMBATTEXTPOPUP = "Um die Kampftext Fensterpositionen zu sichern muß das Interface neu geladen werden."
	L.COMBATTEXTUNSAVED = "Kampftext Fensterpositionen nicht gespeichert, vergiß nicht das Interface neu zu laden."
	L.COMBATTEXTUNLOCKED = "Kmpftext freigegeben."
	
	L.popupsettingsdbm = "Die Position der Elemente von DBM müssen geändert werden."
	
	if( TukuiConfigUILocalization ) then
		--------------------------------------------------------------------------
		--general
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.font = "Schrift"
		TukuiConfigUILocalization.fontfont = "Ändere die Ui Schriftart(An is pixel)"
		TukuiConfigUILocalization.fontdatatextfontsize = "Schriftgröße des Datatextes"
		TukuiConfigUILocalization.fontunitframefontsize = "Schriftgröße der Einheitenfenster"
		TukuiConfigUILocalization.fontnameplatefontsize = "Schriftgröße der Namensplaketten"
		TukuiConfigUILocalization.fontchattabfontsize = "Schriftgröße der Chattabs"
		TukuiConfigUILocalization.fontactionbuttonfontsize = "Schriftgröße der Aktionsleisten"
		TukuiConfigUILocalization.fontskinfontsize = "Schriftgröße der Addonskins"
		--------------------------------------------------------------------------
		--filger
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.filger = "Filger"
		TukuiConfigUILocalization.filgerenable = "Aktiviere Filger"
		TukuiConfigUILocalization.filgerfilgerconfig = "Konfig-Modus"
		TukuiConfigUILocalization.filgericonsize = "Größe der Icons"
		TukuiConfigUILocalization.filgershowtooltip = "Zeige den Toolip"
		TukuiConfigUILocalization.filgermaxtesticon = "Anzahl der Icons im Konfigmodus"
		TukuiConfigUILocalization.filgerbarwidth = "Breite der Leisten"

		TukuiConfigUILocalization.filgerprocs = "Aktiviere Procs"
		TukuiConfigUILocalization.filgerbuffs = "Aktiviere Buffs"
		TukuiConfigUILocalization.filgerdebuffbars = "Aktiviere Debuffs"
		TukuiConfigUILocalization.filgercd = "Aktiviere CD's"
		TukuiConfigUILocalization.filgerspecialbuff = "Aktiviere SpecialBuffs"
		TukuiConfigUILocalization.filgerpvepvpdebuffs = "Aktiviere Pve/PvP Debuffs"
		TukuiConfigUILocalization.filgertargetbuffs = "Aktiviere Target Buffs"

		TukuiConfigUILocalization.filgerproccdirection = "Richtung der Procs"
		TukuiConfigUILocalization.filgerbuffdirection = "Richtung derBuffs"
		TukuiConfigUILocalization.filgerspecialbuffdirection = "Richtung derSpecialBuffs"
		TukuiConfigUILocalization.filgerdebuffdirection = "Richtung der Debuffs"
		TukuiConfigUILocalization.filgercddirection = "Richtung der CD's"
		TukuiConfigUILocalization.filgerpvepvpdirection = "Richtung der Pve/PvP Debuffs"
		TukuiConfigUILocalization.filgertargetbuffdirection = "Richtung der Target Buffs"
		--------------------------------------------------------------------------
		--nisha
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.nisha = "Extras"
		TukuiConfigUILocalization.nishaclick2cast = "Aktiviert Click-to-Cast"
		TukuiConfigUILocalization.nishamarkbar = "Aktiviert die Markbar"
		TukuiConfigUILocalization.nisharaidcd = "Aktiviert die Balken für die Schlachtzugsfähigkeiten"
		TukuiConfigUILocalization.nishathreatbar = "Aktiviert die Bedrohungsleiste im Nishastyle"
		TukuiConfigUILocalization.nishailvlr = "Aktiviere Haltbarkeit und ilvl im Charakterfenster"
		TukuiConfigUILocalization.nishasesenable = "Enable Specswitcherplugin"
		TukuiConfigUILocalization.nishasesenablegear = "Enable Equipmentsetbuttons"
		TukuiConfigUILocalization.nishasesgearswap = "Enable automatic setswap on respec"
		TukuiConfigUILocalization.nishasesset1 = "Set set for first spec (must be an value between 1 - 10)"
		TukuiConfigUILocalization.nishasesset2 = "Set set for second spec (must be an value between 1 - 10)"
		TukuiConfigUILocalization.nishanaga = "Aktiviert das Nagalayout (Alle Aktionsleisten müssen dafür angezeigt werden)"
		--------------------------------------------------------------------------
		--classtimer
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.classtimer = "Classtimer"
		TukuiConfigUILocalization.classtimerenable = "Aktiviere den Classtimer"
		TukuiConfigUILocalization.classtimertargetdebuffs = " Zeige Schwächungszauber über dem Ziel"
		TukuiConfigUILocalization.classtimerplayercolor = "Farbe der Spielerleisten"
		TukuiConfigUILocalization.classtimertargetbuffcolor = "Farbe der Zielbuffleisten"
		TukuiConfigUILocalization.classtimertargetdebuffcolor = "Farbe der Zieldebuffleisten"
		TukuiConfigUILocalization.classtimertrinketcolor = "Farbe der Schmuckstückleisten"
		TukuiConfigUILocalization.classtimerspark = "Aktiviert den Spark"
		TukuiConfigUILocalization.classtimerbarheight = "Höhe der Leisten"
		--------------------------------------------------------------------------
		--Raidbuffreminder
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.buffreminder = "Raidbuffreminder"
		TukuiConfigUILocalization.buffreminderraidbuffreminder = "Aktiviert den Raidbuffreminder"
		--------------------------------------------------------------------------
		--nameplates
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.nameplatenishastyle = "Aktivere Nishastyle"
		TukuiConfigUILocalization.nameplatedebuffs = "Zeige Schwächungszauber auf den Namensplaketen(Dafür muss Nishastyle aktiv sein)"
		TukuiConfigUILocalization.nameplateshowcastbarname = "Zeige den Namen in der Zauberleiste"
		TukuiConfigUILocalization.nameplatewidth = "Breite der Namensplakette"
		TukuiConfigUILocalization.nameplateheight = "Höhe der Namensplakette"
		TukuiConfigUILocalization.nameplateaurassize = "Größe der Debuffs"
		TukuiConfigUILocalization.nameplatenameabbrev = "Namen abgekürzt anzeigen"
		TukuiConfigUILocalization.nameplateadwith = "Zusätzliche Breite der Namensplaketten, wenn die Namensplakette das Ziel ist"
		TukuiConfigUILocalization.nameplateadheight = "Zusätzliche Höhe der Namensplaketten, wenn die Namensplakette das Ziel ist"
		TukuiConfigUILocalization.nameplateclassicons = "Aktiviert die Klassenicons"
		TukuiConfigUILocalization.nameplatehealericon = "Aktiviert das Heilericon"
		--------------------------------------------------------------------------
		--classbar
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.classbar = "Klassenleiste"
		TukuiConfigUILocalization.classbarmonk = "Aktiviere Harmonyleiste(Mönch)"
		TukuiConfigUILocalization.classbardruid = "Aktiviere Eclipseleiste(Druide)"
		TukuiConfigUILocalization.classbardeathknight = " Aktiviere Runenleiste(Todesritter)"
		TukuiConfigUILocalization.classbarshaman = "Aktiviere Totemleiste(Schamane)"
		TukuiConfigUILocalization.classbarpaladin = "Aktiviere Heilige Kraftleiste(Paladin)"
		TukuiConfigUILocalization.classbarwarlock = "Aktiviere Seelensplitterleiste(Hexenmeister)"
		TukuiConfigUILocalization.classbarpriest = "Aktiviere Schattenkugelnleiste(Priester)"
		TukuiConfigUILocalization.classbarrogue = "Aktiviere Combopunktleiste(Schurke)"
		TukuiConfigUILocalization.classbarmage = "Aktiviere Arkaneladunsleiste(Magier)"
		--------------------------------------------------------------------------
		--Announcements
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.announcements = "Ankündigungen"
		TukuiConfigUILocalization.announcementsinterrupts = "Kündige erfolgreiche Unterbrechungen an"
		TukuiConfigUILocalization.announcementsspells = "Kündige Zauber an"
		TukuiConfigUILocalization.announcementschannel = "Kanal in dem du die Zauber ankündigen möchtest(SAY/PARTY/RAID)"
		--------------------------------------------------------------------------
		--Raidframes
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.raidframesgridscale = "Grid Scale"
		TukuiConfigUILocalization.raidframesmouseoverhighlight = "Aktiviere die Hervorhebung bei Maus über Plakette"
		TukuiConfigUILocalization.raidframes = "Raidframes"
		TukuiConfigUILocalization.raidframesunicolor = "Aktivere die einheitliche Farbe der Einheitenfenster"
		TukuiConfigUILocalization.raidframesverticalgrid = "Sortiere den Schlachtzug/Gruppe vertikal"
		TukuiConfigUILocalization.raidframesheight = "Höhe der Raidframes"
		TukuiConfigUILocalization.raidframeswidth = "Breite der Raidframes"
		TukuiConfigUILocalization.raidframespowerbars = "Aktiviere die Powerbars im Raid"
		TukuiConfigUILocalization.raidframeshealcomm = "Aktiviere Healcomm in den Raidframes"
		--------------------------------------------------------------------------
		--auras
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.aurasonlyselfdebuffs = "Zeigt ausschließlich deine Schwächungszauber auf dem Ziel an"
		TukuiConfigUILocalization.aurasonlyselfbuffs = "Zeigt ausschließlich deine Stärkungszauber auf dem Ziel an"
		TukuiConfigUILocalization.aurasdebuffsize = "Größe der Schwächungszauber"
		TukuiConfigUILocalization.aurasbuffsize = "Größe der Stärkungszauber"	
		--------------------------------------------------------------------------
		--castbar
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.castbar = "Castbar"
		TukuiConfigUILocalization.castbarclasscolor = "Aktiviert die Einfärbung der Zauberleiste in Klassenfarbe"
		TukuiConfigUILocalization.castbarticks = "Zeige Ticks"
		TukuiConfigUILocalization.castbarnointerruptcolor = "Farbe, wenn der Zauber nicht unterbrochen werden kann"
		TukuiConfigUILocalization.castbarcastbarcolor = "Farbe der Zauberleiste"
		TukuiConfigUILocalization.castbarplayerheight = "Höhe der Spieler Zauberleiste"
		TukuiConfigUILocalization.castbarplayerwidth = "Breite der Spieler Zauberleiste"
		TukuiConfigUILocalization.castbartargetheight = "Höhe der Ziel Zauberleiste"
		TukuiConfigUILocalization.castbartargetwidth = "Breite der Ziel Zauberleiste"
		--------------------------------------------------------------------------
		--skin
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.skin = "Skins"
		TukuiConfigUILocalization.skinblizzardreskin = "Ädert Blizzardframes so das sie Aussehen wie Tukui"
		TukuiConfigUILocalization.skinbigwigsreskin = "TukUI Skin für Big Wigs"
		TukuiConfigUILocalization.skinomenreskin = "TukUI Skin für Omen"
		TukuiConfigUILocalization.skinrecountreskin = "TukUI Skin für Recount"
		TukuiConfigUILocalization.skinskadareskin = "TukUI Skin für Skada"		
		TukuiConfigUILocalization.skindbmreskin = "TukUI Skin für Deadly Boss Mods"
		TukuiConfigUILocalization.skinskadaembedded = "Bette Skada im rechten Chat ein |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.skinembedright = "Gebe an, welches Addon im rechten Chat eingebettet werden soll(NONE für keins) |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.skinembedrighttoggle = "Aktiviere das Umschalten des eingebetteten Addons |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.skincombattoggle = "Aktiviere das automatische Umschalten, wenn du den Kampf betrittst |cFFFF0000*Neu*|r"
		--------------------------------------------------------------------------
		--datatext
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.datatextexprepbars = "Aktiviert die Erfahrungs- und Rufleiste"
		TukuiConfigUILocalization.datatextexpreptext = "Aktiviert den Text der Erfahrungs- und Rufleiste"
		--------------------------------------------------------------------------
		--chat
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.chatwidth = "Breite des Chats"
		TukuiConfigUILocalization.chatheight= "Höhe des Chats"
		--------------------------------------------------------------------------
		--actionbars
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.actionbarvertical_rightbars = "Vertikale oder horizontale rechte Aktionsleiste"
		TukuiConfigUILocalization.actionbarmainswap = "Wechselt die unteren Aktionsleiste"
		TukuiConfigUILocalization.actionbarmicromenu = "Aktiviert das Mikromenü"
		TukuiConfigUILocalization.actionbarmicromenumouseover = "Zeigt das Mirkomenü nur wenn man mit der Maus drüber fährt"
		TukuiConfigUILocalization.actionbarhpetbar = "Aktiviere horizontale Begleiterleiste"
		TukuiConfigUILocalization.actionbarsidebar1mouseover = "Aktiviere die rechte Leiste per Mouseover"
		TukuiConfigUILocalization.actionbarvertical_shapeshift = "Aktiviere vertikale Shapeshitleiste"
		--------------------------------------------------------------------------
		--unitframes
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.unitframesclassicons = "Aktivere Klassenicons"
		TukuiConfigUILocalization.unitframeshealthBgColor = "Farbe des Hintergrunds deiner Gesundheitsleiste"
		TukuiConfigUILocalization.unitframesshowraidpets = "Zeige Begleiter im raid"
		TukuiConfigUILocalization.unitframesgradienthealth = "Aktiviere den farblichen Anstieg der Lebenspunkte"
		TukuiConfigUILocalization.unitframesgradient = "Farbe der ansteigenden Lebenspunkte"
		TukuiConfigUILocalization.unitframespetshow = "Aktiviere die Begleiteranzeige"
		TukuiConfigUILocalization.unitframestotshow = "Aktiviere Ziel des Ziels"
		TukuiConfigUILocalization.unitframesstyle = "Wähle zwischen Style 1 und 2"
		TukuiConfigUILocalization.unitframesshowhp = "Aktiviere hp/mp Anzeige auf dem Unitframes"
		TukuiConfigUILocalization.unitframesperconly = "Zeige ausschließlich Prozente in den Einheitenfenstern |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.unitframeshealthcolor = "Farbe des Lebensbalkens |cFFFF0000*Neu*|r"
		--------------------------------------------------------------------------
		--threatbar
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.threatbar = "Threatbar |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.threatbarenable = "Enable the threatbar"
		--------------------------------------------------------------------------
		--combattext
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.combattext = "Kampftext"
		TukuiConfigUILocalization.combattextenable = "Kampftext aktivieren"
		TukuiConfigUILocalization.combattextblizzheadnumbers = "Blizzard Schaden-/Heilausgabe benutzen (über Spieler/Kreaturen Kopf)"
		TukuiConfigUILocalization.combattextdamagestyle = "Standard Schaden/Heilung Schriftart über Kreaturen/Spieler Köpfen ändern (Neustart von WoW erforderlich um Anderungen zu sehen)"
		TukuiConfigUILocalization.combattextdamage = "Zeige ausgehenden Schaden in einem eigenen Fenster"
		TukuiConfigUILocalization.combattexthealing = "Zeige ausgehende Heilung in einem eigenen Fenster"
		TukuiConfigUILocalization.combattexthots = "Zeige peroidische Heilungseffekte im Heilungsfenster"
		TukuiConfigUILocalization.combattextoverhealing = "Zeige ausgehende überheilung an"
		TukuiConfigUILocalization.combattextpetdamage = "Zeige Begleiterschaden"
		TukuiConfigUILocalization.combattextdotdamage = "Zeige Schaden von Schaden über Zeit"
		TukuiConfigUILocalization.combattextdamagecolor = "Zeige Schadensnummern in Abhängigkeit von der Art des Zaubers"
		TukuiConfigUILocalization.combattextcritprefix = "Symbol vor einem kritischen Treffer"
		TukuiConfigUILocalization.combattextcritpostfix = "Symbol hinter einem kritischen Treffer"
		TukuiConfigUILocalization.combattexticons = "Zeige Symbole für ausgehenden Schaden"
		TukuiConfigUILocalization.combattexticonsize = "Symbolgröße der Zauber im Fenster für ausgehenden Schaden. Nimmt auch Einfluß auf die Schriftgröße"
		TukuiConfigUILocalization.combattexttreshold = "Ab welcher Größe soll der Schaden angezeigt werden"
		TukuiConfigUILocalization.combattexthealtreshold = "Ab welche Größe soll ein-/ausgehende Heilung angezeigt werden"
		TukuiConfigUILocalization.combattextscrollable = "Erlaubt es dir mit dem Mausrad durch die letzten Zeilen zu scrollen"
		TukuiConfigUILocalization.combattextmaxlines = "Maximale Zeilen, die behalten werden sollen im Scrollmodus (mehr Zeilen = mehr Speicherverbrauch)"
		TukuiConfigUILocalization.combattexttimevisible = "Zeit(Sekunden) wielange eine einzelne Nachricht angezeigt wird"
		TukuiConfigUILocalization.combattextstopvespam = "Heilung von Priestern in Schattenform wird automatisch ausgeschaltet"
		TukuiConfigUILocalization.combattextdkrunes = "Zeige Runenaufladung vom Todesritter"
		TukuiConfigUILocalization.combattextkillingblow = "Teilt dir mit ob du den Todeßtoß bei einer Kreatur/einem Spieler hattest"
		TukuiConfigUILocalization.combattextmergeaoespam = "Vereint mehrfachen Flächenschaden in eine einzige Nachricht"
		TukuiConfigUILocalization.combattextmergeaoespamtime = "Zeit in Sekunden in der ein Flächenzauber in eine Nachricht vereint wird"
		TukuiConfigUILocalization.combattextdispel = "Informiert dich über deine Bannungen"
		TukuiConfigUILocalization.combattextinterrupt = "Informiert dich über deine Unterbrechungen"
		TukuiConfigUILocalization.combattextdirection = "Scrolling Direction('top'(goes down) or 'bottom'(goes up))" -- Needs review
		--------------------------------------------------------------------------
		--tooltip
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.tooltiptalent = "Zeige die Talentspezialisierung im Tooltip an |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.tooltipilvl = "Zeige das durchschnittle Itemlevel im Tooltip an |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.tooltipsymbosis = "Zeigt im Tooltip an, welche Fähigkeit man von Symbiose erhält |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.tooltipicon = "Zeigt das Icon bei Fähigkeiten an |cFFFF0000*Neu*|r"
		TukuiConfigUILocalization.tooltipreforge = "Zeigt an welche Werte umgeschmiedet wurden |cFFFF0000*Neu*|r"
	end
end