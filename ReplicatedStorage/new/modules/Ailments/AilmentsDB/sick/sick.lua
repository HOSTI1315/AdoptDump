--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.sick (ModuleScript)

local function v_u_2(p1)
    return p1.ailment_to_boost == "sick"
end
return require(script.Parent.Parent.AilmentEntry).new({
    ["kind"] = "sick",
    ["category"] = "GOLDEN",
    ["reward"] = 15,
    ["create_description"] = function(_)
        return {
            ["name"] = "Sick",
            ["display_text"] = "Your pet feels sick! Talk to the Doctor at the Hospital.",
            ["image"] = "rbxassetid://18861592802",
            ["large_image"] = "rbxassetid://18861478186",
            ["speech_bubble"] = "I feel sick! \240\159\164\146",
            ["cleared_text"] = "%s is healthy again!"
        }
    end,
    ["create_action"] = function(_)
        local v3 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v4 = require(v3.ActionChoice)
        local v5 = require(v3.ActionQueue)
        local v6 = require(v3.BackpackSelectAction)
        local v7 = require(v3.ItemNavigationAction)
        local v8 = require(v3.NavigationAction)
        local v9 = v5.new
        local v10 = {}
        local v11 = {
            ["category"] = "food",
            ["filter_callback"] = v_u_2
        }
        local v12 = v6.new(v11)
        local v13 = v4.new
        local v14 = {}
        local v15 = {
            ["text"] = "Get a Healing Item at the Hospital",
            ["action"] = v7.new({
                ["category"] = "food",
                ["kind"] = "healing_apple"
            })
        }
        __set_list(v14, 1, {v15})
        __set_list(v10, 1, {v12, v13(v14)})
        local v16 = v9(v10)
        local v17 = v4.new
        local v18 = {}
        local v20 = {
            ["text"] = "Go to the Hospital",
            ["emphasis"] = true,
            ["action"] = v8.new({
                ["final_destination"] = "Hospital",
                ["custom_position_or_method"] = function(p19)
                    if p19 then
                        return p19:WaitForChild("SickAilmentTarget").Position
                    else
                        return nil
                    end
                end
            })
        }
        __set_list(v18, 1, {v20, {
    ["text"] = "Choose Item",
    ["action"] = v16
}})
        return v17(v18)
    end,
    ["create_server_components"] = function(_, _, p21)
        local v22 = game.ServerScriptService.new.modules.Ailments.ServerComponents
        local v23 = require(v22.Expiration)
        local v24 = require(v22.InlineBehavior)
        local v25 = require(v22.Spreader)
        local v_u_26 = require(script.Parent.Parent.Parent.LegacyLoad)("MsgBridge")
        local v31 = {
            ["spreader"] = v25.new({
                ["ailment_kind"] = "sick",
                ["range"] = 12,
                ["debounce_time"] = 5,
                ["send_messages"] = function(p27, p28)
                    if p27:is_non_player() then
                        v_u_26.hint(p27.player, {
                            ["text"] = ("%* got %* sick!"):format(p27.char.Name, p28.char.Name),
                            ["length"] = 5,
                            ["overridable"] = true
                        })
                    else
                        v_u_26.hint(p27.player, {
                            ["text"] = ("You got %* sick!"):format(p28.char.Name),
                            ["length"] = 5,
                            ["overridable"] = true
                        })
                    end
                    if p27.player == p28.player then
                        return
                    elseif p28:is_non_player() then
                        v_u_26.hint(p28.player, {
                            ["text"] = ("%* made %* sick!"):format(p27.char.Name, p28.char.Name),
                            ["length"] = 5,
                            ["overridable"] = true
                        })
                    else
                        v_u_26.hint(p28.player, {
                            ["text"] = ("%* made you sick!"):format(p27.char.Name),
                            ["length"] = 5,
                            ["overridable"] = true
                        })
                    end
                end
            }),
            ["sick_tag"] = v24.new({
                ["start"] = function(p29)
                    if p29 then
                        p29:set_property("sick", true)
                    end
                end,
                ["stop"] = function(p30)
                    if p30 then
                        p30:set_property("sick", false)
                    end
                end
            }),
            ["expiration"] = v23.new({
                ["ailment_key"] = p21,
                ["seconds_into_cycle"] = 0
            })
        }
        return v31
    end
})