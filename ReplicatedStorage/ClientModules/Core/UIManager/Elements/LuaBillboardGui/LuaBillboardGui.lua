--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.LuaBillboardGui (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIDB")
v1("PlatformM")
v1("ColorThemeManager")
local v3 = v1("Set")
local v_u_4 = game:GetService("RunService")
game:GetService("TweenService")
local v5 = v2("LuaBillboardGui", v1("UIBaseElement"))
local v_u_6 = v3.new()
local v_u_7 = false
local function v_u_20()
    local v8 = workspace.CurrentCamera.CFrame.Position
    local v9 = {}
    for v10, _ in pairs(v_u_6) do
        local v11 = { v10, (v10.adornee.Position - v8).magnitude }
        table.insert(v9, v11)
    end
    table.sort(v9, function(p12, p13)
        return p12[2] < p13[2]
    end)
    for v14, v15 in pairs(v9) do
        local v16 = v15[1]
        local v17 = (v16.adornee.CFrame - v16.adornee.Position) * v16.studs_offset_relative_to_adornee_rotation
        local v18, _ = workspace.CurrentCamera:WorldToViewportPoint((v16.locked_position or v16.adornee.Position) + v16.studs_offset_world_space + v17)
        if v18.Z <= 0.1 then
            v16.is_behind_camera = true
            v16:_refresh_visibility()
        else
            v16.is_behind_camera = false
            v16:_refresh_visibility()
            local v19 = UDim2.new(0, v18.X, 0, v18.Y)
            v16.instance.Position = v19
            v16.instance.ZIndex = -v14 + (v16.always_on_top_zindex and (100 * v16.always_on_top_zindex or 0) or 0)
            v16.zindex = -v14
            if v16.on_render_stepped then
                v16.on_render_stepped(v19)
            end
        end
    end
end
function v5.set_always_on_top_zindex(p21, p22)
    if p22 == 0 then
        p21.always_on_top_zindex = nil
    else
        p21.always_on_top_zindex = p22
    end
end
function v5._refresh_visibility(p23)
    if p23.hidden or p23.is_behind_camera then
        p23.instance.Visible = false
    else
        p23.instance.Visible = true
    end
end
function v5.set_hidden(p24, p25)
    p24.hidden = p25
    p24:_refresh_visibility()
end
function v5.start(p26, p27)
    p26.props = p27 or {}
    p26.screen_gui = p26.props.screen_gui
    p26.container = p26.props.container or p26.screen_gui
    p26.studs_offset_world_space = p26.props.studs_offset_world_space or Vector3.new()
    p26.studs_offset_relative_to_adornee_rotation = p26.props.studs_offset_relative_to_adornee_rotation or Vector3.new()
    p26.adornee = p26.props.adornee
    p26.always_on_top = p26.props.always_on_top or false
    p26.on_render_stepped = p26.props.on_render_stepped
    p26.locked_position = p26.props.locked_position
    p26.zindex = 0
    p26.instance.AnchorPoint = Vector2.new(0.5, 0.5)
    p26.instance.Parent = p26.container
    p26:set_hidden(p27.hidden or false)
    v_u_6:add(p26)
    v_u_20()
    if not v_u_7 then
        v_u_4:BindToRenderStep("RefreshLuaBillboardGui", Enum.RenderPriority.Camera.Value + 2, v_u_20)
        v_u_7 = true
    end
    return p26
end
function v5.destroy(p28)
    p28.instance:Destroy()
    v_u_6:remove(p28)
    if #v_u_6:tolist() == 0 and v_u_7 then
        v_u_4:UnbindFromRenderStep("RefreshLuaBillboardGui")
        v_u_7 = false
    end
end
return v5