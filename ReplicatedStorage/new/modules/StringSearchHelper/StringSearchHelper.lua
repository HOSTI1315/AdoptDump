--// ReplicatedStorage.new.modules.StringSearchHelper (ModuleScript)

return {
    ["score"] = function(p1, p2)
        local v3 = p1:lower()
        local v4 = {}
        for v5 in string.gmatch(v3, "[^%s]+") do
            table.insert(v4, v5)
        end
        local v6 = p2:lower()
        local v7 = {}
        for v8 in string.gmatch(v6, "[^%s]+") do
            table.insert(v7, v8)
        end
        local v9 = table.concat(v7, " ")
        local v10 = 0
        local v11 = 0
        local v12 = (1 / 0)
        local v13 = false
        for v14, v15 in v4 do
            local v16 = string.find(v9, v15, 1, true)
            if v16 then
                local v17 = v14 - 1
                local v18 = bit32.lshift(1, v17)
                v10 = bit32.bor(v18, v10)
                v11 = v11 + 1
                v12 = math.min(v12, v16)
                v13 = true
            end
        end
        return v13 and {
            ["word_hash"] = v10,
            ["word_match_count"] = v11,
            ["min_match_char_depth"] = v12
        } or nil
    end,
    ["compare"] = function(p19, p20)
        return p19.word_match_count == p20.word_match_count and (p19.word_hash == p20.word_hash and (p19.min_match_char_depth == p20.min_match_char_depth and 0 or (p19.min_match_char_depth < p20.min_match_char_depth and 1 or -1)) or (p19.word_hash < p20.word_hash and 1 or -1)) or (p19.word_match_count > p20.word_match_count and 1 or -1)
    end
}