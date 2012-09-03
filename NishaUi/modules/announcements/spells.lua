local T, C, L = unpack(Tukui)
if C.announcements.spells == true then		
-- Set what chat channel we announce to
local AnnounceTo = "SAY" -- "SAY", "PARTY", "RAID", "YELL"

-- Buffs to announce
local Announce = T.AnnounceSpells

-- Locals
local Target
local SpellID
local Duration
local SpellString
local tremove = tremove
local tinsert = tinsert
local unpack = unpack
local select = select
local UnitAura = UnitAura
local SendChatMessage = SendChatMessage

-- Functions
local WaitTable = {}
local WaitFrame

local OnUpdate = function(self, elapsed)
	local count = #WaitTable
	local i = 1
	
	while (i <= count) do
		local Table = tremove(WaitTable, i)
		local Delay = tremove(Table, 1)
		local Func = tremove(Table, 1)
		local Args = tremove(Table, 1)
		
		if (Delay > elapsed) then
			tinsert(WaitTable, i, {Delay - elapsed, Func, Args})
			i = i + 1
		else
			count = count - 1
			Func(unpack(Args))
		end
	end
end

local Delay = function(delay, func, ...)
	if (type(delay) ~= "number" or type(func) ~= "function") then
		return false
	end

	if not AutoAnnounceWaitFrame then
		WaitFrame = CreateFrame("Frame", "AutoAnnounceWaitFrame", UIParent)
		WaitFrame:SetScript("OnUpdate", OnUpdate)
	end
	
	tinsert(WaitTable, {delay, func, {...}})
	return true
end

local OnEvent = function(self, event, unit, spell)
	if (unit ~= "player") then
		return
	end
	
	if Announce[spell] then
		Target = Announce[spell]
		SpellID = select(11, UnitAura(Target, spell))
		Duration = select(6, UnitAura(Target, spell))
		SpellString = "\124cff71d5ff\124Hspell:" .. SpellID .. "\124h[" .. spell .. "]\124h\124r"
		
		if (Target ~= "player") then
			SendChatMessage(SpellString .. " is up on " .. UnitName(Target) .. " for " .. Duration .. " seconds!", AnnounceTo)
		else
			SendChatMessage(SpellString .. " is up for " .. Duration .. " seconds!", AnnounceTo)
		end

		Delay(Duration, SendChatMessage, SpellString .. " is down.", AnnounceTo)
	end
end

local Frame = CreateFrame("Frame")
Frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
Frame:SetScript("OnEvent", OnEvent)

end