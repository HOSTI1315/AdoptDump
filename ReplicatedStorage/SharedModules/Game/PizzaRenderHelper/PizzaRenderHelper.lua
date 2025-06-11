--// ReplicatedStorage.SharedModules.Game.PizzaRenderHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("ServerStorage")
local v_u_12 = {
    ["get_model_async"] = function()
        if v_u_2:IsServer() then
            return v_u_3.ServerResources.Holdables.PizzaShopPizza:Clone()
        else
            return v_u_1("DownloadClient").promise_download_copy("Holdables", "PizzaShopPizza"):expect()
        end
    end,
    ["render_for_furniture"] = function(p4, p5)
        p4.RightMount:Destroy()
        v_u_12.render(p4, p5, true)
        for _, v6 in pairs(p4:GetDescendants()) do
            if v6:IsA("BasePart") then
                if v6.Transparency == 1 then
                    v6:Destroy()
                else
                    v6.Anchored = true
                end
            end
        end
    end,
    ["render"] = function(p7, p8)
        for _, v9 in pairs(p7:GetDescendants()) do
            if v9:IsA("BasePart") or v9:IsA("Decal") then
                v9.Transparency = 1
            end
        end
        if p8.state == "Dough" then
            p7.Dough.Transparency = 0
        elseif p8.state == "Uncooked" then
            for _, v10 in pairs(p7.Uncooked:GetChildren()) do
                if v10:IsA("BasePart") and (v10.Name == "Dough" or p8.toppings[v10.Name]) then
                    v10.Transparency = 0
                end
            end
        elseif p8.state == "Cooked" then
            for _, v11 in pairs(p7.Cooked:GetChildren()) do
                if v11:IsA("BasePart") and (v11.Name == "Dough" or p8.toppings[v11.Name]) then
                    v11.Transparency = 0
                end
            end
        end
        if p8.boxed then
            p7.Box.Bottom.Transparency = 0
            p7.Box.Top.Transparency = 0
            p7.Box.Top.Decal.Transparency = 0
        end
        if p8.plated then
            p7.Plate.Transparency = 0
        end
    end
}
return v_u_12