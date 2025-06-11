--// ReplicatedStorage.ClientDB.EmotesDB (ModuleScript)

local v1 = {
    ["categories"] = {
        ["emotions"] = "Emotions",
        ["actions"] = "Actions",
        ["activities"] = "Activities",
        ["dances"] = "Dances"
    }
}
local v2 = {
    ["backflip"] = {
        ["animation"] = "EmoteBackflip",
        ["name"] = "Backflip",
        ["category"] = "activities"
    },
    ["fashion_pose"] = {
        ["animation"] = "EmoteFashionPose",
        ["name"] = "Fashion Pose",
        ["category"] = "activities"
    },
    ["jumping_jacks"] = {
        ["animation"] = "EmoteJumpingJacks",
        ["name"] = "Jumping Jacks",
        ["category"] = "activities"
    },
    ["dance1"] = {
        ["animation"] = "EmoteDance",
        ["name"] = "Dance 1",
        ["category"] = "dances"
    },
    ["dance2"] = {
        ["animation"] = "EmoteDance2",
        ["name"] = "Dance 2",
        ["category"] = "dances"
    },
    ["dance3"] = {
        ["animation"] = "EmoteDance3",
        ["name"] = "Dance 3",
        ["category"] = "dances"
    },
    ["dance4"] = {
        ["animation"] = "EmoteDance4",
        ["name"] = "Dance 4",
        ["category"] = "dances"
    },
    ["bow"] = {
        ["animation"] = "EmoteBow",
        ["name"] = "Bow",
        ["category"] = "actions"
    },
    ["clap"] = {
        ["animation"] = "EmoteClap",
        ["name"] = "Clap",
        ["category"] = "actions"
    },
    ["salute"] = {
        ["animation"] = "EmoteSalute",
        ["name"] = "Salute",
        ["category"] = "actions"
    },
    ["sit"] = {
        ["animation"] = "EmoteSit",
        ["name"] = "Sit",
        ["category"] = "actions"
    },
    ["yes"] = {
        ["animation"] = "EmoteYes",
        ["name"] = "Yes",
        ["category"] = "emotions"
    },
    ["confused"] = {
        ["animation"] = "EmoteConfused",
        ["name"] = "Confused",
        ["category"] = "emotions"
    },
    ["facepalm"] = {
        ["animation"] = "EmoteFacepalm",
        ["name"] = "Facepalm",
        ["category"] = "emotions"
    }
}
v1.emotes = v2
return v1