--// ReplicatedStorage.new.modules.LegacyServiceLoader (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
local function v_u_7(p3, p4, p5, p6)
    if not v_u_1:IsClient() then
        require(game.ReplicatedStorage.Fsys).load("ErrorLog").log({
            ["origin"] = "LegacyServiceLoader",
            ["error"] = p5,
            ["stack_trace"] = p6,
            ["folder_name"] = p3.Name,
            ["service_name"] = p4
        })
    end
end
function v_u_2.run_services(p_u_8)
    local v_u_9 = require(game.ReplicatedStorage.Fsys).load
    local v10 = v_u_9("package:Promise")
    local v11 = {}
    local function v_u_18(p12, p13)
        local v14 = p12:GetChildren()
        table.sort(v14, function(p15, p16)
            return p15.Name < p16.Name
        end)
        for _, v17 in v14 do
            if v17:IsA("ModuleScript") then
                table.insert(p13, v17)
            else
                v_u_18(v17, p13)
            end
        end
    end
    v_u_18(p_u_8, v11)
    local v_u_19 = nil
    local v_u_20 = nil
    local v22 = v10.delay(30):andThen(function()
        local v21
        if v_u_20 then
            v21 = debug.traceback(v_u_20)
        else
            v21 = nil
        end
        v_u_7(p_u_8, v_u_19, "timeout", v21)
    end)
    local v_u_23 = v_u_20
    for _, v_u_24 in v11 do
        v_u_19 = v_u_24.Name
        v10.try(function()
            v_u_23 = coroutine.running()
            v_u_9(v_u_24.Name)
        end):catch(function(p25)
            v_u_7(p_u_8, v_u_19, p25)
        end):await()
    end
    v22:cancel()
end
function v_u_2.run_services_by_order(p26)
    local v27 = {}
    for _, v28 in p26:GetChildren() do
        if v28:IsA("Folder") then
            local v29 = string.match(v28.Name, "^Order_(%d+)$")
            if v29 then
                local v30 = {}
                local v31 = tonumber(v29)
                v30.num = assert(v31)
                v30.folder = v28
                table.insert(v27, v30)
            end
        end
    end
    table.sort(v27, function(p32, p33)
        return p32.num < p33.num
    end)
    for _, v34 in v27 do
        v_u_2.run_services(v34.folder)
    end
    v_u_2.run_services(p26)
end
function v_u_2.run_services_by_frame_folders(p35)
    local v36 = {}
    for _, v37 in p35:GetChildren() do
        if v37:IsA("Folder") then
            local v38 = string.match(v37.Name, "^Frame_(%d+)$")
            if v38 then
                local v39 = {}
                local v40 = tonumber(v38)
                v39.num = assert(v40)
                v39.folder = v37
                table.insert(v36, v39)
            end
        end
    end
    table.sort(v36, function(p41, p42)
        return p41.num < p42.num
    end)
    local v43 = 1
    for _, v44 in v36 do
        while v43 < v44.num do
            task.wait()
            v43 = v43 + 1
        end
        v_u_2.run_services_by_order(v44.folder)
    end
    v_u_2.run_services_by_order(p35)
end
return v_u_2