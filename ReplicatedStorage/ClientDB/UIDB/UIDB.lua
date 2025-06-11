--// ReplicatedStorage.ClientDB.UIDB (ModuleScript)

local v1 = {
    ["RoundBacking"] = 836164959,
    ["FlatButtonUp"] = 836164956,
    ["FlatButtonDown"] = 836164957,
    ["SquareFlatButtonUp"] = 1349374566,
    ["SquareFlatButtonDown"] = 1349374570,
    ["CircleBackButton"] = 1907607675,
    ["CircleCloseButton"] = 1907607872,
    ["FurnitureBorder"] = 1908023473,
    ["FurnitureFolder"] = 1911611948,
    ["FurnitureFolderYellow"] = 2159643238,
    ["ArrowRight"] = 1908067947,
    ["ArrowLeft"] = 1908067943,
    ["AcceptSymbol"] = 1940904455,
    ["DeclineSymbol"] = 1940904457,
    ["PurpleOutlineArrow"] = 2035242987,
    ["CircleHoleInSquare"] = 2032803348,
    ["ScrollingBackingBottom"] = 835916114,
    ["ScrollingBackingMid"] = 835916112,
    ["ScrollingBackingTop"] = 835916116,
    ["ScrollingFrameSliderBottomImage"] = 835908579,
    ["ScrollingFrameSliderMidImage"] = 835908580,
    ["ScrollingFrameSliderTopImage"] = 835908577,
    ["RoundedBacking5px"] = 2015270155,
    ["AddNewHousePlusSign"] = 2015539244,
    ["RemoveSongIcon"] = 1602983275,
    ["PlayIcon"] = 1602983271,
    ["AddSongIcon"] = 1606097372,
    ["XboxDPadUp"] = 2045013442,
    ["XboxButtonB"] = 1299025101,
    ["XboxLeftTrigger"] = 14384349668,
    ["XboxLeftBumper"] = 14384349473
}
for v2, v3 in pairs(v1) do
    local v4 = v1[v2]
    if typeof(v4) == "number" then
        v1[v2] = "rbxassetid://" .. v3
    else
        v1[v2].id = "rbxassetid://" .. v3.id
    end
end
for v5, v6 in pairs({
    ["button_up"] = 836164956,
    ["button_down"] = 836164957,
    ["button_up_square"] = 1349374566,
    ["button_down_square"] = 1349374570,
    ["expand_button_down"] = 836841835,
    ["expand_button_up"] = 836841831,
    ["nav_button_up"] = 836863414,
    ["nav_button_down"] = 836863417,
    ["inventory_nav_tab_down"] = 837778658,
    ["inventory_nav_tab_up"] = 836008165,
    ["backpack_add_plus"] = 882416210,
    ["small_money_stack_dialog"] = 907993933,
    ["filled_star"] = 946155217,
    ["empty_star"] = 946155218,
    ["thumbs_up"] = 946286929,
    ["xbox_button_b"] = 1299025101,
    ["xbox_button_select"] = 1299091898
}) do
    v1[v5] = v6
end
return v1