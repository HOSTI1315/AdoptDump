--// ReplicatedStorage.ClientServices.Order_01.LocalizationDownloader (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("CloudValues")
local v_u_4 = v1("TranslationHelper")
local v_u_5 = v1("Debug").create_debug_log("trace", false)
local v_u_6 = game:GetService("LocalizationService")
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("ReplicatedStorage")
local v9 = {}
local v_u_10 = nil
local function v_u_43()
    v_u_5("LocalizationDownloader started")
    local v_u_11 = Instance.new("LocalizationTable")
    v_u_11.Name = "Downloaded"
    local v_u_12 = 0
    v_u_8:WaitForChild("PatchLocalization").OnClientEvent:Connect(function(p13, p14, p15)
        v_u_5("Received patch", p13)
        if v_u_12 == p13 - 1 then
            v_u_12 = p13
            local v16 = os.clock()
            local v17 = 0
            for v18, _ in p15.changed do
                v17 = v17 + 1
                v_u_4._available_key_cache[v18] = true
            end
            local v19 = 0
            for v20, _ in p15.removed do
                v19 = v19 + 1
                v_u_4._available_key_cache[v20] = nil
            end
            v_u_5("Entry count")
            v_u_5("  changed:", v17)
            v_u_5("  removed:", v19)
            local v21 = v_u_11:GetEntries()
            local v22 = {}
            for v23, v24 in v21 do
                if p15.changed[v24.Key] then
                    v21[v23] = p15.changed[v24.Key]
                    p15.changed[v24.Key] = nil
                elseif p15.removed[v24.Key] then
                    table.insert(v22, v23)
                end
            end
            for v25 = #v22, 1, -1 do
                table.remove(v21, v22[v25])
            end
            for _, v26 in p15.changed do
                table.insert(v21, v26)
            end
            v_u_11:SetEntries(v21)
            v_u_11.SourceLocaleId = p14
            v_u_11.Parent = v_u_6
            if v_u_10 then
                pcall(task.cancel, v_u_10)
            end
            v_u_10 = task.spawn(function()
                debug.profilebegin("LocalizationDownloader.refresh_all_text_localization")
                local v27 = os.clock()
                local v28 = v_u_3:getValue("localization", "renderingRefreshMinIterationsPerFrame")
                local v29 = v_u_3:getValue("localization", "renderingRefreshMaxTimePerFrame")
                local v30 = { v_u_7.LocalPlayer, workspace, v_u_8 }
                local v31 = 0
                local v32 = 0
                while v30[1] do
                    v31 = v31 + 1
                    local v33 = table.remove(v30)
                    if v33:IsDescendantOf(game) then
                        if v33:IsA("GuiBase2d") or v33:IsA("ProximityPrompt") then
                            if v33.AutoLocalize then
                                v33.AutoLocalize = false
                                v33.AutoLocalize = true
                            end
                        else
                            local v34 = v33:GetChildren()
                            table.move(v34, 1, #v34, #v30 + 1, v30)
                        end
                    end
                    if v29 < os.clock() - v27 and v28 < v31 then
                        debug.profileend()
                        task.wait()
                        debug.profilebegin("LocalizationDownloader.refresh_all_text_localization")
                        v27 = os.clock()
                        v32 = v32 + 1
                        v31 = 0
                    end
                end
                debug.profileend()
                v_u_5("refresh all text localization took ", v32, " yields")
            end)
            v_u_5("Patch took:", os.clock() - v16)
            return true
        end
        warn("Localization patches out of sync! Expected patch number", v_u_12 + 1, "but got", p13)
        warn("This should never happen. This indicates that something is making RemoteEvents unreliable. Is something listening to RemoteEvents early, like new code or a new plugin? Is this a Roblox bug?")
        if v_u_12 < p13 then
            v_u_12 = p13
        end
        v_u_2.get("LocalizationAPI/ResyncLocalization"):FireServer()
    end)
    v_u_5("LocalizationDownloader connected")
    if v_u_12 == 0 then
        warn("It looks like there wasn\'t any queued localization table patches. This is probably due to a bug with RemoteEvents so we\'re requesting a resync.")
        v_u_2.get("LocalizationAPI/ResyncLocalization"):FireServer()
    end
    v_u_2.get("LocalizationAPI/RenderingRefresh").OnClientEvent:Connect(function()
        if v_u_10 then
            pcall(task.cancel, v_u_10)
        end
        v_u_10 = task.spawn(function()
            debug.profilebegin("LocalizationDownloader.refresh_all_text_localization")
            local v35 = os.clock()
            local v36 = v_u_3:getValue("localization", "renderingRefreshMinIterationsPerFrame")
            local v37 = v_u_3:getValue("localization", "renderingRefreshMaxTimePerFrame")
            local v38 = { v_u_7.LocalPlayer, workspace, v_u_8 }
            local v39 = 0
            local v40 = 0
            while v38[1] do
                v39 = v39 + 1
                local v41 = table.remove(v38)
                if v41:IsDescendantOf(game) then
                    if v41:IsA("GuiBase2d") or v41:IsA("ProximityPrompt") then
                        if v41.AutoLocalize then
                            v41.AutoLocalize = false
                            v41.AutoLocalize = true
                        end
                    else
                        local v42 = v41:GetChildren()
                        table.move(v42, 1, #v42, #v38 + 1, v38)
                    end
                end
                if v37 < os.clock() - v35 and v36 < v39 then
                    debug.profileend()
                    task.wait()
                    debug.profilebegin("LocalizationDownloader.refresh_all_text_localization")
                    v35 = os.clock()
                    v40 = v40 + 1
                    v39 = 0
                end
            end
            debug.profileend()
            v_u_5("refresh all text localization took ", v40, " yields")
        end)
    end)
end
function v9.init()
    task.spawn(v_u_43)
end
return v9