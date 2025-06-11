--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Remotes (ModuleScript)

local v1 = require(script.Parent.Parent.Dependencies)("playadopt.me", "PerformanceLogger")
return {
    ["setDeviceInfo"] = v1.add("setDeviceInfo", "RemoteEvent", "ReplicatedStorage"),
    ["setMemory"] = v1.add("setMemory", "RemoteEvent", "ReplicatedStorage"),
    ["setMisc"] = v1.add("setMisc", "RemoteEvent", "ReplicatedStorage"),
    ["logUserExitState"] = v1.add("logUserExitState", "RemoteEvent", "ReplicatedStorage"),
    ["logEvent"] = v1.add("logEvent", "RemoteEvent", "ReplicatedStorage"),
    ["logPlayerState"] = v1.add("logPlayerState", "RemoteEvent", "ReplicatedStorage"),
    ["logStaticTiming"] = v1.add("logStaticTiming", "RemoteEvent", "ReplicatedStorage"),
    ["ping"] = v1.add("ping", "RemoteFunction", "ReplicatedStorage")
}