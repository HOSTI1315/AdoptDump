--// ReplicatedStorage.ClientModules.Game.ToolHelpers.ToppingsHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("AnimationManager")
local v_u_3 = v_u_1("ClientToolManager")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = v_u_1("InventoryDB")
local v_u_6 = {}
local function v_u_9(p7)
    if p7 == "pizza" then
        local v8 = v_u_2.get_track("PizzaPlaceToppings")
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(v8):Play()
        end
    end
end
local function v_u_14(p10, p11)
    local v12 = v_u_5.food[p10]
    local v13 = v_u_3.get_equipped_by_category("food")[1]
    if v13 ~= nil and p11[v13.id] then
        return true
    end
    v_u_1("UIManager").apps.HintApp:hint({
        ["text"] = string.format("Grab the %s first", p10 == "pizza" and "pizza dough" or string.lower(v12.name)),
        ["overridable"] = true,
        ["length"] = 5,
        ["yields"] = false
    })
    return false
end
v_u_6.is_baking = {}
function v_u_6.bake(p15, p16, p17)
    local v18 = typeof(p17) == "Instance" and p17 and p17 or p17.part
    if v_u_14(p15, p16) then
        if v_u_6.is_baking[v18] then
            return
        else
            local v19 = v18.BillboardGui.TextLabel
            v_u_6.is_baking[v18] = true
            if v_u_4.get("ToolAPI/BakeItem"):InvokeServer() then
                for v20 = 10, 0, -1 do
                    v19.Text = v20
                    wait(1)
                end
                v19.Text = ""
                v_u_6.is_baking[v18] = false
            else
                v_u_6.is_baking[v18] = false
            end
        end
    else
        return
    end
end
function v_u_6.buy_topping(p21, p22, p23)
    if v_u_14(p21, p22) then
        v_u_9(p21)
        v_u_4.get("ToolAPI/ModifyItemTopping"):InvokeServer(p23, true)
    end
end
return v_u_6