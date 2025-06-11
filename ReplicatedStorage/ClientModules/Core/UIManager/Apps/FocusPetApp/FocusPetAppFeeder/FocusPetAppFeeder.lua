--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppFeeder (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("PetPerformanceName")
local v_u_5 = v_u_1("PetReactionName")
local v_u_6 = v_u_1("package:Promise")
local v_u_7 = v_u_1("package:Sift")
local v8 = v2("FocusPetAppFeeder", v_u_1("UIBaseElement"))
function v8.feed_pet(p_u_9, p_u_10, p_u_11)
    local v_u_12 = v_u_1("PetActions")
    local v_u_13 = v_u_1("PetEntityHelper")
    local v_u_14 = v_u_1("PetEntityManager").get_pet_entity(p_u_10.char)
    return v_u_6.try(function()
        local v15, v16 = v_u_12.feed_pet(p_u_10, {
            ["item"] = p_u_11,
            ["spawn_cframe"] = p_u_10.char.HumanoidRootPart.CFrame * CFrame.new(0, 1, -2) * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), 1.5707963267948966)
        })
        return v15, v16
    end):andThen(function(p17, p18)
        if not (p17 and p18) then
            return v_u_6.resolve()
        end
        local v19 = v_u_3[p_u_11.category][p_u_11.kind].ailment_to_boost
        if v19 then
            p_u_9:_render_mock_ailment(v19)
        end
        p_u_9.UIManager.apps.FocusPetApp:hide_ui()
        return v_u_6.race({ v_u_13.promise_performance_ended(v_u_14, v_u_4.Eat), v_u_6.fromEvent(p18.AncestryChanged, function(_, p20)
                return p20 == nil
            end), p_u_9:_update_feeding(v_u_14) }):finally(function()
            p_u_9:_delete_mock_ailment()
        end)
    end)
end
function v8.done_eating_promise(_, p21)
    local v22 = v_u_1("PetEntityHelper")
    local v23
    if v22.has_performance(p21, v_u_4.Eat) then
        v23 = v22.promise_performance_ended(p21, v_u_4.Eat)
    else
        v23 = v_u_6.resolve()
    end
    local v24
    if v22.has_reaction(p21, v_u_5.EatReaction) then
        v24 = v22.promise_reaction_ended(p21, v_u_5.EatReaction)
    else
        v24 = v_u_6.resolve()
    end
    return v_u_6.all({ v23, v24 })
end
function v8._render_mock_ailment(p25, p_u_26)
    p25:_delete_mock_ailment()
    local v27 = p25.UIManager.apps.FocusPetApp
    local v28 = v27.ailments.ailments_list
    local v30 = v_u_7.List.findWhere(v28, function(p29)
        if p29 then
            p29 = p29.kind == p_u_26
        end
        return p29
    end)
    if v30 then
        p25.mock_ailment = v_u_1("new:ClientAilment").new(game.Players.LocalPlayer, {
            ["components"] = {},
            ["created_timestamp"] = 0,
            ["kind"] = p_u_26,
            ["progress"] = 0,
            ["rate"] = 0,
            ["rate_timestamp"] = -1,
            ["sort_order"] = 0
        })
        p25.UIManager.apps.FocusPetApp.mock_ailment:update_ailment(p25.mock_ailment)
        v27.mock_ailment:set_slot(v30)
        v27.mock_ailment:show()
    end
end
function v8._update_mock_ailment(p31, p32)
    if p31.mock_ailment then
        local v33 = workspace:GetServerTimeNow()
        local v34 = 1 / (p32 - v33)
        p31.mock_ailment.rate_timestamp = v33
        p31.mock_ailment.rate = v34
        p31.UIManager.apps.FocusPetApp.mock_ailment:update_ailment(p31.mock_ailment)
    end
end
function v8._delete_mock_ailment(p35)
    if p35.mock_ailment then
        p35.UIManager.apps.FocusPetApp.mock_ailment:update_ailment(nil)
        p35.mock_ailment:destroy()
        p35.mock_ailment = nil
    end
end
function v8._update_feeding(p_u_36, p_u_37)
    return v_u_6.new(function(_, _, p38)
        while not p38() do
            local v39 = p_u_37.active_performances.Eat
            local v40 = v39 and v39.state
            if v40 then
                v40 = v39.state.finish_eating_timestamp
            end
            if v40 then
                p_u_36:_update_mock_ailment(v40)
                return
            end
            task.wait()
        end
    end)
end
function v8.start(p41)
    p41.hungry_mock = nil
end
return v8