--// ReplicatedStorage.SharedModules.TranslationHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = game:GetService("RunService")
local function v_u_5()
    return v_u_3:GetTranslatorForPlayer(v_u_2.LocalPlayer)
end
local v_u_6 = {
    ["_available_key_cache"] = {}
}
local v_u_7 = v_u_4:IsClient() and "Downloaded" or "lokalise-server-only-all-translations"
function v_u_6.is_ready()
    return v_u_3:FindFirstChild(v_u_7) ~= nil
end
function v_u_6.wait_until_ready()
    v_u_3:WaitForChild(v_u_7)
end
function v_u_6.wait_for_key(p8)
    local v9 = v_u_4:IsClient()
    assert(v9, "client only")
    while v_u_6._available_key_cache[p8] == nil do
        task.wait()
    end
end
function v_u_6.format_by_key(p_u_10, p_u_11)
    local v12 = v_u_4:IsClient()
    assert(v12, "client only")
    local v13, v14 = pcall(function()
        return v_u_3:GetTranslatorForPlayer(v_u_2.LocalPlayer):FormatByKey(p_u_10, p_u_11)
    end)
    if v13 then
        p_u_10 = v14 or p_u_10
    end
    return p_u_10
end
function v_u_6.translate(p15, p16)
    local v17 = v_u_4:IsClient()
    assert(v17, "client only")
    return v_u_3:GetTranslatorForPlayer(v_u_2.LocalPlayer):Translate(p15, p16)
end
function v_u_6.get_translator_for_player(p18)
    if v_u_4:IsClient() then
        if p18 ~= v_u_2.LocalPlayer then
            error("Cannot get translator for other players on the client")
        end
        return v_u_5()
    end
    local v19 = v_u_1("new:LocalizationServer")
    local v20 = v_u_3:GetTranslatorForPlayer(p18)
    return v19.get_all_translations_table():GetTranslator(v20.LocaleId)
end
function v_u_6.server_get_translator_for_locale(p21)
    local v22 = v_u_4:IsServer()
    assert(v22, "server only")
    return v_u_1("new:LocalizationServer").get_all_translations_table():GetTranslator(p21)
end
function v_u_6.get_translator_for(p23)
    local v24 = v_u_4:IsServer()
    assert(v24, "server only")
    if type(p23) == "string" then
        return v_u_6.server_get_translator_for_locale(p23)
    else
        return v_u_6.get_translator_for_player(p23)
    end
end
function v_u_6.translate_for(p25, p26)
    local v27 = v_u_4:IsServer()
    assert(v27, "server only")
    return v_u_6.get_translator_for(p25):Translate(game, p26)
end
function v_u_6.format_for(p28, p_u_29, p_u_30)
    local v31 = v_u_4:IsServer()
    assert(v31, "server only")
    local v_u_32 = v_u_6.get_translator_for(p28)
    local v33, v34 = pcall(function()
        return v_u_32:FormatByKey(p_u_29, p_u_30)
    end)
    if v33 then
        p_u_29 = v34 or p_u_29
    end
    return p_u_29
end
return v_u_6