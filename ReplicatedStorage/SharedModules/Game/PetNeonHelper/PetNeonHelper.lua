--// ReplicatedStorage.SharedModules.Game.PetNeonHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("EffectsToggleHelper")
local v_u_3 = v1("LerpCIELUV")
local v_u_4 = v1("new:PetRigs")
local v_u_5 = {
    Color3.fromRGB(255, 72, 69),
    Color3.fromRGB(255, 96, 93),
    Color3.fromRGB(245, 255, 99),
    Color3.fromRGB(149, 255, 79),
    Color3.fromRGB(73, 255, 82),
    Color3.fromRGB(80, 255, 159),
    Color3.fromRGB(78, 47, 255),
    Color3.fromRGB(160, 97, 255),
    Color3.fromRGB(255, 97, 189),
    Color3.fromRGB(255, 101, 101)
}
local v_u_14 = {
    ["apply_neon"] = function(p6, p7)
        for v8, v9 in p7 do
            local v10 = v_u_4.get(p6).get_geo_part(p6, v8)
            if v10 then
                if v10:IsA("MeshPart") and v10.TextureID ~= "" then
                    v10.TextureID = ""
                end
                for v11, v12 in v9 do
                    v10[v11] = v12
                end
                v10:SetAttribute("is_neon_transformed", true)
            end
        end
        if p6:FindFirstChild("NeonEffects") then
            v_u_2.toggle_effects(p6.NeonEffects:GetDescendants(), true)
        end
        if p6:FindFirstChild("NonNeonEffects") then
            v_u_2.toggle_effects(p6.NonNeonEffects:GetDescendants(), false)
        end
    end,
    ["disable_neon_effects"] = function(p13)
        if p13:FindFirstChild("NeonEffects") then
            v_u_2.toggle_effects(p13.NeonEffects:GetDescendants(), false)
        end
        if p13:FindFirstChild("NonNeonEffects") then
            v_u_2.toggle_effects(p13.NonNeonEffects:GetDescendants(), true)
        end
    end
}
local v_u_15 = setmetatable({}, {
    ["__mode"] = "v"
})
function v_u_14.precache(p16, p17, p18)
    local v19 = p17.mega_neon_colors or v_u_5
    debug.setmemorycategory("PetEntities_NeonCache_Colors")
    if v_u_15[v19] then
        p16.cached_colors = v_u_15[v19]
    else
        local v20 = {}
        for v21, v22 in v19 do
            local v23 = v_u_3(v22, v19[v21 % #v19 + 1])
            local v24 = {}
            for v25 = 0, 1, 0.016666666666666666 do
                table.insert(v24, v23(v25))
            end
            table.insert(v20, v24)
        end
        v_u_15[v19] = v20
        p16.cached_colors = v20
    end
    debug.resetmemorycategory()
    local v26 = {}
    if p17.neon_parts then
        for v27 in p17.mega_neon_parts do
            local v28 = v_u_4.get(p18).get_geo_part(p18, v27)
            if v28 then
                table.insert(v26, v28)
                local v29 = v28:FindFirstChild("DisplayEyes") or v28:FindFirstChild("DisplayPart")
                if v29 then
                    table.insert(v26, v29)
                end
            end
        end
    end
    p16.cached_parts = v26
end
function v_u_14.step_mega_neon(p30, p31, p32)
    if p32.mega_neon_parts then
        if not (p30.cached_colors and p30.cached_parts) then
            v_u_14.precache(p30, p32, p31)
        end
        debug.profilebegin("PetEntities_MegaNeon_CalculateFrame")
        local v33 = tick()
        local v34 = v33 / 1.5
        local v35 = math.floor(v34) % #p30.cached_colors + 1
        local v36 = v33 % 1.5 * 60
        local v37 = math.floor(v36) + 1
        local v38 = math.min(v37, 60)
        debug.profileend()
        local v39 = p30.cached_colors[v35][v38]
        if v39 then
            for _, v40 in p30.cached_parts do
                v40.Color = v39
            end
        end
    end
end
return v_u_14