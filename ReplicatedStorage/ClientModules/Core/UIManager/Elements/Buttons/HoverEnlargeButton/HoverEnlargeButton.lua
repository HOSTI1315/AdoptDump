--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.HoverEnlargeButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIDB")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("UIHelpers")
local v5 = v2("HoverEnlargeButton", v1("UIBaseElement"))
local v_u_6 = {}
local v_u_7 = {}
function set_static_hover_enlarge(p8, p9, p10)
    v_u_6[p8](p8, p9, p10)
end
function v5.start(_, p11)
    local v_u_12 = p11.object_to_hover
    local v_u_13 = p11.objects
    local v14 = p11.enlarge_percentage
    local v_u_15 = p11.conditional_holds
    local v16 = p11.mouse_button1_down
    local v17 = p11.mouse_button1_click
    local v_u_18 = {}
    local v_u_19 = {}
    local v_u_20 = -1
    local v_u_21 = false
    if v16 then
        v_u_12.MouseButton1Down:connect(v16)
    end
    if v17 then
        v_u_12.MouseButton1Click:connect(v17)
    end
    for _, v22 in pairs(v_u_13) do
        local v23 = v22.Size
        table.insert(v_u_18, v23)
        local v24 = UDim2.new
        local v25 = v22.Size.X.Scale * v14
        local v26 = v22.Size.X.Offset * v14
        local v27 = v22.Size.Y.Scale * v14
        local v28 = v22.Size.Y.Offset * v14
        table.insert(v_u_19, v24(v25, v26, v27, v28))
    end
    local function v_u_33()
        v_u_21 = true
        if v_u_20 == -1 then
            for v29, v30 in pairs(v_u_13) do
                v30:TweenSize(v_u_19[v29], Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.075, true)
            end
            if v_u_15 then
                for v31, v32 in pairs(v_u_15) do
                    if v_u_7[v31] ~= true then
                        set_static_hover_enlarge(v31, v32)
                    end
                end
            end
        end
    end
    local function v_u_37()
        v_u_21 = false
        if v_u_20 == -1 then
            for v34, v35 in pairs(v_u_13) do
                v35:TweenSize(v_u_18[v34], Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.075, true)
            end
            if v_u_15 then
                for v36, _ in pairs(v_u_15) do
                    if v_u_7[v36] ~= true then
                        set_static_hover_enlarge(v36, 1)
                        set_static_hover_enlarge(v36, -1)
                    end
                end
            end
        end
    end
    v_u_6[v_u_12] = function(p38, p39, p40)
        if p39 == -1 then
            v_u_7[p38] = nil
            v_u_20 = -1
            if v_u_21 then
                v_u_33()
            else
                v_u_37()
            end
        else
            v_u_7[p38] = p40
            v_u_20 = p39
            for v41, v42 in pairs(v_u_13) do
                v42:TweenSize(UDim2.new(v_u_18[v41].X.Scale * v_u_20, v_u_18[v41].X.Offset * v_u_20, v_u_18[v41].Y.Scale * v_u_20, v_u_18[v41].Y.Offset * v_u_20), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.075, true)
            end
            return
        end
    end
    v_u_3.run({
        ["desktop"] = function()
            v_u_12.MouseEnter:connect(v_u_33)
            v_u_12.MouseLeave:connect(v_u_37)
        end,
        ["phone"] = function()
            v_u_12.MouseButton1Down:connect(v_u_33)
            v_u_12.MouseButton1Up:connect(v_u_37)
        end,
        ["tablet"] = "phone",
        ["console"] = "desktop"
    })
    v_u_4.call_func_on_made_invisible(v_u_12, v_u_37)
end
return v5