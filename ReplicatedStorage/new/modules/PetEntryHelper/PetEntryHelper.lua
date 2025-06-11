--// ReplicatedStorage.new.modules.PetEntryHelper (ModuleScript)

return {
    ["get_anims"] = function(p1)
        if not p1.transforming_pet then
            return p1.anims
        end
        local v2 = p1.transforming_pet.get_form()
        return p1.transforming_pet.forms[v2].anims
    end,
    ["get_tricks"] = function(p3)
        if not p3.transforming_pet then
            return p3.tricks
        end
        local v4 = p3.transforming_pet.get_form()
        return p3.transforming_pet.forms[v4].tricks
    end
}