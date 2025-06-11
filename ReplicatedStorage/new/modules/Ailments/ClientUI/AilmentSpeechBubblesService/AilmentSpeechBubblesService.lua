--// ReplicatedStorage.new.modules.Ailments.ClientUI.AilmentSpeechBubblesService (ModuleScript)

local v_u_1 = require(script.Parent.Parent.AilmentsClient)
require(script.Parent.Parent.ClientAilment)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v4 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_5 = v4("CharWrapperClient")
local v6 = v4("DelayedUpdateBuffer")
local v_u_7 = v4("PetEntityManager")
local v_u_8 = v4("UIManager")
local v_u_9 = v6.new()
local v_u_10 = {
    ["length"] = 3
}
local v11 = {}
local function v_u_18(p_u_12)
    local v13 = v_u_5.get_all_char_wrappers()
    local v15 = v_u_3.List.findWhere(v13, function(p14)
        return p14.pet_unique == p_u_12
    end)
    if v15 then
        local v16 = v13[v15]
        if v16.char then
            local v17 = v_u_7.get_pet_entity(v16.char)
            if v17 then
                return v16, v17
            else
                return nil, nil
            end
        else
            return nil, nil
        end
    else
        return nil, nil
    end
end
local function v_u_25(p_u_19, p_u_20, p_u_21)
    v_u_2.new(function(p22, p23, p24)
        while not p24() do
            if not (p_u_20 and p_u_19.char) then
                p23()
                return
            end
            if not p_u_20.modifier_values_from_performances.pause_ailment_chat_bubbles then
                p22()
                return
            end
            task.wait()
        end
    end):andThen(function()
        v_u_9:delay(p_u_19.pet_unique, function()
            v_u_8.apps.SpeechBubbleApp:create_for_character(p_u_19.char, p_u_21.description.speech_bubble, v_u_10)
        end)
    end)
end
function v11.start()
    v_u_1.get_ailment_created_signal():Connect(function(p_u_26, p27)
        if v_u_1.are_ailments_hidden() then
            return
        elseif p_u_26.description.speech_bubble then
            local v28 = tonumber(p27)
            if v28 then
                local v_u_29 = game.Players:GetPlayerByUserId(v28)
                if v_u_29 then
                    v_u_29 = v_u_29.Character
                end
                if v_u_29 then
                    v_u_9:delay(tostring(v28), function()
                        v_u_8.apps.SpeechBubbleApp:create_for_character(v_u_29, p_u_26.description.speech_bubble, v_u_10)
                    end)
                end
            else
                local v30, v31 = v_u_18(p27)
                if v30 and v31 then
                    v_u_25(v30, v31, p_u_26)
                end
            end
        else
            return
        end
    end)
end
return v11