--// ReplicatedStorage.new.modules.Utilities.TextUtil (ModuleScript)

local v_u_1 = game:GetService("TextService")
local v_u_2 = {}
local function v_u_7(p3)
    local v4 = p3.Instance
    if not v4 then
        return p3
    end
    local v5 = {
        ["FontFace"] = v4.FontFace,
        ["FontSize"] = v4.TextSize,
        ["Text"] = p3.Text or v4.Text
    }
    local v6
    if p3.ContainerWidth == true then
        v6 = v4.AbsoluteSize.X
    else
        v6 = p3.ContainerWidth
    end
    v5.ContainerWidth = v6
    return v5
end
v_u_2.REVERSE_FONT_MAP = {
    ["rbxasset://fonts/families/AccanthisADFStd.json"] = Enum.Font.Bodoni,
    ["rbxasset://fonts/families/AmaticSC.json"] = Enum.Font.AmaticSC,
    ["rbxasset://fonts/families/Arial.json"] = Enum.Font.Arial,
    ["rbxasset://fonts/families/Arimo.json"] = Enum.Font.Arimo,
    ["rbxasset://fonts/families/Balthazar.json"] = Enum.Font.Fantasy,
    ["rbxasset://fonts/families/Bangers.json"] = Enum.Font.Bangers,
    ["rbxasset://fonts/families/BuilderSans.json"] = Enum.Font.BuilderSans,
    ["rbxasset://fonts/families/ComicNeueAngular.json"] = Enum.Font.Cartoon,
    ["rbxasset://fonts/families/Creepster.json"] = Enum.Font.Creepster,
    ["rbxasset://fonts/families/DenkOne.json"] = Enum.Font.DenkOne,
    ["rbxasset://fonts/families/Fondamento.json"] = Enum.Font.Fondamento,
    ["rbxasset://fonts/families/FredokaOne.json"] = Enum.Font.FredokaOne,
    ["rbxasset://fonts/families/GothamSSm.json"] = Enum.Font.Gotham,
    ["rbxasset://fonts/families/GrenzeGotisch.json"] = Enum.Font.GrenzeGotisch,
    ["rbxasset://fonts/families/Guru.json"] = Enum.Font.Garamond,
    ["rbxasset://fonts/families/HighwayGothic.json"] = Enum.Font.Highway,
    ["rbxasset://fonts/families/Inconsolata.json"] = Enum.Font.Code,
    ["rbxasset://fonts/families/IndieFlower.json"] = Enum.Font.IndieFlower,
    ["rbxasset://fonts/families/JosefinSans.json"] = Enum.Font.JosefinSans,
    ["rbxasset://fonts/families/Jura.json"] = Enum.Font.Jura,
    ["rbxasset://fonts/families/Kalam.json"] = Enum.Font.Kalam,
    ["rbxasset://fonts/families/LegacyArial.json"] = Enum.Font.Legacy,
    ["rbxasset://fonts/families/LuckiestGuy.json"] = Enum.Font.LuckiestGuy,
    ["rbxasset://fonts/families/Merriweather.json"] = Enum.Font.Merriweather,
    ["rbxasset://fonts/families/Michroma.json"] = Enum.Font.Michroma,
    ["rbxasset://fonts/families/Nunito.json"] = Enum.Font.Nunito,
    ["rbxasset://fonts/families/Oswald.json"] = Enum.Font.Oswald,
    ["rbxasset://fonts/families/PatrickHand.json"] = Enum.Font.PatrickHand,
    ["rbxasset://fonts/families/PermanentMarker.json"] = Enum.Font.PermanentMarker,
    ["rbxasset://fonts/families/PressStart2P.json"] = Enum.Font.Arcade,
    ["rbxasset://fonts/families/Roboto.json"] = Enum.Font.Roboto,
    ["rbxasset://fonts/families/RobotoCondensed.json"] = Enum.Font.RobotoCondensed,
    ["rbxasset://fonts/families/RobotoMono.json"] = Enum.Font.RobotoMono,
    ["rbxasset://fonts/families/RomanAntique.json"] = Enum.Font.Antique,
    ["rbxasset://fonts/families/Sarpanch.json"] = Enum.Font.Sarpanch,
    ["rbxasset://fonts/families/SourceSansPro.json"] = Enum.Font.SourceSans,
    ["rbxasset://fonts/families/SpecialElite.json"] = Enum.Font.SpecialElite,
    ["rbxasset://fonts/families/TitilliumWeb.json"] = Enum.Font.TitilliumWeb,
    ["rbxasset://fonts/families/Ubuntu.json"] = Enum.Font.Ubuntu,
    ["rbxasset://fonts/families/Zekton.json"] = Enum.Font.SciFi
}
function v_u_2.safe_get_text_bounds(p8)
    local v9 = v_u_7(p8)
    local v10 = v9.ContainerWidth or (1 / 0)
    local v11 = Instance.new("GetTextBoundsParams")
    v11.Font = v9.FontFace
    v11.Size = v9.FontSize
    v11.Text = v9.Text
    v11.Width = v10
    local v12, v13 = pcall(v_u_1.GetTextBoundsAsync, v_u_1, v11)
    if v12 then
        return v13
    end
    warn((("TextService:GetTextBoundsAsync() failed due to \'%*\', falling back to TextService:GetTextSize()"):format(v13)))
    local v14 = v_u_2.REVERSE_FONT_MAP[v9.FontFace.Family] or Enum.Font.SourceSans
    return v_u_1:GetTextSize(v9.Text, v9.FontSize, v14, Vector2.new(v10, (1 / 0)))
end
function v_u_2.on_text_bounds(p15, p_u_16)
    local v_u_17 = v_u_7(p15)
    local v_u_18 = false
    local v_u_19 = nil
    local v_u_20 = nil
    task.spawn(function()
        v_u_20 = v_u_2.safe_get_text_bounds(v_u_17)
        if v_u_18 then
            return
        elseif not v_u_19 or v_u_20 ~= v_u_19 then
            p_u_16(v_u_20)
        end
    end)
    if v_u_20 == nil then
        local v21 = v_u_17.ContainerWidth or (1 / 0)
        local v22 = p15.FallbackFont or (v_u_2.REVERSE_FONT_MAP[v_u_17.FontFace.Family] or Enum.Font.SourceSans)
        v_u_19 = v_u_1:GetTextSize(v_u_17.Text, p15.FallbackFontSize or v_u_17.FontSize, v22, Vector2.new(v21, (1 / 0)))
        task.spawn(function()
            p_u_16(v_u_19)
        end)
    end
    return function()
        v_u_18 = true
    end
end
function v_u_2.on_text_bounds_multi(p23, p_u_24)
    local v_u_25 = {}
    local v26 = false
    local v27 = false
    local v_u_28 = v27
    local v_u_29 = v26
    local v_u_30 = {}
    local v_u_31 = false
    for v_u_32, v33 in p23 do
        local v34 = v_u_2.on_text_bounds
        table.insert(v_u_30, v34(v33, function(p35)
            v_u_25[v_u_32] = p35
            if v_u_31 then
                if not v_u_29 then
                    if v_u_28 then
                        return
                    end
                    v_u_29 = true
                    task.defer(function()
                        v_u_29 = false
                        p_u_24(v_u_25)
                    end)
                end
            end
        end))
    end
    task.spawn(p_u_24, v_u_25)
    return function()
        if not v_u_28 then
            v_u_28 = true
            for _, v36 in v_u_30 do
                v36()
            end
        end
    end
end
return v_u_2