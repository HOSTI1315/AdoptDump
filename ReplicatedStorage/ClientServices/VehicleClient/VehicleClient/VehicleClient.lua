--// ReplicatedStorage.ClientServices.VehicleClient.VehicleClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("VehicleBlockerHelper")
local v_u_3 = v1("ClientToolManager")
local v_u_4 = v1("SimpleEvents")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("InteriorsM")
local v_u_8 = v1("VehicleDB")
local v_u_9 = v1("Maid")
local v_u_10 = v1("new:RaycastHelper")
local v_u_11 = v1("new:StreamingHelper")
local v_u_12 = v1("package:Promise")
local v_u_13 = game:GetService("Players")
local v_u_14 = game:GetService("RunService")
local v_u_15 = game:GetService("CollectionService")
local v16 = {}
local v_u_17 = nil
local v_u_18 = {
    ["wheeled"] = v1("WheeledVehicle"),
    ["wheeled_suspension"] = v1("WheeledVehicleSuspension"),
    ["hoverboard"] = v1("HoverboardVehicle"),
    ["plane"] = v1("PlaneVehicle"),
    ["helicopter"] = v1("HelicopterVehicle"),
    ["jetpack"] = v1("JetpackVehicle"),
    ["boat"] = v1("BoatVehicle"),
    ["mount"] = v1("MountVehicle"),
    ["ice_skates"] = v1("IceSkatesVehicle"),
    ["roller_skates"] = v1("RollerSkatesVehicle")
}
local function v_u_30()
    local v_u_19 = {}
    local function v_u_25(p20)
        local v21 = p20:GetAttribute("vehicle_kind")
        if v21 then
            v21 = v_u_8[v21]
        end
        local v22 = p20:WaitForChild("VehicleOwner").Value
        if v21 then
            local v_u_23 = v_u_9.new()
            local v_u_24 = v21.render_behavior.client(v22, p20, v21, v_u_23)
            v_u_19[p20] = function()
                v_u_24()
                v_u_23:DoCleaning()
            end
        end
    end
    workspace.DescendantAdded:Connect(function(p26)
        if v_u_15:HasTag(p26, "vehicle") then
            v_u_11.await_matching_descendant_count(p26)
            v_u_25(p26)
        end
    end)
    workspace.DescendantRemoving:Connect(function(p27)
        local v28 = v_u_15:HasTag(p27, "vehicle") and v_u_19[p27]
        if v28 then
            v28()
            v_u_19[p27] = nil
        end
    end)
    for _, v_u_29 in v_u_15:GetTagged("vehicle") do
        task.spawn(function()
            v_u_11.await_matching_descendant_count(v_u_29)
            v_u_25(v_u_29)
        end)
    end
end
local function v_u_45()
    local v_u_31 = -1
    local v_u_32 = true
    local function v_u_35()
        if v_u_17 and v_u_17.vehicle_model:IsDescendantOf(game) then
            local v33 = v_u_17.vehicle_model:GetBoundingBox()
            local v34 = v_u_2.is_point_in_vehicle_blocker(v33.Position) and v_u_3.get_equipped_by_category("transport")[1]
            if v34 then
                v_u_3.backpack_equip(v34, {
                    ["forced_action"] = "unequip"
                })
            end
        end
    end
    v_u_6.register_callback("state_manager", function(p36, p37, p38)
        if p36 ~= game.Players.LocalPlayer then
            return
        end
        local v39 = p38 or {
            ["states"] = {}
        }
        for _, v40 in ipairs((p37 or {
            ["states"] = {}
        }).states) do
            if v40.id == "SitInVehicle" then
                v43 = true
                ::l10::
                for _, v41 in ipairs(v39.states) do
                    if v41.id == "SitInVehicle" then
                        v42 = true
                        ::l15::
                        if v43 and not v42 then
                            v_u_32 = true
                            v_u_2.set_general_blockers_enabled(true)
                        elseif not v43 and v42 then
                            v_u_32 = false
                            v_u_12.delay(2):andThen(function()
                                if not v_u_32 then
                                    v_u_2.set_general_blockers_enabled(false)
                                    v_u_35()
                                end
                            end)
                        end
                    end
                end
                local v42 = false
                goto l15
            end
        end
        local v43 = false
        goto l10
    end)
    v_u_7.on_location_changing:Connect(function()
        v_u_31 = tick()
        v_u_35()
    end)
    return {
        ["should_blockers_be_enabled"] = function()
            return v_u_32
        end,
        ["update"] = function(_)
            local v44 = tick()
            if v44 - v_u_31 > 1.5 and not v_u_32 then
                v_u_31 = v44
                v_u_35()
            end
        end
    }
