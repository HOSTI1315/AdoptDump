--// ReplicatedStorage.new.modules.Ailments.ClientActions.MysteryAilmentClient (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
require(script.Parent.Parent.AilmentTypes)
local v_u_3 = require(script.Parent.Parent.AilmentsClient)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v6 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("RouterClient")
local v_u_8 = v6("UIManager")
local v_u_9 = {}
v_u_9.__index = v_u_9
setmetatable(v_u_9, v2)
function v_u_9.new(p10)
    local v11 = v_u_9
    return setmetatable({
        ["options"] = p10
    }, v11)
end
function v_u_9._get_ailment_slots(p12, p13)
    local v14 = v_u_3.get_ailments_for_pet(p13)
    return p12.options.get_ailment_slots(p12.options.random_seed, v14, p13)
end
function v_u_9.start(p_u_15, p_u_16)
    local v_u_17 = p_u_15:_get_ailment_slots(p_u_16)
    local v18 = v_u_8.apps.FocusPetApp:select_ailment(v_u_17, p_u_15.options.components)
    p_u_15._promise = v_u_4.race({ v_u_4.fromEvent(v_u_3.get_changed_signal(), function()
            return not v_u_5.List.equals(v_u_17, p_u_15:_get_ailment_slots(p_u_16))
        end), v18:andThen(function(_, p19)
            if p19 then
                local v20 = v_u_17[p19]
                if v20 then
                    v_u_7.get("AilmentsAPI/ChooseMysteryAilment"):FireServer(p_u_16.pet_unique, p_u_15.options.ailment_key, p19, v20)
                end
            else
                return
            end
        end) }):done(function()
        v_u_8.apps.FocusPetApp:stop_selecting_ailment()
    end)
    v_u_1.run_promise(p_u_15._promise, { "dialog" })
    local v21 = p_u_15._promise:awaitStatus()
    return v_u_1.get_result_from_status(v21)
end
function v_u_9.stop(p22)
    if p22._promise then
        p22._promise:cancel()
    end
end
return v_u_9