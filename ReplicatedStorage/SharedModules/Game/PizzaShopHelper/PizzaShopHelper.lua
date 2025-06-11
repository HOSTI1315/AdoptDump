--// ReplicatedStorage.SharedModules.Game.PizzaShopHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("RoleplayDB")
local v_u_3 = v_u_1("FamilyHelper")
local v_u_4 = game:GetService("RunService")
local v_u_5 = v_u_4:IsStudio() and true
local v_u_6 = {}
local v7 = {
    ["Cheese"] = {
        ["Cheese"] = true,
        ["Sauce"] = true
    },
    ["Pepperoni"] = {
        ["Sauce"] = true,
        ["Cheese"] = true,
        ["Pepperoni"] = true
    },
    ["Veggie"] = {
        ["Sauce"] = true,
        ["Cheese"] = true,
        ["Mushroom"] = true
    },
    ["Hawaiian"] = {
        ["Sauce"] = true,
        ["Cheese"] = true,
        ["Ham"] = true,
        ["Pineapple"] = true
    }
}
v_u_6.recipes_by_pizza_type = v7
v_u_6.valid_toppings = {
    ["Sauce"] = true,
    ["Cheese"] = true,
    ["Pepperoni"] = true,
    ["Mushroom"] = true,
    ["Ham"] = true,
    ["Pineapple"] = true
}
v_u_6.ordered_toppings = {
    "Sauce",
    "Cheese",
    "Pepperoni",
    "Mushroom",
    "Ham",
    "Pineapple"
}
v_u_6.valid_ingredients = {
    ["Tomato"] = true,
    ["Pineapple"] = true,
    ["Pepperoni"] = true,
    ["Mushroom"] = true,
    ["Ham"] = true,
    ["Cheese"] = true
}
v_u_6.pizza_images_by_type = {
    ["Cheese"] = "rbxassetid://10695534924",
    ["Hawaiian"] = "rbxassetid://10695534765",
    ["Pepperoni"] = "rbxassetid://10695534624",
    ["Veggie"] = "rbxassetid://10795082658"
}
v_u_6.ingredient_images_by_name = {
    ["Tomato"] = "rbxassetid://10616958559",
    ["Pineapple"] = "rbxassetid://10616958673",
    ["Pepperoni"] = "rbxassetid://10779417109",
    ["Mushroom"] = "rbxassetid://10616966968",
    ["Ham"] = "rbxassetid://10616967201",
    ["Cheese"] = "rbxassetid://10616967385"
}
v_u_6.pizza_pay_attribution = {
    ["grab_dough"] = 1,
    ["roll_dough"] = 2,
    ["top_pizza"] = 3,
    ["bake_pizza"] = 2,
    ["deliver_pizza"] = 2
}
function v_u_6.works_here(p8)
    local v9
    if v_u_4:IsClient() then
        v9 = v_u_1("ClientData").get("roleplay_role")
        if v9 then
            v9 = v9.building_id
        end
    else
        v9 = v_u_1("RoleplayRolesManager").get_roleplay_building_id(p8)
    end
    return v9 == "pizza_shop"
end
function v_u_6.give_pizza_item(p10, p11)
    if v_u_4:IsClient() then
        error("Cannot call give_pizza_item from the client.")
    end
    local v12 = v_u_1("InventoryDB")
    local v13 = v_u_1("DataM")
    local v14 = v12.food.pizza_shop_pizza
    local v15 = v13.get_store(p10)
    local v16
    if v15 then
        v16 = v15:get("inventory")
    else
        v16 = v15
    end
    if v15 then
        v15 = v15:get("equip_manager")
    end
    if v16 and v15 then
        local v17 = v15:get_equipped().roleplay
        if v17 then
            if v17.kind == "pizza_shop_empty_plate" then
                p11.plated = true
                v17:destroy()
            elseif v17.kind == "pizza_shop_empty_box" then
                p11.boxed = true
                v17:destroy()
            end
        end
        v15:equip((v16:add_item(v14, {
            ["pizza"] = p11
        })))
    end
end
function v_u_6.get_any_pizza_item(...)
    local v18 = v_u_6.get_equipped_pizza_item(...)
    if v18 then
        return v18
    elseif v_u_4:IsClient() then
        return v_u_6.get_item_client("food", "pizza_shop_pizza")
    else
        return v_u_6.get_item_server(..., "food", "pizza_shop_pizza")
    end
