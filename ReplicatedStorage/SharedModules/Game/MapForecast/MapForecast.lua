--// ReplicatedStorage.SharedModules.Game.MapForecast (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("LiveOpsMapSwap")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("package:t")
local v_u_5 = {}
local v_u_6 = {
    ["Default"] = "Default",
    ["Desert"] = "Desert",
    ["Fall"] = "Fall",
    ["Snow"] = "Snow",
    ["Rain"] = "Rain",
    ["Summerfest"] = "Default",
    ["Springfest"] = "Default",
    ["Xmas"] = "Snow",
    ["Halloween"] = "Fall"
}
local v7 = {
    ["1 @ 00:00:00"] = "Default",
    ["15 @ 15:00:00"] = "Desert",
    ["17 @ 03:00:00"] = "Default",
    ["20 @ 15:00:00"] = "Fall",
    ["22 @ 03:00:00"] = "Default",
    ["23 @ 15:00:00"] = "Rain",
    ["25 @ 03:00:00"] = "Default",
    ["28 @ 15:00:00"] = "Snow",
    ["30 @ 03:00:00"] = "Default"
}
v_u_5["2028-3"] = {
    ["1 @ 00:00:00"] = "Snow",
    ["1 @ 15:00:00"] = "Default",
    ["15 @ 15:00:00"] = "Desert",
    ["17 @ 03:00:00"] = "Default",
    ["20 @ 15:00:00"] = "Fall",
    ["22 @ 03:00:00"] = "Default",
    ["23 @ 15:00:00"] = "Rain",
    ["25 @ 03:00:00"] = "Default",
    ["28 @ 15:00:00"] = "Snow",
    ["30 @ 03:00:00"] = "Default"
}
v_u_5["2025-6"] = {
    ["1 @ 00:00:00"] = "Default",
    ["28 @ 15:00:00"] = "Snow",
    ["30 @ 03:00:00"] = "Default"
}
local v_u_8 = {
    ["January"] = v7,
    ["February"] = {
        ["1 @ 00:00:00"] = "Default",
        ["15 @ 15:00:00"] = "Desert",
        ["17 @ 03:00:00"] = "Default",
        ["20 @ 15:00:00"] = "Fall",
        ["22 @ 03:00:00"] = "Default",
        ["23 @ 15:00:00"] = "Rain",
        ["25 @ 03:00:00"] = "Default",
        ["28 @ 15:00:00"] = "Snow"
    },
    ["March"] = {
        ["1 @ 00:00:00"] = "Snow",
        ["2 @ 4:00:00"] = "Default",
        ["15 @ 15:00:00"] = "Desert",
        ["17 @ 03:00:00"] = "Default",
        ["20 @ 15:00:00"] = "Fall",
        ["22 @ 03:00:00"] = "Default",
        ["23 @ 15:00:00"] = "Rain",
        ["25 @ 03:00:00"] = "Default",
        ["28 @ 15:00:00"] = "Snow",
        ["30 @ 03:00:00"] = "Default"
    },
    ["April"] = v7,
    ["May"] = v7,
    ["June"] = v7,
    ["July"] = v7,
    ["August"] = v7,
    ["September"] = v7,
    ["October"] = v7,
    ["November"] = v7,
    ["December"] = v7
}
local v_u_9 = {
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
}
local v_u_10 = {
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
}
local v11 = {}
local function v_u_30(p12, p13, p14)
    local v15 = v_u_10[p13]
    if p13 == 2 then
        local v16
        if p12 % 4 == 0 then
            v16 = p12 % 100 ~= 0 and true or p12 % 400 == 0
        else
            v16 = false
        end
        v15 = v16 and 29 or v15
    end
    local v17 = v_u_4.tuple(v_u_4.every(v_u_4.numberMin(0), v_u_4.integer), v_u_4.every(v_u_4.numberConstrained(0, 59), v_u_4.integer), v_u_4.every(v_u_4.numberConstrained(0, 59), v_u_4.integer), v_u_4.every(v_u_4.numberConstrained(1, v15), v_u_4.integer))
    for v18, v19 in pairs(p14) do
        local v20 = v_u_6[v19]
        local v21, v22, v23, v24 = v18:match("(%d+) @ (%d+):(%d+):(%d+)")
        local v25 = tonumber(v21)
        local v26 = tonumber(v22)
        local v27 = tonumber(v23)
        local v28 = tonumber(v24)
        assert(v20, "No map type defined for weather")
        assert(v17(v26, v27, v28, v25))
        local v29 = v_u_2.is_valid_map_type
        assert(v29(v20))
    end
