local T, C, L, G = unpack( Tukui )

------------------------------
-- Not Needed
------------------------------
local panelsToKill = { G.ActionBars.Pet.BackgroundLink, G.Panels.BottomLeftVerticalLine, G.Panels.BottomRightVerticalLine, G.Panels.BottomLeftCube, G.Panels.BottomRightCube, G.Panels.BottomLeftLine, G.Panels.BottomRightLine, G.Panels.LeftDataTextToActionBarLine, G.Panels.RightDataTextToActionBarLine, G.Panels.BottomPanelOverActionBars }

for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end

G.ActionBars.Bar5:ClearAllPoints()
G.ActionBars.Bar5:SetParent( TukuiUIHider )
G.ActionBars.Bar6:ClearAllPoints()
G.ActionBars.Bar6:SetParent( TukuiUIHider )
G.ActionBars.Bar7:ClearAllPoints()
G.ActionBars.Bar7:SetParent( TukuiUIHider )

------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	G.Panels.DataTextMinimapRight:Kill()
	G.Maps.Minimap.Zone:Kill()
	G.Maps.Minimap.Coord:Kill()
end