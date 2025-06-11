--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.Furniture (ModuleScript)

local v_u_1 = game:GetService("Players")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v_u_2("EntryHelper")
local v4 = v_u_2("FurnitureUseHelperDB")
local v5 = v_u_2("package:Sift")
local v_u_6 = v_u_2("KindDB")
local v_u_7 = v5.Set.fromArray({ "icecream", "ice_cream_2025_cup" })
function ICECREAM_SAUCE()
    return {
        ["use_text"] = "Add Sauce",
        ["use_permissions"] = "EVERYONE",
        ["client_get_data_for_server_use"] = function(_, _, p8, _, _, _)
            return p8.Colorable.BrickColor
        end,
        ["server_use"] = function(p9, _, _, p10, _)
            if typeof(p10) == "BrickColor" then
                local v11 = v_u_2("MsgBridge")
                local v12 = v_u_2("DataM").get_store(p9):get("equip_manager"):get_equipped().food
                if v12 == nil or not v_u_7[v12.id] then
                    v11.hint(p9, {
                        ["text"] = "Grab an ice cream cone first",
                        ["overridable"] = true,
                        ["length"] = 5,
                        ["yields"] = false
                    })
                    return
                else
                    local v13
                    if v12 then
                        v13 = v12.properties.uses_left
                    else
                        v13 = v12
                    end
                    local v14
                    if v12 then
                        v14 = v12.properties.flavors
                    else
                        v14 = v12
                    end
                    if v13 then
                        if v13 > 0 then
                            if v14 then
                                v14 = #v14 > 0
                            end
                        else
                            v14 = false
                        end
                    else
                        v14 = v13
                    end
                    if v14 then
                        if v12.properties.sauce then
                            v11.hint(p9, {
                                ["text"] = "You already have a sauce!",
                                ["overridable"] = true,
                                ["length"] = 2,
                                ["yields"] = false
                            })
                        else
                            v12.properties.sauce = p10.Name
                            v12:server_render()
                        end
                    else
                        v11.hint(p9, {
                            ["text"] = "You need some ice cream first!",
                            ["overridable"] = true,
                            ["length"] = 2,
                            ["yields"] = false
                        })
                        return
                    end
                end
            else
                return
            end
        end
    }
end
function ICECREAM_SCOOP()
    return {
        ["use_text"] = "Scoop",
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function(_, _, _)
            local v15 = v_u_2("UIManager")
            local v_u_16 = v_u_2("AnimationManager")
            local function v18()
                local v17 = v_u_16.get_track("IceCreamScoop")
                if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v17):Play()
                end
            end
            local v19 = v_u_2("ClientToolManager").get_equipped_by_category("food")[1]
            if v19 == nil or not v_u_7[v19.id] then
                v15.apps.HintApp:hint({
                    ["text"] = "Grab an ice cream cone first",
                    ["overridable"] = true,
                    ["length"] = 5,
                    ["yields"] = false
                })
                return
            else
                local v20 = v19 and (v19.properties.uses_left or 1) or 1
                if v19.id == "ice_cream_2025_cup" then
                    local v21
                    if v19 then
                        v21 = v19.properties.uses_left
                    else
                        v21 = v19
                    end
                    if v19 then
                        v19 = v19.properties.flavors
                    end
                    if v21 then
                        if v21 > 0 then
                            if v19 then
                                v19 = #v19 > 0
                            end
                        else
                            v19 = false
                        end
                    else
                        v19 = v21
                    end
                    if v19 then
                        v20 = v20 + 1
                    end
                end
                if v20 == 4 then
                    v15.apps.HintApp:hint({
                        ["text"] = "Adding too many scoops might make it tip over!",
                        ["overridable"] = true,
                        ["length"] = 5,
                        ["yields"] = false
                    })
                else
                    v18()
                end
            end
        end,
        ["client_get_data_for_server_use"] = function(_, _, p22, _, _, _)
            return p22.Colorable.BrickColor
        end,
        ["server_use"] = function(p23, _, _, p24, _)
            if typeof(p24) ~= "BrickColor" then
                return
            end
            local v25 = v_u_2("DataM").get_store(p23)
            if v25 then
                v25 = v25:get("equip_manager")
            end
            if v25 == nil then
                return
            end
            local v26 = v25:get_equipped().food
            if not (v26 and v_u_7[v26.id]) then
                return
            end
            local v27 = v26.properties.uses_left or 1
            local v28 = v26 and (v26.properties.uses_left or 1) or 1
            if v26.id == "ice_cream_2025_cup" then
                local v29
                if v26 then
                    v29 = v26.properties.uses_left
                else
                    v29 = v26
                end
                local v30
                if v26 then
                    v30 = v26.properties.flavors
                else
                    v30 = v26
                end
                if v29 then
                    if v29 > 0 then
                        if v30 then
                            v30 = #v30 > 0
                        end
                    else
                        v30 = false
                    end
                else
                    v30 = v29
                end
                if v30 then
                    v28 = v28 + 1
                end
            end
            if v28 >= 4 then
                ::l28::
                return
            end
            local v31 = v26.properties.flavors or {}
            v31[v28] = p24.Name
            if v31[1] == nil then
                v31[1] = p24.Name
            end
            if v31[2] == nil then
                v31[2] = p24.Name
            end
            if v31[3] == nil then
                v31[3] = p24.Name
            end
            if v26.id == "ice_cream_2025_cup" then
                local v32
                if v26 then
                    v32 = v26.properties.uses_left
                else
                    v32 = v26
                end
                local v33
                if v26 then
                    v33 = v26.properties.flavors
                else
                    v33 = v26
                end
                if v32 then
                    if v32 > 0 then
                        if v33 then
                            v33 = #v33 > 0
                        end
                    else
                        v33 = false
                    end
                else
                    v33 = v32
                end
                if not v33 then
                    ::l49::
                    v26.properties.flavors = v31
                    v26:set_uses_left(v27)
                    v26:mark_updated()
                    v26:server_render()
                    goto l28
                end
            end
            v27 = v27 + 1
            goto l49
        end
    }
