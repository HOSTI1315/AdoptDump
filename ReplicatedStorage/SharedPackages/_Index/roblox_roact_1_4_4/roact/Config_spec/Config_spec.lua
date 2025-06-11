--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Config.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Config)
    it("should accept valid configuration", function()
        local v2 = v_u_1.new()
        local v3 = v2.get()
        expect(v3.elementTracing).to.equal(false)
        v2.set({
            ["elementTracing"] = true
        })
        expect(v3.elementTracing).to.equal(true)
    end)
    it("should reject invalid configuration keys", function()
        local v_u_4 = v_u_1.new()
        local v5, v6 = pcall(function()
            v_u_4.set({
                ["garblegoop"] = true
            })
        end)
        expect(v5).to.equal(false)
        expect(v6:find("garblegoop")).to.be.ok()
    end)
    it("should reject invalid configuration values", function()
        local v_u_7 = v_u_1.new()
        local v8, v9 = pcall(function()
            v_u_7.set({
                ["elementTracing"] = "Hello there!"
            })
        end)
        expect(v8).to.equal(false)
        expect(v9:find("elementTracing")).to.be.ok()
        expect(v9:find("Hello there!")).to.be.ok()
    end)
end