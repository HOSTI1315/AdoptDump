--// ReplicatedStorage.ClientModules.Game.ToolHelpers.PlaceableToolHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("InteriorsM")
local v_u_4 = v_u_1("Maid")
local v_u_5 = v_u_1("UIManager")
local v_u_6 = game:GetService("CollectionService")
local v_u_10 = {
    ["toy_furniture"] = function(p7)
        return p7.destination_id == "MainMap" and true or p7.destination_id == "Neighborhood"
    end,
    ["default"] = function(p8, p9)
        if p8.placeable_whitelist and not p8.placeable_whitelist[p9.placeable_type] then
            return false
        else
            return not (p8.placeable_blacklist and p8.placeable_blacklist[p9.placeable_type])
        end
    end
}
local v_u_12 = {
    ["homeing_rocket"] = function(p11)
        return p11.destination_id ~= "housing"
    end
}
local v_u_40 = {
    ["can_place"] = function(p13)
        local v14 = v_u_3.get_current_location()
        local v15 = v_u_12[p13.placeable_type]
        return not v15 and true or v15(v14, p13)
    end,
    ["validate_placement"] = function(p16)
        local v17 = v_u_3.get_current_location()
        local v18 = v_u_10[p16.placeable_type]
        if v18 then
            if not v18(v17) then
                v_u_5.apps.DialogApp:dialog({
                    ["text"] = "You can\'t place that here",
                    ["button"] = "Okay"
                })
                return false
            end
        elseif not v_u_10.default(v17, p16) then
            v_u_5.apps.DialogApp:dialog({
                ["text"] = "You can\'t place that here",
                ["button"] = "Okay"
            })
            return false
        end
        return true
    end,
    ["listen_for_placeables"] = function(p19, p_u_20, p_u_21)
        local v_u_22 = {}
        v_u_6:GetInstanceAddedSignal(p19):Connect(function(p23)
            local v24 = v_u_4.new()
            v_u_22[p23] = v24
            p_u_20(p23, v24)
        end)
        for _, v_u_25 in v_u_6:GetTagged(p19) do
            task.spawn(function()
                local v26 = v_u_4.new()
                v_u_22[v_u_25] = v26
                p_u_20(v_u_25, v26)
            end)
        end
        v_u_6:GetInstanceRemovedSignal(p19):Connect(function(p27)
            local v28 = v_u_22[p27]
            if v28 then
                v28:DoCleaning()
                v_u_22[p27] = nil
            end
            if p_u_21 then
                p_u_21(p27)
            end
        end)
    end,
    ["get_house_owner"] = function(p29)
        local v30 = v_u_1("CharWrapperClient")
        local v31
        if p29 then
            v31 = v30.get(p29)
        else
            v31 = v_u_2.get("char_wrapper")
        end
        local v32 = not v31 and {} or v31.location
        if v32.destination_id == "housing" then
            return v32.house_owner
        else
            return nil
        end
    end,
    ["is_house_owner"] = function()
        local v33 = game.Players.LocalPlayer
        if v33 then
            v33 = v_u_40.get_house_owner() == v33
        end
        return v33
    end,
    ["get_owner"] = function(p34)
        return p34:WaitForChild("Owner").Value
    end,
    ["get_owner_changed_signal"] = function(p35)
        return p35:WaitForChild("Owner").Changed
    end,
    ["get_value"] = function(p36, p37)
        return p36:GetAttribute(p37)
    end,
    ["get_value_changed_signal"] = function(p38, p39)
        return p38:GetAttributeChangedSignal(p39)
    end
}
return v_u_40