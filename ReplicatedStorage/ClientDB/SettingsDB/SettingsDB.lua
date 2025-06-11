--// ReplicatedStorage.ClientDB.SettingsDB (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v_u_2("package:t")
local v_u_4 = v_u_2("ColorThemeDB")
local v5 = v_u_3.strictInterface({
    ["category_name"] = v_u_3.string,
    ["settings"] = v_u_3.table,
    ["hidden"] = v_u_3.optional(v_u_3.boolean)
})
local v6 = v_u_3.strictInterface({
    ["id"] = v_u_3.string,
    ["type"] = v_u_3.string,
    ["default"] = v_u_3.any,
    ["container_options"] = v_u_3.table,
    ["element_options"] = v_u_3.table,
    ["validation"] = v_u_3.callback,
    ["transform"] = v_u_3.callback,
    ["hash"] = v_u_3.callback,
    ["server_callback"] = v_u_3.optional(v_u_3.callback),
    ["save_to_server_after_idle_for_seconds"] = v_u_3.optional(v_u_3.numberMin(0)),
    ["show_for_tags"] = v_u_3.optional(v_u_3.table),
    ["hide_if_trading_prohibited"] = v_u_3.optional(v_u_3.boolean),
    ["server_set_transform"] = v_u_3.optional(v_u_3.callback),
    ["should_hide"] = v_u_3.optional(v_u_3.callback),
    ["replicate_to_all_clients"] = v_u_3.optional(v_u_3.boolean)
})
local v7 = v_u_3.strictInterface({
    ["id"] = v_u_3.string,
    ["type"] = v_u_3.string,
    ["default"] = v_u_3.any,
    ["validation"] = v_u_3.callback,
    ["element_options"] = v_u_3.table,
    ["transform"] = v_u_3.callback,
    ["hash"] = v_u_3.callback,
    ["server_callback"] = v_u_3.optional(v_u_3.callback),
    ["save_to_server_after_idle_for_seconds"] = v_u_3.optional(v_u_3.numberMin(0)),
    ["server_set_transform"] = v_u_3.optional(v_u_3.callback)
})
local v30 = {
    {
        ["category_name"] = "Main",
        ["settings"] = {
            {
                ["id"] = "theme_color",
                ["type"] = "ColorPicker",
                ["default"] = "blue",
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Favorite Color",
                    ["description"] = "Choose your favorite color."
                },
                ["element_options"] = {
                    ["theme_colors_only"] = true
                }
            },
            {
                ["id"] = "background_music_volume",
                ["type"] = "Slider",
                ["default"] = 75,
                ["save_to_server_after_idle_for_seconds"] = 1,
                ["container_options"] = {
                    ["name"] = "Music Volume",
                    ["description"] = "Adjust the volume of the background music."
                },
                ["element_options"] = {
                    ["min"] = 0,
                    ["max"] = 100,
                    ["show_as_percentage"] = true,
                    ["interval"] = 5
                }
            },
            {
                ["id"] = "sound_effects_volume",
                ["type"] = "Slider",
                ["default"] = 75,
                ["save_to_server_after_idle_for_seconds"] = 1,
                ["container_options"] = {
                    ["name"] = "Sound Effects Volume",
                    ["description"] = "Adjust the volume of the sound effects."
                },
                ["element_options"] = {
                    ["min"] = 0,
                    ["max"] = 100,
                    ["show_as_percentage"] = true,
                    ["interval"] = 5
                }
            },
            {
                ["id"] = "edit_hotbar",
                ["type"] = "GeneralButton",
                ["default"] = true,
                ["container_options"] = {
                    ["name"] = "Edit Hotbar",
                    ["description"] = "Adds items to the hotbar, which lets you equip them without opening your backpack."
                },
                ["element_options"] = {
                    ["text"] = "\226\154\153\239\184\143"
                }
            }
        }
    },
    {
        ["category_name"] = "Gameplay",
        ["settings"] = {
            {
                ["id"] = "pet_radial_menu",
                ["type"] = "Switch",
                ["default"] = false,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Advanced Pet Menu",
                    ["description"] = "Pick up, feed, or ride your pet without zooming in."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "use_ailments_monitor",
                ["type"] = "Switch",
                ["default"] = false,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Classic Needs View",
                    ["description"] = "Show needs at the top of the screen instead of over pets."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "disable_ailments",
                ["type"] = "Switch",
                ["default"] = false,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Disable Needs",
                    ["description"] = "If on, you won\'t see any needs, and your pets won\'t get or clear any needs."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "pet_can_auto_exit_furniture",
                ["type"] = "Switch",
                ["default"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Pet Follows",
                    ["description"] = "If on, your pet follows you upon finishing tasks or if you walk too far away from them."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "furniture_advanced_colors",
                ["type"] = "Switch",
                ["default"] = false,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Furniture Multi-Coloring",
                    ["description"] = "Customize multiple colors on one furniture piece."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "vehicle_camera_follows",
                ["type"] = "Switch",
                ["default"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Vehicle Follow Camera",
                    ["description"] = "If on, in certain vehicles the camera will turn along with vehicle while driving."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "backpack_retain_filter",
                ["type"] = "Switch",
                ["default"] = false,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Retain Backpack Filter",
                    ["description"] = "Retains the active backpack filter after the backpack is closed."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "spawn_location",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["should_hide"] = function()
                    return not v_u_2("new:ChooseSpawnAB"):get_value("show_dialog")
                end,
                ["container_options"] = {
                    ["name"] = "Spawn Location",
                    ["description"] = "Determine where you spawn when you join the game."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Home", "Adoption Island" }
                }
            },
            {
                ["id"] = "show_spawn_location_dialog",
                ["type"] = "Switch",
                ["default"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["should_hide"] = function()
                    return true
                end,
                ["container_options"] = {},
                ["element_options"] = {}
            }
        }
    },
    {
        ["category_name"] = "Interaction",
        ["settings"] = {
            {
                ["id"] = "family_requests",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Families",
                    ["description"] = "Determine who can invite you to join a family."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Everyone", "Friends", "No One" }
                }
            },
            {
                ["id"] = "party_requests",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Parties",
                    ["description"] = "Determine who can send you party invites."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Everyone", "Friends", "No One" }
                }
            },
            {
                ["id"] = "trade_requests",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["hide_if_trading_prohibited"] = true,
                ["container_options"] = {
                    ["name"] = "Trading",
                    ["description"] = "Determine who can send you trading invites."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Everyone", "Friends", "No One" }
                }
            },
            {
                ["id"] = "trade_chat",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["hide_if_trading_prohibited"] = true,
                ["container_options"] = {
                    ["name"] = "Trade Chat",
                    ["description"] = "Determine what kind of chat you will see in the trading screen."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = {
                        "All",
                        "System Only",
                        "Partner Only",
                        "Quick Replies",
                        "None"
                    }
                }
            },
            {
                ["id"] = "give_item_requests",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Donations",
                    ["description"] = "Determine who can give you items."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Everyone", "Friends", "No One" }
                }
            },
            {
                ["id"] = "placeable_tool_permissions",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Stands",
                    ["description"] = "Determine who can set up stands in your home."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = { "Everyone", "Friends", "No One" }
                }
            },
            {
                ["id"] = "friends_are_family",
                ["type"] = "Switch",
                ["default"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["replicate_to_all_clients"] = true,
                ["server_callback"] = function(p8, _, p9)
                    if p9 ~= true then
                        v_u_2("FamilyHelper").on_friends_no_longer_behave_as_family(p8)
                    end
                end,
                ["container_options"] = {
                    ["name"] = "Friend Permissions",
                    ["description"] = "Let Roblox Friends interact with your pets, vehicles, and more."
                },
                ["element_options"] = {}
            }
        }
    },
    {
        ["category_name"] = "Graphics",
        ["settings"] = {
            {
                ["id"] = "char_icons",
                ["type"] = "Switch",
                ["default"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Character Icons",
                    ["description"] = "Show or hide character icons for players and pets."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "player_names_visibility",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["container_options"] = {
                    ["name"] = "Player Names",
                    ["description"] = "Show Player Names only for chosen players and their pets."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = {
                        "Everyone",
                        "Other Players",
                        "Only Me",
                        "No One"
                    }
                }
            },
            {
                ["id"] = "friendship_bar_visibility",
                ["type"] = "Dropdown",
                ["default"] = 1,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["container_options"] = {
                    ["name"] = "Friendship Bar Visibility",
                    ["description"] = "Show Friendship Bars only for chosen players\' pets."
                },
                ["element_options"] = {
                    ["choose_text"] = "Choices",
                    ["choices"] = {
                        "Everyone",
                        "Other Players",
                        "Only Me",
                        "No One"
                    }
                }
            }
        }
    },
    {
        ["category_name"] = "Extra",
        ["settings"] = {
            {
                ["id"] = "display_rank",
                ["type"] = "Switch",
                ["default"] = true,
                ["replicate_to_all_clients"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["show_for_tags"] = {
                    "influencer",
                    "staff",
                    "developer",
                    "founder"
                },
                ["server_callback"] = function(p_u_10, _, p_u_11)
                    coroutine.wrap(function()
                        local v12 = v_u_2("DataM").get_store(p_u_10)
                        local v13 = v12:get("char_wrapper")
                        while not v13 do
                            v13 = v12:get_on_key_changed_event("char_wrapper"):Wait()
                        end
                        v13:set_property("display_rank", p_u_11)
                    end)()
                end,
                ["container_options"] = {
                    ["name"] = "Display Rank",
                    ["description"] = "Make your Rank visible or invisible."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "display_uplift_button",
                ["type"] = "Switch",
                ["default"] = true,
                ["replicate_to_all_clients"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["show_for_tags"] = { "staff", "developer", "founder" },
                ["server_callback"] = function(p_u_14, _, p_u_15)
                    task.spawn(function()
                        local v16 = v_u_2("DataM").get_store(p_u_14)
                        local v17 = v16:get("boolean_flags")
                        while not v17 do
                            v17 = v16:get_on_key_changed_event("boolean_flags"):Wait()
                        end
                        v17.display_uplift_button = p_u_15
                        v16:push_update("boolean_flags")
                    end)
                end,
                ["container_options"] = {
                    ["name"] = "Display Uplift Button",
                    ["description"] = "Make the Uplift button visible or invisible."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "display_vip",
                ["type"] = "Switch",
                ["default"] = true,
                ["replicate_to_all_clients"] = true,
                ["save_to_server_after_idle_for_seconds"] = 0.1,
                ["show_for_tags"] = { "vip" },
                ["server_callback"] = function(p_u_18, _, p_u_19)
                    coroutine.wrap(function()
                        local v20 = v_u_2("DataM").get_store(p_u_18)
                        local v21 = v20:get("char_wrapper")
                        while not v21 do
                            v21 = v20:get_on_key_changed_event("char_wrapper"):Wait()
                        end
                        v21:set_property("display_vip", p_u_19)
                    end)()
                end,
                ["container_options"] = {
                    ["name"] = "Display VIP Status",
                    ["description"] = "Make your VIP tag visible or invisible."
                },
                ["element_options"] = {}
            },
            {
                ["id"] = "debug_screenshot",
                ["type"] = "GeneralButton",
                ["default"] = true,
                ["should_hide"] = function()
                    return not require(game.ReplicatedStorage.new.modules.BugScreenshotHelper).is_enabled()
                end,
                ["container_options"] = {
                    ["name"] = "Bug Screenshot",
                    ["description"] = "This button will generate two screenshots that are helpful to include when reporting a bug to developers."
                },
                ["element_options"] = {
                    ["text"] = "\240\159\147\183"
                }
            }
        }
    },
    {
        ["category_name"] = "Hidden",
        ["hidden"] = true,
        ["settings"] = {
            {
                ["id"] = "rp_name",
                ["type"] = "Hidden",
                ["default"] = "",
                ["save_to_server_after_idle_for_seconds"] = 0,
                ["server_callback"] = function(p_u_22, _, p_u_23)
                    coroutine.wrap(function()
                        local v24 = v_u_2("new:TextFilterHelperServer")
                        local v25 = v_u_2("DataM").get_store(p_u_22)
                        local v26 = v25:get("char_wrapper")
                        while not v26 do
                            v26 = v25:get_on_key_changed_event("char_wrapper"):Wait()
                        end
                        p_u_23 = v24.filter_for_public_display(p_u_23, p_u_22)
                        v26:set_property("rp_name", p_u_23)
                    end)()
                end,
                ["server_set_transform"] = function(p27, p28)
                    return v_u_2("new:TextFilterHelperServer").filter_for_public_display(p28, p27)
                end,
                ["element_options"] = {
                    ["unique_validate"] = function(p29)
                        if p29 then
                            p29 = #p29 <= 120
                        end
                        return p29
                    end
                }
            }
        }
    }
}
local v67 = {
    ["Slider"] = {
        ["validation"] = function(p31, p32)
            local v33
            if p32.min <= p31 then
                v33 = p31 <= p32.max
            else
                v33 = false
            end
            return v33
        end,
        ["transform"] = function(p34, _)
            return p34
        end,
        ["hash"] = function(p35, _)
            return p35
        end
    },
    ["Switch"] = {
        ["validation"] = function(p36, _)
            return v_u_3.boolean(p36)
        end,
        ["transform"] = function(p37, _)
            return p37
        end,
        ["hash"] = function(p38, _)
            return p38
        end
    },
    ["InputBox"] = {
        ["validation"] = function(p39, p40)
            local v41 = p40.max_len or (1 / 0)
            local v42 = not p40.validation and true or p40.validation(p39)
            local v43 = v_u_3.string(p39)
            if v43 then
                if #p39 > v41 then
                    v42 = false
                end
            else
                v42 = v43
            end
            return v42
        end,
        ["transform"] = function(p44, _)
            return p44
        end,
        ["hash"] = function(p45, _)
            return p45
        end
    },
    ["CheckboxList"] = {
        ["validation"] = function(p46, _)
            local v47 = v_u_3.table(p46)
            if v47 then
                v47 = v_u_3.map(v_u_3.integer, v_u_3.boolean)(p46)
            end
            return v47
        end,
        ["transform"] = function(p48, _)
            return p48
        end,
        ["hash"] = function(p49, _)
            local v50 = ""
            for _, v51 in ipairs(p49) do
                v50 = v50 .. (v51 and 1 or 0)
            end
            return v50
        end
    },
    ["Dropdown"] = {
        ["validation"] = function(p52, p53)
            local v54 = v_u_3.integer(p52)
            if v54 then
                if p52 > 0 then
                    v54 = p52 <= #p53.choices
                else
                    v54 = false
                end
            end
            return v54
        end,
        ["transform"] = function(p55, p56)
            return p56.choices[p55]
        end,
        ["hash"] = function(p57, _)
            return p57
        end
    },
    ["ColorPicker"] = {
        ["validation"] = function(p58, _)
            local v59 = v_u_3.string(p58)
            if v59 then
                v59 = table.find(v_u_4.ordered_themes, p58) and true or false
            end
            return v59
        end,
        ["transform"] = function(p60, _)
            return p60
        end,
        ["hash"] = function(p61, _)
            return p61
        end
    },
    ["GeneralButton"] = {
        ["validation"] = function(_, _)
            return true
        end,
        ["transform"] = function(p62, _)
            return p62
        end,
        ["hash"] = function(_, _)
            return v_u_1:GenerateGUID()
        end
    },
    ["Hidden"] = {
        ["validation"] = function(p63, p64)
            if p64.unique_validate then
                return p64.unique_validate(p63)
            else
                return p63
            end
        end,
        ["transform"] = function(p65, _)
            return p65
        end,
        ["hash"] = function(p66, _)
            return p66
        end
    }
}
local v68 = {}
for _, v69 in ipairs(v30) do
    local v70 = v5(v69)
    assert(v70, "Category options failed validation")
    for _, v_u_71 in ipairs(v69.settings) do
        local v_u_72 = v67[v_u_71.type]
        local v73 = "No setting type meta for " .. v_u_71.type
        assert(v_u_72, v73)
        function v_u_71.validation(p74)
            return v_u_72.validation(p74, v_u_71.element_options)
        end
        function v_u_71.transform(p75)
            return v_u_72.transform(p75, v_u_71.element_options)
        end
        function v_u_71.hash(p76)
            return v_u_72.hash(p76, v_u_71.element_options)
        end
        local v77 = (v69.hidden and v7 and v7 or v6)(v_u_71)
        assert(v77, "Entry options failed validation")
        if v_u_71.type == "CheckboxList" then
            local v78 = {}
            for v79, v80 in pairs(v_u_71.element_options.checkbox_list) do
                v78[v79] = v80.default
            end
            v_u_71.default = v78
        end
        if v_u_71.element_options then
            v_u_71.element_options.default = v_u_71.default
        end
        v68[v_u_71.id] = v_u_71
    end
end
return {
    ["by_category"] = v30,
    ["by_id"] = v68
}