--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ExportAvatarApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("XboxSupport")
local v3 = v1("Class")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("CatalogItemImage")
local v_u_6 = v1("PlatformM")
local v7 = v1("CatalogRetry")
local v_u_8 = v1("TableUtil")
local v_u_9 = v1("AvatarClientManager")
local v_u_10 = v1("DownloadClient")
local v_u_11 = game:GetService("MarketplaceService")
local v_u_12 = game:GetService("TweenService")
local v_u_13 = game:GetService("AvatarEditorService")
local v_u_14 = game:GetService("UserInputService")
local v_u_15 = game:GetService("HttpService")
v_u_6.get_platform()
local v_u_16 = {
    "ClimbAnimation",
    "FallAnimation",
    "IdleAnimation",
    "JumpAnimation",
    "MoodAnimation",
    "RunAnimation",
    "SwimAnimation",
    "WalkAnimation",
    "Face",
    "Head",
    "LeftArm",
    "LeftLeg",
    "RightArm",
    "RightLeg",
    "Torso",
    "GraphicTShirt",
    "Pants",
    "Shirt"
}
local v17 = v3("ExportAvatarApp", v1("UIBaseApp"))
local v_u_18 = {}
local function v_u_19(...) end
local v_u_20 = v7.with_logger(v_u_19)
local function v_u_25(p21)
    local v22 = Instance.new("HumanoidDescription")
    for v23, v24 in p21 do
        if string.find(v23, "Color") then
            v22[v23] = Color3.fromHex(v24)
        else
            v22[v23] = v24
        end
    end
    return v_u_13:ConformToAvatarRules(v22)
end
function v17._reset_rendering(p26)
    for _, v27 in p26.item_container:GetChildren() do
        if v27:IsA("ImageButton") then
            v27:Destroy()
        end
    end
    p26.instance.Frame.Body.ScrollComplex.ScrollingFrame.CanvasSize = UDim2.new(1, 0, 1, 0)
    p26.status_label.Text = p26.default_status_label_text
end
local function v_u_36(p_u_28, p_u_29)
    local v30 = ("%*-%*"):format(p_u_28, p_u_29.Value)
    if v_u_18[v30] then
        return v_u_18[v30]
    end
    local v31 = v_u_20(function()
        v_u_19((("get_required_purchasables_async() getting item details about asset %*"):format(p_u_28)))
        return v_u_13:GetItemDetails(p_u_28, p_u_29)
    end)
    if not v31 then
        return {}
    end
    local v32 = v31.IsPurchasable
    local v33 = v31.ItemRestrictions and v_u_8.is_member(v31.ItemRestrictions, "LimitedUnique") and true or false
    local v34 = {
        ["owned"] = v31.Owned
    }
    local v35
    if v33 or not v32 then
        v35 = nil
    else
        v35 = v31.Price
    end
    v34.price = v35
    if v34.owned then
        v_u_18[v30] = v34
    end
    return v34
end
local function v_u_57(p37)
    local v38, v39 = v_u_4.get("AvatarAPI/GetRequiredPurchasablesForExportingAvatar"):InvokeServer(p37)
    if typeof(v38) ~= "table" then
        return {}
    end
    for _, v40 in v38 do
        if v40.is_adopt_me_custom_asset then
            v40.owned = false
        else
            local v41
            if v40.bundle_id then
                v41 = v40.bundle_id
            else
                v41 = v40.asset_id
            end
            local v42 = v_u_36
            local v43
            if v40.bundle_id then
                v43 = Enum.AvatarItemType.Bundle
            else
                v43 = Enum.AvatarItemType.Asset
            end
            local v44 = v42(v41, v43)
            v40.owned = v44.owned
            v40.price = v44.price
        end
    end
    local v45 = {
        ["owned"] = true,
        ["base_avatar_description"] = v_u_25(v39),
        ["category"] = "base_avatar"
    }
    table.insert(v38, v45)
    table.sort(v38, function(p46, p47)
        local v48 = 0 + (p46.owned and 5 or 0)
        local v49 = 0 + (p47.owned and 5 or 0)
        local v50 = v48 + (p46.base_avatar_description and 0 or 1)
        local v51 = v49 + (p47.base_avatar_description and 0 or 1)
        local v52 = v50 + (p46.price and 1 or 0)
        local v53 = v51 + (p47.price and 1 or 0)
        if v52 ~= v53 then
            return v53 < v52
        end
        if p46.category ~= p47.category then
            return p46.category > p47.category
        end
        local v54 = p46.asset_id
        local v55 = tostring(v54)
        local v56 = p47.asset_id
        return tostring(v56) < v55
    end)
    return v38
