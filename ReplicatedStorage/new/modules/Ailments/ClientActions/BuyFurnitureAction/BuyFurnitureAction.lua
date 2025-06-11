--// ReplicatedStorage.new.modules.Ailments.ClientActions.BuyFurnitureAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.Parent.Parent.FurnitureEntryHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v5 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("FurnitureDB")
local v_u_7 = v5("HouseEditorHelper")
local v_u_8 = v5("InteriorsM")
local v_u_9 = v5("ShopM")
local v_u_10 = v5("UIManager")
local v_u_11 = {}
v_u_11.__index = v_u_11
setmetatable(v_u_11, v2)
function v_u_11.new(p12)
    local v13 = v_u_11
    return setmetatable({
        ["options"] = p12
    }, v13)
end
function v_u_11.start(p14, _)
    local v15 = v_u_8.get_current_location() or {}
    if v15.destination_id == "housing" and v15.house_owner == game.Players.LocalPlayer then
        if v_u_10.app_visibilities.HouseEditorWrapperApp then
            local v_u_16 = v_u_6[p14.options.kind]
            local v_u_17 = v_u_3.get_cost(v_u_16)
            if v_u_9.can_afford("money", v_u_17) then
                p14._promise = v_u_4.resolve()
            else
                v_u_10.set_app_visibility("BucksPurchaseApp", true)
                p14._promise = v_u_4.fromEvent(v_u_10.app_visibilities_changed, function()
                    return not v_u_10.is_visible("BucksPurchaseApp")
                end):done(function()
                    v_u_10.set_app_visibility("BucksPurchaseApp", false)
                end)
            end
            local v_u_18 = false
            p14._promise:andThen(function()
                if v_u_9.can_afford("money", v_u_17) then
                    v_u_18 = true
                    v_u_10.apps.FocusPetApp:release_focus()
                    v_u_7.get_enter_edit_signal():Fire()
                    v_u_7.select_furniture_drawer_item(v_u_16, {
                        ["calculate_placement_on_floor"] = true
                    })
                end
            end)
            v_u_1.run_promise(p14._promise, { "dialog" })
            local v19 = p14._promise:awaitStatus()
            local v20 = v_u_1.get_result_from_status(v19)
            if v20 then
                return v_u_18
            else
                return v20
            end
        else
            return false
        end
    else
        return false
    end
end
function v_u_11.stop(p21)
    if p21._promise then
        p21._promise:cancel()
    end
end
return v_u_11