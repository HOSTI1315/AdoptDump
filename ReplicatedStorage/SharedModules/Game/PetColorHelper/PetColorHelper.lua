--// ReplicatedStorage.SharedModules.Game.PetColorHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetAccessoryEquipHelper")
local v_u_3 = v1("package:Sift")
local v_u_4 = game:GetService("RunService")
local v_u_5 = {
    ["Eye"] = true
}
local v_u_6 = {}
local function v_u_14(p7, p8, p9)
    if p7:GetAttribute("colored_hair_spray_original_color") == nil then
        p7:SetAttribute("colored_hair_spray_original_color", p7.Color)
    end
    if p7:IsA("MeshPart") then
        if p7:GetAttribute("colored_hair_spray_original_texture") == nil then
            p7:SetAttribute("colored_hair_spray_original_texture", p7.TextureID)
        end
        p7.TextureID = ""
    end
    if p7:GetAttribute("is_neon_transformed") or p7.Material ~= Enum.Material.Neon then
        p7.Color = p8
    else
        local v10, v11, v12 = Color3.toHSV(p8)
        local v13 = math.clamp(v12, 0, 0.546875)
        p7.Color = Color3.fromHSV(v10, v11, v13)
    end
    if p9 and p9.seal_color then
        p7:SetAttribute("sealed_hair_spray_color", p8)
    end
end
function v_u_6.remove_color_from_pet(p15, p16)
    local v17 = p16 or {}
    for _, v18 in ipairs(p15.PetModel:GetDescendants()) do
        if v18:IsA("BasePart") then
            local v19 = not v17.remove_sealed
            if v19 then
                v19 = v18:GetAttribute("sealed_hair_spray_color")
            end
            if v19 then
                v_u_14(v18, v19, {
                    ["seal_color"] = true
                })
            else
                v18.Color = v18:GetAttribute("colored_hair_spray_original_color") or v18.Color
                v18:SetAttribute("colored_hair_spray_original_color", nil)
                if v18:IsA("MeshPart") then
                    v18.TextureID = v18:GetAttribute("colored_hair_spray_original_texture") or v18.TextureID
                    v18:SetAttribute("colored_hair_spray_original_texture", nil)
                end
                v18:SetAttribute("sealed_hair_spray_color", nil)
            end
        end
    end
end
local function v_u_32(p20)
    local v_u_21 = {}
    local function v_u_25(p22)
        if v_u_2.get_item_kind_from_accessory_model(p22) == nil then
            if p22:IsA("BasePart") then
                local v23 = v_u_21
                table.insert(v23, p22)
            end
            for _, v24 in p22:GetChildren() do
                v_u_25(v24)
            end
        end
    end
    v_u_25(p20.PetModel)
    local v26 = {}
    for _, v27 in v_u_21 do
        local v28 = v27.Transparency < 1 or v27:GetAttribute("IsBakedInAccessory")
        if v28 then
            for v29, _ in v_u_5 do
                if v27.Name:match(v29) then
                    v28 = false
                    ::l9::
                    if v28 then
                        v28 = not v27:GetAttribute("IsUnpaintable")
                    end
                    goto l5
                end
            end
            v28 = true
            goto l9
        end
        ::l5::
        if v28 then
            local v30 = (v27:GetAttribute("colored_hair_spray_original_color") or v27.Color):ToHex()
            v26[v30] = v26[v30] or {}
            local v31 = v26[v30]
            table.insert(v31, v27)
        end
    end
    return v26
end
local function v_u_44(p33)
    local v_u_34 = {}
    local function v_u_38(p35)
        if v_u_2.get_item_kind_from_accessory_model(p35) == nil then
            if p35:IsA("BasePart") then
                local v36 = v_u_34
                table.insert(v36, p35)
            end
            for _, v37 in p35:GetChildren() do
                v_u_38(v37)
            end
        end
    end
    v_u_38(p33.PetModel)
    local v39 = {}
    for _, v40 in v_u_34 do
        local v41 = v40.Transparency < 1 or v40:GetAttribute("IsBakedInAccessory")
        if v41 then
            for v42, _ in v_u_5 do
                if v40.Name:match(v42) then
                    v41 = false
                    ::l9::
                    if v41 then
                        v41 = not v40:GetAttribute("IsUnpaintable")
                    end
                    goto l5
                end
            end
            v41 = true
            goto l9
        end
        ::l5::
        if v41 then
            local v43 = (v40:GetAttribute("colored_hair_spray_original_color") or v40.Color):ToHex()
            v39[v43] = (v39[v43] or 0) + v40.Size.X * v40.Size.Y * v40.Size.Z
        end
    end
    return v39
