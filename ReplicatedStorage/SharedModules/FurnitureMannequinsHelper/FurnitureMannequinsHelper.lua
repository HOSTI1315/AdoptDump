--// ReplicatedStorage.SharedModules.FurnitureMannequinsHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("DelayedUpdateBuffer")
local v_u_3 = v_u_1("package:Sift")
local v_u_4 = v_u_1("package:t")
local v_u_5 = game:GetService("CollectionService")
local v_u_6 = game:GetService("RunService")
local v_u_32 = {
    ["outfit_has_exclusive_content"] = function(p7)
        local v8 = v_u_1("AvatarItemSupplementalDB")
        local v9 = p7.assets
        for v10, v_u_11 in v8 do
            if v10 == "catalog_blacklist" then
                if v_u_3.Dictionary.some(v9, function(p12)
                    return v_u_3.List.some(p12, function(p13)
                        return v_u_3.Dictionary.has(v_u_11, p13)
                    end)
                end) then
                    return true
                end
            elseif v9[v10] and v_u_3.List.some(v9[v10], function(p14)
                return v_u_11[p14] ~= nil
            end) then
                return true
            end
        end
        return false
    end,
    ["get_outfit_hash"] = function(p15)
        if not p15 then
            return "blank_mannequin"
        end
        local v16 = v_u_3.Dictionary.keys(p15.assets)
        local v17 = v_u_3.Dictionary.keys(p15.base_avatar)
        table.sort(v16)
        table.sort(v17)
        local v18 = ""
        for _, v19 in v16 do
            local v22 = v_u_3.List.map(p15.assets[v19], function(p20)
                if not v_u_4.table(p20) then
                    return tostring(p20)
                end
                local v21 = p20.asset_id
                return tostring(v21)
            end)
            table.sort(v22)
            v18 = v18 .. table.concat(v22, ",")
        end
        for _, v23 in v17 do
            v18 = v18 .. p15.base_avatar[v23]
        end
        return v18
    end,
    ["create_mannequin"] = function(p_u_24, p_u_25, _, p_u_26)
        v_u_1("DownloadClient").promise_download_copy("FurnitureMannequin", nil, {
            ["params_deduplication_hash"] = v_u_32.get_outfit_hash(p_u_24.outfit),
            ["outfit"] = p_u_24.outfit
        }):andThen(function(p27)
            if not p_u_25.Parent then
                p27:Destroy()
                return nil
            end
            local v28 = p_u_25.MannequinPlacementLocation.Size.Y * 0.5 + p27.Humanoid.HipHeight + p27.HumanoidRootPart.Size.Y * 0.5
            p27:SetPrimaryPartCFrame(p_u_25.MannequinPlacementLocation.CFrame * CFrame.new(0, v28, 0))
            p27.Name = "Mannequin"
            p27:SetAttribute("price", p_u_24.price or 0)
            p27:SetAttribute("for_sale", p_u_24.for_sale or false)
            p27:SetAttribute("outfit_name", p_u_24.outfit_name or "Outfit")
            p27:SetAttribute("outfit_version", p_u_24.outfit_version)
            local v29 = Instance.new("ObjectValue")
            v29.Name = "Owner"
            v29.Value = p_u_26:get_house_owner()
            v29.Parent = p27
            p27.Parent = p_u_25
            v_u_5:AddTag(p_u_25, "FurnitureMannequin")
            return p27
        end)
    end,
    ["create_outfit_mannequin"] = function(p30)
        return v_u_1("OutfitMannequin").new(p30:GetPivot(), p30, p30.Parent:GetAttribute("furniture_unique"), {
            ["price"] = p30:GetAttribute("price"),
            ["for_sale"] = p30:GetAttribute("for_sale"),
            ["outfit_name"] = p30:GetAttribute("outfit_name"),
            ["outfit_version"] = p30:GetAttribute("outfit_version"),
            ["owner"] = p30.Owner.Value
        })
    end,
    ["get_mannequins"] = function()
        return v_u_3.List.map(v_u_5:GetTagged("FurnitureMannequin"), function(p31)
            return p31:FindFirstChild("Mannequin")
        end)
    end
}
local function v_u_42()
    local v33 = v_u_1("UIManager")
    local v34 = v_u_32.get_mannequins()
    local v36 = v_u_3.List.map(v34, function(p35)
        return v_u_32.create_outfit_mannequin(p35)
    end)
    table.sort(v36, function(p37, p38)
        local v39 = p37.mannequin_id
        local v40 = tonumber(v39:match("%d+"))
        local v41 = p38.mannequin_id
        return v40 < tonumber(v41:match("%d+"))
    end)
    v33.apps.MannequinPurchaseApp:set_mannequin_list(v36, true)
end
local v_u_43 = v2.new()
local function v_u_44()
    v_u_43:delay("refresh_mannequins", v_u_42)
end
function v_u_32.refresh_mannequins_on_change()
    local v_u_45 = v_u_5:GetInstanceAddedSignal("FurnitureMannequin"):Connect(v_u_44)
    local v_u_46 = v_u_5:GetInstanceRemovedSignal("FurnitureMannequin"):Connect(v_u_44)
    return function()
        v_u_45:Disconnect()
        v_u_46:Disconnect()
    end
end
function v_u_32.open_purchase_app(p47)
    v_u_1("UIManager").apps.MannequinPurchaseApp:enter(p47)
end
function v_u_32.prompt_wear_or_save_outfit(p48, p49, p50)
    local v51 = v_u_6
    assert(v51:IsClient())
    local v52 = v_u_1("UIManager")
    local v53 = v_u_1("RouterClient")
    local v54 = v_u_1("AvatarClientManager")
    local v55 = v52.apps.DialogApp
    local v56 = {
        ["dialog_type"] = "LargeButtonsListDialog"
    }
    local v57 = {
        ["wear_outfit"] = {
            ["text"] = "Wear Outfit",
            ["layout_order"] = 1,
            ["weight"] = 1.71
        }
    }
    local v58 = {
        ["text"] = "Save to Roblox Avatar",
        ["icon"] = {
            ["image"] = "rbxassetid://14566542982",
            ["size"] = UDim2.new(0, 36, 0, 36)
        },
        ["layout_order"] = 2,
        ["weight"] = 1
    }
    v57.export_avatar = v58
    v57.close = {
        ["text"] = "Close",
        ["layout_order"] = 3,
        ["weight"] = 1,
        ["button_state"] = "cancel"
    }
    v56.buttons = v57
    local v59 = v55:dialog(v56)
    if v59 == "wear_outfit" then
        v53.get("AvatarAPI/WearMannequinOutfit"):InvokeServer(p48, p49, p50)
        v52.set_app_visibility("MannequinPurchaseApp", false)
        v54.submit_analytics_event("outfit_worn")
    elseif v59 == "export_avatar" then
        v53.get("AvatarAPI/ExportMannequinOutfit"):InvokeServer(p48, p49, p50)
        v52.set_app_visibility("MannequinPurchaseApp", false)
        v52.apps.ExportAvatarApp.avatar_type = "mannequin"
        v52.set_app_visibility("ExportAvatarApp", true)
    end
end
return v_u_32