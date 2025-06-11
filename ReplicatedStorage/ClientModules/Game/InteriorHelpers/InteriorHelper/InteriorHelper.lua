--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.InteriorHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("FurnitureBlockerHelper")
local v_u_3 = v1("InteractionsEngine")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("DeveloperProductDB")
local v_u_6 = v1("GamepassDB")
local v_u_7 = v1("ShopM")
local v_u_8 = v1("AccessoryMannequin")
local v_u_9 = v1("UIManager")
local v_u_10 = v1("package:Sift")
local v11 = v1("package:t")
local v_u_12 = {}
local v13 = {
    ["offset"] = v11.optional(v11.Vector3),
    ["horizontal_dist"] = v11.optional(v11.number)
}
local v14 = {
    ["offset"] = v11.optional(v11.Vector3),
    ["horizontal_dist"] = v11.optional(v11.number),
    ["purchase_confirmation"] = v11.optional(v11.boolean),
    ["purchase_confirmation_message"] = v11.optional(v11.string),
    ["text"] = v11.optional(v11.string),
    ["starter_color"] = v11.optional(v11.Color3)
}
local v_u_15 = v11.interface(v13)
local v_u_16 = v11.interface(v14)
function v_u_12.register_purchase_block_interaction(p17, p18, p19)
    local v20 = p19 or {}
    local v21 = v20.additional_params
    local v_u_22 = v20.pre_purchase
    local v23 = p17:IsA("BasePart")
    assert(v23, "Must be a BasePart.")
    local v24, v_u_25 = unpack(p18:split(":"))
    local v26 = (v_u_4[v24] ~= nil or v24 == "developer_product") and true or v24 == "gamepass"
    assert(v26, ("Invalid category for \'%s\'"):format(p18))
    if v24 ~= "gamepass" and v24 ~= "developer_product" then
        local v27 = p17:GetAttributes()
        local v28 = v_u_16
        assert(v28(v27))
        local v29 = v_u_4[v24][v_u_25]
        assert(v29, ("No inventory entry found for \'%s\'"):format(p18))
        local v30 = v_u_10.Dictionary.merge
        local v31 = {
            ["category"] = v29.category,
            ["id"] = v29.kind,
            ["part"] = p17
        }
        local v32 = p17:GetAttribute("StarterColor")
        if not v32 then
            if v24 == "transport" and v29.colorable then
                v32 = p17.Color
            else
                v32 = nil
            end
        end
        v31.starter_color = v32
        local v33 = v30(v31, v27, v21)
        return v_u_7.register_interaction(v33, {
            ["pre_purchase"] = v_u_22
        })
    end
    local v34 = p17:GetAttributes()
    local v35 = v_u_15
    assert(v35(v34))
    local v36 = v24 == "gamepass" and v_u_6[v_u_25] or v_u_5[v_u_25]
    assert(v36, ("No \'%s\' entry found for \'%s\'"):format(v24, p18))
    local v37 = v_u_10.Dictionary.merge
    local v39 = {
        ["text"] = ("ui.buy_label_item [%s]"):format(v36.name),
        ["tag"] = p18,
        ["part"] = p17,
        ["on_selected"] = function()
            if v_u_22 then
                v_u_22()
            end
            local v38 = {
                ["product_id"] = v_u_25,
                ["dialog_type"] = "RobuxProductDialog"
            }
            v_u_9.apps.DialogApp:dialog(v38)
        end
    }
    local v40 = p17:GetAttribute("StarterColor")
    if not v40 then
        if v24 == "transport" and v36.colorable then
            v40 = p17.Color
        else
            v40 = nil
        end
    end
    v39.starter_color = v40
    local v41 = v_u_3:register((v37(v39, v34, v21)))
    v_u_2.protect_critical_interaction(v41)
    return v41
end
function v_u_12.render_accessory_mannequins(p42, p43, p44, p45)
    local v_u_46 = v_u_9.apps.MannequinPurchaseApp
    local v47 = p45 or {}
    local v_u_48 = {}
    for v49, v50 in p42 do
        v_u_48[v49] = v_u_8.new(v50, p44, "non_robux_accessory", v49, v47[v49])
        v_u_48[v49]:update_content({
            ["accessory_id"] = p43[v49]
        })
    end
    v_u_46:set_mannequin_list(v_u_48)
    return function()
        for _, v51 in v_u_48 do
            v51:destroy()
        end
        v_u_9.set_app_visibility("MannequinPurchaseApp", false)
        v_u_46:set_mannequin_list({})
    end
end
function v_u_12.render_accessory_mannequins_from_folder(p52, p53, p54)
    local v_u_55 = Instance.new("Folder")
    v_u_55.Name = "Mannequins"
    v_u_55.Parent = p52
    local v57 = v_u_10.List.filter(p53:GetChildren(), function(p56)
        return p56.Name:find("^pet_accessories:") ~= nil
    end)
    table.sort(v57, function(p58, p59)
        return p58:GetAttribute("SortOrder") < p59:GetAttribute("SortOrder")
    end)
    local v60 = {}
    local v61 = {}
    local v62 = {}
    for _, v63 in v57 do
        for _, v64 in v63:GetChildren() do
            if v64.Name == "Spawn" then
                v64.Transparency = 1
            else
                v64:Destroy()
            end
        end
        local v65 = v63.Name:gsub("^pet_accessories:", "")
        local v66 = v63.Spawn.CFrame - Vector3.new(0, 1, 0) * (v63.Spawn.Size.Y / 2)
        table.insert(v60, v66)
        table.insert(v61, v65)
        table.insert(v62, p54)
    end
    local v_u_67 = v_u_12.render_accessory_mannequins(v60, v61, v_u_55, v62)
    return function()
        v_u_67()
        v_u_55:Destroy()
    end
end
return v_u_12