--// ReplicatedStorage.new.modules.StandardSequencePreview.StandardSequencePreviewClient (ModuleScript)

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("Players")
require(script.Parent.StandardSequencePreviewTypes)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)
local v_u_4 = v_u_3("PolicyHelper")
local v_u_5 = v_u_3("ClientData")
local v_u_6 = v_u_3("RouterClient")
local v_u_7 = v_u_3("Maid")
local v_u_8 = v_u_3("AltCurrencyDB")
local v_u_9 = v_u_3("InventoryDB")
local v_u_10 = v_u_3("TranslationHelper")
local v_u_11 = {}
local v_u_12 = {}
local function v_u_20(p13, p_u_14)
    local function v18(p15)
        local v_u_16 = v_u_7.new()
        v_u_16:GiveTask(p15.AncestryChanged:Connect(function(_, p17)
            if p17 == nil then
                v_u_16:DoCleaning()
            end
        end))
        p_u_14(p15, v_u_16)
    end
    v_u_1:GetInstanceAddedSignal(p13):Connect(v18)
    for _, v19 in v_u_1:GetTagged(p13) do
        task.spawn(v18, v19)
    end
end
function v_u_11.is_restricted_lootbox_kind(p21)
    return v_u_12[p21] and true or false
end
function v_u_11.connect_standard_sequence_frame(p_u_22, p23)
    local v24
    if p_u_22:IsA("GuiButton") then
        v24 = p_u_22
    else
        v24 = p_u_22:FindFirstChildWhichIsA("GuiButton", true)
    end
    if v24 then
        p23:GiveTask(v24.MouseButton1Click:Connect(function()
            local v25 = p_u_22:GetAttribute("StandardSequenceInfoKind")
            if v25 and typeof(v25) == "string" then
                if not v_u_11.is_preview_active() then
                    v_u_11.preview_sequence_async(v25)
                end
            else
                warn((("StandardSequenceFrame %* has no StandardSequenceInfoKind attribute."):format((p_u_22:GetFullName()))))
                return
            end
        end))
    end
    local v_u_26
    if p_u_22:IsA("SurfaceGui") then
        v_u_26 = p_u_22
    else
        v_u_26 = p_u_22:FindFirstAncestorWhichIsA("SurfaceGui")
    end
    local v_u_27
    if v_u_26 then
        v_u_27 = v_u_26.LightInfluence
    else
        v_u_27 = v_u_26
    end
    local function v_u_35(p28)
        local v29 = p_u_22:GetAttribute("StandardSequenceLightInfluence")
        if v29 and v_u_26 then
            local v30 = v_u_26
            if not p28.ArePaidRandomItemsRestricted then
                v29 = v_u_27
            end
            v30.LightInfluence = v29
        end
        p_u_22.Visible = p28.ArePaidRandomItemsRestricted
        local v31 = p_u_22.Parent
        local v32 = {}
        for _, v33 in assert(v31):GetChildren() do
            if v33:IsA("GuiObject") and v33 ~= p_u_22 then
                if v33:HasTag("StandardSequenceAutoButton") then
                    v32 = { v33 }
                    break
                end
                table.insert(v32, v33)
            end
        end
        for _, v34 in v32 do
            v34.Visible = not p28.ArePaidRandomItemsRestricted
        end
    end
    local function v36()
        v_u_35(v_u_4.get_policy_info(v_u_2.LocalPlayer))
    end
    local v37 = v_u_5.register_callback_plus_existing("policy_info", v36)
    task.spawn(v36)
    p23:GiveTask(v37)
end
function v_u_11.get_disclosure_text(p38)
    if p38 then
        return v_u_10.translate(game, "Disclosure: To comply with the laws of your country, all items follow a standard non-random sequence, which can be found <u>here</u>.")
    else
        return v_u_10.translate(game, "Disclosure: To comply with the laws of your country, all items follow a standard non-random sequence.")
    end
end
function v_u_11.show_disclosure_async(p39)
    local v40 = v_u_3("UIManager")
    while true do
        local v41
        if p39 then
            v41 = v40.apps.DialogApp:dialog({
                ["text"] = v_u_11.get_disclosure_text(true),
                ["rich_text"] = true,
                ["button"] = "Next",
                ["text_area_button"] = "View"
            })
        else
            v41 = v40.apps.DialogApp:dialog({
                ["text"] = v_u_11.get_disclosure_text(false),
                ["rich_text"] = true,
                ["button"] = "Next"
            })
        end
        if v41 == "Next" or not p39 then
            return
        end
        v_u_11.preview_sequence_async(p39)
    end
end
local v_u_42 = {}
function v_u_11.show_initial_purchase_disclosure_async(p43)
    if v_u_4.get_policy_info(v_u_2.LocalPlayer).ArePaidRandomItemsRestricted then
        if v_u_42[p43] then
            return
        elseif v_u_11.is_restricted_lootbox_kind(p43) then
            v_u_6.get("LootBoxAPI/MarkDisclosureViewed"):FireServer(p43)
            v_u_42[p43] = true
            v_u_11.show_disclosure_async(p43)
        end
    else
        return
    end
