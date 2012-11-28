local T, C, L, G = unpack(Tukui)
if C["nisha"].sesenable ~= true then return end

-- colors
local hoverovercolor = {.4, .4, .4}
local cp = "|cff319f1b" -- +
local cm = "|cff9a1212" -- -
local dr, dg, db = unpack({ .4, .4, .4 })

-- Gear Settings
local Enablegear = C["nisha"].sesenablegear -- herp
local Autogearswap = C["nisha"].sesgearswap -- derp
local set1 = C["nisha"].sesset1 -- this is the gear set that gets equiped with your primary spec. (must be the NUMBER from 1-10)
local set2 = C["nisha"].sesset2 -- this is the gear set that gets equiped with your secondary spec.(must be the NUMBER from 1-10)

--functions
local function HasDualSpec() if GetNumSpecGroups() > 1 then return true end end

local function GetSecondaryTalentIndex()
	local secondary
	if GetActiveSpecGroup() == 1 then
		secondary = 2
	else
		secondary = 1
	end
	return secondary
end

local function ActiveTalents()
	local Tree = GetSpecialization(false, false, GetActiveSpecGroup())
	return Tree
end	

local function UnactiveTalents()
	local sTree = GetSpecialization(false, false, (GetSecondaryTalentIndex()))
	return sTree
end

local function HasUnactiveTalents()
	local sTree = GetSpecialization(false, false, (GetSecondaryTalentIndex()))
	if sTree == nil then
		return false
	else
		return true
	end
end

local function AutoGear(set1, set2)
	local name1 = GetEquipmentSetInfo(set1)
	local name2 = GetEquipmentSetInfo(set2)
	if GetActiveSpecGroup() == 1 then
		if name1 then UseEquipmentSet(name1) end
	else
		if name2 then UseEquipmentSet(name2) end
	end
end

-- Spec
local spec = CreateFrame("Button", "PulseUI_Spechelper", UIParent)
spec:Size(100, 18)
spec:SetPoint("RIGHT", G.Panels.RightChatTabsBackground, "RIGHT", -80, 0)
spec:SetTemplate("Default")

-- Text
spec.t = spec:CreateFontString(spec, "OVERLAY")
spec.t:SetPoint("CENTER")
spec.t:SetFont(C["media"].font, C["datatext"].fontsize, "THINOUTLINE")

local int = 1
local function Update(self, t)
int = int - t
if int > 0 then return end
	if not GetSpecialization() then spec.t:SetText("No talents") return end
	local Tree = ActiveTalents()
	local name = select(2, GetSpecializationInfo(Tree))
	spec.t:SetText(name)
		
	if HasDualSpec() then
		if HasUnactiveTalents() then 
			local sTree = UnactiveTalents()
			sName = select(2, GetSpecializationInfo(sTree))
			spec:SetScript("OnEnter", function() spec.t:SetText(cm..sName) end)
			spec:SetScript("OnLeave", function() spec.t:SetText(name) end)
		else
			spec:SetScript("OnEnter", function() spec.t:SetText(cm.."No talents") end)
			spec:SetScript("OnLeave", function() spec.t:SetText(name) end)
		end
	end
	int = 1
	self:SetScript("OnUpdate", nil)
end

