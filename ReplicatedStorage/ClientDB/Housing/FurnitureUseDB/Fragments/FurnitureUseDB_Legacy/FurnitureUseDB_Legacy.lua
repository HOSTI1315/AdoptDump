--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Fragments.FurnitureUseDB-Legacy (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("FurnitureUseHelperDB")
local v3 = v_u_1("DeveloperProductDB")
local v_u_4 = v_u_1("AnimationManager")
local v_u_5 = v_u_1("SharedConstants")
local v_u_6 = v_u_1("InventoryDB")
local v7 = v_u_1("GamepassDB")
local v_u_8 = v_u_1("Utilities")
local v_u_9 = v_u_1("Signal")
local v_u_10 = game:GetService("Players")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("HttpService")
local v_u_13 = game:GetService("TweenService")
local v727 = {
    ["doctor"] = v2.DOCTOR("doctor"),
    ["pet_trainer"] = v2.PET_TRAINER("pet_trainer"),
    ["nurse"] = v2.NPC_SIMPLE("nurse"),
    ["doug"] = v2.NPC_SIMPLE("doug"),
    ["holly"] = v2.NPC_SIMPLE("holly"),
    ["chef"] = v2.NPC_SIMPLE("chef"),
    ["eda"] = v2.NPC_SIMPLE("eda"),
    ["rich"] = v2.NPC_SIMPLE("rich"),
    ["anna"] = v2.NPC_SIMPLE("anna"),
    ["brad"] = v2.NPC_SIMPLE("brad"),
    ["santa"] = v2.NPC_SIMPLE("santa"),
    ["archer"] = v2.NPC_SIMPLE("archer"),
    ["elsa"] = v2.NPC_SIMPLE("elsa"),
    ["captainarg"] = v2.NPC_SIMPLE("captainarg"),
    ["sophie"] = v2.NPC_SIMPLE("sophie"),
    ["justin"] = v2.NPC_SIMPLE("justin"),
    ["burt"] = v2.NPC_SIMPLE("burt"),
    ["javier"] = v2.NPC_SIMPLE("javier"),
    ["emma"] = v2.NPC_SIMPLE("emma"),
    ["ella"] = v2.NPC_SIMPLE("ella"),
    ["sean"] = v2.NPC_SIMPLE("sean"),
    ["agent_lily"] = v2.TRADE_HISTORY_NPC("agent_lily"),
    ["agent_jake"] = v2.LICENSE_TEST_INFORMATION_NPC("agent_jake"),
    ["agent_alex"] = v2.BEGIN_LICENSE_TEST_NPC("agent_alex"),
    ["agent_ruhi"] = v2.NPC_SIMPLE("agent_ruhi"),
    ["nixie"] = v2.NPC_SIMPLE("nixie"),
    ["tom"] = v2.NPC_SIMPLE("tom"),
    ["bonny"] = v2.NPC_SIMPLE("bonny"),
    ["beetrice"] = v2.NPC_SIMPLE("beetrice", {
        ["talking_to_anim"] = v_u_6.pets.queen_bee.anims.idle,
        ["idle_anim"] = v_u_6.pets.queen_bee.anims.idle
    }),
    ["lily_ladybug"] = v2.NPC_SIMPLE("lily_ladybug", {
        ["talking_to_anim"] = v_u_6.pets.diamond_ladybug.anims.idle,
        ["idle_anim"] = v_u_6.pets.diamond_ladybug.anims.idle
    }),
    ["horse"] = v2.GAMEPASS_PET("horse", {
        ["talking_to_anim"] = v_u_6.pets.horse.anims.idle,
        ["idle_anim"] = v_u_6.pets.horse.anims.sit
    }),
    ["griffin"] = v2.GAMEPASS_PET("griffin", {
        ["talking_to_anim"] = v_u_6.pets.griffin.anims.idle,
        ["idle_anim"] = v_u_6.pets.griffin.anims.sit
    }),
    ["sloth"] = v2.GAMEPASS_PET("sloth", {
        ["talking_to_anim"] = v_u_6.pets.sloth.anims.idle,
        ["idle_anim"] = v_u_6.pets.sloth.anims.sit
    }),
    ["panda"] = v2.GAMEPASS_PET("panda", {
        ["talking_to_anim"] = v_u_6.pets.panda.anims.idle,
        ["idle_anim"] = v_u_6.pets.panda.anims.sit
    }),
    ["kitsune"] = v2.GAMEPASS_PET("kitsune", {
        ["talking_to_anim"] = v_u_6.pets.kitsune.anims.idle,
        ["idle_anim"] = v_u_6.pets.kitsune.anims.sit
    }),
    ["fogmachine"] = v2.FOGMACHINE("fogmachine"),
    ["fireplace"] = v2.FIREPLACE("fireplace"),
    ["christmasfireplace"] = v2.FIREPLACE("fireplace"),
    ["discoball"] = v2.TOGGLEABLE("discoball"),
    ["modernhanginglight"] = v2.LIGHT("modernhanginglight"),
    ["basicceilinglight"] = v2.LIGHT("basicceilinglight"),
    ["coneceilinglight"] = v2.LIGHT("coneceilinglight"),
    ["lightbulb"] = v2.LIGHT("lightbulb"),
    ["stagelight"] = v2.LIGHT("stagelight"),
    ["photographylight"] = v2.LIGHT("photographylight"),
    ["stylishhanginglamp"] = v2.LIGHT("stylishhanginglamp"),
    ["poshlamp"] = v2.LIGHT("poshlamp"),
    ["curvedlamp"] = v2.LIGHT("curvedlamp"),
    ["expensivelamp"] = v2.LIGHT("expensivelamp"),
    ["trihanginglights"] = v2.LIGHT("trihanginglights"),
    ["cheaptablelamp"] = v2.LIGHT("cheaptablelamp"),
    ["cheapfloorlamp"] = v2.LIGHT("cheapfloorlamp"),
    ["fancyfloorlamp"] = v2.LIGHT("fancyfloorlamp"),
    ["dogfloorlamp"] = v2.LIGHT("dogfloorlamp"),
    ["basictablelamp"] = v2.LIGHT("basictablelamp"),
    ["basicfloorlamp"] = v2.LIGHT("basicfloorlamp"),
    ["fancytablelamp"] = v2.LIGHT("fancytablelamp"),
    ["dogtablelamp"] = v2.LIGHT("dogtablelamp"),
    ["moderntablelamp"] = v2.LIGHT("moderntablelamp"),
    ["modernfloorlamp"] = v2.LIGHT("modernfloorlamp"),
    ["heartlamp"] = v2.LIGHT("heartlamp"),
    ["jackolantern"] = v2.LIGHT("jackolantern"),
    ["donut_lamp"] = v2.LIGHT("donut_lamp"),
    ["mermaidlamp"] = v2.LIGHT("mermaidlamp"),
    ["flowerlamp"] = v2.LIGHT("flowerlamp"),
    ["gingerbread_floor_lamp"] = v2.LIGHT("gingerbread_floor_lamp"),
    ["pride_2022_pride_lamp"] = v2.LIGHT("pride_2022_pride_lamp"),
    ["japan_2022_japanese_lamp"] = v2.LIGHT("pride_2022_pride_lamp"),
    ["steampunk_2022_light"] = v2.LIGHT("steampunk_2022_light"),
    ["steampunk_2022_lamp"] = v2.LIGHT("steampunk_2022_lamp"),
    ["winter_2022_lollipop_light"] = v2.LIGHT("winter_2022_lollipop_light"),
    ["poshtv"] = v2.TV_SCREEN("poshtv"),
    ["moderntv"] = v2.TV_SCREEN("moderntv"),
    ["stylishtv"] = v2.TV_SCREEN("stylishtv"),
    ["normaltv"] = v2.TV_SCREEN("normaltv"),
    ["cheaptv"] = v2.TV_SCREEN("cheaptv"),
    ["schooltv"] = v2.TV_SCREEN("schooltv"),
    ["vampiretv"] = v2.TV_SCREEN("vampiretv"),
    ["cinemascreen"] = v2.TV_SCREEN("cinemascreen"),
    ["futuristictv"] = v2.TV_SCREEN("futuristictv"),
    ["mermaidtv"] = v2.TV_SCREEN("mermaidtv"),
    ["leaftv"] = v2.TV_SCREEN("leaftv"),
    ["gingerbread_tv"] = v2.TV_SCREEN("gingerbread_tv"),
    ["fifties_2022_tv"] = v2.TV_SCREEN("fifties_2022_tv"),
    ["laptop"] = v2.SCREEN("laptop"),
    ["dancefloor"] = v2.DANCE_FLOOR,
    ["bigdancefloor"] = v2.DANCE_FLOOR,
    ["rounddancefloor"] = v2.DANCE_FLOOR,
    ["smallfan"] = v2.FAN_ANIMATION,
    ["cheapfan"] = v2.FAN_ANIMATION,
    ["nicefan"] = v2.FAN_ANIMATION,
    ["expensivefan"] = v2.FAN_ANIMATION,
    ["fancyfan"] = v2.FAN_ANIMATION,
    ["bouncycastle"] = {
        ["render"] = function(_, p14)
            v_u_1("Trampoline").hook_up_trampoline(p14.TrampolinePart, {
                ["upwards_velocity"] = 50,
                ["time_length"] = 0.1,
                ["upper_height_cutoff"] = 3
            })
        end
    },
    ["dumbbell"] = {
        ["use_text"] = "Take Dumbbell",
        ["use_permissions"] = "EVERYONE",
        ["client_use"] = function(_, _, _)
            v_u_1("ShopM").buy_item(nil, {
                ["category"] = "toys",
                ["id"] = "dumbbell",
                ["purchase_confirmation"] = false
            })
        end
    },
    ["bigdrawing"] = v2.DRAWING_BOARD(""),
    ["metaldrawing"] = v2.DRAWING_BOARD(""),
    ["woodendrawing"] = v2.DRAWING_BOARD(""),
    ["chalkboard"] = v2.DRAWING_BOARD(""),
    ["moneytree"] = {
        ["use_text"] = "Collect Bucks",
        ["post_render"] = function(_, p15, _)
            p15.AnimationController:LoadAnimation(v_u_4.get_track("MoneyTreeDance")):Play()
        end,
        ["server_use"] = function(p16, p17, _)
            local v18 = v_u_1("DataM")
            local v19 = v_u_1("GrammarUtil")
            local v20 = v_u_1("new:CurrencyServer")
            local v21 = v_u_1("MsgBridge")
            local v22 = v_u_1("NotificationManager")
            local v23 = v18.get_store(p16):get("daily_login_manager")
            local v24 = p17.last_collected_time
            local v25 = (os.time() - (v24 or 0)) / 75
            local v26 = math.floor(v25)
            local v27 = math.clamp(v26, 0, 8)
            local v28 = v23:get("money_tree_bucks_collected") or 0
            if v28 >= 100 then
                v21.hint(p16, {
                    ["text"] = "You\'ve collected the maximum Bucks for today. Come back tomorrow for more!",
                    ["length"] = 6,
                    ["overridable"] = true
                })
            else
                if v27 > 0 then
                    p17.last_collected_time = os.time()
                    v23:set("money_tree_bucks_collected", v28 + v27)
                    v20.modify_bucks(p16, v27, "Income", "MoneyTree")
                    local v29 = v22.indicate_event
                    local v30 = {
                        ["name"] = "money_tree_bucks_collected",
                        ["player"] = p16,
                        ["options"] = {
                            ["bucks"] = v27,
                            ["bucks_cumulative"] = v28 + v27,
                            ["maxed"] = v28 + v27 >= 100
                        }
                    }
                    v29(v30)
                end
                v21.hint(p16, {
                    ["text"] = "You collected " .. v27 .. " " .. v19.get_plural_or_singular(v27, "Bucks", "Buck") .. "!",
                    ["length"] = 4,
                    ["overridable"] = true
                })
            end
        end,
        ["render"] = function(p_u_31, p_u_32, p_u_33)
            local v_u_34 = v_u_1("RouterClient")
            local function v_u_38(p35, p36)
                for _, v37 in pairs(p35:GetChildren()) do
                    if v37:IsA("BasePart") then
                        v37.Transparency = p36
                    end
                end
            end
            v_u_38(p_u_32.Left, 1)
            v_u_38(p_u_32.Right, 1)
            spawn(function()
                local v39 = v_u_34.get("InteractablesAPI/GetTimeElapsedSinceLastCollectedMoneyTree"):InvokeServer(p_u_33)
                local v40 = tick()
                if v39 == nil then
                    return
                end
                while true do
                    local v41 = tick() - v40 + v39
                    if v41 >= 60 then
                        v_u_38(p_u_32.Left, 0)
                        v_u_38(p_u_32.Right, 0)
                    elseif v41 >= 30 then
                        v_u_38(p_u_32.Left, 1)
                        v_u_38(p_u_32.Right, 0)
                    else
                        v_u_38(p_u_32.Left, 1)
                        v_u_38(p_u_32.Right, 1)
                    end
                    wait(3)
                    if p_u_32 == nil or (p_u_32.Parent == nil or p_u_31.interior_version_removed) then
                        return
                    end
                end
            end)
        end
    },
    ["fakemoneytree"] = {
        ["post_render"] = function(p_u_42, p_u_43, _)
            local v_u_44 = p_u_43.AnimationController:LoadAnimation(v_u_4.get_track("MoneyTreeDance"))
            v_u_44:Play()
            spawn(function()
                repeat
                    wait(0.1)
                until p_u_43 == nil or (p_u_43.Parent == nil or p_u_42.interior_version_removed)
                v_u_44:Stop()
            end)
        end
    },
    ["boombox"] = v2.RADIO,
    ["jukebox"] = v2.RADIO,
    ["dj"] = v2.RADIO,
    ["gingerbread_jukebox"] = v2.RADIO,
    ["teleporter"] = v2.TELEPORTER("SkyCastle", "MainDoor"),
    ["magicalshard"] = v2.MAGICALSHARD,
    ["basicdoor"] = v2.INTERIOR_DOOR(),
    ["fancydoor"] = v2.INTERIOR_DOOR(),
    ["glassdoor"] = v2.INTERIOR_DOOR(),
    ["woodendoor"] = v2.INTERIOR_DOOR(),
    ["normaldoor"] = v2.INTERIOR_DOOR(),
    ["superglassdoor"] = v2.INTERIOR_DOOR(),
    ["speedcauldron"] = v2.CAULDRON("speedcauldron"),
    ["bigheadcauldron"] = v2.CAULDRON("bigheadcauldron"),
    ["antigravcauldron"] = v2.CAULDRON("antigravcauldron"),
    ["pizzadough"] = v2.GRAB_ITEM("food", "pizza"),
    ["donuts"] = v2.GRAB_ITEM("food", "donut"),
    ["vanilla_icing"] = v2.ADD_TOPPING("donut", "vanilla_icing"),
    ["strawberry_icing"] = v2.ADD_TOPPING("donut", "strawberry_icing"),
    ["chocolate_icing"] = v2.ADD_TOPPING("donut", "chocolate_icing"),
    ["peppers_topping"] = v2.ADD_TOPPING("pizza", "peppers"),
    ["cheese_topping"] = v2.ADD_TOPPING("pizza", "cheese"),
    ["tomato_topping"] = v2.ADD_TOPPING("pizza", "tomato_sauce"),
    ["pepperoni_topping"] = v2.ADD_TOPPING("pizza", "pepperoni"),
    ["pizzaoven"] = v2.BAKE_ITEM("pizza"),
    ["donut_oven"] = v2.BAKE_ITEM("donut"),
    ["cashregister"] = v2.CASH_REGISTER,
    ["golden_cash_register"] = v2.CASH_REGISTER,
    ["age_o_matic"] = {
        ["render"] = function(_, p_u_45)
            local v_u_46 = v_u_1("UIManager")
            local v_u_47 = v_u_1("RouterClient")
            local v_u_48 = v_u_1("ClientData")
            coroutine.wrap(function()
                local v49 = 0
                while true do
                    if v49 % 2 == 0 then
                        for _, v50 in pairs(p_u_45.Machine.NeonParts:GetChildren()) do
                            v50.Color = Color3.fromRGB(174, 123, 161)
                        end
                    else
                        for _, v51 in pairs(p_u_45.Machine.NeonParts:GetChildren()) do
                            v51.Color = Color3.fromRGB(82, 124, 174)
                        end
                    end
                    v49 = v49 + 1
                    wait(0.5)
                    if p_u_45 == nil or p_u_45.Parent == nil then
                        return
                    end
                end
            end)()
            local v_u_52 = false
            p_u_45.Machine.TouchBrick.Touched:connect(function(p53)
                if game.Players.LocalPlayer.Character == nil then
                    return
                elseif p53:IsDescendantOf(game.Players.LocalPlayer.Character) then
                    if v_u_52 then
                        return
                    else
                        v_u_52 = true
                        local v54 = v_u_46.apps.DialogApp:dialog({
                            ["dialog_type"] = "RoleChooserDialog"
                        })
                        if v54 == v_u_48.get("team") then
                            wait(5)
                            v_u_52 = false
                        else
                            v_u_46.apps.TransitionsApp:transition({
                                ["length"] = 0.75,
                                ["start_transparency"] = 1,
                                ["end_transparency"] = 0
                            })
                            v_u_47.get("TeamAPI/ChooseTeam"):InvokeServer(v54, {
                                ["dont_send_back_home"] = true,
                                ["source_for_logging"] = "age_o_matic"
                            })
                            v_u_46.apps.TransitionsApp:transition({
                                ["length"] = 0.75,
                                ["start_transparency"] = 0,
                                ["end_transparency"] = 1
                            })
                            wait(5)
                            v_u_52 = false
                        end
                    end
                else
                    return
                end
            end)
        end
    },
    ["human_cannon"] = {
        ["use_text"] = "Use",
        ["use_permissions"] = "EVERYONE",
        ["caregiver_assist"] = true,
        ["server_use"] = function(_, p55, p56, _, _, p57, _)
            local v58 = v_u_1("CharacterWrapper").get(p57)
            if v58 then
                v58.state_manager:exit_all_states()
                if not p55.occupied then
                    p55.occupied = true
                    p56()
                    wait(3)
                    p55.occupied = false
                end
            else
                return
            end
        end,
        ["render"] = function(p59, p60)
            local v61 = p59.occupied or false
            for _, v62 in pairs(p60.Particles:GetChildren()) do
                v62.Enabled = v61
            end
        end,
        ["client_use"] = function(_, _, p63, p_u_64)
            local v_u_65 = v_u_1("CharWrapperClient")
            if p_u_64 and p_u_64:FindFirstChild("HumanoidRootPart") then
                local v_u_66 = p63.Dummy.HumanoidRootPart.CFrame
                p_u_64.PrimaryPart = p_u_64.HumanoidRootPart
                p_u_64:SetPrimaryPartCFrame(v_u_66)
                local v_u_67 = Instance.new("BodyPosition")
                v_u_67.MaxForce = Vector3.new(inf, inf, inf)
                v_u_67.Position = v_u_66.p
                v_u_67.Parent = p_u_64.HumanoidRootPart
                local v_u_68 = Instance.new("BodyGyro")
                v_u_68.MaxTorque = Vector3.new(inf, inf, inf)
                v_u_68.CFrame = v_u_66
                v_u_68.Parent = p_u_64.HumanoidRootPart
                delay(3, function()
                    v_u_67:Destroy()
                    v_u_68:Destroy()
                    if v_u_65.is_non_player(p_u_64) then
                        p_u_64.Humanoid.Sit = true
                    end
                    p_u_64.HumanoidRootPart.Velocity = (v_u_66 * CFrame.Angles(1.5707963267948966, 0, 0)).lookVector * 300
                end)
            end
        end
    },
    ["confetti_cannon"] = {
        ["use_text"] = "Use",
        ["use_permissions"] = "EVERYONE",
        ["render"] = function(p69, p70, _, p71, p_u_72)
            p70.TouchBlock.Touched:connect(function(p73)
                if p73.Parent == game.Players.LocalPlayer.Character then
                    if tick() - (p_u_72.last_used or 0) >= 2 then
                        p_u_72.last_used = tick()
                        p_u_72:use(game.Players.LocalPlayer.Character)
                    end
                else
                    return
                end
            end)
            if p71 then
                p71 = (p71.temp_state or 0) ~= (p69.temp_state or 0)
            end
            if p71 then
                if math.random(1, 10) == 1 then
                    p70.ConfettiFail.Cloud1:Emit(10)
                    p70.ConfettiFail.Cloud2:Emit(10)
                    p70.ConfettiFail.FailBlast:Emit(40)
                    return
                end
                for v74 = 1, 9 do
                    p70.ConfettiBlast["Blast" .. v74]:Emit(15)
                end
                p70.ConfettiBlast.Cloud1:Emit(10)
                p70.ConfettiBlast.Cloud2:Emit(10)
                p70.ConfettiBlast.BlastPretty:Emit(30)
            end
        end,
        ["server_use"] = function(_, p75, _)
            p75.temp_state = (p75.temp_state or 0) + 1
        end
    },
    ["generic_seat"] = v2.BASIC_FURNITURE({}),
    ["generic_baby_seat"] = v2.BASIC_FURNITURE({
        ["team_whitelist"] = { "Pets", "Babies", "Dolls" }
    }),
    ["generic_bed"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = "LayInBed",
        ["team_whitelist"] = { "Parents" }
    }),
    ["generic_sleeping_bag"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = {
            ["Babies"] = "BabySleepOnBack",
            ["Parents"] = "BabySleepOnBack",
            ["Pets"] = "sleep",
            ["Dolls"] = "sleep"
        },
        ["ailment_to_boost"] = { "sleepy", v_u_5.full_sleep_duration }
    }),
    ["generic_bathtub"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Take Bath",
        ["ailment_to_boost"] = { "dirty", v_u_5.full_bath_duration }
    }),
    ["pet_bathtub"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Take Bath",
        ["ailment_to_boost"] = { "dirty", v_u_5.full_bath_duration },
        ["team_whitelist"] = { "Pets", "Babies", "Dolls" }
    }),
    ["generic_crib"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = {
            ["Babies"] = "BabySleepOnBack",
            ["Pets"] = "sleep",
            ["Dolls"] = "sleep"
        },
        ["team_whitelist"] = { "Babies", "Pets", "Dolls" },
        ["char_offset"] = {
            ["Pets"] = CFrame.new(0, 0, 0.5)
        },
        ["ailment_to_boost"] = { "sleepy", v_u_5.full_sleep_duration }
    }),
    ["generic_shower"] = v2.GENERIC_SHOWER(),
    ["generic_water_bowl"] = v2.BASIC_FURNITURE({
        ["use_id"] = "generic_water_bowl",
        ["use_text"] = "Drink",
        ["animation"] = "eating",
        ["team_whitelist"] = { "Pets" },
        ["ailment_to_boost"] = { "thirsty", v_u_5.full_water_bowl_drink_duration }
    }),
    ["generic_food_bowl"] = v2.BASIC_FURNITURE({
        ["use_id"] = "generic_food_bowl",
        ["use_text"] = "Eat",
        ["animation"] = "eating",
        ["team_whitelist"] = { "Pets" },
        ["ailment_to_boost"] = { "hungry", v_u_5.full_food_bowl_drink_duration }
    }),
    ["generic_toilet"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Use",
        ["team_whitelist"] = { "Pets", "Dolls" },
        ["ailment_to_boost"] = { "toilet", v_u_5.full_toilet_duration }
    }),
    ["piano"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Play Piano",
        ["animation"] = "PlayPiano",
        ["ailment_to_boost"] = { "bored", 20 }
    }),
    ["curvedchair"] = v2.BASIC_FURNITURE({
        ["animation"] = "Sit1"
    }),
    ["loungechair"] = v2.BASIC_FURNITURE({
        ["animation"] = "Sit2"
    }),
    ["highchair"] = v2.BASIC_FURNITURE({
        ["team_whitelist"] = { "Babies", "Dolls" }
    }),
    ["hospitalbed"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sit To Heal",
        ["animation"] = "LayInBed",
        ["ailment_to_boost"] = { "sick", v_u_5.full_sleep_duration }
    }),
    ["campfire"] = {
        ["render"] = function(_, p76)
            game:GetService("CollectionService"):AddTag(p76:FindFirstChild("Primary"), "CampfirePart")
        end
    },
    ["largetent"] = v2.TENT,
    ["neon_spot_1"] = v2.FUSION_DEVICE("neon_spot_1"),
    ["neon_spot_2"] = v2.FUSION_DEVICE("neon_spot_2"),
    ["neon_spot_3"] = v2.FUSION_DEVICE("neon_spot_3"),
    ["neon_spot_4"] = v2.FUSION_DEVICE("neon_spot_4"),
    ["rolling_ball"] = {
        ["use_text"] = function(p77)
            return p77.activated and "Reset" or "Activate"
        end,
        ["client_use"] = function() end,
        ["server_use"] = function(_, p78)
            p78.activated = not p78.activated
        end,
        ["render"] = function(p79, p80)
            if p79.activated then
                local v81 = p80:FindFirstChild("SpecialParts")
                if v81 then
                    v81 = p80.SpecialParts:FindFirstChild("Ball")
                end
                v81.Anchored = false
                v81.Velocity = v81.CFrame.LookVector * 50
            end
        end
    },
    ["floating_balloon"] = {
        ["use_text"] = function(p82)
            return p82.activated and "Reset" or "Activate"
        end,
        ["client_use"] = function() end,
        ["server_use"] = function(_, p83)
            p83.activated = not p83.activated
        end,
        ["post_render"] = function(p84, p_u_85)
            if p84.activated then
                local v_u_86 = p_u_85.Balloon
                for _, v87 in pairs(v_u_86:GetDescendants()) do
                    if v87:IsA("BasePart") then
                        local v88 = Instance.new("WeldConstraint")
                        v88.Part0 = v_u_86.Carriage
                        v88.Part1 = v87
                        v88.Parent = v_u_86.Carriage
                        v87.Anchored = false
                    end
                end
                local v_u_89 = Instance.new("BodyVelocity")
                v_u_89.MaxForce = Vector3.new(80000, 80000, 80000)
                v_u_89.Velocity = Vector3.new()
                v_u_89.Parent = v_u_86.Carriage
                local v_u_90 = Instance.new("BodyGyro")
                v_u_90.MaxTorque = Vector3.new(inf, inf, inf)
                v_u_90.CFrame = CFrame.new()
                v_u_90.Parent = v_u_86.Carriage
                coroutine.wrap(function()
                    local v91 = true
                    while p_u_85.Parent do
                        if v_u_86.Carriage.Velocity.Magnitude < 2 then
                            local v92 = math.random(-100, 100)
                            local v93 = v91 and math.random(20, 100) or math.random(-100, 100)
                            local v94 = math.random
                            local v95 = Vector3.new(v92, v93, v94(-100, 100))
                            local v96 = (v95.Magnitude == 0 and Vector3.new(1, 0, 0) or v95).Unit
                            v_u_89.Velocity = v96 * (4 + (math.random() - 0.5) * 2)
                            local v97 = v_u_90
                            local v98 = CFrame.new
                            local v99 = Vector3.new()
                            local v100 = v96.X
                            local v101 = v96.Z
                            v97.CFrame = v98(v99, (Vector3.new(v100, 0, v101))) * CFrame.Angles(0, -1.5707963267948966, 0)
                            v91 = false
                        end
                        wait(0.2)
                    end
                end)()
            end
        end
    },
    ["build_with_friends"] = {
        ["render"] = function(_, p_u_102, _, _, p103)
            local v_u_104 = v_u_1("StringUtil")
            local v105 = v_u_1("InteractionsEngine")
            local v_u_106 = v_u_1("ClientData")
            local v_u_107 = v_u_1("HouseClient")
            local v108 = v_u_1("Maid")
            local v_u_109 = p103.props.player
            p103.workbench_maid = v108.new()
            local v110 = p103.workbench_maid
            local v139 = {
                ["part"] = p_u_102.UseBlock,
                ["on_selected"] = {
                    {
                        ["text"] = function()
                            return v_u_107.get_current_house_coop().locked and "Set Enabled" or "Set Disabled"
                        end,
                        ["on_selected"] = function()
                            local v111 = v_u_1("RouterClient")
                            local v112 = v_u_107.get_current_house_coop()
                            v111.get("HousingAPI/CoopSetLocked"):InvokeServer(not v112.locked)
                        end
                    },
                    {
                        ["text"] = "Set Budget",
                        ["on_selected"] = function()
                            local v113 = v_u_1("UIManager")
                            local v114 = v_u_1("RouterClient")
                            local v115 = v113.apps.DialogApp
                            local v116 = {
                                ["text"] = "Set new budget (limit is $" .. v_u_104.add_commas_to_number(v_u_5.coop_building_max_budget) .. "):"
                            }
                            local v117 = v_u_106.get_server(v_u_109, "housing_coop").budget
                            v116.existing_text = tostring(v117)
                            v116.left = "Cancel"
                            v116.right = "Deposit"
                            local v118, v119 = v115:free_response_dialog(v116)
                            if v118 == "Deposit" and tonumber(v119) then
                                v114.get("HousingAPI/CoopSetBudget"):FireServer((tonumber(v119)))
                            end
                        end
                    },
                    {
                        ["text"] = "Add Builder",
                        ["on_selected"] = function()
                            local v120 = v_u_1("UIManager")
                            local v121 = v_u_1("TableUtil")
                            local v122 = v_u_1("RouterClient")
                            local v123 = v_u_106.get_server(v_u_109, "housing_coop")
                            local v124 = v123 and (v123.players or {}) or {}
                            local v125 = v123 and v123.locked or false
                            if #v124 >= v_u_5.coop_building_max_players then
                                v120.apps.DialogApp:dialog({
                                    ["text"] = "You can\'t add more than " .. v_u_104.add_commas_to_number(v_u_5.coop_building_max_players) .. " players! Remove one first!",
                                    ["button"] = "Okay"
                                })
                            else
                                local v126 = v120.apps.PlayerChooserApp:choose_player_dialog({
                                    ["categories"] = { "family", "playing_friends", "all" },
                                    ["title_text"] = "ADD BUILDER",
                                    ["button_text"] = "Add",
                                    ["blacklist"] = v121.combine(v124, { game.Players.LocalPlayer })
                                })
                                if v126 then
                                    if #v124 == 0 and v125 then
                                        v122.get("HousingAPI/CoopSetLocked"):InvokeServer(false)
                                    end
                                    v122.get("HousingAPI/CoopAddPlayer"):FireServer(v126)
                                end
                            end
                        end
                    },
                    {
                        ["text"] = "Remove Builder",
                        ["on_selected"] = function()
                            local v127 = v_u_1("UIManager")
                            local v128 = v_u_1("RouterClient")
                            local v129 = v_u_106.get_server(v_u_109, "housing_coop")
                            local v130 = {
                                ["categories"] = {
                                    {
                                        ["players"] = v129 and v129.players or {}
                                    }
                                },
                                ["title_text"] = "REMOVE BUILDER",
                                ["button_text"] = "Remove",
                                ["bottom_button_text"] = "Remove All Builders"
                            }
                            local v131 = v127.apps.PlayerChooserApp:choose_player_dialog(v130)
                            if v131 == "Remove All Builders" then
                                v128.get("HousingAPI/CoopRemoveAllPlayers"):FireServer()
                            elseif v131 then
                                v128.get("HousingAPI/CoopRemovePlayer"):FireServer(v131)
                            end
                        end
                    },
                    {
                        ["text"] = "Retrieve Budget",
                        ["on_selected"] = function()
                            v_u_1("RouterClient").get("HousingAPI/CoopSetBudget"):FireServer(0)
                        end
                    }
                },
                ["is_visible"] = function()
                    local v132 = v_u_1("ClientStore")
                    local v133 = v_u_1("PlatformM")
                    local v134 = v_u_1("UIManager")
                    local v135 = v133.get_platform()
                    if v_u_109 == game.Players.LocalPlayer then
                        local v136 = v132.store:getState().house_editor_state
                        local v137 = v134.apps.FurnitureSelectorApp:is_selecting()
                        local v138 = v136 ~= "Main" and v136 ~= "Disabled" and (v136 ~= "ViewingListedHouse" and not v137)
                        if v138 then
                            if v135 == v133.platform.phone then
                                v138 = false
                            else
                                v138 = v135 ~= v133.platform.tablet
                            end
                        end
                        return v138
                    end
                end
            }
            v110.interaction = v105:register(v139)
            local function v_u_141()
                local v140 = p_u_102:FindFirstChild("Indicator")
                if v140 then
                    v140 = v140:FindFirstChild("HalfBall")
                end
                if v140 then
                    v140.Color = v_u_106.get_server(v_u_109, "housing_coop").locked and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
                end
            end
            local v142 = p_u_102:FindFirstChild("BudgetText", true)
            if v142 then
                local v143 = v_u_106.get_server(v_u_109, "housing_coop")
                v142.Text = v_u_104.add_commas_to_number(v143.budget)
            end
            v_u_141()
            local v144 = p_u_102:FindFirstChild("PlayerText", true)
            if v144 then
                local v145 = v_u_106.get_server(v_u_109, "housing_coop")
                v144.Text = v_u_104.add_commas_to_number(#v145.players)
            end
            p103.workbench_maid.data_hook = v_u_107.housing_coop_changed:Connect(function(p146, _, _)
                if p146 == v_u_109 then
                    local v147 = p_u_102:FindFirstChild("BudgetText", true)
                    if v147 then
                        local v148 = v_u_106.get_server(v_u_109, "housing_coop")
                        v147.Text = v_u_104.add_commas_to_number(v148.budget)
                    end
                    v_u_141()
                    local v149 = p_u_102:FindFirstChild("PlayerText", true)
                    if v149 then
                        local v150 = v_u_106.get_server(v_u_109, "housing_coop")
                        v149.Text = v_u_104.add_commas_to_number(#v150.players)
                    end
                else
                    return
                end
            end)
        end,
        ["unrender"] = function(_, _, _, p151)
            if p151.workbench_maid then
                p151.workbench_maid:Destroy()
            end
        end
    },
    ["pet_training_tunnel"] = v2.PET_PATH_ANIM("Use Tunnel"),
    ["pet_training_tunnel_flipped"] = v2.PET_PATH_ANIM("Use Tunnel"),
    ["pet_training_bar_jump"] = v2.PET_PATH_ANIM("Use Bar Jump"),
    ["pet_training_weave"] = v2.PET_PATH_ANIM("Use Weave"),
    ["tiki_torch"] = v2.FIREPLACE("tiki_torch"),
    ["coffee_maker"] = v2.GRAB_ITEM("food", "coffee_paper_cup"),
    ["water_cooler"] = v2.GRAB_ITEM("food", "water_paper_cup"),
    ["voting_paddle"] = v2.GRAB_ITEM("toys", "voting_paddle", 1),
    ["office_chair"] = v2.BASIC_FURNITURE({
        ["animation"] = "Sit1"
    }),
    ["rocking_crib"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = {
            ["Babies"] = "BabySleepOnBack",
            ["Pets"] = "sleep",
            ["Dolls"] = "sleep"
        },
        ["team_whitelist"] = { "Babies", "Pets", "Dolls" },
        ["char_offset"] = {
            ["Pets"] = CFrame.new(0, 0, 0.5)
        },
        ["ailment_to_boost"] = { "sleepy", v_u_5.full_sleep_duration }
    }),
    ["cloud_chair"] = v2.BASIC_FURNITURE({
        ["animation"] = "Sit1"
    }),
    ["unicorn_lamp"] = v2.LIGHT("unicorn_lamp"),
    ["penguin_lamp"] = v2.LIGHT("penguin_lamp"),
    ["puppy_high_chair"] = v2.BASIC_FURNITURE({
        ["team_whitelist"] = { "Pets" }
    }),
    ["cloud_bed"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sleep",
        ["animation"] = "LayInBed",
        ["team_whitelist"] = { "Parents" }
    }),
    ["tombstone"] = v2.DRAWING_BOARD("RIP", 40),
    ["cloud_tv"] = v2.TV_SCREEN("cloud_tv"),
    ["neon_sign"] = v2.THREEDTEXT_SIGN({
        ["font_id"] = "LobsterTwoBold",
        ["scale"] = 2.4,
        ["thickness"] = 0.2,
        ["max_length"] = 16,
        ["default_text"] = "Welcome",
        ["empty_text"] = "???",
        ["material"] = Enum.Material.Neon,
        ["default_color"] = Color3.fromRGB(255, 0, 191),
        ["emit_light"] = true
    }),
    ["rustic_sign"] = v2.THREEDTEXT_SIGN({
        ["font_id"] = "AlfaSlabOneRegular",
        ["scale"] = 2.4,
        ["thickness"] = 0.2,
        ["max_length"] = 16,
        ["default_text"] = "Howdy!",
        ["empty_text"] = "???",
        ["material"] = Enum.Material.WoodPlanks,
        ["default_color"] = Color3.fromRGB(204, 142, 105),
        ["emit_light"] = false
    }),
    ["modern_sign"] = v2.THREEDTEXT_SIGN({
        ["font_id"] = "InterExtraBold",
        ["scale"] = 2.4,
        ["thickness"] = 0.2,
        ["max_length"] = 16,
        ["default_text"] = "Hello.",
        ["empty_text"] = "???",
        ["material"] = Enum.Material.SmoothPlastic,
        ["default_color"] = Color3.fromRGB(27, 42, 53),
        ["emit_light"] = false
    }),
    ["green_tea_cup"] = v2.TEA_CUP("green_tea_cup"),
    ["green_tea_kettle"] = v2.TEA_KETTLE("GreenTeaPour"),
    ["oolong_tea_cup"] = v2.TEA_CUP("oolong_tea_cup"),
    ["oolong_tea_kettle"] = v2.TEA_KETTLE("OolongTeaPour"),
    ["jasmine_tea_cup"] = v2.TEA_CUP("jasmine_tea_cup"),
    ["jasmine_tea_kettle"] = v2.TEA_KETTLE("JasmineTeaPour"),
    ["modern_feature_tv"] = v2.TV_SCREEN("modern_feature_tv"),
    ["modern_lamp"] = v2.LIGHT("modern_lamp"),
    ["sleek_floor_lamp"] = v2.LIGHT("sleek_floor_lamp"),
    ["barrel_tv"] = v2.TV_SCREEN("barrel_tv"),
    ["pirate_jukebox"] = v2.RADIO,
    ["cerberus"] = v2.GAMEPASS_PET("cerberus", {
        ["talking_to_anim"] = v_u_6.pets.cerberus.anims.idle,
        ["idle_anim"] = v_u_6.pets.cerberus.anims.idle
    }),
    ["robo_dog"] = v2.GAMEPASS_PET("robo_dog", {
        ["talking_to_anim"] = v_u_6.pets.robo_dog.anims.idle,
        ["idle_anim"] = v_u_6.pets.robo_dog.anims.idle
    }),
    ["snowflake"] = {
        ["post_render"] = function(_, p152)
            local v_u_153 = math.random(1, 3)
            local v_u_154 = math.random(1, 3)
            local v_u_155 = {}
            for v156 = 1, 3 do
                v_u_155[v156] = p152.AnimationController:LoadAnimation(v_u_4.get_track("SnowflakeIdle" .. v156))
                v_u_155[v156].DidLoop:Connect(function()
                    v_u_153 = v_u_153 - 1
                    if v_u_153 <= 0 then
                        v_u_153 = math.random(1, 3)
                        v_u_155[v_u_154]:Stop(1)
                        v_u_154 = v_u_154 % #v_u_155 + 1
                        v_u_155[v_u_154]:Play(1)
                    end
                end)
            end
            v_u_155[v_u_154]:Play()
        end
    },
    ["ice_flower"] = {
        ["post_render"] = function(_, p157)
            local v158 = Random.new()
            local v159 = p157.AnimationController:LoadAnimation(v_u_4.get_track("SnowFlowerIdle" .. math.random(1, 3)))
            v159.TimePosition = v158:NextNumber(0, v159.Length)
            v159:Play()
        end
    },
    ["lacquer_dragon_lamp"] = v2.LIGHT("lacquer_dragon_lamp"),
    ["red_squirrel"] = v2.GAMEPASS_PET("red_squirrel", {
        ["talking_to_anim"] = v_u_6.pets.red_squirrel.anims.sit,
        ["idle_anim"] = v_u_6.pets.red_squirrel.anims.sit
    }),
    ["cobra"] = v2.GAMEPASS_PET("cobra", {
        ["talking_to_anim"] = v_u_6.pets.cobra.anims.idle,
        ["idle_anim"] = v_u_6.pets.cobra.anims.idle
    }),
    ["axolotl"] = v2.GAMEPASS_PET("axolotl", {
        ["talking_to_anim"] = v_u_6.pets.axolotl.anims.idle,
        ["idle_anim"] = v_u_6.pets.axolotl.anims.idle
    }),
    ["tree_lamp"] = v2.LIGHT("tree_lamp"),
    ["baby_shop_wall_sconce"] = v2.LIGHT("baby_shop_wall_sconce"),
    ["small_cloud_light"] = v2.LIGHT("small_cloud_light"),
    ["large_cloud_light"] = v2.LIGHT("large_cloud_light"),
    ["scary_2021_scary_branch_mounted_lantern"] = v2.COLORABLE_LIGHT("scary_2021_scary_branch_mounted_lantern", {
        ["default_color"] = Color3.fromRGB(218, 102, 102)
    }),
    ["scary_2021_scary_pillar_mounted_lantern"] = v2.COLORABLE_LIGHT("scary_2021_scary_pillar_mounted_lantern", {
        ["default_color"] = Color3.fromRGB(218, 102, 102)
    }),
    ["scary_2021_scary_wall_mounted_lantern"] = v2.COLORABLE_LIGHT("scary_2021_scary_wall_mounted_lantern", {
        ["default_color"] = Color3.fromRGB(218, 102, 102)
    }),
    ["desert_2022_bastet"] = v2.NPC_SIMPLE("desert_2022_bastet"),
    ["desert_2022_abyssinian_cat"] = v2.CURRENCY_PET("desert_2022_abyssinian_cat", {
        ["idle_anim"] = v_u_6.pets.desert_2022_abyssinian_cat.anims.idle,
        ["talking_to_anim"] = v_u_6.pets.desert_2022_abyssinian_cat.anims.idle
    }),
    ["lit_island_tree"] = v2.COLORABLE_LIGHT("lit_island_tree", {
        ["default_color"] = Color3.fromRGB(213, 122, 77)
    }),
    ["driftwood_lamp"] = v2.LIGHT_WITH_PARTICLES("driftwood_lamp"),
    ["driftwood_hanginglamp"] = v2.LIGHT_WITH_PARTICLES("driftwood_hanginglamp"),
    ["woodland_2022_marshmallow_stand"] = v2.GRAB_ITEM("food", "marshmallow_on_a_stick"),
    ["space_house_2022_light"] = v2.COLORABLE_LIGHT("space_house_2022_light", {
        ["default_color"] = Color3.fromRGB(105, 87, 194)
    }),
    ["space_house_2022_shower"] = v2.SHOWER_WITH_FADING_DOOR(),
    ["space_house_2022_capricorn"] = v2.GAMEPASS_PET("space_house_2022_capricorn", {
        ["idle_anim"] = v_u_6.pets.space_house_2022_capricorn.anims.idle,
        ["talking_to_anim"] = v_u_6.pets.space_house_2022_capricorn.anims.idle,
        ["gamepass_id"] = "space_bundle_2022"
    }),
    ["random_pets_2022_winged_horse"] = v2.GAMEPASS_PET("random_pets_2022_winged_horse", {
        ["talking_to_anim"] = v_u_6.pets.random_pets_2022_winged_horse.anims.idle,
        ["idle_anim"] = v_u_6.pets.random_pets_2022_winged_horse.anims.idle
    }),
    ["snow_2022_aurora"] = v2.NPC_SIMPLE("snow_2022_aurora"),
    ["snow_2022_ribbon_seal"] = v2.CURRENCY_PET("snow_2022_ribbon_seal", {
        ["idle_anim"] = v_u_6.pets.snow_2022_ribbon_seal.anims.idle,
        ["talking_to_anim"] = v_u_6.pets.snow_2022_ribbon_seal.anims.idle
    }),
    ["ice_cream_refresh_2022_king_penguin"] = v2.IDLE_PET("ice_cream_refresh_2022_king_penguin", {
        ["talking_to_anim"] = v_u_6.pets.ice_cream_refresh_2022_king_penguin.anims.idle,
        ["idle_anim"] = v_u_6.pets.ice_cream_refresh_2022_king_penguin.anims.idle
    }),
    ["ice_cream_refresh_2022_golden_king_penguin"] = v2.IDLE_PET("ice_cream_refresh_2022_golden_king_penguin", {
        ["talking_to_anim"] = v_u_6.pets.ice_cream_refresh_2022_golden_king_penguin.anims.idle,
        ["idle_anim"] = v_u_6.pets.ice_cream_refresh_2022_golden_king_penguin.anims.idle
    }),
    ["ice_cream_refresh_2022_diamond_king_penguin"] = v2.IDLE_PET("ice_cream_refresh_2022_diamond_king_penguin", {
        ["talking_to_anim"] = v_u_6.pets.ice_cream_refresh_2022_diamond_king_penguin.anims.idle,
        ["idle_anim"] = v_u_6.pets.ice_cream_refresh_2022_diamond_king_penguin.anims.idle
    }),
    ["vip_2022_chow_chow_light_brown"] = v2.NPC_SIMPLE("hide_name", {
        ["idle_anim"] = v_u_6.pets.vip_2022_chow_chow_black.anims.idle
    }),
    ["vip_2022_chow_chow_dark_brown"] = v2.NPC_SIMPLE("hide_name", {
        ["idle_anim"] = v_u_6.pets.vip_2022_chow_chow_black.anims.idle
    }),
    ["vip_2022_chow_chow_black"] = v2.NPC_SIMPLE("hide_name", {
        ["idle_anim"] = v_u_6.pets.vip_2022_chow_chow_black.anims.idle
    }),
    ["vip_2022_chow_chow_gold"] = v2.NPC_SIMPLE("hide_name", {
        ["idle_anim"] = v_u_6.pets.vip_2022_chow_chow_black.anims.idle
    }),
    ["fall_2022_shop_badger"] = v2.NPC_SIMPLE("fall_2022_shop_badger"),
    ["fall_2022_badger"] = v2.CURRENCY_PET("fall_2022_badger", {
        ["idle_anim"] = v_u_6.pets.fall_2022_badger.anims.idle,
        ["talking_to_anim"] = v_u_6.pets.fall_2022_badger.anims.idle
    }),
    ["birthday_2022_botanical_lamp"] = v2.LIGHT("birthday_2022_botanical_lamp"),
    ["royal_palace_2022_wall_sconce"] = v2.LIGHT("royal_palace_2022_wall_sconce"),
    ["royal_palace_2022_chandelier"] = v2.LIGHT("royal_palace_2022_chandelier"),
    ["royal_palace_2022_tea_party_set"] = v2.GRAB_ITEM("food", "royal_palace_2022_tea_party_scone"),
    ["royal_palace_2022_spaniel"] = v2.GAMEPASS_PET("royal_palace_2022_spaniel", {
        ["idle_anim"] = v_u_6.pets.royal_palace_2022_spaniel.anims.idle,
        ["talking_to_anim"] = v_u_6.pets.royal_palace_2022_spaniel.anims.idle
    }),
    ["roleplay_role_picker"] = {
        ["use_text"] = function(p160)
            local v161 = v_u_1("RoleplayDB")
            local v162 = v_u_1("ClientData")
            local v163 = v161[p160.building_id].roles[p160.role_id]
            local v164 = v162.get("roleplay_role")
            if v164 and (v164.building_id == p160.building_id and v164.role_id == p160.role_id) then
                return string.format("Stop Being %s", v163.name)
            else
                return string.format("Become %s", v163.name)
            end
        end,
        ["client_get_data_for_server_use"] = function(p165)
            local v166 = v_u_1("RouterClient")
            local v167 = v_u_1("ClientData")
            local v168 = v_u_1("SoundPlayer")
            local v169 = v167.get("roleplay_role")
            if not v169 or (v169.building_id ~= p165.building_id or v169.role_id ~= p165.role_id) then
                v168.FX:play("Roleplay/ChooseRole")
            end
            if v167.get("team") == "Babies" then
                v166.get("TeamAPI/ChooseTeam"):InvokeServer("Parents", {
                    ["dont_send_back_home"] = true,
                    ["source_for_logging"] = "roleplay_role_picker"
                })
            end
            return true
        end,
        ["on_interaction_shown"] = function(p170, p171)
            local v172 = v_u_1("RoleplayDB")
            local v_u_173 = v_u_1("RoleplayRolesClient")
            local v_u_174 = v172[p170.building_id].roles[p170.role_id]
            local v_u_175 = game.ReplicatedStorage.Resources.InteractionsUIFragments.RoleplayRolePickerFragment:Clone()
            local v176 = {}
            if v_u_174.pay_percentage_breakdown.roleplay > 0 then
                local v177 = v_u_174.pay_percentage_breakdown.roleplay / 100 * v_u_5.pay_per_minute_for_100_percent_roleplay_job
                local v178 = math.floor(v177)
                local v179 = {
                    ["percentage"] = v_u_174.pay_percentage_breakdown.roleplay,
                    ["tagline"] = ("%s per minute"):format(v178)
                }
                table.insert(v176, v179)
            end
            if v_u_174.pay_percentage_breakdown.task > 0 then
                local v180 = {
                    ["percentage"] = v_u_174.pay_percentage_breakdown.task,
                    ["tagline"] = ("%s per %s"):format(v_u_174.advertised_pay_per_task, v_u_174.advertised_task_action_name)
                }
                table.insert(v176, v180)
            end
            table.sort(v176, function(p181, p182)
                return p181.percentage > p182.percentage
            end)
            local v183 = v176[1]
            if v183 then
                v_u_175.Contents.PayRow1.Visible = true
                v_u_175.Contents.PayRow1.Earnings.TextLabel.Text = v183.tagline
            else
                v_u_175.Contents.PayRow1.Visible = false
            end
            local v184 = v176[2]
            if v184 then
                v_u_175.Contents.PayRow2.Visible = true
                v_u_175.Contents.PayRow2.Earnings.TextLabel.Text = v184.tagline
            else
                v_u_175.Contents.PayRow2.Visible = false
            end
            v_u_175.Size = UDim2.new(0, 200, 0, #v176 == 1 and 70 or 94)
            v_u_175.Parent = p171.Message.FragmentHolder
            task.spawn(function()
                while v_u_175.Parent do
                    local v185 = v_u_173.is_role_available(v_u_174)
                    local v186
                    if v185 then
                        v186 = Color3.fromRGB(230, 52, 52)
                    else
                        v186 = Color3.fromRGB(95, 95, 95)
                    end
                    v_u_175.Contents.HiringStatus.BackgroundColor3 = v186
                    v_u_175.Contents.HiringStatus.TextLabel.Text = v185 and "Now Hiring!" or "Position Filled"
                    task.wait(0.1)
                end
            end)
        end,
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["server_use"] = function(p187, p188, _)
            local v189 = v_u_1("RoleplayRolesManager")
            local v190 = v_u_1("RoleplayDB")
            local v191 = v_u_1("RoleplayOutfitHelper")
            local v192 = v190[p188.building_id].roles[p188.role_id]
            if v189.does_player_work_at_building(p187, p188.building_id) and v189.does_player_have_role(p187, p188.role_id) then
                v189.abandon_role(p187)
                return
            elseif v189.is_role_available(p187, v192, true) then
                local v193 = v_u_12:JSONDecode(p188.outfit)
                v191.wear_roleplay_outfit(p187, v193)
                v189.take_on_role(p187, v192)
            end
        end,
        ["init"] = function(p194)
            local v195 = v_u_1("RoleplayDB")
            local v196 = v_u_1("MannequinOutfitManager")
            local v197 = p194.outfit
            assert(v197, "Missing outfit")
            local v198 = p194.building_id
            if v198 then
                v198 = v195[p194.building_id]
            end
            local v199 = p194.building_id
            local v200 = "Invalid building_id " .. tostring(v199)
            assert(v198, v200)
            local v201 = p194.role_id
            if v201 then
                v201 = v195[p194.building_id].roles[p194.role_id]
            end
            local v202 = p194.role_id
            local v203 = "Invalid role_id " .. tostring(v202)
            assert(v201, v203)
            p194.outfit_guid = p194.outfit_guid or v_u_12:GenerateGUID()
            p194.outfit = p194.outfit or {}
            v196.register_valid_outfit(p194.outfit, p194.outfit_guid)
        end,
        ["post_render"] = function(p_u_204, p_u_205)
            local v_u_206 = v_u_1("DownloadClient")
            local v_u_207 = v_u_1("UIManager")
            local v_u_208 = v_u_1("RoleplayDB")
            task.spawn(function()
                local v209 = v_u_206.promise_download_copy("Mannequin", nil, {
                    ["outfit_guid"] = p_u_204.outfit_guid,
                    ["params_deduplication_hash"] = p_u_204.outfit_guid
                }):expect()
                if p_u_205.Parent then
                    v209.HumanoidRootPart.Anchored = true
                    local v210 = p_u_205.MannequinPlacementLocation.Size.Y / 2 + v209.Humanoid.HipHeight + v209.HumanoidRootPart.Size.Y / 2
                    v209:SetPrimaryPartCFrame(p_u_205.MannequinPlacementLocation.CFrame * CFrame.new(0, v210, 0))
                    v209.Parent = p_u_205
                    local v211 = v_u_208[p_u_204.building_id].roles[p_u_204.role_id]
                    v_u_207.apps.PlayerNameApp:add_npc_roleplay_role(v209, v211)
                    game:GetService("CollectionService"):AddTag(p_u_205.MannequinPlacementLocation, "roleplay_role_picker-" .. p_u_204.building_id .. "-" .. p_u_204.role_id)
                else
                    v209:Destroy()
                end
            end)
        end
    },
    ["hair_spray_shelf"] = v2.COLORED_HAIR_SPRAY_SHELF,
    ["hair_spray_shelf_2"] = v2.COLORED_HAIR_SPRAY_SHELF,
    ["colored_hair_spray_wash_basin"] = v2.BASIC_FURNITURE({
        ["use_id"] = "colored_hair_spray_wash_basin",
        ["use_text"] = function()
            local v212 = v_u_1("EquippedPets").get_my_equipped()[1]
            if v212 == nil then
                return "Uncolor Pet"
            end
            local v213 = v212.kind
            local v214 = v_u_6.pets[v213]
            if v214 then
                v214 = v214.is_doll
            end
            return v214 and "Uncolor Doll" or "Uncolor Pet"
        end,
        ["team_whitelist"] = { "Pets", "Dolls" },
        ["basic_server_use_core"] = function(_, _, _, _, _, p215, _)
            local v216 = v_u_1("CharacterWrapper").get(p215)
            if v216 then
                v216.timed_flag_manager:remove_flag("colored_hair_spray")
            end
        end,
        ["render"] = function(p217, p218)
            local v219 = p217.occupied or {}
            local v220 = p218.WaterStream
            local v221 = next(v219) ~= nil
            v220.Beam.Enabled = v221
            if v221 then
                v220.Sound:Play()
            end
        end
    }),
    ["role_auth_locked_door_style_1"] = v2.INTERIOR_DOOR({
        ["seconds_until_automatic_close"] = 5
    }),
    ["role_auth_locked_door_style_2"] = v2.INTERIOR_DOOR({
        ["seconds_until_automatic_close"] = 5
    }),
    ["role_auth_locked_door_style_3"] = v2.INTERIOR_DOOR({
        ["seconds_until_automatic_close"] = 5
    }),
    ["haircut_standing_location"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Style Hair",
        ["animation"] = "CuttingHair",
        ["team_whitelist"] = { "Parents", "Babies", "Dolls" },
        ["is_human_standing"] = true
    }),
    ["typing_while_standing_location"] = v2.RANDOM_ANIMATION(v2.BASIC_FURNITURE({
        ["use_text"] = "Use Laptop",
        ["team_whitelist"] = { "Parents", "Babies", "Dolls" },
        ["is_human_standing"] = true
    }), {
        "TypingAtComputerNormal",
        "TypingAtComputerNormal",
        "TypingAtComputerNormal",
        "TypingAtComputerSmashingKeys"
    }),
    ["pizza_shop_host_stand_standing_location"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Attend Ma\195\174tre d\' Stand",
        ["team_whitelist"] = { "Parents", "Babies", "Dolls" },
        ["animation"] = "HostStandAnimation",
        ["is_human_standing"] = true
    }),
    ["standingmirror"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Look at Reflection",
        ["animation"] = "StandingInFrontOfMirror",
        ["is_human_standing"] = true
    }),
    ["hair_washing_station"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Wash Hair",
        ["animation"] = function(_, _, _, _, _, _, p222)
            if p222 == "GettingWashed" then
                return "HairWashingStationGetHairWashed"
            end
            if p222 == "Washer" then
                return "HairWashingStationWashingSomeonesHair"
            end
            error("Invalid use_block name")
        end,
        ["is_human_standing"] = function(_, _, _, _, _, _, p223)
            return p223 == "Washer"
        end,
        ["team_whitelist"] = { "Parents", "Babies", "Dolls" },
        ["enable_effects_when_occupied"] = true
    }),
    ["hairdryerchair"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Dry Hair",
        ["enable_effects_when_occupied"] = true
    }),
    ["baked_donuts"] = v2.GRAB_ITEM("food", "donut", nil, {
        ["baked"] = true
    }),
    ["hair_dryer"] = v2.GRAB_ITEM("roleplay", "hair_dryer", 1, nil),
    ["scissors"] = v2.GRAB_ITEM("roleplay", "scissors", 1, nil),
    ["heist_gloves_furniture_stealing"] = v2.GRAB_ITEM("roleplay", "heist_gloves_furniture_stealing", 1, nil, {
        ["building_id"] = "criminal_base"
    }),
    ["criminal_baseball_bat"] = v2.GRAB_ITEM("roleplay", "criminal_baseball_bat", 1, nil, {
        ["building_id"] = "criminal_base"
    }),
    ["criminal_moving_truck"] = v2.GRAB_TRANSPORT("moving_truck", {
        ["building_id"] = "criminal_base"
    }),
    ["detective_car"] = v2.GRAB_TRANSPORT("detective_car", {
        ["building_id"] = "detective_building"
    }),
    ["criminal_crusher"] = {
        ["render"] = function(_, p224)
            local v_u_225 = v_u_1("Trampoline")
            local v226 = v_u_1("CriminalCrusher")
            p224.Detector.Touched:Connect(function(p227)
                if v_u_225.has_ownership(p227) then
                    p227.AssemblyLinearVelocity = Vector3.new(0, 128, 0)
                end
            end)
            v226.set_up_crusher(p224.Detector)
        end,
        ["post_render"] = function(p228, p229)
            local v230 = v_u_1("FastAnimator")
            local v231 = p229.AnimationController
            v231:LoadAnimation(v_u_4.get_track("CrusherSpin")):Play()
            local v232 = v_u_4.get_track("CrusherOpen")
            if p228.open then
                local v_u_233 = v231:LoadAnimation(v232)
                v_u_233:Play()
                task.delay(1, function()
                    v_u_233:AdjustSpeed(0)
                end)
                for _, v234 in pairs({
                    "LeftGrate",
                    "LeftGrate2",
                    "RightGrate",
                    "RightGrate2"
                }) do
                    p229[v234].CanCollide = false
                end
            else
                open_close = v230.fast_play(v231, v232, 1)
            end
        end,
        ["use_text"] = function(p235)
            return p235.open and "Close" or "Open"
        end,
        ["init"] = function(p236)
            if p236.open == nil then
                p236.open = false
            end
        end,
        ["server_use"] = function(_, p237)
            p237.open = not p237.open
        end,
        ["roleplay_role_requirements"] = {
            ["building_id"] = "criminal_base"
        }
    },
    ["handcuffs"] = v2.GRAB_ITEM("roleplay", "detective_handcuffs", 1, nil, {
        ["building_id"] = "detective_building"
    }),
    ["jail_door"] = {
        ["use_text"] = function(p238, p239, p240)
            local v241 = p239:GetAttribute("prisoner_controls_enabled")
            return (p240.Name ~= "InnerControlUseBlock" or v241) and (p238.open and "Close" or "Open") or nil
        end,
        ["post_render"] = function(p242, p_u_243)
            local v244 = v_u_1("FastAnimator")
            local v_u_245 = v_u_1("ClientData")
            for _, v246 in ipairs(p_u_243.DoorParts:GetChildren()) do
                v_u_8.weld(p_u_243.WorkingParts.DoorPart, v246)
                v246.Anchored = false
            end
            local v247 = p_u_243.WorkingParts.AnimationController
            local v248 = v_u_4.get_track("JailDoorOpenClose")
            local v_u_249 = v247:LoadAnimation(v248)
            if p242.open then
                v_u_249:Play()
                task.delay(1, function()
                    v_u_249:AdjustSpeed(0)
                end)
            else
                v244.fast_play(v247, v248, 1)
            end
            local function v_u_255(p250)
                if p_u_243 and p_u_243.Parent then
                    p_u_243.Controller.InnerControl.BillboardGui.Timer.Visible = not p250
                    local v251 = p_u_243.Controller.UpperPrisonerLight
                    local v252
                    if p250 then
                        v252 = Enum.Material.Neon
                    else
                        v252 = Enum.Material.SmoothPlastic
                    end
                    v251.Material = v252
                    local v253 = p_u_243.Controller.LowerPrisonerLight
                    local v254
                    if p250 then
                        v254 = Enum.Material.Neon
                    else
                        v254 = Enum.Material.SmoothPlastic
                    end
                    v253.Material = v254
                    p_u_243:SetAttribute("prisoner_controls_enabled", p250)
                end
            end
            task.spawn(function()
                while p_u_243 and p_u_243.Parent do
                    local v256 = os.time()
                    if v_u_245.get("jail_prisoner_controls_locked_at_timestamp") and v256 - v_u_245.get("jail_prisoner_controls_locked_at_timestamp") < 20 then
                        p_u_243.Controller.InnerControl.BillboardGui.Timer.Text = 20 - (v256 - v_u_245.get("jail_prisoner_controls_locked_at_timestamp"))
                        v_u_255(false)
                    else
                        v_u_255(true)
                    end
                    task.wait(0.1)
                end
            end)
        end,
        ["client_get_data_for_server_use"] = function(_, p257, p258, _, p259)
            local v260 = v_u_1("ClientData")
            local v261 = p258:GetAttribute("prisoner_controls_enabled")
            if p259.Name == "InnerControlUseBlock" and not v261 then
                return nil
            end
            local v262 = "jail_door_" .. p257 .. "last_used"
            local v263 = v260.get(v262)
            if v263 and os.clock() - v263 < 1 then
                return nil
            end
            v260.update(v262, os.clock())
            return true
        end,
        ["server_use"] = function(_, p264, _, _, _, _, _)
            p264.open = not p264.open
        end
    },
    ["criminal_manhole"] = {
        ["use_text"] = "Enter",
        ["client_use"] = function(p265, _, _)
            local v266 = v_u_1("InteriorsM")
            local v267 = p265.destination_id_to_teleport_to
            local v_u_268 = p265.spawn_block_to_teleport_to
            v266.enter_smooth(v267, "MainDoor", {
                ["spawn_cframe"] = function(p269)
                    return p269:FindFirstChild(v_u_268, true).CFrame
                end
            })
        end,
        ["roleplay_role_requirements"] = {
            ["building_id"] = "criminal_base"
        }
    },
    ["criminal_wanted_poster"] = v2.PLAYER_FEATURING_POSTER({
        ["target_building_id"] = "criminal_base",
        ["no_qualified_candidates_text"] = "There are no Criminals in the server right now."
    }),
    ["employee_of_the_day_poster"] = v2.PLAYER_FEATURING_POSTER(),
    ["criminal_leaderboard"] = {
        ["init"] = function(p_u_270, p_u_271)
            local v_u_272 = v_u_1("DataM")
            local v_u_273 = v_u_1("CriminalLeaderboardManager")
            local v_u_274 = v_u_1("package:Sift")
            local v_u_275 = v_u_1("RoleplayRolesManager")
            p_u_270.leaderboard_info = {}
            local v_u_276 = {}
            local function v_u_278()
                for v277 = #v_u_276, 1, -1 do
                    if not v_u_276[v277]:IsDescendantOf(game) then
                        table.remove(v_u_276, v277)
                    end
                end
            end
            local function v_u_291()
                v_u_278()
                local v280 = v_u_274.List.filter(game.Players:GetPlayers(), function(p279)
                    return v_u_275.does_player_work_at_building(p279, "criminal_base")
                end)
                for _, v281 in pairs(v280) do
                    if table.find(v_u_276, v281) == nil then
                        local v282 = v_u_276
                        table.insert(v282, v281)
                    end
                end
                local v283 = {
                    ["total_crushed_value"] = v_u_273.get_total_crushed_value(),
                    ["list"] = {}
                }
                for _, v284 in pairs(v_u_276) do
                    local v285 = 0
                    local v286 = 0
                    local v287 = v_u_272.get_store(v284)
                    if v287 then
                        v287 = v287:get("roleplay_stats_manager")
                    end
                    if v287 then
                        v285 = v287:get("criminal_furniture_crushed_count")
                        v286 = v287:get("criminal_furniture_crushed_value")
                    end
                    local v288 = v283.list
                    table.insert(v288, {
                        ["player"] = v284,
                        ["quantity"] = v285,
                        ["value"] = v286
                    })
                end
                table.sort(v283.list, function(p289, p290)
                    return p289.quantity > p290.quantity
                end)
                p_u_270.leaderboard_info = v283
                p_u_271()
            end
            task.spawn(function()
                while true do
                    v_u_291()
                    task.wait(5)
                end
            end)
        end,
        ["render"] = function(p292, p293)
            local v294 = p292.leaderboard_info
            local v295 = p293.Board.Gui.Frame
            v295.TotalLabel.Text = "$" .. v294.total_crushed_value
            local v296 = v295.ListFrame
            local v297 = nil
            local v298 = nil
            for v299, v300 in pairs(v294.list) do
                if v300.player == v_u_10.LocalPlayer then
                    v298 = v299
                    v297 = v300
                    break
                end
            end
            local v301
            if v297 == nil then
                v301 = false
            else
                v301 = v298 > 5
            end
            if v301 then
                local v302 = v294.list[1]
                local v303 = v296["Slot" .. 1]
                if v302 == nil then
                    v303.Rank.Text = ""
                    v303.PlayerName.Text = ""
                    v303.Quantity.Text = ""
                    v303.Value.Text = ""
                else
                    v303.Rank.Text = 1
                    v303.PlayerName.Text = v302.player.Name
                    v303.Quantity.Text = v302.quantity
                    v303.Value.Text = "$" .. v302.value
                end
                local v304 = v294.list[2]
                local v305 = v296["Slot" .. 2]
                if v304 == nil then
                    v305.Rank.Text = ""
                    v305.PlayerName.Text = ""
                    v305.Quantity.Text = ""
                    v305.Value.Text = ""
                else
                    v305.Rank.Text = 2
                    v305.PlayerName.Text = v304.player.Name
                    v305.Quantity.Text = v304.quantity
                    v305.Value.Text = "$" .. v304.value
                end
                local v306 = v294.list[3]
                local v307 = v296["Slot" .. 3]
                if v306 == nil then
                    v307.Rank.Text = ""
                    v307.PlayerName.Text = ""
                    v307.Quantity.Text = ""
                    v307.Value.Text = ""
                else
                    v307.Rank.Text = 3
                    v307.PlayerName.Text = v306.player.Name
                    v307.Quantity.Text = v306.quantity
                    v307.Value.Text = "$" .. v306.value
                end
                local v308 = v294.list[4]
                local v309 = v296["Slot" .. 4]
                if v308 == nil then
                    v309.Rank.Text = ""
                    v309.PlayerName.Text = ""
                    v309.Quantity.Text = ""
                    v309.Value.Text = ""
                else
                    v309.Rank.Text = 4
                    v309.PlayerName.Text = v308.player.Name
                    v309.Quantity.Text = v308.quantity
                    v309.Value.Text = "$" .. v308.value
                end
                local v310 = v296["Slot" .. 5]
                if v297 == nil then
                    v310.Rank.Text = ""
                    v310.PlayerName.Text = ""
                    v310.Quantity.Text = ""
                    v310.Value.Text = ""
                else
                    v310.Rank.Text = v298
                    v310.PlayerName.Text = v297.player.Name
                    v310.Quantity.Text = v297.quantity
                    v310.Value.Text = "$" .. v297.value
                end
            else
                for v311 = 1, 5 do
                    local v312 = v294.list[v311]
                    local v313 = v296["Slot" .. v311]
                    if v312 == nil then
                        v313.Rank.Text = ""
                        v313.PlayerName.Text = ""
                        v313.Quantity.Text = ""
                        v313.Value.Text = ""
                    else
                        v313.Rank.Text = v311
                        v313.PlayerName.Text = v312.player.Name
                        v313.Quantity.Text = v312.quantity
                        v313.Value.Text = "$" .. v312.value
                    end
                end
                return
            end
        end
    },
    ["nail_polish_bench_get_nails_done"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Get Nails Painted",
        ["animation"] = "GetNailsPainted"
    }),
    ["nail_polish_bench_paint_other_person_nails"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Paint Nails",
        ["animation"] = "PaintingNails"
    }),
    ["clothingrack"] = {
        ["use_text"] = "Dress Up",
        ["client_use"] = function(_, _, p314)
            local v315 = v_u_1("UIManager")
            local v316 = game.Players.LocalPlayer.Character
            if v316 then
                v316 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            local v317 = game.Players.LocalPlayer.Character
            if v317 then
                v317 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            end
            if v316 and (v317 and v317.Sit ~= true) then
                v316.CFrame = CFrame.new(p314.UseBlocks.UseBlock.Position, v316.Position) - p314.UseBlocks.UseBlock.Position + v316.Position
            end
            v315.set_app_visibility("AvatarEditorApp", true)
            if v315.apps.AvatarEditorApp:is_focusing_pet() then
                v315.apps.AvatarEditorApp:set_focused_avatar_type("player")
            end
        end
    },
    ["feedback_center"] = {
        ["use_text"] = "Give Feedback to Developers",
        ["interaction_tag"] = "feedback_center",
        ["client_get_data_for_server_use"] = function(_, _, _)
            local v_u_318 = v_u_1("UIManager")
            if v_u_318.apps.DialogApp:dialog({
                ["text"] = string.format("Hey %s, your honest feedback is important for shaping the future of the game.\n  - Adopt Me Developers", game.Players.LocalPlayer.Name),
                ["left"] = "Cancel",
                ["right"] = "Begin"
            }) == "Cancel" then
                return
            else
                local v319 = {
                    "\240\159\152\129",
                    "\240\159\153\130",
                    "\240\159\152\144",
                    "\226\152\185\239\184\143",
                    "\240\159\152\161"
                }
                local v320, v321 = v_u_318.apps.DialogApp:dialog({
                    ["dialog_type"] = "DropdownDialog",
                    ["header"] = "How are you finding things here?",
                    ["choices"] = v319,
                    ["left"] = "Cancel",
                    ["right"] = "Next"
                })
                if v320 ~= "Cancel" then
                    local v322 = nil
                    for v323, v324 in ipairs(v319) do
                        if v321 == v324 then
                            v322 = 6 - v323
                        end
                    end
                    local v325, v326 = v_u_318.apps.DialogApp:paragraph_dialog({
                        ["placeholder_text"] = "Write specific feedback here",
                        ["left"] = "Cancel",
                        ["right"] = "Submit",
                        ["use_utf8_length"] = true
                    })
                    if v325 ~= "Cancel" then
                        task.spawn(function()
                            v_u_318.apps.DialogApp:dialog({
                                ["text"] = "Thanks for the feedback! Feel free to submit again later.",
                                ["button"] = "Close"
                            })
                        end)
                        return {
                            ["rating"] = v322,
                            ["specific_feedback"] = v326
                        }
                    end
                end
            end
        end,
        ["server_use"] = function(p327, p328, _, p329)
            local v330 = v_u_1("package:Stash")
            local v331 = p329.rating
            local v332 = p329.specific_feedback
            if ({
                true,
                true,
                true,
                true,
                true
            })[v331] then
                if typeof(v332) == "string" then
                    v330:into("surveys"):log("Feedback center submission", {
                        ["user_id"] = p327.UserId,
                        ["rating"] = v331,
                        ["specific_feedback"] = v332,
                        ["feedback_center_context"] = p328.feedback_center_context
                    })
                end
            else
                return
            end
        end
    },
    ["pizza_shop_order_board"] = {
        ["init"] = function(p_u_333, p_u_334)
            local v335 = v_u_1("PizzaShop")
            local v_u_336 = v_u_1("WeatherServer")
            p_u_333.orders = {}
            p_u_333.is_active = v_u_336.is_day()
            v335.orders_updated:Connect(function(p337)
                p_u_333.orders = p337
                p_u_334()
            end)
            v_u_336.on_weather_changed:Connect(function()
                p_u_333.is_active = v_u_336.is_day()
                p_u_334()
            end)
        end,
        ["render"] = function(p338, p339, _, _, p340)
            local v341 = v_u_1("package:Roact")
            local v342 = v_u_1("PizzaShopOrderBoardGui", true)
            local v343 = v341.createElement("SurfaceGui", {
                ["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
                ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                ["PixelsPerStud"] = 32,
                ["LightInfluence"] = 1
            }, { v341.createElement(v342, {
                    ["IsActive"] = p338.is_active,
                    ["Orders"] = p338.orders
                }) })
            p340:set_local_temp_state("roact_handle", (v341.mount(v343, p339.Board)))
        end,
        ["unrender"] = function(_, _, _, p344)
            local v345 = v_u_1("package:Roact")
            local v346 = p344:get_local_temp_state("roact_handle")
            v345.unmount(v346)
        end
    },
    ["pizza_shop_dough_rack"] = v2.GRAB_ITEM("food", "pizza_shop_pizza", nil, function(p347)
        local v348 = v_u_1("PizzaShop")
        local v349 = v348.create_pizza()
        v348.attribute_step_to_player(v349, "grab_dough", p347)
        return {
            ["pizza"] = v349
        }
    end, nil, "Grab Dough"),
    ["pizza_shop_rolling_station"] = v2.PROCESSING_STATION({
        ["use_text"] = function()
            local v350 = v_u_1("PizzaShopHelper").get_any_pizza_item()
            if v350 then
                if v350.properties.pizza.state == "Dough" then
                    return "Roll Dough"
                end
            end
        end,
        ["char_offset"] = CFrame.new(0, -2.2, 1.5),
        ["animation"] = "PizzaShopRollDough",
        ["is_human_standing"] = true,
        ["processing_time"] = function()
            return v_u_1("PizzaShopHelper").get_rolling_time()
        end,
        ["on_started"] = function(p351, p352)
            local v353 = v_u_1("PizzaShopHelper").get_any_pizza_item(p351)
            if v353 then
                local v354 = v353.properties.pizza
                v353:destroy()
                p352.pizza = v354
            end
        end,
        ["on_finished"] = function(p355, p356)
            local v357 = v_u_1("PizzaShopHelper")
            local v358 = v_u_1("PizzaShop")
            local v359 = p356.pizza
            v359.state = "Uncooked"
            p356.pizza = nil
            v358.attribute_step_to_player(v359, "roll_dough", p355)
            v357.give_pizza_item(p355, v359)
        end,
        ["on_canceled"] = function(p360, p361)
            local v362 = v_u_1("PizzaShopHelper")
            local v363 = p361.pizza
            p361.pizza = nil
            v362.give_pizza_item(p360, v363)
        end,
        ["render"] = function(p364, p365)
            local v366 = p365.Dough
            if p364.is_processing then
                local v367 = ((Vector3.new(2.5, 0.2, 2.5)).Y - v366.Size.Y) / 2
                v_u_13:Create(v366, TweenInfo.new(p364.processing_time, Enum.EasingStyle.Linear), {
                    ["Size"] = Vector3.new(2.5, 0.2, 2.5),
                    ["CFrame"] = v366.CFrame * CFrame.new(0, v367, 0)
                }):Play()
            else
                v366:Destroy()
            end
        end,
        ["post_render"] = function(p368, p369)
            if p368.is_processing then
                p369.PlacementBlock.DoughKneadLoop:Play()
            end
        end
    }),
    ["pizza_shop_topping_station"] = {
        ["use_text"] = function(p370, _, p371)
            local v372 = v_u_1("PizzaShopHelper")
            if p371.Name == "Pizza" then
                if p370.pizza then
                    return "Take Unbaked Pizza"
                else
                    local v373 = v372.get_any_pizza_item()
                    if v373 then
                        if v373.properties.pizza.state == "Uncooked" then
                            return "Top Pizza"
                        end
                    end
                end
            else
                local v374 = v372.get_equipped_ingredient_item()
                if v374 then
                    local v375 = v_u_6[v374.category][v374.kind]
                    if v375 and v375.name == v372.get_ingredient_from_topping(p371.Name) then
                        return "Refill bowl of " .. string.lower(v375.name)
                    else
                        return nil
                    end
                else
                    local v376 = p370.pizza
                    if v376 then
                        if v376.toppings[p371.Name] then
                            return nil
                        else
                            return "Add " .. p371.Name
                        end
                    else
                        return nil
                    end
                end
            end
        end,
        ["server_use"] = function(p377, p378, _, _, _, _, p379)
            local v380 = v_u_1("PizzaShopHelper")
            local v381 = v_u_1("PizzaShop")
            if p379 == "Pizza" then
                if p378.pizza then
                    local v382 = p378.pizza
                    if v380.get_can_use_pizza_async(v382, p377) then
                        if p378.pizza then
                            p378.pizza = nil
                            v380.give_pizza_item(p377, v382)
                        end
                    else
                        v380.warn_pizza_ownership(p377)
                        return
                    end
                else
                    local v383 = v380.get_any_pizza_item(p377)
                    if v383 then
                        local v384 = v383.properties.pizza
                        if v384.state == "Uncooked" then
                            v380.mark_pizza_ownership(v384, p377)
                            p378.pizza = v384
                            v383:destroy()
                        end
                    else
                        return
                    end
                end
            else
                local v385 = v380.get_equipped_ingredient_item(p377)
                if v385 then
                    if v_u_6[v385.category][v385.kind] then
                        v385:destroy()
                    end
                elseif p378.pizza then
                    local v386 = p378.pizza
                    if v380.get_can_use_pizza_async(v386, p377) then
                        if p378.pizza then
                            v380.mark_pizza_ownership(v386, p377)
                            v386.toppings[p379] = true
                            v381.attribute_step_to_player(v386, "top_pizza", p377)
                        end
                    else
                        v380.warn_pizza_ownership(p377)
                        return
                    end
                else
                    return
                end
            end
        end,
        ["post_render"] = function(p_u_387, p_u_388)
            local v_u_389 = v_u_1("PizzaRenderHelper")
            local v_u_390 = p_u_388.Dough.CFrame
            p_u_388.Dough:Destroy()
            local v391 = p_u_388.PlacementBlock.IngredientPlaceOnPizza:Clone()
            v391.Parent = p_u_388.PlacementBlock
            v391:Play()
            if p_u_387.pizza then
                task.spawn(function()
                    local v392 = v_u_389.get_model_async()
                    if p_u_388:IsDescendantOf(workspace) then
                        v_u_389.render_for_furniture(v392, p_u_387.pizza)
                        v392.PrimaryPart = v392.Uncooked.Dough
                        v392:SetPrimaryPartCFrame(v_u_390)
                        v392.Parent = p_u_388
                    end
                end)
            end
        end
    },
    ["pizza_shop_oven"] = {
        ["init"] = function(p393)
            p393.oven_state = "Ready"
        end,
        ["use_text"] = function(p394)
            local v395 = v_u_1("PizzaShopHelper")
            if p394.oven_state == "Baking" then
                return
            elseif p394.oven_state == "Ready" then
                local v396 = v395.get_any_pizza_item()
                if v396 then
                    if v396.properties.pizza.state == "Uncooked" then
                        return "Bake Pizza"
                    end
                end
            else
                if p394.oven_state == "Finished" then
                    return "Take Finished Pizza"
                end
                return
            end
        end,
        ["post_render"] = function(p_u_397, p_u_398)
            local v_u_399 = v_u_1("PizzaRenderHelper")
            local v400 = v_u_1("PizzaShopHelper")
            local v_u_401 = p_u_398.Dough.CFrame
            p_u_398.Dough:Destroy()
            if p_u_397.pizza then
                task.spawn(function()
                    local v402 = v_u_399.get_model_async()
                    if p_u_398:IsDescendantOf(workspace) then
                        v_u_399.render_for_furniture(v402, p_u_397.pizza)
                        v402.PrimaryPart = v402[p_u_397.pizza.state].Dough
                        v402:SetPrimaryPartCFrame(v_u_401)
                        v402.Parent = p_u_398
                    end
                end)
            end
            if p_u_397.oven_state ~= "Baking" then
                p_u_398.EmitterPart:Destroy()
                p_u_398.GlowPart:Destroy()
            end
            if p_u_397.oven_state == "Baking" then
                p_u_398.PlacementBlock.FireLoop:Play()
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.Size = UDim2.new(0, 0, 1, 0)
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.RedBar.Visible = true
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.GreenBar.Visible = false
                p_u_398.ProgressBar.SurfaceGui.Center.BarBacking.Visible = true
                p_u_398.ProgressBar.SurfaceGui.Center.Icons.FireIcon.Visible = true
                p_u_398.ProgressBar.SurfaceGui.Center.Icons.CheckIcon.Visible = false
                local v403 = v400.get_oven_cooking_time()
                v_u_13:Create(p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer, TweenInfo.new(v403, Enum.EasingStyle.Linear), {
                    ["Size"] = UDim2.new(1, 0, 1, 0)
                }):Play()
                return
            elseif p_u_397.oven_state == "Finished" then
                p_u_398.PlacementBlock.Ding:Play()
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.Size = UDim2.new(1, 0, 1, 0)
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.RedBar.Visible = false
                p_u_398.ProgressBar.SurfaceGui.Center.BarFrontContainer.GreenBar.Visible = true
                p_u_398.ProgressBar.SurfaceGui.Center.BarBacking.Visible = false
                p_u_398.ProgressBar.SurfaceGui.Center.Icons.FireIcon.Visible = false
                p_u_398.ProgressBar.SurfaceGui.Center.Icons.CheckIcon.Visible = true
            else
                p_u_398.ProgressBar:Destroy()
            end
        end,
        ["server_use"] = function(p_u_404, p_u_405, p_u_406)
            local v_u_407 = v_u_1("PizzaShopHelper")
            local v408 = v_u_1("PizzaShop")
            local v409 = v_u_1("ServerRouter")
            if p_u_405.oven_state == "Baking" then
                return
            elseif p_u_405.oven_state == "Ready" then
                local v410 = v_u_407.get_any_pizza_item(p_u_404)
                if v410 then
                    local v_u_411 = v410.properties.pizza
                    if v_u_411.state == "Uncooked" then
                        p_u_405.oven_state = "Baking"
                        p_u_405.pizza = v_u_411
                        v410:destroy()
                        v408.attribute_step_to_player(p_u_405.pizza, "bake_pizza", p_u_404)
                        local v412 = v_u_407.get_oven_cooking_time()
                        task.delay(v412, function()
                            v_u_407.mark_pizza_ownership(v_u_411, p_u_404)
                            v_u_411.state = "Cooked"
                            p_u_405.oven_state = "Finished"
                            p_u_406()
                        end)
                    end
                else
                    return
                end
            else
                if p_u_405.oven_state == "Finished" then
                    local v413 = p_u_405.pizza
                    if not v413 then
                        return
                    end
                    if not v_u_407.get_can_use_pizza_async(v413, p_u_404) then
                        v_u_407.warn_pizza_ownership(p_u_404, "This pizza is too hot! Try again in a few seconds.")
                        return
                    end
                    if not p_u_405.pizza then
                        return
                    end
                    v_u_407.give_pizza_item(p_u_404, p_u_405.pizza)
                    p_u_405.pizza = nil
                    p_u_405.oven_state = "Ready"
                    v409.get("RoleplayAPI/NavigateToPizzaShopConveyor"):FireClient(p_u_404)
                end
                return
            end
        end
    },
    ["pizza_shop_trash_can"] = {
        ["use_text"] = function()
            if v_u_1("PizzaShopHelper").get_equipped_pizza_item() then
                return "Throw Pizza Away"
            end
        end,
        ["server_use"] = function(p414)
            local v415 = v_u_1("PizzaShopHelper").get_equipped_pizza_item(p414)
            if v415 then
                v415:destroy()
            end
        end
    },
    ["pizza_shop_conveyor_belt"] = {
        ["init"] = function(p_u_416, p_u_417, p_u_418)
            local v419 = v_u_1("PizzaShop")
            p_u_418.conveyor = v_u_1("ConveyorBeltSimulator").new(6, 1)
            p_u_416.conveyor_state = p_u_418.conveyor:get_state()
            p_u_418.active = true
            task.spawn(function()
                while p_u_418.active do
                    p_u_418.conveyor:update(task.wait())
                end
            end)
            p_u_418.connection = v419.pizza_summoned:Connect(function(p420)
                local v421 = p_u_418.conveyor
                if v421:is_full() then
                    v421:boot_object()
                end
                v421:add_object({
                    ["pizza"] = p420
                })
                p_u_416.conveyor_state = v421:get_state()
                p_u_417()
            end)
        end,
        ["post_render"] = function(p422, p_u_423, _, _, p424)
            local v425 = v_u_1("ConveyorBeltSimulator")
            local v_u_426 = v_u_1("PizzaRenderHelper")
            local v_u_427 = v425.new(6, 1)
            v_u_427:set_state(p422.conveyor_state)
            p424:set_local_temp_state("conveyor", v_u_427)
            for _, v_u_428 in pairs(v_u_427.objects) do
                task.spawn(function()
                    local v429 = v_u_426.get_model_async()
                    if p_u_423:IsDescendantOf(workspace) then
                        v_u_426.render_for_furniture(v429, v_u_428.pizza)
                        v429.PrimaryPart = v429.Cooked.Dough
                        v429.Parent = p_u_423
                        v_u_428.model = v429
                    end
                end)
            end
            if v_u_427.added_object and v_u_427.added_object.pizza.is_first_time_hand_delivery then
                local v430 = p_u_423.Sign.Gui
                local v_u_431 = v430.Arrow
                local v432 = v_u_427.added_object.pizza.delivery_status
                local v_u_433
                if v432 == "perfect" then
                    v_u_433 = v430.Good
                    p_u_423.Sign:FindFirstChild("Correct"):Play()
                elseif v432 == "okay" then
                    v_u_433 = v430.Ok
                    p_u_423.Sign:FindFirstChild("Okay"):Play()
                else
                    v_u_433 = v430.Bad
                    p_u_423.Sign:FindFirstChild("Wrong"):Play()
                end
                v_u_433.Size = UDim2.fromScale(0, 0)
                local v_u_434 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
                v_u_13:Create(v_u_431, v_u_434, {
                    ["Size"] = UDim2.fromScale(0, 0)
                }):Play()
                v_u_433.Visible = true
                local v435 = v_u_13:Create(v_u_433, v_u_434, {
                    ["Size"] = UDim2.fromScale(1, 1)
                })
                v435.Completed:Connect(function()
                    if p_u_423.Parent then
                        v_u_431.Visible = false
                        task.wait(2)
                        if p_u_423.Parent then
                            v_u_431.Visible = true
                            v_u_13:Create(v_u_431, v_u_434, {
                                ["Size"] = UDim2.fromScale(1, 1)
                            }):Play()
                            local v436 = v_u_13:Create(v_u_433, v_u_434, {
                                ["Size"] = UDim2.fromScale(0, 0)
                            })
                            v436.Completed:Connect(function()
                                if p_u_423.Parent then
                                    v_u_433.Visible = false
                                end
                            end)
                            v436:Play()
                        end
                    else
                        return
                    end
                end)
                v435:Play()
            end
            local v437 = p_u_423.Points:GetChildren()
            table.sort(v437, function(p438, p439)
                local v440 = p438.Name
                local v441 = tonumber(v440)
                local v442 = p439.Name
                return v441 < tonumber(v442)
            end)
            local v_u_443 = {}
            local v444 = 0
            for v445 = 1, #v437 - 1 do
                local v446 = v437[v445]
                local v447 = v437[v445 + 1].Position - v446.Position
                local v448 = v447.Magnitude
                local v449 = v447 / v448
                local v450 = {
                    ["position"] = v446.Position,
                    ["length"] = v448,
                    ["direction"] = v449
                }
                table.insert(v_u_443, v450)
                v444 = v444 + v450.length
            end
            for v451, v452 in ipairs(v_u_443) do
                v452.scalar_length = v452.length / v444
                if v451 > 1 then
                    v452.scalar_start = v_u_443[v451 - 1].scalar_end
                    v452.scalar_end = v452.scalar_start + v452.scalar_length
                else
                    v452.scalar_start = 0
                    v452.scalar_end = v452.scalar_length
                end
            end
            local function v_u_457(p453)
                if p453 < 0 then
                    return v_u_443[1].position
                end
                if p453 >= 1 then
                    local v454 = v_u_443[#v_u_443]
                    return v454.position + v454.direction * v454.length
                end
                for _, v455 in ipairs(v_u_443) do
                    if v455.scalar_start <= p453 and p453 < v455.scalar_end then
                        local v456 = (p453 - v455.scalar_start) / v455.scalar_length
                        return v455.position + v455.direction * v455.length * v456
                    end
                end
            end
            task.spawn(function()
                while p_u_423:IsDescendantOf(workspace) do
                    for _, v458 in pairs(v_u_427.objects) do
                        if v458.model then
                            local v459 = v_u_457((v458.position + 0.5) / v_u_427.length)
                            v458.model:SetPrimaryPartCFrame(CFrame.new(v459))
                        end
                    end
                    v_u_427:update(task.wait())
                end
            end)
            if v_u_427.booted_object then
                task.spawn(function()
                    local v460 = v_u_426.get_model_async()
                    if p_u_423:IsDescendantOf(workspace) then
                        v_u_426.render_for_furniture(v460, v_u_427.booted_object.pizza)
                        v460.PrimaryPart = v460.Cooked.Dough
                        v460.Parent = p_u_423
                        local v461 = v_u_457((v_u_427.length - 0.5) / v_u_427.length)
                        v460:SetPrimaryPartCFrame(CFrame.new(v461))
                        for _, v462 in game.ReplicatedStorage.Resources.Particles.EquipPoof:GetChildren() do
                            local v463 = v462:Clone()
                            v463.Parent = v460.PrimaryPart
                            v463:Emit(20)
                        end
                        for _, v464 in v460:GetDescendants() do
                            if v464:IsA("BasePart") then
                                v_u_13:Create(v464, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                                    ["Transparency"] = 1
                                }):Play()
                            end
                        end
                        task.wait(8)
                        v460:Destroy()
                    end
                end)
            end
        end,
        ["server_furniture_deactivated"] = function(p465)
            p465.active = false
        end,
        ["use_text"] = function(_, _, p466, p467)
            local v468 = v_u_1("PizzaShopHelper")
            if p466.Name == "Deliver" then
                local v469 = v468.get_any_pizza_item()
                if v469 then
                    if v469.properties.pizza.state == "Cooked" then
                        return "Deliver Pizza"
                    end
                end
            else
                local v470 = p466.Name
                if string.sub(v470, 1, 4) == "Take" then
                    local v471 = p466.Name
                    local v472 = string.sub(v471, 5, 5)
                    local v473 = tonumber(v472)
                    local v474 = p467:get_local_temp_state("conveyor")
                    return v474:get_object_at_position(v474.length - v473) and "Take Pizza" or nil
                end
                return
            end
        end,
        ["client_get_data_for_server_use"] = function(_, _, _, _, p475, p476)
            local v477 = p475.Name
            if string.sub(v477, 1, 4) ~= "Take" then
                return true
            end
            local v478 = p475.Name
            local v479 = string.sub(v478, 5, 5)
            local v480 = tonumber(v479)
            local v481 = p476:get_local_temp_state("conveyor")
            local v482 = v481:get_object_at_position(v481.length - v480)
            if v482 then
                return v482.guid
            end
        end,
        ["server_use"] = function(p483, p484, _, p485, _, _, p486, p487)
            local v488 = v_u_1("PizzaShopHelper")
            local v489 = v_u_1("PizzaShop")
            if p486 == "Deliver" then
                local v490 = v488.get_any_pizza_item(p483)
                if v490 then
                    local v491 = v490.properties.pizza
                    if v491.state == "Cooked" then
                        v490:destroy()
                        v491.is_first_time_hand_delivery = v491.delivered ~= true
                        v489.attribute_step_to_player(v491, "deliver_pizza", p483)
                        v488.deliver_pizza_for_pay(p483, v491)
                        local v492 = p487.conveyor
                        if v492:is_full() then
                            v492:boot_object()
                        end
                        v492:add_object({
                            ["pizza"] = v491
                        })
                        p484.conveyor_state = v492:get_state()
                    end
                else
                    return
                end
            else
                if string.sub(p486, 1, 4) == "Take" then
                    local v493 = p487.conveyor
                    local v494 = v493:get_object_with_guid(p485)
                    if not v494 then
                        return
                    end
                    local v495 = v494.pizza
                    v493:remove_object(v494)
                    v488.give_pizza_item(p483, v495)
                    p484.conveyor_state = v493:get_state()
                end
                return
            end
        end
    },
    ["pizza_shop_order_tablet"] = {
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = function()
            return nil
        end,
        ["server_use"] = function(_, _, _, p496)
            local v497 = v_u_1("PizzaShop")
            local v498 = p496.pizza_type
            if v497.is_valid_pizza_type(v498) then
                v497.summon_pizza(v498)
            end
        end,
        ["render"] = function(_, p_u_499, _, _, p_u_500)
            local v501 = v_u_1("package:Roact")
            local v502 = v_u_1("PizzaShopOrderTabletGui", true)
            local v_u_503 = v_u_1("RoleplayDB")
            local v_u_504 = v_u_1("UIManager")
            local v506 = v501.createElement("SurfaceGui", {
                ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud,
                ["PixelsPerStud"] = 32,
                ["LightInfluence"] = 0.3
            }, { v501.createElement(v502, {
                    ["GetIsActive"] = function()
                        return true
                    end,
                    ["GetHasAccess"] = function()
                        return true
                    end,
                    ["OnOrdered"] = function(p_u_505)
                        p_u_499.Screen.Sound:Play()
                        task.spawn(function()
                            p_u_500:activate_async(nil, {
                                ["pizza_type"] = p_u_505
                            })
                        end)
                    end,
                    ["OnRejected"] = function()
                        v_u_504.apps.MissingRoleApp:show_missing_roles({ v_u_503.pizza_shop.roles.pizza_server })
                    end
                }) })
            p_u_500:set_local_temp_state("roact_handle", (v501.mount(v506, p_u_499.Screen)))
        end,
        ["unrender"] = function(_, _, _, p507)
            local v508 = v_u_1("package:Roact")
            local v509 = p507:get_local_temp_state("roact_handle")
            v508.unmount(v509)
        end
    },
    ["pizza_shop_ingredients_crates"] = {
        ["use_text"] = function(_, _, p510)
            return "Grab " .. p510.Name
        end,
        ["server_use"] = function(p511, _, _, _, _, _, p512)
            local v513 = v_u_1("PizzaShopHelper")
            if v513.is_valid_ingredient(p512) then
                v513.give_ingredient_item(p511, p512)
            end
        end
    },
    ["pizza_shop_display_case"] = {
        ["init"] = function(p_u_514, p_u_515, p516)
            local v517 = v_u_1("PizzaShop")
            local v_u_518 = v_u_1("PizzaShopHelper")
            p_u_514.pizzas = {}
            p516.connection = v517.debug_pizzas_filled:Connect(function()
                local v519 = {}
                for _, v520 in v_u_518.recipes_by_pizza_type do
                    table.insert(v519, v520)
                end
                for v521 = 1, 4 do
                    local v522 = "Pizza" .. v521
                    p_u_514.pizzas[v522] = {
                        ["state"] = "Cooked",
                        ["toppings"] = table.clone(v519[math.random(1, #v519)]),
                        ["attribution"] = {}
                    }
                end
                p_u_515()
            end)
        end,
        ["server_furniture_deactivated"] = function(p523)
            p523.connection:Disconnect()
        end,
        ["use_text"] = function(p524, _, p525)
            local v526 = v_u_1("PizzaShopHelper").get_any_pizza_item()
            if v526 then
                return p524.pizzas[p525.Name] and "Take Pizza" or (v526.properties.pizza.state == "Cooked" and "Display Pizza" or nil)
            else
                return p524.pizzas[p525.Name] and "Take Pizza" or nil
            end
        end,
        ["post_render"] = function(p527, p_u_528)
            local v_u_529 = v_u_1("PizzaRenderHelper")
            for _, v530 in p_u_528.Pizzas:GetChildren() do
                local v_u_531 = v530.CFrame
                v530:Destroy()
                local v_u_532 = p527.pizzas[v530.Name]
                if v_u_532 then
                    task.spawn(function()
                        local v533 = v_u_529.get_model_async()
                        if p_u_528:IsDescendantOf(workspace) then
                            v_u_529.render_for_furniture(v533, v_u_532)
                            v533.PrimaryPart = v533.Cooked.Dough
                            v533:SetPrimaryPartCFrame(v_u_531)
                            v533.Parent = p_u_528
                        end
                    end)
                end
            end
        end,
        ["server_use"] = function(p534, p535, _, _, _, _, p536)
            local v537 = v_u_1("PizzaShopHelper")
            if p536 == "Pizza" .. 1 and true or (p536 == "Pizza" .. 2 and true or (p536 == "Pizza" .. 3 and true or (p536 == "Pizza" .. 4 and true or false))) then
                if p535.pizzas[p536] then
                    v537.give_pizza_item(p534, p535.pizzas[p536])
                    p535.pizzas[p536] = nil
                else
                    local v538 = v537.get_any_pizza_item(p534)
                    if v538 then
                        local v539 = v538.properties.pizza
                        if v539.state ~= "Cooked" then
                            return
                        end
                        p535.pizzas[p536] = v539
                        v538:destroy()
                    end
                end
            else
                return
            end
        end
    },
    ["pizza_shop_drive_through"] = {
        ["init"] = function(p_u_540, p_u_541, p542)
            local v543 = v_u_1("PizzaShop")
            p_u_540.drive_through = v543.drive_through
            p542.connection = v543.drive_through_updated:Connect(function(p544)
                p_u_540.drive_through = p544
                p_u_541()
            end)
        end,
        ["server_furniture_deactivated"] = function(p545)
            p545.connection:Disconnect()
        end,
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = function()
            if v_u_1("PizzaShopHelper").get_equipped_pizza_item() then
                return "Deliver Pizza"
            end
        end,
        ["server_use"] = function(p546)
            local v547 = v_u_1("PizzaShop")
            local v548 = v_u_1("PizzaShopHelper")
            local v549 = v_u_1("ServerRouter")
            local v550 = v548.get_equipped_pizza_item(p546)
            if v550 then
                local v551 = v550.properties.pizza
                if v547.deliver_pizza_to_drive_through(v551) then
                    v550:destroy()
                else
                    local v552 = v551.boxed and "Frustrated" or "NoBox"
                    v549.get("RoleplayAPI/PizzaShopDriveThroughRejected"):FireClient(p546, v552)
                end
            else
                return
            end
        end,
        ["post_render"] = function(p_u_553, p_u_554, _, _, p555)
            local v556 = v_u_1("DownloadClient")
            local v_u_557 = v_u_1("package:Roact")
            local v_u_558 = v_u_1("PizzaShopDriveThroughSpeechBubbleGui", true)
            local v559 = v_u_1("RouterClient")
            local v_u_560 = v_u_1("SoundPlayer")
            local v561 = p_u_553.drive_through
            if v561 then
                local v_u_562 = v556.promise_download_copy("Vehicles", v561.vehicle_id):expect()
                local v_u_563 = v556.promise_download_copy("Pets", v561.pet_id):expect()
                for _, v564 in v_u_562:GetDescendants() do
                    if v564:IsA("BasePart") then
                        v564.Anchored = true
                    end
                end
                v_u_562.Parent = p_u_554
                local v565, v566 = v_u_562:GetBoundingBox()
                local v567 = v_u_562:GetPivot():ToObjectSpace(v565)
                local v_u_568 = p_u_554.PlacementBlock.CFrame * CFrame.new(0, 0.5 + v566.Y / 2, 0) * v567:Inverse()
                local v_u_569 = v_u_568 * CFrame.new(0, 0, 64)
                local v570 = v_u_568 * CFrame.new(0, 0, -64)
                v_u_562:PivotTo(v_u_569)
                p555:set_local_temp_state("car_data", {
                    ["model"] = v_u_562,
                    ["finish"] = v570,
                    ["duration"] = 3
                })
                p555:set_local_temp_state("pet_model", v_u_563)
                v_u_563.Parent = v_u_562
                local v571 = Instance.new("Weld")
                v571.Part0 = v_u_562.VehicleSeat
                v571.Part1 = v_u_563.HumanoidRootPart
                v571.C0 = CFrame.new(0, v571.Part0.Size.Y / 2 + v571.Part1.Size.Y / 2 + 1, 0)
                v571.Parent = v571.Part1
                local v572 = v_u_6.pets[v561.pet_id]
                local v573 = v572 and v572.anims
                if v573 then
                    v573 = v572.anims.idle
                end
                local v574 = string.format
                local v575 = v561.pet_id
                assert(v573, v574("Bad pet id: %s.", v575))
                local v576 = v_u_4.get_track(v572.anims.idle)
                v_u_563.PetModel.AnimationController.Animator:LoadAnimation(v576):Play()
                local v_u_577 = v_u_9.new()
                local v_u_578 = v_u_9.new()
                p555:set_local_temp_state("event_data", {
                    ["frustrated"] = v_u_577,
                    ["satisfied"] = v_u_578,
                    ["rejected_connection"] = v559.get("RoleplayAPI/PizzaShopDriveThroughRejected").OnClientEvent:Connect(function(p579)
                        if v_u_563:FindFirstChild("HumanoidRootPart") then
                            v_u_560.FX:play("Roleplay/WrongRoleWrongOrder", v_u_563.HumanoidRootPart).Volume = 1.25
                        end
                        v_u_577:Fire(p579)
                    end)
                })
                task.spawn(function()
                    local v580 = 0
                    local v581 = 0
                    while v580 < 1 and p_u_554:IsDescendantOf(workspace) do
                        v580 = v580 + v581 * 0.3333333333333333
                        v_u_562:PivotTo(v_u_569:Lerp(v_u_568, v_u_13:GetValue(v580, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)))
                        v581 = task.wait()
                    end
                    if p_u_554:IsDescendantOf(workspace) then
                        v_u_562:PivotTo(v_u_568)
                        local v_u_582 = nil
                        local v583 = v_u_557.createElement
                        local v584 = {
                            ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 10, 0),
                            ["Size"] = UDim2.new(3, 0, 3, 0),
                            ["LightInfluence"] = 0.5
                        }
                        local v585 = {
                            ["Bubble"] = v_u_557.createElement(v_u_558, {
                                ["PizzaType"] = p_u_553.drive_through.pizza_type,
                                ["OnFinished"] = function()
                                    v_u_557.unmount(v_u_582)
                                end,
                                ["Frustrated"] = v_u_577,
                                ["Satisfied"] = v_u_578
                            })
                        }
                        local v586 = v583("BillboardGui", v584, v585)
                        v_u_582 = v_u_557.mount(v586, v_u_563.HumanoidRootPart)
                    end
                end)
            end
        end,
        ["unrender"] = function(_, _, _, p587)
            local v588 = v_u_1("SoundPlayer")
            local v589 = p587:get_local_temp_state("event_data")
            if v589 then
                v589.satisfied:Fire()
                v589.rejected_connection:Disconnect()
                local v590 = p587:get_local_temp_state("pet_model")
                if v590 and v590:FindFirstChild("HumanoidRootPart") then
                    v588.FX:play("Roleplay/CorrectOrder", v590.HumanoidRootPart)
                end
            end
            local v591 = p587:get_local_temp_state("car_data")
            if v591 then
                local v_u_592 = v591.model
                local v_u_593 = v_u_592:GetPivot()
                local v_u_594 = v591.finish
                local v_u_595 = v591.duration
                if not v_u_592.Parent then
                    return
                end
                v_u_592.Parent = workspace
                task.spawn(function()
                    local v596 = 0
                    local v597 = 0
                    while v596 < 1 and v_u_592:IsDescendantOf(workspace) do
                        v596 = v596 + 1 / v_u_595 * v597
                        v_u_592:PivotTo(v_u_593:Lerp(v_u_594, v_u_13:GetValue(v596, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)))
                        v597 = task.wait()
                    end
                    if v_u_592:IsDescendantOf(workspace) then
                        v_u_592:Destroy()
                    end
                end)
            end
        end
    },
    ["mop"] = v2.GRAB_ITEM("roleplay", "mop", 1),
    ["broom"] = v2.GRAB_ITEM("roleplay", "broom", 1),
    ["pizza_shop_menu"] = v2.GRAB_ITEM("roleplay", "pizza_shop_menu", 4),
    ["waiters_notepad"] = v2.GRAB_ITEM("roleplay", "waiters_notepad", 1),
    ["pizza_shop_plate_stack"] = {
        ["items_to_acquire"] = { "pizza_shop_empty_plate" },
        ["use_text"] = function()
            local v598 = v_u_1("PizzaShopHelper").get_equipped_pizza_item()
            if v598 then
                local v599 = v598.properties.pizza
                if v599.state == "Cooked" then
                    if not v599.plated then
                        if not v599.boxed then
                            return "Plate Pizza"
                        end
                    end
                else
                    return
                end
            else
                return "Get Plate"
            end
        end,
        ["server_use"] = function(p600)
            local v601 = v_u_1("DataM")
            local v602 = v_u_1("PizzaShopHelper")
            local v603 = v_u_1("SoundPlayer")
            local v604 = v602.get_equipped_pizza_item(p600)
            if v604 then
                local v605 = v604.properties.pizza
                if v605.state == "Cooked" then
                    if v605.plated then
                        return
                    elseif not v605.boxed then
                        v605.plated = true
                        v604:destroy()
                        v602.give_pizza_item(p600, v605)
                        local v606 = v603.FX
                        local v607 = "Roleplay/PlateSound"
                        local v608 = p600.Character
                        if v608 then
                            v608 = p600.Character.PrimaryPart
                        end
                        v606:play(v607, v608)
                    end
                else
                    return
                end
            else
                local v609 = v601.get_store(p600)
                local v610
                if v609 then
                    v610 = v609:get("inventory")
                else
                    v610 = v609
                end
                if v609 then
                    v609 = v609:get("equip_manager")
                end
                if not (v610 and v609) then
                    return nil
                end
                local v611 = v_u_6.roleplay.pizza_shop_empty_plate
                v609:equip(v610:get_items_with_id(v611.id)[1] or v610:add_item(v611))
                local v612 = v603.FX
                local v613 = "Roleplay/PlateSound"
                local v614 = p600.Character
                if v614 then
                    v614 = p600.Character.PrimaryPart
                end
                v612:play(v613, v614)
                return
            end
        end
    },
    ["pizza_shop_box_stack"] = {
        ["items_to_acquire"] = { "pizza_shop_empty_box" },
        ["use_text"] = function()
            local v615 = v_u_1("PizzaShopHelper").get_equipped_pizza_item()
            if v615 then
                local v616 = v615.properties.pizza
                if v616.state == "Cooked" then
                    if not v616.boxed then
                        if not v616.plated then
                            return "Box Pizza"
                        end
                    end
                else
                    return
                end
            else
                return "Get Empty Box"
            end
        end,
        ["server_use"] = function(p617)
            local v618 = v_u_1("DataM")
            local v619 = v_u_1("PizzaShopHelper")
            local v620 = v_u_1("SoundPlayer")
            local v621 = v619.get_equipped_pizza_item(p617)
            if v621 then
                local v622 = v621.properties.pizza
                if v622.state == "Cooked" then
                    if v622.boxed then
                        return
                    elseif not v622.plated then
                        v622.boxed = true
                        v621:destroy()
                        v619.give_pizza_item(p617, v622)
                        local v623 = v620.FX
                        local v624 = "Roleplay/BoxSound"
                        local v625 = p617.Character
                        if v625 then
                            v625 = p617.Character.PrimaryPart
                        end
                        v623:play(v624, v625)
                    end
                else
                    return
                end
            else
                local v626 = v618.get_store(p617)
                local v627
                if v626 then
                    v627 = v626:get("inventory")
                else
                    v627 = v626
                end
                if v626 then
                    v626 = v626:get("equip_manager")
                end
                if not (v627 and v626) then
                    return nil
                end
                local v628 = v_u_6.roleplay.pizza_shop_empty_box
                v626:equip(v627:get_items_with_id(v628.id)[1] or v627:add_item(v628))
                local v629 = v620.FX
                local v630 = "Roleplay/BoxSound"
                local v631 = p617.Character
                if v631 then
                    v631 = p617.Character.PrimaryPart
                end
                v629:play(v630, v631)
                return
            end
        end
    },
    ["pizza_shop_coaster"] = {
        ["use_text"] = function(p632)
            local v633 = v_u_1("PizzaShopHelper")
            if p632.drink then
                return "Take Drink"
            end
            for _, v634 in { "soda_fountain_soda", "soda_fountain_water" } do
                if v633.get_item("food", v634) then
                    return "Put Down Drink"
                end
            end
            return nil
        end,
        ["server_use"] = function(p635, p636)
            local v637 = v_u_1("DataM").get_store(p635)
            local v638
            if v637 then
                v638 = v637:get("inventory")
            else
                v638 = v637
            end
            if v637 then
                v637 = v637:get("equip_manager")
            end
            if v638 and v637 then
                if p636.drink then
                    local v639 = v638:add_item(v_u_6.food[p636.drink.kind])
                    v639:set_uses_left(p636.drink.uses_left)
                    v637:equip(v639)
                    p636.drink = nil
                    return
                else
                    local v640 = nil
                    for _, v641 in { "soda_fountain_soda", "soda_fountain_water" } do
                        v640 = v638:get_items_with_id(v_u_6.food[v641].id)[1]
                        if v640 then
                            break
                        end
                    end
                    if v640 then
                        p636.drink = {
                            ["kind"] = v640.entry.kind,
                            ["uses_left"] = v640:get_uses_left()
                        }
                        v640:destroy()
                    end
                end
            else
                return
            end
        end,
        ["post_render"] = function(p_u_642, p_u_643)
            local v_u_644 = v_u_1("DownloadClient")
            if p_u_642.drink then
                p_u_643.PlacementBlock.Sound:Play()
                task.spawn(function()
                    local v645 = v_u_6.food[p_u_642.drink.kind]
                    if v645 then
                        v645 = v645.model_handle
                    end
                    if v645 then
                        v645 = v_u_644.promise_download_copy("Holdables", v645):expect()
                    end
                    if v645 then
                        if p_u_643:IsDescendantOf(workspace) then
                            for _, v646 in v645:GetDescendants() do
                                if v646:IsA("BasePart") then
                                    v646.Anchored = true
                                    if v646.Name == "RightMount" then
                                        v646:Destroy()
                                    end
                                end
                            end
                            local v647, v648 = v645:GetBoundingBox()
                            local v649 = v645:GetPivot():ToObjectSpace(v647)
                            v645:PivotTo(p_u_643.PlacementBlock.CFrame * CFrame.new(0, 0.5 + v648.Y / 2, 0) * v649:Inverse())
                            v645.Parent = p_u_643
                        end
                    else
                        return
                    end
                end)
            end
        end
    },
    ["pizza_shop_placemat"] = {
        ["items_to_acquire"] = { "pizza_shop_dirty_plates" },
        ["init"] = function(p650)
            p650.state = "Empty"
        end,
        ["use_text"] = function(p651)
            local v652 = v_u_1("PizzaShopHelper")
            if p651.state == "Empty" then
                local v653 = v652.get_any_pizza_item()
                if v653 then
                    if v653.properties.pizza.plated then
                        return "Put Down Pizza"
                    end
                end
            elseif p651.state == "Occupied" then
                return "Pick Up Pizza"
            elseif p651.state == "Dirty" then
                if v652.works_here() then
                    return "Clean Up Placemat"
                else
                    local v654 = v652.get_any_pizza_item()
                    if v654 then
                        local v655 = v654.properties.pizza
                        if not (v655.plated or v655.boxed) then
                            return "Put Down Pizza"
                        end
                    end
                end
            else
                return
            end
        end,
        ["server_use"] = function(p656, p657)
            local v658 = v_u_1("PizzaShopHelper")
            local v659 = v_u_1("DataM")
            if p657.state == "Empty" then
                local v660 = v658.get_any_pizza_item(p656)
                if v660 then
                    local v661 = v660.properties.pizza
                    if v661.plated then
                        v661.plated = false
                        p657.pizza = v661
                        p657.state = "Occupied"
                        v660:destroy()
                    end
                else
                    return
                end
            elseif p657.state == "Occupied" then
                local v662 = p657.pizza
                v658.give_pizza_item(p656, v662)
                p657.pizza = nil
                p657.state = "Dirty"
            elseif p657.state == "Dirty" then
                if v658.works_here(p656) then
                    local v663 = v659.get_store(p656)
                    local v664
                    if v663 then
                        v664 = v663:get("inventory")
                    else
                        v664 = v663
                    end
                    if v663 then
                        v663 = v663:get("equip_manager")
                    end
                    if v664 and v663 then
                        local v665 = v_u_6.roleplay.pizza_shop_dirty_plates
                        local v666 = v664:get_items_with_id(v665.id)[1]
                        if v666 then
                            local v667 = v666.properties
                            v667.count = v667.count + 1
                        else
                            v666 = v664:add_item(v665, {
                                ["count"] = 1
                            })
                        end
                        v663:equip(v666)
                        v666:mark_updated()
                        v666:server_render()
                        p657.state = "Empty"
                    end
                end
                local v668 = v658.get_any_pizza_item(p656)
                if not v668 then
                    return
                end
                local v669 = v668.properties.pizza
                if v669.plated or v669.boxed then
                    return
                end
                p657.pizza = v669
                p657.state = "Occupied"
                v668:destroy()
            end
        end,
        ["post_render"] = function(p_u_670, p_u_671)
            local v_u_672 = v_u_1("PizzaRenderHelper")
            if p_u_670.state == "Empty" then
                p_u_671.Plate:Destroy()
                p_u_671.Dough:Destroy()
                return
            elseif p_u_670.state == "Occupied" then
                p_u_671.PlacementBlock.Sound:Play()
                local v_u_673 = p_u_671.Dough.CFrame
                p_u_671.Dough:Destroy()
                task.spawn(function()
                    local v674 = v_u_672.get_model_async()
                    if p_u_671:IsDescendantOf(workspace) then
                        v_u_672.render_for_furniture(v674, p_u_670.pizza)
                        v674.PrimaryPart = v674.Cooked.Dough
                        v674:SetPrimaryPartCFrame(v_u_673)
                        v674.Parent = p_u_671
                    end
                end)
            elseif p_u_670.state == "Dirty" then
                p_u_671.Dough:Destroy()
            end
        end
    },
    ["pizza_shop_sink"] = {
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = function()
            local _, v675 = v_u_1("PizzaShopHelper").get_sink_preferred_item_and_use_text()
            return v675
        end,
        ["client_get_data_for_server_use"] = function(_, _, p676)
            if v_u_1("PizzaShopHelper").get_sink_preferred_item_and_use_text() then
                p676.EmitterPart.Emitter:Emit(16)
                p676.EmitterPart.Sound:Play()
            end
            return true
        end,
        ["server_use"] = function(p677)
            local v678, _ = v_u_1("PizzaShopHelper").get_sink_preferred_item_and_use_text(p677)
            if v678 then
                v678:destroy()
            end
        end
    },
    ["soda_fountain_2"] = {
        ["interaction_tags"] = {
            ["Soda"] = "food:soda_fountain_soda",
            ["Water"] = "food:soda_fountain_water"
        },
        ["items_to_acquire"] = { "soda_fountain_soda", "soda_fountain_water" },
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = function(_, _, p679)
            return string.format("ui.get_drink [%s]", p679.Name)
        end,
        ["client_get_data_for_server_use"] = function(_, _, p680)
            p680.PlacementBlock.Sound:Play()
            return true
        end,
        ["server_use"] = function(p681, _, _, _, _, _, p682)
            local v683 = v_u_1("DataM").get_store(p681)
            local v684
            if v683 then
                v684 = v683:get("inventory")
            else
                v684 = v683
            end
            if v683 then
                v683 = v683:get("equip_manager")
            end
            if v684 and v683 then
                for _, v685 in { "soda_fountain_water", "soda_fountain_soda" } do
                    for _, v686 in v684:get_items_with_id(v_u_6.food[v685].id) do
                        v686:destroy()
                    end
                end
                local v687
                if p682 == "Water" then
                    v687 = "soda_fountain_water"
                else
                    if p682 ~= "Soda" then
                        return
                    end
                    v687 = "soda_fountain_soda"
                end
                local v688 = v_u_6.food[v687]
                if v688 then
                    v683:equip((v684:add_item(v688)))
                end
            else
                return
            end
        end
    },
    ["camping_shower"] = v2.CAMPING_SHOWER(),
    ["manager_pc"] = v2.SCREEN("manager_pc"),
    ["bonus_stack"] = v2.GRAB_ITEM("roleplay", "employee_bonuses", 1),
    ["camera_peek"] = v2.CAMERA_PEEK,
    ["camera_peek_2"] = v2.CAMERA_PEEK,
    ["pizza_shop_pay_door"] = {
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["use_text"] = function()
            return nil
        end,
        ["render"] = function(_, p689, _, _, p_u_690)
            local v_u_691 = false
            p689.TouchPart.Touched:Connect(function(p692)
                if not v_u_691 then
                    if p692:IsDescendantOf(v_u_10.LocalPlayer.Character) then
                        v_u_691 = true
                        task.delay(1, function()
                            v_u_691 = false
                        end)
                        p_u_690:activate_async()
                    end
                end
            end)
        end,
        ["server_use"] = function(p693)
            local v694 = v_u_1("PizzaShopHelper")
            local v695 = v_u_1("PizzaShop")
            local v696 = v694.get_any_pizza_item(p693)
            if v696 then
                local v697 = table.clone(v696.properties.pizza)
                v695.attribute_step_to_player(v697, "deliver_pizza", p693)
                v694.deliver_pizza_for_pay(p693, v697)
                v696.properties.pizza = v697
            end
        end
    },
    ["candy_2022_lollipop_lamp"] = v2.LIGHT("candy_2022_lollipop_lamp"),
    ["influencer_2022_neon_light_strip"] = v2.COLORABLE_LIGHT("influencer_2022_neon_light_strip", {
        ["default_color"] = Color3.fromRGB(180, 128, 255)
    }),
    ["rain_2023_captain_fluffy"] = v2.NPC_SIMPLE("rain_2023_captain_fluffy"),
    ["neanderthal_2022_shower"] = v2.GENERIC_SHOWER(),
    ["winter_2022_ice_light"] = v2.LIGHT("winter_2022_ice_light"),
    ["farm_2023_windmill_light"] = v2.LIGHT("farm_2023_windmill_light"),
    ["lny_2023_placeable_lantern"] = v2.LIGHT("lny_2023_placeable_lantern"),
    ["meme_2023_inflated_trampoline"] = {
        ["render"] = function(_, p698)
            v_u_1("Trampoline").hook_up_trampoline(p698.TrampolinePart, {
                ["upwards_velocity"] = 50,
                ["time_length"] = 0.1,
                ["upper_height_cutoff"] = 3
            })
        end
    },
    ["meme_2023_bouncy_ball"] = {
        ["render"] = function(_, p699)
            v_u_1("Trampoline").hook_up_trampoline(p699.TrampolinePart, {
                ["upwards_velocity"] = 50,
                ["time_length"] = 0.1,
                ["upper_height_cutoff"] = 3
            })
        end
    },
    ["meme_2023_inflated_conveyor_belt"] = {
        ["render"] = function(_, p700)
            local v701 = p700.ConveyorPart
            v701.Velocity = v701.CFrame.LookVector * 8
        end
    },
    ["meme_2023_padded_punchy"] = {
        ["post_render"] = function(_, p_u_702)
            local v_u_703 = v_u_1("Trampoline")
            local v_u_704 = {}
            local v_u_705 = {}
            local v_u_706 = false
            p_u_702.Hitbox.Touched:Connect(function(p707)
                if v_u_703.has_ownership(p707) then
                    local v_u_708 = p707:FindFirstAncestorOfClass("Model")
                    if v_u_704[v_u_708] then
                        v_u_705[v_u_708] = os.clock()
                    elseif v_u_706 and (v_u_708 and v_u_708.PrimaryPart) then
                        v_u_704[v_u_708] = true
                        v_u_705[v_u_708] = os.clock()
                        local v_u_709 = v_u_708.PrimaryPart
                        local v_u_710 = p_u_702.Hitbox.CFrame.LookVector
                        local v_u_711 = nil
                        v_u_711 = v_u_11.Stepped:Connect(function()
                            v_u_709.AssemblyLinearVelocity = v_u_710 * 80 + Vector3.new(0, 8, 0)
                            if os.clock() - v_u_705[v_u_708] > 0.1 then
                                v_u_705[v_u_708] = nil
                                v_u_711:Disconnect()
                            end
                        end)
                    end
                else
                    return
                end
            end)
            local v712 = p_u_702.AnimationController:LoadAnimation(v_u_4.get_track("Meme2023PaddedPunchy"))
            v712:GetMarkerReachedSignal("IsPushing"):Connect(function(p713)
                v_u_706 = tonumber(p713) == 1
                table.clear(v_u_704)
            end)
            v712:Play()
        end
    },
    ["pool_2023_hottub_button"] = v2.LIGHT_WITH_PARTICLES(),
    ["pool_2023_water_spout"] = v2.TOGGLEABLE_EFFECTS(),
    ["paint_sealer_npc"] = v2.PAINT_SEALER("paint_sealer_npc", {
        ["idle_anim"] = "SEAsia2023BlackMacaqueSit",
        ["talking_to_anim"] = "SEAsia2023BlackMacaqueSit"
    }),
    ["hospital_refresh_2023_light"] = v2.LIGHT("hospital_refresh_2023_light"),
    ["hospital_refresh_2023_door"] = v2.INTERIOR_DOOR(),
    ["hospital_refresh_2023_double_door"] = v2.INTERIOR_DOOR({
        ["double_door"] = true
    }),
    ["hospital_refresh_2023_healing_bed"] = v2.BASIC_FURNITURE({
        ["use_text"] = "Sit To Heal",
        ["animation"] = "LayInBed",
        ["ailment_to_boost"] = { "sick", v_u_5.full_sleep_duration }
    }),
    ["hospital_refresh_2023_ceiling_light"] = v2.COLORABLE_LIGHT("hospital_refresh_2023_ceiling_light", {
        ["default_color"] = Color3.fromRGB(223, 105, 84)
    }),
    ["hospital_refresh_2023_logo"] = v2.COLORABLE_LIGHT("hospital_refresh_2023_logo", {
        ["default_color"] = Color3.fromRGB(37, 255, 99)
    }),
    ["hospital_refresh_2023_tvpillar"] = v2.SCREEN("hospital_refresh_2023_tvpillar"),
    ["hospital_refresh_2023_blinds"] = v2.BLINDS("hospital_refresh_2023_blinds"),
    ["school_refresh_2023_door"] = v2.INTERIOR_DOOR(),
    ["school_refresh_2023_double_door"] = v2.INTERIOR_DOOR({
        ["double_door"] = true
    }),
    ["school_refresh_2023_monitor"] = v2.SCREEN("school_refresh_2023_monitor", {
        ["on_color"] = Color3.fromRGB(76, 98, 177)
    }),
    ["school_refresh_2023_laptop"] = v2.SCREEN("school_refresh_2023_laptop"),
    ["school_refresh_2023_short_blinds"] = v2.BLINDS("school_refresh_2023_short_blinds"),
    ["school_refresh_2023_chalkboard"] = v2.DRAWING_BOARD("2+2=4"),
    ["school_refresh_2023_chalkboard_blue"] = v2.DRAWING_BOARD("Sit\nPaw\nRoll"),
    ["display_stands_2023_pet_display"] = v2.DISPLAY_STAND("pet"),
    ["display_stands_2023_vehicle_display"] = v2.DISPLAY_STAND("vehicle"),
    ["display_stands_2023_holdables_display"] = v2.DISPLAY_STAND("holdable"),
    ["display_stands_2023_stroller_display"] = v2.DISPLAY_STAND("stroller"),
    ["display_stands_2023_accessory_display"] = v2.DISPLAY_STAND("pet_accessory"),
    ["expandable_houses_2023_luxury_cinema_screen"] = v2.SCREEN("expandable_houses_2023_luxury_cinema_screen", {
        ["on_color"] = Color3.fromRGB(107, 126, 179)
    }),
    ["expandable_houses_2023_luxury_spa_shower"] = v2.SHOWER_WITH_FADING_DOOR(),
    ["expandable_houses_2023_luxury_ceiling_lights"] = v2.LIGHT(),
    ["expandable_houses_2023_luxury_ceiling_light"] = v2.LIGHT(),
    ["expandable_houses_2023_luxury_wall_light"] = v2.LIGHT(),
    ["expandable_houses_2023_hillside_spiral_ceiling_light"] = v2.LIGHT(),
    ["lures_2023_castle_tim_1"] = v2.NPC_SIMPLE("lures_2023_castle_tim_1"),
    ["lures_2023_castle_tim_2"] = v2.NPC_SIMPLE("lures_2023_castle_tim_2"),
    ["lures_2023_castle_tim_3"] = v2.NPC_SIMPLE("lures_2023_castle_tim_3"),
    ["lures_2023_castle_tim_4"] = v2.NPC_SIMPLE("lures_2023_castle_tim_4"),
    ["lures_2023_castle_tim_5"] = v2.NPC_SIMPLE("lures_2023_castle_tim_5"),
    ["lures_2023_castle_tim_6"] = v2.NPC_SIMPLE("lures_2023_castle_tim_6"),
    ["lures_2023_castle_tim_7"] = v2.NPC_SIMPLE("lures_2023_castle_tim_7"),
    ["lures_2023_castle_tim_8"] = v2.NPC_SIMPLE("lures_2023_castle_tim_8"),
    ["lures_2023_castle_tim_9"] = v2.NPC_SIMPLE("lures_2023_castle_tim_9"),
    ["lures_2023_castle_tim_10"] = v2.NPC_SIMPLE("lures_2023_castle_tim_10"),
    ["lures_2023_castle_tim_11"] = v2.NPC_SIMPLE("lures_2023_castle_tim_11"),
    ["lures_2023_castle_tim_12"] = v2.NPC_SIMPLE("lures_2023_castle_tim_12"),
    ["lures_2023_castle_tim_13"] = v2.NPC_SIMPLE("lures_2023_castle_tim_13"),
    ["lures_2023_normal_lure"] = v2.LURE("BasicLure", function(p714)
        local v715 = p714.OpenModel
        local v716 = p714.ClosedModel
        v715:Destroy()
        for _, v717 in v716:GetDescendants() do
            if v717:IsA("BasePart") then
                v717.Transparency = 0
                v717.CanCollide = true
            end
        end
    end),
    ["lures_2023_cozy_home_lure"] = v2.LURE("PremiumLure", function(p718)
        local v719 = p718.WindowGlass
        v719.Color = Color3.fromRGB(218, 115, 90)
        v719.Material = Enum.Material.Neon
        p718.Front:PivotTo(p718.ClosedFrontPivotPart:GetPivot())
    end),
    ["themed_servers_teleporter"] = {
        ["post_render"] = function(_, p_u_720)
            local v_u_721 = v_u_1("RouterClient")
            local v_u_722 = p_u_720.Parent
            p_u_720.PlacementBlock.Billboard.Label.Text = "Aging Zone (AFK)"
            p_u_720.Parent = nil
            task.spawn(function()
                local v723 = v_u_721.get("ThemedServersAPI/GetGroup"):InvokeServer()
                if v723 and (v723 ~= "nonparticipating" and v723 ~= "control") then
                    p_u_720.Parent = v_u_722
                else
                    p_u_720:Destroy()
                end
            end)
        end,
        ["use_text"] = function(_)
            return "Teleport to AFK Zone"
        end,
        ["client_use"] = function()
            local v724 = v_u_1("RouterClient")
            local v725 = v_u_1("UIManager")
            if v725.apps.DialogApp:dialog({
                ["text"] = "This will teleport you to a different server. Are you sure?",
                ["left"] = "Cancel",
                ["right"] = "Okay"
            }) == "Okay" then
                v724.get("ThemedServersAPI/RequestTeleport"):FireServer("afk", false)
                v725.set_app_visibility("ThemedServersApp", true)
                v725.apps.ThemedServersApp:show_teleport_message()
            end
        end
    },
    ["afk_return_teleporter"] = {
        ["interaction_tag"] = "afk_return_teleporter",
        ["post_render"] = function(_, p726)
            p726.PlacementBlock.Billboard.Label.Text = "Exit"
        end,
        ["use_text"] = function(_)
            return "Exit Aging Zone (AFK)"
        end,
        ["client_use"] = function()
            if v_u_1("UIManager").apps.DialogApp:dialog({
                ["text"] = "This will return you to regular Adopt Me! Are you sure?",
                ["left"] = "Cancel",
                ["right"] = "Okay"
            }) == "Okay" then
                v_u_1("AFKZoneInterior").force_exit()
            end
        end
    }
}
for _, v_u_728 in v_u_6.pets do
    if v_u_728.generate_npc_furniture_on_runtime and not v727[v_u_728.kind] then
        local v729 = v_u_728.gamepass_id or v_u_728.kind
        local v730
        if v3[v729] or v7[v729] then
            v730 = v2.GAMEPASS_PET
        elseif v_u_728.cost then
            v730 = v2.CURRENCY_PET
        else
            v730 = v2.IDLE_PET
        end
        local v731 = v730(v_u_728.kind, {
            ["idle_anim"] = v_u_728.anims.pedestal_idle or v_u_728.anims.idle,
            ["talking_to_anim"] = v_u_728.anims.pedestal_idle or v_u_728.anims.idle,
            ["gamepass_id"] = v729
        })
        if v_u_728.pre_equipped_removable_accessories then
            local v_u_732 = v731.post_render or function() end
            function v731.post_render(p733, p_u_734, p735, p736, p_u_737)
                v_u_732(p733, p_u_734, p735, p736, p_u_737)
                local v_u_738 = v_u_1("PetAccessoryEquipHelper")
                local v739 = v_u_1("DownloadClient")
                p_u_737.accessory_download_promises = {}
                p_u_737.accessory_cleanup_callbacks = {}
                for _, v740 in v_u_728.pre_equipped_removable_accessories do
                    local v_u_741 = v_u_6.pet_accessories[v740]
                    if not v_u_741 then
                        error("Accessory entry not found for kind: " .. v740)
                    end
                    local v746 = v739.promise_download_copy("PetAvatarResources", v_u_741.model_handle):andThen(function(p742)
                        local v743 = v_u_738.equip_accessory({
                            ["pet_model"] = p_u_734.NPC,
                            ["accessory_base_asset"] = p742,
                            ["accessory_item_entry"] = v_u_741
                        })
                        local v744 = p_u_737.accessory_cleanup_callbacks
                        local v745 = v743.unequip
                        table.insert(v744, v745)
                    end)
                    local v747 = p_u_737.accessory_download_promises
                    table.insert(v747, v746)
                end
            end
            local v_u_748 = v731.unrender or function() end
            function v731.unrender(p749, p750, p751, p752)
                v_u_748(p749, p750, p751, p752)
                for _, v753 in p752.accessory_download_promises do
                    v753:cancel()
                end
                for _, v754 in p752.accessory_cleanup_callbacks do
                    v754()
                end
                p752.accessory_cleanup_callbacks = nil
            end
        end
        v727[v_u_728.kind] = v731
    end
end
return v727