--// ReplicatedStorage.SharedModules.ContentPacks.SING2.InventorySubDB.PetAccessories (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories
local v2 = {}
local v3 = {
    ["name"] = "Galaxy Explorer Helmet",
    ["image"] = "rbxassetid://7889549481",
    ["rarity"] = "legendary",
    ["is_in_hatshop_rotation"] = false,
    ["sort_group"] = "General",
    ["accessory_type"] = "hats",
    ["model_handle"] = "Sing2RewardItem"
}
local v4 = {}
local v5 = {
    ["effect_type"] = "play_animation",
    ["options"] = {
        ["anim_name"] = "Sing2RewardHelmetIdle"
    }
}
local v10 = {
    ["effect_type"] = "scale_bone",
    ["options"] = {
        ["bone_name"] = "frontGlass",
        ["attachment_name"] = "face_mouth_attachment",
        ["scaled_offset"] = CFrame.new(0, -0.1, -0.3),
        ["validate"] = function(p6, p7)
            local v8 = p7.Z - p6.Z
            local v9
            if v8 > 0 then
                v9 = math.abs(v8) > 0.1
            else
                v9 = false
            end
            return not v9
        end
    }
}
__set_list(v4, 1, {v5, v10})
v3.static_effects = v4
v2.sing2_reward_space_helmet = v3
return v1(v2)