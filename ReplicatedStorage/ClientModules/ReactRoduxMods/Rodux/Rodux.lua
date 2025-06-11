--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux (ModuleScript)

local v1 = require(script.Store)
local v2 = require(script.createReducer)
local v3 = require(script.combineReducers)
local v4 = require(script.loggerMiddleware)
local v5 = require(script.thunkMiddleware)
return {
    ["Store"] = v1,
    ["createReducer"] = v2,
    ["combineReducers"] = v3,
    ["loggerMiddleware"] = v4.middleware,
    ["thunkMiddleware"] = v5
}