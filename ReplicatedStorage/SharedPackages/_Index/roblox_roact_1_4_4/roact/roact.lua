--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact (ModuleScript)

local v1 = require(script.GlobalConfig)
local v2 = require(script.createReconciler)
local v3 = require(script.createReconcilerCompat)
local v4 = require(script.RobloxRenderer)
local v5 = require(script.strict)
local v6 = require(script.Binding)
local v7 = v2(v4)
local v8 = v3(v7)
return v5({
    ["Component"] = require(script.Component),
    ["createElement"] = require(script.createElement),
    ["createFragment"] = require(script.createFragment),
    ["oneChild"] = require(script.oneChild),
    ["PureComponent"] = require(script.PureComponent),
    ["None"] = require(script.None),
    ["Portal"] = require(script.Portal),
    ["createRef"] = require(script.createRef),
    ["forwardRef"] = require(script.forwardRef),
    ["createBinding"] = v6.create,
    ["joinBindings"] = v6.join,
    ["createContext"] = require(script.createContext),
    ["Change"] = require(script.PropMarkers.Change),
    ["Children"] = require(script.PropMarkers.Children),
    ["Event"] = require(script.PropMarkers.Event),
    ["Ref"] = require(script.PropMarkers.Ref),
    ["mount"] = v7.mountVirtualTree,
    ["unmount"] = v7.unmountVirtualTree,
    ["update"] = v7.updateVirtualTree,
    ["reify"] = v8.reify,
    ["teardown"] = v8.teardown,
    ["reconcile"] = v8.reconcile,
    ["setGlobalConfig"] = v1.set,
    ["UNSTABLE"] = {}
})