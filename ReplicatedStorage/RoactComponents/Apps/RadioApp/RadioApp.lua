--// ReplicatedStorage.RoactComponents.Apps.RadioApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Roact")
local v_u_3 = v1("RoactRodux")
local v_u_4 = v1("UI")
local v_u_5 = v1("ClientStore")
local v_u_6 = v1("UIDB")
local v_u_7 = v1("RouterClient")
local v_u_8 = v1("PlatformM")
local v_u_9 = v1("Music")
local v_u_10 = v1("XboxSupport")
local v11 = v1("Signal")
local v_u_12 = v1("CloudValues")
local v13 = {}
local v_u_14 = v_u_2.createElement
local v_u_15 = v_u_8.get_platform()
local v_u_16 = nil
local v_u_17 = v11.new()
local v_u_18 = v11.new()
local v_u_19 = v_u_2.PureComponent:extend("SongRow")
local v_u_20 = nil
function v_u_19.render(p21)
    local v22 = p21.props
    local v_u_23 = v22.name or "[no name]"
    local v_u_24 = v22.id
    local v25 = v22.sort_id
    local v_u_26 = v22.add_button
    local v27 = v22.default
    local v_u_28 = v22.set_default_xbox_selection
    local v30 = {
        ["song_name"] = v_u_14("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = Color3.new(0.8470588235294118, 0.8470588235294118, 0.8470588235294118),
            ["TextScaled"] = true,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Size"] = UDim2.new(1, -6, 1, -6),
            ["Position"] = UDim2.new(0, 3, 0, 3),
            ["Text"] = v_u_23,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        }),
        ["play"] = v_u_14(v_u_4.FlatButton, {
            ["style"] = "FLAT",
            ["effect"] = "COLOR",
            ["size"] = UDim2.new(0, 26, 1, 0),
            ["anchor_point"] = Vector2.new(1, 0),
            ["position"] = UDim2.new(1, 0, 0, 0),
            ["imagecolor3"] = Color3.new(0, 0.8274509803921568, 0),
            ["mouse_button1_click"] = function()
                v_u_7.get("RadioAPI/Play"):FireServer(v_u_23, v_u_24)
            end,
            [v_u_2.Ref] = function(p29)
                if v_u_28 then
                    v_u_16 = p29
                end
            end
        }, {
            ["icon"] = v_u_14("ImageLabel", {
                ["Image"] = v_u_6.PlayIcon,
                ["Size"] = UDim2.new(0, 11, 0, 14),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["BackgroundTransparency"] = 1
            })
        })
    }
    if not (v27 or v_u_8.is_using_gamepad()) then
        local v31 = v_u_14
        local v32 = v_u_4.FlatButton
        local v33 = {
            ["style"] = "FLAT",
            ["effect"] = "COLOR",
            ["size"] = UDim2.new(0, 26, 1, 0),
            ["anchor_point"] = Vector2.new(1, 0),
            ["position"] = UDim2.new(1, -26, 0, 0),
            ["imagecolor3"] = v_u_26 and Color3.new(0.047058823529411764, 0.45098039215686275, 0.8) or Color3.new(0.8313725490196079, 0.06274509803921569, 0.06274509803921569),
            ["mouse_button1_click"] = function()
                if v_u_20 ~= true then
                    v_u_20 = true
                    if v_u_26 then
                        v_u_7.get("RadioAPI/Add"):InvokeServer(v_u_23, v_u_24)
                    else
                        v_u_7.get("RadioAPI/Remove"):InvokeServer(v_u_24)
                    end
                    wait(0.2)
                    v_u_20 = false
                end
            end
        }
        local v34 = {
            ["icon"] = v_u_14("ImageLabel", {
                ["Image"] = v_u_26 and v_u_6.AddSongIcon or v_u_6.RemoveSongIcon,
                ["Size"] = UDim2.new(0, 14, 0, 14),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["BackgroundTransparency"] = 1
            })
        }
        v30.add_remove = v31(v32, v33, v34)
    end
    return v_u_14("Frame", {
        ["Size"] = UDim2.new(1, -10, 0, 26),
        ["BackgroundColor3"] = Color3.new(0.21568627450980393, 0.21568627450980393, 0.21568627450980393),
        ["BorderColor3"] = Color3.new(0.7647058823529411, 0.7647058823529411, 0.7647058823529411),
        ["LayoutOrder"] = 100000 - v25
    }, v30)
