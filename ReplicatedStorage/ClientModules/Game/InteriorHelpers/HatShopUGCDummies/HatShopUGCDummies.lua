--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.HatShopUGCDummies (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("TableUtil")
local v_u_4 = v1("UGCHelper")
local v_u_5 = v1("LiveOpsTime")
local v_u_6 = v1("FormatHelper")
local v_u_7 = v1("DownloadClient")
local v_u_8 = v1("package:Sift")
local v_u_9 = v1("package:Promise")
local v10 = game:GetService("Players")
local v_u_11 = game:GetService("MarketplaceService")
local v_u_12 = v10.LocalPlayer
local v13 = {}
local v_u_14 = nil
local v_u_15 = nil
local function v_u_17(p16)
    return {
        p16.UGCShopInterior.DummyOrigins.Origin1,
        p16.UGCShopInterior.DummyOrigins.Origin2,
        p16.UGCShopInterior.DummyOrigins.Origin3,
        p16.UGCShopInterior.DummyOrigins.Origin4,
        p16.UGCShopInterior.DummyOrigins.Origin5
    }
end
local function v_u_20(p18)
    while true do
        local v19 = p18:FindFirstChildOfClass("Accessory")
        if not v19 then
            break
        end
        v19:Destroy()
    end
end
local function v_u_28()
    local v21 = v_u_4.get_asset_ids()
    if #v21 == 0 then
        return {}
    end
    local v22 = v_u_5.now() / 60
    local v23 = math.floor(v22)
    if v_u_14 == v23 then
        return v_u_15
    end
    table.sort(v21)
    local v24 = Random.new((math.abs(v23)))
    v_u_3.shuffle(v21, v24)
    local v25 = v_u_8.List.slice
    local v26 = #v21
    local v27 = v25(v21, 1, (math.min(v26, 5)))
    v_u_14 = v23
    v_u_15 = v27
    return v_u_15
end
local function v_u_45(p29, p30)
    local v_u_31 = v_u_17(p29)
    local v_u_32 = p30.ugc_dummies
    for _, v33 in ipairs(v_u_32) do
        v_u_20(v33)
    end
    return v_u_9.new(function(p34, _, p35)
        for v36, v37 in ipairs((v_u_28())) do
            if p35() then
                return
            end
            local v38 = v_u_4.get_info_for_asset_id(v37)
            if v38 ~= nil then
                local v39 = { "UGCAccessories", (tostring(v37)) }
                local v40 = v_u_7.download(unpack(v39))
                if p35() then
                    v_u_7.release(unpack(v39))
                    return
                end
                local v41 = v40:Clone()
                v41:FindFirstChildWhichIsA("BasePart").Anchored = true
                v_u_7.release(unpack(v39))
                local v42 = v_u_32[v36]
                if v38.AccessoryType == Enum.AccessoryType.Back then
                    v42:SetPrimaryPartCFrame(v_u_31[v36].CFrame * CFrame.Angles(0, 3.141592653589793, 0))
                else
                    v42:SetPrimaryPartCFrame(v_u_31[v36].CFrame)
                end
                local v43 = v41:FindFirstChildWhichIsA("BasePart")
                local v44 = v43:FindFirstChildWhichIsA("Attachment")
                v43.CFrame = v42:FindFirstChild(v44.Name, true).WorldCFrame * v44.CFrame:Inverse()
                v41.Parent = v42
            end
        end
        p34()
    end)
end
function v13.interactions(p46)
    local v47 = v_u_17(p46)
    local v48 = {}
    for v_u_49, v50 in ipairs(v47) do
        local v54 = v_u_2:register({
            ["text"] = function()
                local v51 = v_u_28()[v_u_49]
                if not v51 then
                    return ""
                end
                local v52 = v_u_4.get_info_for_asset_id(v51)
                return ("ui.buy_label_item [%s]"):format(not v52 and "???" or v52.Name)
            end,
            ["part"] = v50,
            ["is_visible"] = function()
                return v_u_28()[v_u_49] ~= nil
            end,
            ["on_selected"] = function()
                local v53 = v_u_28()[v_u_49]
                if v53 then
                    v_u_11:PromptPurchase(v_u_12, v53, false)
                end
            end,
            ["offset"] = v50.CFrame.Rotation * Vector3.new(0, -2.5, -1)
        })
        table.insert(v48, v54)
    end
    return v48
end
function v13.render(p_u_55, p_u_56)
    local v57 = v_u_17(p_u_55)
    local v58 = {}
    for v59, v60 in ipairs(v57) do
        local v61 = game.ReplicatedStorage.Resources.UGCDummyTemplate:Clone()
        v61:SetPrimaryPartCFrame(v60.CFrame)
        v61.Parent = p_u_55
        v58[v59] = v61
    end
    p_u_56.ugc_dummies = v58
    p_u_56.ugc_refresh_loop_promise = v_u_9.new(function(_, _, p62)
        while not p62() do
            local v_u_63 = v_u_45(p_u_55, p_u_56)
            local v64 = v_u_5.delay_until
            local v65 = v_u_5.now() / 60
            local v_u_66 = v64(math.floor(v65) * 60 + 60)
            p62(function()
                v_u_63:cancel()
                v_u_66:cancel()
            end)
            v_u_9.allSettled({ v_u_63, v_u_66 }):await()
        end
    end)
    local v_u_67 = p_u_55:FindFirstChild("UGCRefreshTimerLabel", true)
    task.spawn(function()
        while not p_u_56:is_exited() do
            local v68 = v_u_5.now() / 60
            local v69 = math.floor(v68) * 60 + 60 - v_u_5.now()
            local v70 = math.max(0, v69)
            local v71 = v_u_6.get_time_breakdown(v70)
            v_u_67.Text = ("NEW ITEMS IN %02d:%02d"):format(v71.minutes, v71.seconds)
            task.wait(1)
        end
    end)
end
function v13.cleanup(_, p72)
    for _, v73 in ipairs(p72.ugc_dummies) do
        v73:Destroy()
    end
    p72.ugc_refresh_loop_promise:cancel()
    p72.ugc_refresh_loop_promise = nil
end
return v13