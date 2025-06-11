--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FamilyApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("XboxSupport")
local v5 = v1("Class")
local v_u_6 = v1("Signal")
local v_u_7 = v1("ObbyDB")
local v_u_8 = v1("Debug").create_log()
local v9 = v5("FamilyApp", v1("UIBaseApp"))
function convert_location_name_to_readable(p10)
    if v_u_7[p10] then
        return "Obbies"
    end
    local v11 = string.gsub(p10, "%u", " %1")
    if string.sub(v11, 1, 1) == " " then
        v11 = string.sub(v11, 2)
    end
    return string.gsub(v11, "::.+$", "")
end
local function v_u_17(p12, p13, p14)
    local v15 = p14 == "housing" and "House" or convert_location_name_to_readable(p14)
    local v16 = p12.instance:WaitForChild("Frame"):WaitForChild("InFamily"):WaitForChild("Members"):WaitForChild("ScrollingFrame"):WaitForChild("Content"):FindFirstChild("Row-" .. p13)
    if v16 and v16.NameLabel.Text == p13 then
        v16.Location.Text = v15
    end
end
local v_u_18 = nil
function v9.refresh_members_list(p19, p20, _)
    if p19.instance.Enabled then
        local v21 = p19.instance:WaitForChild("Frame"):WaitForChild("InFamily"):WaitForChild("Members"):WaitForChild("ScrollingFrame")
        local v22 = v21:WaitForChild("Content")
        for _, v23 in pairs(v22:GetChildren()) do
            if v23:IsA("Frame") and v23.Name ~= "Row1" then
                v23:Destroy()
            end
        end
        local v24 = nil
        for v25, v_u_26 in pairs(p20) do
            if v_u_26 then
                local v27 = p19.player_row:clone()
                v27.Name = "Row-" .. v_u_26.Name
                v27.LayoutOrder = v25 + 1
                v27.Transparency = v25 % 2 == 0 and 0.8 or 0.6
                v27.NameLabel.Text = v_u_26.Name
                v27.Location.Text = "Loading..."
                v27.Parent = v22
                v27.Follow.MouseButton1Click:connect(function()
                    if not v_u_18 then
                        v_u_18 = true
                        if game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit) then
                            game.Players.LocalPlayer.Character.Humanoid.Jump = true
                            wait(0.2)
                        end
                        v_u_3.get("LocationAPI/TeleToPlayer"):InvokeServer(v_u_26)
                        wait(1)
                        v_u_18 = false
                    end
                end)
                if v_u_26 == game.Players.LocalPlayer then
                    v27.Follow.Visible = false
                end
                if v27.Follow.Visible then
                    v27.Follow.NextSelectionUp = v24
                    if v24 then
                        v24.NextSelectionDown = v27.Follow
                    end
                    v24 = v27.Follow
                end
                local v28 = v_u_2.get_server(v_u_26, "team")
                v27.AgeLabel.Text = v28 == "Babies" and "Baby" or (v28 == "Parents" and "Adult" or "Unborn")
            end
        end
        for v29 = #p20 + 1, 6 do
            local v30 = p19.player_row:clone()
            v30.Name = "Row" .. v29 + 1
            v30.Transparency = v29 % 2 == 0 and 0.8 or 0.6
            v30.NameLabel.Text = ""
            v30.AgeLabel.Text = ""
            v30.Location.Text = ""
            v30.Follow.Visible = false
            v30.LayoutOrder = 99999
            v30.Parent = v22
        end
        if v24 then
            p19.instance.Frame.InFamily.FamilyButton.NextSelectionUp = v24
            v24.NextSelectionDown = p19.instance.Frame.InFamily.FamilyButton
        end
        local v31 = UDim2.new
        local v32 = p19.player_row.Size.Y.Offset
        local v33 = #p20
        v21.CanvasSize = v31(1, -20, 0, v32 * (math.max(6, v33) + 1))
        v22.UIListLayout:ApplyLayout()
        local v34 = v_u_3.get("FamilyAPI/GetFamilyMemberLocations"):InvokeServer() or {}
        for v35, v36 in pairs(v34) do
            v_u_17(p19, v35, v36)
        end
    else
        v_u_8("Delaying family ui refresh")
        delayed_refresh = true
    end