end
local v35 = v_u_2.PureComponent:extend("Search")
function v35.init(p_u_36)
    local v_u_37 = false
    function p_u_36.do_search()
        if not v_u_37 then
            v_u_37 = true
            if p_u_36.search_text then
                local v38 = {
                    ["type"] = "anticipate_map_server_data_to_client_store",
                    ["key"] = "radio_search_results",
                    ["value"] = {
                        ["items"] = {},
                        ["status"] = "LOADING"
                    }
                }
                v_u_5.store:dispatch(v38)
                spawn(function()
                    local v39 = v_u_5.store:getState().radio_search_results
                    local v40 = 0
                    while true do
                        local v41 = v_u_5.store:getState().radio_search_results
                        if (not v41 or v41.status ~= "LOADING") and v39 ~= v41 then
                            break
                        end
                        p_u_36:setState({
                            ["num_dots"] = v40 + 1
                        })
                        v40 = (v40 + 1) % 3
                        wait(0.2)
                    end
                end)
                v_u_7.get("RadioAPI/Search"):InvokeServer(p_u_36.search_text)
                wait(1)
            end
            v_u_37 = false
        end
    end
end
function v35.render(p_u_42)
    local v43 = p_u_42.props
    local v44 = v43.search_results or {}
    local v45 = v43.search_status
    local v46 = p_u_42.state.num_dots
    local v47 = v43.saved_songs or {}
    local v48 = {}
    local v49 = 0
    for _, v50 in pairs(v44) do
        local v51 = nil
        for _, v52 in pairs(v47) do
            if v52.id == v50.id then
                v51 = true
            end
        end
        v48["song" .. v50.id] = v_u_14(v_u_19, {
            ["name"] = v50.name,
            ["id"] = v50.id,
            ["sort_id"] = v50.sort_id,
            ["add_button"] = not v51
        })
        v49 = v49 + 1
    end
    v48.uilistlayout = v_u_14("UIListLayout", {
        ["Padding"] = UDim.new(0, 1),
        ["SortOrder"] = Enum.SortOrder.LayoutOrder
    })
    local v53 = v_u_14(v_u_4.ScrollingFrame, {
        ["size"] = UDim2.new(1, -8, 1, -41),
        ["position"] = UDim2.new(0, 0, 0, 43),
        ["background_transparency"] = 1,
        ["canvas_size"] = UDim2.new(1, 0, 0, v49 * 27)
    }, {
        ["content"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }, {
            ["songs"] = v_u_14("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 1, -2),
                ["Position"] = UDim2.new(0, 6, 0, 1)
            }, v48)
        })
    })
    local v55 = v_u_14("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, -10, 0, 32),
        ["Position"] = UDim2.new(0, 5, 0, 6)
    }, {
        ["bar"] = v_u_14(v_u_4.StyledTextbox, {
            ["size"] = UDim2.new(1, -80, 1, 0),
            ["font"] = Enum.Font.SourceSans,
            ["text_margin"] = 3,
            ["text_x_alignment"] = Enum.TextXAlignment.Left,
            ["placeholder_text"] = "Song Name or ID",
            ["text_changed"] = function(p54)
                p_u_42.search_text = p54
            end,
            ["on_enter_pressed"] = function()
                p_u_42.do_search()
            end
        }),
        ["search_button"] = v_u_14(v_u_4.FlatButton, {
            ["effect"] = "COLOR",
            ["imagecolor3"] = Color3.new(0, 0.8274509803921568, 0),
            ["size"] = UDim2.new(0, 75, 1, -2),
            ["position"] = UDim2.new(1, 0, 0.5, 0),
            ["anchor_point"] = Vector2.new(1, 0.5),
            ["mouse_button1_click"] = p_u_42.do_search,
            ["debug_it"] = true
        }, {
            ["text"] = v_u_14(v_u_4.ButtonText, {
                ["text"] = "Search"
            })
        })
    })
    local v56
    if v45 == "LOADING" then
        v56 = "Loading" .. string.rep(".", v46 or 0)
    else
        v56 = v45 == "SERVER_DOWN" and "Servers are down. Use Roblox catalog search instead." or (v45 == "OKAY" and #v44 == 0 and "No results found." or "")
    end
    return v_u_14("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }, {
        ["scroll_results"] = v53,
        ["search"] = v55,
        ["status_text"] = v_u_14("TextLabel", {
            ["Size"] = UDim2.new(0.7, 0, 0, 45),
            ["Position"] = UDim2.new(0.5, 0, 0.4, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextScaled"] = true,
            ["Text"] = v56,
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = Color3.new(0.21568627450980393, 0.21568627450980393, 0.21568627450980393),
            ["ZIndex"] = 2
        })
    })
end
local v_u_60 = v_u_3.connect(function(p57)
    local v58 = p57:getState()
    local v59 = v58.radio_search_results or {}
    return {
        ["search_results"] = v59.items,
        ["search_status"] = v59.status,
        ["saved_songs"] = v58.saved_songs
    }
end)(v35)
local v61 = v_u_2.PureComponent:extend("SavedSongs")
function v61.render(p62)
    local v63 = p62.props
    local v64 = v63.songs_override or (v63.songs or {})
    local v65 = v63.index_multiplier or 1
    local v66 = 0
    local v67 = {}
    for v68, v69 in pairs(v64) do
        if v66 < (v68 or v69.sort_id) then
            v66 = v68 or v69.sort_id
        end
    end
    local v70 = 0
    for v71, v72 in pairs(v64) do
        v67["song" .. v72.id] = v_u_14(v_u_19, {
            ["name"] = v72.name,
            ["id"] = v72.id,
            ["sort_id"] = v72.sort_id or v71 * v65,
            ["default"] = v72.default,
            ["set_default_xbox_selection"] = v66 == v72.sort_id
        })
        v70 = v70 + 1
    end
    v67.uilistlayout = v_u_14("UIListLayout", {
        ["Padding"] = UDim.new(0, 1),
        ["SortOrder"] = Enum.SortOrder.LayoutOrder
    })
    return v_u_14(v_u_4.ScrollingFrame, {
        ["size"] = UDim2.new(1, 0, 1, 0),
        ["position"] = UDim2.new(0, 0, 0, 0),
        ["background_transparency"] = 1,
        ["canvas_size"] = UDim2.new(1, 0, 0, v70 * 27)
    }, {
        ["content"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }, {
            ["songs"] = v_u_14("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, -7, 1, -2),
                ["Position"] = UDim2.new(0, 6, 0, 1)
            }, v67)
        })
    })
