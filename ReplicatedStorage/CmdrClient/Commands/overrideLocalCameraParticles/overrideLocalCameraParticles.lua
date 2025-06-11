--// ReplicatedStorage.CmdrClient.Commands.overrideLocalCameraParticles (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("CameraParticlesDB")
local v_u_3 = v_u_1("package:Sift")
return {
    ["Name"] = "overrideLocalCameraParticles",
    ["Aliases"] = {},
    ["Description"] = "Sets local CameraParticles override.",
    ["Group"] = "Debug",
    ["Args"] = { function(p4)
            return {
                ["Type"] = p4.Cmdr.Util.MakeEnumType("option", v_u_3.List.join(v_u_3.Dictionary.keys(v_u_2), { "NoOverride" })),
                ["Name"] = "Camera Particle Kind",
                ["Description"] = "Camera Particle to override with."
            }
        end },
    ["ClientRun"] = function(_, p5)
        local v6 = v_u_1("CameraParticlesClient")
        if p5 == "NoOverride" then
            v6.remove_camera_particles("DebugOverride")
            return "Camera particle override removed."
        else
            v6.set_camera_particles("DebugOverride", 99999, p5)
            return ("Camera particle override set to %s"):format(p5)
        end
    end
}