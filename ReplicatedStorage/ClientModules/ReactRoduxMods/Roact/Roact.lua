--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact (ModuleScript)

local v1 = require(script.Change)
local v2 = require(script.Component)
local v3 = require(script.Core)
local v4 = require(script.createElement)
local v5 = require(script.createRef)
local v6 = require(script.Event)
local v7 = require(script.GlobalConfig)
local v8 = require(script.Instrumentation)
local v9 = require(script.oneChild)
local v10 = require(script.PureComponent)
local v11 = require(script.Reconciler)
local v12 = require(script.ReconcilerCompat)
local function v17(p13, p14)
    for v15, v16 in pairs(p14) do
        if p13[v15] ~= nil then
            error(("Roact: key %q was overridden!"):format(v15), 2)
        end
        if not v15:find("^_") then
            p13[v15] = v16
        end
    end
end
local v18 = {}
v17(v18, v3)
v17(v18, v11)
v17(v18, v12)
v17(v18, {
    ["Change"] = v1,
    ["Component"] = v2,
    ["createElement"] = v4,
    ["createRef"] = v5,
    ["Event"] = v6,
    ["oneChild"] = v9,
    ["PureComponent"] = v10
})
v17(v18, {
    ["setGlobalConfig"] = v7.set,
    ["getGlobalConfigValue"] = v7.getValue
})
local v19 = {
    ["UNSTABLE"] = {
        ["getCollectedStats"] = v8.getCollectedStats,
        ["clearCollectedStats"] = v8.clearCollectedStats
    }
}
v17(v18, v19)
return v18