end
local v_u_74 = v_u_3.connect(function(p73)
    return {
        ["songs"] = p73:getState().saved_songs
    }
end)(v61)
local v_u_75 = v_u_2.PureComponent:extend("TimeBar")
function v_u_75.refresh_music(p76)
    local v77 = p76.props.playing
    local v78 = "rbxassetid://" .. (p76.props.id or 0)
    if v77 then
        if p76.last_id ~= v78 then
            v_u_9.reset_time_position(v78)
        end
        p76.last_id = v78
        v_u_9.play(20, {
            ["name"] = "Jukebox",
            ["id"] = v78
        })
    else
        v_u_9.play(20, nil)
    end
end
v_u_75.didUpdate = v_u_75.refresh_music
v_u_75.didMount = v_u_75.refresh_music
function v_u_75.render(p_u_79)
    local v80 = p_u_79.props
    local v81 = v_u_14
    local v82 = {
        ["Size"] = v80.size,
        ["Position"] = v80.position,
        ["AnchorPoint"] = v80.anchor_point,
        ["BackgroundColor3"] = Color3.new(),
        ["BorderSizePixel"] = 0
    }
    local v84 = {
        ["fill"] = v_u_14("Frame", {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["BackgroundColor3"] = Color3.new(1, 0.8941176470588236, 0),
            ["BorderSizePixel"] = 0,
            [v_u_2.Ref] = function(p83)
                p_u_79.time_bar_fill = p83
            end
        })
    }
    return v81("Frame", v82, v84)
