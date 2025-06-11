--// ReplicatedStorage.CmdrClient.Commands.surveytest (ModuleScript)

return {
    ["Name"] = "surveytest",
    ["Aliases"] = {},
    ["Description"] = "Attempt to run a test survey on this client",
    ["Group"] = "Debug",
    ["Args"] = {},
    ["ClientRun"] = function()
        local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("FeedbackSurveyHelper")
        local v2, v3 = v_u_1.can_show_survey()
        if v2 then
            coroutine.wrap(function()
                v_u_1.show_survey()
            end)()
        end
        return v3 or "Failed to show survey because too many surveys in short succession."
    end
}