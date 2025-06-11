--// ReplicatedStorage.ClientModules.Game.ThreeDFonts (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("ThreeDFontDB")
local v3 = v1("ThreeDFont")
local v4 = game:GetService("ReplicatedStorage").Resources.ThreeDFontFolders
local v_u_5 = {
    ["_fonts"] = {}
}
for v6, v7 in next, v2 do
    local v8 = v7.folder_name
    local v9 = v3.fromFolder(v4[v8])
    v_u_5._fonts[v6] = v9
end
function v_u_5.render_single_line_text(p10, p11, p12, p13)
    return v_u_5._fonts[p10]:RenderSingleLineText(p11, p12, p13)
end
function v_u_5.render_multi_line_text(p14, p15, p16, p17)
    return v_u_5._fonts[p14]:RenderMultiLineText(p15, p16, p17)
end
return v_u_5