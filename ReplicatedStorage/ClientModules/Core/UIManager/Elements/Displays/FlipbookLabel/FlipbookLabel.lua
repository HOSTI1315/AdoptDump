--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.FlipbookLabel (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("TweenPromise")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v5 = v1("package:t")
local v6 = v5.strictInterface
local v7 = {
    ["sprite_sheets"] = v5.map(v5.literal("icon", "default", "large"), v5.strictInterface({
        ["image"] = v5.string,
        ["size"] = v5.Vector2
    })),
    ["frame_count"] = v5.intersection(v5.numberPositive, v5.integer),
    ["rows"] = v5.intersection(v5.numberPositive, v5.integer),
    ["columns"] = v5.intersection(v5.numberPositive, v5.integer),
    ["framerate"] = v5.intersection(v5.numberPositive, v5.integer)
}
local v8 = v6(v7)
local v9 = v5.strictInterface({
    ["frames"] = v5.map(v5.literal("icon", "default", "large"), v5.array(v5.string)),
    ["framerate"] = v5.intersection(v5.numberPositive, v5.integer)
})
local v_u_10 = v5.union(v9, v8)
local v_u_11 = v3("FlipbookLabel", v1("UIBaseElement"))
v_u_11.by_identifier = {}
function v_u_11.show_frame(p12, p13)
    if p12.sprite_sheet then
        if p12.frame_offsets[p13] ~= nil and p13 ~= p12.current_frame then
            p12.current_frame = p13
            local v14 = p12.frame_offsets[p13]
            if p12.flipped then
                v14 = v14 + Vector2.new(p12.frame_size.X, 0)
            end
            p12.instance.ImageRectOffset = v14
        end
    elseif p12.frames[p13] ~= nil and p13 ~= p12.current_frame then
        p12.instance.Image = p12.frames[p13]
    end
end
function v_u_11.from_identifier(p15)
    if p15 then
        return v_u_11.by_identifier[p15]
    else
        return nil
    end
end
function v_u_11.start(p_u_16, p17, p_u_18, p19)
    local v20 = v_u_11.from_identifier(p_u_18)
    if v20 then
        local v21 = p_u_16.instance == v20.instance
        if v21 and p17.sprite_sheets then
            v21 = p17.sprite_sheets.default == v20.options.sprite_sheets.default
        elseif v21 then
            v21 = p17.frames[1] == v20.options.frames[1]
        end
        if v21 then
            return v20
        end
        v20:destroy()
    end
    local v22 = v_u_10
    assert(v22(p17))
    p_u_16.options = p17
    p_u_16.maid = v_u_4.new()
    if p17.sprite_sheets then
        p_u_16.flipped = p_u_16.instance:GetAttribute("Flipped")
        p_u_16.sprite_sheet_info = p17.sprite_sheets[p19 or "default"] or p17.sprite_sheets.default
        p_u_16.sprite_sheet = p_u_16.sprite_sheet_info.image
        local v23 = p_u_16.sprite_sheet_info.size
        p_u_16.rows = p17.rows
        p_u_16.columns = p17.columns
        p_u_16.frame_count = p17.frame_count or p_u_16.rows * p_u_16.columns
        p_u_16.frame_size = Vector2.new(v23.X / p_u_16.columns, v23.Y / p_u_16.rows)
        local v24 = {}
        for v25 = 1, p_u_16.rows do
            for v26 = 1, p_u_16.columns do
                local v27 = p_u_16.frame_size.X * (v26 - 1)
                local v28 = p_u_16.frame_size.Y * (v25 - 1)
                local v29 = Vector2.new
                table.insert(v24, v29(v27, v28))
                if #v24 >= p_u_16.frame_count then
                    break
                end
            end
            if #v24 >= p_u_16.frame_count then
                break
            end
        end
        p_u_16.frame_offsets = v24
        local v_u_30 = p_u_16.instance.ImageRectOffset
        local v_u_31 = p_u_16.instance.ImageRectSize
        p_u_16.instance.Image = p_u_16.sprite_sheet
        local v32 = p_u_16.instance
        local v33
        if p_u_16.flipped then
            v33 = Vector2.new(-p_u_16.frame_size.X, p_u_16.frame_size.Y)
        else
            v33 = p_u_16.frame_size
        end
        v32.ImageRectSize = v33
        p_u_16.maid:GiveTask(function()
            p_u_16.instance.ImageRectOffset = v_u_30
            p_u_16.instance.ImageRectSize = v_u_31
        end)
        p_u_16.maid:GiveTask(p_u_16.instance:GetAttributeChangedSignal("Flipped"):Connect(function()
            p_u_16.flipped = p_u_16.instance:GetAttribute("Flipped")
            if p_u_16.flipped then
                p_u_16.instance.ImageRectSize = Vector2.new(-p_u_16.frame_size.X, p_u_16.frame_size.Y)
            else
                p_u_16.instance.ImageRectSize = p_u_16.frame_size
            end
        end))
    else
        p_u_16.frames = p17.frames[p19 or "default"] or p17.frames.default
        p_u_16.frame_count = #p_u_16.frames
    end
    p_u_16:show_frame(1)
    local v34 = p_u_16.frame_count / p_u_16.options.framerate
    local v35 = TweenInfo.new(v34, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1)
    local v_u_37 = v_u_2.callback(1, p_u_16.frame_count + 1, v35, function(p36)
        p_u_16:show_frame((math.floor(p36)))
    end)
    if p_u_18 then
        v_u_11.by_identifier[p_u_18] = p_u_16
        p_u_16.maid:GiveTask(function()
            v_u_11.by_identifier[p_u_18] = nil
        end)
    end
    p_u_16.instance:SetAttribute("IsFlipbookLabel", true)
    p_u_16.maid:GiveTask(function()
        v_u_37:cancel()
        p_u_16.instance:SetAttribute("IsFlipbookLabel", nil)
        p_u_16.instance.ImageRectSize = Vector2.new(0, 0)
    end)
    p_u_16.maid:GiveTask(p_u_16.instance.Destroying:Connect(function()
        p_u_16:destroy()
    end))
    return p_u_16
end
function v_u_11.destroy(p38)
    p38.maid:Destroy()
end
return v_u_11