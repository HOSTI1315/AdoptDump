--// ReplicatedStorage.SharedPackages._Index.corecii_greentea@0.4.9.greentea (ModuleScript)

local v1 = require(script.GreenTea)
local v2 = require(script.InstanceClasses)
local v3 = {
    ["t"] = require(script.tCompat),
    ["isGreenTeaType"] = v1.isGreenTeaType,
    ["isGtType"] = v1.isGtType,
    ["any"] = v1.any,
    ["unknown"] = v1.unknown,
    ["never"] = v1.never,
    ["boolean"] = v1.boolean,
    ["bool"] = v1.bool,
    ["Instance"] = v1.Instance,
    ["isA"] = v2,
    ["IsA"] = v2,
    ["coroutine"] = v1.coroutine,
    ["thread"] = v1.thread,
    ["buffer"] = v1.buffer,
    ["userdata"] = v1.userdata,
    ["Vector2"] = v1.Vector2,
    ["vector"] = v1.vector,
    ["Vector3"] = v1.Vector3,
    ["CFrame"] = v1.CFrame,
    ["Color3"] = v1.Color3,
    ["UDim"] = v1.UDim,
    ["UDim2"] = v1.UDim2,
    ["Ray"] = v1.Ray,
    ["Rect"] = v1.Rect,
    ["Region3"] = v1.Region3,
    ["BrickColor"] = v1.BrickColor,
    ["Font"] = v1.Font,
    ["Enum"] = v1.Enum,
    ["EnumItem"] = v1.EnumItem,
    ["none"] = v1.none,
    ["literal"] = v1.literal,
    ["withCustom"] = v1.withCustom,
    ["custom"] = v1.custom,
    ["number"] = v1.number,
    ["string"] = v1.string,
    ["isTypeof"] = v1.isTypeof,
    ["isType"] = v1.isType,
    ["vararg"] = v1.vararg,
    ["tuple"] = v1.tuple,
    ["args"] = v1.args,
    ["returns"] = v1.returns,
    ["fn"] = v1.fn,
    ["anyfn"] = v1.anyfn,
    ["tuplePacked"] = v1.tuplePacked,
    ["table"] = v1.table,
    ["struct"] = v1.struct,
    ["anyTable"] = v1.anyTable,
    ["array"] = v1.array,
    ["dictionary"] = v1.dictionary,
    ["union"] = v1.union,
    ["oneOf"] = v1.oneOf,
    ["intersection"] = v1.intersection,
    ["allOf"] = v1.allOf,
    ["optional"] = v1.optional,
    ["opt"] = v1.opt,
    ["typeof"] = v1.typeof,
    ["typecast"] = v1.typecast,
    ["asGreenTeaType"] = v1.asGreenTeaType,
    ["asGtType"] = v1.asGtType,
    ["build"] = v1.build,
    ["meta"] = v1.meta
}
table.freeze(v3)
table.freeze(v3.isA)
table.freeze(v3.t)
table.freeze(v1.__Cause)
table.freeze(v1.__Type)
for v4, v5 in v3 do
    v1.__greenteaConstructorsSet[v5] = ("GreenTea.%*"):format(v4)
end
for v6, v7 in pairs(v3.isA) do
    v1.__greenteaConstructorsSet[v7] = ("GreenTea.isA.%*"):format(v6)
end
for v8, v9 in pairs(v3.t) do
    v1.__greenteaConstructorsSet[v9] = ("GreenTea.t.%*"):format(v8)
end
return v3