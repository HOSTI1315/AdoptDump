--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.ShopInteriorHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("InteractionsEngine")
local v_u_3 = v_u_1("AnimationManager")
local v_u_4 = v_u_1("InteriorHelper")
local v_u_5 = v_u_1("FormatHelper")
local v_u_6 = v_u_1("LiveOpsTime")
local v_u_7 = v_u_1("UIManager")
local v8 = v_u_1("Maid")
local v_u_9 = v_u_1("AltCurrencyData")
local v_u_10 = v_u_1("package:Promise")
local v_u_11 = v_u_1("package:Sift")
local v_u_12 = v8.new()
local v_u_46 = {
    ["interaction_shop_items"] = function(p13, p14)
        for _, v15 in p13.ShopItems:GetChildren() do
            if v15.Name:find("^pet_accessories:") == nil then
                local v16
                if v15:IsA("Model") then
                    local v17 = v15:FindFirstChild("InteractionPart") or v15:FindFirstChild("Interact")
                    v16 = v_u_4.register_purchase_block_interaction(v17, v15.Name)
                else
                    v16 = v_u_4.register_purchase_block_interaction(v15, v15.Name)
                end
                table.insert(p14, v16)
            end
        end
    end,
    ["interaction_alt_currency_purchase"] = function(p18, p19)
        local v20 = v_u_2
        local v21 = {
            ["text"] = ("Buy %*"):format(v_u_9.human_readable),
            ["on_selected"] = function()
                v_u_7.set_app_visibility("AltCurrencyPurchaseApp", true)
            end,
            ["part"] = p18.Event.BuyCurrency.Buy
        }
        table.insert(p19, v20:register(v21))
    end,
    ["render_countdown"] = function(p_u_22, p_u_23)
        local v_u_29 = v_u_10.new(function(_, _, p24)
            while not p24() do
                local v25 = v_u_5.get_time_breakdown
                local v26 = p_u_23 - v_u_6.now()
                local v27 = v25((math.max(0, v26)))
                local v28
                if v27.days > 0 then
                    v28 = ("COMING IN %d %s"):format(v27.days, v27.days > 1 and "DAYS" or "DAY")
                else
                    v28 = v27.hours <= 0 and "COMING SOON" or ("COMING IN %d %s"):format(v27.hours, v27.hours > 1 and "HOURS" or "HOUR")
                end
                p_u_22.Text = v28
                task.wait(1)
            end
        end)
        v_u_12:GiveTask(function()
            v_u_29:cancel()
        end)
    end,
    ["render_mysteryblob"] = function(p_u_30)
        local v_u_35 = v_u_10.new(function(_, _, p31)
            local v32 = p_u_30.Blob
            local v33 = p_u_30.Blob2
            local v34 = math.random(5, 10) / 10
            while not p31() do
                v32.CFrame = v32.CFrame * CFrame.Angles(math.rad(v34), math.rad(v34), (math.rad(v34)))
                v33.CFrame = v32.CFrame
                task.wait()
            end
        end)
        v_u_12:GiveTask(function()
            v_u_35:cancel()
        end)
    end,
    ["render_mysteryblob_folder"] = function(p36)
        for _, v37 in p36:GetChildren() do
            v_u_46.render_mysteryblob(v37)
        end
    end,
    ["render_alt_currency_purchase"] = function(p38)
        local v39 = p38.Event.BuyCurrency.AnimationController:LoadAnimation(v_u_3.get_track("CandySpin"))
        v39:Play()
        v_u_12:GiveTask(v39)
    end,
    ["render_lootbox_rewards"] = function(p40, p41, p42)
        local v_u_43 = v_u_1("LootboxRewardsDisplay")
        v_u_43.render(p40, p41, p42)
        v_u_12:GiveTask(function()
            v_u_43.cleanup()
        end)
    end,
    ["render_accessory_mannequins"] = function(p44)
        if v_u_11.List.some(p44.ShopItems:GetChildren(), function(p45)
            return p45.Name:find("^pet_accessories:") ~= nil
        end) then
            v_u_12:GiveTask((v_u_4.render_accessory_mannequins_from_folder(p44, p44.ShopItems, {
                ["scale"] = 1
            })))
        end
    end,
    ["cleanup"] = function()
        v_u_12:DoCleaning()
    end
}
return v_u_46