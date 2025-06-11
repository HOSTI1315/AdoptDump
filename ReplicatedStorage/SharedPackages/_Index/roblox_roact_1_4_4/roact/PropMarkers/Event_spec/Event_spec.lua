--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.PropMarkers.Event.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.Type)
    local v_u_2 = require(script.Parent.Event)
    it("should yield event objects when indexed", function()
        expect(v_u_1.of(v_u_2.MouseButton1Click)).to.equal(v_u_1.HostEvent)
        expect(v_u_1.of(v_u_2.Touched)).to.equal(v_u_1.HostEvent)
    end)
    it("should yield the same object when indexed again", function()
        local v3 = v_u_2.MouseButton1Click
        local v4 = v_u_2.MouseButton1Click
        local v5 = v_u_2.Touched
        expect(v3).to.equal(v4)
        expect(v3).never.to.equal(v5)
    end)
end