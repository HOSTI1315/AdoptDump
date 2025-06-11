--// ReplicatedStorage.CmdrClient.Commands.backups (ModuleScript)

local v1 = {
    ["Name"] = "backups",
    ["Aliases"] = { "b" },
    ["Description"] = "View the backups of a user.",
    ["Group"] = "Debug",
    ["AutoExec"] = {
        "alias find_backup_by_item_from_now backups $1{playerId|Player} -10Years 0 inventory.items.* | [?kind==`$2{string|Item}`]",
        "alias find_backup_by_item_with_range backups $1{playerId|Player} $2{duration|Not Before} $3{duration|Not After} inventory.items.* | [?kind==`$4{string|Item}`]",
        "alias find_backup_by_item_with_prop backups $1{playerId|Player} -10Years 0 inventory.items.* | [?kind==`$2{string|Item}`] | [?properties.$3{string|Property Name}==`$4{string|Property Value}`]",
        "alias find_backup_by_stat backups $1{playerId|Player} -10Years 0 [stats] | [?$2{string|Stat name}$3{string|Operator}`$4{string|Stat value}`]"
    },
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to view the backups of."
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Not Before",
            ["Description"] = "Will not display any backups before this time, relative to now. (Use negative for times in the past)",
            ["Optional"] = true
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Not After",
            ["Description"] = "Will not display any backups after this time, relative to now.",
            ["Optional"] = true
        },
        {
            ["Type"] = "filter",
            ["Name"] = "Filter Pattern",
            ["Description"] = "Filters results",
            ["Optional"] = true
        }
    }
}
return v1