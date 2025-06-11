--// ReplicatedStorage.CmdrClient.Shared.Registry (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.Util)
local v_u_20 = {
    ["TypeMethods"] = v_u_2.MakeDictionary({
        "Transform",
        "Validate",
        "Autocomplete",
        "Parse",
        "DisplayName",
        "Listable",
        "ValidateOnce",
        "Prefixes",
        "Default",
        "ArgumentOperatorAliases"
    }),
    ["CommandMethods"] = v_u_2.MakeDictionary({
        "Name",
        "Aliases",
        "AutoExec",
        "Description",
        "Args",
        "Run",
        "ClientRun",
        "Data",
        "Group",
        "Guards"
    }),
    ["CommandArgProps"] = v_u_2.MakeDictionary({
        "Name",
        "Type",
        "Description",
        "Optional",
        "Default"
    }),
    ["Types"] = {},
    ["TypeAliases"] = {},
    ["Commands"] = {},
    ["CommandsArray"] = {},
    ["Cmdr"] = nil,
    ["Hooks"] = {
        ["BeforeRun"] = {},
        ["AfterRun"] = {}
    },
    ["Stores"] = setmetatable({}, {
        ["__index"] = function(p3, p4)
            p3[p4] = {}
            return p3[p4]
        end
    }),
    ["AutoExecBuffer"] = {},
    ["RegisterType"] = function(p5, p6, p7)
        if not p6 or typeof(p6) ~= "string" then
            error("[Cmdr] Invalid type name provided: nil")
        end
        if not p6:find("^[%d%l]%w*$") then
            error((("[Cmdr] Invalid type name provided: \"%*\", type names must be alphanumeric and start with a lower-case letter or a digit."):format(p6)))
        end
        for v8 in pairs(p7) do
            if p5.TypeMethods[v8] == nil then
                error((("[Cmdr] Unknown key/method in type \"%*\": %*"):format(p6, v8)))
            end
        end
        if p5.Types[p6] ~= nil then
            error((("[Cmdr] Type %* has already been registered."):format(p6)))
        end
        p7.Name = p6
        p7.DisplayName = p7.DisplayName or p6
        p5.Types[p6] = p7
        if p7.Prefixes then
            p5:RegisterTypePrefix(p6, p7.Prefixes)
        end
    end,
    ["RegisterTypePrefix"] = function(p9, p10, p11)
        if not p9.TypeAliases[p10] then
            p9.TypeAliases[p10] = p10
        end
        p9.TypeAliases[p10] = ("%s %s"):format(p9.TypeAliases[p10], p11)
    end,
    ["RegisterTypeAlias"] = function(p12, p13, p14)
        local v15 = p12.TypeAliases[p13] == nil
        local v16 = ("[Cmdr] Type alias %* already exists!"):format(p14)
        assert(v15, v16)
        p12.TypeAliases[p13] = p14
    end,
    ["RegisterTypesIn"] = function(p17, p18)
        for _, v19 in pairs(p18:GetChildren()) do
            if v19:IsA("ModuleScript") then
                v19.Parent = p17.Cmdr.ReplicatedRoot.Types
                require(v19)(p17)
            else
                p17:RegisterTypesIn(v19)
            end
        end
    end
}
v_u_20.RegisterHooksIn = v_u_20.RegisterTypesIn
function v_u_20.RegisterCommandObject(p21, p22)
    for v23 in pairs(p22) do
        if p21.CommandMethods[v23] == nil then
            error((("[Cmdr] Unknown key/method in command \"%*\": %*"):format(p22.Name or "unknown command", v23)))
        end
    end
    if p22.Args then
        for v24, v25 in pairs(p22.Args) do
            if type(v25) == "table" then
                for v26 in pairs(v25) do
                    if p21.CommandArgProps[v26] == nil then
                        error((("[Cmdr] Unknown property in command \"%*\" argument #%*: %*"):format(p22.Name or "unknown", v24, v26)))
                    end
                end
            end
        end
    end
    if p22.AutoExec and v_u_1:IsClient() then
        local v27 = p21.AutoExecBuffer
        local v28 = p22.AutoExec
        table.insert(v27, v28)
        p21:FlushAutoExecBufferDeferred()
    end
    local v29 = p21.Commands[p22.Name:lower()]
    if v29 and v29.Aliases then
        for _, v30 in pairs(v29.Aliases) do
            p21.Commands[v30:lower()] = nil
        end
    elseif not v29 then
        local v31 = p21.CommandsArray
        table.insert(v31, p22)
    end
    p21.Commands[p22.Name:lower()] = p22
    if p22.Aliases then
        for _, v32 in pairs(p22.Aliases) do
            p21.Commands[v32:lower()] = p22
        end
    end
