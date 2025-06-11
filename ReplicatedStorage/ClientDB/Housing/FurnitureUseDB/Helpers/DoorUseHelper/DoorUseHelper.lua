--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.DoorUseHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("package:Promise")
local v_u_2 = game:GetService("TweenService")
return {
    ["INTERIOR_SLIDING_DOOR"] = function()
        return {
            ["use_text"] = "Slide Door",
            ["use_permissions"] = "EVERYONE",
            ["usable_in_preview_housing"] = true,
            ["interaction_tag"] = "InteriorDoor",
            ["dont_automatically_mark_furniture_change_after_use"] = true,
            ["init"] = function(p3)
                local v4 = p3.state
                if not v4 then
                    v4 = {
                        ["door_position"] = "Left",
                        ["door_is_sliding"] = false
                    }
                end
                p3.state = v4
            end,
            ["server_use"] = function(_, p_u_5, p6)
                if not p_u_5.door_is_sliding then
                    p_u_5.door_is_sliding = true
                    p_u_5.door_position = p_u_5.door_position == "Left" and "Right" or "Left"
                    v_u_1.delay(0.7):andThen(function()
                        p_u_5.door_is_sliding = false
                    end)
                    p6()
                end
            end,
            ["post_render"] = function(p7, p8, _, p9)
                local v10
                if p9 then
                    v10 = p9.door_position ~= p7.door_position
                else
                    v10 = p9
                end
                local v11 = p8:FindFirstChild("Door")
                local v12 = p8:FindFirstChild("WorkingParts")
                local v13
                if v11 then
                    v13 = v11.PrimaryPart
                else
                    v13 = v11
                end
                local v14
                if v12 then
                    v14 = v12:FindFirstChild("LeftPosition")
                else
                    v14 = v12
                end
                local v15
                if v12 then
                    v15 = v12:FindFirstChild("RightPosition")
                else
                    v15 = v12
                end
                assert(v11, "Sliding door is missing a Door model")
                assert(v13, "Sliding door\'s Door model is missing a primary part")
                if v12 then
                    if v14 then
                        v12 = v15
                    else
                        v12 = v14
                    end
                end
                assert(v12, "Sliding door is missing a LeftPosition and/or RightPosition inside a WorkingParts model")
                if v10 then
                    v13:PivotTo(p9.door_position == "Left" and v14.CFrame or v15.CFrame)
                end
                local v16 = (p7.door_position == "Left" and v14 and v14 or v15).CFrame
                if p7.door_is_sliding then
                    v_u_2:Create(v13, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                        ["CFrame"] = v16
                    }):Play()
                else
                    v13.CFrame = v16
                end
            end
        }
    end
}