local function OnEvent(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	else
		self:SetScript("OnUpdate", Update)
	end
end	
	
spec:RegisterEvent("PLAYER_TALENT_UPDATE")
spec:RegisterEvent("PLAYER_ENTERING_WORLD")
spec:RegisterEvent("CHARACTER_POINTS_CHANGED")
spec:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
spec:SetScript("OnEvent", OnEvent) 

spec:SetScript("OnClick", function(self) 
	local i = GetActiveSpecGroup()
	if IsModifierKeyDown() then
		ToggleTalentFrame()
	else
		if i == 1 then SetActiveSpecGroup(2) end
		if i == 2 then SetActiveSpecGroup(1) end
	end
end)
	
if Enablegear == true then
	local gearSets = CreateFrame("Frame", nil, spec)	
	for i = 1, 10 do
			gearSets[i] = CreateFrame("Button", nil, spec)
			gearSets[i]:Size(16, 16)
			gearSets[i]:SetPoint("RIGHT", spec, "LEFT", -2, 0)
			gearSets[i]:SetTemplate("Default")

			if i == 1 then
				gearSets[i]:Point("RIGHT", spec, "LEFT", -2, 0)
			else
				gearSets[i]:SetPoint("RIGHT", gearSets[i-1], "LEFT", -2, 0)
			end
			gearSets[i].texture = gearSets[i]:CreateTexture(nil, "BORDER")
			gearSets[i].texture:SetTexCoord(.08, .92, .08, .92)
			gearSets[i].texture:SetPoint("TOPLEFT", gearSets[i] ,"TOPLEFT", 2, -2)
			gearSets[i].texture:SetPoint("BOTTOMRIGHT", gearSets[i] ,"BOTTOMRIGHT", -2, 2)
			gearSets[i].texture:SetTexture(select(2, GetEquipmentSetInfo(i)))
			gearSets[i]:Hide()
		
		gearSets[i]:RegisterEvent("PLAYER_ENTERING_WORLD")
		gearSets[i]:RegisterEvent("EQUIPMENT_SETS_CHANGED")
		gearSets[i]:SetScript("OnEvent", function(self, event)
			local points, pt = 0, GetNumEquipmentSets()
			local frames = { gearSets[1]:IsShown(), gearSets[2]:IsShown(), gearSets[3]:IsShown(), gearSets[4]:IsShown(), 
						 gearSets[5]:IsShown(), gearSets[6]:IsShown(), gearSets[7]:IsShown(), gearSets[8]:IsShown(),
						 gearSets[9]:IsShown(), gearSets[10]:IsShown() }
			if pt > points then
				for i = points + 1, pt do
					gearSets[i]:Show()
				end
			end
			if frames[pt + 1] == 1 then
				gearSets[pt + 1]:Hide()
			end
			
			gearSets[i].texture = gearSets[i]:CreateTexture(nil, "BORDER")
			gearSets[i].texture:SetTexCoord(.08, .92, .08, .92)
			gearSets[i].texture:SetPoint("TOPLEFT", gearSets[i] ,"TOPLEFT", 2, -2)
			gearSets[i].texture:SetPoint("BOTTOMRIGHT", gearSets[i] ,"BOTTOMRIGHT", -2, 2)
			gearSets[i].texture:SetTexture(select(2, GetEquipmentSetInfo(i)))
			
			gearSets[i]:SetScript("OnClick", function(self) UseEquipmentSet(GetEquipmentSetInfo(i)) end)
			gearSets[i]:SetScript("OnEnter", function(self) self:SetBackdropBorderColor(unpack(hoverovercolor)) end)
			gearSets[i]:SetScript("OnLeave", function(self) self:SetBackdropBorderColor(unpack(C["media"].bordercolor)) end)
			
			if Autogearswap == true then
				gearSets[1]:SetBackdropBorderColor(0,1,0)
				gearSets[2]:SetBackdropBorderColor(1,0,0)
				gearSets[1]:SetScript("OnEnter", nil)
				gearSets[1]:SetScript("OnLeave", nil)
				gearSets[2]:SetScript("OnEnter", nil)
				gearSets[2]:SetScript("OnLeave", nil)
			end
		end)
	end	
	
	if Autogearswap == true then
		gearsetfunc = CreateFrame("Frame", "gearSetfunc", UIParent)
		local function OnEvent(self, event)
			if event == "PLAYER_ENTERING_WORLD" then
				self:UnregisterEvent("PLAYER_ENTERING_WORLD")
			else
				AutoGear(set1, set2) 
			end
		end
		
		gearsetfunc:RegisterEvent("PLAYER_ENTERING_WORLD")
		gearsetfunc:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
		gearsetfunc:SetScript("OnEvent", OnEvent)
	end
end