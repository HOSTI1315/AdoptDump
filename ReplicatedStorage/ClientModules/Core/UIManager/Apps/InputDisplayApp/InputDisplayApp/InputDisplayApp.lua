--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.InputDisplayApp.InputDisplayApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("InputIcons")
local v_u_4 = v1("PlatformM")
local v_u_5 = {
    ["desktop"] = true,
    ["console"] = true
}
local v6 = v2("InputDisplayApp", v1("UIBaseApp"))
function v6._watch_extra_buttons(p_u_7)
    local v_u_8 = p_u_7.UIManager.apps.ExtraButtonsApp
    v_u_8:get_list_top_position_changed_signal():Connect(function()
        p_u_7.container.Position = v_u_8:get_list_top_position()
    end)
    p_u_7.container.Size = UDim2.new(0, 180, 0.5, 0)
    p_u_7.container.AnchorPoint = Vector2.new(0, 1)
    p_u_7.container.Position = v_u_8:get_list_top_position()
end
function v6.show_input(p9, p10, p11, p12)
    if not p9.watching_extra_buttons then
        p9:_watch_extra_buttons()
    end
    local v13 = v_u_3.get_icon_by_keycode(p11, {
        ["scale"] = (p12.scale or 1) * 0.4722222222222222,
        ["theme"] = p12.theme,
        ["remap"] = p12.remap,
        ["display_text"] = p12.display_text,
        ["forced_key_type"] = p12.forced_key_type
    })
    local v14 = Instance.new("Frame")
    v14.BackgroundTransparency = 1
    v14.Size = UDim2.new(1, 0, 0, v13.AbsoluteSize.Y)
    v14.Name = v13.Name
    v14.Parent = p9.container
    local v15 = Instance.new("TextLabel")
    v15.BackgroundTransparency = 1
    v15.AnchorPoint = Vector2.new(1, 0)
    v15.Position = UDim2.new(1, 0, 0, 0)
    v15.Size = UDim2.new(1, -v13.AbsoluteSize.X - 6, 1, 0)
    v15.Text = p12.prompt_text or ""
    v15.Font = Enum.Font.SourceSansBold
    v15.TextColor3 = Color3.new(1, 1, 1)
    v15.TextSize = 30
    v15.TextXAlignment = Enum.TextXAlignment.Left
    v15.TextTruncate = Enum.TextTruncate.AtEnd
    v15.Parent = v14
    v13.Name = "Icon"
    v13.Parent = v14
    local v16 = p9.tagged[p10]
    if not v16 then
        v16 = {}
        p9.tagged[p10] = v16
    end
    table.insert(v16, v14)
end
function v6.clear_tag(p17, p18)
    local v19 = p17.tagged[p18] or {}
    for _, v20 in pairs(v19) do
        v20:Destroy()
    end
    p17.tagged[p18] = nil
end
function v6.refresh(p21, p22)
    if v_u_5[v_u_4.get_platform()] then
        p21:set_visibility(p22[p21.ClassName])
    end
end
function v6.show(p23)
    p23.instance.Enabled = true
end
function v6.hide(p24)
    p24.instance.Enabled = false
end
function v6.start(p25)
    p25.container = p25.instance.Container
    p25.watching_extra_buttons = false
    p25.tagged = {}
end
return v6