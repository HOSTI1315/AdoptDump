--// ReplicatedStorage.SharedModules.ContentPackHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v_u_2 = game:GetService("ReplicatedStorage").SharedModules.ContentPacks
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(game.ReplicatedFirst.Load.LoadTimers)
local v_u_5 = {
    ["Animations"] = true,
    ["AilmentRewards"] = true,
    ["BattlePasses"] = true,
    ["DeveloperProducts"] = true,
    ["Downloads"] = true,
    ["Eggs"] = true,
    ["EquipPerms"] = true,
    ["ForSaleCallbacks"] = true,
    ["Furniture"] = true,
    ["Gamepasses"] = true,
    ["HiddenItems"] = true,
    ["InteriorBehaviors"] = true,
    ["Interiors"] = true,
    ["LootBoxRewards"] = true,
    ["NPCs"] = true,
    ["PetPotionEffects"] = true,
    ["PetVisualEffects"] = true,
    ["PlayerManagerBehaviors"] = true,
    ["PurchaseLimits"] = true,
    ["QuestFrameStyles"] = true,
    ["QuestHelp"] = true,
    ["Quests"] = true,
    ["RefreshmentStands"] = true,
    ["ReplicationKeys"] = true,
    ["Routes"] = true,
    ["SpecialMultipliers"] = true,
    ["Subscriptions"] = true,
    ["TaskboardStyles"] = true,
    ["Tools"] = true,
    ["VehicleProperties"] = true,
    ["VehicleRender"] = true,
    ["Weather"] = true
}
local v_u_6 = {
    ["Minigames"] = true,
    ["UIApps"] = true,
    ["UIElements"] = true,
    ["CloudValueSchemas"] = true
}
local v_u_72 = {
    ["get_all"] = function()
        return v_u_2:GetChildren()
    end,
    ["load_module"] = function(p7, p8)
        local v9 = v_u_2:FindFirstChild(p7)
        if not v9 then
            error(("%s is not a ContentPack."):format(p7))
        end
        local v10 = v9:FindFirstChild(p8, true)
        if not v10 then
            error(("Could not find module %s in ContentPack %s."):format(p8, p7))
        end
        local v11 = v_u_4.start_misc_timer((("081_content_pack_helper_load_module_%*_%*"):format(p7, p8)))
        local v12 = require(v10)
        v11()
        return v12
    end,
    ["merge_folder"] = function(p13, p14, p15, p16)
        if not v_u_6[p13] then
            error(("%s is not a valid ContentPack folder. See VALID_FOLDERS in ContentPackHelper."):format(p13))
        end
        local v17 = {}
        for _, v18 in v_u_72.get_all() do
            local v19 = v18:FindFirstChild(p13)
            if v19 then
                local v20
                if p16 then
                    v20 = v19:GetDescendants()
                else
                    v20 = v19:GetChildren()
                end
                for _, v21 in v20 do
                    if v21:IsA("ModuleScript") then
                        local v22, v23 = p15(v21)
                        if v22 and v23 then
                            p14[v23] = v22
                        end
                    end
                end
            end
        end
        if #v17 > 0 then
            error("Content Pack errors:\n" .. table.concat(v17, "\n"))
        end
    end,
    ["merge"] = function(p24, p25, p26)
        if not v_u_5[p24] then
            error(("%s is not a valid ContentPack module. See VALID_MODULES in ContentPackHelper."):format(p24))
        end
        local v27 = {}
        for _, v28 in v_u_72.get_all() do
            local v29 = v28:FindFirstChild(p24)
            if v29 then
                local v30 = v_u_4.start_misc_timer((("081_content_pack_helper_merge_%*_%*"):format(v28.Name, p24)))
                local v31 = require(v29)
                v30()
                for v32, v33 in p26 and v31 and v31 or { v31 } do
                    local v34
                    if p26 then
                        v34 = p25[v32]
                    else
                        v34 = p25
                    end
                    if v34 then
                        for v35, v36 in v33 do
                            local v37
                            if v_u_1.callback(v34) then
                                v37 = v34(v35, v36)
                            else
                                v37 = v34
                            end
                            if v37[v35] then
                                table.insert(v27, ("item \'%s\' already exists, conflict in: %s"):format(v35, v29:GetFullName()))
                            else
                                v37[v35] = v36
                            end
                        end
                    end
                end
            end
        end
        if #v27 > 0 then
            error("Content Pack errors:\n" .. table.concat(v27, "\n"))
        end
    end,
    ["foreach"] = function(p38, p39)
        if not v_u_5[p38] then
            error(("%s is not a valid ContentPack module. See VALID_MODULES in ContentPackHelper."):format(p38))
        end
        for _, v40 in v_u_72.get_all() do
            local v41 = v40:FindFirstChild(p38)
            if v41 then
                local v42 = v_u_4.start_misc_timer((("081_content_pack_helper_foreach_%*_%*"):format(v40.Name, p38)))
                local v43 = require(v41)
                v42()
                p39(v43)
            end
        end
    end,
    ["merge_minigames"] = function(p44)
        return v_u_72.merge_folder("Minigames", p44, function(p45)
            local v46 = v_u_3:IsServer() and "Server" or "Client"
            if p45.name:find(v46) then
                local v47 = v_u_4.start_misc_timer((("081_content_pack_helper_merge_minigames_%*_%*"):format(p45.name, v46)))
                local v48 = require(p45)
                v47()
                if v_u_1.table(v48) and v48.minigame_id then
                    return v48, v48.minigame_id
                end
            end
            return nil
        end, false)
    end,
    ["interior_render"] = function(p_u_49, p_u_50)
        v_u_72.foreach("InteriorBehaviors", function(p51)
            local v52 = p51[p_u_50.full_destination_id] or p51[p_u_50.destination_id]
            if v52 and v52.render then
                v52.render(p_u_49, p_u_50)
            end
        end)
    end,
    ["interior_cleanup"] = function(p_u_53, p_u_54)
        v_u_72.foreach("InteriorBehaviors", function(p55)
            local v56 = p55[p_u_54.full_destination_id] or p55[p_u_54.destination_id]
            if v56 and v56.cleanup then
                v56.cleanup(p_u_53, p_u_54)
            end
        end)
    end,
    ["interior_interactions"] = function(p_u_57, p_u_58)
        local v_u_59 = {}
        v_u_72.foreach("InteriorBehaviors", function(p60)
            local v61 = p60[p_u_58.full_destination_id] or p60[p_u_58.destination_id]
            if v61 and v61.interactions then
                for _, v62 in v61.interactions(p_u_57) do
                    local v63 = v_u_59
                    table.insert(v63, v62)
                end
            end
        end)
        return v_u_59
    end,
    ["load"] = function(p_u_64, p_u_65, p_u_66, p_u_67)
        v_u_72.foreach("PlayerManagerBehaviors", function(p68)
            if p68.load then
                p68.load(p_u_64, p_u_65, p_u_66, p_u_67)
            end
        end)
    end,
    ["save"] = function(p_u_69, p_u_70)
        v_u_72.foreach("PlayerManagerBehaviors", function(p71)
            if p71.save then
                p71.save(p_u_69, p_u_70)
            end
        end)
    end
}
return v_u_72