end
function v9.refresh_family_ui(p37, p38, p39)
    if p38 == nil then
        p37.instance:WaitForChild("Frame"):WaitForChild("InFamily").Visible = false
        p37.instance:WaitForChild("Frame"):WaitForChild("EmptyFamily").Visible = false
        p37.instance:WaitForChild("Frame"):WaitForChild("NoFamily").Visible = true
        return
    elseif #p38 == 1 then
        p37.instance:WaitForChild("Frame"):WaitForChild("InFamily").Visible = false
        p37.instance:WaitForChild("Frame"):WaitForChild("EmptyFamily").Visible = true
        p37.instance:WaitForChild("Frame"):WaitForChild("NoFamily").Visible = false
    else
        p37.instance:WaitForChild("Frame"):WaitForChild("InFamily").Visible = true
        p37.instance:WaitForChild("Frame"):WaitForChild("EmptyFamily").Visible = false
        p37.instance:WaitForChild("Frame"):WaitForChild("NoFamily").Visible = false
        p37:refresh_members_list(p38)
        if p39 == nil then
            p37.UIManager.set_app_visibility(p37.ClassName, true)
        end
    end
end
function v9.refresh(p40, p41)
    local v42 = p40.UIManager.is_closed({ "MinigameInGameApp" })
    if not p41[p40.ClassName] then
        v42 = false
    end
    p40:set_visibility(v42)
end
local function v_u_45(p43)
    if lock then
        v_u_8("Locked!")
        return
    else
        local v44 = v_u_2.get_server(game.Players.LocalPlayer, "family_list")
        if v44 then
            p43:refresh_family_ui(v44, nil)
        else
            lock = true
            v_u_3.get("FamilyAPI/CreateFamily"):InvokeServer()
            p43.instance.Frame.InFamily.Visible = false
            p43.instance.Frame.EmptyFamily.Visible = true
            p43.instance.Frame.NoFamily.Visible = false
            wait(0.2)
            lock = false
        end
    end
