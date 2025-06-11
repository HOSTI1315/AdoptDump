--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FriendsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("XboxSupport")
local v4 = v_u_1("Class")
local v_u_5 = v_u_1("TableUtil")
local v_u_6 = v_u_1("Set")
local v_u_7 = v_u_1("CoreCall")
local v_u_8 = {
    ["main"] = true
}
local v9 = v4("FriendsApp", v_u_1("UIBaseApp"))
function v9._is_same_place_id_as_me(_, p10)
    return p10 == game.PlaceId
end
function v9._get_place_type(p11, p12)
    if p11.server_type_map then
        for v13, v14 in p11.server_type_map do
            if v14 == p12 then
                return v13
            end
        end
    end
    return nil
end
function v9.render_friends_row(p15, p_u_16)
    local v17 = p15:_is_same_place_id_as_me(p_u_16.PlaceId)
    local v_u_18 = game.Players:FindFirstChild(p_u_16.UserName)
    local v19 = p15:_get_place_type(p_u_16.PlaceId)
    local v20
    if v19 then
        v20 = v_u_8[v19] and true or false
    else
        v20 = false
    end
    local v21 = p15.entry_template:clone()
    v21.Name = "FriendEntry" .. p_u_16.VisitorId
    v21.Player.Text = p_u_16.UserName
    v21.LayoutOrder = #p15.friends_content:GetChildren()
    v21.AvatarPic.Image = "https://www.roblox.com/headshot-thumbnail/image?width=60&height=60&format=png&userid=" .. p_u_16.VisitorId
    v21.Parent = p15.friends_content
    local v22 = p15.UIManager.wrap(v21.Button, "DepthButton")
    if v17 or (v_u_18 or v20) then
        v22:start({
            ["mouse_button1_click"] = function()
                if v_u_18 then
                    v_u_2.get("LocationAPI/TeleToPlayer"):InvokeServer(v_u_18)
                else
                    v_u_2.get("LocationAPI/TeleToPlayerInDifferentServer"):FireServer(p_u_16.VisitorId)
                end
            end
        })
        if v_u_18 then
            v21.Button.Face.TextLabel.Text = "Teleport"
        else
            v21.Button.Face.TextLabel.Text = "Follow"
        end
    elseif v19 then
        v22:start()
        v22:set_state("unpressable")
        v22:set_color_by_entry_name("green", true)
        v21.Button.Face.TextLabel.Text = "Online"
    else
        v22:start()
        v22:set_state("unpressable")
        v21.Button.Face.TextLabel.Text = "Offline"
    end
    v21.Settings.Visible = v_u_18 ~= nil
    v21.Settings.MouseButton1Click:connect(function()
        game:GetService("StarterGui"):SetCore("PromptUnfriend", v_u_18)
    end)
end
function v9.render_nearby_row(p23, p_u_24)
    local v25 = p23.entry_template:clone()
    v25.Name = "NearbyEntry"
    v25.Player.Text = p_u_24.Name
    v25.LayoutOrder = #p23.nearby_content:GetChildren()
    v25.Button.Size = UDim2.new(0, 150, 1, -4)
    v25.AvatarPic.Image = "https://www.roblox.com/headshot-thumbnail/image?width=60&height=60&format=png&userid=" .. p_u_24.UserId
    v25.Parent = p23.nearby_content
    local v26 = p23.UIManager.wrap(v25.Button, "DepthButton")
    local v_u_27 = false
    pcall(function()
        v_u_27 = game.Players.LocalPlayer:IsFriendsWith(p_u_24.UserId)
    end)
    if v_u_27 then
        v25.Button.Face.TextLabel.Text = "Unfriend"
    else
        v25.Button.Face.TextLabel.Text = "Add Friend"
    end
    v26:start({
        ["mouse_button1_click"] = function()
            if v_u_27 then
                game:GetService("StarterGui"):SetCore("PromptUnfriend", p_u_24)
            else
                game:GetService("StarterGui"):SetCore("PromptSendFriendRequest", p_u_24)
            end
        end
    })
    v25.Settings.Visible = false
end
function v9.set_scrolling_frame_canvas_size(p28)
    local v29
    if p28.tab == "friends" then
        v29 = p28.friends_content.UIListLayout.AbsoluteContentSize.Y + 20
    else
        v29 = p28.nearby_content.UIListLayout.AbsoluteContentSize.Y + 20
    end
    p28.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, v29)
