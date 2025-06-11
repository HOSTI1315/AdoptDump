--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.DanceArcadeStandBehavior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("FurnitureUseHelperDB")
local v_u_3 = v_u_1("new:StreamingHelper")
local v_u_4 = v_u_1("EffectsToggleHelper")
local v_u_5 = v_u_1("Maid")
local v_u_6 = {
    "DanceMachine_Glorpentine",
    "DanceMachine_Blossom",
    "DanceMachine_Bear",
    "DanceMachine_Ice"
}
local v_u_7 = { "EmoteDance4" }
local function v_u_13(p8)
    local v9 = {}
    for _, v10 in p8 do
        local v11 = table.concat(v10, " ")
        local v12 = v10[2]
        if v11:lower():find("dance") or v11:lower():find("trick") then
            table.insert(v9, v12)
        end
    end
    if #v9 > 0 then
        return v9[math.random(1, #v9)]
    else
        return nil
    end
end
local function v_u_14()
    return v_u_7[Random.new():NextInteger(1, #v_u_7)]
end
return function()
    local v_u_15 = v_u_5.new()
    local v16 = v_u_2.BASIC_FURNITURE
    local v18 = {
        ["use_text"] = "Play",
        ["char_offset"] = CFrame.new(0, -2.6, 3),
        ["is_human_standing"] = true,
        ["animation"] = {
            ["Parents"] = v_u_14,
            ["Babies"] = v_u_14,
            ["Pets"] = function(_, _, _, _, _, p17, _)
                return v_u_13(v_u_1("PetEntityManagerServer").get_pet_entity(p17).base.entry.tricks)
            end
        }
    }
    local v19 = v16(v18)
    function v19.post_render(p20, p21, _, _, p22)
        local v23 = v_u_1("CharWrapperClient")
        local v24 = p20.occupied
        if v24 then
            v24 = next(p20.occupied)
        end
        local v25 = v24 ~= nil
        local v26
        if v25 then
            v26 = p20.occupied[v24]
        else
            v26 = v25
        end
        if v26 then
            v26 = v_u_3.get_instance_by_id(v26)
        end
        local v27 = v23.get(v26)
        v_u_4.toggle_effects(p21.WorkingParts.VFX:GetDescendants(), v25)
        local v28 = p21.WorkingParts.PlayerNameScreen
        v28.SurfaceGui.Enabled = true
        v28:FindFirstChild("TextLabel", true).Text = ("%*\'s Dance Arcade Stand"):format(p22:get_house_owner().Name)
        local v29 = p21.WorkingParts.PriceScreen
        if not v25 then
            v29.SurfaceGui.Enabled = true
            local v30 = v29:FindFirstChild("TextLabel", true)
            if p20.price == 0 then
                v30.Text = "FREE PLAY"
            else
                v30.Text = ("PLAY FOR $%*"):format(p20.price)
            end
        end
        if v25 and v27.player == game.Players.LocalPlayer then
            local v_u_31 = v_u_1("Music")
            local v_u_32 = v_u_1("SoundDB")
            local v_u_33 = v_u_6[Random.new():NextInteger(1, #v_u_6)]
            v_u_31.play(101, v_u_32[v_u_33])
            v_u_15:GiveTask(function()
                v_u_31.stop(101, v_u_32[v_u_33])
            end)
        else
            v_u_15:DoCleaning()
        end
    end
    local v37 = {
        ["max_price"] = 20,
        ["min_price"] = 0,
        ["max_time"] = 10,
        ["purchase_failed_message_key"] = "register",
        ["pre_buy_options"] = {
            ["purchase_confirmation_message"] = "Do you want to play for $%d?",
            ["prompt_confirmation"] = true
        },
        ["on_purchase"] = function(_, _, p34, _, ...)
            local v35 = v_u_1("new:AilmentsServer")
            local v36 = v_u_1("CharacterWrapper").get(p34)
            v35.set_progress(v36, "bored", 1)
        end
    }
    local v38 = v_u_2.PAID_FURNITURE(v19, v37)
    local v39 = {
        ["persisted_keys"] = {
            ["price"] = true
        }
    }
    return v_u_2.PLACEABLE_FURNITURE(v38, v39)
end