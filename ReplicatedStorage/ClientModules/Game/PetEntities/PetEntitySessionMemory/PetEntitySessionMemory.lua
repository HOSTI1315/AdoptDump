--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySessionMemory (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")
local v_u_2 = game:GetService("Players")
local v_u_3 = {}
local v_u_4 = v1("PetEntityMemoryBank")
function v_u_4.get_or_default(p5, p6, p7)
    if p5[p6] == nil then
        p5[p6] = p7
    end
    return p5[p6]
end
local v_u_29 = {
    ["get_memory_bank_id"] = function(p8)
        return p8.unique_id
    end,
    ["make_memory_bank"] = function(p9)
        local v10 = v_u_29.get_memory_bank_id(p9)
        local v11 = v_u_4.new()
        local v12 = {
            ["memory_bank_id"] = v10,
            ["pet_char"] = p9.base.char
        }
        local v13 = p9.base.char_wrapper
        if v13 then
            v13 = p9.base.char_wrapper.player
        end
        v12.owned_by_local_player = v13 == v_u_2.LocalPlayer
        v12.created_at = os.clock()
        v11.meta = v12
        v_u_3[v10] = v11
        v_u_29.clear_old_session_memory()
        return v11
    end,
    ["get_memory_bank"] = function(p14)
        return v_u_3[v_u_29.get_memory_bank_id(p14)]
    end,
    ["get_or_make_memory_bank"] = function(p15)
        return v_u_29.get_memory_bank(p15) or v_u_29.make_memory_bank(p15)
    end,
    ["clear_old_session_memory"] = function()
        local v16 = {}
        local v17 = {}
        for _, v18 in pairs(v_u_3) do
            if not v18.meta.pet_char:IsDescendantOf(game) then
                table.insert(v16, v18)
                if v18.meta.owned_by_local_player then
                    table.insert(v17, v18)
                end
            end
        end
        if #v16 > 20 then
            table.sort(v17, function(p19, p20)
                return p19.meta.created_at < p20.meta.created_at
            end)
            local v21 = #v17
            local v22 = v17[math.min(v21, 10)]
            local v_u_23 = v22 and v22.meta.created_at or (-1 / 0)
            table.sort(v16, function(p24, p25)
                local v26 = p24.meta.owned_by_local_player
                if v26 then
                    v26 = p24.meta.created_at <= v_u_23
                end
                local v27 = p25.meta.owned_by_local_player
                if v27 then
                    v27 = p25.meta.created_at <= v_u_23
                end
                if v26 == v27 then
                    return p24.meta.created_at > p25.meta.created_at
                else
                    return v27
                end
            end)
            for v28 = 1, #v16 - 20 do
                v_u_3[v16[v28].meta.memory_bank_id] = nil
            end
        end
    end
}
return v_u_29