--// ReplicatedStorage.new.modules.TestLab.TestLabConfig (ModuleScript)

local v1 = {}
local v2 = {}
local v3 = {
    ["sets"] = {
        {
            ["type"] = "TradingLicense"
        },
        {
            ["type"] = "RandomSafeItemGroups"
        }
    },
    ["gatekeepers"] = {
        {
            ["type"] = "production_playtime",
            ["seconds"] = 10800
        }
    }
}
__set_list(v2, 1, {v3})
v1.items = v2
v1.data_clearing = {
    ["on"] = true,
    ["seconds"] = 3600
}
v1.allow_trading = true
v1.watermark = {
    ["enabled"] = true,
    ["transparency"] = 0.8,
    ["bottom_text"] = "Do Not Leak"
}
v1.scrolling_banner = {
    ["enabled"] = true
}
v1.scheduled_chats = {
    {
        ["message"] = "<font color=\'#FFFF00\'>Test lab data (including your Test Lab inventory) will be cleared in $DATA_CLEAR_TIME_REMAINING.</font>",
        ["interval"] = 300,
        ["delay"] = 150
    }
}
return v1