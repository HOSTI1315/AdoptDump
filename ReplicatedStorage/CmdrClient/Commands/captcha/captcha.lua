--// ReplicatedStorage.CmdrClient.Commands.captcha (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v7 = {
    ["Name"] = "captcha",
    ["Aliases"] = {},
    ["Description"] = "Displays a captcha",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Message",
            ["Description"] = "Message to display",
            ["Optional"] = true
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Retry",
            ["Description"] = "Allow retrying",
            ["Optional"] = true,
            ["Default"] = true
        }
    },
    ["ClientRun"] = function(_, p_u_2, p_u_3)
        local v_u_4 = v_u_1("UIManager")
        task.spawn(function()
            local v5 = {
                ["text"] = p_u_2 or "This is a test captcha!",
                ["dialog_type"] = "CaptchaDialog",
                ["exit_button"] = true,
                ["allow_retry"] = p_u_3
            }
            local v6 = v_u_4.apps.DialogApp:dialog(v5)
            print("Captcha result:", v6)
        end)
        return "Displaying captcha"
    end
}
return v7