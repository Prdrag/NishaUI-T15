local T, C, L, G = unpack( Tukui )

local bar = TukuiBar3
MultiBarBottomRight:SetParent(bar)
if( C["actionbar"].enable ~= true ) then return end

for i = 1, 12 do
	local b = _G["MultiBarLeftButton" .. i]
	local b2 = _G["MultiBarLeftButton" .. i - 1]
	b:Size( T.buttonsize, T.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )
end
RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")