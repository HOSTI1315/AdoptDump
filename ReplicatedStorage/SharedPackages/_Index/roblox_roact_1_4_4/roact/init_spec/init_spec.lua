--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.init.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent)
    it("should load with all public APIs", function()
        local v2 = {
            ["createElement"] = "function",
            ["createFragment"] = "function",
            ["createRef"] = "function",
            ["forwardRef"] = "function",
            ["createBinding"] = "function",
            ["joinBindings"] = "function",
            ["mount"] = "function",
            ["unmount"] = "function",
            ["update"] = "function",
            ["oneChild"] = "function",
            ["setGlobalConfig"] = "function",
            ["createContext"] = "function",
            ["reify"] = "function",
            ["teardown"] = "function",
            ["reconcile"] = "function",
            ["Component"] = true,
            ["PureComponent"] = true,
            ["Portal"] = true,
            ["Children"] = true,
            ["Event"] = true,
            ["Change"] = true,
            ["Ref"] = true,
            ["None"] = true,
            ["UNSTABLE"] = true
        }
        expect(v_u_1).to.be.ok()
        for v3, v4 in pairs(v2) do
            local v5
            if typeof(v4) == "string" then
                local v6 = v_u_1[v3]
                v5 = typeof(v6) == v4
            else
                v5 = v_u_1[v3] ~= nil
            end
            if not v5 then
                local v7 = typeof(v4) == "boolean" and "present" or "of type " .. tostring(v4)
                local v8 = tostring(v3)
                local v9 = v_u_1[v3]
                local v10 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(v8, v7, (typeof(v9)))
                error(v10)
            end
        end
        for v11 in pairs(v_u_1) do
            if v2[v11] == nil then
                local v12 = ("Found unknown public API key %q!"):format((tostring(v11)))
                error(v12)
            end
        end
    end)
end