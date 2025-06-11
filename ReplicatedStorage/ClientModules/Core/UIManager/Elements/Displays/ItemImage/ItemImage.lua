--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.ItemImage (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("PlatformM")
local v_u_4 = v3.get_platform() == "phone" and true or v3.get_platform() == "tablet"
local v_u_5 = game:GetService("ReplicatedStorage").Resources.UI_Resources.Templates
local v6 = v2("ItemImage", v1("UIBaseElement"))
function v6._refresh(p7)
    if not p7.animated then
        p7.image_label.Image = p7.image or ""
    end
    p7.image_label.ScaleType = p7.scale_type
end
function v6.update_image(p8, p9, p10)
    local v11 = p9 and (p9.image or "") or ""
    if p9 and not v_u_4 then
        v11 = p9.image_large or v11
    end
    if p8.image ~= v11 then
        p8.image = v11
        if p8.flipbook then
            p8.flipbook:destroy()
        end
        if p9 then
            if p9.category == "stickers" then
                p8.scale_type = Enum.ScaleType.Fit
            else
                p8.scale_type = Enum.ScaleType.Stretch
            end
            if p9.animated then
                p8.flipbook = p8.UIManager.wrap(p8.image_label, "FlipbookLabel"):start(p9.flipbook_properties, nil, p10)
            end
            p8.animated = p9.animated
        else
            p8.scale_type = Enum.ScaleType.Stretch
            p8.animated = false
        end
        p8:_refresh()
    end
end
function v6.start(p12, p13)
    if p13.use_instance then
        p12.image_label = p12.instance
    else
        p12.image_label = v_u_5.ItemImageTemplate:Clone()
        p12.image_label.Parent = p12.instance
    end
    p12:update_image(p13.entry, p13.size)
    return p12
end
function v6.destroy(p14)
    if p14.flipbook then
        p14.flipbook:destroy()
    end
end
return v6