local T, C, L, G = unpack( Tukui )
-------------------------------------------------------
--Functions
-------------------------------------------------------

local function ModifiedBackdrop(self)
	local color = RAID_CLASS_COLORS[T.myclass]
	self:SetBackdropColor(color.r*.15, color.g*.15, color.b*.15)
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end
local function OriginalBackdrop(self)
	self:SetTemplate("Default")
end

local UIOnLogon = CreateFrame("Frame")
UIOnLogon:RegisterEvent("PLAYER_ENTERING_WORLD")
UIOnLogon:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if TukuiSaved.rightbnumber == nil then
		TukuiSaved.rightbnumber = 12
	end
	
	if TukuiSaved.buttonsnumber == nil then
		TukuiSaved.buttonsnumber = 12
	end	
	
	if TukuiSaved.buttonsize == nil then
		TukuiSaved.buttonsize = T.buttonsize
	end	
	
	if TukuiSaved.buttonsizeright == nil then
		TukuiSaved.buttonsizeright = T.buttonsize
	end
end)

local DeleteButton = function()	
	if TukuiSaved.buttonsnumber == 1 then
		for i = 2, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 2 then
		for i = 3, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 3 then
		for i = 4, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 4 then
		for i = 5, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 5 then
		for i = 6, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 6 then
		for i = 7, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 7 then
		for i = 8, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 8 then
		for i = 9, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 9 then
		for i = 10, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 10 then
		for i = 11, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 11 then
		for i = 12, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 12 then
		for i = 1, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber < 1 then
			ActionButton1:SetAlpha(1)
			ActionButton1:SetScale(1)
			MultiBarBottomLeftButton1:SetAlpha(1)
			MultiBarBottomLeftButton1:SetScale(1)
			-- G.ActionBars.Bar1:Size((T.buttonsize) + ( T.buttonspacing * 2) + 2, (T.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize) + ( T.buttonspacing * 2) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
	end
end

local AddButton = function()	
	if TukuiSaved.buttonsnumber == 1 then
		for i = 1, 1 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 2 then
		for i = 1, 2 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 3 then
		for i = 1, 3 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 4 then
		for i = 1, 4 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 5 then
		for i = 1, 5 do
			local b = _G["ActionButton" .. i]
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 6 then
		for i = 1, 6 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber == 7 then
		for i = 1, 7 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 8 then
		for i = 1, 8 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 9 then
		for i = 1, 9 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 10 then
		for i = 1, 10 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 11 then
		for i = 1, 11 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end	
	elseif TukuiSaved.buttonsnumber == 12 then
		for i = 1, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	elseif TukuiSaved.buttonsnumber > 12 then
			ActionButton1:SetAlpha(1)
			ActionButton1:SetScale(1)
		for i = 2, 12 do
			local b = _G["ActionButton" .. i]
			local b2 = _G["MultiBarBottomLeftButton" ..i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			G.ActionBars.Bar1:Size((TukuiSaved.buttonsize) + ( T.buttonspacing * 2) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
			-- G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
		end
	end
end

local DeleteABButton = function()	
	if TukuiSaved.rightbnumber == 1 then
		for i = 2, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 2 then
		for i = 3, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 3 then
		for i = 4, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 4 then
		for i = 5, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 5 then
		for i = 6, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 6 then
		for i = 7, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 7 then
		for i = 8, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 8 then
		for i = 9, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 9 then
		for i = 10, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 10 then
		for i = 11, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 11 then
		for i = 12, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 12 then
		for i = 1, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber) + (T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2, (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + (T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2))
		end
	elseif TukuiSaved.rightbnumber < 1 then
		MultiBarRightButton1:SetAlpha(1)
		MultiBarRightButton1:SetScale(1)
		MultiBarBottomRightButton1:SetAlpha(1)
		MultiBarBottomRightButton1:SetScale(1)
		if TukuiSaved.splitbars == false then
			MultiBarLeftButton1:SetAlpha(1)
			MultiBarLeftButton1:SetScale(1)
		end
		for i = 1, 1 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright + T.buttonspacing*2) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright + T.buttonspacing*2) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end	
	end
end

local AddABButton = function()	
	if TukuiSaved.rightbnumber == 1 then
		for i = 1, 1 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 2 then
		for i = 1, 2 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 3 then
		for i = 1, 3 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 4 then
		for i = 1, 4 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 5 then
		for i = 1, 5 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 6 then
		for i = 1, 6 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 7 then
		for i = 1, 7 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 8 then
		for i = 1, 8 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 9 then
		for i = 1, 9 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 10 then
		for i = 1, 10 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 11 then
		for i = 1, 11 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end	
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber == 12 then
		for i = 1, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(1)
			b:SetScale(1)
			b2:SetAlpha(1)
			b2:SetScale(1)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(1)
				b3:SetScale(1)
			end
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	elseif TukuiSaved.rightbnumber > 12 then
			ActionButton1:SetAlpha(1)
			ActionButton1:SetScale(1)
			MultiBarRightButton1:SetAlpha(1)
			MultiBarRightButton1:SetScale(1)
			MultiBarBottomRightButton1:SetAlpha(1)
			MultiBarBottomRightButton1:SetScale(1)
			MultiBarLeftButton1:SetAlpha(1)
			MultiBarLeftButton1:SetScale(1)
		for i = 2, 12 do
			local b = _G["MultiBarRightButton" .. i]
			local b2 = _G["MultiBarBottomRightButton" .. i]
			local b3 = _G["MultiBarLeftButton" .. i]
			b:SetAlpha(0)
			b:SetScale(0.000001)
			b2:SetAlpha(0)
			b2:SetScale(0.000001)
			if TukuiSaved.splitbars == false then
				b3:SetAlpha(0)
				b3:SetScale(0.000001)
			end
			b:SetAlpha(0)
			b:SetScale(0.000001)
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright + T.buttonspacing*2) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright + T.buttonspacing*2) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end	
	end
