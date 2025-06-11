--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.MannequinUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("FurnitureMannequinsHelper")
local v_u_3 = v_u_1("HouseTradeUseHelper")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = game:GetService("RunService")
local function v_u_19(p6, p_u_7)
    local v8 = v_u_5
    assert(v8:IsClient())
    local v9 = v_u_1("InteractionsEngine")
    local v10 = v_u_1("UIManager")
    local v_u_11 = nil
    local v18 = v9:register({
        ["text"] = "",
        ["part"] = p6,
        ["on_selected"] = function()
            local v12 = {}
            local v13 = {
                ["text"] = "View All",
                ["on_selected"] = function()
                    v_u_11 = "view_all"
                end
            }
            table.insert(v12, v13)
            local v14 = {
                ["text"] = "Wear Outfit",
                ["on_selected"] = function()
                    v_u_11 = "wear_outfit"
                end
            }
            table.insert(v12, v14)
            local v15 = {
                ["text"] = "Set Outfit",
                ["on_selected"] = function()
                    v_u_11 = "set_outfit"
                end
            }
            table.insert(v12, v15)
            local v16 = {
                ["text"] = "Set Price",
                ["on_selected"] = function()
                    v_u_11 = "set_price"
                end
            }
            table.insert(v12, v16)
            if p_u_7.for_sale then
                local v17 = {
                    ["text"] = "Take Off Sale",
                    ["on_selected"] = function()
                        v_u_11 = "set_off_sale"
                    end
                }
                table.insert(v12, v17)
            end
            return v12
        end
    })
    v10.apps.InteractionsApp:call_on_selected(v18)
    v18:destroy()
    return v_u_11
