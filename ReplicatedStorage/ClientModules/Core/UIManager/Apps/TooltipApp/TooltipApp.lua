--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TooltipApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("TooltipApp", v1("UIBaseApp"))
function v2.start(p3)
    p3.instance.IgnoreGuiInset = true
end
function v2.show(p4)
    p4.instance.Enabled = true
end
function v2.hide(p5)
    p5.instance.Enabled = false
end
return v2