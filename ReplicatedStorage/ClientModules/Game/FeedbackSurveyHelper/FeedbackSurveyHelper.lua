--// ReplicatedStorage.ClientModules.Game.FeedbackSurveyHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("CloudValues")
return {
    ["can_show_survey"] = function()
        if v_u_3:getValue("feedback", "survey").id == nil then
            return false, "No survey defined."
        else
            return v_u_2.get("FeedbackAPI/ShouldShowSurvey"):InvokeServer()
        end
    end,
    ["show_survey"] = function()
        local v4 = v_u_1("UIManager")
        local v5 = v_u_3:getValue("feedback", "survey")
        local v6 = {}
        if v4.apps.DialogApp:dialog({
            ["text"] = ("Would you like to share some feedback with us for %d bucks?"):format(v5.reward),
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "No" then
            v_u_2.get("FeedbackAPI/DeclineSurvey"):InvokeServer()
            return
        else
            for v7, v8 in pairs(v5.questions) do
                if v8.max_length ~= nil then
                    v8.use_utf8_length = true
                end
                local v9
                if v8.dialog_type == "ParagraphDialog" or v8.dialog_type == "FreeResponseDialog" then
                    local v10
                    v10, v9 = v4.apps.DialogApp:dialog(v8)
                else
                    v9 = v4.apps.DialogApp:dialog(v8)
                end
                v6["question" .. v7] = v9
            end
            if v_u_2.get("FeedbackAPI/SubmitSurveyResponses"):InvokeServer(v6) == true then
                v4.apps.DialogApp:dialog({
                    ["text"] = ("Thanks for sharing your feedback! You have been given %d bucks as a reward!"):format(v5.reward)
                })
            else
                v4.apps.DialogApp:dialog({
                    ["text"] = "Something went wrong, please try again later."
                })
            end
        end
    end
}