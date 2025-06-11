--// ReplicatedStorage.SharedModules.PlayerProfiles.StatsWidgetDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("KindDB")
local v3 = game:GetService("RunService"):IsServer()
local function v_u_13(p4, p5, p6)
    local v7 = v_u_1("DataM").get_store(p4)
    if v7 then
        v7 = v7:get("inventory")
    end
    local v8 = {}
    for _, v9 in v7 and v7:get_items_in_category_as_map(p5) or {} do
        local v10 = v_u_2[v9.kind]
        local v11
        if v10 then
            local v12 = v10.temporary or (v10.is_hidden_from_backpack or v10.unreleased or (v10.permanently_delete_all_copies_of_this_item_from_the_game or v10.permanently_delete_all_copies_of_this_item_when_db_entry_is_nil))
            v11 = not v12
        else
            v11 = false
        end
        if v11 and (p6 == nil or p6(v9, v10)) then
            table.insert(v8, v9)
        end
    end
    return v8
end
local v56 = {
    ["join_date"] = {
        ["choose_text"] = "Joined",
        ["layout_order"] = 1,
        ["icon"] = "rbxassetid://17670669081",
        ["mobile_icon"] = "rbxassetid://17671968326",
        ["request_delay"] = 3600,
        ["get_value"] = function(p14)
            return v_u_1("PlaytimeHelper").get_first_play_timestamp(p14)
        end,
        ["format_value"] = function(p15)
            local v16 = v_u_1("TranslationHelper").get_translator_for_player(game.Players.LocalPlayer)
            return DateTime.fromUnixTimestamp(p15):FormatLocalTime("l", v16.LocaleId)
        end
    },
    ["hours_played"] = {
        ["choose_text"] = "Hours Played",
        ["layout_order"] = 2,
        ["icon"] = "rbxassetid://17670669081",
        ["mobile_icon"] = "rbxassetid://17671968326",
        ["request_delay"] = 300,
        ["get_value"] = function(p17)
            local v18 = v_u_1("PlaytimeHelper").get_lifetime_playtime(p17) / 3600
            if v18 >= 10 then
                return math.round(v18)
            end
            local v19 = v18 * 10
            return math.round(v19) / 10
        end
    },
    ["login_streak"] = {
        ["choose_text"] = "Login Streak",
        ["request_delay"] = 300,
        ["layout_order"] = 5,
        ["icon"] = "rbxassetid://17670669396",
        ["mobile_icon"] = "rbxassetid://17671992070",
        ["get_value"] = function(p20)
            local v21 = v_u_1("DataM").get_store(p20)
            if v21 then
                v21 = v21:get("daily_login_manager")
            end
            return (v21 or {}).streak or 0
        end
    },
    ["badges"] = {
        ["choose_text"] = "Badges",
        ["layout_order"] = 7,
        ["icon"] = "rbxassetid://17670668764",
        ["mobile_icon"] = "rbxassetid://17671960202",
        ["request_delay"] = 300,
        ["get_value"] = function(p22)
            local v23 = v_u_1("BadgeDB").get_badge_id_list()
            local v24 = game:GetService("BadgeService")
            local v25 = 0
            for _, v26 in v23 do
                if v24:UserHasBadgeAsync(p22.UserId, v26) then
                    v25 = v25 + 1
                end
            end
            return v25
        end
    },
    ["hatched"] = {
        ["choose_text"] = "Eggs Hatched",
        ["layout_order"] = 10,
        ["icon"] = "rbxassetid://17670768462",
        ["mobile_icon"] = "rbxassetid://17577361652",
        ["get_value"] = function(p27)
            local v28 = v_u_1("InventoryDB")
            local v29 = 0
            local v30 = v_u_1("DataM").get_store(p27)
            if v30 then
                v30 = v30:get("journal_collection")
            end
            for v31, v32 in (v30 or {}).pets or {} do
                local v33 = v28.pets[v31]
                if v33 and not v33.is_egg then
                    v29 = v29 + (v32 and v32.hatched or 0)
                end
            end
            return v29
        end
    },
    ["neons"] = {
        ["choose_text"] = "Neon Pets",
        ["layout_order"] = 20,
        ["icon"] = "rbxassetid://17670769101",
        ["mobile_icon"] = "rbxassetid://17671967973",
        ["get_value"] = function(p34)
            return #v_u_13(p34, "pets", function(p35)
                return p35.properties.neon == true
            end)
        end
    },
    ["megas"] = {
        ["choose_text"] = "Mega Pets",
        ["layout_order"] = 25,
        ["icon"] = "rbxassetid://17670768847",
        ["mobile_icon"] = "rbxassetid://17671967852",
        ["get_value"] = function(p36)
            return #v_u_13(p36, "pets", function(p37)
                return p37.properties.mega_neon == true
            end)
        end
    },
    ["flyables"] = {
        ["choose_text"] = "Flyable Pets",
        ["layout_order"] = 30,
        ["icon"] = "rbxassetid://17671951713",
        ["mobile_icon"] = "rbxassetid://17671960295",
        ["get_value"] = function(p38)
            return #v_u_13(p38, "pets", function(p39)
                return p39.properties.flyable == true
            end)
        end
    },
    ["rideables"] = {
        ["choose_text"] = "Rideable Pets",
        ["layout_order"] = 35,
        ["icon"] = "rbxassetid://17671951880",
        ["mobile_icon"] = "rbxassetid://17671968223",
        ["get_value"] = function(p40)
            return #v_u_13(p40, "pets", function(p41)
                return p41.properties.rideable == true
            end)
        end
    },
    ["inventory"] = {
        ["choose_text"] = "Inventory Size",
        ["layout_order"] = 50,
        ["icon"] = "rbxassetid://17670669282",
        ["mobile_icon"] = "rbxassetid://17671960771",
        ["get_value"] = function(p42)
            local v43 = 0
            for v44, _ in v_u_1("InventoryDB") do
                v43 = v43 + #v_u_13(p42, v44)
            end
            return v43
        end
    },
    ["pets"] = {
        ["choose_text"] = "Pets",
        ["layout_order"] = 51,
        ["icon"] = "rbxassetid://17670689114",
        ["mobile_icon"] = "rbxassetid://17672005769",
        ["get_value"] = function(p45)
            return #v_u_13(p45, "pets")
        end
    },
    ["pet_accessories"] = {
        ["choose_text"] = "Pet Wear",
        ["layout_order"] = 52,
        ["icon"] = "rbxassetid://17670689744",
        ["mobile_icon"] = "rbxassetid://17672025116",
        ["get_value"] = function(p46)
            return #v_u_13(p46, "pet_accessories", function(_, p47)
                return p47.accessory_type ~= "wings"
            end)
        end
    },
    ["strollers"] = {
        ["choose_text"] = "Strollers",
        ["layout_order"] = 53,
        ["icon"] = "rbxassetid://17670689384",
        ["mobile_icon"] = "rbxassetid://17672006118",
        ["get_value"] = function(p48)
            return #v_u_13(p48, "strollers")
        end
    },
    ["food"] = {
        ["choose_text"] = "Food",
        ["layout_order"] = 54,
        ["icon"] = "rbxassetid://17670668837",
        ["mobile_icon"] = "rbxassetid://17671960499",
        ["get_value"] = function(p49)
            return #v_u_13(p49, "food")
        end
    },
    ["transport"] = {
        ["choose_text"] = "Vehicles",
        ["layout_order"] = 55,
        ["icon"] = "rbxassetid://17670689629",
        ["mobile_icon"] = "rbxassetid://17672024935",
        ["get_value"] = function(p50)
            return #v_u_13(p50, "transport")
        end
    },
    ["toys"] = {
        ["choose_text"] = "Toys",
        ["layout_order"] = 56,
        ["icon"] = "rbxassetid://17670689515",
        ["mobile_icon"] = "rbxassetid://17672024792",
        ["get_value"] = function(p51)
            return #v_u_13(p51, "toys")
        end
    },
    ["gifts"] = {
        ["choose_text"] = "Gifts",
        ["layout_order"] = 57,
        ["icon"] = "rbxassetid://17670668917",
        ["mobile_icon"] = "rbxassetid://17671968097",
        ["get_value"] = function(p52)
            return #v_u_13(p52, "gifts")
        end
    },
    ["wings"] = {
        ["choose_text"] = "Wings",
        ["layout_order"] = 58,
        ["icon"] = "rbxassetid://17670707774",
        ["mobile_icon"] = "rbxassetid://17672025267",
        ["get_value"] = function(p53)
            return #v_u_13(p53, "pet_accessories", function(_, p54)
                return p54.accessory_type == "wings"
            end)
        end
    },
    ["stickers"] = {
        ["choose_text"] = "Stickers",
        ["layout_order"] = 59,
        ["icon"] = "rbxassetid://17670689283",
        ["mobile_icon"] = "rbxassetid://17672006002",
        ["get_value"] = function(p55)
            return #v_u_13(p55, "stickers")
        end
    }
}
local v_u_57 = {}
game.Players.PlayerRemoving:connect(function(p58)
    v_u_57[p58] = nil
end)
for v_u_59, v_u_60 in v56 do
    v_u_60.format_value = v_u_60.format_value or function(p61)
        return p61
    end
    if v3 then
        function v_u_60.format_value()
            error("format_value() can not be called on the server.")
        end
        local v_u_62 = v_u_60.get_value
        if v_u_62 then
            v_u_60.request_delay = v_u_60.request_delay or 5
            function v_u_60.get_value(p63, ...)
                v_u_57[p63] = v_u_57[p63] or {}
                local v64 = tick()
                local v65 = v_u_57[p63][v_u_59] or {}
                if v65 and (v65.timestamp and v64 - v65.timestamp < v_u_60.request_delay) then
                    return v65.cached_value
                end
                local v66 = v_u_62(p63, ...)
                v_u_57[p63][v_u_59] = {
                    ["timestamp"] = v64,
                    ["cached_value"] = v66
                }
                return v66
            end
        end
    else
        function v_u_60.get_value()
            error("get_value() can not be called on the client.")
        end
    end
end
return v56