end
local function v_u_47(p46)
    while p46 and p46 ~= game do
        if v_u_15:HasTag(p46, "vehicle") then
            return p46
        end
        p46 = p46.Parent
    end
    return nil
end
local function v_u_64()
    local v_u_48 = v_u_12.resolve()
    local function v_u_59(p49, p_u_50)
        local v51 = p49:FindFirstChild("Humanoid")
        local v52 = p49:FindFirstChild("HumanoidRootPart")
        local v53
        if p_u_50 then
            v53 = v_u_47(p_u_50)
        else
            v53 = p_u_50
        end
        local v54 = v51 and (v52 and (p_u_50 and v53)) and v_u_10.cast_ray({
            ["origin"] = v52.Position + Vector3.new(0, 40, 0),
            ["direction"] = Vector3.new(0, -40, 0),
            ["filter_type"] = Enum.RaycastFilterType.Include,
            ["instances"] = { v53 },
            ["respect_can_collide"] = true
        })
        if v54 then
            local v55 = p_u_50:FindFirstChild("SeatWeld")
            if v55 then
                v55:Destroy()
            end
            p_u_50.Anchored = true
            v_u_48:cancel()
            v_u_48 = v_u_12.fromEvent(v_u_14.PostSimulation):andThen(function()
                p_u_50.Anchored = false
            end)
            local v56 = v52.CFrame.Rotation
            local v57 = v54.Position
            local v58 = v51.HipHeight + v52.Size.Y / 2
            v52.CFrame = v56 + (v57 + Vector3.new(0, v58, 0))
        end
        v_u_5.get("VehicleAPI/JumpOutOfCar"):FireServer()
    end
    v_u_4.get("MyCharacterAdded"):Connect(function(p_u_60)
        local v_u_61 = p_u_60:WaitForChild("Humanoid")
        local v_u_62 = nil
        v_u_61:GetPropertyChangedSignal("SeatPart"):Connect(function()
            local v63 = v_u_61.SeatPart
            if v63 then
                if v_u_15:HasTag(v63, "TransportSeat") then
                    v_u_62 = v63
                    return
                end
            else
                v_u_59(p_u_60, v_u_62)
                v_u_62 = nil
            end
        end)
    end)
end
function v16.get_current_vehicle_wrapper()
    return v_u_17
end
function v16.get_current_riding_vehicle_model()
    local v65 = v_u_13.LocalPlayer.Character
    if v65 then
        v65 = v65:FindFirstChild("Humanoid")
    end
    if v65 then
        v65 = v65.SeatPart
    end
    local v66
    if v65 and v_u_15:HasTag(v65, "TransportSeat") then
        v66 = v_u_47(v65)
    else
        v66 = nil
    end
    return v66
end
function v16.init()
    local v_u_67 = v_u_45()
    v_u_5.get("VehicleAPI/StartVehicleControl").OnClientEvent:Connect(function(p68, p69, p70, p71)
        local v_u_72 = v_u_11.await(p69, 20)
        if v_u_72 then
            local v73 = v_u_11.await_recursive_mut(p70, 20)
            if p71 then
                local v_u_74 = v_u_13.LocalPlayer.Character
                local v_u_75 = v_u_72:FindFirstChild("VehicleSeat")
                if v_u_74 and v_u_75 then
                    task.spawn(function()
                        v_u_14.PostSimulation:Wait()
                        v_u_5.get("VehicleAPI/SitInVehicle"):InvokeServer(v_u_74, v_u_75)
                    end)
                end
            end
            if v_u_17 then
                v_u_17:destroy()
                v_u_17 = nil
            end
            local v76 = v_u_8[p68]
            local v77 = v_u_18[v73.vehicle_type]
            if v77 then
                v_u_17 = v77.new(v_u_72, v73, v76)
                v_u_17:hook_seat_listeners({
                    ["on_enter"] = function(_, _) end,
                    ["on_exit"] = function(_, _) end
                })
            end
            v_u_72.Destroying:Connect(function()
                local v78 = v_u_17
                if v78 then
                    v78 = v_u_17.vehicle_model
                end
                if v_u_17 and v78 == v_u_72 then
                    v_u_17:destroy()
                    v_u_17 = nil
                end
            end)
        else
            warn("Client was supposed to start controlling a vehicle, but it didn\'t show up within 20 seconds. Cancelling.")
        end
    end)
    v_u_14.PostSimulation:Connect(function(p79)
        v_u_67.update(p79)
        debug.profilebegin("vehicle_wrapper_update")
        if v_u_17 and v_u_17.vehicle_model:IsDescendantOf(workspace) then
            v_u_17:update(p79)
        end
        debug.profileend()
    end)
    v_u_64()
    v_u_30()
end
return v16