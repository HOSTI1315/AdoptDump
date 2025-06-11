--// ReplicatedStorage.CmdrClient.Types.banReason (ModuleScript)

return function(p1)
    p1:RegisterType("banReason", p1.Cmdr.Util.MakeEnumType("Ban Reason", {
        {
            ["Name"] = "Custom"
        },
        {
            ["Name"] = "RealMoneyTrading",
            ["Reason"] = "Association with Real-Money Item Sellers",
            ["Code"] = "101"
        },
        {
            ["Name"] = "Scamming",
            ["Reason"] = "Attempting to scam another player using the in-game trading system",
            ["Code"] = "104"
        },
        {
            ["Name"] = "AccountTrading",
            ["Reason"] = "Attempting to trade a Roblox account password",
            ["Code"] = "105"
        },
        {
            ["Name"] = "ThirdPartyWebsites",
            ["Reason"] = "Using third party website in order to sell/purchase Adopt Me items.",
            ["Code"] = "106"
        },
        {
            ["Name"] = "ObtainedUnobtainableItem",
            ["Reason"] = "Having an impossible item in inventory.",
            ["Code"] = "242"
        },
        {
            ["Name"] = "EvadingBan",
            ["Reason"] = "Evading a permanent ban",
            ["Code"] = "251"
        },
        {
            ["Name"] = "HelpingFriendEvadeBan_1st",
            ["Reason"] = "Helping a banned player avoid the consequences of their ban",
            ["Code"] = "252"
        },
        {
            ["Name"] = "HelpingFriendEvadeBan_2nd",
            ["Reason"] = "Helping a banned player avoid the consequences of their ban",
            ["Code"] = "252.1"
        },
        {
            ["Name"] = "HelpingFriendEvadeBan_3rd",
            ["Reason"] = "Helping a banned player avoid the consequences of their ban",
            ["Code"] = "252.2"
        },
        {
            ["Name"] = "SocialMediaScamming",
            ["Reason"] = "Scamming or promoting scamming on social media",
            ["Code"] = "315"
        },
        {
            ["Name"] = "SpreadingMisinformation",
            ["Reason"] = "Banned for spreading rumors and misinformation outside of Adopt Me",
            ["Code"] = "319"
        },
        {
            ["Name"] = "HackingPlayers",
            ["Reason"] = "Accessing another player\'s account to steal items",
            ["Code"] = "450"
        },
        {
            ["Name"] = "CreatingScamGame",
            ["Reason"] = "Scamming players / Cross-trading",
            ["Code"] = "465"
        },
        {
            ["Name"] = "ImpersonatingStaff",
            ["Reason"] = "Impersonating staff, admins or developers",
            ["Code"] = "466"
        },
        {
            ["Name"] = "PromotingSupportFormExploitation",
            ["Reason"] = "Promoting support form exploitation",
            ["Code"] = "510"
        },
        {
            ["Name"] = "AbusingExploits",
            ["Reason"] = "Using exploits for personal gain",
            ["Code"] = "597"
        },
        {
            ["Name"] = "BotAccountExploit",
            ["Reason"] = "Using exploits to circumvent intended gameplay mechanics",
            ["Code"] = "597.1"
        },
        {
            ["Name"] = "Gambling",
            ["Reason"] = "Engaging in experiences/third-party sites encouraging gambling of Adopt Me items",
            ["Code"] = "777"
        },
        {
            ["Name"] = "Harassment",
            ["Reason"] = "Harassing other players in-game, or in the Adopt Me Community",
            ["Code"] = "808"
        },
        {
            ["Name"] = "ExplicitMessages",
            ["Reason"] = "Sharing harmful messages or media in-game or in the Adopt Me Community",
            ["Code"] = "809"
        },
        {
            ["Name"] = "InappropriateChat",
            ["Reason"] = "Inappropriate behavior in Adopt Me\'s public chat",
            ["Code"] = "810"
        },
        {
            ["Name"] = "AbusingStaff",
            ["Reason"] = "Harassing a member of Staff",
            ["Code"] = "811"
        },
        {
            ["Name"] = "InappropriateProfile",
            ["Reason"] = "Inappropriate Player Profile",
            ["Code"] = "812"
        },
        {
            ["Name"] = "TermsViolation",
            ["Reason"] = "Violating the Adopt Me Terms of Service",
            ["Code"] = "901"
        },
        {
            ["Name"] = "SuspiciousActivity",
            ["Reason"] = "Suspicious activity",
            ["Code"] = "902"
        },
        {
            ["Name"] = "AbusingSupportForm",
            ["Reason"] = "Abusing the player support form",
            ["Code"] = "905"
        }
    }))
end