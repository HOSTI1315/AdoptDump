--// ReplicatedStorage.CmdrClient (ModuleScript)

local v1 = game:GetService("RunService")
local v2 = game:GetService("StarterGui")
local v3 = game:GetService("Players").LocalPlayer
local v4 = script:WaitForChild("Shared")
local v_u_5 = require(v4:WaitForChild("Util"))
if v1:IsClient() == false then
    error("[Cmdr] Server scripts cannot require the client library. Please require the server library from the server to use Cmdr in your own code.")
end
local v6 = {
    ["ReplicatedRoot"] = script,
    ["RemoteFunction"] = script:WaitForChild("CmdrFunction"),
    ["RemoteEvent"] = script:WaitForChild("CmdrEvent"),
    ["ActivationKeys"] = {
        [Enum.KeyCode.F2] = true
    },
    ["Enabled"] = true,
    ["MashToEnable"] = false,
    ["ActivationUnlocksMouse"] = false,
    ["HideOnLostFocus"] = true,
    ["PlaceName"] = "Cmdr",
    ["Util"] = v_u_5,
    ["Events"] = {}
}
local v_u_10 = setmetatable(v6, {
    ["__index"] = function(p_u_7, p8)
        local v_u_9 = p_u_7.Dispatcher[p8]
        if v_u_9 and type(v_u_9) == "function" then
            return function(_, ...)
                return v_u_9(p_u_7.Dispatcher, ...)
            end
        end
    end
})
v_u_10.Registry = require(v4.Registry)(v_u_10)
v_u_10.Dispatcher = require(v4.Dispatcher)(v_u_10)
if v2:WaitForChild("Cmdr") and (wait() and v3:WaitForChild("PlayerGui"):FindFirstChild("Cmdr") == nil) then
    v2.Cmdr:Clone().Parent = v3.PlayerGui
end
local v_u_11 = require(script.CmdrInterface)(v_u_10)
function v_u_10.SetActivationKeys(p12, p13)
    p12.ActivationKeys = v_u_5.MakeDictionary(p13)
end
function v_u_10.SetPlaceName(p14, p15)
    p14.PlaceName = p15
    v_u_11.Window:UpdateLabel()
end
function v_u_10.SetEnabled(p16, p17)
    p16.Enabled = p17
end
function v_u_10.SetActivationUnlocksMouse(p18, p19)
    p18.ActivationUnlocksMouse = p19
end
function v_u_10.Show(p20)
    if p20.Enabled then
        v_u_11.Window:Show()
    end
end
function v_u_10.Hide(_)
    v_u_11.Window:Hide()
end
function v_u_10.Toggle(p21)
    if p21.Enabled then
        v_u_11.Window:SetVisible(not v_u_11.Window:IsVisible())
    else
        p21:Hide()
    end
end
function v_u_10.SetMashToEnable(p22, p23)
    p22.MashToEnable = p23
    if p23 then
        p22:SetEnabled(false)
    end
end
function v_u_10.SetHideOnLostFocus(p24, p25)
    p24.HideOnLostFocus = p25
end
function v_u_10.HandleEvent(p26, p27, p28)
    p26.Events[p27] = p28
end
if v1:IsServer() == false then
    v_u_10.Registry:RegisterTypesIn(script:WaitForChild("Types"))
    v_u_10.Registry:RegisterCommandsIn(script:WaitForChild("Commands"))
end
v_u_10.RemoteEvent.OnClientEvent:Connect(function(p29, ...)
    if v_u_10.Events[p29] then
        v_u_10.Events[p29](...)
    end
end)
require(script.DefaultEventHandlers)(v_u_10)
return v_u_10