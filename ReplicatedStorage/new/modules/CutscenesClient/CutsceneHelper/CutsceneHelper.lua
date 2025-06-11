--// ReplicatedStorage.new.modules.CutscenesClient.CutsceneHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = v2("CharacterHider")
local v_u_4 = v2("ControlsDisabler")
local v_u_5 = v2("InteractionsEngine")
local v_u_6 = v2("Maid")
local v_u_7 = v2("UIManager")
return {
    ["enter"] = function(p_u_8)
        local v_u_9 = workspace.CurrentCamera
        local v_u_10 = v_u_6.new()
        v_u_9.CameraType = Enum.CameraType.Scriptable
        v_u_10:GiveTask(function()
            v_u_9.CameraType = Enum.CameraType.Custom
        end)
        v_u_1:BindToRenderStep("cutscene", Enum.RenderPriority.Camera.Value, function()
            v_u_9.Focus = v_u_9.CFrame
        end)
        v_u_10:GiveTask(function()
            v_u_1:UnbindFromRenderStep("cutscene")
        end)
        v_u_5:disable("cutscene")
        v_u_10:GiveTask(function()
            v_u_5:enable("cutscene")
        end)
        if p_u_8.hide_ui then
            v_u_7.apps.HideGuiApp:hide_all("cutscene", { "TransitionsApp" })
            v_u_10:GiveTask(function()
                v_u_7.apps.HideGuiApp:unhide_all("cutscene")
            end)
        end
        if p_u_8.disable_controls then
            v_u_4.disable_controls("cutscene")
            v_u_7.apps.CoreGuiApp:set_coregui_disabled("cutscene", "touch_gui")
            v_u_10:GiveTask(function()
                v_u_4.enable_controls("cutscene")
                v_u_7.apps.CoreGuiApp:reenable_coregui("cutscene", "touch_gui")
            end)
        end
        if p_u_8.hide_all_characters or p_u_8.hide_my_character then
            v_u_3.set_should_hide_char_callback("cutscene", function(p11, p12)
                return p_u_8.hide_all_characters and true or p12.unique == p11.unique
            end)
            v_u_10:GiveTask(function()
                v_u_3.clear_should_hide_char_callback("cutscene")
            end)
        end
        return function()
            v_u_10:DoCleaning()
        end
    end
}