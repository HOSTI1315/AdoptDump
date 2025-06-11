--// ReplicatedStorage.CmdrClient.Shared.Command (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(script.Parent.Argument)
local v_u_4 = v_u_1:IsServer()
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
    local v7 = {
        ["Dispatcher"] = p6.Dispatcher,
        ["Cmdr"] = p6.Dispatcher.Cmdr,
        ["Name"] = p6.CommandObject.Name,
        ["RawText"] = p6.Text,
        ["Object"] = p6.CommandObject,
        ["Group"] = p6.CommandObject.Group,
        ["State"] = {},
        ["Aliases"] = p6.CommandObject.Aliases,
        ["Alias"] = p6.Alias,
        ["Description"] = p6.CommandObject.Description,
        ["Executor"] = p6.Executor,
        ["ArgumentDefinitions"] = p6.CommandObject.Args,
        ["RawArguments"] = p6.Arguments,
        ["Arguments"] = {},
        ["Data"] = p6.Data,
        ["Response"] = nil,
        ["Guards"] = p6.Guards
    }
    local v8 = v_u_5
    setmetatable(v7, v8)
    return v7
end
function v_u_5.Parse(p9, p10)
    local v11 = false
    for v12, v14 in ipairs(p9.ArgumentDefinitions) do
        if type(v14) == "function" then
            local v14 = v14(p9)
            if v14 == nil then
                break
            end
        end
        local v15
        if v14.Default == nil then
            v15 = v14.Optional ~= true
        else
            v15 = false
        end
        if v15 and v11 then
            error(("[Cmdr] Command %q: Required arguments cannot occur after optional arguments."):format(p9.Name))
        else
            v11 = not v15 and true or v11
        end
        if p9.RawArguments[v12] == nil and (v15 and p10 ~= true) then
            return false, ("Required argument #%d %s is missing."):format(v12, v14.Name)
        end
        if p9.RawArguments[v12] or p10 then
            p9.Arguments[v12] = v_u_3.new(p9, v14, p9.RawArguments[v12] or "")
        end
    end
    return true
end
function v_u_5.Validate(p16, p17)
    p16._Validated = true
    local v18 = ""
    local v19 = true
    for v20, v21 in pairs(p16.Arguments) do
        local v22, v23 = v21:Validate(p17)
        if not v22 then
            v18 = ("%s; #%d %s: %s"):format(v18, v20, v21.Name, v23 or "error")
            v19 = false
        end
    end
    return v19, v18:sub(3)
end
function v_u_5.GetLastArgument(p24)
    for v25 = #p24.Arguments, 1, -1 do
        if p24.Arguments[v25].RawValue then
            return p24.Arguments[v25]
        end
    end
end
function v_u_5.GatherArgumentValues(p26)
    local v27 = {}
    for v28 = 1, #p26.ArgumentDefinitions do
        local v29 = p26.Arguments[v28]
        if v29 then
            v27[v28] = v29:GetValue()
        else
            local v30 = p26.ArgumentDefinitions[v28]
            if type(v30) == "table" then
                v27[v28] = p26.ArgumentDefinitions[v28].Default
            end
        end
    end
    return v27, #p26.ArgumentDefinitions
end
function v_u_5.Run(p31)
    if p31._Validated == nil then
        error("[Cmdr] Must validate a command before running.")
    end
    local v32 = p31.Dispatcher:RunHooks("BeforeRun", p31)
    if v32 then
        return v32
    end
    local v33 = p31.Dispatcher:RunGuards(p31)
    if v33 then
        return v33
    end
    if not v_u_4 and (p31.Object.Data and p31.Data == nil) then
        local v34, v35 = p31:GatherArgumentValues()
        p31.Data = p31.Object.Data(p31, unpack(v34, 1, v35))
    end
    if not v_u_4 and p31.Object.ClientRun then
        local v36, v37 = p31:GatherArgumentValues()
        p31.Response = p31.Object.ClientRun(p31, unpack(v36, 1, v37))
    end
    if p31.Response == nil then
        if p31.Object.Run then
            local v38, v39 = p31:GatherArgumentValues()
            p31.Response = p31.Object.Run(p31, unpack(v38, 1, v39))
        elseif v_u_4 then
            if p31.Object.ClientRun then
                warn((("[Cmdr] %* command fell back to the server because ClientRun returned nil, but there is no server implementation! Either return a string from ClientRun, or create a server implementation for this command."):format(p31.Name)))
            else
                warn((("[Cmdr] %* command has no implementation!"):format(p31.Name)))
            end
            p31.Response = "No implementation."
        else
            p31.Response = p31.Dispatcher:Send(p31.RawText, p31.Data)
        end
    end
    return p31.Dispatcher:RunHooks("AfterRun", p31) or p31.Response
end
function v_u_5.GetArgument(p40, p41)
    return p40.Arguments[p41]
end
function v_u_5.GetData(p42)
    if p42.Data then
        return p42.Data
    end
    if p42.Object.Data and not v_u_4 then
        p42.Data = p42.Object.Data(p42)
    end
    return p42.Data
end
function v_u_5.SendEvent(p43, p44, p45, ...)
    local v46
    if typeof(p44) == "Instance" then
        v46 = p44:IsA("Player")
    else
        v46 = false
    end
    assert(v46, "[Cmdr] Argument #1 must be a Player")
    local v47 = type(p45) == "string"
    assert(v47, "[Cmdr] Argument #2 must be a string")
    if v_u_4 then
        p43.Dispatcher.Cmdr.RemoteEvent:FireClient(p44, p45, ...)
    elseif p43.Dispatcher.Cmdr.Events[p45] then
        local v48 = p44 == v_u_2.LocalPlayer
        assert(v48, "[Cmdr] Event messages can only be sent to the local player on the client.")
        p43.Dispatcher.Cmdr.Events[p45](...)
    end
end
function v_u_5.BroadcastEvent(p49, ...)
    if not v_u_4 then
        error("[Cmdr] Can\'t broadcast event messages from the client.", 2)
    end
    p49.Dispatcher.Cmdr.RemoteEvent:FireAllClients(...)
end
function v_u_5.Reply(p50, ...)
    return p50:SendEvent(p50.Executor, "AddLine", ...)
end
function v_u_5.GetStore(p51, ...)
    return p51.Dispatcher.Cmdr.Registry:GetStore(...)
end
function v_u_5.HasImplementation(p52)
    return (v_u_1:IsClient() and p52.Object.ClientRun or p52.Object.Run) and true or false
end
return v_u_5