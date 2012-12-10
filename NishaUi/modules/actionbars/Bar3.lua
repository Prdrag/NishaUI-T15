local T, C, L, G = unpack(Tukui)
if( C["actionbar"].enable ~= true ) then return end

local bar = TukuiBar3
if not C.nisha.naga == true then
	MultiBarBottomRight:SetParent(bar)
else
	MultiBarLeft:SetParent(NagaBar)
end

for i = 1, 12 do
	local b = _G["MultiBarLeftButton" .. i]
	local b2 = _G["MultiBarLeftButton" .. i - 1]
	b:Size( T.buttonsize, T.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )
	if C.nisha.naga == true then
		if i == 1 then
			b:SetPoint("TOPLEFT", nagaBar, "TOPLEFT", T.Scale(4), T.Scale(-4))
		elseif i == 4 then
			b:SetPoint("TOP", MultibarLeftButton1, "BOTTOM", 0, T.Scale(-4))
		elseif i == 7 then
			b:SetPoint("TOP", MultibarLeftButton4, "BOTTOM", 0, T.Scale(-4))
		elseif i == 10 then
			b:SetPoint("TOP", MultibarLeftButton7, "BOTTOM", 0, T.Scale(-4))
		else
		local previous = _G["MultibarLeftButton"..i-1]
			b:SetPoint("LEFT", previous, "RIGHT", T.buttonspacing, 0)
		end
	end
	
end
RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")