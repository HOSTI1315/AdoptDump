--// ReplicatedStorage.ClientModules.Game.AvatarEditor.AvatarItemsCache (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("AvatarCategoriesDB")
local v6 = v1("PlatformM")
local v7 = v2("AvatarItemsCache")
local v_u_8 = v6.get_platform() == v6.platform.phone
function v7.__init(p9, p10)
    p9.items = {}
    p9.critical_sections = {}
    p9.results_per_page = p10
end
function v7.download_catalog(p_u_11)
    task.spawn(function()
        for v12, v13 in v_u_5.categories do
            for v14, v15 in v13.subcategories do
                if not v_u_8 or v14 <= 1 then
                    p_u_11:fetch_page(v12, v15, 1)
                    task.wait(0.2)
                end
            end
        end
    end)
end
function v7.fetch_page(p16, p17, p18, p19)
    p16.items[p17] = p16.items[p17] or {}
    p16.items[p17][p18] = p16.items[p17][p18] or {}
    local v20 = p16.items[p17][p18][p19]
    if v_u_3.is(v20) then
        return v20:wait()
    end
    if v20 then
        return v20
    end
    local v21 = v_u_3.new()
    p16.items[p17][p18][p19] = v21
    local v22, v23 = v_u_4.get("AvatarAPI/GetItems"):InvokeServer(p17, p18, p19, p16.results_per_page)
    if v_u_8 then
        if p19 > 1 then
            v23 = false
        end
    elseif p19 > 3 then
        v23 = false
    end
    if v23 then
        p16.items[p17][p18][p19] = v22
    else
        p16.items[p17][p18][p19] = nil
    end
    v21:Fire(v22)
    v21:Destroy()
    return v22
end
return v7