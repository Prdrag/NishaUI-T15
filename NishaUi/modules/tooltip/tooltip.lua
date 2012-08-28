local T, C, L, G = unpack(Tukui)

local function TooltipUpdateTooltip(self)
	local owner = self:GetOwner()
	if not owner then return end	
	local name = owner:GetName()
	
	-- fix X-offset or Y-offset
	local x = T.Scale(5)
	
	-- mouseover
	if self:GetAnchorType() == "ANCHOR_CURSOR" then	
		if NeedBackdropBorderRefresh then
			self:ClearAllPoints()
			NeedBackdropBorderRefresh = false			
			self:SetBackdropColor(unpack(C.media.backdropcolor))
			if not C["tooltip"].cursor then
				self:SetBackdropBorderColor(unpack(C.media.bordercolor))
			end
		end
	elseif self:GetAnchorType() == "ANCHOR_NONE" and InCombatLockdown() and C["tooltip"].hidecombat == true then
		self:Hide()
	end
	
	if name and (TukuiPlayerBuffs or TukuiPlayerDebuffs) then
		if (TukuiPlayerBuffs:GetPoint():match("LEFT") or TukuiPlayerDebuffs:GetPoint():match("LEFT")) and (name:match("TukuiPlayerBuffs") or name:match("TukuiPlayerDebuffs")) then
			self:SetAnchorType("ANCHOR_BOTTOMRIGHT", x, -x)
		end
	end
		
	if (owner == MiniMapBattlefieldFrame or owner == MiniMapMailFrame) and TukuiMinimap then
		if TukuiMinimap:GetPoint():match("LEFT") then 
			self:SetAnchorType("ANCHOR_TOPRIGHT", x, -x)
		end
	end
	
	if self:GetAnchorType() == "ANCHOR_NONE" and TukuiTooltipAnchor then
		local point = TukuiTooltipAnchor:GetPoint()
		if point == "TOPLEFT" then
			self:ClearAllPoints()
			self:SetPoint("TOPLEFT", TukuiTooltipAnchor, "BOTTOMLEFT", 0, -x)			
		elseif point == "TOP" then
			self:ClearAllPoints()
			self:SetPoint("TOP", TukuiTooltipAnchor, "BOTTOM", 0, -x)			
		elseif point == "TOPRIGHT" then
			self:ClearAllPoints()
			self:SetPoint("TOPRIGHT", TukuiTooltipAnchor, "BOTTOMRIGHT", 0, -x)			
		elseif point == "BOTTOMLEFT" or point == "LEFT" then
			self:ClearAllPoints()
			self:SetPoint("BOTTOMLEFT", TukuiTooltipAnchor, "TOPLEFT", 0, x)		
		elseif point == "BOTTOMRIGHT" or point == "RIGHT" then
			if TukuiBags and TukuiBags:IsShown() then
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", TukuiBags, "TOPRIGHT", 0, x)			
			elseif not C["chat"].background then
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, x)
			elseif HasPetUI() then
				if not C["actionbar"].vertical_rightbars then
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", TukuiPetBar,  "TOPRIGHT", 0, x)
				elseif C["actionbar"].vertical_rightbars then
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, x)
				else
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", TukuiPetBar, "TOPRIGHT", 0, x)
				end
			else
				if TukuiSaved.rightbars > 0 and not C["actionbar"].vertical_rightbars then
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", TukuiRightBar, "TOPRIGHT", 0, x)
				else
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, x)
				end
			end
		else
			self:ClearAllPoints()
			self:SetPoint("BOTTOM", TukuiTooltipAnchor, "TOP", 0, x)		
		end
	end
end

local function SetTooltipDefaultAnchor(self, parent)
	if C["tooltip"].cursor == true then
		if IsAddOnLoaded("NishaUi_Raid_Healing") and parent ~= UIParent then
			self:SetOwner(parent, "ANCHOR_NONE")
		else
			self:SetOwner(parent, "ANCHOR_CURSOR")
		end
	else
		self:SetOwner(parent, "ANCHOR_NONE")
	end
	
	self:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -111111, -111111) -- hack to update GameStatusBar instantly.
end
hooksecurefunc("GameTooltip_SetDefaultAnchor", SetTooltipDefaultAnchor)

GameTooltip:HookScript( "OnUpdate", function( self, ... )
	TooltipUpdateTooltip( self )
end )