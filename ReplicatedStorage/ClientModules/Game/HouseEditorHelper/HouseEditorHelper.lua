--// ReplicatedStorage.ClientModules.Game.HouseEditorHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("ClientGamepassHelper")
local v_u_4 = v_u_1("ClientStore")
local v_u_5 = v_u_1("new:FurnitureEntryHelper")
local v_u_6 = v_u_1("HouseClient")
local v_u_7 = v_u_1("HouseDB")
local v_u_8 = v_u_1("PlatformM")
local v_u_9 = v_u_1("RouterClient")
local v_u_10 = v_u_1("ShopM")
local v11 = v_u_1("Signal")
local v_u_12 = v_u_1("UIManager")
local v_u_13 = game:GetService("Players")
local v_u_14 = v_u_8.get_platform()
local v_u_15 = v11.new()
local v_u_16 = v11.new()
local v_u_43 = {
    ["select_furniture_drawer_item"] = function(p17, p18)
        local v19 = p18 or {}
        if p17.gamepass then
            if not v_u_3.owns_gamepass(p17.gamepass) then
                v_u_12.apps.DialogApp:dialog({
                    ["product_id"] = p17.id,
                    ["dialog_type"] = "RobuxProductDialog"
                })
                return
            end
        else
            local v20 = v_u_5.get_cost(p17)
            if not v_u_43.pre_buy_auto(v20) then
                return
            end
        end
        if v19.xbox_deselect then
            v19.xbox_deselect()
        end
        if p17.id == "build_with_friends" then
            local v21 = v_u_6.get_current_house_coop()
            if v_u_6.get_current_house_owner() == v_u_13.LocalPlayer and (v21 and not v21.locked) then
                local v22 = v_u_2.get("house_interior")
                local v23 = false
                for _, v24 in v22 and v22.furniture or {} do
                    if v24.id == p17.id then
                        v23 = true
                        break
                    end
                end
                if not v23 then
                    v_u_9.get("HousingAPI/CoopSetLocked"):InvokeServer(true)
                end
            end
        end
        if v19.set_drawer and v_u_14 == v_u_8.platform.phone then
            v19.set_drawer(nil)
        end
        if p17.id == "moneytree" and not v_u_2.get("tree_purchased") then
            if v_u_12.apps.DialogApp:dialog({
                ["text"] = "You can collect up to 100 bucks per real life day for all money trees combined - this stops your trees from drying up!",
                ["left"] = "Cancel",
                ["right"] = "Buy"
            }) ~= "Buy" then
                return
            end
            v_u_2.update("tree_purchased", true)
        end
        local v25 = v_u_1("DownloadClient")
        local v26 = v_u_1("FurniturePlacer")
        local v27 = v25.download("Furniture", p17.model_name):Clone()
        local v28, v29 = v_u_12.apps.FurnitureSelectorApp.plane_lock_component:get_plane()
        if v28 then
            v28 = v29 and {
                ["origin"] = v28,
                ["normal"] = v29,
                ["allow_placement_below"] = true
            } or v29
        end
        local v30
        if v19.calculate_placement_on_floor then
            v30 = nil
        else
            v30 = v26.calculate_placement_from_mouse({
                ["house"] = workspace.HouseInteriors.blueprint:GetChildren()[1],
                ["furniture"] = v27,
                ["interval"] = 0.1,
                ["rotation"] = CFrame.new(),
                ["mouse_x"] = game.Players.LocalPlayer:GetMouse().ViewSizeX / 2,
                ["mouse_y"] = game.Players.LocalPlayer:GetMouse().ViewSizeY / 2,
                ["is_first_placement"] = true,
                ["plane_lock"] = v28
            })
        end
        local v31 = game.Players.LocalPlayer.Character
        if v31 then
            v31 = v31:FindFirstChild("HumanoidRootPart")
        end
        if not v30 and v31 then
            v30 = v26.calculate_placement_on_floor({
                ["house"] = workspace.HouseInteriors.blueprint:GetChildren()[1],
                ["furniture"] = v27,
                ["interval"] = 0.1,
                ["rotation"] = CFrame.new(),
                ["ray_position"] = v31.Position,
                ["is_first_placement"] = true,
                ["plane_lock"] = v28
            })
        end
        v27:Destroy()
        v25.release("Furniture", p17.model_name)
        if v30 then
            v_u_43.buy_furniture(true, {
                {
                    ["kind"] = p17.kind,
                    ["properties"] = {
                        ["cframe"] = v30
                    }
                }
            })
        else
            v_u_12.apps.DialogApp:dialog({
                ["text"] = "You can\'t place furniture here",
                ["button"] = "Okay"
            })
        end
    end,
    ["pre_buy_auto"] = function(p32)
        if v_u_6.get_current_house_owner() == game.Players.LocalPlayer then
            if not v_u_10.pre_buy(p32) then
                return false
            end
        else
            local v33 = v_u_6.get_current_house_coop()
            if not v33 then
                return false
            end
            if v33.budget < p32 then
                v_u_12.apps.HintApp:hint({
                    ["text"] = "Out of budget! Ask the owner for more!",
                    ["length"] = 5,
                    ["overridable"] = true,
                    ["yields"] = false
                })
                return false
            end
        end
        return true
    end,
    ["buy_furniture"] = function(p34, p35)
        local _, v36 = v_u_12.apps.FurnitureSelectorApp:buy_new_furnitures(p34, p35)
        local v37 = v36 and (not v36.success and v36.results)
        if v37 then
            v37 = v36.results[1]
        end
        if v37 then
            local v38 = nil
            local v39
            if v37.status == "NO_SPACE" then
                v39 = ("You\'ve reached your house\'s furniture limit (%d)"):format((v_u_7[v_u_4.store:getState().house_interior.building_type] or {}).max_furniture or -1)
            else
                v39 = (v37.status == "PER_FURNITURE_LIMIT_REACHED" or v37.status == "PER_TAG_LIMIT_REACHED") and "You can\'t place any more of these" or v38
            end
            if v39 then
                v_u_12.apps.DialogApp:dialog({
                    ["text"] = v39,
                    ["button"] = "Okay"
                })
            end
        end
    end,
    ["set_tutorial_data"] = function(p40, p41)
        local v42 = v_u_2.get("tutorial_data") or {}
        v42[p40] = p41
        v_u_2.update("tutorial_data", v42)
    end,
    ["get_enter_edit_signal"] = function()
        return v_u_15
    end,
    ["get_exit_edit_signal"] = function()
        return v_u_16
    end
}
return v_u_43