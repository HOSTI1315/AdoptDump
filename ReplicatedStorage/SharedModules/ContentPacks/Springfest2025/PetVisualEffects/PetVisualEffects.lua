--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.PetVisualEffects (ModuleScript)

local v7 = {
    ["mechapips_laser_eyes"] = {
        ["parent_override"] = "Eyes",
        ["asset_names"] = {
            "MechapipsLaserEyeLeftStart",
            "MechapipsLaserEyeLeftEnd",
            "MechapipsLaserEyeRightStart",
            "MechapipsLaserEyeRightEnd"
        },
        ["on_create"] = function(p1, _)
            local v2 = game.ReplicatedStorage.Resources.MechapipsVFX.LaserEyes
            local v3 = v2.Beam1:Clone()
            v3.Attachment0 = p1.MechapipsLaserEyeLeftStart
            v3.Attachment1 = p1.MechapipsLaserEyeLeftEnd
            v3.Parent = p1.MechapipsLaserEyeLeftStart
            v3.Enabled = true
            local v4 = v2.Beam2:Clone()
            v4.Attachment0 = p1.MechapipsLaserEyeLeftStart
            v4.Attachment1 = p1.MechapipsLaserEyeLeftEnd
            v4.Parent = p1.MechapipsLaserEyeLeftStart
            v4.Enabled = true
            local v5 = v2.Beam1:Clone()
            v5.Attachment0 = p1.MechapipsLaserEyeRightStart
            v5.Attachment1 = p1.MechapipsLaserEyeRightEnd
            v5.Parent = p1.MechapipsLaserEyeRightStart
            v5.Enabled = true
            local v6 = v2.Beam2:Clone()
            v6.Attachment0 = p1.MechapipsLaserEyeRightStart
            v6.Attachment1 = p1.MechapipsLaserEyeRightEnd
            v6.Parent = p1.MechapipsLaserEyeRightStart
            v6.Enabled = true
        end
    }
}
return v7