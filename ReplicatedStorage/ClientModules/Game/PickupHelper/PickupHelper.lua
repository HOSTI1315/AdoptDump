--// ReplicatedStorage.ClientModules.Game.PickupHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
v1("DropBabyHelper")
local v_u_2 = v1("EquippedPets")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_4 = v1("StateManagerClient")
local v_u_5 = v1("PetEntityManager")
local v_u_6 = v1("RouterClient")
local v_u_7 = v1("ClientData")
local v_u_8 = v1("UIManager")
local v_u_9 = v1("PlatformM")
local v_u_10 = v1("Door")
local v_u_11 = v1("package:Sift")
local v_u_12 = game:GetService("CollectionService")
local v_u_13 = {}
local v_u_14 = true
function v_u_13.ride(p15)
    if not v_u_10.entering_door then
        v_u_6.get("AdoptAPI/RideParent"):InvokeServer(p15)
    end
end
function v_u_13.pickup(p_u_16, p17, p18)
    if v_u_10.entering_door then
        return
    end
    local v19 = not p18 and v_u_5.get_pet_entity(p_u_16)
    if v19 and ((v19.base.char_wrapper.player ~= game.Players.LocalPlayer or v19.exclusive_state ~= v_u_3.Focused) and v19.modifier_values_from_performances.dont_allow_sit_states) then
        v_u_8.apps.HintApp:hint({
            ["text"] = "You can\'t pick up your pet right now!",
            ["yields"] = false,
            ["overridable"] = true
        })
        return
    end
    for _, v20 in v_u_12:GetTagged("AnimatedSeatWeld") do
        if v20.CharacterReference.Value == p_u_16 then
            v20:Destroy()
            break
        end
    end
    if not p17 then
        local v_u_21 = nil
        local v22 = {
            ["desktop"] = function()
                if v_u_9.is_using_gamepad() then
                    v_u_21 = "Press B to set " .. p_u_16.Name .. " down"
                else
                    v_u_21 = "Press R to set " .. p_u_16.Name .. " down"
                end
            end,
            ["console"] = "desktop"
        }
        v_u_9.run(v22)
        if v_u_21 then
            local v23 = {
                ["text"] = v_u_21,
                ["length"] = v_u_14 and 7 or 4,
                ["overridable"] = true,
                ["yields"] = false
            }
            v_u_8.apps.HintApp:hint(v23)
        end
        v_u_14 = false
    end
    v_u_6.get("AdoptAPI/HoldBaby"):FireServer(p_u_16)
    v_u_4.client_prediction_add_to_connected_to_me_list(v_u_7.get("state_manager"), p_u_16)
end
function v_u_13.attempt_pickup_pets()
    for _, v_u_25 in v_u_2.get_my_equipped_char_wrappers() do
        if v_u_25 then
            local v_u_25 = v_u_25.char
        end
        local v26 = v_u_7.get("state_manager")
        for _, v27 in v_u_4.get_chars_connected_to_me(v26) do
            local _ = v27 == v_u_25
        end
        local v28 = v_u_4.get_states_by_id(v26, "HoldingBaby")
        if v28 then
            if #v28 == 1 then
                v28 = v28[1]
            else
                v28 = false
            end
        end
        if v28 and v28.baby2 then
            return
        end
        if v_u_25 then
            local v29 = v_u_7.get("pet_state_managers")
            local v31 = v29[v_u_11.List.findWhere(v29, function(p30)
                return p30.char == v_u_25
            end)]
            local v32 = v_u_4.get_states_by_id(v31, "SitInVehicle")
            if not next(v32) then
                v_u_13.pickup(v_u_25, true)
            end
        end
    end
end
local v_u_33 = nil
function v_u_13.watch_pets_for_pickup()
    v_u_13.cleanup()
    if #v_u_2.get_my_equipped_char_wrappers() > 0 then
        v_u_13.attempt_pickup_pets()
    end
    v_u_33 = v_u_7.register_callback("pet_char_wrappers", function(_, p34, p35)
        if #p34 > #p35 then
            v_u_13.attempt_pickup_pets()
        end
    end)
end
function v_u_13.cleanup()
    if v_u_33 then
        v_u_33()
    end
end
function v_u_13.init()
    task.spawn(function()
        v_u_6.get("AdoptAPI/AttemptPetPickupAndWatch").OnClientEvent:Connect(function()
            v_u_13.watch_pets_for_pickup()
        end)
        v_u_6.get("AdoptAPI/StopWatchingPetsForPickup").OnClientEvent:Connect(function()
            v_u_13.cleanup()
        end)
    end)
end
return v_u_13