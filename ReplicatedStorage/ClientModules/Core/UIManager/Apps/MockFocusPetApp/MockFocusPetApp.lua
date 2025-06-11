--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MockFocusPetApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("CharacterHider")
local v3 = v_u_1("Class")
local v4 = v_u_1("FocusPetApp")
local v_u_5 = v_u_1("InteractionsEngine")
local v_u_6 = v_u_1("Maid")
local v_u_7 = v_u_1("PetPerformanceName")
local v_u_8 = v_u_1("PlatformM")
local v9 = v_u_1("Signal")
local v_u_10 = game:GetService("ContextActionService")
local v_u_11 = v_u_8.get_platform()
local v_u_12 = v9.new()
local v13 = v3("MockFocusPetApp", v4)
function v13.get_finished_signal(_)
    return v_u_12
end
function v13.capture_focus(p_u_14, p15, p16)
    if p_u_14.pet_entity then
        p_u_14:release_focus()
    end
    v_u_5:disable("focus_pet_app")
    p_u_14.exit_button.button:unhover()
    p_u_14.exit_button.button:up()
    local v_u_17 = v_u_1("PetEntityHelper")
    p_u_14.char_wrapper = p16
    p_u_14.pet_entity = p15
    p_u_14.pet_model = p16.char:FindFirstChild("PetModel")
    p_u_14.UIManager.set_app_visibility(p_u_14.ClassName, true)
    p_u_14.camera:capture_focus(p_u_14.char_wrapper)
    p_u_14.ailments:capture_focus(p_u_14.char_wrapper)
    p_u_14.petting_handler:capture_focus(p_u_14.pet_entity)
    v_u_17.stage_performance(p_u_14.pet_entity, {
        ["name"] = v_u_7.FocusPet
    })
    v_u_2.set_should_hide_char_callback("focus_pet_app", function(_, p18)
        return p18.char ~= p_u_14.char_wrapper.char
    end)
    v_u_10:BindAction("confirm", function(_, p19)
        if p19 == Enum.UserInputState.Begin then
            v_u_12:Fire()
            p_u_14:release_focus()
        end
    end, false, Enum.KeyCode.E)
    p_u_14.maid:GiveTask(function()
        v_u_17.end_performance(p_u_14.pet_entity, v_u_7.FocusPet)
        v_u_2.clear_should_hide_char_callback("focus_pet_app")
        v_u_5:enable("focus_pet_app")
        v_u_10:UnbindAction("confirm")
    end)
end
function v13.release_focus(p20)
    if p20.char_wrapper then
        p20.maid:DoCleaning()
        p20.camera:release_focus()
        p20.ailments:release_focus()
        p20.petting_handler:release_focus()
        p20.char_wrapper = nil
        p20.pet_entity = nil
        p20.UIManager.set_app_visibility(p20.ClassName, false)
    end
end
function v13.start(p_u_21)
    p_u_21.maid = v_u_6.new()
    p_u_21.char_wrapper = nil
    p_u_21.pet_entity = nil
    p_u_21.camera = p_u_21.UIManager.wrap(nil, "FocusPetAppCamera")
    p_u_21.camera:start(p_u_21)
    p_u_21.ailments = p_u_21.UIManager.wrap(p_u_21.instance.Frame.Ailments, "FocusPetAppAilments")
    p_u_21.ailments:start()
    p_u_21.petting_handler = p_u_21.UIManager.wrap(nil, "FocusPetAppMockPetting")
    p_u_21.petting_handler:start()
    p_u_21.exit_button = p_u_21.UIManager.wrap(p_u_21.instance.Frame.BackButton, "JaggedButton")
    p_u_21.exit_button:start({
        [(v_u_11 == v_u_8.platform.phone or v_u_11 == v_u_8.platform.tablet) and "mouse_button1_click" or "mouse_button1_down"] = function()
            v_u_12:Fire()
            p_u_21:release_focus()
        end,
        ["hover_color"] = Color3.fromRGB(234, 108, 158),
        ["up_color"] = Color3.fromRGB(237, 44, 121)
    })
end
return v13