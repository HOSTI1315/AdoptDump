--// ReplicatedStorage.new.modules.Ailments.ClientActions.ItemNavigationAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.Parent.Parent.HotspotsByInterior)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v5 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("FurnitureModelTracker")
local v_u_7 = v5("FurnitureUseDB")
local v_u_8 = v5("new:NavigationHelper")
local v_u_9 = v5("UIManager")
local v_u_10 = {}
v_u_10.__index = v_u_10
setmetatable(v_u_10, v2)
function v_u_10.new(p11)
    local v12 = v_u_10
    return setmetatable({
        ["options"] = p11
    }, v12)
end
function v_u_10.find_interact_position(p13, p14)
    local v15 = p14:FindFirstChild("ShopItems")
    if not v15 then
        return nil
    end
    local v_u_16 = p13.options.category .. ":" .. p13.options.kind
    local v17 = v15:GetChildren()
    return v_u_8.find_closest_valid_point(v17, function(p18)
        return p18.Name == v_u_16
    end, function(p19)
        if p19 then
            if p19:IsA("Model") then
                p19 = p19:FindFirstChild("InteractionPart") or p19:FindFirstChild("Interact")
            end
            return p19.CFrame.Position
        end
    end)
end
function v_u_10.find_furniture_position(p_u_20)
    local v21 = v_u_6.get_furniture_models_list()
    return v_u_8.find_closest_valid_point(v21, function(p22)
        if p22 then
            local v23 = v_u_7[p22:GetAttribute("furniture_kind")]
            if v23 and v23.items_to_acquire then
                return v_u_4.List.find(v23.items_to_acquire, p_u_20.options.kind) ~= nil
            else
                return false
            end
        else
            return false
        end
    end, function(p24)
        return p24.PlacementBlock.CFrame.Position
    end)
end
function v_u_10.start(p_u_25, p_u_26)
    local v_u_27 = p_u_25.options.category .. ":" .. p_u_25.options.kind
    local v_u_28 = false
    local v_u_30 = v_u_9.apps.InteractionsApp:get_interaction_signal():Connect(function(p29)
        v_u_28 = p29.tag == v_u_27
    end)
    v_u_9.apps.FocusPetApp:release_focus()
    p_u_25._promise = v_u_3.get_client():andThen(function(p31)
        local v32 = p31.items
        local v33 = v_u_4.Dictionary.keys(v32[p_u_25.options.kind] or {})
        local v34 = v_u_8.find_closest_interior(v33)
        v_u_9.apps.FocusPetApp:release_focus()
        p_u_25._nav_promise = v_u_9.apps.GuideArrowApp:navigate_promise({
            ["final_destination"] = v34,
            ["pet_unique"] = p_u_26.pet_unique,
            ["custom_position_or_method"] = function(p35)
                return p_u_25:find_interact_position(p35) or p_u_25:find_furniture_position()
            end,
            ["custom_has_arrived_method"] = function()
                return v_u_28
            end
        })
        return p_u_25._nav_promise
    end):done(function()
        v_u_30:Disconnect()
    end)
    v_u_1.run_promise(p_u_25._promise, { "navigation" })
    local v36 = p_u_25._promise:awaitStatus()
    return v_u_1.get_result_from_status(v36)
end
function v_u_10.stop(p37)
    if p37._promise then
        p37._promise:cancel()
    end
    if p37._nav_promise then
        p37._nav_promise:cancel()
    end
end
return v_u_10