--// ReplicatedStorage.new.modules.Ailments.AilmentsDB.at_work (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentEntry)
local v_u_2 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_3 = v_u_2("RoleplayDB")
return v1.new({
    ["kind"] = "at_work",
    ["category"] = "THEME",
    ["reward"] = 0,
    ["hide_reward"] = true,
    ["create_description"] = function(_)
        local v4 = game.Players.LocalPlayer
        local v5 = v_u_2("ClientData").get_server(v4, "roleplay_role")
        local v6 = v_u_3[v5.building_id].roles[v5.role_id]
        return {
            ["name"] = "At Work",
            ["override_category"] = v6.is_leadership_role and "GOLDEN" or nil,
            ["display_text"] = "Your pet won\'t need anything until you quit your job.",
            ["image"] = v6.icon,
            ["large_image"] = v6.large_icon or v6.icon
        }
    end,
    ["create_action"] = function(_)
        local v7 = game.ReplicatedStorage.new.modules.Ailments.ClientActions
        local v8 = require(v7.ActionSequence)
        local v9 = require(v7.DialogAction)
        local v10 = require(v7.InlineAction)
        local v_u_11 = v_u_2("RouterClient")
        return v8.new({ v9.new({
                ["text"] = "Quit your job?",
                ["left"] = "No",
                ["right"] = "Yes",
                ["confirm"] = "Yes"
            }), v10.new(function()
                v_u_11.get("RoleplayAPI/AbandonRoleplayRole"):FireServer()
                return true
            end) })
    end,
    ["create_server_components"] = function(_, _)
        return {}
    end
})