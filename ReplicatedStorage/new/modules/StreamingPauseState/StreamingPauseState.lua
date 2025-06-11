--// ReplicatedStorage.new.modules.StreamingPauseState (ModuleScript)

local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("Players")
local v3 = {}
local v_u_4 = {}
function v3.enter_loading_screen(p5)
    v_u_4[p5] = true
    v_u_1:SetGameplayPausedNotificationEnabled(next(v_u_4) == nil)
end
function v3.exit_loading_screen(p6)
    v_u_4[p6] = nil
    v_u_1:SetGameplayPausedNotificationEnabled(next(v_u_4) == nil)
end
function v3.await_unpaused()
    while v_u_2.LocalPlayer.GameplayPaused do
        v_u_2.LocalPlayer:GetPropertyChangedSignal("GameplayPaused"):Wait()
    end
end
return v3