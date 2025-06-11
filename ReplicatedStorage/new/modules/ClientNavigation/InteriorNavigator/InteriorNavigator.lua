--// ReplicatedStorage.new.modules.ClientNavigation.InteriorNavigator (ModuleScript)

require(script.Parent.NavigationTargetProvider)
local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = v2("Signal")
local v_u_4 = v2("Maid")
local v_u_5 = game:GetService("RunService")
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new(p7)
    local v8 = {
        ["options"] = p7,
        ["target_provider"] = p7.target_provider,
        ["_maid"] = v_u_4.new()
    }
    local v9 = v_u_6
    return setmetatable(v8, v9)
end
function v_u_6.start(p_u_10)
    p_u_10._promise = p_u_10.target_provider:start():andThen(function()
        local v_u_11 = v_u_3.new()
        local v_u_12 = tick()
        if p_u_10.options.on_target_changed then
            p_u_10.options.on_target_changed(p_u_10.target_provider:get_target_position())
            p_u_10._maid:GiveTask(p_u_10.target_provider.target_position_changed:Connect(function(p13)
                p_u_10.options.on_target_changed(p13)
            end))
        end
        p_u_10._maid:GiveTask(v_u_5.Heartbeat:connect(function()
            if p_u_10.options.on_update then
                local v14 = p_u_10:_get_character_position()
                local v15 = p_u_10.target_provider:get_target_position()
                p_u_10.options.on_update(v14, v15)
            end
            if v_u_12 < tick() then
                v_u_12 = v_u_12 + 0.2
                if p_u_10:_has_arrived() then
                    v_u_11:Fire()
                end
            end
        end))
        return v_u_1.race({ v_u_1.fromEvent(game.Players.PlayerRemoving, function(p16)
                return p16 == p_u_10.target_provider:get_destination_house_owner()
            end):andThenReturn("HOUSE_OWNER_LEFT"), v_u_1.fromEvent(v_u_11):andThenReturn("ARRIVED_SUCCESSFULLY") })
    end):done(function(p17)
        p_u_10._maid:DoCleaning()
        return p17 or "NAVIGATION_CANCELED"
    end)
    return p_u_10._promise
end
function v_u_6._has_arrived(p18)
    if p18.target_provider:is_within_destination_interior() then
        local v19 = p18.target_provider:get_target_position()
        local v20 = p18:_get_character_position()
        if v20 then
            if p18.options.has_arrived then
                return p18.options.has_arrived(v20, v19)
            else
                return not (v20 and v19) and true or (v20 - v19).Magnitude < 20
            end
        else
            return false
        end
    else
        return false
    end
end
function v_u_6._get_character_position(p21)
    if p21.options.get_character_position then
        return p21.options.get_character_position()
    end
    local v22 = game.Players.LocalPlayer.Character
    if v22 then
        v22 = v22:FindFirstChild("HumanoidRootPart")
    end
    if v22 then
        v22 = v22.Position
    end
    return v22
end
function v_u_6.destroy(p23)
    if p23._promise and p23._promise:getStatus() == v_u_1.Status.Started then
        p23._promise:cancel()
    end
end
return v_u_6