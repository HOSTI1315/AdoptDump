--// ReplicatedStorage.SharedModules.Debug (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("tpcall")
local v_u_3 = v_u_1("Flags")
local v_u_10 = {
    ["print_on_flag"] = function(p4, ...)
        if v_u_1("Flags")[p4] then
            print(...)
        end
    end,
    ["pcall_print_error"] = function(p5)
        return v_u_10.pcall_warn_error(p5)
    end,
    ["pcall_warn_error"] = function(p6)
        local v7, v8, v9 = v_u_2(p6)
        if not v7 then
            warn(("tpcall failed: %s\nStack Trace\n%s"):format(tostring(v8), (tostring(v9))))
        end
        return v7, v8
    end
}
local v_u_11 = v_u_1("package:Sift").Set.fromArray({
    "spec",
    "story",
    "storybook",
    "bench",
    "t",
    "d"
})
local function v_u_16(p12)
    local v13 = debug.info(p12 + 1, "s") or "unknown"
    local v14, v15 = string.match(v13, "([^%.]*)%.([^%.]*)$")
    if v14 and v15 then
        if v_u_11[v15] then
            return ("%*.%*"):format(v14, v15)
        else
            return v15
        end
    else
        return string.match(v13, "([^%.]*)$") or v13
    end
end
local v_u_17 = nil
function v_u_10.create_log(p18)
    local v_u_19 = v_u_16(2)
    local v_u_20 = ("[%*]"):format(v_u_19)
    if p18 then
        v_u_17 = v_u_17 or {}
        v_u_17[v_u_19] = true
        warn("[Debug] Script", v_u_19, "is set to exclusively log")
    end
    return function(...)
        if v_u_3.printall and (not v_u_17 or v_u_17[v_u_19]) then
            print(v_u_20, ...)
        end
    end
end
local function v_u_21() end
function v_u_10.create_debug_log(p22, p23)
    if not p23 then
        return v_u_21
    end
    local v_u_24 = ("[%*] [debug] [%*]"):format(v_u_16(2), p22)
    return function(...)
        print(v_u_24, ...)
    end
end
function v_u_10.benchmark(p25, p26, p27, p28)
    local v29 = v_u_1("Flags")
    local v30 = tick()
    local v31 = { p25() }
    local v32 = tick() - v30
    if p27 == nil or v29[p27] then
        print("[" .. p26 .. ":" .. v32 .. "s]", unpack(p28))
    end
    return unpack(v31)
end
return v_u_10