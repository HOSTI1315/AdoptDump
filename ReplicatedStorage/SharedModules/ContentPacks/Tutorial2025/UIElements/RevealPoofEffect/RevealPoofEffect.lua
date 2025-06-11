--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.UIElements.RevealPoofEffect (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("SoundPlayer")
local v_u_5 = v1("TweenHelper")
local v_u_6 = v1("TweenPromise")
local v7 = v1("UIBaseElement")
local v_u_8 = {
    ["CanvasGroup"] = "GroupTransparency",
    ["ImageLabel"] = "ImageTransparency",
    ["ImageButton"] = "ImageTransparency",
    ["Frame"] = "BackgroundTransparency"
}
local v_u_9 = v_u_5.tween_info({
    ["time"] = 0.45,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_10 = v_u_5.tween_info({
    ["delay_time"] = 0.4,
    ["time"] = 0.2,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_11 = v_u_5.tween_info({
    ["time"] = 3,
    ["easing_style"] = Enum.EasingStyle.Quart,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_12 = v_u_5.tween_info({
    ["time"] = 3,
    ["easing_style"] = Enum.EasingStyle.Linear
})
local v_u_13 = v_u_5.tween_info({
    ["delay_time"] = 2.5,
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_14 = v_u_5.tween_info({
    ["delay_time"] = 0.4,
    ["time"] = 0.2,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_15 = {
    {
        ["rotation"] = 20,
        ["angle"] = -2.8797932657906435,
        ["distance"] = 1.4,
        ["size"] = 0.75,
        ["delay_time"] = 0.2
    },
    {
        ["rotation"] = 0,
        ["angle"] = -0.5235987755982988,
        ["distance"] = 1.2,
        ["size"] = 0.9,
        ["delay_time"] = 0.1
    },
    {
        ["rotation"] = -10,
        ["angle"] = 0.3490658503988659,
        ["distance"] = 1.3,
        ["size"] = 0.6,
        ["delay_time"] = 0.15
    }
}
local v_u_16 = {
    {
        ["rotation"] = 20,
        ["angle"] = -3.0543261909900767,
        ["distance"] = 0.7,
        ["size"] = 1,
        ["delay_time"] = 0.25
    },
    {
        ["rotation"] = 0,
        ["angle"] = -0.7853981633974483,
        ["distance"] = 0.65,
        ["size"] = 1,
        ["delay_time"] = 0.3
    },
    {
        ["rotation"] = -10,
        ["angle"] = 0.6108652381980153,
        ["distance"] = 0.75,
        ["size"] = 0.8,
        ["delay_time"] = 0.35
    }
}
local v_u_17 = {
    {
        ["rotation"] = 5,
        ["end_rotation"] = 0
    },
    {
        ["rotation"] = 30,
        ["end_rotation"] = 60
    },
    {
        ["rotation"] = -165,
        ["end_rotation"] = -125
    }
}
local v18 = v2("RevealPoofEffect", v7)
function v18.play(p19)
    p19.maid:DoCleaning()
    p19.rays.GroupTransparency = 1
    p19.rays.UIScale.Scale = 1
    v_u_4.FX:play("GoldSparklePrize")
    p19:_animate_content()
    p19:_animate_big_cloud()
    p19:_animate_stars()
    p19:_animate_clouds()
    p19:_animate_rays()
    p19.main.Visible = true
end
function v18._animate_content(p20)
    local v21 = nil
    for v22, v23 in v_u_8 do
        if p20.content:IsA(v22) then
            v21 = v23
            break
        end
    end
    p20.content[v21] = 1
    if v21 then
        p20.maid:GiveTask(v_u_6.new(p20.content, v_u_14, {
            [v21] = 0
        }))
    end
end
function v18._animate_big_cloud(p24)
    p24.top_layer.GroupTransparency = 0
    p24.top_layer.UIScale.Scale = 0
    p24.maid:GiveTask(v_u_6.new(p24.top_layer.UIScale, v_u_9, {
        ["Scale"] = 1.2
    }))
    p24.maid:GiveTask(v_u_6.new(p24.top_layer, v_u_10, {
        ["GroupTransparency"] = 1
    }))
end
function v18._animate_rays(p25)
    p25.rays.GroupTransparency = 0
    p25.rays.UIScale.Scale = 0
    for _, v26 in v_u_17 do
        local v27 = p25.ray_template:Clone()
        v27.Rotation = v26.rotation
        v27.Parent = p25.rays
        p25.maid:GiveTask(v_u_6.new(v27, v_u_12, {
            ["Rotation"] = v26.end_rotation
        }))
        p25.maid:GiveTask(v27)
    end
    p25.maid:GiveTask(v_u_6.new(p25.rays.UIScale, v_u_11, {
        ["Scale"] = 3
    }))
    p25.maid:GiveTask(v_u_6.new(p25.rays, v_u_13, {
        ["GroupTransparency"] = 1
    }))
end
function v18._animate_particles(p28, p29, p30)
    for v31 = 1, #p30 do
        local v32 = p30[v31]
        local v33 = p29:Clone()
        v33.UIScale.Scale = 0
        v33.Parent = p28.bottom_layer
        local v34 = UDim2.fromScale
        local v35 = v32.angle
        local v36 = 0.5 + math.cos(v35) * v32.distance
        local v37 = v32.angle
        local v38 = v34(v36, 0.5 + math.sin(v37) * v32.distance)
        local v39 = v_u_5.tween_info({
            ["delay_time"] = v32.delay_time,
            ["time"] = 0.2,
            ["easing_style"] = Enum.EasingStyle.Quad,
            ["easing_direction"] = Enum.EasingDirection.Out
        })
        local v40 = v_u_5.tween_info({
            ["delay_time"] = v32.delay_time + 0.3,
            ["time"] = 0.25,
            ["easing_style"] = Enum.EasingStyle.Quad,
            ["easing_direction"] = Enum.EasingDirection.Out
        })
        p28.maid:GiveTask(v_u_6.new(v33, v39, {
            ["Position"] = v38
        }))
        p28.maid:GiveTask(v_u_6.new(v33.UIScale, v39, {
            ["Scale"] = v32.size
        }))
        p28.maid:GiveTask(v_u_6.new(v33, v40, {
            ["ImageTransparency"] = 1
        }))
        p28.maid:GiveTask(v33)
    end
end
function v18._animate_stars(p41)
    p41:_animate_particles(p41.star_template, v_u_15)
end
function v18._animate_clouds(p42)
    p42:_animate_particles(p42.cloud_template, v_u_16)
end
function v18.start(p43)
    p43.maid = v_u_3.new()
    p43.main = game.ReplicatedStorage.Resources:FindFirstChild("RevealPoofEffect"):Clone()
    p43.main.Parent = p43.instance
    p43.content = p43.instance:FindFirstChild("Content")
    p43.content.ZIndex = 2
    p43.content.Parent = p43.main
    p43.bottom_layer = p43.main.BottomLayer
    p43.top_layer = p43.main.TopLayer
    p43.rays = p43.main.Rays
    p43.ray_template = p43.rays.Ray
    p43.ray_template.Parent = nil
    p43.cloud_template = p43.bottom_layer.SmallCloud
    p43.cloud_template.Parent = nil
    p43.star_template = p43.bottom_layer.Star
    p43.star_template.Parent = nil
    p43.main.Visible = false
end
function v18.destroy(p44)
    p44.content.Parent = p44.instance
    p44.maid:DoCleaning()
    p44.main:Destroy()
end
return v18