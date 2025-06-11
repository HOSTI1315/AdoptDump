--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.GuideArrowApp.GuideArrowApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("new:InteriorNavigator")
local v_u_3 = v_u_1("new:NavigationTargetProvider")
local v_u_4 = v_u_1("new:ToggleableSignal")
local v_u_5 = v_u_1("EquippedPets")
local v_u_6 = v_u_1("Spring")
local v7 = v_u_1("Class")
local v_u_8 = v_u_1("Maid")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v_u_11 = game:GetService("HttpService")
local v_u_12 = CFrame.fromEulerAnglesYXZ(0, 1.5707963267948966, 0)
local v13 = v7("GuideArrowApp", v_u_1("UIBaseApp"))
local function v_u_21(p14, p15, p16)
    local v17 = {}
    for v18, v19 in p16 do
        local v20 = p14 + (v19.Time - 0) * (p15 - p14) / 1
        v17[v18] = NumberSequenceKeypoint.new(v20, v19.Value, v19.Envelope)
    end
    return v17
end
function v13._refresh_arrow(p22, p23, p24)
    if p22.pet_entity and p22.pet_entity.base.root then
        p23 = p22.pet_entity.base.root.CFrame.Position
    end
    local v25 = 1 - os.clock() % 1 / 1
    local v26 = p24 - p23
    local v27 = v26.Magnitude
    local v28 = v26 / v27
    if v27 > 100 then
        v27 = 100
        p24 = p23 + v28 * v27
    end
    local v29 = p23 + v28 * 5
    local v30 = v27 - 5
    if v30 <= 0 then
        return 1
    end
    local v31 = CFrame.lookAt((v29 + p24) / 2, p24) * v_u_12
    local v32 = workspace.CurrentCamera.CFrame.Position - v29
    if v31.YVector:Dot(v32) < 0 then
        v31 = v31 * CFrame.fromEulerAnglesXYZ(3.141592653589793, 0, 0)
    end
    p22.instance.CFrame = v31 * CFrame.new(0, -0.05, 0)
    p22.instance.Size = Vector3.new(v30, 0.1, 8)
    local v33 = 1 / v30
    local v34 = 8 / (v30 + 16)
    local v35 = 10 * v33
    local v36 = 1 - 20 * v33
    if v34 > 0.5 then
        return 1
    end
    local v37
    if v36 < v35 then
        v37 = { NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.3333333333333333, 0), NumberSequenceKeypoint.new(1, 1) }
    else
        v37 = {
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(v35, 0),
            NumberSequenceKeypoint.new(v36, 0),
            NumberSequenceKeypoint.new(1, 1)
        }
    end
    local v38 = v_u_21(v34, 1 - v34, v37)
    local v39 = NumberSequenceKeypoint.new
    table.insert(v38, 1, v39(0, 1))
    local v40 = NumberSequenceKeypoint.new
    table.insert(v38, v40(1, 1))
    for _, v41 in v38 do
        if v41.Time ~= v41.Time or (v41.Time < 0 or v41.Time > 1) then
            return 1
        end
    end
    for _, v42 in p22.textures do
        v42.UIGradient.Offset = Vector2.new(0, v25 * v34)
        v42.UIGradient.Transparency = NumberSequence.new(v38)
        v42.Position = UDim2.new(0.5, 0, 0.5, -v25 * p22.tile_size)
    end
    if p22.pet_unique then
        p22.paw_print.Visible = true
        p22.arrow.Visible = false
    else
        p22.arrow.Visible = true
        p22.paw_print.Visible = false
    end
    return 0
end
function v13._show_cancel_nav_button(p_u_43)
    p_u_43.cancel_nav_button = p_u_43.cancel_nav_button or p_u_43.UIManager.apps.ExtraButtonsApp:register_button({
        ["priority"] = 3,
        ["text"] = "Stop Guiding",
        ["mouse_button1_click"] = function()
            p_u_43:cancel_navigation()
        end
    })
    p_u_43.cancel_nav_button:show()
end
function v13._hide_cancel_nav_button(p44)
    if p44.cancel_nav_button then
        p44.cancel_nav_button:hide()
    end
end
function v13._update(p45, p46, p47)
    local v48
    if p46 and p47 then
        local v49 = v_u_9.LocalPlayer.Character
        local v50
        if v49 then
            v50 = v49:FindFirstChild("HumanoidRootPart")
        else
            v50 = v49
        end
        if v49 then
            v49 = v49:FindFirstChild("Humanoid")
        end
        local v51 = v49 and v50.Size.Y / 2 + v49.HipHeight or 0
        v48 = p45:_refresh_arrow(p46 - Vector3.new(0, v51, 0), p47)
    else
        v48 = 1
    end
    p45.transparency_spring:set_goal(v48)
end
function v13._on_target_changed(p52, p53)
    if p52.pet_entity then
        local v54 = v_u_1("AdoptMeEnums/PetEntities/PetCommandType")
        local v55 = v_u_1("PetWorldState")
        if p53 then
            v55.buffer_command(p52.pet_char_wrapper.char, v54.Navigate, {
                ["nav_name"] = p52.running_nav_name,
                ["target"] = p53
            })
        end
    end
end
function v13._get_pet_entity(p56)
    if p56.pet_char_wrapper then
        return v_u_1("PetEntityManager").get_pet_entity(p56.pet_char_wrapper.char)
    else
        return nil
    end
end
function v13.navigate(p57, p58, p59, p60, p61, p62)
    return p57:navigate_from_options({
        ["final_destination"] = p58,
        ["custom_position_or_method"] = p59,
        ["custom_has_arrived_method"] = p60,
        ["not_overridable"] = p61,
        ["nav_name"] = p62
    })
