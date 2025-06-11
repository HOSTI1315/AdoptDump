--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.DeveloperProducts (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("DeveloperProductCallbacks")
local function v_u_6(p3, p4)
    local v5 = v_u_1("DataM")
    if v_u_1("new:StarterPackAB"):get_value("product_key", p3) == p4 then
        return v5.get_store(p3):get("ftue_2022_starter_pack_manager"):can_purchase_starter_pack() and true or false
    else
        return false
    end
end
local function v_u_14(p7)
    local v8 = v_u_1("ClientData")
    local v9 = v_u_1("LiveOpsTime")
    local v10 = v_u_1("SharedConstants")
    if v_u_1("new:StarterPackAB"):get_value("product_key") ~= p7 then
        return true
    end
    local v11 = v8.get("ftue_2022_starter_pack_manager")
    local v12 = v11.starter_pack_timestamp
    if v11.starter_pack_purchased then
        return true
    end
    if not v12 then
        return false
    end
    local v13 = v10.ftue_starter_pack.expiry_time
    return v9.now() > v12 + v13
end
local v19 = {
    ["tutorial_2025_royal_palace_spaniel"] = {
        ["name"] = "Pet Royal Palace Spaniel",
        ["description"] = "Adopt a wonderful Royal Palace Spaniel!",
        ["cost"] = 99,
        ["product_id"] = 3251017141,
        ["callback"] = v_u_2.all({ function(p15, _, _, _)
                if not v_u_6(p15, "tutorial_2025_royal_palace_spaniel") then
                    return v_u_2.BREAK
                end
            end, v_u_2.add_item("pets", "royal_palace_2022_spaniel", true), function(p16, _, _, _)
                v_u_1("DataM").get_store(p16):get("ftue_2022_starter_pack_manager"):mark_starter_pack_as_purchased()
            end }),
        ["should_hide"] = function()
            return v_u_14("tutorial_2025_royal_palace_spaniel")
        end
    },
    ["tutorial_2025_2x_pet_certificate"] = {
        ["name"] = "Pet Handler Pro Certificate",
        ["description"] = "Used to equip 2x pets for 30 days!",
        ["cost"] = 99,
        ["product_id"] = 3251017323,
        ["callback"] = v_u_2.all({ function(p17, _, _, _)
                if not v_u_6(p17, "tutorial_2025_2x_pet_certificate") then
                    return v_u_2.BREAK
                end
            end, v_u_2.add_item("gifts", "subscription_2024_2x_pet_certificate", true), function(p18, _, _, _)
                v_u_1("DataM").get_store(p18):get("ftue_2022_starter_pack_manager"):mark_starter_pack_as_purchased()
            end }),
        ["should_hide"] = function()
            return v_u_14("tutorial_2025_2x_pet_certificate")
        end
    }
}
return v19