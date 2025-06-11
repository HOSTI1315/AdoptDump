--// ReplicatedStorage.SharedModules.TimeZoneHelper (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.SharedPackages.t)
local v_u_3 = {
    ["PST"] = -8,
    ["PDT"] = -7,
    ["MST"] = -7,
    ["MDT"] = -6,
    ["CST"] = -6,
    ["CDT"] = -5,
    ["EST"] = -5,
    ["EDT"] = -4,
    ["GMT"] = 0,
    ["BST"] = 1,
    ["UTC"] = 0
}
local v_u_4 = {
    ["PT"] = {
        ["rule"] = "USA",
        ["st"] = "PST",
        ["dt"] = "PDT"
    },
    ["MT"] = {
        ["rule"] = "USA",
        ["st"] = "MST",
        ["dt"] = "MDT"
    },
    ["CT"] = {
        ["rule"] = "USA",
        ["st"] = "CST",
        ["dt"] = "CDT"
    },
    ["ET"] = {
        ["rule"] = "USA",
        ["st"] = "EST",
        ["dt"] = "EDT"
    },
    ["UK"] = {
        ["rule"] = "UK",
        ["st"] = "GMT",
        ["dt"] = "BST"
    }
}
local v_u_5 = {
    ["region_validation"] = v2.union(v2.literal("PT"), v2.literal("MT"), v2.literal("CT"), v2.literal("ET"), v2.literal("UK"))
}
local v_u_6 = {}
local function v_u_13(p7, p8, p9)
    local v10, v11
    if p9 < 0 then
        p9 = -p9
        v10 = os.date("!*t", os.time({
            ["year"] = p7,
            ["month"] = p8 + 1,
            ["day"] = -1
        })).day
        v11 = -1
    else
        v10 = 1
        v11 = 1
    end
    local v12 = 0
    while true do
        if os.date("!*t", os.time({
            ["year"] = p7,
            ["month"] = p8,
            ["day"] = v10
        })).wday == 1 then
            v12 = v12 + 1
            if p9 <= v12 then
                return v10
            end
        end
        v10 = v10 + v11
    end
end
function v_u_6.USA(p14, p15, p16)
    local v17 = os.date("!*t", os.time({
        ["year"] = p14,
        ["month"] = p15,
        ["day"] = p16
    }))
    local v18 = os.date("!*t", os.time({
        ["year"] = p14,
        ["month"] = 3,
        ["day"] = v_u_13(p14, 3, 2)
    }))
    local v19 = os.date("!*t", os.time({
        ["year"] = p14,
        ["month"] = 11,
        ["day"] = v_u_13(p14, 11, 1)
    }))
    return (v17.yday < v18.yday or v17.yday >= v19.yday) and "st" or "dt"
end
function v_u_6.UK(p20, p21, p22)
    local v23 = os.date("!*t", os.time({
        ["year"] = p20,
        ["month"] = p21,
        ["day"] = p22
    }))
    local v24 = os.date("!*t", os.time({
        ["year"] = p20,
        ["month"] = 3,
        ["day"] = v_u_13(p20, 3, -1)
    }))
    local v25 = os.date("!*t", os.time({
        ["year"] = p20,
        ["month"] = 10,
        ["day"] = v_u_13(p20, 10, -1)
    }))
    return (v23.yday < v24.yday or v23.yday >= v25.yday) and "st" or "dt"
end
function v_u_5.get_timezone_at_date(p26, p27, p28, p29)
    local v30 = v_u_4[p26]
    assert(v30, "Invalid region id specified.")
    local v31 = v_u_6[v30.rule]
    assert(v31, ("No specified time zone rule for %s regions"):format(p26))
    return v30[v31(p27, p28, p29)]
end
function v_u_5.get_timezone_offset(p32)
    local v33 = v_u_3[p32]
    assert(v33, "Invalid/unnsupported timezone passed")
    return v_u_3[p32]
end
function v_u_5.from_utc_offset(p34, p35)
    return os.time({
        ["year"] = p35.year,
        ["month"] = p35.month,
        ["day"] = p35.day,
        ["hour"] = (p35.hour or 0) - p34,
        ["min"] = p35.min,
        ["sec"] = p35.sec
    })
end
function v_u_5.from_utc_offset_datetime(p36, p37, p38, p39, p40, p41, p42, p43)
    local v44 = v_u_5.from_utc_offset(p36, {
        ["year"] = p37 or 1970,
        ["month"] = p38 or 1,
        ["day"] = p39 or 1,
        ["hour"] = p40 or 0,
        ["min"] = p41 or 0,
        ["sec"] = p42 or 0
    })
    return DateTime.fromUnixTimestampMillis(v44 * 1000 + (p43 or 0))
end
function v_u_5.from_timezone(p45, p46)
    local v47 = v_u_3[p45]
    assert(v47, "Invalid/unnsupported timezone passed")
    return v_u_5.from_utc_offset(v_u_3[p45], p46)
end
function v_u_5.from_timezone_datetime(p48, p49, p50, p51, p52, p53, p54, p55)
    local v56 = v_u_3[p48]
    assert(v56, "Invalid/unnsupported timezone passed")
    return v_u_5.from_utc_offset_datetime(v_u_3[p48], p49, p50, p51, p52, p53, p54, p55)
end
function v_u_5.from_region(p57, p58)
    local v59 = v_u_5.get_timezone_at_date(p57, p58.year or 1970, p58.month or 1, p58.day or 1)
    return v_u_5.from_timezone(v59, p58)
end
function v_u_5.from_region_datetime(p60, p61, p62, p63, p64, p65, p66, p67)
    local v68 = v_u_5.get_timezone_at_date(p60, p61 or 1970, p62 or 1, p63 or 1)
    return v_u_5.from_timezone_datetime(v68, p61, p62, p63, p64, p65, p66, p67)
end
return v_u_5