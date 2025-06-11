--// ReplicatedStorage.ClientDB.TaskBoard.TaskboardStyleDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("ContentPackHelper")
local v3 = v1("package:t")
local v4 = v3.strictInterface({
    ["EventName"] = v3.string,
    ["ImageButton"] = v3.string,
    ["EventImageTop"] = v3.string,
    ["EventImageBottom"] = v3.string,
    ["ClaimablePetImage"] = v3.string,
    ["NewPetImage"] = v3.string,
    ["MultiplierImage"] = v3.string,
    ["EventFrameVisibility"] = v3.boolean
})
local v5 = {
    ["Default"] = {
        ["EventName"] = "",
        ["ImageButton"] = "rbxassetid://7859252881",
        ["EventImageTop"] = "",
        ["EventImageBottom"] = "",
        ["ClaimablePetImage"] = "rbxassetid://7859253185",
        ["NewPetImage"] = "rbxassetid://7859253322",
        ["MultiplierImage"] = "",
        ["EventFrameVisibility"] = false
    }
}
v2.merge("TaskboardStyles", v5)
for v6, v7 in v5 do
    if not v4(v7) then
        error("TaskboardStyle validation failed for " .. v6)
    end
end
return v5