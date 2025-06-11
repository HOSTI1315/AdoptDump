--// ReplicatedStorage.new.modules.HotspotsByInterior (ModuleScript)

local v_u_1 = require(script.Parent.Ailments.Helpers.AilmentsFurnitureHelper)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(script.Parent.LegacyLoad)
local v_u_5 = v_u_4("FurnitureUseDB")
local v_u_6 = v_u_4("InventoryDB")
local v_u_7 = v_u_4("LiveOpsMapSwap")
local v_u_8 = game:GetService("RunService")
local v_u_9 = {
    ["items"] = {},
    ["ailments"] = {}
}
local v_u_10 = nil
local v_u_11 = false
local v_u_12 = {
    ["housing"] = true,
    ["preview_housing"] = true
}
local v_u_13 = {}
local function v_u_18(p14, p15)
    local v16 = v_u_4("InteriorFurnitureManager").get_interior_data(p15.Name)
    if v16 then
        for _, v17 in v16.furniture do
            if v_u_1.is_furniture_valid(v17.id, p14) then
                return true
            end
        end
    end
    return false
end
local function v_u_27(p19, p20)
    local v21 = p20:FindFirstChild("ShopItems")
    if v21 then
        local v22 = p19.category .. ":" .. p19.kind
        for _, v23 in v21:GetChildren() do
            if v23.Name == v22 then
                return true
            end
        end
    end
    local v24 = v_u_4("InteriorFurnitureManager").get_interior_data(p20.Name)
    if v24 then
        for _, v25 in v24.furniture do
            if v_u_6.pets[v25.id] and v25.id == p19.kind then
                return true
            end
            local v26 = v_u_5[v25.id]
            if v26 and (v26.items_to_acquire and v_u_3.List.find(v26.items_to_acquire, p19.kind) ~= nil) then
                return true
            end
        end
    end
    return false
end
local function v_u_33(p28)
    local v29 = v_u_8:IsServer()
    assert(v29, "find_interiors is server only.")
    local v30 = {}
    for _, v31 in game.ServerStorage.Downloadable.Interiors:GetChildren() do
        local v32 = v_u_7.get_generic_interior_name_from_full(v31.Name)
        if not v_u_12[v32] and p28(v31) then
            v30[v32] = true
        end
    end
    if next(v30) then
        return v30
    else
        return nil
    end
end
function v_u_13.get_client()
    local v34 = v_u_8:IsClient()
    assert(v34, "get_client is client only.")
    if next(v_u_9.items) and next(v_u_9.ailments) then
        return v_u_2.resolve(v_u_9)
    end
    if v_u_10 then
        return v_u_10
    end
    local v_u_35 = v_u_4("RouterClient")
    v_u_10 = v_u_2.try(function()
        v_u_9 = v_u_35.get("GuideArrowAPI/GetHotspotsByInterior"):InvokeServer()
        return v_u_9
    end)
    return v_u_10
end
function v_u_13.get_server()
    local v36 = v_u_8:IsServer()
    assert(v36, "get_server is server only.")
    local v37 = v_u_11
    assert(v37, "HotspotsByInterior is not initialized yet.")
    return v_u_9
end
function v_u_13.start()
    if v_u_8:IsServer() then
        local v38 = os.clock()
        local v39 = v38
        for _, v40 in v_u_6 do
            for v41, v_u_42 in v40 do
                local v44 = v_u_33(function(p43)
                    return v_u_27(v_u_42, p43)
                end)
                if v44 then
                    v_u_9.items[v41] = v44
                end
                if os.clock() - v39 > 1 then
                    task.wait()
                    v38 = os.clock()
                    v39 = v38
                end
            end
        end
        for v_u_45, _ in require(script.Parent.Ailments.AilmentsDB) do
            local v47 = v_u_33(function(p46)
                return v_u_18(v_u_45, p46)
            end)
            if v47 then
                v_u_9.ailments[v_u_45] = v47
            end
            if os.clock() - v39 > 1 then
                task.wait()
                v38 = os.clock()
                v39 = v38
            end
        end
        v_u_11 = true
    else
        v_u_13.get_client()
    end
end
return v_u_13