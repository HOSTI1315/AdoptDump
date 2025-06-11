--// ReplicatedStorage.ClientModules.Utilities.Graph (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("Debug").create_log()
local v5 = v2("Graph")
function v5.__init(p6, p7)
    p6.connections_list = p7
    p6.additional_connections_list = {}
    p6.cached_searches = {}
    p6.cache_size = 0
end
local function v_u_16(p8, p9, p10, p11)
    p11[p9] = true
    if p9 == p10 then
        return { p10 }
    end
    local v12 = p8.connections_list[p9] or {}
    local v13 = p8.additional_connections_list[p9]
    if v13 then
        v12 = v_u_3.combine(v12, v13)
    end
    for _, v14 in pairs(v12) do
        if not p11[v14] then
            local v15 = v_u_16(p8, v14, p10, p11)
            if v15 then
                table.insert(v15, 1, p9)
                return v15
            end
        end
    end
end
function v5.get_cached_value(p17, p18)
    if p17.cache_size <= 5 then
        return p17.cached_searches[p18]
    end
    p17:invalidate_cache()
end
function v5.depth_first_search(p19, p20, p21)
    local v22 = p19:get_cached_value(p20 .. "/" .. p21)
    if v22 then
        return v22
    end
    v_u_4("Starting full Depth First Search")
    local v23 = v_u_16(p19, p20, p21, {})
    p19.cached_searches[p20 .. "/" .. p21] = v23
    p19.cache_size = p19.cache_size + 1
    return v23
end
function v5.set_additional_connections_list(p24, p25)
    p24.additional_connections_list = p25
    if p24.cache_size > 0 then
        p24:invalidate_cache()
    end
end
function v5.invalidate_cache(p26)
    v_u_4("Cache being invalidated")
    p26.cached_searches = {}
    p26.cache_size = 0
end
return v5