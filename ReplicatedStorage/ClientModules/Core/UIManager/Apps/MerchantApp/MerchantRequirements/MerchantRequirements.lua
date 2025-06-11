--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MerchantApp.MerchantRequirements (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("Maid")
local v_u_3 = v1("package:Sift")
local v_u_4 = game:GetService("GuiService")
local v5 = v1("Class")("MerchantRequirements", (v1("UIBaseElement")))
local function v_u_10(p6, p7)
    local v8
    if p6 == nil or (p7 == nil or (p6.requirement_type ~= p7.requirement_type or p6.category ~= p7.category)) then
        v8 = false
    else
        v8 = v_u_3.Dictionary.equals(p6.properties or {}, p7.properties or {})
    end
    if not v8 then
        return false
    end
    if p6.requirement_type == "kind" then
        return p6.kind == p7.kind
    end
    if p6.requirement_type == "rarity" then
        local v9
        if p6.rarity == p7.rarity then
            v9 = p6.origin_item == p7.origin_item
        else
            v9 = false
        end
        return v9
    end
    error("Requirement type not recognized: " .. p6.requirement_type)
end
function v5.set_callbacks(p11, p12, p13)
    p11.pick_callback = p12
    p11.remove_callback = p13
end
function v5.set_requirements(p14, p15)
    p14.last_selected_unique = nil
    p14.last_canvas_offset = 0
    local v16 = nil
    local v17 = nil
    local v18 = {}
    for _, v19 in p15 do
        if v_u_10(v19, v16) then
            table.insert(v17, v19)
        else
            table.insert(v18, v17)
            v17 = { v19 }
        end
        v16 = v19
    end
    table.insert(v18, v17)
    p14.requirements = v18
    p14.item_list = {}
    p14:_update()
end
function v5.set_item_list(p20, p21)
    p20.item_list = p21
    p20:_update()
end
function v5._clear(p22)
    for _, v23 in p22.scrolling_frame:GetChildren() do
        if v23:IsA("GuiObject") then
            v23:Destroy()
        end
    end
    p22.requirements_maid:DoCleaning()
end
function v5._update(p24)
    p24.can_update_canvas_offset = false
    p24:_clear()
    for v25, v26 in p24.requirements do
        local v27 = p24.requirement_template:Clone()
        v27.LayoutOrder = v25
        v27.Parent = p24.scrolling_frame
        local v28 = p24.UIManager.wrap(v27, "MerchantRequirementsEntry")
        v28:start({
            ["requirements_by_type"] = v26,
            ["item_list"] = p24.item_list,
            ["pick_callback"] = p24.pick_callback,
            ["remove_callback"] = p24.remove_callback
        })
        p24.requirements_maid:GiveTask(v28)
    end
    p24.scrolling_frame.CanvasPosition = Vector2.new(0, p24.last_canvas_offset)
    p24.can_update_canvas_offset = true
end
function v5.start(p_u_29)
    p_u_29.item_list = {}
    p_u_29.requirements = {}
    p_u_29.requirements_maid = v_u_2.new()
    p_u_29.last_selected_unique = nil
    p_u_29.last_canvas_offset = 0
    p_u_29.scrolling_frame = p_u_29.instance.ScrollingFrame
    p_u_29.requirement_template = p_u_29.scrolling_frame.RequirementTemplate
    p_u_29.requirement_template.Parent = nil
    p_u_29.top_gradient = p_u_29.instance.TopGradient
    p_u_29.bottom_gradient = p_u_29.instance.BottomGradient
    p_u_29.top_visible = false
    p_u_29.bottom_visible = false
    p_u_29.UIManager.wrap(p_u_29.instance, "ScrollingFrameGradients"):start()
    v_u_4:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        local v30 = v_u_4.SelectedObject
        if v30 and p_u_29.UIManager.is_visible("MerchantApp") then
            if v30:IsDescendantOf(p_u_29.scrolling_frame) then
                local v31 = v30.Parent.Parent
                if v31.LayoutOrder == 1 then
                    p_u_29.scrolling_frame.CanvasPosition = Vector2.new()
                elseif v31.LayoutOrder == #p_u_29.requirements then
                    local v32 = p_u_29.scrolling_frame.AbsoluteCanvasSize.Y
                    local v33 = p_u_29.scrolling_frame.AbsoluteWindowSize.Y
                    p_u_29.scrolling_frame.CanvasPosition = Vector2.new(0, v32 - v33)
                end
                p_u_29.last_selected_unique = v30.Name
            end
        else
            return
        end
    end)
    return p_u_29
end
return v5