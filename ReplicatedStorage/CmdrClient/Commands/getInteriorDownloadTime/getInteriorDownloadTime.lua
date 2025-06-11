--// ReplicatedStorage.CmdrClient.Commands.getInteriorDownloadTime (ModuleScript)

local v_u_1 = 0
if game:GetService("RunService"):IsClient() then
    require(game.ReplicatedStorage.Fsys).load("DownloadClient").get_downloaded_signal():Connect(function(p2, p3)
        if p3 == "Interiors" then
            v_u_1 = p2
        end
    end)
end
return {
    ["Name"] = "getInteriorDownloadTime",
    ["Aliases"] = {},
    ["Description"] = "Displays the current interior\'s download time",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function(_)
        local v4 = require(game.ReplicatedStorage.Fsys).load("InteriorsM").get_current_location()
        return not (v4 and v_u_1) and "Unable to provide interior download time." or ("%s took %s seconds to download."):format(v4.full_destination_id, v_u_1)
    end
}