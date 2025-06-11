--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.mystery (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Helpers.MysteryHelper)
return v1.new({
    ["kind"] = "mystery",
    ["category"] = "SPECIAL",
    ["reward"] = 0,
    ["not_for_babies"] = true,
    ["create_description"] = function(_)
        return {
            ["name"] = "Choose",
            ["display_text"] = "Choose what your pet needs next!",
            ["image"] = "rbxassetid://18939208939",
            ["large_image"] = "rbxassetid://18939211149",
            ["speech_bubble"] = "What should we do? \226\157\147\240\159\152\129\240\159\164\148"
        }
    end,
    ["create_action"] = function(p3)
        return v_u_2.get_action(p3)
    end,
    ["create_server_components"] = function(_, p4, p5)
        return v_u_2.get_components(p4, p5)
    end
})