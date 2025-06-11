--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.HatShopUGCDisplayBoard (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
return {
    ["render"] = function(p2, _)
        v_u_1.apps.HatShopUGCDisplayApp:set_adornee(p2:FindFirstChild("HatShopUGCDisplayBoardPart", true))
        v_u_1.set_app_visibility("HatShopUGCDisplayApp", true)
    end,
    ["cleanup"] = function(p3, _)
        v_u_1.apps.HatShopUGCDisplayApp:set_adornee(p3:FindFirstChild("HatShopUGCDisplayBoardPart", nil))
        v_u_1.set_app_visibility("HatShopUGCDisplayApp", false)
    end
}