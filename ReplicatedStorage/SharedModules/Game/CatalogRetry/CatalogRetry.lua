--// ReplicatedStorage.SharedModules.Game.CatalogRetry (ModuleScript)

local v_u_10 = {
    ["retry"] = function(p1, p_u_2, p3)
        local v4 = 0
        local v5 = p1 or function() end
        local v_u_6 = nil
        while v4 ~= p3 do
            local v7, v8 = pcall(function()
                v_u_6 = p_u_2()
            end)
            v4 = v4 + 1
            if v4 == 50 and p3 ~= nil then
                warn("CatalogRetry.retry() failed for the 50th time. There is no cap of retries - continuing to infinitely retry.", debug.traceback())
            end
            if v7 then
                return v_u_6, true
            end
            if string.find(v8, "429") then
                v5("CatalogRetry.retry() hit 429: too many requests.", debug.traceback())
                task.wait(3)
            else
                if string.find(v8, "400") then
                    v5("CatalogRetry.retry() hit 400: bad request (asset may have gotten moderated).", debug.traceback())
                    return nil, false
                end
                if string.find(v8, "404") then
                    v5("CatalogRetry.retry() hit 404: not found (asset may have gotten moderated or otherwise deleted).", debug.traceback())
                    return nil, false
                end
                v5((("CatalogRetry.retry() error: %* | %*"):format(v8, (debug.traceback()))))
                task.wait(1)
            end
        end
        v5((("CatalogRetry.retry() max retries (%*) reached"):format(p3)))
        return nil, false
    end,
    ["with_logger"] = function(p_u_9)
        return function(...)
            return v_u_10.retry(p_u_9, ...)
        end
    end
}
return v_u_10