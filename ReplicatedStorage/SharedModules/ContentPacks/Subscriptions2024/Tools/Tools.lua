--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v23 = {
    ["SubscriptionCertificateTool"] = {
        ["client_use"] = function(p2, p3, _)
            if v_u_1("UIManager").apps.DialogApp:dialog({
                ["text"] = ("Are you sure you want to activate this %*?"):format(p2.name),
                ["left"] = "No",
                ["right"] = "Yes"
            }) == "Yes" then
                p3(true)
            end
            return false
        end,
        ["server_use"] = function(p4, p5, p6, _, p7)
            if p7 and (p6 and not p6.destroyed) then
                local v8
                if p5 then
                    v8 = p5.subscription_gifting
                else
                    v8 = p5
                end
                local v9
                if v8 then
                    v9 = v8.kind
                else
                    v9 = v8
                end
                assert(v8 and v9, "Missing subscription_gifting options in gift entry")
                local v10 = v_u_1("new:SubscriptionsDB")[v9]
                assert(v10, "Invalid subscription kind")
                local v11 = v_u_1("new:SubscriptionWrapperServer")
                local v12 = v_u_1("FormatHelper")
                local v13 = v_u_1("MsgBridge")
                local v14 = v_u_1("package:Stash")
                local v15 = v8.duration or 2592000
                local v16 = false
                local v17 = v11.get_mock_subscription(p4, v9)
                if v17 then
                    if v17.is_subscribed and v17.mock_subscription_identifier == p5.name then
                        if v17.expire_time then
                            local v18 = v17.expire_time.UnixTimestamp - DateTime.now().UnixTimestamp
                            v15 = v15 + math.max(0, v18)
                        end
                        if v15 > 7776000 then
                            local v19 = v15 - 7776000
                            local v20 = v12.get_time_breakdown(7776000).days
                            local v21 = v12.verbose_format_time(v19)
                            v13.dialog(p4, {
                                ["text"] = ("Your certificate duration cannot exceed %* days! Try again in %*"):format(v20, v21),
                                ["button"] = "Okay"
                            })
                            return
                        end
                        v16 = true
                    end
                    v17:destroy()
                end
                p6:destroy()
                v11.create_mock_subscription(p4, v9, {
                    ["renew"] = false,
                    ["period_duration"] = v15,
                    ["mock_subscription_identifier"] = p5.name,
                    ["source"] = "subscription_certificate"
                }):subscribe()
                v14:log("subscription_certificate_used", {
                    ["user_id"] = p4.UserId,
                    ["subscription_kind"] = v9,
                    ["item_kind"] = p5.kind,
                    ["item_unique"] = p6.unique,
                    ["total_duration"] = v15,
                    ["was_extended"] = v16
                })
            end
        end
    },
    ["GoldenFlower"] = {
        ["client_use"] = function(_, _, p22)
            v_u_1("HummingbirdAdoption").throw_food(p22.tool.ModelHandle, p22.item_data.unique)
        end
    }
}
return v23