end
local function v_u_48(p46)
    if p46.UIManager.apps.DialogApp:dialog({
        ["text"] = "Are you sure you want to leave your family?",
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "No" then
        return
    elseif lock then
        v_u_8("Locked!")
        return
    else
        local v47 = v_u_2.get_server(game.Players.LocalPlayer, "family_list")
        if v47 then
            lock = true
            v_u_3.get("FamilyAPI/LeaveFamily"):InvokeServer()
            p46.instance.Frame.InFamily.Visible = false
            p46.instance.Frame.EmptyFamily.Visible = false
            p46.instance.Frame.NoFamily.Visible = true
            wait(0.2)
            lock = false
        else
            v_u_8("Not in a family")
            p46:refresh_family_ui(v47, nil)
        end
    end
end
local function v_u_52(p49)
    local v_u_50 = p49.instance.Frame.InFamily.FamilyName
    v_u_50.FocusLost:connect(function()
        v_u_8("Text changed!")
        v_u_3.get("FamilyAPI/ChangeFamilyName"):InvokeServer(v_u_50.Text)
    end)
    v_u_2.register_server_on_change_hook("family_name", nil, function(_, p51, _)
        v_u_50.Text = p51 or ""
    end)
end
function v9.show(p53)
    p53.instance.Enabled = true
end
function v9.hide(p54)
    p54.instance.Enabled = false
end
function v9.start(p_u_55)
    p_u_55.instance.Frame.InFamily.FamilyName.PlaceholderText = "Insert Family Name Here"
    p_u_55.instance.Frame.InFamily.FamilyName.PlaceholderColor3 = Color3.new(0.5294117647058824, 0.8196078431372549, 1)
    p_u_55.instance.Frame.InFamily.Visible = false
    p_u_55.instance.Frame.EmptyFamily.Visible = false
    p_u_55.instance.Frame.NoFamily.Visible = true
    local v56 = {
        ["mouse_button1_click"] = function()
            v_u_48(p_u_55)
        end
    }
    p_u_55.UIManager.wrap(p_u_55.instance.Frame.InFamily.FamilyButton, "FlatButton"):start(v56)
    local v57 = {
        ["mouse_button1_click"] = function()
            v_u_45(p_u_55)
        end
    }
    p_u_55.UIManager.wrap(p_u_55.instance.Frame.NoFamily.FamilyButton, "FlatButton"):start(v57)
    local v58 = {
        ["mouse_button1_click"] = function()
            v_u_48(p_u_55)
        end
    }
    p_u_55.UIManager.wrap(p_u_55.instance.Frame.EmptyFamily.FamilyButton, "FlatButton"):start(v58)
    p_u_55.UIManager.wrap(p_u_55.instance.Frame.Close, "HoverEnlargeButton"):start({
        ["object_to_hover"] = p_u_55.instance.Frame.Close,
        ["objects"] = { p_u_55.instance.Frame.Close },
        ["enlarge_percentage"] = 1.15,
        ["mouse_button1_click"] = function()
            p_u_55.UIManager.set_app_visibility(p_u_55.ClassName, false)
        end
    })
    p_u_55.player_row = p_u_55.instance.Frame.InFamily.Members.ScrollingFrame.Content.Row2:clone()
    local v_u_59 = {}
    for _, v60 in pairs({ p_u_55.instance.Frame.NoFamily, p_u_55.instance.Frame.EmptyFamily, p_u_55.instance.Frame.InFamily }) do
        local _, v61 = v_u_4.get_open_close_signals(v60)
        local v_u_62 = v_u_6.new()
        v_u_59[v60] = {
            ["signal_open"] = v_u_62,
            ["signal_close"] = v61
        }
        v_u_4.watch({
            ["selection_parent"] = v60,
            ["default_selection"] = v60.FamilyButton,
            ["signal_open"] = v_u_62,
            ["signal_close"] = v61,
            ["setup_button_actions"] = function()
                game:GetService("ContextActionService"):BindAction("FamilyClose", function(_, p63)
                    if p63 == Enum.UserInputState.Begin then
                        game:GetService("ContextActionService"):UnbindAction("FamilyClose")
                        p_u_55.UIManager.set_app_visibility(p_u_55.ClassName, false)
                    end
                end, false, Enum.KeyCode.ButtonB)
            end,
            ["teardown_button_actions"] = function()
                game:GetService("ContextActionService"):UnbindAction("FamilyClose")
            end
        })
        v60:GetPropertyChangedSignal("Visible"):connect(function()
            if p_u_55.instance.Enabled then
                v_u_62:Fire()
            end
        end)
    end
    p_u_55.instance:GetPropertyChangedSignal("Enabled"):connect(function()
        local v64 = p_u_55.instance.Enabled and "signal_open" or "signal_close"
        for v65, v66 in pairs(v_u_59) do
            if v65.Visible then
                v66[v64]:Fire()
                return
            end
        end
    end)
    p_u_55.UIManager.wrap(p_u_55.instance.Frame.Close, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.ButtonB,
        ["on_update"] = function(p67, p68)
            if not p68 then
                p67.instance.Image = "rbxassetid://983354134"
            end
        end
    })
    v_u_3.get("LocationAPI/FamilyMemberLocationUpdated").OnClientEvent:connect(function(p69, p70)
        v_u_17(p_u_55, p69.Name, p70)
    end)
    v_u_2.register_server_on_change_hook("family_list", nil, function(p71, p72, p73)
        if p71 == game.Players.LocalPlayer then
            p_u_55:refresh_family_ui(p72, p73)
        end
    end)
    v_u_52(p_u_55)
    p_u_55.instance:GetPropertyChangedSignal("Enabled"):connect(function()
        if p_u_55.instance.Enabled and delayed_refresh then
            v_u_8("Activating delayed family ui refresh")
            p_u_55:refresh_family_ui(v_u_2.get_server(game.Players.LocalPlayer, "family_list"))
            delayed_refresh = false
        end
        p_u_55.instance.Frame.InFamily.FamilyButton.Modal = p_u_55.instance.Enabled
    end)
end
return v9