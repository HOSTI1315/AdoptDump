--// ReplicatedStorage.new.modules.Ailments.ClientActions.BackpackSelectAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.Parent.Helpers.UseItemHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v6 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("ClientData")
local v_u_8 = v6("InventoryDB")
local v_u_9 = v6("UIManager")
local v_u_10 = {}
v_u_10.__index = v_u_10
setmetatable(v_u_10, v2)
function v_u_10.new(p11)
    local v12 = v_u_10
    return setmetatable({
        ["options"] = p11
    }, v12)
end
function v_u_10.start(p_u_13, p_u_14)
    local v15 = p_u_13.options.category or p_u_13.options.categories
    assert(v15, "Missing item category or categories.")
    local v16 = p_u_13.options.category
    if v16 then
        v16 = p_u_13.options.categories
    end
    assert(not v16, "Only \'category\' or \'categories\' should be set.")
    local v_u_17 = v_u_7.get("inventory") or {}
    local v18 = p_u_13.options.categories or { p_u_13.options.category }
    local v_u_24 = v_u_5.List.filter(v18, function(p19)
        local v20 = v_u_17[p19] or {}
        local v23 = v_u_5.Dictionary.filter(v20, function(p21)
            if p_u_13.options.kind then
                return p21.kind == p_u_13.options.kind
            else
                local v22 = v_u_8[p21.category][p21.kind]
                if v22.is_hidden_from_backpack then
                    return false
                else
                    return not p_u_13.options.filter_callback and true or p_u_13.options.filter_callback(v22)
                end
            end
        end)
        return next(v23) ~= nil
    end)
    if not next(v_u_24) then
        return false
    end
    p_u_13._promise = v_u_4.try(function()
        return v_u_9.apps.BackpackApp:pick_item({
            ["visible_backpack_categories"] = v_u_24,
            ["no_results_text"] = p_u_13.options.no_results_text or "You do not have the requested items.",
            ["sort_priorities"] = p_u_13.options.kind and {
                [p_u_13.options.kind] = 1
            } or nil,
            ["allow_callback"] = function(p25)
                if not p_u_13.options.filter_callback then
                    return true
                end
                local v26 = v_u_8[p25.category][p25.kind]
                return p_u_13.options.filter_callback(v26)
            end
        })
    end):andThen(function(p27)
        if p27 then
            v_u_3.use_item(p_u_14, p27)
        end
    end):done(function()
        v_u_9.apps.BackpackApp:try_pick_item(nil)
    end)
    v_u_1.run_promise(p_u_13._promise, { "dialog" })
    local v28 = p_u_13._promise:awaitStatus()
    return v_u_1.get_result_from_status(v28)
end
function v_u_10.stop(p29)
    if p29._promise then
        p29._promise:cancel()
    end
end
return v_u_10