end
function v_u_6.get_equipped_item_client(p19, p20)
    local v21 = v_u_1("ClientData")
    local v22 = v21.get("equip_manager")[p19][1]
    if not v22 then
        return nil
    end
    if v22.kind ~= p20 then
        return nil
    end
    for _, v23 in v21.get("inventory")[p19] do
        if v23.unique == v22.unique then
            return v23
        end
    end
    return nil
end
function v_u_6.get_equipped_item_server(p24, p25, p26)
    local v27 = v_u_1("DataM").get_store(p24)
    if v27 then
        v27 = v27:get("equip_manager")
    end
    if v27 then
        local v28 = v27:get_equipped()[p25]
        if v28 and v28.kind == p26 then
            return v28
        else
            return nil
        end
    else
        return nil
    end
end
function v_u_6.get_equipped_pizza_item(p29)
    if v_u_4:IsClient() then
        return v_u_6.get_equipped_item_client("food", "pizza_shop_pizza")
    else
        local v30 = v_u_6.get_equipped_item_server(p29, "food", "pizza_shop_pizza")
        if v30 and v30.properties.pizza then
            return v30
        else
            return nil
        end
    end
end
function v_u_6.get_item_client(p31, p32)
    local v33 = v_u_1("ClientData").get("inventory")
    if v33 then
        v33 = v33[p31]
    end
    if not v33 then
        return nil
    end
    for _, v34 in pairs(v33) do
        if v34.kind == p32 then
            return v34
        end
    end
    return nil
end
function v_u_6.get_item_server(p35, p36, p37)
    local v38 = v_u_1("InventoryDB")
    local v39 = v_u_1("DataM")
    local v40 = v38[p36]
    if v40 then
        v40 = v40[p37]
    end
    if v40 then
        local v41 = v39.get_store(p35)
        if v41 then
            v41 = v41:get("inventory")
        end
        if v41 then
            local v42 = v41:get_items_with_id(v40.id)
            if #v42 == 0 then
                return nil
            else
                return v42[1]
            end
        else
            return nil
        end
    else
        return nil
    end
end
function v_u_6.get_item(...)
    if v_u_4:IsClient() then
        return v_u_6.get_item_client(...)
    else
        return v_u_6.get_item_server(...)
    end
end
function v_u_6.get_equipped_ingredient_item(...)
    for v43 in v_u_6.valid_ingredients do
        local v44 = "pizza_shop_" .. string.lower(v43)
        local v45
        if v_u_4:IsClient() then
            v45 = v_u_6.get_equipped_item_client("food", v44)
        else
            v45 = v_u_6.get_equipped_item_server(..., "food", v44)
        end
        if v45 then
            return v45
        end
    end
    return nil
end
function v_u_6.get_any_ingredient_item(...)
    for v46, _ in v_u_6.valid_ingredients do
        local v47 = string.lower(v46)
        local v48
        if v_u_4:IsClient() then
            v48 = v_u_6.get_item("roleplay", "pizza_shop_" .. v47)
        else
            v48 = v_u_6.get_item(..., "roleplay", "pizza_shop_" .. v47)
        end
        if v48 then
            return v48
        end
    end
    return nil
end
function v_u_6.is_valid_ingredient(p49)
    return v_u_6.valid_ingredients[p49]
end
function v_u_6.give_ingredient_item(p50, p51)
    if v_u_4:IsClient() then
        error("Cannot call give_ingredient_item from the client.")
    end
    local v52 = v_u_1("InventoryDB")
    local v53 = v_u_1("DataM")
    if v_u_6.is_valid_ingredient(p51) then
        local v54 = v_u_6.get_any_ingredient_item(p50)
        if v54 then
            v54:destroy()
        end
        local v55 = "pizza_shop_" .. string.lower(p51)
        local v56 = v52.food[v55]
        if v56 then
            local v57 = v53.get_store(p50)
            local v58 = v57:get("inventory")
            v57:get("equip_manager"):equip((v58:add_item(v56)))
        end
    else
        return
    end
end
function v_u_6.get_topping_from_ingredient(p59)
    return p59 == "Tomato" and "Sauce" or p59
end
function v_u_6.get_ingredient_from_topping(p60)
    return p60 == "Sauce" and "Tomato" or p60
end
function v_u_6.get_item_by_order_of_preference(p61, p62)
    if v_u_4:IsServer() then
        assert(p61, "Must pass in player when calling on server")
    end
    for _, v63 in p62 do
        local v64
        if v_u_4:IsServer() then
            v64 = v_u_6.get_equipped_item_server(p61, v63.category, v63.kind)
        else
            v64 = v_u_6.get_equipped_item_client(v63.category, v63.kind)
        end
        if v64 then
            return v64
        end
    end
    for _, v65 in p62 do
        local v66
        if v_u_4:IsServer() then
            v66 = v_u_6.get_item_server(p61, v65.category, v65.kind)
        else
            v66 = v_u_6.get_item_client(v65.category, v65.kind)
        end
        if v66 then
            return v66
        end
    end
