--// ReplicatedStorage.SharedModules.ContentPacks.SocialStones2025.AilmentRewards (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("new:AilmentReward")
local v_u_3 = v_u_1("new:AilmentsDB")
v_u_1("AltCurrencyData")
local v_u_4 = v_u_1("SharedConstants")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = v_u_4.social_stones.max_earned_per_ailment
local v7 = v2.new
local v8 = {
    ["key"] = "social_stones",
    ["pets_only"] = true,
    ["exclude_family_members"] = true
}
local v10 = {
    ["sequence_order"] = 3,
    ["pickup"] = {
        ["source"] = "pet",
        ["target"] = "me",
        ["color"] = v_u_4.social_stones.text_stroke_color,
        ["image"] = v_u_4.social_stones.image
    },
    ["billboard"] = {
        ["get_text"] = function(p9)
            return ("+%*"):format(p9)
        end,
        ["color"] = v_u_4.social_stones.text_stroke_color,
        ["image"] = v_u_4.social_stones.image
    },
    ["sprout_image"] = v_u_4.social_stones.image
}
v8.reward_animation = v10
function v8.get(p11, _, p12)
    local v13 = v_u_1("FriendsServer")
    if v_u_3[p12.ailment_key].category ~= "GOLDEN" then
        return 0
    end
    local v14 = v13.get_friends(p11):expect().server
    local v15 = v_u_5.Dictionary.count(v14)
    local v16 = v_u_6
    return math.min(v15, v16)
end
function v8.apply_budget(p17, p18, _)
    local v19 = v_u_1("DataM").get_store(p17)
    local v20 = v19 and v19:get("social_stones_manager") or nil
    if v20 then
        return v20:apply_budget(p18)
    else
        return p18
    end
end
function v8.commit(p21, p22, _)
    local v23 = v_u_1("DataM").get_store(p21)
    local v24
    if v23 then
        v24 = v23:get("social_stones_2025")
    else
        v24 = nil
    end
    if v24 then
        local v25 = v24 + p22
        if v25 >= 25 and not v23:get("social_stones_notification_sent") then
            v23:set("social_stones_notification_sent", true)
            v_u_1("MsgBridge").dialog(p21, {
                ["text"] = "You earned 25 Social Stones! Exchange them for a Snapdragon Flower at the Butterfly Sanctuary!",
                ["button"] = "Okay"
            })
        end
        v23:set("social_stones_2025", v25)
    end
end
function v8.render_ailment_tag(p26, p27, p28)
    local v_u_29 = v_u_1("ClientData")
    local v_u_30 = v_u_1("FriendsClient")
    local v31 = v_u_1("TweenHelper")
    local v_u_32 = v_u_1("TweenPromise")
    if v_u_3[p26.kind].category ~= "GOLDEN" then
        return false
    end
    local v33
    if p27.AbsoluteSize.X < 100 then
        v33 = UDim2.fromScale(0.6, 0.6)
    else
        v33 = UDim2.fromScale(0.45, 0.45)
    end
    local v_u_34 = Instance.new("ImageLabel")
    v_u_34.Image = v_u_4.social_stones.image
    v_u_34.Size = v33
    v_u_34.Position = UDim2.fromScale(1, 0)
    v_u_34.AnchorPoint = Vector2.new(0.75, 0.25)
    v_u_34.BackgroundTransparency = 1
    v_u_34.ZIndex = 10
    v_u_34.Visible = false
    v_u_34.Parent = p27
    p28:GiveTask(v_u_34)
    local v_u_35 = Instance.new("TextLabel")
    v_u_35.Size = UDim2.fromScale(0.75, 0.75)
    v_u_35.Position = UDim2.fromScale(0.5, 0.5)
    v_u_35.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_35.BackgroundTransparency = 1
    v_u_35.Font = Enum.Font.FredokaOne
    v_u_35.TextScaled = true
    v_u_35.TextColor3 = Color3.new(1, 1, 1)
    v_u_35.Text = ""
    v_u_35.Parent = v_u_34
    p28:GiveTask(v_u_35)
    local v36 = Instance.new("UIStroke")
    v36.Color = v_u_4.social_stones.text_stroke_color
    v36.Thickness = 3
    v36.Parent = v_u_35
    p28:GiveTask(v36)
    local v_u_37 = Instance.new("UIScale")
    v_u_37.Parent = v_u_34
    p28:GiveTask(v_u_37)
    local v_u_38 = nil
    local v_u_39 = v31.tween_info({
        ["time"] = 0.1,
        ["reverses"] = true
    })
    local v_u_40 = nil
    local function v46()
        local v41 = v_u_29.get("social_stones_manager")
        if v41 then
            v41 = v41.next_earn_time
        end
        local v42
        if v41 then
            v42 = 0
        else
            local v43 = v_u_30.get_friends():expect().server
            local v44 = v_u_5.Dictionary.count(v43)
            local v45 = v_u_6
            v42 = math.min(v44, v45)
        end
        if v42 > 0 then
            v_u_34.Visible = true
            v_u_35.Text = ("+%*"):format(v42)
            if v_u_40 and v42 ~= v_u_40 then
                if v_u_38 then
                    v_u_38:cancel()
                    v_u_37.Scale = 1
                end
                v_u_38 = v_u_32.new(v_u_37, v_u_39, {
                    ["Scale"] = 1.2
                })
            end
        else
            v_u_34.Visible = false
            v_u_37.Scale = 1
        end
        v_u_40 = v42
    end
    p28:GiveTask(v_u_30.get_friends_in_server_changed_signal():Connect(v46))
    p28:GiveTask(v_u_29.register_callback("social_stones_manager", v46))
    v46()
    return false
end
return {
    ["social_stones"] = v7(v8)
}