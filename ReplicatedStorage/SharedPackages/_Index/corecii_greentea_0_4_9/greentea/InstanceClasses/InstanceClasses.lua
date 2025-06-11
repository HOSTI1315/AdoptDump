--// ReplicatedStorage.SharedPackages._Index.corecii_greentea@0.4.9.greentea.InstanceClasses (ModuleScript)

local v1 = require(script.Parent.GreenTea)
local v_u_2 = v1.__highlightWrap
local v_u_3 = v1.__Cause
local v_u_4 = v1.__Type
local v5 = {}
setmetatable(v5, {
    ["__call"] = function(_, p_u_6)
        local v_u_7 = nil
        local v10 = {
            ["kind"] = "InstanceIsA",
            ["instanceIsA"] = {
                ["class"] = p_u_6
            },
            ["_matches"] = function(p8, ...)
                if typeof(p8) == "Instance" and p8:IsA(p_u_6) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_7, p8, (("expected an instance of %*, got $input"):format(p_u_6)))
                end
            end,
            ["_format"] = function(p9, _, _)
                return v_u_2(p_u_6, p9[v_u_7])
            end
        }
        v_u_7 = v10
        local v11 = v_u_4
        local v12 = v_u_7
        return setmetatable(v12, v11)
    end
})
local function v_u_19(p_u_13)
    return function()
        local v_u_14 = nil
        v_u_14 = {
            ["kind"] = "InstanceIsA",
            ["class"] = v_u_19,
            ["_matches"] = function(p15)
                if typeof(p15) == "Instance" then
                    if p15:IsA(p_u_13) then
                        return v_u_3.ok()
                    else
                        return v_u_3.err(v_u_14, p15, (("expected %*, got %*"):format(p_u_13, p15.ClassName)))
                    end
                else
                    return v_u_3.err(v_u_14, p15, (("expected %*, got %*"):format(p_u_13, (typeof(p15)))))
                end
            end,
            ["_format"] = function(p16, _, _)
                return v_u_2(p_u_13, p16[v_u_14])
            end
        }
        local v17 = v_u_4
        local v18 = v_u_14
        return setmetatable(v18, v17)
    end
end
local v_u_20 = "Instance"
function v5.Instance()
    local v_u_21 = nil
    v_u_21 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p22)
            if typeof(p22) == "Instance" then
                if p22:IsA(v_u_20) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_21, p22, (("expected %*, got %*"):format(v_u_20, p22.ClassName)))
                end
            else
                return v_u_3.err(v_u_21, p22, (("expected %*, got %*"):format(v_u_20, (typeof(p22)))))
            end
        end,
        ["_format"] = function(p23, _, _)
            return v_u_2(v_u_20, p23[v_u_21])
        end
    }
    local v24 = v_u_4
    local v25 = v_u_21
    return setmetatable(v25, v24)
end
local v_u_26 = "AccessoryDescription"
function v5.AccessoryDescription()
    local v_u_27 = nil
    v_u_27 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p28)
            if typeof(p28) == "Instance" then
                if p28:IsA(v_u_26) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_27, p28, (("expected %*, got %*"):format(v_u_26, p28.ClassName)))
                end
            else
                return v_u_3.err(v_u_27, p28, (("expected %*, got %*"):format(v_u_26, (typeof(p28)))))
            end
        end,
        ["_format"] = function(p29, _, _)
            return v_u_2(v_u_26, p29[v_u_27])
        end
    }
    local v30 = v_u_4
    local v31 = v_u_27
    return setmetatable(v31, v30)
end
local v_u_32 = "AccountService"
function v5.AccountService()
    local v_u_33 = nil
    v_u_33 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p34)
            if typeof(p34) == "Instance" then
                if p34:IsA(v_u_32) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_33, p34, (("expected %*, got %*"):format(v_u_32, p34.ClassName)))
                end
            else
                return v_u_3.err(v_u_33, p34, (("expected %*, got %*"):format(v_u_32, (typeof(p34)))))
            end
        end,
        ["_format"] = function(p35, _, _)
            return v_u_2(v_u_32, p35[v_u_33])
        end
    }
    local v36 = v_u_4
    local v37 = v_u_33
    return setmetatable(v37, v36)
end
local v_u_38 = "Accoutrement"
function v5.Accoutrement()
    local v_u_39 = nil
    v_u_39 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p40)
            if typeof(p40) == "Instance" then
                if p40:IsA(v_u_38) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_39, p40, (("expected %*, got %*"):format(v_u_38, p40.ClassName)))
                end
            else
                return v_u_3.err(v_u_39, p40, (("expected %*, got %*"):format(v_u_38, (typeof(p40)))))
            end
        end,
        ["_format"] = function(p41, _, _)
            return v_u_2(v_u_38, p41[v_u_39])
        end
    }
    local v42 = v_u_4
    local v43 = v_u_39
    return setmetatable(v43, v42)
end
local v_u_44 = "Accessory"
function v5.Accessory()
    local v_u_45 = nil
    v_u_45 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p46)
            if typeof(p46) == "Instance" then
                if p46:IsA(v_u_44) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_45, p46, (("expected %*, got %*"):format(v_u_44, p46.ClassName)))
                end
            else
                return v_u_3.err(v_u_45, p46, (("expected %*, got %*"):format(v_u_44, (typeof(p46)))))
            end
        end,
        ["_format"] = function(p47, _, _)
            return v_u_2(v_u_44, p47[v_u_45])
        end
    }
    local v48 = v_u_4
    local v49 = v_u_45
    return setmetatable(v49, v48)
end
local v_u_50 = "Hat"
function v5.Hat()
    local v_u_51 = nil
    v_u_51 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p52)
            if typeof(p52) == "Instance" then
                if p52:IsA(v_u_50) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_51, p52, (("expected %*, got %*"):format(v_u_50, p52.ClassName)))
                end
            else
                return v_u_3.err(v_u_51, p52, (("expected %*, got %*"):format(v_u_50, (typeof(p52)))))
            end
        end,
        ["_format"] = function(p53, _, _)
            return v_u_2(v_u_50, p53[v_u_51])
        end
    }
    local v54 = v_u_4
    local v55 = v_u_51
    return setmetatable(v55, v54)
end
local v_u_56 = "AdPortal"
function v5.AdPortal()
    local v_u_57 = nil
    v_u_57 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p58)
            if typeof(p58) == "Instance" then
                if p58:IsA(v_u_56) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_57, p58, (("expected %*, got %*"):format(v_u_56, p58.ClassName)))
                end
            else
                return v_u_3.err(v_u_57, p58, (("expected %*, got %*"):format(v_u_56, (typeof(p58)))))
            end
        end,
        ["_format"] = function(p59, _, _)
            return v_u_2(v_u_56, p59[v_u_57])
        end
    }
    local v60 = v_u_4
    local v61 = v_u_57
    return setmetatable(v61, v60)
end
local v_u_62 = "AdService"
function v5.AdService()
    local v_u_63 = nil
    v_u_63 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p64)
            if typeof(p64) == "Instance" then
                if p64:IsA(v_u_62) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_63, p64, (("expected %*, got %*"):format(v_u_62, p64.ClassName)))
                end
            else
                return v_u_3.err(v_u_63, p64, (("expected %*, got %*"):format(v_u_62, (typeof(p64)))))
            end
        end,
        ["_format"] = function(p65, _, _)
            return v_u_2(v_u_62, p65[v_u_63])
        end
    }
    local v66 = v_u_4
    local v67 = v_u_63
    return setmetatable(v67, v66)
end
local v_u_68 = "AdvancedDragger"
function v5.AdvancedDragger()
    local v_u_69 = nil
    v_u_69 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p70)
            if typeof(p70) == "Instance" then
                if p70:IsA(v_u_68) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_69, p70, (("expected %*, got %*"):format(v_u_68, p70.ClassName)))
                end
            else
                return v_u_3.err(v_u_69, p70, (("expected %*, got %*"):format(v_u_68, (typeof(p70)))))
            end
        end,
        ["_format"] = function(p71, _, _)
            return v_u_2(v_u_68, p71[v_u_69])
        end
    }
    local v72 = v_u_4
    local v73 = v_u_69
    return setmetatable(v73, v72)
end
local v_u_74 = "AnalyticsService"
function v5.AnalyticsService()
    local v_u_75 = nil
    v_u_75 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p76)
            if typeof(p76) == "Instance" then
                if p76:IsA(v_u_74) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_75, p76, (("expected %*, got %*"):format(v_u_74, p76.ClassName)))
                end
            else
                return v_u_3.err(v_u_75, p76, (("expected %*, got %*"):format(v_u_74, (typeof(p76)))))
            end
        end,
        ["_format"] = function(p77, _, _)
            return v_u_2(v_u_74, p77[v_u_75])
        end
    }
    local v78 = v_u_4
    local v79 = v_u_75
    return setmetatable(v79, v78)
end
local v_u_80 = "Animation"
function v5.Animation()
    local v_u_81 = nil
    v_u_81 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p82)
            if typeof(p82) == "Instance" then
                if p82:IsA(v_u_80) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_81, p82, (("expected %*, got %*"):format(v_u_80, p82.ClassName)))
                end
            else
                return v_u_3.err(v_u_81, p82, (("expected %*, got %*"):format(v_u_80, (typeof(p82)))))
            end
        end,
        ["_format"] = function(p83, _, _)
            return v_u_2(v_u_80, p83[v_u_81])
        end
    }
    local v84 = v_u_4
    local v85 = v_u_81
    return setmetatable(v85, v84)
end
local v_u_86 = "AnimationClip"
function v5.AnimationClip()
    local v_u_87 = nil
    v_u_87 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p88)
            if typeof(p88) == "Instance" then
                if p88:IsA(v_u_86) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_87, p88, (("expected %*, got %*"):format(v_u_86, p88.ClassName)))
                end
            else
                return v_u_3.err(v_u_87, p88, (("expected %*, got %*"):format(v_u_86, (typeof(p88)))))
            end
        end,
        ["_format"] = function(p89, _, _)
            return v_u_2(v_u_86, p89[v_u_87])
        end
    }
    local v90 = v_u_4
    local v91 = v_u_87
    return setmetatable(v91, v90)
end
local v_u_92 = "CurveAnimation"
function v5.CurveAnimation()
    local v_u_93 = nil
    v_u_93 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p94)
            if typeof(p94) == "Instance" then
                if p94:IsA(v_u_92) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_93, p94, (("expected %*, got %*"):format(v_u_92, p94.ClassName)))
                end
            else
                return v_u_3.err(v_u_93, p94, (("expected %*, got %*"):format(v_u_92, (typeof(p94)))))
            end
        end,
        ["_format"] = function(p95, _, _)
            return v_u_2(v_u_92, p95[v_u_93])
        end
    }
    local v96 = v_u_4
    local v97 = v_u_93
    return setmetatable(v97, v96)
end
local v_u_98 = "KeyframeSequence"
function v5.KeyframeSequence()
    local v_u_99 = nil
    v_u_99 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p100)
            if typeof(p100) == "Instance" then
                if p100:IsA(v_u_98) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_99, p100, (("expected %*, got %*"):format(v_u_98, p100.ClassName)))
                end
            else
                return v_u_3.err(v_u_99, p100, (("expected %*, got %*"):format(v_u_98, (typeof(p100)))))
            end
        end,
        ["_format"] = function(p101, _, _)
            return v_u_2(v_u_98, p101[v_u_99])
        end
    }
    local v102 = v_u_4
    local v103 = v_u_99
    return setmetatable(v103, v102)
end
local v_u_104 = "AnimationClipProvider"
function v5.AnimationClipProvider()
    local v_u_105 = nil
    v_u_105 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p106)
            if typeof(p106) == "Instance" then
                if p106:IsA(v_u_104) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_105, p106, (("expected %*, got %*"):format(v_u_104, p106.ClassName)))
                end
            else
                return v_u_3.err(v_u_105, p106, (("expected %*, got %*"):format(v_u_104, (typeof(p106)))))
            end
        end,
        ["_format"] = function(p107, _, _)
            return v_u_2(v_u_104, p107[v_u_105])
        end
    }
    local v108 = v_u_4
    local v109 = v_u_105
    return setmetatable(v109, v108)
end
local v_u_110 = "AnimationController"
function v5.AnimationController()
    local v_u_111 = nil
    v_u_111 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p112)
            if typeof(p112) == "Instance" then
                if p112:IsA(v_u_110) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_111, p112, (("expected %*, got %*"):format(v_u_110, p112.ClassName)))
                end
            else
                return v_u_3.err(v_u_111, p112, (("expected %*, got %*"):format(v_u_110, (typeof(p112)))))
            end
        end,
        ["_format"] = function(p113, _, _)
            return v_u_2(v_u_110, p113[v_u_111])
        end
    }
    local v114 = v_u_4
    local v115 = v_u_111
    return setmetatable(v115, v114)
end
local v_u_116 = "AnimationFromVideoCreatorService"
function v5.AnimationFromVideoCreatorService()
    local v_u_117 = nil
    v_u_117 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p118)
            if typeof(p118) == "Instance" then
                if p118:IsA(v_u_116) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_117, p118, (("expected %*, got %*"):format(v_u_116, p118.ClassName)))
                end
            else
                return v_u_3.err(v_u_117, p118, (("expected %*, got %*"):format(v_u_116, (typeof(p118)))))
            end
        end,
        ["_format"] = function(p119, _, _)
            return v_u_2(v_u_116, p119[v_u_117])
        end
    }
    local v120 = v_u_4
    local v121 = v_u_117
    return setmetatable(v121, v120)
end
local v_u_122 = "AnimationFromVideoCreatorStudioService"
function v5.AnimationFromVideoCreatorStudioService()
    local v_u_123 = nil
    v_u_123 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p124)
            if typeof(p124) == "Instance" then
                if p124:IsA(v_u_122) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_123, p124, (("expected %*, got %*"):format(v_u_122, p124.ClassName)))
                end
            else
                return v_u_3.err(v_u_123, p124, (("expected %*, got %*"):format(v_u_122, (typeof(p124)))))
            end
        end,
        ["_format"] = function(p125, _, _)
            return v_u_2(v_u_122, p125[v_u_123])
        end
    }
    local v126 = v_u_4
    local v127 = v_u_123
    return setmetatable(v127, v126)
end
local v_u_128 = "AnimationRigData"
function v5.AnimationRigData()
    local v_u_129 = nil
    v_u_129 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p130)
            if typeof(p130) == "Instance" then
                if p130:IsA(v_u_128) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_129, p130, (("expected %*, got %*"):format(v_u_128, p130.ClassName)))
                end
            else
                return v_u_3.err(v_u_129, p130, (("expected %*, got %*"):format(v_u_128, (typeof(p130)))))
            end
        end,
        ["_format"] = function(p131, _, _)
            return v_u_2(v_u_128, p131[v_u_129])
        end
    }
    local v132 = v_u_4
    local v133 = v_u_129
    return setmetatable(v133, v132)
end
local v_u_134 = "AnimationStreamTrack"
function v5.AnimationStreamTrack()
    local v_u_135 = nil
    v_u_135 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p136)
            if typeof(p136) == "Instance" then
                if p136:IsA(v_u_134) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_135, p136, (("expected %*, got %*"):format(v_u_134, p136.ClassName)))
                end
            else
                return v_u_3.err(v_u_135, p136, (("expected %*, got %*"):format(v_u_134, (typeof(p136)))))
            end
        end,
        ["_format"] = function(p137, _, _)
            return v_u_2(v_u_134, p137[v_u_135])
        end
    }
    local v138 = v_u_4
    local v139 = v_u_135
    return setmetatable(v139, v138)
end
local v_u_140 = "AnimationTrack"
function v5.AnimationTrack()
    local v_u_141 = nil
    v_u_141 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p142)
            if typeof(p142) == "Instance" then
                if p142:IsA(v_u_140) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_141, p142, (("expected %*, got %*"):format(v_u_140, p142.ClassName)))
                end
            else
                return v_u_3.err(v_u_141, p142, (("expected %*, got %*"):format(v_u_140, (typeof(p142)))))
            end
        end,
        ["_format"] = function(p143, _, _)
            return v_u_2(v_u_140, p143[v_u_141])
        end
    }
    local v144 = v_u_4
    local v145 = v_u_141
    return setmetatable(v145, v144)
end
local v_u_146 = "Animator"
function v5.Animator()
    local v_u_147 = nil
    v_u_147 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p148)
            if typeof(p148) == "Instance" then
                if p148:IsA(v_u_146) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_147, p148, (("expected %*, got %*"):format(v_u_146, p148.ClassName)))
                end
            else
                return v_u_3.err(v_u_147, p148, (("expected %*, got %*"):format(v_u_146, (typeof(p148)))))
            end
        end,
        ["_format"] = function(p149, _, _)
            return v_u_2(v_u_146, p149[v_u_147])
        end
    }
    local v150 = v_u_4
    local v151 = v_u_147
    return setmetatable(v151, v150)
end
local v_u_152 = "AppUpdateService"
function v5.AppUpdateService()
    local v_u_153 = nil
    v_u_153 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p154)
            if typeof(p154) == "Instance" then
                if p154:IsA(v_u_152) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_153, p154, (("expected %*, got %*"):format(v_u_152, p154.ClassName)))
                end
            else
                return v_u_3.err(v_u_153, p154, (("expected %*, got %*"):format(v_u_152, (typeof(p154)))))
            end
        end,
        ["_format"] = function(p155, _, _)
            return v_u_2(v_u_152, p155[v_u_153])
        end
    }
    local v156 = v_u_4
    local v157 = v_u_153
    return setmetatable(v157, v156)
end
local v_u_158 = "AssetCounterService"
function v5.AssetCounterService()
    local v_u_159 = nil
    v_u_159 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p160)
            if typeof(p160) == "Instance" then
                if p160:IsA(v_u_158) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_159, p160, (("expected %*, got %*"):format(v_u_158, p160.ClassName)))
                end
            else
                return v_u_3.err(v_u_159, p160, (("expected %*, got %*"):format(v_u_158, (typeof(p160)))))
            end
        end,
        ["_format"] = function(p161, _, _)
            return v_u_2(v_u_158, p161[v_u_159])
        end
    }
    local v162 = v_u_4
    local v163 = v_u_159
    return setmetatable(v163, v162)
end
local v_u_164 = "AssetDeliveryProxy"
function v5.AssetDeliveryProxy()
    local v_u_165 = nil
    v_u_165 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p166)
            if typeof(p166) == "Instance" then
                if p166:IsA(v_u_164) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_165, p166, (("expected %*, got %*"):format(v_u_164, p166.ClassName)))
                end
            else
                return v_u_3.err(v_u_165, p166, (("expected %*, got %*"):format(v_u_164, (typeof(p166)))))
            end
        end,
        ["_format"] = function(p167, _, _)
            return v_u_2(v_u_164, p167[v_u_165])
        end
    }
    local v168 = v_u_4
    local v169 = v_u_165
    return setmetatable(v169, v168)
end
local v_u_170 = "AssetImportService"
function v5.AssetImportService()
    local v_u_171 = nil
    v_u_171 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p172)
            if typeof(p172) == "Instance" then
                if p172:IsA(v_u_170) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_171, p172, (("expected %*, got %*"):format(v_u_170, p172.ClassName)))
                end
            else
                return v_u_3.err(v_u_171, p172, (("expected %*, got %*"):format(v_u_170, (typeof(p172)))))
            end
        end,
        ["_format"] = function(p173, _, _)
            return v_u_2(v_u_170, p173[v_u_171])
        end
    }
    local v174 = v_u_4
    local v175 = v_u_171
    return setmetatable(v175, v174)
end
local v_u_176 = "AssetImportSession"
function v5.AssetImportSession()
    local v_u_177 = nil
    v_u_177 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p178)
            if typeof(p178) == "Instance" then
                if p178:IsA(v_u_176) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_177, p178, (("expected %*, got %*"):format(v_u_176, p178.ClassName)))
                end
            else
                return v_u_3.err(v_u_177, p178, (("expected %*, got %*"):format(v_u_176, (typeof(p178)))))
            end
        end,
        ["_format"] = function(p179, _, _)
            return v_u_2(v_u_176, p179[v_u_177])
        end
    }
    local v180 = v_u_4
    local v181 = v_u_177
    return setmetatable(v181, v180)
end
local v_u_182 = "AssetManagerService"
function v5.AssetManagerService()
    local v_u_183 = nil
    v_u_183 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p184)
            if typeof(p184) == "Instance" then
                if p184:IsA(v_u_182) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_183, p184, (("expected %*, got %*"):format(v_u_182, p184.ClassName)))
                end
            else
                return v_u_3.err(v_u_183, p184, (("expected %*, got %*"):format(v_u_182, (typeof(p184)))))
            end
        end,
        ["_format"] = function(p185, _, _)
            return v_u_2(v_u_182, p185[v_u_183])
        end
    }
    local v186 = v_u_4
    local v187 = v_u_183
    return setmetatable(v187, v186)
end
local v_u_188 = "AssetPatchSettings"
function v5.AssetPatchSettings()
    local v_u_189 = nil
    v_u_189 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p190)
            if typeof(p190) == "Instance" then
                if p190:IsA(v_u_188) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_189, p190, (("expected %*, got %*"):format(v_u_188, p190.ClassName)))
                end
            else
                return v_u_3.err(v_u_189, p190, (("expected %*, got %*"):format(v_u_188, (typeof(p190)))))
            end
        end,
        ["_format"] = function(p191, _, _)
            return v_u_2(v_u_188, p191[v_u_189])
        end
    }
    local v192 = v_u_4
    local v193 = v_u_189
    return setmetatable(v193, v192)
end
local v_u_194 = "AssetService"
function v5.AssetService()
    local v_u_195 = nil
    v_u_195 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p196)
            if typeof(p196) == "Instance" then
                if p196:IsA(v_u_194) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_195, p196, (("expected %*, got %*"):format(v_u_194, p196.ClassName)))
                end
            else
                return v_u_3.err(v_u_195, p196, (("expected %*, got %*"):format(v_u_194, (typeof(p196)))))
            end
        end,
        ["_format"] = function(p197, _, _)
            return v_u_2(v_u_194, p197[v_u_195])
        end
    }
    local v198 = v_u_4
    local v199 = v_u_195
    return setmetatable(v199, v198)
end
local v_u_200 = "Atmosphere"
function v5.Atmosphere()
    local v_u_201 = nil
    v_u_201 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p202)
            if typeof(p202) == "Instance" then
                if p202:IsA(v_u_200) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_201, p202, (("expected %*, got %*"):format(v_u_200, p202.ClassName)))
                end
            else
                return v_u_3.err(v_u_201, p202, (("expected %*, got %*"):format(v_u_200, (typeof(p202)))))
            end
        end,
        ["_format"] = function(p203, _, _)
            return v_u_2(v_u_200, p203[v_u_201])
        end
    }
    local v204 = v_u_4
    local v205 = v_u_201
    return setmetatable(v205, v204)
end
local v_u_206 = "Attachment"
function v5.Attachment()
    local v_u_207 = nil
    v_u_207 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p208)
            if typeof(p208) == "Instance" then
                if p208:IsA(v_u_206) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_207, p208, (("expected %*, got %*"):format(v_u_206, p208.ClassName)))
                end
            else
                return v_u_3.err(v_u_207, p208, (("expected %*, got %*"):format(v_u_206, (typeof(p208)))))
            end
        end,
        ["_format"] = function(p209, _, _)
            return v_u_2(v_u_206, p209[v_u_207])
        end
    }
    local v210 = v_u_4
    local v211 = v_u_207
    return setmetatable(v211, v210)
end
local v_u_212 = "Bone"
function v5.Bone()
    local v_u_213 = nil
    v_u_213 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p214)
            if typeof(p214) == "Instance" then
                if p214:IsA(v_u_212) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_213, p214, (("expected %*, got %*"):format(v_u_212, p214.ClassName)))
                end
            else
                return v_u_3.err(v_u_213, p214, (("expected %*, got %*"):format(v_u_212, (typeof(p214)))))
            end
        end,
        ["_format"] = function(p215, _, _)
            return v_u_2(v_u_212, p215[v_u_213])
        end
    }
    local v216 = v_u_4
    local v217 = v_u_213
    return setmetatable(v217, v216)
end
local v_u_218 = "AudioAnalyzer"
function v5.AudioAnalyzer()
    local v_u_219 = nil
    v_u_219 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p220)
            if typeof(p220) == "Instance" then
                if p220:IsA(v_u_218) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_219, p220, (("expected %*, got %*"):format(v_u_218, p220.ClassName)))
                end
            else
                return v_u_3.err(v_u_219, p220, (("expected %*, got %*"):format(v_u_218, (typeof(p220)))))
            end
        end,
        ["_format"] = function(p221, _, _)
            return v_u_2(v_u_218, p221[v_u_219])
        end
    }
    local v222 = v_u_4
    local v223 = v_u_219
    return setmetatable(v223, v222)
end
local v_u_224 = "AudioChorus"
function v5.AudioChorus()
    local v_u_225 = nil
    v_u_225 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p226)
            if typeof(p226) == "Instance" then
                if p226:IsA(v_u_224) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_225, p226, (("expected %*, got %*"):format(v_u_224, p226.ClassName)))
                end
            else
                return v_u_3.err(v_u_225, p226, (("expected %*, got %*"):format(v_u_224, (typeof(p226)))))
            end
        end,
        ["_format"] = function(p227, _, _)
            return v_u_2(v_u_224, p227[v_u_225])
        end
    }
    local v228 = v_u_4
    local v229 = v_u_225
    return setmetatable(v229, v228)
end
local v_u_230 = "AudioCompressor"
function v5.AudioCompressor()
    local v_u_231 = nil
    v_u_231 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p232)
            if typeof(p232) == "Instance" then
                if p232:IsA(v_u_230) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_231, p232, (("expected %*, got %*"):format(v_u_230, p232.ClassName)))
                end
            else
                return v_u_3.err(v_u_231, p232, (("expected %*, got %*"):format(v_u_230, (typeof(p232)))))
            end
        end,
        ["_format"] = function(p233, _, _)
            return v_u_2(v_u_230, p233[v_u_231])
        end
    }
    local v234 = v_u_4
    local v235 = v_u_231
    return setmetatable(v235, v234)
end
local v_u_236 = "AudioDeviceInput"
function v5.AudioDeviceInput()
    local v_u_237 = nil
    v_u_237 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p238)
            if typeof(p238) == "Instance" then
                if p238:IsA(v_u_236) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_237, p238, (("expected %*, got %*"):format(v_u_236, p238.ClassName)))
                end
            else
                return v_u_3.err(v_u_237, p238, (("expected %*, got %*"):format(v_u_236, (typeof(p238)))))
            end
        end,
        ["_format"] = function(p239, _, _)
            return v_u_2(v_u_236, p239[v_u_237])
        end
    }
    local v240 = v_u_4
    local v241 = v_u_237
    return setmetatable(v241, v240)
end
local v_u_242 = "AudioDeviceOutput"
function v5.AudioDeviceOutput()
    local v_u_243 = nil
    v_u_243 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p244)
            if typeof(p244) == "Instance" then
                if p244:IsA(v_u_242) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_243, p244, (("expected %*, got %*"):format(v_u_242, p244.ClassName)))
                end
            else
                return v_u_3.err(v_u_243, p244, (("expected %*, got %*"):format(v_u_242, (typeof(p244)))))
            end
        end,
        ["_format"] = function(p245, _, _)
            return v_u_2(v_u_242, p245[v_u_243])
        end
    }
    local v246 = v_u_4
    local v247 = v_u_243
    return setmetatable(v247, v246)
end
local v_u_248 = "AudioDistortion"
function v5.AudioDistortion()
    local v_u_249 = nil
    v_u_249 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p250)
            if typeof(p250) == "Instance" then
                if p250:IsA(v_u_248) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_249, p250, (("expected %*, got %*"):format(v_u_248, p250.ClassName)))
                end
            else
                return v_u_3.err(v_u_249, p250, (("expected %*, got %*"):format(v_u_248, (typeof(p250)))))
            end
        end,
        ["_format"] = function(p251, _, _)
            return v_u_2(v_u_248, p251[v_u_249])
        end
    }
    local v252 = v_u_4
    local v253 = v_u_249
    return setmetatable(v253, v252)
end
local v_u_254 = "AudioEcho"
function v5.AudioEcho()
    local v_u_255 = nil
    v_u_255 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p256)
            if typeof(p256) == "Instance" then
                if p256:IsA(v_u_254) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_255, p256, (("expected %*, got %*"):format(v_u_254, p256.ClassName)))
                end
            else
                return v_u_3.err(v_u_255, p256, (("expected %*, got %*"):format(v_u_254, (typeof(p256)))))
            end
        end,
        ["_format"] = function(p257, _, _)
            return v_u_2(v_u_254, p257[v_u_255])
        end
    }
    local v258 = v_u_4
    local v259 = v_u_255
    return setmetatable(v259, v258)
end
local v_u_260 = "AudioEmitter"
function v5.AudioEmitter()
    local v_u_261 = nil
    v_u_261 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p262)
            if typeof(p262) == "Instance" then
                if p262:IsA(v_u_260) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_261, p262, (("expected %*, got %*"):format(v_u_260, p262.ClassName)))
                end
            else
                return v_u_3.err(v_u_261, p262, (("expected %*, got %*"):format(v_u_260, (typeof(p262)))))
            end
        end,
        ["_format"] = function(p263, _, _)
            return v_u_2(v_u_260, p263[v_u_261])
        end
    }
    local v264 = v_u_4
    local v265 = v_u_261
    return setmetatable(v265, v264)
end
local v_u_266 = "AudioEqualizer"
function v5.AudioEqualizer()
    local v_u_267 = nil
    v_u_267 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p268)
            if typeof(p268) == "Instance" then
                if p268:IsA(v_u_266) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_267, p268, (("expected %*, got %*"):format(v_u_266, p268.ClassName)))
                end
            else
                return v_u_3.err(v_u_267, p268, (("expected %*, got %*"):format(v_u_266, (typeof(p268)))))
            end
        end,
        ["_format"] = function(p269, _, _)
            return v_u_2(v_u_266, p269[v_u_267])
        end
    }
    local v270 = v_u_4
    local v271 = v_u_267
    return setmetatable(v271, v270)
end
local v_u_272 = "AudioFader"
function v5.AudioFader()
    local v_u_273 = nil
    v_u_273 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p274)
            if typeof(p274) == "Instance" then
                if p274:IsA(v_u_272) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_273, p274, (("expected %*, got %*"):format(v_u_272, p274.ClassName)))
                end
            else
                return v_u_3.err(v_u_273, p274, (("expected %*, got %*"):format(v_u_272, (typeof(p274)))))
            end
        end,
        ["_format"] = function(p275, _, _)
            return v_u_2(v_u_272, p275[v_u_273])
        end
    }
    local v276 = v_u_4
    local v277 = v_u_273
    return setmetatable(v277, v276)
end
local v_u_278 = "AudioFlanger"
function v5.AudioFlanger()
    local v_u_279 = nil
    v_u_279 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p280)
            if typeof(p280) == "Instance" then
                if p280:IsA(v_u_278) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_279, p280, (("expected %*, got %*"):format(v_u_278, p280.ClassName)))
                end
            else
                return v_u_3.err(v_u_279, p280, (("expected %*, got %*"):format(v_u_278, (typeof(p280)))))
            end
        end,
        ["_format"] = function(p281, _, _)
            return v_u_2(v_u_278, p281[v_u_279])
        end
    }
    local v282 = v_u_4
    local v283 = v_u_279
    return setmetatable(v283, v282)
end
local v_u_284 = "AudioListener"
function v5.AudioListener()
    local v_u_285 = nil
    v_u_285 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p286)
            if typeof(p286) == "Instance" then
                if p286:IsA(v_u_284) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_285, p286, (("expected %*, got %*"):format(v_u_284, p286.ClassName)))
                end
            else
                return v_u_3.err(v_u_285, p286, (("expected %*, got %*"):format(v_u_284, (typeof(p286)))))
            end
        end,
        ["_format"] = function(p287, _, _)
            return v_u_2(v_u_284, p287[v_u_285])
        end
    }
    local v288 = v_u_4
    local v289 = v_u_285
    return setmetatable(v289, v288)
end
local v_u_290 = "AudioPitchShifter"
function v5.AudioPitchShifter()
    local v_u_291 = nil
    v_u_291 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p292)
            if typeof(p292) == "Instance" then
                if p292:IsA(v_u_290) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_291, p292, (("expected %*, got %*"):format(v_u_290, p292.ClassName)))
                end
            else
                return v_u_3.err(v_u_291, p292, (("expected %*, got %*"):format(v_u_290, (typeof(p292)))))
            end
        end,
        ["_format"] = function(p293, _, _)
            return v_u_2(v_u_290, p293[v_u_291])
        end
    }
    local v294 = v_u_4
    local v295 = v_u_291
    return setmetatable(v295, v294)
end
local v_u_296 = "AudioPlayer"
function v5.AudioPlayer()
    local v_u_297 = nil
    v_u_297 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p298)
            if typeof(p298) == "Instance" then
                if p298:IsA(v_u_296) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_297, p298, (("expected %*, got %*"):format(v_u_296, p298.ClassName)))
                end
            else
                return v_u_3.err(v_u_297, p298, (("expected %*, got %*"):format(v_u_296, (typeof(p298)))))
            end
        end,
        ["_format"] = function(p299, _, _)
            return v_u_2(v_u_296, p299[v_u_297])
        end
    }
    local v300 = v_u_4
    local v301 = v_u_297
    return setmetatable(v301, v300)
end
local v_u_302 = "AudioReverb"
function v5.AudioReverb()
    local v_u_303 = nil
    v_u_303 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p304)
            if typeof(p304) == "Instance" then
                if p304:IsA(v_u_302) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_303, p304, (("expected %*, got %*"):format(v_u_302, p304.ClassName)))
                end
            else
                return v_u_3.err(v_u_303, p304, (("expected %*, got %*"):format(v_u_302, (typeof(p304)))))
            end
        end,
        ["_format"] = function(p305, _, _)
            return v_u_2(v_u_302, p305[v_u_303])
        end
    }
    local v306 = v_u_4
    local v307 = v_u_303
    return setmetatable(v307, v306)
end
local v_u_308 = "AudioSearchParams"
function v5.AudioSearchParams()
    local v_u_309 = nil
    v_u_309 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p310)
            if typeof(p310) == "Instance" then
                if p310:IsA(v_u_308) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_309, p310, (("expected %*, got %*"):format(v_u_308, p310.ClassName)))
                end
            else
                return v_u_3.err(v_u_309, p310, (("expected %*, got %*"):format(v_u_308, (typeof(p310)))))
            end
        end,
        ["_format"] = function(p311, _, _)
            return v_u_2(v_u_308, p311[v_u_309])
        end
    }
    local v312 = v_u_4
    local v313 = v_u_309
    return setmetatable(v313, v312)
end
local v_u_314 = "AvatarChatService"
function v5.AvatarChatService()
    local v_u_315 = nil
    v_u_315 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p316)
            if typeof(p316) == "Instance" then
                if p316:IsA(v_u_314) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_315, p316, (("expected %*, got %*"):format(v_u_314, p316.ClassName)))
                end
            else
                return v_u_3.err(v_u_315, p316, (("expected %*, got %*"):format(v_u_314, (typeof(p316)))))
            end
        end,
        ["_format"] = function(p317, _, _)
            return v_u_2(v_u_314, p317[v_u_315])
        end
    }
    local v318 = v_u_4
    local v319 = v_u_315
    return setmetatable(v319, v318)
end
local v_u_320 = "AvatarCreationService"
function v5.AvatarCreationService()
    local v_u_321 = nil
    v_u_321 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p322)
            if typeof(p322) == "Instance" then
                if p322:IsA(v_u_320) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_321, p322, (("expected %*, got %*"):format(v_u_320, p322.ClassName)))
                end
            else
                return v_u_3.err(v_u_321, p322, (("expected %*, got %*"):format(v_u_320, (typeof(p322)))))
            end
        end,
        ["_format"] = function(p323, _, _)
            return v_u_2(v_u_320, p323[v_u_321])
        end
    }
    local v324 = v_u_4
    local v325 = v_u_321
    return setmetatable(v325, v324)
end
local v_u_326 = "AvatarEditorService"
function v5.AvatarEditorService()
    local v_u_327 = nil
    v_u_327 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p328)
            if typeof(p328) == "Instance" then
                if p328:IsA(v_u_326) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_327, p328, (("expected %*, got %*"):format(v_u_326, p328.ClassName)))
                end
            else
                return v_u_3.err(v_u_327, p328, (("expected %*, got %*"):format(v_u_326, (typeof(p328)))))
            end
        end,
        ["_format"] = function(p329, _, _)
            return v_u_2(v_u_326, p329[v_u_327])
        end
    }
    local v330 = v_u_4
    local v331 = v_u_327
    return setmetatable(v331, v330)
end
local v_u_332 = "AvatarImportService"
function v5.AvatarImportService()
    local v_u_333 = nil
    v_u_333 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p334)
            if typeof(p334) == "Instance" then
                if p334:IsA(v_u_332) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_333, p334, (("expected %*, got %*"):format(v_u_332, p334.ClassName)))
                end
            else
                return v_u_3.err(v_u_333, p334, (("expected %*, got %*"):format(v_u_332, (typeof(p334)))))
            end
        end,
        ["_format"] = function(p335, _, _)
            return v_u_2(v_u_332, p335[v_u_333])
        end
    }
    local v336 = v_u_4
    local v337 = v_u_333
    return setmetatable(v337, v336)
end
local v_u_338 = "Backpack"
function v5.Backpack()
    local v_u_339 = nil
    v_u_339 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p340)
            if typeof(p340) == "Instance" then
                if p340:IsA(v_u_338) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_339, p340, (("expected %*, got %*"):format(v_u_338, p340.ClassName)))
                end
            else
                return v_u_3.err(v_u_339, p340, (("expected %*, got %*"):format(v_u_338, (typeof(p340)))))
            end
        end,
        ["_format"] = function(p341, _, _)
            return v_u_2(v_u_338, p341[v_u_339])
        end
    }
    local v342 = v_u_4
    local v343 = v_u_339
    return setmetatable(v343, v342)
end
local v_u_344 = "BadgeService"
function v5.BadgeService()
    local v_u_345 = nil
    v_u_345 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p346)
            if typeof(p346) == "Instance" then
                if p346:IsA(v_u_344) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_345, p346, (("expected %*, got %*"):format(v_u_344, p346.ClassName)))
                end
            else
                return v_u_3.err(v_u_345, p346, (("expected %*, got %*"):format(v_u_344, (typeof(p346)))))
            end
        end,
        ["_format"] = function(p347, _, _)
            return v_u_2(v_u_344, p347[v_u_345])
        end
    }
    local v348 = v_u_4
    local v349 = v_u_345
    return setmetatable(v349, v348)
end
local v_u_350 = "BaseImportData"
function v5.BaseImportData()
    local v_u_351 = nil
    v_u_351 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p352)
            if typeof(p352) == "Instance" then
                if p352:IsA(v_u_350) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_351, p352, (("expected %*, got %*"):format(v_u_350, p352.ClassName)))
                end
            else
                return v_u_3.err(v_u_351, p352, (("expected %*, got %*"):format(v_u_350, (typeof(p352)))))
            end
        end,
        ["_format"] = function(p353, _, _)
            return v_u_2(v_u_350, p353[v_u_351])
        end
    }
    local v354 = v_u_4
    local v355 = v_u_351
    return setmetatable(v355, v354)
end
local v_u_356 = "AnimationImportData"
function v5.AnimationImportData()
    local v_u_357 = nil
    v_u_357 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p358)
            if typeof(p358) == "Instance" then
                if p358:IsA(v_u_356) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_357, p358, (("expected %*, got %*"):format(v_u_356, p358.ClassName)))
                end
            else
                return v_u_3.err(v_u_357, p358, (("expected %*, got %*"):format(v_u_356, (typeof(p358)))))
            end
        end,
        ["_format"] = function(p359, _, _)
            return v_u_2(v_u_356, p359[v_u_357])
        end
    }
    local v360 = v_u_4
    local v361 = v_u_357
    return setmetatable(v361, v360)
end
local v_u_362 = "FacsImportData"
function v5.FacsImportData()
    local v_u_363 = nil
    v_u_363 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p364)
            if typeof(p364) == "Instance" then
                if p364:IsA(v_u_362) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_363, p364, (("expected %*, got %*"):format(v_u_362, p364.ClassName)))
                end
            else
                return v_u_3.err(v_u_363, p364, (("expected %*, got %*"):format(v_u_362, (typeof(p364)))))
            end
        end,
        ["_format"] = function(p365, _, _)
            return v_u_2(v_u_362, p365[v_u_363])
        end
    }
    local v366 = v_u_4
    local v367 = v_u_363
    return setmetatable(v367, v366)
end
local v_u_368 = "GroupImportData"
function v5.GroupImportData()
    local v_u_369 = nil
    v_u_369 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p370)
            if typeof(p370) == "Instance" then
                if p370:IsA(v_u_368) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_369, p370, (("expected %*, got %*"):format(v_u_368, p370.ClassName)))
                end
            else
                return v_u_3.err(v_u_369, p370, (("expected %*, got %*"):format(v_u_368, (typeof(p370)))))
            end
        end,
        ["_format"] = function(p371, _, _)
            return v_u_2(v_u_368, p371[v_u_369])
        end
    }
    local v372 = v_u_4
    local v373 = v_u_369
    return setmetatable(v373, v372)
end
local v_u_374 = "JointImportData"
function v5.JointImportData()
    local v_u_375 = nil
    v_u_375 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p376)
            if typeof(p376) == "Instance" then
                if p376:IsA(v_u_374) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_375, p376, (("expected %*, got %*"):format(v_u_374, p376.ClassName)))
                end
            else
                return v_u_3.err(v_u_375, p376, (("expected %*, got %*"):format(v_u_374, (typeof(p376)))))
            end
        end,
        ["_format"] = function(p377, _, _)
            return v_u_2(v_u_374, p377[v_u_375])
        end
    }
    local v378 = v_u_4
    local v379 = v_u_375
    return setmetatable(v379, v378)
end
local v_u_380 = "MaterialImportData"
function v5.MaterialImportData()
    local v_u_381 = nil
    v_u_381 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p382)
            if typeof(p382) == "Instance" then
                if p382:IsA(v_u_380) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_381, p382, (("expected %*, got %*"):format(v_u_380, p382.ClassName)))
                end
            else
                return v_u_3.err(v_u_381, p382, (("expected %*, got %*"):format(v_u_380, (typeof(p382)))))
            end
        end,
        ["_format"] = function(p383, _, _)
            return v_u_2(v_u_380, p383[v_u_381])
        end
    }
    local v384 = v_u_4
    local v385 = v_u_381
    return setmetatable(v385, v384)
end
local v_u_386 = "MeshImportData"
function v5.MeshImportData()
    local v_u_387 = nil
    v_u_387 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p388)
            if typeof(p388) == "Instance" then
                if p388:IsA(v_u_386) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_387, p388, (("expected %*, got %*"):format(v_u_386, p388.ClassName)))
                end
            else
                return v_u_3.err(v_u_387, p388, (("expected %*, got %*"):format(v_u_386, (typeof(p388)))))
            end
        end,
        ["_format"] = function(p389, _, _)
            return v_u_2(v_u_386, p389[v_u_387])
        end
    }
    local v390 = v_u_4
    local v391 = v_u_387
    return setmetatable(v391, v390)
end
local v_u_392 = "RootImportData"
function v5.RootImportData()
    local v_u_393 = nil
    v_u_393 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p394)
            if typeof(p394) == "Instance" then
                if p394:IsA(v_u_392) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_393, p394, (("expected %*, got %*"):format(v_u_392, p394.ClassName)))
                end
            else
                return v_u_3.err(v_u_393, p394, (("expected %*, got %*"):format(v_u_392, (typeof(p394)))))
            end
        end,
        ["_format"] = function(p395, _, _)
            return v_u_2(v_u_392, p395[v_u_393])
        end
    }
    local v396 = v_u_4
    local v397 = v_u_393
    return setmetatable(v397, v396)
end
local v_u_398 = "BasePlayerGui"
function v5.BasePlayerGui()
    local v_u_399 = nil
    v_u_399 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p400)
            if typeof(p400) == "Instance" then
                if p400:IsA(v_u_398) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_399, p400, (("expected %*, got %*"):format(v_u_398, p400.ClassName)))
                end
            else
                return v_u_3.err(v_u_399, p400, (("expected %*, got %*"):format(v_u_398, (typeof(p400)))))
            end
        end,
        ["_format"] = function(p401, _, _)
            return v_u_2(v_u_398, p401[v_u_399])
        end
    }
    local v402 = v_u_4
    local v403 = v_u_399
    return setmetatable(v403, v402)
end
local v_u_404 = "CoreGui"
function v5.CoreGui()
    local v_u_405 = nil
    v_u_405 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p406)
            if typeof(p406) == "Instance" then
                if p406:IsA(v_u_404) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_405, p406, (("expected %*, got %*"):format(v_u_404, p406.ClassName)))
                end
            else
                return v_u_3.err(v_u_405, p406, (("expected %*, got %*"):format(v_u_404, (typeof(p406)))))
            end
        end,
        ["_format"] = function(p407, _, _)
            return v_u_2(v_u_404, p407[v_u_405])
        end
    }
    local v408 = v_u_4
    local v409 = v_u_405
    return setmetatable(v409, v408)
end
local v_u_410 = "PlayerGui"
function v5.PlayerGui()
    local v_u_411 = nil
    v_u_411 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p412)
            if typeof(p412) == "Instance" then
                if p412:IsA(v_u_410) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_411, p412, (("expected %*, got %*"):format(v_u_410, p412.ClassName)))
                end
            else
                return v_u_3.err(v_u_411, p412, (("expected %*, got %*"):format(v_u_410, (typeof(p412)))))
            end
        end,
        ["_format"] = function(p413, _, _)
            return v_u_2(v_u_410, p413[v_u_411])
        end
    }
    local v414 = v_u_4
    local v415 = v_u_411
    return setmetatable(v415, v414)
end
local v_u_416 = "StarterGui"
function v5.StarterGui()
    local v_u_417 = nil
    v_u_417 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p418)
            if typeof(p418) == "Instance" then
                if p418:IsA(v_u_416) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_417, p418, (("expected %*, got %*"):format(v_u_416, p418.ClassName)))
                end
            else
                return v_u_3.err(v_u_417, p418, (("expected %*, got %*"):format(v_u_416, (typeof(p418)))))
            end
        end,
        ["_format"] = function(p419, _, _)
            return v_u_2(v_u_416, p419[v_u_417])
        end
    }
    local v420 = v_u_4
    local v421 = v_u_417
    return setmetatable(v421, v420)
end
local v_u_422 = "BaseRemoteEvent"
function v5.BaseRemoteEvent()
    local v_u_423 = nil
    v_u_423 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p424)
            if typeof(p424) == "Instance" then
                if p424:IsA(v_u_422) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_423, p424, (("expected %*, got %*"):format(v_u_422, p424.ClassName)))
                end
            else
                return v_u_3.err(v_u_423, p424, (("expected %*, got %*"):format(v_u_422, (typeof(p424)))))
            end
        end,
        ["_format"] = function(p425, _, _)
            return v_u_2(v_u_422, p425[v_u_423])
        end
    }
    local v426 = v_u_4
    local v427 = v_u_423
    return setmetatable(v427, v426)
end
local v_u_428 = "RemoteEvent"
function v5.RemoteEvent()
    local v_u_429 = nil
    v_u_429 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p430)
            if typeof(p430) == "Instance" then
                if p430:IsA(v_u_428) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_429, p430, (("expected %*, got %*"):format(v_u_428, p430.ClassName)))
                end
            else
                return v_u_3.err(v_u_429, p430, (("expected %*, got %*"):format(v_u_428, (typeof(p430)))))
            end
        end,
        ["_format"] = function(p431, _, _)
            return v_u_2(v_u_428, p431[v_u_429])
        end
    }
    local v432 = v_u_4
    local v433 = v_u_429
    return setmetatable(v433, v432)
end
local v_u_434 = "UnreliableRemoteEvent"
function v5.UnreliableRemoteEvent()
    local v_u_435 = nil
    v_u_435 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p436)
            if typeof(p436) == "Instance" then
                if p436:IsA(v_u_434) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_435, p436, (("expected %*, got %*"):format(v_u_434, p436.ClassName)))
                end
            else
                return v_u_3.err(v_u_435, p436, (("expected %*, got %*"):format(v_u_434, (typeof(p436)))))
            end
        end,
        ["_format"] = function(p437, _, _)
            return v_u_2(v_u_434, p437[v_u_435])
        end
    }
    local v438 = v_u_4
    local v439 = v_u_435
    return setmetatable(v439, v438)
end
local v_u_440 = "BaseWrap"
function v5.BaseWrap()
    local v_u_441 = nil
    v_u_441 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p442)
            if typeof(p442) == "Instance" then
                if p442:IsA(v_u_440) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_441, p442, (("expected %*, got %*"):format(v_u_440, p442.ClassName)))
                end
            else
                return v_u_3.err(v_u_441, p442, (("expected %*, got %*"):format(v_u_440, (typeof(p442)))))
            end
        end,
        ["_format"] = function(p443, _, _)
            return v_u_2(v_u_440, p443[v_u_441])
        end
    }
    local v444 = v_u_4
    local v445 = v_u_441
    return setmetatable(v445, v444)
end
local v_u_446 = "WrapLayer"
function v5.WrapLayer()
    local v_u_447 = nil
    v_u_447 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p448)
            if typeof(p448) == "Instance" then
                if p448:IsA(v_u_446) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_447, p448, (("expected %*, got %*"):format(v_u_446, p448.ClassName)))
                end
            else
                return v_u_3.err(v_u_447, p448, (("expected %*, got %*"):format(v_u_446, (typeof(p448)))))
            end
        end,
        ["_format"] = function(p449, _, _)
            return v_u_2(v_u_446, p449[v_u_447])
        end
    }
    local v450 = v_u_4
    local v451 = v_u_447
    return setmetatable(v451, v450)
end
local v_u_452 = "WrapTarget"
function v5.WrapTarget()
    local v_u_453 = nil
    v_u_453 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p454)
            if typeof(p454) == "Instance" then
                if p454:IsA(v_u_452) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_453, p454, (("expected %*, got %*"):format(v_u_452, p454.ClassName)))
                end
            else
                return v_u_3.err(v_u_453, p454, (("expected %*, got %*"):format(v_u_452, (typeof(p454)))))
            end
        end,
        ["_format"] = function(p455, _, _)
            return v_u_2(v_u_452, p455[v_u_453])
        end
    }
    local v456 = v_u_4
    local v457 = v_u_453
    return setmetatable(v457, v456)
end
local v_u_458 = "Beam"
function v5.Beam()
    local v_u_459 = nil
    v_u_459 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p460)
            if typeof(p460) == "Instance" then
                if p460:IsA(v_u_458) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_459, p460, (("expected %*, got %*"):format(v_u_458, p460.ClassName)))
                end
            else
                return v_u_3.err(v_u_459, p460, (("expected %*, got %*"):format(v_u_458, (typeof(p460)))))
            end
        end,
        ["_format"] = function(p461, _, _)
            return v_u_2(v_u_458, p461[v_u_459])
        end
    }
    local v462 = v_u_4
    local v463 = v_u_459
    return setmetatable(v463, v462)
end
local v_u_464 = "BindableEvent"
function v5.BindableEvent()
    local v_u_465 = nil
    v_u_465 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p466)
            if typeof(p466) == "Instance" then
                if p466:IsA(v_u_464) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_465, p466, (("expected %*, got %*"):format(v_u_464, p466.ClassName)))
                end
            else
                return v_u_3.err(v_u_465, p466, (("expected %*, got %*"):format(v_u_464, (typeof(p466)))))
            end
        end,
        ["_format"] = function(p467, _, _)
            return v_u_2(v_u_464, p467[v_u_465])
        end
    }
    local v468 = v_u_4
    local v469 = v_u_465
    return setmetatable(v469, v468)
end
local v_u_470 = "BindableFunction"
function v5.BindableFunction()
    local v_u_471 = nil
    v_u_471 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p472)
            if typeof(p472) == "Instance" then
                if p472:IsA(v_u_470) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_471, p472, (("expected %*, got %*"):format(v_u_470, p472.ClassName)))
                end
            else
                return v_u_3.err(v_u_471, p472, (("expected %*, got %*"):format(v_u_470, (typeof(p472)))))
            end
        end,
        ["_format"] = function(p473, _, _)
            return v_u_2(v_u_470, p473[v_u_471])
        end
    }
    local v474 = v_u_4
    local v475 = v_u_471
    return setmetatable(v475, v474)
end
local v_u_476 = "BodyMover"
function v5.BodyMover()
    local v_u_477 = nil
    v_u_477 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p478)
            if typeof(p478) == "Instance" then
                if p478:IsA(v_u_476) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_477, p478, (("expected %*, got %*"):format(v_u_476, p478.ClassName)))
                end
            else
                return v_u_3.err(v_u_477, p478, (("expected %*, got %*"):format(v_u_476, (typeof(p478)))))
            end
        end,
        ["_format"] = function(p479, _, _)
            return v_u_2(v_u_476, p479[v_u_477])
        end
    }
    local v480 = v_u_4
    local v481 = v_u_477
    return setmetatable(v481, v480)
end
local v_u_482 = "BodyAngularVelocity"
function v5.BodyAngularVelocity()
    local v_u_483 = nil
    v_u_483 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p484)
            if typeof(p484) == "Instance" then
                if p484:IsA(v_u_482) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_483, p484, (("expected %*, got %*"):format(v_u_482, p484.ClassName)))
                end
            else
                return v_u_3.err(v_u_483, p484, (("expected %*, got %*"):format(v_u_482, (typeof(p484)))))
            end
        end,
        ["_format"] = function(p485, _, _)
            return v_u_2(v_u_482, p485[v_u_483])
        end
    }
    local v486 = v_u_4
    local v487 = v_u_483
    return setmetatable(v487, v486)
end
local v_u_488 = "BodyForce"
function v5.BodyForce()
    local v_u_489 = nil
    v_u_489 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p490)
            if typeof(p490) == "Instance" then
                if p490:IsA(v_u_488) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_489, p490, (("expected %*, got %*"):format(v_u_488, p490.ClassName)))
                end
            else
                return v_u_3.err(v_u_489, p490, (("expected %*, got %*"):format(v_u_488, (typeof(p490)))))
            end
        end,
        ["_format"] = function(p491, _, _)
            return v_u_2(v_u_488, p491[v_u_489])
        end
    }
    local v492 = v_u_4
    local v493 = v_u_489
    return setmetatable(v493, v492)
end
local v_u_494 = "BodyGyro"
function v5.BodyGyro()
    local v_u_495 = nil
    v_u_495 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p496)
            if typeof(p496) == "Instance" then
                if p496:IsA(v_u_494) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_495, p496, (("expected %*, got %*"):format(v_u_494, p496.ClassName)))
                end
            else
                return v_u_3.err(v_u_495, p496, (("expected %*, got %*"):format(v_u_494, (typeof(p496)))))
            end
        end,
        ["_format"] = function(p497, _, _)
            return v_u_2(v_u_494, p497[v_u_495])
        end
    }
    local v498 = v_u_4
    local v499 = v_u_495
    return setmetatable(v499, v498)
end
local v_u_500 = "BodyPosition"
function v5.BodyPosition()
    local v_u_501 = nil
    v_u_501 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p502)
            if typeof(p502) == "Instance" then
                if p502:IsA(v_u_500) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_501, p502, (("expected %*, got %*"):format(v_u_500, p502.ClassName)))
                end
            else
                return v_u_3.err(v_u_501, p502, (("expected %*, got %*"):format(v_u_500, (typeof(p502)))))
            end
        end,
        ["_format"] = function(p503, _, _)
            return v_u_2(v_u_500, p503[v_u_501])
        end
    }
    local v504 = v_u_4
    local v505 = v_u_501
    return setmetatable(v505, v504)
end
local v_u_506 = "BodyThrust"
function v5.BodyThrust()
    local v_u_507 = nil
    v_u_507 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p508)
            if typeof(p508) == "Instance" then
                if p508:IsA(v_u_506) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_507, p508, (("expected %*, got %*"):format(v_u_506, p508.ClassName)))
                end
            else
                return v_u_3.err(v_u_507, p508, (("expected %*, got %*"):format(v_u_506, (typeof(p508)))))
            end
        end,
        ["_format"] = function(p509, _, _)
            return v_u_2(v_u_506, p509[v_u_507])
        end
    }
    local v510 = v_u_4
    local v511 = v_u_507
    return setmetatable(v511, v510)
end
local v_u_512 = "BodyVelocity"
function v5.BodyVelocity()
    local v_u_513 = nil
    v_u_513 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p514)
            if typeof(p514) == "Instance" then
                if p514:IsA(v_u_512) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_513, p514, (("expected %*, got %*"):format(v_u_512, p514.ClassName)))
                end
            else
                return v_u_3.err(v_u_513, p514, (("expected %*, got %*"):format(v_u_512, (typeof(p514)))))
            end
        end,
        ["_format"] = function(p515, _, _)
            return v_u_2(v_u_512, p515[v_u_513])
        end
    }
    local v516 = v_u_4
    local v517 = v_u_513
    return setmetatable(v517, v516)
end
local v_u_518 = "RocketPropulsion"
function v5.RocketPropulsion()
    local v_u_519 = nil
    v_u_519 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p520)
            if typeof(p520) == "Instance" then
                if p520:IsA(v_u_518) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_519, p520, (("expected %*, got %*"):format(v_u_518, p520.ClassName)))
                end
            else
                return v_u_3.err(v_u_519, p520, (("expected %*, got %*"):format(v_u_518, (typeof(p520)))))
            end
        end,
        ["_format"] = function(p521, _, _)
            return v_u_2(v_u_518, p521[v_u_519])
        end
    }
    local v522 = v_u_4
    local v523 = v_u_519
    return setmetatable(v523, v522)
end
local v_u_524 = "BodyPartDescription"
function v5.BodyPartDescription()
    local v_u_525 = nil
    v_u_525 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p526)
            if typeof(p526) == "Instance" then
                if p526:IsA(v_u_524) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_525, p526, (("expected %*, got %*"):format(v_u_524, p526.ClassName)))
                end
            else
                return v_u_3.err(v_u_525, p526, (("expected %*, got %*"):format(v_u_524, (typeof(p526)))))
            end
        end,
        ["_format"] = function(p527, _, _)
            return v_u_2(v_u_524, p527[v_u_525])
        end
    }
    local v528 = v_u_4
    local v529 = v_u_525
    return setmetatable(v529, v528)
end
local v_u_530 = "Breakpoint"
function v5.Breakpoint()
    local v_u_531 = nil
    v_u_531 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p532)
            if typeof(p532) == "Instance" then
                if p532:IsA(v_u_530) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_531, p532, (("expected %*, got %*"):format(v_u_530, p532.ClassName)))
                end
            else
                return v_u_3.err(v_u_531, p532, (("expected %*, got %*"):format(v_u_530, (typeof(p532)))))
            end
        end,
        ["_format"] = function(p533, _, _)
            return v_u_2(v_u_530, p533[v_u_531])
        end
    }
    local v534 = v_u_4
    local v535 = v_u_531
    return setmetatable(v535, v534)
end
local v_u_536 = "BrowserService"
function v5.BrowserService()
    local v_u_537 = nil
    v_u_537 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p538)
            if typeof(p538) == "Instance" then
                if p538:IsA(v_u_536) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_537, p538, (("expected %*, got %*"):format(v_u_536, p538.ClassName)))
                end
            else
                return v_u_3.err(v_u_537, p538, (("expected %*, got %*"):format(v_u_536, (typeof(p538)))))
            end
        end,
        ["_format"] = function(p539, _, _)
            return v_u_2(v_u_536, p539[v_u_537])
        end
    }
    local v540 = v_u_4
    local v541 = v_u_537
    return setmetatable(v541, v540)
end
local v_u_542 = "BubbleChatMessageProperties"
function v5.BubbleChatMessageProperties()
    local v_u_543 = nil
    v_u_543 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p544)
            if typeof(p544) == "Instance" then
                if p544:IsA(v_u_542) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_543, p544, (("expected %*, got %*"):format(v_u_542, p544.ClassName)))
                end
            else
                return v_u_3.err(v_u_543, p544, (("expected %*, got %*"):format(v_u_542, (typeof(p544)))))
            end
        end,
        ["_format"] = function(p545, _, _)
            return v_u_2(v_u_542, p545[v_u_543])
        end
    }
    local v546 = v_u_4
    local v547 = v_u_543
    return setmetatable(v547, v546)
end
local v_u_548 = "BulkImportService"
function v5.BulkImportService()
    local v_u_549 = nil
    v_u_549 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p550)
            if typeof(p550) == "Instance" then
                if p550:IsA(v_u_548) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_549, p550, (("expected %*, got %*"):format(v_u_548, p550.ClassName)))
                end
            else
                return v_u_3.err(v_u_549, p550, (("expected %*, got %*"):format(v_u_548, (typeof(p550)))))
            end
        end,
        ["_format"] = function(p551, _, _)
            return v_u_2(v_u_548, p551[v_u_549])
        end
    }
    local v552 = v_u_4
    local v553 = v_u_549
    return setmetatable(v553, v552)
end
local v_u_554 = "CacheableContentProvider"
function v5.CacheableContentProvider()
    local v_u_555 = nil
    v_u_555 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p556)
            if typeof(p556) == "Instance" then
                if p556:IsA(v_u_554) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_555, p556, (("expected %*, got %*"):format(v_u_554, p556.ClassName)))
                end
            else
                return v_u_3.err(v_u_555, p556, (("expected %*, got %*"):format(v_u_554, (typeof(p556)))))
            end
        end,
        ["_format"] = function(p557, _, _)
            return v_u_2(v_u_554, p557[v_u_555])
        end
    }
    local v558 = v_u_4
    local v559 = v_u_555
    return setmetatable(v559, v558)
end
local v_u_560 = "HSRDataContentProvider"
function v5.HSRDataContentProvider()
    local v_u_561 = nil
    v_u_561 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p562)
            if typeof(p562) == "Instance" then
                if p562:IsA(v_u_560) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_561, p562, (("expected %*, got %*"):format(v_u_560, p562.ClassName)))
                end
            else
                return v_u_3.err(v_u_561, p562, (("expected %*, got %*"):format(v_u_560, (typeof(p562)))))
            end
        end,
        ["_format"] = function(p563, _, _)
            return v_u_2(v_u_560, p563[v_u_561])
        end
    }
    local v564 = v_u_4
    local v565 = v_u_561
    return setmetatable(v565, v564)
end
local v_u_566 = "MeshContentProvider"
function v5.MeshContentProvider()
    local v_u_567 = nil
    v_u_567 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p568)
            if typeof(p568) == "Instance" then
                if p568:IsA(v_u_566) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_567, p568, (("expected %*, got %*"):format(v_u_566, p568.ClassName)))
                end
            else
                return v_u_3.err(v_u_567, p568, (("expected %*, got %*"):format(v_u_566, (typeof(p568)))))
            end
        end,
        ["_format"] = function(p569, _, _)
            return v_u_2(v_u_566, p569[v_u_567])
        end
    }
    local v570 = v_u_4
    local v571 = v_u_567
    return setmetatable(v571, v570)
end
local v_u_572 = "SolidModelContentProvider"
function v5.SolidModelContentProvider()
    local v_u_573 = nil
    v_u_573 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p574)
            if typeof(p574) == "Instance" then
                if p574:IsA(v_u_572) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_573, p574, (("expected %*, got %*"):format(v_u_572, p574.ClassName)))
                end
            else
                return v_u_3.err(v_u_573, p574, (("expected %*, got %*"):format(v_u_572, (typeof(p574)))))
            end
        end,
        ["_format"] = function(p575, _, _)
            return v_u_2(v_u_572, p575[v_u_573])
        end
    }
    local v576 = v_u_4
    local v577 = v_u_573
    return setmetatable(v577, v576)
end
local v_u_578 = "CalloutService"
function v5.CalloutService()
    local v_u_579 = nil
    v_u_579 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p580)
            if typeof(p580) == "Instance" then
                if p580:IsA(v_u_578) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_579, p580, (("expected %*, got %*"):format(v_u_578, p580.ClassName)))
                end
            else
                return v_u_3.err(v_u_579, p580, (("expected %*, got %*"):format(v_u_578, (typeof(p580)))))
            end
        end,
        ["_format"] = function(p581, _, _)
            return v_u_2(v_u_578, p581[v_u_579])
        end
    }
    local v582 = v_u_4
    local v583 = v_u_579
    return setmetatable(v583, v582)
end
local v_u_584 = "Camera"
function v5.Camera()
    local v_u_585 = nil
    v_u_585 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p586)
            if typeof(p586) == "Instance" then
                if p586:IsA(v_u_584) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_585, p586, (("expected %*, got %*"):format(v_u_584, p586.ClassName)))
                end
            else
                return v_u_3.err(v_u_585, p586, (("expected %*, got %*"):format(v_u_584, (typeof(p586)))))
            end
        end,
        ["_format"] = function(p587, _, _)
            return v_u_2(v_u_584, p587[v_u_585])
        end
    }
    local v588 = v_u_4
    local v589 = v_u_585
    return setmetatable(v589, v588)
end
local v_u_590 = "CaptureService"
function v5.CaptureService()
    local v_u_591 = nil
    v_u_591 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p592)
            if typeof(p592) == "Instance" then
                if p592:IsA(v_u_590) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_591, p592, (("expected %*, got %*"):format(v_u_590, p592.ClassName)))
                end
            else
                return v_u_3.err(v_u_591, p592, (("expected %*, got %*"):format(v_u_590, (typeof(p592)))))
            end
        end,
        ["_format"] = function(p593, _, _)
            return v_u_2(v_u_590, p593[v_u_591])
        end
    }
    local v594 = v_u_4
    local v595 = v_u_591
    return setmetatable(v595, v594)
end
local v_u_596 = "ChangeHistoryService"
function v5.ChangeHistoryService()
    local v_u_597 = nil
    v_u_597 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p598)
            if typeof(p598) == "Instance" then
                if p598:IsA(v_u_596) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_597, p598, (("expected %*, got %*"):format(v_u_596, p598.ClassName)))
                end
            else
                return v_u_3.err(v_u_597, p598, (("expected %*, got %*"):format(v_u_596, (typeof(p598)))))
            end
        end,
        ["_format"] = function(p599, _, _)
            return v_u_2(v_u_596, p599[v_u_597])
        end
    }
    local v600 = v_u_4
    local v601 = v_u_597
    return setmetatable(v601, v600)
end
local v_u_602 = "CharacterAppearance"
function v5.CharacterAppearance()
    local v_u_603 = nil
    v_u_603 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p604)
            if typeof(p604) == "Instance" then
                if p604:IsA(v_u_602) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_603, p604, (("expected %*, got %*"):format(v_u_602, p604.ClassName)))
                end
            else
                return v_u_3.err(v_u_603, p604, (("expected %*, got %*"):format(v_u_602, (typeof(p604)))))
            end
        end,
        ["_format"] = function(p605, _, _)
            return v_u_2(v_u_602, p605[v_u_603])
        end
    }
    local v606 = v_u_4
    local v607 = v_u_603
    return setmetatable(v607, v606)
end
local v_u_608 = "BodyColors"
function v5.BodyColors()
    local v_u_609 = nil
    v_u_609 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p610)
            if typeof(p610) == "Instance" then
                if p610:IsA(v_u_608) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_609, p610, (("expected %*, got %*"):format(v_u_608, p610.ClassName)))
                end
            else
                return v_u_3.err(v_u_609, p610, (("expected %*, got %*"):format(v_u_608, (typeof(p610)))))
            end
        end,
        ["_format"] = function(p611, _, _)
            return v_u_2(v_u_608, p611[v_u_609])
        end
    }
    local v612 = v_u_4
    local v613 = v_u_609
    return setmetatable(v613, v612)
end
local v_u_614 = "CharacterMesh"
function v5.CharacterMesh()
    local v_u_615 = nil
    v_u_615 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p616)
            if typeof(p616) == "Instance" then
                if p616:IsA(v_u_614) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_615, p616, (("expected %*, got %*"):format(v_u_614, p616.ClassName)))
                end
            else
                return v_u_3.err(v_u_615, p616, (("expected %*, got %*"):format(v_u_614, (typeof(p616)))))
            end
        end,
        ["_format"] = function(p617, _, _)
            return v_u_2(v_u_614, p617[v_u_615])
        end
    }
    local v618 = v_u_4
    local v619 = v_u_615
    return setmetatable(v619, v618)
end
local v_u_620 = "Clothing"
function v5.Clothing()
    local v_u_621 = nil
    v_u_621 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p622)
            if typeof(p622) == "Instance" then
                if p622:IsA(v_u_620) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_621, p622, (("expected %*, got %*"):format(v_u_620, p622.ClassName)))
                end
            else
                return v_u_3.err(v_u_621, p622, (("expected %*, got %*"):format(v_u_620, (typeof(p622)))))
            end
        end,
        ["_format"] = function(p623, _, _)
            return v_u_2(v_u_620, p623[v_u_621])
        end
    }
    local v624 = v_u_4
    local v625 = v_u_621
    return setmetatable(v625, v624)
end
local v_u_626 = "Pants"
function v5.Pants()
    local v_u_627 = nil
    v_u_627 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p628)
            if typeof(p628) == "Instance" then
                if p628:IsA(v_u_626) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_627, p628, (("expected %*, got %*"):format(v_u_626, p628.ClassName)))
                end
            else
                return v_u_3.err(v_u_627, p628, (("expected %*, got %*"):format(v_u_626, (typeof(p628)))))
            end
        end,
        ["_format"] = function(p629, _, _)
            return v_u_2(v_u_626, p629[v_u_627])
        end
    }
    local v630 = v_u_4
    local v631 = v_u_627
    return setmetatable(v631, v630)
end
local v_u_632 = "Shirt"
function v5.Shirt()
    local v_u_633 = nil
    v_u_633 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p634)
            if typeof(p634) == "Instance" then
                if p634:IsA(v_u_632) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_633, p634, (("expected %*, got %*"):format(v_u_632, p634.ClassName)))
                end
            else
                return v_u_3.err(v_u_633, p634, (("expected %*, got %*"):format(v_u_632, (typeof(p634)))))
            end
        end,
        ["_format"] = function(p635, _, _)
            return v_u_2(v_u_632, p635[v_u_633])
        end
    }
    local v636 = v_u_4
    local v637 = v_u_633
    return setmetatable(v637, v636)
end
local v_u_638 = "ShirtGraphic"
function v5.ShirtGraphic()
    local v_u_639 = nil
    v_u_639 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p640)
            if typeof(p640) == "Instance" then
                if p640:IsA(v_u_638) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_639, p640, (("expected %*, got %*"):format(v_u_638, p640.ClassName)))
                end
            else
                return v_u_3.err(v_u_639, p640, (("expected %*, got %*"):format(v_u_638, (typeof(p640)))))
            end
        end,
        ["_format"] = function(p641, _, _)
            return v_u_2(v_u_638, p641[v_u_639])
        end
    }
    local v642 = v_u_4
    local v643 = v_u_639
    return setmetatable(v643, v642)
end
local v_u_644 = "Skin"
function v5.Skin()
    local v_u_645 = nil
    v_u_645 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p646)
            if typeof(p646) == "Instance" then
                if p646:IsA(v_u_644) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_645, p646, (("expected %*, got %*"):format(v_u_644, p646.ClassName)))
                end
            else
                return v_u_3.err(v_u_645, p646, (("expected %*, got %*"):format(v_u_644, (typeof(p646)))))
            end
        end,
        ["_format"] = function(p647, _, _)
            return v_u_2(v_u_644, p647[v_u_645])
        end
    }
    local v648 = v_u_4
    local v649 = v_u_645
    return setmetatable(v649, v648)
end
local v_u_650 = "Chat"
function v5.Chat()
    local v_u_651 = nil
    v_u_651 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p652)
            if typeof(p652) == "Instance" then
                if p652:IsA(v_u_650) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_651, p652, (("expected %*, got %*"):format(v_u_650, p652.ClassName)))
                end
            else
                return v_u_3.err(v_u_651, p652, (("expected %*, got %*"):format(v_u_650, (typeof(p652)))))
            end
        end,
        ["_format"] = function(p653, _, _)
            return v_u_2(v_u_650, p653[v_u_651])
        end
    }
    local v654 = v_u_4
    local v655 = v_u_651
    return setmetatable(v655, v654)
end
local v_u_656 = "ChatbotUIService"
function v5.ChatbotUIService()
    local v_u_657 = nil
    v_u_657 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p658)
            if typeof(p658) == "Instance" then
                if p658:IsA(v_u_656) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_657, p658, (("expected %*, got %*"):format(v_u_656, p658.ClassName)))
                end
            else
                return v_u_3.err(v_u_657, p658, (("expected %*, got %*"):format(v_u_656, (typeof(p658)))))
            end
        end,
        ["_format"] = function(p659, _, _)
            return v_u_2(v_u_656, p659[v_u_657])
        end
    }
    local v660 = v_u_4
    local v661 = v_u_657
    return setmetatable(v661, v660)
end
local v_u_662 = "ClickDetector"
function v5.ClickDetector()
    local v_u_663 = nil
    v_u_663 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p664)
            if typeof(p664) == "Instance" then
                if p664:IsA(v_u_662) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_663, p664, (("expected %*, got %*"):format(v_u_662, p664.ClassName)))
                end
            else
                return v_u_3.err(v_u_663, p664, (("expected %*, got %*"):format(v_u_662, (typeof(p664)))))
            end
        end,
        ["_format"] = function(p665, _, _)
            return v_u_2(v_u_662, p665[v_u_663])
        end
    }
    local v666 = v_u_4
    local v667 = v_u_663
    return setmetatable(v667, v666)
end
local v_u_668 = "DragDetector"
function v5.DragDetector()
    local v_u_669 = nil
    v_u_669 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p670)
            if typeof(p670) == "Instance" then
                if p670:IsA(v_u_668) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_669, p670, (("expected %*, got %*"):format(v_u_668, p670.ClassName)))
                end
            else
                return v_u_3.err(v_u_669, p670, (("expected %*, got %*"):format(v_u_668, (typeof(p670)))))
            end
        end,
        ["_format"] = function(p671, _, _)
            return v_u_2(v_u_668, p671[v_u_669])
        end
    }
    local v672 = v_u_4
    local v673 = v_u_669
    return setmetatable(v673, v672)
end
local v_u_674 = "Clouds"
function v5.Clouds()
    local v_u_675 = nil
    v_u_675 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p676)
            if typeof(p676) == "Instance" then
                if p676:IsA(v_u_674) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_675, p676, (("expected %*, got %*"):format(v_u_674, p676.ClassName)))
                end
            else
                return v_u_3.err(v_u_675, p676, (("expected %*, got %*"):format(v_u_674, (typeof(p676)))))
            end
        end,
        ["_format"] = function(p677, _, _)
            return v_u_2(v_u_674, p677[v_u_675])
        end
    }
    local v678 = v_u_4
    local v679 = v_u_675
    return setmetatable(v679, v678)
end
local v_u_680 = "ClusterPacketCache"
function v5.ClusterPacketCache()
    local v_u_681 = nil
    v_u_681 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p682)
            if typeof(p682) == "Instance" then
                if p682:IsA(v_u_680) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_681, p682, (("expected %*, got %*"):format(v_u_680, p682.ClassName)))
                end
            else
                return v_u_3.err(v_u_681, p682, (("expected %*, got %*"):format(v_u_680, (typeof(p682)))))
            end
        end,
        ["_format"] = function(p683, _, _)
            return v_u_2(v_u_680, p683[v_u_681])
        end
    }
    local v684 = v_u_4
    local v685 = v_u_681
    return setmetatable(v685, v684)
end
local v_u_686 = "Collaborator"
function v5.Collaborator()
    local v_u_687 = nil
    v_u_687 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p688)
            if typeof(p688) == "Instance" then
                if p688:IsA(v_u_686) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_687, p688, (("expected %*, got %*"):format(v_u_686, p688.ClassName)))
                end
            else
                return v_u_3.err(v_u_687, p688, (("expected %*, got %*"):format(v_u_686, (typeof(p688)))))
            end
        end,
        ["_format"] = function(p689, _, _)
            return v_u_2(v_u_686, p689[v_u_687])
        end
    }
    local v690 = v_u_4
    local v691 = v_u_687
    return setmetatable(v691, v690)
end
local v_u_692 = "CollaboratorsService"
function v5.CollaboratorsService()
    local v_u_693 = nil
    v_u_693 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p694)
            if typeof(p694) == "Instance" then
                if p694:IsA(v_u_692) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_693, p694, (("expected %*, got %*"):format(v_u_692, p694.ClassName)))
                end
            else
                return v_u_3.err(v_u_693, p694, (("expected %*, got %*"):format(v_u_692, (typeof(p694)))))
            end
        end,
        ["_format"] = function(p695, _, _)
            return v_u_2(v_u_692, p695[v_u_693])
        end
    }
    local v696 = v_u_4
    local v697 = v_u_693
    return setmetatable(v697, v696)
end
local v_u_698 = "CollectionService"
function v5.CollectionService()
    local v_u_699 = nil
    v_u_699 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p700)
            if typeof(p700) == "Instance" then
                if p700:IsA(v_u_698) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_699, p700, (("expected %*, got %*"):format(v_u_698, p700.ClassName)))
                end
            else
                return v_u_3.err(v_u_699, p700, (("expected %*, got %*"):format(v_u_698, (typeof(p700)))))
            end
        end,
        ["_format"] = function(p701, _, _)
            return v_u_2(v_u_698, p701[v_u_699])
        end
    }
    local v702 = v_u_4
    local v703 = v_u_699
    return setmetatable(v703, v702)
end
local v_u_704 = "CommandInstance"
function v5.CommandInstance()
    local v_u_705 = nil
    v_u_705 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p706)
            if typeof(p706) == "Instance" then
                if p706:IsA(v_u_704) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_705, p706, (("expected %*, got %*"):format(v_u_704, p706.ClassName)))
                end
            else
                return v_u_3.err(v_u_705, p706, (("expected %*, got %*"):format(v_u_704, (typeof(p706)))))
            end
        end,
        ["_format"] = function(p707, _, _)
            return v_u_2(v_u_704, p707[v_u_705])
        end
    }
    local v708 = v_u_4
    local v709 = v_u_705
    return setmetatable(v709, v708)
end
local v_u_710 = "CommandService"
function v5.CommandService()
    local v_u_711 = nil
    v_u_711 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p712)
            if typeof(p712) == "Instance" then
                if p712:IsA(v_u_710) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_711, p712, (("expected %*, got %*"):format(v_u_710, p712.ClassName)))
                end
            else
                return v_u_3.err(v_u_711, p712, (("expected %*, got %*"):format(v_u_710, (typeof(p712)))))
            end
        end,
        ["_format"] = function(p713, _, _)
            return v_u_2(v_u_710, p713[v_u_711])
        end
    }
    local v714 = v_u_4
    local v715 = v_u_711
    return setmetatable(v715, v714)
end
local v_u_716 = "Configuration"
function v5.Configuration()
    local v_u_717 = nil
    v_u_717 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p718)
            if typeof(p718) == "Instance" then
                if p718:IsA(v_u_716) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_717, p718, (("expected %*, got %*"):format(v_u_716, p718.ClassName)))
                end
            else
                return v_u_3.err(v_u_717, p718, (("expected %*, got %*"):format(v_u_716, (typeof(p718)))))
            end
        end,
        ["_format"] = function(p719, _, _)
            return v_u_2(v_u_716, p719[v_u_717])
        end
    }
    local v720 = v_u_4
    local v721 = v_u_717
    return setmetatable(v721, v720)
end
local v_u_722 = "ConfigureServerService"
function v5.ConfigureServerService()
    local v_u_723 = nil
    v_u_723 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p724)
            if typeof(p724) == "Instance" then
                if p724:IsA(v_u_722) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_723, p724, (("expected %*, got %*"):format(v_u_722, p724.ClassName)))
                end
            else
                return v_u_3.err(v_u_723, p724, (("expected %*, got %*"):format(v_u_722, (typeof(p724)))))
            end
        end,
        ["_format"] = function(p725, _, _)
            return v_u_2(v_u_722, p725[v_u_723])
        end
    }
    local v726 = v_u_4
    local v727 = v_u_723
    return setmetatable(v727, v726)
end
local v_u_728 = "Constraint"
function v5.Constraint()
    local v_u_729 = nil
    v_u_729 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p730)
            if typeof(p730) == "Instance" then
                if p730:IsA(v_u_728) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_729, p730, (("expected %*, got %*"):format(v_u_728, p730.ClassName)))
                end
            else
                return v_u_3.err(v_u_729, p730, (("expected %*, got %*"):format(v_u_728, (typeof(p730)))))
            end
        end,
        ["_format"] = function(p731, _, _)
            return v_u_2(v_u_728, p731[v_u_729])
        end
    }
    local v732 = v_u_4
    local v733 = v_u_729
    return setmetatable(v733, v732)
end
local v_u_734 = "AlignOrientation"
function v5.AlignOrientation()
    local v_u_735 = nil
    v_u_735 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p736)
            if typeof(p736) == "Instance" then
                if p736:IsA(v_u_734) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_735, p736, (("expected %*, got %*"):format(v_u_734, p736.ClassName)))
                end
            else
                return v_u_3.err(v_u_735, p736, (("expected %*, got %*"):format(v_u_734, (typeof(p736)))))
            end
        end,
        ["_format"] = function(p737, _, _)
            return v_u_2(v_u_734, p737[v_u_735])
        end
    }
    local v738 = v_u_4
    local v739 = v_u_735
    return setmetatable(v739, v738)
end
local v_u_740 = "AlignPosition"
function v5.AlignPosition()
    local v_u_741 = nil
    v_u_741 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p742)
            if typeof(p742) == "Instance" then
                if p742:IsA(v_u_740) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_741, p742, (("expected %*, got %*"):format(v_u_740, p742.ClassName)))
                end
            else
                return v_u_3.err(v_u_741, p742, (("expected %*, got %*"):format(v_u_740, (typeof(p742)))))
            end
        end,
        ["_format"] = function(p743, _, _)
            return v_u_2(v_u_740, p743[v_u_741])
        end
    }
    local v744 = v_u_4
    local v745 = v_u_741
    return setmetatable(v745, v744)
end
local v_u_746 = "AngularVelocity"
function v5.AngularVelocity()
    local v_u_747 = nil
    v_u_747 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p748)
            if typeof(p748) == "Instance" then
                if p748:IsA(v_u_746) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_747, p748, (("expected %*, got %*"):format(v_u_746, p748.ClassName)))
                end
            else
                return v_u_3.err(v_u_747, p748, (("expected %*, got %*"):format(v_u_746, (typeof(p748)))))
            end
        end,
        ["_format"] = function(p749, _, _)
            return v_u_2(v_u_746, p749[v_u_747])
        end
    }
    local v750 = v_u_4
    local v751 = v_u_747
    return setmetatable(v751, v750)
end
local v_u_752 = "AnimationConstraint"
function v5.AnimationConstraint()
    local v_u_753 = nil
    v_u_753 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p754)
            if typeof(p754) == "Instance" then
                if p754:IsA(v_u_752) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_753, p754, (("expected %*, got %*"):format(v_u_752, p754.ClassName)))
                end
            else
                return v_u_3.err(v_u_753, p754, (("expected %*, got %*"):format(v_u_752, (typeof(p754)))))
            end
        end,
        ["_format"] = function(p755, _, _)
            return v_u_2(v_u_752, p755[v_u_753])
        end
    }
    local v756 = v_u_4
    local v757 = v_u_753
    return setmetatable(v757, v756)
end
local v_u_758 = "BallSocketConstraint"
function v5.BallSocketConstraint()
    local v_u_759 = nil
    v_u_759 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p760)
            if typeof(p760) == "Instance" then
                if p760:IsA(v_u_758) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_759, p760, (("expected %*, got %*"):format(v_u_758, p760.ClassName)))
                end
            else
                return v_u_3.err(v_u_759, p760, (("expected %*, got %*"):format(v_u_758, (typeof(p760)))))
            end
        end,
        ["_format"] = function(p761, _, _)
            return v_u_2(v_u_758, p761[v_u_759])
        end
    }
    local v762 = v_u_4
    local v763 = v_u_759
    return setmetatable(v763, v762)
end
local v_u_764 = "HingeConstraint"
function v5.HingeConstraint()
    local v_u_765 = nil
    v_u_765 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p766)
            if typeof(p766) == "Instance" then
                if p766:IsA(v_u_764) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_765, p766, (("expected %*, got %*"):format(v_u_764, p766.ClassName)))
                end
            else
                return v_u_3.err(v_u_765, p766, (("expected %*, got %*"):format(v_u_764, (typeof(p766)))))
            end
        end,
        ["_format"] = function(p767, _, _)
            return v_u_2(v_u_764, p767[v_u_765])
        end
    }
    local v768 = v_u_4
    local v769 = v_u_765
    return setmetatable(v769, v768)
end
local v_u_770 = "LineForce"
function v5.LineForce()
    local v_u_771 = nil
    v_u_771 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p772)
            if typeof(p772) == "Instance" then
                if p772:IsA(v_u_770) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_771, p772, (("expected %*, got %*"):format(v_u_770, p772.ClassName)))
                end
            else
                return v_u_3.err(v_u_771, p772, (("expected %*, got %*"):format(v_u_770, (typeof(p772)))))
            end
        end,
        ["_format"] = function(p773, _, _)
            return v_u_2(v_u_770, p773[v_u_771])
        end
    }
    local v774 = v_u_4
    local v775 = v_u_771
    return setmetatable(v775, v774)
end
local v_u_776 = "LinearVelocity"
function v5.LinearVelocity()
    local v_u_777 = nil
    v_u_777 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p778)
            if typeof(p778) == "Instance" then
                if p778:IsA(v_u_776) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_777, p778, (("expected %*, got %*"):format(v_u_776, p778.ClassName)))
                end
            else
                return v_u_3.err(v_u_777, p778, (("expected %*, got %*"):format(v_u_776, (typeof(p778)))))
            end
        end,
        ["_format"] = function(p779, _, _)
            return v_u_2(v_u_776, p779[v_u_777])
        end
    }
    local v780 = v_u_4
    local v781 = v_u_777
    return setmetatable(v781, v780)
end
local v_u_782 = "PlaneConstraint"
function v5.PlaneConstraint()
    local v_u_783 = nil
    v_u_783 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p784)
            if typeof(p784) == "Instance" then
                if p784:IsA(v_u_782) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_783, p784, (("expected %*, got %*"):format(v_u_782, p784.ClassName)))
                end
            else
                return v_u_3.err(v_u_783, p784, (("expected %*, got %*"):format(v_u_782, (typeof(p784)))))
            end
        end,
        ["_format"] = function(p785, _, _)
            return v_u_2(v_u_782, p785[v_u_783])
        end
    }
    local v786 = v_u_4
    local v787 = v_u_783
    return setmetatable(v787, v786)
end
local v_u_788 = "Plane"
function v5.Plane()
    local v_u_789 = nil
    v_u_789 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p790)
            if typeof(p790) == "Instance" then
                if p790:IsA(v_u_788) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_789, p790, (("expected %*, got %*"):format(v_u_788, p790.ClassName)))
                end
            else
                return v_u_3.err(v_u_789, p790, (("expected %*, got %*"):format(v_u_788, (typeof(p790)))))
            end
        end,
        ["_format"] = function(p791, _, _)
            return v_u_2(v_u_788, p791[v_u_789])
        end
    }
    local v792 = v_u_4
    local v793 = v_u_789
    return setmetatable(v793, v792)
end
local v_u_794 = "RigidConstraint"
function v5.RigidConstraint()
    local v_u_795 = nil
    v_u_795 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p796)
            if typeof(p796) == "Instance" then
                if p796:IsA(v_u_794) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_795, p796, (("expected %*, got %*"):format(v_u_794, p796.ClassName)))
                end
            else
                return v_u_3.err(v_u_795, p796, (("expected %*, got %*"):format(v_u_794, (typeof(p796)))))
            end
        end,
        ["_format"] = function(p797, _, _)
            return v_u_2(v_u_794, p797[v_u_795])
        end
    }
    local v798 = v_u_4
    local v799 = v_u_795
    return setmetatable(v799, v798)
end
local v_u_800 = "RodConstraint"
function v5.RodConstraint()
    local v_u_801 = nil
    v_u_801 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p802)
            if typeof(p802) == "Instance" then
                if p802:IsA(v_u_800) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_801, p802, (("expected %*, got %*"):format(v_u_800, p802.ClassName)))
                end
            else
                return v_u_3.err(v_u_801, p802, (("expected %*, got %*"):format(v_u_800, (typeof(p802)))))
            end
        end,
        ["_format"] = function(p803, _, _)
            return v_u_2(v_u_800, p803[v_u_801])
        end
    }
    local v804 = v_u_4
    local v805 = v_u_801
    return setmetatable(v805, v804)
end
local v_u_806 = "RopeConstraint"
function v5.RopeConstraint()
    local v_u_807 = nil
    v_u_807 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p808)
            if typeof(p808) == "Instance" then
                if p808:IsA(v_u_806) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_807, p808, (("expected %*, got %*"):format(v_u_806, p808.ClassName)))
                end
            else
                return v_u_3.err(v_u_807, p808, (("expected %*, got %*"):format(v_u_806, (typeof(p808)))))
            end
        end,
        ["_format"] = function(p809, _, _)
            return v_u_2(v_u_806, p809[v_u_807])
        end
    }
    local v810 = v_u_4
    local v811 = v_u_807
    return setmetatable(v811, v810)
end
local v_u_812 = "SlidingBallConstraint"
function v5.SlidingBallConstraint()
    local v_u_813 = nil
    v_u_813 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p814)
            if typeof(p814) == "Instance" then
                if p814:IsA(v_u_812) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_813, p814, (("expected %*, got %*"):format(v_u_812, p814.ClassName)))
                end
            else
                return v_u_3.err(v_u_813, p814, (("expected %*, got %*"):format(v_u_812, (typeof(p814)))))
            end
        end,
        ["_format"] = function(p815, _, _)
            return v_u_2(v_u_812, p815[v_u_813])
        end
    }
    local v816 = v_u_4
    local v817 = v_u_813
    return setmetatable(v817, v816)
end
local v_u_818 = "CylindricalConstraint"
function v5.CylindricalConstraint()
    local v_u_819 = nil
    v_u_819 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p820)
            if typeof(p820) == "Instance" then
                if p820:IsA(v_u_818) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_819, p820, (("expected %*, got %*"):format(v_u_818, p820.ClassName)))
                end
            else
                return v_u_3.err(v_u_819, p820, (("expected %*, got %*"):format(v_u_818, (typeof(p820)))))
            end
        end,
        ["_format"] = function(p821, _, _)
            return v_u_2(v_u_818, p821[v_u_819])
        end
    }
    local v822 = v_u_4
    local v823 = v_u_819
    return setmetatable(v823, v822)
end
local v_u_824 = "PrismaticConstraint"
function v5.PrismaticConstraint()
    local v_u_825 = nil
    v_u_825 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p826)
            if typeof(p826) == "Instance" then
                if p826:IsA(v_u_824) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_825, p826, (("expected %*, got %*"):format(v_u_824, p826.ClassName)))
                end
            else
                return v_u_3.err(v_u_825, p826, (("expected %*, got %*"):format(v_u_824, (typeof(p826)))))
            end
        end,
        ["_format"] = function(p827, _, _)
            return v_u_2(v_u_824, p827[v_u_825])
        end
    }
    local v828 = v_u_4
    local v829 = v_u_825
    return setmetatable(v829, v828)
end
local v_u_830 = "SpringConstraint"
function v5.SpringConstraint()
    local v_u_831 = nil
    v_u_831 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p832)
            if typeof(p832) == "Instance" then
                if p832:IsA(v_u_830) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_831, p832, (("expected %*, got %*"):format(v_u_830, p832.ClassName)))
                end
            else
                return v_u_3.err(v_u_831, p832, (("expected %*, got %*"):format(v_u_830, (typeof(p832)))))
            end
        end,
        ["_format"] = function(p833, _, _)
            return v_u_2(v_u_830, p833[v_u_831])
        end
    }
    local v834 = v_u_4
    local v835 = v_u_831
    return setmetatable(v835, v834)
end
local v_u_836 = "Torque"
function v5.Torque()
    local v_u_837 = nil
    v_u_837 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p838)
            if typeof(p838) == "Instance" then
                if p838:IsA(v_u_836) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_837, p838, (("expected %*, got %*"):format(v_u_836, p838.ClassName)))
                end
            else
                return v_u_3.err(v_u_837, p838, (("expected %*, got %*"):format(v_u_836, (typeof(p838)))))
            end
        end,
        ["_format"] = function(p839, _, _)
            return v_u_2(v_u_836, p839[v_u_837])
        end
    }
    local v840 = v_u_4
    local v841 = v_u_837
    return setmetatable(v841, v840)
end
local v_u_842 = "TorsionSpringConstraint"
function v5.TorsionSpringConstraint()
    local v_u_843 = nil
    v_u_843 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p844)
            if typeof(p844) == "Instance" then
                if p844:IsA(v_u_842) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_843, p844, (("expected %*, got %*"):format(v_u_842, p844.ClassName)))
                end
            else
                return v_u_3.err(v_u_843, p844, (("expected %*, got %*"):format(v_u_842, (typeof(p844)))))
            end
        end,
        ["_format"] = function(p845, _, _)
            return v_u_2(v_u_842, p845[v_u_843])
        end
    }
    local v846 = v_u_4
    local v847 = v_u_843
    return setmetatable(v847, v846)
end
local v_u_848 = "UniversalConstraint"
function v5.UniversalConstraint()
    local v_u_849 = nil
    v_u_849 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p850)
            if typeof(p850) == "Instance" then
                if p850:IsA(v_u_848) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_849, p850, (("expected %*, got %*"):format(v_u_848, p850.ClassName)))
                end
            else
                return v_u_3.err(v_u_849, p850, (("expected %*, got %*"):format(v_u_848, (typeof(p850)))))
            end
        end,
        ["_format"] = function(p851, _, _)
            return v_u_2(v_u_848, p851[v_u_849])
        end
    }
    local v852 = v_u_4
    local v853 = v_u_849
    return setmetatable(v853, v852)
end
local v_u_854 = "VectorForce"
function v5.VectorForce()
    local v_u_855 = nil
    v_u_855 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p856)
            if typeof(p856) == "Instance" then
                if p856:IsA(v_u_854) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_855, p856, (("expected %*, got %*"):format(v_u_854, p856.ClassName)))
                end
            else
                return v_u_3.err(v_u_855, p856, (("expected %*, got %*"):format(v_u_854, (typeof(p856)))))
            end
        end,
        ["_format"] = function(p857, _, _)
            return v_u_2(v_u_854, p857[v_u_855])
        end
    }
    local v858 = v_u_4
    local v859 = v_u_855
    return setmetatable(v859, v858)
end
local v_u_860 = "ContentProvider"
function v5.ContentProvider()
    local v_u_861 = nil
    v_u_861 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p862)
            if typeof(p862) == "Instance" then
                if p862:IsA(v_u_860) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_861, p862, (("expected %*, got %*"):format(v_u_860, p862.ClassName)))
                end
            else
                return v_u_3.err(v_u_861, p862, (("expected %*, got %*"):format(v_u_860, (typeof(p862)))))
            end
        end,
        ["_format"] = function(p863, _, _)
            return v_u_2(v_u_860, p863[v_u_861])
        end
    }
    local v864 = v_u_4
    local v865 = v_u_861
    return setmetatable(v865, v864)
end
local v_u_866 = "ContextActionService"
function v5.ContextActionService()
    local v_u_867 = nil
    v_u_867 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p868)
            if typeof(p868) == "Instance" then
                if p868:IsA(v_u_866) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_867, p868, (("expected %*, got %*"):format(v_u_866, p868.ClassName)))
                end
            else
                return v_u_3.err(v_u_867, p868, (("expected %*, got %*"):format(v_u_866, (typeof(p868)))))
            end
        end,
        ["_format"] = function(p869, _, _)
            return v_u_2(v_u_866, p869[v_u_867])
        end
    }
    local v870 = v_u_4
    local v871 = v_u_867
    return setmetatable(v871, v870)
end
local v_u_872 = "Controller"
function v5.Controller()
    local v_u_873 = nil
    v_u_873 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p874)
            if typeof(p874) == "Instance" then
                if p874:IsA(v_u_872) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_873, p874, (("expected %*, got %*"):format(v_u_872, p874.ClassName)))
                end
            else
                return v_u_3.err(v_u_873, p874, (("expected %*, got %*"):format(v_u_872, (typeof(p874)))))
            end
        end,
        ["_format"] = function(p875, _, _)
            return v_u_2(v_u_872, p875[v_u_873])
        end
    }
    local v876 = v_u_4
    local v877 = v_u_873
    return setmetatable(v877, v876)
end
local v_u_878 = "HumanoidController"
function v5.HumanoidController()
    local v_u_879 = nil
    v_u_879 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p880)
            if typeof(p880) == "Instance" then
                if p880:IsA(v_u_878) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_879, p880, (("expected %*, got %*"):format(v_u_878, p880.ClassName)))
                end
            else
                return v_u_3.err(v_u_879, p880, (("expected %*, got %*"):format(v_u_878, (typeof(p880)))))
            end
        end,
        ["_format"] = function(p881, _, _)
            return v_u_2(v_u_878, p881[v_u_879])
        end
    }
    local v882 = v_u_4
    local v883 = v_u_879
    return setmetatable(v883, v882)
end
local v_u_884 = "SkateboardController"
function v5.SkateboardController()
    local v_u_885 = nil
    v_u_885 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p886)
            if typeof(p886) == "Instance" then
                if p886:IsA(v_u_884) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_885, p886, (("expected %*, got %*"):format(v_u_884, p886.ClassName)))
                end
            else
                return v_u_3.err(v_u_885, p886, (("expected %*, got %*"):format(v_u_884, (typeof(p886)))))
            end
        end,
        ["_format"] = function(p887, _, _)
            return v_u_2(v_u_884, p887[v_u_885])
        end
    }
    local v888 = v_u_4
    local v889 = v_u_885
    return setmetatable(v889, v888)
end
local v_u_890 = "VehicleController"
function v5.VehicleController()
    local v_u_891 = nil
    v_u_891 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p892)
            if typeof(p892) == "Instance" then
                if p892:IsA(v_u_890) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_891, p892, (("expected %*, got %*"):format(v_u_890, p892.ClassName)))
                end
            else
                return v_u_3.err(v_u_891, p892, (("expected %*, got %*"):format(v_u_890, (typeof(p892)))))
            end
        end,
        ["_format"] = function(p893, _, _)
            return v_u_2(v_u_890, p893[v_u_891])
        end
    }
    local v894 = v_u_4
    local v895 = v_u_891
    return setmetatable(v895, v894)
end
local v_u_896 = "ControllerBase"
function v5.ControllerBase()
    local v_u_897 = nil
    v_u_897 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p898)
            if typeof(p898) == "Instance" then
                if p898:IsA(v_u_896) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_897, p898, (("expected %*, got %*"):format(v_u_896, p898.ClassName)))
                end
            else
                return v_u_3.err(v_u_897, p898, (("expected %*, got %*"):format(v_u_896, (typeof(p898)))))
            end
        end,
        ["_format"] = function(p899, _, _)
            return v_u_2(v_u_896, p899[v_u_897])
        end
    }
    local v900 = v_u_4
    local v901 = v_u_897
    return setmetatable(v901, v900)
end
local v_u_902 = "AirController"
function v5.AirController()
    local v_u_903 = nil
    v_u_903 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p904)
            if typeof(p904) == "Instance" then
                if p904:IsA(v_u_902) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_903, p904, (("expected %*, got %*"):format(v_u_902, p904.ClassName)))
                end
            else
                return v_u_3.err(v_u_903, p904, (("expected %*, got %*"):format(v_u_902, (typeof(p904)))))
            end
        end,
        ["_format"] = function(p905, _, _)
            return v_u_2(v_u_902, p905[v_u_903])
        end
    }
    local v906 = v_u_4
    local v907 = v_u_903
    return setmetatable(v907, v906)
end
local v_u_908 = "ClimbController"
function v5.ClimbController()
    local v_u_909 = nil
    v_u_909 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p910)
            if typeof(p910) == "Instance" then
                if p910:IsA(v_u_908) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_909, p910, (("expected %*, got %*"):format(v_u_908, p910.ClassName)))
                end
            else
                return v_u_3.err(v_u_909, p910, (("expected %*, got %*"):format(v_u_908, (typeof(p910)))))
            end
        end,
        ["_format"] = function(p911, _, _)
            return v_u_2(v_u_908, p911[v_u_909])
        end
    }
    local v912 = v_u_4
    local v913 = v_u_909
    return setmetatable(v913, v912)
end
local v_u_914 = "GroundController"
function v5.GroundController()
    local v_u_915 = nil
    v_u_915 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p916)
            if typeof(p916) == "Instance" then
                if p916:IsA(v_u_914) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_915, p916, (("expected %*, got %*"):format(v_u_914, p916.ClassName)))
                end
            else
                return v_u_3.err(v_u_915, p916, (("expected %*, got %*"):format(v_u_914, (typeof(p916)))))
            end
        end,
        ["_format"] = function(p917, _, _)
            return v_u_2(v_u_914, p917[v_u_915])
        end
    }
    local v918 = v_u_4
    local v919 = v_u_915
    return setmetatable(v919, v918)
end
local v_u_920 = "SwimController"
function v5.SwimController()
    local v_u_921 = nil
    v_u_921 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p922)
            if typeof(p922) == "Instance" then
                if p922:IsA(v_u_920) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_921, p922, (("expected %*, got %*"):format(v_u_920, p922.ClassName)))
                end
            else
                return v_u_3.err(v_u_921, p922, (("expected %*, got %*"):format(v_u_920, (typeof(p922)))))
            end
        end,
        ["_format"] = function(p923, _, _)
            return v_u_2(v_u_920, p923[v_u_921])
        end
    }
    local v924 = v_u_4
    local v925 = v_u_921
    return setmetatable(v925, v924)
end
local v_u_926 = "ControllerManager"
function v5.ControllerManager()
    local v_u_927 = nil
    v_u_927 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p928)
            if typeof(p928) == "Instance" then
                if p928:IsA(v_u_926) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_927, p928, (("expected %*, got %*"):format(v_u_926, p928.ClassName)))
                end
            else
                return v_u_3.err(v_u_927, p928, (("expected %*, got %*"):format(v_u_926, (typeof(p928)))))
            end
        end,
        ["_format"] = function(p929, _, _)
            return v_u_2(v_u_926, p929[v_u_927])
        end
    }
    local v930 = v_u_4
    local v931 = v_u_927
    return setmetatable(v931, v930)
end
local v_u_932 = "ControllerService"
function v5.ControllerService()
    local v_u_933 = nil
    v_u_933 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p934)
            if typeof(p934) == "Instance" then
                if p934:IsA(v_u_932) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_933, p934, (("expected %*, got %*"):format(v_u_932, p934.ClassName)))
                end
            else
                return v_u_3.err(v_u_933, p934, (("expected %*, got %*"):format(v_u_932, (typeof(p934)))))
            end
        end,
        ["_format"] = function(p935, _, _)
            return v_u_2(v_u_932, p935[v_u_933])
        end
    }
    local v936 = v_u_4
    local v937 = v_u_933
    return setmetatable(v937, v936)
end
local v_u_938 = "CookiesService"
function v5.CookiesService()
    local v_u_939 = nil
    v_u_939 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p940)
            if typeof(p940) == "Instance" then
                if p940:IsA(v_u_938) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_939, p940, (("expected %*, got %*"):format(v_u_938, p940.ClassName)))
                end
            else
                return v_u_3.err(v_u_939, p940, (("expected %*, got %*"):format(v_u_938, (typeof(p940)))))
            end
        end,
        ["_format"] = function(p941, _, _)
            return v_u_2(v_u_938, p941[v_u_939])
        end
    }
    local v942 = v_u_4
    local v943 = v_u_939
    return setmetatable(v943, v942)
end
local v_u_944 = "CorePackages"
function v5.CorePackages()
    local v_u_945 = nil
    v_u_945 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p946)
            if typeof(p946) == "Instance" then
                if p946:IsA(v_u_944) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_945, p946, (("expected %*, got %*"):format(v_u_944, p946.ClassName)))
                end
            else
                return v_u_3.err(v_u_945, p946, (("expected %*, got %*"):format(v_u_944, (typeof(p946)))))
            end
        end,
        ["_format"] = function(p947, _, _)
            return v_u_2(v_u_944, p947[v_u_945])
        end
    }
    local v948 = v_u_4
    local v949 = v_u_945
    return setmetatable(v949, v948)
end
local v_u_950 = "CoreScriptDebuggingManagerHelper"
function v5.CoreScriptDebuggingManagerHelper()
    local v_u_951 = nil
    v_u_951 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p952)
            if typeof(p952) == "Instance" then
                if p952:IsA(v_u_950) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_951, p952, (("expected %*, got %*"):format(v_u_950, p952.ClassName)))
                end
            else
                return v_u_3.err(v_u_951, p952, (("expected %*, got %*"):format(v_u_950, (typeof(p952)))))
            end
        end,
        ["_format"] = function(p953, _, _)
            return v_u_2(v_u_950, p953[v_u_951])
        end
    }
    local v954 = v_u_4
    local v955 = v_u_951
    return setmetatable(v955, v954)
end
local v_u_956 = "CoreScriptSyncService"
function v5.CoreScriptSyncService()
    local v_u_957 = nil
    v_u_957 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p958)
            if typeof(p958) == "Instance" then
                if p958:IsA(v_u_956) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_957, p958, (("expected %*, got %*"):format(v_u_956, p958.ClassName)))
                end
            else
                return v_u_3.err(v_u_957, p958, (("expected %*, got %*"):format(v_u_956, (typeof(p958)))))
            end
        end,
        ["_format"] = function(p959, _, _)
            return v_u_2(v_u_956, p959[v_u_957])
        end
    }
    local v960 = v_u_4
    local v961 = v_u_957
    return setmetatable(v961, v960)
end
local v_u_962 = "CreationDBService"
function v5.CreationDBService()
    local v_u_963 = nil
    v_u_963 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p964)
            if typeof(p964) == "Instance" then
                if p964:IsA(v_u_962) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_963, p964, (("expected %*, got %*"):format(v_u_962, p964.ClassName)))
                end
            else
                return v_u_3.err(v_u_963, p964, (("expected %*, got %*"):format(v_u_962, (typeof(p964)))))
            end
        end,
        ["_format"] = function(p965, _, _)
            return v_u_2(v_u_962, p965[v_u_963])
        end
    }
    local v966 = v_u_4
    local v967 = v_u_963
    return setmetatable(v967, v966)
end
local v_u_968 = "CrossDMScriptChangeListener"
function v5.CrossDMScriptChangeListener()
    local v_u_969 = nil
    v_u_969 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p970)
            if typeof(p970) == "Instance" then
                if p970:IsA(v_u_968) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_969, p970, (("expected %*, got %*"):format(v_u_968, p970.ClassName)))
                end
            else
                return v_u_3.err(v_u_969, p970, (("expected %*, got %*"):format(v_u_968, (typeof(p970)))))
            end
        end,
        ["_format"] = function(p971, _, _)
            return v_u_2(v_u_968, p971[v_u_969])
        end
    }
    local v972 = v_u_4
    local v973 = v_u_969
    return setmetatable(v973, v972)
end
local v_u_974 = "CustomEvent"
function v5.CustomEvent()
    local v_u_975 = nil
    v_u_975 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p976)
            if typeof(p976) == "Instance" then
                if p976:IsA(v_u_974) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_975, p976, (("expected %*, got %*"):format(v_u_974, p976.ClassName)))
                end
            else
                return v_u_3.err(v_u_975, p976, (("expected %*, got %*"):format(v_u_974, (typeof(p976)))))
            end
        end,
        ["_format"] = function(p977, _, _)
            return v_u_2(v_u_974, p977[v_u_975])
        end
    }
    local v978 = v_u_4
    local v979 = v_u_975
    return setmetatable(v979, v978)
end
local v_u_980 = "CustomEventReceiver"
function v5.CustomEventReceiver()
    local v_u_981 = nil
    v_u_981 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p982)
            if typeof(p982) == "Instance" then
                if p982:IsA(v_u_980) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_981, p982, (("expected %*, got %*"):format(v_u_980, p982.ClassName)))
                end
            else
                return v_u_3.err(v_u_981, p982, (("expected %*, got %*"):format(v_u_980, (typeof(p982)))))
            end
        end,
        ["_format"] = function(p983, _, _)
            return v_u_2(v_u_980, p983[v_u_981])
        end
    }
    local v984 = v_u_4
    local v985 = v_u_981
    return setmetatable(v985, v984)
end
local v_u_986 = "DataModelMesh"
function v5.DataModelMesh()
    local v_u_987 = nil
    v_u_987 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p988)
            if typeof(p988) == "Instance" then
                if p988:IsA(v_u_986) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_987, p988, (("expected %*, got %*"):format(v_u_986, p988.ClassName)))
                end
            else
                return v_u_3.err(v_u_987, p988, (("expected %*, got %*"):format(v_u_986, (typeof(p988)))))
            end
        end,
        ["_format"] = function(p989, _, _)
            return v_u_2(v_u_986, p989[v_u_987])
        end
    }
    local v990 = v_u_4
    local v991 = v_u_987
    return setmetatable(v991, v990)
end
local v_u_992 = "BevelMesh"
function v5.BevelMesh()
    local v_u_993 = nil
    v_u_993 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p994)
            if typeof(p994) == "Instance" then
                if p994:IsA(v_u_992) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_993, p994, (("expected %*, got %*"):format(v_u_992, p994.ClassName)))
                end
            else
                return v_u_3.err(v_u_993, p994, (("expected %*, got %*"):format(v_u_992, (typeof(p994)))))
            end
        end,
        ["_format"] = function(p995, _, _)
            return v_u_2(v_u_992, p995[v_u_993])
        end
    }
    local v996 = v_u_4
    local v997 = v_u_993
    return setmetatable(v997, v996)
end
local v_u_998 = "CylinderMesh"
function v5.CylinderMesh()
    local v_u_999 = nil
    v_u_999 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1000)
            if typeof(p1000) == "Instance" then
                if p1000:IsA(v_u_998) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_999, p1000, (("expected %*, got %*"):format(v_u_998, p1000.ClassName)))
                end
            else
                return v_u_3.err(v_u_999, p1000, (("expected %*, got %*"):format(v_u_998, (typeof(p1000)))))
            end
        end,
        ["_format"] = function(p1001, _, _)
            return v_u_2(v_u_998, p1001[v_u_999])
        end
    }
    local v1002 = v_u_4
    local v1003 = v_u_999
    return setmetatable(v1003, v1002)
end
local v_u_1004 = "EditableMesh"
function v5.EditableMesh()
    local v_u_1005 = nil
    v_u_1005 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1006)
            if typeof(p1006) == "Instance" then
                if p1006:IsA(v_u_1004) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1005, p1006, (("expected %*, got %*"):format(v_u_1004, p1006.ClassName)))
                end
            else
                return v_u_3.err(v_u_1005, p1006, (("expected %*, got %*"):format(v_u_1004, (typeof(p1006)))))
            end
        end,
        ["_format"] = function(p1007, _, _)
            return v_u_2(v_u_1004, p1007[v_u_1005])
        end
    }
    local v1008 = v_u_4
    local v1009 = v_u_1005
    return setmetatable(v1009, v1008)
end
local v_u_1010 = "FileMesh"
function v5.FileMesh()
    local v_u_1011 = nil
    v_u_1011 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1012)
            if typeof(p1012) == "Instance" then
                if p1012:IsA(v_u_1010) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1011, p1012, (("expected %*, got %*"):format(v_u_1010, p1012.ClassName)))
                end
            else
                return v_u_3.err(v_u_1011, p1012, (("expected %*, got %*"):format(v_u_1010, (typeof(p1012)))))
            end
        end,
        ["_format"] = function(p1013, _, _)
            return v_u_2(v_u_1010, p1013[v_u_1011])
        end
    }
    local v1014 = v_u_4
    local v1015 = v_u_1011
    return setmetatable(v1015, v1014)
end
local v_u_1016 = "SpecialMesh"
function v5.SpecialMesh()
    local v_u_1017 = nil
    v_u_1017 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1018)
            if typeof(p1018) == "Instance" then
                if p1018:IsA(v_u_1016) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1017, p1018, (("expected %*, got %*"):format(v_u_1016, p1018.ClassName)))
                end
            else
                return v_u_3.err(v_u_1017, p1018, (("expected %*, got %*"):format(v_u_1016, (typeof(p1018)))))
            end
        end,
        ["_format"] = function(p1019, _, _)
            return v_u_2(v_u_1016, p1019[v_u_1017])
        end
    }
    local v1020 = v_u_4
    local v1021 = v_u_1017
    return setmetatable(v1021, v1020)
end
local v_u_1022 = "DataModelPatchService"
function v5.DataModelPatchService()
    local v_u_1023 = nil
    v_u_1023 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1024)
            if typeof(p1024) == "Instance" then
                if p1024:IsA(v_u_1022) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1023, p1024, (("expected %*, got %*"):format(v_u_1022, p1024.ClassName)))
                end
            else
                return v_u_3.err(v_u_1023, p1024, (("expected %*, got %*"):format(v_u_1022, (typeof(p1024)))))
            end
        end,
        ["_format"] = function(p1025, _, _)
            return v_u_2(v_u_1022, p1025[v_u_1023])
        end
    }
    local v1026 = v_u_4
    local v1027 = v_u_1023
    return setmetatable(v1027, v1026)
end
local v_u_1028 = "DataModelSession"
function v5.DataModelSession()
    local v_u_1029 = nil
    v_u_1029 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1030)
            if typeof(p1030) == "Instance" then
                if p1030:IsA(v_u_1028) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1029, p1030, (("expected %*, got %*"):format(v_u_1028, p1030.ClassName)))
                end
            else
                return v_u_3.err(v_u_1029, p1030, (("expected %*, got %*"):format(v_u_1028, (typeof(p1030)))))
            end
        end,
        ["_format"] = function(p1031, _, _)
            return v_u_2(v_u_1028, p1031[v_u_1029])
        end
    }
    local v1032 = v_u_4
    local v1033 = v_u_1029
    return setmetatable(v1033, v1032)
end
local v_u_1034 = "DataStoreGetOptions"
function v5.DataStoreGetOptions()
    local v_u_1035 = nil
    v_u_1035 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1036)
            if typeof(p1036) == "Instance" then
                if p1036:IsA(v_u_1034) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1035, p1036, (("expected %*, got %*"):format(v_u_1034, p1036.ClassName)))
                end
            else
                return v_u_3.err(v_u_1035, p1036, (("expected %*, got %*"):format(v_u_1034, (typeof(p1036)))))
            end
        end,
        ["_format"] = function(p1037, _, _)
            return v_u_2(v_u_1034, p1037[v_u_1035])
        end
    }
    local v1038 = v_u_4
    local v1039 = v_u_1035
    return setmetatable(v1039, v1038)
end
local v_u_1040 = "DataStoreIncrementOptions"
function v5.DataStoreIncrementOptions()
    local v_u_1041 = nil
    v_u_1041 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1042)
            if typeof(p1042) == "Instance" then
                if p1042:IsA(v_u_1040) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1041, p1042, (("expected %*, got %*"):format(v_u_1040, p1042.ClassName)))
                end
            else
                return v_u_3.err(v_u_1041, p1042, (("expected %*, got %*"):format(v_u_1040, (typeof(p1042)))))
            end
        end,
        ["_format"] = function(p1043, _, _)
            return v_u_2(v_u_1040, p1043[v_u_1041])
        end
    }
    local v1044 = v_u_4
    local v1045 = v_u_1041
    return setmetatable(v1045, v1044)
end
local v_u_1046 = "DataStoreInfo"
function v5.DataStoreInfo()
    local v_u_1047 = nil
    v_u_1047 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1048)
            if typeof(p1048) == "Instance" then
                if p1048:IsA(v_u_1046) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1047, p1048, (("expected %*, got %*"):format(v_u_1046, p1048.ClassName)))
                end
            else
                return v_u_3.err(v_u_1047, p1048, (("expected %*, got %*"):format(v_u_1046, (typeof(p1048)))))
            end
        end,
        ["_format"] = function(p1049, _, _)
            return v_u_2(v_u_1046, p1049[v_u_1047])
        end
    }
    local v1050 = v_u_4
    local v1051 = v_u_1047
    return setmetatable(v1051, v1050)
end
local v_u_1052 = "DataStoreKey"
function v5.DataStoreKey()
    local v_u_1053 = nil
    v_u_1053 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1054)
            if typeof(p1054) == "Instance" then
                if p1054:IsA(v_u_1052) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1053, p1054, (("expected %*, got %*"):format(v_u_1052, p1054.ClassName)))
                end
            else
                return v_u_3.err(v_u_1053, p1054, (("expected %*, got %*"):format(v_u_1052, (typeof(p1054)))))
            end
        end,
        ["_format"] = function(p1055, _, _)
            return v_u_2(v_u_1052, p1055[v_u_1053])
        end
    }
    local v1056 = v_u_4
    local v1057 = v_u_1053
    return setmetatable(v1057, v1056)
end
local v_u_1058 = "DataStoreKeyInfo"
function v5.DataStoreKeyInfo()
    local v_u_1059 = nil
    v_u_1059 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1060)
            if typeof(p1060) == "Instance" then
                if p1060:IsA(v_u_1058) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1059, p1060, (("expected %*, got %*"):format(v_u_1058, p1060.ClassName)))
                end
            else
                return v_u_3.err(v_u_1059, p1060, (("expected %*, got %*"):format(v_u_1058, (typeof(p1060)))))
            end
        end,
        ["_format"] = function(p1061, _, _)
            return v_u_2(v_u_1058, p1061[v_u_1059])
        end
    }
    local v1062 = v_u_4
    local v1063 = v_u_1059
    return setmetatable(v1063, v1062)
end
local v_u_1064 = "DataStoreObjectVersionInfo"
function v5.DataStoreObjectVersionInfo()
    local v_u_1065 = nil
    v_u_1065 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1066)
            if typeof(p1066) == "Instance" then
                if p1066:IsA(v_u_1064) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1065, p1066, (("expected %*, got %*"):format(v_u_1064, p1066.ClassName)))
                end
            else
                return v_u_3.err(v_u_1065, p1066, (("expected %*, got %*"):format(v_u_1064, (typeof(p1066)))))
            end
        end,
        ["_format"] = function(p1067, _, _)
            return v_u_2(v_u_1064, p1067[v_u_1065])
        end
    }
    local v1068 = v_u_4
    local v1069 = v_u_1065
    return setmetatable(v1069, v1068)
end
local v_u_1070 = "DataStoreOptions"
function v5.DataStoreOptions()
    local v_u_1071 = nil
    v_u_1071 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1072)
            if typeof(p1072) == "Instance" then
                if p1072:IsA(v_u_1070) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1071, p1072, (("expected %*, got %*"):format(v_u_1070, p1072.ClassName)))
                end
            else
                return v_u_3.err(v_u_1071, p1072, (("expected %*, got %*"):format(v_u_1070, (typeof(p1072)))))
            end
        end,
        ["_format"] = function(p1073, _, _)
            return v_u_2(v_u_1070, p1073[v_u_1071])
        end
    }
    local v1074 = v_u_4
    local v1075 = v_u_1071
    return setmetatable(v1075, v1074)
end
local v_u_1076 = "DataStoreService"
function v5.DataStoreService()
    local v_u_1077 = nil
    v_u_1077 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1078)
            if typeof(p1078) == "Instance" then
                if p1078:IsA(v_u_1076) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1077, p1078, (("expected %*, got %*"):format(v_u_1076, p1078.ClassName)))
                end
            else
                return v_u_3.err(v_u_1077, p1078, (("expected %*, got %*"):format(v_u_1076, (typeof(p1078)))))
            end
        end,
        ["_format"] = function(p1079, _, _)
            return v_u_2(v_u_1076, p1079[v_u_1077])
        end
    }
    local v1080 = v_u_4
    local v1081 = v_u_1077
    return setmetatable(v1081, v1080)
end
local v_u_1082 = "DataStoreSetOptions"
function v5.DataStoreSetOptions()
    local v_u_1083 = nil
    v_u_1083 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1084)
            if typeof(p1084) == "Instance" then
                if p1084:IsA(v_u_1082) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1083, p1084, (("expected %*, got %*"):format(v_u_1082, p1084.ClassName)))
                end
            else
                return v_u_3.err(v_u_1083, p1084, (("expected %*, got %*"):format(v_u_1082, (typeof(p1084)))))
            end
        end,
        ["_format"] = function(p1085, _, _)
            return v_u_2(v_u_1082, p1085[v_u_1083])
        end
    }
    local v1086 = v_u_4
    local v1087 = v_u_1083
    return setmetatable(v1087, v1086)
end
local v_u_1088 = "Debris"
function v5.Debris()
    local v_u_1089 = nil
    v_u_1089 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1090)
            if typeof(p1090) == "Instance" then
                if p1090:IsA(v_u_1088) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1089, p1090, (("expected %*, got %*"):format(v_u_1088, p1090.ClassName)))
                end
            else
                return v_u_3.err(v_u_1089, p1090, (("expected %*, got %*"):format(v_u_1088, (typeof(p1090)))))
            end
        end,
        ["_format"] = function(p1091, _, _)
            return v_u_2(v_u_1088, p1091[v_u_1089])
        end
    }
    local v1092 = v_u_4
    local v1093 = v_u_1089
    return setmetatable(v1093, v1092)
end
local v_u_1094 = "DebugSettings"
function v5.DebugSettings()
    local v_u_1095 = nil
    v_u_1095 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1096)
            if typeof(p1096) == "Instance" then
                if p1096:IsA(v_u_1094) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1095, p1096, (("expected %*, got %*"):format(v_u_1094, p1096.ClassName)))
                end
            else
                return v_u_3.err(v_u_1095, p1096, (("expected %*, got %*"):format(v_u_1094, (typeof(p1096)))))
            end
        end,
        ["_format"] = function(p1097, _, _)
            return v_u_2(v_u_1094, p1097[v_u_1095])
        end
    }
    local v1098 = v_u_4
    local v1099 = v_u_1095
    return setmetatable(v1099, v1098)
end
local v_u_1100 = "DebuggablePluginWatcher"
function v5.DebuggablePluginWatcher()
    local v_u_1101 = nil
    v_u_1101 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1102)
            if typeof(p1102) == "Instance" then
                if p1102:IsA(v_u_1100) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1101, p1102, (("expected %*, got %*"):format(v_u_1100, p1102.ClassName)))
                end
            else
                return v_u_3.err(v_u_1101, p1102, (("expected %*, got %*"):format(v_u_1100, (typeof(p1102)))))
            end
        end,
        ["_format"] = function(p1103, _, _)
            return v_u_2(v_u_1100, p1103[v_u_1101])
        end
    }
    local v1104 = v_u_4
    local v1105 = v_u_1101
    return setmetatable(v1105, v1104)
end
local v_u_1106 = "DebuggerBreakpoint"
function v5.DebuggerBreakpoint()
    local v_u_1107 = nil
    v_u_1107 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1108)
            if typeof(p1108) == "Instance" then
                if p1108:IsA(v_u_1106) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1107, p1108, (("expected %*, got %*"):format(v_u_1106, p1108.ClassName)))
                end
            else
                return v_u_3.err(v_u_1107, p1108, (("expected %*, got %*"):format(v_u_1106, (typeof(p1108)))))
            end
        end,
        ["_format"] = function(p1109, _, _)
            return v_u_2(v_u_1106, p1109[v_u_1107])
        end
    }
    local v1110 = v_u_4
    local v1111 = v_u_1107
    return setmetatable(v1111, v1110)
end
local v_u_1112 = "DebuggerConnection"
function v5.DebuggerConnection()
    local v_u_1113 = nil
    v_u_1113 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1114)
            if typeof(p1114) == "Instance" then
                if p1114:IsA(v_u_1112) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1113, p1114, (("expected %*, got %*"):format(v_u_1112, p1114.ClassName)))
                end
            else
                return v_u_3.err(v_u_1113, p1114, (("expected %*, got %*"):format(v_u_1112, (typeof(p1114)))))
            end
        end,
        ["_format"] = function(p1115, _, _)
            return v_u_2(v_u_1112, p1115[v_u_1113])
        end
    }
    local v1116 = v_u_4
    local v1117 = v_u_1113
    return setmetatable(v1117, v1116)
end
local v_u_1118 = "LocalDebuggerConnection"
function v5.LocalDebuggerConnection()
    local v_u_1119 = nil
    v_u_1119 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1120)
            if typeof(p1120) == "Instance" then
                if p1120:IsA(v_u_1118) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1119, p1120, (("expected %*, got %*"):format(v_u_1118, p1120.ClassName)))
                end
            else
                return v_u_3.err(v_u_1119, p1120, (("expected %*, got %*"):format(v_u_1118, (typeof(p1120)))))
            end
        end,
        ["_format"] = function(p1121, _, _)
            return v_u_2(v_u_1118, p1121[v_u_1119])
        end
    }
    local v1122 = v_u_4
    local v1123 = v_u_1119
    return setmetatable(v1123, v1122)
end
local v_u_1124 = "DebuggerConnectionManager"
function v5.DebuggerConnectionManager()
    local v_u_1125 = nil
    v_u_1125 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1126)
            if typeof(p1126) == "Instance" then
                if p1126:IsA(v_u_1124) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1125, p1126, (("expected %*, got %*"):format(v_u_1124, p1126.ClassName)))
                end
            else
                return v_u_3.err(v_u_1125, p1126, (("expected %*, got %*"):format(v_u_1124, (typeof(p1126)))))
            end
        end,
        ["_format"] = function(p1127, _, _)
            return v_u_2(v_u_1124, p1127[v_u_1125])
        end
    }
    local v1128 = v_u_4
    local v1129 = v_u_1125
    return setmetatable(v1129, v1128)
end
local v_u_1130 = "DebuggerLuaResponse"
function v5.DebuggerLuaResponse()
    local v_u_1131 = nil
    v_u_1131 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1132)
            if typeof(p1132) == "Instance" then
                if p1132:IsA(v_u_1130) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1131, p1132, (("expected %*, got %*"):format(v_u_1130, p1132.ClassName)))
                end
            else
                return v_u_3.err(v_u_1131, p1132, (("expected %*, got %*"):format(v_u_1130, (typeof(p1132)))))
            end
        end,
        ["_format"] = function(p1133, _, _)
            return v_u_2(v_u_1130, p1133[v_u_1131])
        end
    }
    local v1134 = v_u_4
    local v1135 = v_u_1131
    return setmetatable(v1135, v1134)
end
local v_u_1136 = "DebuggerManager"
function v5.DebuggerManager()
    local v_u_1137 = nil
    v_u_1137 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1138)
            if typeof(p1138) == "Instance" then
                if p1138:IsA(v_u_1136) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1137, p1138, (("expected %*, got %*"):format(v_u_1136, p1138.ClassName)))
                end
            else
                return v_u_3.err(v_u_1137, p1138, (("expected %*, got %*"):format(v_u_1136, (typeof(p1138)))))
            end
        end,
        ["_format"] = function(p1139, _, _)
            return v_u_2(v_u_1136, p1139[v_u_1137])
        end
    }
    local v1140 = v_u_4
    local v1141 = v_u_1137
    return setmetatable(v1141, v1140)
end
local v_u_1142 = "DebuggerUIService"
function v5.DebuggerUIService()
    local v_u_1143 = nil
    v_u_1143 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1144)
            if typeof(p1144) == "Instance" then
                if p1144:IsA(v_u_1142) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1143, p1144, (("expected %*, got %*"):format(v_u_1142, p1144.ClassName)))
                end
            else
                return v_u_3.err(v_u_1143, p1144, (("expected %*, got %*"):format(v_u_1142, (typeof(p1144)))))
            end
        end,
        ["_format"] = function(p1145, _, _)
            return v_u_2(v_u_1142, p1145[v_u_1143])
        end
    }
    local v1146 = v_u_4
    local v1147 = v_u_1143
    return setmetatable(v1147, v1146)
end
local v_u_1148 = "DebuggerVariable"
function v5.DebuggerVariable()
    local v_u_1149 = nil
    v_u_1149 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1150)
            if typeof(p1150) == "Instance" then
                if p1150:IsA(v_u_1148) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1149, p1150, (("expected %*, got %*"):format(v_u_1148, p1150.ClassName)))
                end
            else
                return v_u_3.err(v_u_1149, p1150, (("expected %*, got %*"):format(v_u_1148, (typeof(p1150)))))
            end
        end,
        ["_format"] = function(p1151, _, _)
            return v_u_2(v_u_1148, p1151[v_u_1149])
        end
    }
    local v1152 = v_u_4
    local v1153 = v_u_1149
    return setmetatable(v1153, v1152)
end
local v_u_1154 = "DebuggerWatch"
function v5.DebuggerWatch()
    local v_u_1155 = nil
    v_u_1155 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1156)
            if typeof(p1156) == "Instance" then
                if p1156:IsA(v_u_1154) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1155, p1156, (("expected %*, got %*"):format(v_u_1154, p1156.ClassName)))
                end
            else
                return v_u_3.err(v_u_1155, p1156, (("expected %*, got %*"):format(v_u_1154, (typeof(p1156)))))
            end
        end,
        ["_format"] = function(p1157, _, _)
            return v_u_2(v_u_1154, p1157[v_u_1155])
        end
    }
    local v1158 = v_u_4
    local v1159 = v_u_1155
    return setmetatable(v1159, v1158)
end
local v_u_1160 = "DeviceIdService"
function v5.DeviceIdService()
    local v_u_1161 = nil
    v_u_1161 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1162)
            if typeof(p1162) == "Instance" then
                if p1162:IsA(v_u_1160) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1161, p1162, (("expected %*, got %*"):format(v_u_1160, p1162.ClassName)))
                end
            else
                return v_u_3.err(v_u_1161, p1162, (("expected %*, got %*"):format(v_u_1160, (typeof(p1162)))))
            end
        end,
        ["_format"] = function(p1163, _, _)
            return v_u_2(v_u_1160, p1163[v_u_1161])
        end
    }
    local v1164 = v_u_4
    local v1165 = v_u_1161
    return setmetatable(v1165, v1164)
end
local v_u_1166 = "Dialog"
function v5.Dialog()
    local v_u_1167 = nil
    v_u_1167 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1168)
            if typeof(p1168) == "Instance" then
                if p1168:IsA(v_u_1166) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1167, p1168, (("expected %*, got %*"):format(v_u_1166, p1168.ClassName)))
                end
            else
                return v_u_3.err(v_u_1167, p1168, (("expected %*, got %*"):format(v_u_1166, (typeof(p1168)))))
            end
        end,
        ["_format"] = function(p1169, _, _)
            return v_u_2(v_u_1166, p1169[v_u_1167])
        end
    }
    local v1170 = v_u_4
    local v1171 = v_u_1167
    return setmetatable(v1171, v1170)
end
local v_u_1172 = "DialogChoice"
function v5.DialogChoice()
    local v_u_1173 = nil
    v_u_1173 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1174)
            if typeof(p1174) == "Instance" then
                if p1174:IsA(v_u_1172) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1173, p1174, (("expected %*, got %*"):format(v_u_1172, p1174.ClassName)))
                end
            else
                return v_u_3.err(v_u_1173, p1174, (("expected %*, got %*"):format(v_u_1172, (typeof(p1174)))))
            end
        end,
        ["_format"] = function(p1175, _, _)
            return v_u_2(v_u_1172, p1175[v_u_1173])
        end
    }
    local v1176 = v_u_4
    local v1177 = v_u_1173
    return setmetatable(v1177, v1176)
end
local v_u_1178 = "DraftsService"
function v5.DraftsService()
    local v_u_1179 = nil
    v_u_1179 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1180)
            if typeof(p1180) == "Instance" then
                if p1180:IsA(v_u_1178) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1179, p1180, (("expected %*, got %*"):format(v_u_1178, p1180.ClassName)))
                end
            else
                return v_u_3.err(v_u_1179, p1180, (("expected %*, got %*"):format(v_u_1178, (typeof(p1180)))))
            end
        end,
        ["_format"] = function(p1181, _, _)
            return v_u_2(v_u_1178, p1181[v_u_1179])
        end
    }
    local v1182 = v_u_4
    local v1183 = v_u_1179
    return setmetatable(v1183, v1182)
end
local v_u_1184 = "Dragger"
function v5.Dragger()
    local v_u_1185 = nil
    v_u_1185 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1186)
            if typeof(p1186) == "Instance" then
                if p1186:IsA(v_u_1184) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1185, p1186, (("expected %*, got %*"):format(v_u_1184, p1186.ClassName)))
                end
            else
                return v_u_3.err(v_u_1185, p1186, (("expected %*, got %*"):format(v_u_1184, (typeof(p1186)))))
            end
        end,
        ["_format"] = function(p1187, _, _)
            return v_u_2(v_u_1184, p1187[v_u_1185])
        end
    }
    local v1188 = v_u_4
    local v1189 = v_u_1185
    return setmetatable(v1189, v1188)
end
local v_u_1190 = "DraggerService"
function v5.DraggerService()
    local v_u_1191 = nil
    v_u_1191 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1192)
            if typeof(p1192) == "Instance" then
                if p1192:IsA(v_u_1190) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1191, p1192, (("expected %*, got %*"):format(v_u_1190, p1192.ClassName)))
                end
            else
                return v_u_3.err(v_u_1191, p1192, (("expected %*, got %*"):format(v_u_1190, (typeof(p1192)))))
            end
        end,
        ["_format"] = function(p1193, _, _)
            return v_u_2(v_u_1190, p1193[v_u_1191])
        end
    }
    local v1194 = v_u_4
    local v1195 = v_u_1191
    return setmetatable(v1195, v1194)
end
local v_u_1196 = "EditableImage"
function v5.EditableImage()
    local v_u_1197 = nil
    v_u_1197 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1198)
            if typeof(p1198) == "Instance" then
                if p1198:IsA(v_u_1196) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1197, p1198, (("expected %*, got %*"):format(v_u_1196, p1198.ClassName)))
                end
            else
                return v_u_3.err(v_u_1197, p1198, (("expected %*, got %*"):format(v_u_1196, (typeof(p1198)))))
            end
        end,
        ["_format"] = function(p1199, _, _)
            return v_u_2(v_u_1196, p1199[v_u_1197])
        end
    }
    local v1200 = v_u_4
    local v1201 = v_u_1197
    return setmetatable(v1201, v1200)
end
local v_u_1202 = "EngineAPICloudProcessingService"
function v5.EngineAPICloudProcessingService()
    local v_u_1203 = nil
    v_u_1203 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1204)
            if typeof(p1204) == "Instance" then
                if p1204:IsA(v_u_1202) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1203, p1204, (("expected %*, got %*"):format(v_u_1202, p1204.ClassName)))
                end
            else
                return v_u_3.err(v_u_1203, p1204, (("expected %*, got %*"):format(v_u_1202, (typeof(p1204)))))
            end
        end,
        ["_format"] = function(p1205, _, _)
            return v_u_2(v_u_1202, p1205[v_u_1203])
        end
    }
    local v1206 = v_u_4
    local v1207 = v_u_1203
    return setmetatable(v1207, v1206)
end
local v_u_1208 = "EulerRotationCurve"
function v5.EulerRotationCurve()
    local v_u_1209 = nil
    v_u_1209 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1210)
            if typeof(p1210) == "Instance" then
                if p1210:IsA(v_u_1208) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1209, p1210, (("expected %*, got %*"):format(v_u_1208, p1210.ClassName)))
                end
            else
                return v_u_3.err(v_u_1209, p1210, (("expected %*, got %*"):format(v_u_1208, (typeof(p1210)))))
            end
        end,
        ["_format"] = function(p1211, _, _)
            return v_u_2(v_u_1208, p1211[v_u_1209])
        end
    }
    local v1212 = v_u_4
    local v1213 = v_u_1209
    return setmetatable(v1213, v1212)
end
local v_u_1214 = "EventIngestService"
function v5.EventIngestService()
    local v_u_1215 = nil
    v_u_1215 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1216)
            if typeof(p1216) == "Instance" then
                if p1216:IsA(v_u_1214) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1215, p1216, (("expected %*, got %*"):format(v_u_1214, p1216.ClassName)))
                end
            else
                return v_u_3.err(v_u_1215, p1216, (("expected %*, got %*"):format(v_u_1214, (typeof(p1216)))))
            end
        end,
        ["_format"] = function(p1217, _, _)
            return v_u_2(v_u_1214, p1217[v_u_1215])
        end
    }
    local v1218 = v_u_4
    local v1219 = v_u_1215
    return setmetatable(v1219, v1218)
end
local v_u_1220 = "ExperienceAuthService"
function v5.ExperienceAuthService()
    local v_u_1221 = nil
    v_u_1221 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1222)
            if typeof(p1222) == "Instance" then
                if p1222:IsA(v_u_1220) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1221, p1222, (("expected %*, got %*"):format(v_u_1220, p1222.ClassName)))
                end
            else
                return v_u_3.err(v_u_1221, p1222, (("expected %*, got %*"):format(v_u_1220, (typeof(p1222)))))
            end
        end,
        ["_format"] = function(p1223, _, _)
            return v_u_2(v_u_1220, p1223[v_u_1221])
        end
    }
    local v1224 = v_u_4
    local v1225 = v_u_1221
    return setmetatable(v1225, v1224)
end
local v_u_1226 = "ExperienceInviteOptions"
function v5.ExperienceInviteOptions()
    local v_u_1227 = nil
    v_u_1227 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1228)
            if typeof(p1228) == "Instance" then
                if p1228:IsA(v_u_1226) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1227, p1228, (("expected %*, got %*"):format(v_u_1226, p1228.ClassName)))
                end
            else
                return v_u_3.err(v_u_1227, p1228, (("expected %*, got %*"):format(v_u_1226, (typeof(p1228)))))
            end
        end,
        ["_format"] = function(p1229, _, _)
            return v_u_2(v_u_1226, p1229[v_u_1227])
        end
    }
    local v1230 = v_u_4
    local v1231 = v_u_1227
    return setmetatable(v1231, v1230)
end
local v_u_1232 = "ExperienceNotificationService"
function v5.ExperienceNotificationService()
    local v_u_1233 = nil
    v_u_1233 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1234)
            if typeof(p1234) == "Instance" then
                if p1234:IsA(v_u_1232) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1233, p1234, (("expected %*, got %*"):format(v_u_1232, p1234.ClassName)))
                end
            else
                return v_u_3.err(v_u_1233, p1234, (("expected %*, got %*"):format(v_u_1232, (typeof(p1234)))))
            end
        end,
        ["_format"] = function(p1235, _, _)
            return v_u_2(v_u_1232, p1235[v_u_1233])
        end
    }
    local v1236 = v_u_4
    local v1237 = v_u_1233
    return setmetatable(v1237, v1236)
end
local v_u_1238 = "ExperienceService"
function v5.ExperienceService()
    local v_u_1239 = nil
    v_u_1239 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1240)
            if typeof(p1240) == "Instance" then
                if p1240:IsA(v_u_1238) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1239, p1240, (("expected %*, got %*"):format(v_u_1238, p1240.ClassName)))
                end
            else
                return v_u_3.err(v_u_1239, p1240, (("expected %*, got %*"):format(v_u_1238, (typeof(p1240)))))
            end
        end,
        ["_format"] = function(p1241, _, _)
            return v_u_2(v_u_1238, p1241[v_u_1239])
        end
    }
    local v1242 = v_u_4
    local v1243 = v_u_1239
    return setmetatable(v1243, v1242)
end
local v_u_1244 = "ExperienceStateCaptureService"
function v5.ExperienceStateCaptureService()
    local v_u_1245 = nil
    v_u_1245 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1246)
            if typeof(p1246) == "Instance" then
                if p1246:IsA(v_u_1244) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1245, p1246, (("expected %*, got %*"):format(v_u_1244, p1246.ClassName)))
                end
            else
                return v_u_3.err(v_u_1245, p1246, (("expected %*, got %*"):format(v_u_1244, (typeof(p1246)))))
            end
        end,
        ["_format"] = function(p1247, _, _)
            return v_u_2(v_u_1244, p1247[v_u_1245])
        end
    }
    local v1248 = v_u_4
    local v1249 = v_u_1245
    return setmetatable(v1249, v1248)
end
local v_u_1250 = "Explosion"
function v5.Explosion()
    local v_u_1251 = nil
    v_u_1251 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1252)
            if typeof(p1252) == "Instance" then
                if p1252:IsA(v_u_1250) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1251, p1252, (("expected %*, got %*"):format(v_u_1250, p1252.ClassName)))
                end
            else
                return v_u_3.err(v_u_1251, p1252, (("expected %*, got %*"):format(v_u_1250, (typeof(p1252)))))
            end
        end,
        ["_format"] = function(p1253, _, _)
            return v_u_2(v_u_1250, p1253[v_u_1251])
        end
    }
    local v1254 = v_u_4
    local v1255 = v_u_1251
    return setmetatable(v1255, v1254)
end
local v_u_1256 = "FaceAnimatorService"
function v5.FaceAnimatorService()
    local v_u_1257 = nil
    v_u_1257 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1258)
            if typeof(p1258) == "Instance" then
                if p1258:IsA(v_u_1256) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1257, p1258, (("expected %*, got %*"):format(v_u_1256, p1258.ClassName)))
                end
            else
                return v_u_3.err(v_u_1257, p1258, (("expected %*, got %*"):format(v_u_1256, (typeof(p1258)))))
            end
        end,
        ["_format"] = function(p1259, _, _)
            return v_u_2(v_u_1256, p1259[v_u_1257])
        end
    }
    local v1260 = v_u_4
    local v1261 = v_u_1257
    return setmetatable(v1261, v1260)
end
local v_u_1262 = "FaceControls"
function v5.FaceControls()
    local v_u_1263 = nil
    v_u_1263 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1264)
            if typeof(p1264) == "Instance" then
                if p1264:IsA(v_u_1262) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1263, p1264, (("expected %*, got %*"):format(v_u_1262, p1264.ClassName)))
                end
            else
                return v_u_3.err(v_u_1263, p1264, (("expected %*, got %*"):format(v_u_1262, (typeof(p1264)))))
            end
        end,
        ["_format"] = function(p1265, _, _)
            return v_u_2(v_u_1262, p1265[v_u_1263])
        end
    }
    local v1266 = v_u_4
    local v1267 = v_u_1263
    return setmetatable(v1267, v1266)
end
local v_u_1268 = "FaceInstance"
function v5.FaceInstance()
    local v_u_1269 = nil
    v_u_1269 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1270)
            if typeof(p1270) == "Instance" then
                if p1270:IsA(v_u_1268) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1269, p1270, (("expected %*, got %*"):format(v_u_1268, p1270.ClassName)))
                end
            else
                return v_u_3.err(v_u_1269, p1270, (("expected %*, got %*"):format(v_u_1268, (typeof(p1270)))))
            end
        end,
        ["_format"] = function(p1271, _, _)
            return v_u_2(v_u_1268, p1271[v_u_1269])
        end
    }
    local v1272 = v_u_4
    local v1273 = v_u_1269
    return setmetatable(v1273, v1272)
end
local v_u_1274 = "Decal"
function v5.Decal()
    local v_u_1275 = nil
    v_u_1275 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1276)
            if typeof(p1276) == "Instance" then
                if p1276:IsA(v_u_1274) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1275, p1276, (("expected %*, got %*"):format(v_u_1274, p1276.ClassName)))
                end
            else
                return v_u_3.err(v_u_1275, p1276, (("expected %*, got %*"):format(v_u_1274, (typeof(p1276)))))
            end
        end,
        ["_format"] = function(p1277, _, _)
            return v_u_2(v_u_1274, p1277[v_u_1275])
        end
    }
    local v1278 = v_u_4
    local v1279 = v_u_1275
    return setmetatable(v1279, v1278)
end
local v_u_1280 = "Texture"
function v5.Texture()
    local v_u_1281 = nil
    v_u_1281 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1282)
            if typeof(p1282) == "Instance" then
                if p1282:IsA(v_u_1280) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1281, p1282, (("expected %*, got %*"):format(v_u_1280, p1282.ClassName)))
                end
            else
                return v_u_3.err(v_u_1281, p1282, (("expected %*, got %*"):format(v_u_1280, (typeof(p1282)))))
            end
        end,
        ["_format"] = function(p1283, _, _)
            return v_u_2(v_u_1280, p1283[v_u_1281])
        end
    }
    local v1284 = v_u_4
    local v1285 = v_u_1281
    return setmetatable(v1285, v1284)
end
local v_u_1286 = "FacialAnimationRecordingService"
function v5.FacialAnimationRecordingService()
    local v_u_1287 = nil
    v_u_1287 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1288)
            if typeof(p1288) == "Instance" then
                if p1288:IsA(v_u_1286) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1287, p1288, (("expected %*, got %*"):format(v_u_1286, p1288.ClassName)))
                end
            else
                return v_u_3.err(v_u_1287, p1288, (("expected %*, got %*"):format(v_u_1286, (typeof(p1288)))))
            end
        end,
        ["_format"] = function(p1289, _, _)
            return v_u_2(v_u_1286, p1289[v_u_1287])
        end
    }
    local v1290 = v_u_4
    local v1291 = v_u_1287
    return setmetatable(v1291, v1290)
end
local v_u_1292 = "FacialAnimationStreamingServiceStats"
function v5.FacialAnimationStreamingServiceStats()
    local v_u_1293 = nil
    v_u_1293 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1294)
            if typeof(p1294) == "Instance" then
                if p1294:IsA(v_u_1292) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1293, p1294, (("expected %*, got %*"):format(v_u_1292, p1294.ClassName)))
                end
            else
                return v_u_3.err(v_u_1293, p1294, (("expected %*, got %*"):format(v_u_1292, (typeof(p1294)))))
            end
        end,
        ["_format"] = function(p1295, _, _)
            return v_u_2(v_u_1292, p1295[v_u_1293])
        end
    }
    local v1296 = v_u_4
    local v1297 = v_u_1293
    return setmetatable(v1297, v1296)
end
local v_u_1298 = "FacialAnimationStreamingServiceV2"
function v5.FacialAnimationStreamingServiceV2()
    local v_u_1299 = nil
    v_u_1299 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1300)
            if typeof(p1300) == "Instance" then
                if p1300:IsA(v_u_1298) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1299, p1300, (("expected %*, got %*"):format(v_u_1298, p1300.ClassName)))
                end
            else
                return v_u_3.err(v_u_1299, p1300, (("expected %*, got %*"):format(v_u_1298, (typeof(p1300)))))
            end
        end,
        ["_format"] = function(p1301, _, _)
            return v_u_2(v_u_1298, p1301[v_u_1299])
        end
    }
    local v1302 = v_u_4
    local v1303 = v_u_1299
    return setmetatable(v1303, v1302)
end
local v_u_1304 = "FacialAnimationStreamingSubsessionStats"
function v5.FacialAnimationStreamingSubsessionStats()
    local v_u_1305 = nil
    v_u_1305 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1306)
            if typeof(p1306) == "Instance" then
                if p1306:IsA(v_u_1304) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1305, p1306, (("expected %*, got %*"):format(v_u_1304, p1306.ClassName)))
                end
            else
                return v_u_3.err(v_u_1305, p1306, (("expected %*, got %*"):format(v_u_1304, (typeof(p1306)))))
            end
        end,
        ["_format"] = function(p1307, _, _)
            return v_u_2(v_u_1304, p1307[v_u_1305])
        end
    }
    local v1308 = v_u_4
    local v1309 = v_u_1305
    return setmetatable(v1309, v1308)
end
local v_u_1310 = "Feature"
function v5.Feature()
    local v_u_1311 = nil
    v_u_1311 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1312)
            if typeof(p1312) == "Instance" then
                if p1312:IsA(v_u_1310) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1311, p1312, (("expected %*, got %*"):format(v_u_1310, p1312.ClassName)))
                end
            else
                return v_u_3.err(v_u_1311, p1312, (("expected %*, got %*"):format(v_u_1310, (typeof(p1312)))))
            end
        end,
        ["_format"] = function(p1313, _, _)
            return v_u_2(v_u_1310, p1313[v_u_1311])
        end
    }
    local v1314 = v_u_4
    local v1315 = v_u_1311
    return setmetatable(v1315, v1314)
end
local v_u_1316 = "Hole"
function v5.Hole()
    local v_u_1317 = nil
    v_u_1317 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1318)
            if typeof(p1318) == "Instance" then
                if p1318:IsA(v_u_1316) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1317, p1318, (("expected %*, got %*"):format(v_u_1316, p1318.ClassName)))
                end
            else
                return v_u_3.err(v_u_1317, p1318, (("expected %*, got %*"):format(v_u_1316, (typeof(p1318)))))
            end
        end,
        ["_format"] = function(p1319, _, _)
            return v_u_2(v_u_1316, p1319[v_u_1317])
        end
    }
    local v1320 = v_u_4
    local v1321 = v_u_1317
    return setmetatable(v1321, v1320)
end
local v_u_1322 = "MotorFeature"
function v5.MotorFeature()
    local v_u_1323 = nil
    v_u_1323 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1324)
            if typeof(p1324) == "Instance" then
                if p1324:IsA(v_u_1322) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1323, p1324, (("expected %*, got %*"):format(v_u_1322, p1324.ClassName)))
                end
            else
                return v_u_3.err(v_u_1323, p1324, (("expected %*, got %*"):format(v_u_1322, (typeof(p1324)))))
            end
        end,
        ["_format"] = function(p1325, _, _)
            return v_u_2(v_u_1322, p1325[v_u_1323])
        end
    }
    local v1326 = v_u_4
    local v1327 = v_u_1323
    return setmetatable(v1327, v1326)
end
local v_u_1328 = "File"
function v5.File()
    local v_u_1329 = nil
    v_u_1329 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1330)
            if typeof(p1330) == "Instance" then
                if p1330:IsA(v_u_1328) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1329, p1330, (("expected %*, got %*"):format(v_u_1328, p1330.ClassName)))
                end
            else
                return v_u_3.err(v_u_1329, p1330, (("expected %*, got %*"):format(v_u_1328, (typeof(p1330)))))
            end
        end,
        ["_format"] = function(p1331, _, _)
            return v_u_2(v_u_1328, p1331[v_u_1329])
        end
    }
    local v1332 = v_u_4
    local v1333 = v_u_1329
    return setmetatable(v1333, v1332)
end
local v_u_1334 = "Fire"
function v5.Fire()
    local v_u_1335 = nil
    v_u_1335 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1336)
            if typeof(p1336) == "Instance" then
                if p1336:IsA(v_u_1334) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1335, p1336, (("expected %*, got %*"):format(v_u_1334, p1336.ClassName)))
                end
            else
                return v_u_3.err(v_u_1335, p1336, (("expected %*, got %*"):format(v_u_1334, (typeof(p1336)))))
            end
        end,
        ["_format"] = function(p1337, _, _)
            return v_u_2(v_u_1334, p1337[v_u_1335])
        end
    }
    local v1338 = v_u_4
    local v1339 = v_u_1335
    return setmetatable(v1339, v1338)
end
local v_u_1340 = "FlagStandService"
function v5.FlagStandService()
    local v_u_1341 = nil
    v_u_1341 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1342)
            if typeof(p1342) == "Instance" then
                if p1342:IsA(v_u_1340) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1341, p1342, (("expected %*, got %*"):format(v_u_1340, p1342.ClassName)))
                end
            else
                return v_u_3.err(v_u_1341, p1342, (("expected %*, got %*"):format(v_u_1340, (typeof(p1342)))))
            end
        end,
        ["_format"] = function(p1343, _, _)
            return v_u_2(v_u_1340, p1343[v_u_1341])
        end
    }
    local v1344 = v_u_4
    local v1345 = v_u_1341
    return setmetatable(v1345, v1344)
end
local v_u_1346 = "FloatCurve"
function v5.FloatCurve()
    local v_u_1347 = nil
    v_u_1347 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1348)
            if typeof(p1348) == "Instance" then
                if p1348:IsA(v_u_1346) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1347, p1348, (("expected %*, got %*"):format(v_u_1346, p1348.ClassName)))
                end
            else
                return v_u_3.err(v_u_1347, p1348, (("expected %*, got %*"):format(v_u_1346, (typeof(p1348)))))
            end
        end,
        ["_format"] = function(p1349, _, _)
            return v_u_2(v_u_1346, p1349[v_u_1347])
        end
    }
    local v1350 = v_u_4
    local v1351 = v_u_1347
    return setmetatable(v1351, v1350)
end
local v_u_1352 = "FlyweightService"
function v5.FlyweightService()
    local v_u_1353 = nil
    v_u_1353 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1354)
            if typeof(p1354) == "Instance" then
                if p1354:IsA(v_u_1352) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1353, p1354, (("expected %*, got %*"):format(v_u_1352, p1354.ClassName)))
                end
            else
                return v_u_3.err(v_u_1353, p1354, (("expected %*, got %*"):format(v_u_1352, (typeof(p1354)))))
            end
        end,
        ["_format"] = function(p1355, _, _)
            return v_u_2(v_u_1352, p1355[v_u_1353])
        end
    }
    local v1356 = v_u_4
    local v1357 = v_u_1353
    return setmetatable(v1357, v1356)
end
local v_u_1358 = "CSGDictionaryService"
function v5.CSGDictionaryService()
    local v_u_1359 = nil
    v_u_1359 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1360)
            if typeof(p1360) == "Instance" then
                if p1360:IsA(v_u_1358) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1359, p1360, (("expected %*, got %*"):format(v_u_1358, p1360.ClassName)))
                end
            else
                return v_u_3.err(v_u_1359, p1360, (("expected %*, got %*"):format(v_u_1358, (typeof(p1360)))))
            end
        end,
        ["_format"] = function(p1361, _, _)
            return v_u_2(v_u_1358, p1361[v_u_1359])
        end
    }
    local v1362 = v_u_4
    local v1363 = v_u_1359
    return setmetatable(v1363, v1362)
end
local v_u_1364 = "NonReplicatedCSGDictionaryService"
function v5.NonReplicatedCSGDictionaryService()
    local v_u_1365 = nil
    v_u_1365 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1366)
            if typeof(p1366) == "Instance" then
                if p1366:IsA(v_u_1364) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1365, p1366, (("expected %*, got %*"):format(v_u_1364, p1366.ClassName)))
                end
            else
                return v_u_3.err(v_u_1365, p1366, (("expected %*, got %*"):format(v_u_1364, (typeof(p1366)))))
            end
        end,
        ["_format"] = function(p1367, _, _)
            return v_u_2(v_u_1364, p1367[v_u_1365])
        end
    }
    local v1368 = v_u_4
    local v1369 = v_u_1365
    return setmetatable(v1369, v1368)
end
local v_u_1370 = "Folder"
function v5.Folder()
    local v_u_1371 = nil
    v_u_1371 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1372)
            if typeof(p1372) == "Instance" then
                if p1372:IsA(v_u_1370) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1371, p1372, (("expected %*, got %*"):format(v_u_1370, p1372.ClassName)))
                end
            else
                return v_u_3.err(v_u_1371, p1372, (("expected %*, got %*"):format(v_u_1370, (typeof(p1372)))))
            end
        end,
        ["_format"] = function(p1373, _, _)
            return v_u_2(v_u_1370, p1373[v_u_1371])
        end
    }
    local v1374 = v_u_4
    local v1375 = v_u_1371
    return setmetatable(v1375, v1374)
end
local v_u_1376 = "ForceField"
function v5.ForceField()
    local v_u_1377 = nil
    v_u_1377 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1378)
            if typeof(p1378) == "Instance" then
                if p1378:IsA(v_u_1376) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1377, p1378, (("expected %*, got %*"):format(v_u_1376, p1378.ClassName)))
                end
            else
                return v_u_3.err(v_u_1377, p1378, (("expected %*, got %*"):format(v_u_1376, (typeof(p1378)))))
            end
        end,
        ["_format"] = function(p1379, _, _)
            return v_u_2(v_u_1376, p1379[v_u_1377])
        end
    }
    local v1380 = v_u_4
    local v1381 = v_u_1377
    return setmetatable(v1381, v1380)
end
local v_u_1382 = "FriendService"
function v5.FriendService()
    local v_u_1383 = nil
    v_u_1383 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1384)
            if typeof(p1384) == "Instance" then
                if p1384:IsA(v_u_1382) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1383, p1384, (("expected %*, got %*"):format(v_u_1382, p1384.ClassName)))
                end
            else
                return v_u_3.err(v_u_1383, p1384, (("expected %*, got %*"):format(v_u_1382, (typeof(p1384)))))
            end
        end,
        ["_format"] = function(p1385, _, _)
            return v_u_2(v_u_1382, p1385[v_u_1383])
        end
    }
    local v1386 = v_u_4
    local v1387 = v_u_1383
    return setmetatable(v1387, v1386)
end
local v_u_1388 = "FunctionalTest"
function v5.FunctionalTest()
    local v_u_1389 = nil
    v_u_1389 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1390)
            if typeof(p1390) == "Instance" then
                if p1390:IsA(v_u_1388) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1389, p1390, (("expected %*, got %*"):format(v_u_1388, p1390.ClassName)))
                end
            else
                return v_u_3.err(v_u_1389, p1390, (("expected %*, got %*"):format(v_u_1388, (typeof(p1390)))))
            end
        end,
        ["_format"] = function(p1391, _, _)
            return v_u_2(v_u_1388, p1391[v_u_1389])
        end
    }
    local v1392 = v_u_4
    local v1393 = v_u_1389
    return setmetatable(v1393, v1392)
end
local v_u_1394 = "GamePassService"
function v5.GamePassService()
    local v_u_1395 = nil
    v_u_1395 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1396)
            if typeof(p1396) == "Instance" then
                if p1396:IsA(v_u_1394) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1395, p1396, (("expected %*, got %*"):format(v_u_1394, p1396.ClassName)))
                end
            else
                return v_u_3.err(v_u_1395, p1396, (("expected %*, got %*"):format(v_u_1394, (typeof(p1396)))))
            end
        end,
        ["_format"] = function(p1397, _, _)
            return v_u_2(v_u_1394, p1397[v_u_1395])
        end
    }
    local v1398 = v_u_4
    local v1399 = v_u_1395
    return setmetatable(v1399, v1398)
end
local v_u_1400 = "GameSettings"
function v5.GameSettings()
    local v_u_1401 = nil
    v_u_1401 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1402)
            if typeof(p1402) == "Instance" then
                if p1402:IsA(v_u_1400) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1401, p1402, (("expected %*, got %*"):format(v_u_1400, p1402.ClassName)))
                end
            else
                return v_u_3.err(v_u_1401, p1402, (("expected %*, got %*"):format(v_u_1400, (typeof(p1402)))))
            end
        end,
        ["_format"] = function(p1403, _, _)
            return v_u_2(v_u_1400, p1403[v_u_1401])
        end
    }
    local v1404 = v_u_4
    local v1405 = v_u_1401
    return setmetatable(v1405, v1404)
end
local v_u_1406 = "GamepadService"
function v5.GamepadService()
    local v_u_1407 = nil
    v_u_1407 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1408)
            if typeof(p1408) == "Instance" then
                if p1408:IsA(v_u_1406) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1407, p1408, (("expected %*, got %*"):format(v_u_1406, p1408.ClassName)))
                end
            else
                return v_u_3.err(v_u_1407, p1408, (("expected %*, got %*"):format(v_u_1406, (typeof(p1408)))))
            end
        end,
        ["_format"] = function(p1409, _, _)
            return v_u_2(v_u_1406, p1409[v_u_1407])
        end
    }
    local v1410 = v_u_4
    local v1411 = v_u_1407
    return setmetatable(v1411, v1410)
end
local v_u_1412 = "Geometry"
function v5.Geometry()
    local v_u_1413 = nil
    v_u_1413 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1414)
            if typeof(p1414) == "Instance" then
                if p1414:IsA(v_u_1412) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1413, p1414, (("expected %*, got %*"):format(v_u_1412, p1414.ClassName)))
                end
            else
                return v_u_3.err(v_u_1413, p1414, (("expected %*, got %*"):format(v_u_1412, (typeof(p1414)))))
            end
        end,
        ["_format"] = function(p1415, _, _)
            return v_u_2(v_u_1412, p1415[v_u_1413])
        end
    }
    local v1416 = v_u_4
    local v1417 = v_u_1413
    return setmetatable(v1417, v1416)
end
local v_u_1418 = "GeometryService"
function v5.GeometryService()
    local v_u_1419 = nil
    v_u_1419 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1420)
            if typeof(p1420) == "Instance" then
                if p1420:IsA(v_u_1418) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1419, p1420, (("expected %*, got %*"):format(v_u_1418, p1420.ClassName)))
                end
            else
                return v_u_3.err(v_u_1419, p1420, (("expected %*, got %*"):format(v_u_1418, (typeof(p1420)))))
            end
        end,
        ["_format"] = function(p1421, _, _)
            return v_u_2(v_u_1418, p1421[v_u_1419])
        end
    }
    local v1422 = v_u_4
    local v1423 = v_u_1419
    return setmetatable(v1423, v1422)
end
local v_u_1424 = "GetTextBoundsParams"
function v5.GetTextBoundsParams()
    local v_u_1425 = nil
    v_u_1425 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1426)
            if typeof(p1426) == "Instance" then
                if p1426:IsA(v_u_1424) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1425, p1426, (("expected %*, got %*"):format(v_u_1424, p1426.ClassName)))
                end
            else
                return v_u_3.err(v_u_1425, p1426, (("expected %*, got %*"):format(v_u_1424, (typeof(p1426)))))
            end
        end,
        ["_format"] = function(p1427, _, _)
            return v_u_2(v_u_1424, p1427[v_u_1425])
        end
    }
    local v1428 = v_u_4
    local v1429 = v_u_1425
    return setmetatable(v1429, v1428)
end
local v_u_1430 = "GlobalDataStore"
function v5.GlobalDataStore()
    local v_u_1431 = nil
    v_u_1431 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1432)
            if typeof(p1432) == "Instance" then
                if p1432:IsA(v_u_1430) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1431, p1432, (("expected %*, got %*"):format(v_u_1430, p1432.ClassName)))
                end
            else
                return v_u_3.err(v_u_1431, p1432, (("expected %*, got %*"):format(v_u_1430, (typeof(p1432)))))
            end
        end,
        ["_format"] = function(p1433, _, _)
            return v_u_2(v_u_1430, p1433[v_u_1431])
        end
    }
    local v1434 = v_u_4
    local v1435 = v_u_1431
    return setmetatable(v1435, v1434)
end
local v_u_1436 = "DataStore"
function v5.DataStore()
    local v_u_1437 = nil
    v_u_1437 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1438)
            if typeof(p1438) == "Instance" then
                if p1438:IsA(v_u_1436) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1437, p1438, (("expected %*, got %*"):format(v_u_1436, p1438.ClassName)))
                end
            else
                return v_u_3.err(v_u_1437, p1438, (("expected %*, got %*"):format(v_u_1436, (typeof(p1438)))))
            end
        end,
        ["_format"] = function(p1439, _, _)
            return v_u_2(v_u_1436, p1439[v_u_1437])
        end
    }
    local v1440 = v_u_4
    local v1441 = v_u_1437
    return setmetatable(v1441, v1440)
end
local v_u_1442 = "OrderedDataStore"
function v5.OrderedDataStore()
    local v_u_1443 = nil
    v_u_1443 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1444)
            if typeof(p1444) == "Instance" then
                if p1444:IsA(v_u_1442) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1443, p1444, (("expected %*, got %*"):format(v_u_1442, p1444.ClassName)))
                end
            else
                return v_u_3.err(v_u_1443, p1444, (("expected %*, got %*"):format(v_u_1442, (typeof(p1444)))))
            end
        end,
        ["_format"] = function(p1445, _, _)
            return v_u_2(v_u_1442, p1445[v_u_1443])
        end
    }
    local v1446 = v_u_4
    local v1447 = v_u_1443
    return setmetatable(v1447, v1446)
end
local v_u_1448 = "GoogleAnalyticsConfiguration"
function v5.GoogleAnalyticsConfiguration()
    local v_u_1449 = nil
    v_u_1449 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1450)
            if typeof(p1450) == "Instance" then
                if p1450:IsA(v_u_1448) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1449, p1450, (("expected %*, got %*"):format(v_u_1448, p1450.ClassName)))
                end
            else
                return v_u_3.err(v_u_1449, p1450, (("expected %*, got %*"):format(v_u_1448, (typeof(p1450)))))
            end
        end,
        ["_format"] = function(p1451, _, _)
            return v_u_2(v_u_1448, p1451[v_u_1449])
        end
    }
    local v1452 = v_u_4
    local v1453 = v_u_1449
    return setmetatable(v1453, v1452)
end
local v_u_1454 = "GroupService"
function v5.GroupService()
    local v_u_1455 = nil
    v_u_1455 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1456)
            if typeof(p1456) == "Instance" then
                if p1456:IsA(v_u_1454) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1455, p1456, (("expected %*, got %*"):format(v_u_1454, p1456.ClassName)))
                end
            else
                return v_u_3.err(v_u_1455, p1456, (("expected %*, got %*"):format(v_u_1454, (typeof(p1456)))))
            end
        end,
        ["_format"] = function(p1457, _, _)
            return v_u_2(v_u_1454, p1457[v_u_1455])
        end
    }
    local v1458 = v_u_4
    local v1459 = v_u_1455
    return setmetatable(v1459, v1458)
end
local v_u_1460 = "GuiBase"
function v5.GuiBase()
    local v_u_1461 = nil
    v_u_1461 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1462)
            if typeof(p1462) == "Instance" then
                if p1462:IsA(v_u_1460) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1461, p1462, (("expected %*, got %*"):format(v_u_1460, p1462.ClassName)))
                end
            else
                return v_u_3.err(v_u_1461, p1462, (("expected %*, got %*"):format(v_u_1460, (typeof(p1462)))))
            end
        end,
        ["_format"] = function(p1463, _, _)
            return v_u_2(v_u_1460, p1463[v_u_1461])
        end
    }
    local v1464 = v_u_4
    local v1465 = v_u_1461
    return setmetatable(v1465, v1464)
end
local v_u_1466 = "GuiBase2d"
function v5.GuiBase2d()
    local v_u_1467 = nil
    v_u_1467 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1468)
            if typeof(p1468) == "Instance" then
                if p1468:IsA(v_u_1466) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1467, p1468, (("expected %*, got %*"):format(v_u_1466, p1468.ClassName)))
                end
            else
                return v_u_3.err(v_u_1467, p1468, (("expected %*, got %*"):format(v_u_1466, (typeof(p1468)))))
            end
        end,
        ["_format"] = function(p1469, _, _)
            return v_u_2(v_u_1466, p1469[v_u_1467])
        end
    }
    local v1470 = v_u_4
    local v1471 = v_u_1467
    return setmetatable(v1471, v1470)
end
local v_u_1472 = "GuiObject"
function v5.GuiObject()
    local v_u_1473 = nil
    v_u_1473 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1474)
            if typeof(p1474) == "Instance" then
                if p1474:IsA(v_u_1472) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1473, p1474, (("expected %*, got %*"):format(v_u_1472, p1474.ClassName)))
                end
            else
                return v_u_3.err(v_u_1473, p1474, (("expected %*, got %*"):format(v_u_1472, (typeof(p1474)))))
            end
        end,
        ["_format"] = function(p1475, _, _)
            return v_u_2(v_u_1472, p1475[v_u_1473])
        end
    }
    local v1476 = v_u_4
    local v1477 = v_u_1473
    return setmetatable(v1477, v1476)
end
local v_u_1478 = "CanvasGroup"
function v5.CanvasGroup()
    local v_u_1479 = nil
    v_u_1479 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1480)
            if typeof(p1480) == "Instance" then
                if p1480:IsA(v_u_1478) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1479, p1480, (("expected %*, got %*"):format(v_u_1478, p1480.ClassName)))
                end
            else
                return v_u_3.err(v_u_1479, p1480, (("expected %*, got %*"):format(v_u_1478, (typeof(p1480)))))
            end
        end,
        ["_format"] = function(p1481, _, _)
            return v_u_2(v_u_1478, p1481[v_u_1479])
        end
    }
    local v1482 = v_u_4
    local v1483 = v_u_1479
    return setmetatable(v1483, v1482)
end
local v_u_1484 = "Frame"
function v5.Frame()
    local v_u_1485 = nil
    v_u_1485 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1486)
            if typeof(p1486) == "Instance" then
                if p1486:IsA(v_u_1484) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1485, p1486, (("expected %*, got %*"):format(v_u_1484, p1486.ClassName)))
                end
            else
                return v_u_3.err(v_u_1485, p1486, (("expected %*, got %*"):format(v_u_1484, (typeof(p1486)))))
            end
        end,
        ["_format"] = function(p1487, _, _)
            return v_u_2(v_u_1484, p1487[v_u_1485])
        end
    }
    local v1488 = v_u_4
    local v1489 = v_u_1485
    return setmetatable(v1489, v1488)
end
local v_u_1490 = "GuiButton"
function v5.GuiButton()
    local v_u_1491 = nil
    v_u_1491 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1492)
            if typeof(p1492) == "Instance" then
                if p1492:IsA(v_u_1490) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1491, p1492, (("expected %*, got %*"):format(v_u_1490, p1492.ClassName)))
                end
            else
                return v_u_3.err(v_u_1491, p1492, (("expected %*, got %*"):format(v_u_1490, (typeof(p1492)))))
            end
        end,
        ["_format"] = function(p1493, _, _)
            return v_u_2(v_u_1490, p1493[v_u_1491])
        end
    }
    local v1494 = v_u_4
    local v1495 = v_u_1491
    return setmetatable(v1495, v1494)
end
local v_u_1496 = "ImageButton"
function v5.ImageButton()
    local v_u_1497 = nil
    v_u_1497 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1498)
            if typeof(p1498) == "Instance" then
                if p1498:IsA(v_u_1496) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1497, p1498, (("expected %*, got %*"):format(v_u_1496, p1498.ClassName)))
                end
            else
                return v_u_3.err(v_u_1497, p1498, (("expected %*, got %*"):format(v_u_1496, (typeof(p1498)))))
            end
        end,
        ["_format"] = function(p1499, _, _)
            return v_u_2(v_u_1496, p1499[v_u_1497])
        end
    }
    local v1500 = v_u_4
    local v1501 = v_u_1497
    return setmetatable(v1501, v1500)
end
local v_u_1502 = "TextButton"
function v5.TextButton()
    local v_u_1503 = nil
    v_u_1503 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1504)
            if typeof(p1504) == "Instance" then
                if p1504:IsA(v_u_1502) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1503, p1504, (("expected %*, got %*"):format(v_u_1502, p1504.ClassName)))
                end
            else
                return v_u_3.err(v_u_1503, p1504, (("expected %*, got %*"):format(v_u_1502, (typeof(p1504)))))
            end
        end,
        ["_format"] = function(p1505, _, _)
            return v_u_2(v_u_1502, p1505[v_u_1503])
        end
    }
    local v1506 = v_u_4
    local v1507 = v_u_1503
    return setmetatable(v1507, v1506)
end
local v_u_1508 = "GuiLabel"
function v5.GuiLabel()
    local v_u_1509 = nil
    v_u_1509 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1510)
            if typeof(p1510) == "Instance" then
                if p1510:IsA(v_u_1508) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1509, p1510, (("expected %*, got %*"):format(v_u_1508, p1510.ClassName)))
                end
            else
                return v_u_3.err(v_u_1509, p1510, (("expected %*, got %*"):format(v_u_1508, (typeof(p1510)))))
            end
        end,
        ["_format"] = function(p1511, _, _)
            return v_u_2(v_u_1508, p1511[v_u_1509])
        end
    }
    local v1512 = v_u_4
    local v1513 = v_u_1509
    return setmetatable(v1513, v1512)
end
local v_u_1514 = "ImageLabel"
function v5.ImageLabel()
    local v_u_1515 = nil
    v_u_1515 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1516)
            if typeof(p1516) == "Instance" then
                if p1516:IsA(v_u_1514) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1515, p1516, (("expected %*, got %*"):format(v_u_1514, p1516.ClassName)))
                end
            else
                return v_u_3.err(v_u_1515, p1516, (("expected %*, got %*"):format(v_u_1514, (typeof(p1516)))))
            end
        end,
        ["_format"] = function(p1517, _, _)
            return v_u_2(v_u_1514, p1517[v_u_1515])
        end
    }
    local v1518 = v_u_4
    local v1519 = v_u_1515
    return setmetatable(v1519, v1518)
end
local v_u_1520 = "TextLabel"
function v5.TextLabel()
    local v_u_1521 = nil
    v_u_1521 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1522)
            if typeof(p1522) == "Instance" then
                if p1522:IsA(v_u_1520) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1521, p1522, (("expected %*, got %*"):format(v_u_1520, p1522.ClassName)))
                end
            else
                return v_u_3.err(v_u_1521, p1522, (("expected %*, got %*"):format(v_u_1520, (typeof(p1522)))))
            end
        end,
        ["_format"] = function(p1523, _, _)
            return v_u_2(v_u_1520, p1523[v_u_1521])
        end
    }
    local v1524 = v_u_4
    local v1525 = v_u_1521
    return setmetatable(v1525, v1524)
end
local v_u_1526 = "ScrollingFrame"
function v5.ScrollingFrame()
    local v_u_1527 = nil
    v_u_1527 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1528)
            if typeof(p1528) == "Instance" then
                if p1528:IsA(v_u_1526) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1527, p1528, (("expected %*, got %*"):format(v_u_1526, p1528.ClassName)))
                end
            else
                return v_u_3.err(v_u_1527, p1528, (("expected %*, got %*"):format(v_u_1526, (typeof(p1528)))))
            end
        end,
        ["_format"] = function(p1529, _, _)
            return v_u_2(v_u_1526, p1529[v_u_1527])
        end
    }
    local v1530 = v_u_4
    local v1531 = v_u_1527
    return setmetatable(v1531, v1530)
end
local v_u_1532 = "TextBox"
function v5.TextBox()
    local v_u_1533 = nil
    v_u_1533 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1534)
            if typeof(p1534) == "Instance" then
                if p1534:IsA(v_u_1532) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1533, p1534, (("expected %*, got %*"):format(v_u_1532, p1534.ClassName)))
                end
            else
                return v_u_3.err(v_u_1533, p1534, (("expected %*, got %*"):format(v_u_1532, (typeof(p1534)))))
            end
        end,
        ["_format"] = function(p1535, _, _)
            return v_u_2(v_u_1532, p1535[v_u_1533])
        end
    }
    local v1536 = v_u_4
    local v1537 = v_u_1533
    return setmetatable(v1537, v1536)
end
local v_u_1538 = "VideoFrame"
function v5.VideoFrame()
    local v_u_1539 = nil
    v_u_1539 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1540)
            if typeof(p1540) == "Instance" then
                if p1540:IsA(v_u_1538) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1539, p1540, (("expected %*, got %*"):format(v_u_1538, p1540.ClassName)))
                end
            else
                return v_u_3.err(v_u_1539, p1540, (("expected %*, got %*"):format(v_u_1538, (typeof(p1540)))))
            end
        end,
        ["_format"] = function(p1541, _, _)
            return v_u_2(v_u_1538, p1541[v_u_1539])
        end
    }
    local v1542 = v_u_4
    local v1543 = v_u_1539
    return setmetatable(v1543, v1542)
end
local v_u_1544 = "ViewportFrame"
function v5.ViewportFrame()
    local v_u_1545 = nil
    v_u_1545 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1546)
            if typeof(p1546) == "Instance" then
                if p1546:IsA(v_u_1544) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1545, p1546, (("expected %*, got %*"):format(v_u_1544, p1546.ClassName)))
                end
            else
                return v_u_3.err(v_u_1545, p1546, (("expected %*, got %*"):format(v_u_1544, (typeof(p1546)))))
            end
        end,
        ["_format"] = function(p1547, _, _)
            return v_u_2(v_u_1544, p1547[v_u_1545])
        end
    }
    local v1548 = v_u_4
    local v1549 = v_u_1545
    return setmetatable(v1549, v1548)
end
local v_u_1550 = "LayerCollector"
function v5.LayerCollector()
    local v_u_1551 = nil
    v_u_1551 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1552)
            if typeof(p1552) == "Instance" then
                if p1552:IsA(v_u_1550) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1551, p1552, (("expected %*, got %*"):format(v_u_1550, p1552.ClassName)))
                end
            else
                return v_u_3.err(v_u_1551, p1552, (("expected %*, got %*"):format(v_u_1550, (typeof(p1552)))))
            end
        end,
        ["_format"] = function(p1553, _, _)
            return v_u_2(v_u_1550, p1553[v_u_1551])
        end
    }
    local v1554 = v_u_4
    local v1555 = v_u_1551
    return setmetatable(v1555, v1554)
end
local v_u_1556 = "BillboardGui"
function v5.BillboardGui()
    local v_u_1557 = nil
    v_u_1557 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1558)
            if typeof(p1558) == "Instance" then
                if p1558:IsA(v_u_1556) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1557, p1558, (("expected %*, got %*"):format(v_u_1556, p1558.ClassName)))
                end
            else
                return v_u_3.err(v_u_1557, p1558, (("expected %*, got %*"):format(v_u_1556, (typeof(p1558)))))
            end
        end,
        ["_format"] = function(p1559, _, _)
            return v_u_2(v_u_1556, p1559[v_u_1557])
        end
    }
    local v1560 = v_u_4
    local v1561 = v_u_1557
    return setmetatable(v1561, v1560)
end
local v_u_1562 = "PluginGui"
function v5.PluginGui()
    local v_u_1563 = nil
    v_u_1563 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1564)
            if typeof(p1564) == "Instance" then
                if p1564:IsA(v_u_1562) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1563, p1564, (("expected %*, got %*"):format(v_u_1562, p1564.ClassName)))
                end
            else
                return v_u_3.err(v_u_1563, p1564, (("expected %*, got %*"):format(v_u_1562, (typeof(p1564)))))
            end
        end,
        ["_format"] = function(p1565, _, _)
            return v_u_2(v_u_1562, p1565[v_u_1563])
        end
    }
    local v1566 = v_u_4
    local v1567 = v_u_1563
    return setmetatable(v1567, v1566)
end
local v_u_1568 = "DockWidgetPluginGui"
function v5.DockWidgetPluginGui()
    local v_u_1569 = nil
    v_u_1569 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1570)
            if typeof(p1570) == "Instance" then
                if p1570:IsA(v_u_1568) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1569, p1570, (("expected %*, got %*"):format(v_u_1568, p1570.ClassName)))
                end
            else
                return v_u_3.err(v_u_1569, p1570, (("expected %*, got %*"):format(v_u_1568, (typeof(p1570)))))
            end
        end,
        ["_format"] = function(p1571, _, _)
            return v_u_2(v_u_1568, p1571[v_u_1569])
        end
    }
    local v1572 = v_u_4
    local v1573 = v_u_1569
    return setmetatable(v1573, v1572)
end
local v_u_1574 = "QWidgetPluginGui"
function v5.QWidgetPluginGui()
    local v_u_1575 = nil
    v_u_1575 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1576)
            if typeof(p1576) == "Instance" then
                if p1576:IsA(v_u_1574) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1575, p1576, (("expected %*, got %*"):format(v_u_1574, p1576.ClassName)))
                end
            else
                return v_u_3.err(v_u_1575, p1576, (("expected %*, got %*"):format(v_u_1574, (typeof(p1576)))))
            end
        end,
        ["_format"] = function(p1577, _, _)
            return v_u_2(v_u_1574, p1577[v_u_1575])
        end
    }
    local v1578 = v_u_4
    local v1579 = v_u_1575
    return setmetatable(v1579, v1578)
end
local v_u_1580 = "ScreenGui"
function v5.ScreenGui()
    local v_u_1581 = nil
    v_u_1581 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1582)
            if typeof(p1582) == "Instance" then
                if p1582:IsA(v_u_1580) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1581, p1582, (("expected %*, got %*"):format(v_u_1580, p1582.ClassName)))
                end
            else
                return v_u_3.err(v_u_1581, p1582, (("expected %*, got %*"):format(v_u_1580, (typeof(p1582)))))
            end
        end,
        ["_format"] = function(p1583, _, _)
            return v_u_2(v_u_1580, p1583[v_u_1581])
        end
    }
    local v1584 = v_u_4
    local v1585 = v_u_1581
    return setmetatable(v1585, v1584)
end
local v_u_1586 = "GuiMain"
function v5.GuiMain()
    local v_u_1587 = nil
    v_u_1587 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1588)
            if typeof(p1588) == "Instance" then
                if p1588:IsA(v_u_1586) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1587, p1588, (("expected %*, got %*"):format(v_u_1586, p1588.ClassName)))
                end
            else
                return v_u_3.err(v_u_1587, p1588, (("expected %*, got %*"):format(v_u_1586, (typeof(p1588)))))
            end
        end,
        ["_format"] = function(p1589, _, _)
            return v_u_2(v_u_1586, p1589[v_u_1587])
        end
    }
    local v1590 = v_u_4
    local v1591 = v_u_1587
    return setmetatable(v1591, v1590)
end
local v_u_1592 = "SurfaceGuiBase"
function v5.SurfaceGuiBase()
    local v_u_1593 = nil
    v_u_1593 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1594)
            if typeof(p1594) == "Instance" then
                if p1594:IsA(v_u_1592) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1593, p1594, (("expected %*, got %*"):format(v_u_1592, p1594.ClassName)))
                end
            else
                return v_u_3.err(v_u_1593, p1594, (("expected %*, got %*"):format(v_u_1592, (typeof(p1594)))))
            end
        end,
        ["_format"] = function(p1595, _, _)
            return v_u_2(v_u_1592, p1595[v_u_1593])
        end
    }
    local v1596 = v_u_4
    local v1597 = v_u_1593
    return setmetatable(v1597, v1596)
end
local v_u_1598 = "AdGui"
function v5.AdGui()
    local v_u_1599 = nil
    v_u_1599 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1600)
            if typeof(p1600) == "Instance" then
                if p1600:IsA(v_u_1598) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1599, p1600, (("expected %*, got %*"):format(v_u_1598, p1600.ClassName)))
                end
            else
                return v_u_3.err(v_u_1599, p1600, (("expected %*, got %*"):format(v_u_1598, (typeof(p1600)))))
            end
        end,
        ["_format"] = function(p1601, _, _)
            return v_u_2(v_u_1598, p1601[v_u_1599])
        end
    }
    local v1602 = v_u_4
    local v1603 = v_u_1599
    return setmetatable(v1603, v1602)
end
local v_u_1604 = "SurfaceGui"
function v5.SurfaceGui()
    local v_u_1605 = nil
    v_u_1605 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1606)
            if typeof(p1606) == "Instance" then
                if p1606:IsA(v_u_1604) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1605, p1606, (("expected %*, got %*"):format(v_u_1604, p1606.ClassName)))
                end
            else
                return v_u_3.err(v_u_1605, p1606, (("expected %*, got %*"):format(v_u_1604, (typeof(p1606)))))
            end
        end,
        ["_format"] = function(p1607, _, _)
            return v_u_2(v_u_1604, p1607[v_u_1605])
        end
    }
    local v1608 = v_u_4
    local v1609 = v_u_1605
    return setmetatable(v1609, v1608)
end
local v_u_1610 = "GuiBase3d"
function v5.GuiBase3d()
    local v_u_1611 = nil
    v_u_1611 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1612)
            if typeof(p1612) == "Instance" then
                if p1612:IsA(v_u_1610) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1611, p1612, (("expected %*, got %*"):format(v_u_1610, p1612.ClassName)))
                end
            else
                return v_u_3.err(v_u_1611, p1612, (("expected %*, got %*"):format(v_u_1610, (typeof(p1612)))))
            end
        end,
        ["_format"] = function(p1613, _, _)
            return v_u_2(v_u_1610, p1613[v_u_1611])
        end
    }
    local v1614 = v_u_4
    local v1615 = v_u_1611
    return setmetatable(v1615, v1614)
end
local v_u_1616 = "FloorWire"
function v5.FloorWire()
    local v_u_1617 = nil
    v_u_1617 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1618)
            if typeof(p1618) == "Instance" then
                if p1618:IsA(v_u_1616) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1617, p1618, (("expected %*, got %*"):format(v_u_1616, p1618.ClassName)))
                end
            else
                return v_u_3.err(v_u_1617, p1618, (("expected %*, got %*"):format(v_u_1616, (typeof(p1618)))))
            end
        end,
        ["_format"] = function(p1619, _, _)
            return v_u_2(v_u_1616, p1619[v_u_1617])
        end
    }
    local v1620 = v_u_4
    local v1621 = v_u_1617
    return setmetatable(v1621, v1620)
end
local v_u_1622 = "InstanceAdornment"
function v5.InstanceAdornment()
    local v_u_1623 = nil
    v_u_1623 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1624)
            if typeof(p1624) == "Instance" then
                if p1624:IsA(v_u_1622) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1623, p1624, (("expected %*, got %*"):format(v_u_1622, p1624.ClassName)))
                end
            else
                return v_u_3.err(v_u_1623, p1624, (("expected %*, got %*"):format(v_u_1622, (typeof(p1624)))))
            end
        end,
        ["_format"] = function(p1625, _, _)
            return v_u_2(v_u_1622, p1625[v_u_1623])
        end
    }
    local v1626 = v_u_4
    local v1627 = v_u_1623
    return setmetatable(v1627, v1626)
end
local v_u_1628 = "SelectionBox"
function v5.SelectionBox()
    local v_u_1629 = nil
    v_u_1629 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1630)
            if typeof(p1630) == "Instance" then
                if p1630:IsA(v_u_1628) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1629, p1630, (("expected %*, got %*"):format(v_u_1628, p1630.ClassName)))
                end
            else
                return v_u_3.err(v_u_1629, p1630, (("expected %*, got %*"):format(v_u_1628, (typeof(p1630)))))
            end
        end,
        ["_format"] = function(p1631, _, _)
            return v_u_2(v_u_1628, p1631[v_u_1629])
        end
    }
    local v1632 = v_u_4
    local v1633 = v_u_1629
    return setmetatable(v1633, v1632)
end
local v_u_1634 = "PVAdornment"
function v5.PVAdornment()
    local v_u_1635 = nil
    v_u_1635 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1636)
            if typeof(p1636) == "Instance" then
                if p1636:IsA(v_u_1634) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1635, p1636, (("expected %*, got %*"):format(v_u_1634, p1636.ClassName)))
                end
            else
                return v_u_3.err(v_u_1635, p1636, (("expected %*, got %*"):format(v_u_1634, (typeof(p1636)))))
            end
        end,
        ["_format"] = function(p1637, _, _)
            return v_u_2(v_u_1634, p1637[v_u_1635])
        end
    }
    local v1638 = v_u_4
    local v1639 = v_u_1635
    return setmetatable(v1639, v1638)
end
local v_u_1640 = "HandleAdornment"
function v5.HandleAdornment()
    local v_u_1641 = nil
    v_u_1641 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1642)
            if typeof(p1642) == "Instance" then
                if p1642:IsA(v_u_1640) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1641, p1642, (("expected %*, got %*"):format(v_u_1640, p1642.ClassName)))
                end
            else
                return v_u_3.err(v_u_1641, p1642, (("expected %*, got %*"):format(v_u_1640, (typeof(p1642)))))
            end
        end,
        ["_format"] = function(p1643, _, _)
            return v_u_2(v_u_1640, p1643[v_u_1641])
        end
    }
    local v1644 = v_u_4
    local v1645 = v_u_1641
    return setmetatable(v1645, v1644)
end
local v_u_1646 = "BoxHandleAdornment"
function v5.BoxHandleAdornment()
    local v_u_1647 = nil
    v_u_1647 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1648)
            if typeof(p1648) == "Instance" then
                if p1648:IsA(v_u_1646) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1647, p1648, (("expected %*, got %*"):format(v_u_1646, p1648.ClassName)))
                end
            else
                return v_u_3.err(v_u_1647, p1648, (("expected %*, got %*"):format(v_u_1646, (typeof(p1648)))))
            end
        end,
        ["_format"] = function(p1649, _, _)
            return v_u_2(v_u_1646, p1649[v_u_1647])
        end
    }
    local v1650 = v_u_4
    local v1651 = v_u_1647
    return setmetatable(v1651, v1650)
end
local v_u_1652 = "ConeHandleAdornment"
function v5.ConeHandleAdornment()
    local v_u_1653 = nil
    v_u_1653 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1654)
            if typeof(p1654) == "Instance" then
                if p1654:IsA(v_u_1652) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1653, p1654, (("expected %*, got %*"):format(v_u_1652, p1654.ClassName)))
                end
            else
                return v_u_3.err(v_u_1653, p1654, (("expected %*, got %*"):format(v_u_1652, (typeof(p1654)))))
            end
        end,
        ["_format"] = function(p1655, _, _)
            return v_u_2(v_u_1652, p1655[v_u_1653])
        end
    }
    local v1656 = v_u_4
    local v1657 = v_u_1653
    return setmetatable(v1657, v1656)
end
local v_u_1658 = "CylinderHandleAdornment"
function v5.CylinderHandleAdornment()
    local v_u_1659 = nil
    v_u_1659 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1660)
            if typeof(p1660) == "Instance" then
                if p1660:IsA(v_u_1658) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1659, p1660, (("expected %*, got %*"):format(v_u_1658, p1660.ClassName)))
                end
            else
                return v_u_3.err(v_u_1659, p1660, (("expected %*, got %*"):format(v_u_1658, (typeof(p1660)))))
            end
        end,
        ["_format"] = function(p1661, _, _)
            return v_u_2(v_u_1658, p1661[v_u_1659])
        end
    }
    local v1662 = v_u_4
    local v1663 = v_u_1659
    return setmetatable(v1663, v1662)
end
local v_u_1664 = "ImageHandleAdornment"
function v5.ImageHandleAdornment()
    local v_u_1665 = nil
    v_u_1665 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1666)
            if typeof(p1666) == "Instance" then
                if p1666:IsA(v_u_1664) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1665, p1666, (("expected %*, got %*"):format(v_u_1664, p1666.ClassName)))
                end
            else
                return v_u_3.err(v_u_1665, p1666, (("expected %*, got %*"):format(v_u_1664, (typeof(p1666)))))
            end
        end,
        ["_format"] = function(p1667, _, _)
            return v_u_2(v_u_1664, p1667[v_u_1665])
        end
    }
    local v1668 = v_u_4
    local v1669 = v_u_1665
    return setmetatable(v1669, v1668)
end
local v_u_1670 = "LineHandleAdornment"
function v5.LineHandleAdornment()
    local v_u_1671 = nil
    v_u_1671 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1672)
            if typeof(p1672) == "Instance" then
                if p1672:IsA(v_u_1670) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1671, p1672, (("expected %*, got %*"):format(v_u_1670, p1672.ClassName)))
                end
            else
                return v_u_3.err(v_u_1671, p1672, (("expected %*, got %*"):format(v_u_1670, (typeof(p1672)))))
            end
        end,
        ["_format"] = function(p1673, _, _)
            return v_u_2(v_u_1670, p1673[v_u_1671])
        end
    }
    local v1674 = v_u_4
    local v1675 = v_u_1671
    return setmetatable(v1675, v1674)
end
local v_u_1676 = "SphereHandleAdornment"
function v5.SphereHandleAdornment()
    local v_u_1677 = nil
    v_u_1677 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1678)
            if typeof(p1678) == "Instance" then
                if p1678:IsA(v_u_1676) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1677, p1678, (("expected %*, got %*"):format(v_u_1676, p1678.ClassName)))
                end
            else
                return v_u_3.err(v_u_1677, p1678, (("expected %*, got %*"):format(v_u_1676, (typeof(p1678)))))
            end
        end,
        ["_format"] = function(p1679, _, _)
            return v_u_2(v_u_1676, p1679[v_u_1677])
        end
    }
    local v1680 = v_u_4
    local v1681 = v_u_1677
    return setmetatable(v1681, v1680)
end
local v_u_1682 = "WireframeHandleAdornment"
function v5.WireframeHandleAdornment()
    local v_u_1683 = nil
    v_u_1683 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1684)
            if typeof(p1684) == "Instance" then
                if p1684:IsA(v_u_1682) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1683, p1684, (("expected %*, got %*"):format(v_u_1682, p1684.ClassName)))
                end
            else
                return v_u_3.err(v_u_1683, p1684, (("expected %*, got %*"):format(v_u_1682, (typeof(p1684)))))
            end
        end,
        ["_format"] = function(p1685, _, _)
            return v_u_2(v_u_1682, p1685[v_u_1683])
        end
    }
    local v1686 = v_u_4
    local v1687 = v_u_1683
    return setmetatable(v1687, v1686)
end
local v_u_1688 = "ParabolaAdornment"
function v5.ParabolaAdornment()
    local v_u_1689 = nil
    v_u_1689 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1690)
            if typeof(p1690) == "Instance" then
                if p1690:IsA(v_u_1688) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1689, p1690, (("expected %*, got %*"):format(v_u_1688, p1690.ClassName)))
                end
            else
                return v_u_3.err(v_u_1689, p1690, (("expected %*, got %*"):format(v_u_1688, (typeof(p1690)))))
            end
        end,
        ["_format"] = function(p1691, _, _)
            return v_u_2(v_u_1688, p1691[v_u_1689])
        end
    }
    local v1692 = v_u_4
    local v1693 = v_u_1689
    return setmetatable(v1693, v1692)
end
local v_u_1694 = "SelectionSphere"
function v5.SelectionSphere()
    local v_u_1695 = nil
    v_u_1695 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1696)
            if typeof(p1696) == "Instance" then
                if p1696:IsA(v_u_1694) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1695, p1696, (("expected %*, got %*"):format(v_u_1694, p1696.ClassName)))
                end
            else
                return v_u_3.err(v_u_1695, p1696, (("expected %*, got %*"):format(v_u_1694, (typeof(p1696)))))
            end
        end,
        ["_format"] = function(p1697, _, _)
            return v_u_2(v_u_1694, p1697[v_u_1695])
        end
    }
    local v1698 = v_u_4
    local v1699 = v_u_1695
    return setmetatable(v1699, v1698)
end
local v_u_1700 = "PartAdornment"
function v5.PartAdornment()
    local v_u_1701 = nil
    v_u_1701 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1702)
            if typeof(p1702) == "Instance" then
                if p1702:IsA(v_u_1700) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1701, p1702, (("expected %*, got %*"):format(v_u_1700, p1702.ClassName)))
                end
            else
                return v_u_3.err(v_u_1701, p1702, (("expected %*, got %*"):format(v_u_1700, (typeof(p1702)))))
            end
        end,
        ["_format"] = function(p1703, _, _)
            return v_u_2(v_u_1700, p1703[v_u_1701])
        end
    }
    local v1704 = v_u_4
    local v1705 = v_u_1701
    return setmetatable(v1705, v1704)
end
local v_u_1706 = "HandlesBase"
function v5.HandlesBase()
    local v_u_1707 = nil
    v_u_1707 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1708)
            if typeof(p1708) == "Instance" then
                if p1708:IsA(v_u_1706) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1707, p1708, (("expected %*, got %*"):format(v_u_1706, p1708.ClassName)))
                end
            else
                return v_u_3.err(v_u_1707, p1708, (("expected %*, got %*"):format(v_u_1706, (typeof(p1708)))))
            end
        end,
        ["_format"] = function(p1709, _, _)
            return v_u_2(v_u_1706, p1709[v_u_1707])
        end
    }
    local v1710 = v_u_4
    local v1711 = v_u_1707
    return setmetatable(v1711, v1710)
end
local v_u_1712 = "ArcHandles"
function v5.ArcHandles()
    local v_u_1713 = nil
    v_u_1713 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1714)
            if typeof(p1714) == "Instance" then
                if p1714:IsA(v_u_1712) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1713, p1714, (("expected %*, got %*"):format(v_u_1712, p1714.ClassName)))
                end
            else
                return v_u_3.err(v_u_1713, p1714, (("expected %*, got %*"):format(v_u_1712, (typeof(p1714)))))
            end
        end,
        ["_format"] = function(p1715, _, _)
            return v_u_2(v_u_1712, p1715[v_u_1713])
        end
    }
    local v1716 = v_u_4
    local v1717 = v_u_1713
    return setmetatable(v1717, v1716)
end
local v_u_1718 = "Handles"
function v5.Handles()
    local v_u_1719 = nil
    v_u_1719 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1720)
            if typeof(p1720) == "Instance" then
                if p1720:IsA(v_u_1718) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1719, p1720, (("expected %*, got %*"):format(v_u_1718, p1720.ClassName)))
                end
            else
                return v_u_3.err(v_u_1719, p1720, (("expected %*, got %*"):format(v_u_1718, (typeof(p1720)))))
            end
        end,
        ["_format"] = function(p1721, _, _)
            return v_u_2(v_u_1718, p1721[v_u_1719])
        end
    }
    local v1722 = v_u_4
    local v1723 = v_u_1719
    return setmetatable(v1723, v1722)
end
local v_u_1724 = "SurfaceSelection"
function v5.SurfaceSelection()
    local v_u_1725 = nil
    v_u_1725 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1726)
            if typeof(p1726) == "Instance" then
                if p1726:IsA(v_u_1724) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1725, p1726, (("expected %*, got %*"):format(v_u_1724, p1726.ClassName)))
                end
            else
                return v_u_3.err(v_u_1725, p1726, (("expected %*, got %*"):format(v_u_1724, (typeof(p1726)))))
            end
        end,
        ["_format"] = function(p1727, _, _)
            return v_u_2(v_u_1724, p1727[v_u_1725])
        end
    }
    local v1728 = v_u_4
    local v1729 = v_u_1725
    return setmetatable(v1729, v1728)
end
local v_u_1730 = "SelectionLasso"
function v5.SelectionLasso()
    local v_u_1731 = nil
    v_u_1731 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1732)
            if typeof(p1732) == "Instance" then
                if p1732:IsA(v_u_1730) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1731, p1732, (("expected %*, got %*"):format(v_u_1730, p1732.ClassName)))
                end
            else
                return v_u_3.err(v_u_1731, p1732, (("expected %*, got %*"):format(v_u_1730, (typeof(p1732)))))
            end
        end,
        ["_format"] = function(p1733, _, _)
            return v_u_2(v_u_1730, p1733[v_u_1731])
        end
    }
    local v1734 = v_u_4
    local v1735 = v_u_1731
    return setmetatable(v1735, v1734)
end
local v_u_1736 = "SelectionPartLasso"
function v5.SelectionPartLasso()
    local v_u_1737 = nil
    v_u_1737 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1738)
            if typeof(p1738) == "Instance" then
                if p1738:IsA(v_u_1736) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1737, p1738, (("expected %*, got %*"):format(v_u_1736, p1738.ClassName)))
                end
            else
                return v_u_3.err(v_u_1737, p1738, (("expected %*, got %*"):format(v_u_1736, (typeof(p1738)))))
            end
        end,
        ["_format"] = function(p1739, _, _)
            return v_u_2(v_u_1736, p1739[v_u_1737])
        end
    }
    local v1740 = v_u_4
    local v1741 = v_u_1737
    return setmetatable(v1741, v1740)
end
local v_u_1742 = "SelectionPointLasso"
function v5.SelectionPointLasso()
    local v_u_1743 = nil
    v_u_1743 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1744)
            if typeof(p1744) == "Instance" then
                if p1744:IsA(v_u_1742) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1743, p1744, (("expected %*, got %*"):format(v_u_1742, p1744.ClassName)))
                end
            else
                return v_u_3.err(v_u_1743, p1744, (("expected %*, got %*"):format(v_u_1742, (typeof(p1744)))))
            end
        end,
        ["_format"] = function(p1745, _, _)
            return v_u_2(v_u_1742, p1745[v_u_1743])
        end
    }
    local v1746 = v_u_4
    local v1747 = v_u_1743
    return setmetatable(v1747, v1746)
end
local v_u_1748 = "Path2D"
function v5.Path2D()
    local v_u_1749 = nil
    v_u_1749 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1750)
            if typeof(p1750) == "Instance" then
                if p1750:IsA(v_u_1748) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1749, p1750, (("expected %*, got %*"):format(v_u_1748, p1750.ClassName)))
                end
            else
                return v_u_3.err(v_u_1749, p1750, (("expected %*, got %*"):format(v_u_1748, (typeof(p1750)))))
            end
        end,
        ["_format"] = function(p1751, _, _)
            return v_u_2(v_u_1748, p1751[v_u_1749])
        end
    }
    local v1752 = v_u_4
    local v1753 = v_u_1749
    return setmetatable(v1753, v1752)
end
local v_u_1754 = "GuiService"
function v5.GuiService()
    local v_u_1755 = nil
    v_u_1755 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1756)
            if typeof(p1756) == "Instance" then
                if p1756:IsA(v_u_1754) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1755, p1756, (("expected %*, got %*"):format(v_u_1754, p1756.ClassName)))
                end
            else
                return v_u_3.err(v_u_1755, p1756, (("expected %*, got %*"):format(v_u_1754, (typeof(p1756)))))
            end
        end,
        ["_format"] = function(p1757, _, _)
            return v_u_2(v_u_1754, p1757[v_u_1755])
        end
    }
    local v1758 = v_u_4
    local v1759 = v_u_1755
    return setmetatable(v1759, v1758)
end
local v_u_1760 = "GuidRegistryService"
function v5.GuidRegistryService()
    local v_u_1761 = nil
    v_u_1761 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1762)
            if typeof(p1762) == "Instance" then
                if p1762:IsA(v_u_1760) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1761, p1762, (("expected %*, got %*"):format(v_u_1760, p1762.ClassName)))
                end
            else
                return v_u_3.err(v_u_1761, p1762, (("expected %*, got %*"):format(v_u_1760, (typeof(p1762)))))
            end
        end,
        ["_format"] = function(p1763, _, _)
            return v_u_2(v_u_1760, p1763[v_u_1761])
        end
    }
    local v1764 = v_u_4
    local v1765 = v_u_1761
    return setmetatable(v1765, v1764)
end
local v_u_1766 = "HapticService"
function v5.HapticService()
    local v_u_1767 = nil
    v_u_1767 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1768)
            if typeof(p1768) == "Instance" then
                if p1768:IsA(v_u_1766) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1767, p1768, (("expected %*, got %*"):format(v_u_1766, p1768.ClassName)))
                end
            else
                return v_u_3.err(v_u_1767, p1768, (("expected %*, got %*"):format(v_u_1766, (typeof(p1768)))))
            end
        end,
        ["_format"] = function(p1769, _, _)
            return v_u_2(v_u_1766, p1769[v_u_1767])
        end
    }
    local v1770 = v_u_4
    local v1771 = v_u_1767
    return setmetatable(v1771, v1770)
end
local v_u_1772 = "HeightmapImporterService"
function v5.HeightmapImporterService()
    local v_u_1773 = nil
    v_u_1773 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1774)
            if typeof(p1774) == "Instance" then
                if p1774:IsA(v_u_1772) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1773, p1774, (("expected %*, got %*"):format(v_u_1772, p1774.ClassName)))
                end
            else
                return v_u_3.err(v_u_1773, p1774, (("expected %*, got %*"):format(v_u_1772, (typeof(p1774)))))
            end
        end,
        ["_format"] = function(p1775, _, _)
            return v_u_2(v_u_1772, p1775[v_u_1773])
        end
    }
    local v1776 = v_u_4
    local v1777 = v_u_1773
    return setmetatable(v1777, v1776)
end
local v_u_1778 = "HiddenSurfaceRemovalAsset"
function v5.HiddenSurfaceRemovalAsset()
    local v_u_1779 = nil
    v_u_1779 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1780)
            if typeof(p1780) == "Instance" then
                if p1780:IsA(v_u_1778) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1779, p1780, (("expected %*, got %*"):format(v_u_1778, p1780.ClassName)))
                end
            else
                return v_u_3.err(v_u_1779, p1780, (("expected %*, got %*"):format(v_u_1778, (typeof(p1780)))))
            end
        end,
        ["_format"] = function(p1781, _, _)
            return v_u_2(v_u_1778, p1781[v_u_1779])
        end
    }
    local v1782 = v_u_4
    local v1783 = v_u_1779
    return setmetatable(v1783, v1782)
end
local v_u_1784 = "Highlight"
function v5.Highlight()
    local v_u_1785 = nil
    v_u_1785 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1786)
            if typeof(p1786) == "Instance" then
                if p1786:IsA(v_u_1784) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1785, p1786, (("expected %*, got %*"):format(v_u_1784, p1786.ClassName)))
                end
            else
                return v_u_3.err(v_u_1785, p1786, (("expected %*, got %*"):format(v_u_1784, (typeof(p1786)))))
            end
        end,
        ["_format"] = function(p1787, _, _)
            return v_u_2(v_u_1784, p1787[v_u_1785])
        end
    }
    local v1788 = v_u_4
    local v1789 = v_u_1785
    return setmetatable(v1789, v1788)
end
local v_u_1790 = "Hopper"
function v5.Hopper()
    local v_u_1791 = nil
    v_u_1791 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1792)
            if typeof(p1792) == "Instance" then
                if p1792:IsA(v_u_1790) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1791, p1792, (("expected %*, got %*"):format(v_u_1790, p1792.ClassName)))
                end
            else
                return v_u_3.err(v_u_1791, p1792, (("expected %*, got %*"):format(v_u_1790, (typeof(p1792)))))
            end
        end,
        ["_format"] = function(p1793, _, _)
            return v_u_2(v_u_1790, p1793[v_u_1791])
        end
    }
    local v1794 = v_u_4
    local v1795 = v_u_1791
    return setmetatable(v1795, v1794)
end
local v_u_1796 = "HttpRbxApiService"
function v5.HttpRbxApiService()
    local v_u_1797 = nil
    v_u_1797 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1798)
            if typeof(p1798) == "Instance" then
                if p1798:IsA(v_u_1796) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1797, p1798, (("expected %*, got %*"):format(v_u_1796, p1798.ClassName)))
                end
            else
                return v_u_3.err(v_u_1797, p1798, (("expected %*, got %*"):format(v_u_1796, (typeof(p1798)))))
            end
        end,
        ["_format"] = function(p1799, _, _)
            return v_u_2(v_u_1796, p1799[v_u_1797])
        end
    }
    local v1800 = v_u_4
    local v1801 = v_u_1797
    return setmetatable(v1801, v1800)
end
local v_u_1802 = "HttpRequest"
function v5.HttpRequest()
    local v_u_1803 = nil
    v_u_1803 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1804)
            if typeof(p1804) == "Instance" then
                if p1804:IsA(v_u_1802) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1803, p1804, (("expected %*, got %*"):format(v_u_1802, p1804.ClassName)))
                end
            else
                return v_u_3.err(v_u_1803, p1804, (("expected %*, got %*"):format(v_u_1802, (typeof(p1804)))))
            end
        end,
        ["_format"] = function(p1805, _, _)
            return v_u_2(v_u_1802, p1805[v_u_1803])
        end
    }
    local v1806 = v_u_4
    local v1807 = v_u_1803
    return setmetatable(v1807, v1806)
end
local v_u_1808 = "HttpService"
function v5.HttpService()
    local v_u_1809 = nil
    v_u_1809 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1810)
            if typeof(p1810) == "Instance" then
                if p1810:IsA(v_u_1808) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1809, p1810, (("expected %*, got %*"):format(v_u_1808, p1810.ClassName)))
                end
            else
                return v_u_3.err(v_u_1809, p1810, (("expected %*, got %*"):format(v_u_1808, (typeof(p1810)))))
            end
        end,
        ["_format"] = function(p1811, _, _)
            return v_u_2(v_u_1808, p1811[v_u_1809])
        end
    }
    local v1812 = v_u_4
    local v1813 = v_u_1809
    return setmetatable(v1813, v1812)
end
local v_u_1814 = "Humanoid"
function v5.Humanoid()
    local v_u_1815 = nil
    v_u_1815 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1816)
            if typeof(p1816) == "Instance" then
                if p1816:IsA(v_u_1814) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1815, p1816, (("expected %*, got %*"):format(v_u_1814, p1816.ClassName)))
                end
            else
                return v_u_3.err(v_u_1815, p1816, (("expected %*, got %*"):format(v_u_1814, (typeof(p1816)))))
            end
        end,
        ["_format"] = function(p1817, _, _)
            return v_u_2(v_u_1814, p1817[v_u_1815])
        end
    }
    local v1818 = v_u_4
    local v1819 = v_u_1815
    return setmetatable(v1819, v1818)
end
local v_u_1820 = "HumanoidDescription"
function v5.HumanoidDescription()
    local v_u_1821 = nil
    v_u_1821 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1822)
            if typeof(p1822) == "Instance" then
                if p1822:IsA(v_u_1820) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1821, p1822, (("expected %*, got %*"):format(v_u_1820, p1822.ClassName)))
                end
            else
                return v_u_3.err(v_u_1821, p1822, (("expected %*, got %*"):format(v_u_1820, (typeof(p1822)))))
            end
        end,
        ["_format"] = function(p1823, _, _)
            return v_u_2(v_u_1820, p1823[v_u_1821])
        end
    }
    local v1824 = v_u_4
    local v1825 = v_u_1821
    return setmetatable(v1825, v1824)
end
local v_u_1826 = "IKControl"
function v5.IKControl()
    local v_u_1827 = nil
    v_u_1827 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1828)
            if typeof(p1828) == "Instance" then
                if p1828:IsA(v_u_1826) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1827, p1828, (("expected %*, got %*"):format(v_u_1826, p1828.ClassName)))
                end
            else
                return v_u_3.err(v_u_1827, p1828, (("expected %*, got %*"):format(v_u_1826, (typeof(p1828)))))
            end
        end,
        ["_format"] = function(p1829, _, _)
            return v_u_2(v_u_1826, p1829[v_u_1827])
        end
    }
    local v1830 = v_u_4
    local v1831 = v_u_1827
    return setmetatable(v1831, v1830)
end
local v_u_1832 = "ILegacyStudioBridge"
function v5.ILegacyStudioBridge()
    local v_u_1833 = nil
    v_u_1833 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1834)
            if typeof(p1834) == "Instance" then
                if p1834:IsA(v_u_1832) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1833, p1834, (("expected %*, got %*"):format(v_u_1832, p1834.ClassName)))
                end
            else
                return v_u_3.err(v_u_1833, p1834, (("expected %*, got %*"):format(v_u_1832, (typeof(p1834)))))
            end
        end,
        ["_format"] = function(p1835, _, _)
            return v_u_2(v_u_1832, p1835[v_u_1833])
        end
    }
    local v1836 = v_u_4
    local v1837 = v_u_1833
    return setmetatable(v1837, v1836)
end
local v_u_1838 = "LegacyStudioBridge"
function v5.LegacyStudioBridge()
    local v_u_1839 = nil
    v_u_1839 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1840)
            if typeof(p1840) == "Instance" then
                if p1840:IsA(v_u_1838) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1839, p1840, (("expected %*, got %*"):format(v_u_1838, p1840.ClassName)))
                end
            else
                return v_u_3.err(v_u_1839, p1840, (("expected %*, got %*"):format(v_u_1838, (typeof(p1840)))))
            end
        end,
        ["_format"] = function(p1841, _, _)
            return v_u_2(v_u_1838, p1841[v_u_1839])
        end
    }
    local v1842 = v_u_4
    local v1843 = v_u_1839
    return setmetatable(v1843, v1842)
end
local v_u_1844 = "IXPService"
function v5.IXPService()
    local v_u_1845 = nil
    v_u_1845 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1846)
            if typeof(p1846) == "Instance" then
                if p1846:IsA(v_u_1844) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1845, p1846, (("expected %*, got %*"):format(v_u_1844, p1846.ClassName)))
                end
            else
                return v_u_3.err(v_u_1845, p1846, (("expected %*, got %*"):format(v_u_1844, (typeof(p1846)))))
            end
        end,
        ["_format"] = function(p1847, _, _)
            return v_u_2(v_u_1844, p1847[v_u_1845])
        end
    }
    local v1848 = v_u_4
    local v1849 = v_u_1845
    return setmetatable(v1849, v1848)
end
local v_u_1850 = "IncrementalPatchBuilder"
function v5.IncrementalPatchBuilder()
    local v_u_1851 = nil
    v_u_1851 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1852)
            if typeof(p1852) == "Instance" then
                if p1852:IsA(v_u_1850) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1851, p1852, (("expected %*, got %*"):format(v_u_1850, p1852.ClassName)))
                end
            else
                return v_u_3.err(v_u_1851, p1852, (("expected %*, got %*"):format(v_u_1850, (typeof(p1852)))))
            end
        end,
        ["_format"] = function(p1853, _, _)
            return v_u_2(v_u_1850, p1853[v_u_1851])
        end
    }
    local v1854 = v_u_4
    local v1855 = v_u_1851
    return setmetatable(v1855, v1854)
end
local v_u_1856 = "InputObject"
function v5.InputObject()
    local v_u_1857 = nil
    v_u_1857 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1858)
            if typeof(p1858) == "Instance" then
                if p1858:IsA(v_u_1856) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1857, p1858, (("expected %*, got %*"):format(v_u_1856, p1858.ClassName)))
                end
            else
                return v_u_3.err(v_u_1857, p1858, (("expected %*, got %*"):format(v_u_1856, (typeof(p1858)))))
            end
        end,
        ["_format"] = function(p1859, _, _)
            return v_u_2(v_u_1856, p1859[v_u_1857])
        end
    }
    local v1860 = v_u_4
    local v1861 = v_u_1857
    return setmetatable(v1861, v1860)
end
local v_u_1862 = "InsertService"
function v5.InsertService()
    local v_u_1863 = nil
    v_u_1863 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1864)
            if typeof(p1864) == "Instance" then
                if p1864:IsA(v_u_1862) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1863, p1864, (("expected %*, got %*"):format(v_u_1862, p1864.ClassName)))
                end
            else
                return v_u_3.err(v_u_1863, p1864, (("expected %*, got %*"):format(v_u_1862, (typeof(p1864)))))
            end
        end,
        ["_format"] = function(p1865, _, _)
            return v_u_2(v_u_1862, p1865[v_u_1863])
        end
    }
    local v1866 = v_u_4
    local v1867 = v_u_1863
    return setmetatable(v1867, v1866)
end
local v_u_1868 = "JointInstance"
function v5.JointInstance()
    local v_u_1869 = nil
    v_u_1869 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1870)
            if typeof(p1870) == "Instance" then
                if p1870:IsA(v_u_1868) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1869, p1870, (("expected %*, got %*"):format(v_u_1868, p1870.ClassName)))
                end
            else
                return v_u_3.err(v_u_1869, p1870, (("expected %*, got %*"):format(v_u_1868, (typeof(p1870)))))
            end
        end,
        ["_format"] = function(p1871, _, _)
            return v_u_2(v_u_1868, p1871[v_u_1869])
        end
    }
    local v1872 = v_u_4
    local v1873 = v_u_1869
    return setmetatable(v1873, v1872)
end
local v_u_1874 = "DynamicRotate"
function v5.DynamicRotate()
    local v_u_1875 = nil
    v_u_1875 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1876)
            if typeof(p1876) == "Instance" then
                if p1876:IsA(v_u_1874) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1875, p1876, (("expected %*, got %*"):format(v_u_1874, p1876.ClassName)))
                end
            else
                return v_u_3.err(v_u_1875, p1876, (("expected %*, got %*"):format(v_u_1874, (typeof(p1876)))))
            end
        end,
        ["_format"] = function(p1877, _, _)
            return v_u_2(v_u_1874, p1877[v_u_1875])
        end
    }
    local v1878 = v_u_4
    local v1879 = v_u_1875
    return setmetatable(v1879, v1878)
end
local v_u_1880 = "RotateP"
function v5.RotateP()
    local v_u_1881 = nil
    v_u_1881 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1882)
            if typeof(p1882) == "Instance" then
                if p1882:IsA(v_u_1880) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1881, p1882, (("expected %*, got %*"):format(v_u_1880, p1882.ClassName)))
                end
            else
                return v_u_3.err(v_u_1881, p1882, (("expected %*, got %*"):format(v_u_1880, (typeof(p1882)))))
            end
        end,
        ["_format"] = function(p1883, _, _)
            return v_u_2(v_u_1880, p1883[v_u_1881])
        end
    }
    local v1884 = v_u_4
    local v1885 = v_u_1881
    return setmetatable(v1885, v1884)
end
local v_u_1886 = "RotateV"
function v5.RotateV()
    local v_u_1887 = nil
    v_u_1887 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1888)
            if typeof(p1888) == "Instance" then
                if p1888:IsA(v_u_1886) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1887, p1888, (("expected %*, got %*"):format(v_u_1886, p1888.ClassName)))
                end
            else
                return v_u_3.err(v_u_1887, p1888, (("expected %*, got %*"):format(v_u_1886, (typeof(p1888)))))
            end
        end,
        ["_format"] = function(p1889, _, _)
            return v_u_2(v_u_1886, p1889[v_u_1887])
        end
    }
    local v1890 = v_u_4
    local v1891 = v_u_1887
    return setmetatable(v1891, v1890)
end
local v_u_1892 = "Glue"
function v5.Glue()
    local v_u_1893 = nil
    v_u_1893 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1894)
            if typeof(p1894) == "Instance" then
                if p1894:IsA(v_u_1892) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1893, p1894, (("expected %*, got %*"):format(v_u_1892, p1894.ClassName)))
                end
            else
                return v_u_3.err(v_u_1893, p1894, (("expected %*, got %*"):format(v_u_1892, (typeof(p1894)))))
            end
        end,
        ["_format"] = function(p1895, _, _)
            return v_u_2(v_u_1892, p1895[v_u_1893])
        end
    }
    local v1896 = v_u_4
    local v1897 = v_u_1893
    return setmetatable(v1897, v1896)
end
local v_u_1898 = "ManualSurfaceJointInstance"
function v5.ManualSurfaceJointInstance()
    local v_u_1899 = nil
    v_u_1899 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1900)
            if typeof(p1900) == "Instance" then
                if p1900:IsA(v_u_1898) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1899, p1900, (("expected %*, got %*"):format(v_u_1898, p1900.ClassName)))
                end
            else
                return v_u_3.err(v_u_1899, p1900, (("expected %*, got %*"):format(v_u_1898, (typeof(p1900)))))
            end
        end,
        ["_format"] = function(p1901, _, _)
            return v_u_2(v_u_1898, p1901[v_u_1899])
        end
    }
    local v1902 = v_u_4
    local v1903 = v_u_1899
    return setmetatable(v1903, v1902)
end
local v_u_1904 = "ManualGlue"
function v5.ManualGlue()
    local v_u_1905 = nil
    v_u_1905 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1906)
            if typeof(p1906) == "Instance" then
                if p1906:IsA(v_u_1904) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1905, p1906, (("expected %*, got %*"):format(v_u_1904, p1906.ClassName)))
                end
            else
                return v_u_3.err(v_u_1905, p1906, (("expected %*, got %*"):format(v_u_1904, (typeof(p1906)))))
            end
        end,
        ["_format"] = function(p1907, _, _)
            return v_u_2(v_u_1904, p1907[v_u_1905])
        end
    }
    local v1908 = v_u_4
    local v1909 = v_u_1905
    return setmetatable(v1909, v1908)
end
local v_u_1910 = "ManualWeld"
function v5.ManualWeld()
    local v_u_1911 = nil
    v_u_1911 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1912)
            if typeof(p1912) == "Instance" then
                if p1912:IsA(v_u_1910) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1911, p1912, (("expected %*, got %*"):format(v_u_1910, p1912.ClassName)))
                end
            else
                return v_u_3.err(v_u_1911, p1912, (("expected %*, got %*"):format(v_u_1910, (typeof(p1912)))))
            end
        end,
        ["_format"] = function(p1913, _, _)
            return v_u_2(v_u_1910, p1913[v_u_1911])
        end
    }
    local v1914 = v_u_4
    local v1915 = v_u_1911
    return setmetatable(v1915, v1914)
end
local v_u_1916 = "Motor"
function v5.Motor()
    local v_u_1917 = nil
    v_u_1917 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1918)
            if typeof(p1918) == "Instance" then
                if p1918:IsA(v_u_1916) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1917, p1918, (("expected %*, got %*"):format(v_u_1916, p1918.ClassName)))
                end
            else
                return v_u_3.err(v_u_1917, p1918, (("expected %*, got %*"):format(v_u_1916, (typeof(p1918)))))
            end
        end,
        ["_format"] = function(p1919, _, _)
            return v_u_2(v_u_1916, p1919[v_u_1917])
        end
    }
    local v1920 = v_u_4
    local v1921 = v_u_1917
    return setmetatable(v1921, v1920)
end
local v_u_1922 = "Motor6D"
function v5.Motor6D()
    local v_u_1923 = nil
    v_u_1923 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1924)
            if typeof(p1924) == "Instance" then
                if p1924:IsA(v_u_1922) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1923, p1924, (("expected %*, got %*"):format(v_u_1922, p1924.ClassName)))
                end
            else
                return v_u_3.err(v_u_1923, p1924, (("expected %*, got %*"):format(v_u_1922, (typeof(p1924)))))
            end
        end,
        ["_format"] = function(p1925, _, _)
            return v_u_2(v_u_1922, p1925[v_u_1923])
        end
    }
    local v1926 = v_u_4
    local v1927 = v_u_1923
    return setmetatable(v1927, v1926)
end
local v_u_1928 = "Rotate"
function v5.Rotate()
    local v_u_1929 = nil
    v_u_1929 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1930)
            if typeof(p1930) == "Instance" then
                if p1930:IsA(v_u_1928) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1929, p1930, (("expected %*, got %*"):format(v_u_1928, p1930.ClassName)))
                end
            else
                return v_u_3.err(v_u_1929, p1930, (("expected %*, got %*"):format(v_u_1928, (typeof(p1930)))))
            end
        end,
        ["_format"] = function(p1931, _, _)
            return v_u_2(v_u_1928, p1931[v_u_1929])
        end
    }
    local v1932 = v_u_4
    local v1933 = v_u_1929
    return setmetatable(v1933, v1932)
end
local v_u_1934 = "Snap"
function v5.Snap()
    local v_u_1935 = nil
    v_u_1935 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1936)
            if typeof(p1936) == "Instance" then
                if p1936:IsA(v_u_1934) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1935, p1936, (("expected %*, got %*"):format(v_u_1934, p1936.ClassName)))
                end
            else
                return v_u_3.err(v_u_1935, p1936, (("expected %*, got %*"):format(v_u_1934, (typeof(p1936)))))
            end
        end,
        ["_format"] = function(p1937, _, _)
            return v_u_2(v_u_1934, p1937[v_u_1935])
        end
    }
    local v1938 = v_u_4
    local v1939 = v_u_1935
    return setmetatable(v1939, v1938)
end
local v_u_1940 = "VelocityMotor"
function v5.VelocityMotor()
    local v_u_1941 = nil
    v_u_1941 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1942)
            if typeof(p1942) == "Instance" then
                if p1942:IsA(v_u_1940) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1941, p1942, (("expected %*, got %*"):format(v_u_1940, p1942.ClassName)))
                end
            else
                return v_u_3.err(v_u_1941, p1942, (("expected %*, got %*"):format(v_u_1940, (typeof(p1942)))))
            end
        end,
        ["_format"] = function(p1943, _, _)
            return v_u_2(v_u_1940, p1943[v_u_1941])
        end
    }
    local v1944 = v_u_4
    local v1945 = v_u_1941
    return setmetatable(v1945, v1944)
end
local v_u_1946 = "Weld"
function v5.Weld()
    local v_u_1947 = nil
    v_u_1947 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1948)
            if typeof(p1948) == "Instance" then
                if p1948:IsA(v_u_1946) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1947, p1948, (("expected %*, got %*"):format(v_u_1946, p1948.ClassName)))
                end
            else
                return v_u_3.err(v_u_1947, p1948, (("expected %*, got %*"):format(v_u_1946, (typeof(p1948)))))
            end
        end,
        ["_format"] = function(p1949, _, _)
            return v_u_2(v_u_1946, p1949[v_u_1947])
        end
    }
    local v1950 = v_u_4
    local v1951 = v_u_1947
    return setmetatable(v1951, v1950)
end
local v_u_1952 = "JointsService"
function v5.JointsService()
    local v_u_1953 = nil
    v_u_1953 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1954)
            if typeof(p1954) == "Instance" then
                if p1954:IsA(v_u_1952) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1953, p1954, (("expected %*, got %*"):format(v_u_1952, p1954.ClassName)))
                end
            else
                return v_u_3.err(v_u_1953, p1954, (("expected %*, got %*"):format(v_u_1952, (typeof(p1954)))))
            end
        end,
        ["_format"] = function(p1955, _, _)
            return v_u_2(v_u_1952, p1955[v_u_1953])
        end
    }
    local v1956 = v_u_4
    local v1957 = v_u_1953
    return setmetatable(v1957, v1956)
end
local v_u_1958 = "KeyboardService"
function v5.KeyboardService()
    local v_u_1959 = nil
    v_u_1959 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1960)
            if typeof(p1960) == "Instance" then
                if p1960:IsA(v_u_1958) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1959, p1960, (("expected %*, got %*"):format(v_u_1958, p1960.ClassName)))
                end
            else
                return v_u_3.err(v_u_1959, p1960, (("expected %*, got %*"):format(v_u_1958, (typeof(p1960)))))
            end
        end,
        ["_format"] = function(p1961, _, _)
            return v_u_2(v_u_1958, p1961[v_u_1959])
        end
    }
    local v1962 = v_u_4
    local v1963 = v_u_1959
    return setmetatable(v1963, v1962)
end
local v_u_1964 = "Keyframe"
function v5.Keyframe()
    local v_u_1965 = nil
    v_u_1965 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1966)
            if typeof(p1966) == "Instance" then
                if p1966:IsA(v_u_1964) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1965, p1966, (("expected %*, got %*"):format(v_u_1964, p1966.ClassName)))
                end
            else
                return v_u_3.err(v_u_1965, p1966, (("expected %*, got %*"):format(v_u_1964, (typeof(p1966)))))
            end
        end,
        ["_format"] = function(p1967, _, _)
            return v_u_2(v_u_1964, p1967[v_u_1965])
        end
    }
    local v1968 = v_u_4
    local v1969 = v_u_1965
    return setmetatable(v1969, v1968)
end
local v_u_1970 = "KeyframeMarker"
function v5.KeyframeMarker()
    local v_u_1971 = nil
    v_u_1971 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1972)
            if typeof(p1972) == "Instance" then
                if p1972:IsA(v_u_1970) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1971, p1972, (("expected %*, got %*"):format(v_u_1970, p1972.ClassName)))
                end
            else
                return v_u_3.err(v_u_1971, p1972, (("expected %*, got %*"):format(v_u_1970, (typeof(p1972)))))
            end
        end,
        ["_format"] = function(p1973, _, _)
            return v_u_2(v_u_1970, p1973[v_u_1971])
        end
    }
    local v1974 = v_u_4
    local v1975 = v_u_1971
    return setmetatable(v1975, v1974)
end
local v_u_1976 = "KeyframeSequenceProvider"
function v5.KeyframeSequenceProvider()
    local v_u_1977 = nil
    v_u_1977 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1978)
            if typeof(p1978) == "Instance" then
                if p1978:IsA(v_u_1976) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1977, p1978, (("expected %*, got %*"):format(v_u_1976, p1978.ClassName)))
                end
            else
                return v_u_3.err(v_u_1977, p1978, (("expected %*, got %*"):format(v_u_1976, (typeof(p1978)))))
            end
        end,
        ["_format"] = function(p1979, _, _)
            return v_u_2(v_u_1976, p1979[v_u_1977])
        end
    }
    local v1980 = v_u_4
    local v1981 = v_u_1977
    return setmetatable(v1981, v1980)
end
local v_u_1982 = "LSPFileSyncService"
function v5.LSPFileSyncService()
    local v_u_1983 = nil
    v_u_1983 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1984)
            if typeof(p1984) == "Instance" then
                if p1984:IsA(v_u_1982) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1983, p1984, (("expected %*, got %*"):format(v_u_1982, p1984.ClassName)))
                end
            else
                return v_u_3.err(v_u_1983, p1984, (("expected %*, got %*"):format(v_u_1982, (typeof(p1984)))))
            end
        end,
        ["_format"] = function(p1985, _, _)
            return v_u_2(v_u_1982, p1985[v_u_1983])
        end
    }
    local v1986 = v_u_4
    local v1987 = v_u_1983
    return setmetatable(v1987, v1986)
end
local v_u_1988 = "LanguageService"
function v5.LanguageService()
    local v_u_1989 = nil
    v_u_1989 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1990)
            if typeof(p1990) == "Instance" then
                if p1990:IsA(v_u_1988) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1989, p1990, (("expected %*, got %*"):format(v_u_1988, p1990.ClassName)))
                end
            else
                return v_u_3.err(v_u_1989, p1990, (("expected %*, got %*"):format(v_u_1988, (typeof(p1990)))))
            end
        end,
        ["_format"] = function(p1991, _, _)
            return v_u_2(v_u_1988, p1991[v_u_1989])
        end
    }
    local v1992 = v_u_4
    local v1993 = v_u_1989
    return setmetatable(v1993, v1992)
end
local v_u_1994 = "Light"
function v5.Light()
    local v_u_1995 = nil
    v_u_1995 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p1996)
            if typeof(p1996) == "Instance" then
                if p1996:IsA(v_u_1994) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_1995, p1996, (("expected %*, got %*"):format(v_u_1994, p1996.ClassName)))
                end
            else
                return v_u_3.err(v_u_1995, p1996, (("expected %*, got %*"):format(v_u_1994, (typeof(p1996)))))
            end
        end,
        ["_format"] = function(p1997, _, _)
            return v_u_2(v_u_1994, p1997[v_u_1995])
        end
    }
    local v1998 = v_u_4
    local v1999 = v_u_1995
    return setmetatable(v1999, v1998)
end
local v_u_2000 = "PointLight"
function v5.PointLight()
    local v_u_2001 = nil
    v_u_2001 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2002)
            if typeof(p2002) == "Instance" then
                if p2002:IsA(v_u_2000) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2001, p2002, (("expected %*, got %*"):format(v_u_2000, p2002.ClassName)))
                end
            else
                return v_u_3.err(v_u_2001, p2002, (("expected %*, got %*"):format(v_u_2000, (typeof(p2002)))))
            end
        end,
        ["_format"] = function(p2003, _, _)
            return v_u_2(v_u_2000, p2003[v_u_2001])
        end
    }
    local v2004 = v_u_4
    local v2005 = v_u_2001
    return setmetatable(v2005, v2004)
end
local v_u_2006 = "SpotLight"
function v5.SpotLight()
    local v_u_2007 = nil
    v_u_2007 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2008)
            if typeof(p2008) == "Instance" then
                if p2008:IsA(v_u_2006) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2007, p2008, (("expected %*, got %*"):format(v_u_2006, p2008.ClassName)))
                end
            else
                return v_u_3.err(v_u_2007, p2008, (("expected %*, got %*"):format(v_u_2006, (typeof(p2008)))))
            end
        end,
        ["_format"] = function(p2009, _, _)
            return v_u_2(v_u_2006, p2009[v_u_2007])
        end
    }
    local v2010 = v_u_4
    local v2011 = v_u_2007
    return setmetatable(v2011, v2010)
end
local v_u_2012 = "SurfaceLight"
function v5.SurfaceLight()
    local v_u_2013 = nil
    v_u_2013 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2014)
            if typeof(p2014) == "Instance" then
                if p2014:IsA(v_u_2012) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2013, p2014, (("expected %*, got %*"):format(v_u_2012, p2014.ClassName)))
                end
            else
                return v_u_3.err(v_u_2013, p2014, (("expected %*, got %*"):format(v_u_2012, (typeof(p2014)))))
            end
        end,
        ["_format"] = function(p2015, _, _)
            return v_u_2(v_u_2012, p2015[v_u_2013])
        end
    }
    local v2016 = v_u_4
    local v2017 = v_u_2013
    return setmetatable(v2017, v2016)
end
local v_u_2018 = "Lighting"
function v5.Lighting()
    local v_u_2019 = nil
    v_u_2019 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2020)
            if typeof(p2020) == "Instance" then
                if p2020:IsA(v_u_2018) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2019, p2020, (("expected %*, got %*"):format(v_u_2018, p2020.ClassName)))
                end
            else
                return v_u_3.err(v_u_2019, p2020, (("expected %*, got %*"):format(v_u_2018, (typeof(p2020)))))
            end
        end,
        ["_format"] = function(p2021, _, _)
            return v_u_2(v_u_2018, p2021[v_u_2019])
        end
    }
    local v2022 = v_u_4
    local v2023 = v_u_2019
    return setmetatable(v2023, v2022)
end
local v_u_2024 = "LiveScriptingService"
function v5.LiveScriptingService()
    local v_u_2025 = nil
    v_u_2025 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2026)
            if typeof(p2026) == "Instance" then
                if p2026:IsA(v_u_2024) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2025, p2026, (("expected %*, got %*"):format(v_u_2024, p2026.ClassName)))
                end
            else
                return v_u_3.err(v_u_2025, p2026, (("expected %*, got %*"):format(v_u_2024, (typeof(p2026)))))
            end
        end,
        ["_format"] = function(p2027, _, _)
            return v_u_2(v_u_2024, p2027[v_u_2025])
        end
    }
    local v2028 = v_u_4
    local v2029 = v_u_2025
    return setmetatable(v2029, v2028)
end
local v_u_2030 = "LocalStorageService"
function v5.LocalStorageService()
    local v_u_2031 = nil
    v_u_2031 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2032)
            if typeof(p2032) == "Instance" then
                if p2032:IsA(v_u_2030) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2031, p2032, (("expected %*, got %*"):format(v_u_2030, p2032.ClassName)))
                end
            else
                return v_u_3.err(v_u_2031, p2032, (("expected %*, got %*"):format(v_u_2030, (typeof(p2032)))))
            end
        end,
        ["_format"] = function(p2033, _, _)
            return v_u_2(v_u_2030, p2033[v_u_2031])
        end
    }
    local v2034 = v_u_4
    local v2035 = v_u_2031
    return setmetatable(v2035, v2034)
end
local v_u_2036 = "AppStorageService"
function v5.AppStorageService()
    local v_u_2037 = nil
    v_u_2037 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2038)
            if typeof(p2038) == "Instance" then
                if p2038:IsA(v_u_2036) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2037, p2038, (("expected %*, got %*"):format(v_u_2036, p2038.ClassName)))
                end
            else
                return v_u_3.err(v_u_2037, p2038, (("expected %*, got %*"):format(v_u_2036, (typeof(p2038)))))
            end
        end,
        ["_format"] = function(p2039, _, _)
            return v_u_2(v_u_2036, p2039[v_u_2037])
        end
    }
    local v2040 = v_u_4
    local v2041 = v_u_2037
    return setmetatable(v2041, v2040)
end
local v_u_2042 = "UserStorageService"
function v5.UserStorageService()
    local v_u_2043 = nil
    v_u_2043 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2044)
            if typeof(p2044) == "Instance" then
                if p2044:IsA(v_u_2042) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2043, p2044, (("expected %*, got %*"):format(v_u_2042, p2044.ClassName)))
                end
            else
                return v_u_3.err(v_u_2043, p2044, (("expected %*, got %*"):format(v_u_2042, (typeof(p2044)))))
            end
        end,
        ["_format"] = function(p2045, _, _)
            return v_u_2(v_u_2042, p2045[v_u_2043])
        end
    }
    local v2046 = v_u_4
    local v2047 = v_u_2043
    return setmetatable(v2047, v2046)
end
local v_u_2048 = "LocalizationService"
function v5.LocalizationService()
    local v_u_2049 = nil
    v_u_2049 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2050)
            if typeof(p2050) == "Instance" then
                if p2050:IsA(v_u_2048) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2049, p2050, (("expected %*, got %*"):format(v_u_2048, p2050.ClassName)))
                end
            else
                return v_u_3.err(v_u_2049, p2050, (("expected %*, got %*"):format(v_u_2048, (typeof(p2050)))))
            end
        end,
        ["_format"] = function(p2051, _, _)
            return v_u_2(v_u_2048, p2051[v_u_2049])
        end
    }
    local v2052 = v_u_4
    local v2053 = v_u_2049
    return setmetatable(v2053, v2052)
end
local v_u_2054 = "LocalizationTable"
function v5.LocalizationTable()
    local v_u_2055 = nil
    v_u_2055 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2056)
            if typeof(p2056) == "Instance" then
                if p2056:IsA(v_u_2054) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2055, p2056, (("expected %*, got %*"):format(v_u_2054, p2056.ClassName)))
                end
            else
                return v_u_3.err(v_u_2055, p2056, (("expected %*, got %*"):format(v_u_2054, (typeof(p2056)))))
            end
        end,
        ["_format"] = function(p2057, _, _)
            return v_u_2(v_u_2054, p2057[v_u_2055])
        end
    }
    local v2058 = v_u_4
    local v2059 = v_u_2055
    return setmetatable(v2059, v2058)
end
local v_u_2060 = "CloudLocalizationTable"
function v5.CloudLocalizationTable()
    local v_u_2061 = nil
    v_u_2061 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2062)
            if typeof(p2062) == "Instance" then
                if p2062:IsA(v_u_2060) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2061, p2062, (("expected %*, got %*"):format(v_u_2060, p2062.ClassName)))
                end
            else
                return v_u_3.err(v_u_2061, p2062, (("expected %*, got %*"):format(v_u_2060, (typeof(p2062)))))
            end
        end,
        ["_format"] = function(p2063, _, _)
            return v_u_2(v_u_2060, p2063[v_u_2061])
        end
    }
    local v2064 = v_u_4
    local v2065 = v_u_2061
    return setmetatable(v2065, v2064)
end
local v_u_2066 = "LodDataEntity"
function v5.LodDataEntity()
    local v_u_2067 = nil
    v_u_2067 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2068)
            if typeof(p2068) == "Instance" then
                if p2068:IsA(v_u_2066) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2067, p2068, (("expected %*, got %*"):format(v_u_2066, p2068.ClassName)))
                end
            else
                return v_u_3.err(v_u_2067, p2068, (("expected %*, got %*"):format(v_u_2066, (typeof(p2068)))))
            end
        end,
        ["_format"] = function(p2069, _, _)
            return v_u_2(v_u_2066, p2069[v_u_2067])
        end
    }
    local v2070 = v_u_4
    local v2071 = v_u_2067
    return setmetatable(v2071, v2070)
end
local v_u_2072 = "LodDataService"
function v5.LodDataService()
    local v_u_2073 = nil
    v_u_2073 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2074)
            if typeof(p2074) == "Instance" then
                if p2074:IsA(v_u_2072) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2073, p2074, (("expected %*, got %*"):format(v_u_2072, p2074.ClassName)))
                end
            else
                return v_u_3.err(v_u_2073, p2074, (("expected %*, got %*"):format(v_u_2072, (typeof(p2074)))))
            end
        end,
        ["_format"] = function(p2075, _, _)
            return v_u_2(v_u_2072, p2075[v_u_2073])
        end
    }
    local v2076 = v_u_4
    local v2077 = v_u_2073
    return setmetatable(v2077, v2076)
end
local v_u_2078 = "LogReporterService"
function v5.LogReporterService()
    local v_u_2079 = nil
    v_u_2079 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2080)
            if typeof(p2080) == "Instance" then
                if p2080:IsA(v_u_2078) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2079, p2080, (("expected %*, got %*"):format(v_u_2078, p2080.ClassName)))
                end
            else
                return v_u_3.err(v_u_2079, p2080, (("expected %*, got %*"):format(v_u_2078, (typeof(p2080)))))
            end
        end,
        ["_format"] = function(p2081, _, _)
            return v_u_2(v_u_2078, p2081[v_u_2079])
        end
    }
    local v2082 = v_u_4
    local v2083 = v_u_2079
    return setmetatable(v2083, v2082)
end
local v_u_2084 = "LogService"
function v5.LogService()
    local v_u_2085 = nil
    v_u_2085 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2086)
            if typeof(p2086) == "Instance" then
                if p2086:IsA(v_u_2084) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2085, p2086, (("expected %*, got %*"):format(v_u_2084, p2086.ClassName)))
                end
            else
                return v_u_3.err(v_u_2085, p2086, (("expected %*, got %*"):format(v_u_2084, (typeof(p2086)))))
            end
        end,
        ["_format"] = function(p2087, _, _)
            return v_u_2(v_u_2084, p2087[v_u_2085])
        end
    }
    local v2088 = v_u_4
    local v2089 = v_u_2085
    return setmetatable(v2089, v2088)
end
local v_u_2090 = "LoginService"
function v5.LoginService()
    local v_u_2091 = nil
    v_u_2091 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2092)
            if typeof(p2092) == "Instance" then
                if p2092:IsA(v_u_2090) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2091, p2092, (("expected %*, got %*"):format(v_u_2090, p2092.ClassName)))
                end
            else
                return v_u_3.err(v_u_2091, p2092, (("expected %*, got %*"):format(v_u_2090, (typeof(p2092)))))
            end
        end,
        ["_format"] = function(p2093, _, _)
            return v_u_2(v_u_2090, p2093[v_u_2091])
        end
    }
    local v2094 = v_u_4
    local v2095 = v_u_2091
    return setmetatable(v2095, v2094)
end
local v_u_2096 = "LuaSettings"
function v5.LuaSettings()
    local v_u_2097 = nil
    v_u_2097 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2098)
            if typeof(p2098) == "Instance" then
                if p2098:IsA(v_u_2096) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2097, p2098, (("expected %*, got %*"):format(v_u_2096, p2098.ClassName)))
                end
            else
                return v_u_3.err(v_u_2097, p2098, (("expected %*, got %*"):format(v_u_2096, (typeof(p2098)))))
            end
        end,
        ["_format"] = function(p2099, _, _)
            return v_u_2(v_u_2096, p2099[v_u_2097])
        end
    }
    local v2100 = v_u_4
    local v2101 = v_u_2097
    return setmetatable(v2101, v2100)
end
local v_u_2102 = "LuaSourceContainer"
function v5.LuaSourceContainer()
    local v_u_2103 = nil
    v_u_2103 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2104)
            if typeof(p2104) == "Instance" then
                if p2104:IsA(v_u_2102) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2103, p2104, (("expected %*, got %*"):format(v_u_2102, p2104.ClassName)))
                end
            else
                return v_u_3.err(v_u_2103, p2104, (("expected %*, got %*"):format(v_u_2102, (typeof(p2104)))))
            end
        end,
        ["_format"] = function(p2105, _, _)
            return v_u_2(v_u_2102, p2105[v_u_2103])
        end
    }
    local v2106 = v_u_4
    local v2107 = v_u_2103
    return setmetatable(v2107, v2106)
end
local v_u_2108 = "BaseScript"
function v5.BaseScript()
    local v_u_2109 = nil
    v_u_2109 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2110)
            if typeof(p2110) == "Instance" then
                if p2110:IsA(v_u_2108) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2109, p2110, (("expected %*, got %*"):format(v_u_2108, p2110.ClassName)))
                end
            else
                return v_u_3.err(v_u_2109, p2110, (("expected %*, got %*"):format(v_u_2108, (typeof(p2110)))))
            end
        end,
        ["_format"] = function(p2111, _, _)
            return v_u_2(v_u_2108, p2111[v_u_2109])
        end
    }
    local v2112 = v_u_4
    local v2113 = v_u_2109
    return setmetatable(v2113, v2112)
end
local v_u_2114 = "CoreScript"
function v5.CoreScript()
    local v_u_2115 = nil
    v_u_2115 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2116)
            if typeof(p2116) == "Instance" then
                if p2116:IsA(v_u_2114) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2115, p2116, (("expected %*, got %*"):format(v_u_2114, p2116.ClassName)))
                end
            else
                return v_u_3.err(v_u_2115, p2116, (("expected %*, got %*"):format(v_u_2114, (typeof(p2116)))))
            end
        end,
        ["_format"] = function(p2117, _, _)
            return v_u_2(v_u_2114, p2117[v_u_2115])
        end
    }
    local v2118 = v_u_4
    local v2119 = v_u_2115
    return setmetatable(v2119, v2118)
end
local v_u_2120 = "Script"
function v5.Script()
    local v_u_2121 = nil
    v_u_2121 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2122)
            if typeof(p2122) == "Instance" then
                if p2122:IsA(v_u_2120) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2121, p2122, (("expected %*, got %*"):format(v_u_2120, p2122.ClassName)))
                end
            else
                return v_u_3.err(v_u_2121, p2122, (("expected %*, got %*"):format(v_u_2120, (typeof(p2122)))))
            end
        end,
        ["_format"] = function(p2123, _, _)
            return v_u_2(v_u_2120, p2123[v_u_2121])
        end
    }
    local v2124 = v_u_4
    local v2125 = v_u_2121
    return setmetatable(v2125, v2124)
end
local v_u_2126 = "LocalScript"
function v5.LocalScript()
    local v_u_2127 = nil
    v_u_2127 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2128)
            if typeof(p2128) == "Instance" then
                if p2128:IsA(v_u_2126) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2127, p2128, (("expected %*, got %*"):format(v_u_2126, p2128.ClassName)))
                end
            else
                return v_u_3.err(v_u_2127, p2128, (("expected %*, got %*"):format(v_u_2126, (typeof(p2128)))))
            end
        end,
        ["_format"] = function(p2129, _, _)
            return v_u_2(v_u_2126, p2129[v_u_2127])
        end
    }
    local v2130 = v_u_4
    local v2131 = v_u_2127
    return setmetatable(v2131, v2130)
end
local v_u_2132 = "ModuleScript"
function v5.ModuleScript()
    local v_u_2133 = nil
    v_u_2133 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2134)
            if typeof(p2134) == "Instance" then
                if p2134:IsA(v_u_2132) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2133, p2134, (("expected %*, got %*"):format(v_u_2132, p2134.ClassName)))
                end
            else
                return v_u_3.err(v_u_2133, p2134, (("expected %*, got %*"):format(v_u_2132, (typeof(p2134)))))
            end
        end,
        ["_format"] = function(p2135, _, _)
            return v_u_2(v_u_2132, p2135[v_u_2133])
        end
    }
    local v2136 = v_u_4
    local v2137 = v_u_2133
    return setmetatable(v2137, v2136)
end
local v_u_2138 = "LuaWebService"
function v5.LuaWebService()
    local v_u_2139 = nil
    v_u_2139 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2140)
            if typeof(p2140) == "Instance" then
                if p2140:IsA(v_u_2138) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2139, p2140, (("expected %*, got %*"):format(v_u_2138, p2140.ClassName)))
                end
            else
                return v_u_3.err(v_u_2139, p2140, (("expected %*, got %*"):format(v_u_2138, (typeof(p2140)))))
            end
        end,
        ["_format"] = function(p2141, _, _)
            return v_u_2(v_u_2138, p2141[v_u_2139])
        end
    }
    local v2142 = v_u_4
    local v2143 = v_u_2139
    return setmetatable(v2143, v2142)
end
local v_u_2144 = "LuauScriptAnalyzerService"
function v5.LuauScriptAnalyzerService()
    local v_u_2145 = nil
    v_u_2145 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2146)
            if typeof(p2146) == "Instance" then
                if p2146:IsA(v_u_2144) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2145, p2146, (("expected %*, got %*"):format(v_u_2144, p2146.ClassName)))
                end
            else
                return v_u_3.err(v_u_2145, p2146, (("expected %*, got %*"):format(v_u_2144, (typeof(p2146)))))
            end
        end,
        ["_format"] = function(p2147, _, _)
            return v_u_2(v_u_2144, p2147[v_u_2145])
        end
    }
    local v2148 = v_u_4
    local v2149 = v_u_2145
    return setmetatable(v2149, v2148)
end
local v_u_2150 = "MarkerCurve"
function v5.MarkerCurve()
    local v_u_2151 = nil
    v_u_2151 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2152)
            if typeof(p2152) == "Instance" then
                if p2152:IsA(v_u_2150) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2151, p2152, (("expected %*, got %*"):format(v_u_2150, p2152.ClassName)))
                end
            else
                return v_u_3.err(v_u_2151, p2152, (("expected %*, got %*"):format(v_u_2150, (typeof(p2152)))))
            end
        end,
        ["_format"] = function(p2153, _, _)
            return v_u_2(v_u_2150, p2153[v_u_2151])
        end
    }
    local v2154 = v_u_4
    local v2155 = v_u_2151
    return setmetatable(v2155, v2154)
end
local v_u_2156 = "MarketplaceService"
function v5.MarketplaceService()
    local v_u_2157 = nil
    v_u_2157 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2158)
            if typeof(p2158) == "Instance" then
                if p2158:IsA(v_u_2156) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2157, p2158, (("expected %*, got %*"):format(v_u_2156, p2158.ClassName)))
                end
            else
                return v_u_3.err(v_u_2157, p2158, (("expected %*, got %*"):format(v_u_2156, (typeof(p2158)))))
            end
        end,
        ["_format"] = function(p2159, _, _)
            return v_u_2(v_u_2156, p2159[v_u_2157])
        end
    }
    local v2160 = v_u_4
    local v2161 = v_u_2157
    return setmetatable(v2161, v2160)
end
local v_u_2162 = "MaterialGenerationService"
function v5.MaterialGenerationService()
    local v_u_2163 = nil
    v_u_2163 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2164)
            if typeof(p2164) == "Instance" then
                if p2164:IsA(v_u_2162) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2163, p2164, (("expected %*, got %*"):format(v_u_2162, p2164.ClassName)))
                end
            else
                return v_u_3.err(v_u_2163, p2164, (("expected %*, got %*"):format(v_u_2162, (typeof(p2164)))))
            end
        end,
        ["_format"] = function(p2165, _, _)
            return v_u_2(v_u_2162, p2165[v_u_2163])
        end
    }
    local v2166 = v_u_4
    local v2167 = v_u_2163
    return setmetatable(v2167, v2166)
end
local v_u_2168 = "MaterialGenerationSession"
function v5.MaterialGenerationSession()
    local v_u_2169 = nil
    v_u_2169 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2170)
            if typeof(p2170) == "Instance" then
                if p2170:IsA(v_u_2168) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2169, p2170, (("expected %*, got %*"):format(v_u_2168, p2170.ClassName)))
                end
            else
                return v_u_3.err(v_u_2169, p2170, (("expected %*, got %*"):format(v_u_2168, (typeof(p2170)))))
            end
        end,
        ["_format"] = function(p2171, _, _)
            return v_u_2(v_u_2168, p2171[v_u_2169])
        end
    }
    local v2172 = v_u_4
    local v2173 = v_u_2169
    return setmetatable(v2173, v2172)
end
local v_u_2174 = "MaterialService"
function v5.MaterialService()
    local v_u_2175 = nil
    v_u_2175 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2176)
            if typeof(p2176) == "Instance" then
                if p2176:IsA(v_u_2174) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2175, p2176, (("expected %*, got %*"):format(v_u_2174, p2176.ClassName)))
                end
            else
                return v_u_3.err(v_u_2175, p2176, (("expected %*, got %*"):format(v_u_2174, (typeof(p2176)))))
            end
        end,
        ["_format"] = function(p2177, _, _)
            return v_u_2(v_u_2174, p2177[v_u_2175])
        end
    }
    local v2178 = v_u_4
    local v2179 = v_u_2175
    return setmetatable(v2179, v2178)
end
local v_u_2180 = "MaterialVariant"
function v5.MaterialVariant()
    local v_u_2181 = nil
    v_u_2181 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2182)
            if typeof(p2182) == "Instance" then
                if p2182:IsA(v_u_2180) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2181, p2182, (("expected %*, got %*"):format(v_u_2180, p2182.ClassName)))
                end
            else
                return v_u_3.err(v_u_2181, p2182, (("expected %*, got %*"):format(v_u_2180, (typeof(p2182)))))
            end
        end,
        ["_format"] = function(p2183, _, _)
            return v_u_2(v_u_2180, p2183[v_u_2181])
        end
    }
    local v2184 = v_u_4
    local v2185 = v_u_2181
    return setmetatable(v2185, v2184)
end
local v_u_2186 = "MemStorageConnection"
function v5.MemStorageConnection()
    local v_u_2187 = nil
    v_u_2187 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2188)
            if typeof(p2188) == "Instance" then
                if p2188:IsA(v_u_2186) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2187, p2188, (("expected %*, got %*"):format(v_u_2186, p2188.ClassName)))
                end
            else
                return v_u_3.err(v_u_2187, p2188, (("expected %*, got %*"):format(v_u_2186, (typeof(p2188)))))
            end
        end,
        ["_format"] = function(p2189, _, _)
            return v_u_2(v_u_2186, p2189[v_u_2187])
        end
    }
    local v2190 = v_u_4
    local v2191 = v_u_2187
    return setmetatable(v2191, v2190)
end
local v_u_2192 = "MemStorageService"
function v5.MemStorageService()
    local v_u_2193 = nil
    v_u_2193 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2194)
            if typeof(p2194) == "Instance" then
                if p2194:IsA(v_u_2192) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2193, p2194, (("expected %*, got %*"):format(v_u_2192, p2194.ClassName)))
                end
            else
                return v_u_3.err(v_u_2193, p2194, (("expected %*, got %*"):format(v_u_2192, (typeof(p2194)))))
            end
        end,
        ["_format"] = function(p2195, _, _)
            return v_u_2(v_u_2192, p2195[v_u_2193])
        end
    }
    local v2196 = v_u_4
    local v2197 = v_u_2193
    return setmetatable(v2197, v2196)
end
local v_u_2198 = "MemoryStoreHashMap"
function v5.MemoryStoreHashMap()
    local v_u_2199 = nil
    v_u_2199 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2200)
            if typeof(p2200) == "Instance" then
                if p2200:IsA(v_u_2198) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2199, p2200, (("expected %*, got %*"):format(v_u_2198, p2200.ClassName)))
                end
            else
                return v_u_3.err(v_u_2199, p2200, (("expected %*, got %*"):format(v_u_2198, (typeof(p2200)))))
            end
        end,
        ["_format"] = function(p2201, _, _)
            return v_u_2(v_u_2198, p2201[v_u_2199])
        end
    }
    local v2202 = v_u_4
    local v2203 = v_u_2199
    return setmetatable(v2203, v2202)
end
local v_u_2204 = "MemoryStoreQueue"
function v5.MemoryStoreQueue()
    local v_u_2205 = nil
    v_u_2205 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2206)
            if typeof(p2206) == "Instance" then
                if p2206:IsA(v_u_2204) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2205, p2206, (("expected %*, got %*"):format(v_u_2204, p2206.ClassName)))
                end
            else
                return v_u_3.err(v_u_2205, p2206, (("expected %*, got %*"):format(v_u_2204, (typeof(p2206)))))
            end
        end,
        ["_format"] = function(p2207, _, _)
            return v_u_2(v_u_2204, p2207[v_u_2205])
        end
    }
    local v2208 = v_u_4
    local v2209 = v_u_2205
    return setmetatable(v2209, v2208)
end
local v_u_2210 = "MemoryStoreService"
function v5.MemoryStoreService()
    local v_u_2211 = nil
    v_u_2211 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2212)
            if typeof(p2212) == "Instance" then
                if p2212:IsA(v_u_2210) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2211, p2212, (("expected %*, got %*"):format(v_u_2210, p2212.ClassName)))
                end
            else
                return v_u_3.err(v_u_2211, p2212, (("expected %*, got %*"):format(v_u_2210, (typeof(p2212)))))
            end
        end,
        ["_format"] = function(p2213, _, _)
            return v_u_2(v_u_2210, p2213[v_u_2211])
        end
    }
    local v2214 = v_u_4
    local v2215 = v_u_2211
    return setmetatable(v2215, v2214)
end
local v_u_2216 = "MemoryStoreSortedMap"
function v5.MemoryStoreSortedMap()
    local v_u_2217 = nil
    v_u_2217 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2218)
            if typeof(p2218) == "Instance" then
                if p2218:IsA(v_u_2216) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2217, p2218, (("expected %*, got %*"):format(v_u_2216, p2218.ClassName)))
                end
            else
                return v_u_3.err(v_u_2217, p2218, (("expected %*, got %*"):format(v_u_2216, (typeof(p2218)))))
            end
        end,
        ["_format"] = function(p2219, _, _)
            return v_u_2(v_u_2216, p2219[v_u_2217])
        end
    }
    local v2220 = v_u_4
    local v2221 = v_u_2217
    return setmetatable(v2221, v2220)
end
local v_u_2222 = "Message"
function v5.Message()
    local v_u_2223 = nil
    v_u_2223 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2224)
            if typeof(p2224) == "Instance" then
                if p2224:IsA(v_u_2222) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2223, p2224, (("expected %*, got %*"):format(v_u_2222, p2224.ClassName)))
                end
            else
                return v_u_3.err(v_u_2223, p2224, (("expected %*, got %*"):format(v_u_2222, (typeof(p2224)))))
            end
        end,
        ["_format"] = function(p2225, _, _)
            return v_u_2(v_u_2222, p2225[v_u_2223])
        end
    }
    local v2226 = v_u_4
    local v2227 = v_u_2223
    return setmetatable(v2227, v2226)
end
local v_u_2228 = "Hint"
function v5.Hint()
    local v_u_2229 = nil
    v_u_2229 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2230)
            if typeof(p2230) == "Instance" then
                if p2230:IsA(v_u_2228) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2229, p2230, (("expected %*, got %*"):format(v_u_2228, p2230.ClassName)))
                end
            else
                return v_u_3.err(v_u_2229, p2230, (("expected %*, got %*"):format(v_u_2228, (typeof(p2230)))))
            end
        end,
        ["_format"] = function(p2231, _, _)
            return v_u_2(v_u_2228, p2231[v_u_2229])
        end
    }
    local v2232 = v_u_4
    local v2233 = v_u_2229
    return setmetatable(v2233, v2232)
end
local v_u_2234 = "MessageBusConnection"
function v5.MessageBusConnection()
    local v_u_2235 = nil
    v_u_2235 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2236)
            if typeof(p2236) == "Instance" then
                if p2236:IsA(v_u_2234) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2235, p2236, (("expected %*, got %*"):format(v_u_2234, p2236.ClassName)))
                end
            else
                return v_u_3.err(v_u_2235, p2236, (("expected %*, got %*"):format(v_u_2234, (typeof(p2236)))))
            end
        end,
        ["_format"] = function(p2237, _, _)
            return v_u_2(v_u_2234, p2237[v_u_2235])
        end
    }
    local v2238 = v_u_4
    local v2239 = v_u_2235
    return setmetatable(v2239, v2238)
end
local v_u_2240 = "MessageBusService"
function v5.MessageBusService()
    local v_u_2241 = nil
    v_u_2241 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2242)
            if typeof(p2242) == "Instance" then
                if p2242:IsA(v_u_2240) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2241, p2242, (("expected %*, got %*"):format(v_u_2240, p2242.ClassName)))
                end
            else
                return v_u_3.err(v_u_2241, p2242, (("expected %*, got %*"):format(v_u_2240, (typeof(p2242)))))
            end
        end,
        ["_format"] = function(p2243, _, _)
            return v_u_2(v_u_2240, p2243[v_u_2241])
        end
    }
    local v2244 = v_u_4
    local v2245 = v_u_2241
    return setmetatable(v2245, v2244)
end
local v_u_2246 = "MessagingService"
function v5.MessagingService()
    local v_u_2247 = nil
    v_u_2247 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2248)
            if typeof(p2248) == "Instance" then
                if p2248:IsA(v_u_2246) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2247, p2248, (("expected %*, got %*"):format(v_u_2246, p2248.ClassName)))
                end
            else
                return v_u_3.err(v_u_2247, p2248, (("expected %*, got %*"):format(v_u_2246, (typeof(p2248)))))
            end
        end,
        ["_format"] = function(p2249, _, _)
            return v_u_2(v_u_2246, p2249[v_u_2247])
        end
    }
    local v2250 = v_u_4
    local v2251 = v_u_2247
    return setmetatable(v2251, v2250)
end
local v_u_2252 = "MetaBreakpoint"
function v5.MetaBreakpoint()
    local v_u_2253 = nil
    v_u_2253 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2254)
            if typeof(p2254) == "Instance" then
                if p2254:IsA(v_u_2252) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2253, p2254, (("expected %*, got %*"):format(v_u_2252, p2254.ClassName)))
                end
            else
                return v_u_3.err(v_u_2253, p2254, (("expected %*, got %*"):format(v_u_2252, (typeof(p2254)))))
            end
        end,
        ["_format"] = function(p2255, _, _)
            return v_u_2(v_u_2252, p2255[v_u_2253])
        end
    }
    local v2256 = v_u_4
    local v2257 = v_u_2253
    return setmetatable(v2257, v2256)
end
local v_u_2258 = "MetaBreakpointContext"
function v5.MetaBreakpointContext()
    local v_u_2259 = nil
    v_u_2259 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2260)
            if typeof(p2260) == "Instance" then
                if p2260:IsA(v_u_2258) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2259, p2260, (("expected %*, got %*"):format(v_u_2258, p2260.ClassName)))
                end
            else
                return v_u_3.err(v_u_2259, p2260, (("expected %*, got %*"):format(v_u_2258, (typeof(p2260)))))
            end
        end,
        ["_format"] = function(p2261, _, _)
            return v_u_2(v_u_2258, p2261[v_u_2259])
        end
    }
    local v2262 = v_u_4
    local v2263 = v_u_2259
    return setmetatable(v2263, v2262)
end
local v_u_2264 = "MetaBreakpointManager"
function v5.MetaBreakpointManager()
    local v_u_2265 = nil
    v_u_2265 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2266)
            if typeof(p2266) == "Instance" then
                if p2266:IsA(v_u_2264) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2265, p2266, (("expected %*, got %*"):format(v_u_2264, p2266.ClassName)))
                end
            else
                return v_u_3.err(v_u_2265, p2266, (("expected %*, got %*"):format(v_u_2264, (typeof(p2266)))))
            end
        end,
        ["_format"] = function(p2267, _, _)
            return v_u_2(v_u_2264, p2267[v_u_2265])
        end
    }
    local v2268 = v_u_4
    local v2269 = v_u_2265
    return setmetatable(v2269, v2268)
end
local v_u_2270 = "Mouse"
function v5.Mouse()
    local v_u_2271 = nil
    v_u_2271 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2272)
            if typeof(p2272) == "Instance" then
                if p2272:IsA(v_u_2270) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2271, p2272, (("expected %*, got %*"):format(v_u_2270, p2272.ClassName)))
                end
            else
                return v_u_3.err(v_u_2271, p2272, (("expected %*, got %*"):format(v_u_2270, (typeof(p2272)))))
            end
        end,
        ["_format"] = function(p2273, _, _)
            return v_u_2(v_u_2270, p2273[v_u_2271])
        end
    }
    local v2274 = v_u_4
    local v2275 = v_u_2271
    return setmetatable(v2275, v2274)
end
local v_u_2276 = "PlayerMouse"
function v5.PlayerMouse()
    local v_u_2277 = nil
    v_u_2277 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2278)
            if typeof(p2278) == "Instance" then
                if p2278:IsA(v_u_2276) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2277, p2278, (("expected %*, got %*"):format(v_u_2276, p2278.ClassName)))
                end
            else
                return v_u_3.err(v_u_2277, p2278, (("expected %*, got %*"):format(v_u_2276, (typeof(p2278)))))
            end
        end,
        ["_format"] = function(p2279, _, _)
            return v_u_2(v_u_2276, p2279[v_u_2277])
        end
    }
    local v2280 = v_u_4
    local v2281 = v_u_2277
    return setmetatable(v2281, v2280)
end
local v_u_2282 = "PluginMouse"
function v5.PluginMouse()
    local v_u_2283 = nil
    v_u_2283 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2284)
            if typeof(p2284) == "Instance" then
                if p2284:IsA(v_u_2282) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2283, p2284, (("expected %*, got %*"):format(v_u_2282, p2284.ClassName)))
                end
            else
                return v_u_3.err(v_u_2283, p2284, (("expected %*, got %*"):format(v_u_2282, (typeof(p2284)))))
            end
        end,
        ["_format"] = function(p2285, _, _)
            return v_u_2(v_u_2282, p2285[v_u_2283])
        end
    }
    local v2286 = v_u_4
    local v2287 = v_u_2283
    return setmetatable(v2287, v2286)
end
local v_u_2288 = "MouseService"
function v5.MouseService()
    local v_u_2289 = nil
    v_u_2289 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2290)
            if typeof(p2290) == "Instance" then
                if p2290:IsA(v_u_2288) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2289, p2290, (("expected %*, got %*"):format(v_u_2288, p2290.ClassName)))
                end
            else
                return v_u_3.err(v_u_2289, p2290, (("expected %*, got %*"):format(v_u_2288, (typeof(p2290)))))
            end
        end,
        ["_format"] = function(p2291, _, _)
            return v_u_2(v_u_2288, p2291[v_u_2289])
        end
    }
    local v2292 = v_u_4
    local v2293 = v_u_2289
    return setmetatable(v2293, v2292)
end
local v_u_2294 = "MultipleDocumentInterfaceInstance"
function v5.MultipleDocumentInterfaceInstance()
    local v_u_2295 = nil
    v_u_2295 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2296)
            if typeof(p2296) == "Instance" then
                if p2296:IsA(v_u_2294) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2295, p2296, (("expected %*, got %*"):format(v_u_2294, p2296.ClassName)))
                end
            else
                return v_u_3.err(v_u_2295, p2296, (("expected %*, got %*"):format(v_u_2294, (typeof(p2296)))))
            end
        end,
        ["_format"] = function(p2297, _, _)
            return v_u_2(v_u_2294, p2297[v_u_2295])
        end
    }
    local v2298 = v_u_4
    local v2299 = v_u_2295
    return setmetatable(v2299, v2298)
end
local v_u_2300 = "NetworkMarker"
function v5.NetworkMarker()
    local v_u_2301 = nil
    v_u_2301 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2302)
            if typeof(p2302) == "Instance" then
                if p2302:IsA(v_u_2300) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2301, p2302, (("expected %*, got %*"):format(v_u_2300, p2302.ClassName)))
                end
            else
                return v_u_3.err(v_u_2301, p2302, (("expected %*, got %*"):format(v_u_2300, (typeof(p2302)))))
            end
        end,
        ["_format"] = function(p2303, _, _)
            return v_u_2(v_u_2300, p2303[v_u_2301])
        end
    }
    local v2304 = v_u_4
    local v2305 = v_u_2301
    return setmetatable(v2305, v2304)
end
local v_u_2306 = "NetworkPeer"
function v5.NetworkPeer()
    local v_u_2307 = nil
    v_u_2307 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2308)
            if typeof(p2308) == "Instance" then
                if p2308:IsA(v_u_2306) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2307, p2308, (("expected %*, got %*"):format(v_u_2306, p2308.ClassName)))
                end
            else
                return v_u_3.err(v_u_2307, p2308, (("expected %*, got %*"):format(v_u_2306, (typeof(p2308)))))
            end
        end,
        ["_format"] = function(p2309, _, _)
            return v_u_2(v_u_2306, p2309[v_u_2307])
        end
    }
    local v2310 = v_u_4
    local v2311 = v_u_2307
    return setmetatable(v2311, v2310)
end
local v_u_2312 = "NetworkClient"
function v5.NetworkClient()
    local v_u_2313 = nil
    v_u_2313 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2314)
            if typeof(p2314) == "Instance" then
                if p2314:IsA(v_u_2312) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2313, p2314, (("expected %*, got %*"):format(v_u_2312, p2314.ClassName)))
                end
            else
                return v_u_3.err(v_u_2313, p2314, (("expected %*, got %*"):format(v_u_2312, (typeof(p2314)))))
            end
        end,
        ["_format"] = function(p2315, _, _)
            return v_u_2(v_u_2312, p2315[v_u_2313])
        end
    }
    local v2316 = v_u_4
    local v2317 = v_u_2313
    return setmetatable(v2317, v2316)
end
local v_u_2318 = "NetworkServer"
function v5.NetworkServer()
    local v_u_2319 = nil
    v_u_2319 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2320)
            if typeof(p2320) == "Instance" then
                if p2320:IsA(v_u_2318) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2319, p2320, (("expected %*, got %*"):format(v_u_2318, p2320.ClassName)))
                end
            else
                return v_u_3.err(v_u_2319, p2320, (("expected %*, got %*"):format(v_u_2318, (typeof(p2320)))))
            end
        end,
        ["_format"] = function(p2321, _, _)
            return v_u_2(v_u_2318, p2321[v_u_2319])
        end
    }
    local v2322 = v_u_4
    local v2323 = v_u_2319
    return setmetatable(v2323, v2322)
end
local v_u_2324 = "NetworkReplicator"
function v5.NetworkReplicator()
    local v_u_2325 = nil
    v_u_2325 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2326)
            if typeof(p2326) == "Instance" then
                if p2326:IsA(v_u_2324) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2325, p2326, (("expected %*, got %*"):format(v_u_2324, p2326.ClassName)))
                end
            else
                return v_u_3.err(v_u_2325, p2326, (("expected %*, got %*"):format(v_u_2324, (typeof(p2326)))))
            end
        end,
        ["_format"] = function(p2327, _, _)
            return v_u_2(v_u_2324, p2327[v_u_2325])
        end
    }
    local v2328 = v_u_4
    local v2329 = v_u_2325
    return setmetatable(v2329, v2328)
end
local v_u_2330 = "ClientReplicator"
function v5.ClientReplicator()
    local v_u_2331 = nil
    v_u_2331 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2332)
            if typeof(p2332) == "Instance" then
                if p2332:IsA(v_u_2330) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2331, p2332, (("expected %*, got %*"):format(v_u_2330, p2332.ClassName)))
                end
            else
                return v_u_3.err(v_u_2331, p2332, (("expected %*, got %*"):format(v_u_2330, (typeof(p2332)))))
            end
        end,
        ["_format"] = function(p2333, _, _)
            return v_u_2(v_u_2330, p2333[v_u_2331])
        end
    }
    local v2334 = v_u_4
    local v2335 = v_u_2331
    return setmetatable(v2335, v2334)
end
local v_u_2336 = "ServerReplicator"
function v5.ServerReplicator()
    local v_u_2337 = nil
    v_u_2337 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2338)
            if typeof(p2338) == "Instance" then
                if p2338:IsA(v_u_2336) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2337, p2338, (("expected %*, got %*"):format(v_u_2336, p2338.ClassName)))
                end
            else
                return v_u_3.err(v_u_2337, p2338, (("expected %*, got %*"):format(v_u_2336, (typeof(p2338)))))
            end
        end,
        ["_format"] = function(p2339, _, _)
            return v_u_2(v_u_2336, p2339[v_u_2337])
        end
    }
    local v2340 = v_u_4
    local v2341 = v_u_2337
    return setmetatable(v2341, v2340)
end
local v_u_2342 = "NetworkSettings"
function v5.NetworkSettings()
    local v_u_2343 = nil
    v_u_2343 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2344)
            if typeof(p2344) == "Instance" then
                if p2344:IsA(v_u_2342) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2343, p2344, (("expected %*, got %*"):format(v_u_2342, p2344.ClassName)))
                end
            else
                return v_u_3.err(v_u_2343, p2344, (("expected %*, got %*"):format(v_u_2342, (typeof(p2344)))))
            end
        end,
        ["_format"] = function(p2345, _, _)
            return v_u_2(v_u_2342, p2345[v_u_2343])
        end
    }
    local v2346 = v_u_4
    local v2347 = v_u_2343
    return setmetatable(v2347, v2346)
end
local v_u_2348 = "NoCollisionConstraint"
function v5.NoCollisionConstraint()
    local v_u_2349 = nil
    v_u_2349 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2350)
            if typeof(p2350) == "Instance" then
                if p2350:IsA(v_u_2348) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2349, p2350, (("expected %*, got %*"):format(v_u_2348, p2350.ClassName)))
                end
            else
                return v_u_3.err(v_u_2349, p2350, (("expected %*, got %*"):format(v_u_2348, (typeof(p2350)))))
            end
        end,
        ["_format"] = function(p2351, _, _)
            return v_u_2(v_u_2348, p2351[v_u_2349])
        end
    }
    local v2352 = v_u_4
    local v2353 = v_u_2349
    return setmetatable(v2353, v2352)
end
local v_u_2354 = "NotificationService"
function v5.NotificationService()
    local v_u_2355 = nil
    v_u_2355 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2356)
            if typeof(p2356) == "Instance" then
                if p2356:IsA(v_u_2354) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2355, p2356, (("expected %*, got %*"):format(v_u_2354, p2356.ClassName)))
                end
            else
                return v_u_3.err(v_u_2355, p2356, (("expected %*, got %*"):format(v_u_2354, (typeof(p2356)))))
            end
        end,
        ["_format"] = function(p2357, _, _)
            return v_u_2(v_u_2354, p2357[v_u_2355])
        end
    }
    local v2358 = v_u_4
    local v2359 = v_u_2355
    return setmetatable(v2359, v2358)
end
local v_u_2360 = "OmniRecommendationsService"
function v5.OmniRecommendationsService()
    local v_u_2361 = nil
    v_u_2361 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2362)
            if typeof(p2362) == "Instance" then
                if p2362:IsA(v_u_2360) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2361, p2362, (("expected %*, got %*"):format(v_u_2360, p2362.ClassName)))
                end
            else
                return v_u_3.err(v_u_2361, p2362, (("expected %*, got %*"):format(v_u_2360, (typeof(p2362)))))
            end
        end,
        ["_format"] = function(p2363, _, _)
            return v_u_2(v_u_2360, p2363[v_u_2361])
        end
    }
    local v2364 = v_u_4
    local v2365 = v_u_2361
    return setmetatable(v2365, v2364)
end
local v_u_2366 = "OpenCloudApiV1"
function v5.OpenCloudApiV1()
    local v_u_2367 = nil
    v_u_2367 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2368)
            if typeof(p2368) == "Instance" then
                if p2368:IsA(v_u_2366) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2367, p2368, (("expected %*, got %*"):format(v_u_2366, p2368.ClassName)))
                end
            else
                return v_u_3.err(v_u_2367, p2368, (("expected %*, got %*"):format(v_u_2366, (typeof(p2368)))))
            end
        end,
        ["_format"] = function(p2369, _, _)
            return v_u_2(v_u_2366, p2369[v_u_2367])
        end
    }
    local v2370 = v_u_4
    local v2371 = v_u_2367
    return setmetatable(v2371, v2370)
end
local v_u_2372 = "OpenCloudService"
function v5.OpenCloudService()
    local v_u_2373 = nil
    v_u_2373 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2374)
            if typeof(p2374) == "Instance" then
                if p2374:IsA(v_u_2372) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2373, p2374, (("expected %*, got %*"):format(v_u_2372, p2374.ClassName)))
                end
            else
                return v_u_3.err(v_u_2373, p2374, (("expected %*, got %*"):format(v_u_2372, (typeof(p2374)))))
            end
        end,
        ["_format"] = function(p2375, _, _)
            return v_u_2(v_u_2372, p2375[v_u_2373])
        end
    }
    local v2376 = v_u_4
    local v2377 = v_u_2373
    return setmetatable(v2377, v2376)
end
local v_u_2378 = "OperationGraph"
function v5.OperationGraph()
    local v_u_2379 = nil
    v_u_2379 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2380)
            if typeof(p2380) == "Instance" then
                if p2380:IsA(v_u_2378) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2379, p2380, (("expected %*, got %*"):format(v_u_2378, p2380.ClassName)))
                end
            else
                return v_u_3.err(v_u_2379, p2380, (("expected %*, got %*"):format(v_u_2378, (typeof(p2380)))))
            end
        end,
        ["_format"] = function(p2381, _, _)
            return v_u_2(v_u_2378, p2381[v_u_2379])
        end
    }
    local v2382 = v_u_4
    local v2383 = v_u_2379
    return setmetatable(v2383, v2382)
end
local v_u_2384 = "PVInstance"
function v5.PVInstance()
    local v_u_2385 = nil
    v_u_2385 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2386)
            if typeof(p2386) == "Instance" then
                if p2386:IsA(v_u_2384) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2385, p2386, (("expected %*, got %*"):format(v_u_2384, p2386.ClassName)))
                end
            else
                return v_u_3.err(v_u_2385, p2386, (("expected %*, got %*"):format(v_u_2384, (typeof(p2386)))))
            end
        end,
        ["_format"] = function(p2387, _, _)
            return v_u_2(v_u_2384, p2387[v_u_2385])
        end
    }
    local v2388 = v_u_4
    local v2389 = v_u_2385
    return setmetatable(v2389, v2388)
end
local v_u_2390 = "BasePart"
function v5.BasePart()
    local v_u_2391 = nil
    v_u_2391 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2392)
            if typeof(p2392) == "Instance" then
                if p2392:IsA(v_u_2390) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2391, p2392, (("expected %*, got %*"):format(v_u_2390, p2392.ClassName)))
                end
            else
                return v_u_3.err(v_u_2391, p2392, (("expected %*, got %*"):format(v_u_2390, (typeof(p2392)))))
            end
        end,
        ["_format"] = function(p2393, _, _)
            return v_u_2(v_u_2390, p2393[v_u_2391])
        end
    }
    local v2394 = v_u_4
    local v2395 = v_u_2391
    return setmetatable(v2395, v2394)
end
local v_u_2396 = "CornerWedgePart"
function v5.CornerWedgePart()
    local v_u_2397 = nil
    v_u_2397 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2398)
            if typeof(p2398) == "Instance" then
                if p2398:IsA(v_u_2396) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2397, p2398, (("expected %*, got %*"):format(v_u_2396, p2398.ClassName)))
                end
            else
                return v_u_3.err(v_u_2397, p2398, (("expected %*, got %*"):format(v_u_2396, (typeof(p2398)))))
            end
        end,
        ["_format"] = function(p2399, _, _)
            return v_u_2(v_u_2396, p2399[v_u_2397])
        end
    }
    local v2400 = v_u_4
    local v2401 = v_u_2397
    return setmetatable(v2401, v2400)
end
local v_u_2402 = "FormFactorPart"
function v5.FormFactorPart()
    local v_u_2403 = nil
    v_u_2403 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2404)
            if typeof(p2404) == "Instance" then
                if p2404:IsA(v_u_2402) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2403, p2404, (("expected %*, got %*"):format(v_u_2402, p2404.ClassName)))
                end
            else
                return v_u_3.err(v_u_2403, p2404, (("expected %*, got %*"):format(v_u_2402, (typeof(p2404)))))
            end
        end,
        ["_format"] = function(p2405, _, _)
            return v_u_2(v_u_2402, p2405[v_u_2403])
        end
    }
    local v2406 = v_u_4
    local v2407 = v_u_2403
    return setmetatable(v2407, v2406)
end
local v_u_2408 = "Part"
function v5.Part()
    local v_u_2409 = nil
    v_u_2409 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2410)
            if typeof(p2410) == "Instance" then
                if p2410:IsA(v_u_2408) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2409, p2410, (("expected %*, got %*"):format(v_u_2408, p2410.ClassName)))
                end
            else
                return v_u_3.err(v_u_2409, p2410, (("expected %*, got %*"):format(v_u_2408, (typeof(p2410)))))
            end
        end,
        ["_format"] = function(p2411, _, _)
            return v_u_2(v_u_2408, p2411[v_u_2409])
        end
    }
    local v2412 = v_u_4
    local v2413 = v_u_2409
    return setmetatable(v2413, v2412)
end
local v_u_2414 = "FlagStand"
function v5.FlagStand()
    local v_u_2415 = nil
    v_u_2415 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2416)
            if typeof(p2416) == "Instance" then
                if p2416:IsA(v_u_2414) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2415, p2416, (("expected %*, got %*"):format(v_u_2414, p2416.ClassName)))
                end
            else
                return v_u_3.err(v_u_2415, p2416, (("expected %*, got %*"):format(v_u_2414, (typeof(p2416)))))
            end
        end,
        ["_format"] = function(p2417, _, _)
            return v_u_2(v_u_2414, p2417[v_u_2415])
        end
    }
    local v2418 = v_u_4
    local v2419 = v_u_2415
    return setmetatable(v2419, v2418)
end
local v_u_2420 = "Platform"
function v5.Platform()
    local v_u_2421 = nil
    v_u_2421 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2422)
            if typeof(p2422) == "Instance" then
                if p2422:IsA(v_u_2420) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2421, p2422, (("expected %*, got %*"):format(v_u_2420, p2422.ClassName)))
                end
            else
                return v_u_3.err(v_u_2421, p2422, (("expected %*, got %*"):format(v_u_2420, (typeof(p2422)))))
            end
        end,
        ["_format"] = function(p2423, _, _)
            return v_u_2(v_u_2420, p2423[v_u_2421])
        end
    }
    local v2424 = v_u_4
    local v2425 = v_u_2421
    return setmetatable(v2425, v2424)
end
local v_u_2426 = "Seat"
function v5.Seat()
    local v_u_2427 = nil
    v_u_2427 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2428)
            if typeof(p2428) == "Instance" then
                if p2428:IsA(v_u_2426) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2427, p2428, (("expected %*, got %*"):format(v_u_2426, p2428.ClassName)))
                end
            else
                return v_u_3.err(v_u_2427, p2428, (("expected %*, got %*"):format(v_u_2426, (typeof(p2428)))))
            end
        end,
        ["_format"] = function(p2429, _, _)
            return v_u_2(v_u_2426, p2429[v_u_2427])
        end
    }
    local v2430 = v_u_4
    local v2431 = v_u_2427
    return setmetatable(v2431, v2430)
end
local v_u_2432 = "SkateboardPlatform"
function v5.SkateboardPlatform()
    local v_u_2433 = nil
    v_u_2433 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2434)
            if typeof(p2434) == "Instance" then
                if p2434:IsA(v_u_2432) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2433, p2434, (("expected %*, got %*"):format(v_u_2432, p2434.ClassName)))
                end
            else
                return v_u_3.err(v_u_2433, p2434, (("expected %*, got %*"):format(v_u_2432, (typeof(p2434)))))
            end
        end,
        ["_format"] = function(p2435, _, _)
            return v_u_2(v_u_2432, p2435[v_u_2433])
        end
    }
    local v2436 = v_u_4
    local v2437 = v_u_2433
    return setmetatable(v2437, v2436)
end
local v_u_2438 = "SpawnLocation"
function v5.SpawnLocation()
    local v_u_2439 = nil
    v_u_2439 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2440)
            if typeof(p2440) == "Instance" then
                if p2440:IsA(v_u_2438) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2439, p2440, (("expected %*, got %*"):format(v_u_2438, p2440.ClassName)))
                end
            else
                return v_u_3.err(v_u_2439, p2440, (("expected %*, got %*"):format(v_u_2438, (typeof(p2440)))))
            end
        end,
        ["_format"] = function(p2441, _, _)
            return v_u_2(v_u_2438, p2441[v_u_2439])
        end
    }
    local v2442 = v_u_4
    local v2443 = v_u_2439
    return setmetatable(v2443, v2442)
end
local v_u_2444 = "WedgePart"
function v5.WedgePart()
    local v_u_2445 = nil
    v_u_2445 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2446)
            if typeof(p2446) == "Instance" then
                if p2446:IsA(v_u_2444) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2445, p2446, (("expected %*, got %*"):format(v_u_2444, p2446.ClassName)))
                end
            else
                return v_u_3.err(v_u_2445, p2446, (("expected %*, got %*"):format(v_u_2444, (typeof(p2446)))))
            end
        end,
        ["_format"] = function(p2447, _, _)
            return v_u_2(v_u_2444, p2447[v_u_2445])
        end
    }
    local v2448 = v_u_4
    local v2449 = v_u_2445
    return setmetatable(v2449, v2448)
end
local v_u_2450 = "Terrain"
function v5.Terrain()
    local v_u_2451 = nil
    v_u_2451 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2452)
            if typeof(p2452) == "Instance" then
                if p2452:IsA(v_u_2450) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2451, p2452, (("expected %*, got %*"):format(v_u_2450, p2452.ClassName)))
                end
            else
                return v_u_3.err(v_u_2451, p2452, (("expected %*, got %*"):format(v_u_2450, (typeof(p2452)))))
            end
        end,
        ["_format"] = function(p2453, _, _)
            return v_u_2(v_u_2450, p2453[v_u_2451])
        end
    }
    local v2454 = v_u_4
    local v2455 = v_u_2451
    return setmetatable(v2455, v2454)
end
local v_u_2456 = "TriangleMeshPart"
function v5.TriangleMeshPart()
    local v_u_2457 = nil
    v_u_2457 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2458)
            if typeof(p2458) == "Instance" then
                if p2458:IsA(v_u_2456) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2457, p2458, (("expected %*, got %*"):format(v_u_2456, p2458.ClassName)))
                end
            else
                return v_u_3.err(v_u_2457, p2458, (("expected %*, got %*"):format(v_u_2456, (typeof(p2458)))))
            end
        end,
        ["_format"] = function(p2459, _, _)
            return v_u_2(v_u_2456, p2459[v_u_2457])
        end
    }
    local v2460 = v_u_4
    local v2461 = v_u_2457
    return setmetatable(v2461, v2460)
end
local v_u_2462 = "MeshPart"
function v5.MeshPart()
    local v_u_2463 = nil
    v_u_2463 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2464)
            if typeof(p2464) == "Instance" then
                if p2464:IsA(v_u_2462) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2463, p2464, (("expected %*, got %*"):format(v_u_2462, p2464.ClassName)))
                end
            else
                return v_u_3.err(v_u_2463, p2464, (("expected %*, got %*"):format(v_u_2462, (typeof(p2464)))))
            end
        end,
        ["_format"] = function(p2465, _, _)
            return v_u_2(v_u_2462, p2465[v_u_2463])
        end
    }
    local v2466 = v_u_4
    local v2467 = v_u_2463
    return setmetatable(v2467, v2466)
end
local v_u_2468 = "PartOperation"
function v5.PartOperation()
    local v_u_2469 = nil
    v_u_2469 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2470)
            if typeof(p2470) == "Instance" then
                if p2470:IsA(v_u_2468) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2469, p2470, (("expected %*, got %*"):format(v_u_2468, p2470.ClassName)))
                end
            else
                return v_u_3.err(v_u_2469, p2470, (("expected %*, got %*"):format(v_u_2468, (typeof(p2470)))))
            end
        end,
        ["_format"] = function(p2471, _, _)
            return v_u_2(v_u_2468, p2471[v_u_2469])
        end
    }
    local v2472 = v_u_4
    local v2473 = v_u_2469
    return setmetatable(v2473, v2472)
end
local v_u_2474 = "IntersectOperation"
function v5.IntersectOperation()
    local v_u_2475 = nil
    v_u_2475 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2476)
            if typeof(p2476) == "Instance" then
                if p2476:IsA(v_u_2474) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2475, p2476, (("expected %*, got %*"):format(v_u_2474, p2476.ClassName)))
                end
            else
                return v_u_3.err(v_u_2475, p2476, (("expected %*, got %*"):format(v_u_2474, (typeof(p2476)))))
            end
        end,
        ["_format"] = function(p2477, _, _)
            return v_u_2(v_u_2474, p2477[v_u_2475])
        end
    }
    local v2478 = v_u_4
    local v2479 = v_u_2475
    return setmetatable(v2479, v2478)
end
local v_u_2480 = "NegateOperation"
function v5.NegateOperation()
    local v_u_2481 = nil
    v_u_2481 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2482)
            if typeof(p2482) == "Instance" then
                if p2482:IsA(v_u_2480) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2481, p2482, (("expected %*, got %*"):format(v_u_2480, p2482.ClassName)))
                end
            else
                return v_u_3.err(v_u_2481, p2482, (("expected %*, got %*"):format(v_u_2480, (typeof(p2482)))))
            end
        end,
        ["_format"] = function(p2483, _, _)
            return v_u_2(v_u_2480, p2483[v_u_2481])
        end
    }
    local v2484 = v_u_4
    local v2485 = v_u_2481
    return setmetatable(v2485, v2484)
end
local v_u_2486 = "UnionOperation"
function v5.UnionOperation()
    local v_u_2487 = nil
    v_u_2487 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2488)
            if typeof(p2488) == "Instance" then
                if p2488:IsA(v_u_2486) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2487, p2488, (("expected %*, got %*"):format(v_u_2486, p2488.ClassName)))
                end
            else
                return v_u_3.err(v_u_2487, p2488, (("expected %*, got %*"):format(v_u_2486, (typeof(p2488)))))
            end
        end,
        ["_format"] = function(p2489, _, _)
            return v_u_2(v_u_2486, p2489[v_u_2487])
        end
    }
    local v2490 = v_u_4
    local v2491 = v_u_2487
    return setmetatable(v2491, v2490)
end
local v_u_2492 = "TrussPart"
function v5.TrussPart()
    local v_u_2493 = nil
    v_u_2493 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2494)
            if typeof(p2494) == "Instance" then
                if p2494:IsA(v_u_2492) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2493, p2494, (("expected %*, got %*"):format(v_u_2492, p2494.ClassName)))
                end
            else
                return v_u_3.err(v_u_2493, p2494, (("expected %*, got %*"):format(v_u_2492, (typeof(p2494)))))
            end
        end,
        ["_format"] = function(p2495, _, _)
            return v_u_2(v_u_2492, p2495[v_u_2493])
        end
    }
    local v2496 = v_u_4
    local v2497 = v_u_2493
    return setmetatable(v2497, v2496)
end
local v_u_2498 = "VehicleSeat"
function v5.VehicleSeat()
    local v_u_2499 = nil
    v_u_2499 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2500)
            if typeof(p2500) == "Instance" then
                if p2500:IsA(v_u_2498) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2499, p2500, (("expected %*, got %*"):format(v_u_2498, p2500.ClassName)))
                end
            else
                return v_u_3.err(v_u_2499, p2500, (("expected %*, got %*"):format(v_u_2498, (typeof(p2500)))))
            end
        end,
        ["_format"] = function(p2501, _, _)
            return v_u_2(v_u_2498, p2501[v_u_2499])
        end
    }
    local v2502 = v_u_4
    local v2503 = v_u_2499
    return setmetatable(v2503, v2502)
end
local v_u_2504 = "Model"
function v5.Model()
    local v_u_2505 = nil
    v_u_2505 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2506)
            if typeof(p2506) == "Instance" then
                if p2506:IsA(v_u_2504) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2505, p2506, (("expected %*, got %*"):format(v_u_2504, p2506.ClassName)))
                end
            else
                return v_u_3.err(v_u_2505, p2506, (("expected %*, got %*"):format(v_u_2504, (typeof(p2506)))))
            end
        end,
        ["_format"] = function(p2507, _, _)
            return v_u_2(v_u_2504, p2507[v_u_2505])
        end
    }
    local v2508 = v_u_4
    local v2509 = v_u_2505
    return setmetatable(v2509, v2508)
end
local v_u_2510 = "Actor"
function v5.Actor()
    local v_u_2511 = nil
    v_u_2511 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2512)
            if typeof(p2512) == "Instance" then
                if p2512:IsA(v_u_2510) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2511, p2512, (("expected %*, got %*"):format(v_u_2510, p2512.ClassName)))
                end
            else
                return v_u_3.err(v_u_2511, p2512, (("expected %*, got %*"):format(v_u_2510, (typeof(p2512)))))
            end
        end,
        ["_format"] = function(p2513, _, _)
            return v_u_2(v_u_2510, p2513[v_u_2511])
        end
    }
    local v2514 = v_u_4
    local v2515 = v_u_2511
    return setmetatable(v2515, v2514)
end
local v_u_2516 = "BackpackItem"
function v5.BackpackItem()
    local v_u_2517 = nil
    v_u_2517 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2518)
            if typeof(p2518) == "Instance" then
                if p2518:IsA(v_u_2516) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2517, p2518, (("expected %*, got %*"):format(v_u_2516, p2518.ClassName)))
                end
            else
                return v_u_3.err(v_u_2517, p2518, (("expected %*, got %*"):format(v_u_2516, (typeof(p2518)))))
            end
        end,
        ["_format"] = function(p2519, _, _)
            return v_u_2(v_u_2516, p2519[v_u_2517])
        end
    }
    local v2520 = v_u_4
    local v2521 = v_u_2517
    return setmetatable(v2521, v2520)
end
local v_u_2522 = "HopperBin"
function v5.HopperBin()
    local v_u_2523 = nil
    v_u_2523 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2524)
            if typeof(p2524) == "Instance" then
                if p2524:IsA(v_u_2522) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2523, p2524, (("expected %*, got %*"):format(v_u_2522, p2524.ClassName)))
                end
            else
                return v_u_3.err(v_u_2523, p2524, (("expected %*, got %*"):format(v_u_2522, (typeof(p2524)))))
            end
        end,
        ["_format"] = function(p2525, _, _)
            return v_u_2(v_u_2522, p2525[v_u_2523])
        end
    }
    local v2526 = v_u_4
    local v2527 = v_u_2523
    return setmetatable(v2527, v2526)
end
local v_u_2528 = "Tool"
function v5.Tool()
    local v_u_2529 = nil
    v_u_2529 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2530)
            if typeof(p2530) == "Instance" then
                if p2530:IsA(v_u_2528) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2529, p2530, (("expected %*, got %*"):format(v_u_2528, p2530.ClassName)))
                end
            else
                return v_u_3.err(v_u_2529, p2530, (("expected %*, got %*"):format(v_u_2528, (typeof(p2530)))))
            end
        end,
        ["_format"] = function(p2531, _, _)
            return v_u_2(v_u_2528, p2531[v_u_2529])
        end
    }
    local v2532 = v_u_4
    local v2533 = v_u_2529
    return setmetatable(v2533, v2532)
end
local v_u_2534 = "Flag"
function v5.Flag()
    local v_u_2535 = nil
    v_u_2535 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2536)
            if typeof(p2536) == "Instance" then
                if p2536:IsA(v_u_2534) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2535, p2536, (("expected %*, got %*"):format(v_u_2534, p2536.ClassName)))
                end
            else
                return v_u_3.err(v_u_2535, p2536, (("expected %*, got %*"):format(v_u_2534, (typeof(p2536)))))
            end
        end,
        ["_format"] = function(p2537, _, _)
            return v_u_2(v_u_2534, p2537[v_u_2535])
        end
    }
    local v2538 = v_u_4
    local v2539 = v_u_2535
    return setmetatable(v2539, v2538)
end
local v_u_2540 = "Status"
function v5.Status()
    local v_u_2541 = nil
    v_u_2541 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2542)
            if typeof(p2542) == "Instance" then
                if p2542:IsA(v_u_2540) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2541, p2542, (("expected %*, got %*"):format(v_u_2540, p2542.ClassName)))
                end
            else
                return v_u_3.err(v_u_2541, p2542, (("expected %*, got %*"):format(v_u_2540, (typeof(p2542)))))
            end
        end,
        ["_format"] = function(p2543, _, _)
            return v_u_2(v_u_2540, p2543[v_u_2541])
        end
    }
    local v2544 = v_u_4
    local v2545 = v_u_2541
    return setmetatable(v2545, v2544)
end
local v_u_2546 = "WorldRoot"
function v5.WorldRoot()
    local v_u_2547 = nil
    v_u_2547 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2548)
            if typeof(p2548) == "Instance" then
                if p2548:IsA(v_u_2546) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2547, p2548, (("expected %*, got %*"):format(v_u_2546, p2548.ClassName)))
                end
            else
                return v_u_3.err(v_u_2547, p2548, (("expected %*, got %*"):format(v_u_2546, (typeof(p2548)))))
            end
        end,
        ["_format"] = function(p2549, _, _)
            return v_u_2(v_u_2546, p2549[v_u_2547])
        end
    }
    local v2550 = v_u_4
    local v2551 = v_u_2547
    return setmetatable(v2551, v2550)
end
local v_u_2552 = "Workspace"
function v5.Workspace()
    local v_u_2553 = nil
    v_u_2553 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2554)
            if typeof(p2554) == "Instance" then
                if p2554:IsA(v_u_2552) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2553, p2554, (("expected %*, got %*"):format(v_u_2552, p2554.ClassName)))
                end
            else
                return v_u_3.err(v_u_2553, p2554, (("expected %*, got %*"):format(v_u_2552, (typeof(p2554)))))
            end
        end,
        ["_format"] = function(p2555, _, _)
            return v_u_2(v_u_2552, p2555[v_u_2553])
        end
    }
    local v2556 = v_u_4
    local v2557 = v_u_2553
    return setmetatable(v2557, v2556)
end
local v_u_2558 = "WorldModel"
function v5.WorldModel()
    local v_u_2559 = nil
    v_u_2559 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2560)
            if typeof(p2560) == "Instance" then
                if p2560:IsA(v_u_2558) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2559, p2560, (("expected %*, got %*"):format(v_u_2558, p2560.ClassName)))
                end
            else
                return v_u_3.err(v_u_2559, p2560, (("expected %*, got %*"):format(v_u_2558, (typeof(p2560)))))
            end
        end,
        ["_format"] = function(p2561, _, _)
            return v_u_2(v_u_2558, p2561[v_u_2559])
        end
    }
    local v2562 = v_u_4
    local v2563 = v_u_2559
    return setmetatable(v2563, v2562)
end
local v_u_2564 = "PackageLink"
function v5.PackageLink()
    local v_u_2565 = nil
    v_u_2565 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2566)
            if typeof(p2566) == "Instance" then
                if p2566:IsA(v_u_2564) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2565, p2566, (("expected %*, got %*"):format(v_u_2564, p2566.ClassName)))
                end
            else
                return v_u_3.err(v_u_2565, p2566, (("expected %*, got %*"):format(v_u_2564, (typeof(p2566)))))
            end
        end,
        ["_format"] = function(p2567, _, _)
            return v_u_2(v_u_2564, p2567[v_u_2565])
        end
    }
    local v2568 = v_u_4
    local v2569 = v_u_2565
    return setmetatable(v2569, v2568)
end
local v_u_2570 = "PackageService"
function v5.PackageService()
    local v_u_2571 = nil
    v_u_2571 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2572)
            if typeof(p2572) == "Instance" then
                if p2572:IsA(v_u_2570) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2571, p2572, (("expected %*, got %*"):format(v_u_2570, p2572.ClassName)))
                end
            else
                return v_u_3.err(v_u_2571, p2572, (("expected %*, got %*"):format(v_u_2570, (typeof(p2572)))))
            end
        end,
        ["_format"] = function(p2573, _, _)
            return v_u_2(v_u_2570, p2573[v_u_2571])
        end
    }
    local v2574 = v_u_4
    local v2575 = v_u_2571
    return setmetatable(v2575, v2574)
end
local v_u_2576 = "PackageUIService"
function v5.PackageUIService()
    local v_u_2577 = nil
    v_u_2577 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2578)
            if typeof(p2578) == "Instance" then
                if p2578:IsA(v_u_2576) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2577, p2578, (("expected %*, got %*"):format(v_u_2576, p2578.ClassName)))
                end
            else
                return v_u_3.err(v_u_2577, p2578, (("expected %*, got %*"):format(v_u_2576, (typeof(p2578)))))
            end
        end,
        ["_format"] = function(p2579, _, _)
            return v_u_2(v_u_2576, p2579[v_u_2577])
        end
    }
    local v2580 = v_u_4
    local v2581 = v_u_2577
    return setmetatable(v2581, v2580)
end
local v_u_2582 = "Pages"
function v5.Pages()
    local v_u_2583 = nil
    v_u_2583 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2584)
            if typeof(p2584) == "Instance" then
                if p2584:IsA(v_u_2582) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2583, p2584, (("expected %*, got %*"):format(v_u_2582, p2584.ClassName)))
                end
            else
                return v_u_3.err(v_u_2583, p2584, (("expected %*, got %*"):format(v_u_2582, (typeof(p2584)))))
            end
        end,
        ["_format"] = function(p2585, _, _)
            return v_u_2(v_u_2582, p2585[v_u_2583])
        end
    }
    local v2586 = v_u_4
    local v2587 = v_u_2583
    return setmetatable(v2587, v2586)
end
local v_u_2588 = "AudioPages"
function v5.AudioPages()
    local v_u_2589 = nil
    v_u_2589 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2590)
            if typeof(p2590) == "Instance" then
                if p2590:IsA(v_u_2588) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2589, p2590, (("expected %*, got %*"):format(v_u_2588, p2590.ClassName)))
                end
            else
                return v_u_3.err(v_u_2589, p2590, (("expected %*, got %*"):format(v_u_2588, (typeof(p2590)))))
            end
        end,
        ["_format"] = function(p2591, _, _)
            return v_u_2(v_u_2588, p2591[v_u_2589])
        end
    }
    local v2592 = v_u_4
    local v2593 = v_u_2589
    return setmetatable(v2593, v2592)
end
local v_u_2594 = "CatalogPages"
function v5.CatalogPages()
    local v_u_2595 = nil
    v_u_2595 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2596)
            if typeof(p2596) == "Instance" then
                if p2596:IsA(v_u_2594) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2595, p2596, (("expected %*, got %*"):format(v_u_2594, p2596.ClassName)))
                end
            else
                return v_u_3.err(v_u_2595, p2596, (("expected %*, got %*"):format(v_u_2594, (typeof(p2596)))))
            end
        end,
        ["_format"] = function(p2597, _, _)
            return v_u_2(v_u_2594, p2597[v_u_2595])
        end
    }
    local v2598 = v_u_4
    local v2599 = v_u_2595
    return setmetatable(v2599, v2598)
end
local v_u_2600 = "DataStoreKeyPages"
function v5.DataStoreKeyPages()
    local v_u_2601 = nil
    v_u_2601 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2602)
            if typeof(p2602) == "Instance" then
                if p2602:IsA(v_u_2600) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2601, p2602, (("expected %*, got %*"):format(v_u_2600, p2602.ClassName)))
                end
            else
                return v_u_3.err(v_u_2601, p2602, (("expected %*, got %*"):format(v_u_2600, (typeof(p2602)))))
            end
        end,
        ["_format"] = function(p2603, _, _)
            return v_u_2(v_u_2600, p2603[v_u_2601])
        end
    }
    local v2604 = v_u_4
    local v2605 = v_u_2601
    return setmetatable(v2605, v2604)
end
local v_u_2606 = "DataStoreListingPages"
function v5.DataStoreListingPages()
    local v_u_2607 = nil
    v_u_2607 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2608)
            if typeof(p2608) == "Instance" then
                if p2608:IsA(v_u_2606) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2607, p2608, (("expected %*, got %*"):format(v_u_2606, p2608.ClassName)))
                end
            else
                return v_u_3.err(v_u_2607, p2608, (("expected %*, got %*"):format(v_u_2606, (typeof(p2608)))))
            end
        end,
        ["_format"] = function(p2609, _, _)
            return v_u_2(v_u_2606, p2609[v_u_2607])
        end
    }
    local v2610 = v_u_4
    local v2611 = v_u_2607
    return setmetatable(v2611, v2610)
end
local v_u_2612 = "DataStorePages"
function v5.DataStorePages()
    local v_u_2613 = nil
    v_u_2613 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2614)
            if typeof(p2614) == "Instance" then
                if p2614:IsA(v_u_2612) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2613, p2614, (("expected %*, got %*"):format(v_u_2612, p2614.ClassName)))
                end
            else
                return v_u_3.err(v_u_2613, p2614, (("expected %*, got %*"):format(v_u_2612, (typeof(p2614)))))
            end
        end,
        ["_format"] = function(p2615, _, _)
            return v_u_2(v_u_2612, p2615[v_u_2613])
        end
    }
    local v2616 = v_u_4
    local v2617 = v_u_2613
    return setmetatable(v2617, v2616)
end
local v_u_2618 = "DataStoreVersionPages"
function v5.DataStoreVersionPages()
    local v_u_2619 = nil
    v_u_2619 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2620)
            if typeof(p2620) == "Instance" then
                if p2620:IsA(v_u_2618) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2619, p2620, (("expected %*, got %*"):format(v_u_2618, p2620.ClassName)))
                end
            else
                return v_u_3.err(v_u_2619, p2620, (("expected %*, got %*"):format(v_u_2618, (typeof(p2620)))))
            end
        end,
        ["_format"] = function(p2621, _, _)
            return v_u_2(v_u_2618, p2621[v_u_2619])
        end
    }
    local v2622 = v_u_4
    local v2623 = v_u_2619
    return setmetatable(v2623, v2622)
end
local v_u_2624 = "FriendPages"
function v5.FriendPages()
    local v_u_2625 = nil
    v_u_2625 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2626)
            if typeof(p2626) == "Instance" then
                if p2626:IsA(v_u_2624) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2625, p2626, (("expected %*, got %*"):format(v_u_2624, p2626.ClassName)))
                end
            else
                return v_u_3.err(v_u_2625, p2626, (("expected %*, got %*"):format(v_u_2624, (typeof(p2626)))))
            end
        end,
        ["_format"] = function(p2627, _, _)
            return v_u_2(v_u_2624, p2627[v_u_2625])
        end
    }
    local v2628 = v_u_4
    local v2629 = v_u_2625
    return setmetatable(v2629, v2628)
end
local v_u_2630 = "InventoryPages"
function v5.InventoryPages()
    local v_u_2631 = nil
    v_u_2631 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2632)
            if typeof(p2632) == "Instance" then
                if p2632:IsA(v_u_2630) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2631, p2632, (("expected %*, got %*"):format(v_u_2630, p2632.ClassName)))
                end
            else
                return v_u_3.err(v_u_2631, p2632, (("expected %*, got %*"):format(v_u_2630, (typeof(p2632)))))
            end
        end,
        ["_format"] = function(p2633, _, _)
            return v_u_2(v_u_2630, p2633[v_u_2631])
        end
    }
    local v2634 = v_u_4
    local v2635 = v_u_2631
    return setmetatable(v2635, v2634)
end
local v_u_2636 = "EmotesPages"
function v5.EmotesPages()
    local v_u_2637 = nil
    v_u_2637 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2638)
            if typeof(p2638) == "Instance" then
                if p2638:IsA(v_u_2636) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2637, p2638, (("expected %*, got %*"):format(v_u_2636, p2638.ClassName)))
                end
            else
                return v_u_3.err(v_u_2637, p2638, (("expected %*, got %*"):format(v_u_2636, (typeof(p2638)))))
            end
        end,
        ["_format"] = function(p2639, _, _)
            return v_u_2(v_u_2636, p2639[v_u_2637])
        end
    }
    local v2640 = v_u_4
    local v2641 = v_u_2637
    return setmetatable(v2641, v2640)
end
local v_u_2642 = "MemoryStoreHashMapPages"
function v5.MemoryStoreHashMapPages()
    local v_u_2643 = nil
    v_u_2643 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2644)
            if typeof(p2644) == "Instance" then
                if p2644:IsA(v_u_2642) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2643, p2644, (("expected %*, got %*"):format(v_u_2642, p2644.ClassName)))
                end
            else
                return v_u_3.err(v_u_2643, p2644, (("expected %*, got %*"):format(v_u_2642, (typeof(p2644)))))
            end
        end,
        ["_format"] = function(p2645, _, _)
            return v_u_2(v_u_2642, p2645[v_u_2643])
        end
    }
    local v2646 = v_u_4
    local v2647 = v_u_2643
    return setmetatable(v2647, v2646)
end
local v_u_2648 = "OutfitPages"
function v5.OutfitPages()
    local v_u_2649 = nil
    v_u_2649 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2650)
            if typeof(p2650) == "Instance" then
                if p2650:IsA(v_u_2648) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2649, p2650, (("expected %*, got %*"):format(v_u_2648, p2650.ClassName)))
                end
            else
                return v_u_3.err(v_u_2649, p2650, (("expected %*, got %*"):format(v_u_2648, (typeof(p2650)))))
            end
        end,
        ["_format"] = function(p2651, _, _)
            return v_u_2(v_u_2648, p2651[v_u_2649])
        end
    }
    local v2652 = v_u_4
    local v2653 = v_u_2649
    return setmetatable(v2653, v2652)
end
local v_u_2654 = "StandardPages"
function v5.StandardPages()
    local v_u_2655 = nil
    v_u_2655 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2656)
            if typeof(p2656) == "Instance" then
                if p2656:IsA(v_u_2654) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2655, p2656, (("expected %*, got %*"):format(v_u_2654, p2656.ClassName)))
                end
            else
                return v_u_3.err(v_u_2655, p2656, (("expected %*, got %*"):format(v_u_2654, (typeof(p2656)))))
            end
        end,
        ["_format"] = function(p2657, _, _)
            return v_u_2(v_u_2654, p2657[v_u_2655])
        end
    }
    local v2658 = v_u_4
    local v2659 = v_u_2655
    return setmetatable(v2659, v2658)
end
local v_u_2660 = "PartOperationAsset"
function v5.PartOperationAsset()
    local v_u_2661 = nil
    v_u_2661 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2662)
            if typeof(p2662) == "Instance" then
                if p2662:IsA(v_u_2660) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2661, p2662, (("expected %*, got %*"):format(v_u_2660, p2662.ClassName)))
                end
            else
                return v_u_3.err(v_u_2661, p2662, (("expected %*, got %*"):format(v_u_2660, (typeof(p2662)))))
            end
        end,
        ["_format"] = function(p2663, _, _)
            return v_u_2(v_u_2660, p2663[v_u_2661])
        end
    }
    local v2664 = v_u_4
    local v2665 = v_u_2661
    return setmetatable(v2665, v2664)
end
local v_u_2666 = "ParticleEmitter"
function v5.ParticleEmitter()
    local v_u_2667 = nil
    v_u_2667 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2668)
            if typeof(p2668) == "Instance" then
                if p2668:IsA(v_u_2666) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2667, p2668, (("expected %*, got %*"):format(v_u_2666, p2668.ClassName)))
                end
            else
                return v_u_3.err(v_u_2667, p2668, (("expected %*, got %*"):format(v_u_2666, (typeof(p2668)))))
            end
        end,
        ["_format"] = function(p2669, _, _)
            return v_u_2(v_u_2666, p2669[v_u_2667])
        end
    }
    local v2670 = v_u_4
    local v2671 = v_u_2667
    return setmetatable(v2671, v2670)
end
local v_u_2672 = "PatchBundlerFileWatch"
function v5.PatchBundlerFileWatch()
    local v_u_2673 = nil
    v_u_2673 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2674)
            if typeof(p2674) == "Instance" then
                if p2674:IsA(v_u_2672) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2673, p2674, (("expected %*, got %*"):format(v_u_2672, p2674.ClassName)))
                end
            else
                return v_u_3.err(v_u_2673, p2674, (("expected %*, got %*"):format(v_u_2672, (typeof(p2674)))))
            end
        end,
        ["_format"] = function(p2675, _, _)
            return v_u_2(v_u_2672, p2675[v_u_2673])
        end
    }
    local v2676 = v_u_4
    local v2677 = v_u_2673
    return setmetatable(v2677, v2676)
end
local v_u_2678 = "PatchMapping"
function v5.PatchMapping()
    local v_u_2679 = nil
    v_u_2679 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2680)
            if typeof(p2680) == "Instance" then
                if p2680:IsA(v_u_2678) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2679, p2680, (("expected %*, got %*"):format(v_u_2678, p2680.ClassName)))
                end
            else
                return v_u_3.err(v_u_2679, p2680, (("expected %*, got %*"):format(v_u_2678, (typeof(p2680)))))
            end
        end,
        ["_format"] = function(p2681, _, _)
            return v_u_2(v_u_2678, p2681[v_u_2679])
        end
    }
    local v2682 = v_u_4
    local v2683 = v_u_2679
    return setmetatable(v2683, v2682)
end
local v_u_2684 = "Path"
function v5.Path()
    local v_u_2685 = nil
    v_u_2685 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2686)
            if typeof(p2686) == "Instance" then
                if p2686:IsA(v_u_2684) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2685, p2686, (("expected %*, got %*"):format(v_u_2684, p2686.ClassName)))
                end
            else
                return v_u_3.err(v_u_2685, p2686, (("expected %*, got %*"):format(v_u_2684, (typeof(p2686)))))
            end
        end,
        ["_format"] = function(p2687, _, _)
            return v_u_2(v_u_2684, p2687[v_u_2685])
        end
    }
    local v2688 = v_u_4
    local v2689 = v_u_2685
    return setmetatable(v2689, v2688)
end
local v_u_2690 = "PathfindingLink"
function v5.PathfindingLink()
    local v_u_2691 = nil
    v_u_2691 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2692)
            if typeof(p2692) == "Instance" then
                if p2692:IsA(v_u_2690) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2691, p2692, (("expected %*, got %*"):format(v_u_2690, p2692.ClassName)))
                end
            else
                return v_u_3.err(v_u_2691, p2692, (("expected %*, got %*"):format(v_u_2690, (typeof(p2692)))))
            end
        end,
        ["_format"] = function(p2693, _, _)
            return v_u_2(v_u_2690, p2693[v_u_2691])
        end
    }
    local v2694 = v_u_4
    local v2695 = v_u_2691
    return setmetatable(v2695, v2694)
end
local v_u_2696 = "PathfindingModifier"
function v5.PathfindingModifier()
    local v_u_2697 = nil
    v_u_2697 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2698)
            if typeof(p2698) == "Instance" then
                if p2698:IsA(v_u_2696) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2697, p2698, (("expected %*, got %*"):format(v_u_2696, p2698.ClassName)))
                end
            else
                return v_u_3.err(v_u_2697, p2698, (("expected %*, got %*"):format(v_u_2696, (typeof(p2698)))))
            end
        end,
        ["_format"] = function(p2699, _, _)
            return v_u_2(v_u_2696, p2699[v_u_2697])
        end
    }
    local v2700 = v_u_4
    local v2701 = v_u_2697
    return setmetatable(v2701, v2700)
end
local v_u_2702 = "PathfindingService"
function v5.PathfindingService()
    local v_u_2703 = nil
    v_u_2703 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2704)
            if typeof(p2704) == "Instance" then
                if p2704:IsA(v_u_2702) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2703, p2704, (("expected %*, got %*"):format(v_u_2702, p2704.ClassName)))
                end
            else
                return v_u_3.err(v_u_2703, p2704, (("expected %*, got %*"):format(v_u_2702, (typeof(p2704)))))
            end
        end,
        ["_format"] = function(p2705, _, _)
            return v_u_2(v_u_2702, p2705[v_u_2703])
        end
    }
    local v2706 = v_u_4
    local v2707 = v_u_2703
    return setmetatable(v2707, v2706)
end
local v_u_2708 = "PausedState"
function v5.PausedState()
    local v_u_2709 = nil
    v_u_2709 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2710)
            if typeof(p2710) == "Instance" then
                if p2710:IsA(v_u_2708) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2709, p2710, (("expected %*, got %*"):format(v_u_2708, p2710.ClassName)))
                end
            else
                return v_u_3.err(v_u_2709, p2710, (("expected %*, got %*"):format(v_u_2708, (typeof(p2710)))))
            end
        end,
        ["_format"] = function(p2711, _, _)
            return v_u_2(v_u_2708, p2711[v_u_2709])
        end
    }
    local v2712 = v_u_4
    local v2713 = v_u_2709
    return setmetatable(v2713, v2712)
end
local v_u_2714 = "PausedStateBreakpoint"
function v5.PausedStateBreakpoint()
    local v_u_2715 = nil
    v_u_2715 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2716)
            if typeof(p2716) == "Instance" then
                if p2716:IsA(v_u_2714) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2715, p2716, (("expected %*, got %*"):format(v_u_2714, p2716.ClassName)))
                end
            else
                return v_u_3.err(v_u_2715, p2716, (("expected %*, got %*"):format(v_u_2714, (typeof(p2716)))))
            end
        end,
        ["_format"] = function(p2717, _, _)
            return v_u_2(v_u_2714, p2717[v_u_2715])
        end
    }
    local v2718 = v_u_4
    local v2719 = v_u_2715
    return setmetatable(v2719, v2718)
end
local v_u_2720 = "PausedStateException"
function v5.PausedStateException()
    local v_u_2721 = nil
    v_u_2721 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2722)
            if typeof(p2722) == "Instance" then
                if p2722:IsA(v_u_2720) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2721, p2722, (("expected %*, got %*"):format(v_u_2720, p2722.ClassName)))
                end
            else
                return v_u_3.err(v_u_2721, p2722, (("expected %*, got %*"):format(v_u_2720, (typeof(p2722)))))
            end
        end,
        ["_format"] = function(p2723, _, _)
            return v_u_2(v_u_2720, p2723[v_u_2721])
        end
    }
    local v2724 = v_u_4
    local v2725 = v_u_2721
    return setmetatable(v2725, v2724)
end
local v_u_2726 = "PermissionsService"
function v5.PermissionsService()
    local v_u_2727 = nil
    v_u_2727 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2728)
            if typeof(p2728) == "Instance" then
                if p2728:IsA(v_u_2726) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2727, p2728, (("expected %*, got %*"):format(v_u_2726, p2728.ClassName)))
                end
            else
                return v_u_3.err(v_u_2727, p2728, (("expected %*, got %*"):format(v_u_2726, (typeof(p2728)))))
            end
        end,
        ["_format"] = function(p2729, _, _)
            return v_u_2(v_u_2726, p2729[v_u_2727])
        end
    }
    local v2730 = v_u_4
    local v2731 = v_u_2727
    return setmetatable(v2731, v2730)
end
local v_u_2732 = "PhysicsService"
function v5.PhysicsService()
    local v_u_2733 = nil
    v_u_2733 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2734)
            if typeof(p2734) == "Instance" then
                if p2734:IsA(v_u_2732) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2733, p2734, (("expected %*, got %*"):format(v_u_2732, p2734.ClassName)))
                end
            else
                return v_u_3.err(v_u_2733, p2734, (("expected %*, got %*"):format(v_u_2732, (typeof(p2734)))))
            end
        end,
        ["_format"] = function(p2735, _, _)
            return v_u_2(v_u_2732, p2735[v_u_2733])
        end
    }
    local v2736 = v_u_4
    local v2737 = v_u_2733
    return setmetatable(v2737, v2736)
end
local v_u_2738 = "PhysicsSettings"
function v5.PhysicsSettings()
    local v_u_2739 = nil
    v_u_2739 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2740)
            if typeof(p2740) == "Instance" then
                if p2740:IsA(v_u_2738) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2739, p2740, (("expected %*, got %*"):format(v_u_2738, p2740.ClassName)))
                end
            else
                return v_u_3.err(v_u_2739, p2740, (("expected %*, got %*"):format(v_u_2738, (typeof(p2740)))))
            end
        end,
        ["_format"] = function(p2741, _, _)
            return v_u_2(v_u_2738, p2741[v_u_2739])
        end
    }
    local v2742 = v_u_4
    local v2743 = v_u_2739
    return setmetatable(v2743, v2742)
end
local v_u_2744 = "PlaceStatsService"
function v5.PlaceStatsService()
    local v_u_2745 = nil
    v_u_2745 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2746)
            if typeof(p2746) == "Instance" then
                if p2746:IsA(v_u_2744) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2745, p2746, (("expected %*, got %*"):format(v_u_2744, p2746.ClassName)))
                end
            else
                return v_u_3.err(v_u_2745, p2746, (("expected %*, got %*"):format(v_u_2744, (typeof(p2746)))))
            end
        end,
        ["_format"] = function(p2747, _, _)
            return v_u_2(v_u_2744, p2747[v_u_2745])
        end
    }
    local v2748 = v_u_4
    local v2749 = v_u_2745
    return setmetatable(v2749, v2748)
end
local v_u_2750 = "PlacesService"
function v5.PlacesService()
    local v_u_2751 = nil
    v_u_2751 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2752)
            if typeof(p2752) == "Instance" then
                if p2752:IsA(v_u_2750) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2751, p2752, (("expected %*, got %*"):format(v_u_2750, p2752.ClassName)))
                end
            else
                return v_u_3.err(v_u_2751, p2752, (("expected %*, got %*"):format(v_u_2750, (typeof(p2752)))))
            end
        end,
        ["_format"] = function(p2753, _, _)
            return v_u_2(v_u_2750, p2753[v_u_2751])
        end
    }
    local v2754 = v_u_4
    local v2755 = v_u_2751
    return setmetatable(v2755, v2754)
end
local v_u_2756 = "PlatformCloudStorageService"
function v5.PlatformCloudStorageService()
    local v_u_2757 = nil
    v_u_2757 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2758)
            if typeof(p2758) == "Instance" then
                if p2758:IsA(v_u_2756) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2757, p2758, (("expected %*, got %*"):format(v_u_2756, p2758.ClassName)))
                end
            else
                return v_u_3.err(v_u_2757, p2758, (("expected %*, got %*"):format(v_u_2756, (typeof(p2758)))))
            end
        end,
        ["_format"] = function(p2759, _, _)
            return v_u_2(v_u_2756, p2759[v_u_2757])
        end
    }
    local v2760 = v_u_4
    local v2761 = v_u_2757
    return setmetatable(v2761, v2760)
end
local v_u_2762 = "PlatformFriendsService"
function v5.PlatformFriendsService()
    local v_u_2763 = nil
    v_u_2763 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2764)
            if typeof(p2764) == "Instance" then
                if p2764:IsA(v_u_2762) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2763, p2764, (("expected %*, got %*"):format(v_u_2762, p2764.ClassName)))
                end
            else
                return v_u_3.err(v_u_2763, p2764, (("expected %*, got %*"):format(v_u_2762, (typeof(p2764)))))
            end
        end,
        ["_format"] = function(p2765, _, _)
            return v_u_2(v_u_2762, p2765[v_u_2763])
        end
    }
    local v2766 = v_u_4
    local v2767 = v_u_2763
    return setmetatable(v2767, v2766)
end
local v_u_2768 = "Player"
function v5.Player()
    local v_u_2769 = nil
    v_u_2769 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2770)
            if typeof(p2770) == "Instance" then
                if p2770:IsA(v_u_2768) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2769, p2770, (("expected %*, got %*"):format(v_u_2768, p2770.ClassName)))
                end
            else
                return v_u_3.err(v_u_2769, p2770, (("expected %*, got %*"):format(v_u_2768, (typeof(p2770)))))
            end
        end,
        ["_format"] = function(p2771, _, _)
            return v_u_2(v_u_2768, p2771[v_u_2769])
        end
    }
    local v2772 = v_u_4
    local v2773 = v_u_2769
    return setmetatable(v2773, v2772)
end
local v_u_2774 = "PlayerEmulatorService"
function v5.PlayerEmulatorService()
    local v_u_2775 = nil
    v_u_2775 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2776)
            if typeof(p2776) == "Instance" then
                if p2776:IsA(v_u_2774) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2775, p2776, (("expected %*, got %*"):format(v_u_2774, p2776.ClassName)))
                end
            else
                return v_u_3.err(v_u_2775, p2776, (("expected %*, got %*"):format(v_u_2774, (typeof(p2776)))))
            end
        end,
        ["_format"] = function(p2777, _, _)
            return v_u_2(v_u_2774, p2777[v_u_2775])
        end
    }
    local v2778 = v_u_4
    local v2779 = v_u_2775
    return setmetatable(v2779, v2778)
end
local v_u_2780 = "PlayerScripts"
function v5.PlayerScripts()
    local v_u_2781 = nil
    v_u_2781 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2782)
            if typeof(p2782) == "Instance" then
                if p2782:IsA(v_u_2780) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2781, p2782, (("expected %*, got %*"):format(v_u_2780, p2782.ClassName)))
                end
            else
                return v_u_3.err(v_u_2781, p2782, (("expected %*, got %*"):format(v_u_2780, (typeof(p2782)))))
            end
        end,
        ["_format"] = function(p2783, _, _)
            return v_u_2(v_u_2780, p2783[v_u_2781])
        end
    }
    local v2784 = v_u_4
    local v2785 = v_u_2781
    return setmetatable(v2785, v2784)
end
local v_u_2786 = "PlayerViewService"
function v5.PlayerViewService()
    local v_u_2787 = nil
    v_u_2787 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2788)
            if typeof(p2788) == "Instance" then
                if p2788:IsA(v_u_2786) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2787, p2788, (("expected %*, got %*"):format(v_u_2786, p2788.ClassName)))
                end
            else
                return v_u_3.err(v_u_2787, p2788, (("expected %*, got %*"):format(v_u_2786, (typeof(p2788)))))
            end
        end,
        ["_format"] = function(p2789, _, _)
            return v_u_2(v_u_2786, p2789[v_u_2787])
        end
    }
    local v2790 = v_u_4
    local v2791 = v_u_2787
    return setmetatable(v2791, v2790)
end
local v_u_2792 = "Players"
function v5.Players()
    local v_u_2793 = nil
    v_u_2793 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2794)
            if typeof(p2794) == "Instance" then
                if p2794:IsA(v_u_2792) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2793, p2794, (("expected %*, got %*"):format(v_u_2792, p2794.ClassName)))
                end
            else
                return v_u_3.err(v_u_2793, p2794, (("expected %*, got %*"):format(v_u_2792, (typeof(p2794)))))
            end
        end,
        ["_format"] = function(p2795, _, _)
            return v_u_2(v_u_2792, p2795[v_u_2793])
        end
    }
    local v2796 = v_u_4
    local v2797 = v_u_2793
    return setmetatable(v2797, v2796)
end
local v_u_2798 = "Plugin"
function v5.Plugin()
    local v_u_2799 = nil
    v_u_2799 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2800)
            if typeof(p2800) == "Instance" then
                if p2800:IsA(v_u_2798) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2799, p2800, (("expected %*, got %*"):format(v_u_2798, p2800.ClassName)))
                end
            else
                return v_u_3.err(v_u_2799, p2800, (("expected %*, got %*"):format(v_u_2798, (typeof(p2800)))))
            end
        end,
        ["_format"] = function(p2801, _, _)
            return v_u_2(v_u_2798, p2801[v_u_2799])
        end
    }
    local v2802 = v_u_4
    local v2803 = v_u_2799
    return setmetatable(v2803, v2802)
end
local v_u_2804 = "PluginAction"
function v5.PluginAction()
    local v_u_2805 = nil
    v_u_2805 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2806)
            if typeof(p2806) == "Instance" then
                if p2806:IsA(v_u_2804) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2805, p2806, (("expected %*, got %*"):format(v_u_2804, p2806.ClassName)))
                end
            else
                return v_u_3.err(v_u_2805, p2806, (("expected %*, got %*"):format(v_u_2804, (typeof(p2806)))))
            end
        end,
        ["_format"] = function(p2807, _, _)
            return v_u_2(v_u_2804, p2807[v_u_2805])
        end
    }
    local v2808 = v_u_4
    local v2809 = v_u_2805
    return setmetatable(v2809, v2808)
end
local v_u_2810 = "PluginCapabilities"
function v5.PluginCapabilities()
    local v_u_2811 = nil
    v_u_2811 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2812)
            if typeof(p2812) == "Instance" then
                if p2812:IsA(v_u_2810) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2811, p2812, (("expected %*, got %*"):format(v_u_2810, p2812.ClassName)))
                end
            else
                return v_u_3.err(v_u_2811, p2812, (("expected %*, got %*"):format(v_u_2810, (typeof(p2812)))))
            end
        end,
        ["_format"] = function(p2813, _, _)
            return v_u_2(v_u_2810, p2813[v_u_2811])
        end
    }
    local v2814 = v_u_4
    local v2815 = v_u_2811
    return setmetatable(v2815, v2814)
end
local v_u_2816 = "PluginDebugService"
function v5.PluginDebugService()
    local v_u_2817 = nil
    v_u_2817 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2818)
            if typeof(p2818) == "Instance" then
                if p2818:IsA(v_u_2816) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2817, p2818, (("expected %*, got %*"):format(v_u_2816, p2818.ClassName)))
                end
            else
                return v_u_3.err(v_u_2817, p2818, (("expected %*, got %*"):format(v_u_2816, (typeof(p2818)))))
            end
        end,
        ["_format"] = function(p2819, _, _)
            return v_u_2(v_u_2816, p2819[v_u_2817])
        end
    }
    local v2820 = v_u_4
    local v2821 = v_u_2817
    return setmetatable(v2821, v2820)
end
local v_u_2822 = "PluginDragEvent"
function v5.PluginDragEvent()
    local v_u_2823 = nil
    v_u_2823 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2824)
            if typeof(p2824) == "Instance" then
                if p2824:IsA(v_u_2822) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2823, p2824, (("expected %*, got %*"):format(v_u_2822, p2824.ClassName)))
                end
            else
                return v_u_3.err(v_u_2823, p2824, (("expected %*, got %*"):format(v_u_2822, (typeof(p2824)))))
            end
        end,
        ["_format"] = function(p2825, _, _)
            return v_u_2(v_u_2822, p2825[v_u_2823])
        end
    }
    local v2826 = v_u_4
    local v2827 = v_u_2823
    return setmetatable(v2827, v2826)
end
local v_u_2828 = "PluginGuiService"
function v5.PluginGuiService()
    local v_u_2829 = nil
    v_u_2829 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2830)
            if typeof(p2830) == "Instance" then
                if p2830:IsA(v_u_2828) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2829, p2830, (("expected %*, got %*"):format(v_u_2828, p2830.ClassName)))
                end
            else
                return v_u_3.err(v_u_2829, p2830, (("expected %*, got %*"):format(v_u_2828, (typeof(p2830)))))
            end
        end,
        ["_format"] = function(p2831, _, _)
            return v_u_2(v_u_2828, p2831[v_u_2829])
        end
    }
    local v2832 = v_u_4
    local v2833 = v_u_2829
    return setmetatable(v2833, v2832)
end
local v_u_2834 = "PluginManagementService"
function v5.PluginManagementService()
    local v_u_2835 = nil
    v_u_2835 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2836)
            if typeof(p2836) == "Instance" then
                if p2836:IsA(v_u_2834) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2835, p2836, (("expected %*, got %*"):format(v_u_2834, p2836.ClassName)))
                end
            else
                return v_u_3.err(v_u_2835, p2836, (("expected %*, got %*"):format(v_u_2834, (typeof(p2836)))))
            end
        end,
        ["_format"] = function(p2837, _, _)
            return v_u_2(v_u_2834, p2837[v_u_2835])
        end
    }
    local v2838 = v_u_4
    local v2839 = v_u_2835
    return setmetatable(v2839, v2838)
end
local v_u_2840 = "PluginManager"
function v5.PluginManager()
    local v_u_2841 = nil
    v_u_2841 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2842)
            if typeof(p2842) == "Instance" then
                if p2842:IsA(v_u_2840) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2841, p2842, (("expected %*, got %*"):format(v_u_2840, p2842.ClassName)))
                end
            else
                return v_u_3.err(v_u_2841, p2842, (("expected %*, got %*"):format(v_u_2840, (typeof(p2842)))))
            end
        end,
        ["_format"] = function(p2843, _, _)
            return v_u_2(v_u_2840, p2843[v_u_2841])
        end
    }
    local v2844 = v_u_4
    local v2845 = v_u_2841
    return setmetatable(v2845, v2844)
end
local v_u_2846 = "PluginManagerInterface"
function v5.PluginManagerInterface()
    local v_u_2847 = nil
    v_u_2847 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2848)
            if typeof(p2848) == "Instance" then
                if p2848:IsA(v_u_2846) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2847, p2848, (("expected %*, got %*"):format(v_u_2846, p2848.ClassName)))
                end
            else
                return v_u_3.err(v_u_2847, p2848, (("expected %*, got %*"):format(v_u_2846, (typeof(p2848)))))
            end
        end,
        ["_format"] = function(p2849, _, _)
            return v_u_2(v_u_2846, p2849[v_u_2847])
        end
    }
    local v2850 = v_u_4
    local v2851 = v_u_2847
    return setmetatable(v2851, v2850)
end
local v_u_2852 = "PluginMenu"
function v5.PluginMenu()
    local v_u_2853 = nil
    v_u_2853 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2854)
            if typeof(p2854) == "Instance" then
                if p2854:IsA(v_u_2852) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2853, p2854, (("expected %*, got %*"):format(v_u_2852, p2854.ClassName)))
                end
            else
                return v_u_3.err(v_u_2853, p2854, (("expected %*, got %*"):format(v_u_2852, (typeof(p2854)))))
            end
        end,
        ["_format"] = function(p2855, _, _)
            return v_u_2(v_u_2852, p2855[v_u_2853])
        end
    }
    local v2856 = v_u_4
    local v2857 = v_u_2853
    return setmetatable(v2857, v2856)
end
local v_u_2858 = "PluginPolicyService"
function v5.PluginPolicyService()
    local v_u_2859 = nil
    v_u_2859 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2860)
            if typeof(p2860) == "Instance" then
                if p2860:IsA(v_u_2858) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2859, p2860, (("expected %*, got %*"):format(v_u_2858, p2860.ClassName)))
                end
            else
                return v_u_3.err(v_u_2859, p2860, (("expected %*, got %*"):format(v_u_2858, (typeof(p2860)))))
            end
        end,
        ["_format"] = function(p2861, _, _)
            return v_u_2(v_u_2858, p2861[v_u_2859])
        end
    }
    local v2862 = v_u_4
    local v2863 = v_u_2859
    return setmetatable(v2863, v2862)
end
local v_u_2864 = "PluginToolbar"
function v5.PluginToolbar()
    local v_u_2865 = nil
    v_u_2865 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2866)
            if typeof(p2866) == "Instance" then
                if p2866:IsA(v_u_2864) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2865, p2866, (("expected %*, got %*"):format(v_u_2864, p2866.ClassName)))
                end
            else
                return v_u_3.err(v_u_2865, p2866, (("expected %*, got %*"):format(v_u_2864, (typeof(p2866)))))
            end
        end,
        ["_format"] = function(p2867, _, _)
            return v_u_2(v_u_2864, p2867[v_u_2865])
        end
    }
    local v2868 = v_u_4
    local v2869 = v_u_2865
    return setmetatable(v2869, v2868)
end
local v_u_2870 = "PluginToolbarButton"
function v5.PluginToolbarButton()
    local v_u_2871 = nil
    v_u_2871 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2872)
            if typeof(p2872) == "Instance" then
                if p2872:IsA(v_u_2870) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2871, p2872, (("expected %*, got %*"):format(v_u_2870, p2872.ClassName)))
                end
            else
                return v_u_3.err(v_u_2871, p2872, (("expected %*, got %*"):format(v_u_2870, (typeof(p2872)))))
            end
        end,
        ["_format"] = function(p2873, _, _)
            return v_u_2(v_u_2870, p2873[v_u_2871])
        end
    }
    local v2874 = v_u_4
    local v2875 = v_u_2871
    return setmetatable(v2875, v2874)
end
local v_u_2876 = "PointsService"
function v5.PointsService()
    local v_u_2877 = nil
    v_u_2877 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2878)
            if typeof(p2878) == "Instance" then
                if p2878:IsA(v_u_2876) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2877, p2878, (("expected %*, got %*"):format(v_u_2876, p2878.ClassName)))
                end
            else
                return v_u_3.err(v_u_2877, p2878, (("expected %*, got %*"):format(v_u_2876, (typeof(p2878)))))
            end
        end,
        ["_format"] = function(p2879, _, _)
            return v_u_2(v_u_2876, p2879[v_u_2877])
        end
    }
    local v2880 = v_u_4
    local v2881 = v_u_2877
    return setmetatable(v2881, v2880)
end
local v_u_2882 = "PolicyService"
function v5.PolicyService()
    local v_u_2883 = nil
    v_u_2883 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2884)
            if typeof(p2884) == "Instance" then
                if p2884:IsA(v_u_2882) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2883, p2884, (("expected %*, got %*"):format(v_u_2882, p2884.ClassName)))
                end
            else
                return v_u_3.err(v_u_2883, p2884, (("expected %*, got %*"):format(v_u_2882, (typeof(p2884)))))
            end
        end,
        ["_format"] = function(p2885, _, _)
            return v_u_2(v_u_2882, p2885[v_u_2883])
        end
    }
    local v2886 = v_u_4
    local v2887 = v_u_2883
    return setmetatable(v2887, v2886)
end
local v_u_2888 = "PoseBase"
function v5.PoseBase()
    local v_u_2889 = nil
    v_u_2889 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2890)
            if typeof(p2890) == "Instance" then
                if p2890:IsA(v_u_2888) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2889, p2890, (("expected %*, got %*"):format(v_u_2888, p2890.ClassName)))
                end
            else
                return v_u_3.err(v_u_2889, p2890, (("expected %*, got %*"):format(v_u_2888, (typeof(p2890)))))
            end
        end,
        ["_format"] = function(p2891, _, _)
            return v_u_2(v_u_2888, p2891[v_u_2889])
        end
    }
    local v2892 = v_u_4
    local v2893 = v_u_2889
    return setmetatable(v2893, v2892)
end
local v_u_2894 = "NumberPose"
function v5.NumberPose()
    local v_u_2895 = nil
    v_u_2895 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2896)
            if typeof(p2896) == "Instance" then
                if p2896:IsA(v_u_2894) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2895, p2896, (("expected %*, got %*"):format(v_u_2894, p2896.ClassName)))
                end
            else
                return v_u_3.err(v_u_2895, p2896, (("expected %*, got %*"):format(v_u_2894, (typeof(p2896)))))
            end
        end,
        ["_format"] = function(p2897, _, _)
            return v_u_2(v_u_2894, p2897[v_u_2895])
        end
    }
    local v2898 = v_u_4
    local v2899 = v_u_2895
    return setmetatable(v2899, v2898)
end
local v_u_2900 = "Pose"
function v5.Pose()
    local v_u_2901 = nil
    v_u_2901 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2902)
            if typeof(p2902) == "Instance" then
                if p2902:IsA(v_u_2900) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2901, p2902, (("expected %*, got %*"):format(v_u_2900, p2902.ClassName)))
                end
            else
                return v_u_3.err(v_u_2901, p2902, (("expected %*, got %*"):format(v_u_2900, (typeof(p2902)))))
            end
        end,
        ["_format"] = function(p2903, _, _)
            return v_u_2(v_u_2900, p2903[v_u_2901])
        end
    }
    local v2904 = v_u_4
    local v2905 = v_u_2901
    return setmetatable(v2905, v2904)
end
local v_u_2906 = "PostEffect"
function v5.PostEffect()
    local v_u_2907 = nil
    v_u_2907 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2908)
            if typeof(p2908) == "Instance" then
                if p2908:IsA(v_u_2906) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2907, p2908, (("expected %*, got %*"):format(v_u_2906, p2908.ClassName)))
                end
            else
                return v_u_3.err(v_u_2907, p2908, (("expected %*, got %*"):format(v_u_2906, (typeof(p2908)))))
            end
        end,
        ["_format"] = function(p2909, _, _)
            return v_u_2(v_u_2906, p2909[v_u_2907])
        end
    }
    local v2910 = v_u_4
    local v2911 = v_u_2907
    return setmetatable(v2911, v2910)
end
local v_u_2912 = "BloomEffect"
function v5.BloomEffect()
    local v_u_2913 = nil
    v_u_2913 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2914)
            if typeof(p2914) == "Instance" then
                if p2914:IsA(v_u_2912) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2913, p2914, (("expected %*, got %*"):format(v_u_2912, p2914.ClassName)))
                end
            else
                return v_u_3.err(v_u_2913, p2914, (("expected %*, got %*"):format(v_u_2912, (typeof(p2914)))))
            end
        end,
        ["_format"] = function(p2915, _, _)
            return v_u_2(v_u_2912, p2915[v_u_2913])
        end
    }
    local v2916 = v_u_4
    local v2917 = v_u_2913
    return setmetatable(v2917, v2916)
end
local v_u_2918 = "BlurEffect"
function v5.BlurEffect()
    local v_u_2919 = nil
    v_u_2919 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2920)
            if typeof(p2920) == "Instance" then
                if p2920:IsA(v_u_2918) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2919, p2920, (("expected %*, got %*"):format(v_u_2918, p2920.ClassName)))
                end
            else
                return v_u_3.err(v_u_2919, p2920, (("expected %*, got %*"):format(v_u_2918, (typeof(p2920)))))
            end
        end,
        ["_format"] = function(p2921, _, _)
            return v_u_2(v_u_2918, p2921[v_u_2919])
        end
    }
    local v2922 = v_u_4
    local v2923 = v_u_2919
    return setmetatable(v2923, v2922)
end
local v_u_2924 = "ColorCorrectionEffect"
function v5.ColorCorrectionEffect()
    local v_u_2925 = nil
    v_u_2925 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2926)
            if typeof(p2926) == "Instance" then
                if p2926:IsA(v_u_2924) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2925, p2926, (("expected %*, got %*"):format(v_u_2924, p2926.ClassName)))
                end
            else
                return v_u_3.err(v_u_2925, p2926, (("expected %*, got %*"):format(v_u_2924, (typeof(p2926)))))
            end
        end,
        ["_format"] = function(p2927, _, _)
            return v_u_2(v_u_2924, p2927[v_u_2925])
        end
    }
    local v2928 = v_u_4
    local v2929 = v_u_2925
    return setmetatable(v2929, v2928)
end
local v_u_2930 = "DepthOfFieldEffect"
function v5.DepthOfFieldEffect()
    local v_u_2931 = nil
    v_u_2931 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2932)
            if typeof(p2932) == "Instance" then
                if p2932:IsA(v_u_2930) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2931, p2932, (("expected %*, got %*"):format(v_u_2930, p2932.ClassName)))
                end
            else
                return v_u_3.err(v_u_2931, p2932, (("expected %*, got %*"):format(v_u_2930, (typeof(p2932)))))
            end
        end,
        ["_format"] = function(p2933, _, _)
            return v_u_2(v_u_2930, p2933[v_u_2931])
        end
    }
    local v2934 = v_u_4
    local v2935 = v_u_2931
    return setmetatable(v2935, v2934)
end
local v_u_2936 = "SunRaysEffect"
function v5.SunRaysEffect()
    local v_u_2937 = nil
    v_u_2937 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2938)
            if typeof(p2938) == "Instance" then
                if p2938:IsA(v_u_2936) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2937, p2938, (("expected %*, got %*"):format(v_u_2936, p2938.ClassName)))
                end
            else
                return v_u_3.err(v_u_2937, p2938, (("expected %*, got %*"):format(v_u_2936, (typeof(p2938)))))
            end
        end,
        ["_format"] = function(p2939, _, _)
            return v_u_2(v_u_2936, p2939[v_u_2937])
        end
    }
    local v2940 = v_u_4
    local v2941 = v_u_2937
    return setmetatable(v2941, v2940)
end
local v_u_2942 = "ProcessInstancePhysicsService"
function v5.ProcessInstancePhysicsService()
    local v_u_2943 = nil
    v_u_2943 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2944)
            if typeof(p2944) == "Instance" then
                if p2944:IsA(v_u_2942) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2943, p2944, (("expected %*, got %*"):format(v_u_2942, p2944.ClassName)))
                end
            else
                return v_u_3.err(v_u_2943, p2944, (("expected %*, got %*"):format(v_u_2942, (typeof(p2944)))))
            end
        end,
        ["_format"] = function(p2945, _, _)
            return v_u_2(v_u_2942, p2945[v_u_2943])
        end
    }
    local v2946 = v_u_4
    local v2947 = v_u_2943
    return setmetatable(v2947, v2946)
end
local v_u_2948 = "ProximityPrompt"
function v5.ProximityPrompt()
    local v_u_2949 = nil
    v_u_2949 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2950)
            if typeof(p2950) == "Instance" then
                if p2950:IsA(v_u_2948) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2949, p2950, (("expected %*, got %*"):format(v_u_2948, p2950.ClassName)))
                end
            else
                return v_u_3.err(v_u_2949, p2950, (("expected %*, got %*"):format(v_u_2948, (typeof(p2950)))))
            end
        end,
        ["_format"] = function(p2951, _, _)
            return v_u_2(v_u_2948, p2951[v_u_2949])
        end
    }
    local v2952 = v_u_4
    local v2953 = v_u_2949
    return setmetatable(v2953, v2952)
end
local v_u_2954 = "ProximityPromptService"
function v5.ProximityPromptService()
    local v_u_2955 = nil
    v_u_2955 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2956)
            if typeof(p2956) == "Instance" then
                if p2956:IsA(v_u_2954) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2955, p2956, (("expected %*, got %*"):format(v_u_2954, p2956.ClassName)))
                end
            else
                return v_u_3.err(v_u_2955, p2956, (("expected %*, got %*"):format(v_u_2954, (typeof(p2956)))))
            end
        end,
        ["_format"] = function(p2957, _, _)
            return v_u_2(v_u_2954, p2957[v_u_2955])
        end
    }
    local v2958 = v_u_4
    local v2959 = v_u_2955
    return setmetatable(v2959, v2958)
end
local v_u_2960 = "PublishService"
function v5.PublishService()
    local v_u_2961 = nil
    v_u_2961 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2962)
            if typeof(p2962) == "Instance" then
                if p2962:IsA(v_u_2960) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2961, p2962, (("expected %*, got %*"):format(v_u_2960, p2962.ClassName)))
                end
            else
                return v_u_3.err(v_u_2961, p2962, (("expected %*, got %*"):format(v_u_2960, (typeof(p2962)))))
            end
        end,
        ["_format"] = function(p2963, _, _)
            return v_u_2(v_u_2960, p2963[v_u_2961])
        end
    }
    local v2964 = v_u_4
    local v2965 = v_u_2961
    return setmetatable(v2965, v2964)
end
local v_u_2966 = "RbxAnalyticsService"
function v5.RbxAnalyticsService()
    local v_u_2967 = nil
    v_u_2967 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2968)
            if typeof(p2968) == "Instance" then
                if p2968:IsA(v_u_2966) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2967, p2968, (("expected %*, got %*"):format(v_u_2966, p2968.ClassName)))
                end
            else
                return v_u_3.err(v_u_2967, p2968, (("expected %*, got %*"):format(v_u_2966, (typeof(p2968)))))
            end
        end,
        ["_format"] = function(p2969, _, _)
            return v_u_2(v_u_2966, p2969[v_u_2967])
        end
    }
    local v2970 = v_u_4
    local v2971 = v_u_2967
    return setmetatable(v2971, v2970)
end
local v_u_2972 = "ReflectionMetadata"
function v5.ReflectionMetadata()
    local v_u_2973 = nil
    v_u_2973 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2974)
            if typeof(p2974) == "Instance" then
                if p2974:IsA(v_u_2972) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2973, p2974, (("expected %*, got %*"):format(v_u_2972, p2974.ClassName)))
                end
            else
                return v_u_3.err(v_u_2973, p2974, (("expected %*, got %*"):format(v_u_2972, (typeof(p2974)))))
            end
        end,
        ["_format"] = function(p2975, _, _)
            return v_u_2(v_u_2972, p2975[v_u_2973])
        end
    }
    local v2976 = v_u_4
    local v2977 = v_u_2973
    return setmetatable(v2977, v2976)
end
local v_u_2978 = "ReflectionMetadataCallbacks"
function v5.ReflectionMetadataCallbacks()
    local v_u_2979 = nil
    v_u_2979 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2980)
            if typeof(p2980) == "Instance" then
                if p2980:IsA(v_u_2978) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2979, p2980, (("expected %*, got %*"):format(v_u_2978, p2980.ClassName)))
                end
            else
                return v_u_3.err(v_u_2979, p2980, (("expected %*, got %*"):format(v_u_2978, (typeof(p2980)))))
            end
        end,
        ["_format"] = function(p2981, _, _)
            return v_u_2(v_u_2978, p2981[v_u_2979])
        end
    }
    local v2982 = v_u_4
    local v2983 = v_u_2979
    return setmetatable(v2983, v2982)
end
local v_u_2984 = "ReflectionMetadataClasses"
function v5.ReflectionMetadataClasses()
    local v_u_2985 = nil
    v_u_2985 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2986)
            if typeof(p2986) == "Instance" then
                if p2986:IsA(v_u_2984) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2985, p2986, (("expected %*, got %*"):format(v_u_2984, p2986.ClassName)))
                end
            else
                return v_u_3.err(v_u_2985, p2986, (("expected %*, got %*"):format(v_u_2984, (typeof(p2986)))))
            end
        end,
        ["_format"] = function(p2987, _, _)
            return v_u_2(v_u_2984, p2987[v_u_2985])
        end
    }
    local v2988 = v_u_4
    local v2989 = v_u_2985
    return setmetatable(v2989, v2988)
end
local v_u_2990 = "ReflectionMetadataEnums"
function v5.ReflectionMetadataEnums()
    local v_u_2991 = nil
    v_u_2991 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2992)
            if typeof(p2992) == "Instance" then
                if p2992:IsA(v_u_2990) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2991, p2992, (("expected %*, got %*"):format(v_u_2990, p2992.ClassName)))
                end
            else
                return v_u_3.err(v_u_2991, p2992, (("expected %*, got %*"):format(v_u_2990, (typeof(p2992)))))
            end
        end,
        ["_format"] = function(p2993, _, _)
            return v_u_2(v_u_2990, p2993[v_u_2991])
        end
    }
    local v2994 = v_u_4
    local v2995 = v_u_2991
    return setmetatable(v2995, v2994)
end
local v_u_2996 = "ReflectionMetadataEvents"
function v5.ReflectionMetadataEvents()
    local v_u_2997 = nil
    v_u_2997 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p2998)
            if typeof(p2998) == "Instance" then
                if p2998:IsA(v_u_2996) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_2997, p2998, (("expected %*, got %*"):format(v_u_2996, p2998.ClassName)))
                end
            else
                return v_u_3.err(v_u_2997, p2998, (("expected %*, got %*"):format(v_u_2996, (typeof(p2998)))))
            end
        end,
        ["_format"] = function(p2999, _, _)
            return v_u_2(v_u_2996, p2999[v_u_2997])
        end
    }
    local v3000 = v_u_4
    local v3001 = v_u_2997
    return setmetatable(v3001, v3000)
end
local v_u_3002 = "ReflectionMetadataFunctions"
function v5.ReflectionMetadataFunctions()
    local v_u_3003 = nil
    v_u_3003 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3004)
            if typeof(p3004) == "Instance" then
                if p3004:IsA(v_u_3002) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3003, p3004, (("expected %*, got %*"):format(v_u_3002, p3004.ClassName)))
                end
            else
                return v_u_3.err(v_u_3003, p3004, (("expected %*, got %*"):format(v_u_3002, (typeof(p3004)))))
            end
        end,
        ["_format"] = function(p3005, _, _)
            return v_u_2(v_u_3002, p3005[v_u_3003])
        end
    }
    local v3006 = v_u_4
    local v3007 = v_u_3003
    return setmetatable(v3007, v3006)
end
local v_u_3008 = "ReflectionMetadataItem"
function v5.ReflectionMetadataItem()
    local v_u_3009 = nil
    v_u_3009 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3010)
            if typeof(p3010) == "Instance" then
                if p3010:IsA(v_u_3008) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3009, p3010, (("expected %*, got %*"):format(v_u_3008, p3010.ClassName)))
                end
            else
                return v_u_3.err(v_u_3009, p3010, (("expected %*, got %*"):format(v_u_3008, (typeof(p3010)))))
            end
        end,
        ["_format"] = function(p3011, _, _)
            return v_u_2(v_u_3008, p3011[v_u_3009])
        end
    }
    local v3012 = v_u_4
    local v3013 = v_u_3009
    return setmetatable(v3013, v3012)
end
local v_u_3014 = "ReflectionMetadataClass"
function v5.ReflectionMetadataClass()
    local v_u_3015 = nil
    v_u_3015 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3016)
            if typeof(p3016) == "Instance" then
                if p3016:IsA(v_u_3014) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3015, p3016, (("expected %*, got %*"):format(v_u_3014, p3016.ClassName)))
                end
            else
                return v_u_3.err(v_u_3015, p3016, (("expected %*, got %*"):format(v_u_3014, (typeof(p3016)))))
            end
        end,
        ["_format"] = function(p3017, _, _)
            return v_u_2(v_u_3014, p3017[v_u_3015])
        end
    }
    local v3018 = v_u_4
    local v3019 = v_u_3015
    return setmetatable(v3019, v3018)
end
local v_u_3020 = "ReflectionMetadataEnum"
function v5.ReflectionMetadataEnum()
    local v_u_3021 = nil
    v_u_3021 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3022)
            if typeof(p3022) == "Instance" then
                if p3022:IsA(v_u_3020) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3021, p3022, (("expected %*, got %*"):format(v_u_3020, p3022.ClassName)))
                end
            else
                return v_u_3.err(v_u_3021, p3022, (("expected %*, got %*"):format(v_u_3020, (typeof(p3022)))))
            end
        end,
        ["_format"] = function(p3023, _, _)
            return v_u_2(v_u_3020, p3023[v_u_3021])
        end
    }
    local v3024 = v_u_4
    local v3025 = v_u_3021
    return setmetatable(v3025, v3024)
end
local v_u_3026 = "ReflectionMetadataEnumItem"
function v5.ReflectionMetadataEnumItem()
    local v_u_3027 = nil
    v_u_3027 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3028)
            if typeof(p3028) == "Instance" then
                if p3028:IsA(v_u_3026) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3027, p3028, (("expected %*, got %*"):format(v_u_3026, p3028.ClassName)))
                end
            else
                return v_u_3.err(v_u_3027, p3028, (("expected %*, got %*"):format(v_u_3026, (typeof(p3028)))))
            end
        end,
        ["_format"] = function(p3029, _, _)
            return v_u_2(v_u_3026, p3029[v_u_3027])
        end
    }
    local v3030 = v_u_4
    local v3031 = v_u_3027
    return setmetatable(v3031, v3030)
end
local v_u_3032 = "ReflectionMetadataMember"
function v5.ReflectionMetadataMember()
    local v_u_3033 = nil
    v_u_3033 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3034)
            if typeof(p3034) == "Instance" then
                if p3034:IsA(v_u_3032) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3033, p3034, (("expected %*, got %*"):format(v_u_3032, p3034.ClassName)))
                end
            else
                return v_u_3.err(v_u_3033, p3034, (("expected %*, got %*"):format(v_u_3032, (typeof(p3034)))))
            end
        end,
        ["_format"] = function(p3035, _, _)
            return v_u_2(v_u_3032, p3035[v_u_3033])
        end
    }
    local v3036 = v_u_4
    local v3037 = v_u_3033
    return setmetatable(v3037, v3036)
end
local v_u_3038 = "ReflectionMetadataProperties"
function v5.ReflectionMetadataProperties()
    local v_u_3039 = nil
    v_u_3039 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3040)
            if typeof(p3040) == "Instance" then
                if p3040:IsA(v_u_3038) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3039, p3040, (("expected %*, got %*"):format(v_u_3038, p3040.ClassName)))
                end
            else
                return v_u_3.err(v_u_3039, p3040, (("expected %*, got %*"):format(v_u_3038, (typeof(p3040)))))
            end
        end,
        ["_format"] = function(p3041, _, _)
            return v_u_2(v_u_3038, p3041[v_u_3039])
        end
    }
    local v3042 = v_u_4
    local v3043 = v_u_3039
    return setmetatable(v3043, v3042)
end
local v_u_3044 = "ReflectionMetadataYieldFunctions"
function v5.ReflectionMetadataYieldFunctions()
    local v_u_3045 = nil
    v_u_3045 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3046)
            if typeof(p3046) == "Instance" then
                if p3046:IsA(v_u_3044) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3045, p3046, (("expected %*, got %*"):format(v_u_3044, p3046.ClassName)))
                end
            else
                return v_u_3.err(v_u_3045, p3046, (("expected %*, got %*"):format(v_u_3044, (typeof(p3046)))))
            end
        end,
        ["_format"] = function(p3047, _, _)
            return v_u_2(v_u_3044, p3047[v_u_3045])
        end
    }
    local v3048 = v_u_4
    local v3049 = v_u_3045
    return setmetatable(v3049, v3048)
end
local v_u_3050 = "ReflectionService"
function v5.ReflectionService()
    local v_u_3051 = nil
    v_u_3051 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3052)
            if typeof(p3052) == "Instance" then
                if p3052:IsA(v_u_3050) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3051, p3052, (("expected %*, got %*"):format(v_u_3050, p3052.ClassName)))
                end
            else
                return v_u_3.err(v_u_3051, p3052, (("expected %*, got %*"):format(v_u_3050, (typeof(p3052)))))
            end
        end,
        ["_format"] = function(p3053, _, _)
            return v_u_2(v_u_3050, p3053[v_u_3051])
        end
    }
    local v3054 = v_u_4
    local v3055 = v_u_3051
    return setmetatable(v3055, v3054)
end
local v_u_3056 = "RemoteCursorService"
function v5.RemoteCursorService()
    local v_u_3057 = nil
    v_u_3057 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3058)
            if typeof(p3058) == "Instance" then
                if p3058:IsA(v_u_3056) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3057, p3058, (("expected %*, got %*"):format(v_u_3056, p3058.ClassName)))
                end
            else
                return v_u_3.err(v_u_3057, p3058, (("expected %*, got %*"):format(v_u_3056, (typeof(p3058)))))
            end
        end,
        ["_format"] = function(p3059, _, _)
            return v_u_2(v_u_3056, p3059[v_u_3057])
        end
    }
    local v3060 = v_u_4
    local v3061 = v_u_3057
    return setmetatable(v3061, v3060)
end
local v_u_3062 = "RemoteDebuggerServer"
function v5.RemoteDebuggerServer()
    local v_u_3063 = nil
    v_u_3063 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3064)
            if typeof(p3064) == "Instance" then
                if p3064:IsA(v_u_3062) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3063, p3064, (("expected %*, got %*"):format(v_u_3062, p3064.ClassName)))
                end
            else
                return v_u_3.err(v_u_3063, p3064, (("expected %*, got %*"):format(v_u_3062, (typeof(p3064)))))
            end
        end,
        ["_format"] = function(p3065, _, _)
            return v_u_2(v_u_3062, p3065[v_u_3063])
        end
    }
    local v3066 = v_u_4
    local v3067 = v_u_3063
    return setmetatable(v3067, v3066)
end
local v_u_3068 = "RemoteFunction"
function v5.RemoteFunction()
    local v_u_3069 = nil
    v_u_3069 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3070)
            if typeof(p3070) == "Instance" then
                if p3070:IsA(v_u_3068) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3069, p3070, (("expected %*, got %*"):format(v_u_3068, p3070.ClassName)))
                end
            else
                return v_u_3.err(v_u_3069, p3070, (("expected %*, got %*"):format(v_u_3068, (typeof(p3070)))))
            end
        end,
        ["_format"] = function(p3071, _, _)
            return v_u_2(v_u_3068, p3071[v_u_3069])
        end
    }
    local v3072 = v_u_4
    local v3073 = v_u_3069
    return setmetatable(v3073, v3072)
end
local v_u_3074 = "RenderSettings"
function v5.RenderSettings()
    local v_u_3075 = nil
    v_u_3075 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3076)
            if typeof(p3076) == "Instance" then
                if p3076:IsA(v_u_3074) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3075, p3076, (("expected %*, got %*"):format(v_u_3074, p3076.ClassName)))
                end
            else
                return v_u_3.err(v_u_3075, p3076, (("expected %*, got %*"):format(v_u_3074, (typeof(p3076)))))
            end
        end,
        ["_format"] = function(p3077, _, _)
            return v_u_2(v_u_3074, p3077[v_u_3075])
        end
    }
    local v3078 = v_u_4
    local v3079 = v_u_3075
    return setmetatable(v3079, v3078)
end
local v_u_3080 = "RenderingTest"
function v5.RenderingTest()
    local v_u_3081 = nil
    v_u_3081 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3082)
            if typeof(p3082) == "Instance" then
                if p3082:IsA(v_u_3080) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3081, p3082, (("expected %*, got %*"):format(v_u_3080, p3082.ClassName)))
                end
            else
                return v_u_3.err(v_u_3081, p3082, (("expected %*, got %*"):format(v_u_3080, (typeof(p3082)))))
            end
        end,
        ["_format"] = function(p3083, _, _)
            return v_u_2(v_u_3080, p3083[v_u_3081])
        end
    }
    local v3084 = v_u_4
    local v3085 = v_u_3081
    return setmetatable(v3085, v3084)
end
local v_u_3086 = "ReplicatedFirst"
function v5.ReplicatedFirst()
    local v_u_3087 = nil
    v_u_3087 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3088)
            if typeof(p3088) == "Instance" then
                if p3088:IsA(v_u_3086) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3087, p3088, (("expected %*, got %*"):format(v_u_3086, p3088.ClassName)))
                end
            else
                return v_u_3.err(v_u_3087, p3088, (("expected %*, got %*"):format(v_u_3086, (typeof(p3088)))))
            end
        end,
        ["_format"] = function(p3089, _, _)
            return v_u_2(v_u_3086, p3089[v_u_3087])
        end
    }
    local v3090 = v_u_4
    local v3091 = v_u_3087
    return setmetatable(v3091, v3090)
end
local v_u_3092 = "ReplicatedStorage"
function v5.ReplicatedStorage()
    local v_u_3093 = nil
    v_u_3093 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3094)
            if typeof(p3094) == "Instance" then
                if p3094:IsA(v_u_3092) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3093, p3094, (("expected %*, got %*"):format(v_u_3092, p3094.ClassName)))
                end
            else
                return v_u_3.err(v_u_3093, p3094, (("expected %*, got %*"):format(v_u_3092, (typeof(p3094)))))
            end
        end,
        ["_format"] = function(p3095, _, _)
            return v_u_2(v_u_3092, p3095[v_u_3093])
        end
    }
    local v3096 = v_u_4
    local v3097 = v_u_3093
    return setmetatable(v3097, v3096)
end
local v_u_3098 = "RibbonNotificationService"
function v5.RibbonNotificationService()
    local v_u_3099 = nil
    v_u_3099 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3100)
            if typeof(p3100) == "Instance" then
                if p3100:IsA(v_u_3098) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3099, p3100, (("expected %*, got %*"):format(v_u_3098, p3100.ClassName)))
                end
            else
                return v_u_3.err(v_u_3099, p3100, (("expected %*, got %*"):format(v_u_3098, (typeof(p3100)))))
            end
        end,
        ["_format"] = function(p3101, _, _)
            return v_u_2(v_u_3098, p3101[v_u_3099])
        end
    }
    local v3102 = v_u_4
    local v3103 = v_u_3099
    return setmetatable(v3103, v3102)
end
local v_u_3104 = "RobloxPluginGuiService"
function v5.RobloxPluginGuiService()
    local v_u_3105 = nil
    v_u_3105 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3106)
            if typeof(p3106) == "Instance" then
                if p3106:IsA(v_u_3104) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3105, p3106, (("expected %*, got %*"):format(v_u_3104, p3106.ClassName)))
                end
            else
                return v_u_3.err(v_u_3105, p3106, (("expected %*, got %*"):format(v_u_3104, (typeof(p3106)))))
            end
        end,
        ["_format"] = function(p3107, _, _)
            return v_u_2(v_u_3104, p3107[v_u_3105])
        end
    }
    local v3108 = v_u_4
    local v3109 = v_u_3105
    return setmetatable(v3109, v3108)
end
local v_u_3110 = "RobloxReplicatedStorage"
function v5.RobloxReplicatedStorage()
    local v_u_3111 = nil
    v_u_3111 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3112)
            if typeof(p3112) == "Instance" then
                if p3112:IsA(v_u_3110) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3111, p3112, (("expected %*, got %*"):format(v_u_3110, p3112.ClassName)))
                end
            else
                return v_u_3.err(v_u_3111, p3112, (("expected %*, got %*"):format(v_u_3110, (typeof(p3112)))))
            end
        end,
        ["_format"] = function(p3113, _, _)
            return v_u_2(v_u_3110, p3113[v_u_3111])
        end
    }
    local v3114 = v_u_4
    local v3115 = v_u_3111
    return setmetatable(v3115, v3114)
end
local v_u_3116 = "RobloxServerStorage"
function v5.RobloxServerStorage()
    local v_u_3117 = nil
    v_u_3117 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3118)
            if typeof(p3118) == "Instance" then
                if p3118:IsA(v_u_3116) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3117, p3118, (("expected %*, got %*"):format(v_u_3116, p3118.ClassName)))
                end
            else
                return v_u_3.err(v_u_3117, p3118, (("expected %*, got %*"):format(v_u_3116, (typeof(p3118)))))
            end
        end,
        ["_format"] = function(p3119, _, _)
            return v_u_2(v_u_3116, p3119[v_u_3117])
        end
    }
    local v3120 = v_u_4
    local v3121 = v_u_3117
    return setmetatable(v3121, v3120)
end
local v_u_3122 = "RomarkService"
function v5.RomarkService()
    local v_u_3123 = nil
    v_u_3123 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3124)
            if typeof(p3124) == "Instance" then
                if p3124:IsA(v_u_3122) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3123, p3124, (("expected %*, got %*"):format(v_u_3122, p3124.ClassName)))
                end
            else
                return v_u_3.err(v_u_3123, p3124, (("expected %*, got %*"):format(v_u_3122, (typeof(p3124)))))
            end
        end,
        ["_format"] = function(p3125, _, _)
            return v_u_2(v_u_3122, p3125[v_u_3123])
        end
    }
    local v3126 = v_u_4
    local v3127 = v_u_3123
    return setmetatable(v3127, v3126)
end
local v_u_3128 = "RotationCurve"
function v5.RotationCurve()
    local v_u_3129 = nil
    v_u_3129 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3130)
            if typeof(p3130) == "Instance" then
                if p3130:IsA(v_u_3128) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3129, p3130, (("expected %*, got %*"):format(v_u_3128, p3130.ClassName)))
                end
            else
                return v_u_3.err(v_u_3129, p3130, (("expected %*, got %*"):format(v_u_3128, (typeof(p3130)))))
            end
        end,
        ["_format"] = function(p3131, _, _)
            return v_u_2(v_u_3128, p3131[v_u_3129])
        end
    }
    local v3132 = v_u_4
    local v3133 = v_u_3129
    return setmetatable(v3133, v3132)
end
local v_u_3134 = "RtMessagingService"
function v5.RtMessagingService()
    local v_u_3135 = nil
    v_u_3135 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3136)
            if typeof(p3136) == "Instance" then
                if p3136:IsA(v_u_3134) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3135, p3136, (("expected %*, got %*"):format(v_u_3134, p3136.ClassName)))
                end
            else
                return v_u_3.err(v_u_3135, p3136, (("expected %*, got %*"):format(v_u_3134, (typeof(p3136)))))
            end
        end,
        ["_format"] = function(p3137, _, _)
            return v_u_2(v_u_3134, p3137[v_u_3135])
        end
    }
    local v3138 = v_u_4
    local v3139 = v_u_3135
    return setmetatable(v3139, v3138)
end
local v_u_3140 = "RunService"
function v5.RunService()
    local v_u_3141 = nil
    v_u_3141 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3142)
            if typeof(p3142) == "Instance" then
                if p3142:IsA(v_u_3140) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3141, p3142, (("expected %*, got %*"):format(v_u_3140, p3142.ClassName)))
                end
            else
                return v_u_3.err(v_u_3141, p3142, (("expected %*, got %*"):format(v_u_3140, (typeof(p3142)))))
            end
        end,
        ["_format"] = function(p3143, _, _)
            return v_u_2(v_u_3140, p3143[v_u_3141])
        end
    }
    local v3144 = v_u_4
    local v3145 = v_u_3141
    return setmetatable(v3145, v3144)
end
local v_u_3146 = "RuntimeScriptService"
function v5.RuntimeScriptService()
    local v_u_3147 = nil
    v_u_3147 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3148)
            if typeof(p3148) == "Instance" then
                if p3148:IsA(v_u_3146) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3147, p3148, (("expected %*, got %*"):format(v_u_3146, p3148.ClassName)))
                end
            else
                return v_u_3.err(v_u_3147, p3148, (("expected %*, got %*"):format(v_u_3146, (typeof(p3148)))))
            end
        end,
        ["_format"] = function(p3149, _, _)
            return v_u_2(v_u_3146, p3149[v_u_3147])
        end
    }
    local v3150 = v_u_4
    local v3151 = v_u_3147
    return setmetatable(v3151, v3150)
end
local v_u_3152 = "SafetyService"
function v5.SafetyService()
    local v_u_3153 = nil
    v_u_3153 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3154)
            if typeof(p3154) == "Instance" then
                if p3154:IsA(v_u_3152) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3153, p3154, (("expected %*, got %*"):format(v_u_3152, p3154.ClassName)))
                end
            else
                return v_u_3.err(v_u_3153, p3154, (("expected %*, got %*"):format(v_u_3152, (typeof(p3154)))))
            end
        end,
        ["_format"] = function(p3155, _, _)
            return v_u_2(v_u_3152, p3155[v_u_3153])
        end
    }
    local v3156 = v_u_4
    local v3157 = v_u_3153
    return setmetatable(v3157, v3156)
end
local v_u_3158 = "ScreenshotHud"
function v5.ScreenshotHud()
    local v_u_3159 = nil
    v_u_3159 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3160)
            if typeof(p3160) == "Instance" then
                if p3160:IsA(v_u_3158) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3159, p3160, (("expected %*, got %*"):format(v_u_3158, p3160.ClassName)))
                end
            else
                return v_u_3.err(v_u_3159, p3160, (("expected %*, got %*"):format(v_u_3158, (typeof(p3160)))))
            end
        end,
        ["_format"] = function(p3161, _, _)
            return v_u_2(v_u_3158, p3161[v_u_3159])
        end
    }
    local v3162 = v_u_4
    local v3163 = v_u_3159
    return setmetatable(v3163, v3162)
end
local v_u_3164 = "ScriptBuilder"
function v5.ScriptBuilder()
    local v_u_3165 = nil
    v_u_3165 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3166)
            if typeof(p3166) == "Instance" then
                if p3166:IsA(v_u_3164) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3165, p3166, (("expected %*, got %*"):format(v_u_3164, p3166.ClassName)))
                end
            else
                return v_u_3.err(v_u_3165, p3166, (("expected %*, got %*"):format(v_u_3164, (typeof(p3166)))))
            end
        end,
        ["_format"] = function(p3167, _, _)
            return v_u_2(v_u_3164, p3167[v_u_3165])
        end
    }
    local v3168 = v_u_4
    local v3169 = v_u_3165
    return setmetatable(v3169, v3168)
end
local v_u_3170 = "SyncScriptBuilder"
function v5.SyncScriptBuilder()
    local v_u_3171 = nil
    v_u_3171 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3172)
            if typeof(p3172) == "Instance" then
                if p3172:IsA(v_u_3170) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3171, p3172, (("expected %*, got %*"):format(v_u_3170, p3172.ClassName)))
                end
            else
                return v_u_3.err(v_u_3171, p3172, (("expected %*, got %*"):format(v_u_3170, (typeof(p3172)))))
            end
        end,
        ["_format"] = function(p3173, _, _)
            return v_u_2(v_u_3170, p3173[v_u_3171])
        end
    }
    local v3174 = v_u_4
    local v3175 = v_u_3171
    return setmetatable(v3175, v3174)
end
local v_u_3176 = "ScriptChangeService"
function v5.ScriptChangeService()
    local v_u_3177 = nil
    v_u_3177 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3178)
            if typeof(p3178) == "Instance" then
                if p3178:IsA(v_u_3176) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3177, p3178, (("expected %*, got %*"):format(v_u_3176, p3178.ClassName)))
                end
            else
                return v_u_3.err(v_u_3177, p3178, (("expected %*, got %*"):format(v_u_3176, (typeof(p3178)))))
            end
        end,
        ["_format"] = function(p3179, _, _)
            return v_u_2(v_u_3176, p3179[v_u_3177])
        end
    }
    local v3180 = v_u_4
    local v3181 = v_u_3177
    return setmetatable(v3181, v3180)
end
local v_u_3182 = "ScriptCloneWatcher"
function v5.ScriptCloneWatcher()
    local v_u_3183 = nil
    v_u_3183 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3184)
            if typeof(p3184) == "Instance" then
                if p3184:IsA(v_u_3182) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3183, p3184, (("expected %*, got %*"):format(v_u_3182, p3184.ClassName)))
                end
            else
                return v_u_3.err(v_u_3183, p3184, (("expected %*, got %*"):format(v_u_3182, (typeof(p3184)))))
            end
        end,
        ["_format"] = function(p3185, _, _)
            return v_u_2(v_u_3182, p3185[v_u_3183])
        end
    }
    local v3186 = v_u_4
    local v3187 = v_u_3183
    return setmetatable(v3187, v3186)
end
local v_u_3188 = "ScriptCloneWatcherHelper"
function v5.ScriptCloneWatcherHelper()
    local v_u_3189 = nil
    v_u_3189 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3190)
            if typeof(p3190) == "Instance" then
                if p3190:IsA(v_u_3188) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3189, p3190, (("expected %*, got %*"):format(v_u_3188, p3190.ClassName)))
                end
            else
                return v_u_3.err(v_u_3189, p3190, (("expected %*, got %*"):format(v_u_3188, (typeof(p3190)))))
            end
        end,
        ["_format"] = function(p3191, _, _)
            return v_u_2(v_u_3188, p3191[v_u_3189])
        end
    }
    local v3192 = v_u_4
    local v3193 = v_u_3189
    return setmetatable(v3193, v3192)
end
local v_u_3194 = "ScriptCommitService"
function v5.ScriptCommitService()
    local v_u_3195 = nil
    v_u_3195 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3196)
            if typeof(p3196) == "Instance" then
                if p3196:IsA(v_u_3194) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3195, p3196, (("expected %*, got %*"):format(v_u_3194, p3196.ClassName)))
                end
            else
                return v_u_3.err(v_u_3195, p3196, (("expected %*, got %*"):format(v_u_3194, (typeof(p3196)))))
            end
        end,
        ["_format"] = function(p3197, _, _)
            return v_u_2(v_u_3194, p3197[v_u_3195])
        end
    }
    local v3198 = v_u_4
    local v3199 = v_u_3195
    return setmetatable(v3199, v3198)
end
local v_u_3200 = "ScriptContext"
function v5.ScriptContext()
    local v_u_3201 = nil
    v_u_3201 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3202)
            if typeof(p3202) == "Instance" then
                if p3202:IsA(v_u_3200) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3201, p3202, (("expected %*, got %*"):format(v_u_3200, p3202.ClassName)))
                end
            else
                return v_u_3.err(v_u_3201, p3202, (("expected %*, got %*"):format(v_u_3200, (typeof(p3202)))))
            end
        end,
        ["_format"] = function(p3203, _, _)
            return v_u_2(v_u_3200, p3203[v_u_3201])
        end
    }
    local v3204 = v_u_4
    local v3205 = v_u_3201
    return setmetatable(v3205, v3204)
end
local v_u_3206 = "ScriptDebugger"
function v5.ScriptDebugger()
    local v_u_3207 = nil
    v_u_3207 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3208)
            if typeof(p3208) == "Instance" then
                if p3208:IsA(v_u_3206) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3207, p3208, (("expected %*, got %*"):format(v_u_3206, p3208.ClassName)))
                end
            else
                return v_u_3.err(v_u_3207, p3208, (("expected %*, got %*"):format(v_u_3206, (typeof(p3208)))))
            end
        end,
        ["_format"] = function(p3209, _, _)
            return v_u_2(v_u_3206, p3209[v_u_3207])
        end
    }
    local v3210 = v_u_4
    local v3211 = v_u_3207
    return setmetatable(v3211, v3210)
end
local v_u_3212 = "ScriptDocument"
function v5.ScriptDocument()
    local v_u_3213 = nil
    v_u_3213 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3214)
            if typeof(p3214) == "Instance" then
                if p3214:IsA(v_u_3212) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3213, p3214, (("expected %*, got %*"):format(v_u_3212, p3214.ClassName)))
                end
            else
                return v_u_3.err(v_u_3213, p3214, (("expected %*, got %*"):format(v_u_3212, (typeof(p3214)))))
            end
        end,
        ["_format"] = function(p3215, _, _)
            return v_u_2(v_u_3212, p3215[v_u_3213])
        end
    }
    local v3216 = v_u_4
    local v3217 = v_u_3213
    return setmetatable(v3217, v3216)
end
local v_u_3218 = "ScriptEditorService"
function v5.ScriptEditorService()
    local v_u_3219 = nil
    v_u_3219 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3220)
            if typeof(p3220) == "Instance" then
                if p3220:IsA(v_u_3218) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3219, p3220, (("expected %*, got %*"):format(v_u_3218, p3220.ClassName)))
                end
            else
                return v_u_3.err(v_u_3219, p3220, (("expected %*, got %*"):format(v_u_3218, (typeof(p3220)))))
            end
        end,
        ["_format"] = function(p3221, _, _)
            return v_u_2(v_u_3218, p3221[v_u_3219])
        end
    }
    local v3222 = v_u_4
    local v3223 = v_u_3219
    return setmetatable(v3223, v3222)
end
local v_u_3224 = "ScriptRegistrationService"
function v5.ScriptRegistrationService()
    local v_u_3225 = nil
    v_u_3225 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3226)
            if typeof(p3226) == "Instance" then
                if p3226:IsA(v_u_3224) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3225, p3226, (("expected %*, got %*"):format(v_u_3224, p3226.ClassName)))
                end
            else
                return v_u_3.err(v_u_3225, p3226, (("expected %*, got %*"):format(v_u_3224, (typeof(p3226)))))
            end
        end,
        ["_format"] = function(p3227, _, _)
            return v_u_2(v_u_3224, p3227[v_u_3225])
        end
    }
    local v3228 = v_u_4
    local v3229 = v_u_3225
    return setmetatable(v3229, v3228)
end
local v_u_3230 = "ScriptRuntime"
function v5.ScriptRuntime()
    local v_u_3231 = nil
    v_u_3231 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3232)
            if typeof(p3232) == "Instance" then
                if p3232:IsA(v_u_3230) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3231, p3232, (("expected %*, got %*"):format(v_u_3230, p3232.ClassName)))
                end
            else
                return v_u_3.err(v_u_3231, p3232, (("expected %*, got %*"):format(v_u_3230, (typeof(p3232)))))
            end
        end,
        ["_format"] = function(p3233, _, _)
            return v_u_2(v_u_3230, p3233[v_u_3231])
        end
    }
    local v3234 = v_u_4
    local v3235 = v_u_3231
    return setmetatable(v3235, v3234)
end
local v_u_3236 = "ScriptService"
function v5.ScriptService()
    local v_u_3237 = nil
    v_u_3237 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3238)
            if typeof(p3238) == "Instance" then
                if p3238:IsA(v_u_3236) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3237, p3238, (("expected %*, got %*"):format(v_u_3236, p3238.ClassName)))
                end
            else
                return v_u_3.err(v_u_3237, p3238, (("expected %*, got %*"):format(v_u_3236, (typeof(p3238)))))
            end
        end,
        ["_format"] = function(p3239, _, _)
            return v_u_2(v_u_3236, p3239[v_u_3237])
        end
    }
    local v3240 = v_u_4
    local v3241 = v_u_3237
    return setmetatable(v3241, v3240)
end
local v_u_3242 = "Selection"
function v5.Selection()
    local v_u_3243 = nil
    v_u_3243 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3244)
            if typeof(p3244) == "Instance" then
                if p3244:IsA(v_u_3242) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3243, p3244, (("expected %*, got %*"):format(v_u_3242, p3244.ClassName)))
                end
            else
                return v_u_3.err(v_u_3243, p3244, (("expected %*, got %*"):format(v_u_3242, (typeof(p3244)))))
            end
        end,
        ["_format"] = function(p3245, _, _)
            return v_u_2(v_u_3242, p3245[v_u_3243])
        end
    }
    local v3246 = v_u_4
    local v3247 = v_u_3243
    return setmetatable(v3247, v3246)
end
local v_u_3248 = "SelectionHighlightManager"
function v5.SelectionHighlightManager()
    local v_u_3249 = nil
    v_u_3249 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3250)
            if typeof(p3250) == "Instance" then
                if p3250:IsA(v_u_3248) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3249, p3250, (("expected %*, got %*"):format(v_u_3248, p3250.ClassName)))
                end
            else
                return v_u_3.err(v_u_3249, p3250, (("expected %*, got %*"):format(v_u_3248, (typeof(p3250)))))
            end
        end,
        ["_format"] = function(p3251, _, _)
            return v_u_2(v_u_3248, p3251[v_u_3249])
        end
    }
    local v3252 = v_u_4
    local v3253 = v_u_3249
    return setmetatable(v3253, v3252)
end
local v_u_3254 = "SensorBase"
function v5.SensorBase()
    local v_u_3255 = nil
    v_u_3255 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3256)
            if typeof(p3256) == "Instance" then
                if p3256:IsA(v_u_3254) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3255, p3256, (("expected %*, got %*"):format(v_u_3254, p3256.ClassName)))
                end
            else
                return v_u_3.err(v_u_3255, p3256, (("expected %*, got %*"):format(v_u_3254, (typeof(p3256)))))
            end
        end,
        ["_format"] = function(p3257, _, _)
            return v_u_2(v_u_3254, p3257[v_u_3255])
        end
    }
    local v3258 = v_u_4
    local v3259 = v_u_3255
    return setmetatable(v3259, v3258)
end
local v_u_3260 = "BuoyancySensor"
function v5.BuoyancySensor()
    local v_u_3261 = nil
    v_u_3261 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3262)
            if typeof(p3262) == "Instance" then
                if p3262:IsA(v_u_3260) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3261, p3262, (("expected %*, got %*"):format(v_u_3260, p3262.ClassName)))
                end
            else
                return v_u_3.err(v_u_3261, p3262, (("expected %*, got %*"):format(v_u_3260, (typeof(p3262)))))
            end
        end,
        ["_format"] = function(p3263, _, _)
            return v_u_2(v_u_3260, p3263[v_u_3261])
        end
    }
    local v3264 = v_u_4
    local v3265 = v_u_3261
    return setmetatable(v3265, v3264)
end
local v_u_3266 = "ControllerSensor"
function v5.ControllerSensor()
    local v_u_3267 = nil
    v_u_3267 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3268)
            if typeof(p3268) == "Instance" then
                if p3268:IsA(v_u_3266) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3267, p3268, (("expected %*, got %*"):format(v_u_3266, p3268.ClassName)))
                end
            else
                return v_u_3.err(v_u_3267, p3268, (("expected %*, got %*"):format(v_u_3266, (typeof(p3268)))))
            end
        end,
        ["_format"] = function(p3269, _, _)
            return v_u_2(v_u_3266, p3269[v_u_3267])
        end
    }
    local v3270 = v_u_4
    local v3271 = v_u_3267
    return setmetatable(v3271, v3270)
end
local v_u_3272 = "ControllerPartSensor"
function v5.ControllerPartSensor()
    local v_u_3273 = nil
    v_u_3273 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3274)
            if typeof(p3274) == "Instance" then
                if p3274:IsA(v_u_3272) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3273, p3274, (("expected %*, got %*"):format(v_u_3272, p3274.ClassName)))
                end
            else
                return v_u_3.err(v_u_3273, p3274, (("expected %*, got %*"):format(v_u_3272, (typeof(p3274)))))
            end
        end,
        ["_format"] = function(p3275, _, _)
            return v_u_2(v_u_3272, p3275[v_u_3273])
        end
    }
    local v3276 = v_u_4
    local v3277 = v_u_3273
    return setmetatable(v3277, v3276)
end
local v_u_3278 = "ServerScriptService"
function v5.ServerScriptService()
    local v_u_3279 = nil
    v_u_3279 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3280)
            if typeof(p3280) == "Instance" then
                if p3280:IsA(v_u_3278) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3279, p3280, (("expected %*, got %*"):format(v_u_3278, p3280.ClassName)))
                end
            else
                return v_u_3.err(v_u_3279, p3280, (("expected %*, got %*"):format(v_u_3278, (typeof(p3280)))))
            end
        end,
        ["_format"] = function(p3281, _, _)
            return v_u_2(v_u_3278, p3281[v_u_3279])
        end
    }
    local v3282 = v_u_4
    local v3283 = v_u_3279
    return setmetatable(v3283, v3282)
end
local v_u_3284 = "ServerStorage"
function v5.ServerStorage()
    local v_u_3285 = nil
    v_u_3285 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3286)
            if typeof(p3286) == "Instance" then
                if p3286:IsA(v_u_3284) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3285, p3286, (("expected %*, got %*"):format(v_u_3284, p3286.ClassName)))
                end
            else
                return v_u_3.err(v_u_3285, p3286, (("expected %*, got %*"):format(v_u_3284, (typeof(p3286)))))
            end
        end,
        ["_format"] = function(p3287, _, _)
            return v_u_2(v_u_3284, p3287[v_u_3285])
        end
    }
    local v3288 = v_u_4
    local v3289 = v_u_3285
    return setmetatable(v3289, v3288)
end
local v_u_3290 = "ServiceProvider"
function v5.ServiceProvider()
    local v_u_3291 = nil
    v_u_3291 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3292)
            if typeof(p3292) == "Instance" then
                if p3292:IsA(v_u_3290) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3291, p3292, (("expected %*, got %*"):format(v_u_3290, p3292.ClassName)))
                end
            else
                return v_u_3.err(v_u_3291, p3292, (("expected %*, got %*"):format(v_u_3290, (typeof(p3292)))))
            end
        end,
        ["_format"] = function(p3293, _, _)
            return v_u_2(v_u_3290, p3293[v_u_3291])
        end
    }
    local v3294 = v_u_4
    local v3295 = v_u_3291
    return setmetatable(v3295, v3294)
end
local v_u_3296 = "DataModel"
function v5.DataModel()
    local v_u_3297 = nil
    v_u_3297 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3298)
            if typeof(p3298) == "Instance" then
                if p3298:IsA(v_u_3296) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3297, p3298, (("expected %*, got %*"):format(v_u_3296, p3298.ClassName)))
                end
            else
                return v_u_3.err(v_u_3297, p3298, (("expected %*, got %*"):format(v_u_3296, (typeof(p3298)))))
            end
        end,
        ["_format"] = function(p3299, _, _)
            return v_u_2(v_u_3296, p3299[v_u_3297])
        end
    }
    local v3300 = v_u_4
    local v3301 = v_u_3297
    return setmetatable(v3301, v3300)
end
local v_u_3302 = "GenericSettings"
function v5.GenericSettings()
    local v_u_3303 = nil
    v_u_3303 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3304)
            if typeof(p3304) == "Instance" then
                if p3304:IsA(v_u_3302) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3303, p3304, (("expected %*, got %*"):format(v_u_3302, p3304.ClassName)))
                end
            else
                return v_u_3.err(v_u_3303, p3304, (("expected %*, got %*"):format(v_u_3302, (typeof(p3304)))))
            end
        end,
        ["_format"] = function(p3305, _, _)
            return v_u_2(v_u_3302, p3305[v_u_3303])
        end
    }
    local v3306 = v_u_4
    local v3307 = v_u_3303
    return setmetatable(v3307, v3306)
end
local v_u_3308 = "AnalysticsSettings"
function v5.AnalysticsSettings()
    local v_u_3309 = nil
    v_u_3309 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3310)
            if typeof(p3310) == "Instance" then
                if p3310:IsA(v_u_3308) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3309, p3310, (("expected %*, got %*"):format(v_u_3308, p3310.ClassName)))
                end
            else
                return v_u_3.err(v_u_3309, p3310, (("expected %*, got %*"):format(v_u_3308, (typeof(p3310)))))
            end
        end,
        ["_format"] = function(p3311, _, _)
            return v_u_2(v_u_3308, p3311[v_u_3309])
        end
    }
    local v3312 = v_u_4
    local v3313 = v_u_3309
    return setmetatable(v3313, v3312)
end
local v_u_3314 = "GlobalSettings"
function v5.GlobalSettings()
    local v_u_3315 = nil
    v_u_3315 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3316)
            if typeof(p3316) == "Instance" then
                if p3316:IsA(v_u_3314) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3315, p3316, (("expected %*, got %*"):format(v_u_3314, p3316.ClassName)))
                end
            else
                return v_u_3.err(v_u_3315, p3316, (("expected %*, got %*"):format(v_u_3314, (typeof(p3316)))))
            end
        end,
        ["_format"] = function(p3317, _, _)
            return v_u_2(v_u_3314, p3317[v_u_3315])
        end
    }
    local v3318 = v_u_4
    local v3319 = v_u_3315
    return setmetatable(v3319, v3318)
end
local v_u_3320 = "UserSettings"
function v5.UserSettings()
    local v_u_3321 = nil
    v_u_3321 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3322)
            if typeof(p3322) == "Instance" then
                if p3322:IsA(v_u_3320) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3321, p3322, (("expected %*, got %*"):format(v_u_3320, p3322.ClassName)))
                end
            else
                return v_u_3.err(v_u_3321, p3322, (("expected %*, got %*"):format(v_u_3320, (typeof(p3322)))))
            end
        end,
        ["_format"] = function(p3323, _, _)
            return v_u_2(v_u_3320, p3323[v_u_3321])
        end
    }
    local v3324 = v_u_4
    local v3325 = v_u_3321
    return setmetatable(v3325, v3324)
end
local v_u_3326 = "ServiceVisibilityService"
function v5.ServiceVisibilityService()
    local v_u_3327 = nil
    v_u_3327 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3328)
            if typeof(p3328) == "Instance" then
                if p3328:IsA(v_u_3326) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3327, p3328, (("expected %*, got %*"):format(v_u_3326, p3328.ClassName)))
                end
            else
                return v_u_3.err(v_u_3327, p3328, (("expected %*, got %*"):format(v_u_3326, (typeof(p3328)))))
            end
        end,
        ["_format"] = function(p3329, _, _)
            return v_u_2(v_u_3326, p3329[v_u_3327])
        end
    }
    local v3330 = v_u_4
    local v3331 = v_u_3327
    return setmetatable(v3331, v3330)
end
local v_u_3332 = "SessionService"
function v5.SessionService()
    local v_u_3333 = nil
    v_u_3333 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3334)
            if typeof(p3334) == "Instance" then
                if p3334:IsA(v_u_3332) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3333, p3334, (("expected %*, got %*"):format(v_u_3332, p3334.ClassName)))
                end
            else
                return v_u_3.err(v_u_3333, p3334, (("expected %*, got %*"):format(v_u_3332, (typeof(p3334)))))
            end
        end,
        ["_format"] = function(p3335, _, _)
            return v_u_2(v_u_3332, p3335[v_u_3333])
        end
    }
    local v3336 = v_u_4
    local v3337 = v_u_3333
    return setmetatable(v3337, v3336)
end
local v_u_3338 = "SharedTableRegistry"
function v5.SharedTableRegistry()
    local v_u_3339 = nil
    v_u_3339 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3340)
            if typeof(p3340) == "Instance" then
                if p3340:IsA(v_u_3338) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3339, p3340, (("expected %*, got %*"):format(v_u_3338, p3340.ClassName)))
                end
            else
                return v_u_3.err(v_u_3339, p3340, (("expected %*, got %*"):format(v_u_3338, (typeof(p3340)))))
            end
        end,
        ["_format"] = function(p3341, _, _)
            return v_u_2(v_u_3338, p3341[v_u_3339])
        end
    }
    local v3342 = v_u_4
    local v3343 = v_u_3339
    return setmetatable(v3343, v3342)
end
local v_u_3344 = "ShorelineUpgraderService"
function v5.ShorelineUpgraderService()
    local v_u_3345 = nil
    v_u_3345 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3346)
            if typeof(p3346) == "Instance" then
                if p3346:IsA(v_u_3344) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3345, p3346, (("expected %*, got %*"):format(v_u_3344, p3346.ClassName)))
                end
            else
                return v_u_3.err(v_u_3345, p3346, (("expected %*, got %*"):format(v_u_3344, (typeof(p3346)))))
            end
        end,
        ["_format"] = function(p3347, _, _)
            return v_u_2(v_u_3344, p3347[v_u_3345])
        end
    }
    local v3348 = v_u_4
    local v3349 = v_u_3345
    return setmetatable(v3349, v3348)
end
local v_u_3350 = "Sky"
function v5.Sky()
    local v_u_3351 = nil
    v_u_3351 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3352)
            if typeof(p3352) == "Instance" then
                if p3352:IsA(v_u_3350) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3351, p3352, (("expected %*, got %*"):format(v_u_3350, p3352.ClassName)))
                end
            else
                return v_u_3.err(v_u_3351, p3352, (("expected %*, got %*"):format(v_u_3350, (typeof(p3352)))))
            end
        end,
        ["_format"] = function(p3353, _, _)
            return v_u_2(v_u_3350, p3353[v_u_3351])
        end
    }
    local v3354 = v_u_4
    local v3355 = v_u_3351
    return setmetatable(v3355, v3354)
end
local v_u_3356 = "Smoke"
function v5.Smoke()
    local v_u_3357 = nil
    v_u_3357 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3358)
            if typeof(p3358) == "Instance" then
                if p3358:IsA(v_u_3356) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3357, p3358, (("expected %*, got %*"):format(v_u_3356, p3358.ClassName)))
                end
            else
                return v_u_3.err(v_u_3357, p3358, (("expected %*, got %*"):format(v_u_3356, (typeof(p3358)))))
            end
        end,
        ["_format"] = function(p3359, _, _)
            return v_u_2(v_u_3356, p3359[v_u_3357])
        end
    }
    local v3360 = v_u_4
    local v3361 = v_u_3357
    return setmetatable(v3361, v3360)
end
local v_u_3362 = "SmoothVoxelsUpgraderService"
function v5.SmoothVoxelsUpgraderService()
    local v_u_3363 = nil
    v_u_3363 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3364)
            if typeof(p3364) == "Instance" then
                if p3364:IsA(v_u_3362) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3363, p3364, (("expected %*, got %*"):format(v_u_3362, p3364.ClassName)))
                end
            else
                return v_u_3.err(v_u_3363, p3364, (("expected %*, got %*"):format(v_u_3362, (typeof(p3364)))))
            end
        end,
        ["_format"] = function(p3365, _, _)
            return v_u_2(v_u_3362, p3365[v_u_3363])
        end
    }
    local v3366 = v_u_4
    local v3367 = v_u_3363
    return setmetatable(v3367, v3366)
end
local v_u_3368 = "SnippetService"
function v5.SnippetService()
    local v_u_3369 = nil
    v_u_3369 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3370)
            if typeof(p3370) == "Instance" then
                if p3370:IsA(v_u_3368) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3369, p3370, (("expected %*, got %*"):format(v_u_3368, p3370.ClassName)))
                end
            else
                return v_u_3.err(v_u_3369, p3370, (("expected %*, got %*"):format(v_u_3368, (typeof(p3370)))))
            end
        end,
        ["_format"] = function(p3371, _, _)
            return v_u_2(v_u_3368, p3371[v_u_3369])
        end
    }
    local v3372 = v_u_4
    local v3373 = v_u_3369
    return setmetatable(v3373, v3372)
end
local v_u_3374 = "SocialService"
function v5.SocialService()
    local v_u_3375 = nil
    v_u_3375 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3376)
            if typeof(p3376) == "Instance" then
                if p3376:IsA(v_u_3374) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3375, p3376, (("expected %*, got %*"):format(v_u_3374, p3376.ClassName)))
                end
            else
                return v_u_3.err(v_u_3375, p3376, (("expected %*, got %*"):format(v_u_3374, (typeof(p3376)))))
            end
        end,
        ["_format"] = function(p3377, _, _)
            return v_u_2(v_u_3374, p3377[v_u_3375])
        end
    }
    local v3378 = v_u_4
    local v3379 = v_u_3375
    return setmetatable(v3379, v3378)
end
local v_u_3380 = "Sound"
function v5.Sound()
    local v_u_3381 = nil
    v_u_3381 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3382)
            if typeof(p3382) == "Instance" then
                if p3382:IsA(v_u_3380) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3381, p3382, (("expected %*, got %*"):format(v_u_3380, p3382.ClassName)))
                end
            else
                return v_u_3.err(v_u_3381, p3382, (("expected %*, got %*"):format(v_u_3380, (typeof(p3382)))))
            end
        end,
        ["_format"] = function(p3383, _, _)
            return v_u_2(v_u_3380, p3383[v_u_3381])
        end
    }
    local v3384 = v_u_4
    local v3385 = v_u_3381
    return setmetatable(v3385, v3384)
end
local v_u_3386 = "SoundEffect"
function v5.SoundEffect()
    local v_u_3387 = nil
    v_u_3387 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3388)
            if typeof(p3388) == "Instance" then
                if p3388:IsA(v_u_3386) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3387, p3388, (("expected %*, got %*"):format(v_u_3386, p3388.ClassName)))
                end
            else
                return v_u_3.err(v_u_3387, p3388, (("expected %*, got %*"):format(v_u_3386, (typeof(p3388)))))
            end
        end,
        ["_format"] = function(p3389, _, _)
            return v_u_2(v_u_3386, p3389[v_u_3387])
        end
    }
    local v3390 = v_u_4
    local v3391 = v_u_3387
    return setmetatable(v3391, v3390)
end
local v_u_3392 = "ChorusSoundEffect"
function v5.ChorusSoundEffect()
    local v_u_3393 = nil
    v_u_3393 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3394)
            if typeof(p3394) == "Instance" then
                if p3394:IsA(v_u_3392) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3393, p3394, (("expected %*, got %*"):format(v_u_3392, p3394.ClassName)))
                end
            else
                return v_u_3.err(v_u_3393, p3394, (("expected %*, got %*"):format(v_u_3392, (typeof(p3394)))))
            end
        end,
        ["_format"] = function(p3395, _, _)
            return v_u_2(v_u_3392, p3395[v_u_3393])
        end
    }
    local v3396 = v_u_4
    local v3397 = v_u_3393
    return setmetatable(v3397, v3396)
end
local v_u_3398 = "CompressorSoundEffect"
function v5.CompressorSoundEffect()
    local v_u_3399 = nil
    v_u_3399 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3400)
            if typeof(p3400) == "Instance" then
                if p3400:IsA(v_u_3398) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3399, p3400, (("expected %*, got %*"):format(v_u_3398, p3400.ClassName)))
                end
            else
                return v_u_3.err(v_u_3399, p3400, (("expected %*, got %*"):format(v_u_3398, (typeof(p3400)))))
            end
        end,
        ["_format"] = function(p3401, _, _)
            return v_u_2(v_u_3398, p3401[v_u_3399])
        end
    }
    local v3402 = v_u_4
    local v3403 = v_u_3399
    return setmetatable(v3403, v3402)
end
local v_u_3404 = "CustomSoundEffect"
function v5.CustomSoundEffect()
    local v_u_3405 = nil
    v_u_3405 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3406)
            if typeof(p3406) == "Instance" then
                if p3406:IsA(v_u_3404) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3405, p3406, (("expected %*, got %*"):format(v_u_3404, p3406.ClassName)))
                end
            else
                return v_u_3.err(v_u_3405, p3406, (("expected %*, got %*"):format(v_u_3404, (typeof(p3406)))))
            end
        end,
        ["_format"] = function(p3407, _, _)
            return v_u_2(v_u_3404, p3407[v_u_3405])
        end
    }
    local v3408 = v_u_4
    local v3409 = v_u_3405
    return setmetatable(v3409, v3408)
end
local v_u_3410 = "AssetSoundEffect"
function v5.AssetSoundEffect()
    local v_u_3411 = nil
    v_u_3411 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3412)
            if typeof(p3412) == "Instance" then
                if p3412:IsA(v_u_3410) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3411, p3412, (("expected %*, got %*"):format(v_u_3410, p3412.ClassName)))
                end
            else
                return v_u_3.err(v_u_3411, p3412, (("expected %*, got %*"):format(v_u_3410, (typeof(p3412)))))
            end
        end,
        ["_format"] = function(p3413, _, _)
            return v_u_2(v_u_3410, p3413[v_u_3411])
        end
    }
    local v3414 = v_u_4
    local v3415 = v_u_3411
    return setmetatable(v3415, v3414)
end
local v_u_3416 = "ChannelSelectorSoundEffect"
function v5.ChannelSelectorSoundEffect()
    local v_u_3417 = nil
    v_u_3417 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3418)
            if typeof(p3418) == "Instance" then
                if p3418:IsA(v_u_3416) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3417, p3418, (("expected %*, got %*"):format(v_u_3416, p3418.ClassName)))
                end
            else
                return v_u_3.err(v_u_3417, p3418, (("expected %*, got %*"):format(v_u_3416, (typeof(p3418)))))
            end
        end,
        ["_format"] = function(p3419, _, _)
            return v_u_2(v_u_3416, p3419[v_u_3417])
        end
    }
    local v3420 = v_u_4
    local v3421 = v_u_3417
    return setmetatable(v3421, v3420)
end
local v_u_3422 = "DistortionSoundEffect"
function v5.DistortionSoundEffect()
    local v_u_3423 = nil
    v_u_3423 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3424)
            if typeof(p3424) == "Instance" then
                if p3424:IsA(v_u_3422) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3423, p3424, (("expected %*, got %*"):format(v_u_3422, p3424.ClassName)))
                end
            else
                return v_u_3.err(v_u_3423, p3424, (("expected %*, got %*"):format(v_u_3422, (typeof(p3424)))))
            end
        end,
        ["_format"] = function(p3425, _, _)
            return v_u_2(v_u_3422, p3425[v_u_3423])
        end
    }
    local v3426 = v_u_4
    local v3427 = v_u_3423
    return setmetatable(v3427, v3426)
end
local v_u_3428 = "EchoSoundEffect"
function v5.EchoSoundEffect()
    local v_u_3429 = nil
    v_u_3429 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3430)
            if typeof(p3430) == "Instance" then
                if p3430:IsA(v_u_3428) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3429, p3430, (("expected %*, got %*"):format(v_u_3428, p3430.ClassName)))
                end
            else
                return v_u_3.err(v_u_3429, p3430, (("expected %*, got %*"):format(v_u_3428, (typeof(p3430)))))
            end
        end,
        ["_format"] = function(p3431, _, _)
            return v_u_2(v_u_3428, p3431[v_u_3429])
        end
    }
    local v3432 = v_u_4
    local v3433 = v_u_3429
    return setmetatable(v3433, v3432)
end
local v_u_3434 = "EqualizerSoundEffect"
function v5.EqualizerSoundEffect()
    local v_u_3435 = nil
    v_u_3435 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3436)
            if typeof(p3436) == "Instance" then
                if p3436:IsA(v_u_3434) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3435, p3436, (("expected %*, got %*"):format(v_u_3434, p3436.ClassName)))
                end
            else
                return v_u_3.err(v_u_3435, p3436, (("expected %*, got %*"):format(v_u_3434, (typeof(p3436)))))
            end
        end,
        ["_format"] = function(p3437, _, _)
            return v_u_2(v_u_3434, p3437[v_u_3435])
        end
    }
    local v3438 = v_u_4
    local v3439 = v_u_3435
    return setmetatable(v3439, v3438)
end
local v_u_3440 = "FlangeSoundEffect"
function v5.FlangeSoundEffect()
    local v_u_3441 = nil
    v_u_3441 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3442)
            if typeof(p3442) == "Instance" then
                if p3442:IsA(v_u_3440) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3441, p3442, (("expected %*, got %*"):format(v_u_3440, p3442.ClassName)))
                end
            else
                return v_u_3.err(v_u_3441, p3442, (("expected %*, got %*"):format(v_u_3440, (typeof(p3442)))))
            end
        end,
        ["_format"] = function(p3443, _, _)
            return v_u_2(v_u_3440, p3443[v_u_3441])
        end
    }
    local v3444 = v_u_4
    local v3445 = v_u_3441
    return setmetatable(v3445, v3444)
end
local v_u_3446 = "PitchShiftSoundEffect"
function v5.PitchShiftSoundEffect()
    local v_u_3447 = nil
    v_u_3447 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3448)
            if typeof(p3448) == "Instance" then
                if p3448:IsA(v_u_3446) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3447, p3448, (("expected %*, got %*"):format(v_u_3446, p3448.ClassName)))
                end
            else
                return v_u_3.err(v_u_3447, p3448, (("expected %*, got %*"):format(v_u_3446, (typeof(p3448)))))
            end
        end,
        ["_format"] = function(p3449, _, _)
            return v_u_2(v_u_3446, p3449[v_u_3447])
        end
    }
    local v3450 = v_u_4
    local v3451 = v_u_3447
    return setmetatable(v3451, v3450)
end
local v_u_3452 = "ReverbSoundEffect"
function v5.ReverbSoundEffect()
    local v_u_3453 = nil
    v_u_3453 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3454)
            if typeof(p3454) == "Instance" then
                if p3454:IsA(v_u_3452) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3453, p3454, (("expected %*, got %*"):format(v_u_3452, p3454.ClassName)))
                end
            else
                return v_u_3.err(v_u_3453, p3454, (("expected %*, got %*"):format(v_u_3452, (typeof(p3454)))))
            end
        end,
        ["_format"] = function(p3455, _, _)
            return v_u_2(v_u_3452, p3455[v_u_3453])
        end
    }
    local v3456 = v_u_4
    local v3457 = v_u_3453
    return setmetatable(v3457, v3456)
end
local v_u_3458 = "TremoloSoundEffect"
function v5.TremoloSoundEffect()
    local v_u_3459 = nil
    v_u_3459 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3460)
            if typeof(p3460) == "Instance" then
                if p3460:IsA(v_u_3458) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3459, p3460, (("expected %*, got %*"):format(v_u_3458, p3460.ClassName)))
                end
            else
                return v_u_3.err(v_u_3459, p3460, (("expected %*, got %*"):format(v_u_3458, (typeof(p3460)))))
            end
        end,
        ["_format"] = function(p3461, _, _)
            return v_u_2(v_u_3458, p3461[v_u_3459])
        end
    }
    local v3462 = v_u_4
    local v3463 = v_u_3459
    return setmetatable(v3463, v3462)
end
local v_u_3464 = "SoundGroup"
function v5.SoundGroup()
    local v_u_3465 = nil
    v_u_3465 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3466)
            if typeof(p3466) == "Instance" then
                if p3466:IsA(v_u_3464) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3465, p3466, (("expected %*, got %*"):format(v_u_3464, p3466.ClassName)))
                end
            else
                return v_u_3.err(v_u_3465, p3466, (("expected %*, got %*"):format(v_u_3464, (typeof(p3466)))))
            end
        end,
        ["_format"] = function(p3467, _, _)
            return v_u_2(v_u_3464, p3467[v_u_3465])
        end
    }
    local v3468 = v_u_4
    local v3469 = v_u_3465
    return setmetatable(v3469, v3468)
end
local v_u_3470 = "SoundService"
function v5.SoundService()
    local v_u_3471 = nil
    v_u_3471 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3472)
            if typeof(p3472) == "Instance" then
                if p3472:IsA(v_u_3470) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3471, p3472, (("expected %*, got %*"):format(v_u_3470, p3472.ClassName)))
                end
            else
                return v_u_3.err(v_u_3471, p3472, (("expected %*, got %*"):format(v_u_3470, (typeof(p3472)))))
            end
        end,
        ["_format"] = function(p3473, _, _)
            return v_u_2(v_u_3470, p3473[v_u_3471])
        end
    }
    local v3474 = v_u_4
    local v3475 = v_u_3471
    return setmetatable(v3475, v3474)
end
local v_u_3476 = "Sparkles"
function v5.Sparkles()
    local v_u_3477 = nil
    v_u_3477 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3478)
            if typeof(p3478) == "Instance" then
                if p3478:IsA(v_u_3476) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3477, p3478, (("expected %*, got %*"):format(v_u_3476, p3478.ClassName)))
                end
            else
                return v_u_3.err(v_u_3477, p3478, (("expected %*, got %*"):format(v_u_3476, (typeof(p3478)))))
            end
        end,
        ["_format"] = function(p3479, _, _)
            return v_u_2(v_u_3476, p3479[v_u_3477])
        end
    }
    local v3480 = v_u_4
    local v3481 = v_u_3477
    return setmetatable(v3481, v3480)
end
local v_u_3482 = "SpawnerService"
function v5.SpawnerService()
    local v_u_3483 = nil
    v_u_3483 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3484)
            if typeof(p3484) == "Instance" then
                if p3484:IsA(v_u_3482) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3483, p3484, (("expected %*, got %*"):format(v_u_3482, p3484.ClassName)))
                end
            else
                return v_u_3.err(v_u_3483, p3484, (("expected %*, got %*"):format(v_u_3482, (typeof(p3484)))))
            end
        end,
        ["_format"] = function(p3485, _, _)
            return v_u_2(v_u_3482, p3485[v_u_3483])
        end
    }
    local v3486 = v_u_4
    local v3487 = v_u_3483
    return setmetatable(v3487, v3486)
end
local v_u_3488 = "StackFrame"
function v5.StackFrame()
    local v_u_3489 = nil
    v_u_3489 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3490)
            if typeof(p3490) == "Instance" then
                if p3490:IsA(v_u_3488) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3489, p3490, (("expected %*, got %*"):format(v_u_3488, p3490.ClassName)))
                end
            else
                return v_u_3.err(v_u_3489, p3490, (("expected %*, got %*"):format(v_u_3488, (typeof(p3490)))))
            end
        end,
        ["_format"] = function(p3491, _, _)
            return v_u_2(v_u_3488, p3491[v_u_3489])
        end
    }
    local v3492 = v_u_4
    local v3493 = v_u_3489
    return setmetatable(v3493, v3492)
end
local v_u_3494 = "StandalonePluginScripts"
function v5.StandalonePluginScripts()
    local v_u_3495 = nil
    v_u_3495 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3496)
            if typeof(p3496) == "Instance" then
                if p3496:IsA(v_u_3494) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3495, p3496, (("expected %*, got %*"):format(v_u_3494, p3496.ClassName)))
                end
            else
                return v_u_3.err(v_u_3495, p3496, (("expected %*, got %*"):format(v_u_3494, (typeof(p3496)))))
            end
        end,
        ["_format"] = function(p3497, _, _)
            return v_u_2(v_u_3494, p3497[v_u_3495])
        end
    }
    local v3498 = v_u_4
    local v3499 = v_u_3495
    return setmetatable(v3499, v3498)
end
local v_u_3500 = "StarterGear"
function v5.StarterGear()
    local v_u_3501 = nil
    v_u_3501 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3502)
            if typeof(p3502) == "Instance" then
                if p3502:IsA(v_u_3500) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3501, p3502, (("expected %*, got %*"):format(v_u_3500, p3502.ClassName)))
                end
            else
                return v_u_3.err(v_u_3501, p3502, (("expected %*, got %*"):format(v_u_3500, (typeof(p3502)))))
            end
        end,
        ["_format"] = function(p3503, _, _)
            return v_u_2(v_u_3500, p3503[v_u_3501])
        end
    }
    local v3504 = v_u_4
    local v3505 = v_u_3501
    return setmetatable(v3505, v3504)
end
local v_u_3506 = "StarterPack"
function v5.StarterPack()
    local v_u_3507 = nil
    v_u_3507 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3508)
            if typeof(p3508) == "Instance" then
                if p3508:IsA(v_u_3506) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3507, p3508, (("expected %*, got %*"):format(v_u_3506, p3508.ClassName)))
                end
            else
                return v_u_3.err(v_u_3507, p3508, (("expected %*, got %*"):format(v_u_3506, (typeof(p3508)))))
            end
        end,
        ["_format"] = function(p3509, _, _)
            return v_u_2(v_u_3506, p3509[v_u_3507])
        end
    }
    local v3510 = v_u_4
    local v3511 = v_u_3507
    return setmetatable(v3511, v3510)
end
local v_u_3512 = "StarterPlayer"
function v5.StarterPlayer()
    local v_u_3513 = nil
    v_u_3513 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3514)
            if typeof(p3514) == "Instance" then
                if p3514:IsA(v_u_3512) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3513, p3514, (("expected %*, got %*"):format(v_u_3512, p3514.ClassName)))
                end
            else
                return v_u_3.err(v_u_3513, p3514, (("expected %*, got %*"):format(v_u_3512, (typeof(p3514)))))
            end
        end,
        ["_format"] = function(p3515, _, _)
            return v_u_2(v_u_3512, p3515[v_u_3513])
        end
    }
    local v3516 = v_u_4
    local v3517 = v_u_3513
    return setmetatable(v3517, v3516)
end
local v_u_3518 = "StarterPlayerScripts"
function v5.StarterPlayerScripts()
    local v_u_3519 = nil
    v_u_3519 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3520)
            if typeof(p3520) == "Instance" then
                if p3520:IsA(v_u_3518) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3519, p3520, (("expected %*, got %*"):format(v_u_3518, p3520.ClassName)))
                end
            else
                return v_u_3.err(v_u_3519, p3520, (("expected %*, got %*"):format(v_u_3518, (typeof(p3520)))))
            end
        end,
        ["_format"] = function(p3521, _, _)
            return v_u_2(v_u_3518, p3521[v_u_3519])
        end
    }
    local v3522 = v_u_4
    local v3523 = v_u_3519
    return setmetatable(v3523, v3522)
end
local v_u_3524 = "StarterCharacterScripts"
function v5.StarterCharacterScripts()
    local v_u_3525 = nil
    v_u_3525 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3526)
            if typeof(p3526) == "Instance" then
                if p3526:IsA(v_u_3524) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3525, p3526, (("expected %*, got %*"):format(v_u_3524, p3526.ClassName)))
                end
            else
                return v_u_3.err(v_u_3525, p3526, (("expected %*, got %*"):format(v_u_3524, (typeof(p3526)))))
            end
        end,
        ["_format"] = function(p3527, _, _)
            return v_u_2(v_u_3524, p3527[v_u_3525])
        end
    }
    local v3528 = v_u_4
    local v3529 = v_u_3525
    return setmetatable(v3529, v3528)
end
local v_u_3530 = "Stats"
function v5.Stats()
    local v_u_3531 = nil
    v_u_3531 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3532)
            if typeof(p3532) == "Instance" then
                if p3532:IsA(v_u_3530) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3531, p3532, (("expected %*, got %*"):format(v_u_3530, p3532.ClassName)))
                end
            else
                return v_u_3.err(v_u_3531, p3532, (("expected %*, got %*"):format(v_u_3530, (typeof(p3532)))))
            end
        end,
        ["_format"] = function(p3533, _, _)
            return v_u_2(v_u_3530, p3533[v_u_3531])
        end
    }
    local v3534 = v_u_4
    local v3535 = v_u_3531
    return setmetatable(v3535, v3534)
end
local v_u_3536 = "StatsItem"
function v5.StatsItem()
    local v_u_3537 = nil
    v_u_3537 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3538)
            if typeof(p3538) == "Instance" then
                if p3538:IsA(v_u_3536) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3537, p3538, (("expected %*, got %*"):format(v_u_3536, p3538.ClassName)))
                end
            else
                return v_u_3.err(v_u_3537, p3538, (("expected %*, got %*"):format(v_u_3536, (typeof(p3538)))))
            end
        end,
        ["_format"] = function(p3539, _, _)
            return v_u_2(v_u_3536, p3539[v_u_3537])
        end
    }
    local v3540 = v_u_4
    local v3541 = v_u_3537
    return setmetatable(v3541, v3540)
end
local v_u_3542 = "RunningAverageItemDouble"
function v5.RunningAverageItemDouble()
    local v_u_3543 = nil
    v_u_3543 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3544)
            if typeof(p3544) == "Instance" then
                if p3544:IsA(v_u_3542) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3543, p3544, (("expected %*, got %*"):format(v_u_3542, p3544.ClassName)))
                end
            else
                return v_u_3.err(v_u_3543, p3544, (("expected %*, got %*"):format(v_u_3542, (typeof(p3544)))))
            end
        end,
        ["_format"] = function(p3545, _, _)
            return v_u_2(v_u_3542, p3545[v_u_3543])
        end
    }
    local v3546 = v_u_4
    local v3547 = v_u_3543
    return setmetatable(v3547, v3546)
end
local v_u_3548 = "RunningAverageItemInt"
function v5.RunningAverageItemInt()
    local v_u_3549 = nil
    v_u_3549 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3550)
            if typeof(p3550) == "Instance" then
                if p3550:IsA(v_u_3548) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3549, p3550, (("expected %*, got %*"):format(v_u_3548, p3550.ClassName)))
                end
            else
                return v_u_3.err(v_u_3549, p3550, (("expected %*, got %*"):format(v_u_3548, (typeof(p3550)))))
            end
        end,
        ["_format"] = function(p3551, _, _)
            return v_u_2(v_u_3548, p3551[v_u_3549])
        end
    }
    local v3552 = v_u_4
    local v3553 = v_u_3549
    return setmetatable(v3553, v3552)
end
local v_u_3554 = "RunningAverageTimeIntervalItem"
function v5.RunningAverageTimeIntervalItem()
    local v_u_3555 = nil
    v_u_3555 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3556)
            if typeof(p3556) == "Instance" then
                if p3556:IsA(v_u_3554) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3555, p3556, (("expected %*, got %*"):format(v_u_3554, p3556.ClassName)))
                end
            else
                return v_u_3.err(v_u_3555, p3556, (("expected %*, got %*"):format(v_u_3554, (typeof(p3556)))))
            end
        end,
        ["_format"] = function(p3557, _, _)
            return v_u_2(v_u_3554, p3557[v_u_3555])
        end
    }
    local v3558 = v_u_4
    local v3559 = v_u_3555
    return setmetatable(v3559, v3558)
end
local v_u_3560 = "TotalCountTimeIntervalItem"
function v5.TotalCountTimeIntervalItem()
    local v_u_3561 = nil
    v_u_3561 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3562)
            if typeof(p3562) == "Instance" then
                if p3562:IsA(v_u_3560) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3561, p3562, (("expected %*, got %*"):format(v_u_3560, p3562.ClassName)))
                end
            else
                return v_u_3.err(v_u_3561, p3562, (("expected %*, got %*"):format(v_u_3560, (typeof(p3562)))))
            end
        end,
        ["_format"] = function(p3563, _, _)
            return v_u_2(v_u_3560, p3563[v_u_3561])
        end
    }
    local v3564 = v_u_4
    local v3565 = v_u_3561
    return setmetatable(v3565, v3564)
end
local v_u_3566 = "StopWatchReporter"
function v5.StopWatchReporter()
    local v_u_3567 = nil
    v_u_3567 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3568)
            if typeof(p3568) == "Instance" then
                if p3568:IsA(v_u_3566) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3567, p3568, (("expected %*, got %*"):format(v_u_3566, p3568.ClassName)))
                end
            else
                return v_u_3.err(v_u_3567, p3568, (("expected %*, got %*"):format(v_u_3566, (typeof(p3568)))))
            end
        end,
        ["_format"] = function(p3569, _, _)
            return v_u_2(v_u_3566, p3569[v_u_3567])
        end
    }
    local v3570 = v_u_4
    local v3571 = v_u_3567
    return setmetatable(v3571, v3570)
end
local v_u_3572 = "StreamingService"
function v5.StreamingService()
    local v_u_3573 = nil
    v_u_3573 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3574)
            if typeof(p3574) == "Instance" then
                if p3574:IsA(v_u_3572) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3573, p3574, (("expected %*, got %*"):format(v_u_3572, p3574.ClassName)))
                end
            else
                return v_u_3.err(v_u_3573, p3574, (("expected %*, got %*"):format(v_u_3572, (typeof(p3574)))))
            end
        end,
        ["_format"] = function(p3575, _, _)
            return v_u_2(v_u_3572, p3575[v_u_3573])
        end
    }
    local v3576 = v_u_4
    local v3577 = v_u_3573
    return setmetatable(v3577, v3576)
end
local v_u_3578 = "Studio"
function v5.Studio()
    local v_u_3579 = nil
    v_u_3579 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3580)
            if typeof(p3580) == "Instance" then
                if p3580:IsA(v_u_3578) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3579, p3580, (("expected %*, got %*"):format(v_u_3578, p3580.ClassName)))
                end
            else
                return v_u_3.err(v_u_3579, p3580, (("expected %*, got %*"):format(v_u_3578, (typeof(p3580)))))
            end
        end,
        ["_format"] = function(p3581, _, _)
            return v_u_2(v_u_3578, p3581[v_u_3579])
        end
    }
    local v3582 = v_u_4
    local v3583 = v_u_3579
    return setmetatable(v3583, v3582)
end
local v_u_3584 = "StudioAssetService"
function v5.StudioAssetService()
    local v_u_3585 = nil
    v_u_3585 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3586)
            if typeof(p3586) == "Instance" then
                if p3586:IsA(v_u_3584) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3585, p3586, (("expected %*, got %*"):format(v_u_3584, p3586.ClassName)))
                end
            else
                return v_u_3.err(v_u_3585, p3586, (("expected %*, got %*"):format(v_u_3584, (typeof(p3586)))))
            end
        end,
        ["_format"] = function(p3587, _, _)
            return v_u_2(v_u_3584, p3587[v_u_3585])
        end
    }
    local v3588 = v_u_4
    local v3589 = v_u_3585
    return setmetatable(v3589, v3588)
end
local v_u_3590 = "StudioAttachment"
function v5.StudioAttachment()
    local v_u_3591 = nil
    v_u_3591 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3592)
            if typeof(p3592) == "Instance" then
                if p3592:IsA(v_u_3590) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3591, p3592, (("expected %*, got %*"):format(v_u_3590, p3592.ClassName)))
                end
            else
                return v_u_3.err(v_u_3591, p3592, (("expected %*, got %*"):format(v_u_3590, (typeof(p3592)))))
            end
        end,
        ["_format"] = function(p3593, _, _)
            return v_u_2(v_u_3590, p3593[v_u_3591])
        end
    }
    local v3594 = v_u_4
    local v3595 = v_u_3591
    return setmetatable(v3595, v3594)
end
local v_u_3596 = "StudioCallout"
function v5.StudioCallout()
    local v_u_3597 = nil
    v_u_3597 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3598)
            if typeof(p3598) == "Instance" then
                if p3598:IsA(v_u_3596) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3597, p3598, (("expected %*, got %*"):format(v_u_3596, p3598.ClassName)))
                end
            else
                return v_u_3.err(v_u_3597, p3598, (("expected %*, got %*"):format(v_u_3596, (typeof(p3598)))))
            end
        end,
        ["_format"] = function(p3599, _, _)
            return v_u_2(v_u_3596, p3599[v_u_3597])
        end
    }
    local v3600 = v_u_4
    local v3601 = v_u_3597
    return setmetatable(v3601, v3600)
end
local v_u_3602 = "StudioData"
function v5.StudioData()
    local v_u_3603 = nil
    v_u_3603 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3604)
            if typeof(p3604) == "Instance" then
                if p3604:IsA(v_u_3602) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3603, p3604, (("expected %*, got %*"):format(v_u_3602, p3604.ClassName)))
                end
            else
                return v_u_3.err(v_u_3603, p3604, (("expected %*, got %*"):format(v_u_3602, (typeof(p3604)))))
            end
        end,
        ["_format"] = function(p3605, _, _)
            return v_u_2(v_u_3602, p3605[v_u_3603])
        end
    }
    local v3606 = v_u_4
    local v3607 = v_u_3603
    return setmetatable(v3607, v3606)
end
local v_u_3608 = "StudioDeviceEmulatorService"
function v5.StudioDeviceEmulatorService()
    local v_u_3609 = nil
    v_u_3609 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3610)
            if typeof(p3610) == "Instance" then
                if p3610:IsA(v_u_3608) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3609, p3610, (("expected %*, got %*"):format(v_u_3608, p3610.ClassName)))
                end
            else
                return v_u_3.err(v_u_3609, p3610, (("expected %*, got %*"):format(v_u_3608, (typeof(p3610)))))
            end
        end,
        ["_format"] = function(p3611, _, _)
            return v_u_2(v_u_3608, p3611[v_u_3609])
        end
    }
    local v3612 = v_u_4
    local v3613 = v_u_3609
    return setmetatable(v3613, v3612)
end
local v_u_3614 = "StudioObjectBase"
function v5.StudioObjectBase()
    local v_u_3615 = nil
    v_u_3615 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3616)
            if typeof(p3616) == "Instance" then
                if p3616:IsA(v_u_3614) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3615, p3616, (("expected %*, got %*"):format(v_u_3614, p3616.ClassName)))
                end
            else
                return v_u_3.err(v_u_3615, p3616, (("expected %*, got %*"):format(v_u_3614, (typeof(p3616)))))
            end
        end,
        ["_format"] = function(p3617, _, _)
            return v_u_2(v_u_3614, p3617[v_u_3615])
        end
    }
    local v3618 = v_u_4
    local v3619 = v_u_3615
    return setmetatable(v3619, v3618)
end
local v_u_3620 = "StudioWidget"
function v5.StudioWidget()
    local v_u_3621 = nil
    v_u_3621 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3622)
            if typeof(p3622) == "Instance" then
                if p3622:IsA(v_u_3620) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3621, p3622, (("expected %*, got %*"):format(v_u_3620, p3622.ClassName)))
                end
            else
                return v_u_3.err(v_u_3621, p3622, (("expected %*, got %*"):format(v_u_3620, (typeof(p3622)))))
            end
        end,
        ["_format"] = function(p3623, _, _)
            return v_u_2(v_u_3620, p3623[v_u_3621])
        end
    }
    local v3624 = v_u_4
    local v3625 = v_u_3621
    return setmetatable(v3625, v3624)
end
local v_u_3626 = "StudioPublishService"
function v5.StudioPublishService()
    local v_u_3627 = nil
    v_u_3627 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3628)
            if typeof(p3628) == "Instance" then
                if p3628:IsA(v_u_3626) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3627, p3628, (("expected %*, got %*"):format(v_u_3626, p3628.ClassName)))
                end
            else
                return v_u_3.err(v_u_3627, p3628, (("expected %*, got %*"):format(v_u_3626, (typeof(p3628)))))
            end
        end,
        ["_format"] = function(p3629, _, _)
            return v_u_2(v_u_3626, p3629[v_u_3627])
        end
    }
    local v3630 = v_u_4
    local v3631 = v_u_3627
    return setmetatable(v3631, v3630)
end
local v_u_3632 = "StudioScriptDebugEventListener"
function v5.StudioScriptDebugEventListener()
    local v_u_3633 = nil
    v_u_3633 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3634)
            if typeof(p3634) == "Instance" then
                if p3634:IsA(v_u_3632) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3633, p3634, (("expected %*, got %*"):format(v_u_3632, p3634.ClassName)))
                end
            else
                return v_u_3.err(v_u_3633, p3634, (("expected %*, got %*"):format(v_u_3632, (typeof(p3634)))))
            end
        end,
        ["_format"] = function(p3635, _, _)
            return v_u_2(v_u_3632, p3635[v_u_3633])
        end
    }
    local v3636 = v_u_4
    local v3637 = v_u_3633
    return setmetatable(v3637, v3636)
end
local v_u_3638 = "StudioSdkService"
function v5.StudioSdkService()
    local v_u_3639 = nil
    v_u_3639 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3640)
            if typeof(p3640) == "Instance" then
                if p3640:IsA(v_u_3638) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3639, p3640, (("expected %*, got %*"):format(v_u_3638, p3640.ClassName)))
                end
            else
                return v_u_3.err(v_u_3639, p3640, (("expected %*, got %*"):format(v_u_3638, (typeof(p3640)))))
            end
        end,
        ["_format"] = function(p3641, _, _)
            return v_u_2(v_u_3638, p3641[v_u_3639])
        end
    }
    local v3642 = v_u_4
    local v3643 = v_u_3639
    return setmetatable(v3643, v3642)
end
local v_u_3644 = "StudioService"
function v5.StudioService()
    local v_u_3645 = nil
    v_u_3645 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3646)
            if typeof(p3646) == "Instance" then
                if p3646:IsA(v_u_3644) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3645, p3646, (("expected %*, got %*"):format(v_u_3644, p3646.ClassName)))
                end
            else
                return v_u_3.err(v_u_3645, p3646, (("expected %*, got %*"):format(v_u_3644, (typeof(p3646)))))
            end
        end,
        ["_format"] = function(p3647, _, _)
            return v_u_2(v_u_3644, p3647[v_u_3645])
        end
    }
    local v3648 = v_u_4
    local v3649 = v_u_3645
    return setmetatable(v3649, v3648)
end
local v_u_3650 = "StudioTheme"
function v5.StudioTheme()
    local v_u_3651 = nil
    v_u_3651 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3652)
            if typeof(p3652) == "Instance" then
                if p3652:IsA(v_u_3650) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3651, p3652, (("expected %*, got %*"):format(v_u_3650, p3652.ClassName)))
                end
            else
                return v_u_3.err(v_u_3651, p3652, (("expected %*, got %*"):format(v_u_3650, (typeof(p3652)))))
            end
        end,
        ["_format"] = function(p3653, _, _)
            return v_u_2(v_u_3650, p3653[v_u_3651])
        end
    }
    local v3654 = v_u_4
    local v3655 = v_u_3651
    return setmetatable(v3655, v3654)
end
local v_u_3656 = "StudioWidgetsService"
function v5.StudioWidgetsService()
    local v_u_3657 = nil
    v_u_3657 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3658)
            if typeof(p3658) == "Instance" then
                if p3658:IsA(v_u_3656) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3657, p3658, (("expected %*, got %*"):format(v_u_3656, p3658.ClassName)))
                end
            else
                return v_u_3.err(v_u_3657, p3658, (("expected %*, got %*"):format(v_u_3656, (typeof(p3658)))))
            end
        end,
        ["_format"] = function(p3659, _, _)
            return v_u_2(v_u_3656, p3659[v_u_3657])
        end
    }
    local v3660 = v_u_4
    local v3661 = v_u_3657
    return setmetatable(v3661, v3660)
end
local v_u_3662 = "StyleBase"
function v5.StyleBase()
    local v_u_3663 = nil
    v_u_3663 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3664)
            if typeof(p3664) == "Instance" then
                if p3664:IsA(v_u_3662) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3663, p3664, (("expected %*, got %*"):format(v_u_3662, p3664.ClassName)))
                end
            else
                return v_u_3.err(v_u_3663, p3664, (("expected %*, got %*"):format(v_u_3662, (typeof(p3664)))))
            end
        end,
        ["_format"] = function(p3665, _, _)
            return v_u_2(v_u_3662, p3665[v_u_3663])
        end
    }
    local v3666 = v_u_4
    local v3667 = v_u_3663
    return setmetatable(v3667, v3666)
end
local v_u_3668 = "StyleRule"
function v5.StyleRule()
    local v_u_3669 = nil
    v_u_3669 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3670)
            if typeof(p3670) == "Instance" then
                if p3670:IsA(v_u_3668) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3669, p3670, (("expected %*, got %*"):format(v_u_3668, p3670.ClassName)))
                end
            else
                return v_u_3.err(v_u_3669, p3670, (("expected %*, got %*"):format(v_u_3668, (typeof(p3670)))))
            end
        end,
        ["_format"] = function(p3671, _, _)
            return v_u_2(v_u_3668, p3671[v_u_3669])
        end
    }
    local v3672 = v_u_4
    local v3673 = v_u_3669
    return setmetatable(v3673, v3672)
end
local v_u_3674 = "StyleSheet"
function v5.StyleSheet()
    local v_u_3675 = nil
    v_u_3675 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3676)
            if typeof(p3676) == "Instance" then
                if p3676:IsA(v_u_3674) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3675, p3676, (("expected %*, got %*"):format(v_u_3674, p3676.ClassName)))
                end
            else
                return v_u_3.err(v_u_3675, p3676, (("expected %*, got %*"):format(v_u_3674, (typeof(p3676)))))
            end
        end,
        ["_format"] = function(p3677, _, _)
            return v_u_2(v_u_3674, p3677[v_u_3675])
        end
    }
    local v3678 = v_u_4
    local v3679 = v_u_3675
    return setmetatable(v3679, v3678)
end
local v_u_3680 = "StyleDerive"
function v5.StyleDerive()
    local v_u_3681 = nil
    v_u_3681 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3682)
            if typeof(p3682) == "Instance" then
                if p3682:IsA(v_u_3680) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3681, p3682, (("expected %*, got %*"):format(v_u_3680, p3682.ClassName)))
                end
            else
                return v_u_3.err(v_u_3681, p3682, (("expected %*, got %*"):format(v_u_3680, (typeof(p3682)))))
            end
        end,
        ["_format"] = function(p3683, _, _)
            return v_u_2(v_u_3680, p3683[v_u_3681])
        end
    }
    local v3684 = v_u_4
    local v3685 = v_u_3681
    return setmetatable(v3685, v3684)
end
local v_u_3686 = "StyleLink"
function v5.StyleLink()
    local v_u_3687 = nil
    v_u_3687 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3688)
            if typeof(p3688) == "Instance" then
                if p3688:IsA(v_u_3686) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3687, p3688, (("expected %*, got %*"):format(v_u_3686, p3688.ClassName)))
                end
            else
                return v_u_3.err(v_u_3687, p3688, (("expected %*, got %*"):format(v_u_3686, (typeof(p3688)))))
            end
        end,
        ["_format"] = function(p3689, _, _)
            return v_u_2(v_u_3686, p3689[v_u_3687])
        end
    }
    local v3690 = v_u_4
    local v3691 = v_u_3687
    return setmetatable(v3691, v3690)
end
local v_u_3692 = "StylingService"
function v5.StylingService()
    local v_u_3693 = nil
    v_u_3693 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3694)
            if typeof(p3694) == "Instance" then
                if p3694:IsA(v_u_3692) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3693, p3694, (("expected %*, got %*"):format(v_u_3692, p3694.ClassName)))
                end
            else
                return v_u_3.err(v_u_3693, p3694, (("expected %*, got %*"):format(v_u_3692, (typeof(p3694)))))
            end
        end,
        ["_format"] = function(p3695, _, _)
            return v_u_2(v_u_3692, p3695[v_u_3693])
        end
    }
    local v3696 = v_u_4
    local v3697 = v_u_3693
    return setmetatable(v3697, v3696)
end
local v_u_3698 = "SurfaceAppearance"
function v5.SurfaceAppearance()
    local v_u_3699 = nil
    v_u_3699 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3700)
            if typeof(p3700) == "Instance" then
                if p3700:IsA(v_u_3698) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3699, p3700, (("expected %*, got %*"):format(v_u_3698, p3700.ClassName)))
                end
            else
                return v_u_3.err(v_u_3699, p3700, (("expected %*, got %*"):format(v_u_3698, (typeof(p3700)))))
            end
        end,
        ["_format"] = function(p3701, _, _)
            return v_u_2(v_u_3698, p3701[v_u_3699])
        end
    }
    local v3702 = v_u_4
    local v3703 = v_u_3699
    return setmetatable(v3703, v3702)
end
local v_u_3704 = "TaskScheduler"
function v5.TaskScheduler()
    local v_u_3705 = nil
    v_u_3705 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3706)
            if typeof(p3706) == "Instance" then
                if p3706:IsA(v_u_3704) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3705, p3706, (("expected %*, got %*"):format(v_u_3704, p3706.ClassName)))
                end
            else
                return v_u_3.err(v_u_3705, p3706, (("expected %*, got %*"):format(v_u_3704, (typeof(p3706)))))
            end
        end,
        ["_format"] = function(p3707, _, _)
            return v_u_2(v_u_3704, p3707[v_u_3705])
        end
    }
    local v3708 = v_u_4
    local v3709 = v_u_3705
    return setmetatable(v3709, v3708)
end
local v_u_3710 = "Team"
function v5.Team()
    local v_u_3711 = nil
    v_u_3711 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3712)
            if typeof(p3712) == "Instance" then
                if p3712:IsA(v_u_3710) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3711, p3712, (("expected %*, got %*"):format(v_u_3710, p3712.ClassName)))
                end
            else
                return v_u_3.err(v_u_3711, p3712, (("expected %*, got %*"):format(v_u_3710, (typeof(p3712)))))
            end
        end,
        ["_format"] = function(p3713, _, _)
            return v_u_2(v_u_3710, p3713[v_u_3711])
        end
    }
    local v3714 = v_u_4
    local v3715 = v_u_3711
    return setmetatable(v3715, v3714)
end
local v_u_3716 = "TeamCreateData"
function v5.TeamCreateData()
    local v_u_3717 = nil
    v_u_3717 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3718)
            if typeof(p3718) == "Instance" then
                if p3718:IsA(v_u_3716) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3717, p3718, (("expected %*, got %*"):format(v_u_3716, p3718.ClassName)))
                end
            else
                return v_u_3.err(v_u_3717, p3718, (("expected %*, got %*"):format(v_u_3716, (typeof(p3718)))))
            end
        end,
        ["_format"] = function(p3719, _, _)
            return v_u_2(v_u_3716, p3719[v_u_3717])
        end
    }
    local v3720 = v_u_4
    local v3721 = v_u_3717
    return setmetatable(v3721, v3720)
end
local v_u_3722 = "TeamCreatePublishService"
function v5.TeamCreatePublishService()
    local v_u_3723 = nil
    v_u_3723 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3724)
            if typeof(p3724) == "Instance" then
                if p3724:IsA(v_u_3722) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3723, p3724, (("expected %*, got %*"):format(v_u_3722, p3724.ClassName)))
                end
            else
                return v_u_3.err(v_u_3723, p3724, (("expected %*, got %*"):format(v_u_3722, (typeof(p3724)))))
            end
        end,
        ["_format"] = function(p3725, _, _)
            return v_u_2(v_u_3722, p3725[v_u_3723])
        end
    }
    local v3726 = v_u_4
    local v3727 = v_u_3723
    return setmetatable(v3727, v3726)
end
local v_u_3728 = "TeamCreateService"
function v5.TeamCreateService()
    local v_u_3729 = nil
    v_u_3729 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3730)
            if typeof(p3730) == "Instance" then
                if p3730:IsA(v_u_3728) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3729, p3730, (("expected %*, got %*"):format(v_u_3728, p3730.ClassName)))
                end
            else
                return v_u_3.err(v_u_3729, p3730, (("expected %*, got %*"):format(v_u_3728, (typeof(p3730)))))
            end
        end,
        ["_format"] = function(p3731, _, _)
            return v_u_2(v_u_3728, p3731[v_u_3729])
        end
    }
    local v3732 = v_u_4
    local v3733 = v_u_3729
    return setmetatable(v3733, v3732)
end
local v_u_3734 = "Teams"
function v5.Teams()
    local v_u_3735 = nil
    v_u_3735 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3736)
            if typeof(p3736) == "Instance" then
                if p3736:IsA(v_u_3734) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3735, p3736, (("expected %*, got %*"):format(v_u_3734, p3736.ClassName)))
                end
            else
                return v_u_3.err(v_u_3735, p3736, (("expected %*, got %*"):format(v_u_3734, (typeof(p3736)))))
            end
        end,
        ["_format"] = function(p3737, _, _)
            return v_u_2(v_u_3734, p3737[v_u_3735])
        end
    }
    local v3738 = v_u_4
    local v3739 = v_u_3735
    return setmetatable(v3739, v3738)
end
local v_u_3740 = "TeleportAsyncResult"
function v5.TeleportAsyncResult()
    local v_u_3741 = nil
    v_u_3741 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3742)
            if typeof(p3742) == "Instance" then
                if p3742:IsA(v_u_3740) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3741, p3742, (("expected %*, got %*"):format(v_u_3740, p3742.ClassName)))
                end
            else
                return v_u_3.err(v_u_3741, p3742, (("expected %*, got %*"):format(v_u_3740, (typeof(p3742)))))
            end
        end,
        ["_format"] = function(p3743, _, _)
            return v_u_2(v_u_3740, p3743[v_u_3741])
        end
    }
    local v3744 = v_u_4
    local v3745 = v_u_3741
    return setmetatable(v3745, v3744)
end
local v_u_3746 = "TeleportOptions"
function v5.TeleportOptions()
    local v_u_3747 = nil
    v_u_3747 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3748)
            if typeof(p3748) == "Instance" then
                if p3748:IsA(v_u_3746) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3747, p3748, (("expected %*, got %*"):format(v_u_3746, p3748.ClassName)))
                end
            else
                return v_u_3.err(v_u_3747, p3748, (("expected %*, got %*"):format(v_u_3746, (typeof(p3748)))))
            end
        end,
        ["_format"] = function(p3749, _, _)
            return v_u_2(v_u_3746, p3749[v_u_3747])
        end
    }
    local v3750 = v_u_4
    local v3751 = v_u_3747
    return setmetatable(v3751, v3750)
end
local v_u_3752 = "TeleportService"
function v5.TeleportService()
    local v_u_3753 = nil
    v_u_3753 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3754)
            if typeof(p3754) == "Instance" then
                if p3754:IsA(v_u_3752) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3753, p3754, (("expected %*, got %*"):format(v_u_3752, p3754.ClassName)))
                end
            else
                return v_u_3.err(v_u_3753, p3754, (("expected %*, got %*"):format(v_u_3752, (typeof(p3754)))))
            end
        end,
        ["_format"] = function(p3755, _, _)
            return v_u_2(v_u_3752, p3755[v_u_3753])
        end
    }
    local v3756 = v_u_4
    local v3757 = v_u_3753
    return setmetatable(v3757, v3756)
end
local v_u_3758 = "TemporaryCageMeshProvider"
function v5.TemporaryCageMeshProvider()
    local v_u_3759 = nil
    v_u_3759 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3760)
            if typeof(p3760) == "Instance" then
                if p3760:IsA(v_u_3758) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3759, p3760, (("expected %*, got %*"):format(v_u_3758, p3760.ClassName)))
                end
            else
                return v_u_3.err(v_u_3759, p3760, (("expected %*, got %*"):format(v_u_3758, (typeof(p3760)))))
            end
        end,
        ["_format"] = function(p3761, _, _)
            return v_u_2(v_u_3758, p3761[v_u_3759])
        end
    }
    local v3762 = v_u_4
    local v3763 = v_u_3759
    return setmetatable(v3763, v3762)
end
local v_u_3764 = "TemporaryScriptService"
function v5.TemporaryScriptService()
    local v_u_3765 = nil
    v_u_3765 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3766)
            if typeof(p3766) == "Instance" then
                if p3766:IsA(v_u_3764) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3765, p3766, (("expected %*, got %*"):format(v_u_3764, p3766.ClassName)))
                end
            else
                return v_u_3.err(v_u_3765, p3766, (("expected %*, got %*"):format(v_u_3764, (typeof(p3766)))))
            end
        end,
        ["_format"] = function(p3767, _, _)
            return v_u_2(v_u_3764, p3767[v_u_3765])
        end
    }
    local v3768 = v_u_4
    local v3769 = v_u_3765
    return setmetatable(v3769, v3768)
end
local v_u_3770 = "TerrainDetail"
function v5.TerrainDetail()
    local v_u_3771 = nil
    v_u_3771 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3772)
            if typeof(p3772) == "Instance" then
                if p3772:IsA(v_u_3770) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3771, p3772, (("expected %*, got %*"):format(v_u_3770, p3772.ClassName)))
                end
            else
                return v_u_3.err(v_u_3771, p3772, (("expected %*, got %*"):format(v_u_3770, (typeof(p3772)))))
            end
        end,
        ["_format"] = function(p3773, _, _)
            return v_u_2(v_u_3770, p3773[v_u_3771])
        end
    }
    local v3774 = v_u_4
    local v3775 = v_u_3771
    return setmetatable(v3775, v3774)
end
local v_u_3776 = "TerrainRegion"
function v5.TerrainRegion()
    local v_u_3777 = nil
    v_u_3777 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3778)
            if typeof(p3778) == "Instance" then
                if p3778:IsA(v_u_3776) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3777, p3778, (("expected %*, got %*"):format(v_u_3776, p3778.ClassName)))
                end
            else
                return v_u_3.err(v_u_3777, p3778, (("expected %*, got %*"):format(v_u_3776, (typeof(p3778)))))
            end
        end,
        ["_format"] = function(p3779, _, _)
            return v_u_2(v_u_3776, p3779[v_u_3777])
        end
    }
    local v3780 = v_u_4
    local v3781 = v_u_3777
    return setmetatable(v3781, v3780)
end
local v_u_3782 = "TestService"
function v5.TestService()
    local v_u_3783 = nil
    v_u_3783 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3784)
            if typeof(p3784) == "Instance" then
                if p3784:IsA(v_u_3782) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3783, p3784, (("expected %*, got %*"):format(v_u_3782, p3784.ClassName)))
                end
            else
                return v_u_3.err(v_u_3783, p3784, (("expected %*, got %*"):format(v_u_3782, (typeof(p3784)))))
            end
        end,
        ["_format"] = function(p3785, _, _)
            return v_u_2(v_u_3782, p3785[v_u_3783])
        end
    }
    local v3786 = v_u_4
    local v3787 = v_u_3783
    return setmetatable(v3787, v3786)
end
local v_u_3788 = "TextBoxService"
function v5.TextBoxService()
    local v_u_3789 = nil
    v_u_3789 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3790)
            if typeof(p3790) == "Instance" then
                if p3790:IsA(v_u_3788) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3789, p3790, (("expected %*, got %*"):format(v_u_3788, p3790.ClassName)))
                end
            else
                return v_u_3.err(v_u_3789, p3790, (("expected %*, got %*"):format(v_u_3788, (typeof(p3790)))))
            end
        end,
        ["_format"] = function(p3791, _, _)
            return v_u_2(v_u_3788, p3791[v_u_3789])
        end
    }
    local v3792 = v_u_4
    local v3793 = v_u_3789
    return setmetatable(v3793, v3792)
end
local v_u_3794 = "TextChannel"
function v5.TextChannel()
    local v_u_3795 = nil
    v_u_3795 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3796)
            if typeof(p3796) == "Instance" then
                if p3796:IsA(v_u_3794) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3795, p3796, (("expected %*, got %*"):format(v_u_3794, p3796.ClassName)))
                end
            else
                return v_u_3.err(v_u_3795, p3796, (("expected %*, got %*"):format(v_u_3794, (typeof(p3796)))))
            end
        end,
        ["_format"] = function(p3797, _, _)
            return v_u_2(v_u_3794, p3797[v_u_3795])
        end
    }
    local v3798 = v_u_4
    local v3799 = v_u_3795
    return setmetatable(v3799, v3798)
end
local v_u_3800 = "TextChatCommand"
function v5.TextChatCommand()
    local v_u_3801 = nil
    v_u_3801 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3802)
            if typeof(p3802) == "Instance" then
                if p3802:IsA(v_u_3800) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3801, p3802, (("expected %*, got %*"):format(v_u_3800, p3802.ClassName)))
                end
            else
                return v_u_3.err(v_u_3801, p3802, (("expected %*, got %*"):format(v_u_3800, (typeof(p3802)))))
            end
        end,
        ["_format"] = function(p3803, _, _)
            return v_u_2(v_u_3800, p3803[v_u_3801])
        end
    }
    local v3804 = v_u_4
    local v3805 = v_u_3801
    return setmetatable(v3805, v3804)
end
local v_u_3806 = "TextChatConfigurations"
function v5.TextChatConfigurations()
    local v_u_3807 = nil
    v_u_3807 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3808)
            if typeof(p3808) == "Instance" then
                if p3808:IsA(v_u_3806) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3807, p3808, (("expected %*, got %*"):format(v_u_3806, p3808.ClassName)))
                end
            else
                return v_u_3.err(v_u_3807, p3808, (("expected %*, got %*"):format(v_u_3806, (typeof(p3808)))))
            end
        end,
        ["_format"] = function(p3809, _, _)
            return v_u_2(v_u_3806, p3809[v_u_3807])
        end
    }
    local v3810 = v_u_4
    local v3811 = v_u_3807
    return setmetatable(v3811, v3810)
end
local v_u_3812 = "BubbleChatConfiguration"
function v5.BubbleChatConfiguration()
    local v_u_3813 = nil
    v_u_3813 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3814)
            if typeof(p3814) == "Instance" then
                if p3814:IsA(v_u_3812) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3813, p3814, (("expected %*, got %*"):format(v_u_3812, p3814.ClassName)))
                end
            else
                return v_u_3.err(v_u_3813, p3814, (("expected %*, got %*"):format(v_u_3812, (typeof(p3814)))))
            end
        end,
        ["_format"] = function(p3815, _, _)
            return v_u_2(v_u_3812, p3815[v_u_3813])
        end
    }
    local v3816 = v_u_4
    local v3817 = v_u_3813
    return setmetatable(v3817, v3816)
end
local v_u_3818 = "ChatInputBarConfiguration"
function v5.ChatInputBarConfiguration()
    local v_u_3819 = nil
    v_u_3819 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3820)
            if typeof(p3820) == "Instance" then
                if p3820:IsA(v_u_3818) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3819, p3820, (("expected %*, got %*"):format(v_u_3818, p3820.ClassName)))
                end
            else
                return v_u_3.err(v_u_3819, p3820, (("expected %*, got %*"):format(v_u_3818, (typeof(p3820)))))
            end
        end,
        ["_format"] = function(p3821, _, _)
            return v_u_2(v_u_3818, p3821[v_u_3819])
        end
    }
    local v3822 = v_u_4
    local v3823 = v_u_3819
    return setmetatable(v3823, v3822)
end
local v_u_3824 = "ChatWindowConfiguration"
function v5.ChatWindowConfiguration()
    local v_u_3825 = nil
    v_u_3825 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3826)
            if typeof(p3826) == "Instance" then
                if p3826:IsA(v_u_3824) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3825, p3826, (("expected %*, got %*"):format(v_u_3824, p3826.ClassName)))
                end
            else
                return v_u_3.err(v_u_3825, p3826, (("expected %*, got %*"):format(v_u_3824, (typeof(p3826)))))
            end
        end,
        ["_format"] = function(p3827, _, _)
            return v_u_2(v_u_3824, p3827[v_u_3825])
        end
    }
    local v3828 = v_u_4
    local v3829 = v_u_3825
    return setmetatable(v3829, v3828)
end
local v_u_3830 = "TextChatMessage"
function v5.TextChatMessage()
    local v_u_3831 = nil
    v_u_3831 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3832)
            if typeof(p3832) == "Instance" then
                if p3832:IsA(v_u_3830) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3831, p3832, (("expected %*, got %*"):format(v_u_3830, p3832.ClassName)))
                end
            else
                return v_u_3.err(v_u_3831, p3832, (("expected %*, got %*"):format(v_u_3830, (typeof(p3832)))))
            end
        end,
        ["_format"] = function(p3833, _, _)
            return v_u_2(v_u_3830, p3833[v_u_3831])
        end
    }
    local v3834 = v_u_4
    local v3835 = v_u_3831
    return setmetatable(v3835, v3834)
end
local v_u_3836 = "TextChatMessageProperties"
function v5.TextChatMessageProperties()
    local v_u_3837 = nil
    v_u_3837 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3838)
            if typeof(p3838) == "Instance" then
                if p3838:IsA(v_u_3836) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3837, p3838, (("expected %*, got %*"):format(v_u_3836, p3838.ClassName)))
                end
            else
                return v_u_3.err(v_u_3837, p3838, (("expected %*, got %*"):format(v_u_3836, (typeof(p3838)))))
            end
        end,
        ["_format"] = function(p3839, _, _)
            return v_u_2(v_u_3836, p3839[v_u_3837])
        end
    }
    local v3840 = v_u_4
    local v3841 = v_u_3837
    return setmetatable(v3841, v3840)
end
local v_u_3842 = "TextChatService"
function v5.TextChatService()
    local v_u_3843 = nil
    v_u_3843 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3844)
            if typeof(p3844) == "Instance" then
                if p3844:IsA(v_u_3842) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3843, p3844, (("expected %*, got %*"):format(v_u_3842, p3844.ClassName)))
                end
            else
                return v_u_3.err(v_u_3843, p3844, (("expected %*, got %*"):format(v_u_3842, (typeof(p3844)))))
            end
        end,
        ["_format"] = function(p3845, _, _)
            return v_u_2(v_u_3842, p3845[v_u_3843])
        end
    }
    local v3846 = v_u_4
    local v3847 = v_u_3843
    return setmetatable(v3847, v3846)
end
local v_u_3848 = "TextFilterResult"
function v5.TextFilterResult()
    local v_u_3849 = nil
    v_u_3849 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3850)
            if typeof(p3850) == "Instance" then
                if p3850:IsA(v_u_3848) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3849, p3850, (("expected %*, got %*"):format(v_u_3848, p3850.ClassName)))
                end
            else
                return v_u_3.err(v_u_3849, p3850, (("expected %*, got %*"):format(v_u_3848, (typeof(p3850)))))
            end
        end,
        ["_format"] = function(p3851, _, _)
            return v_u_2(v_u_3848, p3851[v_u_3849])
        end
    }
    local v3852 = v_u_4
    local v3853 = v_u_3849
    return setmetatable(v3853, v3852)
end
local v_u_3854 = "TextFilterTranslatedResult"
function v5.TextFilterTranslatedResult()
    local v_u_3855 = nil
    v_u_3855 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3856)
            if typeof(p3856) == "Instance" then
                if p3856:IsA(v_u_3854) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3855, p3856, (("expected %*, got %*"):format(v_u_3854, p3856.ClassName)))
                end
            else
                return v_u_3.err(v_u_3855, p3856, (("expected %*, got %*"):format(v_u_3854, (typeof(p3856)))))
            end
        end,
        ["_format"] = function(p3857, _, _)
            return v_u_2(v_u_3854, p3857[v_u_3855])
        end
    }
    local v3858 = v_u_4
    local v3859 = v_u_3855
    return setmetatable(v3859, v3858)
end
local v_u_3860 = "TextService"
function v5.TextService()
    local v_u_3861 = nil
    v_u_3861 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3862)
            if typeof(p3862) == "Instance" then
                if p3862:IsA(v_u_3860) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3861, p3862, (("expected %*, got %*"):format(v_u_3860, p3862.ClassName)))
                end
            else
                return v_u_3.err(v_u_3861, p3862, (("expected %*, got %*"):format(v_u_3860, (typeof(p3862)))))
            end
        end,
        ["_format"] = function(p3863, _, _)
            return v_u_2(v_u_3860, p3863[v_u_3861])
        end
    }
    local v3864 = v_u_4
    local v3865 = v_u_3861
    return setmetatable(v3865, v3864)
end
local v_u_3866 = "TextSource"
function v5.TextSource()
    local v_u_3867 = nil
    v_u_3867 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3868)
            if typeof(p3868) == "Instance" then
                if p3868:IsA(v_u_3866) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3867, p3868, (("expected %*, got %*"):format(v_u_3866, p3868.ClassName)))
                end
            else
                return v_u_3.err(v_u_3867, p3868, (("expected %*, got %*"):format(v_u_3866, (typeof(p3868)))))
            end
        end,
        ["_format"] = function(p3869, _, _)
            return v_u_2(v_u_3866, p3869[v_u_3867])
        end
    }
    local v3870 = v_u_4
    local v3871 = v_u_3867
    return setmetatable(v3871, v3870)
end
local v_u_3872 = "ThirdPartyUserService"
function v5.ThirdPartyUserService()
    local v_u_3873 = nil
    v_u_3873 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3874)
            if typeof(p3874) == "Instance" then
                if p3874:IsA(v_u_3872) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3873, p3874, (("expected %*, got %*"):format(v_u_3872, p3874.ClassName)))
                end
            else
                return v_u_3.err(v_u_3873, p3874, (("expected %*, got %*"):format(v_u_3872, (typeof(p3874)))))
            end
        end,
        ["_format"] = function(p3875, _, _)
            return v_u_2(v_u_3872, p3875[v_u_3873])
        end
    }
    local v3876 = v_u_4
    local v3877 = v_u_3873
    return setmetatable(v3877, v3876)
end
local v_u_3878 = "ThreadState"
function v5.ThreadState()
    local v_u_3879 = nil
    v_u_3879 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3880)
            if typeof(p3880) == "Instance" then
                if p3880:IsA(v_u_3878) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3879, p3880, (("expected %*, got %*"):format(v_u_3878, p3880.ClassName)))
                end
            else
                return v_u_3.err(v_u_3879, p3880, (("expected %*, got %*"):format(v_u_3878, (typeof(p3880)))))
            end
        end,
        ["_format"] = function(p3881, _, _)
            return v_u_2(v_u_3878, p3881[v_u_3879])
        end
    }
    local v3882 = v_u_4
    local v3883 = v_u_3879
    return setmetatable(v3883, v3882)
end
local v_u_3884 = "TimerService"
function v5.TimerService()
    local v_u_3885 = nil
    v_u_3885 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3886)
            if typeof(p3886) == "Instance" then
                if p3886:IsA(v_u_3884) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3885, p3886, (("expected %*, got %*"):format(v_u_3884, p3886.ClassName)))
                end
            else
                return v_u_3.err(v_u_3885, p3886, (("expected %*, got %*"):format(v_u_3884, (typeof(p3886)))))
            end
        end,
        ["_format"] = function(p3887, _, _)
            return v_u_2(v_u_3884, p3887[v_u_3885])
        end
    }
    local v3888 = v_u_4
    local v3889 = v_u_3885
    return setmetatable(v3889, v3888)
end
local v_u_3890 = "ToastNotificationService"
function v5.ToastNotificationService()
    local v_u_3891 = nil
    v_u_3891 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3892)
            if typeof(p3892) == "Instance" then
                if p3892:IsA(v_u_3890) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3891, p3892, (("expected %*, got %*"):format(v_u_3890, p3892.ClassName)))
                end
            else
                return v_u_3.err(v_u_3891, p3892, (("expected %*, got %*"):format(v_u_3890, (typeof(p3892)))))
            end
        end,
        ["_format"] = function(p3893, _, _)
            return v_u_2(v_u_3890, p3893[v_u_3891])
        end
    }
    local v3894 = v_u_4
    local v3895 = v_u_3891
    return setmetatable(v3895, v3894)
end
local v_u_3896 = "TouchInputService"
function v5.TouchInputService()
    local v_u_3897 = nil
    v_u_3897 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3898)
            if typeof(p3898) == "Instance" then
                if p3898:IsA(v_u_3896) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3897, p3898, (("expected %*, got %*"):format(v_u_3896, p3898.ClassName)))
                end
            else
                return v_u_3.err(v_u_3897, p3898, (("expected %*, got %*"):format(v_u_3896, (typeof(p3898)))))
            end
        end,
        ["_format"] = function(p3899, _, _)
            return v_u_2(v_u_3896, p3899[v_u_3897])
        end
    }
    local v3900 = v_u_4
    local v3901 = v_u_3897
    return setmetatable(v3901, v3900)
end
local v_u_3902 = "TouchTransmitter"
function v5.TouchTransmitter()
    local v_u_3903 = nil
    v_u_3903 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3904)
            if typeof(p3904) == "Instance" then
                if p3904:IsA(v_u_3902) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3903, p3904, (("expected %*, got %*"):format(v_u_3902, p3904.ClassName)))
                end
            else
                return v_u_3.err(v_u_3903, p3904, (("expected %*, got %*"):format(v_u_3902, (typeof(p3904)))))
            end
        end,
        ["_format"] = function(p3905, _, _)
            return v_u_2(v_u_3902, p3905[v_u_3903])
        end
    }
    local v3906 = v_u_4
    local v3907 = v_u_3903
    return setmetatable(v3907, v3906)
end
local v_u_3908 = "TracerService"
function v5.TracerService()
    local v_u_3909 = nil
    v_u_3909 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3910)
            if typeof(p3910) == "Instance" then
                if p3910:IsA(v_u_3908) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3909, p3910, (("expected %*, got %*"):format(v_u_3908, p3910.ClassName)))
                end
            else
                return v_u_3.err(v_u_3909, p3910, (("expected %*, got %*"):format(v_u_3908, (typeof(p3910)))))
            end
        end,
        ["_format"] = function(p3911, _, _)
            return v_u_2(v_u_3908, p3911[v_u_3909])
        end
    }
    local v3912 = v_u_4
    local v3913 = v_u_3909
    return setmetatable(v3913, v3912)
end
local v_u_3914 = "TrackerLodController"
function v5.TrackerLodController()
    local v_u_3915 = nil
    v_u_3915 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3916)
            if typeof(p3916) == "Instance" then
                if p3916:IsA(v_u_3914) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3915, p3916, (("expected %*, got %*"):format(v_u_3914, p3916.ClassName)))
                end
            else
                return v_u_3.err(v_u_3915, p3916, (("expected %*, got %*"):format(v_u_3914, (typeof(p3916)))))
            end
        end,
        ["_format"] = function(p3917, _, _)
            return v_u_2(v_u_3914, p3917[v_u_3915])
        end
    }
    local v3918 = v_u_4
    local v3919 = v_u_3915
    return setmetatable(v3919, v3918)
end
local v_u_3920 = "TrackerStreamAnimation"
function v5.TrackerStreamAnimation()
    local v_u_3921 = nil
    v_u_3921 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3922)
            if typeof(p3922) == "Instance" then
                if p3922:IsA(v_u_3920) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3921, p3922, (("expected %*, got %*"):format(v_u_3920, p3922.ClassName)))
                end
            else
                return v_u_3.err(v_u_3921, p3922, (("expected %*, got %*"):format(v_u_3920, (typeof(p3922)))))
            end
        end,
        ["_format"] = function(p3923, _, _)
            return v_u_2(v_u_3920, p3923[v_u_3921])
        end
    }
    local v3924 = v_u_4
    local v3925 = v_u_3921
    return setmetatable(v3925, v3924)
end
local v_u_3926 = "Trail"
function v5.Trail()
    local v_u_3927 = nil
    v_u_3927 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3928)
            if typeof(p3928) == "Instance" then
                if p3928:IsA(v_u_3926) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3927, p3928, (("expected %*, got %*"):format(v_u_3926, p3928.ClassName)))
                end
            else
                return v_u_3.err(v_u_3927, p3928, (("expected %*, got %*"):format(v_u_3926, (typeof(p3928)))))
            end
        end,
        ["_format"] = function(p3929, _, _)
            return v_u_2(v_u_3926, p3929[v_u_3927])
        end
    }
    local v3930 = v_u_4
    local v3931 = v_u_3927
    return setmetatable(v3931, v3930)
end
local v_u_3932 = "Translator"
function v5.Translator()
    local v_u_3933 = nil
    v_u_3933 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3934)
            if typeof(p3934) == "Instance" then
                if p3934:IsA(v_u_3932) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3933, p3934, (("expected %*, got %*"):format(v_u_3932, p3934.ClassName)))
                end
            else
                return v_u_3.err(v_u_3933, p3934, (("expected %*, got %*"):format(v_u_3932, (typeof(p3934)))))
            end
        end,
        ["_format"] = function(p3935, _, _)
            return v_u_2(v_u_3932, p3935[v_u_3933])
        end
    }
    local v3936 = v_u_4
    local v3937 = v_u_3933
    return setmetatable(v3937, v3936)
end
local v_u_3938 = "TutorialService"
function v5.TutorialService()
    local v_u_3939 = nil
    v_u_3939 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3940)
            if typeof(p3940) == "Instance" then
                if p3940:IsA(v_u_3938) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3939, p3940, (("expected %*, got %*"):format(v_u_3938, p3940.ClassName)))
                end
            else
                return v_u_3.err(v_u_3939, p3940, (("expected %*, got %*"):format(v_u_3938, (typeof(p3940)))))
            end
        end,
        ["_format"] = function(p3941, _, _)
            return v_u_2(v_u_3938, p3941[v_u_3939])
        end
    }
    local v3942 = v_u_4
    local v3943 = v_u_3939
    return setmetatable(v3943, v3942)
end
local v_u_3944 = "TweenBase"
function v5.TweenBase()
    local v_u_3945 = nil
    v_u_3945 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3946)
            if typeof(p3946) == "Instance" then
                if p3946:IsA(v_u_3944) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3945, p3946, (("expected %*, got %*"):format(v_u_3944, p3946.ClassName)))
                end
            else
                return v_u_3.err(v_u_3945, p3946, (("expected %*, got %*"):format(v_u_3944, (typeof(p3946)))))
            end
        end,
        ["_format"] = function(p3947, _, _)
            return v_u_2(v_u_3944, p3947[v_u_3945])
        end
    }
    local v3948 = v_u_4
    local v3949 = v_u_3945
    return setmetatable(v3949, v3948)
end
local v_u_3950 = "Tween"
function v5.Tween()
    local v_u_3951 = nil
    v_u_3951 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3952)
            if typeof(p3952) == "Instance" then
                if p3952:IsA(v_u_3950) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3951, p3952, (("expected %*, got %*"):format(v_u_3950, p3952.ClassName)))
                end
            else
                return v_u_3.err(v_u_3951, p3952, (("expected %*, got %*"):format(v_u_3950, (typeof(p3952)))))
            end
        end,
        ["_format"] = function(p3953, _, _)
            return v_u_2(v_u_3950, p3953[v_u_3951])
        end
    }
    local v3954 = v_u_4
    local v3955 = v_u_3951
    return setmetatable(v3955, v3954)
end
local v_u_3956 = "TweenService"
function v5.TweenService()
    local v_u_3957 = nil
    v_u_3957 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3958)
            if typeof(p3958) == "Instance" then
                if p3958:IsA(v_u_3956) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3957, p3958, (("expected %*, got %*"):format(v_u_3956, p3958.ClassName)))
                end
            else
                return v_u_3.err(v_u_3957, p3958, (("expected %*, got %*"):format(v_u_3956, (typeof(p3958)))))
            end
        end,
        ["_format"] = function(p3959, _, _)
            return v_u_2(v_u_3956, p3959[v_u_3957])
        end
    }
    local v3960 = v_u_4
    local v3961 = v_u_3957
    return setmetatable(v3961, v3960)
end
local v_u_3962 = "UGCAvatarService"
function v5.UGCAvatarService()
    local v_u_3963 = nil
    v_u_3963 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3964)
            if typeof(p3964) == "Instance" then
                if p3964:IsA(v_u_3962) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3963, p3964, (("expected %*, got %*"):format(v_u_3962, p3964.ClassName)))
                end
            else
                return v_u_3.err(v_u_3963, p3964, (("expected %*, got %*"):format(v_u_3962, (typeof(p3964)))))
            end
        end,
        ["_format"] = function(p3965, _, _)
            return v_u_2(v_u_3962, p3965[v_u_3963])
        end
    }
    local v3966 = v_u_4
    local v3967 = v_u_3963
    return setmetatable(v3967, v3966)
end
local v_u_3968 = "UGCValidationService"
function v5.UGCValidationService()
    local v_u_3969 = nil
    v_u_3969 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3970)
            if typeof(p3970) == "Instance" then
                if p3970:IsA(v_u_3968) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3969, p3970, (("expected %*, got %*"):format(v_u_3968, p3970.ClassName)))
                end
            else
                return v_u_3.err(v_u_3969, p3970, (("expected %*, got %*"):format(v_u_3968, (typeof(p3970)))))
            end
        end,
        ["_format"] = function(p3971, _, _)
            return v_u_2(v_u_3968, p3971[v_u_3969])
        end
    }
    local v3972 = v_u_4
    local v3973 = v_u_3969
    return setmetatable(v3973, v3972)
end
local v_u_3974 = "UIBase"
function v5.UIBase()
    local v_u_3975 = nil
    v_u_3975 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3976)
            if typeof(p3976) == "Instance" then
                if p3976:IsA(v_u_3974) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3975, p3976, (("expected %*, got %*"):format(v_u_3974, p3976.ClassName)))
                end
            else
                return v_u_3.err(v_u_3975, p3976, (("expected %*, got %*"):format(v_u_3974, (typeof(p3976)))))
            end
        end,
        ["_format"] = function(p3977, _, _)
            return v_u_2(v_u_3974, p3977[v_u_3975])
        end
    }
    local v3978 = v_u_4
    local v3979 = v_u_3975
    return setmetatable(v3979, v3978)
end
local v_u_3980 = "UIComponent"
function v5.UIComponent()
    local v_u_3981 = nil
    v_u_3981 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3982)
            if typeof(p3982) == "Instance" then
                if p3982:IsA(v_u_3980) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3981, p3982, (("expected %*, got %*"):format(v_u_3980, p3982.ClassName)))
                end
            else
                return v_u_3.err(v_u_3981, p3982, (("expected %*, got %*"):format(v_u_3980, (typeof(p3982)))))
            end
        end,
        ["_format"] = function(p3983, _, _)
            return v_u_2(v_u_3980, p3983[v_u_3981])
        end
    }
    local v3984 = v_u_4
    local v3985 = v_u_3981
    return setmetatable(v3985, v3984)
end
local v_u_3986 = "UIConstraint"
function v5.UIConstraint()
    local v_u_3987 = nil
    v_u_3987 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3988)
            if typeof(p3988) == "Instance" then
                if p3988:IsA(v_u_3986) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3987, p3988, (("expected %*, got %*"):format(v_u_3986, p3988.ClassName)))
                end
            else
                return v_u_3.err(v_u_3987, p3988, (("expected %*, got %*"):format(v_u_3986, (typeof(p3988)))))
            end
        end,
        ["_format"] = function(p3989, _, _)
            return v_u_2(v_u_3986, p3989[v_u_3987])
        end
    }
    local v3990 = v_u_4
    local v3991 = v_u_3987
    return setmetatable(v3991, v3990)
end
local v_u_3992 = "UIAspectRatioConstraint"
function v5.UIAspectRatioConstraint()
    local v_u_3993 = nil
    v_u_3993 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p3994)
            if typeof(p3994) == "Instance" then
                if p3994:IsA(v_u_3992) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3993, p3994, (("expected %*, got %*"):format(v_u_3992, p3994.ClassName)))
                end
            else
                return v_u_3.err(v_u_3993, p3994, (("expected %*, got %*"):format(v_u_3992, (typeof(p3994)))))
            end
        end,
        ["_format"] = function(p3995, _, _)
            return v_u_2(v_u_3992, p3995[v_u_3993])
        end
    }
    local v3996 = v_u_4
    local v3997 = v_u_3993
    return setmetatable(v3997, v3996)
end
local v_u_3998 = "UISizeConstraint"
function v5.UISizeConstraint()
    local v_u_3999 = nil
    v_u_3999 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4000)
            if typeof(p4000) == "Instance" then
                if p4000:IsA(v_u_3998) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_3999, p4000, (("expected %*, got %*"):format(v_u_3998, p4000.ClassName)))
                end
            else
                return v_u_3.err(v_u_3999, p4000, (("expected %*, got %*"):format(v_u_3998, (typeof(p4000)))))
            end
        end,
        ["_format"] = function(p4001, _, _)
            return v_u_2(v_u_3998, p4001[v_u_3999])
        end
    }
    local v4002 = v_u_4
    local v4003 = v_u_3999
    return setmetatable(v4003, v4002)
end
local v_u_4004 = "UITextSizeConstraint"
function v5.UITextSizeConstraint()
    local v_u_4005 = nil
    v_u_4005 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4006)
            if typeof(p4006) == "Instance" then
                if p4006:IsA(v_u_4004) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4005, p4006, (("expected %*, got %*"):format(v_u_4004, p4006.ClassName)))
                end
            else
                return v_u_3.err(v_u_4005, p4006, (("expected %*, got %*"):format(v_u_4004, (typeof(p4006)))))
            end
        end,
        ["_format"] = function(p4007, _, _)
            return v_u_2(v_u_4004, p4007[v_u_4005])
        end
    }
    local v4008 = v_u_4
    local v4009 = v_u_4005
    return setmetatable(v4009, v4008)
end
local v_u_4010 = "UICorner"
function v5.UICorner()
    local v_u_4011 = nil
    v_u_4011 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4012)
            if typeof(p4012) == "Instance" then
                if p4012:IsA(v_u_4010) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4011, p4012, (("expected %*, got %*"):format(v_u_4010, p4012.ClassName)))
                end
            else
                return v_u_3.err(v_u_4011, p4012, (("expected %*, got %*"):format(v_u_4010, (typeof(p4012)))))
            end
        end,
        ["_format"] = function(p4013, _, _)
            return v_u_2(v_u_4010, p4013[v_u_4011])
        end
    }
    local v4014 = v_u_4
    local v4015 = v_u_4011
    return setmetatable(v4015, v4014)
end
local v_u_4016 = "UIFlexItem"
function v5.UIFlexItem()
    local v_u_4017 = nil
    v_u_4017 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4018)
            if typeof(p4018) == "Instance" then
                if p4018:IsA(v_u_4016) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4017, p4018, (("expected %*, got %*"):format(v_u_4016, p4018.ClassName)))
                end
            else
                return v_u_3.err(v_u_4017, p4018, (("expected %*, got %*"):format(v_u_4016, (typeof(p4018)))))
            end
        end,
        ["_format"] = function(p4019, _, _)
            return v_u_2(v_u_4016, p4019[v_u_4017])
        end
    }
    local v4020 = v_u_4
    local v4021 = v_u_4017
    return setmetatable(v4021, v4020)
end
local v_u_4022 = "UIGradient"
function v5.UIGradient()
    local v_u_4023 = nil
    v_u_4023 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4024)
            if typeof(p4024) == "Instance" then
                if p4024:IsA(v_u_4022) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4023, p4024, (("expected %*, got %*"):format(v_u_4022, p4024.ClassName)))
                end
            else
                return v_u_3.err(v_u_4023, p4024, (("expected %*, got %*"):format(v_u_4022, (typeof(p4024)))))
            end
        end,
        ["_format"] = function(p4025, _, _)
            return v_u_2(v_u_4022, p4025[v_u_4023])
        end
    }
    local v4026 = v_u_4
    local v4027 = v_u_4023
    return setmetatable(v4027, v4026)
end
local v_u_4028 = "UILayout"
function v5.UILayout()
    local v_u_4029 = nil
    v_u_4029 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4030)
            if typeof(p4030) == "Instance" then
                if p4030:IsA(v_u_4028) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4029, p4030, (("expected %*, got %*"):format(v_u_4028, p4030.ClassName)))
                end
            else
                return v_u_3.err(v_u_4029, p4030, (("expected %*, got %*"):format(v_u_4028, (typeof(p4030)))))
            end
        end,
        ["_format"] = function(p4031, _, _)
            return v_u_2(v_u_4028, p4031[v_u_4029])
        end
    }
    local v4032 = v_u_4
    local v4033 = v_u_4029
    return setmetatable(v4033, v4032)
end
local v_u_4034 = "UIGridStyleLayout"
function v5.UIGridStyleLayout()
    local v_u_4035 = nil
    v_u_4035 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4036)
            if typeof(p4036) == "Instance" then
                if p4036:IsA(v_u_4034) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4035, p4036, (("expected %*, got %*"):format(v_u_4034, p4036.ClassName)))
                end
            else
                return v_u_3.err(v_u_4035, p4036, (("expected %*, got %*"):format(v_u_4034, (typeof(p4036)))))
            end
        end,
        ["_format"] = function(p4037, _, _)
            return v_u_2(v_u_4034, p4037[v_u_4035])
        end
    }
    local v4038 = v_u_4
    local v4039 = v_u_4035
    return setmetatable(v4039, v4038)
end
local v_u_4040 = "UIGridLayout"
function v5.UIGridLayout()
    local v_u_4041 = nil
    v_u_4041 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4042)
            if typeof(p4042) == "Instance" then
                if p4042:IsA(v_u_4040) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4041, p4042, (("expected %*, got %*"):format(v_u_4040, p4042.ClassName)))
                end
            else
                return v_u_3.err(v_u_4041, p4042, (("expected %*, got %*"):format(v_u_4040, (typeof(p4042)))))
            end
        end,
        ["_format"] = function(p4043, _, _)
            return v_u_2(v_u_4040, p4043[v_u_4041])
        end
    }
    local v4044 = v_u_4
    local v4045 = v_u_4041
    return setmetatable(v4045, v4044)
end
local v_u_4046 = "UIListLayout"
function v5.UIListLayout()
    local v_u_4047 = nil
    v_u_4047 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4048)
            if typeof(p4048) == "Instance" then
                if p4048:IsA(v_u_4046) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4047, p4048, (("expected %*, got %*"):format(v_u_4046, p4048.ClassName)))
                end
            else
                return v_u_3.err(v_u_4047, p4048, (("expected %*, got %*"):format(v_u_4046, (typeof(p4048)))))
            end
        end,
        ["_format"] = function(p4049, _, _)
            return v_u_2(v_u_4046, p4049[v_u_4047])
        end
    }
    local v4050 = v_u_4
    local v4051 = v_u_4047
    return setmetatable(v4051, v4050)
end
local v_u_4052 = "UIPageLayout"
function v5.UIPageLayout()
    local v_u_4053 = nil
    v_u_4053 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4054)
            if typeof(p4054) == "Instance" then
                if p4054:IsA(v_u_4052) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4053, p4054, (("expected %*, got %*"):format(v_u_4052, p4054.ClassName)))
                end
            else
                return v_u_3.err(v_u_4053, p4054, (("expected %*, got %*"):format(v_u_4052, (typeof(p4054)))))
            end
        end,
        ["_format"] = function(p4055, _, _)
            return v_u_2(v_u_4052, p4055[v_u_4053])
        end
    }
    local v4056 = v_u_4
    local v4057 = v_u_4053
    return setmetatable(v4057, v4056)
end
local v_u_4058 = "UITableLayout"
function v5.UITableLayout()
    local v_u_4059 = nil
    v_u_4059 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4060)
            if typeof(p4060) == "Instance" then
                if p4060:IsA(v_u_4058) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4059, p4060, (("expected %*, got %*"):format(v_u_4058, p4060.ClassName)))
                end
            else
                return v_u_3.err(v_u_4059, p4060, (("expected %*, got %*"):format(v_u_4058, (typeof(p4060)))))
            end
        end,
        ["_format"] = function(p4061, _, _)
            return v_u_2(v_u_4058, p4061[v_u_4059])
        end
    }
    local v4062 = v_u_4
    local v4063 = v_u_4059
    return setmetatable(v4063, v4062)
end
local v_u_4064 = "UIPadding"
function v5.UIPadding()
    local v_u_4065 = nil
    v_u_4065 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4066)
            if typeof(p4066) == "Instance" then
                if p4066:IsA(v_u_4064) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4065, p4066, (("expected %*, got %*"):format(v_u_4064, p4066.ClassName)))
                end
            else
                return v_u_3.err(v_u_4065, p4066, (("expected %*, got %*"):format(v_u_4064, (typeof(p4066)))))
            end
        end,
        ["_format"] = function(p4067, _, _)
            return v_u_2(v_u_4064, p4067[v_u_4065])
        end
    }
    local v4068 = v_u_4
    local v4069 = v_u_4065
    return setmetatable(v4069, v4068)
end
local v_u_4070 = "UIScale"
function v5.UIScale()
    local v_u_4071 = nil
    v_u_4071 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4072)
            if typeof(p4072) == "Instance" then
                if p4072:IsA(v_u_4070) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4071, p4072, (("expected %*, got %*"):format(v_u_4070, p4072.ClassName)))
                end
            else
                return v_u_3.err(v_u_4071, p4072, (("expected %*, got %*"):format(v_u_4070, (typeof(p4072)))))
            end
        end,
        ["_format"] = function(p4073, _, _)
            return v_u_2(v_u_4070, p4073[v_u_4071])
        end
    }
    local v4074 = v_u_4
    local v4075 = v_u_4071
    return setmetatable(v4075, v4074)
end
local v_u_4076 = "UIStroke"
function v5.UIStroke()
    local v_u_4077 = nil
    v_u_4077 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4078)
            if typeof(p4078) == "Instance" then
                if p4078:IsA(v_u_4076) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4077, p4078, (("expected %*, got %*"):format(v_u_4076, p4078.ClassName)))
                end
            else
                return v_u_3.err(v_u_4077, p4078, (("expected %*, got %*"):format(v_u_4076, (typeof(p4078)))))
            end
        end,
        ["_format"] = function(p4079, _, _)
            return v_u_2(v_u_4076, p4079[v_u_4077])
        end
    }
    local v4080 = v_u_4
    local v4081 = v_u_4077
    return setmetatable(v4081, v4080)
end
local v_u_4082 = "UnvalidatedAssetService"
function v5.UnvalidatedAssetService()
    local v_u_4083 = nil
    v_u_4083 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4084)
            if typeof(p4084) == "Instance" then
                if p4084:IsA(v_u_4082) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4083, p4084, (("expected %*, got %*"):format(v_u_4082, p4084.ClassName)))
                end
            else
                return v_u_3.err(v_u_4083, p4084, (("expected %*, got %*"):format(v_u_4082, (typeof(p4084)))))
            end
        end,
        ["_format"] = function(p4085, _, _)
            return v_u_2(v_u_4082, p4085[v_u_4083])
        end
    }
    local v4086 = v_u_4
    local v4087 = v_u_4083
    return setmetatable(v4087, v4086)
end
local v_u_4088 = "UserGameSettings"
function v5.UserGameSettings()
    local v_u_4089 = nil
    v_u_4089 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4090)
            if typeof(p4090) == "Instance" then
                if p4090:IsA(v_u_4088) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4089, p4090, (("expected %*, got %*"):format(v_u_4088, p4090.ClassName)))
                end
            else
                return v_u_3.err(v_u_4089, p4090, (("expected %*, got %*"):format(v_u_4088, (typeof(p4090)))))
            end
        end,
        ["_format"] = function(p4091, _, _)
            return v_u_2(v_u_4088, p4091[v_u_4089])
        end
    }
    local v4092 = v_u_4
    local v4093 = v_u_4089
    return setmetatable(v4093, v4092)
end
local v_u_4094 = "UserInputService"
function v5.UserInputService()
    local v_u_4095 = nil
    v_u_4095 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4096)
            if typeof(p4096) == "Instance" then
                if p4096:IsA(v_u_4094) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4095, p4096, (("expected %*, got %*"):format(v_u_4094, p4096.ClassName)))
                end
            else
                return v_u_3.err(v_u_4095, p4096, (("expected %*, got %*"):format(v_u_4094, (typeof(p4096)))))
            end
        end,
        ["_format"] = function(p4097, _, _)
            return v_u_2(v_u_4094, p4097[v_u_4095])
        end
    }
    local v4098 = v_u_4
    local v4099 = v_u_4095
    return setmetatable(v4099, v4098)
end
local v_u_4100 = "UserService"
function v5.UserService()
    local v_u_4101 = nil
    v_u_4101 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4102)
            if typeof(p4102) == "Instance" then
                if p4102:IsA(v_u_4100) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4101, p4102, (("expected %*, got %*"):format(v_u_4100, p4102.ClassName)))
                end
            else
                return v_u_3.err(v_u_4101, p4102, (("expected %*, got %*"):format(v_u_4100, (typeof(p4102)))))
            end
        end,
        ["_format"] = function(p4103, _, _)
            return v_u_2(v_u_4100, p4103[v_u_4101])
        end
    }
    local v4104 = v_u_4
    local v4105 = v_u_4101
    return setmetatable(v4105, v4104)
end
local v_u_4106 = "VRService"
function v5.VRService()
    local v_u_4107 = nil
    v_u_4107 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4108)
            if typeof(p4108) == "Instance" then
                if p4108:IsA(v_u_4106) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4107, p4108, (("expected %*, got %*"):format(v_u_4106, p4108.ClassName)))
                end
            else
                return v_u_3.err(v_u_4107, p4108, (("expected %*, got %*"):format(v_u_4106, (typeof(p4108)))))
            end
        end,
        ["_format"] = function(p4109, _, _)
            return v_u_2(v_u_4106, p4109[v_u_4107])
        end
    }
    local v4110 = v_u_4
    local v4111 = v_u_4107
    return setmetatable(v4111, v4110)
end
local v_u_4112 = "VRStatusService"
function v5.VRStatusService()
    local v_u_4113 = nil
    v_u_4113 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4114)
            if typeof(p4114) == "Instance" then
                if p4114:IsA(v_u_4112) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4113, p4114, (("expected %*, got %*"):format(v_u_4112, p4114.ClassName)))
                end
            else
                return v_u_3.err(v_u_4113, p4114, (("expected %*, got %*"):format(v_u_4112, (typeof(p4114)))))
            end
        end,
        ["_format"] = function(p4115, _, _)
            return v_u_2(v_u_4112, p4115[v_u_4113])
        end
    }
    local v4116 = v_u_4
    local v4117 = v_u_4113
    return setmetatable(v4117, v4116)
end
local v_u_4118 = "ValueBase"
function v5.ValueBase()
    local v_u_4119 = nil
    v_u_4119 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4120)
            if typeof(p4120) == "Instance" then
                if p4120:IsA(v_u_4118) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4119, p4120, (("expected %*, got %*"):format(v_u_4118, p4120.ClassName)))
                end
            else
                return v_u_3.err(v_u_4119, p4120, (("expected %*, got %*"):format(v_u_4118, (typeof(p4120)))))
            end
        end,
        ["_format"] = function(p4121, _, _)
            return v_u_2(v_u_4118, p4121[v_u_4119])
        end
    }
    local v4122 = v_u_4
    local v4123 = v_u_4119
    return setmetatable(v4123, v4122)
end
local v_u_4124 = "BinaryStringValue"
function v5.BinaryStringValue()
    local v_u_4125 = nil
    v_u_4125 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4126)
            if typeof(p4126) == "Instance" then
                if p4126:IsA(v_u_4124) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4125, p4126, (("expected %*, got %*"):format(v_u_4124, p4126.ClassName)))
                end
            else
                return v_u_3.err(v_u_4125, p4126, (("expected %*, got %*"):format(v_u_4124, (typeof(p4126)))))
            end
        end,
        ["_format"] = function(p4127, _, _)
            return v_u_2(v_u_4124, p4127[v_u_4125])
        end
    }
    local v4128 = v_u_4
    local v4129 = v_u_4125
    return setmetatable(v4129, v4128)
end
local v_u_4130 = "BoolValue"
function v5.BoolValue()
    local v_u_4131 = nil
    v_u_4131 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4132)
            if typeof(p4132) == "Instance" then
                if p4132:IsA(v_u_4130) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4131, p4132, (("expected %*, got %*"):format(v_u_4130, p4132.ClassName)))
                end
            else
                return v_u_3.err(v_u_4131, p4132, (("expected %*, got %*"):format(v_u_4130, (typeof(p4132)))))
            end
        end,
        ["_format"] = function(p4133, _, _)
            return v_u_2(v_u_4130, p4133[v_u_4131])
        end
    }
    local v4134 = v_u_4
    local v4135 = v_u_4131
    return setmetatable(v4135, v4134)
end
local v_u_4136 = "BrickColorValue"
function v5.BrickColorValue()
    local v_u_4137 = nil
    v_u_4137 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4138)
            if typeof(p4138) == "Instance" then
                if p4138:IsA(v_u_4136) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4137, p4138, (("expected %*, got %*"):format(v_u_4136, p4138.ClassName)))
                end
            else
                return v_u_3.err(v_u_4137, p4138, (("expected %*, got %*"):format(v_u_4136, (typeof(p4138)))))
            end
        end,
        ["_format"] = function(p4139, _, _)
            return v_u_2(v_u_4136, p4139[v_u_4137])
        end
    }
    local v4140 = v_u_4
    local v4141 = v_u_4137
    return setmetatable(v4141, v4140)
end
local v_u_4142 = "CFrameValue"
function v5.CFrameValue()
    local v_u_4143 = nil
    v_u_4143 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4144)
            if typeof(p4144) == "Instance" then
                if p4144:IsA(v_u_4142) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4143, p4144, (("expected %*, got %*"):format(v_u_4142, p4144.ClassName)))
                end
            else
                return v_u_3.err(v_u_4143, p4144, (("expected %*, got %*"):format(v_u_4142, (typeof(p4144)))))
            end
        end,
        ["_format"] = function(p4145, _, _)
            return v_u_2(v_u_4142, p4145[v_u_4143])
        end
    }
    local v4146 = v_u_4
    local v4147 = v_u_4143
    return setmetatable(v4147, v4146)
end
local v_u_4148 = "Color3Value"
function v5.Color3Value()
    local v_u_4149 = nil
    v_u_4149 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4150)
            if typeof(p4150) == "Instance" then
                if p4150:IsA(v_u_4148) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4149, p4150, (("expected %*, got %*"):format(v_u_4148, p4150.ClassName)))
                end
            else
                return v_u_3.err(v_u_4149, p4150, (("expected %*, got %*"):format(v_u_4148, (typeof(p4150)))))
            end
        end,
        ["_format"] = function(p4151, _, _)
            return v_u_2(v_u_4148, p4151[v_u_4149])
        end
    }
    local v4152 = v_u_4
    local v4153 = v_u_4149
    return setmetatable(v4153, v4152)
end
local v_u_4154 = "DoubleConstrainedValue"
function v5.DoubleConstrainedValue()
    local v_u_4155 = nil
    v_u_4155 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4156)
            if typeof(p4156) == "Instance" then
                if p4156:IsA(v_u_4154) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4155, p4156, (("expected %*, got %*"):format(v_u_4154, p4156.ClassName)))
                end
            else
                return v_u_3.err(v_u_4155, p4156, (("expected %*, got %*"):format(v_u_4154, (typeof(p4156)))))
            end
        end,
        ["_format"] = function(p4157, _, _)
            return v_u_2(v_u_4154, p4157[v_u_4155])
        end
    }
    local v4158 = v_u_4
    local v4159 = v_u_4155
    return setmetatable(v4159, v4158)
end
local v_u_4160 = "IntConstrainedValue"
function v5.IntConstrainedValue()
    local v_u_4161 = nil
    v_u_4161 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4162)
            if typeof(p4162) == "Instance" then
                if p4162:IsA(v_u_4160) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4161, p4162, (("expected %*, got %*"):format(v_u_4160, p4162.ClassName)))
                end
            else
                return v_u_3.err(v_u_4161, p4162, (("expected %*, got %*"):format(v_u_4160, (typeof(p4162)))))
            end
        end,
        ["_format"] = function(p4163, _, _)
            return v_u_2(v_u_4160, p4163[v_u_4161])
        end
    }
    local v4164 = v_u_4
    local v4165 = v_u_4161
    return setmetatable(v4165, v4164)
end
local v_u_4166 = "IntValue"
function v5.IntValue()
    local v_u_4167 = nil
    v_u_4167 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4168)
            if typeof(p4168) == "Instance" then
                if p4168:IsA(v_u_4166) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4167, p4168, (("expected %*, got %*"):format(v_u_4166, p4168.ClassName)))
                end
            else
                return v_u_3.err(v_u_4167, p4168, (("expected %*, got %*"):format(v_u_4166, (typeof(p4168)))))
            end
        end,
        ["_format"] = function(p4169, _, _)
            return v_u_2(v_u_4166, p4169[v_u_4167])
        end
    }
    local v4170 = v_u_4
    local v4171 = v_u_4167
    return setmetatable(v4171, v4170)
end
local v_u_4172 = "NumberValue"
function v5.NumberValue()
    local v_u_4173 = nil
    v_u_4173 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4174)
            if typeof(p4174) == "Instance" then
                if p4174:IsA(v_u_4172) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4173, p4174, (("expected %*, got %*"):format(v_u_4172, p4174.ClassName)))
                end
            else
                return v_u_3.err(v_u_4173, p4174, (("expected %*, got %*"):format(v_u_4172, (typeof(p4174)))))
            end
        end,
        ["_format"] = function(p4175, _, _)
            return v_u_2(v_u_4172, p4175[v_u_4173])
        end
    }
    local v4176 = v_u_4
    local v4177 = v_u_4173
    return setmetatable(v4177, v4176)
end
local v_u_4178 = "ObjectValue"
function v5.ObjectValue()
    local v_u_4179 = nil
    v_u_4179 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4180)
            if typeof(p4180) == "Instance" then
                if p4180:IsA(v_u_4178) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4179, p4180, (("expected %*, got %*"):format(v_u_4178, p4180.ClassName)))
                end
            else
                return v_u_3.err(v_u_4179, p4180, (("expected %*, got %*"):format(v_u_4178, (typeof(p4180)))))
            end
        end,
        ["_format"] = function(p4181, _, _)
            return v_u_2(v_u_4178, p4181[v_u_4179])
        end
    }
    local v4182 = v_u_4
    local v4183 = v_u_4179
    return setmetatable(v4183, v4182)
end
local v_u_4184 = "RayValue"
function v5.RayValue()
    local v_u_4185 = nil
    v_u_4185 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4186)
            if typeof(p4186) == "Instance" then
                if p4186:IsA(v_u_4184) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4185, p4186, (("expected %*, got %*"):format(v_u_4184, p4186.ClassName)))
                end
            else
                return v_u_3.err(v_u_4185, p4186, (("expected %*, got %*"):format(v_u_4184, (typeof(p4186)))))
            end
        end,
        ["_format"] = function(p4187, _, _)
            return v_u_2(v_u_4184, p4187[v_u_4185])
        end
    }
    local v4188 = v_u_4
    local v4189 = v_u_4185
    return setmetatable(v4189, v4188)
end
local v_u_4190 = "StringValue"
function v5.StringValue()
    local v_u_4191 = nil
    v_u_4191 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4192)
            if typeof(p4192) == "Instance" then
                if p4192:IsA(v_u_4190) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4191, p4192, (("expected %*, got %*"):format(v_u_4190, p4192.ClassName)))
                end
            else
                return v_u_3.err(v_u_4191, p4192, (("expected %*, got %*"):format(v_u_4190, (typeof(p4192)))))
            end
        end,
        ["_format"] = function(p4193, _, _)
            return v_u_2(v_u_4190, p4193[v_u_4191])
        end
    }
    local v4194 = v_u_4
    local v4195 = v_u_4191
    return setmetatable(v4195, v4194)
end
local v_u_4196 = "Vector3Value"
function v5.Vector3Value()
    local v_u_4197 = nil
    v_u_4197 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4198)
            if typeof(p4198) == "Instance" then
                if p4198:IsA(v_u_4196) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4197, p4198, (("expected %*, got %*"):format(v_u_4196, p4198.ClassName)))
                end
            else
                return v_u_3.err(v_u_4197, p4198, (("expected %*, got %*"):format(v_u_4196, (typeof(p4198)))))
            end
        end,
        ["_format"] = function(p4199, _, _)
            return v_u_2(v_u_4196, p4199[v_u_4197])
        end
    }
    local v4200 = v_u_4
    local v4201 = v_u_4197
    return setmetatable(v4201, v4200)
end
local v_u_4202 = "Vector3Curve"
function v5.Vector3Curve()
    local v_u_4203 = nil
    v_u_4203 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4204)
            if typeof(p4204) == "Instance" then
                if p4204:IsA(v_u_4202) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4203, p4204, (("expected %*, got %*"):format(v_u_4202, p4204.ClassName)))
                end
            else
                return v_u_3.err(v_u_4203, p4204, (("expected %*, got %*"):format(v_u_4202, (typeof(p4204)))))
            end
        end,
        ["_format"] = function(p4205, _, _)
            return v_u_2(v_u_4202, p4205[v_u_4203])
        end
    }
    local v4206 = v_u_4
    local v4207 = v_u_4203
    return setmetatable(v4207, v4206)
end
local v_u_4208 = "VersionControlService"
function v5.VersionControlService()
    local v_u_4209 = nil
    v_u_4209 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4210)
            if typeof(p4210) == "Instance" then
                if p4210:IsA(v_u_4208) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4209, p4210, (("expected %*, got %*"):format(v_u_4208, p4210.ClassName)))
                end
            else
                return v_u_3.err(v_u_4209, p4210, (("expected %*, got %*"):format(v_u_4208, (typeof(p4210)))))
            end
        end,
        ["_format"] = function(p4211, _, _)
            return v_u_2(v_u_4208, p4211[v_u_4209])
        end
    }
    local v4212 = v_u_4
    local v4213 = v_u_4209
    return setmetatable(v4213, v4212)
end
local v_u_4214 = "VideoCaptureService"
function v5.VideoCaptureService()
    local v_u_4215 = nil
    v_u_4215 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4216)
            if typeof(p4216) == "Instance" then
                if p4216:IsA(v_u_4214) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4215, p4216, (("expected %*, got %*"):format(v_u_4214, p4216.ClassName)))
                end
            else
                return v_u_3.err(v_u_4215, p4216, (("expected %*, got %*"):format(v_u_4214, (typeof(p4216)))))
            end
        end,
        ["_format"] = function(p4217, _, _)
            return v_u_2(v_u_4214, p4217[v_u_4215])
        end
    }
    local v4218 = v_u_4
    local v4219 = v_u_4215
    return setmetatable(v4219, v4218)
end
local v_u_4220 = "VideoService"
function v5.VideoService()
    local v_u_4221 = nil
    v_u_4221 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4222)
            if typeof(p4222) == "Instance" then
                if p4222:IsA(v_u_4220) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4221, p4222, (("expected %*, got %*"):format(v_u_4220, p4222.ClassName)))
                end
            else
                return v_u_3.err(v_u_4221, p4222, (("expected %*, got %*"):format(v_u_4220, (typeof(p4222)))))
            end
        end,
        ["_format"] = function(p4223, _, _)
            return v_u_2(v_u_4220, p4223[v_u_4221])
        end
    }
    local v4224 = v_u_4
    local v4225 = v_u_4221
    return setmetatable(v4225, v4224)
end
local v_u_4226 = "VirtualInputManager"
function v5.VirtualInputManager()
    local v_u_4227 = nil
    v_u_4227 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4228)
            if typeof(p4228) == "Instance" then
                if p4228:IsA(v_u_4226) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4227, p4228, (("expected %*, got %*"):format(v_u_4226, p4228.ClassName)))
                end
            else
                return v_u_3.err(v_u_4227, p4228, (("expected %*, got %*"):format(v_u_4226, (typeof(p4228)))))
            end
        end,
        ["_format"] = function(p4229, _, _)
            return v_u_2(v_u_4226, p4229[v_u_4227])
        end
    }
    local v4230 = v_u_4
    local v4231 = v_u_4227
    return setmetatable(v4231, v4230)
end
local v_u_4232 = "VirtualUser"
function v5.VirtualUser()
    local v_u_4233 = nil
    v_u_4233 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4234)
            if typeof(p4234) == "Instance" then
                if p4234:IsA(v_u_4232) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4233, p4234, (("expected %*, got %*"):format(v_u_4232, p4234.ClassName)))
                end
            else
                return v_u_3.err(v_u_4233, p4234, (("expected %*, got %*"):format(v_u_4232, (typeof(p4234)))))
            end
        end,
        ["_format"] = function(p4235, _, _)
            return v_u_2(v_u_4232, p4235[v_u_4233])
        end
    }
    local v4236 = v_u_4
    local v4237 = v_u_4233
    return setmetatable(v4237, v4236)
end
local v_u_4238 = "VisibilityCheckDispatcher"
function v5.VisibilityCheckDispatcher()
    local v_u_4239 = nil
    v_u_4239 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4240)
            if typeof(p4240) == "Instance" then
                if p4240:IsA(v_u_4238) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4239, p4240, (("expected %*, got %*"):format(v_u_4238, p4240.ClassName)))
                end
            else
                return v_u_3.err(v_u_4239, p4240, (("expected %*, got %*"):format(v_u_4238, (typeof(p4240)))))
            end
        end,
        ["_format"] = function(p4241, _, _)
            return v_u_2(v_u_4238, p4241[v_u_4239])
        end
    }
    local v4242 = v_u_4
    local v4243 = v_u_4239
    return setmetatable(v4243, v4242)
end
local v_u_4244 = "Visit"
function v5.Visit()
    local v_u_4245 = nil
    v_u_4245 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4246)
            if typeof(p4246) == "Instance" then
                if p4246:IsA(v_u_4244) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4245, p4246, (("expected %*, got %*"):format(v_u_4244, p4246.ClassName)))
                end
            else
                return v_u_3.err(v_u_4245, p4246, (("expected %*, got %*"):format(v_u_4244, (typeof(p4246)))))
            end
        end,
        ["_format"] = function(p4247, _, _)
            return v_u_2(v_u_4244, p4247[v_u_4245])
        end
    }
    local v4248 = v_u_4
    local v4249 = v_u_4245
    return setmetatable(v4249, v4248)
end
local v_u_4250 = "VoiceChatInternal"
function v5.VoiceChatInternal()
    local v_u_4251 = nil
    v_u_4251 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4252)
            if typeof(p4252) == "Instance" then
                if p4252:IsA(v_u_4250) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4251, p4252, (("expected %*, got %*"):format(v_u_4250, p4252.ClassName)))
                end
            else
                return v_u_3.err(v_u_4251, p4252, (("expected %*, got %*"):format(v_u_4250, (typeof(p4252)))))
            end
        end,
        ["_format"] = function(p4253, _, _)
            return v_u_2(v_u_4250, p4253[v_u_4251])
        end
    }
    local v4254 = v_u_4
    local v4255 = v_u_4251
    return setmetatable(v4255, v4254)
end
local v_u_4256 = "VoiceChatService"
function v5.VoiceChatService()
    local v_u_4257 = nil
    v_u_4257 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4258)
            if typeof(p4258) == "Instance" then
                if p4258:IsA(v_u_4256) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4257, p4258, (("expected %*, got %*"):format(v_u_4256, p4258.ClassName)))
                end
            else
                return v_u_3.err(v_u_4257, p4258, (("expected %*, got %*"):format(v_u_4256, (typeof(p4258)))))
            end
        end,
        ["_format"] = function(p4259, _, _)
            return v_u_2(v_u_4256, p4259[v_u_4257])
        end
    }
    local v4260 = v_u_4
    local v4261 = v_u_4257
    return setmetatable(v4261, v4260)
end
local v_u_4262 = "WeldConstraint"
function v5.WeldConstraint()
    local v_u_4263 = nil
    v_u_4263 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4264)
            if typeof(p4264) == "Instance" then
                if p4264:IsA(v_u_4262) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4263, p4264, (("expected %*, got %*"):format(v_u_4262, p4264.ClassName)))
                end
            else
                return v_u_3.err(v_u_4263, p4264, (("expected %*, got %*"):format(v_u_4262, (typeof(p4264)))))
            end
        end,
        ["_format"] = function(p4265, _, _)
            return v_u_2(v_u_4262, p4265[v_u_4263])
        end
    }
    local v4266 = v_u_4
    local v4267 = v_u_4263
    return setmetatable(v4267, v4266)
end
local v_u_4268 = "Wire"
function v5.Wire()
    local v_u_4269 = nil
    v_u_4269 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4270)
            if typeof(p4270) == "Instance" then
                if p4270:IsA(v_u_4268) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4269, p4270, (("expected %*, got %*"):format(v_u_4268, p4270.ClassName)))
                end
            else
                return v_u_3.err(v_u_4269, p4270, (("expected %*, got %*"):format(v_u_4268, (typeof(p4270)))))
            end
        end,
        ["_format"] = function(p4271, _, _)
            return v_u_2(v_u_4268, p4271[v_u_4269])
        end
    }
    local v4272 = v_u_4
    local v4273 = v_u_4269
    return setmetatable(v4273, v4272)
end
local v_u_4274 = "PathWaypoint"
function v5.PathWaypoint()
    local v_u_4275 = nil
    v_u_4275 = {
        ["kind"] = "InstanceIsA",
        ["class"] = v_u_19,
        ["_matches"] = function(p4276)
            if typeof(p4276) == "Instance" then
                if p4276:IsA(v_u_4274) then
                    return v_u_3.ok()
                else
                    return v_u_3.err(v_u_4275, p4276, (("expected %*, got %*"):format(v_u_4274, p4276.ClassName)))
                end
            else
                return v_u_3.err(v_u_4275, p4276, (("expected %*, got %*"):format(v_u_4274, (typeof(p4276)))))
            end
        end,
        ["_format"] = function(p4277, _, _)
            return v_u_2(v_u_4274, p4277[v_u_4275])
        end
    }
    local v4278 = v_u_4
    local v4279 = v_u_4275
    return setmetatable(v4279, v4278)
end
return v5