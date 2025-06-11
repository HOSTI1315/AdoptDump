--// ReplicatedStorage.ClientModules.Game.PetEntities.SteppedTaskUtils (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetEntityHelper")
local v3 = v1("package:t")
local v_u_7 = {
    ["wait_for_performance_ended"] = function(p4, p5, p6)
        repeat
            p4:wait_for_step()
        until v_u_2.was_performance_ended(p5, p6)
    end
}
local v_u_8 = v3.strictInterface({
    ["name"] = v3.string,
    ["options"] = v3.optional(v3.table),
    ["manager_reaction_name"] = v3.optional(v3.string),
    ["should_end_performance"] = v3.optional(v3.callback)
})
function v_u_7.run_performance(p9, p10, p11)
    local v12 = v_u_8
    assert(v12(p11))
    if not (p11.should_end_performance and p11.should_end_performance()) then
        v_u_2.stage_performance(p10, p11)
        if p11.should_end_performance then
            while true do
                p9:wait_for_step()
                if v_u_2.was_performance_ended(p10, p11.name) then
                    break
                end
                if p11.should_end_performance() then
                    v_u_2.end_performance(p10, p11.name)
                    return
                end
            end
        else
            v_u_7.wait_for_performance_ended(p9, p10, p11.name)
        end
    end
end
return v_u_7