--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.DisplayPlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("Polaroid")
local v_u_5 = v1("InventoryDB")
local v_u_6 = v1("SharedConstants")
local v_u_7 = v1("DisplayWidgetBackgrounds")
local v8 = v3("DisplayPlayerProfileWidget", v1("BasePlayerProfileWidget"))
function v8._deserialize_save_data(p9, p10)
    local v11 = p10 or {}
    local v12 = {}
    if v11.pets then
        for _, v13 in v11.pets do
            v12[v13.i] = v13.item
        end
    end
    p9.background_index = (v_u_7.get_background_info_from_name(v11.background) or {}).index or 1
    p9.pet_items = v12
    local v14 = v11.color
    if v14 then
        v14 = Color3.fromHex(v11.color)
    end
    p9.color = v14
end
function v8.get_save_data(p15)
    local v16 = {}
    local v17 = p15.pet_items[1]
    if v17 then
        table.insert(v16, {
            ["i"] = 1,
            ["item"] = v17
        })
    end
    local v18 = v_u_7.get_background_info_from_index(p15.background_index)
    local v19 = {}
    if v18 then
        v18 = v18.name
    end
    v19.background = v18
    v19.pets = v16
    local v20 = p15.color
    if v20 then
        v20 = p15.color:ToHex()
    end
    v19.color = v20
    return v19
end
function v8.add_pet(p21, p22)
    local v_u_23 = {}
    for _, v24 in p21.pet_items do
        v_u_23[v24.unique] = true
    end
    local v27 = p21.UIManager.apps.BackpackApp:pick_item({
        ["visible_backpack_categories"] = { "favorites", "pets" },
        ["allow_callback"] = function(p25)
            local v26
            if p25.category == "pets" then
                v26 = not v_u_23[p25.unique]
            else
                v26 = false
            end
            return v26
        end
    })
    if v27 then
        local v28 = {}
        for v29, _ in v_u_6.player_profiles.valid_pet_properties do
            v28[v29] = v27.properties[v29] == true and true or nil
        end
        local v30 = {
            ["kind"] = v27.kind,
            ["category"] = v27.category,
            ["unique"] = v27.unique,
            ["properties"] = v28
        }
        p21.pet_items[p22] = v30
        p21:render_viewport(p22)
        p21:render()
        p21.player_profile_app:set_gamepad_selection(p21.instance.PetSlots[p22].DeleteButton)
        return v30
    end
end
function v8.remove_pet(p31, p32)
    p31.pet_items[p32] = nil
    p31:render_viewport(p32)
    p31:render()
    p31.player_profile_app:set_gamepad_selection(p31.add_buttons[p32].instance)
end
function v8.render_background(p33)
    if p33.color then
        p33.background_label.Image = ""
        p33.background_label.BackgroundColor3 = p33.color
        p33.background_label.BackgroundTransparency = 0
    else
        local v34 = v_u_7.get_background_info_from_index(p33.background_index)
        p33.background_label.Image = not v34 and "" or v34.image
        p33.background_label.BackgroundTransparency = 1
    end
end
function v8.render_viewport(p35, p36)
    local v37 = p35.viewport_render_maids[p36]
    if not v37 then
        v37 = v_u_2.new()
        p35.viewport_render_maids[p36] = v37
    end
    v37:DoCleaning()
    local v38 = p35.pet_items[p36]
    local v_u_39
    if v38 then
        v_u_39 = v_u_5.pets[v38.kind]
    else
        v_u_39 = v38
    end
    if v_u_39 == nil then
        return
    end
    local v40 = p35.viewports[p36]
    local v_u_41 = p35.pet_slots[p36]
    if v_u_41 == nil or v40 == nil then
        return
    end
    v_u_41.Image = ""
    if v_u_39 == nil then
        return
    end
    local v42 = nil
    for _, v43 in { "mega_neon", "neon" } do
        if v38.properties and v38.properties[v43] then
            v42 = v43
            break
        end
    end
    local v44 = v_u_4.new
    local v45 = {
        ["variant"] = v42,
        ["freeze_pets"] = false
    }
    local v46 = CFrame.fromEulerAnglesYXZ
    local v47 = -15 + 180
    v45.locked_orientation = v46(-0.17453292519943295, math.rad(v47), 0)
    function v45.on_error()
        v_u_41.Image = v_u_39.image or ""
    end
    v37:GiveTask(v44(v_u_39, v40, v45))
    v40.Visible = true
