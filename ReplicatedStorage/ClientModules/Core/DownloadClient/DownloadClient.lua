--// ReplicatedStorage.ClientModules.Core.DownloadClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Debug").create_log()
local v_u_3 = v1("RouterClient")
local v4 = v1("Signal")
local v_u_5 = v1("new:StreamingHelper")
local v_u_6 = v1("package:Promise")
local v_u_7 = {}
local v_u_8 = {}
local v_u_9 = {}
local v_u_10 = {}
local v_u_11 = {}
local v_u_12 = v4.new()
local function v_u_16(p13)
    local v14 = 1
    for _, v15 in pairs(p13:GetChildren()) do
        v14 = v14 + v_u_16(v15)
    end
    return v14
end
local function v_u_20(...)
    while true do
        local v17 = v_u_3.get("DownloadsAPI/Download"):InvokeServer(...)
        if v17.download_model_id then
            break
        end
        if v17.status == "RATE_LIMITED" then
            v_u_2("Client\'s download was rate limited with parameters", ...)
            task.wait(1)
        else
            local v18, v19 = ...
            error((("Download failed for %*/%*. DownloadsAPI/Download response.status: %*"):format(v18, v19, v17.status)))
        end
    end
    v17.download_model = v_u_5.await(v17.download_model_id)
    return v17
end
function v_u_7.is_cached(p21, p22, p23)
    local v24 = p21 or "folder"
    local v25 = "/"
    local v26 = p22 or "subfolder"
    local v27 = "/"
    local v28
    if p23 == nil then
        v28 = ""
    else
        local v29 = p23.params_deduplication_hash
        assert(v29, "params requires a params_deduplication_hash so diffing can be done.")
        v28 = p23.params_deduplication_hash
    end
    return v_u_9[v24 .. v25 .. v26 .. v27 .. v28] and true or false
end
function v_u_7.get_downloaded_signal()
    return v_u_12
end
function v_u_7.download(p30, p31, p32)
    local v33 = p30 or "folder"
    local v34 = "/"
    local v35 = p31 or "subfolder"
    local v36 = "/"
    local v37
    if p32 == nil then
        v37 = ""
    else
        local v38 = p32.params_deduplication_hash
        assert(v38, "params requires a params_deduplication_hash so diffing can be done.")
        v37 = p32.params_deduplication_hash
    end
    local v39 = v33 .. v34 .. v35 .. v36 .. v37
    v_u_2("Download begin (" .. v39 .. ")")
    if v_u_11[v39] then
        v_u_2("Waiting for previously started download to finish (" .. v39 .. ").")
    end
    while v_u_11[v39] do
        task.wait(0.1)
    end
    v_u_10[v39] = false
    if v_u_9[v39] then
        v_u_2("Returning cached download (" .. v39 .. ")")
        v_u_12:Fire(0, p30, p31, p32)
        return v_u_9[v39]
    end
    v_u_11[v39] = true
    local v40 = os.clock()
    local v41 = v_u_20(p30, p31, p32)
    v_u_12:Fire(os.clock() - v40, p30, p31, p32)
    local v42 = v41.download_model
    local v43 = v41.received_remote_event
    local v44 = v42:Clone()
    v42:Destroy()
    v_u_8[v39] = tick()
    v_u_9[v39] = v44
    v43:FireServer()
    v_u_11[v39] = nil
    return v44
end
function v_u_7.release(p_u_45, p_u_46, p47)
    local v48 = p_u_45 or "folder"
    local v49 = "/"
    local v50 = p_u_46 or "subfolder"
    local v51 = "/"
    local v52
    if p47 == nil then
        v52 = ""
    else
        local v53 = p47.params_deduplication_hash
        assert(v53, "params requires a params_deduplication_hash so diffing can be done.")
        v52 = p47.params_deduplication_hash
    end
    local v_u_54 = v48 .. v49 .. v50 .. v51 .. v52
    if v_u_9[v_u_54] then
        local v55 = tick() - v_u_8[v_u_54]
        if v55 >= 20 then
            v_u_2("Releasing download", p_u_45, p_u_46)
            v_u_9[v_u_54]:Destroy()
            v_u_9[v_u_54] = nil
            return
        end
        v_u_2("Delaying download release by", 20 - v55, "seconds")
        v_u_9[v_u_54].Parent = nil
        v_u_10[v_u_54] = true
        delay(20 - v55, function()
            if v_u_10[v_u_54] == true and v_u_9[v_u_54] then
                v_u_2("Releasing download via delay", p_u_45, p_u_46)
                v_u_9[v_u_54]:Destroy()
                v_u_9[v_u_54] = nil
            end
        end)
    end
end
function v_u_7.promise_download_copy(p_u_56, p_u_57, p_u_58)
    local v_u_59 = v_u_6.try(function()
        return v_u_7.download(p_u_56, p_u_57, p_u_58):Clone()
    end)
    v_u_6.try(function()
        v_u_59:await()
        v_u_7.release(p_u_56, p_u_57, p_u_58)
    end)
    return v_u_59
end
function v_u_7.promise_download_copy_many(p60)
    local v_u_61 = {}
    for v62, v63 in pairs(p60) do
        v_u_61[v62] = v_u_7.promise_download_copy(v63[1], v63[2])
    end
    return v_u_6.new(function(p64, p65, p66)
        p66(function()
            for _, v67 in pairs(v_u_61) do
                v67:cancel()
            end
        end)
        local v68 = {}
        for v69, v70 in pairs(v_u_61) do
            local v71, v72 = v70:awaitStatus()
            if v71 == v_u_6.Status.Rejected then
                p65(v72)
                return
            end
            if v71 == v_u_6.Status.Cancelled then
                return
            end
            v68[v69] = v72
        end
        p64(v68)
    end)
end
function v_u_7.promise_download_display_data_for_item(p_u_73)
    return v_u_6.try(function()
        local v74 = v_u_3.get("DownloadsAPI/GetDisplayModelInfoForItem"):InvokeServer({
            ["owner_player"] = p_u_73.owner_player,
            ["display_type"] = p_u_73.display_type,
            ["item_unique"] = p_u_73.item_unique
        })
        if v74.status == "SUCCESS" then
            return v74.item_info
        else
            return nil
        end
    end)
end
return v_u_7