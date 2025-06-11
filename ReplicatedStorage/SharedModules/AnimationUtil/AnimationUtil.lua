--// ReplicatedStorage.SharedModules.AnimationUtil (ModuleScript)

local v_u_1 = game:GetService("ContentProvider")
return {
    ["get_load_status"] = function(p_u_2)
        if p_u_2.Length ~= 0 then
            return "success"
        end
        if p_u_2:GetAttribute("AnimationUtilLoadStatus") == nil then
            task.spawn(function()
                p_u_2:SetAttribute("AnimationUtilLoadStatus", "loading")
                pcall(function()
                    v_u_1:PreloadAsync({ p_u_2.Animation })
                end)
                p_u_2:SetAttribute("AnimationUtilLoadStatus", p_u_2.Length == 0 and "failed" or "success")
            end)
        end
        return p_u_2:GetAttribute("AnimationUtilLoadStatus")
    end
}