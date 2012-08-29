local T, C, L, G = unpack(Tukui)

if( C["actionbar"].enable ~= true ) then return end

G.ActionBars.Stance:ClearAllPoints()
G.ActionBars.Stance:Point("BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPRIGHT", 3, 6)

-----------------------------------------------------------------------
-- Setup Shapeshift Bar
-----------------------------------------------------------------------

local bar = G.ActionBars.Stance
bar:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		StanceBarFrame.ignoreFramePositionManager = true
		StanceBarFrame:StripTextures()
		StanceBarFrame:SetParent(bar)
		StanceBarFrame:ClearAllPoints()
		StanceBarFrame:SetPoint("TOPLEFT", bar, "BOTTOMLEFT", -11, -4)
		StanceBarFrame:EnableMouse(false)
		
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G["StanceButton"..i]
			button:SetFrameStrata("LOW")
			if i ~= 1 then
				button:ClearAllPoints()				
				local previous = _G["StanceButton"..i-1]
				if C["actionbar"].vertical_shapeshift then
					button:Point("TOP", previous, "BOTTOM", 0, -T.buttonspacing)
				else
					button:Point("LEFT", previous, "RIGHT", T.buttonspacing, 0)
				end
			end
			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			else
				button:Hide()
			end
			
			G.ActionBars.Stance["Button"..i] = button
		end
		RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle] hide; show")
	elseif event == "UPDATE_SHAPESHIFT_FORMS" then
		-- Update Shapeshift Bar Button Visibility
		-- I seriously don't know if it's the best way to do it on spec changes or when we learn a new stance.
		if InCombatLockdown() then return end -- > just to be safe ;p
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G["StanceButton"..i]
			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			else
				button:Hide()
			end
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		T.ShiftBarUpdate(self)
		T.StyleShift(self)
	else
		T.ShiftBarUpdate(self)
	end
end)

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")