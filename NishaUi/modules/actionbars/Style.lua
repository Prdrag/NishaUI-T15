local T, C, L = unpack(Tukui)

local function style(self)
	local name = self:GetName()

	--> fixing a taint issue while changing totem flyout button in combat.
	if name:match("MultiCast") then return end

	--> don't skin the boss encounter extra button to match texture (4.3 patch)
	--> http://www.tukui.org/storage/viewer.php?id=913811extrabar.jpg
	if name:match("ExtraActionButton") then return end

	local Count = _G[name.."Count"]
	local HotKey = _G[name.."HotKey"]
	local Border = _G[name.."Panel"]
	local Icon = _G[name.."Icon"]

	Count:SetFont(unpack(T.Fonts.aHotkey.setfont))
	HotKey:SetFont(unpack(T.Fonts.aHotkey.setfont))
end
hooksecurefunc("ActionButton_Update", style)

local function StyleActionBarPetAndShiftButton(normal, button, icon, name, pet)
	local Icon = _G[name.."Icon"]
	local Border = _G[name.."Panel"]
	
    Icon:Point("TOPLEFT", 1, -1)
	Icon:Point("BOTTOMRIGHT", -1, 1)

end

hooksecurefunc(T, "StyleActionBarPetAndShiftButton", StyleActionBarPetAndShiftButton)

local function StyleActionBarButton(self)
	local name = self:GetName()
	local Icon = _G[name.."Icon"]
	local Border = _G[name.."Panel"]

	if name:match("MultiCast") or name:match("ExtraActionButton") then return end
	
end

hooksecurefunc(T, "StyleActionBarButton", StyleActionBarButton)

-- No touchy
local NewBackdrop = {
	edgeFile = C["media"].blank, edgeSize = C["highlight"].FlashBorderSize,
	insets = {left = T.mult, right = T.mult, top = T.mult, bottom = T.mult},
}

local ShowOverlayGlow = function(self)
    if (self.overlay) then
        if (self.overlay.animOut:IsPlaying()) then
            self.overlay.animOut:Stop()
            self.overlay.animIn:Play()
        end
    else
        self.overlay = ActionButton_GetOverlayGlow()
        local frameWidth, frameHeight = self:GetSize()
        self.overlay:SetParent(self)
        self.overlay:ClearAllPoints()
        self.overlay:SetSize(frameWidth * 1.4, frameHeight * 1.4)
        self.overlay:SetPoint("TOPLEFT", self, "TOPLEFT", -frameWidth * 0.2, frameHeight * 0.2)
        self.overlay:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", frameWidth * 0.2, -frameHeight * 0.2)
        self.overlay.animIn:Play()
    end
end
 
local HideOverlayGlow = function(self)
    if (self.overlay) then
        if (self.overlay.animIn:IsPlaying()) then
            self.overlay.animIn:Stop()
        end
        if (self:IsVisible()) then
            self.overlay.animOut:Play()
        else
            ActionButton_OverlayGlowAnimOutFinished(self.overlay.animOut)
        end
    end
end

local ShowOverlayGlowNew = function(self)
	if (self.overlay and C["highlight"].OriginalStyle) then
		if self.NewProc then
			self.NewProc:Hide()
		end
		
		self.overlay:Show()
		ShowOverlayGlow(self)
	else
		HideOverlayGlow(self)
	end

	if (C["highlight"].FlashButton and not self.Animation.Modified) then
		local Animation = self:CreateAnimationGroup()
		Animation:SetLooping("BOUNCE")

		local FadeOut = Animation:CreateAnimation("Alpha")
		FadeOut:SetChange(-1)
		FadeOut:SetDuration(0.40)
		FadeOut:SetSmoothing("IN_OUT")
		
		self.Animation = Animation
		self.Animation.Modified = true
	end
	
	if (self.NewProc and C["highlight"].FlashBorder and not self.NewProc.Styled) then
		self.NewProc:SetBackdrop(NewBackdrop)
		self.NewProc:SetBackdropBorderColor(unpack(C["highlight"].FlashBorderColor))
		self.NewProc.Styled = true
	end

	if (not C["highlight"].OriginalStyle and not self.Animation:IsPlaying()) then
		self.Animation:Play()
		self.NewProc:Show()
	end
end

local HideOverlayGlowNew = function(self)
	if (self.Animation and self.Animation:IsPlaying()) then
		self.Animation:Stop()
		self.NewProc:Hide()
	end
end

hooksecurefunc("ActionButton_ShowOverlayGlow", ShowOverlayGlowNew)
hooksecurefunc("ActionButton_HideOverlayGlow", HideOverlayGlowNew)