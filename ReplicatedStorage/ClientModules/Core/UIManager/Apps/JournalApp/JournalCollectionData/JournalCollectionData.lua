--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.JournalApp.JournalCollectionData (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v_u_3 = v1("RouterClient")
local v_u_6 = {
    ["get_existing_collection"] = function()
        return v_u_2.get("journal_collection") or {}
    end,
    ["get_existing_collection_category"] = function(p4)
        return v_u_6.get_existing_collection()[p4] or {}
    end,
    ["entry_is_in_collection"] = function(p5)
        return (v_u_6.get_existing_collection()[p5.category] or {})[p5.kind] and true or false
    end,
    ["commit_collection"] = function()
        v_u_3.get("JournalAPI/CommitCollection"):FireServer()
    end
}
return v_u_6