--// ReplicatedStorage.new.modules.RichText.TokenFinders.PatchNotesSpecific (ModuleScript)

local v1 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v2 = require(script.Parent.Markdown)
require(script.Parent.Parent.RichTextHelper)
return v1.List.join({
    {
        ["capture"] = "^%s-|%s-(.+)",
        ["block_type"] = "table",
        ["transform_block"] = function(p3)
            local v4 = {}
            local v5 = {}
            local v6 = false
            for _, v7 in p3.text:split("\n") do
                if v7:find("[^%s|%-:]") then
                    local v8 = v7:split("|")
                    local v9 = {}
                    for v10, v11 in v8 do
                        if v10 ~= #v8 or v11:find("[^%s]") then
                            table.insert(v9, v11:match("^%s*(.-)%s*$"))
                        end
                    end
                    table.insert(v4, v9)
                else
                    v6 = true
                    for _, v12 in v7:split("|") do
                        local v13 = v12:match("^%s*(.-)%s*$")
                        local v14 = Enum.TextXAlignment.Center
                        if v13:find("^:%-+:$") then
                            v14 = Enum.TextXAlignment.Center
                        elseif v13:find("^:") then
                            v14 = Enum.TextXAlignment.Left
                        elseif v13:find(":$") then
                            v14 = Enum.TextXAlignment.Right
                        end
                        table.insert(v5, v14)
                    end
                end
            end
            p3.text = ""
            p3.data = {
                ["has_header"] = v6,
                ["alignments"] = v5,
                ["rows"] = v4
            }
        end
    },
    {
        ["capture"] = "^%s-<([^<>]+)>%s-$",
        ["block_type"] = "ignore",
        ["transform_block"] = function(p15)
            p15.text = ""
        end
    },
    {
        ["capture"] = "<([^<>]+)>",
        ["transform"] = ""
    }
}, v2)