--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactMotion.SimpleMotion (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load("Roact")
local v_u_3 = require(script.Parent:WaitForChild("stepSpring"))
local v_u_4 = require(script.Parent:WaitForChild("merge"))
local v_u_5 = require(script.Parent:WaitForChild("Config"))
local v_u_6 = require(script.Parent:WaitForChild("MotionType"))
local v_u_7 = require(script.Parent:WaitForChild("MotionSpecifier"))
local v8 = v2.Component:extend("SimpleMotion")
function v8.init(p9)
    local v10 = {}
    local v11 = {}
    for v12, v13 in pairs(p9.props.style) do
        v10[v12] = 0
        v11[v12] = v_u_7.extractValue(v13)
    end
    if p9.props.defaultStyle then
        for v14, v15 in pairs(p9.props.defaultStyle) do
            v11[v14] = v15
        end
    end
    p9.resting = false
    p9.accumulator = 0
    p9.state = {
        ["values"] = v11,
        ["velocities"] = v10
    }
    p9.targetSpecifiers = p9.props.style
end
function v8.render(p16)
    return p16.props.render(p16.state.values)
end
function v8.didMount(_) end
function v8.willUnmount(p17)
    if p17.connection then
        p17.connection:Disconnect()
    end
end
function v8.willUpdate(p_u_18, p19)
    if p19 == p_u_18.props then
        return
    else
        p_u_18.targetSpecifiers = p19.style
        p_u_18.resting = false
        if not p_u_18.connected then
            p_u_18.connected = true
            p_u_18.connection = v_u_1.RenderStepped:Connect(function(p20)
                if p_u_18.resting then
                    p_u_18.connection:Disconnect()
                    p_u_18.connected = false
                    return
                end
                local v21 = v_u_4(p_u_18.state.values)
                local v22 = v_u_4(p_u_18.state.velocities)
                p_u_18.accumulator = p_u_18.accumulator + p20 % v_u_5.MAX_ACCUMULATION
                while p_u_18.accumulator >= v_u_5.UPDATE_RATE do
                    p_u_18.accumulator = p_u_18.accumulator - v_u_5.UPDATE_RATE
                    local v23 = true
                    for v24, v25 in pairs(p_u_18.targetSpecifiers) do
                        local v26 = v_u_7.getType(v25)
                        local v27 = nil
                        local v28 = nil
                        if v26 == v_u_6.Instant then
                            v27 = v25
                            v28 = 0
                        elseif v26 == v_u_6.Spring then
                            v27, v28 = v_u_3(v_u_5.UPDATE_RATE * v_u_5.TIME_FACTOR, v21[v24], v22[v24], v25.value, v25.stiffness, v25.damping, v_u_5.SPRING_PRECISION)
                        else
                            error(("Unsupported MotionType %q"):format(v26))
                        end
                        v21[v24] = v27
                        v22[v24] = v28
                        if v27 ~= v_u_7.extractValue(v25) or v28 ~= 0 then
                            v23 = false
                        end
                    end
                    if v23 then
                        p_u_18.resting = true
                        break
                    end
                end
                p_u_18:setState({
                    ["values"] = v21,
                    ["velocities"] = v22
                })
            end)
        end
    end
end
return v8