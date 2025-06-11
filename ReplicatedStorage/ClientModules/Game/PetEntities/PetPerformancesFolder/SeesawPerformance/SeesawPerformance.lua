--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.SeesawPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("package:Promise")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("ModifierPriority")
local v_u_6 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_7 = v1("SeatUtil")
local v_u_8 = v1("UIManager")
local v_u_9 = v1("StateManagerClient")
local v_u_10 = Random.new()
local v_u_11 = v1("Debug").create_debug_log("Step", false)
local v_u_12 = v1("Debug").create_debug_log("StateManager", false)
local function v_u_13(...)
    warn("[" .. script.Name .. "]", ...)
end
local v_u_14 = {
    "\226\157\147\226\157\147\226\157\147",
    "\240\159\152\155\240\159\152\155\240\159\152\155",
    "\226\157\151 \226\157\151 \226\157\151",
    "\240\159\153\130\240\159\153\130\240\159\153\130",
    "\240\159\152\132\240\159\152\132\240\159\152\132",
    "\240\159\152\142\240\159\152\142\240\159\152\142"
}
local v_u_15 = {
    ["TextColor3"] = Color3.fromRGB(59, 0, 255),
    ["always_on_top"] = true
}
local v_u_16 = {
    ["BabyBeingHeld"] = true,
    ["PetBeingRidden"] = true,
    ["PetBeingFlown"] = true,
    ["BabyOnStroller"] = true,
    ["SitInVehicle"] = true
}
local v_u_17 = {
    ["None"] = 1,
    ["Leave"] = 2,
    ["Sit"] = 3,
    ["PlaySolo"] = 4
}
local v_u_18 = {
    ["Jump"] = 1,
    ["Curious"] = 2
}
local v_u_19 = {
    ["ExitInProgress"] = 1,
    ["ExitComplete"] = 2
}
local v_u_23 = {
    ["name"] = script.Name,
    ["validate"] = function(p20, p21)
        if p21.seesaw then
            return not p20.active_performances[v_u_23.name]
        end
        v_u_13("Seesaw missing in options to SeesawPerformance.validate, canceling performance")
    end,
    ["init_performance"] = function(_, p22)
        return {
            ["seesaw"] = p22.seesaw,
            ["current_action"] = v_u_17.None,
            ["target_seat"] = nil,
            ["current_seat_movement_target"] = nil,
            ["current_enter_seat_promise"] = nil,
            ["current_exit_seat_promise"] = nil,
            ["current_enter_play_solo_promise"] = nil,
            ["current_solo_node"] = nil,
            ["current_solo_movement_target"] = nil,
            ["current_solo_action_started"] = false,
            ["current_solo_action"] = nil,
            ["next_solo_node_tick"] = 0
        }
    end
}
local function v_u_30(p24, p25)
    local v26 = {}
    local v27 = p24:FindFirstChild("PetPlayingSolo")
    if v27 then
        v27 = p24.PetPlayingSolo.Value
    end
    v26.playing_solo = v27
    v26.occupant_1 = v_u_7.get_occupant_char(p24.Seats.Seat1)
    v26.occupant_2 = v_u_7.get_occupant_char(p24.Seats.Seat2)
    for v28, v29 in pairs(v26) do
        if v29 == p25 then
            v26[v28] = nil
        end
    end
    if v26.playing_solo == v26.occupant_1 or v26.playing_solo == v26.occupant_2 then
        v26.playing_solo = nil
    end
    return v26
end
local function v_u_40(p31, p32)
    local v33 = game.Players.LocalPlayer.Character
    if v33 then
        v33 = v33:FindFirstChild("HumanoidRootPart")
    end
    if not v33 or (v33.Position - p31.base.root.Position).Magnitude > 30 then
        v_u_11("far from player")
        return v_u_17.Leave
    else
        local v34 = v_u_9.get(p31.base.char)
        local v35 = false
        for _, v36 in pairs(v34.states) do
            v_u_12(v36.id)
            if v_u_16[v36.id] then
                v_u_11("in exit performance state", v36.id)
                return v_u_17.Leave
            end
            if v36.id == "UseFurniture" then
                v35 = true
            end
        end
        if p32.has_reached_target_seat and not v35 then
            v_u_11("forced to exit externally due to removed UseFurniture state")
            return v_u_17.Leave
        else
            local v37 = p32.seesaw
            local v38 = v_u_30(v37, p31.base.char)
            local v39 = v38.occupant_1
            if v39 then
                v39 = v38.occupant_2
            end
            if v39 then
                return v_u_17.Leave
            elseif v38.occupant_1 then
                return v_u_17.Sit, v37.Seats.Seat2
            elseif v38.occupant_2 then
                return v_u_17.Sit, v37.Seats.Seat1
            elseif v38.playing_solo then
                return v_u_17.Sit, v37.Seats.Seat1
            else
                return v_u_17.PlaySolo
            end
        end
    end
