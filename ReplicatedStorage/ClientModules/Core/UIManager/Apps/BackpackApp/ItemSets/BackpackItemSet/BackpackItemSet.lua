--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BackpackApp.ItemSets.BackpackItemSet (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("ClientData")
local v5 = v_u_1("Class")("BackpackBooleanTracker")
function v5.__init(p6, p7, p8, p9)
    p6.key = p7
    p6.should_save = p8
    p6.set = v_u_4.get(p7) or {}
    p6.commited = table.clone(p6.set)
    p6.uncommited = {}
    p6.can_set_member = p9
    p6:_commit()
end
function v5._sanitize_set(p10)
    local v11 = v_u_4.get("inventory") or {}
    for v12, _ in p10.commited do
        local v13 = false
        for _, v14 in pairs(v11) do
            if v14[v12] then
                v13 = true
                break
            end
        end
        if not v13 then
            p10.set[v12] = nil
            p10.uncommited[v12] = false
        end
    end
end
function v5._commit(p15)
    p15:_sanitize_set()
    if p15.should_save and next(p15.uncommited) then
        v_u_2.get("BackpackAPI/CommitBackpackItemSet"):FireServer(p15.key, p15.uncommited)
    end
    p15.commited = table.clone(p15.set)
    p15.uncommited = {}
end
function v5.is_member(p16, p17)
    return p16.set[p17.unique] and true or false
end
function v5.set_member(p18, p19, p20)
    local v21 = p20 and true or false
    local v22 = v_u_3[p19.category][p19.id]
    local v23, v24 = p18.can_set_member(v22, p19)
    if v23 then
        if (p18.commited[p19.unique] and true or false) == v21 then
            p18.uncommited[p19.unique] = nil
        else
            p18.uncommited[p19.unique] = v21
        end
        p18.set[p19.unique] = v21 or nil
        p18:_commit()
    else
        v_u_1("UIManager").apps.HintApp:hint({
            ["text"] = v24 or "You can\'t do that!",
            ["yields"] = false,
            ["overridable"] = true,
            ["length"] = 3
        })
    end
end
function v5.get_set_copy(p25)
    return table.clone(p25.set)
end
return v5