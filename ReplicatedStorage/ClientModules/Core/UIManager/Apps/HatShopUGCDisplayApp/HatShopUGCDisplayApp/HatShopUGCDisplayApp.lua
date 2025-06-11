--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HatShopUGCDisplayApp.HatShopUGCDisplayApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("Signal")
local v_u_5 = v1("SharedConstants")
local v_u_6 = v1("InventoryDB")
local v_u_7 = v1("package:Promise")
local v_u_8 = v1("new:ToggleableSignal")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v11 = v2("HatShopUGCDisplayApp", v1("UIBaseApp"))
function v11.refresh(p12, p13)
    p12:set_visibility(p13[p12.ClassName] and true or false)
end
function v11._start_scrolling_background(p14)
    local v_u_15 = p14.instance.ScrollingBackground
    local v_u_16 = 0
    local v_u_17 = 0
    v_u_8.newConnect(v_u_10.Heartbeat, function(p18)
        v_u_16 = (v_u_16 + p18 * 18) % 500
        v_u_17 = (v_u_17 + p18 * -12) % 500
        v_u_15.Position = UDim2.new(0.5, v_u_16, 0.5, v_u_17)
    end):WithProperty(p14.instance, "Enabled")
end
function v11._start_top_buttons(p_u_19)
    local v_u_20 = p_u_19.instance.TopButtons
    p_u_19.reward_button = p_u_19.UIManager.wrap(v_u_20.RewardButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_19:_set_page("Reward")
        end
    })
    p_u_19.purchases_button = p_u_19.UIManager.wrap(v_u_20.PurchasesButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_19:_set_page("Purchases")
        end
    })
    p_u_19.help_button = p_u_19.UIManager.wrap(v_u_20.HelpButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_19.instructions_popup:show()
        end
    })
    local function v_u_24()
        if p_u_19.visible then
            local v21 = os.clock() - p_u_19.last_refresh_from_button_timestamp
            if v21 > 30 then
                v_u_20.RefreshButton.Face.Text.Text = "Refresh Purchases"
                p_u_19.refresh_button:set_state("selected")
            else
                local v22 = v_u_20.RefreshButton.Face.Text
                local v23 = 30 - v21
                v22.Text = ("Refresh Purchases (%d)"):format((math.floor(v23)))
                p_u_19.refresh_button:set_state("unpressable")
            end
        else
            return
        end
    end
    p_u_19.refresh_button = p_u_19.UIManager.wrap(v_u_20.RefreshButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_19.last_refresh_from_button_timestamp = os.clock()
            v_u_24()
            p_u_19:_refresh_purchases()
            p_u_19.refreshed_from_button_signal:Fire()
        end
    })
    p_u_19.purchases_button:set_state("inactive")
    p_u_19.reward_button:set_state("normal")
    p_u_19.help_button:set_state("selected")
    p_u_19.refresh_button:set_state("selected")
    task.defer(function()
        while true do
            v_u_24()
            task.wait(1)
        end
    end)
end
function v11._set_page(p25, p26)
    if p25.current_page == p26 then
        return
    else
        p25.current_page = p26
        if p26 == "Reward" then
            p25.reward_button:set_button_pressed("down")
            p25.reward_button:set_state("normal")
            p25.reward_button:set_enabled(false)
            p25.purchases_button:set_button_pressed("up")
            p25.purchases_button:set_state("inactive")
            p25.purchases_button:set_enabled(true)
            p25.reward_page:show()
            p25.purchases_page:hide()
            return
        elseif p26 == "Purchases" then
            p25.reward_button:set_button_pressed("up")
            p25.reward_button:set_state("inactive")
            p25.reward_button:set_enabled(true)
            p25.purchases_button:set_button_pressed("down")
            p25.purchases_button:set_state("normal")
            p25.purchases_button:set_enabled(false)
            p25.reward_page:hide()
            p25.purchases_page:show()
        else
            error(("Invalid page: %s"):format((tostring(p26))))
        end
    end
end
function v11._refresh_purchases(p27)
    p27.loading_spinner:show()
    p27.loading_spinner:set_text("Refreshing your purchases...")
    v_u_7.all({ v_u_7.delay(2), v_u_7.try(function()
            v_u_3.get("UGCAPI/RequestRefreshPurchases"):InvokeServer()
        end) }):catch(warn):await()
    p27.loading_spinner:hide()
end
function v11.start(p_u_28)
    local v29 = p_u_28.instance
    p_u_28.refreshed_for_first_time_since_showing = false
    p_u_28.refreshed_from_button_signal = v_u_4.new()
    p_u_28.last_refresh_from_button_timestamp = 0
    p_u_28:_start_scrolling_background()
    p_u_28:_start_top_buttons()
    p_u_28.loading_spinner = p_u_28.UIManager.wrap(v29.LoadingSpinnerOverlay, "UGCLoadingSpinner"):start()
    p_u_28.instructions_popup = p_u_28.UIManager.wrap(v29.InstructionsPopup, "UGCInstructionsPopup"):start({
        ["on_close"] = function()
            if not p_u_28.refreshed_for_first_time_since_showing then
                p_u_28.refreshed_for_first_time_since_showing = true
                p_u_28:_refresh_purchases()
            end
        end
    })
    p_u_28.reward_page = p_u_28.UIManager.wrap(v29.RewardPage, "UGCRewardPage"):start({
        ["refreshed_from_button_signal"] = p_u_28.refreshed_from_button_signal
    })
    p_u_28.purchases_page = p_u_28.UIManager.wrap(v29.PurchasesPage, "UGCPurchasesPage"):start()
    p_u_28.instructions_popup:show()
    p_u_28:_set_page("Reward")
    local v30 = v_u_5.ugc_pet_kind
    if v30 then
        v30 = v_u_6.pets[v_u_5.ugc_pet_kind]
    end
    if v30 then
        v29.RewardPage.BigReward.RewardImage.Image = v30.image
        v29.RewardPage.Reward.VisualContent.RewardImage.Image = v30.image
    end
    return p_u_28
end
function v11.show(p31)
    p31.instance.Parent = v_u_9.LocalPlayer.PlayerGui
    p31.instance.Enabled = true
    p31.refreshed_for_first_time_since_showing = false
    p31.instructions_popup:show()
    p31.reward_page:show()
    p31.reward_page:reset()
    p31:_set_page("Reward")
end
function v11.hide(p32)
    p32.instance.Parent = nil
    p32.instance.Enabled = false
    p32.reward_page:hide()
    p32.purchases_page:hide()
end
function v11.set_adornee(p33, p34)
    p33.instance.Adornee = p34
end
return v11