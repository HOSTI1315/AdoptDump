--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.AboutMePlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("AboutMePlayerProfileWidget", v1("BasePlayerProfileWidget"))
function v2.get_save_data(p3)
    return {
        ["title"] = p3.title:to_save(),
        ["body"] = p3.body:to_save()
    }
end
function v2.render(p4)
    p4.edit_frame.Visible = p4.editing
    p4.display_frame.Visible = not p4.editing
end
function v2.start(p5, p6)
    p5.edit_frame = p5.instance.Edit
    p5.display_frame = p5.instance.Display
    p5.title = p5.UIManager.wrap(p5.instance, "WidgetText"):start(p5, {
        ["default_text"] = "About Me",
        ["editable"] = true,
        ["override_edit"] = p5.edit_frame.Title,
        ["override_display"] = p5.display_frame.Title
    })
    local v7 = p5.title
    local v8
    if p6 then
        v8 = p6.title
    else
        v8 = p6
    end
    v7:set(v8)
    p5.body = p5.UIManager.wrap(p5.instance, "WidgetText"):start(p5, {
        ["editable"] = true,
        ["character_limit"] = 160,
        ["override_edit"] = p5.edit_frame.Body,
        ["override_display"] = p5.display_frame.Body
    })
    local v9 = p5.body
    if p6 then
        p6 = p6.body
    end
    v9:set(p6)
end
return v2