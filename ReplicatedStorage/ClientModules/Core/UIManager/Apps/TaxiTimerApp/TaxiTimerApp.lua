--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TaxiTimerApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("TaxiDestinationDB")
local v_u_4 = v1("SharedConstants")
local v_u_5 = v1("PlatformM")
local v_u_6 = game:GetService("Players")
local v7 = v2("TaxiTimerApp", v1("UIBaseApp"))
local v_u_8 = v_u_5.get_platform()
function v7.show(p9)
    p9.instance.Frame.Visible = true
end
function v7.hide(p10)
    p10.instance.Frame.Visible = false
end
function v7._refresh_timer_label(p11)
    local v12 = workspace:GetServerTimeNow() - p11.ride_state.start_time
    local v13 = v_u_4.taxi.time_limit - v12
    local v14 = math.max(0, v13)
    local v15 = math.floor(v14)
    p11.timer.Text = tostring(v15)
end
function v7.start_ride(p16, p17)
    p16.UIManager.set_app_visibility(p16.ClassName, true)
    p16.ride_state = p17
    local v18 = p17.destination_type
    local v19 = p17.destination_key
    if v18 == "MainMap" then
        local v20 = v_u_3[v19]
        p16.destination_image.Image = v20.image_large
        p16.destination_image.Size = UDim2.fromOffset(33, 23)
        p16.destination_name.Text = v20.name
    else
        local v21 = v18 == "Friends" and v_u_6:GetPlayerByUserId(v19)
        if v21 then
            local v22 = "https://www.roblox.com/headshot-thumbnail/image?width=60&height=60&format=png&userid=" .. v19
            p16.destination_image.Image = v22
            p16.destination_image.Size = UDim2.fromOffset(23, 23)
            p16.destination_name.Text = v21.Name
        end
    end
    p16.passenger_name.Text = p17.passenger.Name
    p16:_refresh_timer_label()
end
function v7.stop_ride(p23)
    p23.UIManager.set_app_visibility(p23.ClassName, false)
    p23.ride_state = nil
end
function v7.start(p_u_24)
    local v_u_25 = p_u_24.instance.Frame
    p_u_24.frame = v_u_25
    p_u_24.destination_name = v_u_25.DestinationFrame.DestinationName
    p_u_24.destination_image = v_u_25.DestinationFrame.DestinationImage
    p_u_24.passenger_name = v_u_25.PassengerFrame.PassengerName
    p_u_24.timer = v_u_25.Timer
    p_u_24.ride_state = nil
    task.spawn(function()
        while true do
            if v_u_25.Visible and p_u_24.ride_state then
                p_u_24:_refresh_timer_label()
            end
            task.wait(1)
        end
    end)
    if v_u_8 == v_u_5.platform.phone then
        v_u_25.Position = UDim2.new(0.5, 0, 0, 0)
    else
        v_u_25.Position = UDim2.new(0.5, 0, 0, 40)
    end
end
return v7