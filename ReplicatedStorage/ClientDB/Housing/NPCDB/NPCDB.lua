--// ReplicatedStorage.ClientDB.Housing.NPCDB (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("InventoryDB")
local v3 = v1("ContentPackHelper")
local v4 = {
    ["doug"] = {
        ["name"] = "Doug",
        ["dialogs"] = {
            {
                "Woof! Woof!",
                1.2,
                "*He looks at egg and points*",
                2,
                "Woof! *He gestures for you to buy an egg* Woof!",
                3,
                "Woof! *He looks sad as if he\'ll be upset if you don\'t buy an egg* Woof!",
                4,
                "Woof! *He notices you understand him...* Woof!",
                3.5,
                "Woof! *but he\'s just barking... maybe you\'re part dog?* Woof!",
                4
            }
        }
    },
    ["holly"] = {
        ["name"] = "Holly",
        ["dialogs"] = {
            {
                "CATS CATS CATS!",
                1.3,
                "I LOVE CATS, WANT A CAT?",
                2,
                "BUY AN EGG AND YOU CAN MAYBE HAVE A CAT",
                2.5,
                "YOU HAVE A CAT, YOU HAVE A CAT, YOU HAVE A CAT",
                3
            }
        }
    },
    ["snowball"] = {
        ["name"] = "Snowball",
        ["dialogs"] = {
            {
                "Hey there! I\'m just your average Sea Captain Cat!",
                2.5,
                "If you want any new pets just come to me and buy an egg",
                2.5,
                "It will hatch into a pet if you look after it",
                2.5,
                "By the way I\'m not like the others in here that sell eggs...",
                3,
                "I just have an extraordinary high IQ for a cat.",
                2.5,
                "Have fun!",
                1.2
            }
        }
    },
    ["sir_woofington"] = {
        ["name"] = "Sir Woofington",
        ["dialogs"] = {
            {
                "I can tell by the look on your face that you\'re confused how I can speak.",
                5.5,
                "Well, you see that... specimen in the cheapest shop?",
                5,
                "We had an experiment done on us by Burt and well, there was a paradigm shift and our brains swapped",
                7,
                "So the fellow thinks he\'s a dog",
                3,
                "Anyway have a good day and make sure to buy my egg, the most premium egg in all the lands!",
                6
            }
        }
    },
    ["tutorial_sir_woofington"] = {
        ["name"] = "Sir Woofington",
        ["dialogs"] = {
            {
                "Why hello there human!",
                3,
                "You look like the type of chap who\'d help a friend out!",
                5.5,
                "Mind looking after this egg?",
                4,
                "Take good care of it and it\'ll hatch into an outstanding pet.",
                5.5
            }
        }
    },
    ["nurse"] = {
        ["name"] = "Nurse Knee",
        ["dialogs"] = {
            {
                "Welcome, come in, come in...",
                2,
                "Are you well? How can we help?",
                2.5,
                "and if you need a nap, there are lots of beds through the right.",
                5.5,
                "Our doctors are also vets \226\128\148 every species gets healthcare!",
                5,
                "Go grab yourself a snack!",
                2.5
            }
        }
    },
    ["chef"] = {
        ["name"] = "Chef Pepper",
        ["dialogs"] = {
            {
                "Buongiorno, welcome to my Pizzeria!",
                3,
                "We make the best pizza out here, only the best ingredients!",
                6,
                "*mumbles* Why\'d I let them order the pineapples...",
                5,
                "You hungry, or lookin\' to make some extra dough?",
                5,
                "We\'re hiring! Wanna be a chef or a server??",
                5,
                "We\'re talkin\' rollin\' the dough, fixin\' the toppings, keepin\' the fire hot!",
                7,
                "You\'d be bamboozled how demanding pets can be at the drive-thru...",
                7,
                "Don\'t worry! heh, heh... They\'re all bark, no bite!",
                5,
                "Ciao! Enjoy the pizza, buon appetito!",
                5
            }
        }
    },
    ["santa"] = {
        ["name"] = "Santa",
        ["dialogs"] = {
            {
                "Why hello there little one!",
                2,
                "This is how I make my money to afford giving away so many gifts on Christmas Day!",
                6,
                "I packed all these gifts with love, but one gift especially has a legendary vehicle you can drive!",
                7,
                "I hope you pick the right one because I don\'t know which gift has the legendary vehicle in it!",
                6
            }
        }
    },
    ["anna"] = {
        ["name"] = "Anna",
        ["dialogs"] = {
            {
                "Goo goo, ga ga.",
                2.5,
                "Hehehe, I\'m only kidding. This is where you come to get adopted! I already have a family, but I\'m just here to make new friends.",
                10,
                "Will you be my friend?",
                3
            }
        }
    },
    ["brad"] = {
        ["name"] = "Brad",
        ["dialogs"] = {
            {
                "Yoooo dude, my name is Brad Chad!",
                4,
                "Nice to meet you bros. Want to buy some sick stuff?",
                6,
                "Bro you seen my bro Chad Brad? Nah? Nevermind my dude.",
                6.3,
                "I\'ll catch you on the flip side.",
                5
            }
        }
    },
    ["rich"] = {
        ["name"] = "Rich",
        ["dialogs"] = {
            {
                "Goodday, welcome to the finest shop in town. The Car Show Room.",
                5,
                "If your vehicle\'s feeling a little stale, Cole can refresh it with a new Paint Job!",
                7,
                "Got your eye on anything yet?",
                3
            }
        }
    },
    ["agent_jake"] = {
        ["name"] = "Agent Jake",
        ["dialogs"] = {
            {
                "Hello Citizen! Welcome to the Safety Hub.",
                8,
                "Behind this door is the Trade License test.",
                5,
                "If you don\'t pass first time, don\'t worry! You can retake it as many times as you need to pass.",
                8,
                "Remember to never trust people you don\'t know! Easy peasy squeezy lemon. Wait did I say that right?",
                8,
                "Oh, I almost forgot... Have a good day, and remember, our agents are always watching.",
                8
            }
        }
    },
    ["agent_jake_has_license"] = {
        ["name"] = "Agent Jake",
        ["dialogs"] = {
            {
                "Hello Citizen! Welcome to the Safety Hub.",
                8,
                "You got your trading license!",
                5,
                "Good work. No need to take the test again!",
                6,
                "Remember to never trust people you don\'t know! Easy peasy squeezy lemon. Wait did I say that right?",
                8,
                "Oh, I almost forgot... Have a good day, and remember, our agents are always watching.",
                8
            }
        }
    },
    ["agent_lily"] = {
        ["name"] = "Agent Lily",
        ["dialogs"] = {
            {
                "Hi citizen, welcome to the Safety Hub!",
                5,
                "Next to me is the trade history book which is thousands of years old!",
                8,
                "The book is controlled by magic and records all the trades you\'ve done in the past 90 days.",
                10,
                "Remember to report scams!",
                5,
                "Oh, I almost forgot... Have a good day and remember our agents are everywhere and we\'re watching.",
                8
            }
        }
    },
    ["agent_lily_has_license"] = {
        ["name"] = "Agent Lily",
        ["dialogs"] = {
            {
                "I see you have a Trading License!",
                5,
                "You can use it to check your trade history any time!",
                7,
                "The trade history book also shows all your most recent trades.",
                8,
                "Use it whenever you want to look over a trade or report a scam.",
                10,
                "Oh, I almost forgot... Have a good day, and remember, our agents are always watching. ",
                8
            }
        }
    },
    ["agent_alex"] = {
        ["name"] = "Agent Alex",
        ["dialogs"] = {
            { "Would you like to start the test? You can retake it at any time if you don\'t pass.", 7 }
        }
    },
    ["agent_ruhi"] = {
        ["name"] = "Agent Ruhi",
        ["dialogs"] = {
            {
                "Hello, citizen!",
                4,
                "Welcome to the Redemption Kiosk.",
                5,
                "Do you have a code you would like to redeem?",
                6,
                "Certainly, I can assist with that.",
                5,
                "Interact with the Redemption Kiosk to enter your code.",
                7,
                "Oh, I almost forgot... Have a good day, and remember \226\128\148 our agents are always watching.",
                9
            }
        }
    },
    ["archer"] = {
        ["name"] = "Archer",
        ["dialogs"] = {
            {
                "Heyo I\'m glad you came here, I\'m really scared right now.",
                5,
                "We used honey as our special ingredient in our coffees...",
                5,
                "But the bees have rebelled because they were underpaid, so they\'ve smashed up my shop.",
                7,
                "Beetrice, on your right, is the Queen Bee. She\'s selling honey to people.",
                6,
                "She may be able to help you get a new pet!",
                5,
                "But please buy a coffee... I need to think of a new recipe...",
                6
            }
        }
    },
    ["beetrice"] = {
        ["name"] = "Beetrice",
        ["dialogs"] = {
            {
                "Hello there, I\'m Beetrice the Queen Bee!",
                5,
                "Don\'t mind me. I\'m just selling the honey that Archer stole off us",
                6,
                "This will help pay the bees for their work!",
                5,
                "And if he ever tries to put honey in coffee again, I\'ll be here and waiting for another strike!",
                7
            }
        }
    },
    ["elsa"] = {
        ["name"] = "Elsa",
        ["dialogs"] = {
            {
                "Hey, welcome to my Ice Cream Shop!",
                3,
                "The local King Penguins love to hang out here.",
                3.5,
                "If you\'d like a King Penguin of your very own, just feed them a Golden Goldfish!",
                7,
                "Also look out for the Diamond King Penguin, he\'s very particular with what he eats!",
                7,
                "If you want some of the best ice cream in this part of town, just buy it from Archer! I mean, me....",
                7
            }
        }
    },
    ["captainarg"] = {
        ["name"] = "Captain Arg",
        ["dialogs"] = {
            {
                "Arg! Watch ye step as ye get on the hot air balloon.",
                5,
                "Ye would be suprised how many people fall... Come back soon ye landlubber!",
                7
            }
        }
    },
    ["sophie"] = {
        ["name"] = "Sophie",
        ["dialogs"] = {
            {
                "Hey! I\'m just so glad you guys came in here.",
                3.5,
                "If you want anything fabulous you\'re in the best place to look totally fab.",
                7
            }
        }
    },
    ["justin"] = {
        ["name"] = "Justin",
        ["dialogs"] = {
            { "Hi there! Welcome to Green Groceries. Buy anything you want, it will make you less hungry or thirsty!", 7 }
        }
    },
    ["eda"] = {
        ["name"] = "Eda",
        ["dialogs"] = {
            {
                "Hi there!",
                1,
                "Welcome to my shop!",
                1,
                "I\'m so excited that you came in here!",
                1,
                "Are you excited?!",
                1,
                "Buy anything you want!",
                1,
                "You can have a discount!",
                1,
                "Oops it\'s expired!",
                1,
                "Have a great day!",
                1
            }
        }
    },
    ["burt"] = {
        ["name"] = "Burt",
        ["dialogs"] = {
            {
                "... Oh hai there, didn\'t see you der...",
                2,
                "...Welcom to my hoose, i mean shop...",
                2,
                "...Uhhhhhmmmmm...",
                2,
                "...Well hav fun campeng!..",
                2
            }
        }
    },
    ["ninja_monkey"] = {
        ["name"] = "Ninja Monkey",
        ["dialogs"] = {
            {
                "I\'m a ninja monkey, master of stealth..",
                4.5,
                "Give me 3 scrolls and I will teach your monkey to walk the path of the ninja!",
                7
            }
        },
        ["success"] = { "The legendary techniques! I can now show your monkey the way of the ninja!", 7 },
        ["failure"] = { "This is not enough. I need 3 scrolls to show your monkey the way of the ninja.", 7 }
    },
    ["toy_monkey"] = {
        ["name"] = "Toy Monkey",
        ["dialogs"] = {
            {
                "I\'m a toy monkey, master of fun.",
                5,
                "Give me 3 cymbals and I will teach your monkey how to spread joy like me!",
                7
            }
        },
        ["success"] = { "Woohoo! You\'ve got enough for me to work my magic!", 6 },
        ["failure"] = { "Oh no! You don\'t have enough \240\159\153\129 I need 3 cymbals to transform your monkey.", 7.5 }
    },
    ["business_monkey"] = {
        ["name"] = "Business Monkey",
        ["dialogs"] = {
            {
                "I\'m a business monkey, master of economics..",
                5,
                "For 3 briefcases, I will teach your monkey the finer details of business.",
                7.5
            }
        },
        ["success"] = { "I suppose this will do. But be quick about it, I\'m a busy monkey!", 7 },
        ["failure"] = { "This won\'t do at all! I need 3 briefcases to transform your monkey!", 7.5 }
    },
    ["monkey_king"] = {
        ["name"] = "Monkey King",
        ["dialogs"] = {
            {
                "I\'m a King monkey, master of all!",
                5,
                "Give me 3 staffs and I will teach your monkey how to rule responsibly like me.",
                8
            }
        },
        ["success"] = { "Your gift pleases the king. I will teach your monkey.", 6.25 },
        ["failure"] = { "Your gift is unworthy, return with 3 staffs to transform your monkey.", 7.5 }
    },
    ["nixie"] = {
        ["name"] = "Nixie",
        ["dialogs"] = {
            {
                "Hello there and welcome to my cave.",
                1.5,
                "This cave used to be a place where animals would visit to combine their spirits.",
                3.5,
                "They did this to strengthen their friendships.",
                1.5,
                "I\'m not sure if the magic still works, but you can give it a try.",
                3,
                "Find four fully aged up creatures of the same kind, and place them on the pedestals.",
                3.5,
                "Maybe your pets will become glowing and sacred after this.",
                2.8,
                "But do be warned, 4 pets go in, 1 comes out. But they will all share the same spirit.",
                7
            }
        }
    },
    ["tom"] = {
        ["name"] = "Tom",
        ["dialogs"] = {
            {
                "Woof! Oops sorry, thought you were a dog",
                3.5,
                "I don\'t see many people in here that often, so I just learnt how to speak dog",
                6,
                "Want to see some?",
                3,
                "Woof buy me a coffee woof... I mean bark",
                3.5,
                "You know what to do...",
                3
            }
        }
    },
    ["bonny"] = {
        ["name"] = "Bonny",
        ["dialogs"] = {
            {
                "Arg welcome to Hat Island ye flea bag.",
                3.5,
                "You may think I look like a pirate, but I stopped that life.",
                4.5,
                "I\'m now the scurvyest hat saleswoman.",
                3.5,
                "Back a few years ago, it rained hats, now I shrink \'em and sell \'em.",
                5
            }
        }
    },
    ["lily_ladybug"] = {
        ["name"] = "Lily",
        ["dialogs"] = {
            {
                "Well hello, how are you today?",
                5,
                "My name is Lily the Ladybug!",
                5,
                "Can I interest you in some delicious lavender?",
                7,
                "No, not for you to eat! It\226\128\153s for my ladybug friends!",
                7,
                "None of them can resist the taste of this sweet little flower.",
                8
            }
        }
    }
}
local v5 = {
    ["name"] = "Bastet",
    ["dialogs"] = {
        {
            "Hello there, frrrriend...",
            5,
            "Winds brought the mischief to this island,",
            6,
            "River\'s all out, nothing but sand.",
            6,
            "It\'s a dry, dry season, see...",
            5,
            "Enjoy the sun, let it shine on you",
            6,
            "It\'s good for the soul, trust me you.",
            6,
            "After this cold, cold winter",
            5,
            "It\'s bout time it gets brighter!",
            7
        },
        {
            "Quick! We\'re not here for long...",
            6,
            "Don\'t cry, stay strong!",
            5,
            "We\'ll be back before the Moon is new",
            6,
            "And soon you\'ll enjoy the morning dew.",
            7
        },
        {
            "Beetles have their Mud Ball,",
            5,
            "Bees have their honey...",
            5,
            "Go on, you know you want one, get it while it\'s sunny!",
            7
        }
    },
    ["animations"] = {
        ["idle_anim"] = "MummyCatIdle",
        ["talking_to_anim"] = "MummyCatIdle"
    }
}
v4.desert_2022_bastet = v5
v4.desert_2022_abyssinian_cat = {
    ["name"] = "Abyssinian Cat"
}
v4.doctor = {
    ["name"] = "Doctor Heart"
}
v4.pet_trainer = {
    ["name"] = "Pet Trainer Shane"
}
v4.horse = {
    ["name"] = "Horse"
}
v4.griffin = {
    ["name"] = "Griffin"
}
v4.sloth = {
    ["name"] = "Sloth"
}
v4.panda = {
    ["name"] = "Panda"
}
v4.kitsune = {
    ["name"] = "Kitsune"
}
v4.cerberus = {
    ["name"] = "Cerberus"
}
v4.robo_dog = {
    ["name"] = "Robo Dog"
}
v4.red_squirrel = {
    ["name"] = "Red Squirrel"
}
v4.cobra = {
    ["name"] = "Cobra"
}
v4.axolotl = {
    ["name"] = "Axolotl"
}
v4.random_pets_2022_winged_horse = {
    ["name"] = "Winged Horse"
}
local v6 = {
    ["name"] = "Aurora",
    ["dialogs"] = {
        {
            "Welcome to my shop! Why do I, a seal, have a shop?",
            6,
            "Don\'t ask me, ask Big Clam.",
            4,
            "Now you\'re wondering, why do I speak?!",
            5,
            "Ok, listen here. Stop questioning me!",
            5,
            "Anyway, if you want to adopt a bird, buy a clam and feed it to them.",
            6,
            "It worked for me. I now have a family of 50 albatrosses.",
            6,
            "Honestly, they\'re a lot to handle. But if you want something else, just look around my shop!",
            7,
            "Also, my boss Burt says hi... interesting guy, he runs Big Clam...",
            6
        }
    },
    ["animations"] = {
        ["idle_anim"] = "SealIdle",
        ["talking_to_anim"] = "SealIdle"
    }
}
v4.snow_2022_aurora = v6
v4.snow_2022_ribbon_seal = {
    ["name"] = "Ribbon Seal"
}
v4.space_house_2022_capricorn = {
    ["name"] = "Capricorn"
}
v4.javier = {
    ["name"] = "Javier",
    ["dialogs"] = {
        {
            "Where did I put that nail...? It\'s somewhere around here...",
            5,
            "Oh, hey! My name is Javier! My job is to make toys for this lovely toy shop.",
            7,
            "My day-to-day involves crawling on the floor looking for lost toy parts.",
            7,
            "And then standing on those lost toy parts...and then being air-shipped to the hospital.",
            8,
            "Trust me, small wooden blocks are lethal.",
            5
        }
    }
}
v4.emma = {
    ["name"] = "Emma",
    ["dialogs"] = {
        {
            "Hey! Welcome to the coolest school on Adoption Island!",
            5,
            "I\'m the coolest teacher. My hobbies are dank memes and emojis.",
            7,
            "Some people call me \"too old\" or \"cringy\" but I think they\'re just too old... silly kids.",
            8,
            "Make sure to say g\'day to Shane, he\'ll train your pets!",
            7,
            "Remember, hang on in there! Like the cat on the poster? No?... Ughh whatever, see you around.",
            8
        }
    }
}
v4.ice_cream_refresh_2022_king_penguin = {
    ["name"] = "King Penguin"
}
v4.ice_cream_refresh_2022_golden_king_penguin = {
    ["name"] = "Golden King Penguin"
}
v4.ice_cream_refresh_2022_diamond_king_penguin = {
    ["name"] = "Diamond King Penguin"
}
v4.royal_palace_2022_spaniel = {
    ["name"] = "Royal Palace Spaniel"
}
v4.hide_name = {
    ["name"] = ""
}
local v7 = {
    ["name"] = "Russell",
    ["dialogs"] = {
        {
            "Heeey there, Critter!",
            5,
            "Don\'t you just love this kind of weather?",
            6,
            "Golden, crunchy leaves falling everywhere,",
            6,
            "Primo blanket and hot chocolate season,",
            6,
            "and the temperature\'s juuuust right!",
            6,
            "Sweet, sweet, crunchy apples!",
            5,
            "Oooh!! AND ALL THESE HATS!",
            5
        },
        {
            "You looking to expand your family, Critter?",
            6,
            "Badgers and Pheasants, we migrate with the Fall!",
            6,
            "Like leaves on trees! We come and go!",
            6,
            "We\'ll be back before you know it, Critter,",
            6,
            "But you can adopt us! We\'d love to join your litter!",
            6
        }
    },
    ["animations"] = {
        ["idle_anim"] = "BadgerIdle",
        ["talking_to_anim"] = "BadgerIdle"
    }
}
v4.fall_2022_shop_badger = v7
v4.fall_2022_badger = {
    ["name"] = "Badger"
}
v4.ella = {
    ["name"] = "Ella",
    ["dialogs"] = {
        {
            "Welcome, welcome, we\'re gonna take good care o\' y\'all!",
            5,
            "I\'m Ella, this is my salon - for the pets, pals, gals, and fellas.",
            7,
            "We specialize in pampering the knots out of your pets,",
            5,
            "and getting your pets out of your hair!",
            4,
            "Wanna give your pets a new look? Any color you want!",
            6,
            "Pet friendly dyes, all natural, obviously.",
            5,
            "We do nails, too, and all kinds of designs! Any o\' that sound good?",
            7,
            "Hey! You any good at cuttin\', washin\', dryin\', colorin\'?? We\'re hiring!",
            7
        }
    }
}
v4.sean = {
    ["name"] = "Sean",
    ["dialogs"] = {
        {
            "Oh hello again, I have a confession. I\'m actually not a human.",
            6,
            "Sorry to lie to you, but I\'ll make it up to you with a joke.",
            5,
            "What\'s nothingness?",
            2.5,
            "Adopt Me! Hahahaha... Not funny? It was funny because it was true.",
            7,
            "Anywho one of your eight Elder Gods, specifically Santa, just had a meeting with me, and we\226\128\153ve come to a compromise.",
            10,
            "Since giving you guys money for just looking after pets wasn\'t a good economic choice (shocker)",
            8,
            "And you couldn\'t pay your Universe Taxes, you\226\128\153ll pay off your debts through hard work.",
            7,
            "We\226\128\153ve added Jobs to the Pizza Shop and Salon where you can earn money for us, and maybe yourself too.",
            7,
            "So welcome back to existence and make sure to visit the Pizza Shop or Salon every now and again.",
            8,
            "Have fun not being deleted out of existence and goodbye!",
            8
        }
    }
}
local v8 = {
    ["name"] = "Captain Fluffy",
    ["dialogs"] = {
        {
            "Hey! Hey ho!",
            3,
            "Grrreat to meet ye in this fog!",
            4,
            "Welcome to ourr portable rainforest,",
            5,
            "grab some gearr and go explore!",
            4,
            "This town\'s a rrreal beauty, ye know,",
            5,
            "she looked mighty from the shore!",
            4,
            "Listen herre...",
            3,
            "Ye look in need of a new crrew!!",
            4,
            "Lucky ye,",
            3,
            "I trravel with the best Ocelots and Parrots the pirrating world has to offer!",
            8,
            "But wait...!",
            3,
            "Just a nautical minute!",
            3.5,
            "Arr ye telling the real truth, aye?",
            4,
            "Ol\' Bonny\'s anchored on this island??",
            4,
            "I gotta say ahoy to my pirrate sisterr! Bye bye, now!",
            6
        }
    },
    ["animations"] = {
        ["idle_anim"] = "OcelotSit",
        ["talking_to_anim"] = "OcelotSit"
    }
}
v4.rain_2023_captain_fluffy = v8
v4.paint_sealer_npc = {
    ["name"] = "Rusty"
}
local v9 = {
    ["name"] = "Amaia",
    ["dialogs"] = {
        {
            "Humans and pets alike, welcome to the Adoption Island cruise, I will be your pilot today!",
            6,
            "Hehe, just kidding, we\'re not leaving the ground!",
            5,
            "But, you can take one of my Kiwi friends with you, wherever you want!",
            5.5,
            "All around Adoption Island, explore the Neighborhood...",
            5,
            "Ready for an adventure?",
            4
        }
    },
    ["animations"] = {
        ["idle_anim"] = "Kiwi2023KiwiIdle",
        ["talking_to_anim"] = "Kiwi2023KiwiIdle"
    }
}
v4.kiwi_2023_aviator_kiwi = v9
v4.lures_2023_castle_tim_1 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Welcome to my Sky Castle!",
            3,
            "The pinnacle of high society on the island of Adopt Me,",
            5,
            "Or should I say above? Because we\'re floating above the island...",
            5,
            "Get it? It was a joke...",
            3,
            "Anyway if you want potions here\'s the place to get them",
            5,
            "And uhh we also have a book that\'s very lively for sale",
            5,
            "I don\'t know when he got here or why he\'s on sale, he just arrived one day",
            6,
            "He says his name is Steve, but I wouldn\'t trust him, he\'s a bit hard to read",
            7
        }
    }
}
v4.lures_2023_castle_tim_2 = {
    ["name"] = "Cool Tim",
    ["dialogs"] = {
        {
            "Sup dude, how\'s it going my guy?",
            3,
            "What am I doing?",
            2,
            "I\'m just sitting here chilling, rebelling against the man",
            5,
            "How do you rebel against the man?",
            3,
            "Dude hahaha... Okay fine I don\'t know",
            3,
            "But it sounds cool",
            2,
            "And I\'m cool, so that\'s what I\'m doing",
            3
        }
    }
}
v4.lures_2023_castle_tim_3 = {
    ["name"] = "Crazy Tim",
    ["dialogs"] = {
        {
            "WHY DOES EVERYONE KEEP CALLING ME CRAZY!",
            5,
            "IM NOT CRAZY, THEYRE THE CRAZY ONES!",
            5,
            "Sorry, uhhhhh",
            2,
            "Well in other news I\'m doing perfectly sane research,",
            5,
            "I\'m just trying to swap someone\'s brain with a battery",
            5,
            "I just need a test subject...",
            3,
            "Oh no not you",
            2,
            "I need someone with similar DNA to myself...",
            4,
            "Spoon?",
            1
        }
    }
}
v4.lures_2023_castle_tim_4 = {
    ["name"] = "Timothy Emperor Of The Spoons",
    ["dialogs"] = {
        {
            "Why hello there my subject",
            3,
            "Welcome to my land, speaking of which",
            4,
            "You owe me taxes",
            2,
            "I demand you pay me 5 spoons...",
            3,
            "If you don\'t I will lock you in a room that is filled with speakers...",
            5,
            "And we will yell \"spoon\" at you until you give us what is owed!",
            6,
            "As keeper of the secret relic (which may or may not be a spoon) you owe me homage",
            7
        }
    }
}
v4.lures_2023_castle_tim_5 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Hey there, I have a quick question",
            3,
            "Do you ever have reoccurring dreams?",
            3,
            "Every night I go to sleep I slip into a slumber",
            4,
            "One which seems to never end",
            3,
            "And when I forget I\'m dreaming I enter a world...",
            4,
            "A world of pure uncompromising magic",
            4,
            "A world where everything is perfect, where there is no dark but only light",
            5,
            "But in this world there is something missing, it feels almost out of balance... there\'s always something missing...",
            7,
            "Do you ever have this dream?",
            3
        }
    }
}
v4.lures_2023_castle_tim_6 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "What are lures you ask?",
            3,
            "...Yes I know you didn\'t ask",
            3,
            "But it\'s my way of talking about the cool things I do",
            4,
            "Go home and search \"lure\" in your furniture search bar",
            5,
            "You can use them to catch the pets that escaped from the portal",
            5
        }
    }
}
v4.lures_2023_castle_tim_7 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "I AM THE MOST POWERFUL WEATHER WIZARD!!",
            4,
            "With the help of Tim, Tim, Tim, Tim and Tim... WE CONTROL TEMPERATURE!",
            5,
            "It was getting too hot... ICE TIME!",
            3.5,
            "We knew we had to conjure up another portal!!",
            4,
            "\240\159\165\182 BrrrRRrrrrRrr... \240\159\165\182",
            3
        }
    }
}
v4.lures_2023_castle_tim_8 = {
    ["name"] = "Foreshadowed Tim",
    ["dialogs"] = {
        {
            "Why is my name Foreshadowed Tim?",
            3,
            "Not sure, it just felt like a good name to me",
            4,
            "But seriously",
            2,
            "Crazy Tim keeps looking at me weird...",
            4,
            "Can you ask him what\'s up?",
            3,
            "I know he\'s basically me but still I don\'t trust him,",
            4,
            "That lead he drank really messed him up",
            4,
            "All the other Tims told me to stop calling him crazy",
            4,
            "But I mean look at him, call a spoon a spoon am I right?",
            5
        }
    }
}
v4.lures_2023_castle_tim_9 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Why is Santa here all year round?",
            3,
            "Well obviously he used to build toys for children on this island",
            5,
            "Wait how haven\'t you put it to together yet?",
            4,
            "This is the North Pole, this is Santa\'s home",
            4
        }
    }
}
v4.lures_2023_castle_tim_10 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Why is the sky castle floating?",
            3,
            "To be honest no one has any idea,",
            4,
            "It\'s been here long before any of us...",
            4,
            "But I can tell you one thing",
            3,
            "It\'s being held up by some extremely strong magic",
            4
        }
    }
}
v4.lures_2023_castle_tim_11 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Dude honestly... don\'t ask",
            3,
            "I have no idea what\'s happened to everyone",
            4,
            "We were meant to be this all powerful wizard, but look what happened to us",
            5,
            "There\'s now one of us called the \"Emperor of the Spoons\", a crazy guy",
            6,
            "And a really insecure Tim who claims to be \"Cool\"",
            6,
            "Honestly I just want the first hot air balloon out of here...",
            5,
            "Ugh I guess this is what happens when you give people \"sentience\" and \"free will\"",
            7,
            "Please just let it be over",
            3
        }
    }
}
v4.lures_2023_castle_tim_12 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Heyo, I\'m trying to start a new company",
            4,
            "I\'m just filling out some forms for research purposes",
            5,
            "What is your favorite type of utensils?",
            4,
            "Would you say its a tea spoon, soup spoon, wooden spoon",
            6,
            "Measuring spoon, grapefruit spoon, tablespoon",
            5,
            "OH OOO or maybe you\'re a weird one and its a ladle?",
            6,
            "Oh you like forks...",
            3,
            "Get out.",
            1
        }
    }
}
v4.lures_2023_castle_tim_13 = {
    ["name"] = "Tim",
    ["dialogs"] = {
        {
            "Hey, wanna adopt some Cool pets?",
            3,
            "Ice Soup Bait\'s super easy to mass produce!",
            3.5,
            "Interact with a Lure in your house, you\'ll see!",
            4,
            "Easy peasy, extra freezy...",
            4
        }
    }
}
for _, v10 in v2.pets do
    if v10.generate_npc_furniture_on_runtime and not v4[v10.kind] then
        v4[v10.kind] = {
            ["name"] = v10.name
        }
    end
end
v3.merge("NPCs", v4)
for _, v11 in v4 do
    local v12 = not v11.dialog
    assert(v12, "The \'dialog\' property is no longer supported. Please use \'dialogs\' instead.")
    if v11.dialogs then
        for v13, v14 in v11.dialogs do
            local v15 = {}
            for v16 = 1, #v14, 2 do
                local v17 = {
                    ["text"] = v14[v16],
                    ["length"] = v14[v16 + 1]
                }
                table.insert(v15, v17)
            end
            v11.dialogs[v13] = v15
        end
    end
end
return v4