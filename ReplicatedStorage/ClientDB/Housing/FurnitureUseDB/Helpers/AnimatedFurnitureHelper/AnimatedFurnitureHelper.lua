--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Helpers.AnimatedFurnitureHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("FurnitureUseHelperLegacy")
local v_u_3 = v_u_1("FurnitureAnimator")
return {
    ["ANIMATED_USABLE_FURNITURE"] = function(p4)
        return v_u_2.BASIC_FURNITURE({
            ["use_text"] = p4.use_text,
            ["animation"] = p4.animation,
            ["team_whitelist"] = p4.team_whitelist,
            ["ailment_to_boost"] = p4.ailment_to_boost,
            ["char_offset"] = p4.char_offset,
            ["has_animated_seat"] = true,
            ["post_render"] = function(...)
                v_u_3.animate_furniture(...)
            end,
            ["client_get_data_for_server_use"] = function(_, _, p5, _, _)
                local v6 = {}
                local v7 = p5:FindFirstChild("UserExit")
                if v7 then
                    v7 = v7.CFrame
                end
                v6.exit_cframe = v7
                return v6
            end,
            ["basic_server_use_post"] = function(p8, _, _, p9, _, p10, _, _)
                if p9.exit_cframe and p10.PrimaryPart then
                    if v_u_1("CharacterWrapper").get(p10):get_team() == "Pets" then
                        return
                    end
                    v_u_1("ServerRouter").get("HousingAPI/AnimatedFurnitureExit"):FireClient(p8, p9.exit_cframe)
                end
            end,
            ["unrender"] = function(...)
                v_u_3.unrender_animated_furniture(...)
            end
        })
    end
}