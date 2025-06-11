--// ReplicatedStorage.ClientModules.Game.HouseExteriorCache (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("DownloadClient")
local v3 = v_u_1("Signal")
local v_u_4 = v_u_1("package:Promise")
local v_u_5 = game:GetService("ReplicatedStorage").Resources:WaitForChild("HouseExteriors")
local v_u_6 = {}
local v_u_7 = v3.new()
local v_u_8 = {}
local v_u_9 = {}
function v_u_6.request(p_u_10)
    local v_u_11 = p_u_10.exterior_name
    local v12 = v_u_9[v_u_11]
    if v12 then
        return v_u_4.resolve(v12:Clone())
    elseif v_u_8[v_u_11] then
        return v_u_4.fromEvent(v_u_7, function(p13)
            return v_u_11 == p13
        end):andThen(function()
            if v_u_9[v_u_11] then
                return v_u_9[v_u_11]:Clone()
            else
                return v_u_6.request(p_u_10)
            end
        end)
    else
        local v14 = v_u_5:FindFirstChild(v_u_11)
        if v14 then
            v_u_9[v_u_11] = v14:Clone()
            return v_u_4.resolve(v14:Clone())
        else
            v_u_8[v_u_11] = true
            return v_u_2.promise_download_copy("HouseExteriors", v_u_11):andThen(function(p15)
                v_u_9[v_u_11] = p15:Clone()
                v_u_8[v_u_11] = false
                v_u_7:Fire(v_u_11)
                return p15
            end)
        end
    end
end
function v_u_6.flush()
    for _, v16 in v_u_9 do
        v16:Destroy()
    end
    v_u_9 = {}
end
function v_u_6.init()
    task.spawn(function()
        local v_u_17 = v_u_1("UIManager")
        local v_u_18 = v_u_4.resolve()
        v_u_17.app_visibilities_changed:Connect(function()
            if v_u_17.is_closed({ "HouseChooserApp", "HouseAddonsApp", "HousePurchaseApp" }) then
                if v_u_18:getStatus() ~= v_u_4.Status.Started then
                    v_u_18 = v_u_4.delay(10):andThen(function()
                        v_u_6.flush()
                    end)
                    return
                end
            else
                v_u_18:cancel()
            end
        end)
    end)
end
return v_u_6