end

local Bsize = function()
	for i = 1, 12 do
		local b = _G["ActionButton" .. i]
		local b2 = _G["MultiBarBottomLeftButton" ..i]
		b:SetSize( TukuiSaved.buttonsize, TukuiSaved.buttonsize )
		b2:SetSize( TukuiSaved.buttonsize, TukuiSaved.buttonsize )
		if TukuiSaved.splitbars == true then
			local b3 = _G["MultiBarLeftButton" .. i]
			b3:SetSize( TukuiSaved.buttonsize, TukuiSaved.buttonsize )
			TukuiSplitBarRight:Size(( TukuiSaved.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight())
			TukuiSplitBarLeft:Size(( TukuiSaved.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight())
		end
		G.ActionBars.Bar1:Size((TukuiSaved.buttonsize * TukuiSaved.buttonsnumber ) + ( T.buttonspacing * (TukuiSaved.buttonsnumber+1)) + 2, (TukuiSaved.buttonsize * TukuiSaved.bottomrows) + (T.buttonspacing * (TukuiSaved.bottomrows+1) ) + 2)
	end
end

local Bsizeright = function()
	-- T.buttonsize = TukuiSaved.buttonsize
	for i = 1, 12 do
		local b = _G["MultiBarRightButton" .. i]
		local b2 = _G["MultiBarBottomRightButton" .. i]
		local b3 = _G["MultiBarLeftButton" .. i]
		b:SetSize( TukuiSaved.buttonsizeright, TukuiSaved.buttonsizeright )
		b2:SetSize( TukuiSaved.buttonsizeright, TukuiSaved.buttonsizeright )
		if TukuiSaved.splitbars ~= true then
			b3:SetSize( TukuiSaved.buttonsizeright, TukuiSaved.buttonsizeright )
		end
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * (TukuiSaved.rightbars - 1) + T.buttonspacing * (TukuiSaved.rightbars) ) + 2)
		else
			TukuiRightBar:Size((TukuiSaved.buttonsizeright * TukuiSaved.rightbnumber + T.buttonspacing * (TukuiSaved.rightbnumber + 1)) + 2,  (TukuiSaved.buttonsizeright * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars + 1) ) + 2)
		end
	end
end