end
function v_u_20.RegisterCommand(p33, p34, p35, p36)
    local v37 = require(p34)
    local v38 = typeof(v37) == "table"
    local v39 = ("[Cmdr] Invalid return value from command script \"%*\" (CommandDefinition expected, got %*)"):format(p34.Name, (typeof(v37)))
    assert(v38, v39)
    if p35 then
        local v40 = v_u_1:IsServer()
        assert(v40, "[Cmdr] The commandServerScript parameter is not valid for client usage.")
        v37.Run = require(p35)
    end
    if not p36 or p36(v37) then
        p33:RegisterCommandObject(v37)
        p34.Parent = p33.Cmdr.ReplicatedRoot.Commands
    end
end
function v_u_20.RegisterCommandsIn(p41, p42, p43)
    local v44 = {}
    local v45 = {}
    for _, v46 in pairs(p42:GetChildren()) do
        if v46:IsA("ModuleScript") then
            if v46.Name:find("Server") then
                v44[v46] = true
            else
                local v47 = p42:FindFirstChild(v46.Name .. "Server")
                if v47 then
                    v45[v47] = true
                end
                p41:RegisterCommand(v46, v47, p43)
            end
        else
            p41:RegisterCommandsIn(v46, p43)
        end
    end
    for v48 in pairs(v44) do
        if not v45[v48] then
            warn((("[Cmdr] Command script %* was skipped because it has \'Server\' in its name, and has no equivalent shared script."):format(v48.Name)))
        end
    end
end
function v_u_20.RegisterDefaultCommands(p49, p50)
    local v51 = v_u_1:IsServer()
    assert(v51, "[Cmdr] RegisterDefaultCommands cannot be called from the client.")
    local v_u_52
    if type(p50) == "table" then
        v_u_52 = v_u_2.MakeDictionary(p50)
    else
        v_u_52 = nil
    end
    p49:RegisterCommandsIn(p49.Cmdr.DefaultCommandsFolder, v_u_52 ~= nil and (function(p53)
        return v_u_52[p53.Group] or false
    end or p50) or p50)
end
function v_u_20.GetCommand(p54, p55)
    return p54.Commands[(p55 or ""):lower()]
end
function v_u_20.GetCommands(p56)
    return p56.CommandsArray
end
function v_u_20.GetCommandNames(p57)
    local v58 = {}
    for _, v59 in pairs(p57.CommandsArray) do
        local v60 = v59.Name
        table.insert(v58, v60)
    end
    return v58
end
v_u_20.GetCommandsAsStrings = v_u_20.GetCommandNames
function v_u_20.GetTypeNames(p61)
    local v62 = {}
    for v63 in pairs(p61.Types) do
        table.insert(v62, v63)
    end
    return v62
end
function v_u_20.GetType(p64, p65)
    return p64.Types[p65]
end
function v_u_20.GetTypeName(p66, p67)
    return p66.TypeAliases[p67] or p67
end
function v_u_20.RegisterHook(p68, p69, p70, p71)
    if not p68.Hooks[p69] then
        error(("[Cmdr] Invalid hook name: %q"):format(p69), 2)
    end
    local v72 = p68.Hooks[p69]
    table.insert(v72, {
        ["callback"] = p70,
        ["priority"] = p71 or 0
    })
    table.sort(p68.Hooks[p69], function(p73, p74)
        return p73.priority < p74.priority
    end)
end
v_u_20.AddHook = v_u_20.RegisterHook
function v_u_20.GetStore(p75, p76)
    return p75.Stores[p76]
end
function v_u_20.FlushAutoExecBufferDeferred(p_u_77)
    if not p_u_77.AutoExecFlushConnection then
        p_u_77.AutoExecFlushConnection = v_u_1.Heartbeat:Connect(function()
            p_u_77.AutoExecFlushConnection:Disconnect()
            p_u_77.AutoExecFlushConnection = nil
            p_u_77:FlushAutoExecBuffer()
        end)
    end
end
function v_u_20.FlushAutoExecBuffer(p78)
    for _, v79 in ipairs(p78.AutoExecBuffer) do
        for _, v80 in ipairs(v79) do
            p78.Cmdr.Dispatcher:EvaluateAndRun(v80)
        end
    end
    p78.AutoExecBuffer = {}
end
return function(p81)
    v_u_20.Cmdr = p81
    return v_u_20
end