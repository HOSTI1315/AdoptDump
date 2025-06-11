--// ReplicatedStorage.CmdrClient.CmdrInterface.AutoComplete (ModuleScript)

local v_u_1 = game:GetService("Players").LocalPlayer
return function(p2)
    local v_u_3 = {
        ["Items"] = {},
        ["ItemOptions"] = {},
        ["SelectedItem"] = 0
    }
    local v_u_4 = p2.Util
    local v_u_5 = v_u_1:WaitForChild("PlayerGui"):WaitForChild("Cmdr"):WaitForChild("Autocomplete")
    local v_u_6 = v_u_5:WaitForChild("TextButton")
    local v_u_7 = v_u_5:WaitForChild("Title")
    local v_u_8 = v_u_5:WaitForChild("Description")
    local v_u_9 = v_u_5.Parent:WaitForChild("Frame"):WaitForChild("Entry")
    v_u_6.Parent = nil
    local v_u_10 = v_u_5.ScrollBarThickness
    local function v_u_15(p11, p12, p13, p14)
        p11.Visible = p13 ~= nil
        p12.Text = p13 or ""
        if p14 then
            p12.Size = UDim2.new(0, v_u_4.GetTextSize(p13 or "", p12, Vector2.new(1000, 1000), 1, 0).X, p11.Size.Y.Scale, p11.Size.Y.Offset)
        end
    end
    local function v_u_23()
        local v16 = v_u_5
        local v17 = UDim2.new
        local v18 = v_u_7.Field.TextBounds.X + v_u_7.Field.Type.TextBounds.X
        local v19 = v_u_5.Size.X.Offset
        local v20 = math.max(v18, v19)
        local v21 = v_u_5.UIListLayout.AbsoluteContentSize.Y
        local v22 = v_u_5.Parent.AbsoluteSize.Y - v_u_5.AbsolutePosition.Y - 10
        v16.Size = v17(0, v20, 0, (math.min(v21, v22)))
    end
    local function v_u_29(p24)
        v_u_15(v_u_7, v_u_7.Field, p24.name, true)
        local v25 = v_u_15
        local v26 = v_u_7.Field.Type
        local v27 = v_u_7.Field.Type
        local v28 = p24.type
        if v28 then
            v28 = ": " .. p24.type:sub(1, 1):upper() .. p24.type:sub(2)
        end
        v25(v26, v27, v28)
        v_u_15(v_u_8, v_u_8.Label, p24.description)
        v_u_8.Label.TextColor3 = p24.invalid and Color3.fromRGB(255, 73, 73) or Color3.fromRGB(255, 255, 255)
        v_u_8.Size = UDim2.new(1, 0, 0, 40)
        while not v_u_8.Label.TextFits do
            v_u_8.Size = v_u_8.Size + UDim2.new(0, 0, 0, 2)
            if v_u_8.Size.Y.Offset > 500 then
                break
            end
        end
        task.wait()
        v_u_5.UIListLayout:ApplyLayout()
        v_u_23()
        v_u_5.ScrollBarThickness = v_u_10
    end
    function v_u_3.Show(p30, p31, p32)
        local v33 = p32 or {}
        for _, v34 in pairs(p30.Items) do
            if v34.gui then
                v34.gui:Destroy()
            end
        end
        p30.SelectedItem = 1
        p30.Items = p31
        p30.Prefix = v33.prefix or ""
        p30.LastItem = v33.isLast or false
        p30.Command = v33.command
        p30.Arg = v33.arg
        p30.NumArgs = v33.numArgs
        p30.IsPartial = v33.isPartial
        v_u_5.ScrollBarThickness = 0
        local v35 = 200
        for v36, v37 in pairs(p30.Items) do
            local v38 = v37[1]
            local v39 = v37[2]
            local v40 = v_u_6:Clone()
            v40.Name = v38 .. v39
            v40.BackgroundTransparency = v36 == p30.SelectedItem and 0.5 or 1
            local v41, v42 = string.find(v39:lower(), v38:lower(), 1, true)
            if v41 == nil and v42 == nil then
                v42 = string.len(v39)
                v41 = 1
            end
            v40.Typed.Text = string.rep(" ", v41 - 1) .. v38
            local v43 = v40.Suggest
            local v44 = v41 - 1
            local v45 = string.sub(v39, 0, v44)
            local v46 = string.rep(" ", #v38)
            local v47 = v42 + 1
            v43.Text = v45 .. v46 .. string.sub(v39, v47)
            v40.Parent = v_u_5
            v40.LayoutOrder = v36
            local v48 = v40.Typed.TextBounds.X
            local v49 = v40.Suggest.TextBounds.X
            local v50 = math.max(v48, v49) + 20
            if v35 >= v50 then
                v50 = v35
            end
            v37.gui = v40
            v35 = v50
        end
        v_u_5.UIListLayout:ApplyLayout()
        local v51 = v_u_9.TextBox.Text
        local v52 = v_u_4.SplitString(v51)
        if v51:sub(#v51, #v51) == " " and not v33.at then
            v52[#v52 + 1] = "e"
        end
        table.remove(v52, #v52)
        local v53 = (v33.at and v33.at or #table.concat(v52, " ") + 1) * 7
        v_u_5.Position = UDim2.new(0, v_u_9.TextBox.AbsolutePosition.X - 10 + v53, 0, v_u_9.TextBox.AbsolutePosition.Y + 30)
        v_u_5.Size = UDim2.new(0, v35, 0, v_u_5.UIListLayout.AbsoluteContentSize.Y)
        v_u_5.Visible = true
        local v54 = v_u_29
        if p30.Items[1] then
            v33 = p30.Items[1].options or v33
        end
        v54(v33)
    end
    function v_u_3.GetSelectedItem(_)
        if v_u_5.Visible == false then
            return nil
        else
            return v_u_3.Items[v_u_3.SelectedItem]
        end
    end
    function v_u_3.Hide(_)
        v_u_5.Visible = false
    end
    function v_u_3.IsVisible(_)
        return v_u_5.Visible
    end
    function v_u_3.Select(p55, p56)
        if v_u_5.Visible then
            p55.SelectedItem = p55.SelectedItem + p56
            if p55.SelectedItem > #p55.Items then
                p55.SelectedItem = 1
            elseif p55.SelectedItem < 1 then
                p55.SelectedItem = #p55.Items
            end
            for v57, v58 in pairs(p55.Items) do
                v58.gui.BackgroundTransparency = v57 == p55.SelectedItem and 0.5 or 1
            end
            local v59 = v_u_5
            local v60 = Vector2.new
            local v61 = v_u_7.Size.Y.Offset + v_u_8.Size.Y.Offset + p55.SelectedItem * v_u_6.Size.Y.Offset - v_u_5.Size.Y.Offset
            v59.CanvasPosition = v60(0, (math.max(0, v61)))
            if p55.Items[p55.SelectedItem] and p55.Items[p55.SelectedItem].options then
                v_u_29(p55.Items[p55.SelectedItem].options or {})
            end
        end
    end
    v_u_5.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(v_u_23)
    return v_u_3
end