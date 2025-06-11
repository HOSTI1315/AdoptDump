--// ReplicatedStorage.ClientModules.Core.SoundEffects (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CharWrapperClient")
local v_u_3 = v1("SimpleEvents")
local v_u_4 = game:GetService("SoundService")
local v5 = {}
local v_u_6 = {}
local function v_u_11(p7, p8)
    local v9 = p8:WaitForChild("HumanoidRootPart")
    if v_u_6[p7] then
        v_u_6[p7]:Disconnect()
    end
    v_u_6[p7] = v_u_3.foreach_child_including_new(v9, function(p10)
        if p10:IsA("Sound") then
            p10.SoundGroup = v_u_4:FindFirstChild("SoundEffects")
        end
    end)
end
function v5.set_master_volume(p12)
    local v13 = math.clamp(p12, 0, 1)
    v_u_4:FindFirstChild("SoundEffects").Volume = v13
end
function v5.init()
    v_u_2.register_player_wrapper_char_changed(function(p14, p15)
        if p15 and p15.char then
            v_u_11(p14, p15.char)
        elseif v_u_6[p14] then
            v_u_6[p14]:Disconnect()
            v_u_6[p14] = nil
        end
    end)
end
return v5