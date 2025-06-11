--// ReplicatedStorage.SharedModules.SharedDB.ServerCollidablesDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("package:t")
local v_u_3 = v_u_1("package:Promise")
local v_u_4 = v_u_1("SoundPlayer")
local v5 = v2.strictInterface({
    ["destroy_on_collide"] = v2.optional(v2.boolean),
    ["can_be_triggered_by_owner"] = v2.optional(v2.boolean),
    ["on_model_created"] = v2.optional(v2.callback),
    ["client_render"] = v2.callback
})
local v19 = {
    ["jokes_2024_whoopee_cushion"] = {
        ["destroy_on_collide"] = true,
        ["can_be_triggered_by_owner"] = true,
        ["on_model_created"] = function(p6)
            for _, v7 in p6:GetDescendants() do
                if v7:IsA("BasePart") then
                    v7.Transparency = 1
                end
            end
        end,
        ["client_render"] = function(p8)
            local v9 = v_u_1("GameplayFX")
            local v_u_10 = p8:Clone()
            v_u_10.Parent = workspace
            for _, v11 in v_u_10:GetChildren() do
                if v11.Name ~= "Visual" then
                    v11:Destroy()
                end
            end
            local v12 = nil
            for _, v13 in v_u_10.Visual:GetChildren() do
                if v13:IsA("BasePart") then
                    if v12 then
                        v13.Anchored = false
                        local v14 = Instance.new("Weld")
                        v14.Part0 = v12
                        v14.Part1 = v13
                        v14.C0 = v12.CFrame:inverse() * v13.CFrame
                        v14.Parent = v12
                    else
                        v_u_10.PrimaryPart = v13
                        v12 = v13
                    end
                    v13.CanCollide = true
                    v13.CollisionGroup = "noncollide"
                    v13.Transparency = 0
                end
            end
            v_u_10.PrimaryPart.Anchored = false
            v_u_10.PrimaryPart.CFrame = v_u_10.PrimaryPart.CFrame * CFrame.new(0, 1, 0)
            v9.emit_poof(p8:FindFirstChild("Collision").Position)
            local v15 = Random.new()
            if v15:NextNumber() < 0.99 then
                local v16 = v15:NextInteger(1, 3)
                v_u_4.FX:play("Jokes2024WhoopeeCushion" .. v16)
            else
                v_u_4.FX:play("Jokes2024WhoopeeCushion4")
            end
            task.wait()
            local v17 = CFrame.fromEulerAnglesXYZ(0, v15:NextNumber() * 3.141592653589793 * 2, 0).XVector
            local v18 = CFrame.fromAxisAngle(v17, 0.2617993877991494 * v15:NextNumber(-1, 1)).YVector
            v_u_10.PrimaryPart.AssemblyLinearVelocity = v18 * 60
            v_u_3.delay(3):andThen(function()
                v_u_10:Destroy()
            end)
        end
    }
}
for _, v20 in v19 do
    assert(v5(v20))
end
return v19