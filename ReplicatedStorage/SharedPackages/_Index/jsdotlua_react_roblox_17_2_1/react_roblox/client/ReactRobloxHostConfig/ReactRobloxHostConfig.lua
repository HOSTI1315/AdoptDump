--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxHostConfig (ModuleScript)

local v_u_1 = game:GetService("CollectionService")
local v2 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_3 = v2.util.inspect
local v_u_4 = require(script.Parent.Parent.Parent:WaitForChild("shared")).console
local v5 = v2.Object
local v6 = v2.setTimeout
local v7 = v2.clearTimeout
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local v8 = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local v_u_9 = v8.precacheFiberNode
local v_u_10 = v8.uncacheFiberNode
local v_u_11 = v8.updateFiberProps
local v12 = require(script.Parent:WaitForChild("ReactRobloxComponent"))
local v_u_13 = v12.setInitialProperties
local v_u_14 = v12.diffProperties
local v_u_15 = v12.updateProperties
local v_u_16 = v12.cleanupHostComponent
local v_u_17 = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableCreateEventHandleAPI
local v_u_18 = {}
v5.assign(v_u_18, require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFiberHostConfig.WithNoPersistence)
function v_u_18.getRootHostContext(p19)
    return p19.ClassName
end
function v_u_18.getChildHostContext(p20, _, _)
    return p20
end
function v_u_18.getPublicInstance(p21)
    return p21
end
function v_u_18.prepareForCommit(_)
    if v_u_17 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
    return nil
end
function v_u_18.beforeActiveInstanceBlur()
    if v_u_17 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end
function v_u_18.afterActiveInstanceBlur()
    if v_u_17 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end
function v_u_18.resetAfterCommit(_) end
function v_u_18.createInstance(p22, p23, _, _, p24)
    local v25 = Instance.new(p22)
    if p24.key then
        v25.Name = p24.key
    else
        local v26 = p24.return_
        while v26 do
            if v26.key then
                v25.Name = v26.key
                break
            end
            v26 = v26.return_
        end
    end
    v_u_9(p24, v25)
    v_u_11(v25, p23)
    return v25
end
function v_u_18.appendInitialChild(p27, p28)
    p28.Parent = p27
end
function v_u_18.finalizeInitialChildren(p29, p30, p31, p32, _)
    v_u_13(p29, p30, p31, p32)
    return false
end
function v_u_18.prepareUpdate(p33, p34, p35, p36, p37, _)
    return v_u_14(p33, p34, p35, p36, p37)
end
function v_u_18.shouldSetTextContent(_, _)
    return false
end
function v_u_18.createTextInstance(_, _, _, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"))
    error("FIXME (roblox): createTextInstance is unimplemented", 2)
    return nil
end
v_u_18.isPrimaryRenderer = true
v_u_18.warnsIfNotActing = true
v_u_18.scheduleTimeout = v6
v_u_18.cancelTimeout = v7
v_u_18.noTimeout = -1
v_u_18.supportsMutation = true
function v_u_18.commitMount(_, _, _, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
    error("FIXME (roblox): commitMount is unimplemented", 2)
end
function v_u_18.commitUpdate(p38, p39, _, p40, p41, _)
    v_u_11(p38, p41)
    v_u_15(p38, p39, p40)
end
local function v_u_43(p42)
    if typeof(p42) == "Instance" then
        if not p42:IsDescendantOf(game) and #v_u_1:GetTags(p42) > 0 then
            v_u_4.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you\'re relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", p42.ClassName, p42.Name)
        end
    else
        v_u_4.warn("Could not check tags on non-instance %s.", v_u_3(p42))
    end
end
function v_u_18.appendChild(p44, p45)
    p45.Parent = p44
    if _G.__DEV__ then
        v_u_43(p45)
    end
end
function v_u_18.appendChildToContainer(p46, p47)
    v_u_18.appendChild(p46, p47)
end
function v_u_18.insertBefore(p48, p49, _)
    p49.Parent = p48
    if _G.__DEV__ then
        v_u_43(p49)
    end
end
function v_u_18.insertInContainerBefore(p50, p51, p52)
    v_u_18.insertBefore(p50, p51, p52)
end
function v_u_18.removeChild(_, p53)
    if typeof(p53) == "Instance" then
        v_u_10(p53)
        for _, v54 in p53:GetDescendants() do
            v_u_10(v54)
        end
    end
    v_u_16(p53)
    p53.Parent = nil
    p53:Destroy()
end
function v_u_18.removeChildFromContainer(p55, p56)
    v_u_18.removeChild(p55, p56)
end
function v_u_18.clearSuspenseBoundary(_, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
    error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end
function v_u_18.clearSuspenseBoundaryFromContainer(_, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
    error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end
function v_u_18.hideInstance(_)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
    error("FIXME (roblox): hideInstance is unimplemented", 2)
end
function v_u_18.hideTextInstance(_)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
    error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end
function v_u_18.unhideInstance(_, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
    error("FIXME (roblox): unhideInstance is unimplemented", 2)
end
function v_u_18.unhideTextInstance(_, _)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
    error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end
function v_u_18.clearContainer(p57)
    for _, v58 in p57:GetChildren() do
        v_u_18.removeChild(p57, v58)
    end
end
function v_u_18.preparePortalMount(_) end
return v_u_18