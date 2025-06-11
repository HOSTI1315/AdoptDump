--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.BackpackCategoryButtons (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("BucksAgingMultiplierHelper")
local v_u_3 = v_u_1("ClientToolManager")
local v_u_4 = v_u_1("new:AilmentsClient")
local v_u_5 = v_u_1("new:TutorialHelper")
local v_u_6 = v_u_1("new:QuickCache")
local v_u_7 = v_u_1("EquippedPets")
local v_u_8 = v_u_1("InventoryDB")
local v_u_9 = v_u_1("CloudValues")
local v_u_10 = v_u_1("ClientData")
local v_u_11 = v_u_1("RarityDB")
local v_u_12 = v_u_1("BackpackFavoriteTracker")
local v_u_13 = v_u_1("BackpackItemStackHashHelper")
local v_u_14 = game.Players.LocalPlayer
local v_u_15 = {
    ["pets"] = { "pets" },
    ["food"] = { "food" },
    ["toys"] = { "toys", "roleplay" },
    ["gifts"] = { "gifts" },
    ["transport"] = { "transport" },
    ["strollers"] = { "strollers" },
    ["stickers"] = { "stickers", "gifts" },
    ["pet_accessories"] = { "pet_accessories" },
    ["wings"] = { "pet_accessories" },
    ["favorites"] = {
        "pets",
        "strollers",
        "food",
        "transport",
        "toys",
        "gifts",
        "pet_accessories",
        "roleplay",
        "stickers"
    }
}
local v_u_16 = {
    ["pets"] = {
        ["text"] = "Teleport to the Nursery to adopt pets?",
        ["tooltip_description"] = "Adopt pets at the Nursery",
        ["interior"] = "Nursery"
    },
    ["pet_accessories"] = {
        ["text"] = "Teleport to the Accessory Shop to see pet wear?",
        ["tooltip_description"] = "Buy accessories in the Accessory Shop",
        ["interior"] = "HatShop"
    },
    ["strollers"] = {
        ["text"] = "Teleport to The Baby Shop to see strollers?",
        ["tooltip_description"] = "Buy strollers at the Baby Shop",
        ["interior"] = "BabyShop"
    },
    ["transport"] = {
        ["text"] = "Teleport to The Vehicle Dealership to see vehicles?",
        ["tooltip_description"] = "Buy vehicles in the Vehicle Dealership",
        ["interior"] = "AutoShop"
    }
}
local v17 = {
    ["text"] = "Teleport to The Gifts Display?",
    ["tooltip_description"] = "Buy gifts at the Gift Display",
    ["interior"] = "MainMap",
    ["extra_tele_data"] = {
        ["spawn_cframe"] = CFrame.new(-275.909149, 25.8120842, -1548.14575, -0.979821742, 0.0000227206929, 0.199868903, -3.86257943e-6, 1, -0.000132613481, -0.199868903, -0.000130709668, -0.979821742)
    }
}
v_u_16.gifts = v17
v_u_16.toys = {
    ["text"] = "Teleport to The Toy Shop?",
    ["tooltip_description"] = "Buy toys at the Toy Shop",
    ["interior"] = "ToyShop"
}
v_u_16.food = {
    ["text"] = "Teleport to The Supermarket?",
    ["tooltip_description"] = "Buy food at the Supermarket",
    ["interior"] = "Supermarket"
}
local v18 = {}
local v_u_19 = {}
local v_u_36 = {
    ["picking_priority"] = function(p20, p21)
        if p20.picking_priority == p21.picking_priority then
            return nil
        else
            return p20.picking_priority > p21.picking_priority
        end
    end,
    ["equipped"] = function(p22, p23)
        if p22.equipped == p23.equipped then
            return nil
        else
            return p22.equipped
        end
    end,
    ["favorited"] = function(p24, p25)
        if p24.favorited == p25.favorited then
            return nil
        else
            return p24.favorited
        end
    end,
    ["newness"] = function(p26, p27)
        if p26.newness == p27.newness then
            return nil
        else
            return p26.newness > p27.newness
        end
    end,
    ["rarity"] = function(p28, p29)
        if p28.rarity == p29.rarity then
            return nil
        else
            return p28.rarity > p29.rarity
        end
    end,
    ["name"] = function(p30, p31)
        if p30.name == p31.name then
            return nil
        else
            return p30.name < p31.name
        end
    end,
    ["age"] = function(p32, p33)
        if p32.mega_neon == p33.mega_neon then
            if p32.neon == p33.neon then
                if p32.age == p33.age then
                    return nil
                else
                    return p32.age > p33.age
                end
            else
                return p32.neon
            end
        else
            return p32.mega_neon
        end
    end,
    ["multiplier"] = function(p34, p35)
        if p34.multiplier == p35.multiplier then
            return nil
        else
            return p34.multiplier > p35.multiplier
        end
    end
}
local function v_u_46(p37, p38)
    local v39 = v_u_1("UIManager").apps.BackpackApp
    local v40 = v_u_8[p37.item_data.category][p37.item_data.kind]
    local v41 = v39.picking_priorities
    if v41 then
        v41 = v39.picking_priorities[p37.item_data.kind]
    end
    local v42 = v_u_11[v40.rarity or "common"].value
    local v45 = v_u_2.get_multiplier_for_pet(v_u_14, {
        ["item"] = p37.item_data,
        ["char_wrapper"] = v_u_6("equipped_char_wrappers_map", function()
            local v43 = {}
            for _, v44 in v_u_7.get_my_equipped_char_wrappers() do
                v43[v44.pet_unique] = v44
            end
            return v43
        end)[p37.item_data.unique] or false
    })
    p37.sort_transformed_cached = {
        ["picking_priority"] = v41 or 0,
        ["favorited"] = v_u_12.get_cached_favorites()[p37.item_data.unique] and true or false,
        ["equipped"] = p38[p37.item_data.unique] and true or false,
        ["newness"] = p37.newness,
        ["rarity"] = v42,
        ["name"] = v40.name,
        ["neon"] = p37.item_data.properties.neon and true or false,
        ["mega_neon"] = p37.item_data.properties.mega_neon and true or false,
        ["age"] = (p37.item_data.properties.age or 0) + (p37.item_data.properties.friendship_level or 0),
        ["multiplier"] = v45.bucks + v45.aging
    }
end
local v_u_47 = {
    "picking_priority",
    "equipped",
    "multiplier",
    "newness",
    "rarity",
    "name",
    "age",
    "favorited"
}
function v_u_19.default(p48, p49, p50)
    if not p48.sort_transformed_cached then
        v_u_46(p48, p50)
    end
    if not p49.sort_transformed_cached then
        v_u_46(p49, p50)
    end
    for _, v51 in v_u_47 do
        local v52 = v_u_36[v51](p48.sort_transformed_cached, p49.sort_transformed_cached)
        if v52 ~= nil then
            return v52
        end
    end
    return p48.item_data.unique < p49.item_data.unique
end
local v_u_53 = {
    "picking_priority",
    "equipped",
    "name",
    "age",
    "rarity",
    "multiplier",
    "newness",
    "favorited"
}
function v_u_19.alphabetical(p54, p55, p56)
    if not p54.sort_transformed_cached then
        v_u_46(p54, p56)
    end
    if not p55.sort_transformed_cached then
        v_u_46(p55, p56)
    end
    for _, v57 in v_u_53 do
        local v58 = v_u_36[v57](p54.sort_transformed_cached, p55.sort_transformed_cached)
        if v58 ~= nil then
            return v58
        end
    end
    return p54.item_data.unique < p55.item_data.unique
end
local v_u_59 = {
    "picking_priority",
    "equipped",
    "rarity",
    "multiplier",
    "age",
    "name",
    "newness",
    "favorited"
}
function v_u_19.rarity(p60, p61, p62)
    if not p60.sort_transformed_cached then
        v_u_46(p60, p62)
    end
    if not p61.sort_transformed_cached then
        v_u_46(p61, p62)
    end
    for _, v63 in v_u_59 do
        local v64 = v_u_36[v63](p60.sort_transformed_cached, p61.sort_transformed_cached)
        if v64 ~= nil then
            return v64
        end
    end
    return p60.item_data.unique < p61.item_data.unique
end
local v_u_65 = {
    "picking_priority",
    "equipped",
    "age",
    "multiplier",
    "rarity",
    "name",
    "newness",
    "favorited"
}
function v_u_19.age(p66, p67, p68)
    if not p66.sort_transformed_cached then
        v_u_46(p66, p68)
    end
    if not p67.sort_transformed_cached then
        v_u_46(p67, p68)
    end
    for _, v69 in v_u_65 do
        local v70 = v_u_36[v69](p66.sort_transformed_cached, p67.sort_transformed_cached)
        if v70 ~= nil then
            return v70
        end
    end
    return p66.item_data.unique < p67.item_data.unique
end
local v_u_71 = {
    "picking_priority",
    "equipped",
    "favorited",
    "multiplier",
    "age",
    "rarity",
    "name",
    "newness"
}
function v_u_19.favorites(p72, p73, p74)
    if not p72.sort_transformed_cached then
        v_u_46(p72, p74)
    end
    if not p73.sort_transformed_cached then
        v_u_46(p73, p74)
    end
    for _, v75 in v_u_71 do
        local v76 = v_u_36[v75](p72.sort_transformed_cached, p73.sort_transformed_cached)
        if v76 ~= nil then
            return v76
        end
    end
    return p72.item_data.unique < p73.item_data.unique
end
local function v_u_82(p77)
    local v78 = v_u_10.get("inventory") or {}
    local v79 = {}
    for _, v80 in v_u_15[p77] do
        for _, v81 in v78[v80] or {} do
            table.insert(v79, v81)
        end
    end
    return v79
end
local function v_u_89(_)
    local v83 = v_u_10.get("inventory") or {}
    local v84 = {}
    for v85, v86 in v_u_12.get_cached_favorites() do
        if v86 then
            for _, v87 in v83 do
                local v88 = v87[v85]
                if v88 then
                    table.insert(v84, v88)
                    break
                end
            end
        end
    end
    return v84
end
local function v_u_136(p_u_90, p91, p_u_92, p_u_93, p_u_94)
    local v_u_95 = {}
    table.insert(v_u_95, "BackpackCategoryButtons.get_buttons")
    debug.profilebegin("BackpackCategoryButtons.get_buttons")
    local v_u_96 = v_u_9:getValue("optimization", "backpack_work_max_ms_per_frame")
    local v_u_97 = v_u_9:getValue("optimization", "backpack_work_min_fraction_per_frame")
    local v_u_98 = os.clock()
    local v_u_99 = 0
    local function v102(p100)
        if p_u_94 then
            if p100 then
                v_u_99 = v_u_99 + p100
            end
            if os.clock() - v_u_98 >= v_u_96 / 1000 and v_u_97 <= v_u_99 then
                for _, _ in v_u_95 do
                    debug.profileend()
                end
                task.wait()
                for _, v101 in v_u_95 do
                    debug.profilebegin(v101)
                end
                v_u_99 = 0
                v_u_98 = os.clock()
            end
        end
    end
    local v_u_103 = v_u_1("UIManager").apps.BackpackApp
    local v_u_104 = {}
    local v_u_105 = {}
    local v_u_106 = 0
    local v_u_107 = 0
    local function v123(p108)
        local v109 = v_u_8[p108.category][p108.kind]
        if v_u_103:check_if_item_hidden(p108) then
            return
        end
        local v110 = v_u_13.get_item_data_hash(p108)
        local v111 = v_u_105[v110]
        if v111 then
            v_u_106 = v_u_106 + 1
        else
            if p_u_93 and not p_u_93(p108, v109) then
                return
            end
            v_u_106 = v_u_106 + 1
            local v112 = v_u_1("UIManager").apps.BackpackApp
            local v113
            if v_u_5.is_hidden_by_tutorial(p108) then
                v113 = false
            else
                v113 = not v112:is_filtered_out(p108)
            end
            if not v113 then
                return
            end
        end
        local v114 = v_u_3.is_equipped(p108)
        if not v111 then
            local v115 = {
                ["type"] = "item",
                ["unique"] = p108.unique,
                ["category"] = p108.category,
                ["count"] = 1,
                ["hash"] = v110,
                ["newness"] = p108.newness_order or 0,
                ["is_equipped"] = v114,
                ["item_data"] = p108
            }
            local v116 = v_u_104
            table.insert(v116, v115)
            v_u_105[v110] = v115
            goto l40
        end
        if v114 then
            v111.is_equipped = true
            v111.item_data = p108
        else
            if not v111.is_equipped and v111.category == "pets" then
                local v117
                if p108.category == "pets" then
                    v117 = 0
                    for _, _ in v_u_4.get_ailments_for_pet_item_serialized(p108.unique) do
                        v117 = v117 + 1
                    end
                else
                    v117 = nil
                end
                local v118 = v111.item_data
                local v119
                if v118.category == "pets" then
                    v119 = 0
                    for _, _ in v_u_4.get_ailments_for_pet_item_serialized(v118.unique) do
                        v119 = v119 + 1
                    end
                else
                    v119 = nil
                end
                if v119 < v117 then
                    v111.item_data = p108
                    goto l19
                end
            end
            if v111.category == "stickers" and v111.item_data.properties.last_edit then
                local v120 = p108.properties.last_edit
                if not v120 or v111.item_data.properties.last_edit < v120 then
                    v111.item_data = p108
                end
            end
        end
        ::l19::
        v111.count = v111.count + 1
        local v121 = v111.newness
        local v122 = p108.newness_order or 0
        v111.newness = math.max(v121, v122)
        ::l40::
        v_u_107 = v_u_107 + 1
    end
    local v124 = 1 / (#p91 * 2)
    table.insert(v_u_95, "process_item_data")
    debug.profilebegin("process_item_data")
    local v125 = v_u_107
    local v126 = v_u_106
    for _, v127 in p91 do
        v123(v127)
        v102(v124)
    end
    table.remove(v_u_95)
    debug.profileend()
    local v_u_128 = v_u_19[v_u_103.filter:get_sort_type()]
    table.insert(v_u_95, "sort_buttons_precache")
    debug.profilebegin("sort_buttons_precache")
    for _, v129 in v_u_104 do
        if not v129.sort_transformed_cached then
            v_u_46(v129, p_u_92)
        end
        v102(v124)
    end
    table.remove(v_u_95)
    debug.profileend()
    table.insert(v_u_95, "sort_buttons")
    debug.profilebegin("sort_buttons")
    table.sort(v_u_104, function(p130, p131)
        return v_u_128(p130, p131, p_u_92)
    end)
    table.remove(v_u_95)
    debug.profileend()
    local v132 = v_u_16[p_u_90]
    if v132 then
        local v133 = v_u_1("UIManager").apps.BackpackApp
        local v134 = not v_u_5.is_new_tutorial_running()
        if v134 then
            v134 = not v133:is_picking_item()
        end
        if v134 then
            local v135 = {
                ["type"] = "add_more",
                ["unique"] = "add_more_" .. p_u_90,
                ["category"] = p_u_90,
                ["promo_data"] = v132
            }
            table.insert(v_u_104, 1, v135)
        end
    end
    table.remove(v_u_95)
    debug.profileend()
    return v_u_104, v126, v125
end
local v_u_137 = {}
local v_u_138 = nil
function v_u_137.pets(p139, p140, p141)
    local v142, v143, v144 = v_u_136(p139, v_u_82(p139), p140, v_u_138, p141)
    return v142, v143, v144
end
local v_u_145 = nil
function v_u_137.food(p146, p147, p148)
    local v149, v150, v151 = v_u_136(p146, v_u_82(p146), p147, v_u_145, p148)
    return v149, v150, v151
end
local v_u_152 = nil
function v_u_137.toys(p153, p154, p155)
    local v156, v157, v158 = v_u_136(p153, v_u_82(p153), p154, v_u_152, p155)
    return v156, v157, v158
end
local function v_u_160(_, p159)
    return p159.grid_category ~= "sticker_packs"
end
function v_u_137.gifts(p161, p162, p163)
    local v164, v165, v166 = v_u_136(p161, v_u_82(p161), p162, v_u_160, p163)
    return v164, v165, v166
end
local v_u_167 = nil
function v_u_137.strollers(p168, p169, p170)
    local v171, v172, v173 = v_u_136(p168, v_u_82(p168), p169, v_u_167, p170)
    return v171, v172, v173
end
local v_u_174 = nil
function v_u_137.transport(p175, p176, p177)
    local v178, v179, v180 = v_u_136(p175, v_u_82(p175), p176, v_u_174, p177)
    return v178, v179, v180
end
local function v_u_182(_, p181)
    return p181.category == "stickers" and true or p181.grid_category == "sticker_packs"
end
function v_u_137.stickers(p183, p184, p185)
    local v186, v187, v188 = v_u_136(p183, v_u_82(p183), p184, v_u_182, p185)
    return v186, v187, v188
end
local v_u_189 = nil
function v_u_137.favorites(p190, p191, p192)
    local v193, v194, v195 = v_u_136(p190, v_u_89(p190), p191, v_u_189, p192)
    return v193, v194, v195
end
local function v_u_197(_, p196)
    return p196.accessory_type ~= "wings"
end
function v_u_137.pet_accessories(p198, p199, p200)
    local v201, v202, v203 = v_u_136(p198, v_u_82(p198), p199, v_u_197, p200)
    return v201, v202, v203
end
local function v_u_205(_, p204)
    return p204.accessory_type == "wings"
end
function v_u_137.wings(p206, p207, p208)
    local v209, v210, v211 = v_u_136(p206, v_u_82(p206), p207, v_u_205, p208)
    return v209, v210, v211
end
local v_u_212 = {}
function v18.recalculate_equipped_cache()
    v_u_212 = {}
    for v213, v214 in v_u_3.get_all_equipped() do
        local v215 = {}
        for _, v216 in v214 do
            v215[v216.unique] = true
        end
        v_u_212[v213] = v215
    end
end
function v18.get_buttons(p217, p218)
    local v219 = v_u_137[p217]
    local v220 = ("No category button function found for %*!"):format(p217)
    assert(v219, v220)
    return v_u_137[p217](p217, v_u_212[p217] or {}, p218)
end
return v18