end
local function v55(p_u_34)
    local v_u_35 = v_u_6[p_u_34]
    local v_u_36 = ("ui.take_item [%*]"):format(v_u_35.name)
    local v_u_37 = ("ui.buy_label_item [%*]"):format(v_u_35.name)
    return {
        ["items_to_acquire"] = { p_u_34 },
        ["use_text"] = function(_, _, _, p38)
            if p38:get_house_owner() == v_u_1.LocalPlayer then
                return v_u_36
            else
                return v_u_37
            end
        end,
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function(_, _, _, _, _, p39)
            local v40 = p39:get_house_owner()
            if v40 ~= v_u_1.LocalPlayer then
                if not v40 then
                    local v41 = {
                        ["category"] = "food",
                        ["id"] = p_u_34,
                        ["purchase_confirmation"] = true
                    }
                    v_u_2("ShopM").buy_item(nil, v41)
                end
            end
        end,
        ["client_get_data_for_server_use"] = function(_, _, _, p42, _, _)
            local v43 = v_u_2("UIManager")
            local v44 = v_u_2("PolicyHelper")
            if p42 then
                if p42 == v_u_1.LocalPlayer then
                    return true
                else
                    local v45, v46 = v44.is_trading_prohibited(v_u_1.LocalPlayer)
                    if v45 then
                        v43.apps.DialogApp:dialog({
                            ["text"] = v46,
                            ["button"] = "Okay"
                        })
                    elseif v43.apps.DialogApp:dialog({
                        ["text"] = ("Buy a %* from %* for $%*?"):format(v_u_35.name, p42.Name, v_u_35.cost),
                        ["right"] = "Buy",
                        ["left"] = "Cancel"
                    }) == "Buy" then
                        return true
                    end
                end
            else
                return
            end
        end,
        ["server_use"] = function(p47, _, _, _, p48)
            local v49 = v_u_2("DataM").get_store(p47)
            local v50
            if v49 then
                v50 = v49:get("inventory")
            else
                v50 = v49
            end
            if v49 then
                v49 = v49:get("equip_manager")
            end
            if p48 then
                local v51
                if p47 == p48 then
                    if not (v50 and v49) then
                        return
                    end
                    if v49:get_equipped().food then
                        return
                    end
                    v51 = v50:add_item(v_u_35)
                else
                    local v52 = v_u_2("PlayerToPlayerTransaction")
                    local v53 = v_u_2("MsgBridge")
                    local v54 = v_u_2("PolicyHelper")
                    if not v52.player_can_make_transaction_with_owner(p47, p48) then
                        v53.dialog(p47, {
                            ["text"] = "The stand has too many orders right now, come back later!",
                            ["button"] = "Okay"
                        })
                        return
                    end
                    if v49 == nil or v50 == nil then
                        return
                    end
                    if v54.is_trading_prohibited_between_players(p47, p48) then
                        return
                    end
                    if not v52.pay_player(p47, p48, v_u_35.cost, "furniture_vendor", v_u_35.kind) then
                        return
                    end
                    v51 = v50:add_item(v_u_35)
                end
                if v51 then
                    v49:equip(v51)
                end
            end
        end
    }
