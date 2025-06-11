--// ReplicatedStorage.ClientModules.Game.Tutorial.PracticeDogHider (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("AvatarClientManager")
local v_u_3 = v_u_1("ClientToolManager")
local v_u_4 = v_u_1("ClientData")
local v_u_5 = v_u_1("InventoryDB")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = {
    ["category"] = "pets",
    ["kind"] = "practice_dog"
}
local v8 = {}
local v_u_9 = {}
local v_u_10 = false
local v_u_11 = false
local function v_u_19()
    local v12 = v_u_1("UIManager")
    v_u_10 = v_u_11
    local v13 = v_u_4.get("pet_saved_worn_items")
    local v14 = v13 and v13.wearing_lists or {}
    for v15, v16 in (v_u_4.get("inventory") or {})[v_u_7.category] or {} do
        if v_u_10 and v_u_9[v15] then
            v12.apps.BackpackApp:set_item_unique_hidden(v15, "practice_dog")
            if v_u_3.is_equipped(v16) then
                task.spawn(v_u_3.unequip, v16)
            end
            for _, v17 in v14[v15] or {} do
                for _, v18 in v17 do
                    task.spawn(v_u_2.take_off, "pet", "all", v18)
                end
            end
        else
            v12.apps.BackpackApp:remove_item_unique_hidden(v15, "practice_dog")
        end
    end
end
function v8.is_hidden()
    return v_u_10
end
function v8.init()
    local v_u_20 = v_u_6.resolve()
    v_u_4.register_callback_plus_existing("inventory", function(_, p_u_21)
        v_u_20:cancel()
        v_u_20 = v_u_6.defer(function(p22)
            p22()
        end):andThen(function()
            v_u_9 = {}
            p_u_21 = p_u_21 or {}
            local v23 = 0
            local v24 = 0
            for _, v25 in p_u_21[v_u_7.category] or {} do
                if not v_u_5[v_u_7.category][v25.kind].is_hidden_from_backpack then
                    v23 = v23 + 1
                    if v25.kind == v_u_7.kind then
                        v24 = v24 + 1
                        v_u_9[v25.unique] = true
                    end
                end
            end
            v_u_11 = v24 < v23
            v_u_19()
        end)
    end)
end
return v8