public function encounterVanae(isHuntress:Boolean):void
{
First Encounter

As you move through the jungle, your codex suddenly begins to beep out a warning. <i>\"Vanae life-signs detected! Collecting all known extranet data on this species...\"</i>

You look around you and see nothing. Is the codex malfunctioning? The device is equipped with short-range sensors, but there's nothing as far as you can see. 

You ready your [pc.weapon], your [pc.eyes] carefully scanning your surrounds...

<i>\"Data Retrieved! The vanae are an all-female race that can change their skin to match the color of their surroundings. They are also tree-dwelling, [Master] Steele,\"</i> your codex informs you, and just in time. 

// IF VANAE HUNTRESS
{
You look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent.They land as slick as a cat and level a pointed spear at you. 

It seems she was trying to hit you with the blunt end though - was she trying to knock you out?

<i>\"... Whoops, I missed. You're no ordinary {if zil/naleen: "[pc.race]"}{else: "off-worlder"},\"</i> the vanae woman exclaims. She looks fairly humanoid, except for her tentacle hair, tail, and organic skirt. Her tentacles are violet colored and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing violet swirls and patterns, just like her hair. 

// Please make sure the nipples parser always calls up the fact she's lactating, if it doesn't already. Couldn't tell from the GIT info.

The other thing that immediately captures your attention are her sizable [vanaeHunt.breastCupSize]s and [vanaeHunt.nipples]. She seems to be lactating a transparent violet liquid that is drooling down her [vanaeHunt.breasts]. As you check her out, you can see her webbed hands gripping the handle of her spear.

When you look up, you notice her eyes are firmly shut. They have been all this time. Is she planning to fight you blind? 
}

// ELSE IF MAIDEN VANAE
{
You look up and see someone about to land on you! You dive out of the way and quickly turn to look at your opponent. They hit the ground where you were seconds before, stumbling off balance and crashing spectacularly. 

<i>\"Owww!</i> You hear your attacker cry out pitifully. When she picks herself up, rubbing her head, you get a good look at her. She looks like a young humanoid woman, except for her tentacle hair, tail, and organic skirt. Her tendrils are pink and bioluminescent, while the rest of her is pale as snow. Her body is covered in gorgeous glowing pink swirls and patterns, just like her hair. 

The other thing that immediately captures your attention are her small [vanaeMaid.breastCupSize]s and [vanaeMaid.nipples]. She seems to be lactating a transparent pink liquid that is drooling down her [vanaeMaid.breasts]. 

As you check her out, you also notice she's holding a pointed spear in her webbed hands. They are visibly trembling - she doesn't look terribly experienced at this kind of thing.

<i>\"... Um, hold it right there! Don't make me hurt you, okay?\"</i> the pink-haired alien pleads. You realise she was trying to hit you with the blunt end. Does she really want to fight?

You also notice her eyes are firmly shut and have been this whole time. Is she planning to fight you blind? 
}

// MERGE

Your codex clues you in to what is going on.

<i>\"Vanae have vestigial eyes, [Master] Steele, and exceptionally keen hearing. You'll also want to avoid the liquid she sprays from her breasts; it incapacitates and arouses on contact.\"</i>

Best. Present. Ever.

// IF VANAE HUNTRESS
{
Meanwhile, the vanae huntress looks a bit huffy. <i>\"... I can't believe I messed up my first strike. But I won't make the same mistake twice{if pc.sex = Male or herm: your cum is mine}{else: your girl-cum is mine}!\"</i> 

Wait, what?! She's after your {if pc.sex = male or herm: [pc.cumNoun]?}{if pc.sex = female: [pc.girlcumNoun]?}{else: girl cum? You don't even have any to give!} Do you even get a choice in the matter?

It's a fight!
}

// ELSE IF MAIDEN VANAE
{
<i>\"Your... your hip talked!\</i> The vanae maiden squeaks out in surprise. The Codex wasn't joking about her keen hearing. <i>\"... Listen, you. {if sex = female: "You're going to be my first, so I hope you like girls!"}{else: "I won't mess up my first hunt - I just won't - so you're going to take my virginity and like it - understand?}"\</i>

Whaaaaaaat?! You barely have time to register as she swings her spear. Clearly, she's regained her composure.

It's a fight!
}

REPEAT SCENE

As you move through the jungle, your Codex beeps out a warning. <i>\"Vanae life-signs detected!\</i>

// IF VANAE HUNTRESS
{
You instinctively leap back and ready your {if [pc.rangedWeapon != null] "[pc.rangedWeapon]"}{else if [pc.meleeWeapon != null "[pc.meleeWeapon]"}{else: "fists"}. You're glad you moved first, because a vanae huntress lands right where you were standing with a thud. She just came out of nowhere!

<i>\"I missed? You're no ordinary {if zil/naleen: "[pc.race]"}{else: "off-worlder"}.}\"</i> She looks completely perplexed at your ability to sense her beforehand. You're pretty sure she wouldn't get it even if you explained it to her.

The vanae huntress that attacked you is sporting a pair of sizable [vanaeHunt.breastCupSize]s. She seems to be an experienced (if pc.sex = female: fem} cum hunter. 
}

// IF MAIDEN VANAE
{
You instinctively leap back and ready your [pc.weapon]. You're glad you moved first, because a vanae maiden lands right where you were standing. She hits the ground awkwardly, toppling over and very nearly braining herself.

<i>\"Owww! How'd you see me coming? That's not fair!</i> You hear your attacker cry out pitifully. She seems perplexed at your ability to sense her beforehand. You're pretty sure she wouldn't get it even if you explained it to her.

The pink-haired vanae quickly pulls herself to her feet, levelling her spear at you. <i>\"S-stop right there, you! You're going to {if pc.sex = female: "be my first - so I hope you like girls!"}{else: "take my virginity - and you better be gentle!"}\"</i>

The vanae maiden that attacked you is sporting a pair of [vanaeMaid.breastCupSize]s. This seems to be her first time hunting for a mate.
}

// MERGE

It's a fight!

}