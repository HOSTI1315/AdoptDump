--// ReplicatedStorage.CmdrClient.Shared.Dispatcher (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TeleportService")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(script.Parent.Util)
local v_u_5 = require(script.Parent.Command)
local v_u_6 = false
local v_u_64 = {
    ["Cmdr"] = nil,
    ["Registry"] = nil,
    ["Evaluate"] = function(p7, p8, p9, p10, p11)
        if v_u_1:IsClient() == true and p9 ~= v_u_3.LocalPlayer then
            error("[Cmdr] Can\'t evaluate a command that isn\'t sent by the local player.")
        end
        local v12 = v_u_4.SplitString(p8)
        local v13 = table.remove(v12, 1)
        local v14 = p7.Registry:GetCommand(v13)
        if v14 then
            local v15 = {
                ["Dispatcher"] = p7,
                ["Text"] = p8,
                ["CommandObject"] = v14,
                ["Alias"] = v13,
                ["Executor"] = p9,
                ["Arguments"] = v_u_4.MashExcessArguments(v12, #v14.Args),
                ["Data"] = p11
            }
            local v16 = v_u_5.new(v15)
            local v17, v18 = v16:Parse(p10)
            if v17 then
                return v16
            else
                return false, v18
            end
        else
            return false, ("%q is not a valid command name. Use the help command to see all available commands."):format((tostring(v13)))
        end
    end,
    ["EvaluateAndRun"] = function(p19, p20, p21, p22)
        local v23 = p21 or v_u_3.LocalPlayer
        local v24 = p22 or {}
        if v_u_1:IsClient() and v24.IsHuman then
            p19:PushHistory(p20)
        end
        local v_u_25, v26 = p19:Evaluate(p20, v23, nil, v24.Data)
        if not v_u_25 then
            return v26
        end
        local v30, v31 = xpcall(function()
            local v27, v28 = v_u_25:Validate(true)
            return v27 and (v_u_25:Run() or "Command executed.") or v28
        end, function(p29)
            return debug.traceback((tostring(p29)))
        end)
        if not v30 then
            warn(("[Cmdr] Error occurred while evaluating command string %%q\n%*"):format((tostring(v31))):format(p20))
        end
        return v30 and v31 and v31 or "An error occurred while running this command. Check the console for more information."
    end,
    ["Send"] = function(p32, p33, p34)
        if v_u_1:IsClient() == false then
            error("[Cmdr] Dispatcher:Send can only be called from the client.")
        end
        return p32.Cmdr.RemoteFunction:InvokeServer(p33, {
            ["Data"] = p34
        })
    end,
    ["Run"] = function(p35, ...)
        if not v_u_3.LocalPlayer then
            error("[Cmdr] Dispatcher:Run can only be called from the client.")
        end
        local v36 = { ... }
        local v37 = v36[1]
        for v38 = 2, #v36 do
            local v39 = v36[v38]
            v37 = v37 .. " " .. tostring(v39)
        end
        local v40, v41 = p35:Evaluate(v37, v_u_3.LocalPlayer)
        if not v40 then
            error(v41)
        end
        local v42, v43 = v40:Validate(true)
        if not v42 then
            error(v43)
        end
        return v40:Run()
    end,
    ["RunGuards"] = function(_, p44, ...)
        local v45 = p44.Object.Guards
        if v45 ~= nil then
            local v46 = typeof(v45)
            local v47 = v46 == "table"
            local v48 = ("expected a table for Command.Guards, got %*"):format(v46)
            assert(v47, v48)
            for _, v49 in pairs(v45) do
                local v50 = typeof(v49)
                local v51 = v50 == "function"
                local v52 = ("expected a function for a value in Command.Guards, got %*"):format(v50)
                assert(v51, v52)
                local v53 = v49(p44, ...)
                if v53 ~= nil then
                    return tostring(v53)
                end
            end
        end
    end,
    ["RunHooks"] = function(p54, p55, p56, ...)
        if not p54.Registry.Hooks[p55] then
            error(("[Cmdr] Invalid hook name: %q"):format(p55), 2)
        end
        if p55 == "BeforeRun" and (#p54.Registry.Hooks[p55] == 0 and (p56.Group ~= "DefaultUtil" and (p56.Group ~= "UserAlias" and p56:HasImplementation()))) then
            if not v_u_1:IsStudio() then
                return "Command blocked for security as no BeforeRun hook is configured."
            end
            if v_u_6 == false then
                p56:Reply((v_u_1:IsServer() and "<Server>" or "<Client>") .. " Commands will not run in-game if no BeforeRun hook is configured. Learn more: https://eryn.io/Cmdr/guide/Hooks.html", Color3.fromRGB(255, 228, 26))
                v_u_6 = true
            end
        end
        for _, v57 in ipairs(p54.Registry.Hooks[p55]) do
            local v58 = v57.callback(p56, ...)
            if v58 ~= nil then
                return tostring(v58)
            end
        end
    end,
    ["PushHistory"] = function(p59, p60)
        local v61 = v_u_1:IsClient()
        assert(v61, "[Cmdr] PushHistory may only be used from the client.")
        local v62 = p59:GetHistory()
        if v_u_4.TrimString(p60) ~= "" and p60 ~= v62[#v62] then
            v62[#v62 + 1] = p60
            v_u_2:SetTeleportSetting("CmdrCommandHistory", v62)
        end
    end,
    ["GetHistory"] = function(_)
        local v63 = v_u_1:IsClient()
        assert(v63, "[Cmdr] GetHistory may only be used from the client.")
        return v_u_2:GetTeleportSetting("CmdrCommandHistory") or {}
    end
}
return function(p65)
    v_u_64.Cmdr = p65
    v_u_64.Registry = p65.Registry
    return v_u_64
end