--// ReplicatedStorage.SharedModules.Game.LiveOpsMapSwap (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("Signal")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ServerStorage")
local v_u_6 = {
    ["Default"] = true,
    ["Desert"] = true,
    ["Snow"] = true,
    ["Fall"] = true,
    ["Rain"] = true
}
local v_u_7 = {
    ["MainMap"] = true,
    ["Neighborhood"] = true
}
local v_u_34 = {
    ["map_type_changed"] = v2.new(),
    ["get_all_map_types"] = function()
        return v_u_3.Dictionary.keys(v_u_6)
    end,
    ["is_valid_map_type"] = function(p8)
        return v_u_6[p8] and true or false
    end,
    ["get_liveops_interiors"] = function()
        return v_u_3.Dictionary.keys(v_u_7)
    end,
    ["get_current_map_type"] = function()
        return v_u_4:IsServer() and (v_u_1("DataM").get_server_constant("LiveOpsMapType") or "Default") or (v_u_1("ClientData").get_server_constant("LiveOpsMapType") or "Default")
    end,
    ["get_full_interior_name"] = function(p9)
        if v_u_7[p9] then
            return p9 .. "!" .. v_u_34.get_current_map_type()
        else
            return p9
        end
    end,
    ["get_generic_interior_name_from_full"] = function(p10)
        return p10:split("!")[1]
    end,
    ["get_current_interior_model"] = function(p11)
        local v12 = v_u_4:IsServer()
        assert(v12, "This API can only be called on the server")
        local v13 = v_u_34.get_full_interior_name(p11)
        return v_u_5.Downloadable.Interiors:FindFirstChild(v13)
    end,
    ["get_all_interior_models"] = function(p14)
        local v15 = v_u_4:IsServer()
        assert(v15, "This API can only be called on the server")
        local v16 = {}
        for _, v17 in pairs(v_u_5.Downloadable.Interiors:GetChildren()) do
            if string.split(v17.Name, "!")[1] == p14 then
                table.insert(v16, v17)
            end
        end
        return v16
    end,
    ["get_all_unique_interior_names"] = function()
        local v18 = v_u_4:IsServer()
        assert(v18, "This API can only be called on the server")
        local v19 = {}
        for _, v20 in pairs(v_u_5.Downloadable.Interiors:GetChildren()) do
            v19[v_u_34.get_generic_interior_name_from_full(v20.Name)] = true
        end
        return v_u_3.Dictionary.keys(v19)
    end,
    ["is_a_swappable_interior_name"] = function(p21)
        return v_u_7[p21] and true or false
    end,
    ["is_a_full_swappable_interior_name"] = function(p22, p23)
        local v24 = v_u_4:IsServer()
        assert(v24, "This API can only be called on the server")
        if v_u_34.is_a_swappable_interior_name(p22) then
            return v_u_5.Downloadable.Interiors:FindFirstChild(p22 .. "!" .. p23) and true or false
        else
            return false
        end
    end,
    ["is_full_interior_name_loaded"] = function(p25)
        local v26 = string.split(p25, "!")
        local v27 = v26[1]
        local v28 = v26[2]
        return not v_u_7[v27] and true or v28 == v_u_34.get_current_map_type()
    end,
    ["is_in_outdated_location"] = function(p29)
        local v30
        if p29 then
            v30 = p29.destination_id .. "!" .. v_u_34.get_current_map_type()
        else
            v30 = p29
        end
        local v31 = p29 and v_u_7[p29.destination_id]
        if v31 then
            v31 = p29.full_destination_id ~= v30
        end
        return v31
    end,
    ["set_current_liveops_map_type"] = function(p32)
        local v33 = v_u_4:IsServer()
        assert(v33, "This API can only be called on the server")
        if not v_u_34.is_valid_map_type(p32) then
            warn(("Invalid map type set [%s], using default"):format(p32))
            p32 = "Default"
        end
        v_u_1("DataM").update_server_constant("LiveOpsMapType", p32)
    end,
    ["init"] = function()
        if v_u_4:IsServer() then
            v_u_1("DataM").get_global_store():get_on_key_changed_event("LiveOpsMapType"):Connect(function()
                v_u_34.map_type_changed:Fire()
            end)
            v_u_34.set_current_liveops_map_type("Default")
        else
            v_u_1("ClientData").register_callback("LiveOpsMapType", function()
                v_u_34.map_type_changed:Fire()
            end)
        end
    end
}
return v_u_34