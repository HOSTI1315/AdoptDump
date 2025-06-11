--// ReplicatedStorage.ClientDB.Housing.HouseDB (ModuleScript)

local v_u_1 = game:GetService("ReplicatedStorage").SharedModules.ContentPacks
local v_u_2 = {}
(function()
    local v3 = {}
    for _, v4 in v_u_1:GetChildren() do
        local v5 = v4:FindFirstChild("Houses")
        if v5 then
            for _, v6 in require(v5) do
                if v3[v6.kind] then
                    error((("Two entries have the same kind: %*"):format(v6.kind)))
                else
                    v3[v6.kind] = true
                end
                if not v6.typechecked then
                    error((("%* was not properly typechecked. Make sure you\'re using EntryHelper.lua"):format(v6.kind)))
                end
                v_u_2[v6.kind] = v6
            end
        end
    end
end)()
return v_u_2