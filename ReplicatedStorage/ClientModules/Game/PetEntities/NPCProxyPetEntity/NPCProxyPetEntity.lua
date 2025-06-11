--// ReplicatedStorage.ClientModules.Game.PetEntities.NPCProxyPetEntity (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InventoryDB")
local v_u_3 = v1("PetEntityManager")
local v_u_4 = v1("PetRigHelper")
local v_u_5 = v1("new:PetRigs")
local v_u_6 = v1("UIManager")
local v_u_7 = v1("package:Sift")
local v8 = v1("package:t")
local v_u_9 = v8.strictInterface({
    ["pet_kind"] = v8.optional(v8.string),
    ["hide_name"] = v8.optional(v8.boolean),
    ["anims"] = v8.optional(v8.map(v8.string, v8.string)),
    ["tricks"] = v8.optional(v8.array(v8.strictInterface({ v8.string, v8.string }))),
    ["name"] = v8.optional(v8.string)
})
local v10 = {}
local function v_u_18(p11, p12)
    local v13 = p11.PetModel
    for _, v14 in p11:GetChildren() do
        if not v14:IsA("Folder") then
            v14.Parent = v13
            if v14.Name == "HumanoidRootPart" then
                local v15 = v14:Clone()
                v15:ClearAllChildren()
                v15.Size = Vector3.new(1.2, 1, 0.7)
                v15.Parent = p11
                v15.RootPriority = 1
                v14.RootPriority = -127
                v14.Anchored = false
            elseif v14:IsA("Humanoid") then
                local v16 = v14:Clone()
                v16.HipHeight = 1
                v16.Parent = p11
            end
        end
    end
    for _, v17 in v_u_5.Rigs do
        if v17.should_transform(v13) then
            v17.transform(v13)
            break
        end
    end
    v_u_4.rig_pet_model_to_char(v13, p11, p12)
end
function v10.new(p19, p20)
    local v_u_21 = p20 or {}
    local v22 = v_u_9
    assert(v22(v_u_21))
    local v_u_23 = p19:WaitForChild("NPC")
    local v_u_24 = p19:FindFirstChild("Rig") or nil
    local v_u_25
    if v_u_24 then
        v_u_25 = v_u_24.Humanoid
    else
        v_u_25 = v_u_23.Humanoid
    end
    local v26
    if v_u_21.pet_kind then
        v26 = v_u_2.pets[v_u_21.pet_kind]
    else
        v26 = nil
    end
    if v_u_24 then
        v_u_24.Name = v_u_21.name or (v26 and v26.name or p19.Name)
        v_u_23.Name = "PetModel"
        v_u_23.Parent = v_u_24
    else
        v_u_23.Name = v_u_21.name or p19.Name
        local v27 = Instance.new("Folder")
        v27.Name = "PetModel"
        v27.Parent = v_u_23
    end
    v_u_25.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v_u_25.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    if v_u_21.pet_kind then
        v_u_18(v_u_23, v26)
    else
        v_u_25.UseJumpPower = false
        v_u_25.JumpHeight = 7.159
    end
    if not v_u_21.hide_name then
        v_u_6.apps.PlayerNameApp:add_npc_id(v_u_23, v_u_21.name or p19.name)
    end
    local v28 = v_u_3.create_pet_entity
    local v29 = v_u_24 or v_u_23
    local v30
    if v_u_21.pet_kind then
        v30 = v_u_2.pets[v_u_21.pet_kind]
    else
        v30 = {
            ["name"] = v_u_21.name or p19.Name,
            ["anims"] = v_u_7.Dictionary.join({
                ["running"] = "NPCRun",
                ["idle"] = "NPCIdle",
                ["sit"] = "DefaultSit",
                ["sleep"] = "DollSleep",
                ["hold"] = "DollBeingHeldSingle",
                ["double_hold"] = "DollBeingHeldDouble",
                ["eating"] = "DollEat"
            }, v_u_21.anims or {}),
            ["tricks"] = v_u_21.tricks or {},
            ["no_eyes"] = true,
            ["temporary"] = true
        }
    end
    return v28(v29, v30, function(p31)
        local v32 = v_u_7.Dictionary.join
        local v33 = p31.base
        local v34 = {}
        local v35
        if v_u_24 then
            v35 = v_u_24
        else
            v35 = v_u_23
        end
        v34.char = v35
        local v36
        if v_u_21.pet_kind then
            v36 = v_u_23.PetModel
        else
            v36 = v_u_23
        end
        v34.pet_model = v36
        local v37
        if v_u_21.pet_kind then
            v37 = v_u_23.Humanoid
        else
            v37 = v_u_25
        end
        v34.humanoid = v37
        local v38
        if v_u_24 then
            v38 = v_u_24.HumanoidRootPart
        else
            v38 = v_u_23.HumanoidRootPart
        end
        v34.root = v38
        p31.base = v32(v33, v34)
    end)
end
return v10