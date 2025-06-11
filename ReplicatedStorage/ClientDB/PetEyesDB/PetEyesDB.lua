--// ReplicatedStorage.ClientDB.PetEyesDB (ModuleScript)

local v8 = {
    ["happy_eyes"] = {
        ["model_id"] = "HappyEyes"
    },
    ["heart_eyes"] = {
        ["model_id"] = "HeartEyes",
        ["override_rig_appearance"] = true
    },
    ["wide_open_eyes"] = {
        ["model_id"] = "WideOpenEyes"
    },
    ["squinting_eyes"] = {
        ["model_id"] = "SquintingEyes"
    },
    ["super_squinting_eyes"] = {
        ["model_id"] = "SuperSquintingEyes"
    },
    ["sleepy_eyes"] = {
        ["model_id"] = "SleepyEyes"
    },
    ["drowsy_eyes"] = {
        ["model_id"] = "DrowsyEyes"
    },
    ["tiny_eyes"] = {
        ["model_id"] = "TinyEyes"
    },
    ["dizzy_eyes"] = {
        ["model_id"] = "DizzyEyes"
    },
    ["x_eyes"] = {
        ["model_id"] = "XEyes"
    },
    ["tall_eyes"] = {
        ["model_id"] = "TallEyes"
    },
    ["pleading_eyes"] = {
        ["model_id"] = "PleadingEyes",
        ["on_step"] = function(p1)
            local v2 = os.clock() * 3.141592653589793 * 5
            local v3 = math.sin(v2) * 20 + 190
            local v4 = Color3.fromRGB(v3, v3, v3)
            local v5 = os.clock() * 3.141592653589793 * 2
            local v6 = 3 - math.sin(v5) * 11
            local v7 = os.clock() % 0.85 < 0.35
            p1.Shine.Weld.C0 = p1.Shine.Attachment.CFrame * CFrame.Angles(0, 0, (math.rad(v6)))
            p1.Shine.Weld.C1 = CFrame.new()
            p1.Shine.Transparency = v7 and 1 or 0
            p1.ShineAlt.Transparency = v7 and 0 or 1
            p1.Shine.Color = v4
            p1.ShineAlt.Color = v4
        end
    },
    ["wat_eyes"] = {
        ["model_id"] = "WatEyes"
    }
}
return v8