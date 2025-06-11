--// ReplicatedStorage.new.modules.BugScreenshotHelper (ModuleScript)

local v_u_1 = game:GetService("CaptureService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("StarterGui")
local v_u_5 = require(script.Parent.LegacyLoad)
local v_u_6 = v_u_5("PlatformM")
local v_u_7 = v_u_5("Maid")
local v_u_8 = v_u_5("package:Promise4")
local function v_u_16(p_u_9)
    return v_u_8.new(function(p_u_10, p_u_11)
        v_u_1:PromptSaveCapturesToGallery(p_u_9, function(p12)
            local v13 = 0
            local v14 = 0
            for _, v15 in p12 do
                v13 = v13 + 1
                if v15 then
                    v14 = v14 + 1
                end
            end
            if v13 == v14 then
                p_u_10()
                return
            elseif v14 == 0 then
                p_u_11("User rejected")
            else
                p_u_11("Save failure")
            end
        end)
    end)
end
local function v_u_23(p_u_17)
    local v_u_18 = {}
    local v20, v21 = pcall(function()
        local v19 = v_u_5("UIManager")
        v_u_18 = table.pack(p_u_17(v19))
    end)
    if not v20 then
        warn(v21)
    end
    local v22 = v_u_18
    return v20, table.unpack(v22)
end
local function v_u_34()
    local v_u_24 = v_u_7.new()
    local v_u_25 = Instance.new("ScreenGui")
    v_u_25.Name = "BugScreenshotWatermark"
    v_u_25.DisplayOrder = (1 / 0)
    v_u_25.IgnoreGuiInset = true
    v_u_25.Parent = v_u_2.LocalPlayer.PlayerGui
    v_u_24:GiveTask(v_u_25)
    if not v_u_23(function(p26)
        local v28 = p26.wrap(v_u_25, "Watermark"):start(function(p27)
            return {
                {
                    ["name"] = "PlaceName",
                    ["text_size"] = 30,
                    ["value"] = p27.place_name
                },
                {
                    ["name"] = "GameId",
                    ["text_size"] = 15,
                    ["value"] = p27.game_id
                },
                {
                    ["name"] = "UserName",
                    ["text_size"] = 30,
                    ["value"] = p27.user_name
                },
                {
                    ["name"] = "UserId",
                    ["text_size"] = 15,
                    ["value"] = p27.user_id
                },
                {
                    ["name"] = "Date",
                    ["text_size"] = 15,
                    ["value"] = DateTime.now():FormatUniversalTime("YYYY-MM-DD", "en-us")
                }
            }
        end)
        v28:set_visible(true)
        v_u_24:GiveTask(v28)
    end) then
        local v29 = v_u_2.LocalPlayer.Name
        local v30 = v_u_2.LocalPlayer.UserId
        local v31 = tostring(v30)
        local v32 = Instance.new("TextLabel")
        v32.Size = UDim2.new(1, 0, 1, 0)
        v32.BackgroundTransparency = 1
        v32.Text = ("[%s] @%s"):format(v31, v29)
        v32.TextColor3 = Color3.new(1, 1, 1)
        v32.TextSize = 24
        v32.TextStrokeTransparency = 0
        v32.TextXAlignment = Enum.TextXAlignment.Center
        v32.TextYAlignment = Enum.TextYAlignment.Center
        v32.Parent = v_u_25
    end
    local v_u_33 = false
    return function()
        if not v_u_33 then
            v_u_24:DoCleaning()
            v_u_33 = true
        end
    end
end
return {
    ["is_enabled"] = function()
        return v_u_3:IsStudio() and true or v_u_6.run({
            ["default"] = function()
                return false
            end,
            ["phone"] = function()
                return true
            end,
            ["tablet"] = "phone"
        })
    end,
    ["capture"] = function()
        local v_u_35 = {}
        local function v_u_38(p36)
            local v37 = v_u_35
            table.insert(v37, p36)
        end
        local v_u_39 = true
        local v_u_40 = v_u_34()
        local v45 = v_u_8.try(function()
            return v_u_8.new(function(p_u_41)
                v_u_1:CaptureScreenshot(function(p42)
                    p_u_41(p42)
                end)
            end):andThen(v_u_38)
        end):andThen(function()
            v_u_4:SetCore("DevConsoleVisible", true)
            return v_u_8.delay(0.1)
        end):andThen(function()
            return v_u_8.new(function(p_u_43)
                v_u_1:CaptureScreenshot(function(p44)
                    p_u_43(p44)
                end)
            end):andThen(v_u_38)
        end):andThen(function()
            v_u_4:SetCore("DevConsoleVisible", false)
            v_u_40()
            return v_u_16(v_u_35)
        end):catch(function(_)
            v_u_39 = false
        end):await()
        v_u_4:SetCore("DevConsoleVisible", false)
        v_u_40()
        if v45 and v_u_39 then
            v_u_23(function(p46)
                p46.apps.DialogApp:dialog({
                    ["dialog_type"] = "ImageDialog",
                    ["image"] = "rbxassetid://16491436192",
                    ["text"] = "Find your screenshots in the Roblox Capture Gallery!",
                    ["button"] = "Okay!"
                })
            end)
        end
    end
}