--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createFragment.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.ElementKind)
    local v_u_2 = require(script.Parent.Type)
    local v_u_3 = require(script.Parent.createFragment)
    it("should create new primitive elements", function()
        local v4 = v_u_3({})
        expect(v4).to.be.ok()
        expect(v_u_2.of(v4)).to.equal(v_u_2.Element)
        expect(v_u_1.of(v4)).to.equal(v_u_1.Fragment)
    end)
    it("should accept children", function()
        local v5 = v_u_3({})
        local v6 = v_u_3({
            ["key"] = v5
        })
        expect(v6.elements.key).to.equal(v5)
    end)
end