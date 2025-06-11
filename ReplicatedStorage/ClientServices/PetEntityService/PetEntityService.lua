--// ReplicatedStorage.ClientServices.PetEntityService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("PetEntityManager")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = v1("package:Promise")
local v_u_6 = v1("CharWrapperClient")
local v_u_7 = v1("EquippedPets")
local v_u_8 = v1("RouterClient")
local v_u_9 = game:GetService("Players")
return {
    ["init"] = function()
        v_u_3.start()
        v_u_6.register_pet_wrapper_char_changed(function(_, p_u_10, p_u_11)
            v_u_5.try(function()
                for _, v12 in p_u_11 do
                    if v12 and not v_u_7.is_wrapper_equipped(v12) then
                        v_u_3.remove_pet_entity_by_char(v12.char)
                    end
                end
                for _, v13 in p_u_10 do
                    local v14 = v13.char
                    local v15 = v_u_2.pets[v13.pet_id]
                    v_u_3.create_pet_entity(v14, v15)
                    if v13.entity_controller == v_u_9.LocalPlayer then
                        local v16 = v_u_9.LocalPlayer.Character
                        local v17
                        if v16 then
                            v17 = v16:FindFirstChild("HumanoidRootPart")
                        else
                            v17 = v16
                        end
                        if v16 then
                            v16 = v16:FindFirstChild("Humanoid")
                        end
                        if v16 then
                            v16 = v16.HipHeight
                        end
                        if v17 then
                            v17 = v17.CFrame
                        end
                        local v18 = v14:FindFirstChild("Head")
                        if v18.Anchored and v18:GetAttribute("SpawnAnchored") then
                            v18.Anchored = false
                            v_u_8.get("PetAPI/UnanchorPetPostSpawn"):FireServer(v14)
                        end
                        if v17 and not v14:GetAttribute("HasSpawnCFrame") then
                            local v19 = v_u_4.get_teleport_location(v14, v17)
                            v14:SetPrimaryPartCFrame(CFrame.new(v19) * CFrame.new(0, -(v16 or 0), 0))
                        else
                            v14:GetAttribute("HasSpawnCFrame", nil)
                        end
                    end
                end
            end):catch(function(p20)
                if not tostring(p20):find("Character left the game during initialization") then
                    warn("PetEntity spawn failure:\n" .. tostring(p20))
                end
            end)
        end)
    end
}