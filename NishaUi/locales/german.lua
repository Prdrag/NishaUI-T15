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
	L.hello4 = " http://www.pulse-guild.de|r."
	L.actionbars_locked = "Aktionsleisten |cffe45050gesperrt|r"
	L.actionbars_unlocked = "Aktionsleisten |cff50e468entsperrt|r"
	
	L.nisha_addon = "NishaUI Addonmanager"
	L.nisha_move = "Move NishaUI"
	L.nisha_config = "NishaUI Ingame Config"
	L.nisha_bind = "NishaUI Bind Hotkeys"
	L.nisha_reload = "Reload NishaUI"
	L.nisha_help = "NishaUI Help"
	L.nisha_ab = "Pulse Actionbars"

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
	-------------------------------------------------
	-- Helpframe
	-------------------------------------------------
	L.helpcontent_text1 = "Generell"
	L.helpcontent_text2 = "Wilkommen im Hilfe Panel vom NishaUI!\nDieser Panel kann dir helfen, einige wichtige Optionen und Kommandos für das NishaUI zu finden"
	L.helpcontent_text3 = "Bitte wähle eine Kategorie!"
	L.helpcontent_text4 = "Viel Spaß!"

	L.helpcontent7_text1 = "Credits"
	L.helpcontent7_text2 = "Viele Dank an Tukz, der sehr viele Mühe und Arbeit."
	L.helpcontent7_text3 = "und wir wollen natürlich nicht die folgenden Leute vergeßen:"
	L.helpcontent7_text4 = "Sinaris, Elv, nightcracker, Eclipse, Hydra, Asphyxia, Jasje, Epicgrimm, JerichoHM and all others who help Tukz and the Editors for the awesome Tukui"

	L.helpcontent6_text1 = "Bug Reports & Anregungen"
	L.helpcontent6_text2 = "Bug Reports können auf zwei Seiten gemacht werden. Die erste ist das TukUI Forum im Thread Bug Reports and Errors. Bitte lest euch erst durch wie man einen korrekten Bug-Report erstellt. Die andere Seite ist das Pulse Forum."
	L.helpcontent6_text3 = "Anregungen könnt ihr unter Pulse.com im Forum loswerden."
	L.helpcontent6_text4 = "PMs or ingame whisper werden nicht bearbeitet, da alle Benutzer die Möglichkeit haben sollen, die Entwicklung zu vervolgen."

	L.helpcontent5_text1 = "Aktionsleisten"
	L.helpcontent5_text2 = "Das Standardlayout bietet eine Aktionsleiste in der Mitte und eine über den rechten Chat an. Solltet ihr mehrere Leisten benötigen, könnt ihr über den Knopf über der mittleren Aktionsleiste, eine Aktionleiste mehr in der Mitte aktivieren. Zusätzlich habt ihr noch die Splittbars, welches aktionsleisten mit 3x2 Knöfen neben der Hauptaktionsleiste ist. Den Knopf hierfür findet ihr Links & Rechts neben der Hauptaktionsleiste. Ihr habt zusätzlich natürlich noch die Option eine Aktionsleiste über der rechten Aktionsleiste hinzuzufügen indem ihr im rechten Chattab and der rechten Seite auf + und - drückt"
	L.helpcontent5_text3 = "Alle Knöpfe zum erweitern der Aktionsleisten sind Mouse-Over, dass heißt ihr seht sie erst, wenn ihr mit der Maus drüber fahrt. Um die Aktionsleiste zu sperren findet ihr einen Knopf direkt über der rechten Seite des InfoPanels."
	L.helpcontent5_text4 = "In der Ingame Konfig. findet ihr zusätzlich eine Option um die Hauptaktionsleiste mit der zweiten Leisten zu wechseln, so dass die erste Leiste oben ist. Zusätzlich könnt ihr dort entscheiden, ob ihr vertikale oder horizontale rechte Aktionsleisten möchtet. Wenn ihr horizontale gewählt habt, werden diese immer bündig über den rechten Chat angezeigt."
	L.helpcontent5_text5 = "Ihr habt zudem die Möglichkeit die Gestaltung der Aktionsleisten zu wählen. Zur Auswahl stehen die Optionen gradient, inverted gradient & gloss. Danke an Ext!"

	L.helpcontent4_text1 = "Skins, Addons"
	L.helpcontent4_text2 = "Das ganze Interface hat fertig geskinnte Blizzardframes. Wenn ihr diese nicht wollt, könnt ihr diese in der Ingame Konfig. unter Generell ausschalten."
	L.helpcontent4_text3 = "Die meisten Addons wie DBM, DXE, Recount, Skada usw. sind standardmäßig bereits von uns geskinned. Diese könnt ihr ebenfalls in der Ingamee Konfig. ausschalten."

	L.helpcontent3_text1 = "Chat"
	L.helpcontent3_text5 = ""
	L.helpcontent3_text2 = "In der Ingame Konfig könnt ihr in the SubSektion Chat könnt ihr die Breite und Höhe des Chats anpassen."
	L.helpcontent3_text3 = "Ebenfalls dort könnt ihr den Text an die rechte Seite des Chats setzen."
	L.helpcontent3_text4 = "Wenn ihr keinen rechten Chat wollt, öffnet panels.lua in Tukui\modules\panels und sucht nach TukuiChatRight, TukuiTabsRight und fügt dort ein Framename:SetAlpha(0) hinzu."

	L.helpcontent2_text1 = "Unitframes"
	L.helpcontent2_text2 = "NishaUI bzw TukUi bietet euch Einheitenfenster für Spieler, Begleiter, Ziel, Ziel des Ziels, Fokus, Fokus Ziel, Boss, Arena, Gruppe, Schlachtzug."
	L.helpcontent2_text3 = "Optionen zu den Einheitenfenstern findet ihr in der Ingame Konf. unter Einheitenfenster."
	L.helpcontent2_text4 = "Im Heiler Layout könnt ihr die Option Aktiviere Grid einstellen, diese Option ist ausschließlich für das Heiler Layout."

	L.helpcontent1_text1 = "Slashcommands"
	L.helpcontent1_text2 = "/nhelp => öffnet dieses Fenster\n/resetui => Setz die ganze Positionen das gesamte UI zurück\n/install => Installiert das gesamte UI"
	L.helpcontent1_text3 = "/moveui or /mtukui => Aktiviert die Mögleichtkeit die Elemente das Uis zu verschieben\n/kb => Setzen der Tastenbelegung\n/rl => Lädt das Ui neu"
	L.helpcontent1_text4 = "/heal => Wechsel zum Heiler-Layout\n/dps => Wechsel zum DPS-Layout\n/tc => öffnet die Ingame-Konfig"
	L.helpcontent1_text5 = "/am => öffnet den Addonmanager\n/version => Zeigt das Versionsfenster\n/ali -> legt ein Gitternetz über den gesamten Bildschirm zum besseren justieren der Elemente"
	
	L.MISCBINDEROPEN = "Maustasten"
	L.popupsettingsdbm = "Die Elemente von DBM müssen noch geändert werden."
	
	if( TukuiConfigUILocalization ) then
		--------------------------------------------------------------------------
		--general
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.generalfont = "Ändere die Ui Schriftart(An is pixel)"
		--------------------------------------------------------------------------
		--filger
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.filger = "Filger"
		TukuiConfigUILocalization.filgerenable = "Aktiviere Filger"
		TukuiConfigUILocalization.filgerfilgerconfig = "Konfig-Modus"
		TukuiConfigUILocalization.filgericonsize = "Größe der Icons"
		TukuiConfigUILocalization.filgerproccs = "Richtung der Procs|r"
		TukuiConfigUILocalization.filgerbuffs = "Richtung der Buffs|r"
		TukuiConfigUILocalization.filgerdebuffs = "Richtung der Debuffs|r"
		TukuiConfigUILocalization.filgercd = "Richtung der CDs|r"
		TukuiConfigUILocalization.filgerpet = "Richtung der Pet Buffs|r"
		--------------------------------------------------------------------------
		--nisha
		--------------------------------------------------------------------------		
		TukuiConfigUILocalization.nisha = "Extras"
		TukuiConfigUILocalization.nishaclick2cast = "Aktiviert Click-to-Cast"
		TukuiConfigUILocalization.nishamarkbar = "Aktiviert die Markbar"
		TukuiConfigUILocalization.nisharaidcd = "Aktiviert die Balken für die Schlachtzugsfähigkeiten"
		TukuiConfigUILocalization.nishathreatbar = "Aktiviert die Bedrohungsleiste im Nishastyle"
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
		--------------------------------------------------------------------------
		--unitframes
		--------------------------------------------------------------------------
		TukuiConfigUILocalization.unitframesclassicons = "Aktivere Klassenicons"
		TukuiConfigUILocalization.unitframeshealthBgColor = "Farbe des Hintergrunds deiner Gesundheitsleiste"
		TukuiConfigUILocalization.unitframesshowraidpets = "Zeige Begleiter im raid"
		TukuiConfigUILocalization.unitframesgradienthealth = "Aktiviere den farblichen Anstieg der Lebenspunkte"
		TukuiConfigUILocalization.unitframesgradient = "Farbe der ansteigenden Lebenspunkte"
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