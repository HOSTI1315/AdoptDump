--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PeopleInsideCountApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("new:StreamingHelper")
local v_u_6 = {
    ["MainMap"] = true,
    ["Neighborhood"] = true,
    ["DebugInterior"] = true
}
local v7 = v2("PeopleInsideCountApp", v1("UIBaseApp"))
function v7.show_people_count(p8, p9)
    local v10 = p9.door
    local v11 = p9.destination_id
    local v12 = p9.destination_door_id
    local v13 = p9.house_owner
    if not v_u_6[v11] then
        p8.active_people_counters[v10] = {
            ["destination_id"] = v11,
            ["destination_door_id"] = v12,
            ["house_owner"] = v13
        }
        p8:_refresh_ui()
    end
end
function v7.hide_people_count(p14, p15)
    local v16 = p15.door
    local v17 = p14.active_people_counters[v16]
    if v17 then
        if v17.ui then
            v17.ui:Destroy()
        end
        p14.active_people_counters[v16] = nil
    end
    p14:_refresh_ui()
end
local function v_u_21(p18)
    if typeof(p18) == "table" then
        local v19 = p18.destination_id
        local v20 = p18.house_owner
        if typeof(v19) == "string" then
            if v19 == "housing" and typeof(v20) ~= "Instance" then
                if typeof(v20) == "string" then
                    v20 = v_u_5.get_instance_by_id(v20)
                end
                if typeof(v20) ~= "Instance" then
                    return
                end
            end
            if v19 == "housing" then
                return "housing!" .. v20.Name
            else
                return v19
            end
        else
            return
        end
    else
        return
    end
end
local function v_u_26()
    local v22 = {}
    for _, v23 in ipairs(game.Players:GetPlayers()) do
        local v24 = v_u_3.get_server(v23, "char_wrapper_raw")
        if v24 then
            local v25 = v_u_21(v24.location)
            if v25 then
                v22[v25] = (v22[v25] or 0) + 1
            end
        end
    end
    return v22
end
function v7._refresh_ui(p_u_27)
    if next(p_u_27.active_people_counters) == nil and p_u_27.stepped then
        p_u_27.stepped:Disconnect()
        p_u_27.stepped = nil
        return
    elseif not p_u_27.stepped then
        local v_u_28 = 0
        p_u_27.stepped = game:GetService("RunService").Stepped:Connect(function(_, p29)
            v_u_28 = v_u_28 + p29
            if v_u_28 >= 0.2 then
                v_u_28 = 0
                local v30 = v_u_26()
                for v31, v32 in pairs(p_u_27.active_people_counters) do
                    local v33 = v31:FindFirstChild("WorkingParts")
                    if v33 then
                        v33 = v33:FindFirstChild("TouchToEnter")
                    end
                    if v33 then
                        if not v32.ui then
                            local v34 = p_u_27.counter_ui_template:Clone()
                            v34.Name = "PeopleCounter"
                            v34.Adornee = v33
                            local v35 = v33.Size.Y / 2 + 1.5
                            v34.StudsOffsetWorldSpace = Vector3.new(0, v35, 0)
                            v34.Parent = p_u_27.instance
                            v32.ui = v34
                        end
                        local v36 = v30[v_u_21(v32)] or 0
                        if v36 > 0 then
                            v32.ui.Frame.NumPeople.Text = v36
                            v32.ui.Enabled = true
                        else
                            v32.ui.Enabled = false
                        end
                    end
                end
            end
        end)
    end
end
function v7.show(p37)
    p37.instance.Parent = p37.instance_original_parent or p37.instance.Parent
end
function v7.hide(p38)
    if p38.instance.Parent then
        p38.instance_original_parent = p38.instance.Parent
    end
    p38.instance.Parent = nil
end
function v7.start(p39)
    p39.active_people_counters = {}
    p39.counter_ui_template = p39.instance.PeopleCounterTemplate
    p39.counter_ui_template.Parent = nil
    if v_u_4.get_platform() == v_u_4.platform.phone then
        local v40 = Instance.new("UIScale")
        v40.Scale = 0.7
        v40.Parent = p39.counter_ui_template.Frame
    end
end
return v7