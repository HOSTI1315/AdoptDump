--// ReplicatedStorage.CmdrClient.Types.currency (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("AltCurrencyData")
return function(p2)
    p2:RegisterType("currency", p2.Cmdr.Util.MakeEnumType("Currency", { "Bucks", v_u_1.human_readable }))
end