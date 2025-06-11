--// ReplicatedStorage.SharedModules.Util.canUseAdminApi (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v3 = v2("ServerType")
local v_u_4 = nil
local v_u_5 = nil
if v_u_1:IsServer() then
    v_u_5 = v2("DataM")
else
    v_u_4 = v2("ClientData")
end
local v6 = v3.use_production_behavior() and 245 or 101
local v_u_7 = {
    ["DefaultAdmin"] = 245,
    ["Admin"] = 245,
    ["DefaultDebug"] = v6,
    ["Debug"] = v6,
    ["DeveloperDebug"] = v3.use_production_behavior() and 247 or 101,
    ["Developer"] = 247,
    ["Staff"] = 246,
    ["Tester"] = 101,
    ["DefaultUtil"] = 101,
    ["EveryoneOnRobloxInTesting"] = v3.use_production_behavior() and 245 or 0,
    ["EVERYONE_ON_ROBLOX"] = 0,
    ["Help"] = 0,
    ["UserAlias"] = 0,
    ["CameraTools"] = 246,
    ["Disabled"] = 256
}
return function(p8, p9)
    local v10 = p9 or "Developer"
    if v_u_7[v10] == nil then
        return false, ("Group %* has no rank requirement so execution has been blocked for security purposes. Please report this bug."):format(v10)
    elseif v_u_1:IsStudio() then
        return true
    else
        local v11
        if v_u_1:IsServer() then
            v11 = v_u_5.get_store(p8):get("has_camera_tools")
        else
            v11 = v_u_4.get("has_camera_tools")
        end
        if v11 and (v10 == "CameraTools" or v10 == "DefaultUtil") then
            return true
        elseif p8:GetRankInGroup(295182) >= v_u_7[v10] then
            return true
        else
            return false, "You don\'t have permission to use this command."
        end
    end
end