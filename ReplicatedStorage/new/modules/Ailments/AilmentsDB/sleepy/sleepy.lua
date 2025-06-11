--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.sleepy (ModuleScript)

return require(script.Parent.Parent.AilmentEntry).new({
    ["kind"] = "sleepy",
    ["category"] = "DEFAULT",
    ["reward"] = 8,
    ["create_description"] = function(_)
        return {
            ["name"] = "Sleepy",
            ["display_text"] = "Take your pet to a crib to get some rest.",
            ["image"] = "rbxassetid://18861598641",
            ["large_image"] = "rbxassetid://18861482304",
            ["speech_bubble"] = "I need some sleep... \240\159\152\180",
            ["cleared_text"] = "%s is well rested!"
        }
    end,
    ["create_action"] = function(_)
        local v1 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v2 = require(v1.ActionChoice)
        local v3 = require(v1.NavigateOrBuyFurnitureAction)
        local v4 = v2.new
        local v5 = {}
        local v6 = {
            ["text"] = "Go to the Nearest Crib",
            ["action"] = v3.new({
                ["ailment_to_boost"] = "sleepy",
                ["kind"] = "basiccrib"
            })
        }
        __set_list(v5, 1, {v6})
        return v4(v5)
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})