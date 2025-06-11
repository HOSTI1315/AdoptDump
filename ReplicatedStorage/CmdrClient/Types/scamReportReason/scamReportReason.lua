--// ReplicatedStorage.CmdrClient.Types.scamReportReason (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("SharedConstants")
local v_u_3 = v1("package:Sift")
local v_u_4 = {
    "hacked",
    "trust_trading",
    "fake_giveaway",
    "cross_trading",
    "other"
}
return function(p5)
    local v7 = v_u_3.List.map(v_u_4, function(p6)
        return ("%s (%s)"):format(p6, v_u_2.scam_report_reasons_human_readable[p6])
    end)
    table.insert(v7, "any")
    local v_u_8 = p5.Cmdr.Util.MakeFuzzyFinder(v7)
    p5:RegisterType("scamReportReason", {
        ["DisplayName"] = "scamReportReason",
        ["Transform"] = function(p9)
            return p9, p9:match("^(%S*)")
        end,
        ["Autocomplete"] = function(p10, _)
            return v_u_8(p10)
        end,
        ["Parse"] = function(_, p11)
            return p11
        end
    })
end