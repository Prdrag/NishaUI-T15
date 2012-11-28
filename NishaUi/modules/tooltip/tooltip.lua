local T, C, L, G = unpack(Tukui)

if C["tooltip"].enable ~= true then return end

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
		if IsAddOnLoaded("PulseUI_Raid_Healing") and parent ~= UIParent then
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

--------------------------------------------------------
-- icon on tooltip
--------------------------------------------------------
local function AddTooltipIcon(self, icon)
	if icon then
		local title = _G[self:GetName() .. "TextLeft1"]
		if title and not title:GetText():find("|T" .. icon) then
			title:SetFormattedText("|T%s:20:20:0:0:64:64:5:59:5:59:%d|t %s", icon, 18, title:GetText())
		end
	end
end

local function hookItem(tip)
	tip:HookScript("OnTooltipSetItem", function(self, ...)
		local name, link = self:GetItem()
		local icon = link and GetItemIcon(link)
		AddTooltipIcon(self, icon)
	end)
end
hookItem(_G["GameTooltip"])
hookItem(_G["ItemRefTooltip"])

local function hookSpell(tip)
	tip:HookScript("OnTooltipSetSpell", function(self, ...)
		if self:GetSpell() then
			local name, rank, icon = GetSpellInfo(self:GetSpell())
			AddTooltipIcon(self, icon)
		end
	end)
end
hookSpell(_G["GameTooltip"])
hookSpell(_G["ItemRefTooltip"])