end
local function v_u_47(p_u_41, p_u_42, p_u_43)
    v_u_11("Trying to ExitSeat", p_u_41.base.char, "on", p_u_43)
    local v44 = p_u_42.current_exit_seat_promise
    local v45
    if v44 then
        v45 = v44:getStatus() == "Started"
    else
        v45 = false
    end
    if not v45 then
        v_u_11("  Promise inactive; invoking SeesawExitSeat")
        p_u_42.current_exit_seat_promise = v_u_2.async(function(p46)
            v_u_3.get("ParkAPI/SeesawExitSeat"):InvokeServer(p_u_42.seesaw, p_u_41.base.char, p_u_43)
            p46()
        end)
    end
end
local function v_u_54(p_u_48, p_u_49, p_u_50)
    v_u_11("Trying to EnterSeat", p_u_48.base.char, "on", p_u_50)
    local v51 = p_u_49.current_enter_seat_promise
    local v52
    if v51 then
        v52 = v51:getStatus() == "Started"
    else
        v52 = false
    end
    if not v52 then
        v_u_11("  Promise inactive; invoking SeesawEnterSeat")
        p_u_49.current_enter_seat_promise = v_u_2.async(function(p53)
            v_u_3.get("ParkAPI/SeesawEnterSeat"):InvokeServer(p_u_49.seesaw, p_u_48.base.char, p_u_50)
            p53()
        end)
    end
end
local function v_u_60(p_u_55, p_u_56)
    v_u_11("Trying to EnterPlayingSolo", p_u_55.base.char)
    local v57 = p_u_56.current_enter_play_solo_promise
    local v58
    if v57 then
        v58 = v57:getStatus() == "Started"
    else
        v58 = false
    end
    if not v58 then
        v_u_11("  Promise inactive; invoking SeesawEnterPlayingSolo")
        p_u_56.current_enter_play_solo_promise = v_u_2.async(function(p59)
            v_u_3.get("ParkAPI/SeesawEnterPlayingSolo"):InvokeServer(p_u_56.seesaw, p_u_55.base.char)
            p59()
        end)
    end
end
local v_u_61 = nil
local v_u_62 = nil
local v_u_63 = nil
local v_u_64 = nil
function v_u_23.step(p65, p66)
    v_u_11("---", "SeesawPerformance.step")
    p66.should_jump_this_step = false
    local v67, v68 = v_u_40(p65, p66)
    v_u_11("Expected seesaw action:", v67)
    v_u_11("Expected seat:", v68)
    if v67 ~= p66.current_action then
        if p66.current_action == v_u_17.PlaySolo then
            p66.needs_to_exit_playing_solo = true
        elseif p66.current_action == v_u_17.Sit and v_u_62(p65, p66) == v_u_19.ExitInProgress then
            return
        end
    end
    p66.current_action = v67
    if v67 == v_u_17.Leave then
        if p66.needs_to_exit_playing_solo then
            v_u_61(p65, p66)
        end
        return v_u_6.Complete
    end
    if v67 == v_u_17.PlaySolo then
        v_u_63(p65, p66)
    elseif v67 == v_u_17.Sit then
        p66.target_seat = v68
        v_u_64(p65, p66)
    end
    if p66.needs_to_exit_playing_solo and (p66.current_action ~= v_u_17.Sit or p66.has_reached_target_seat) then
        v_u_61(p65, p66)
    end
