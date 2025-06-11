--// ReplicatedStorage.new.modules.RichText.TokenFinders.Markdown (ModuleScript)

require(script.Parent.Parent.RichTextHelper)
return {
    {
        ["capture"] = "^>%s*(.+)",
        ["block_type"] = "blockquote"
    },
    {
        ["capture"] = "^%-%-+$",
        ["block_type"] = "horizontal_rule",
        ["transform_block"] = function(p1)
            p1.text = ""
        end
    },
    {
        ["capture"] = "^(%s*)[%*%-]%s+(.+)",
        ["transform"] = " %1\226\128\162 %2",
        ["can_adjust_indentation"] = true
    },
    {
        ["capture"] = "^(%s*)(%d-)%.%s+(.+)",
        ["transform"] = " %1%2. %3",
        ["can_adjust_indentation"] = true
    },
    {
        ["capture"] = "%*%*%*(.-)%*%*%*",
        ["rule_name"] = "bold_italic"
    },
    {
        ["capture"] = "%*%*(.-)%*%*",
        ["rule_name"] = "bold"
    },
    {
        ["capture"] = "%*(.-)%*",
        ["rule_name"] = "italic"
    },
    {
        ["capture"] = "~~?(.-)~~?",
        ["rule_name"] = "strikethrough"
    },
    {
        ["capture"] = "`(.-)`",
        ["rule_name"] = "code"
    },
    {
        ["capture"] = "^%s*######%s+(.+)",
        ["rule_name"] = "heading_6"
    },
    {
        ["capture"] = "^%s*#####%s+(.+)",
        ["rule_name"] = "heading_5"
    },
    {
        ["capture"] = "^%s*####%s+(.+)",
        ["rule_name"] = "heading_4"
    },
    {
        ["capture"] = "^%s*###%s+(.+)",
        ["rule_name"] = "heading_3"
    },
    {
        ["capture"] = "^%s*##%s+(.+)",
        ["rule_name"] = "heading_2"
    },
    {
        ["capture"] = "^%s*#%s+(.+)",
        ["rule_name"] = "heading_1"
    }
}