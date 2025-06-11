--// ReplicatedStorage.new.modules.RichText.Formatting.CreateFormatter (ModuleScript)

require(script.Parent.Parent.RichTextHelper)
local v_u_1 = require(game.ReplicatedStorage.SharedPackages.t)
local v_u_9 = {
    ["bold"] = "<b>%s</b>",
    ["bold_italic"] = "<b><i>%s</i></b>",
    ["italic"] = "<i>%s</i>",
    ["smallcaps"] = "<sc>%s</sc>",
    ["strikethrough"] = "<s>%s</s>",
    ["stroke"] = "<stroke>%s</stroke>",
    ["underline"] = "<u>%s</u>",
    ["uppercase"] = "<uc>%s</uc>",
    ["font_color"] = function(p2)
        return ("<font color=\"#%*\">%%s</font>"):format((p2:ToHex()))
    end,
    ["font_face"] = function(p3)
        return ("<font face=\"%*\">%%s</font>"):format(p3.Name)
    end,
    ["font_family"] = function(p4)
        return ("<font family=\"%*\">%%s</font>"):format(p4)
    end,
    ["font_size"] = function(p5)
        return ("<font size=\"%*\">%%s</font>"):format(p5)
    end,
    ["font_transparency"] = function(p6)
        return ("<font transparency=\"%*\">%%s</font>"):format(p6)
    end,
    ["font_weight"] = function(p7)
        if v_u_1.number(p7) then
            return ("<font weight=\"%*\">%%s</font>"):format(p7)
        else
            return ("<font weight=\"%*\">%%s</font>"):format(p7.Name)
        end
    end,
    ["mark"] = function(p8)
        return ("<mark color=\"#%*\" transparency=\"%*\">%%s</mark>"):format(p8.color:ToHex(), p8.transparency or 0)
    end
}
return function(p10, p11)
    local v12 = {}
    if p10 then
        for v13, v14 in v_u_9 do
            if v_u_1.string(v14) then
                v12[v13] = v14:format("%1")
            end
        end
    end
    for v15, v16 in p11 do
        local v17 = "%1"
        for v18, v19 in v16 do
            local v20 = v_u_9[v18] or "%s"
            if v_u_1.callback(v20) then
                v20 = v20(v19)
            end
            v17 = v20:format(v17)
        end
        v12[v15] = v17
    end
    return v12
end