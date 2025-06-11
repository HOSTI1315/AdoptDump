--// ReplicatedStorage.SharedPackages._Index.upliftgames_ui-absolute-visibility@0.1.0.ui-absolute-visibility.init.spec (ModuleScript)

return function()
    for _, v_u_1 in game.ReplicatedStorage.TestCases:GetChildren() do
        describe(v_u_1.Name, function()
            for _, v2 in v_u_1:GetChildren() do
                local v_u_3 = require(v2)
                it(v2.Name, function()
                    local v_u_4 = nil
                    expect(function()
                        v_u_4 = v_u_3()
                    end).never.to.throw()
                    expect(v_u_4).to.equal(true)
                end)
            end
        end)
    end
end