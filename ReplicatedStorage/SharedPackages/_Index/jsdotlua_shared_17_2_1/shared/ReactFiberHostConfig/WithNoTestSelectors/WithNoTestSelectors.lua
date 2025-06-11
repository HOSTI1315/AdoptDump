--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoTestSelectors (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("invariant"))
local function v2(...)
    v_u_1(false, "The current renderer does not support test selectors. This error is likely caused by a bug in React. Please file an issue.")
end
return {
    ["supportsTestSelectors"] = false,
    ["findFiberRoot"] = v2,
    ["getBoundingRect"] = v2,
    ["getTextContent"] = v2,
    ["isHiddenSubtree"] = v2,
    ["matchAccessibilityRole"] = v2,
    ["setFocusIfFocusable"] = v2,
    ["setupIntersectionObserver"] = v2
}