--// ReplicatedStorage.ClientModules.Game.PotionM (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("MinigameForcedState")
local v_u_3 = v1("PotionEffectsDB")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("ToolDBHelper")
local v_u_6 = v1("UIManager")
local v_u_7 = v1("ObbyM")
local v_u_8 = v1("package:Promise")
return {
    ["attempt_to_consume"] = function(p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14, p15)
        local v_u_16 = v_u_3[p_u_9.kind]
        local v17 = p_u_9.kind .. " does not exist in PotionEffectsDB"
        assert(v_u_16, v17)
        if v_u_7.is_in_obby() then
            v_u_6.apps.DialogApp:dialog({
                ["text"] = "You cannot drink potions in an Obby",
                ["button"] = "Okay"
            })
            return false
        end
        if not v_u_2.can_use_potions() then
            return false
        end
        local v_u_18 = false
        local v23 = v_u_8.new(function(p19, p20)
            local v21, v22 = v_u_16.validate(p_u_11, p_u_12)
            if v21 then
                if v_u_16.pre_consume then
                    v_u_16.pre_consume(p_u_11)
                end
                p19()
            else
                if v_u_16.validation_failed_dialog then
                    v_u_16.validation_failed_dialog()
                end
                p20(v22)
            end
        end):andThen(function()
            if v_u_5.generic_client_use(p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14) then
                return p_u_11.delay_time and v_u_8.delay(p_u_11.delay_time) or v_u_8.resolve()
            else
                return v_u_8.reject()
            end
        end):andThen(function()
            return v_u_16.consume(p_u_11) and v_u_8.resolve() or v_u_8.reject()
        end):andThen(function()
            if v_u_16.post_consume_hint then
                v_u_16.post_consume_hint()
            end
            v_u_18 = true
            v_u_4.get("NotificationAPI/IndicateEvent"):InvokeServer("potion_drank_by_player", {
                ["kind"] = p_u_9.kind
            })
        end)
        v_u_8.race({ v23, v_u_8.fromEvent(p15) }):catch(function(p24)
            if v_u_16.catch then
                v_u_16.catch(p24)
            end
        end):finally(function()
            p_u_14:fire()
        end):await()
        return v_u_18
    end,
    ["init"] = function() end
}