end
function v_u_6.get_num_colorable_groups(p45)
    local v46 = v_u_32(p45)
    local v47 = 0
    for _, _ in pairs(v46) do
        v47 = v47 + 1
    end
    return v47
end
function v_u_6.color_pet(p48, p49, p50)
    local v51 = v_u_32(p48)
    local v52 = v_u_44(p48)
    local v53 = {}
    local v54 = p49 or {}
    local v55 = p50 or {}
    for v56, v57 in pairs(v52) do
        table.insert(v53, {
            ["hex_color"] = v56,
            ["volume"] = v57
        })
    end
    table.sort(v53, function(p58, p59)
        return p58.volume > p59.volume
    end)
    for v60, v61 in ipairs(v53) do
        local v62 = v61.hex_color
        if v54[v60] == nil then
            break
        end
        local v63 = Color3.new
        local v64 = v54[v60]
        local v65 = v63(unpack(v64))
        for _, v66 in ipairs(v51[v62]) do
            v_u_14(v66, v65, {
                ["seal_color"] = v55.seal_colors
            })
        end
    end
end
function v_u_6.color_is_sealed(p67)
    if v_u_4:IsServer() then
        return p67.properties.are_colors_sealed
    else
        return p67.are_colors_sealed
    end
end
function v_u_6.has_salon_colors_applied(p68)
    if p68 then
        p68 = p68.char:GetAttribute("has_colored_hair_spray")
    end
    return p68
end
function v_u_6.can_seal_colors(p69)
    if v_u_4:IsServer() then
        if p69 and (p69.is_pet and v_u_6.has_salon_colors_applied(p69)) then
            local v70 = p69.pet_inventory_item
            if v70.entry.cannot_seal_colors then
                return false
            else
                local v71 = v70.properties.timed_flags
                local v72 = v71 and (v71.colored_hair_spray and v71.colored_hair_spray.value)
                if v72 then
                    v72 = v71.colored_hair_spray.value.colors
                end
                if v72 and #v72 > 0 then
                    local v73 = v_u_3.Dictionary.merge(v70.properties.sealed_colors or {}, p69.pet_inventory_item.properties.timed_flags.colored_hair_spray.value.colors)
                    if v_u_3.Dictionary.equalsDeep(v70.properties.sealed_colors or {}, v73) then
                        return false
                    else
                        return true, v73
                    end
                else
                    return false
                end
            end
        else
            return false
        end
    else
        warn("Cannot make colors permanent on client")
        return false
    end
end
function v_u_6.try_seal_colors(p74)
    local v75, v76 = v_u_6.can_seal_colors(p74)
    if not v75 then
        return false
    end
    p74.pet_inventory_item.properties.sealed_colors = v76
    p74.pet_inventory_item:mark_updated()
    p74.properties.are_colors_sealed = true
    p74:mark_updated()
    p74.char:SetAttribute("has_colored_hair_spray", nil)
    p74.timed_flag_manager:remove_flag("colored_hair_spray")
    v_u_6.color_pet(p74.char, v76, {
        ["seal_colors"] = true
    })
    return true
end
function v_u_6.try_unseal_colors(p77)
    if not v_u_4:IsServer() then
        warn("Cannot unseal colors on client")
        return false
    end
    if not (p77 and (p77.is_pet and v_u_6.color_is_sealed(p77))) then
        return false
    end
    v_u_6.remove_color_from_pet(p77.char, {
        ["remove_sealed"] = true
    })
    local v78 = p77.pet_inventory_item
    v78.properties.sealed_colors = nil
    v78:mark_updated()
    p77.properties.are_colors_sealed = false
    p77:mark_updated()
    p77.timed_flag_manager:remove_flag("colored_hair_spray")
    return true
end
return v_u_6