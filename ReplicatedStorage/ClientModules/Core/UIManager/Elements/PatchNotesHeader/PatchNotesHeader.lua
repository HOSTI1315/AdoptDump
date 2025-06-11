--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.PatchNotesHeader (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")
local v_u_3 = v1("StickersDB")
local v_u_4 = v1("package:Sift")
local v_u_5 = nil
local v_u_6 = nil
local v7 = v2("PatchNotesHeader", v1("UIBaseElement"))
function v7.start(p8, p9)
    if not (v_u_5 and v_u_6) then
        v_u_5 = v_u_4.Dictionary.values(v_u_4.Dictionary.map(v_u_3.stickers, function(p10)
            if p10.image_large and (v_u_4.List.find(p10.tags, "pets") and not p10.contentpack:lower():find("pride")) then
                return p10.image_large
            else
                return nil
            end
        end))
        table.sort(v_u_5)
        v_u_6 = #v_u_5
    end
    local v11 = Random.new(p9)
    for v12 = 1, #p8.instance.Stickers:GetChildren() - 1 do
        local v13 = v_u_5[v11:NextInteger(1, v_u_6)]
        p8.instance.Stickers:FindFirstChild((tostring(v12))).Sticker.Image = v13
    end
end
return v7