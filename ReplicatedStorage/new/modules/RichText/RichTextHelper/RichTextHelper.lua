--// ReplicatedStorage.new.modules.RichText.RichTextHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_2 = {
    { "&", "&amp;" },
    { "<", "&lt;" },
    { ">", "&gt;" },
    { "\"", "&quot;" },
    { "\'", "&apos;" }
}
local v_u_3 = {}
local function v_u_16(p4, p5)
    local v6 = nil
    local v7 = {}
    for _, v12 in string.split(p4, "\n") do
        local v9 = "default"
        local v10 = nil
        for _, v11 in p5 do
            if v11.block_type then
                local v12, v13 = v12:gsub(v11.capture, v11.transform or "%1")
                if v13 > 0 then
                    v9 = v11.block_type
                    v10 = v11.transform_block or nil
                    break
                end
            end
        end
        if v6 and v9 == v6.type then
            v6.text = ("%*\n%*"):format(v6.text, v12)
        else
            if v6 and v6.type ~= "ignore" then
                table.insert(v7, v6)
            end
            v6 = {
                ["text"] = v12,
                ["type"] = v9,
                ["transform_block"] = v10 or nil
            }
        end
    end
    if v6 and v6.type ~= "ignore" then
        table.insert(v7, v6)
    end
    for _, v14 in v7 do
        if v14.transform_block then
            v14.transform_block(v14)
        elseif v14.type ~= "default" then
            local v15 = v_u_16(v14.text, p5)
            if #v15 > 1 or v15[1].type ~= nil then
                v14.blocks = v15
                v14.text = ""
            end
        end
    end
    return v7
end
local function v_u_34(p17, p18, p19, p20)
    if p17.blocks then
        for _, v21 in p17.blocks do
            v_u_34(v21, p18, p19, p20)
        end
    end
    if p17.text then
        for _, v22 in v_u_2 do
            p17.text = p17.text:gsub(v22[1], v22[2])
        end
        local v23 = 0
        local v24 = 0
        local v25 = {}
        local v26 = {}
        for _, v27 in string.split(p17.text, "\n") do
            local v28 = v27
            local v29 = false
            for _, v30 in p19 do
                if v27:find(v30.capture) then
                    v29 = true
                end
            end
            local v31 = select(2, v27:find("^%s+")) or 0
            if v23 < v31 and v29 then
                v24 = v24 + 1
                v25[v24] = v31
            end
            if v31 < (v25[v24] or v23) then
                if v29 then
                    v25[v24] = nil
                    local v32 = table.find(v25, v31) or v24 - 1
                    v24 = math.max(0, v32)
                    if v24 > 0 then
                        v25[v24] = v31
                    end
                else
                    v24 = 0
                    v25 = {}
                end
            end
            if v24 > 0 then
                v28 = v28:gsub("^%s*", string.rep("\t", v24))
            end
            local v33 = v_u_3.convert_line(v28, p18, p20)
            table.insert(v26, v33)
            v23 = v31
        end
        p17.text = table.concat(v26, "\n")
    end
end
function v_u_3.convert_line(p35, p36, p37)
    for _, v38 in p36 do
        if v38.transform then
            p35 = p35:gsub(v38.capture, v38.transform)
        end
        if v38.rule_name and p37[v38.rule_name] then
            p35 = p35:gsub(v38.capture, p37[v38.rule_name])
        end
    end
    return p35
end
function v_u_3.convert(p39, p40, p41)
    local v43 = v_u_1.Dictionary.filter(p40, function(p42)
        return p42.block_type or false
    end)
    local v45 = v_u_1.Dictionary.filter(p40, function(p44)
        return p44.can_adjust_indentation or false
    end)
    local v46 = v_u_16(p39, v43)
    for _, v47 in v46 do
        v_u_34(v47, p40, v45, p41)
    end
    return v46
end
return v_u_3