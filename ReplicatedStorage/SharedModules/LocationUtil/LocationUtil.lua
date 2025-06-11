--// ReplicatedStorage.SharedModules.LocationUtil (ModuleScript)

return {
    ["is_same_location"] = function(p1, p2)
        if p1.destination_id == p2.destination_id then
            if p1.destination_id == "housing" then
                return p1.house_owner == p2.house_owner
            else
                return p1.full_destination_id == p2.full_destination_id
            end
        else
            return false
        end
    end
}