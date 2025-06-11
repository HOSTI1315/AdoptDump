--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.GlobalConfig.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.GlobalConfig)
    it("should have the correct methods", function()
        expect(v_u_1).to.be.ok()
        expect(v_u_1.set).to.be.ok()
        expect(v_u_1.get).to.be.ok()
    end)
end