--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.TooltipHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("new:StandardSequencePreviewClient")
local v_u_3 = v_u_1("BucksAgingMultiplierHelper")
local v_u_4 = v_u_1("PublicLootBoxRewards")
local v_u_5 = v_u_1("TooltipCertification")
local v_u_6 = v_u_1("PetProgressionDB")
local v_u_7 = v_u_1("PolicyHelper")
local v_u_8 = v_u_1("package:Sift")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v_u_9.LocalPlayer)
local v_u_11 = {
    ["rideable"] = "Can Ride",
    ["flyable"] = "Can Fly",
    ["neon"] = "Neon",
    ["mega_neon"] = "Mega Neon"
}
local v12 = {}
local function v_u_16(p13)
    local v14 = string.gsub(p13, "<b>", "")
    local v15 = string.gsub(v14, "</b>", "")
    return v_u_10:Translate(workspace, v15)
end
function v12.get_item_data_description(p17, p_u_18, p19, p20)
    local v21 = p20 or {}
    local v22 = v_u_7.get_policy_info(v_u_9.LocalPlayer).ArePaidRandomItemsRestricted
    local v23 = nil
    local v24 = {}
    if p_u_18.subscription_gifting then
        local v25 = p_u_18.subscription_gifting.duration or 2592000
        local v26 = v_u_5.format_duration(v25)
        local v27 = v_u_16
        table.insert(v24, v27(("(Lasts for %s)"):format(v26)))
    end
    if v22 then
        if v_u_2.is_restricted_lootbox_kind(p_u_18.kind) then
            v23 = p_u_18.kind
        end
    elseif p_u_18.is_egg then
        v23 = p_u_18.kind
        local v30, v31 = v_u_4.request():andThen(function(p28)
            local v29 = p28[p_u_18.kind]
            if v29 then
                return v_u_4.convert_rarity_chances_to_human_readable(v29)
            end
        end):now(nil):await()
        if v30 then
            table.insert(v24, v31)
        end
    elseif p_u_18.use_generated_public_lootbox_tooltip_description then
        v23 = p_u_18.kind
        local v33, v34 = v_u_4.request():andThen(function(p32)
            return v_u_4.convert_to_human_readable(p32[p_u_18.kind])
        end):now(nil):await()
        if v33 then
            table.insert(v24, v34)
        end
    elseif p_u_18.use_generated_public_lootbox_tooltip_description_rarities then
        v23 = p_u_18.kind
        local v39, v40 = v_u_4.request():andThen(function(p35)
            if not p_u_18.use_existing_rewards then
                return v_u_4.convert_rarity_chances_to_human_readable(p35[p_u_18.kind])
            end
            local v36 = {}
            for _, v37 in p_u_18.use_existing_rewards do
                local v38 = ("<b>Contains %* item%* of rarity:</b>\n"):format(v37.count, v37.count == 1 and "" or "s") .. v_u_4.convert_rarity_chances_to_human_readable(p35[v37.kind])
                table.insert(v36, v38)
            end
            return table.concat(v36, "\n\n")
        end):now(nil):await()
        if v39 then
            table.insert(v24, v40)
        end
    end
    if p_u_18.custom_tooltip_description then
        local v41 = p_u_18.custom_tooltip_description
        local v42
        if v_u_7.get_policy_info(v_u_9.LocalPlayer).ArePaidRandomItemsRestricted then
            v42 = string.gsub(v41, "%[if_lootboxes_random%](.-)%[/if_lootboxes_random%]", "")
        else
            v42 = string.gsub(v41, "%[if_lootboxes_random%](.-)%[/if_lootboxes_random%]", "%1")
        end
        local v43 = v_u_16
        table.insert(v24, v43(v42))
    end
    local v44 = {
        {},
        {},
        {},
        {}
    }
    local v45 = v_u_3.get_multiplier_for_pet(game.Players.LocalPlayer, {
        ["item"] = p17
    })
    if v45.aging and v45.aging ~= 1 then
        local v46 = v44[1]
        local v47 = v_u_16
        local v48 = ("%*x Aging Active"):format(v45.aging)
        table.insert(v46, v47(v48))
    end
    if v45.bucks and v45.bucks ~= 1 then
        local v49 = v44[1]
        local v50 = v_u_16
        local v51 = ("%*x Bucks Active"):format(v45.bucks)
        table.insert(v49, v50(v51))
    end
    if p19 and p19 > 99 then
        local v52 = v44[1]
        local v53 = v_u_16
        local v54 = "<b>Stack Count: </b>" .. p19
        table.insert(v52, v53(v54))
    end
    if p_u_18.category == "pets" then
        if not v21.force_display_post_trade_values and (p17.properties.rp_name and p17.properties.rp_name ~= "") then
            local v55 = v44[1]
            local v56 = v_u_16
            local v57 = "<b>RP Name:</b> " .. p17.properties.rp_name
            table.insert(v55, v56(v57))
        end
        if not p_u_18.is_egg then
            local v58 = p17.properties.friendship_level or 0
            if p17.properties.age == 6 or (p17.properties.neon or p17.properties.mega_neon) and v58 > 0 then
                local v59 = v44[1]
                local v60 = v_u_16
                local v61 = v21.force_display_post_trade_values and 0 or (p17.properties.friendship_level or 0)
                table.insert(v59, v60(("<b>\240\159\146\155 Friendship Level:</b> %s"):format(v61)))
            end
        end
        if not (p_u_18.is_egg or p17.properties.mega_neon) then
            if p17.properties.neon then
                local v62 = v_u_6.neon_age_names[p17.properties.age]
                if v62 then
                    local v63 = v44[1]
                    local v64 = v_u_16
                    table.insert(v63, v64(("<b>Age:</b> %s"):format(v62)))
                end
            else
                local v65 = v_u_6.age_names[p17.properties.age]
                if v65 then
                    local v66 = v44[1]
                    local v67 = v_u_16
                    table.insert(v66, v67(("<b>Age:</b> %s"):format(v65)))
                end
            end
        end
        if p17.properties.timed_flags then
            local v68 = p17.properties.timed_flags
            local v69 = v21.timed_flag_blacklist or {}
            if v68.potion_scale and v68.potion_scale.value then
                local v70 = v68.potion_scale.time_left / 60
                local v71 = math.floor(v70)
                if v68.potion_scale.value > 0 then
                    local v72 = v44[2]
                    local v73 = v_u_16
                    table.insert(v72, v73(("<b>Temp Big</b> (%s mins)"):format(v71)))
                else
                    local v74 = v44[2]
                    local v75 = v_u_16
                    table.insert(v74, v75(("<b>Temp Small</b> (%s mins)"):format(v71)))
                end
            end
            if v68.potion_translucency and v68.potion_translucency.value then
                local v76 = v68.potion_translucency.time_left / 60
                local v77 = math.floor(v76)
                local v78 = v44[2]
                local v79 = v_u_16
                table.insert(v78, v79(("<b>Temp Translucent</b> (%s mins)"):format(v77)))
            end
            if not v69.colored_hair_spray and (v68.colored_hair_spray and (v68.colored_hair_spray.value and #v68.colored_hair_spray.value.colors > 0)) then
                local v80 = ""
                for _, v81 in ipairs(v68.colored_hair_spray.value.colors) do
                    local v82 = Color3.new(unpack(v81))
                    local v83 = v82.r * 255
                    local v84 = math.round(v83)
                    local v85 = v82.g * 255
                    local v86 = math.round(v85)
                    local v87 = v82.b * 255
                    v80 = v80 .. ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v84, v86, math.round(v87), "\226\150\160")
                end
                local v88 = v68.colored_hair_spray.time_left / 60
                local v89 = math.floor(v88)
                local v90 = v44[2]
                local v91 = v_u_16
                table.insert(v90, v91(("<b>Temp Colored Hair Spray</b> %s (%s mins)"):format(v80, v89)))
            end
        end
        if p17.properties.sealed_colors then
            local v92 = ""
            for _, v93 in p17.properties.sealed_colors do
                local v94 = Color3.new(unpack(v93))
                local v95 = v94.r * 255
                local v96 = math.round(v95)
                local v97 = v94.g * 255
                local v98 = math.round(v97)
                local v99 = v94.b * 255
                v92 = v92 .. ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v96, v98, math.round(v99), "\226\150\160")
            end
            local v100 = v44[2]
            local v101 = v_u_16
            table.insert(v100, v101(("<b>Permanent Hair Spray</b> %s"):format(v92)))
        end
    end
    if p_u_18.uses then
        local v102 = v44[2]
        local v103 = v_u_16
        local v104 = "<b>Uses Left:</b> " .. (p17.properties.uses_left or p_u_18.uses)
        table.insert(v102, v103(v104))
    end
    if p17.properties.color then
        local v105 = Color3.new
        local v106 = p17.properties.color
        local v107 = v105(unpack(v106))
        local v108 = v44[2]
        local v109 = v_u_16
        local v110 = v107.r * 255
        local v111 = math.round(v110)
        local v112 = v107.g * 255
        local v113 = math.round(v112)
        local v114 = v107.b * 255
        local v115 = "<b>Color:</b> " .. ("<font color= \"rgb(%s, %s, %s)\">%s</font>"):format(v111, v113, math.round(v114), "\226\150\160")
        table.insert(v108, v109(v115))
    end
    if p_u_18.category == "houses" then
        if p17.properties.furniture_quantity then
            local v116 = v_u_16
            local v117 = "<b>Furniture Count:</b> " .. p17.properties.furniture_quantity
            table.insert(v24, v116(v117))
        end
        if p_u_18.addons then
            local v118 = p17.properties.active_addons or {}
            local v119 = v_u_8.Dictionary.keys(v118)
            table.sort(v119, function(p120, p121)
                return p_u_18.addons[p120].order < p_u_18.addons[p121].order
            end)
            local v122 = {}
            local v123 = v_u_16
            local v124 = "<b>AddOns:</b> " .. #v119
            table.insert(v122, v123(v124))
            for _, v125 in v119 do
                local v126 = p_u_18.addons[v125].name
                local v127 = string.gsub(v126, "<b>", "")
                local v128 = string.gsub(v127, "</b>", "")
                local v129 = "<b>-</b> " .. v_u_10:Translate(workspace, v128)
                table.insert(v122, v129)
            end
            local v130 = table.concat
            table.insert(v24, v130(v122, "\n"))
        end
    end
    if p17.properties.pizza then
        local v_u_131 = p17.properties.pizza
        local function v135()
            local v132 = {}
            for v133 in v_u_131.toppings do
                local v134 = v_u_16
                table.insert(v132, v134(v133))
            end
            table.sort(v132)
            return table.concat(v132, ", ")
        end
        local v136 = nil
        if v_u_131.state == "Dough" then
            local v137 = string.gsub("Dough", "<b>", "")
            local v138 = string.gsub(v137, "</b>", "")
            v136 = v_u_10:Translate(workspace, v138)
        else
            if v_u_131.state == "Uncooked" then
                v136 = string.format("%s (%s)", v135(), v_u_16("Uncooked"))
            elseif v_u_131.state == "Cooked" then
                v136 = v135()
                if v_u_131.boxed then
                    local v139 = string.gsub("in a box", "<b>", "")
                    local v140 = string.gsub(v139, "</b>", "")
                    v136 = v136 .. " " .. v_u_10:Translate(workspace, v140)
                elseif v_u_131.plated then
                    local v141 = string.gsub("on a plate", "<b>", "")
                    local v142 = string.gsub(v141, "</b>", "")
                    v136 = v136 .. " " .. v_u_10:Translate(workspace, v142)
                end
            end
            if v_u_131.bites_remaining then
                local v143 = string.format("%d bites left", v_u_131.bites_remaining)
                local v144 = string.gsub(v143, "<b>", "")
                local v145 = string.gsub(v144, "</b>", "")
                v136 = v136 .. " (" .. v_u_10:Translate(workspace, v145) .. ")"
            end
        end
        local v146 = v44[2]
        table.insert(v146, v136)
    end
    local v147 = {}
    for v148, v149 in pairs(v_u_11) do
        if p17.properties[v148] then
            table.insert(v147, v149)
        end
    end
    for v150, v151 in pairs(v147) do
        local v152 = string.gsub(v151, "<b>", "")
        local v153 = string.gsub(v152, "</b>", "")
        v147[v150] = v_u_10:Translate(workspace, v153)
    end
    if #v147 > 0 then
        local v154 = v44[3]
        local v155 = table.concat
        table.insert(v154, v155(v147, ", "))
    end
    local v156 = {}
    if p_u_18.temporary then
        local v157 = string.gsub("Doesn\'t Save", "<b>", "")
        local v158 = string.gsub(v157, "</b>", "")
        local v159 = "[" .. v_u_10:Translate(workspace, v158) .. "]"
        table.insert(v156, v159)
    end
    local v160 = v_u_1("ItemHider")
    local v161 = v160.is_item_tradeable(p_u_18, p17)
    if not v161 then
        local v162 = string.gsub("Untradable", "<b>", "")
        local v163 = string.gsub(v162, "</b>", "")
        local v164 = "[" .. v_u_10:Translate(workspace, v163) .. "]"
        table.insert(v156, v164)
    end
    local v165 = v160.is_item_equippable(p_u_18)
    if not v165 then
        local v166 = string.gsub("Unequippable", "<b>", "")
        local v167 = string.gsub(v166, "</b>", "")
        local v168 = "[" .. v_u_10:Translate(workspace, v167) .. "]"
        table.insert(v156, v168)
    end
    local v169 = not (v161 and v165) and (v160.get_equippable_timestamp(p_u_18) or v160.get_tradeable_timestamp(p_u_18, p17))
    if v169 then
        local v170 = DateTime.fromUnixTimestamp(v169):FormatLocalTime("lll", v_u_10.LocaleId)
        table.insert(v156, ("[%s]"):format(v170))
    end
    if #v156 > 0 then
        local v171 = v44[4]
        local v172 = table.concat
        table.insert(v171, v172(v156, " "))
    end
    for _, v173 in ipairs(v44) do
        if #v173 > 0 then
            local v174 = table.concat(v173, "\n")
            table.insert(v24, v174)
        end
    end
    if v22 then
        if v23 then
            local v175 = v_u_1("new:StandardSequencePreviewClient").get_disclosure_text
            table.insert(v24, v175(true))
        end
    else
        v23 = nil
    end
    return {
        ["paragraphs"] = v24,
        ["empty"] = #table.concat(v24, "") == 0,
        ["lootbox_info_target"] = v23
    }
end
return v12