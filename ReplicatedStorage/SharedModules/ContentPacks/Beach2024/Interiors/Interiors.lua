--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.Interiors (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ShopInteriorHelper")
local v_u_3 = v1("TerrainHelper")
local v_u_4 = v1("FishAdoption")
local v13 = {
    ["BeachShop"] = {
        ["interactions"] = function(p5, _)
            local v6 = {}
            for _, v7 in pairs(p5.AdoptablePets:GetChildren()) do
                local v8 = v_u_4.add_dialog(v7)
                table.insert(v6, v8)
            end
            return v6
        end,
        ["render"] = function(p9, p10)
            p10.terrain_cleanup = v_u_3.load_by_tagged_parts(p9)
            v_u_4.render(p9, p10)
            v_u_2.render_lootbox_rewards(p9)
        end,
        ["cleanup"] = function(p11, p12)
            p12.terrain_cleanup()
            v_u_4.cleanup(p11)
        end
    }
}
return v13