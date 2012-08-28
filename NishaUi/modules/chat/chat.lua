local T, C, L, G = unpack( Tukui )

local function SetTabStyle( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]
	local color = RAID_CLASS_COLORS[T.myclass]
	local cStart = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255)
	_G[chat .. "TabText"]:Show()

	tab:HookScript("OnEnter", function() _G[chat .. "TabText"]:Show() end )
	tab:HookScript("OnLeave", function() _G[chat .. "TabText"]:Show() end )

	local c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
	_G[chat .. "TabText"]:SetTextColor(c.r, c.g, c.b)
	_G[chat .. "TabText"]:SetFont(unpack(T.Fonts.cTab.setfont))
	_G[chat .. "TabText"].SetTextColor = T.dummy
end

local function SetupChatStyle( self )
	for i = 1, NUM_CHAT_WINDOWS do
	local frame = _G[format( "ChatFrame%s", i )]
		SetTabStyle( frame )
	end
end

TukuiChat:HookScript( "OnEvent", function( self, event, ... )
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format( "ChatFrame%s", i )]
		SetupChatStyle( chat )
	end
end )

BNToastFrame:HookScript( "OnShow", function( TukuiTooltipAnchor )
	TukuiTooltipAnchor:ClearAllPoints()
	TukuiTooltipAnchor:Point( "BOTTOMLEFT", G.Panels.LeftChatBackground, "BOTTOMRIGHT", 3, 0 )
end )