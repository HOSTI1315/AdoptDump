--// ReplicatedStorage.ClientModules.Game.PetFurnitureExit (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ClientToolManager")
local v_u_3 = v_u_1("PetEntityManager")
local v_u_4 = v_u_1("SettingsHelper")
local v_u_5 = v_u_1("EquippedPets")
local v_u_6 = v_u_1("RouterClient")
local v_u_7 = v_u_1("ClientData")
local v_u_8 = v_u_1("HouseDB")
local v_u_9 = game:GetService("Players")
local v_u_10 = {
    ["MainMap"] = true,
    ["Neighborhood"] = true
}
local v_u_11 = {}
local v_u_12 = -1
local function v_u_15()
    local v13 = nil
    local v14 = v_u_1("InteriorsM").get_current_location()
    if v14 then
        v14 = v14.destination_id
    end
    if v14 == "housing" then
        v13 = v_u_8[(v_u_7.get("house_interior") or {}).building_type]
    end
    return v14, v13
end
function v_u_11.exit_furniture_states(p16)
    if p16 then
        if v_u_5.is_wrapper_equipped(p16) then
            local v17 = v_u_6.get("PetAPI/ExitFurnitureUseStates")
            if p16 then
                p16 = p16.pet_unique
            end
            v17:InvokeServer(p16)
            return true
        end
    elseif #v_u_5.get_my_equipped() > 0 then
        v_u_6.get("PetAPI/ExitFurnitureUseStates"):InvokeServer()
        return true
    end
    return false
end
function v_u_11.exit_furniture_states_if_setting_enabled(p18)
    if v_u_4.get_setting_client({
        ["setting_id"] = "pet_can_auto_exit_furniture"
    }) then
        return v_u_11.exit_furniture_states(p18)
    else
        return false
    end
end
function v_u_11.set_max_walk_distance(p19)
    v_u_12 = p19 * p19
end
function v_u_11.init()
    v_u_11.set_max_walk_distance(25)
    task.spawn(function()
        v_u_1("InteriorsM").on_location_changing:Connect(function()
            v_u_11.exit_furniture_states_if_setting_enabled()
        end)
        while true do
            if v_u_4.get_setting_client({
                ["setting_id"] = "pet_can_auto_exit_furniture"
            }) then
                local v20, v21 = v_u_15()
                if v20 and v21 then
                    v20 = v20 .. "!" .. v21.id
                end
                if v20 and v_u_10[v20] then
                    local v22 = v_u_9.LocalPlayer.Character
                    if v22 then
                        v22 = v22:FindFirstChild("HumanoidRootPart")
                    end
                    for _, v23 in v_u_3.get_local_owned_pet_entities() do
                        local v24
                        if v23 then
                            v24 = v23.base.root
                        else
                            v24 = v23
                        end
                        if v22 and (v24 and (v22:IsDescendantOf(workspace) and v24:IsDescendantOf(workspace))) then
                            local v25 = v22.Position - v24.Position
                            if v_u_12 < v25:Dot(v25) then
                                v_u_11.exit_furniture_states_if_setting_enabled(v23.base.char_wrapper)
                            end
                        end
                    end
                end
            end
            task.wait(1)
        end
    end)
    v_u_4.promise_setting_changed_signal("pet_can_auto_exit_furniture"):andThen(function(p26)
        p26:Connect(function(p27)
            if p27 then
                for _, v28 in v_u_5.get_my_equipped() do
                    local v29 = v_u_5.get_wrapper_from_item(v28)
                    if v_u_11.exit_furniture_states_if_setting_enabled(v29) then
                        v_u_2.backpack_equip(v28, {
                            ["forced_action"] = "equip",
                            ["suppress_fail_message"] = true
                        })
                    end
                end
            end
        end)
    end)
end
return v_u_11