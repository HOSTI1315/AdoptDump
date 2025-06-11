--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.HouseTradeUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
return {
    ["is_viewing_listed_house"] = function()
        return v_u_1("ClientStore").store:getState().house_editor_state == "ViewingListedHouse"
    end,
    ["make_not_included_tag"] = function(p2)
        local v3 = v_u_1("UIManager")
        if not p2:FindFirstChild("Head") then
            local v4 = p2.CFrame * CFrame.new(0, -p2.Size.Y * 0.5, 0)
            local v5 = Instance.new("Attachment")
            v5.Name = "Head"
            v5.Parent = p2
            v5.WorldCFrame = v4
        end
        v3.apps.PlayerNameApp:add_npc_id(p2, nil, {
            ["tag"] = "Items Not Included",
            ["theme_color"] = "red"
        })
    end
}