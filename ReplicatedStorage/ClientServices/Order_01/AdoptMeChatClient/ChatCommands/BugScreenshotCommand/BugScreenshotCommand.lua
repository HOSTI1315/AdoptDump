--// ReplicatedStorage.ClientServices.Order_01.AdoptMeChatClient.ChatCommands.BugScreenshotCommand (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.new.modules.BugScreenshotHelper)
return {
    ["PrimaryAlias"] = "/bugscreenshot",
    ["SecondaryAlias"] = "/bug",
    ["triggered"] = function(_, _)
        if v_u_1.is_enabled() then
            v_u_1.capture()
        end
    end,
    ["init"] = function(_) end
}