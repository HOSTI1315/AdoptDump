--// ReplicatedStorage.SharedModules.Attempter (ModuleScript)

return {
    ["attempt_async"] = function(p1, p2, p3)
        while true do
            local v4 = p3()
            p1 = p1 - 1
            if not v4 and p1 > 0 then
                task.wait(p2)
            end
            if p1 <= 0 or v4 then
                return v4
            end
        end
    end
}