local breset = function()
	for i = 1, 12 do
		local b = _G["ActionButton" .. i]
		local b2 = _G["MultiBarBottomLeftButton" ..i]
		local b3 = _G["MultiBarRightButton" .. i]
		local b4 = _G["MultiBarBottomRightButton" .. i]
		local b5 = _G["MultiBarLeftButton" .. i]
		b:SetSize( T.buttonsize, T.buttonsize )
		b2:SetSize( T.buttonsize, T.buttonsize )
		b3:SetSize( T.buttonsize, T.buttonsize )
		b4:SetSize( T.buttonsize, T.buttonsize )
		b5:SetSize( T.buttonsize, T.buttonsize )
		b:SetAlpha(1)
		b:SetScale(1)
		b2:SetAlpha(1)
		b2:SetScale(1)
		b3:SetAlpha(1)
		b3:SetScale(1)
		b4:SetAlpha(1)
		b4:SetScale(1)
		b5:SetAlpha(1)
		b5:SetScale(1)
		TukuiSaved.rightbnumber = 12
		TukuiSaved.buttonsnumber = 12
		TukuiSaved.buttonsize = T.buttonsize
		TukuiSaved.buttonsizeright = T.buttonsize
		G.ActionBars.Bar1:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ) + 2,(T.buttonsize * TukuiSaved.bottomrows) + T.buttonspacing * (TukuiSaved.bottomrows + 1) + 2)
		if TukuiSaved.splitbars == true and TukuiSaved.rightbars ~= 3 then		
			TukuiSplitBarLeft:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, (T.buttonsize * TukuiSaved.bottomrows) + T.buttonspacing * (TukuiSaved.bottomrows + 1) + 2)
			TukuiSplitBarRight:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, (T.buttonsize * TukuiSaved.bottomrows) + T.buttonspacing * (TukuiSaved.bottomrows + 1) + 2)
			TukuiRightBar:Size((T.buttonsize * 12 + T.buttonspacing * 13) + 2,  (T.buttonsize * (TukuiSaved.rightbars-1) + (T.buttonspacing * TukuiSaved.rightbars+1) + 2))
		elseif TukuiSaved.splitbars == true and TukuiSaved.rightbars == 3 then
			TukuiSplitBarLeft:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, (T.buttonsize * TukuiSaved.bottomrows) + T.buttonspacing * (TukuiSaved.bottomrows + 1) + 2)
			TukuiSplitBarRight:Size(( T.buttonsize * 3 ) + ( T.buttonspacing * 4 ) + 2, (T.buttonsize * TukuiSaved.bottomrows) + T.buttonspacing * (TukuiSaved.bottomrows + 1) + 2)
			TukuiRightBar:Size((T.buttonsize * 12 + T.buttonspacing * 13) + 2,  (T.buttonsize * (TukuiSaved.rightbars-1) + (T.buttonspacing * TukuiSaved.rightbars+1) + 2))
		else
			TukuiRightBar:Size((T.buttonsize * 12 + T.buttonspacing * 13) + 2,  (T.buttonsize * TukuiSaved.rightbars + T.buttonspacing * (TukuiSaved.rightbars +1) + 2))
		end
	end
end


-------------------------------------------------------
--Frames
-------------------------------------------------------
local title = CreateFrame( "Frame", "ABtitleframe", UIParent )
title:SetTemplate("Default")
title:Size(280, 20)
title:Hide()
title:Point("CENTER", UIParent, "CENTER", 0, 0 )
title:SetMovable(true)
title:SetScript("OnMouseDown", function() title:ClearAllPoints() title:StartMoving() end)
title:SetScript("OnMouseUp", function() title:StopMovingOrSizing() end)
tinsert(UISpecialFrames, "title")

local titletext = title:CreateFontString( nil, "OVERLAY" )
titletext:SetFont( C["media"].font, 12, "THINOUTLINE" )
titletext:SetPoint( "CENTER", title, "CENTER", 0, -1 )
titletext:SetText( "|cffFF6347NishaUI|r Options" )

local Abtitle = CreateFrame("Frame", "Abtitle", title)
Abtitle:SetTemplate("Transparent")
Abtitle:Size(280, 95)
Abtitle:Point("TOPLEFT", title, "BOTTOMLEFT", 0, -3)

local Abtitlet = CreateFrame("Frame", "ABButtonanchor", Abtitle)
for i = 1, 5 do
	Abtitlet[i] = CreateFrame("Button", "Abtitlet", Abtitle)
	Abtitlet[i]:SetTemplate("Default")
	Abtitlet[i]:SetFrameLevel(10)
	Abtitlet[i].text = Abtitlet[i]:CreateFontString(nil, "OVERLAY")
	Abtitlet[i].text:Point("CENTER", 1, -1)
	Abtitlet[i].text:SetFont(unpack(T.Fonts.movers.setfont))
	if i == 1 then
		Abtitlet[i]:Size(85, 18)
		Abtitlet[i]:Point("TOPLEFT", Abtitle, 5, -5)
		Abtitlet[i].text:SetText(T.cStart.."Buttons")
	elseif i == 2 then
		Abtitlet[i]:Size(85, 18)
		Abtitlet[i]:Point("TOPLEFT", Abtitle, 5, -25)
		Abtitlet[i].text:SetText(T.cStart.."Mainactionbar")
	elseif i == 3 then
		Abtitlet[i]:Size(85, 18)
		Abtitlet[i]:Point("TOPLEFT",Abtitle, 5, -45)
		Abtitlet[i].text:SetText(T.cStart.."Right Actionbar")
	elseif i == 4 then
		Abtitlet[i]:Size(51, 18)
		Abtitlet[i]:Point("TOPLEFT",Abtitle, 95, -5)
		Abtitlet[i].text:SetText(T.cStart.."Count")
	elseif i == 5 then
		Abtitlet[i]:Size(51, 18)
		Abtitlet[i]:Point("TOPLEFT",Abtitle, 153, -5)
		Abtitlet[i].text:SetText(T.cStart.."Size")
	end
