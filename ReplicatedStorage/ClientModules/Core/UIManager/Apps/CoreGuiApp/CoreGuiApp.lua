--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.CoreGuiApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
local v_u_2 = v1("RouterClient")
v1("XboxSupport")
local v3 = v1("Class")
local v_u_4 = v1("QueueEffect")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("Signal")
local v_u_7 = v1("Debug").create_log()
local v8 = v3("CoreGuiApp", v1("UIBaseApp"))
local v_u_9 = v_u_5.get_platform()
function v8.on_core_gui_enabled_changed(p10, p11, p12)
    local v13 = p10.events[p11]
    local v14 = "CoreGui " .. tostring(p11) .. " is not supported"
    assert(v13, v14)
    return p10.events[p11]:Connect(p12)
end
function v8.set_coregui_disabled(p15, p16, p17)
    local v18 = p15.controllers[p17]
    local v19 = "CoreGui " .. tostring(p17) .. " is not supported"
    assert(v18, v19)
    v_u_7("Disabling CoreGui", p17, p16)
    p15.controllers[p17]:set(p16)
end
function v8.reenable_coregui(p20, p21, p22)
    local v23 = p20.controllers[p22]
    local v24 = "CoreGui " .. tostring(p22) .. " is not supported"
    assert(v23, v24)
    v_u_7("Enabling CoreGui", p22, p21)
    p20.controllers[p22]:clear(p21)
end
function v8.show(_) end
function v8.hide(_) end
function v8.start(p_u_25)
    local v26 = {
        Enum.CoreGuiType.PlayerList,
        Enum.CoreGuiType.Chat,
        Enum.CoreGuiType.Backpack,
        Enum.CoreGuiType.Health,
        "touch_gui"
    }
    p_u_25.events = {}
    p_u_25.controllers = {}
    for _, v_u_27 in pairs(v26) do
        local v_u_28 = v_u_6.new()
        p_u_25.events[v_u_27] = v_u_28
        local v_u_29 = nil
        local v33 = {
            ["refresh"] = function(p30)
                local v31 = p30 == nil
                if v_u_27 == "touch_gui" then
                    local v32 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
                    if v32 then
                        v32 = game.Players.LocalPlayer.PlayerGui.TouchGui:FindFirstChild("TouchControlFrame")
                    end
                    if v32 then
                        v32.Visible = v31
                    end
                else
                    game.StarterGui:SetCoreGuiEnabled(v_u_27, v31)
                end
                if v_u_29 ~= v31 then
                    v_u_29 = v31
                    v_u_28:Fire()
                end
            end
        }
        p_u_25.controllers[v_u_27] = v_u_4.new(v33)
    end
    if v_u_9 == v_u_5.platform.tablet or v_u_9 == v_u_5.platform.phone then
        p_u_25:set_coregui_disabled("navigator", Enum.CoreGuiType.PlayerList)
    end
    p_u_25:set_coregui_disabled("backpack", Enum.CoreGuiType.Backpack)
    p_u_25:set_coregui_disabled("health", Enum.CoreGuiType.Health)
    task.spawn(function()
        if v_u_2.get("MsgAPI/GetChatDisabled"):InvokeServer() then
            p_u_25:set_coregui_disabled("chat_disabled", Enum.CoreGuiType.Chat)
        end
    end)
end
return v8