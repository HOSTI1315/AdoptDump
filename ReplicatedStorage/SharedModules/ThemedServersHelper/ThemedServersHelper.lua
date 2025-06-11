--// ReplicatedStorage.SharedModules.ThemedServersHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("SharedConstants")
local v_u_3 = v_u_1("EquippedPets")
local v_u_4 = game:GetService("ServerScriptService")
local v_u_5 = game:GetService("ReplicatedStorage")
local v_u_6 = game:GetService("TeleportService")
local v_u_7 = game:GetService("RunService")
local v_u_8 = {}
local function v_u_12(p9)
    for _, v10 in v_u_4.ReleaseTargets:GetChildren() do
        for _, v11 in require(v10) do
            if v11.universe == p9 then
                return table.clone(v11.places)
            end
        end
    end
    return nil
end
function v_u_8.get_place_type_to_place_id_map()
    local v13 = v_u_12(game.GameId)
    if not v13 and v_u_7:IsStudio() then
        v13 = v_u_12(v_u_2.production_game_id)
    end
    if v13 then
        return v13
    end
    error("Failed to locate a ReleaseTarget for this GameId.")
end
function v_u_8.teleport_players_to_place_type(p14, p15, p16, p17)
    local v18 = v_u_1("package:Stash")
    local v19 = v_u_1("SessionId")
    local v20 = v_u_1("DataM")
    local v21 = v_u_1("ServerRouter")
    if p16 or p15 ~= v_u_8.get_place_type() then
        local v22 = v_u_8.get_place_type_to_place_id_map()[p15]
        if not v22 then
            error(string.format("This ReleaseTarget does not have a place_id for place_type %s.", p15))
        end
        local v23 = nil
        local v24 = {}
        for _, v25 in p14 do
            local v26 = v25.UserId
            v24[tostring(v26)] = v19.session_from_player(v25)
            v21.get("ThemedServersAPI/WillTeleport"):FireClient(v25, p15)
            local v27 = v20.get_store(v25)
            if not v27 then
                return
            end
            v18:log("player_teleported_to_themed_server", {
                ["user_id"] = v25.UserId,
                ["origin_type"] = v_u_8.get_place_type(),
                ["destination_type"] = p15,
                ["discovery_method"] = v27:get("themed_server_discovery_method") or "unknown"
            })
            if p17 then
                v23 = v23 or {}
                local v28 = v25.UserId
                v23[tostring(v28)] = {}
                for _, v29 in v_u_3.get_equipped(v25) do
                    local v30 = v25.UserId
                    local v31 = v23[tostring(v30)]
                    local v32 = v29.unique
                    table.insert(v31, v32)
                end
            end
        end
        local v33 = Instance.new("TeleportOptions")
        v33:SetTeleportData({
            ["session_ids"] = v24,
            ["prev_pet_uniques"] = v23
        })
        v_u_6:TeleportAsync(v22, p14, v33)
    end
end
function v_u_8.get_place_type(p34)
    v_u_7:IsStudio()
    local v35 = v_u_5:FindFirstChild("PlaceType")
    if v35 then
        return v35.Value
    else
        return not p34 and "main" or nil
    end
end
function v_u_8.is_main_place()
    return v_u_8.get_place_type() == "main"
end
function v_u_8.is_afk_place()
    return v_u_8.get_place_type() == "afk"
end
function v_u_8.is_trading_place()
    return false
end
function v_u_8.is_roleplay_place()
    return false
end
function v_u_8.is_private_server()
    v_u_7:IsStudio()
    if v_u_7:IsClient() then
        return game.ReplicatedStorage:WaitForChild("PlaceSubtype").Value == "private"
    end
    local v36 = v_u_8.is_main_place()
    if v36 then
        v36 = game.PrivateServerId ~= ""
    end
    return v36
end
function v_u_8.init()
    if v_u_7:IsServer() and not game.ReplicatedStorage:FindFirstChild("PlaceSubtype") then
        local v37 = Instance.new("StringValue")
        v37.Name = "PlaceSubtype"
        if v_u_8.is_private_server() then
            v37.Value = "private"
        end
        v37.Parent = game.ReplicatedStorage
    end
end
return v_u_8