end
function v8.render_slot(p48, p49)
    local v50 = p48.pet_items[p49]
    local v51
    if v50 then
        v51 = v_u_5.pets[v50.kind]
    else
        v51 = v50
    end
    local v52 = p48.pet_slots[p49]
    if v51 and v50 then
        v52.DeleteButton.Visible = p48.editing
        local v53 = 0
        for _, v54 in v50.properties do
            if v54 then
                v53 = v53 + 1
            end
        end
    end
    v52.Visible = v51 ~= nil
    local v55 = p48.add_buttons[p49].instance
    local v56 = p48.editing
    if v56 then
        v56 = v50 == nil
    end
    v55.Visible = v56
end
function v8.render(p57)
    p57.previous_background_button.instance.Visible = p57.editing
    p57.next_background_button.instance.Visible = p57.editing
    p57:render_background()
    if not p57.has_rendered then
        p57.has_rendered = true
        p57:render_viewport(1)
    end
    p57:render_slot(1)
    if p57.editing then
        v_u_7.preload()
    end
end
function v8.recolor(p58, _)
    p58:render_background()
end
function v8.start(p_u_59, p60, _)
    p_u_59.pet_items = {}
    p_u_59.background_index = 1
    p_u_59:_deserialize_save_data(p60)
    p_u_59.has_rendered = false
    p_u_59.background_label = p_u_59.instance.PictureBackground
    p_u_59.viewport_render_maids = {}
    p_u_59.viewports = {}
    p_u_59.pet_slots = {}
    p_u_59.add_buttons = {}
    for v_u_61 = 1, 1 do
        p_u_59.viewports[v_u_61] = p_u_59.instance.ViewportFrames:FindFirstChild(v_u_61)
        p_u_59.viewport_render_maids[v_u_61] = v_u_2.new()
        local v62 = p_u_59.instance.PetSlots:FindFirstChild(v_u_61)
        v62.Visible = false
        p_u_59.pet_slots[v_u_61] = v62
        p_u_59.UIManager.wrap(v62.DeleteButton, "IconButton"):start({
            ["mouse_button1_click"] = function()
                p_u_59:remove_pet(v_u_61)
            end
        })
        local v63 = p_u_59.instance.AddButtons:FindFirstChild(v_u_61)
        v63.Visible = false
        p_u_59.add_buttons[v_u_61] = p_u_59.UIManager.wrap(v63, "IconButton"):start({
            ["mouse_button1_click"] = function()
                p_u_59:add_pet(v_u_61)
            end
        })
    end
    local v65 = {
        ["mouse_button1_click"] = function()
            local v64 = p_u_59
            v64.background_index = v64.background_index - 1
            if p_u_59.background_index <= 0 then
                p_u_59.background_index = v_u_7.get_count()
            end
            p_u_59.color = nil
            p_u_59:render_background()
        end
    }
    p_u_59.previous_background_button = p_u_59.UIManager.wrap(p_u_59.instance.Left, "IconButton"):start(v65)
    local v67 = {
        ["mouse_button1_click"] = function()
            local v66 = p_u_59
            v66.background_index = v66.background_index + 1
            if p_u_59.background_index > v_u_7.get_count() then
                p_u_59.background_index = 1
            end
            p_u_59.color = nil
            p_u_59:render_background()
        end
    }
    p_u_59.next_background_button = p_u_59.UIManager.wrap(p_u_59.instance.Right, "IconButton"):start(v67)
end
function v8.destroy(p68)
    for _, v69 in p68.viewport_render_maids do
        v69:Destroy()
    end
    p68.instance:Destroy()
end
return v8