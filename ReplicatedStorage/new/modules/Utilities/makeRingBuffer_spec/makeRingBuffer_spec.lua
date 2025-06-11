--// ReplicatedStorage.new.modules.Utilities.makeRingBuffer.spec (ModuleScript)

local v_u_1 = require(script.Parent.makeRingBuffer)
return function()
    describe("constructor", function()
        local v_u_2 = v_u_1(3)
        beforeEach(function()
            v_u_2 = v_u_1(3)
        end)
        it("should create a frozen table", function()
            expect(table.isfrozen(v_u_2)).to.equal(true)
        end)
        it("should create an internal buffer", function()
            expect(v_u_2._buffer).to.be.a("table")
        end)
        it("should create read and write heads starting at 1", function()
            expect(v_u_2._head).to.be.a("table")
            expect(v_u_2._head.write).to.equal(1)
            expect(v_u_2._head.read).to.equal(1)
            expect(v_u_2._head.readHeadBacklog).to.equal(0)
        end)
    end)
    describe("writing", function()
        it("should write one value and advance the write head only", function()
            local v3 = v_u_1(5)
            v3.push("abc")
            expect(v3._buffer[1]).to.equal("abc")
            expect(v3._head.write).to.equal(2)
            expect(v3._head.read).to.equal(1)
            expect(v3._head.readHeadBacklog).to.equal(1)
        end)
        it("should write multiple values and advance the write head only", function()
            local v4 = v_u_1(5)
            v4.pushMany({ "abc", "def", "ghi" })
            expect(v4._buffer[1]).to.equal("abc")
            expect(v4._buffer[2]).to.equal("def")
            expect(v4._buffer[3]).to.equal("ghi")
            expect(v4._head.write).to.equal(4)
            expect(v4._head.read).to.equal(1)
            expect(v4._head.readHeadBacklog).to.equal(3)
        end)
    end)
    describe("reading", function()
        it("should report the buffer as readable after values are written", function()
            local v5 = v_u_1(5)
            expect(v5.canRead()).to.equal(false)
            v5.pushMany({ "abc", "def", "ghi" })
            expect(v5.canRead()).to.equal(true)
        end)
        it("should read one value and advance the read head", function()
            local v6 = v_u_1(5)
            v6.pushMany({ "abc", "def", "ghi" })
            expect(v6.pop()).to.equal("abc")
            expect(v6.pop()).to.equal("def")
            expect(v6.pop()).to.equal("ghi")
        end)
        it("should read multiple values and advance the read head", function()
            local v7 = v_u_1(5)
            v7.pushMany({ "a", "b", "c" })
            local v8 = v7.popMany(2)
            expect(v8[1]).to.equal("a")
            expect(v8[2]).to.equal("b")
        end)
        it("should only read available values when reading multiple", function()
            local v9 = v_u_1(5)
            v9.pushMany({ "a", "b", "c" })
            local v10 = v9.popMany(5)
            expect(v10[1]).to.equal("a")
            expect(v10[2]).to.equal("b")
        end)
        it("should report the buffer as unreadable after all values are read", function()
            local v11 = v_u_1(5)
            expect(v11.canRead()).to.equal(false)
            v11.pushMany({ "abc", "def", "ghi" })
            expect(v11.canRead()).to.equal(true)
            v11.pop()
            v11.pop()
            v11.pop()
            expect(v11.canRead()).to.equal(false)
        end)
        it("should error when attempting to read if the buffer is unreadable", function()
            local v12 = v_u_1(5)
            expect(v12.pop).to.throw()
        end)
        it("should report the size of the backlog", function()
            local v13 = v_u_1(5)
            expect(v13.getReadBacklogSize()).to.equal(0)
            v13.pushMany(table.create(5, "foo"))
            expect(v13.getReadBacklogSize()).to.equal(5)
        end)
        it("should not report a backlog size greater than the buffer size", function()
            local v14 = v_u_1(5)
            expect(v14.getReadBacklogSize()).to.equal(0)
            v14.pushMany(table.create(7, "foo"))
            expect(v14.getReadBacklogSize()).to.equal(5)
        end)
    end)
    describe("ring", function()
        it("should loop the write head when writing after the end of the array", function()
            local v15 = v_u_1(3)
            v15.pushMany({
                "a",
                "b",
                "c",
                "d"
            })
            expect(v15._buffer[1]).to.equal("d")
            expect(v15._buffer[2]).to.equal("b")
            expect(v15._buffer[3]).to.equal("c")
        end)
        it("should move the read head when writes loop over", function()
            local v16 = v_u_1(3)
            v16.pushMany({
                "a",
                "b",
                "c",
                "d",
                "e"
            })
            expect(v16._buffer[1]).to.equal("d")
            expect(v16._buffer[2]).to.equal("e")
            expect(v16._buffer[3]).to.equal("c")
            expect(v16._head.write).to.equal(3)
            expect(v16._head.read).to.equal(3)
        end)
        it("should loop the read head when reading after the end of the array", function()
            local v17 = v_u_1(3)
            v17.pushMany({
                "a",
                "b",
                "c",
                "d"
            })
            expect(v17.pop()).to.equal("b")
            expect(v17.pop()).to.equal("c")
            expect(v17.pop()).to.equal("d")
            expect(v17._head.read).to.equal(2)
        end)
        it("should stop looping the read head after catching up with the write head", function()
            local v18 = v_u_1(3)
            v18.pushMany({
                "a",
                "b",
                "c",
                "d"
            })
            expect(v18.pop()).to.equal("b")
            expect(v18.pop()).to.equal("c")
            expect(v18.pop()).to.equal("d")
            expect(v18.pop).to.throw()
        end)
        it("should loop the read head correctly after multiple loops", function()
            local v19 = v_u_1(3)
            v19.pushMany({
                "a",
                "b",
                "c",
                "d",
                "e",
                "f",
                "g",
                "h",
                "i",
                "j"
            })
            print(v19)
            expect(v19._head.read).to.equal(2)
        end)
    end)
end