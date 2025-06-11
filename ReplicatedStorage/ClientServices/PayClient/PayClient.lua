--// ReplicatedStorage.ClientServices.PayClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIDB")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("RouterClient")
local v5 = {}
game.Players.LocalPlayer:GetMouse()
local _ = game.Players.LocalPlayer
local function v_u_8(p6, p7)
    v_u_3.apps.DialogApp:dialog({
        ["text"] = p7,
        ["button"] = "Collect " .. p6 .. " Bucks",
        ["image_size"] = UDim2.new(0, 125, 0, 125),
        ["image"] = "rbxassetid://" .. v_u_2.small_money_stack_dialog
    })
    v_u_4.get("PayAPI/CollectEarnings"):FireServer()
end
function v5.init()
    v_u_4.get_event("PayAPI/PaymentReceived").OnClientEvent:connect(v_u_8)
end
return v5