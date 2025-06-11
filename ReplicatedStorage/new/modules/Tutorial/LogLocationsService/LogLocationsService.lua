--// ReplicatedStorage.new.modules.Tutorial.LogLocationsService (ModuleScript)

local v_u_1 = require(script.Parent.Parent.ABTest.ABTests.TutorialAB)
local v2 = require(script.Parent.Parent.LegacyLoad)
local v_u_3 = v2("CharacterWrapper")
local v_u_4 = v2("DataM")
local v_u_18 = {
    ["player_enters_house"] = function(p5, p6, _)
        local v7
        if p6.destination_id == "housing" then
            v7 = p6.house_owner == p5
        else
            v7 = false
        end
        return v7
    end,
    ["player_enters_someone_house"] = function(p8, p9, _)
        local v10
        if p9.destination_id == "housing" then
            v10 = p9.house_owner ~= p8
        else
            v10 = false
        end
        return v10
    end,
    ["player_exits_house"] = function(p11, _, p12)
        local v13
        if p12.destination_id == "housing" then
            v13 = p12.house_owner == p11
        else
            v13 = false
        end
        return v13
    end,
    ["player_enters_adoption_island"] = function(_, p14, _)
        return p14.destination_id == "MainMap"
    end,
    ["player_enters_adoption_island_building"] = function(_, p15, _)
        local v16
        if p15.destination_id == "MainMap" or p15.destination_id == "Neighborhood" then
            v16 = false
        else
            v16 = p15.destination_id ~= "housing"
        end
        return v16
    end,
    ["player_enters_neighborhood"] = function(_, p17, _)
        return p17.destination_id == "Neighborhood"
    end
}
local v_u_30 = {
    ["on_location_changed"] = function(p19, p20, p21, p22)
        for v23, v24 in v_u_18 do
            if v24(p19, p21, p22) then
                p20:log_discrete_step(v23)
            end
        end
    end,
    ["start"] = function()
        v_u_3.get_location_changed_signal():Connect(function(p25, p26)
            if p26 then
                local v27 = p25.player
                if v27 and not p25.is_pet then
                    if v_u_1:get_value("use_new_tutorial", v27) then
                        local v28 = v_u_4.get_store(v27)
                        local v29
                        if v28 then
                            v29 = v28:get("tutorial_manager")
                        else
                            v29 = nil
                        end
                        if v29 and v29:is_completed() then
                            v_u_30.on_location_changed(v27, v29, p25:get_property("location"), p26)
                        end
                    else
                        return
                    end
                else
                    return
                end
            else
                return
            end
        end)
    end
}
return v_u_30