--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.LootboxRewardsDisplay (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("PublicLootBoxRewards")
local v_u_3 = v_u_1("AltCurrencyData")
local v_u_4 = v_u_1("AltCurrencyDB")
local v_u_5 = v_u_1("FormatHelper")
local v_u_6 = v_u_1("KindDB")
local v_u_7 = v_u_1("UIManager")
local v_u_8 = v_u_1("RarityDB")
local v_u_9 = v_u_1("Maid")
local v_u_10 = v_u_1("ClientData")
local v_u_11 = v_u_1("PolicyHelper")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = game:GetService("Players")
local v_u_14 = game:GetService("TextService")
local v_u_15 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v_u_13.LocalPlayer)
local v16 = {}
local v_u_17 = nil
local v_u_18 = {}
function v16.render(p19, p20, p21)
    local v22 = p20 or {}
    local v_u_23 = p19.LootboxDisplays
    local v24 = v_u_2.request():expect()
    if v_u_23:GetAttribute("Rendered") then
        return
    end
    local v25 = v_u_9.new()
    local v26 = v_u_18
    table.insert(v26, v25)
    v_u_23:SetAttribute("Rendered", true)
    v25:GiveTask(function()
        v_u_23:SetAttribute("Rendered", nil)
    end)
    for _, v27 in v_u_23:GetChildren() do
        local v_u_28 = v27.Name
        local v29 = v27:FindFirstChild("DroprateDisplay")
        local v30 = v27:FindFirstChild("RewardsDisplay")
        local v31 = v_u_12.Dictionary.merge
        local v32
        if p21 then
            v32 = p21[v_u_28]
        else
            v32 = p21
        end
        local v33 = v31(v22, v32)
        local v34 = v33.use_explicit_pet_names or false
        local v35 = v33.public_lootbox_rewards_options or {}
        local v36 = v_u_6[v_u_28]
        local v37 = v24[v_u_28]
        if v29 then
            local v38 = v_u_15:Translate(workspace, v36.name)
            local v_u_39 = ""
            if v34 then
                local v40 = {}
                for _, v41 in v37.possible_loot do
                    local v42 = v_u_2.format_drop_chance_human_readable(v41.chance, v35)
                    for _, v43 in v41.rewards do
                        local v44 = v_u_6[v43.kind]
                        local v45 = v_u_15:Translate(workspace, v44.name)
                        local v46 = v_u_8[v44.rarity]
                        local v47 = v46.color
                        local v48 = "\226\151\134  " .. v45 .. " " .. v42
                        local v49 = v47.r * 255
                        local v50 = math.round(v49)
                        local v51 = v47.g * 255
                        local v52 = math.round(v51)
                        local v53 = v47.b * 255
                        local v54 = {
                            ["line"] = ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v50, v52, math.round(v53), v48),
                            ["name"] = v45,
                            ["sort"] = v46.value,
                            ["chance"] = v41.chance
                        }
                        table.insert(v40, v54)
                    end
                end
                table.sort(v40, function(p55, p56)
                    if p55.sort == p56.sort then
                        if p55.chance and (p56.chance and p55.chance ~= p56.chance) then
                            return p55.chance > p56.chance
                        else
                            return p55.name > p56.name
                        end
                    else
                        return p55.sort < p56.sort
                    end
                end)
                for v57, v58 in v40 do
                    v_u_39 = v_u_39 .. v58.line
                    if v57 ~= #v40 then
                        v_u_39 = v_u_39 .. "\n"
                    end
                end
            else
                v_u_39 = v_u_2.convert_rarity_chances_to_human_readable(v37, v35)
            end
            local v59 = v29.SignFace.SurfaceGui:FindFirstChild("Title")
            if v59 then
                v59.AutoLocalize = false
                v59.RichText = true
                v59.Text = v38
            end
            local v_u_60 = v59 and "" or ("%*\n"):format(v38)
            local v_u_61 = v29.SignFace.SurfaceGui.Label
            v_u_61.AutoLocalize = false
            v_u_61.RichText = true
            local v_u_62 = Instance.new("TextButton")
            v_u_62.Text = ""
            v_u_62.Size = UDim2.new(1, 0, 1, 0)
            v_u_62.ZIndex = 3
            v_u_62.BackgroundTransparency = 1
            v_u_62.Name = "InfoButton"
            v_u_62.Visible = false
            v_u_62.Parent = v_u_61
            local v63 = v_u_62.MouseButton1Click:Connect(function()
                v_u_1("new:StandardSequencePreviewClient").preview_sequence_async(v_u_28)
            end)
            local v64 = v_u_10.register_callback_plus_existing("policy_info", function()
                v_u_62.Visible = v_u_11.get_policy_info(v_u_13.LocalPlayer).ArePaidRandomItemsRestricted
                if v_u_11.get_policy_info(v_u_13.LocalPlayer).ArePaidRandomItemsRestricted then
                    v_u_61.Text = v_u_60 .. v_u_1("new:StandardSequencePreviewClient").get_disclosure_text(true)
                else
                    v_u_61.Text = v_u_60 .. v_u_39
                end
            end)
            local v65 = v_u_9.new()
            local v66 = v_u_18
            table.insert(v66, v65)
            v65:GiveTask(v63)
            v65:GiveTask(v64)
        end
        if v30 then
            local v67 = v30.Display.SurfaceGui.Frame.Body.ScrollComplex.ScrollingFrame
            local v_u_68 = v67.Content
            local v_u_69 = v_u_68.ItemTemplate
            v_u_69.Parent = nil
            v_u_17:set_mouse_leave_frame(v30.Display.SurfaceGui.Frame)
            local v_u_70 = {}
            local v71 = {}
            for _, v72 in v37.possible_loot do
                local v73 = nil
                for _, v74 in v72.rewards do
                    local v75 = v74.category
                    local v76 = v74.kind
                    local v77 = v74.amount or 1
                    if v73 and v73.kind == v76 then
                        v73.amount = v73.amount + 1
                    else
                        v_u_70[v76] = (v_u_70[v76] or 0) + v72.chance
                        local v78 = v_u_6[v76]
                        if v78 or (v75 ~= "currency" or (v76 == "bucks" or v76 == "money")) then
                            ::l40::
                            if v78 then
                                v73 = {
                                    ["entry"] = v78,
                                    ["amount"] = v77,
                                    ["kind"] = v76,
                                    ["category"] = v75
                                }
                                table.insert(v71, v73)
                            end
                        elseif v_u_3.enabled and v_u_3.name == v76 then
                            v76 = v_u_3.currency_type
                            local v79 = v_u_4[v76]
                            local v80 = v79.developer_products
                            local v81 = nil
                            for v82, v83 in v80 do
                                if v82 == #v80 or v77 <= v83.reward_amount then
                                    v81 = "rbxassetid://" .. v83.image_id
                                    break
                                end
                            end
                            v78 = {
                                ["name"] = v79.human_readable,
                                ["rarity"] = "common",
                                ["image"] = v81
                            }
                            goto l40
                        end
                    end
                end
            end
            table.sort(v71, function(p84, p85)
                local v86 = p84.entry
                local v87 = p85.entry
                local v88 = p84.category
                local v89 = p85.category
                if v88 ~= p85.category then
                    if v88 == "currency" then
                        return false
                    end
                    if v89 == "currency" then
                        return true
                    end
                end
                if v88 == "currency" and v89 == "currency" then
                    return p84.amount > p85.amount
                else
                    local v90 = v_u_8[v86.rarity]
                    local v91 = v_u_8[v87.rarity]
                    if v90.value == v91.value then
                        local v92 = v_u_70[p84.kind]
                        local v93 = v_u_70[p85.kind]
                        if v92 == v93 or not (v92 and v93) then
                            return v86.name < v87.name
                        else
                            return v93 < v92
                        end
                    else
                        return v90.value < v91.value
                    end
                end
            end)
            local v94 = v_u_9.new()
            local v95 = v_u_18
            table.insert(v95, v94)
            for v96, v97 in v71 do
                local v98 = v97.entry
                local v99 = v_u_69:Clone()
                v99.ItemImage.Image = v98.image
                local v100 = v99:FindFirstChild("BottomFrame")
                local v101 = v100 and v100:FindFirstChild("TextFrame")
                if v101 then
                    if v97.amount > 1 then
                        local v102 = "x" .. v_u_5.add_number_commas(v97.amount)
                        local v103 = v101.TextLabel
                        v103.Text = v102
                        v101.Visible = true
                        local v104 = v103.AbsoluteSize
                        local v105 = v_u_14:GetTextSize(v102, v103.TextSize, v103.Font.Name, v103.AbsoluteSize).X / v104.X
                        v101.Size = UDim2.new(v101.Size.X.Scale * v105, 0, 1, 0)
                    else
                        v101.Visible = false
                    end
                end
                v99.LayoutOrder = v96
                v99.Parent = v_u_68
                if v98.animated then
                    v94:GiveTask(v_u_7.wrap(v99.ItemImage, "FlipbookLabel"):start(v98.flipbook_properties))
                end
                v94:GiveTask((v_u_17:hook_on_hover({
                    ["frame"] = v99,
                    ["type"] = "item_entry",
                    ["item_entry"] = v98
                })))
                v94:GiveTask(v99)
            end
            v67.CanvasSize = UDim2.new(0, 0, 0, v_u_68.UIGridLayout.AbsoluteContentSize.Y + 30)
            v94:GiveTask(function()
                v_u_69.Parent = v_u_68
            end)
        end
    end
end
function v16.cleanup()
    for _, v106 in v_u_18 do
        v106:DoCleaning()
    end
    v_u_18 = {}
end
function v16.init()
    local v107 = v_u_7.apps.TooltipApp
    v_u_17 = v_u_7.wrap(v107.instance, "ItemTooltip"):start(v107, v107.instance)
end
return v16