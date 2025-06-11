--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HatShopUGCDisplayApp.UGCPurchasesPage (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("UGCHelper")
local v_u_4 = v1("UGCPurchaseManagerClient")
local v_u_5 = v1("TweenPromise")
local v_u_6 = v1("ViewportModelFitter")
local v_u_7 = v1("Maid")
local v_u_8 = v1("package:Sift")
local v_u_9 = v1("package:Promise")
local v_u_10 = game:GetService("Players")
local v_u_11 = game:GetService("MarketplaceService")
local v_u_12 = game:GetService("RunService")
local v_u_13 = v_u_10.LocalPlayer
local v_u_14 = {}
local v15 = v2("UGCPurchasesPage", v1("UIBaseElement"))
local function v_u_18(p16)
    while true do
        local v17 = p16:FindFirstChildOfClass("LuaSourceContainer", true)
        if not v17 then
            break
        end
        v17:Destroy()
    end
end
function v15._start_hint(p19)
    p19.hint_state = "HasNoPurchases"
    p19:_update_hint("HasNoPurchases")
end
function v15._update_hint(p_u_20, p21)
    local v22 = p_u_20.instance.HintFrame.Hints
    local v_u_23 = v22.Legend
    local v_u_24 = v22.Purchasable
    local v25 = nil
    if p21 == "HasNoPurchases" then
        v_u_24.Visible = true
        v_u_23.Visible = false
        v_u_24.Position = UDim2.new()
        v25 = v_u_9.resolve()
    elseif p21 == "HasPurchases" then
        v25 = v_u_9.new(function(_, _, p26)
            v_u_24.Visible = true
            v_u_23.Visible = true
            while not p26() do
                if p_u_20.UIManager.is_visible("HatShopUGCDisplayApp") then
                    local v_u_27 = v_u_9.try(function()
                        v_u_24.Position = UDim2.fromScale(0, 0)
                    end):andThen(function()
                        return v_u_9.delay(8)
                    end):andThen(function()
                        return v_u_5.new(v_u_24, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["Position"] = UDim2.fromScale(0, 1)
                        })
                    end):andThen(function()
                        return v_u_9.delay(8)
                    end):andThen(function()
                        v_u_24.Position = UDim2.fromScale(0, -1)
                        return v_u_5.new(v_u_24, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["Position"] = UDim2.fromScale(0, 0)
                        })
                    end)
                    local v_u_28 = v_u_9.try(function()
                        v_u_23.Position = UDim2.fromScale(0, -1)
                    end):andThen(function()
                        return v_u_9.delay(8)
                    end):andThen(function()
                        return v_u_5.new(v_u_23, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["Position"] = UDim2.fromScale(0, 0)
                        })
                    end):andThen(function()
                        return v_u_9.delay(8)
                    end):andThen(function()
                        return v_u_5.new(v_u_23, TweenInfo.new(1, Enum.EasingStyle.Linear), {
                            ["Position"] = UDim2.fromScale(0, 1)
                        })
                    end)
                    p26(function()
                        v_u_27:cancel()
                        v_u_28:cancel()
                    end)
                    v_u_9.all({ v_u_27, v_u_28 }):await()
                else
                    task.wait(8)
                end
            end
        end):catch(warn):finally(function()
            v_u_24.Visible = true
            v_u_23.Visible = false
            v_u_24.Position = UDim2.new()
        end)
    else
        error(("Invalid hint state: %s"):format((tostring(p21))))
    end
    if p_u_20.hint_promise then
        p_u_20.hint_promise:cancel()
    end
    p_u_20.hint_promise = v25
end
function v15._refresh_hint(p29)
    local v30 = #v_u_4.get_purchases() > 0 and "HasPurchases" or "HasNoPurchases"
    if v30 ~= p29.hint_state then
        p29.hint_state = v30
        p29:_update_hint(v30)
    end
