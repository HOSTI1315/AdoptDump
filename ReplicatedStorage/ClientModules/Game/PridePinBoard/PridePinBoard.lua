--// ReplicatedStorage.ClientModules.Game.PridePinBoard (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("ClientData")
local v_u_7 = v1("SharedConstants")
local v_u_8 = v1("package:Promise")
local v9 = {}
local v_u_10 = {
    ["ace_pride_pin"] = "AcePridePin",
    ["agender_pride_pin"] = "AgenderPridePin",
    ["aromantic_pride_pin"] = "AromanticPridePin",
    ["bi_pride_pin"] = "BiPridePin",
    ["demi_pride_pin"] = "DemiPridePin",
    ["enby_pride_pin"] = "EnbyPridePin",
    ["gay_man_pride_pin"] = "GayManPridePin",
    ["gay_pride_pin"] = "GayPridePin",
    ["genderfluid_pride_pin"] = "GenderFluidPridePin",
    ["lesbian_pride_pin"] = "LesbianPridePin",
    ["lgbtq_pride_pin"] = "LGBTQPridePin",
    ["pan_pride_pin"] = "PanPridePin",
    ["trans_pride_pin"] = "TransPridePin",
    ["pride_2022_gender_queer_pride_pin"] = "Pride2022GenderQueerPridePin",
    ["pride_2022_omnisex_pride_pin"] = "Pride2022OmnisexPridePin",
    ["pride_2022_intersex_pride_pin"] = "Pride2022IntersexPridePin"
}
local v_u_11 = {
    ["trans_pride_pin"] = Vector3.new(-1, 0, 0),
    ["genderfluid_pride_pin"] = Vector3.new(-1, 0, 0),
    ["enby_pride_pin"] = Vector3.new(-1, 0, 0),
    ["bi_pride_pin"] = Vector3.new(-1, 0, 0),
    ["demi_pride_pin"] = Vector3.new(-1, 0, 0),
    ["lesbian_pride_pin"] = Vector3.new(-1, 0, 0),
    ["lgbtq_pride_pin"] = Vector3.new(-1, 0, 0),
    ["agender_pride_pin"] = Vector3.new(-1, 0, 0),
    ["gay_pride_pin"] = Vector3.new(-1, 0, 0),
    ["ace_pride_pin"] = Vector3.new(-1, 0, 0),
    ["pan_pride_pin"] = Vector3.new(-1, 0, 0),
    ["gay_man_pride_pin"] = Vector3.new(-1, 0, 0),
    ["aromantic_pride_pin"] = Vector3.new(-1, 0, 0),
    ["pride_2022_gender_queer_pride_pin"] = Vector3.new(-1, 0, 0),
    ["pride_2022_omnisex_pride_pin"] = Vector3.new(-1, 0, 0),
    ["pride_2022_intersex_pride_pin"] = Vector3.new(-1, 0, 0)
}
local function v_u_15(p12)
    local v13 = game.ReplicatedStorage.Resources.Particles.PridePinPoof:Clone()
    local v14 = Instance.new("Attachment")
    v13.Parent = v14
    v14.Parent = p12
    v13:Emit(10)
    game:GetService("Debris"):AddItem(v14, 10)
end
function v9.start(p16, p_u_17)
    local v18 = p16.PridePinBoard
    local v_u_19 = v18.PinParts
    local v_u_20 = v18:FindFirstChild("TimerGui", true)
    local v_u_21 = v_u_20:FindFirstChild("TimerLabel", true)
    local v_u_22 = {}
    local function v_u_37()
        local v23 = v_u_6.get("pride_pin_last_taken_time")
        local v24 = v_u_6.get("pride_pin_last_taken_kind")
        local v25 = os.time()
        local v26 = v_u_7.time_between_pride_pin_awards - (v25 - v23)
        if v26 <= 0 then
            for _, v27 in pairs(v_u_10) do
                local v28 = v_u_19:FindFirstChild(v27)
                if v28 then
                    v28.Transparency = 0
                end
            end
            for _, v29 in ipairs(v_u_22) do
                v29:set_hidden(false)
            end
            v_u_20.Enabled = false
        else
            for v30, v31 in pairs(v_u_10) do
                local v32 = v_u_19:FindFirstChild(v31)
                if v32 then
                    if v30 == v24 then
                        v32.Transparency = 1
                    else
                        v32.Transparency = 0
                    end
                end
            end
            for _, v33 in ipairs(v_u_22) do
                v33:set_hidden(true)
            end
            local v34 = v26 / 60
            local v35 = math.floor(v34)
            local v36 = v26 % 60
            v_u_20.Enabled = true
            v_u_21.Text = ("FREE PIN AVAILABLE IN\n%02d:%02d"):format(v35, v36)
        end
    end
    local v_u_38 = false
    local function v45(p_u_39, p_u_40, p41)
        local v_u_42 = v_u_4.pet_accessories[p_u_40]
        local v43 = v_u_2:register({
            ["text"] = ("ui.take_item [%s]"):format(v_u_42.name),
            ["on_selected"] = function()
                if not v_u_38 then
                    v_u_38 = true
                    if v_u_3.apps.DialogApp:dialog({
                        ["left"] = "No",
                        ["right"] = "Yes",
                        ["text"] = ("Do you want to take a free %s?"):format(v_u_42.name)
                    }) == "Yes" and v_u_5.get("EventAPI/TakePridePin"):InvokeServer(p_u_40) then
                        v_u_37()
                        v_u_15(p_u_39)
                        v_u_3.apps.HintApp:hint({
                            ["text"] = ("You collected a free %s!"):format(v_u_42.name),
                            ["length"] = 5,
                            ["overridable"] = true
                        })
                    end
                    v_u_38 = false
                end
            end,
            ["part"] = p_u_39,
            ["offset"] = p_u_39.CFrame:vectorToWorldSpace(p41)
        })
        local v44 = v_u_22
        table.insert(v44, v43)
    end
    for v46, v47 in pairs(v_u_10) do
        v45(v_u_19:FindFirstChild(v47), v46, v_u_11[v46])
    end
    p_u_17.pin_interactions = v_u_22
    coroutine.wrap(function()
        while not p_u_17:is_exited() do
            v_u_8.delay(1):await()
            v_u_37()
        end
    end)()
    v_u_37()
    p_u_17.pin_interactions = v_u_22
end
function v9.stop(_, p48)
    for _, v49 in ipairs(p48.pin_interactions) do
        v49:destroy()
    end
end
return v9