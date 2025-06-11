--// ReplicatedStorage.Fsys (ModuleScript)

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
if v_u_3:IsClient() then
    local v4 = game:IsLoaded()
    assert(v4, "Your code attempted to use Fsys before the game loaded wait in init.client.lua.\nThis module would be unsafe to use before the game is loaded.")
    require(v1.Load.AwaitPersistentModels).await()
    while not v2:GetAttribute("ServerInitDone") do
        v2:GetAttributeChangedSignal("ServerInitDone"):Wait()
    end
end
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = v_u_3:IsServer()
local v_u_11 = tick()
local v_u_12 = game:GetService("ServerScriptService"):FindFirstChild("ServerPackages")
local v_u_13 = game:GetService("ReplicatedStorage"):WaitForChild("SharedPackages")
local function v_u_14()
    return {
        game.ServerScriptService.Routes,
        game.ServerScriptService.DB,
        game.ServerScriptService.Modules,
        game.ServerScriptService.Services,
        game.ServerScriptService.ServerPackages,
        game.ReplicatedStorage.SharedPackages
    }
end
local v_u_15 = {
    game.ReplicatedStorage.ClientDB,
    game.ReplicatedStorage.SharedModules,
    game.ReplicatedStorage.ClientServices,
    game.ReplicatedStorage.ClientModules,
    game.ReplicatedStorage.SharedPackages
}
local v_u_16 = { game.ReplicatedStorage.ClientDB, game.ReplicatedStorage.SharedModules }
local v_u_17
if v_u_3:IsServer() then
    v_u_17 = game.ServerScriptService.new.modules
else
    v_u_17 = game.ReplicatedStorage.new.modules
end
local v_u_18 = { "_Index" }
local v_u_19 = require(v_u_17.ExecutionTimeLogger)
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = { ".spec", ".bench" }
local function v_u_29(p23)
    local v24 = ""
    for _, v25 in v_u_22 do
        local v26 = -#v25
        if string.sub(p23, v26) == v25 then
            local v27 = -#v25 - 1
            p23 = string.sub(p23, 1, v27)
            v24 = v25
            break
        end
    end
    local v28 = p23:match("([^%.]+)$")
    if v28 == nil then
        return nil
    else
        return v28 .. v24
    end
end
local v_u_30 = ""
function v_u_8.get_log()
    return v_u_30
end
function v_u_8.add_child_blacklist(p31)
    v_u_9[p31] = true
end
local function v_u_34(p32)
    if p32:IsA("ModuleScript") then
        if v_u_10 and p32:IsDescendantOf(v_u_12) or p32:IsDescendantOf(v_u_13) then
            v_u_5["package:" .. p32.Name] = p32
        else
            v_u_5[p32.Name] = p32
        end
    else
        if not v_u_9[p32.Name] then
            for _, v33 in pairs(p32:GetChildren()) do
                v_u_34(v33)
            end
        end
        return
    end
end
local function v_u_37()
    local v35 = {}
    for _, v36 in v_u_17:GetDescendants() do
        if v36:IsA("ModuleScript") then
            v35[v36.Name] = (v35[v36.Name] or 0) + 1
            if v35[v36.Name] > 1 then
                v_u_7[("new:%*"):format(v36.Name)] = nil
            else
                v_u_7[("new:%*"):format(v36.Name)] = v36
            end
        end
    end