end
local function v_u_43(p31, p32)
    local v_u_33 = p32.asset_id
    local v34 = p32.is_purchased
    local v35 = p32.is_claimed
    local v_u_36 = p32.info
    local v37
    if p32.order then
        v37 = p32.order
    else
        v37 = p31.LayoutOrder
    end
    p31.ItemImage.Image = ("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(v_u_33)
    p31.Background.ClaimedCircle.Visible = v34 and v35
    local v38 = p31.Background.UnclaimedCircle
    local v39
    if v34 then
        v39 = not v35
    else
        v39 = v34
    end
    v38.Visible = v39
    p31.LayoutOrder = v37
    local v_u_40 = p31.PriceFrame
    if v34 then
        p31.Background.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
        v_u_40.Visible = false
        return
    else
        p31.Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v_u_40.Visible = true
        v_u_40.PriceText.Text = "???"
        if v_u_14[v_u_33] then
            v_u_40.PriceText.Text = v_u_14[v_u_33]
        else
            task.spawn(function()
                if v_u_36 then
                    v_u_40.PriceText.Text = v_u_36.PriceInRobux
                end
                local v41, v42 = pcall(v_u_11.GetProductInfo, v_u_11, v_u_33)
                if v41 then
                    v_u_14[v_u_33] = v42.PriceInRobux
                    v_u_40.PriceText.Text = v42.PriceInRobux
                else
                    warn(v42)
                end
            end)
        end
    end
end
function v15._start_inspect_modal(p_u_44)
    local v45 = p_u_44.instance.InspectModal
    v45.Visible = false
    local v46 = v45.PreviewFrame.ViewportFrame
    local v47 = Instance.new("Camera")
    v47.Parent = v46
    v46.CurrentCamera = v47
    local v48 = {
        ["mouse_button1_click"] = function()
            v_u_11:PromptPurchase(v_u_13, p_u_44.inspected_asset_id, false)
        end
    }
    p_u_44.buy_button = p_u_44.UIManager.wrap(v45.BuyButton, "DepthButton"):start(v48)
    p_u_44.buy_button:set_state("normal")
    p_u_44.cancel_button = p_u_44.UIManager.wrap(v45.CancelButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_44:_hide_inspect_modal()
        end
    })
    p_u_44.cancel_button:set_state("cancel")
    p_u_44.inspect_maid = v_u_7.new()
end
function v15._refresh_inspect_modal(p_u_49)
    local v_u_50 = p_u_49.inspected_asset_id
    if v_u_50 then
        local v51 = p_u_49.instance.InspectModal.PreviewFrame
        local v52 = v51.ItemFrame
        local v53 = v51.ItemName
        local v_u_54 = v_u_3.get_info_for_asset_id(v_u_50)
        local v55 = v_u_4.is_purchased(v_u_50)
        v_u_43(v52, {
            ["asset_id"] = v_u_50,
            ["is_purchased"] = v55,
            ["is_claimed"] = v_u_4.is_claimed(v_u_50),
            ["info"] = v_u_54
        })
        v53.Text = not v_u_54 and "???" or v_u_54.Name
        if v55 then
            p_u_49.buy_button.instance.Face.AlreadyOwned.Visible = true
            p_u_49.buy_button.instance.Face.Purchasable.Visible = false
            p_u_49.buy_button:set_state("unpressable")
            return
        else
            p_u_49.buy_button.instance.Face.AlreadyOwned.Visible = false
            p_u_49.buy_button.instance.Face.Purchasable.Visible = true
            p_u_49.buy_button:set_state("normal")
            p_u_49.buy_button.instance.Face.Purchasable.PriceText.Text = "???)"
            if v_u_14[v_u_50] then
                p_u_49.buy_button.instance.Face.Purchasable.PriceText.Text = ("%*)"):format(v_u_14[v_u_50])
            else
                task.spawn(function()
                    if v_u_54 then
                        p_u_49.buy_button.instance.Face.Purchasable.PriceText.Text = ("%*)"):format(v_u_54.PriceInRobux)
                    end
                    local v56, v57 = pcall(v_u_11.GetProductInfo, v_u_11, v_u_50)
                    if v56 then
                        v_u_14[v_u_50] = v57.PriceInRobux
                        p_u_49.buy_button.instance.Face.Purchasable.PriceText.Text = ("%*)"):format(v57.PriceInRobux)
                    else
                        warn(v57)
                    end
                end)
            end
        end
    else
        return
    end
