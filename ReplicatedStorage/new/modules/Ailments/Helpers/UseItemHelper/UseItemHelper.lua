--// ReplicatedStorage.new.modules.Ailments.Helpers.UseItemHelper (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_2 = v_u_1("ClientToolManager")
local v_u_3 = v_u_1("InventoryDB")
local v_u_4 = v_u_1("RouterClient")
local v_u_5 = {
    ["ChewToyTool"] = true,
    ["FlyingDiscTool"] = true,
    ["ThrowToyTool"] = true,
    ["SqueakyToyTool"] = true
}
local v6 = {}
local v_u_27 = {
    ["food"] = function(_, p7)
        v_u_1("UIManager").apps.FocusPetApp:feed_pet(p7)
    end,
    ["toys"] = function(p_u_8, p_u_9)
        local v_u_10 = v_u_1("UIManager")
        local v_u_11 = v_u_3[p_u_9.category][p_u_9.kind]
        if v_u_11.tool == "CleanPetTool" then
            task.defer(function()
                local v12 = v_u_10.apps.FocusPetApp.petting_handler
                v12:show_example()
                v12:start_petting("dirty")
            end)
        else
            local function v_u_13(_)
                if v_u_11.tool == "PetLeash" then
                    v_u_4.get("PetAPI/EquipPetLeash"):InvokeServer(p_u_9.unique, p_u_8.char)
                elseif v_u_5[v_u_11.tool] then
                    v_u_10.set_app_visibility("ScreenTapApp", true)
                end
            end
            local v_u_14 = nil
            task.defer(function()
                local v15 = v_u_1("UIManager")
                v15.apps.FocusPetApp:release_focus()
                local v16 = v_u_2.is_kind_equipped(p_u_9)
                if (v16 and true or v_u_2.backpack_equip(p_u_9, v_u_14)) and v_u_13 then
                    v_u_13(v15.apps.ToolApp.active_tools[p_u_9.unique], v16)
                end
            end)
        end
    end,
    ["strollers"] = function(p_u_17, p_u_18)
        local function v_u_23(p19, p20)
            if p19 and p20 then
                local v21 = p19.tool.ModelHandle.TouchToSits:GetChildren()
                for _, v_u_22 in ipairs(v21) do
                    if not (v_u_22:FindFirstChild("SitPos") or v_u_22):FindFirstChild("SeatWeld") then
                        task.spawn(function()
                            v_u_4.get("AdoptAPI/UseStroller"):InvokeServer(game.Players.LocalPlayer, p_u_17.char, v_u_22)
                        end)
                        return
                    end
                end
            end
        end
        local v_u_24 = {
            ["chars_to_sit"] = { p_u_17 }
        }
        task.defer(function()
            local v25 = v_u_1("UIManager")
            v25.apps.FocusPetApp:release_focus()
            local v26 = v_u_2.is_kind_equipped(p_u_18)
            if (v26 and true or v_u_2.backpack_equip(p_u_18, v_u_24)) and v_u_23 then
                v_u_23(v25.apps.ToolApp.active_tools[p_u_18.unique], v26)
            end
        end)
    end
}
function v6.use_item(p28, p_u_29)
    local v30 = v_u_27[p_u_29.category]
    if v30 then
        v30(p28, p_u_29)
    else
        local v_u_31 = nil
        local v_u_32 = nil
        task.defer(function()
            local v33 = v_u_1("UIManager")
            v33.apps.FocusPetApp:release_focus()
            local v34 = v_u_2.is_kind_equipped(p_u_29)
            if (v34 and true or v_u_2.backpack_equip(p_u_29, v_u_31)) and v_u_32 then
                v_u_32(v33.apps.ToolApp.active_tools[p_u_29.unique], v34)
            end
        end)
    end
end
return v6