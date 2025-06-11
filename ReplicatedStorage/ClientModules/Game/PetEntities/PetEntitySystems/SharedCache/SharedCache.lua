--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.SharedCache (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("CharacterScale")
local v_u_2 = game:GetService("Players")
return {
    ["setup"] = function(p_u_3)
        local v_u_4 = p_u_3.shared_cache
        local function v_u_12(p5, p_u_6, p_u_7)
            local function v9(p8)
                if p8 and p8.Name == p_u_6 then
                    v_u_4[p_u_6] = p8
                    if p_u_7 then
                        p_u_7(p8)
                    end
                end
            end
            local v10 = p5:FindFirstChild(p_u_6)
            if v10 and v10.Name == p_u_6 then
                v_u_4[p_u_6] = v10
                if p_u_7 then
                    p_u_7(v10)
                end
            end
            p5.ChildAdded:Connect(v9)
            p5.ChildRemoved:Connect(function(p11)
                if p11.Name == p_u_6 and v_u_4[p_u_6] == p11 then
                    v_u_4[p_u_6] = nil
                end
            end)
        end
        v_u_12(p_u_3.base.char, "Wings")
        v_u_12(p_u_3.base.pet_model, "temp_wings_equipped")
        v_u_12(p_u_3.base.pet_model, "AnimationController", function(p13)
            v_u_12(p13, "Animator")
        end)
        local function v16()
            v_u_4.WorldRoot = p_u_3.base.char:FindFirstAncestorWhichIsA("WorldRoot")
            local v14 = p_u_3
            local v15
            if v_u_4.WorldRoot == nil then
                v15 = false
            else
                v15 = v_u_4.WorldRoot == workspace and true or (p_u_3.base.char:IsDescendantOf(workspace) or p_u_3.base.char:IsDescendantOf(v_u_2.LocalPlayer.PlayerGui))
            end
            v14.visible = v15
            p_u_3.in_game = p_u_3.base.char:IsDescendantOf(game) or p_u_3.base.root:IsDescendantOf(game)
        end
        p_u_3.base.char.AncestryChanged:Connect(v16)
        v16()
        v_u_4.humanoid_state = p_u_3.base.humanoid:GetState()
        p_u_3.base.humanoid.StateChanged:Connect(function(_, p17)
            v_u_4.humanoid_state = p17
        end)
        v_u_4.char_transparency_attribute = p_u_3.base.char:GetAttribute("Transparency")
        p_u_3.base.char:GetAttributeChangedSignal("Transparency"):Connect(function()
            v_u_4.char_transparency_attribute = p_u_3.base.char:GetAttribute("Transparency")
        end)
        v_u_1.cache_scale_param(p_u_3.base.char, "scale")
    end,
    ["step"] = function() end
}