end
local v61 = {
    ["mannequin"] = {
        ["use_permissions"] = "EVERYONE",
        ["dont_automatically_mark_furniture_change_after_use"] = true,
        ["hide_interaction_when_listed_for_trade"] = true,
        ["caregiver_assist"] = false,
        ["team_whitelist"] = { "Parents", "Babies" },
        ["use_text"] = function(_, _, _, p20)
            return game.Players.LocalPlayer == p20:get_house_owner() and "Use" or "View"
        end,
        ["init"] = function(p_u_21, p_u_22, _, p23)
            local v24 = v_u_1("DefaultRobloxAppearance")
            p_u_21.outfit = p_u_21.outfit or v24.get_default_outfit()
            p_u_21.outfit_name = p_u_21.outfit_name or "Outfit"
            p_u_21.outfit_version = p_u_21.outfit_version or v_u_4:GenerateGUID(false)
            p_u_21.price = p_u_21.price or 0
            p_u_21.for_sale = p_u_21.for_sale or false
            if p_u_21.price > 100 then
                p_u_21.price = 100
                p_u_21.for_sale = false
            end
            if v_u_2.outfit_has_exclusive_content(p_u_21.outfit) then
                p_u_21.for_sale = false
                v_u_1("AvatarItemBlacklist").filter_promise(p23, p_u_21.outfit.assets, "mannequin"):andThen(function(p25)
                    if p25 then
                        p_u_21.outfit.assets = p25
                        p_u_22()
                    end
                end)
            end
        end,
        ["client_get_data_for_server_use"] = function(p26, p27, p28, p29, p30)
            local v31 = p28:FindFirstChild("Mannequin")
            if v31 then
                local v32 = v_u_1("UIManager")
                if game.Players.LocalPlayer == p29 then
                    local v33 = v_u_19(p30, p26)
                    if v33 == "set_price" then
                        local v34, v35 = v_u_1("PolicyHelper").is_trading_prohibited(game.Players.LocalPlayer)
                        if v35 then
                            v32.apps.DialogApp:dialog({
                                ["text"] = v35,
                                ["button"] = "Okay"
                            })
                        end
                        if v34 then
                            return nil
                        end
                        if v_u_2.outfit_has_exclusive_content(p26.outfit) then
                            v32.apps.DialogApp:dialog({
                                ["text"] = "You can\'t sell this outfit! Try removing the exclusive items first.",
                                ["button"] = "Okay"
                            })
                            return nil
                        end
                        local v36, v37 = v32.apps.DialogApp:free_response_dialog({
                            ["text"] = ("Enter price of outfit (limit is $%d)"):format(100),
                            ["left"] = "Cancel",
                            ["right"] = "Set"
                        })
                        local v38 = tonumber(v37)
                        if v36 == "Set" then
                            if v38 then
                                return {
                                    ["set_price"] = true,
                                    ["price"] = v38
                                }
                            end
                            v32.apps.HintApp:hint({
                                ["text"] = "You can\'t set the price to that"
                            })
                        end
                    else
                        if v33 == "set_off_sale" then
                            return {
                                ["set_off_sale"] = true
                            }
                        end
                        if v33 == "set_outfit" then
                            local v39, v40 = v32.apps.AvatarEditorApp:edit_mannequin(v31, p26.outfit, p26.outfit_name):expect()
                            return {
                                ["save_outfit"] = v39,
                                ["outfit_name"] = v40
                            }
                        end
                        if v33 == "wear_outfit" then
                            v_u_2.prompt_wear_or_save_outfit(p29, p27, p26.outfit_version)
                        elseif v33 == "view_all" then
                            v_u_2.open_purchase_app(p27)
                        end
                    end
                else
                    v_u_2.open_purchase_app(p27)
                end
                return nil
            end
        end,
        ["server_use"] = function(p41, p42, p43, p44, p45)
            local v46 = p41 == p45
            assert(v46, "Only the house owner should reach a Mannequin\'s server_use function.")
            local v47 = v_u_1("AvatarAPI")
            local v48 = v_u_1("MsgBridge")
            local v49 = v47.StopEditingMannequin(p41)
            if p44.set_off_sale then
                p42.for_sale = false
                p43()
                v48.hint(p41, {
                    ["text"] = "The outfit was taken off sale."
                })
                return
            elseif p44.set_price then
                if v_u_2.outfit_has_exclusive_content(p42.outfit) then
                    return
                else
                    local v50 = p44.price
                    local v51 = math.floor(v50)
                    if v51 >= 0 and v51 <= 100 then
                        p42.price = v51
                        p42.for_sale = true
                        p43()
                        v48.hint(p41, {
                            ["text"] = ("Price was set to $%d!"):format(v51)
                        })
                    else
                        v48.hint(p41, {
                            ["text"] = "You can\'t set the price to that"
                        })
                    end
                end
            else
                if p44.save_outfit then
                    local v52
                    if v_u_2.get_outfit_hash(p42.outfit) == v_u_2.get_outfit_hash(v49) then
                        v52 = false
                    else
                        if p42.for_sale and v_u_2.outfit_has_exclusive_content(v49) then
                            v48.dialog(p41, {
                                ["text"] = "The outfit was taken off sale. You can\'t sell outfits with exclusive items!",
                                ["button"] = "Okay"
                            })
                            p42.for_sale = false
                        end
                        p42.outfit = v49
                        v52 = true
                    end
                    if p44.outfit_name ~= p42.outfit_name then
                        local v53 = p44.outfit_name
                        if string.len(v53) <= 45 then
                            p42.outfit_name = v_u_1("new:TextFilterHelperServer").filter_for_public_display(p44.outfit_name, p41)
                            v52 = true
                        end
                    end
                    if v52 then
                        p42.outfit_version = v_u_4:GenerateGUID(false)
                        p43()
                    end
                end
                return
            end
        end,
        ["post_render"] = function(p54, p55, p56, _, p57)
            local v58 = p55.Price
            if v_u_3.is_viewing_listed_house() then
                v58:Destroy()
                local v59 = p55:FindFirstChild("MannequinPlacementLocation")
                v_u_3.make_not_included_tag(v59)
            else
                local v60 = v58:FindFirstChild("TextLabel", true)
                if p54.for_sale then
                    if p54.price == 0 then
                        v60.Text = "FREE"
                    else
                        v60.Text = ("$%i"):format(p54.price)
                    end
                else
                    v58:Destroy()
                end
                v_u_2.create_mannequin(p54, p55, p56, p57)
            end
        end
    }
}
return v61