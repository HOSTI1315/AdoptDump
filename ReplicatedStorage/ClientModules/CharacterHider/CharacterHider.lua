--// ReplicatedStorage.ClientModules.CharacterHider (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("CharWrapperClient")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("CollisionsClient")
local v_u_5 = v_u_1("EquippedPets")
local v_u_6 = v_u_1("Maid")
local v_u_7 = v_u_1("RouterClient")
local v_u_8 = v_u_1("package:Sift")
local v_u_9 = v_u_1("SimpleEvents")
local v_u_10 = v_u_1("new:StreamingHelper")
local v_u_11 = game:GetService("Players")
local v12 = {}
local v_u_13 = false
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {
    ["BasePart"] = {
        ["Transparency"] = 1
    },
    ["Beam"] = {
        ["Enabled"] = false
    },
    ["Decal"] = {
        ["Transparency"] = 1
    },
    ["ImageLabel"] = {
        ["ImageTransparency"] = 1
    },
    ["Light"] = {
        ["Enabled"] = false
    },
    ["ParticleEmitter"] = {
        ["Enabled"] = false
    },
    ["Sound"] = {
        ["Volume"] = 0
    }
}
local function v_u_24(p19)
    for v20, v21 in v_u_18 do
        if p19:IsA(v20) then
            local v22, v23 = next(v21)
            return v22, v23
        end
    end
    return nil, nil
end
local function v_u_36(p_u_25)
    local v_u_26 = v_u_6.new()
    local v_u_27 = 1
    v_u_26:GiveTask(v_u_9.foreach_descendant_including_new(p_u_25, function(p_u_28)
        local v_u_29, v_u_30 = v_u_24(p_u_28)
        if v_u_29 then
            local v_u_31 = ("reset_value_%*"):format(v_u_27)
            v_u_27 = v_u_27 + 1
            local function v33()
                local v_u_32 = p_u_28[v_u_29]
                if v_u_32 ~= v_u_30 then
                    v_u_26[v_u_31] = function()
                        if p_u_28 and (p_u_28.Parent and p_u_28[v_u_29] == v_u_30) then
                            p_u_28[v_u_29] = v_u_32
                        end
                    end
                    p_u_28[v_u_29] = v_u_30
                end
            end
            local v_u_34 = p_u_28[v_u_29]
            if v_u_34 ~= v_u_30 then
                v_u_26[v_u_31] = function()
                    if p_u_28 and (p_u_28.Parent and p_u_28[v_u_29] == v_u_30) then
                        p_u_28[v_u_29] = v_u_34
                    end
                end
                p_u_28[v_u_29] = v_u_30
            end
            v_u_26:GiveTask(p_u_28:GetPropertyChangedSignal(v_u_29):Connect(v33))
        end
    end))
    local v_u_35 = v_u_1("UIManager")
    v_u_35.apps.PlayerNameApp:_refresh_above_char_stack(p_u_25)
    v_u_26:GiveTask(function()
        v_u_35.apps.PlayerNameApp:_refresh_above_char_stack(p_u_25)
    end)
    return function()
        v_u_26:DoCleaning()
    end
end
local function v_u_43(p37, p38)
    if v_u_13 then
        return true
    end
    local v39 = v_u_15[select(2, next(v_u_16))]
    if v39 and v39(p37, p38) then
        return true
    end
    if not p38.is_pet and (p38.player ~= v_u_11.LocalPlayer and v_u_3.get_server(p38.player, "dev_watchmode")) then
        return true
    end
    if p37 and v_u_2.is_in_same_location(p37, p38) then
        local v40 = p37.location
        if v40 then
            v40 = p37.location.destination_id
        end
        if v_u_14[v40] then
            local v41 = {}
            for _, v42 in v_u_5.get_equipped_char_wrappers() do
                v41[v42] = true
            end
            if v41[p38] == nil and p37 ~= p38 then
                return true
            end
        end
    end
    return false
end
local function v_u_47(p44)
    local v45 = v_u_43(v_u_2.get(game.Players.LocalPlayer.Character), p44)
    local v46 = p44.char
    if v45 then
        if not v_u_17[v46] then
            v_u_17[v46] = v_u_36(p44.char)
            return
        end
    elseif v_u_17[v46] then
        v_u_17[v46]()
        v_u_17[v46] = nil
    end
end
local function v_u_50()
    for _, v48 in v_u_2.get_all_char_wrappers() do
        if v48.char then
            v_u_47(v48)
        end
    end
    for v49, _ in v_u_17 do
        if not (v49.Parent and v_u_2.get(v49)) then
            v_u_17[v49]()
            v_u_17[v49] = nil
        end
    end
end
function v12.is_char_hidden(p51)
    return v_u_17[p51] ~= nil
end
function v12.hide_all_chars()
    v_u_4.disable_player_on_collision("hide_all_chars")
    v_u_13 = true
    v_u_50()
end
function v12.show_all_chars()
    v_u_4.enable_player_on_collision("hide_all_chars")
    v_u_13 = false
    v_u_50()
end
function v12.refresh_all_chars()
    v_u_50()
end
function v12.set_should_hide_char_callback(p52, p53)
    v_u_4.disable_player_on_collision(p52)
    if v_u_15[p52] then
        v_u_16 = v_u_8.List.removeValue(v_u_16, p52)
    end
    v_u_16 = v_u_8.List.join({ p52 }, v_u_16)
    v_u_15[p52] = p53
    v_u_50()
end
function v12.clear_should_hide_char_callback(p54)
    v_u_4.enable_player_on_collision(p54)
    v_u_16 = v_u_8.List.removeValue(v_u_16, p54)
    v_u_15[p54] = nil
    v_u_50()
end
function v12.hide_other_characters_in_location(p55)
    v_u_4.disable_player_on_collision(p55)
    v_u_14[p55] = true
    v_u_50()
end
function v12.unhide_other_characters_in_location(p56)
    v_u_4.enable_player_on_collision(p56)
    v_u_14[p56] = nil
    v_u_50()
end
function v12.init()
    v_u_2.register_property_changed("location", function(p57, _, p58)
        if p57 == game.Players.LocalPlayer.Character then
            v_u_50()
            return
        else
            if p58 == nil then
                task.defer(coroutine.running())
                coroutine.yield()
            end
            local v59 = v_u_2.get(p57)
            if v59 and v59.char == p57 then
                v_u_47(v59)
            end
        end
    end)
    v_u_7.get("LocationAPI/RefreshCharHider").OnClientEvent:connect(function(p60)
        for _, v_u_61 in p60 do
            task.spawn(function()
                local v62 = v_u_10.await(v_u_61, 30)
                if v62 then
                    v_u_47(v_u_2.get(v62))
                end
            end)
        end
    end)
end
return v12