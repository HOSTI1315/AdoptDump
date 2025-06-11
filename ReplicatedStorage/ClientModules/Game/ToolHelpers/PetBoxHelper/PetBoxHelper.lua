--// ReplicatedStorage.ClientModules.Game.ToolHelpers.PetBoxHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("CollisionsClient")
local v_u_4 = v1("AnimationManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("ToolDBHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = v1("InventoryDB")
local v_u_9 = v1("GrammarUtil")
local v_u_10 = v1("UIManager")
local v11 = v1("package:t")
local v_u_12 = v1("package:Sift")
local v_u_13 = v1("package:Promise")
local v_u_14 = game:GetService("Debris")
local v_u_15 = game:GetService("Players")
local v_u_16 = game:GetService("ContentProvider")
local v_u_17 = game:GetService("ReplicatedStorage")
local v_u_18 = Random.new()
local v19 = {}
local function v_u_27(p20, p21, p22)
    local v23 = Instance.new("Attachment")
    v23.Parent = p20
    for _, v24 in ipairs(v_u_17.Resources.Particles.Hatch:GetChildren()) do
        v24:Clone().Parent = v23
    end
    v_u_16:PreloadAsync({ v23 })
    for _, v25 in ipairs(v23:GetChildren()) do
        v25.Enabled = true
    end
    task.wait(p21)
    for _, v26 in ipairs(v23:GetChildren()) do
        v26.Enabled = false
    end
    v_u_14:AddItem(v23, p22)
end
local function v_u_35(p28, p29)
    if p28 then
        p28 = p28[1]
    end
    local v30 = v_u_8[p28.category][p28.kind]
    if p28.category == "transport" then
        v_u_10.apps.DialogApp:dialog({
            ["text"] = ("%s was added to your inventory!"):format(v30.name),
            ["button"] = "Okay"
        })
    else
        local v31 = v_u_5.get("ToolAPI/Equip")
        local v32 = p28.unique
        local v33 = {}
        if p28.category ~= "pets" then
            p29 = nil
        end
        v33.spawn_cframe = p29
        v31:InvokeServer(v32, v33)
        local v34 = {
            ["text"] = v_u_9.build_subject_verb_item_string({
                ["entry"] = v30,
                ["subject_phrase"] = "You",
                ["verb_phrase"] = "found"
            }),
            ["length"] = 4,
            ["yields"] = false
        }
        v_u_10.apps.HintApp:hint(v34)
    end
end
local v_u_36 = v11.strictInterface({
    ["box_entry"] = v11.table,
    ["tool_state"] = v11.table,
    ["rig_model_name"] = v11.string,
    ["animations"] = v11.array(v11.string),
    ["finish_at_marker"] = v11.string,
    ["marker_reached_callbacks"] = v11.map(v11.string, v11.callback),
    ["box_spawn_offset"] = v11.optional(v11.CFrame),
    ["exchange_callback"] = v11.optional(v11.callback),
    ["dont_play_default_opened_sound"] = v11.optional(v11.boolean)
})
local v_u_37 = v11.strictInterface({
    ["box_entry"] = v11.table,
    ["tool_state"] = v11.table,
    ["rig_model_name"] = v11.string,
    ["promise"] = v11.callback,
    ["box_spawn_offset"] = v11.optional(v11.CFrame),
    ["exchange_callback"] = v11.optional(v11.callback),
    ["confirm_use"] = v11.optional(v11.boolean)
})
function v19.preload_animations(p38)
    v_u_16:PreloadAsync((v_u_12.List.map(p38, function(p39)
        return v_u_4.get_track(p39)
    end)))
end
function v19.exchange_box_with_animation(p_u_40)
    local v41 = v_u_36
    assert(v41(p_u_40))
    if p_u_40.confirm_use == false or v_u_6.confirm_use(p_u_40.box_entry) then
        local v_u_42 = p_u_40.tool_state.item_data.unique
        local v43 = v_u_15.LocalPlayer.Character
        if v43 and not workspace:FindFirstChild(v_u_42) then
            v_u_5.get("ToolAPI/Unequip"):InvokeServer(v_u_42)
            local v44 = v43.HumanoidRootPart
            local v45 = v43.Humanoid
            local v46 = v44.CFrame * CFrame.new(0, 0, -4)
            local v47 = v44.Size.Y / 2 + v45.HipHeight
            local v_u_48 = v46 - Vector3.new(0, v47, 0)
            local v49 = p_u_40.box_spawn_offset or CFrame.new()
            local v_u_50 = v_u_17.Resources:FindFirstChild(p_u_40.rig_model_name):Clone()
            v_u_50.Name = v_u_42
            v_u_50.PrimaryPart.Anchored = true
            v_u_50:SetPrimaryPartCFrame(v_u_48 * v49)
            v_u_3.set_model_collision_group(v_u_50, "no_collisions")
            v_u_50.Parent = workspace
            v_u_50.PrimaryPart.SpawnParticleAttachment.SpawnParticle:Emit(25)
            local v_u_51 = v_u_2.FX:play("GiftUnwrap")
            local v52 = p_u_40.animations[v_u_18:NextInteger(1, #p_u_40.animations)]
            local v53 = v_u_4.get_track(v52)
            local v_u_54 = v_u_50.AnimationController:LoadAnimation(v53)
            for v55, v_u_56 in pairs(p_u_40.marker_reached_callbacks) do
                v_u_54:GetMarkerReachedSignal(v55):Connect(function()
                    v_u_56(v_u_50)
                end)
            end
            v_u_54:GetMarkerReachedSignal(p_u_40.finish_at_marker):Connect(function()
                v_u_7.new(v_u_51, TweenInfo.new(0.375, Enum.EasingStyle.Linear), {
                    ["Volume"] = 0
                })
                v_u_13.try(function()
                    v_u_27(v_u_50.PrimaryPart, 0.2, 10)
                end)
                v_u_54:Stop()
                v_u_54:Destroy()
                for _, v57 in pairs(v_u_50:GetDescendants()) do
                    if v57:IsA("BasePart") then
                        v57.Transparency = 1
                    end
                end
                v_u_13.try(function()
                    local v58 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer(p_u_40.box_entry.kind, v_u_42)
                    if v58 then
                        if p_u_40.exchange_callback then
                            p_u_40.exchange_callback(v58, v_u_48)
                            return
                        end
                        v_u_35(v58, v_u_48)
                    end
                end)
                if not p_u_40.dont_play_default_opened_sound then
                    v_u_2.FX:play("MagicExplosion")
                end
                v_u_13.delay(5):await()
                v_u_50:Destroy()
            end)
            v_u_54:Play()
        end
    else
        return
    end
end
function v19.exchange_box_with_promise(p_u_59)
    local v60 = v_u_37
    assert(v60(p_u_59))
    if p_u_59.confirm_use == false or v_u_6.confirm_use(p_u_59.box_entry) then
        local v_u_61 = p_u_59.tool_state.item_data.unique
        local v62 = v_u_15.LocalPlayer.Character
        if v62 and not workspace:FindFirstChild(v_u_61) then
            v_u_5.get("ToolAPI/Unequip"):InvokeServer(v_u_61)
            local v_u_63 = v62.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
            local v64 = p_u_59.box_spawn_offset or CFrame.new()
            local v_u_65 = v_u_17.Resources:FindFirstChild(p_u_59.rig_model_name):Clone()
            v_u_65.Name = v_u_61
            v_u_65.PrimaryPart.Anchored = true
            v_u_65:SetPrimaryPartCFrame(v_u_63 * v64)
            v_u_3.set_model_collision_group(v_u_65, "no_collisions")
            v_u_65.Parent = workspace
            local function v67()
                return v_u_13.try(function()
                    local v66 = v_u_5.get("LootBoxAPI/ExchangeItemForReward"):InvokeServer(p_u_59.box_entry.kind, v_u_61)
                    if v66 then
                        if p_u_59.exchange_callback then
                            p_u_59.exchange_callback(v66, v_u_63)
                            return
                        end
                        v_u_35(v66, v_u_63)
                    end
                end)
            end
            p_u_59.promise(v_u_65, v67):finally(function()
                v_u_65:Destroy()
            end)
        end
    else
        return
    end
end
return v19