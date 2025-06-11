--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local function v_u_6(p2)
    local v3 = v_u_1("PetActions")
    local v4 = v_u_1("UIManager")
    v3.focus(p2)
    if v4.apps.FocusPetApp.char_wrapper == p2 then
        local v5 = v4.apps.FocusPetApp.petting_handler
        v5:show_example()
        v5:start_petting("dirty")
    end
end
local v13 = {
    ["CleanPetTool"] = {
        ["client_use"] = function(_, _, _)
            local v_u_7 = v_u_1("new:AilmentsClient")
            local v_u_8 = v_u_1("PetActions")
            local v9 = v_u_1("ToolDBHelper")
            local v_u_10 = v_u_1("UIManager")
            v9.choose_pet_and_then(function(p11)
                local v12
                if v_u_7.get_ailments_for_pet(p11).dirty == nil then
                    v12 = false
                else
                    v12 = v_u_8.can_focus_pet(p11.char)
                end
                if v12 then
                    v_u_6(p11)
                else
                    v_u_10.apps.HintApp:hint({
                        ["text"] = "You can\'t do that right now!",
                        ["overridable"] = true,
                        ["length"] = 2.5,
                        ["yields"] = false
                    })
                end
            end)
        end
    }
}
return v13