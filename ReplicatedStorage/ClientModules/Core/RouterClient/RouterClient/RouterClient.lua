--// ReplicatedStorage.ClientModules.Core.RouterClient.RouterClient (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v3 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_4 = v3("SimpleEvents")
local v_u_5 = v3("Debug").create_log()
local v_u_6 = require(game.ReplicatedFirst.Load.LoadTimers)
local v7 = {}
local v_u_8 = {}
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local function v_u_23(p12, _)
    if v_u_10 == nil then
        v_u_10 = {}
        v_u_11 = {}
        for v13 = 65, 90 do
            local v14 = v_u_10
            table.insert(v14, v13)
            v_u_11[v13] = #v_u_10
        end
        for v15 = 97, 122 do
            local v16 = v_u_10
            table.insert(v16, v15)
            v_u_11[v15] = #v_u_10
        end
        local v17 = v_u_10
        table.insert(v17, 47)
        v_u_11[47] = #v_u_10
    end
    local v18 = {}
    local v19 = string.len(p12)
    __set_list(v18, 1, {string.byte(p12, 1, v19)})
    for v20, v21 in pairs(v18) do
        v18[v20] = v_u_10[(v_u_11[v21] - v20 - v_u_9 - 1 + #v_u_10) % #v_u_10 + 1]
    end
    local v22 = unpack
    return string.char(v22(v18))
end
function get_remote_from_cache(p24)
    local v25 = tick()
    while v_u_8[p24] == nil do
        if tick() - v25 > 5 then
            warn("Infinite yield possible on remote " .. p24)
            v25 = (1 / 0)
        end
        wait(0.2)
    end
    return v_u_8[p24]
end
function v7.get(p26, _)
    return get_remote_from_cache(p26)
end
function v7.get_event(p27)
    return get_remote_from_cache(p27)
end
function v7.init()
    local v28, v29 = v_u_6.new_misc_consecutive_timers()
    v28("081_router_client_init_wait")
    local v30 = v_u_2:WaitForChild("RemoteInfo")
    local v31 = v_u_1:JSONDecode(v30.Value)
    local v32 = v31.crypt_num
    local v33 = v31.noncipher_remotes
    v_u_9 = v32
    v30.Value = ""
    v30:Destroy()
    v28("081_router_client_init")
    local v_u_34 = {}
    for _, v35 in pairs(v33) do
        v_u_5("Setting noncipher hash", v35)
        v_u_34[v35] = true
    end
    v_u_4.get("ChildAddedPlusExisting", game.ReplicatedStorage:WaitForChild("API")):connect(function(p36)
        if v_u_34[p36.Name] then
            v_u_8[p36.Name] = p36
        else
            v_u_8[v_u_23(p36.Name)] = p36
        end
    end)
    v29()
end
return v7