end
function v13.navigate_promise(p_u_63, p64)
    if p_u_63.non_overridable_navigation_running then
        return false, "NON_OVERRIDABLE_NAVIGATION_RUNNING"
    end
    if next(p_u_63.exclusive_tags) and not p_u_63.exclusive_tags[p64.nav_name] then
        return false, "LOCKED_BY_EXCLUSIVE_TAGS"
    end
    p_u_63.maid:DoCleaning()
    p_u_63.running_nav_name = p64.nav_name or v_u_11:GenerateGUID()
    local v65 = p64.pet_unique and v_u_5.get_wrapper_from_unique(p64.pet_unique)
    if v65 then
        p_u_63.pet_unique = p64.pet_unique
        p_u_63.pet_char_wrapper = v65
        p_u_63.pet_entity = p_u_63:_get_pet_entity()
    end
    p_u_63.target_provider = v_u_3.new({
        ["destination_interior"] = p64.final_destination,
        ["destination_position"] = p64.custom_position_or_method
    })
    p_u_63.navigator = v_u_2.new({
        ["target_provider"] = p_u_63.target_provider,
        ["has_arrived"] = p64.custom_has_arrived_method,
        ["get_character_position"] = p64.get_character_position,
        ["on_update"] = function(p66, p67)
            p_u_63:_update(p66, p67)
        end,
        ["on_target_changed"] = function(p68)
            p_u_63:_on_target_changed(p68)
        end
    })
    if p64.not_overridable then
        p_u_63.non_overridable_navigation_running = true
    else
        p_u_63:_show_cancel_nav_button()
    end
    p_u_63.maid:GiveTask(function()
        p_u_63.navigator:destroy()
        p_u_63.target_provider:destroy()
        p_u_63.navigator = nil
        p_u_63.target_provider = nil
        p_u_63.pet_unique = nil
        p_u_63.pet_char_wrapper = nil
        p_u_63.pet_entity = nil
        p_u_63.running_nav_name = nil
        p_u_63.navigation_promise = nil
        p_u_63.non_overridable_navigation_running = false
        p_u_63.transparency_spring:set_goal(1)
        p_u_63:_hide_cancel_nav_button()
    end)
    p_u_63.navigation_promise = p_u_63.navigator:start():done(function()
        p_u_63.maid:DoCleaning()
    end)
    return p_u_63.navigation_promise
end
function v13.navigate_from_options(p69, p70)
    local v71, v72 = p69:navigate_promise(p70):await()
    return v71, v72
end
function v13.cancel_navigation(p73, p74)
    if p74 == nil or p73.running_nav_name == p74 then
        p73.navigation_promise:cancel()
    end
end
function v13.is_navigating(p75)
    return p75.running_nav_name ~= nil
end
function v13.set_tag_exclusive(p76, p77, p78)
    local v79
    if p77 then
        v79 = typeof(p77) == "string"
    else
        v79 = p77
    end
    assert(v79, "Must provide a string for a tag in GuideArrowApp:set_tag_exclusive.")
    p76.exclusive_tags[p77] = p78 and true or nil
    if p76.running_nav_name and (next(p76.exclusive_tags) and not p76.exclusive_tags[p76.running_nav_name]) then
        p76:cancel_navigation()
    end
end
function v13.show(p80)
    p80.surface_gui.Enabled = true
end
function v13.hide(p81)
    p81.surface_gui.Enabled = false
end
function v13.refresh(p82, p83)
    local v84 = p82.UIManager.is_closed({ "FocusPetApp", "MockFocusPetApp", "AvatarEditorApp" })
    if not p83[p82.ClassName] then
        v84 = false
    end
    p82:set_visibility(v84)
end
function v13.start(p_u_85)
    p_u_85.maid = v_u_8.new()
    p_u_85.exclusive_tags = {}
    p_u_85.surface_gui = p_u_85.instance.SurfaceGui
    p_u_85.arrow = p_u_85.surface_gui.Arrow
    p_u_85.paw_print = p_u_85.surface_gui.PawPrint
    p_u_85.textures = { p_u_85.arrow, p_u_85.paw_print }
    p_u_85.tile_size = p_u_85.surface_gui.PixelsPerStud * 8
    p_u_85.arrow.Size = UDim2.new(1, 0, 1, p_u_85.tile_size * 2)
    p_u_85.arrow.TileSize = UDim2.new(0, p_u_85.tile_size, 0, p_u_85.tile_size)
    p_u_85.paw_print.Size = UDim2.new(0.4, 0, 1, p_u_85.tile_size * 2)
    p_u_85.paw_print.TileSize = UDim2.new(1, 0, 0, p_u_85.tile_size)
    p_u_85.transparency_spring = v_u_6.new(0.75, 2, 1, 0)
    p_u_85.navigator = nil
    p_u_85.target_provider = nil
    p_u_85.running_nav_name = nil
    p_u_85.non_overridable_navigation_running = false
    p_u_85.cancel_nav_button = nil
    p_u_85.surface_gui.AlwaysOnTop = true
    p_u_85.arrow.ImageTransparency = 1
    p_u_85.paw_print.ImageTransparency = 1
    local v86 = Instance.new("Model")
    v86.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
    v86.Name = "GuideArrowSafeContainer"
    p_u_85.instance.Parent = v86
    v86.Parent = workspace
    v_u_4.newConnect(v_u_10.Stepped, function(_, p87)
        p_u_85.transparency_spring:update(p87)
        local v88 = p_u_85.transparency_spring:get_position()
        for _, v89 in p_u_85.textures do
            v89.ImageTransparency = v88
        end
    end):WithProperty(p_u_85.surface_gui, "Enabled")
end
return v13