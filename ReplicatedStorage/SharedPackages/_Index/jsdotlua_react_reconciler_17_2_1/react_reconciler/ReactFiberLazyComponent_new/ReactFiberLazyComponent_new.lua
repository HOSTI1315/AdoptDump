--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLazyComponent.new (ModuleScript)

return {
    ["resolveDefaultProps"] = function(p1, p2)
        if not p1 or (typeof(p1) ~= "table" or not p1.defaultProps) then
            return p2
        end
        local v3 = table.clone(p2)
        local v4 = p1.defaultProps
        for v5, _ in v4 do
            if v3[v5] == nil then
                v3[v5] = v4[v5]
            end
        end
        return v3
    end
}