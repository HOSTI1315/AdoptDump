--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TaxiDestinationApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("TaxiDestinationDB")
local v_u_5 = v1("Signal")
local v_u_6 = v1("FriendsClient")
local v_u_7 = game:GetService("Players")
local v8 = v2("TaxiDestinationApp", v1("UIBaseApp"))
function v8.show(p9)
    p9:_set_destination_type("MainMap")
    p9.instance.Frame.Visible = true
end
function v8.hide(p10)
    p10.instance.Frame.Visible = false
end
function v8._clear_all_destination_buttons(p11)
    for _, v12 in ipairs(p11.content:GetChildren()) do
        if v12:IsA("ImageButton") then
            v12:Destroy()
        end
    end
end
function v8._set_destination_key(p13, p14)
    if p13.selected_destination_key == p14 then
        return
    else
        p13.selected_destination_key = p14
        if p14 then
            if p13.last_selected_instance and p13.last_selected_instance:IsDescendantOf(game) then
                p13.last_selected_instance.Backdrop.ImageColor3 = Color3.new(1, 1, 1)
            end
            local v15 = p13.content:FindFirstChild(p14)
            if v15 then
                v15.Backdrop.ImageColor3 = Color3.fromRGB(74, 198, 85)
                p13.last_selected_instance = v15
            end
        end
    end
end
function v8._create_main_map_button(p_u_16, p_u_17, p18)
    local v19 = p_u_16.location_button_template:Clone()
    v19.ImageLabel.Image = p18.image_large
    v19.ImageLabel.Size = UDim2.fromOffset(49, 32)
    v19.LayoutOrder = p18.order
    v19.LocationText.Text = p18.name
    v19.Name = p_u_17
    v19.MouseButton1Down:Connect(function()
        p_u_16:_set_destination_key(p_u_17)
    end)
    return v19
end
function v8._create_friend_button(p_u_20, p21, p_u_22, p23)
    local v24 = "https://www.roblox.com/headshot-thumbnail/image?width=60&height=60&format=png&userid=" .. p_u_22
    local v25 = p_u_20.location_button_template:Clone()
    v25.ImageLabel.Image = v24
    v25.ImageLabel.Size = UDim2.fromOffset(32, 32)
    v25.LayoutOrder = p23
    v25.LocationText.Text = p21
    v25.Name = p_u_22
    v25.MouseButton1Down:Connect(function()
        p_u_20:_set_destination_key(p_u_22)
    end)
    return v25
end
function v8._set_destination_type(p_u_26, p27)
    if p_u_26.selected_destination_type == p27 then
        return
    else
        p_u_26.selected_destination_type = p27
        p_u_26:_clear_all_destination_buttons()
        if p_u_26.friends_promise then
            p_u_26.friends_promise:cancel()
            p_u_26.friends_promise = nil
        end
        if p27 == "MainMap" then
            p_u_26.main_map_button:set_button_pressed("down")
            p_u_26.main_map_button:set_state("normal")
            p_u_26.main_map_button:set_enabled(false)
            p_u_26.friends_button:set_button_pressed("up")
            p_u_26.friends_button:set_state("inactive")
            p_u_26.friends_button:set_enabled(true)
            local v28 = next(v_u_4)
            for v29, v30 in pairs(v_u_4) do
                if v30.order < v_u_4[v28].order then
                    v28 = v29
                end
                p_u_26:_create_main_map_button(v29, v30).Parent = p_u_26.content
            end
            p_u_26:_set_destination_key(v28)
        elseif p27 == "Friends" then
            p_u_26.main_map_button:set_button_pressed("up")
            p_u_26.main_map_button:set_state("inactive")
            p_u_26.main_map_button:set_enabled(true)
            p_u_26.friends_button:set_button_pressed("down")
            p_u_26.friends_button:set_state("normal")
            p_u_26.friends_button:set_enabled(false)
            p_u_26:_create_friend_button("My House", v_u_7.LocalPlayer.UserId, 1).Parent = p_u_26.content
            p_u_26:_set_destination_key(v_u_7.LocalPlayer.UserId)
            p_u_26.friends_promise = v_u_6.get_friends():andThen(function(p31)
                local v32 = p31.server
                if #v32 > 0 then
                    local v33 = 2
                    for _, v34 in pairs(v32) do
                        local v35 = v34.user_id
                        p_u_26:_create_friend_button(v34.username, v35, v33).Parent = p_u_26.content
                        v33 = v33 + 1
                    end
                end
            end):catch(function(p36)
                warn((tostring(p36)))
            end)
        end
    end
end
function v8.set_fare_price(p37, p38)
    p37.fare_price_label.Text = tostring(p38)
end
function v8.select_destination(p39)
    p39.UIManager.set_app_visibility(p39.ClassName, true)
    p39.selected_destination_type = nil
    p39.selected_destination_key = nil
    p39:_set_destination_type("MainMap")
    p39.waiting_for_selection = true
    local v40, v41 = p39.destination_selected_signal:Wait()
    p39.waiting_for_selection = false
    p39.UIManager.set_app_visibility(p39.ClassName, false)
    return v40, v41
end
function v8.cancel_destination_selection(p42)
    p42.destination_selected_signal:Fire(nil, nil)
end
function v8.start(p_u_43)
    local v44 = p_u_43.instance.Frame
    local v45 = v44.TopButtons
    local v46 = v44.ScrollComplex.ScrollingFrame.Content
    local v47 = v44.FarePrice
    local v48 = v46.LocationButtonTemplate
    v48.Parent = nil
    p_u_43.frame = v44
    p_u_43.content = v46
    p_u_43.location_button_template = v48
    p_u_43.fare_price_label = v47
    p_u_43.destination_selected_signal = v_u_5.new()
    p_u_43.friends_promise = nil
    p_u_43.main_map_button = p_u_43.UIManager.wrap(v45.MainMapButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_43:_set_destination_type("MainMap")
        end
    })
    p_u_43.friends_button = p_u_43.UIManager.wrap(v45.FriendsButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_43:_set_destination_type("Friends")
        end
    })
    p_u_43.UIManager.wrap(v45.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_43.destination_selected_signal:Fire(nil, nil)
        end
    })
    p_u_43.UIManager.wrap(v44.GoButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_43.destination_selected_signal:Fire(p_u_43.selected_destination_type, p_u_43.selected_destination_key)
        end
    })
    p_u_43.selected_destination_type = nil
    p_u_43.selected_destination_key = nil
    p_u_43:_set_destination_type("MainMap")
    v_u_3.quick_watch({
        ["selection_parent"] = v44,
        ["default_selection"] = v45.MainMapButton,
        ["app_name"] = p_u_43.ClassName,
        ["exit_buttons"] = { v45.ExitButton },
        ["teardown_button_actions"] = function()
            if p_u_43.waiting_for_selection then
                p_u_43.destination_selected_signal:Fire(nil, nil)
            end
        end
    })
end
return v8