end

local ABButton = CreateFrame("Frame", "ABButtonanchor", Abtitlet)
for i = 1, 9 do
	ABButton[i] = CreateFrame("Button", "ABButton"..i, Abtitlet)
	ABButton[i].Text = ABButton[i]:CreateFontString(nil, "OVERLAY")
	ABButton[i].Text:SetFont(unpack(T.Fonts.aHotkey.setfont))
	ABButton[i].Text:Point("CENTER", 1, -1)
	ABButton[i]:SetTemplate("Default")
	ABButton[i]:SetFrameLevel(10)
	ABButton[i]:Size(24, 18)
	ABButton[i]:HookScript("OnEnter", ModifiedBackdrop)
	ABButton[i]:HookScript("OnLeave", OriginalBackdrop)
	if i == 1 then
		ABButton[i]:Point("TOPLEFT", Abtitle, 122, -25)
		ABButton[i].Text:SetTextColor(.3, .3, .9)
		ABButton[i].Text:SetText("+")
		ABButton[i]:SetScript("OnMouseDown", function()
			if TukuiSaved.buttonsnumber > 12 then
				TukuiSaved.buttonsnumber = 1
			else
				TukuiSaved.buttonsnumber = TukuiSaved.buttonsnumber + 1
			end
			AddButton()
		end)
		ABButton[i]:SetScript("OnEvent", AddButton)
	elseif i == 2 then
		ABButton[i]:Point("TOPRIGHT", ABButton1, "TOPLEFT", -3, 0)
		ABButton[i].Text:SetTextColor(.9, .3, .3)
		ABButton[i].Text:SetText("-")
		ABButton[i]:SetScript("OnMouseDown", function()
			if TukuiSaved.buttonsnumber < 1 then
				 TukuiSaved.buttonsnumber = 12
			else
				TukuiSaved.buttonsnumber = TukuiSaved.buttonsnumber - 1
			end
			DeleteButton()
		end)
		ABButton[i]:SetScript("OnEvent", DeleteButton)
	elseif i == 3 then
		ABButton[i]:SetPoint("BOTTOMRIGHT", ABButton1, 0, -20)
		ABButton[i].Text:SetTextColor(.3, .3, .9)
		ABButton[i].Text:SetText("+")
		ABButton[i]:SetScript("OnMouseDown", function()
			if TukuiSaved.rightbnumber > 12 then
				TukuiSaved.rightbnumber = 1
			else
				TukuiSaved.rightbnumber = TukuiSaved.rightbnumber + 1
			end
			AddABButton()
		end)
		ABButton[i]:SetScript("OnEvent", AddABButton)
	elseif i == 4 then
		ABButton[i]:Point("TOPRIGHT", ABButton3, "TOPLEFT", -3, 0)
		ABButton[i].Text:SetTextColor(.9, .3, .3)
		ABButton[i].Text:SetText("-")
		ABButton[i]:SetScript("OnMouseDown", function()
			if TukuiSaved.rightbnumber < 1 then
				 TukuiSaved.rightbnumber = 12
			else
				TukuiSaved.rightbnumber = TukuiSaved.rightbnumber - 1
			end
			DeleteABButton()
		end)
		ABButton[i]:SetScript("OnEvent", DeleteABButton)
	elseif i == 5 then
		ABButton[i]:Point("TOPLEFT",Abtitle, 180, -25)
		ABButton[i].Text:SetTextColor(.3, .3, .9)
		ABButton[i].Text:SetText("+")
		ABButton[i]:SetScript("OnMouseDown", function()

			TukuiSaved.buttonsize = TukuiSaved.buttonsize + 1
			Bsize()
		end)
		ABButton[i]:SetScript("OnEvent", Bsize)
	elseif i == 6 then
		ABButton[i]:Point("TOPRIGHT", ABButton5, "TOPLEFT", -3, 0)
		ABButton[i].Text:SetTextColor(.9, .3, .3)
		ABButton[i].Text:SetText("-")
		ABButton[i]:SetScript("OnMouseDown", function()

			TukuiSaved.buttonsize = TukuiSaved.buttonsize - 1
			Bsize()
		end)
		ABButton[i]:SetScript("OnEvent", Bsize)
	elseif i == 7 then
		ABButton[i]:Point("BOTTOMRIGHT", ABButton5, 0, -20)
		ABButton[i].Text:SetTextColor(.3, .3, .9)
		ABButton[i].Text:SetText("+")
		ABButton[i]:SetScript("OnMouseDown", function()

			TukuiSaved.buttonsizeright = TukuiSaved.buttonsizeright + 1
			Bsizeright()
		end)
		ABButton[i]:SetScript("OnEvent", Bsizeright)
	elseif i == 8 then
		ABButton[i]:Point("TOPRIGHT", ABButton7, "TOPLEFT", -3, 0)
		ABButton[i].Text:SetTextColor(.9, .3, .3)
		ABButton[i].Text:SetText("-")
		ABButton[i]:SetScript("OnMouseDown", function()

			TukuiSaved.buttonsizeright = TukuiSaved.buttonsizeright - 1
			Bsizeright()
		end)
		ABButton[i]:SetScript("OnEvent", Bsizeright)
	elseif i == 9 then
		ABButton[i]:Size(51, 18)
		ABButton[i]:Point("TOPLEFT",Abtitle, 5, -70)
		ABButton[i].Text:SetTextColor(.9, .3, .3)
		ABButton[i].Text:SetText("Reset")
		ABButton[i]:SetScript("OnMouseDown", function()
			breset()
		end)
	end
	ABButton[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
	ABButton[i]:RegisterEvent("PLAYER_REGEN_DISABLED")
	ABButton[i]:RegisterEvent("PLAYER_REGEN_ENABLED")
	ABButton[i]:SetScript("OnUpdate", function() 
		if TukuiSaved.actionbarsLocked == true then
			for i = 1, 8 do
				ABButton[i]:EnableMouse(false)
			end
		elseif TukuiSaved.actionbarsLocked == false then
			for i = 1, 8 do
				ABButton[i]:EnableMouse(true)
			end
		end
	end)	
end

local TukuiToggle = TukuiToggleActionbar

local ABupper = CreateFrame("Button", "ABupper", Abtitlet)
ABupper:SetTemplate("Default")
ABupper:SetFrameLevel(10)
ABupper:Point("TOPRIGHT", Abtitle, -5, -5)
ABupper:Size(63, 18)
ABupper.Text = ABupper:CreateFontString(nil, "OVERLAY")
ABupper.Text:SetFont(unpack(T.Fonts.aHotkey.setfont))
ABupper.Text:SetText(T.cStart.."Actionbars")
ABupper.Text:Point("CENTER", 1, -1)


for i = 1, 6 do
	TukuiToggle[i]:SetParent("Abtitle")
	TukuiToggle[i].Text:Point("CENTER", 1, -1)
	TukuiToggle[i].Text:SetFont(unpack(T.Fonts.aHotkey.setfont))
	TukuiToggle[i]:HookScript("OnEnter", ModifiedBackdrop)
	TukuiToggle[i]:HookScript("OnLeave", OriginalBackdrop)
	if i == 2 then
		TukuiToggle[i]:Point("TOPRIGHT", Abtitle, -5, -25)
		TukuiToggle[i]:Size(30, 18)
	elseif i == 3 then
		TukuiToggle[i]:Size(30, 18)
	elseif i == 6 then
		TukuiToggle[i]:ClearAllPoints()
		TukuiToggle[i]:Size(51, 18)
		TukuiToggle[i]:Point("TOPLEFT",Abtitle, 59, -70)	
	end
end

local close = CreateFrame("Button", "ABCloseButton", title, "UIPanelCloseButton")
close:Point("RIGHT", title, "RIGHT", 0, 0)
close:SkinCloseButton()
close:SetScript("OnClick", function()
	if title:IsVisible() then
		title:Hide()
	else
		title:Show()
	end
end)

local ABToggle = function()
	if title:IsVisible() then
		title:Hide()
	else
		title:Show()
	end
end

SLASH_ABCONF1 = "/abconfig"
SlashCmdList.ABCONF = ABToggle