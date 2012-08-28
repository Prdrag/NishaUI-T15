local T, C, L, G = unpack( Tukui )
T.color = RAID_CLASS_COLORS[T.myclass]

local function Animate( self, x, y, duration )
	self.anim = self:CreateAnimationGroup( "Move_In" )
	self.anim.in1 = self.anim:CreateAnimation( "Translation" )
	self.anim.in1:SetDuration( 0 )
	self.anim.in1:SetOrder( 1 )
	self.anim.in2 = self.anim:CreateAnimation( "Translation" )
	self.anim.in2:SetDuration( duration )
	self.anim.in2:SetOrder( 2 )
	self.anim.in2:SetSmoothing( "OUT" )
	self.anim.out1 = self:CreateAnimationGroup( "Move_Out" )
	self.anim.out2 = self.anim.out1:CreateAnimation( "Translation" )
	self.anim.out2:SetDuration( duration )
	self.anim.out2:SetOrder( 1 )
	self.anim.out2:SetSmoothing( "IN" )
	self.anim.in1:SetOffset( T.Scale( x ), T.Scale( y ) )
	self.anim.in2:SetOffset( T.Scale( -x ), T.Scale( -y ) )
	self.anim.out2:SetOffset( T.Scale( x ), T.Scale( y ) )
	self.anim.out1:SetScript( "OnFinished", function() self:Hide() end )
end

local function CreateOverlay( frame )
	if( frame.overlay ) then return end

	local overlay = frame:CreateTexture( frame:GetName() and frame:GetName() .. "Overlay" or nil, "BORDER", frame )
	overlay:ClearAllPoints()
	overlay:Point( "TOPLEFT", 2, -2 )
	overlay:Point( "BOTTOMRIGHT", -2, 2 )
	overlay:SetTexture(C["media"].normTex)
	overlay:SetVertexColor( 0.05, 0.05, 0.05 )
	frame.overlay = overlay
end

local function FadeIn( frame )
	UIFrameFadeIn( frame, 0.4, frame:GetAlpha(), 1 )
end

local function FadeOut( frame )
	UIFrameFadeOut( frame, 0.8, frame:GetAlpha(), 0 )
end

T.RoleIconUpdate = function(self, event)
		local lfdrole = self.LFDRole

		local role = UnitGroupRolesAssigned(self.unit)

		if(role == 'TANK' or role == 'HEALER' or role == 'DAMAGER') and UnitIsConnected(self.unit) then
			if role == 'TANK' then
				lfdrole:SetTexture([[Interface\AddOns\NishaUi\medias\textures\tank.tga]])
			elseif role == 'HEALER' then
				lfdrole:SetTexture([[Interface\AddOns\NishaUi\medias\textures\healer.tga]])
			elseif role == 'DAMAGER' then
				lfdrole:SetTexture([[Interface\AddOns\NishaUi\medias\textures\dps.tga]])
			end
			
			lfdrole:Show()
		else
			lfdrole:Hide()
		end	
end

local function SlideIn( self )
	if( not self.anim ) then
		Animate( self )
	end

	self.anim.out1:Stop()
	self:Show()
	self.anim:Play()
end

local function SlideOut( self )
	if( self.anim ) then
		self.anim:Finish()
	end

	self.anim:Stop()
	self.anim.out1:Play()
end

function ColorGradient(perc, ...)
	if perc >= 1 then
		local r, g, b = select(select('#', ...) - 2, ...)
		return r, g, b
	elseif perc <= 0 then
		local r, g, b = ...
		return r, g, b
	end
	
	local num = select('#', ...) / 3

	local segment, relperc = math.modf(perc*(num-1))
	local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

	return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
end

local function addapi( object )
	local mt = getmetatable( object ).__index

	if not object.Animate then mt.Animate = Animate end
	if not object.CreateOverlay then mt.CreateOverlay = CreateOverlay end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
	if not object.SlideIn then mt.SlideIn = SlideIn end
	if not object.SlideOut then mt.SlideOut = SlideOut end
end

local handled = { ["Frame"] = true }
local object = CreateFrame( "Frame" )
addapi( object )
addapi( object:CreateTexture() )
addapi( object:CreateFontString() )

object = EnumerateFrames()
while object do
	if( not handled[object:GetObjectType()] ) then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames( object )
end