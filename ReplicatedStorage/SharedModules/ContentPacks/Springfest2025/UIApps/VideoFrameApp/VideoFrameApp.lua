--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.UIApps.VideoFrameApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Music")
local v_u_4 = v1("XboxSupport")
local v_u_5 = v1("package:Promise")
local v6 = v2("VideoFrameApp", v1("UIBaseApp"))
function v6.show(p7)
    p7.instance.Enabled = true
    p7.video_frame:Play()
end
function v6.hide(p8)
    p8.video_frame:Pause()
    p8.instance.Enabled = false
end
function v6.refresh(p9, p10)
    local v11 = p10[p9.ClassName] and true or false
    p9:set_visibility(v11)
    if v11 then
        v_u_3.disable()
    else
        v_u_3.enable()
    end
end
function v6.is_loaded(p12)
    return p12.video_state == "loaded"
end
function v6.preload_video(p_u_13, p14)
    if p_u_13.video_state ~= "loading" and (p_u_13.video_state ~= "loaded" or p_u_13.video_frame.Video ~= p14.video) then
        p_u_13.video_frame.Video = p14.video
        p_u_13.video_frame.Looped = p14.looped
        p_u_13.play_when_loaded = p14.play_when_loaded
        p_u_13.video_state = "loading"
        if p_u_13.preload_video_promise then
            p_u_13.preload_video_promise:cancel()
        end
        p_u_13.preload_video_promise = v_u_5.new(function(p15, _, p16)
            while not p16() do
                if p_u_13.video_frame.IsLoaded then
                    p15()
                    return
                end
                task.wait()
            end
        end):andThen(function()
            p_u_13.video_state = "loaded"
            if p_u_13.play_when_loaded then
                p_u_13.play_when_loaded = false
                p_u_13:show_video()
            end
        end)
    end
end
function v6.show_video(p17)
    if p17.video_frame.Playing then
        return
    elseif p17.video_state == "not_loaded" then
        warn("Please use VideoFrameApp:preload_video before calling VideoFrameApp:show_video! Or call VideoFrameApp:preload_video with the play_when_loaded option set to true.")
        return
    elseif p17.video_state == "loading" then
        p17.play_when_loaded = true
    else
        p17.UIManager.set_app_visibility(p17.ClassName, true)
        p17.video_frame.TimePosition = 0
        p17.video_frame:Play()
    end
end
function v6.start(p_u_18)
    p_u_18.preload_video_promise = nil
    p_u_18.video_state = "not_loaded"
    p_u_18.play_when_loaded = false
    p_u_18.video_frame = p_u_18.instance:FindFirstChild("VideoFrame", true)
    p_u_18.video_frame.Ended:Connect(function()
        p_u_18.UIManager.set_app_visibility(p_u_18.ClassName, false)
    end)
    v_u_3.volume_changed:connect(function(p19)
        p_u_18.video_frame.Volume = p19
    end)
    p_u_18.exit_button_instance = p_u_18.instance:FindFirstChild("CloseButton", true)
    p_u_18.exit_button_instance.Activated:Connect(function()
        p_u_18.UIManager.set_app_visibility(p_u_18.ClassName, false)
    end)
    p_u_18.watch = v_u_4.quick_watch({
        ["selection_parent"] = p_u_18.instance,
        ["default_selection"] = p_u_18.exit_button_instance,
        ["app_name"] = p_u_18.ClassName,
        ["exit_buttons"] = { p_u_18.exit_button_instance }
    })
end
return v6