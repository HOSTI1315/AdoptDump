--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.HatShopLegendaryDisplay (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("SharedConstants")
local v_u_2 = v1("PetAvatarItemDB")
local v3 = v1("PlatformM")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RarityDB")
local v6 = v1("Maid")
local v7 = game:GetService("Players")
local v_u_8 = game:GetService("HttpService")
local v_u_9 = game:GetService("LocalizationService"):GetTranslatorForPlayer(v7.LocalPlayer)
local v_u_10 = v1("package:Sift")
local v_u_11 = v3.get_platform() == v3.platform.desktop
local v12 = {}
local v_u_13 = {}
local v_u_14 = nil
local v_u_15 = v6.new()
function v12.render(p16, _)
    local v17 = { p16.LegendaryChests.Visual.ChestSign1.SignFace.SurfaceGui.Label, p16.LegendaryChests.Visual.ChestSign2.SignFace.SurfaceGui.Label }
    for _, v18 in ipairs(v17) do
        local v19 = v18:GetAttribute("GiftDBEntry")
        local v20 = v19 and v_u_8:JSONDecode(v19) or {}
        local v21 = {}
        for v22, v23 in pairs(v20) do
            local v24 = v_u_5[v22]
            local v25 = v_u_9:Translate(workspace, v24.name)
            local v26 = v23 * 10000
            local v27 = math.floor(v26) / 100
            local v28 = v_u_5[v22].color
            local v29 = v28.r * 255
            local v30 = math.floor(v29)
            local v31 = v28.g * 255
            local v32 = math.floor(v31)
            local v33 = v28.b * 255
            local v34 = ("<font color=\"rgb(%d,%d,%d)\">%s</font>"):format(v30, v32, math.floor(v33), v27 .. "% " .. v25)
            v21[v24.value] = v34
        end
        v18.RichText = true
        v18.AutoLocalize = false
        v18.Text = table.concat(v21, "\n")
    end
    local v35 = p16.LegendaryChests.LegendaryHatSign
    local v36 = v35.Display.SurfaceGui.Frame.Body.ScrollComplex.ScrollingFrame
    local v_u_37 = v36.Content
    local v_u_38 = v_u_37.ItemTemplate
    v_u_38.Parent = nil
    if v_u_11 then
        v_u_14:set_mouse_leave_frame(v35.Display.SurfaceGui.Frame)
    end
    for v39, v40 in ipairs(v_u_13) do
        local v41 = v_u_38:Clone()
        v41.ItemImage.Image = v40.image
        v41.LayoutOrder = v39
        v41.Parent = v_u_37
        if v_u_11 then
            v_u_15:GiveTask((v_u_14:hook_on_hover({
                ["frame"] = v41,
                ["type"] = "item_entry",
                ["item_entry"] = v40
            })))
        end
        v_u_15:GiveTask(v41)
    end
    v36.CanvasSize = UDim2.new(0, 0, 0, v_u_37.UIGridLayout.AbsoluteContentSize.Y + 30)
    v_u_15:GiveTask(function()
        v_u_38.Parent = v_u_37
    end)
end
function v12.cleanup(_, _)
    v_u_15:DoCleaning()
end
function v12.init()
    v_u_13 = v_u_10.Dictionary.values(v_u_2.find_accessory_entries_with_tags({ "GiftHatNov2024ChestItem" }))
    table.sort(v_u_13, function(p42, p43)
        local v44 = v_u_5[p42.rarity]
        local v45 = v_u_5[p43.rarity]
        if v44.value == v45.value then
            return p42.name < p43.name
        else
            return v44.value < v45.value
        end
    end)
    if v_u_11 then
        local v46 = v_u_4.apps.TooltipApp
        v_u_14 = v_u_4.wrap(v46.instance, "ItemTooltip"):start(v46, v46.instance)
    end
end
return v12