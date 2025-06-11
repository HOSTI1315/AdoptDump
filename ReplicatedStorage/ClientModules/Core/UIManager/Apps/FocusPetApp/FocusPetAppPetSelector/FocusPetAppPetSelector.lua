--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppPetSelector (ModuleScript)

local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("new:ActionHelper")
local v_u_4 = v_u_2("CaregiverAssistHelper")
local v_u_5 = v_u_2("CharWrapperClient")
local v6 = v_u_2("Class")
local v_u_7 = v_u_2("EquippedPets")
local v_u_8 = v_u_2("InventoryDB")
local v_u_9 = v_u_2("Maid")
local v_u_10 = v_u_2("PlatformM")
local v11 = v_u_2("TweenHelper")
local v_u_12 = v_u_2("TweenPromise")
local v_u_13 = v_u_2("package:Sift")
local v_u_14 = v11.tween_info({
    ["time"] = 0.3
})
local function v_u_16(p_u_15)
    p_u_15.MouseEnter:Connect(function()
        v_u_12.new(p_u_15, v_u_14, {
            ["Rotation"] = -3 or 0
        })
    end)
    p_u_15.MouseLeave:Connect(function()
        v_u_12.new(p_u_15, v_u_14, {
            ["Rotation"] = nil or 0
        })
    end)
end
local v17 = v6("FocusPetAppPetSelector", v_u_2("UIBaseElement"))
function v17.capture_focus(p18, p19)
    p18.pet_name_label.Text = v_u_7.get_name_from_wrapper(p19)
    if p19.player == game.Players.LocalPlayer then
        p18.owner_name.Visible = false
    else
        p18.owner_name.Visible = true
        p18.owner_name_label.Text = p19.player.Name
    end
    p18:show()
end
function v17.release_focus(p20)
    p20:hide()
end
function v17._select_pet(p21)
    local v22 = v_u_2("PetActions")
    local v23 = v_u_4.get_choices({
        ["caregiver_assist"] = true,
        ["team_whitelist"] = { "Pets" },
        ["max_choices"] = 100
    })
    local v_u_24 = p21.UIManager.apps.FocusPetApp.char_wrapper
    local v26 = v_u_13.List.findWhere(v23, function(p25)
        return p25.character == v_u_24.char
    end)
    if v26 then
        v23 = v_u_13.List.removeIndex(v23, v26)
    end
    local v27 = {
        ["character"] = v_u_24.char,
        ["text"] = v_u_7.get_name_from_wrapper(v_u_24)
    }
    table.insert(v23, 1, v27)
    local v32 = {
        ["dialog_type"] = "ScrollingButtonsDialog",
        ["header"] = "SELECT PET",
        ["buttons"] = v_u_13.List.map(v23, function(p28, p29)
            local v30 = p28.character
            if v30 then
                v30 = v_u_5.get(v30)
            end
            if not v30 then
                return nil
            end
            local v31 = p28.text
            if v30.player ~= game.Players.LocalPlayer then
                v31 = ("%* (%*)"):format(v31, v30.player.Name)
            end
            return {
                ["text"] = v31,
                ["layout_order"] = p29,
                ["button_state"] = v30.pet_unique == v_u_24.pet_unique and "selected" or nil
            }
        end),
        ["exit_button"] = true,
        ["cells_per_row"] = 1,
        ["padding"] = 10
    }
    local v_u_33, v_u_34 = p21.UIManager.apps.DialogApp:queue_with_override(v32)
    v_u_33:finally(function()
        v_u_34(nil)
    end)
    v_u_3.run_promise(v_u_33, { "dialog" })
    v_u_1:BindActionAtPriority("FocusPetAppPetSelectorCancel", function(_, p35)
        if p35 == Enum.UserInputState.Begin then
            v_u_33:cancel()
        end
        return Enum.ContextActionResult.Sink
    end, false, 6000, Enum.KeyCode.ButtonB)
    local v36, v37 = v_u_33:await()
    v_u_1:UnbindAction("FocusPetAppPetSelectorCancel")
    if v36 and v37 then
        local v38 = v23[v37].character
        if v38 and v38 ~= v_u_24.char then
            local v39 = v_u_5.get(v38)
            if v39 and v22.can_focus_pet(v38) then
                v22.focus(v39)
            else
                local v40 = v39 and v39.pet_id
                if v40 then
                    v40 = v_u_8.pets[v39.pet_id]
                end
                local v41 = v40 and v40.name or "pet"
                p21.UIManager.apps.HintApp:hint({
                    ["text"] = ("You can\'t interact with this %s right now."):format(v41),
                    ["length"] = 5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
            end
        else
            return
        end
    else
        return
    end
end
function v17.show(p_u_42)
    p_u_42.instance.Visible = true
    v_u_1:BindActionAtPriority("FocusPetAppPetSelector", function(_, p43)
        if p43 == Enum.UserInputState.Begin then
            p_u_42:_select_pet()
        end
        return Enum.ContextActionResult.Sink
    end, false, 6000, Enum.KeyCode.ButtonR1)
end
function v17.hide(p44)
    p44.instance.Visible = false
    v_u_1:UnbindAction("FocusPetAppPetSelector")
end
function v17.start(p_u_45)
    p_u_45.maid = v_u_9.new()
    p_u_45.pet_name = p_u_45.instance.PetName
    p_u_45.pet_name_label = p_u_45.pet_name.TextLabel
    p_u_45.owner_name = p_u_45.instance.OwnerName
    p_u_45.owner_name_label = p_u_45.owner_name.TextLabel
    v_u_10.run({
        ["phone"] = function()
            p_u_45.instance.UIScale.Scale = 1
        end,
        ["default"] = function()
            p_u_45.instance.UIScale.Scale = 1.5
        end
    })
    v_u_16(p_u_45.pet_name)
    p_u_45.pet_name[v_u_10.mouse_down_or_click()]:Connect(function()
        p_u_45:_select_pet()
    end)
    p_u_45.UIManager.wrap(p_u_45.instance.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonR1,
        ["on_update"] = function(p46, p47)
            local v48 = p46.instance
            if p47 then
                p47 = v_u_10.is_using_gamepad()
            end
            v48.Visible = p47
        end
    })
end
return v17