end
local v56 = {
    ["ice_cream_2025_cherry_bowl"] = {
        ["model_name"] = "IceCream2025CherryBowl",
        ["name"] = "Cherry Topping",
        ["behavior"] = v4.ADD_TOPPING({ "icecream", "ice_cream_2025_cup" }, "cherry_topping"),
        ["image_id"] = 108843380898312,
        ["cost"] = 125
    },
    ["ice_cream_2025_chocolate_wafer"] = {
        ["model_name"] = "IceCream2025ChocolateWafer",
        ["name"] = "Chocolate Wafer Topping",
        ["behavior"] = v4.ADD_TOPPING({ "icecream", "ice_cream_2025_cup" }, "chocolate_wafer"),
        ["image_id"] = 74915748151324,
        ["cost"] = 125
    },
    ["ice_cream_2025_scoop"] = {
        ["model_name"] = "IceCream2025Scoop",
        ["name"] = "Ice Cream Scoop Bowl",
        ["behavior"] = ICECREAM_SCOOP(),
        ["image_id"] = 80999471184670,
        ["cost"] = 225
    },
    ["ice_cream_2025_sauce"] = {
        ["model_name"] = "IceCream2025Sauce",
        ["name"] = "Ice Cream Sauce",
        ["behavior"] = ICECREAM_SAUCE(),
        ["image_id"] = 137441920576715,
        ["cost"] = 200
    },
    ["ice_cream_2025_cones"] = {
        ["model_name"] = "IceCream2025Cones",
        ["name"] = "Cone Vender",
        ["behavior"] = v55("icecream"),
        ["image_id"] = 84820486216033,
        ["cost"] = 600
    },
    ["ice_cream_2025_cups"] = {
        ["model_name"] = "IceCream2025Cups",
        ["name"] = "Cup Vender",
        ["behavior"] = v55("ice_cream_2025_cup"),
        ["image_id"] = 99234254795088,
        ["cost"] = 600
    },
    ["ice_cream_2025_popsicle_water_bowl"] = {
        ["name"] = "Popsicle Water Bowl",
        ["cost"] = 143,
        ["model_name"] = "IceCream2025PopsicleWaterBowl",
        ["image_id"] = 87455579827337
    },
    ["ice_cream_2025_banana_split_food_bowl"] = {
        ["name"] = "Banana Split Food Bowl",
        ["cost"] = 143,
        ["model_name"] = "IceCream2025BananaSplitFoodBowl",
        ["image_id"] = 92891098368917
    },
    ["ice_cream_2025_sandwich_pet_bed"] = {
        ["name"] = "Ice Cream Sandwich Pet Bed",
        ["cost"] = 159,
        ["model_name"] = "IceCream2025SandwichPetBed",
        ["image_id"] = 137269085062344
    },
    ["ice_cream_2025_popsicle_crib"] = {
        ["name"] = "Popsicle Crib",
        ["cost"] = 197,
        ["model_name"] = "IceCream2025PopsicleCrib",
        ["image_id"] = 83768574757863
    },
    ["ice_cream_2025_swirl_bed"] = {
        ["name"] = "Ice Cream Swirl Bed",
        ["cost"] = 248,
        ["model_name"] = "IceCream2025SwirlBed",
        ["image_id"] = 115032684544435
    },
    ["ice_cream_2025_shower"] = {
        ["name"] = "Ice Cream Shower",
        ["cost"] = 191,
        ["model_name"] = "IceCream2025Shower",
        ["image_id"] = 109919946312218
    },
    ["ice_cream_2025_sandwich_fridge"] = {
        ["name"] = "Ice Cream Sandwich Fridge",
        ["cost"] = 94,
        ["model_name"] = "IceCream2025SandwichFridge",
        ["image_id"] = 98504281210235
    },
    ["ice_cream_2025_melted_toilet"] = {
        ["name"] = "Melted Ice Cream Toilet",
        ["cost"] = 58,
        ["model_name"] = "IceCream2025MeltedToilet",
        ["image_id"] = 121614274494748
    },
    ["ice_cream_2025_shop_table"] = {
        ["name"] = "Ice Cream Shop Table",
        ["cost"] = 26,
        ["model_name"] = "IceCream2025ShopTable",
        ["image_id"] = 82512573751049
    },
    ["ice_cream_2025_shop_chair"] = {
        ["name"] = "Ice Cream Shop Chair",
        ["cost"] = 28,
        ["model_name"] = "IceCream2025ShopChair",
        ["image_id"] = 72627953090249
    },
    ["ice_cream_2025_lamp"] = {
        ["name"] = "Ice Cream Lamp",
        ["cost"] = 43,
        ["model_name"] = "IceCream2025Lamp",
        ["image_id"] = 126427620268725,
        ["behavior"] = v4.LIGHT("IceCream2025Lamp")
    }
}
local v57 = {
    ["ice_cream_2025_legacy_sauce"] = {
        ["model_name"] = "IceCream2025LegacySauce",
        ["name"] = "Legacy Sauce",
        ["behavior"] = ICECREAM_SAUCE()
    },
    ["ice_cream_refresh_2023_stool"] = {
        ["model_name"] = "IceCreamRefresh2023Stool",
        ["name"] = "Ice Cream Stool"
    }
}
for _, v58 in v56 do
    v58.tags = { "IceCreamHouse2025" }
end
return v3.furniture(v5.Dictionary.merge(v56, v57))