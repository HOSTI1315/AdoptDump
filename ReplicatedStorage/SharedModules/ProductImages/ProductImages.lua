--// ReplicatedStorage.SharedModules.ProductImages (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("GamepassDB")
local v_u_3 = v_u_1("DeveloperProductDB")
local v_u_4 = v_u_1("new:SubscriptionsDB")
local v_u_5 = v_u_1("SimpleEvents")
local v_u_6 = v_u_1("package:Promise")
local v7 = v_u_1("package:t")
local v_u_8 = game:GetService("MarketplaceService")
local v_u_9 = game:GetService("RunService")
local v_u_10 = v7.strictInterface({
    ["use_large_image_id"] = v7.optional(v7.boolean)
})
local v11 = {}
local v_u_12 = {}
local function v_u_20(p_u_13, p_u_14, p_u_15)
    local v16 = v_u_12[p_u_14]
    if v16 then
        return v_u_6.resolve(v16)
    else
        return v_u_6.try(function()
            local v17 = v_u_8:GetProductInfo(p_u_13, p_u_15)
            local v18 = v17.IconImageAssetId
            assert(v18)
            return v17.IconImageAssetId
        end):tap(function(p19)
            v_u_12[p_u_14] = p19
        end)
    end
end
local function v_u_27(p21, p22, p23, p_u_24)
    return v_u_20(p21, p22, p23):andThen(function(p25)
        if p_u_24 then
            return ("rbxassetid://%i"):format(p25)
        else
            return ("rbxthumb://type=Asset&id=%i&w=150&h=150"):format(p25)
        end
    end):catch(function(p26)
        warn(p26)
        return ""
    end)
end
function v11.get(p28, p29)
    local v30 = p29 or {}
    local v31 = v_u_10
    assert(v31(v30))
    local v32 = v_u_2[p28] or (v_u_3[p28] or v_u_4[p28])
    local v33 = v_u_2[p28] ~= nil
    local v34 = v_u_4[p28] ~= nil
    if v30.use_large_image_id and v32.large_image_id then
        return v_u_6.resolve(("rbxassetid://%i"):format(v32.large_image_id))
    elseif v32.image_id then
        return v_u_6.resolve(("rbxassetid://%i"):format(v32.image_id))
    elseif v33 then
        if v30.use_large_image_id then
            return v_u_27(v32.id, p28, Enum.InfoType.GamePass, v30.use_large_image_id)
        else
            return v_u_6.resolve(("rbxthumb://type=GamePass&id=%i&w=150&h=150"):format(v32.id))
        end
    elseif v34 then
        return v_u_6.resolve(("rbxassetid://%i"):format(v32.product_info and v32.product_info.IconImageAssetId or ""))
    else
        return v_u_27(v32.product_id, p28, Enum.InfoType.Product, v30.use_large_image_id)
    end
end
function v11.init()
    if v_u_9:IsClient() then
        task.spawn(function()
            for v35, v36 in v_u_1("RouterClient").get("ProductImagesAPI/SendPrefetchedProductImageIds").OnClientEvent:Wait() do
                v_u_12[v35] = v36
            end
        end)
    else
        task.spawn(function()
            local v_u_37 = v_u_1("ServerRouter")
            local v38 = {}
            for v39, v40 in v_u_3 do
                if not v40.image_id then
                    local v41 = v_u_20
                    local v42 = v40.product_id
                    local v43 = Enum.InfoType.Product
                    table.insert(v38, v41(v42, v39, v43))
                end
            end
            for v44, v45 in v_u_2 do
                if not v45.image_id then
                    local v46 = v_u_20
                    local v47 = v45.id
                    local v48 = Enum.InfoType.GamePass
                    table.insert(v38, v46(v47, v44, v48))
                end
            end
            v_u_6.allSettled(v38):await()
            v_u_5.get("PlayerAddedPlusExisting"):Connect(function(p49)
                v_u_37.get("ProductImagesAPI/SendPrefetchedProductImageIds"):FireClient(p49, v_u_12)
            end)
        end)
    end
end
return v11