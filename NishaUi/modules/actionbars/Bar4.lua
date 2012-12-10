local T, C, L, G = unpack( Tukui )
if( C["actionbar"].enable ~= true ) then return end
local bar = TukuiRightBar
MultiBarRight:SetParent( bar )
for i = 1, 12 do
	local b = _G["MultiBarRightButton" .. i]
	local b2 = _G["MultiBarRightButton" .. i - 1]
	b:Size( T.buttonsize, T.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )

	if( i == 1 ) then
		if( C["actionbar"].vertical_rightbars == true ) then
			b:Point( "TOPRIGHT", TukuiRightBar, -5, -5 )
		else
			b:Point( "BOTTOMLEFT", bar, 5, 5 )
		end
	else
		if( C["actionbar"].vertical_rightbars == true ) then
			b:Point( "TOP", b2, "BOTTOM", 0, -T.buttonspacing )
		else
			b:Point( "LEFT", b2, "RIGHT", T.buttonspacing, 0 )
		end
	end	
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")