end
function v_u_6.get_sink_preferred_item_and_use_text(p67)
    local v68 = v_u_6.get_item_by_order_of_preference(p67, {
        {
            ["category"] = "roleplay",
            ["kind"] = "pizza_shop_dirty_plates"
        },
        {
            ["category"] = "food",
            ["kind"] = "soda_fountain_soda"
        },
        {
            ["category"] = "food",
            ["kind"] = "soda_fountain_water"
        }
    })
    if v68 then
        if v68.kind == "pizza_shop_dirty_plates" then
            return v68, "Wash Plates"
        else
            return v68, "Wash Glass"
        end
    else
        return
    end
end
function v_u_6.get_oven_cooking_time()
    return v_u_5 and 1 or 20
end
function v_u_6.get_rolling_time()
    return v_u_5 and 1 or 6
end
function v_u_6.mark_pizza_ownership(p69, p70)
    p69.owner_data = {
        ["user_id"] = p70.UserId,
        ["last_marked"] = os.clock()
    }
end
function v_u_6.get_can_use_pizza_async(p71, p72)
    if not p71.owner_data then
        return true
    end
    local v73 = game.Players:GetPlayerByUserId(p71.owner_data.user_id)
    if not v73 then
        return true
    end
    if v73 == p72 then
        return true
    end
    for _, v74 in p71.attribution do
        if v74 == p72.UserId then
            return true
        end
    end
    return v_u_3.are_friends_or_family(v73, p72) and true or os.clock() - p71.owner_data.last_marked > 5
end
function v_u_6.warn_pizza_ownership(p75, p76)
    v_u_1("MsgBridge").hint(p75, {
        ["text"] = p76 or "This pizza belongs to someone else!",
        ["length"] = 4,
        ["overridable"] = true,
        ["yields"] = false
    })
end
function v_u_6.deliver_pizza_for_pay(p77, p78)
    local v79 = v_u_1("RoleplayRolesManager")
    local v80 = v_u_1("JobPay")
    local v81 = v_u_1("PizzaShop")
    v_u_1("MsgBridge")
    if p78.delivered then
        return
    elseif p78.state == "Cooked" then
        local v82 = v81.deliver_pizza(p78)
        local v83 = false
        for v84, _ in v_u_6.recipes_by_pizza_type do
            if v81.is_pizza_of_type(p78, v84) then
                v83 = true
            end
        end
        if v82 then
            p78.delivery_status = "perfect"
        elseif v83 then
            p78.delivery_status = "okay"
        else
            p78.delivery_status = "fail"
        end
        if v83 then
            local v85 = {}
            for v86, v87 in p78.attribution do
                local v88 = game.Players:GetPlayerByUserId(v87)
                if v88 then
                    local v89 = v_u_6.pizza_pay_attribution[v86]
                    if not v82 then
                        local v90 = v89 / 2
                        v89 = math.ceil(v90)
                    end
                    v85[v88] = (v85[v88] or 0) + v89
                end
            end
            for v91, v92 in v85 do
                if v79.does_player_have_role(p77, "pizza_chef") then
                    v80.claim_pay_server(v91, v92, {
                        ["show_sprouting_money_on_all_clients"] = true,
                        ["analytics_pay_source"] = "per_pizza_completed_task_pay"
                    })
                end
            end
        end
    end
end
function v_u_6.init()
    local v93 = 0
    for _, v94 in v_u_6.pizza_pay_attribution do
        v93 = v93 + v94
    end
    local v95 = v93 == v_u_2.pizza_shop.roles.pizza_chef.advertised_pay_per_task
    assert(v95, "Pizza pay breakdown does not sum up to advertised pay")
    if v_u_4:IsClient() then
        local v96 = v_u_1("RouterClient")
        local v_u_97 = v_u_1("FurnitureRegistry")
        v96.get("RoleplayAPI/NavigateToPizzaShopConveyor").OnClientEvent:Connect(function()
            local v98 = v_u_1("UIManager")
            local v99 = v_u_97.get_all_furniture_of_id("pizza_shop_conveyor_belt")[1]
            if v99 then
                v98.apps.GuideArrowApp:navigate("PizzaShop", v99.UseBlocks.Deliver.Position, function(p100, p101)
                    return (p100 - p101).magnitude < 11
                end)
            end
        end)
    end
end
return v_u_6