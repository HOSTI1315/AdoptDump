--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.PropMarkers.Change.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.Type)
    local v_u_2 = require(script.Parent.Change)
    it("should yield change listener objects when indexed", function()
        expect(v_u_1.of(v_u_2.Text)).to.equal(v_u_1.HostChangeEvent)
        expect(v_u_1.of(v_u_2.Selected)).to.equal(v_u_1.HostChangeEvent)
    end)
    it("should yield the same object when indexed again", function()
        local v3 = v_u_2.Text
        local v4 = v_u_2.Text
        local v5 = v_u_2.Selected
        expect(v3).to.equal(v4)
        expect(v3).never.to.equal(v5)
    end)
end