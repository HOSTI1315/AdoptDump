--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.assertDeepEqual.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.assertDeepEqual)
    it("should fail with a message when args are not equal", function()
        local v2, v3 = pcall(v_u_1, 1, 2)
        expect(v2).to.equal(false)
        expect(v3:find("first ~= second")).to.be.ok()
        local v4, v5 = pcall(v_u_1, {
            ["foo"] = 1
        }, {
            ["foo"] = 2
        })
        expect(v4).to.equal(false)
        expect(v5:find("first%[foo%] ~= second%[foo%]")).to.be.ok()
    end)
    it("should compare non-table values using standard \'==\' equality", function()
        v_u_1(1, 1)
        v_u_1("hello", "hello")
        v_u_1(nil, nil)
        local function v6() end
        v_u_1(v6, v6)
        v_u_1({
            ["foo"] = v6
        }, {
            ["foo"] = v6
        })
    end)
    it("should fail when types differ", function()
        local v7, v8 = pcall(v_u_1, 1, "1")
        expect(v7).to.equal(false)
        expect(v8:find("first is of type number, but second is of type string")).to.be.ok()
    end)
    it("should compare (and report about) nested tables", function()
        local v9 = {
            ["foo"] = "bar",
            ["nested"] = {
                ["foo"] = 1,
                ["bar"] = 2
            }
        }
        local v10 = {
            ["foo"] = "bar",
            ["nested"] = {
                ["foo"] = 1,
                ["bar"] = 2
            }
        }
        v_u_1(v9, v10)
        local v11 = {
            ["foo"] = "bar",
            ["nested"] = {
                ["foo"] = 1,
                ["bar"] = 3
            }
        }
        local v12, v13 = pcall(v_u_1, v9, v11)
        expect(v12).to.equal(false)
        expect(v13:find("first%[nested%]%[bar%] ~= second%[nested%]%[bar%]")).to.be.ok()
    end)
    it("should be commutative", function()
        local v_u_14 = {
            ["foo"] = "bar",
            ["hello"] = "world"
        }
        local v15 = {
            ["foo"] = "bar",
            ["hello"] = "world"
        }
        v_u_1(v_u_14, v15)
        v_u_1(v15, v_u_14)
        local v_u_16 = {
            ["foo"] = "bar"
        }
        expect(function()
            v_u_1(v_u_14, v_u_16)
        end).to.throw()
        expect(function()
            v_u_1(v_u_16, v_u_14)
        end).to.throw()
    end)
end