--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ToolDBHelper")
v_u_1("KindDB")
local v_u_3 = v_u_1("package:Sift")
local function v_u_7(p4, p5)
    for _, v6 in p4:GetChildren() do
        if v6:IsA("BasePart") then
            v6.Transparency = p5
        end
    end
end
local function v_u_11(p8, p9)
    for _, v10 in p8:GetChildren() do
        if v10:IsA("BasePart") then
            v10.BrickColor = BrickColor.new(p9 or "Institutional white")
        end
    end
end
local v39 = {
    ["IceCreamTool"] = {
        ["client_use"] = function(p12, p13, p14, p15, p16, p17, p18)
            local v19 = p14:get_updated_item_data()
            local v20
            if p12.kind == "ice_cream_2025_cup" then
                if not v19.properties.flavors or #v19.properties.flavors == 0 then
                    return false
                end
                v20 = false
            else
                v20 = not v19.properties.uses_left or v19.properties.uses_left == 1
            end
            local v21 = v_u_3.Dictionary.copyDeep(p12)
            v21.anims.use = v20 and "IceCreamConeEat" or "IceCreamLick"
            return v_u_2.generic_client_use(v21, p13, p14, p15, p16, p17, p18)
        end,
        ["server_use_end"] = function(p22, p23, p24, p25)
            p24.properties.sauce = nil
            p24.properties.chocolate_wafer = nil
            p24.properties.cherry_topping = nil
            p24:server_render()
            return v_u_2.generic_server_use_end(p22, p23, p24, p25)
        end,
        ["server_render"] = function(p26, p27, ...)
            local v28 = p26.properties.uses_left or 1
            local v29 = p26.properties.flavors or {}
            if p26.kind == "ice_cream_2025_cup" and #v29 ~= 0 then
                v28 = v28 + 1
            end
            local v30
            if v28 > 1 then
                v30 = p27.Scoops["Scoop" .. v28 - 1]
            else
                v30 = false
            end
            for v31 = 1, 3 do
                local v32 = p27.Scoops["Scoop" .. v31]
                v_u_7(v32, v31 < v28 and 0 or 1)
                v_u_11(v32, v29[v31])
            end
            v_u_11(p27.Sauce, p26.properties.sauce)
            v_u_7(p27.Sauce, p26.properties.sauce and 0 or 1)
            v_u_7(p27.Toppings.ChocolateWafer, p26.properties.chocolate_wafer and 0 or 1)
            v_u_7(p27.Toppings.CherryTopping, p26.properties.cherry_topping and 0 or 1)
            if v30 then
                local v33 = CFrame.new(0, v30.PrimaryPart.Weld.C1.Y, 0)
                p27.Sauce.PrimaryPart.Weld.C1 = v33
                for _, v34 in p27.Toppings:GetChildren() do
                    v34.PrimaryPart.Weld.C1 = v33
                    if p26.properties.sauce then
                        local v35 = v_u_1("DataM")
                        local v36 = v_u_1("TeamDB")
                        local v37 = p26.inventory.player
                        local v38 = v36.teams[v35.get(v37, "team")].HandleScale or 1
                        v34.PrimaryPart.Weld.C1 = v34.PrimaryPart.Weld.C1 * CFrame.new(0, -0.347 * v38, 0)
                    end
                end
            end
        end
    }
}
return v39