end
function v9.render_page_of_friends(p30)
    p30.friend_pages_showing = p30.friend_pages_showing + 1
    local v31 = v_u_5.combine(p30.in_adopt_me, p30.not_in_adopt_me)
    local v32 = (p30.friend_pages_showing - 1) * 15 + 1
    local v33 = p30.friend_pages_showing * 15
    local v34 = #v31
    local v35 = math.clamp(v33, 0, v34)
    for v36 = v32, v35 do
        p30:render_friends_row(v31[v36])
    end
    if v35 == #v31 then
        p30.load_more_button.Parent = nil
    else
        p30.load_more_button.Parent = p30.friends_content
    end
    p30:set_scrolling_frame_canvas_size()
end
function v9.refresh_friends(p_u_37)
    if not p_u_37.is_refreshing_friends then
        p_u_37.is_refreshing_friends = true
        local v38 = v_u_3.attempt_preserve_selection_on_recreation()
        for _, v39 in pairs(p_u_37.friends_content:GetChildren()) do
            if string.find(v39.Name, "FriendEntry") then
                v39:Destroy()
            end
        end
        p_u_37.add_friends_button.Parent = nil
        p_u_37.load_more_button.Parent = nil
        local v40 = p_u_37.loading:clone()
        v40.Parent = p_u_37.friends_content
        local v_u_41 = {}
        pcall(function()
            v_u_41 = game.Players.LocalPlayer:GetFriendsOnline()
        end)
        local v_u_42 = v_u_6.new()
        p_u_37.in_adopt_me = {}
        p_u_37.not_in_adopt_me = {}
        for _, v43 in pairs(v_u_41) do
            if p_u_37:_is_same_place_id_as_me(v43.PlaceId) or (game.Players:FindFirstChild(v43.UserName) or p_u_37:_get_place_type(v43.PlaceId)) then
                local v44 = p_u_37.in_adopt_me
                table.insert(v44, v43)
            else
                local v45 = p_u_37.not_in_adopt_me
                table.insert(v45, v43)
            end
            v_u_42:add(v43.VisitorId)
        end
        local v53, v54 = pcall(function()
            local v46 = game.Players.LocalPlayer.UserId
            local v47 = v46 < 0 and 13953438 or v46
            for _, v48 in pairs(game.Players:GetFriendsAsync(v47):GetCurrentPage()) do
                if not v_u_42:has(v48.Id) then
                    if game.Players:FindFirstChild(v48.Username) then
                        local v49 = p_u_37.in_adopt_me
                        local v50 = {
                            ["UserName"] = v48.Username,
                            ["VisitorId"] = v48.Id
                        }
                        table.insert(v49, 1, v50)
                    else
                        local v51 = p_u_37.not_in_adopt_me
                        local v52 = {
                            ["UserName"] = v48.Username,
                            ["VisitorId"] = v48.Id
                        }
                        table.insert(v51, v52)
                    end
                    v_u_42:add(v48.Id)
                end
            end
        end)
        if not v53 then
            warn("[FriendsApp] GetFriendsAsync error:", v54)
        end
        v40:Destroy()
        if #p_u_37.in_adopt_me == 0 then
            p_u_37.add_friends_button.Parent = p_u_37.friends_content
        else
            p_u_37.add_friends_button.Parent = nil
        end
        p_u_37.friend_pages_showing = 0
        p_u_37:render_page_of_friends()
        v38()
        p_u_37.is_refreshing_friends = false
    end
end
function v9.refresh_nearby(p55)
    local v56 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if v56 then
        v56 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
    if not v56 then
        return
    end
    if p55.is_refreshing_nearby then
        return
    end
    p55.is_refreshing_nearby = true
    for _, v57 in pairs(p55.nearby_content:GetChildren()) do
        if v57.Name == "NearbyEntry" then
            v57:Destroy()
        end
    end
    local v58 = {}
    for _, v59 in pairs(game.Players:GetPlayers()) do
        if v59 ~= game.Players.LocalPlayer and (v59.Character and v59.Character:FindFirstChild("HumanoidRootPart")) then
            local v60 = {
                ["player"] = v59,
                ["dist"] = (v56 - v59.Character.HumanoidRootPart.Position).magnitude
            }
            table.insert(v58, v60)
        end
    end
    table.sort(v58, function(p61, p62)
        return p61.dist < p62.dist
    end)
    for v63, v64 in pairs(v58) do
        if v63 > 15 then
            break
        end
        p55:render_nearby_row(v64.player)
        p55:set_scrolling_frame_canvas_size()
    end
    p55:set_scrolling_frame_canvas_size()
    p55.is_refreshing_nearby = false
