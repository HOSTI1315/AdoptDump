--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureModelTracker (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("DelayedUpdateBuffer")
local v_u_3 = v1("FurnitureModelFolderInterface")
local v_u_4 = v1("package:Sift")
local v_u_5 = {}
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = v2.new()
local function v_u_9()
    v_u_7 = v_u_4.Dictionary.values(v_u_5.get_furniture_models())
end
function v_u_5.get_furniture_models()
    return v_u_6:get_furniture_models()
end
function v_u_5.get_furniture_models_list()
    return v_u_7
end
function v_u_5.get_furniture_by_unique(p10)
    return v_u_6:get_furniture_by_unique(p10)
end
function v_u_5.init()
    v_u_6 = v_u_3.new()
    v_u_5.furniture_changed = v_u_6.furniture_changed
    v_u_7 = v_u_4.Dictionary.values(v_u_5.get_furniture_models())
    v_u_5.furniture_changed:Connect(function()
        v_u_8:delay(nil, v_u_9)
    end)
end
return v_u_5