--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppNavigator (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("new:ActionHelper")
local v_u_4 = v_u_1("InventoryDB")
local v_u_5 = v_u_1("Maid")
local v_u_6 = v_u_1("PlatformM")
local v7 = v_u_1("TweenHelper")
local v_u_8 = v_u_1("TweenPromise")
local v_u_9 = v_u_1("XboxSupport")
local v_u_10 = v_u_1("package:Sift")
local v_u_11 = game:GetService("ContextActionService")
local v_u_12 = v7.tween_info({
    ["time"] = 0.3
})
local v_u_47 = {
    ["PickUp"] = {
        ["validate"] = function(_)
            return true
        end,
        ["run"] = function(p13)
            local v14 = v_u_1("PetActions")
            local v15 = p13.char_wrapper
            p13:release_focus()
            v14.pick_up(v15, true)
        end
    },
    ["Hatch"] = {
        ["validate"] = function(p16, p17)
            local v18 = p16.is_egg
            if v18 then
                v18 = p17.player == game.Players.LocalPlayer
            end
            return v18
        end,
        ["run"] = function(p19)
            local v20 = v_u_1("PetActions")
            local v21 = p19.char_wrapper
            v20.insta_hatch(v21)
        end
    },
    ["Ride"] = {
        ["validate"] = function(p22, p23)
            local v24 = not (p22.is_egg or (p22.is_doll or p22.cannot_feed_potions))
            if v24 then
                v24 = p23.player == game.Players.LocalPlayer
            end
            return v24
        end,
        ["run"] = function(p25)
            local v26 = v_u_1("PetActions")
            local v27 = p25.char_wrapper
            v26.ride_pet(v27)
        end
    },
    ["Fly"] = {
        ["validate"] = function(p28, p29)
            local v30 = not (p28.is_egg or (p28.is_doll or p28.cannot_feed_potions))
            if v30 then
                v30 = p29.player == game.Players.LocalPlayer
            end
            return v30
        end,
        ["run"] = function(p31)
            local v32 = v_u_1("PetActions")
            local v33 = p31.char_wrapper
            v32.fly_pet(v33)
        end
    },
    ["DressUp"] = {
        ["validate"] = function(p34, p35)
            local v36 = p34.is_customizable
            if v36 then
                v36 = p35.player == game.Players.LocalPlayer
            end
            return v36
        end,
        ["run"] = function(p37)
            local v38 = v_u_1("PetActions")
            local v39 = p37.char_wrapper
            local v40 = workspace.CurrentCamera.CFrame
            p37:release_focus()
            workspace.CurrentCamera.CFrame = v40
            v38.dress_up(v39)
        end
    },
    ["Tricks"] = {
        ["validate"] = function(p41, p42)
            local v43 = not (p41.is_egg or (p41.is_doll or p41.progression_locked))
            if v43 then
                v43 = p42.player == game.Players.LocalPlayer
            end
            return v43
        end,
        ["run"] = function(p44)
            local v45 = v_u_1("PetActions")
            local v46 = p44.char_wrapper
            p44:release_focus()
            v45.do_trick(v46)
        end
    }
}
local function v_u_49(p_u_48)
    p_u_48.MouseEnter:Connect(function()
        v_u_8.new(p_u_48, v_u_12, {
            ["Rotation"] = -12 or 0
        })
    end)
    p_u_48.MouseLeave:Connect(function()
        v_u_8.new(p_u_48, v_u_12, {
            ["Rotation"] = nil or 0
        })
    end)
end
local v50 = v2("FocusPetAppNavigator", v_u_1("UIBaseElement"))
function v50.capture_focus(p_u_51, p_u_52)
    p_u_51:_update_buttons(p_u_52)
    p_u_51.maid:GiveTask(v_u_6.get_gamepad_changed():Connect(function()
        p_u_51:_update_buttons(p_u_52)
    end))
    for _, v53 in {
        {
            ["buttons"] = p_u_51.left_buttons,
            ["gamepad_button"] = Enum.KeyCode.DPadLeft,
            ["instance"] = p_u_51.instance.LeftButtons
        },
        {
            ["buttons"] = p_u_51.right_buttons,
            ["gamepad_button"] = Enum.KeyCode.DPadRight,
            ["instance"] = p_u_51.instance.RightButtons
        }
    } do
        if v_u_10.Dictionary.some(v53.buttons, function(p54)
            return p54.Parent.Visible
        end) then
            p_u_51:_create_watch(v53)
        end
    end
end
function v50.release_focus(p55)
    for _, v56 in { p55.left_buttons, p55.right_buttons } do
        for _, v57 in v56 do
            v_u_11:UnbindAction(v57.Name)
            v57.Parent.Visible = false
        end
    end
    p55.maid:DoCleaning()
end
function v50._create_watch(p58, p59)
    local v60 = p59.instance
    local v61 = p59.buttons
    local v_u_62 = p59.gamepad_button
    local v_u_63 = p58.UIManager.wrap(v61[1].Parent:FindFirstChild("XboxButton"), "GamepadIcon"):start({
        ["key"] = v_u_62
    })
    local v_u_64 = nil
    local v65, v66 = v_u_9.quick_watch({
        ["selection_parent"] = v60,
        ["default_selection"] = v61[1],
        ["save_last_selection"] = true,
        ["app_name"] = p58.ClassName,
        ["unique_key"] = p58.ClassName .. v_u_62.Name,
        ["quick_open_button"] = v_u_62,
        ["open_using_button_only"] = true,
        ["open_override"] = function()
            v_u_64:activate()
            return false
        end,
        ["close_override"] = function()
            v_u_64:deactivate()
            return false
        end,
        ["setup_button_actions"] = function()
            v_u_63:update({
                ["key"] = Enum.KeyCode.ButtonB
            })
            v_u_63.instance.Size = UDim2.fromOffset(40, 40)
            v_u_63.instance.ImageTransparency = 0
        end,
        ["teardown_button_actions"] = function()
            v_u_63:update({
                ["key"] = v_u_62
            })
            v_u_63.instance.Size = UDim2.fromOffset(58, 58)
            v_u_63.instance.ImageTransparency = 0.3
        end
    })
    v_u_64 = v65
    p58.maid:GiveTask(v_u_63)
    p58.maid:GiveTask(v66)
    p58.maid:GiveTask(function()
        v_u_64:deactivate()
    end)
    return v_u_64
end
function v50._update_buttons(p_u_67, p68)
    local v_u_69 = 1
    for _, v70 in { p_u_67.right_buttons, p_u_67.left_buttons } do
        for _, v_u_71 in v70 do
            v_u_11:UnbindAction(v_u_71.Name)
            local v72 = v_u_47[v_u_71.Name]
            local v73 = v_u_4.pets[p68.pet_id]
            local v74 = v72.validate(v73, p68)
            v_u_71.Parent.Visible = v74
            if v74 then
                local v78 = {
                    ["desktop"] = function()
                        if v_u_6.is_using_gamepad() then
                            v_u_71.Parent.SlotNum.Visible = false
                        else
                            v_u_71.Parent.SlotNum.Text = v_u_69
                            v_u_71.Parent.SlotNum.Visible = true
                            local v75 = Enum.KeyCode:GetEnumItems()
                            local v76 = v75[v_u_10.List.find(v75, Enum.KeyCode.Zero) + v_u_69]
                            v_u_11:BindAction(v_u_71.Name, function(_, p77)
                                if p77 == Enum.UserInputState.Begin then
                                    p_u_67:_do_action(v_u_71.Name)
                                end
                            end, false, v76)
                        end
                    end,
                    ["default"] = function()
                        v_u_71.Parent.SlotNum.Visible = false
                    end
                }
                v_u_6.run(v78)
                local v79 = v_u_69 + 1
                v_u_69 = v79
            end
        end
    end
end
function v50._do_action(p80, p81)
    local v82 = p80.UIManager.apps.FocusPetApp
    if v82:check_can_interact_with_pet() then
        local v83 = v_u_47[p81]
        local v84 = v_u_4.pets[v82.char_wrapper.pet_id]
        if v83.validate(v84, v82.char_wrapper) then
            v_u_3.cancel_mutually_exclusive_promises({ "dialog" })
            v83.run(v82)
        end
    end
end
function v50.show(p85)
    p85.instance.LeftButtons.Visible = true
    p85.instance.RightButtons.Visible = true
end
function v50.hide(p86)
    p86.instance.LeftButtons.Visible = false
    p86.instance.RightButtons.Visible = false
end
function v50.start(p_u_87)
    p_u_87.maid = v_u_5.new()
    p_u_87.left_buttons = v_u_10.List.map(p_u_87.instance.LeftButtons:GetChildren(), function(p88)
        return p88:FindFirstChildWhichIsA("ImageButton")
    end)
    p_u_87.right_buttons = v_u_10.List.map(p_u_87.instance.RightButtons:GetChildren(), function(p89)
        return p89:FindFirstChildWhichIsA("ImageButton")
    end)
    for _, v90 in { p_u_87.left_buttons, p_u_87.right_buttons } do
        table.sort(v90, function(p91, p92)
            return p91.Parent.LayoutOrder < p92.Parent.LayoutOrder
        end)
        for _, v_u_93 in v90 do
            v_u_49(v_u_93)
            v_u_93[v_u_6.mouse_down_or_click()]:Connect(function()
                p_u_87:_do_action(v_u_93.Name)
            end)
            v_u_93.Parent.Visible = false
        end
    end
end
return v50