end
function v17._render_items(p_u_58, p59)
    if p_u_58.is_rendering then
        return
    elseif p_u_58.currently_exporting then
        return
    else
        p_u_58.is_rendering = true
        p_u_58:_reset_rendering()
        if p59 then
            p59 = p_u_58.cached_items
        end
        if not p59 then
            p_u_58.status_label.Text = "Loading..."
            for _ = 1, 8 do
                local v60 = p_u_58.item_template:Clone()
                v60.Contents:Destroy()
                v60.Parent = p_u_58.item_container
                v_u_12:Create(v60, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 120, true), {
                    ["ImageTransparency"] = 0.8
                }):Play()
            end
        end
        local v_u_61 = p59 or v_u_57(p_u_58.avatar_type)
        p_u_58.cached_items = v_u_61
        p_u_58:_reset_rendering()
        if p_u_58.instance.Frame.Visible then
            for _, v_u_62 in v_u_61 do
                local v_u_63 = v_u_62.bundle_id
                local v_u_64 = v_u_62.asset_id
                local v65 = v_u_62.category
                local v66 = v_u_62.owned
                local v67 = v_u_62.price
                local v68 = p_u_58.item_template:Clone()
                if v67 and not v66 then
                    v68.Contents.BuyButton.Frame.Cost.TextLabel.Text = v67
                    local function v_u_74()
                        if v_u_63 then
                            v_u_11:PromptBundlePurchase(game.Players.LocalPlayer, v_u_63)
                            local _, v69, v70 = v_u_11.PromptBundlePurchaseFinished:Wait()
                            if v69 ~= v_u_63 or not v70 then
                                return
                            end
                        else
                            v_u_11:PromptPurchase(game.Players.LocalPlayer, v_u_64)
                            local _, v71, v72 = v_u_11.PromptPurchaseFinished:Wait()
                            if v71 ~= v_u_64 or not v72 then
                                return
                            end
                        end
                        v_u_62.owned = true
                        if v_u_63 then
                            for _, v73 in v_u_61 do
                                if v73.bundle_id == v_u_63 then
                                    v73.owned = true
                                end
                            end
                        end
                        p_u_58:_render_items(true)
                    end
                    v68[v_u_6.mouse_down_or_click()]:Connect(v_u_74)
                    p_u_58.UIManager.wrap(v68.Contents.BuyButton, "BasicButton"):start({
                        [v_u_14.TouchEnabled and "mouse_button1_click" or "mouse_button1_down"] = function()
                            v_u_74()
                        end
                    })
                    if v_u_6.is_using_gamepad() then
                        v68.Contents.BuyButton.Selectable = false
                    end
                else
                    v68.Contents.BuyButton:Destroy()
                end
                local v75 = v65 == "skin_tone" and "owned_export_item" or (v66 and "owned_export_item" or "unowned_export_item")
                if v75 then
                    p_u_58.UIManager.wrap(v68, "ItemBorderIndicator"):start({
                        ["style"] = v75
                    })
                end
                v68.Parent = p_u_58.item_container
                if v_u_62.base_avatar_description then
                    local v_u_76 = Instance.new("ViewportFrame")
                    v_u_76.Size = UDim2.new(1, 0, 1, 0)
                    v_u_76.BackgroundTransparency = 1
                    local v_u_77 = Instance.new("Camera")
                    v_u_77.Parent = v_u_76
                    v_u_76.CurrentCamera = v_u_77
                    v_u_76.Parent = v68.ItemImage
                    task.spawn(function()
                        local v78 = v_u_10.promise_download_copy("BaseAvatarMannequin", nil, {
                            ["params_deduplication_hash"] = v_u_15:GenerateGUID(),
                            ["avatar_type"] = p_u_58.avatar_type
                        }):expect()
                        if v78 then
                            if not v_u_76:IsDescendantOf(game) then
                                v78:Destroy()
                                return
                            end
                            v78.Parent = v_u_76
                            v_u_77.CFrame = CFrame.new(v78.HumanoidRootPart.CFrame * Vector3.new(-2, 2, -3), v78.HumanoidRootPart.Position)
                        end
                    end)
                else
                    v68.ItemImage.Image = v_u_5.get("player", v65, v_u_64)
                end
            end
            p_u_58.instance.Frame.Body.ScrollComplex.ScrollingFrame.CanvasSize = UDim2.new(1, 0, 0, p_u_58.item_container.UIGridLayout.AbsoluteContentSize.Y + 20)
            p_u_58.is_rendering = false
        else
            p_u_58.is_rendering = false
        end
    end
end
function v17.show(p_u_79)
    p_u_79.instance.Frame.Visible = true
    p_u_79:_resize()
    task.spawn(function()
        p_u_79:_render_items()
    end)
end
function v17.hide(p80)
    p80.instance.Frame.Visible = false
    if not (p80.is_rendering or p80.currently_exporting) then
        p80:_reset_rendering()
    end
