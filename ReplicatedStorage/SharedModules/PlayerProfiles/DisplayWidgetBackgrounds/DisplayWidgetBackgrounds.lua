--// ReplicatedStorage.SharedModules.PlayerProfiles.DisplayWidgetBackgrounds (ModuleScript)

local v_u_1 = {}
local v_u_2 = {
    {
        ["name"] = "flowers",
        ["image"] = "rbxassetid://16199324602"
    },
    {
        ["name"] = "fire",
        ["image"] = "rbxassetid://16199324493"
    },
    {
        ["name"] = "graveyard",
        ["image"] = "rbxassetid://16199324755"
    },
    {
        ["name"] = "ice",
        ["image"] = "rbxassetid://16199324827"
    },
    {
        ["name"] = "lunar",
        ["image"] = "rbxassetid://16199324917"
    },
    {
        ["name"] = "pond",
        ["image"] = "rbxassetid://16199324997"
    },
    {
        ["name"] = "red_dots",
        ["image"] = "rbxassetid://16199354643"
    },
    {
        ["name"] = "snowy",
        ["image"] = "rbxassetid://16199354770"
    },
    {
        ["name"] = "space",
        ["image"] = "rbxassetid://16199341035"
    },
    {
        ["name"] = "beach",
        ["image"] = "rbxassetid://17579956011"
    },
    {
        ["name"] = "fireplace",
        ["image"] = "rbxassetid://17579956321"
    },
    {
        ["name"] = "fire_forest",
        ["image"] = "rbxassetid://17579956162"
    },
    {
        ["name"] = "flowers2",
        ["image"] = "rbxassetid://17579956400"
    },
    {
        ["name"] = "ice2",
        ["image"] = "rbxassetid://17579956481"
    },
    {
        ["name"] = "jungle",
        ["image"] = "rbxassetid://17579956644"
    },
    {
        ["name"] = "meteor",
        ["image"] = "rbxassetid://17579975231"
    },
    {
        ["name"] = "stable",
        ["image"] = "rbxassetid://17579975341"
    },
    {
        ["name"] = "underwater",
        ["image"] = "rbxassetid://17579975529"
    }
}
v_u_1.count = #v_u_2
v_u_1.preloaded = false
local v_u_3 = {}
for v4, v5 in v_u_2 do
    v5.index = v4
    v_u_3[v5.name] = v5
end
function v_u_1.get_background_info_from_name(p6)
    return v_u_3[p6]
end
function v_u_1.get_background_info_from_index(p7)
    if p7 then
        return v_u_2[p7]
    end
end
function v_u_1.get_count()
    return v_u_1.count
end
function v_u_1.preload()
    if not v_u_1.preloaded then
        v_u_1.preloaded = true
        task.spawn(function()
            local v8 = {}
            for _, v9 in v_u_2 do
                local v10 = v9.image
                table.insert(v8, v10)
            end
            game:GetService("ContentProvider"):PreloadAsync(v8)
        end)
    end
end
return v_u_1