--// ReplicatedStorage.ClientModules.Game.AvatarEditor.CatalogItemImage (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("AvatarCategoriesDB")
local v_u_3 = v1("AvatarItemSupplementalDB")
local v_u_4 = v1("AvatarEditorHelper")
local v_u_5 = v1("PetAvatarItemDB")
local v_u_6 = v1("AssetReplacementMappingDB")
return {
    ["get"] = function(p7, p8, p9)
        if v_u_6[p9] then
            p9 = v_u_6[p9]
        end
        if p7 == "pet" then
            local v10 = v_u_4.get_accessory_item_by_unique_client(p9)
            if v10 == nil then
                return ""
            end
            local v11 = v10.id
            local v12 = v_u_5.get_entry_by_id(v11)
            return v12 == nil and "" or (v12.image or "")
        else
            local v13 = v_u_2.categories[p8]
            local v14
            if v_u_3[p8] and v_u_3[p8][p9] then
                v14 = v_u_3[p8][p9].image_id or p9
            else
                v14 = p9
            end
            local v15 = v13.use_outfit_thumbnail_url
            if p9 == 2801602104 then
                v15 = false
            end
            local v16 = tostring(p9):match("^bundle%-(%d+)$")
            if v16 then
                return ("rbxthumb://type=BundleThumbnail&id=%*&w=150&h=150"):format(v16)
            else
                return "https://www.roblox.com/" .. (v15 and "outfit-thumbnail" or "asset-thumbnail") .. "/image?" .. (v15 and "userOutfitId" or "assetId") .. "=" .. v14 .. "&width=100&height=100&format=png"
            end
        end
    end
}