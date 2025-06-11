--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.LikesRewardApp (ModuleScript)

local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v_u_2("Class")
local v_u_4 = v_u_2("KindDB")
local v5 = v_u_2("PlatformM")
local v_u_6 = v_u_2("ClientData")
local v_u_7 = v_u_2("XboxSupport")
local v_u_8 = v_u_2("RouterClient")
local v_u_9 = v_u_2("SharedConstants")
local v_u_10 = v_u_2("GroupRankHelper")
local v11 = v3("LikesRewardApp", v_u_2("UIBaseApp"))
local v_u_12 = v5.get_platform() == "phone" and true or v5.get_platform() == "tablet"
local v_u_13 = false
local v_u_14 = 0
function v11._display_frame(p15, p16)
    local v17 = p16.ExitButton
    if p15.like_frame.Visible then
        v17 = p15.main_frame.LikeButton
    elseif p15.group_frame.Visible then
        v17 = p15.main_frame.JoinGroupButton
    end
    for _, v18 in p15.frames do
        v18.Visible = v18 == p16
    end
    p15.watch:select_object(v17)
end
function v11.has_claimed_reward(_)
    return (v_u_2("ClientData").get("boolean_flags") or {}).claimed_like_reward == true
end
function v11.can_claim_reward(p19)
    local v20 = not p19:has_claimed_reward()
    if v20 then
        if v_u_13 then
            return true
        end
        if tick() - v_u_14 > 3 then
            v_u_14 = tick()
            local v21 = v_u_6.get("likes_reward_group_override") or nil
            v_u_13 = v_u_10.get_rank_from_player(game.Players.LocalPlayer, v21) > 0
        end
        v20 = v_u_13
    end
    return v20
end
function v11.try_claim_reward(p22)
    if p22:can_claim_reward() then
        if v_u_8.get("EventAPI/ClaimLikeReward"):InvokeServer() then
            local v23 = v_u_4[v_u_9.like_reward_kind]
            p22.UIManager.apps.DialogApp:dialog({
                ["text"] = ("You have claimed your %*!"):format(v23.name),
                ["button"] = "Cool!",
                ["yields"] = false
            })
            return true
        end
    else
        p22.UIManager.apps.DialogApp:dialog({
            ["text"] = "Like the game and join the \"Uplift Games\" group to claim!",
            ["button"] = "Okay",
            ["yields"] = false
        })
    end
    return false
end
function v11.show(p24)
    p24:_display_frame(p24.main_frame)
    p24.instance.Enabled = true
    p24.watch:select_object(p24.main_frame.ExitButton)
end
function v11.hide(p25)
    p25.instance.Enabled = false
    for _, v26 in p25.frames do
        v26.Visible = false
    end
end
function v11.start(p_u_27)
    local v28
    if v_u_12 then
        v28 = p_u_27.instance.Mobile
    else
        v28 = p_u_27.instance.Desktop
    end
    for _, v29 in v28:GetChildren() do
        v29.Parent = p_u_27.instance
    end
    p_u_27.instance.Desktop:Destroy()
    p_u_27.instance.Mobile:Destroy()
    p_u_27.main_frame = p_u_27.instance.MainFrame
    p_u_27.like_frame = p_u_27.instance.LikeFrame
    p_u_27.group_frame = p_u_27.instance.JoinGroupFrame
    p_u_27.frames = { p_u_27.main_frame, p_u_27.like_frame, p_u_27.group_frame }
    for _, v_u_30 in p_u_27.frames do
        p_u_27.UIManager.wrap(v_u_30.ExitButton, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                if v_u_30 == p_u_27.main_frame then
                    p_u_27.UIManager.set_app_visibility(p_u_27.ClassName, false)
                else
                    p_u_27:_display_frame(p_u_27.main_frame)
                end
            end
        })
    end
    p_u_27.UIManager.wrap(p_u_27.main_frame.LikeButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_27:_display_frame(p_u_27.like_frame)
        end
    }):set_state("selected")
    p_u_27.UIManager.wrap(p_u_27.main_frame.JoinGroupButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_27:_display_frame(p_u_27.group_frame)
        end
    }):set_state("selected")
    local v_u_31 = v_u_1:Create(p_u_27.main_frame.Shine, TweenInfo.new(9, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
        ["Rotation"] = 360
    })
    p_u_27.main_frame:GetPropertyChangedSignal("Visible"):Connect(function()
        if p_u_27.main_frame.Visible then
            v_u_31:Play()
        elseif v_u_31 then
            v_u_31:Cancel()
            p_u_27.main_frame.Shine.Rotation = 0
        end
    end)
    p_u_27.watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_27.instance,
        ["default_selection"] = p_u_27.main_frame.ExitButton,
        ["app_name"] = p_u_27.ClassName,
        ["exit_buttons"] = { p_u_27.like_frame.ExitButton, p_u_27.group_frame.ExitButton, p_u_27.main_frame.ExitButton },
        ["close_override"] = function()
            if p_u_27.main_frame.Visible then
                return true
            end
            p_u_27:_display_frame(p_u_27.main_frame)
            return false
        end
    })
end
return v11