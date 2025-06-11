--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameAboveCharStack (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIManager")
local v3 = v1("Class")
local v4 = v1("package:t")
local v_u_5 = v4.strictInterface({
    ["component_ids"] = v4.array(v4.string),
    ["reconcile"] = v4.callback
})
local v6 = v3("MinigameAboveCharStack")
function v6.__init(p7, p8)
    local v9 = v_u_5
    assert(v9(p8))
    p7.component_ids = p8.component_ids
    p7.reconcile = p8.reconcile
    p7.destroyed = false
    p7:_force_refresh_all()
end
function v6.refresh(_, p10)
    if p10.Character then
        v_u_2.apps.PlayerNameApp:_refresh_above_char_stack(p10.Character)
    end
end
function v6._on_refresh(p_u_11, p_u_12, p13)
    if not p_u_11.destroyed then
        for _, v_u_14 in p_u_11.component_ids do
            p13(v_u_14, v_u_14 .. p_u_12.UserId, function(p15)
                p_u_11.reconcile(p_u_12, p15, v_u_14)
            end)
        end
    end
end
function v6._force_refresh_all(p16)
    for _, v17 in game.Players:GetPlayers() do
        p16:refresh(v17)
    end
end
function v6.destroy(p18)
    p18.destroyed = true
    p18:_force_refresh_all()
end
return v6