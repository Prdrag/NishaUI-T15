local T, C, L, G = unpack( Tukui )
if( C["actionbar"].enable ~= true ) then return end
local bar = TukuiBar1
--This frame puts spells on the damn actionbar, fucking obliterate that shit
IconIntroTracker:UnregisterAllEvents()
IconIntroTracker:Hide()
IconIntroTracker:SetParent(UIHider)


bar:HookScript("OnEvent", function(self, event, unit)
	if event == "PLAYER_ENTERING_WORLD" then
		local button
		for i = 1, 12 do
			button = _G["ActionButton" .. i]
			button:SetSize( T.buttonsize, T.buttonsize )
			button:ClearAllPoints()
			button:SetParent( bar )
			button:SetFrameStrata( "BACKGROUND" )
			button:SetFrameLevel( 15 )
			if( i == 1 ) then
				if( C["actionbar"].mainswap == true ) then
					button:Point( "TOPLEFT", 5, -5 )
				else
					button:Point( "BOTTOMLEFT", 5, 5 )
				end
			else
				local previous = _G["ActionButton" .. i - 1]
				button:SetPoint( "LEFT", previous, "RIGHT", T.buttonspacing, 0 )
			end
		end
	end
end)