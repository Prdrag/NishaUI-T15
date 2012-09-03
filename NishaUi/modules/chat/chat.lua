local T, C, L, G = unpack( Tukui )

local function SetTabStyle( frame )
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat .. "Tab"]
	local color = RAID_CLASS_COLORS[T.myclass]
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
	TukuiTooltipAnchor:Point( "CENTER", BNtoastframemover, "CENTER", 0, 0 )
end )

T.SetDefaultChatPosition = function( frame )
	if( frame ) then
		local id = frame:GetID()
		local name = FCF_GetChatWindowInfo( id )
		local fontSize = select( 2, frame:GetFont() )

		if( fontSize < 12 ) then
			FCF_SetChatWindowFontSize( nil, frame, 12 )
		else
			FCF_SetChatWindowFontSize( nil, frame, fontSize )
		end

		if( id == 1 ) then
			frame:ClearAllPoints()
			frame:Point( "TOPLEFT", G.Panels.LeftChatTabsBackground, "BOTTOMLEFT", 0, -2 )
			frame:Point( "BOTTOMRIGHT", G.Panels.DataTextLeft, "TOPRIGHT", 0, 2 )
		elseif( id == 4 and name == LOOT ) then
			if( not frame.isDocked ) then
				frame:ClearAllPoints()
				frame:Point( "TOPLEFT", G.Panels.RightChatTabsBackground, "BOTTOMLEFT", 0, -2 )
				frame:Point( "BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, 2 )
				if( C["chat"].justifyRight == true ) then
					frame:SetJustifyH( "RIGHT" )
				else
					frame:SetJustifyH( "LEFT" )
				end
			end
		end

		if( not frame.isLocked ) then
			FCF_SetLocked( frame, 1 )
		end
	end
end
hooksecurefunc( "FCF_RestorePositionAndDimensions", T.SetDefaultChatPosition )