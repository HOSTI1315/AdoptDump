--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.TooltipApps.JournalTooltip (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RarityDB")
local v3 = v1("Class")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v4.LocalPlayer)
local v_u_6 = v1("ItemTooltip")
local v7 = v3("JournalTooltip", v_u_6)
function v7._update_watched(p8)
    if p8.enabled then
        local v9 = p8.watched_item_entry
        assert(v9, "Tooltip is not watching anything.")
        local v10 = p8.watched_item_entry
        local v11 = v_u_2[v10.rarity]
        local v12 = v_u_5:Translate(workspace, v11.name)
        local v13 = v11.color
        local v14 = v13.r * 255
        local v15 = math.round(v14)
        local v16 = v13.g * 255
        local v17 = math.round(v16)
        local v18 = v13.b * 255
        local v19 = ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v15, v17, math.round(v18), "\226\151\134  ") .. v12
        local v20 = p8.show_pet_origin and v10.category == "pets" and (v10.origin_entry.origin or "N/A") or v19
        local v21
        if v10.category == "stickers" then
            v21 = Enum.ScaleType.Fit
        else
            v21 = nil
        end
        p8.components.title:set_options({
            ["image"] = v10.image,
            ["flipbook_properties"] = v10.flipbook_properties,
            ["image_scale_type"] = v21,
            ["header_text"] = v10.name,
            ["sub_header_text"] = v20,
            ["exit_button_space"] = false,
            ["favorite_background"] = false,
            ["header_text_scaled"] = true,
            ["sub_header_text_scaled"] = true
        })
        p8:_set_components_visible({
            ["title"] = true
        })
        p8.tooltip:refresh()
    end
end
function v7.start(p22, p23, p24)
    v_u_6.start(p22, p23, p24)
    return p22
end
function v7.hook_on_hover(p_u_25, p_u_26)
    local v_u_27 = p_u_26.show_pet_origin == nil and true or p_u_26.show_pet_origin
    return p_u_25.hover:set_hover_callbacks({
        ["frame"] = p_u_26.frame,
        ["on_enter"] = function()
            if p_u_26.type == "item_entry" then
                p_u_25.watched_item_entry = p_u_26.item_entry
                p_u_25.show_pet_origin = v_u_27
                p_u_25:_update_watched()
            elseif p_u_26.type == "callback" then
                p_u_26.callback()
            end
        end,
        ["on_exit"] = function()
            p_u_25:hide()
        end
    })
end
return v7