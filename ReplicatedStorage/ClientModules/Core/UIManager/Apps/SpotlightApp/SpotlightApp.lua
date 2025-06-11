--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SpotlightApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
v1("PlatformM")
v1("RouterClient")
v1("XboxSupport")
local v2 = v1("Class")
local v3 = v1("PlatformM")
v1("SharedConstants")
local v_u_4 = v1("UIDB")
local v_u_5 = v1("CriticalSection")
local v_u_6 = v2("SpotlightApp", v1("UIBaseApp"))
v3.get_platform()
function v_u_6.show(_) end
function v_u_6.hide(_) end
function v_u_6.set_spotlight(p_u_7, p_u_8, p_u_9)
    coroutine.wrap(function()
        p_u_7.critical_section:run(function()
            local v10 = {
                {
                    ["position"] = UDim2.new(0.5, 0, 0, 0),
                    ["anchor_point"] = Vector2.new(0.5, 1),
                    ["size"] = UDim2.new(0, p_u_9.X.Offset, 0, 5000)
                },
                {
                    ["position"] = UDim2.new(0.5, 0, 1, 0),
                    ["anchor_point"] = Vector2.new(0.5, 0),
                    ["size"] = UDim2.new(0, p_u_9.X.Offset, 0, 5000)
                },
                {
                    ["position"] = UDim2.new(0, 0, 0.5, 0),
                    ["anchor_point"] = Vector2.new(1, 0.5),
                    ["size"] = UDim2.new(0, 5000, 0, 5000)
                },
                {
                    ["position"] = UDim2.new(1, 0, 0.5, 0),
                    ["anchor_point"] = Vector2.new(0, 0.5),
                    ["size"] = UDim2.new(0, 5000, 0, 5000)
                }
            }
            p_u_7.spotlight = Instance.new("ImageLabel")
            p_u_7.spotlight.Position = UDim2.new(0, p_u_8.X.Offset, 0, p_u_8.Y.Offset)
            p_u_7.spotlight.AnchorPoint = Vector2.new(0.5, 0.5)
            p_u_7.spotlight.BackgroundTransparency = 1
            p_u_7.spotlight.Image = v_u_4.CircleHoleInSquare
            p_u_7.spotlight.ImageColor3 = Color3.new()
            p_u_7.spotlight.Size = p_u_9
            p_u_7.spotlight.ImageTransparency = 1
            p_u_7.spotlight.Parent = p_u_7.instance
            local v11 = {}
            for _, v12 in pairs(v10) do
                local v13 = Instance.new("Frame")
                v13.BackgroundColor3 = Color3.new()
                v13.BorderSizePixel = 0
                v13.Size = v12.size
                v13.Position = v12.position
                v13.AnchorPoint = v12.anchor_point
                v13.BackgroundTransparency = 1
                v13.Parent = p_u_7.spotlight
                table.insert(v11, v13)
            end
            for _, v14 in pairs(v11) do
                game:GetService("TweenService"):Create(v14, TweenInfo.new(0.3), {
                    ["BackgroundTransparency"] = 0.3
                }):Play()
            end
            p_u_7.tweenable_frames = v11
            local v15 = game:GetService("TweenService"):Create(p_u_7.spotlight, TweenInfo.new(0.3), {
                ["ImageTransparency"] = 0.3
            })
            v15:Play()
            v15.Completed:wait()
        end)
    end)()
end
function v_u_6.clear_spotlight(p_u_16)
    coroutine.wrap(function()
        p_u_16.critical_section:run(function()
            if p_u_16.spotlight ~= nil then
                for _, v17 in pairs(p_u_16.tweenable_frames) do
                    game:GetService("TweenService"):Create(v17, TweenInfo.new(0.3), {
                        ["BackgroundTransparency"] = 1
                    }):Play()
                end
                local v18 = game:GetService("TweenService"):Create(p_u_16.spotlight, TweenInfo.new(0.3), {
                    ["ImageTransparency"] = 1
                })
                v18:Play()
                v18.Completed:wait()
                p_u_16.spotlight:Destroy()
                p_u_16.spotlight = nil
            end
        end)
    end)()
end
function v_u_6.set_arrow(p_u_19, p_u_20, p_u_21, p_u_22)
    local v23 = (p_u_22 == "right" or p_u_22 == "up") and true or p_u_22 == "down"
    assert(v23, "unsupported spotlight arrow direction - need to implement to make this work")
    v_u_6:stop_arrow()
    coroutine.wrap(function()
        p_u_19.arrow_crit:run(function()
            p_u_19.arrow_running = true
            p_u_19.arrow = p_u_19.arrow_template:clone()
            local v24 = p_u_19.arrow
            local v25 = p_u_22 == "right" and Vector2.new(1, 0.5) or p_u_22 == "up" and Vector2.new(0.5, 0)
            if not v25 then
                if p_u_22 == "down" then
                    v25 = Vector2.new(0.5, 1)
                else
                    v25 = false
                end
            end
            v24.AnchorPoint = v25
            p_u_19.arrow.Rotation = p_u_22 == "right" and 0 or (p_u_22 == "up" and 270 or (p_u_22 == "down" and 90 or false))
            p_u_19.arrow.Position = p_u_20
            p_u_19.arrow.Parent = p_u_19.instance
            while p_u_19.arrow_running do
                local v26 = game:GetService("TweenService"):Create(p_u_19.arrow, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ["Position"] = p_u_19.arrow.Position + p_u_21
                })
                v26:Play()
                v26.Completed:wait()
                if not p_u_19.arrow_running then
                    break
                end
                local v27 = game:GetService("TweenService"):Create(p_u_19.arrow, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    ["Position"] = p_u_19.arrow.Position - p_u_21
                })
                v27:Play()
                v27.Completed:wait()
                wait()
            end
        end)
    end)()
end
function v_u_6.stop_arrow(p28)
    p28.arrow_running = false
    if p28.arrow then
        p28.arrow:Destroy()
        p28.arrow = nil
    end
end
function v_u_6.start(p29)
    p29.instance.ClipToDeviceSafeArea = false
    p29.instance.Spotlight:Destroy()
    p29.arrow_template = p29.instance.Arrow
    p29.arrow_template.Parent = nil
    p29.critical_section = v_u_5.new()
    p29.arrow_crit = v_u_5.new()
end
return v_u_6