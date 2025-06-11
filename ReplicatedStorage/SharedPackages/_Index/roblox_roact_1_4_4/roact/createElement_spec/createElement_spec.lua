--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createElement.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Component)
    local v_u_2 = require(script.Parent.ElementKind)
    local v_u_3 = require(script.Parent.GlobalConfig)
    local v_u_4 = require(script.Parent.Logging)
    local v_u_5 = require(script.Parent.Type)
    local v_u_6 = require(script.Parent.Portal)
    local v_u_7 = require(script.Parent.PropMarkers.Children)
    local v_u_8 = require(script.Parent.createElement)
    it("should create new primitive elements", function()
        local v9 = v_u_8("Frame")
        expect(v9).to.be.ok()
        expect(v_u_5.of(v9)).to.equal(v_u_5.Element)
        expect(v_u_2.of(v9)).to.equal(v_u_2.Host)
    end)
    it("should create new functional elements", function()
        local v10 = v_u_8(function() end)
        expect(v10).to.be.ok()
        expect(v_u_5.of(v10)).to.equal(v_u_5.Element)
        expect(v_u_2.of(v10)).to.equal(v_u_2.Function)
    end)
    it("should create new stateful components", function()
        local v11 = v_u_8((v_u_1:extend("Foo")))
        expect(v11).to.be.ok()
        expect(v_u_5.of(v11)).to.equal(v_u_5.Element)
        expect(v_u_2.of(v11)).to.equal(v_u_2.Stateful)
    end)
    it("should create new portal elements", function()
        local v12 = v_u_8(v_u_6)
        expect(v12).to.be.ok()
        expect(v_u_5.of(v12)).to.equal(v_u_5.Element)
        expect(v_u_2.of(v12)).to.equal(v_u_2.Portal)
    end)
    it("should accept props", function()
        local v13 = v_u_8("StringValue", {
            ["Value"] = "Foo"
        })
        expect(v13).to.be.ok()
        expect(v13.props.Value).to.equal("Foo")
    end)
    it("should accept props and children", function()
        local v14 = v_u_8("IntValue")
        local v15 = v_u_8("StringValue", {
            ["Value"] = "Foo"
        }, {
            ["Child"] = v14
        })
        expect(v15).to.be.ok()
        expect(v15.props.Value).to.equal("Foo")
        expect(v15.props[v_u_7]).to.be.ok()
        expect(v15.props[v_u_7].Child).to.equal(v14)
    end)
    it("should accept children with without props", function()
        local v16 = v_u_8("IntValue")
        local v17 = v_u_8("StringValue", nil, {
            ["Child"] = v16
        })
        expect(v17).to.be.ok()
        expect(v17.props[v_u_7]).to.be.ok()
        expect(v17.props[v_u_7].Child).to.equal(v16)
    end)
    it("should warn once if children is specified in two different ways", function()
        local v18 = v_u_4.capture(function()
            for _ = 1, 2 do
                v_u_8("Frame", {
                    [v_u_7] = {}
                }, {})
            end
        end)
        expect(#v18.warnings).to.equal(1)
        expect(v18.warnings[1]:find("createElement")).to.be.ok()
        expect(v18.warnings[1]:find("Children")).to.be.ok()
    end)
    it("should have a `source` member if elementTracing is set", function()
        v_u_3.scoped({
            ["elementTracing"] = true
        }, function()
            local v19 = v_u_8("StringValue")
            expect(v19.source).to.be.a("string")
        end)
    end)
end