end
local v85 = v_u_2.PureComponent:extend("NowPlaying")
function v85.render(p_u_86)
    local v87 = p_u_86.props
    local _ = v87.house_owner
    local v88 = v87.played_by_name
    local v_u_89 = v87.playing
    local v90 = v87.id
    local v91
    if v87.song_name == nil then
        v91 = "[No Song Selected]"
    elseif v88 == game.Players.LocalPlayer.Name then
        v91 = v87.song_name
    else
        v91 = "Music played by " .. (v88 or "N/A")
    end
    local v92 = {
        ["top_highlight"] = v_u_14("Frame", {
            ["Size"] = UDim2.new(1, 0, 0, 1),
            ["BackgroundColor3"] = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745),
            ["BorderSizePixel"] = 0
        }),
        ["play_pause"] = v_u_14(v_u_4.FlatButton, {
            ["effect"] = "COLOR",
            ["imagecolor3"] = Color3.new(0, 0.8274509803921568, 0),
            ["size"] = UDim2.new(0, 64, 0, 24),
            ["position"] = UDim2.new(1, -3, 0.5, 0),
            ["anchor_point"] = Vector2.new(1, 0.5),
            ["mouse_button1_click"] = function()
                if not p_u_86.play_pause_db then
                    p_u_86.play_pause_db = true
                    if v_u_89 then
                        v_u_7.get("RadioAPI/Pause"):InvokeServer()
                    else
                        v_u_7.get("RadioAPI/Resume"):InvokeServer()
                    end
                    p_u_86.play_pause_db = false
                end
            end
        }, { v_u_14(v_u_4.ButtonText, {
                ["text"] = v_u_89 == true and "Pause" or "Play"
            }) }),
        ["time_bar"] = v_u_14(v_u_75, {
            ["size"] = UDim2.new(1, -77, 0, 2),
            ["position"] = UDim2.new(0, 3, 1, -3),
            ["anchor_point"] = Vector2.new(0, 1),
            ["playing"] = v_u_89,
            ["id"] = v90
        }),
        ["song_name"] = v_u_14("TextLabel", {
            ["Size"] = UDim2.new(1, -78, 0, 20),
            ["Position"] = UDim2.new(0, 4, 0, 2),
            ["Font"] = Enum.Font.SourceSansBold,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextColor3"] = Color3.new(1, 1, 1),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Text"] = v91
        })
    }
    return v_u_14("Frame", {
        ["BackgroundTransparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.new(0.5607843137254902, 0.5607843137254902, 0.5607843137254902),
        ["Size"] = UDim2.new(1, 0, 0, 31),
        ["Position"] = UDim2.new(0, 0, 1, 0),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }, v92)
end
local v_u_96 = v_u_3.connect(function(p93)
    local v94 = p93:getState().house_interior or {}
    local v95 = v94.music or {}
    return {
        ["song_name"] = v95.name,
        ["playing"] = v95.playing,
        ["id"] = v95.id,
        ["played_by_name"] = v95.played_by_name,
        ["house_owner"] = v94.player
    }
end)(v85)
local v_u_97 = v_u_2.PureComponent:extend("RadioAppContent")
function v_u_97.init(p_u_98)
    local v100 = {
        ["selection_parent"] = function()
            return p_u_98.selection_parent
        end,
        ["default_selection"] = function()
            return v_u_16
        end,
        ["signal_open"] = v_u_17,
        ["signal_close"] = v_u_18,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction("RadioClose", function(_, p99)
                if p99 == Enum.UserInputState.Begin then
                    game:GetService("ContextActionService"):UnbindAction("RadioClose")
                    v_u_5.store:dispatch({
                        ["type"] = "set_window_visibility",
                        ["window_name"] = "radio",
                        ["visible"] = false
                    })
                end
            end, false, Enum.KeyCode.ButtonB)
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction("RadioClose")
        end
    }
    v_u_10.watch(v100)
    v_u_8.get_gamepad_changed():Connect(function()
        p_u_98:setState({})
    end)
end
function v_u_97.render(p_u_101)
    local v102 = p_u_101.state.selected_index or 1
    local v103 = v_u_8.is_using_gamepad()
    local v104 = {
        ["now_playing"] = v_u_14(v_u_96),
        ["everyday_songs"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, -14, 1, -45),
            ["Position"] = UDim2.new(0, 3, 0, 6),
            ["Visible"] = v102 == 1
        }, {
            ["content"] = v_u_14(v_u_74)
        }),
        ["special_songs"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, -14, 1, -45),
            ["Position"] = UDim2.new(0, 3, 0, 6),
            ["Visible"] = v102 == 2
        }, {
            ["content"] = v_u_14(v_u_74, {
                ["songs_override"] = v_u_12:getValue("music", "jukebox_special_songs"),
                ["index_multiplier"] = -1
            })
        }),
        ["search"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, -6, 1, -43),
            ["Position"] = UDim2.new(0, 3, 0, 4),
            ["Visible"] = v102 == 3
        }, {
            ["content"] = v_u_14(v_u_60)
        })
    }
    local v105 = v_u_14
    local v106 = v_u_4.RoundedBacking
    local v108 = {
        ["position"] = UDim2.new(0.5, 0, 0.5, 0),
        ["size"] = UDim2.new(0, 387, 0, 288),
        ["anchor_point"] = Vector2.new(0.5, 0.5),
        [v_u_2.Ref] = function(p107)
            p_u_101.selection_parent = p107
        end
    }
    local v110 = {
        ["tabs"] = v_u_14(v_u_4.UpperTabs, {
            ["size"] = UDim2.new(1, -60, 0, 33),
            ["position"] = UDim2.new(0, 6, 0, 6),
            ["tabs"] = { "Everyday", "Special", "Search" },
            ["selected_index"] = v102,
            ["on_tab_switched"] = function(p109)
                p_u_101:setState({
                    ["selected_index"] = p109
                })
            end
        }),
        ["close"] = v_u_14(v_u_4.IconButton, {
            ["image"] = v103 and v_u_8.get_custom_icon(Enum.KeyCode.ButtonB) or v_u_6.CircleCloseButton,
            ["initial_color"] = v103 and Color3.new(1, 1, 1) or Color3.new(1, 0.29411764705882354, 0.29411764705882354),
            ["active_color"] = v103 and Color3.new(1, 1, 1) or Color3.new(1, 0, 0),
            ["size"] = v_u_15 == v103 and UDim2.new(0, 35, 0, 35) or UDim2.new(0, 33, 0, 35),
            ["position"] = UDim2.new(1, -4, 0, 4),
            ["anchor_point"] = Vector2.new(1, 0),
            ["modal"] = true,
            ["mouse_button1_down"] = function()
                v_u_5.store:dispatch({
                    ["type"] = "set_window_visibility",
                    ["window_name"] = "radio",
                    ["visible"] = false
                })
            end
        }),
        ["content"] = v_u_14("Frame", {
            ["BackgroundTransparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = Color3.new(0.9254901960784314, 0.9254901960784314, 0.9254901960784314),
            ["Size"] = UDim2.new(1, 0, 1, -44),
            ["Position"] = UDim2.new(0, 0, 0, 44)
        }, v104)
    }
    return v105(v106, v108, v110)
end
local function v_u_112()
    return v_u_14(v_u_4.Window, {
        ["window_name"] = "radio",
        ["display_order"] = 6,
        ["visibility_changed"] = function(p111)
            if v_u_8.is_using_gamepad() then
                if p111 then
                    v_u_17:Fire()
                    return
                end
                v_u_18:Fire()
            end
        end
    }, {
        ["content"] = v_u_14(v_u_97)
    })
end
function v13.init(p113)
    local v114 = v_u_14(v_u_3.StoreProvider, {
        ["store"] = p113
    }, {
        ["app"] = v_u_14(v_u_112)
    })
    v_u_2.mount(v114, game.Players.LocalPlayer.PlayerGui, "RadioApp")
end
return v13