end
v_u_8.add_modules = v_u_34
function v_u_8.load(p38, p39)
    local v40 = v_u_29((debug.info(2, "s")))
    if v40 ~= nil then
        local v41 = p38:match("^[^:]*:([^/]*)") or p38:match("^([^/]*)")
        if not v_u_21[v40] then
            v_u_21[v40] = {}
        end
        v_u_21[v40][v41] = true
    end
    local v42 = string.find(p38, "package:") and true or p39
    if v_u_7[p38] then
        return require(v_u_7[p38])
    end
    local v43 = string.split(p38, "/")
    local v_u_44 = table.remove(v43, 1)
    while v_u_6[v_u_44] == "loading" do
        task.wait()
    end
    if v_u_6[v_u_44] == nil then
        local v45 = tick()
        v_u_6[v_u_44] = "loading"
        local v_u_46 = false
        local v_u_47 = nil
        delay(5, function()
            if not v_u_46 then
                local v48 = "Fsys.load(\"" .. v_u_5[v_u_44]:GetFullName() .. "\") taking longer than expected"
                warn(v48)
                v_u_30 = v_u_30 .. (v48 or "") .. "\n"
                local v49 = debug.traceback(v_u_47)
                warn(v49)
                v_u_30 = v_u_30 .. (v49 or "") .. "\n"
                if v_u_3:IsServer() then
                    local v50 = require(game.ServerScriptService.ServerPackages.Stash)
                    local v51
                    if v_u_47 then
                        v51 = debug.traceback(v_u_47)
                    else
                        v51 = nil
                    end
                    v50:into("errorlog"):log("Fsys:Load", {
                        ["error_message"] = v48,
                        ["stack_trace"] = v51
                    })
                end
            end
        end)
        local v_u_52 = v_u_5[v_u_44]
        local v_u_53
        if v_u_52 == nil then
            v_u_53 = v_u_47
            for _, v54 in { "new:", "package:" } do
                if v_u_5[v54 .. v_u_44] or v_u_7[v54 .. v_u_44] then
                    error((("module %* not found. (Module %*%* exists. Did you mean to use %*%*?)"):format(v_u_44, v54, v_u_44, v54, v_u_44)))
                end
            end
            error((("module %* not found"):format(v_u_44)))
        else
            v_u_53 = v_u_47
        end
        debug.setmemorycategory(v_u_52.Name)
        local v_u_55 = ("%* (require)"):format(v_u_44)
        local v_u_56 = ("%* (init)"):format(v_u_44)
        local v57 = p38:match("^[^:]*:([^/]*)") or p38:match("^([^/]*)")
        local v_u_58 = ("%* (require)"):format(v57)
        local v_u_59 = ("%* (init)"):format(v57)
        local v_u_60 = false
        local v_u_61 = Instance.new("BindableEvent")
        local function v_u_62()
            v_u_60 = true
            v_u_61:Fire()
        end
        local function v63()
            if not v_u_60 then
                v_u_61.Event:Wait()
            end
        end
        local v64 = os.clock()
        local v_u_65 = nil
        task.spawn(function()
            local v_u_66 = "[Fsys] REQUIRE " .. v_u_44 .. " failed: %ERROR"
            local function v68()
                v_u_53 = coroutine.running()
                v_u_19.start(v_u_55)
                local v67 = os.clock()
                v_u_65 = require(v_u_52)
                v_u_20[v_u_58] = os.clock() - v67
                v_u_62()
            end
            local v_u_69 = true
            local v_u_70 = nil
            local v_u_71 = false
            xpcall(v68, function(p72)
                local v73 = v_u_66:gsub("%%ERROR", (tostring(p72)))
                v_u_69 = false
                v_u_70 = v73
                if v_u_71 then
                    warn("ERROR: " .. v_u_70 .. "\n" .. debug.traceback())
                end
            end)
            if not v_u_69 then
                debug.setmemorycategory("post-Fsys-error")
                error(v_u_70)
            end
        end)
        v_u_19.checkpoint_yielded(v_u_55)
        v63()
        if not v42 then
            local v74 = v_u_65
            if typeof(v74) == "table" and v_u_65.init then
                local v_u_75 = false
                local v_u_76 = Instance.new("BindableEvent")
                local function v_u_77()
                    v_u_75 = true
                    v_u_76:Fire()
                end
                local function v78()
                    if not v_u_75 then
                        v_u_76.Event:Wait()
                    end
                end
                task.spawn(function()
                    local v_u_79 = "[Fsys] INIT " .. v_u_44 .. " failed: %ERROR"
                    local function v81()
                        v_u_53 = coroutine.running()
                        v_u_19.start(v_u_56)
                        local v80 = os.clock()
                        v_u_65.init()
                        v_u_20[v_u_59] = os.clock() - v80
                        v_u_77()
                    end
                    local v_u_82 = true
                    local v_u_83 = nil
                    local v_u_84 = true
                    xpcall(v81, function(p85)
                        local v86 = v_u_79:gsub("%%ERROR", (tostring(p85)))
                        v_u_82 = false
                        v_u_83 = v86
                        if v_u_84 then
                            warn("ERROR: " .. v_u_83 .. "\n" .. debug.traceback())
                        end
                    end)
                    if not v_u_82 then
                        debug.setmemorycategory("post-Fsys-error")
                        error(v_u_83)
                    end
                end)
                v_u_19.checkpoint_yielded(v_u_56)
                v78()
            end
        end
        v_u_46 = true
        v_u_20[v57] = os.clock() - v64
        local v87 = v_u_10 and "Server" or "Client"
        local v88 = (tick() - v_u_11) * 1000
        local v89 = math.floor(v88)
        local v90 = (tick() - v45) * 1000
        v_u_30 = v_u_30 .. (("[%* Fsys] (%* ms) Module %* finished requiring. (%* ms)"):format(v87, v89, v_u_44, (math.floor(v90))) or "") .. "\n"
        v_u_6[v_u_44] = v_u_65
        local v91 = (debug.info(2, "s") or "unknown"):split(".")
        local v92 = v91[#v91]
        debug.setmemorycategory(v92)
    end
    local v93 = v_u_6[v_u_44]
    while #v43 > 0 do
        v93 = v93[table.remove(v43, 1)]
        if typeof(v93) == "Instance" and v93.ClassName == "ModuleScript" then
            v93 = require(v93)
        end
    end
    return v93
end
function v_u_8.load_all_modules(_)
    for v94, _ in pairs(v_u_5) do
        v_u_8.load(v94)
    end
end
function v_u_8.link_server_and_client()
    local v95 = v_u_10
    assert(v95, "Can\'t call link_server_and_client from a non-server!")
    if script:FindFirstChild("get_descendants_count") == nil then
        local v96 = Instance.new("RemoteFunction")
        v96.Name = "get_descendants_count"
        v96.Parent = script
        local v_u_97 = {}
        function v96.OnServerInvoke(_, p98)
            if p98.Parent == game.ReplicatedStorage then
                local v99 = v_u_97[p98] or #p98:GetDescendants()
                v_u_97[p98] = v99
                return v99
            end
        end
    end
end
function v_u_8.mark_dependency(p100, p101)
    local v102 = v_u_29(debug.info((p101 or 1) + 1, "s"))
    local v103 = p100:match("^[^:]*:([^/]*)") or p100:match("^([^/]*)")
    if not v_u_21[v102] then
        v_u_21[v102] = {}
    end
    v_u_21[v102][v103] = true
end
function v_u_8.require(p104)
    v_u_8.mark_dependency(p104.Name, 2)
    if v_u_20[p104.Name] then
        return require(p104)
    end
    local v105 = os.clock()
    local v106 = require(p104)
    local v107 = os.clock() - v105
    v_u_20[p104.Name] = v107
    v_u_20[("%* (require)"):format(p104.Name)] = v107
    return v106
end
function v_u_8.get_raw_dependency_tree()
    return v_u_21
end
function v_u_8.get_raw_async_timings()
    return v_u_20
end
function display_dependency_tree_with_timings_for(p108, p109, p110, p111)
    local v112 = p110 or 0
    local v113 = p111 or {}
    if p109.min_value and (v_u_20[p108] or 0) < p109.min_value then
        return {}
    end
    local v114 = { string.format("%-40s %7.3f  %7.3f require  %7.3f init", string.rep("  ", v112) .. p108, v_u_20[p108] or 0, v_u_20[("%* (require)"):format(p108)] or -1, v_u_20[("%* (init)"):format(p108)] or 0) }
    if v113[p108] then
        v114[1] = v114[1] .. "  <prev. traversed>"
        return v114
    end
    v113[p108] = true
    local v115 = {}
    for v116, _ in v_u_21[p108] or {} do
        local v117 = {
            ["name"] = v116,
            ["timer"] = v_u_20[v116] or (1 / 0)
        }
        table.insert(v115, v117)
    end
    table.sort(v115, function(p118, p119)
        return p118.timer > p119.timer
    end)
    for _, v120 in v115 do
        local v121 = display_dependency_tree_with_timings_for(v120.name, p109, v112 + 1, v113)
        table.move(v121, 1, #v121, #v114 + 1, v114)
    end
    return v114
end
function v_u_8.display_dependency_tree_with_timings_for(p122, p123)
    local v124 = {}
    for _, v125 in p122 do
        local v126 = display_dependency_tree_with_timings_for(v125, p123 or {})
        table.move(v126, 1, #v126, #v124 + 1, v124)
    end
    return table.concat(v124, "\n")
end
(function()
    for _, v127 in ipairs(v_u_18) do
        v_u_8.add_child_blacklist(v127)
    end
    v_u_37()
    if v_u_10 then
        for _, v128 in ipairs((v_u_14())) do
            v_u_8.add_modules(v128)
        end
    else
        for _, v129 in ipairs(v_u_15) do
            v_u_8.add_modules(v129)
        end
    end
    for _, v130 in ipairs(v_u_16) do
        v_u_8.add_modules(v130)
    end
end)()
return v_u_8