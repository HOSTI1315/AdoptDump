--// ReplicatedStorage.ClientDB.RoleplayDB (ModuleScript)

local v1 = {}
local v2 = {
    ["name"] = "Salon",
    ["destination_id"] = "Salon",
    ["roles"] = {
        ["salon_manager"] = {
            ["name"] = "Salon Manager",
            ["icon"] = "rbxassetid://10056837589",
            ["large_icon"] = "rbxassetid://76709625823033",
            ["user_limit"] = 1,
            ["is_leadership_role"] = true,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["advertised_task_action_name"] = "task",
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true
        },
        ["salon_stylist"] = {
            ["name"] = "Stylist",
            ["icon"] = "rbxassetid://10056837589",
            ["large_icon"] = "rbxassetid://76709625823033",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true
        }
    }
}
v1.salon = v2
local v3 = {
    ["name"] = "Pizza Shop",
    ["destination_id"] = "PizzaShop",
    ["roles"] = {
        ["pizza_chef"] = {
            ["name"] = "Chef",
            ["icon"] = "rbxassetid://10225993537",
            ["large_icon"] = "rbxassetid://123974025196036",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 0,
                ["task"] = 100
            },
            ["advertised_pay_per_task"] = 10,
            ["advertised_task_action_name"] = "pizza made",
            ["pay_outside_designated_interior"] = false
        },
        ["pizza_server"] = {
            ["name"] = "Waiter / Waitress",
            ["icon"] = "rbxassetid://10225993337",
            ["large_icon"] = "rbxassetid://123974025196036",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false
        },
        ["pizza_manager"] = {
            ["name"] = "Manager",
            ["icon"] = "rbxassetid://10225993337",
            ["large_icon"] = "rbxassetid://123974025196036",
            ["user_limit"] = 1,
            ["is_leadership_role"] = true,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false
        }
    }
}
v1.pizza_shop = v3
local v4 = {
    ["name"] = "Criminal Base",
    ["destination_id"] = "CriminalBase",
    ["roles"] = {
        ["criminal"] = {
            ["name"] = "Criminal",
            ["icon"] = "rbxassetid://10056837420",
            ["user_limit"] = 0,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 20,
                ["task"] = 80
            },
            ["advertised_pay_per_task"] = 16,
            ["advertised_task_action_name"] = "steal",
            ["pay_outside_designated_interior"] = true
        },
        ["mafia_boss"] = {
            ["name"] = "Mafia Boss",
            ["icon"] = "rbxassetid://10056837420",
            ["user_limit"] = 0,
            ["is_leadership_role"] = true,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 20,
                ["task"] = 80
            },
            ["advertised_pay_per_task"] = 16,
            ["advertised_task_action_name"] = "steal",
            ["pay_outside_designated_interior"] = true
        }
    }
}
v1.criminal_base = v4
local v5 = {
    ["name"] = "Detective Building",
    ["destination_id"] = "DetectiveBuilding",
    ["roles"] = {
        ["detective"] = {
            ["name"] = "Detective",
            ["icon"] = "rbxassetid://10056836941",
            ["user_limit"] = 0,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 20,
                ["task"] = 80
            },
            ["advertised_pay_per_task"] = 16,
            ["advertised_task_action_name"] = "arrest",
            ["pay_outside_designated_interior"] = true
        },
        ["chief"] = {
            ["name"] = "Chief Detective",
            ["icon"] = "rbxassetid://10056836941",
            ["user_limit"] = 0,
            ["is_leadership_role"] = true,
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 50,
                ["task"] = 50
            },
            ["advertised_pay_per_task"] = 16,
            ["advertised_task_action_name"] = "arrest",
            ["pay_outside_designated_interior"] = true
        }
    }
}
v1.detective_building = v5
local v6 = {
    ["name"] = "Hospital",
    ["destination_id"] = "Hospital",
    ["roles"] = {
        ["nurse"] = {
            ["name"] = "Nurse",
            ["icon"] = "rbxassetid://14042557924",
            ["large_icon"] = "rbxassetid://110043391298210",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true,
            ["allowed_ailments"] = { "sick" }
        },
        ["doctor"] = {
            ["name"] = "Doctor",
            ["icon"] = "rbxassetid://14042560602",
            ["large_icon"] = "rbxassetid://106771695030058",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true,
            ["allowed_ailments"] = { "sick" }
        }
    }
}
v1.hospital = v6
local v7 = {
    ["name"] = "School",
    ["destination_id"] = "School",
    ["roles"] = {
        ["teacher"] = {
            ["name"] = "Teacher",
            ["icon"] = "rbxassetid://14042559473",
            ["large_icon"] = "rbxassetid://121106209884182",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true
        },
        ["principal"] = {
            ["name"] = "Principal",
            ["icon"] = "rbxassetid://14042559473",
            ["large_icon"] = "rbxassetid://121106209884182",
            ["pay_percentage_breakdown"] = {
                ["roleplay"] = 100,
                ["task"] = 0
            },
            ["is_leadership_role"] = true,
            ["advertised_pay_per_task"] = 0,
            ["pay_outside_designated_interior"] = false,
            ["can_interact_with_strangers"] = true
        }
    }
}
v1.school = v7
local v8 = {}
for v9, v10 in pairs(v1) do
    for v11, v12 in pairs(v10.roles) do
        local v13 = v8[v11] == nil
        assert(v13, "Duplicate role_id detected. Must be unique.")
        v8[v11] = true
        v12.building_id = v9
        v12.role_id = v11
        v12.building_entry = v10
    end
end
return v1