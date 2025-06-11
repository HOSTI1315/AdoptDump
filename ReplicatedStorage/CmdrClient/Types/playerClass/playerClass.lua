--// ReplicatedStorage.CmdrClient.Types.playerClass (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("package:Sift")
local v_u_3 = v1("package:Promise")
local v_u_4 = v1("TableUtil")
local v_u_5 = game:GetService("Players")
local v_u_6 = {}
local v_u_7 = 295182
local v_u_8 = 1
local v_u_10 = v_u_3.promisify(function(p9)
    return v_u_8 <= p9:GetRankInGroup(v_u_7)
end)
function v_u_6.groupmembers()
    local v11 = {}
    for _, v_u_12 in ipairs(v_u_5:GetPlayers()) do
        local v13 = v_u_10(v_u_12)
        table.insert(v11, v13:andThen(function(p14)
            return p14 and v_u_12 or false
        end))
    end
    return v_u_3.all(v11):andThen(function(p15)
        return v_u_2.List.filter(p15, function(...)
            return ...
        end)
    end)
end
local v_u_16 = 295182
local v_u_17 = 90
local v_u_19 = v_u_3.promisify(function(p18)
    return v_u_17 <= p18:GetRankInGroup(v_u_16)
end)
function v_u_6.translators()
    local v20 = {}
    for _, v_u_21 in ipairs(v_u_5:GetPlayers()) do
        local v22 = v_u_19(v_u_21)
        table.insert(v20, v22:andThen(function(p23)
            return p23 and v_u_21 or false
        end))
    end
    return v_u_3.all(v20):andThen(function(p24)
        return v_u_2.List.filter(p24, function(...)
            return ...
        end)
    end)
end
local v_u_25 = 295182
local v_u_26 = 100
local v_u_28 = v_u_3.promisify(function(p27)
    return v_u_26 <= p27:GetRankInGroup(v_u_25)
end)
function v_u_6.testers()
    local v29 = {}
    for _, v_u_30 in ipairs(v_u_5:GetPlayers()) do
        local v31 = v_u_28(v_u_30)
        table.insert(v29, v31:andThen(function(p32)
            return p32 and v_u_30 or false
        end))
    end
    return v_u_3.all(v29):andThen(function(p33)
        return v_u_2.List.filter(p33, function(...)
            return ...
        end)
    end)
end
local v_u_34 = 295182
local v_u_35 = 115
local v_u_37 = v_u_3.promisify(function(p36)
    return v_u_35 <= p36:GetRankInGroup(v_u_34)
end)
function v_u_6.contributors()
    local v38 = {}
    for _, v_u_39 in ipairs(v_u_5:GetPlayers()) do
        local v40 = v_u_37(v_u_39)
        table.insert(v38, v40:andThen(function(p41)
            return p41 and v_u_39 or false
        end))
    end
    return v_u_3.all(v38):andThen(function(p42)
        return v_u_2.List.filter(p42, function(...)
            return ...
        end)
    end)
end
local v_u_43 = 295182
local v_u_44 = 120
local v_u_46 = v_u_3.promisify(function(p45)
    return v_u_44 <= p45:GetRankInGroup(v_u_43)
end)
function v_u_6.advisers()
    local v47 = {}
    for _, v_u_48 in ipairs(v_u_5:GetPlayers()) do
        local v49 = v_u_46(v_u_48)
        table.insert(v47, v49:andThen(function(p50)
            return p50 and v_u_48 or false
        end))
    end
    return v_u_3.all(v47):andThen(function(p51)
        return v_u_2.List.filter(p51, function(...)
            return ...
        end)
    end)
end
local v_u_52 = 295182
local v_u_53 = 245
local v_u_55 = v_u_3.promisify(function(p54)
    return v_u_53 <= p54:GetRankInGroup(v_u_52)
end)
function v_u_6.admins()
    local v56 = {}
    for _, v_u_57 in ipairs(v_u_5:GetPlayers()) do
        local v58 = v_u_55(v_u_57)
        table.insert(v56, v58:andThen(function(p59)
            return p59 and v_u_57 or false
        end))
    end
    return v_u_3.all(v56):andThen(function(p60)
        return v_u_2.List.filter(p60, function(...)
            return ...
        end)
    end)
end
local v_u_61 = 295182
local v_u_62 = 246
local v_u_64 = v_u_3.promisify(function(p63)
    return v_u_62 <= p63:GetRankInGroup(v_u_61)
end)
function v_u_6.staff()
    local v65 = {}
    for _, v_u_66 in ipairs(v_u_5:GetPlayers()) do
        local v67 = v_u_64(v_u_66)
        table.insert(v65, v67:andThen(function(p68)
            return p68 and v_u_66 or false
        end))
    end
    return v_u_3.all(v65):andThen(function(p69)
        return v_u_2.List.filter(p69, function(...)
            return ...
        end)
    end)
end
local v_u_70 = 295182
local v_u_71 = 247
local v_u_73 = v_u_3.promisify(function(p72)
    return v_u_71 <= p72:GetRankInGroup(v_u_70)
end)
function v_u_6.developers()
    local v74 = {}
    for _, v_u_75 in ipairs(v_u_5:GetPlayers()) do
        local v76 = v_u_73(v_u_75)
        table.insert(v74, v76:andThen(function(p77)
            return p77 and v_u_75 or false
        end))
    end
    return v_u_3.all(v74):andThen(function(p78)
        return v_u_2.List.filter(p78, function(...)
            return ...
        end)
    end)
end
for _, v79 in pairs(v_u_2.Dictionary.keys(v_u_6)) do
    local v80 = "non" .. v79
    local v_u_81 = v_u_6[v79]
    v_u_6[v80] = function()
        return v_u_81():andThen(function(p82)
            local v_u_83 = v_u_4.array_to_dictionary(p82)
            return v_u_2.List.filter(v_u_5:GetPlayers(), function(p84)
                return v_u_83[p84] == nil
            end)
        end)
    end
end
return function(p85)
    local v_u_86 = p85.Cmdr.Util.MakeFuzzyFinder(v_u_2.Dictionary.keys(v_u_6))
    local v_u_91 = {
        ["Transform"] = function(p87)
            return v_u_86(p87)
        end,
        ["Validate"] = function(p88)
            return #p88 > 0, "That\'s not a valid player class"
        end,
        ["Autocomplete"] = function(p89)
            return p89
        end,
        ["Parse"] = function(p90)
            return v_u_6[p90[1]]():awaitValue()
        end
    }
    p85:RegisterType("playerClass", v_u_91)
    local v95 = {
        ["Parse"] = function(p92)
            local v93 = v_u_91.Parse(p92)
            return v_u_2.List.map(v93, function(p94)
                return p94.UserId
            end)
        end
    }
    p85:RegisterType("playerClassIds", (setmetatable(v95, {
        ["__index"] = v_u_91
    })))
    p85:RegisterTypePrefix("players", "@ playerClass")
    p85:RegisterTypePrefix("playerIds", "@ playerClassIds")
end