end
local function v_u_90(p81, p82, _)
    local v83 = p82:Clone()
    for _, v84 in v_u_16 do
        local v85 = p81[v84] or 0
        if v85 == 0 then
            v83[v84] = 0
        else
            local v86 = v_u_36(v85, Enum.AvatarItemType.Asset)
            if v86 and v86.owned then
                v83[v84] = p81[v84]
            else
                v83[v84] = p82[v84]
            end
        end
    end
    local v87 = {}
    for _, v88 in p81:GetAccessories(true) do
        local v89 = v_u_36(v88.AssetId, Enum.AvatarItemType.Asset)
        if v89 and v89.owned then
            table.insert(v87, v88)
        end
    end
    v83:SetAccessories(v87, true)
    v83.HeadColor = p81.HeadColor
    v83.LeftArmColor = p81.LeftArmColor
    v83.LeftLegColor = p81.LeftLegColor
    v83.RightArmColor = p81.RightArmColor
    v83.RightLegColor = p81.RightLegColor
    v83.TorsoColor = p81.TorsoColor
    v_u_19("remove_unowned_items_from_description completed.")
    return v83
end
local function v_u_98(p91)
    local v92 = game.Players.LocalPlayer.Character
    if not (v92 and v92.Parent) then
        return p91
    end
    local v93 = p91:GetAccessories(true)
    for _, v94 in v92:GetChildren() do
        if v94:IsA("Accessory") then
            local v95 = v94:GetAttribute("accessory_model_override_original_asset_id")
            if v95 then
                local v96 = v94:GetAttribute("accessory_model_override_original_accessory_type")
                if v96 then
                    local v97 = {
                        ["AssetId"] = v95,
                        ["AccessoryType"] = Enum.AccessoryType[v96]
                    }
                    table.insert(v93, v97)
                end
            end
        end
    end
    p91:SetAccessories(v93, true)
    return p91
end
function v17.start(p_u_99)
    p_u_99.avatar_type = "player"
    p_u_99.item_container = p_u_99.instance.Frame.Body.ScrollComplex.ScrollingFrame.Content
    p_u_99.item_template = p_u_99.item_container.ItemTemplate
    p_u_99.item_template.Parent = nil
    p_u_99.status_label = p_u_99.instance.Frame.Body.StatusLabel
    p_u_99.default_status_label_text = p_u_99.status_label.Text
    p_u_99.UIManager.wrap(p_u_99.instance.Frame.Body.Buttons.Cancel, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_99.UIManager.set_app_visibility(p_u_99.ClassName, false)
        end
    })
    local v_u_100 = nil
    local v103 = {
        ["mouse_button1_click"] = function()
            p_u_99.currently_exporting = true
            v_u_100:set_state("unpressable")
            p_u_99.UIManager.apps.HintApp:hint({
                ["text"] = "Getting avatar ready...",
                ["length"] = 5,
                ["overridable"] = true,
                ["yields"] = false
            })
            local v101 = game.Players.LocalPlayer.Character.Humanoid:GetAppliedDescription()
            local v102 = v_u_20(function()
                return game.Players:GetHumanoidDescriptionFromUserId(game.Players.LocalPlayer.UserId)
            end)
            v_u_13:PromptSaveAvatar(v_u_13:ConformToAvatarRules((v_u_90(v_u_98(v101), v102, p_u_99.cached_items))), Enum.HumanoidRigType.R15)
            if v_u_13.PromptSaveAvatarCompleted:Wait() == Enum.AvatarPromptResult.Success then
                p_u_99.UIManager.set_app_visibility(p_u_99.ClassName, false)
                p_u_99.UIManager.apps.HintApp:hint({
                    ["text"] = "Your Roblox Avatar has been updated!",
                    ["length"] = 5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                v_u_9.submit_analytics_event("roblox_avatar_saved")
            end
            p_u_99.currently_exporting = false
            v_u_100:set_state("normal")
            if p_u_99.instance.Frame.Visible == false and not p_u_99.is_rendering then
                p_u_99:_reset_rendering()
            end
        end
    }
    v_u_100 = p_u_99.UIManager.wrap(p_u_99.instance.Frame.Body.Buttons.Save, "DepthButton"):start(v103)
    v_u_2.quick_watch({
        ["selection_parent"] = p_u_99.instance.Frame,
        ["default_selection"] = p_u_99.instance.Frame.Body.Buttons.Save,
        ["app_name"] = p_u_99.ClassName
    })
end
function v17._resize(p104)
    if p104.instance.AbsoluteSize.Y > 680 then
        p104.instance.Frame.Size = UDim2.new(0, 835, 0, 600)
        p104.item_container.UIGridLayout.CellSize = UDim2.new(0, 106, 0, 106)
        p104.instance.Frame.Body.UIPadding.PaddingBottom = UDim.new(0, 20)
        p104.instance.Frame.Body.UIPadding.PaddingTop = UDim.new(0, 20)
        p104.instance.Frame.Body.UIPadding.PaddingLeft = UDim.new(0, 20)
        p104.instance.Frame.Body.UIPadding.PaddingRight = UDim.new(0, 20)
        p104.item_template.Contents.BuyButton.Size = UDim2.new(1, 0, 0, 27)
        p104.status_label.Size = p104.status_label.Size + UDim2.new(0, 0, 0, 10)
        p104.status_label.Position = p104.status_label.Position - UDim2.new(0, 0, 0, 10)
        p104.instance.Frame.Body.ScrollComplex.Size = p104.instance.Frame.Body.ScrollComplex.Size - UDim2.new(0, 0, 0, 20)
    end
end
return v17