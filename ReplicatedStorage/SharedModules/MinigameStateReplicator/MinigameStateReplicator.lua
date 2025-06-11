--// ReplicatedStorage.SharedModules.MinigameStateReplicator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")
local v_u_4 = v1("package:t")
local v_u_5 = v1("package:Sift")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("HttpService")
local v_u_8 = {
    ["string"] = "StringValue",
    ["boolean"] = "BoolValue",
    ["number"] = "NumberValue"
}
local v_u_9 = v_u_5.List.toSet(v_u_5.Dictionary.values(v_u_8))
local function v_u_18(p10, p11)
    local v12 = Instance.new("Folder")
    v12.Name = p10
    for v13, v14 in pairs(p11) do
        local v15 = typeof(v14)
        if v15 == "table" then
            v_u_18(v13, v14).Parent = v12
        else
            local v16 = v_u_8[v15]
            assert(v16, "Unsupported type passed when creating MinigameStateReplicator.")
            local v17 = Instance.new(v16)
            v17.Value = v14
            v17.Name = v13
            v17.Parent = v12
        end
    end
    return v12
end
local v_u_19 = v3("MinigameStateReplicator")
function v_u_19.__init(p20, p21)
    p20.folder = p21
end
function v_u_19.create(p22, p23)
    local v24 = v_u_18(p22, p23)
    v24.Parent = workspace.StaticMap
    return v_u_19.new(v24)
end
function v_u_19.destroy(p25)
    if p25.folder then
        p25.folder:Destroy()
    end
end
function v_u_19._get_property_instance(p26, p27, p28)
    local v29 = p26.folder
    local v30 = typeof(p27) ~= "table" and { p27 } or p27
    for _, v31 in ipairs(v30) do
        v29 = v29:FindFirstChild(v31)
        if not v29 then
            if p28 then
                return nil
            end
            local v32 = typeof(p27) == "string" and p27 and p27 or table.concat(p27, ".")
            error(("Attempt to index non-existent property instance [%s]"):format(v32))
        end
    end
    return v29
end
function v_u_19._get_path_from_instance(p33, p34)
    local v35 = p34:IsDescendantOf(p33.folder)
    local v36 = p33.folder.Name
    assert(v35, ("Passed instance is not a child of %s"):format(v36))
    local v37 = { p34 }
    while p34 ~= p33.folder do
        p34 = p34.Parent
        table.insert(v37, p34)
    end
    local v38 = {}
    for v39 = #v37 - 1, 1, -1 do
        local v40 = v37[v39].Name
        table.insert(v38, v40)
    end
    return v38
end
v_u_19.DEFAULT_MINIGAME_STATE = {
    ["is_game_active"] = false,
    ["players_loading"] = false,
    ["zone_override_text"] = "",
    ["zone_override_timestamp"] = -1,
    ["player_user_ids"] = ""
}
function v_u_19.get_as_json(p41, p42)
    local v43 = p41:get(p42)
    local v44 = typeof(v43) == "string"
    assert(v44, "Cannot convert non-string to table.")
    return v_u_7:JSONDecode(v43)
end
function v_u_19.get_as_table(p45, p46, p47)
    local v48 = p45:get(p46)
    local v49 = typeof(v48) == "string"
    assert(v49, "Cannot convert non-string to table.")
    return v48 == "" and {} or string.split(v48, p47 or ",")
end
function v_u_19.get(p50, p51)
    local v52 = p50:_get_property_instance(p51)
    if v_u_9[v52.ClassName] then
        return v52.Value
    end
    if not v52:IsA("Folder") then
        error("Attempt to get value of unsupported instance [%s]"):format(v52.ClassName)
    end
    local v53 = {}
    for _, v54 in ipairs(v52:GetDescendants()) do
        if not v54:IsA("Folder") then
            local v55 = p50:_get_path_from_instance(v54)
            local v56 = v53
            for v57 = 1, #v55 - 1 do
                local v58 = v55[v57]
                if not v53[v58] then
                    v53[v58] = {}
                end
                v53 = v53[v58]
            end
            v53[v55[#v55]] = p50:get(v55)
            v53 = v56
        end
    end
    local v59 = p50:_get_path_from_instance(v52)
    for _, v60 in ipairs(v59) do
        v53 = v53[v60]
    end
    return v53
end
function v_u_19.exists(p61, p62)
    local v63 = p61:_get_property_instance(p62, true)
    if v63 == nil then
        return false
    else
        return (not v_u_4.string(v63.Value) or v63.Value ~= "") and true or false
    end
end
function v_u_19.set_as_json(p64, p65, p66)
    p64:set(p65, (v_u_7:JSONEncode(p66)))
end
function v_u_19.set_as_table(p67, p68, p69, p70)
    if typeof(p69) == "table" then
        p69 = table.concat(p69, p70 or ",")
    end
    p67:set(p68, p69)
end
function v_u_19.set(p71, p72, p73)
    local v74 = v_u_6:IsServer()
    assert(v74, "This API can only be called on the server.")
    local v75 = p71:_get_property_instance(p72)
    if not v_u_9[v75.ClassName] then
        error("Attempt to set value of unsupported instance [%s]"):format(v75.ClassName)
    end
    v75.Value = p73
end
function v_u_19.set_multiple(p76, p77)
    local v78 = {
        {
            ["kv"] = p77,
            ["prev_path"] = {}
        }
    }
    local v79 = {}
    while #v78 > 0 do
        local v80 = table.remove(v78)
        for v81, v82 in pairs(v80.kv) do
            local v83 = v_u_5.List.concat(v80.prev_path, { v81 })
            if typeof(v82) == "table" then
                table.insert(v78, {
                    ["kv"] = v82,
                    ["prev_path"] = v83
                })
            else
                table.insert(v79, {
                    ["path"] = v83,
                    ["value"] = v82
                })
            end
        end
    end
    for _, v84 in ipairs(v79) do
        p76:set(v84.path, v84.value)
    end
end
function v_u_19.get_property_changed_signal(p85, p86)
    local v87 = p85:_get_property_instance(p86)
    if not v_u_9[v87.ClassName] then
        error(("Attempt to set value of unsupported instance [%s]"):format(v87.ClassName))
    end
    return v87.Changed
end
function v_u_19.create_properties_changed_signal(p88, ...)
    local v_u_89 = v_u_2.new()
    local v90 = {}
    for _, v91 in ipairs({ ... }) do
        local v92 = p88:_get_property_instance(v91)
        if v92:IsA("Folder") then
            for _, v93 in ipairs(v92:GetDescendants()) do
                if not v93:IsA("Folder") then
                    v90[v93] = true
                end
            end
        else
            v90[v92] = true
        end
    end
    local v94 = {}
    for v95, _ in pairs(v90) do
        local v96 = {
            ["instance"] = v95,
            ["path"] = p88:_get_path_from_instance(v95)
        }
        table.insert(v94, v96)
    end
    for _, v_u_97 in ipairs(v94) do
        p88:get_property_changed_signal(v_u_97.path):Connect(function(p98)
            v_u_89:Fire(v_u_97.instance, p98)
        end)
    end
    return v_u_89
end
return v_u_19