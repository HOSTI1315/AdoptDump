--// ReplicatedStorage.ClientModules.Game.Interiors.HousePreviewInteriorHelper (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v2("UIManager")
local v_u_4 = v2("HouseRenderHelper")
local v_u_5 = v2("TerrainHelper")
local v_u_6 = v2("package:Promise")
local v_u_7 = v2("InteractionsEngine")
local v_u_8 = v2("HouseDB")
local v_u_9 = v2("package:Sift")
local v_u_10 = v2("Maid")
return {
    ["render"] = function(p_u_11, p_u_12)
        p_u_12.render_maid = v_u_10.new()
        v_u_3.set_app_visibility("HousePreviewInteriorApp", true)
        p_u_12.render_maid:GiveTask(function()
            v_u_3.set_app_visibility("HousePreviewInteriorApp", false)
        end)
        v_u_7:set_tag_exclusive("HousePreviewMode", true)
        v_u_7:set_tag_exclusive("InteriorDoor", true)
        p_u_12.render_maid:GiveTask(function()
            v_u_7:set_tag_exclusive("HousePreviewMode")
            v_u_7:set_tag_exclusive("InteriorDoor")
        end)
        local v13 = v_u_8[p_u_12.building_type].addons ~= nil
        v_u_3.apps.HousePreviewInteriorApp:set_addon_area_visibility(v13)
        if v13 then
            local v_u_20 = v_u_6.new(function(_, _, p14)
                while not p14() do
                    local v15 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
                    local v16 = v_u_4.get_nearest_floor(p_u_11, v15)
                    if v16 then
                        local v17 = v16.floor.Parent.Name
                        local v18 = v_u_8[p_u_12.building_type].addons[v17]
                        local v19 = v18 and v18.name or "Main Area"
                        v_u_3.apps.HousePreviewInteriorApp:set_addon_area_text(v19)
                    end
                    task.wait(0.5)
                end
            end)
            p_u_12.render_maid:GiveTask(function()
                v_u_20:cancel()
            end)
        end
        local v21 = p_u_11:FindFirstChild("PreviewBarriers")
        if v21 then
            local v_u_23 = v_u_9.List.filter(v21:GetDescendants(), function(p22)
                return p22:IsA("Texture")
            end)
            local v25 = v_u_1.RenderStepped:Connect(function()
                for _, v24 in v_u_23 do
                    v24.OffsetStudsU = tick() % v24.StudsPerTileU
                    v24.OffsetStudsV = tick() % v24.StudsPerTileV
                end
            end)
            p_u_12.render_maid:GiveTask(v25)
        end
        local v_u_26 = v_u_5.add_housing_terrain_water(p_u_11)
        p_u_12.render_maid:GiveTask(function()
            v_u_26()
        end)
    end,
    ["cleanup"] = function(_, p27)
        p27.render_maid:DoCleaning()
    end,
    ["interactions"] = function(p28, p29)
        p29.building_type = string.split(p28.Name, "!")[2]
        return {}
    end
}