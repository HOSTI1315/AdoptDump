--// ReplicatedStorage.ClientModules.Game.VehicleSpeedBeam (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("package:Promise")
local v5 = v1("package:t")
local v_u_6 = game:GetService("RunService")
local v_u_7 = v5.strictInterface({
    ["length"] = v5.optional(v5.number),
    ["duration"] = v5.optional(v5.number),
    ["width"] = v5.optional(v5.number),
    ["min_transparency"] = v5.optional(v5.number),
    ["attachment"] = v5.Instance,
    ["beam_template"] = v5.Instance,
    ["vehicle_part"] = v5.Instance
})
local v8 = v2("VehicleSpeedBeam ")
function v8.__init(p9, p10)
    local v11 = v_u_7
    assert(v11(p10))
    p9.length = p10.length or 0
    p9.duration = p10.duration or 0
    p9.width = p10.width or 0.05
    p9.min_transparency = p10.min_transparency or 0.9
    p9.reference_attachment = p10.attachment
    p9.beam_template = p10.beam_template
    p9.vehicle_part = p10.vehicle_part
    p9.length_offset = 0
    p9.transparency = 1
    p9.hiding = false
    p9.segments = {}
    p9.beam_maid = v_u_3.new()
    p9.beam_promise = v_u_4.resolve()
    p9.transition_promise = v_u_4.resolve()
    p9.part = Instance.new("Part")
    p9.part.Anchored = true
    p9.part.CanCollide = false
    p9.part.Transparency = 1
    p9.part.Position = p9.reference_attachment.WorldPosition
    p9.part.Parent = workspace.CurrentCamera
    p9.beam_maid:GiveTask(p9.part)
end
function v8.Destroy(p12)
    p12.beam_maid:DoCleaning()
    if p12.beam_promise then
        p12.beam_promise:cancel()
        p12.beam_promise = nil
    end
    if p12.transition_promise then
        p12.transition_promise:cancel()
        p12.transition_promise = nil
    end
    p12.reference_attachment = nil
    p12.beam_template = nil
    p12.segments = nil
    p12.hide_method = nil
end
function v8.show_beam(p_u_13)
    if p_u_13.beam_promise:getStatus() ~= v_u_4.Status.Started then
        p_u_13.transition_promise:cancel()
        p_u_13.transparency = p_u_13.min_transparency
        if p_u_13.duration > 0 then
            v_u_4.delay(p_u_13.duration):andThen(function()
                p_u_13:hide_beam()
            end)
        end
        p_u_13.beam_promise = v_u_4.new(function(_, _, p_u_14)
            local v_u_15 = p_u_13.vehicle_part.Position
            local v_u_16 = p_u_13.reference_attachment.WorldPosition
            p_u_13.beam_maid.beam_task = v_u_6.Heartbeat:Connect(function()
                if p_u_14() then
                    p_u_13.beam_maid.beam_task = nil
                else
                    local v17 = v_u_15 - p_u_13.vehicle_part.Position
                    local v18 = p_u_13.reference_attachment.WorldPosition
                    local v19 = (v_u_16 - v18).unit
                    if v17.unit:Dot(v19) >= 0.75 then
                        local v20, v21, v22 = p_u_13:load_segment(v18, v_u_16)
                        local v23 = p_u_13.segments
                        local v24 = {
                            ["beam"] = v20,
                            ["timestamp"] = os.clock()
                        }
                        table.insert(v23, v24)
                        game.Debris:AddItem(v20, p_u_13.length)
                        game.Debris:AddItem(v21, p_u_13.length)
                        game.Debris:AddItem(v22, p_u_13.length)
                    end
                    v_u_16 = v18
                    v_u_15 = p_u_13.vehicle_part.Position
                    if p_u_13.updater then
                        p_u_13.updater()
                    end
                    p_u_13:update_segments()
                end
            end)
        end)
    end
end
function v8.hide_beam(p_u_25, p26, p27)
    if p_u_25.beam_promise and (p_u_25.beam_promise:getStatus() == v_u_4.Status.Started and p_u_25.hiding ~= true) then
        p_u_25.hiding = true
        local v_u_28 = p26 or 1.15
        local v_u_29 = p27 or 0.25
        p_u_25.transition_promise = v_u_4.new(function(p_u_30, _, p_u_31)
            local v_u_32 = os.clock()
            local v_u_33 = p_u_25.transparency
            local v_u_34 = 1 - v_u_33
            function p_u_25.updater()
                if p_u_31() then
                    return
                else
                    local v35 = os.clock() - v_u_32
                    if v_u_28 < v35 then
                        p_u_25.beam_maid.hide_heartbeat = nil
                        p_u_25.length = 0
                        p_u_25.length_offset = 0
                        p_u_25.transparency = 1
                        p_u_30()
                    else
                        local v36 = v35 / v_u_28
                        local v37 = v_u_29 * (1 - v36)
                        local v38 = v_u_29 - v37
                        local v39 = v_u_33 + v_u_34 * v36
                        p_u_25.length = v37
                        p_u_25.length_offset = v38
                        p_u_25.transparency = v39
                    end
                end
            end
            repeat
                task.wait()
            until v_u_28 < os.clock() - v_u_32 or p_u_31()
            p_u_30()
        end):andThen(function()
            p_u_25:Destroy()
        end):finally(function()
            p_u_25.updater = nil
            p_u_25.hiding = false
        end)
    end
end
function v8.load_segment(p40, p41, p42)
    local v43 = p40.reference_attachment:Clone()
    local v44 = p40.reference_attachment:Clone()
    v43.Parent = p40.part
    v44.Parent = p40.part
    v43.WorldPosition = p41
    v44.WorldPosition = p42
    local v45 = p40.beam_template:Clone()
    v45.Attachment0 = v43
    v45.Attachment1 = v44
    v45.Transparency = NumberSequence.new(1)
    v45.Parent = v43
    return v45, v43, v44
end
function v8.update_segments(p46)
    local v47 = 0
    local v48 = os.clock()
    if p46.segments then
        for v49, v50 in p46.segments do
            local v51 = v50.beam
            local v52 = v48 - v50.timestamp
            if v52 < p46.length_offset then
                v51.Transparency = NumberSequence.new(1)
                v51.Enabled = false
                return
            end
            if p46.length <= v52 then
                v51:Destroy()
                table.remove(p46.segments, v49)
                p46:update_segments()
                return
            end
            local v53 = 0
            if v47 == 0 then
                local v54 = 1 - v52 / p46.length
                v53 = p46.width * v54
            elseif p46.hiding == false or v51.Enabled == true then
                local v55 = 1 - (p46.width - v51.Width1) / p46.width
                v53 = p46.width * v55
            end
            v51.Width0 = v53
            v51.Width1 = v47
            v51.Transparency = NumberSequence.new(p46.transparency)
            v51.Enabled = true
            v47 = v53
        end
    end
end
return v8