end
function v15._show_inspect_modal(p_u_58, p_u_59)
    local v60 = p_u_58.instance.InspectModal
    local v61 = v60.PreviewFrame
    local v_u_62 = v61.ViewportFrame
    local v_u_63 = v61.FailedToLoad
    local v_u_64 = v61.LoadingSpinner
    p_u_58.inspect_maid:GiveTask(v_u_12.Heartbeat:Connect(function()
        if v_u_64.Visible then
            v_u_64.Rotation = os.clock() * 180 % 360
        end
    end))
    p_u_58.inspected_asset_id = p_u_59
    local v_u_65 = v_u_3.get_info_for_asset_id(p_u_59)
    v60.Visible = true
    v_u_64.Visible = true
    v_u_62.Visible = false
    v_u_63.Visible = false
    p_u_58:_refresh_inspect_modal()
    if v_u_65 then
        v_u_9.try(function()
            local v66 = game.Players:GetHumanoidDescriptionFromUserId(v_u_13.UserId)
            local v67 = v66:GetAccessories(true)
            local v68 = {
                ["AssetId"] = p_u_59,
                ["AccessoryType"] = v_u_65.AccessoryType,
                ["IsLayered"] = false
            }
            table.insert(v67, v68)
            v66:SetAccessories(v67, true)
            local v69 = v_u_10:CreateHumanoidModelFromDescription(v66, Enum.HumanoidRigType.R15)
            local v70 = v69.HumanoidRootPart
            local v71 = v69.Humanoid
            local v72 = v71.Animator
            local v73 = Instance.new("Animation")
            v73.AnimationId = ("rbxassetid://%d"):format(v66.IdleAnimation)
            v69.Name = "Dummy"
            v_u_18(v69)
            local v74 = v71.HipHeight
            v69:SetPrimaryPartCFrame(CFrame.new(0, v70.Size.Y / 2 + v74, 0))
            v69.Parent = v_u_62.WorldModel
            v72:LoadAnimation(v73):Play()
            local v_u_75 = v_u_62.CurrentCamera
            local v76 = v_u_6.new(v_u_62, v_u_62.CurrentCamera, v69):get_fit_distance() * 0.7
            local v77 = v69:FindFirstChild(v_u_65.AttachmentName, true).WorldPosition.Y
            local v78 = CFrame.lookAt
            local v79 = -v76
            local v_u_80 = v78(Vector3.new(0, v77, v79), (Vector3.new(0, v77, 0)))
            v_u_75.CFrame = v_u_80
            local v_u_81 = os.clock()
            p_u_58.inspect_maid:GiveTask(v_u_12.Heartbeat:Connect(function()
                local v82 = (os.clock() - v_u_81) * 6.283185307179586 / 30 % 6.283185307179586
                v_u_75.CFrame = CFrame.Angles(0, v82, 0) * v_u_80
            end))
            v_u_62.Visible = true
            v_u_64.Visible = false
            p_u_58.inspect_maid:GiveTask(v69)
        end):catch(function(p83)
            warn(p83)
            v_u_64.Visible = false
            v_u_63.Visible = true
            if v_u_62:FindFirstChild("Dummy") then
                v_u_62.Dummy:Destroy()
            end
        end)
    else
        v_u_64.Visible = false
        v_u_63.Visible = true
    end
end
function v15._hide_inspect_modal(p84)
    p84.instance.InspectModal.Visible = false
    p84.inspect_maid:DoCleaning()
end
function v15._refresh_item_grid(p_u_85)
    local v86 = v_u_3.get_asset_ids()
    local v87 = v_u_8.List.toSet(v_u_4.get_purchases())
    local v88 = v_u_8.List.toSet(v_u_4.get_claimed())
    local v89 = v_u_3.get_infos()
    for v90, v_u_91 in ipairs(v86) do
        local v92 = p_u_85.content:FindFirstChild((tostring(v_u_91)))
        if not v92 then
            v92 = p_u_85.item_template:Clone()
            v92.Name = tostring(v_u_91)
            v92.Parent = p_u_85.content
            v92.Button.MouseButton1Click:Connect(function()
                p_u_85:_show_inspect_modal(v_u_91)
            end)
        end
        v_u_43(v92, {
            ["asset_id"] = v_u_91,
            ["is_purchased"] = v_u_8.Set.has(v87, v_u_91),
            ["is_claimed"] = v_u_8.Set.has(v88, v_u_91),
            ["info"] = v89[v_u_91],
            ["order"] = v90
        })
    end
end
function v15._refresh_all(p93)
    p93.refresh_all_pending = false
    p93:_refresh_item_grid()
    p93:_refresh_hint()
    p93:_refresh_inspect_modal()
end
function v15.start(p_u_94)
    local v95 = p_u_94.instance
    p_u_94.item_template = v95:FindFirstChild("ItemTemplate", true)
    p_u_94.item_template.Parent = nil
    p_u_94.content = v95:FindFirstChild("Content", true)
    p_u_94.refresh_all_pending = false
    p_u_94:_start_hint()
    p_u_94:_start_inspect_modal()
    v_u_4.get_changed_signal():Connect(function()
        if p_u_94.instance.Visible then
            p_u_94:_refresh_all()
        else
            p_u_94.refresh_all_pending = true
        end
    end)
    v_u_3.get_on_asset_ids_changed_signal():Connect(function()
        if p_u_94.instance.Visible then
            p_u_94:_refresh_all()
        else
            p_u_94.refresh_all_pending = true
        end
    end)
    v_u_3.get_infos_changed_signal():Connect(function()
        if p_u_94.instance.Visible then
            p_u_94:_refresh_all()
        else
            p_u_94.refresh_all_pending = true
        end
    end)
    p_u_94:_refresh_all()
    return p_u_94
end
function v15.show(p96)
    if p96.refresh_all_pending then
        p96:_refresh_all()
    end
    p96.instance.Visible = true
end
function v15.hide(p97)
    p97.instance.Visible = false
    p97:_hide_inspect_modal()
end
return v15