--// ReplicatedStorage.SharedModules.Game.EggEvent (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("SharedConstants")
local v_u_3 = v1("LiveOpsTime")
v1("InventoryDB")
local v4 = v1("package:Sift")
local v_u_5 = {
    ["pets"] = {
        ["moon_2025_egg"] = true,
        ["moon_2025_royal_egg"] = true,
        ["moon_2025_starmite"] = true,
        ["moon_2025_puptune"] = true,
        ["moon_2025_zeopod"] = true,
        ["moon_2025_snorgle"] = true,
        ["moon_2025_hopbop"] = true,
        ["moon_2025_dimension_drifter"] = true,
        ["moon_2025_moonpine"] = true,
        ["moon_2025_sunglider"] = true
    },
    ["furniture"] = {},
    ["furnish_category_names"] = {}
}
v4.Set.fromList({ v_u_2.egg_event.gumball_egg_kind_pre_release })
v4.Set.fromList({ v_u_2.egg_event.gumball_egg_kind_post_release })
local v_u_15 = {
    ["delay_until_release"] = function()
        local v6 = v_u_2.egg_event.release_time
        return v_u_3.delay_until(v6)
    end,
    ["has_release_happened"] = function()
        local v7 = v_u_2.egg_event.release_time
        return v_u_3.has_happened(v7)
    end,
    ["delay_until_countdown"] = function()
        local v8 = v_u_2.egg_event.countdown_time
        return v_u_3.delay_until(v8)
    end,
    ["has_countdown_happened"] = function()
        local v9 = v_u_2.egg_event.countdown_time
        return v_u_3.has_happened(v9)
    end,
    ["get_time_until_release"] = function()
        local v10 = v_u_2.egg_event.release_time
        return v_u_3.get_time_until(v10)
    end,
    ["get_gumball_machine_item"] = function()
        return v_u_15.has_release_happened() and {
            ["category"] = "pets",
            ["id"] = v_u_2.egg_event.gumball_egg_kind_post_release
        } or {
            ["category"] = "pets",
            ["id"] = v_u_2.egg_event.gumball_egg_kind_pre_release
        }
    end,
    ["is_item_hidden"] = function(p11, p12)
        if v_u_15.has_release_happened() then
            return false
        else
            return v_u_5[p11] and v_u_5[p11][p12] == true and true or false
        end
    end,
    ["is_furniture_hidden"] = function(p13)
        if v_u_15.has_release_happened() then
            return false
        else
            return v_u_5.furniture[p13]
        end
    end,
    ["is_furnish_category_hidden"] = function(p14)
        if v_u_15.has_release_happened() then
            return false
        else
            return v_u_5.furnish_category_names[p14]
        end
    end
}
return v_u_15