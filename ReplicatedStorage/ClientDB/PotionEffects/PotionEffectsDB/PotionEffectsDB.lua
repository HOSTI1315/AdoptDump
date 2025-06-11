--// ReplicatedStorage.ClientDB.PotionEffects.PotionEffectsDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsClient")
local v_u_3 = v1("AnimationManager")
local v_u_4 = v1("CharWrapperClient")
v1("ClientData")
local v_u_5 = v1("EquippedPets")
local v_u_6 = v1("InteriorsM")
local v_u_7 = v1("Maid")
local v_u_8 = v1("PetActions")
local v_u_9 = v1("PotionEffectsDBHelper")
local v_u_10 = v1("Raycast")
local v_u_11 = v1("RouterClient")
local v_u_12 = v1("ToolDBHelper")
local v_u_13 = v1("UIManager")
local v14 = v1("package:Sift")
local v15 = v1("package:t")
local v_u_16 = game:GetService("UserInputService")
local v_u_17 = game:GetService("ContentProvider")
local v18 = v15.strictInterface({
    ["validate"] = v15.callback,
    ["validation_failed_dialog"] = v15.optional(v15.callback),
    ["pre_consume"] = v15.optional(v15.callback),
    ["consume"] = v15.callback,
    ["post_consume_hint"] = v15.optional(v15.callback),
    ["catch"] = v15.optional(v15.callback)
})
local v65 = {
    ["nograv_potion"] = {
        ["validate"] = function(_, _)
            return true
        end,
        ["consume"] = function(_)
            if workspace.Gravity > 65 then
                workspace.Gravity = 65
            elseif workspace.Gravity > 45 then
                workspace.Gravity = 45
            else
                workspace.Gravity = workspace.Gravity * 0.85
            end
            return true
        end,
        ["post_consume_hint"] = v_u_9.create_post_consume_hint("nograv_potion")
    },
    ["hyperspeed_potion"] = {
        ["validate"] = function(_, _)
            return true
        end,
        ["consume"] = function(_)
            local v19 = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
            if v19 < 21 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v19 + 5
            elseif v19 < 25 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v19 + 4
            else
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v19 + 3
            end
            return true
        end,
        ["post_consume_hint"] = v_u_9.create_post_consume_hint("hyperspeed_potion")
    },
    ["grow_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("GrowPotionCompleted")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("grow_potion"),
        ["consume"] = function(p20)
            return v_u_11.get("EffectsAPI/DrinkGrowPotion"):InvokeServer(p20.item_data.unique)
        end
    },
    ["big_head_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BigHeadPotionCompleted")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("big_head_potion"),
        ["consume"] = function(p21)
            return v_u_11.get("EffectsAPI/DrinkBigHeadPotion"):InvokeServer(p21.item_data.unique)
        end
    },
    ["snowflake_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("SnowflakeEffect")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("snowflake_potion"),
        ["consume"] = function(p22)
            return v_u_11.get("EffectsAPI/DrinkSnowflakePotion"):InvokeServer(p22.item_data.unique)
        end
    },
    ["heart_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("HeartEffect")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("heart_potion"),
        ["consume"] = function(p23)
            return v_u_11.get("EffectsAPI/DrinkHeartPotion"):InvokeServer(p23.item_data.unique)
        end
    },
    ["teleportation_potion"] = {
        ["validate"] = function(_, p24)
            return v_u_13.apps.DialogApp:dialog({
                ["text"] = "Instructions: Drink to teleport to the Nursery or Home (your choice). Uses Left: " .. p24,
                ["left"] = "Cancel",
                ["right"] = "Drink"
            }) == "Drink"
        end,
        ["pre_consume"] = function(p25)
            p25.delay_time = 1
            if v_u_13.apps.DialogApp:dialog({
                ["text"] = "Teleport to Nursery or Home?",
                ["left"] = "Nursery",
                ["right"] = "Home"
            }) == "Nursery" then
                p25.tele_details = {
                    "Nursery",
                    "MainDoor",
                    {
                        ["studs_ahead_of_door"] = 6
                    }
                }
            else
                p25.tele_details = {
                    "housing",
                    "MainDoor",
                    {
                        ["studs_ahead_of_door"] = 6,
                        ["house_owner"] = game.Players.LocalPlayer
                    }
                }
            end
        end,
        ["consume"] = function(p26)
            v_u_13.apps.TransitionsApp:transition({
                ["length"] = 0.5,
                ["start_transparency"] = 1,
                ["end_transparency"] = 0,
                ["yields"] = true
            })
            local v27
            if v_u_9.can_use_potions() then
                local v28 = v_u_6.enter
                local v29 = p26.tele_details
                v28(unpack(v29))
                v27 = true
            else
                v27 = false
            end
            v_u_13.apps.TransitionsApp:transition({
                ["length"] = 0.5,
                ["start_transparency"] = 0,
                ["end_transparency"] = 1,
                ["yields"] = false
            })
            return v27
        end
    },
    ["cure_all_potion"] = {
        ["validate"] = function(p30, _)
            if v_u_13.apps.DialogApp:dialog({
                ["text"] = "Instructions: Drink to cure all needs, such as hunger and boredom",
                ["left"] = "Cancel",
                ["right"] = "Drink"
            }) == "Cancel" then
                return false
            else
                local v31 = #v_u_5.get_my_equipped() <= 0 and "Feed Me" or v_u_12.get_interaction_result_while_tool_equipped({ "Feed Me", "Feed Pet", "Cancel" })
                if v31 == "Feed Me" then
                    local v32 = v_u_4.get(game.Players.LocalPlayer.Character)
                    if v_u_2.has_local_ailments(v32) then
                        v_u_12.has_prompted_feed_choice[p30] = true
                        return true
                    else
                        v_u_13.apps.HintApp:hint({
                            ["text"] = "You have no needs to cure, so save it for later!",
                            ["length"] = 2.5,
                            ["overridable"] = true,
                            ["yields"] = false
                        })
                        return false
                    end
                else
                    if v31 == "Feed Pet" then
                        v_u_12.choose_pet_and_then(function(p33)
                            v_u_8.feed_pet(p33)
                        end)
                    end
                    return false
                end
            end
        end,
        ["consume"] = function(p34)
            return v_u_11.get("EffectsAPI/DrinkCureAllPotion"):InvokeServer(p34.item_data.unique)
        end
    },
    ["levitation_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LevitateEffect")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("levitation_potion"),
        ["consume"] = function(p35)
            if not v_u_11.get("EffectsAPI/DrinkLevitatePotion"):InvokeServer(p35.item_data.unique) then
                return false
            end
            local v_u_36 = game.Players.LocalPlayer.Character
            local v_u_37 = v_u_36.Humanoid
            local v_u_38 = v_u_37.RootPart
            local v_u_39 = v_u_7.new()
            local v_u_40 = false
            local v_u_41 = 15
            local v_u_42 = Instance.new("BodyPosition")
            v_u_42.MaxForce = Vector3.new(0, 0, 0)
            v_u_42.Parent = v_u_38
            local v43 = v_u_3.get_track("Levitate")
            v_u_17:PreloadAsync({ v43 })
            local v_u_44 = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v43)
            v_u_39:GiveTask(v_u_16.JumpRequest:Connect(function()
                if v_u_9.can_use_potions() then
                    if tick() - v_u_41 > 0.1 then
                        v_u_41 = tick()
                        v_u_40 = not v_u_40
                        if v_u_40 then
                            v_u_44:Play()
                        else
                            v_u_44:Stop()
                        end
                    end
                    if v_u_40 then
                        v_u_37:ChangeState(Enum.HumanoidStateType.Freefall)
                    end
                end
            end))
            v_u_39:GiveTask(function()
                v_u_40 = false
            end)
            v_u_39:GiveTask(v_u_42)
            spawn(function()
                while game.Players.LocalPlayer.Character == v_u_36 do
                    if v_u_40 and v_u_9.can_use_potions() then
                        local v45 = Ray.new(v_u_38.Position, Vector3.new(0, -17, 0))
                        local _, v46 = v_u_10.FindPartOnRay(v45, v_u_36)
                        v_u_42.Position = v46 + Vector3.new(0, 15, 0)
                        v_u_42.MaxForce = Vector3.new(0, 10000, 0)
                    else
                        v_u_42.MaxForce = Vector3.new(0, 0, 0)
                        v_u_40 = false
                        if v_u_44.IsPlaying then
                            v_u_44:Stop()
                        end
                    end
                    wait()
                end
                v_u_39:DoCleaning()
            end)
            return true
        end,
        ["post_consume_hint"] = v_u_9.create_post_consume_hint("levitation_potion", "Jump to enable/disable levitation")
    },
    ["water_walking_potion"] = {
        ["validate"] = function(_, _)
            return not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("WaterWalkingEffect")
        end,
        ["validation_failed_dialog"] = v_u_9.create_validation_failed_dialog("water_walking_potion"),
        ["consume"] = function(p47)
            if not v_u_11.get("EffectsAPI/DrinkWaterWalkingPotion"):InvokeServer(p47.item_data.unique) then
                return false
            end
            local v_u_48 = game.Players.LocalPlayer.Character
            local v_u_49 = v_u_48.Humanoid
            local v_u_50 = v_u_49.RootPart
            local v_u_51 = v_u_49.HipHeight + v_u_49.RootPart.Size.Y / 2 + 0.3
            local v_u_52 = Instance.new("BodyPosition")
            v_u_52.MaxForce = Vector3.new(0, 0, 0)
            v_u_52.Parent = v_u_50
            local v_u_53 = false
            local v_u_54 = false
            v_u_49:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
            game:GetService("UserInputService").JumpRequest:connect(function()
                if v_u_53 then
                    v_u_52.MaxForce = Vector3.new(0, 0, 0)
                    v_u_54 = true
                    v_u_53 = false
                    v_u_49:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                    v_u_49:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                    v_u_49:ChangeState(Enum.HumanoidStateType.Jumping)
                    v_u_49.Jump = true
                    wait(0.5)
                    v_u_54 = false
                end
            end)
            spawn(function()
                while game.Players.LocalPlayer.Character == v_u_48 do
                    if v_u_9.can_use_potions() then
                        local v55 = Ray.new
                        local v56 = v_u_50.Position + Vector3.new(0, 18, 0)
                        local v57 = -v_u_51 - 18
                        local v58 = v55(v56, (Vector3.new(0, v57, 0)))
                        local v59, v60, _, v61 = workspace:FindPartOnRayWithWhitelist(v58, { workspace.Terrain })
                        local v62 = v_u_49:GetState()
                        if v_u_54 or (not v59 or (v59.Name ~= "Terrain" or (v61 ~= Enum.Material.Water or v62 == Enum.HumanoidStateType.Jumping))) then
                            v_u_53 = false
                            v_u_52.MaxForce = Vector3.new(0, 0, 0)
                            v_u_49:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                            v_u_49:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                        else
                            if v_u_53 then
                                local v63 = v_u_51
                                v_u_52.Position = v60 + Vector3.new(0, v63, 0)
                                v_u_52.MaxForce = Vector3.new(0, 10000, 0)
                            else
                                local v64 = v_u_51
                                v_u_52.Position = v60 + Vector3.new(0, v64, 0)
                                v_u_52.MaxForce = Vector3.new(0, 10000, 0)
                                v_u_49:ChangeState(Enum.HumanoidStateType.Freefall)
                                wait()
                                v_u_49:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                                v_u_49:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                                v_u_53 = true
                            end
                            if v62 ~= Enum.HumanoidStateType.RunningNoPhysics then
                                v_u_49:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                            end
                        end
                    end
                    wait()
                end
            end)
            return true
        end
    }
}
v65.birthday_2024_cake = v14.Dictionary.join(v65.hyperspeed_potion, {
    ["post_consume_hint"] = v_u_9.create_post_consume_hint("birthday_2024_cake", "Eat more %ss for a stronger effect!")
})
for v66, v67 in v65 do
    local v68 = v18(v67)
    local v69 = "PotionEffectsDB validate failed for " .. v66
    assert(v68, v69)
end
return v65