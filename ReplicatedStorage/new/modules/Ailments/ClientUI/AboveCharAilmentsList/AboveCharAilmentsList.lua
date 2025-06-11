--// ReplicatedStorage.new.modules.Ailments.ClientUI.AboveCharAilmentsList (ModuleScript)

local v_u_1 = require(script.Parent.Parent.AilmentsClient)
local v2 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_3 = v2("CharWrapperClient")
local v_u_4 = v2("Maid")
local v_u_5 = v2("PetActions")
local v_u_6 = v2("SharedConstants")
local v_u_7 = v2("UIManager")
local v_u_8 = Vector2.new(75, 75)
local v9 = {}
local function v_u_13(p10, p11)
    if not v_u_7.apps.SettingsApp:get_setting("pet_radial_menu") then
        if v_u_5.can_focus_pet(p10.char) then
            v_u_5.focus(p10)
            local v12 = v_u_7.apps.FocusPetApp
            if v12.char_wrapper == p10 then
                v12.ailments:get_ailment_selected_signal():Fire(p11)
            end
        end
    end
end
local function v_u_23(p_u_14, p15, p16, p17)
    local v18 = p15.SurfaceGui.Container.Ailment
    v18.Parent = nil
    for v19, v_u_20 in p16 do
        local v21 = v18:Clone()
        v21.LayoutOrder = v19
        local v22 = v_u_7.wrap(v21, "Ailment")
        v22:start({
            ["interactable"] = true,
            ["resize_on_hover"] = false,
            ["show_tags"] = true,
            ["on_select"] = function()
                v_u_13(p_u_14, v_u_20)
            end
        })
        v22.progress_bar:set_parent_size(v_u_8)
        v22:update_ailment(v_u_20)
        p17:GiveTask(v22)
        v21.Parent = p15.SurfaceGui.Container
    end
end
function v9.create(p24, p_u_25)
    if p_u_25.is_pet or v_u_3.get_team(p_u_25.char) == "Babies" then
        if v_u_1.has_local_ailments(p_u_25) then
            local v_u_26 = {}
            for _, v27 in v_u_1.get_ailments_for_pet(p_u_25) do
                table.insert(v_u_26, v27)
            end
            table.sort(v_u_26, function(p28, p29)
                if p28.created_timestamp == p29.created_timestamp then
                    return p28.sort_order < p29.sort_order
                else
                    return p28.created_timestamp < p29.created_timestamp
                end
            end)
            local v_u_30 = v_u_4.new()
            local v31
            if p_u_25.player == game.Players.LocalPlayer then
                v31 = nil
            else
                v31 = v_u_6.max_family_ailment_reward_distance
            end
            p24("ailments_list", "ailment", function(p32)
                v_u_23(p_u_25, p32, v_u_26, v_u_30)
            end, {
                ["max_distance"] = v31,
                ["cleanup"] = function()
                    v_u_30:DoCleaning()
                end
            })
        end
    end
end
return v9