--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.EventPopupApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SoundPlayer")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("Signal")
local v5 = v1("Class")
local v6 = v1("package:t")
local v_u_7 = v1("package:Sift")
local v_u_8 = v1("package:Promise")
game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v9 = v5("EventPopupApp", v1("UIBaseApp"))
local v_u_10 = v6.strictInterface({
    ["button"] = v6.optional(v6.string),
    ["left"] = v6.optional(v6.string),
    ["right"] = v6.optional(v6.string),
    ["text"] = v6.string
})
function v9._queue_ticket(p_u_11, p_u_12)
    return v_u_8.race({ v_u_8.new(function(p13)
            if p_u_11.completed_ticket + 1 == p_u_12 then
                p13()
            end
        end), v_u_8.fromEvent(p_u_11.ticket_completed, function(p14)
            return p14 + 1 == p_u_12
        end) })
end
function v9.prompt(p_u_15, p16)
    local v17 = v_u_10(p16)
    assert(v17, "Invalid prompt options passed.")
    local v_u_18 = v_u_7.Dictionary.copy(p16)
    p_u_15.ticket_count = p_u_15.ticket_count + 1
    local v_u_19 = p_u_15.ticket_count
    local v_u_23 = p_u_15:_queue_ticket(v_u_19):andThen(function()
        return v_u_8.new(function(p20)
            p_u_15.body.Text = v_u_18.text
            if v_u_18.button then
                p_u_15.left.Visible = false
                p_u_15.right.Face.TextLabel.Text = v_u_18.button
            elseif v_u_18.left and v_u_18.right then
                p_u_15.left.Visible = true
                p_u_15.left.Face.TextLabel.Text = v_u_18.left
                p_u_15.right.Face.TextLabel.Text = v_u_18.right
            end
            v_u_2.FX:play("Pop")
            p_u_15.popup.Visible = true
            local v21 = nil
            local v22 = p_u_15.button_pressed:Wait()
            if v22 == "right" then
                v21 = v_u_18.button or v_u_18.right
            elseif v22 == "left" then
                v21 = v_u_18.left
            end
            p20(v21)
        end)
    end)
    v_u_8.try(function()
        if v_u_23:awaitStatus() ~= v_u_8.Status.Cancelled then
            v_u_2.FX:play("Pop")
        end
        p_u_15.popup.Visible = false
        p_u_15.completed_ticket = v_u_19
        p_u_15.ticket_completed:Fire(v_u_19)
    end)
    return v_u_23
end
function v9.show(p24)
    p24.instance.Enabled = true
end
function v9.hide(p25)
    p25.instance.Enabled = false
end
function v9.start(p_u_26)
    p_u_26.popup = p_u_26.instance.Popup
    p_u_26.popup.Visible = false
    p_u_26.body = p_u_26.popup.Body
    p_u_26.left = p_u_26.popup.Buttons.Left
    p_u_26.right = p_u_26.popup.Buttons.Right
    p_u_26.button_pressed = v_u_4.new()
    local v27 = p_u_26.UIManager.wrap(p_u_26.left, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_26.button_pressed:Fire("left")
        end
    })
    local v28 = p_u_26.UIManager.wrap(p_u_26.right, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_26.button_pressed:Fire("right")
        end
    })
    v27:set_state("cancel")
    v28:set_state("normal")
    p_u_26.ticket_count = 0
    p_u_26.completed_ticket = 0
    p_u_26.ticket_completed = v_u_4.new()
    v_u_3.quick_watch({
        ["selection_parent"] = p_u_26.popup,
        ["default_selection"] = p_u_26.right,
        ["app_name"] = p_u_26.ClassName,
        ["close_override"] = function()
            return false
        end
    })
end
return v9