end
local v_u_44 = nil
function v_u_11.preview_sequence_async(p_u_45)
    local v_u_46 = v_u_3("UIManager")
    if v_u_44 and coroutine.status(v_u_44) == "suspended" then
        print("Cancelling previous sequence_preview_thread")
        task.cancel(v_u_44)
    end
    local v76 = task.spawn(function()
        local v_u_47 = 1
        local v_u_48 = {}
        local v_u_49 = 0
        local function v51()
            local v50 = v_u_46.apps.DialogApp:dialog({
                ["text"] = v_u_10.translate(game, "The standard sequence is as follows:") .. " " .. table.concat(v_u_48, ", "),
                ["left"] = "Close",
                ["right"] = "Next"
            })
            v_u_47 = v_u_47 + 1
            v_u_48 = {}
            v_u_49 = 0
            return v50
        end
        local v52 = v_u_6.get("LootBoxAPI/StandardSequencePreview"):InvokeServer(p_u_45, 40, true)
        local v_u_53 = nil
        local v54 = task.spawn(function()
            v_u_53 = v_u_6.get("LootBoxAPI/StandardSequencePreview"):InvokeServer(p_u_45, 40, false)
        end)
        local v55 = v_u_53
        local v56 = v_u_49
        local v57 = v_u_48
        while v52 do
            local v58 = v52.context.first_result_index
            for v59, v60 in v52.results do
                local v61 = v58 + v59 - 1
                local v62 = {}
                for _, v63 in v60 do
                    if v63.category == "currency" then
                        local v64 = v63.kind == "money" and "Bucks" or (v_u_8[v63.kind] and v_u_8[v63.kind].name or v63.kind)
                        local v65 = v_u_10.translate
                        local v66 = game
                        local v67 = ("%* %*"):format(v63.amount, v64)
                        table.insert(v62, v65(v66, v67))
                    else
                        local v68 = v_u_9[v63.category][v63.kind].name or v63.kind
                        local v69 = v_u_10.translate
                        local v70 = game
                        table.insert(v62, v69(v70, v68))
                    end
                end
                if #v62 == 0 then
                    local v71 = ("%*: %*"):format(v61, "Unknown")
                    table.insert(v57, v71)
                    v_u_49 = v56 + 7
                elseif #v62 == 1 then
                    local v72 = v62[1]
                    local v73 = ("%*: %*"):format(v61, v72)
                    table.insert(v57, v73)
                    v_u_49 = v56 + #v72
                else
                    local v74 = "[" .. table.concat(v62, ", ") .. "]"
                    local v75 = ("%*: %*"):format(v61, v74)
                    table.insert(v57, v75)
                    v_u_49 = v56 + #v74
                end
                if v_u_49 >= 500 and v51() ~= "Next" then
                    return
                end
                v56 = v_u_49
            end
            while coroutine.status(v54) ~= "dead" do
                task.wait()
            end
            v_u_53 = nil
            v54 = task.spawn(function()
                v_u_53 = v_u_6.get("LootBoxAPI/StandardSequencePreview"):InvokeServer(p_u_45, 40, false)
            end)
            v52 = v55
            v55 = v_u_53
        end
        warn((("StandardSequencePreview returned nil for %*"):format(p_u_45)))
    end)
    v_u_44 = v76
    while coroutine.status(v76) ~= "dead" do
        task.wait()
    end
end
function v_u_11.is_preview_active()
    local v77 = v_u_44
    if v77 then
        v77 = coroutine.status(v_u_44) ~= "dead"
    end
    return v77
end
function v_u_11.start()
    task.spawn(function()
        v_u_12 = v_u_6.get("LootBoxAPI/RequestLootBoxKinds"):InvokeServer()
    end)
    v_u_20("StandardSequenceFrame", function(p78, p79)
        local v80 = p78:IsA("GuiObject")
        local v81 = ("StandardSequenceFrame %* should be a GuiObject"):format((p78:GetFullName()))
        assert(v80, v81)
        v_u_11.connect_standard_sequence_frame(p78, p79)
    end)
    v_u_20("StandardSequenceAutoButton", function(p82, _)
        local v83 = p82:IsA("TextLabel")
        local v84 = ("StandardSequenceAutoButton %* should be a TextLabel"):format((p82:GetFullName()))
        assert(v83, v84)
        if not (p82.Parent and p82.Parent:FindFirstChild("StandardSequenceFrame")) then
            local v85 = v_u_11.get_disclosure_text(true)
            local v86 = p82:GetAttribute("StandardSequenceAutoButtonPrefix")
            if v86 then
                v85 = ("%*\n%*"):format(v86, v85)
            end
            local v87 = p82:Clone()
            v87.Name = "StandardSequenceFrame"
            v87.Text = v85
            v87.RichText = true
            local v88 = Instance.new("TextButton")
            v88.BackgroundTransparency = 1
            v88.Size = UDim2.new(1, 0, 1, 0)
            v88.ZIndex = 10
            v88.Text = ""
            v88.Parent = v87
            v87:RemoveTag("StandardSequenceAutoButton")
            v87:AddTag("StandardSequenceFrame")
            v87.Parent = p82.Parent
        end
    end)
    v_u_6.get("LootBoxAPI/ShowClientDisclosure").OnClientInvoke = v_u_11.show_initial_purchase_disclosure_async
end
return v_u_11