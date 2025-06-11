--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Dialog (ModuleScript)

local v1 = {}
local v2 = {}
local v3 = {
    ["text"] = {
        ["named"] = "PET is so excited to meet you!",
        ["unnamed"] = "Your PET is so excited to meet you!"
    },
    ["length"] = 3
}
local v4 = {
    ["text"] = {
        ["named"] = "When PET wants something, just give them a tap!",
        ["unnamed"] = "When your PET wants something, just give them a tap!"
    },
    ["length"] = 4
}
__set_list(v2, 1, {v3, {
    ["text"] = "Looks like they want some love in return.",
    ["length"] = 4
}, v4})
local v5 = {}
local v6 = {
    ["text"] = {
        ["named"] = "When you help PET, you get Bucks and they get XP!",
        ["unnamed"] = "When you help your PET, you get Bucks and they get XP!"
    },
    ["length"] = 4
}
local v7 = {
    ["text"] = {
        ["named"] = "PET looks hungry! Do you have a treat?",
        ["unnamed"] = "Your PET looks hungry! Do you have a treat?"
    },
    ["length"] = 4
}
__set_list(v5, 1, {{
    ["text"] = "Amazing! You two were made for each other!",
    ["length"] = 3
}, v6, v7})
local v8 = {}
local v9 = {
    ["text"] = {
        ["named"] = "Go out and explore Adoption Island with PET!",
        ["unnamed"] = "Go out and explore Adoption Island with your PET!"
    },
    ["length"] = 3
}
__set_list(v8, 1, {{
    ["text"] = "I can see you\'ll take good care of your pets.",
    ["length"] = 3
}, v9, {
    ["text"] = "If you ever get lost, just check your Task Board!",
    ["length"] = 4
}})
__set_list(v1, 1, {{
    {
        ["text"] = "Welcome to Adopt Me!"
    },
    {
        ["text"] = "Ready to adopt a fluffy puppy or cuddly kitten?"
    }
}, v2, v5, v8, {
    {
        ["text"] = "Why hello there human!",
        ["length"] = 3
    },
    {
        ["text"] = "You look like the type of chap who\'d help a friend out!",
        ["length"] = 5.5
    },
    {
        ["text"] = "I can see you\'ll take good care of your pets.",
        ["length"] = 4
    }
}})
return v1