end
function v_u_23.calculate_modifiers(p69, p70)
    local v71 = nil
    local v72 = 16
    local v73 = true
    if p70.current_action == v_u_17.Sit then
        v71 = p70.current_seat_movement_target
        if p70.is_sitting_this_step then
            v_u_11("Sitting in seat; setting walkspeed to 0")
            v72 = 0
            v73 = false
        end
    elseif p70.current_action == v_u_17.PlaySolo then
        v71 = p70.current_solo_movement_target
        if p70.current_solo_action_started then
            v72 = 0
            v73 = false
        end
    end
    v_u_11("humanoid.Sit", p69.base.humanoid.Sit)
    return {
        ["walkspeed"] = v72,
        ["movement_target"] = v71,
        ["should_jump"] = p70.should_jump_this_step and true or false,
        ["should_start_pathfinding"] = v73,
        ["shouldnt_avoid_obstacles_by"] = {
            ["jumping"] = true,
            ["pathfinding"] = false,
            ["teleporting"] = false
        }
    }, {
        ["walkspeed"] = v_u_5.Highest,
        ["movement_target"] = v_u_5.Highest,
        ["should_jump"] = v_u_5.Highest,
        ["should_start_pathfinding"] = v_u_5.Highest,
        ["shouldnt_avoid_obstacles_by"] = v_u_5.High
    }
end
v_u_64 = function(p74, p75)
    p75.is_sitting_this_step = false
    p75.has_reached_target_seat = false
    local v76 = p75.target_seat
    if v76 then
        local v77 = v_u_7.get_seat_from_humanoid(p74.base.humanoid)
        if v77 == v76 then
            p75.is_sitting_this_step = true
            p75.has_reached_target_seat = true
            return
        elseif v77 then
            v_u_47(p74, p75)
        else
            local v78 = p75.current_seat_movement_target
            if v78 then
                v78 = v78:get_target_value() == v76
            end
            if not v78 then
                p75.current_seat_movement_target = v_u_4.new({
                    ["target"] = v76,
                    ["target_reach_threshold"] = 1
                })
            end
            if p75.current_seat_movement_target:has_been_reached(p74) then
                p75.is_sitting_this_step = true
                v_u_54(p74, p75, v76)
            end
        end
    else
        v_u_11("step_sitting running without target_seat")
        return
    end
end
v_u_62 = function(p79, p80)
    p80.target_seat = nil
    p80.current_seat_movement_target = nil
    p80.has_reached_target_seat = false
    local v81 = v_u_7.get_seat_from_humanoid(p79.base.humanoid)
    if not v81 then
        return v_u_19.ExitComplete
    end
    v_u_47(p79, p80, v81)
    return v_u_19.ExitInProgress
end
local function v_u_89(_, p82)
    local v83 = { "Side1", "Side2", "Curious" }
    local v84 = p82.current_solo_node and table.find(v83, p82.current_solo_node.Name)
    if v84 then
        table.remove(v83, v84)
    end
    local v85 = v83[v_u_10:NextInteger(1, #v83)]
    local v86 = p82.seesaw.PathParts[v85]
    local v87 = { v_u_18.Jump, v_u_18.Curious }
    local v88 = v87[v_u_10:NextInteger(1, #v87)]
    p82.current_solo_node = v86
    p82.current_solo_movement_target = v_u_4.new({
        ["target"] = v86,
        ["target_reach_threshold"] = 0.5
    })
    p82.current_solo_action_started = false
    p82.current_solo_action = v88
    p82.next_solo_node_tick = 0
end
v_u_63 = function(p90, p91)
    if v_u_30(p91.seesaw).playing_solo ~= p90.base.char then
        v_u_60(p90, p91)
    end
    if not p91.current_solo_node then
        v_u_89(p90, p91)
    end
    if p91.current_solo_action_started then
        if tick() >= p91.next_solo_node_tick then
            v_u_89(p90, p91)
        end
    elseif p91.current_solo_movement_target:has_been_reached(p90) then
        p91.current_solo_action_started = true
        p91.next_solo_node_tick = tick() + 2
        if p91.current_solo_action == v_u_18.Jump then
            p91.should_jump_this_step = true
            return
        end
        if p91.current_solo_action == v_u_18.Curious then
            local v92 = v_u_14[v_u_10:NextInteger(1, #v_u_14)]
            v_u_8.apps.SpeechBubbleApp:create(p90.base.pet_model.Head, v92, v_u_15)
            return
        end
    end
end
v_u_61 = function(p93, p94)
    v_u_11("Trying to ExitPlayingSolo", p93.base.char)
    v_u_11("  Firing SeesawExitPlayingSolo")
    v_u_3.get("ParkAPI/SeesawExitPlayingSolo"):FireServer(p94.seesaw, p93.base.char)
    p94.current_solo_node = nil
    p94.current_solo_movement_target = nil
    p94.current_solo_action_started = nil
    p94.current_solo_action = nil
    p94.next_solo_node_tick = 0
    p94.needs_to_exit_playing_solo = nil
    return v_u_19.ExitComplete
end
return v_u_23