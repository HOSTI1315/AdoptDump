--// ReplicatedStorage.new.modules.Ailments.ClientActions.FurnitureNavigationAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.Parent.Helpers.AilmentsFurnitureHelper)
local v_u_4 = require(script.Parent.Parent.Parent.HotspotsByInterior)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_6 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v7 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_8 = v7("ClientData")
local v_u_9 = v7("EquippedPets")
local v_u_10 = v7("HouseEditorHelper")
local v_u_11 = v7("InteractionsEngine")
local v_u_12 = v7("InteriorsM")
local v_u_13 = v7("new:NavigationHelper")
local v_u_14 = v7("PetActions")
local v_u_15 = v7("SharedConstants")
local v_u_16 = v7("StateManagerClient")
local v_u_17 = v7("UIManager")
local v_u_18 = {}
v_u_18.__index = v_u_18
setmetatable(v_u_18, v2)
function v_u_18.new(p19)
    local v20 = v_u_18
    return setmetatable({
        ["options"] = p19
    }, v20)
end
function v_u_18.get_valid_interaction(p_u_21)
    local v22 = v_u_11:get_interactions()
    local v25 = v_u_6.List.findWhere(v22, function(p23)
        if p23:get_visibility() and not p23:is_hidden() then
            if p23.tag == p_u_21.options.ailment_to_boost then
                local v24 = p23.part.Parent.Parent
                if v24 then
                    return v_u_3.is_furniture_model_valid(v24, p_u_21.options.ailment_to_boost)
                else
                    return false
                end
            else
                return false
            end
        else
            return false
        end
    end)
    if v25 then
        return v22[v25]
    else
        return nil
    end
end
function v_u_18.automatically_use_nearby_furniture(p_u_26, p_u_27)
    return v_u_5.new(function(p28, _, p29)
        while true do
            task.wait(0.2)
            if p29() then
                break
            end
            local v30 = v_u_8.get("char_wrapper")
            if v30 and (v30.char and (v30.char.HumanoidRootPart.Position - p_u_27.char.HumanoidRootPart.Position).Magnitude <= v_u_15.max_caregiver_assist_dist) then
                local v_u_31 = p_u_26:get_valid_interaction()
                if v_u_31 then
                    task.spawn(function()
                        v_u_17.apps.InteractionsApp:call_on_selected(v_u_31, function(p32)
                            return v_u_31.on_selected(p32, p_u_27)
                        end)
                    end)
                    break
                end
                if p_u_26._is_carrying_pet then
                    local v33 = v_u_16.get(v30.char)
                    if not (v33 and v_u_16.char_is_connected_to_me(v33, p_u_27.char)) then
                        break
                    end
                end
            end
        end
        p28()
    end)
end
function v_u_18.start(p_u_34, p_u_35)
    local v_u_36 = p_u_34.options.ailment_to_boost
    local v_u_37 = nil
    local v_u_38 = nil
    local v_u_39 = true
    local v_u_40 = false
    local v_u_42 = v_u_17.apps.InteractionsApp:get_interaction_signal():Connect(function(p41)
        v_u_40 = p41.tag == v_u_36
    end)
    p_u_34._promise = v_u_4.get_client():andThen(function(p43)
        local v44 = p43.ailments
        local v45 = v_u_6.Dictionary.keys(v44[p_u_34.options.ailment_to_boost] or {})
        table.insert(v45, "housing")
        v_u_37 = v_u_13.find_closest_interior(v45)
        local v46 = v_u_37
        local v47
        if typeof(v46) == "table" then
            v47 = v_u_37.destination_id == "housing"
        else
            v47 = false
        end
        v_u_38 = v47
        if not v_u_9.is_wrapper_equipped(p_u_35) then
            p_u_34._is_carrying_pet = true
            v_u_14.pick_up(p_u_35, true)
        end
        v_u_17.apps.FocusPetApp:release_focus()
        v_u_10.get_exit_edit_signal():Fire()
        local v_u_50 = v_u_17.apps.GuideArrowApp:navigate_promise({
            ["final_destination"] = v_u_37,
            ["pet_unique"] = p_u_35.pet_unique,
            ["custom_position_or_method"] = function(_)
                local v48 = v_u_3.find_furniture_position(p_u_34.options.ailment_to_boost)
                v_u_39 = v48 ~= nil
                return v48
            end,
            ["custom_has_arrived_method"] = function()
                if not v_u_38 then
                    return v_u_40
                end
                local v49 = not (v_u_40 or v_u_39)
                if v49 then
                    v49 = not v_u_12.entering
                end
                return v49
            end
        })
        p_u_34._nav_promise = v_u_5.new(function(p51, p52, p53)
            p53(function()
                v_u_50:cancel()
            end)
            if v_u_50:await() then
                p51()
            else
                p52()
            end
        end)
        p_u_34._use_furniture_promise = p_u_34:automatically_use_nearby_furniture(p_u_35)
        return v_u_5.race({ p_u_34._nav_promise, p_u_34._use_furniture_promise })
    end):done(function()
        v_u_42:Disconnect()
    end)
    v_u_1.run_promise(p_u_34._promise, { "navigation", "house_editor" })
    local v54 = p_u_34._promise:awaitStatus()
    local v55 = v_u_1.get_result_from_status(v54)
    if v55 then
        return v_u_38 and not v_u_12.entering and true or v_u_40
    else
        return v55
    end
end
function v_u_18.stop(p56)
    if p56._promise then
        p56._promise:cancel()
    end
    p56._is_carrying_pet = false
end
return v_u_18