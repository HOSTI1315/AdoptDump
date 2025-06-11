--// ReplicatedStorage.new.modules.PetRigs (ModuleScript)

require(script.PetRig)
local v_u_4 = {
    ["Rigs"] = {
        ["R15"] = require(script.R15PetRig),
        ["Custom"] = require(script.CustomPetRig)
    },
    ["get"] = function(p1)
        local v2 = p1:GetAttribute("RigType")
        local v3
        if v2 then
            v3 = v_u_4.Rigs[v2]
        else
            v3 = nil
        end
        if v3 then
            return v3
        end
        error((("PetModel %* is not a valid pet rig. It needs a \"RigType\" attribute."):format(p1)))
    end
}
return v_u_4