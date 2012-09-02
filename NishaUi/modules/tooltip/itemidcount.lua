local T, C, L, G = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["tooltip"].enable then return end

hooksecurefunc( GameTooltip, "SetUnitAura", function( self, ... )
	local name, _, _, _, _, _, _, caster, _, _, id = UnitAura( ... )

	local left = ""
	local right = ""

	if( id ~= nil ) then left = "|cFFCA3C3C"..ID.."|r " .. id end

	if( caster ~= nil ) then right = UnitName( caster ) end

	self:AddDoubleLine( " ", " " )
	self:AddDoubleLine( left, right )
	self:Show()
	if IsControlKeyDown() and IsShiftKeyDown()then
		print("|cff5065e4Aura: |cff71d5ff|Hspell:"..id.."|h["..name.."]|h|r - " .. id)
	end
end )

hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
	local id = select(11,UnitBuff(...))
	if id then
		self:AddLine("|cFFCA3C3C"..ID.."|r".." "..id)
		self:Show()
		if IsControlKeyDown() and IsShiftKeyDown()then
		 print("|cff50e468Buff: |cff71d5ff|Hspell:"..id.."|h["..name.."]|h|r - " .. id)
		end
	end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
	local id = select(11,UnitDebuff(...))
	if id then
		self:AddLine("|cFFCA3C3C"..ID.."|r".." "..id)
		self:Show()
		if IsControlKeyDown() and IsShiftKeyDown()then
		print("|cffe45050Debuff: |cff71d5ff|Hspell:"..id.."|h["..name.."]|h|r - " .. id)
		end
	end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
	local id = select(3,self:GetSpell())
	if id then
		self:AddLine("|cFFCA3C3C"..ID.."|r".." "..id)
		self:Show()
		if IsControlKeyDown() then
			print("|cFFCA3C3C"..ID.."|r".." "..id)
		end
	end
end)