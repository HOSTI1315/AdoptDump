--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.RigidConstraintMover (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("SimpleEvents")
return {
    ["optimization_prioritize"] = "near",
    ["setup"] = function(p_u_2)
        local v3 = p_u_2.base.pet_model
        p_u_2.mock_parts = {
            ["attachments"] = {}
        }
        local v_u_5 = v_u_1.foreach_descendant_including_new(v3, function(p4)
            if p4:IsA("RigidConstraint") and (p4.Attachment0.Parent:IsA("Bone") and (p4.Attachment1.Parent:IsA("BasePart") and p4.Name ~= "StateConnection")) then
                p4.Enabled = false
                p4.Parent.Anchored = true
                p_u_2.mock_parts.attachments[p4] = {
                    ["part"] = p4.Parent,
                    ["source"] = p4.Attachment0,
                    ["offset"] = p4.Attachment1.CFrame:Inverse()
                }
            end
        end)
        function p_u_2.mock_parts.cleanup()
            v_u_5:Disconnect()
            for v6, v7 in p_u_2.mock_parts.attachments do
                v7.part.Anchored = false
                v6.Enabled = true
            end
        end
    end,
    ["cleanup"] = function(p8)
        if p8.mock_parts.cleanup then
            p8.mock_parts.cleanup()
        end
    end,
    ["step"] = function(p9, _)
        for _, v10 in p9.mock_parts.attachments do
            local v11 = v10.source.WorldCFrame
            v10.part.CFrame = v11 * v10.offset
        end
    end
}