end
local function v_u_38()
    for v31, v32 in pairs(v_u_5) do
        local v33, v34 = unpack(v31:split("-"))
        v_u_30(tonumber(v33), tonumber(v34), v32)
    end
    for v35, v36 in pairs(v_u_8) do
        local v37 = table.find(v_u_9, v35)
        if v37 then
            v_u_30(2021, v37, v36)
        else
            error("No month by name of " .. v35)
        end
    end
end
local function v_u_59(p39, p40)
    local v41 = v_u_5[("%d-%d"):format(p39, p40)] or v_u_8[v_u_9[p40]]
    local v42 = {}
    for v43, v44 in pairs(v41) do
        local v45 = v_u_6[v44]
        local v46, v47, v48, v49 = v43:match("(%d+) @ (%d+):(%d+):(%d+)")
        local v50 = tonumber(v46)
        local v51 = tonumber(v47)
        local v52 = tonumber(v48)
        local v53 = tonumber(v49)
        local v54 = {
            ["timestamp"] = (v50 - 1) * 24 * 60 * 60 + v51 * 60 * 60 + v52 * 60 + v53,
            ["weather"] = v44,
            ["map_type"] = v45,
            ["month"] = p40,
            ["year"] = p39
        }
        table.insert(v42, v54)
    end
    table.sort(v42, function(p55, p56)
        return p55.timestamp < p56.timestamp
    end)
    for v57, v58 in ipairs(v42) do
        v58.index = v57
    end
    return v42
end
local function v_u_65(p60, p61, p62)
    local v63 = os.time({
        ["year"] = p60,
        ["month"] = p61 + p62,
        ["day"] = 1
    })
    local v64 = os.date("!*t", v63)
    return v64.year, v64.month
end
local function v_u_75(p66)
    local v67 = DateTime.fromUnixTimestamp(p66):ToUniversalTime()
    local v68 = v67.Year
    local v69 = v67.Month
    local v70 = v_u_59(v68, v69)
    local v71 = (v67.Day - 1) * 24 * 60 * 60 + v67.Hour * 60 * 60 + v67.Minute * 60 + v67.Second
    if not v70[1] or v70[1].timestamp > v71 then
        repeat
            v68, v69 = v_u_65(v68, v69, -1)
            local v72 = v_u_59(v68, v69)
        until #v72 > 0
        return v72[#v72]
    end
    local v73 = nil
    for _, v74 in ipairs(v70) do
        if v71 < v74.timestamp then
            break
        end
        v73 = v74
    end
    return v73
end
local function v_u_90(p76, p77, p78)
    local v79 = v_u_75(p76)
    local v80 = v79.year
    local v81 = v79.month
    local v82 = v_u_59(v80, v81)
    local v83 = { v79 }
    while #v83 < p77 do
        local v84
        if v79.index == #v82 then
            repeat
                v80, v81 = v_u_65(v80, v81, 1)
                v82 = v_u_59(v80, v81)
            until #v82 > 0
            v84 = v82[1]
        else
            v84 = v82[v79.index + 1]
        end
        local v85 = nil
        if p78 then
            if v84.weather ~= v79.weather then
                v85 = v84
            end
        else
            v85 = v84
        end
        if v85 then
            table.insert(v83, v85)
            v79 = v84
        else
            v79 = v84
        end
    end
    return v_u_3.List.map(v83, function(p86, p87)
        local v88 = DateTime.fromUniversalTime(p86.year, p86.month, 1, 0, 0, 0, 0).UnixTimestamp
        local v89 = v_u_3.Dictionary.copy(p86)
        v89.index = p87
        v89.timestamp = v88 + p86.timestamp
        return v89
    end)
end
function v11.get_forecast(p91, p92)
    return v_u_90(p91, p92, false)
end
function v11.get_unique_forecast(p93, p94)
    return v_u_90(p93, p94, true)
end
function v11.init()
    v_u_38()
end
return v11