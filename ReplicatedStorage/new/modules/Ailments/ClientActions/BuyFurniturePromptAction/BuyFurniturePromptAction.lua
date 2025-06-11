--// ReplicatedStorage.new.modules.Ailments.ClientActions.BuyFurniturePromptAction (ModuleScript)

local v_u_1 = require(script.Parent.ActionQueue)
local v_u_2 = require(script.Parent.ActionSequence)
local v3 = require(script.Parent.Parent.AilmentAction)
local v_u_4 = require(script.Parent.Parent.Helpers.AilmentsFurnitureHelper)
local v_u_5 = require(script.Parent.BuyFurnitureAction)
local v_u_6 = require(script.Parent.DialogAction)
local v_u_7 = require(script.Parent.Parent.Parent.FurnitureEntryHelper)
local v_u_8 = require(script.Parent.InlineAction)
local v9 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_10 = v9("FurnitureDB")
local v_u_11 = v9("InteriorsM")
local v12 = {}
v12.__index = v12
setmetatable(v12, v3)
function v12.new(p_u_13)
    local v14 = v_u_10[p_u_13.kind]
    local v15 = v_u_7.get_cost(v14)
    return v_u_2.new({ v_u_8.new(function()
            local v16 = v_u_11.get_current_location() or {}
            local v17
            if v16.destination_id == "housing" then
                v17 = v16.house_owner == game.Players.LocalPlayer
            else
                v17 = false
            end
            if v17 then
                return not p_u_13.ailment_to_boost and true or v_u_4.find_furniture_position(p_u_13.ailment_to_boost) == nil
            else
                return false
            end
        end), v_u_6.new({
            ["text"] = string.format("ui.buy_label_item_question_with_bucks [%s] [%d]", v14.name, v15),
            ["left"] = "Cancel",
            ["right"] = "Buy",
            ["confirm"] = "Buy"
        }), v_u_1.new({ v_u_5.new({
                ["kind"] = p_u_13.kind
            }), v_u_6.new({
                ["text"] = "You don\'t have enough money!"
            }) }) })
end
return v12