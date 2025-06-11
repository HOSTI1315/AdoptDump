--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ExclusiveStateCalculator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsClient")
local v_u_3 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
v1("PetPerformances")
local v_u_4 = v1("PetReactions")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = {
    ["PetBeingRidden"] = v_u_3.Mounted,
    ["PetBeingFlown"] = v_u_3.Mounted,
    ["BabyBeingHeld"] = v_u_3.Carried,
    ["BabyOnShoulder"] = v_u_3.Carried,
    ["BabyOnStroller"] = v_u_3.Carried,
    ["SitInVehicle"] = v_u_3.Sitting,
    ["UseFurniture"] = v_u_3.Sitting,
    ["SitInClientSeat"] = v_u_3.Sitting,
    ["PetBeingFocused"] = v_u_3.Focused
}
return {
    ["step"] = function(p7)
        if p7.is_npc_pet or not v_u_2.is_relevant_to_local_ailments(p7.base.char_wrapper.player) then
            return
        else
            p7.exclusive_state = nil
            for v8, _ in p7.active_reactions do
                local v9 = v_u_4.reactions[v8]
                if v9.exclusive_state then
                    p7.exclusive_state = v9.exclusive_state
                    return
                end
            end
            if p7.shared_cache.humanoid_state == Enum.HumanoidStateType.Swimming then
                p7.exclusive_state = v_u_3.Swimming
            else
                local v10 = v_u_5.get(p7.base.char)
                if v10 then
                    for _, v11 in ipairs(v10.states) do
                        local v12 = v_u_6[v11.id]
                        if v12 then
                            p7.exclusive_state = v12
                            return
                        end
                    end
                end
            end
        end
    end
}