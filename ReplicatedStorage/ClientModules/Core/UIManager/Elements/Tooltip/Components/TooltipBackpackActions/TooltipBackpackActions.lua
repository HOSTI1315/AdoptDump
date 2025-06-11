--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.Components.TooltipBackpackActions (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("package:t")
local v_u_4 = {
    [true] = "rbxassetid://6508046583",
    [false] = "rbxassetid://6508046623"
}
local v_u_5 = {
    [true] = "rbxassetid://14262047905",
    [false] = "rbxassetid://14262047765"
}
local v_u_6 = {
    ["SINGLE"] = 44,
    ["DOUBLE"] = 80
}
local v7 = v2("TooltipBackpackActions", (v1("UIBaseTooltipComponent")))
local v_u_8 = v3.strictInterface({
    ["equip_callback"] = v3.callback,
    ["favorite_callback"] = v3.callback,
    ["lock_callback"] = v3.callback
})
function v7._validate_options(_, p9)
    return v_u_8(p9)
end
function v7.start(p_u_10)
    p_u_10.options = {
        ["equip_callback"] = function() end,
        ["favorite_callback"] = function() end,
        ["lock_callback"] = function() end
    }
    p_u_10.button_instances = {
        ["Equip"] = p_u_10.instance.Equip,
        ["EquipAlt"] = p_u_10.instance.EquipAlt,
        ["Favorite"] = p_u_10.instance.Favorite,
        ["Lock"] = p_u_10.instance.Lock
    }
    p_u_10.equip = p_u_10.UIManager.wrap(p_u_10.instance.Equip, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_10.options.equip_callback(false)
        end
    })
    p_u_10.equip_alt = p_u_10.UIManager.wrap(p_u_10.instance.EquipAlt, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_10.options.equip_callback(true)
        end
    })
    p_u_10.favorite = p_u_10.UIManager.wrap(p_u_10.instance.Favorite, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_10.options.favorite_callback()
        end
    })
    p_u_10.lock = p_u_10.UIManager.wrap(p_u_10.instance.Lock, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_10.options.lock_callback()
        end
    })
    p_u_10.favorite:set_state("selected")
    p_u_10.star_state = nil
    p_u_10:set_star_state(false)
    p_u_10.lock_state = nil
    p_u_10:set_lock_state(false)
end
function v7.get_button(p11, p12)
    return p11.button_instances[p12]
end
function v7.set_equip_text_state(p13, p14, p15)
    p13.equip.instance.Face.TextLabel.Text = p14
    p13.equip:set_state(p15)
end
function v7.get_star_state(p16)
    return p16.star_state
end
function v7.set_star_state(p17, p18)
    p17.star_state = p18
    p17.favorite.instance.Face.StarIcon.Image = v_u_4[p18]
end
function v7.get_lock_state(p19)
    return p19.lock_state
end
function v7.set_lock_state(p20, p21)
    p20.lock_state = p21
    p20.lock.instance.Face.LockIcon.Image = v_u_5[p21]
end
local v_u_22 = {}
local v23 = {
    ["Equip"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.75, -7, 1, 0)
    },
    ["Favorite"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.25, 0, 1, 0)
    }
}
v_u_22.lock_hidden_alt_hidden = v23
local v24 = {
    ["Equip"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.6, -10, 1, 0)
    },
    ["Lock"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.2, 0, 1, 0)
    },
    ["Favorite"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.2, 0, 1, 0)
    }
}
v_u_22.lock_visible_alt_hidden = v24
local v25 = {
    ["Equip"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    },
    ["EquipAlt"] = {
        ["Row"] = 2,
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.75, -7, 1, 0)
    },
    ["Favorite"] = {
        ["Row"] = 2,
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.25, 0, 1, 0)
    }
}
v_u_22.lock_hidden_alt_visible = v25
local v26 = {
    ["Equip"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.75, -7, 1, 0)
    },
    ["Lock"] = {
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.25, 0, 1, 0)
    },
    ["EquipAlt"] = {
        ["Row"] = 2,
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.75, -7, 1, 0)
    },
    ["Favorite"] = {
        ["Row"] = 2,
        ["Visible"] = true,
        ["Size"] = UDim2.new(0.25, 0, 1, 0)
    }
}
v_u_22.lock_visible_alt_visible = v26
function v7._refresh_layout(p27)
    local v28 = v_u_22["lock_" .. (p27.lock_button_visible and "visible" or "hidden") .. "_alt_" .. (p27.alt_equip_visible and "visible" or "hidden")]
    local v29 = false
    for _, v30 in p27.button_instances do
        local v31 = v28[v30.Name] or {
            ["Visible"] = false
        }
        for v32, v33 in v31 do
            if v32 ~= "Row" then
                v30[v32] = v33
            end
        end
        local v34 = v31.Row or 1
        v30.Parent = p27.instance:FindFirstChild("Row" .. v34)
        if v34 > 1 then
            v29 = true
        end
    end
    if v29 then
        p27.instance.Size = UDim2.new(1, 0, 0, v_u_6.DOUBLE)
        p27.instance.Row1.Size = UDim2.new(1, 0, 0.5, 0)
        p27.instance.Row2.Visible = true
    else
        p27.instance.Size = UDim2.new(1, 0, 0, v_u_6.SINGLE)
        p27.instance.Row1.Size = UDim2.new(1, 0, 1, 0)
        p27.instance.Row2.Visible = false
    end
end
function v7.set_lock_button_visible(p35, p36)
    if p35.lock_button_visible ~= p36 then
        p35.lock_button_visible = p36
        p35:_refresh_layout()
    end
end
function v7.set_alt_equip_visible(p37, p38)
    if p37.alt_equip_visible ~= p38 then
        p37.alt_equip_visible = p38
        p37:_refresh_layout()
    end
end
return v7