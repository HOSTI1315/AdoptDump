--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.BaseApps.UIBaseElement (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("UIBaseElement")
function v1.__init(p2, p3, p4)
    p2.UIManager = p3
    p2.instance = p4
end
function v1.start(_)
    error("Not implemented")
end
return v1