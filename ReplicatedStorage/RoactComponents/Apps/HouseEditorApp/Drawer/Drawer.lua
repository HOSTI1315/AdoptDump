--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp.Drawer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("EggEvent")
local v_u_4 = v1("FurnishDB")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("Roact")
local v_u_7 = v1("UI")
local v_u_8 = v1("UIDB")
local v_u_9 = require(script.Parent.ItemSlider)
local v_u_10 = v1("package:Sift")
local v_u_11 = require(game.ReplicatedStorage.new.modules.StringSearchHelper)
local v_u_12 = v_u_5.get_platform()
local v_u_13 = Color3.fromRGB(126, 0, 255)
local v_u_14 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local function v_u_19(p15)
    local v_u_16 = v_u_2.get("house_interior").building_type
    return v_u_10.List.filter(p15 or {}, function(p17)
        local v18 = p17.permitted_houses
        return not v18 and true or v_u_10.List.includes(v18, v_u_16)
    end)
end
local v20 = v_u_6.PureComponent:extend("Drawer")
function v20.render(p21)
    local v22 = p21.props
    local v_u_23 = v22.set_drawer
    local v_u_24 = v22.drawer_content
    local v_u_25 = v22.page_history or {}
    local v26 = v22.console_selection_active
    local v_u_27 = v22.xbox_deselect
    local v28 = v22.signal_close
    local v29 = ""
    if v_u_24 and v_u_24.name == "Search Results" then
        v29 = #v_u_24.contents .. " Results Found"
    else
        for v30, v31 in pairs(v_u_25) do
            v29 = v29 .. v31.name
            if v30 < #v_u_25 then
                v29 = v29 .. " - "
            end
        end
    end
    local v32 = v_u_6.createElement
    local v33 = v_u_7.RoundedBacking
    local v36 = {
        ["position"] = v_u_12 == v_u_5.platform.phone and UDim2.new(0, 6, 1, -6) or UDim2.new(0, 220, 1, -6),
        ["size"] = v_u_12 == v_u_5.platform.phone and UDim2.new(1, -12, 0, 170) or UDim2.new(1, -228, 0, 170),
        ["anchor_point"] = Vector2.new(0, 1),
        [v_u_6.Ref] = function(p34)
            local v35 = v_u_2.get("tutorial_data") or {}
            v35.drawer = p34
            v_u_2.update("tutorial_data", v35)
        end
    }
    local v55 = {
        ["title"] = v_u_6.createElement("TextLabel", {
            ["Position"] = UDim2.new(0, 10, 0, 7),
            ["Size"] = UDim2.new(1, -20, 0, 36),
            ["BackgroundTransparency"] = 1,
            ["Text"] = v29,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = v_u_13,
            ["TextScaled"] = true,
            ["Font"] = Enum.Font.SourceSansBold
        }),
        ["close"] = v_u_6.createElement(v_u_7.IconButton, {
            ["image"] = v_u_8.CircleCloseButton,
            ["initial_color"] = Color3.new(1, 0.29411764705882354, 0.29411764705882354),
            ["active_color"] = Color3.new(1, 0, 0),
            ["size"] = UDim2.new(0, 33, 0, 35),
            ["position"] = UDim2.new(1, -4, 0, 4),
            ["anchor_point"] = Vector2.new(1, 0),
            ["mouse_button1_down"] = function()
                v_u_23(nil)
                if v_u_27 then
                    v_u_27()
                end
            end
        }),
        ["search"] = v_u_6.createElement(v_u_7.StyledTextbox, {
            ["size"] = UDim2.new(0.22, 0, 0, 35),
            ["position"] = UDim2.new(0.78, -78, 0, 4),
            ["text"] = v_u_14:Translate(game.Players.LocalPlayer.PlayerGui, "Search Furniture"),
            ["text_changed"] = function(p_u_37)
                if p_u_37 and string.gsub(p_u_37, " ", "") ~= "" then
                    local v_u_38 = {}
                    local v_u_39 = {}
                    local function v_u_46(p40)
                        if not v_u_39[p40] then
                            v_u_39[p40] = true
                            if typeof(p40) == "table" and p40.contents then
                                if not v_u_3.is_furnish_category_hidden(p40.name) then
                                    local v41 = v_u_19(p40.contents)
                                    for _, v42 in pairs(v41) do
                                        v_u_46(v42)
                                    end
                                end
                            end
                            if v_u_3.is_furniture_hidden(p40.id) then
                                return
                            end
                            local v43 = v_u_14:Translate(workspace, p40.name)
                            local v44 = v_u_11.score(p_u_37, v43)
                            if v44 then
                                local v45 = v_u_38
                                table.insert(v45, {
                                    ["entry"] = p40,
                                    ["score"] = v44
                                })
                            end
                        end
                    end
                    local v47 = v_u_19(v_u_4.stuff.contents)
                    for _, v48 in pairs(v47) do
                        v_u_46(v48)
                    end
                    table.sort(v_u_38, function(p49, p50)
                        local v51 = p49.score.word_match_count == p50.score.word_match_count and 0 or (p49.score.word_match_count > p50.score.word_match_count and 1 or -1)
                        if v51 == 0 then
                            if p49.entry.cost then
                                if p50.entry.cost then
                                    return p49.entry.cost < p50.entry.cost
                                else
                                    return false
                                end
                            else
                                return true
                            end
                        else
                            return v51 > 0
                        end
                    end)
                    local v52 = {}
                    for _, v53 in v_u_38 do
                        local v54 = v53.entry
                        table.insert(v52, v54)
                    end
                    v_u_23({
                        ["name"] = "Search Results",
                        ["contents"] = v52,
                        ["is_sorted"] = true
                    }, true)
                end
            end
        })
    }
    local v56 = v_u_6.createElement
    local v57 = v_u_7.IconButton
    local v58 = {
        ["image"] = v_u_8.CircleBackButton,
        ["initial_color"] = Color3.new(1, 0.7529411764705882, 0),
        ["active_color"] = Color3.new(1, 0.5647058823529412, 0),
        ["size"] = UDim2.new(0, 33, 0, 35),
        ["position"] = UDim2.new(1, -42, 0, 4),
        ["anchor_point"] = Vector2.new(1, 0)
    }
    local v59
    if #v_u_25 >= 2 then
        v59 = true
    elseif v_u_24 then
        v59 = v_u_24.name == "Search Results"
    else
        v59 = v_u_24
    end
    v58.visible = v59
    function v58.mouse_button1_down()
        if v_u_24.name == "Search Results" then
            v_u_23(v_u_4.stuff, true)
        else
            v_u_23(v_u_25[#v_u_25 - 1])
        end
    end
    v55.back = v56(v57, v58)
    v55.item_slider = v_u_6.createElement(v_u_9, {
        ["size"] = UDim2.new(1, -12, 0, 116),
        ["position"] = UDim2.new(0, 6, 0, 46),
        ["drawer_content"] = v_u_24,
        ["set_drawer"] = v_u_23,
        ["xbox_deselect"] = v_u_27,
        ["signal_close"] = v28
    })
    v55.xbox_symbol = v_u_6.createElement("ImageLabel", {
        ["Visible"] = v_u_5.is_using_gamepad(),
        ["Position"] = UDim2.new(0, -5, 0, -10),
        ["AnchorPoint"] = Vector2.new(1, 1),
        ["BackgroundTransparency"] = 1,
        ["Size"] = v26 and UDim2.new(0, 35, 0, 35) or UDim2.new(0, 58, 0, 58),
        ["ImageTransparency"] = v26 and 0 or 0.2,
        ["Image"] = v_u_5.get_custom_icon(v26 and Enum.KeyCode.ButtonB or Enum.KeyCode.DPadDown)
    })
    return v32(v33, v36, v55)
end
return v20