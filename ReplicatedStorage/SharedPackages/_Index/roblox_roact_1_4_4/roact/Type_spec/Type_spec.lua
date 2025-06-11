--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Type.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Type)
    describe("of", function()
        it("should return nil if the value is not a table", function()
            expect(v_u_1.of(1)).to.equal(nil)
            expect(v_u_1.of(true)).to.equal(nil)
            expect(v_u_1.of("test")).to.equal(nil)
            expect(v_u_1.of(print)).to.equal(nil)
        end)
        it("should return nil if the table has no type", function()
            expect(v_u_1.of({})).to.equal(nil)
        end)
        it("should return the assigned type", function()
            local v2 = {
                [v_u_1] = v_u_1.Element
            }
            expect(v_u_1.of(v2)).to.equal(v_u_1.Element)
        end)
    end)
end