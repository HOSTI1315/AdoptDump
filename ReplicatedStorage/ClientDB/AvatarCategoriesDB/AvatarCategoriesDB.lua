--// ReplicatedStorage.ClientDB.AvatarCategoriesDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = {}
local v9 = {
    ["hats"] = {
        ["name"] = "Hats",
        ["image"] = 2644702738,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.Hat,
        ["accessory_type"] = Enum.AccessoryType.Hat,
        ["equip_limit"] = 5
    },
    ["hair"] = {
        ["name"] = "Hair",
        ["image"] = 2644687545,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.HairAccessory,
        ["accessory_type"] = Enum.AccessoryType.Hair,
        ["equip_limit"] = 5
    },
    ["faces"] = {
        ["name"] = "Faces",
        ["image"] = 0,
        ["subcategories"] = { "General", "Exclusive" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.Face,
        ["one_at_a_time"] = true,
        ["related_categories"] = { "dynamic_heads_packages", "eyebrows", "eyelashes" }
    },
    ["particles"] = {
        ["name"] = "Particles",
        ["image"] = 2747899851,
        ["subcategories"] = { "Exclusive" },
        ["one_at_a_time"] = true
    },
    ["shirts"] = {
        ["name"] = "Shirts",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.Shirt,
        ["one_at_a_time"] = true
    },
    ["pants"] = {
        ["name"] = "Pants",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.Pants,
        ["one_at_a_time"] = true
    },
    ["skirts"] = {
        ["name"] = "Skirts",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["one_at_a_time"] = true,
        ["allowed_bundle_accessories"] = { "animations", "packages" }
    },
    ["wings"] = {
        ["name"] = "Wings",
        ["image"] = 2644687663,
        ["subcategories"] = { "General", "Exclusive" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.BackAccessory,
        ["accessory_type"] = Enum.AccessoryType.Back,
        ["equip_limit"] = 5
    },
    ["neck"] = {
        ["name"] = "Neck",
        ["image"] = 4441747668,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.NeckAccessory,
        ["accessory_type"] = Enum.AccessoryType.Neck,
        ["equip_limit"] = 5
    },
    ["front"] = {
        ["name"] = "Front",
        ["image"] = 4441747924,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.FrontAccessory,
        ["accessory_type"] = Enum.AccessoryType.Front,
        ["equip_limit"] = 5
    },
    ["tails"] = {
        ["name"] = "Tails",
        ["image"] = 2644687662,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.WaistAccessory,
        ["accessory_type"] = Enum.AccessoryType.Waist,
        ["equip_limit"] = 5
    },
    ["shoulder_pets"] = {
        ["name"] = "Shoulder Pets",
        ["image"] = 2644687661,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.ShoulderAccessory,
        ["accessory_type"] = Enum.AccessoryType.Shoulder,
        ["equip_limit"] = 5
    },
    ["glasses"] = {
        ["name"] = "Glasses",
        ["image"] = 2644687550,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.FaceAccessory,
        ["accessory_type"] = Enum.AccessoryType.Face,
        ["equip_limit"] = 5
    },
    ["heads"] = {
        ["name"] = "Heads",
        ["image"] = 2732589039,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.Head,
        ["one_at_a_time"] = true,
        ["related_categories"] = { "dynamic_heads_packages" }
    },
    ["animations"] = {
        ["name"] = "Animations",
        ["image"] = 2732588938,
        ["asset_type_id"] = -1,
        ["subcategories"] = { "General" },
        ["bundle_type"] = Enum.BundleType.Animations,
        ["one_at_a_time"] = true,
        ["use_outfit_thumbnail_url"] = true,
        ["allowed_bundle_accessories"] = {}
    },
    ["packages"] = {
        ["name"] = "Packages",
        ["image"] = 2732588889,
        ["asset_type_id"] = -2,
        ["subcategories"] = { "General" },
        ["bundle_type"] = Enum.BundleType.BodyParts,
        ["one_at_a_time"] = true,
        ["use_outfit_thumbnail_url"] = true,
        ["allowed_bundle_accessories"] = {
            "hats",
            "hair",
            "faces",
            "wings",
            "tails",
            "shoulder_pets",
            "neck",
            "front",
            "glasses",
            "heads",
            "dynamic_heads_packages"
        }
    },
    ["dynamic_heads_packages"] = {
        ["name"] = "Dynamic Heads",
        ["image"] = 0,
        ["asset_type_id"] = -3,
        ["subcategories"] = { "General" },
        ["bundle_type"] = Enum.BundleType.DynamicHead,
        ["one_at_a_time"] = true,
        ["use_outfit_thumbnail_url"] = true,
        ["related_categories"] = {
            "heads",
            "faces",
            "eyebrows",
            "eyelashes"
        },
        ["allowed_bundle_accessories"] = { "eyebrows", "eyelashes" }
    },
    ["shoes_packages"] = {
        ["name"] = "Pairs of Shoes",
        ["image"] = 0,
        ["asset_type_id"] = -4,
        ["subcategories"] = { "General" },
        ["bundle_type"] = Enum.BundleType.Shoes,
        ["one_at_a_time"] = true,
        ["use_outfit_thumbnail_url"] = true,
        ["related_categories"] = { "left_shoes", "right_shoes" },
        ["allowed_bundle_accessories"] = { "left_shoes", "right_shoes" }
    },
    ["skin_tone"] = {
        ["name"] = "Skin Tone",
        ["image"] = 2732588983,
        ["subcategories"] = { "General" },
        ["one_at_a_time"] = true
    },
    ["t_shirts"] = {
        ["name"] = "T-Shirts",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.TShirt,
        ["one_at_a_time"] = true
    },
    ["tshirts_accessory"] = {
        ["name"] = "T-Shirts (Accessory)",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.TShirtAccessory,
        ["accessory_type"] = Enum.AccessoryType.TShirt,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["shirts_accessory"] = {
        ["name"] = "Shirts (Accessory)",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.ShirtAccessory,
        ["accessory_type"] = Enum.AccessoryType.Shirt,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["pants_accessory"] = {
        ["name"] = "Pants (Accessory)",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.PantsAccessory,
        ["accessory_type"] = Enum.AccessoryType.Pants,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["jackets"] = {
        ["name"] = "Jackets",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.JacketAccessory,
        ["accessory_type"] = Enum.AccessoryType.Jacket,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["sweaters"] = {
        ["name"] = "Sweaters",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.SweaterAccessory,
        ["accessory_type"] = Enum.AccessoryType.Sweater,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["shorts"] = {
        ["name"] = "Shorts",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.ShortsAccessory,
        ["accessory_type"] = Enum.AccessoryType.Shorts,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["dresses_skirts_accessory"] = {
        ["name"] = "Dresses & Skirts (Accessory)",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.DressSkirtAccessory,
        ["accessory_type"] = Enum.AccessoryType.DressSkirt,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["left_shoes"] = {
        ["name"] = "Left Shoes",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.LeftShoeAccessory,
        ["accessory_type"] = Enum.AccessoryType.LeftShoe,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true,
        ["dont_download_roblox_catalog_items"] = true,
        ["related_categories"] = { "left_shoes" }
    },
    ["right_shoes"] = {
        ["name"] = "Right Shoes",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.RightShoeAccessory,
        ["accessory_type"] = Enum.AccessoryType.RightShoe,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true,
        ["dont_download_roblox_catalog_items"] = true,
        ["related_categories"] = { "right_shoes" }
    },
    ["eyebrows"] = {
        ["name"] = "Eyebrows",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.EyebrowAccessory,
        ["accessory_type"] = Enum.AccessoryType.Eyebrow,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["eyelashes"] = {
        ["name"] = "Eyelash",
        ["image"] = 0,
        ["subcategories"] = { "General" },
        ["avatar_asset_type"] = Enum.AvatarAssetType.EyelashAccessory,
        ["accessory_type"] = Enum.AccessoryType.Eyelash,
        ["is_layered_clothing"] = true,
        ["one_at_a_time"] = true
    },
    ["all_shirts"] = {
        ["name"] = "Shirts",
        ["image"] = 2644687539,
        ["subcategories"] = {
            "Shirts",
            "T-Shirts",
            "Layered Shirts",
            "Layered T-Shirts"
        },
        ["subcategory_to_category_remap"] = {
            ["Shirts"] = "shirts",
            ["T-Shirts"] = "t_shirts",
            ["Layered Shirts"] = "shirts_accessory",
            ["Layered T-Shirts"] = "tshirts_accessory"
        },
        ["soft_category"] = true
    },
    ["all_pants"] = {
        ["name"] = "Pants",
        ["image"] = 2644687542,
        ["subcategories"] = { "Pants", "Layered Pants", "Layered Shorts" },
        ["subcategory_to_category_remap"] = {
            ["Pants"] = "pants",
            ["Layered Pants"] = "pants_accessory",
            ["Layered Shorts"] = "shorts"
        },
        ["soft_category"] = true
    },
    ["all_skirts"] = {
        ["name"] = "Skirts",
        ["image"] = 2644687660,
        ["subcategories"] = { "General", "Exclusive" },
        ["subcategory_to_category_remap"] = {
            ["General"] = "dresses_skirts_accessory",
            ["Exclusive"] = "skirts"
        },
        ["hide_subcategory"] = {
            ["Exclusive"] = function()
                local v3 = v_u_1("AvatarItemSupplementalDB")
                local v4 = v_u_1("ClientData")
                local v5 = v_u_1("Set").new(v4.get("unlocked_catalog_items"))
                for v6, _ in v3.skirts do
                    if v5:has(v6) then
                        return false
                    end
                end
                return true
            end
        },
        ["soft_category"] = true
    },
    ["outerwear"] = {
        ["name"] = "Outerwear",
        ["image"] = 14495064004,
        ["subcategories"] = { "Sweaters", "Jackets" },
        ["subcategory_to_category_remap"] = {
            ["Jackets"] = "jackets",
            ["Sweaters"] = "sweaters"
        },
        ["soft_category"] = true
    },
    ["all_faces"] = {
        ["name"] = "Heads",
        ["image"] = 2644702735,
        ["subcategories"] = { "Classic", "Animated", "Exclusive" },
        ["subcategory_to_category_remap"] = {
            ["Classic"] = {
                ["category"] = "faces",
                ["subcategory"] = "General"
            },
            ["Animated"] = "dynamic_heads_packages",
            ["Exclusive"] = {
                ["category"] = "faces",
                ["subcategory"] = "Exclusive"
            }
        },
        ["hide_subcategory"] = {
            ["Exclusive"] = function()
                local v7 = v_u_1("TableUtil")
                local v8 = v_u_1("ClientData").get("gamepass_manager")
                return not v7.is_member(v8, "premium_faces")
            end
        },
        ["soft_category"] = true
    },
    ["all_shoes"] = {
        ["name"] = "Shoes",
        ["image"] = 5451644782,
        ["subcategories"] = { "General", "Left", "Right" },
        ["subcategory_to_category_remap"] = {
            ["General"] = "shoes_packages",
            ["Left"] = "left_shoes",
            ["Right"] = "right_shoes"
        },
        ["hide_subcategory"] = {
            ["Left"] = true,
            ["Right"] = true
        },
        ["soft_category"] = true
    },
    ["other"] = {
        ["name"] = "Other",
        ["image"] = 12368144938,
        ["subcategories"] = { "General" },
        ["soft_category"] = true
    }
}
v_u_2.categories = v9
v_u_2.ordered_categories = {
    "all_faces",
    "hair",
    "all_shirts",
    "all_pants",
    "hats",
    "front",
    "neck",
    "glasses",
    "wings",
    "shoulder_pets",
    "tails",
    "skin_tone",
    "all_skirts",
    "outerwear",
    "heads",
    "packages",
    "all_shoes",
    "animations",
    "particles",
    "other"
}
for v10, v11 in pairs(v_u_2.categories) do
    v11.category = v10
    if v11.avatar_asset_type then
        local v12 = v11.asset_type_id == nil
        assert(v12, "Should not include both asset_type_id and avatar_asset_type")
        v11.asset_type_id = v11.avatar_asset_type.Value
    end
end
function v_u_2.get_entry_from_accessory_type(p13)
    for _, v14 in pairs(v_u_2.categories) do
        if v14.accessory_type == p13 then
            return v14
        end
    end
end
function v_u_2.get_entry_from_asset_type_id(p15)
    for _, v16 in pairs(v_u_2.categories) do
        if v16.asset_type_id == p15 then
            return v16
        end
    end
end
return v_u_2