end
function v9.refresh_current_tab(p65)
    if p65.tab == "friends" then
        p65:refresh_friends()
    else
        p65:refresh_nearby()
    end
end
function v9.refresh(p66, p67)
    local v68 = p66.UIManager.is_closed({ "MinigameInGameApp" })
    if not p67[p66.ClassName] then
        v68 = false
    end
    p66:set_visibility(v68)
end
function v9.show(p_u_69)
    p_u_69.instance.Frame.Visible = true
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_69.exit_button, function(p70)
        p_u_69.exit_button.Position = p_u_69.exit_button.Position + UDim2.fromOffset(-p70 - 4, 0)
    end)
    p_u_69:refresh_current_tab()
end
function v9.hide(p71)
    p71.instance.Frame.Visible = false
end
function v9.start(p_u_72)
    p_u_72.tab = "friends"
    task.spawn(function()
        p_u_72.server_type_map = v_u_2.get("ThemedServersAPI/GetPlaceTypesMap"):InvokeServer()
        if p_u_72.UIManager.is_visible(p_u_72.ClassName) then
            p_u_72:refresh_current_tab()
        end
    end)
    p_u_72.scrolling_frame = p_u_72.instance.Frame.Body.ScrollComplex.ScrollingFrame
    p_u_72.friends_content = p_u_72.scrolling_frame.Content
    p_u_72.entry_template = p_u_72.scrolling_frame.Content.EntryTemplate
    p_u_72.load_more_button = p_u_72.scrolling_frame.Content.LoadMore
    p_u_72.add_friends_button = p_u_72.scrolling_frame.Content.AddFriends
    p_u_72.loading = p_u_72.scrolling_frame.Content.Loading
    p_u_72.entry_template.Parent = nil
    p_u_72.load_more_button.Parent = nil
    p_u_72.add_friends_button.Parent = nil
    p_u_72.loading.Parent = nil
    p_u_72.nearby_content = p_u_72.friends_content:clone()
    p_u_72.nearby_content.Parent = p_u_72.friends_content.Parent
    p_u_72.friends_content.Name = "FriendsContent"
    p_u_72.nearby_content.Name = "NearbyContent"
    p_u_72.exit_button = p_u_72.instance.Frame.Header.ExitButton
    p_u_72.tab_container = p_u_72.instance.Frame.Header.InsetSpace.Tabs
    p_u_72.UIManager.wrap(p_u_72.exit_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_72.UIManager.set_app_visibility(p_u_72.ClassName, false)
        end
    })
    local v_u_73 = p_u_72.UIManager.wrap(p_u_72.tab_container, "TabButtons"):start({
        ["Friends"] = function()
            p_u_72.tab = "friends"
            p_u_72.friends_content.Visible = true
            p_u_72.nearby_content.Visible = false
            p_u_72:refresh_friends()
        end,
        ["Nearby"] = function()
            p_u_72.tab = "nearby"
            p_u_72.friends_content.Visible = false
            p_u_72.nearby_content.Visible = true
            p_u_72:refresh_nearby()
        end
    })
    p_u_72.UIManager.wrap(p_u_72.add_friends_button.AddFriendsButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            v_u_73:set_tab("Nearby")
            p_u_72.watch:select_object(p_u_72.instance.Frame.Header.InsetSpace.Tabs.Nearby.Button)
        end
    })
    p_u_72.UIManager.wrap(p_u_72.load_more_button.LoadButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_72:render_page_of_friends()
        end
    })
    spawn(function()
        local _, v74 = v_u_7("GetCore", "PlayerFriendedEvent")
        v74.Event:connect(function(_)
            wait(1)
            p_u_72:refresh_current_tab()
        end)
        local _, v75 = v_u_7("GetCore", "PlayerUnfriendedEvent")
        v75.Event:connect(function(_)
            wait(1)
            p_u_72:refresh_current_tab()
        end)
    end)
    p_u_72.watch = v_u_3.quick_watch({
        ["selection_parent"] = p_u_72.instance.Frame,
        ["default_selection"] = p_u_72.instance.Frame.Header.InsetSpace.Tabs.Friends.Button,
        ["app_name"] = p_u_72.ClassName,
        ["exit_buttons"] = { p_u_72.exit_button }
    })
end
return v9