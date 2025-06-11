--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.FurnitureAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AnimationManager")
local v_u_3 = v1("package:Promise")
return {
    ["animate_furniture"] = function(p_u_4, p5, _, _, _, p6)
        local v7 = p6 or p_u_4.id
        local v_u_8 = p5.AnimationController:LoadAnimation(v_u_2.get_track(v7))
        p_u_4.anim_track = v_u_8
        v_u_8:Play()
        local v11 = v_u_8.Length > 0 and v_u_3.resolve() or v_u_3.new(function(p9, _, p10)
            while not p10() do
                if v_u_8.Length > 0 then
                    p9()
                    return
                end
                task.wait(0.1)
            end
        end)
        v11:andThen(function()
            v_u_8.TimePosition = workspace:GetServerTimeNow() % (v_u_8.Length / v_u_8.Speed)
            p_u_4.anim_track = v_u_8
            p_u_4.track_promise = nil
        end)
        p_u_4.track_promise = v11
    end,
    ["unrender_animated_furniture"] = function(p12, _, _, _)
        if p12.track_promise then
            p12.track_promise:cancel()
            p12.track_promise = nil
        end
        if p12.anim_track then
            p12.anim_track:Stop()
            p12.anim_track:Destroy()
            p12.anim_track = nil
        end
    end
}