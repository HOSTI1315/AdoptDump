--// ReplicatedStorage.RoactComponents.Apps.HouseEditorApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClickTapInWorldExclusionList")
local v_u_3 = v1("ClientStore")
local v_u_4 = v1("FurnitureMultiSelect")
local v_u_5 = v1("FurnitureXRay")
local v_u_6 = v1("Raycast")
local v_u_7 = v1("Roact")
local v_u_8 = v1("RoactRodux")
local v_u_9 = v1("UIManager")
local v_u_10 = require(script.HouseEditorAppMain)
local v_u_11 = game:GetService("UserInputService")
return {
    ["init"] = function(p12)
        local function v_u_15()
            local v13 = { workspace.HouseInteriors.furniture }
            for _, v14 in workspace.HouseInteriors.blueprint:GetDescendants() do
                if v14:IsA("BasePart") and v14.CanCollide == true then
                    table.insert(v13, v14)
                end
            end
            return v13
        end
        local function v24()
            if v_u_9.apps.HouseEditorWrapperApp.visible then
                local v16 = v_u_3.store:getState()
                if v16.house_editor_state == "Edit" or v16.house_editor_state == "Toolbar" then
                    if not v_u_4.is_enabled() then
                        local v17
                        if v_u_5.is_enabled() then
                            v17 = v_u_6.mousecast(nil, nil, nil, { workspace.HouseInteriors.furniture }, {
                                ["ignore_non_cancollide"] = false,
                                ["ignore_transparent"] = false
                            })
                        else
                            v17 = v_u_6.mousecast(nil, nil, nil, v_u_15(), {
                                ["ignore_non_cancollide"] = false,
                                ["ignore_transparent"] = false
                            })
                        end
                        if not (v17 and v17:IsDescendantOf(workspace.HouseInteriors.furniture)) then
                            v17 = nil
                        end
                        if not v17 then
                            v_u_9.apps.FurnitureSelectorApp:deselect_all()
                            return "pass"
                        end
                        while v17.Parent ~= workspace.HouseInteriors.furniture do
                            v17 = v17.Parent
                        end
                        local v18 = v17:GetChildren()[1]
                        local v19 = v18:GetAttribute("furniture_unique")
                        local v20 = v16.house_interior
                        local v21 = v20.furniture[v19]
                        local v22 = v_u_9.apps.FurnitureSelectorApp
                        if v20.player == game.Players.LocalPlayer or v21.id ~= "build_with_friends" and v21.creator ~= nil then
                            if v22:get_flag("handle_mode") == "Default" or v22:get_primary_furniture_unique() ~= v19 then
                                local v23 = v_u_11:IsKeyDown(Enum.KeyCode.LeftControl) or v_u_11:IsKeyDown(Enum.KeyCode.RightControl) or (v_u_11:IsKeyDown(Enum.KeyCode.LeftMeta) or v_u_11:IsKeyDown(Enum.KeyCode.RightMeta))
                                if v22:is_selecting_multiple() and v22:is_furniture_selected(v19) then
                                    if v23 then
                                        v22:deselect_furniture(v19)
                                    else
                                        v22:select_primary_furniture(v19)
                                    end
                                else
                                    if not v23 then
                                        v22:deselect_all()
                                    end
                                    v22:select_furniture(v18, v21)
                                end
                            else
                                v22:start_drag_move()
                            end
                            return "sink"
                        end
                        v_u_9.apps.HintApp:hint({
                            ["text"] = "You\'re not allowed to select that!",
                            ["length"] = 4,
                            ["overridable"] = true,
                            ["yields"] = false
                        })
                        v22:deselect_all()
                    end
                else
                    return
                end
            else
                return
            end
        end
        v_u_2.register(10, v24)
        local v25 = v_u_7.createElement(v_u_8.StoreProvider, {
            ["store"] = p12
        }, {
            ["app"] = v_u_7.createElement(v_u_10)
        })
        v_u_7.mount(v25, game.Players.LocalPlayer:WaitForChild("PlayerGui"), "HouseEditorApp")
    end
}