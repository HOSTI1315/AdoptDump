--// ReplicatedStorage.ClientModules.Game.ToolHelpers.FoodCannon (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_4 = v1("ProjectileHelper")
local v5 = v1("SoundPlayer")
local v_u_6 = v1("package:Promise")
local v_u_7 = v1("UIManager")
local v_u_8 = v1("new:StreamingHelper")
local v9 = {}
local v_u_10 = false
local v_u_11 = v5.new(game.ReplicatedStorage.Resources.FoodCannon)
local function v_u_17(p12)
    local v13 = p12.Nozzle
    local v14 = v_u_3.get(v13, { "MuzzleFlashAttachment" })
    if v14 then
        local v15 = v14.Clouds
        local v16 = v14.Dots
        v15:Emit(9)
        v16:Emit(4)
    end
end
local function v_u_36(p18, p19, p20)
    local v21 = game.Players.LocalPlayer
    local v22 = v_u_3.get(v21, { "Character", p18.tool, "ModelHandle" })
    local v23 = v_u_3.get(v21, {
        "Character",
        p18.tool,
        "ModelHandle",
        "Nozzle"
    })
    local v24 = v_u_3.get(v21, { "Character", "HumanoidRootPart" })
    if v23 and v24 then
        local v25 = v24.CFrame - v24.CFrame.p + p20
        local v26 = v_u_2.get("PetObjectAPI/CreateFoodCannonObject"):InvokeServer()
        local v_u_27 = v_u_8.await(v26, 15)
        if v_u_27 then
            local v_u_28 = v_u_27.Handle
            local v29 = Random.new()
            v_u_28.CFrame = v25 * CFrame.Angles(v29:NextNumber(0, 6.283185307179586), v29:NextNumber(0, 6.283185307179586), v29:NextNumber(0, 6.283185307179586))
            local v30 = v29:NextNumber(-5, 5)
            local v31 = v29:NextNumber(-5, 5)
            v_u_28.AssemblyAngularVelocity = Vector3.new(v30, v31, v29:NextNumber(-5, 5))
            local v32 = Instance.new("BodyForce")
            local v33 = workspace.Gravity - 60
            v32.Force = Vector3.new(0, v33, 0) * v_u_28.AssemblyMass
            v32.Parent = v_u_28
            v_u_28.AssemblyLinearVelocity = p19 * 60
            v_u_17(v22)
            v_u_11:play(p18.model_handle .. "/Sound/FoodCannonShoot")
            local v_u_34 = false
            v_u_28.Touched:Connect(function(p35)
                if not v_u_34 and v_u_28:CanCollideWith(p35) then
                    v_u_34 = true
                    v_u_28.AssemblyAngularVelocity = v_u_28.AssemblyAngularVelocity * 0.1
                    v_u_28.AssemblyLinearVelocity = v_u_28.AssemblyLinearVelocity * 0.33
                    v_u_6.delay(10):andThen(function()
                        if v_u_27 and v_u_27.Parent then
                            v_u_28.Anchored = true
                            v_u_28.CanCollide = false
                        end
                    end)
                end
            end)
        end
    else
        return
    end
end
function v9.use(p37, p38)
    if v_u_10 then
        return
    else
        v_u_10 = true
        local v39 = v_u_3.get(game.Players.LocalPlayer, {
            "Character",
            p37.tool,
            "ModelHandle",
            "Nozzle"
        })
        if v39 then
            local v40 = v39.Position + v39.CFrame.LookVector * 0.8
            local v41 = v39.CFrame.LookVector
            if p38 == "WorldTap" then
                v41 = v_u_4.get_aim_direction(v40, 60, 60)
            end
            v_u_36(p37, v41, v40)
            v_u_10 = false
        else
            v_u_10 = false
        end
    end
end
function v9.equip(p42)
    v_u_7.apps.HintApp:hint({
        ["text"] = "Try launching food at hungry pets, or picking the food up yourself!",
        ["length"] = 4,
        ["overridable"] = true,
        ["yields"] = false
    })
    v_u_11:play(p42.model_handle .. "/Sound/FoodCannonEquip")
end
return v9