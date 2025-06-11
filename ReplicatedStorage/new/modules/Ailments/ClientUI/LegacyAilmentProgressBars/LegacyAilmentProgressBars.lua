--// ReplicatedStorage.new.modules.Ailments.ClientUI.LegacyAilmentProgressBars (ModuleScript)

local v_u_1 = require(script.Parent.Parent.AilmentsClient)
local v2 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_3 = v2("CharWrapperClient")
local v_u_4 = v2("Maid")
local v_u_5 = v2("SettingsHelper")
local v_u_6 = v2("SharedConstants")
local v_u_7 = v2("TweenPromise")
local v_u_8 = v2("UIManager")
local v_u_9 = v2("package:Promise")
local v_u_10 = v2("package:Sift")
local v11 = {}
local v_u_12 = {}
local function v_u_16(p13, p14, p15)
    v_u_12[p13.char] = v_u_12[p13.char] or {}
    v_u_12[p13.char][p14.kind] = p15 and {
        ["value"] = p15,
        ["last_progress"] = p14:get_progress()
    } or nil
end
local function v_u_31(p_u_17, p18, p19, p20)
    local v_u_21 = p18.SurfaceGui.PetProgression.Frame
    local v22 = p19:get_progress()
    if v_u_5.get_setting_client({
        ["setting_id"] = "theme_color"
    }) == "black" then
        v_u_21.Darken.ImageColor3 = Color3.new(1, 1, 1)
    else
        v_u_21.Darken.ImageColor3 = Color3.new(0, 0, 0)
    end
    p18.SurfaceGui.PetProgression.TextLabel.Text = p19.description.name
    if p19.rate > 0 then
        v_u_16(p_u_17, p19, nil)
        local v23 = (1 - v22) / p19.rate
        local v_u_24 = UDim2.fromScale(1 - v22, 1)
        local v_u_25 = UDim2.fromScale(0, 1)
        local v26 = TweenInfo.new(v23, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        v_u_21.Size = v_u_24
        p20:GiveTask(v_u_7.callback(0, 1, v26, function(p27)
            v_u_21.Size = v_u_24:Lerp(v_u_25, p27)
        end))
    else
        local v28
        if v_u_12[p_u_17.char] and v_u_12[p_u_17.char][p19.kind] then
            v28 = v_u_12[p_u_17.char][p19.kind].last_progress or nil
        else
            v28 = nil
        end
        if v22 ~= v28 then
            v_u_16(p_u_17, p19, tick() + 4)
        end
        v_u_21.Size = UDim2.fromScale(1 - v22, 1)
        local v29 = v_u_9.delay
        local v30
        if v_u_12[p_u_17.char] and v_u_12[p_u_17.char][p19.kind] then
            v30 = v_u_12[p_u_17.char][p19.kind].value or nil
        else
            v30 = nil
        end
        p20:GiveTask(v29(v30 - tick()):andThen(function()
            v_u_8.apps.PlayerNameApp:_refresh_above_char_stack(p_u_17.char)
        end))
    end
end
function v11.create(p32, p_u_33)
    if p_u_33.is_pet or v_u_3.get_team(p_u_33.char) == "Babies" then
        if v_u_1.has_local_ailments(p_u_33) then
            local v34 = {}
            for _, v35 in v_u_1.get_ailments_for_pet(p_u_33) do
                local v36 = v35:get_progress()
                if v35.rate > 0 then
                    table.insert(v34, v35)
                elseif v36 > 0 then
                    local v37
                    if v_u_12[p_u_33.char] and v_u_12[p_u_33.char][v35.kind] then
                        v37 = v_u_12[p_u_33.char][v35.kind].value or nil
                    else
                        v37 = nil
                    end
                    local v38
                    if v_u_12[p_u_33.char] and v_u_12[p_u_33.char][v35.kind] then
                        v38 = v_u_12[p_u_33.char][v35.kind].last_progress or nil
                    else
                        v38 = nil
                    end
                    if not v37 or (tick() < v37 or v38 < v36) then
                        table.insert(v34, v35)
                    end
                end
            end
            table.sort(v34, function(p39, p40)
                if p39.created_timestamp == p40.created_timestamp then
                    return p39.sort_order < p40.sort_order
                else
                    return p39.created_timestamp < p40.created_timestamp
                end
            end)
            local v_u_41 = v_u_4.new()
            local v42
            if p_u_33.player == game.Players.LocalPlayer then
                v42 = nil
            else
                v42 = v_u_6.max_family_ailment_reward_distance
            end
            for _, v_u_43 in v34 do
                p32("pet_progression", "ailment", function(p44)
                    v_u_31(p_u_33, p44, v_u_43, v_u_41)
                end, {
                    ["max_distance"] = v42,
                    ["cleanup"] = function()
                        v_u_41:DoCleaning()
                    end
                })
            end
        end
        v_u_12 = v_u_10.Dictionary.map(v_u_12, function(p45, p46)
            if p46 and p46.Parent then
                local v51 = v_u_10.Dictionary.filter(p45, function(p47, p_u_48)
                    if tick() <= p47.value then
                        return true
                    end
                    local v49 = v_u_1.get_ailments_for_pet(p_u_33)
                    return v_u_10.Dictionary.some(v49, function(p50)
                        return p50.kind == p_u_48
                    end)
                end)
                if next(v51) then
                    return v51
                else
                    return nil
                end
            else
                return nil
            end
        end)
    end
end
return v11