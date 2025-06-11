--// ReplicatedStorage.CmdrClient.Commands.invis (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return {
    ["Name"] = "invis",
    ["Aliases"] = {},
    ["Description"] = "Makes your character invisible for recording purposes.",
    ["Group"] = "CameraTools",
    ["Args"] = {},
    ["ClientRun"] = function(p2)
        for _, v3 in ipairs(p2.Executor.Character:GetDescendants()) do
            if v3:IsA("Shirt") or (v3:IsA("Pants") or (v3:IsA("ShirtGraphic") or (v3:IsA("Accessory") or (v3:IsA("Decal") or (v3:IsA("BillboardGui") or v3:IsA("SurfaceGui")))))) then
                v3:Destroy()
            elseif v3:IsA("BasePart") then
                v3.Transparency = 1
            end
        end
        v_u_1("UIManager").apps.PlayerNameApp:set_name_visible(p2.Executor.Character, false)
        return "Made you invisible. You must respawn to reverse this."
    end
}