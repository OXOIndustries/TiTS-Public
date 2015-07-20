//Myr Deserter (Individual) Enemy Encounter
//Written by JimThermic

//This is a two part project - there is a document for an individual deserter encounter and one for a group encounter. This document is for the individual encounter.

//Here is the link for the group encounter document: 
//https://docs.google.com/document/d/1nVvR6wUos7V_n3aSzOYKHFm-_R32Hebz0jyM8XdRd8A/edit?usp=sharing

/*Project Overview


The Myr Deserter (individual) encounter occurs within No Ants Land. At the start of this encounter, the PC has a 50/50 chance of running into either a singular gold deserter or red deserter. While it is not immediately obvious to the player, the red or gold myr they encounter each time is the same red or gold myr (The same as the Naleen Female encounter).

These encounter are almost exactly the same as normal enemy encounters. However, this changes when the PC wins five consecutive fights against one of the Myr. At this point, the Myr in question becomes non-hostile, and the PC has the option to fight them, or avoid fighting altogether. Other options such as sex and talking become available.

The PC must win five consecutive fights against the particular color of myr to make them non-hostile. E.g. Winning five fights against the red myr makes the red myr not hostile, not both of them.

Some of the deserter sex scenes are available on win OR loss. Sections of the sex scene that are played on Win or Loss are clearly bracketed off, with a 'core' chunk of text left separate for both.

When the PC engages in sex from the non-hostile menu (After winning five or more fights), the 'Win' sections of text are used. To this end, the bracketed sex scene sections are labelled 'Win/Consent'.

The Gold Myr is named Lys. The Red Myr is named Briha. Until the PC wins five fights against the respective Myr, they are known as 'red myr deserter' or 'gold myr deserter' for the purposes of [monster.name], changing to their respective names after five fights are won.

There is pregnancy support for Briha, so the PC can knock her up. This extra content is explained in further detail below.

Red Pregnancy

It is possible for the PC to get the red myr pregnant via vaginal sex scenes, which are currently on win only.  If the red myr deserter is impregnated, regardless of victories, she always approaches the PC in a non-hostile manner from then on, including post-pregnancy.

Three or more months after impregnation, the next encounter with the Red Myr / Briha involves her handing over her egg (or child, if it's beyond four months) to Steele to have transferred to the nursery.

The PC cannot use the 'Fight' option on the pregnant red myr for obvious reasons.*/

/*
Individual Specs
 
Red Myr / Briha

Hair Color: Amber
Hair Length: Shaggy
Height: 5'2".
Eye Color: Black
Skin Color: Dusky red
Lips: Average. Scarlet.
Breast Size: C

Gold Myr / Lys

Hair Color: Black
Hair Length: Short
Height: 5'2".
Eye Color: Black
Skin Color: Gold
Lips: Average. Scarlet.
Breast Size: F
Special: Nipples are pierced.
*/

//Myr Approaches
public approachMyrDeserters():void
	//Approach (Combative)
	// This approach is used under the following conditions:
	//Have not won against this particular color of myr deserter five or more times.
	//The deserter is not a pregnant or post-pregnant red myr.

	//GOLD MYR!
	if(rand(2) == 0)
	{
		//Peaceful! - BEATEN DOOOOWN
		if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5)
		{
			approachMyrDesertersNonCombatShit(false);
		}
		//Combat!
		{
			combatBlurb(true);
		}
	}
	//RED MYR
	else
	{
		//Add preggo checks later on~
		//PEACESHIT
		if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5 || flags["BRIHA_INCUBATION_TIMER"] != undefined || flags["RED_MYR_BIRTHS"] != undefined)
		{
			approachMyrDesertersNonCombatShit(false);
		}
		//COMBAT!
		else
		{
			combatBlurb(false);
		}
	}
	// If either of the above are true, use the non-combative approach instead.
}

public function combatBlurb(gold:Boolean = false):void
{
	showDeserter(gold);
	//First Time:
	if((gold && flags["MET_GOLD_DESERTER"] == undefined) || (!gold && flags["MET_RED_DESERTER"] == undefined))
	{
		if(gold) flags["MET_GOLD_DESERTER"] = 1;
		else flags["MET_RED_DESERTER"] = 1;
		output("\n\nAs you walk through the desolate and war torn wasteland, the wind howls around you. It rages against its underground confines. Instinctively, you ");
		if(pc.weapon is EmptySlot) output("grab a nearby rock.");
		else output("tighten your grip on your [pc.weapon].");

		output("\n\nA deafening boom fills the air. The ground trembles, and dirt and stalagmites fall from the cavern ceiling. Heart racing in your chest, you throw yourself to the ground.");
		output("\n\nWhen the tremors subside, you tentatively glance about – the explosion wasn’t close. The shock wave must have carried through the cave network.");
		output("\n\nVoid, what kind of crazy race uses explosives in closed caverns? You dust yourself off and ");
		if(pc.isBiped() || pc.isTaur()) output("stand up");
		else output("pull yourself upright");
		output(". Looking up, you spot a flash of ");
		if(!gold) output("red. A ragged looking female myrmedion is standing before you. The chipped, gleaming edge of a hatchet and the barrel of a luger-like pistol - each in a separate hand - are pointed directly at your face.");
		else output("gold. A ragged looking female myrmedion is standing above you. The chipped, gleaming edge of a bayonet - and the barrel of the trench shotgun it is attached to -  are pointed directly at your face.");

		output("\n\n<i>“You’ve got terrible luck, off-worlder, running into the likes of me,”</i> she dryly smiles. ");
		if(gold) output("A notable scar mars her otherwise pretty mouth/Red: There’s a distinct scar over her right eye, which is half closed");
		output(". <i>“... I’m going to help myself to your things. Maybe I’ll help myself to you too, while I’m at it.”</i>");

		output("\n\n<i>“It’s the rules of this place, so don’t feel too hard done by - I’ve been on the receiving end as well. It’s just your turn, that’s all.”</i>");
		output("\n\n");
		if(gold) output("She stabs at you with the bayonet blade. You dart to the side, and it <i>just</i> misses.");
		else output("She pulls back the toggle-lock of the semi-auto with a loud click.");
	}
	else
	{
		output("\n\nYou’re walking through the desolate and war-torn wasteland. Suddenly, there’s a bee-like whizzing past your ear. A ragged-looking ");
		if(gold) output("gold");
		else output("red");
		output(" deserter is standing nearby, a thin, coiled line of smoke rising from her ");
		if(!gold) output("semi-auto pistol");
		else output("trench shotgun");
		output(".");
	}
	output("\n\n<b>It’s a fight!</b>");
	clearMenu();
	if(gold) addButton(0,"Next",startCombat,"Gold Deserter");
	else addButton(0,"Next",startCombat,"Red Deserter");
}

//Approach (Non-Combative) 
// Used under the following conditions:
//PC has won against this color of myr at least five or more times, or
//The encounter is with the red myr/Briha when she is pregnant or post-pregnant.
//The PC does not fulfil the requirements for Approach (Pregnant Event) - See Event further down.
public approachMyrDesertersNonCombatShit(gold:Boolean = false):void
{
	showDeserter(gold);
	//Encounter is pregnant red myr deserter:
	if(9999 == 0)
	{
		//9999 - start combat with her so we can pull her statblock.
		output("\n\nYou’re walking through the desolate and war-torn wasteland. Nearby, you spot a ragged looking red deserter. Under her partially torn uniform, she has a [monster.belly].");
		if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined) output(" She’s pregnant-?");
		output("\n\nRaising a nail-chipped hand, ");
		if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
		else output("the amber-haired ant-girl");
		output(" waves to you. It seems she’s sitting down for a rest.");

		//First Pregnancy && First Time Ever Seeing Her Pregnant
		if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == undefined)
		{
			output("\n\n <i>“Hi there, soldier. Probably a good as time as any to tell you you’re a father,”</i> she grins, petting the obvious bump. <i>“And before you ask, it’s definitely yours. I don’t get laid enough to mix</i>that<i> up.”</i>");
			flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
		}
		//{Second Pregnancy && First Time Seeing Her Pregnant (this time)
		else if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == 1)
		{
			output("\n\n<i>“Hi there, soldier. You’ve gone and knocked me up again,”</i> she grins, rubbing her bump. <i>“You’re a regular stud, aren’t you? Making a girl waddle around the battlefield.”</i>");
			flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
		}
		else
		{
			output("\n\n<i>“Hi there, soldier. I’m just sitting down for a rest,”</i> she smiles and stretches out. <i>“... So, what brings you out to these forsaken parts?”</i>");
		}
		//Don’t Know Her Name:
		if(flags["KNOW_RED_MYR_NAME"] == undefined)
		{
			output("\n\n<i>“OH! By the way, the name’s Briha. Figure you should at least know the name of the mother of your child, right?”</i>");
			chars["RED_DESERTER"].short = "Briha";
			flags["KNOW_RED_MYR_NAME"] = 1;
		}
	}
	else
	{
		output("\n\nYou’re walking through the desolate and war-torn wasteland. Nearby, you spot a ragged looking ");
		if(!gold) output("red");
		else output("gold");
		output(" deserter");
		if(!gold && flags["KNOW_RED_MYR_NAME"] == 1) output("- It’s Briha");
		else if(gold && flags["KNOW_GOLD_MYR_NAME"] == 1) output("- It's Lys");
		output(".  She’s holding her ");
		if(!gold) output("semi-auto pistol and hatchet");
		else output("trench shotgun and pistols");
		output(" but doesn’t make any move to attack.");
		
		//Red/Briha:
		if(!gold)
		{
			//{Post-pregnancy:
			if(9999 == 0) 
			{
				output("\n\n<i>“Hi, soldier. It’s good to see you again,”</i> she warmly smiles. Her weapons are immediately lowered.");
				output("\n\n<i>“... Got time to spend with me? I’d appreciate the company.”</i>");
			}
			else
			{
				output("\n\n<i>“Hi, soldier. How about we skip the usual scuffles and just play nice? I’ve got into enough fights with you to know who’s going to end up on top,”</i> she wryly smiles.");
			}
		}
		else
		{
			output("\n\n<i>“Fancy meeting you here. How about we don’t fight this time? I’m sick of getting spanked by you - well, at least getting spanked in the non-fun way,”</i> she grins.");
		}
		//Don’t Know Her Name:
		if((!gold && flags["KNOW_RED_MYR_NAME"] == undefined) || (gold && flags["KNOW_GOLD_MYR_NAME"] == undefined))
		{
			output("\n\n<i>“By the way, the name’s ");
			if(!gold)
			{
				flags["KNOW_RED_MYR_NAME"] = 1;
				output("Briha");
				chars["RED_DESERTER"].short = "Briha";
			}
			else
			{
				flags["KNOW_GOLD_MYR_NAME"] = 1;
				output("Lys");
				//Rather than setting the name and saving info about the character, use the flag to set the name during combat setup.
			}
			output(".”</i>");
		}
	}
	processTime(5);
	clearMenu();
	//[Sex] [Talk] [Fight] [Flee]
	// Fight is not available with the pregnant red myr. Otherwise, it goes right to combat.
	if(gold) addButton(3,"Fight",startCombat,"Gold Deserter");
	else 
	{
		if(chars["RED_DESERTER"].isPregnant()) addDisabledButton(3,"Fight","Fight","You're not going to smack around a pregnant girl!");
		else addButton(3,"Fight",startCombat,"Red Deserter");
	}
	//9999
}

//Fight
public function fightADumbShitAntWaifu(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	//9999 - cheese fight start before text finishes so can use monster.name.
	output("You pull out your [pc.weapon]. [monster.name] clicks her tongue. <i>“... Damn. Oh well, it was worth a try, right?”</i>");
	output("\n\n<b>It’s a fight!</b>");
	processTime(1);
	clearMenu();
	if(gold) addButton(0,"Next",startCombat,"Gold Deserter");
	else addButton(0,"Next",startCombat,"Red Deserter");
}

//Flee
public function runFromDatAntSloot(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	output("You decide to avoid dealing with [monster.name] altogether. As she stands there with a dumbfounded expression, you slip off.");
	//9999 stealth combat resolve
}

//Talk
public function talkToAntSloots(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	output("Since you’re not going to fight, you decide to sit down with [monster.name] and talk. What do you chat about?");
	processTime(1);
	//[About Her] [Desertion] [Scars] [Leave]
	//9999
}

//About Her
public function aboutAnAntSlootDeserter():void
{
	clearOutput();
	showDeserter(gold);
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha a little bit about herself. The amber-haired ant girl scratches her head, looking a little self-conscious.");
		output("\n\n<i>“... Me? Just another dumb girl who got sucked into the propaganda,”</i> she answers. <i>“Honestly, girls like me are a credit a dozen. I’m nothing that special.”</i>");
		output("\n\nPushing her a little further, she gives you a bit more of an answer. <i>“Oh, okay. Well, where to start? I’m a twenty one year-old ex-career soldier from Rivalle. I was a Sergeant before I went AWOL.”</i>");
		output("\n\n<i>“I’m not all work - or rather, I wasn’t. I used to want to be a career dancer before the war started. I’m a bit too scarred for that now, though,”</i> she smiles wryly. <i>“Plus, I’m pretty sure we’re all going to get blown up before long... not that I can return home.”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys a little bit about herself. She curls a finger around her wild locks, her other arms hugging under her voluptuous breasts.");
		output("\n\n<i>“I guess I can tell you a little bit about myself. After all, it’s not exactly like I have a lot better to do,”</i> Lys chuckles. <i>“Maybe I should start with my measurements, or are you after something a little bit more personal?”</i>");
		output("\n\n<i>“Let’s see... I’m twenty six years old and an ex-florist. I used to have a lovely garden and my own cosy home not far from where we are now. My wife and I sold the loveliest blue-green sydranas... at least until we were both conscripted.”</i>");
		output("\n\nShe sighs and looks down at her assorted hands, lacing her fingers together. <i>“... That was so long ago... four years? It feels like forever.”</i>");
		output("\n\n<i>“Needless to say, she’s dead, along with the rest of our platoon. Our house is in ruins - there’s barely anything left. I’ve got some seeds left, but the soil is so ruined they refuse to bloom.”</i>");
		output("\n\n<i>“All I’m doing is wasting my time until someone hunts me down for desertion, or the world ends - whichever comes first.”</i>");
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToAntSloots,gold);
}

//Desertion
public function askAntSlootsAboutDesertion(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha why she deserted the Scarlet Federation. Her face screws up a little, but she still answers the question.");
		output("\n\n<i>“... I guess it’s the obvious question, right? I guess... I had an image of how things would be. I was going to be the glorious defender of my homeland, fighting back against the hypocritical Golds, who were going to stomp all over us if we didn’t do something.”</i>");
		output("\n\n<i>“My dream of being a bold, adventurous heroine, delivering justice to the dirty Golds... I was so naive. I’ve shot and killed more people than I can count. Not just enemy soldiers, but civvies too. Sure, it was orders, but I was the one who pulled the trigger... or brought down the axe.”</i>");
		output("\n\nShe sighs and bites her fingernail. <i>“... I was thinking about deserting for a while, but I couldn’t do it to my squad. When you desert, you burn your whole squad. When they all died, I was in anguish, but I was relieved... how sick is that?”</i>");
		output("\n\n<i>“When that happened, I left the front. It was easier than I thought. Now, I’m living out here in the middle of nowhere, scraping together what I can to survive. But you know what? It beats having to shoot any more defenseless people and call it justice.”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys why she deserted the Gilden Republic. She sighs and looks at one of her fingers, rubbing it compulsively.");
		output("\n\n<i>“... My wife. We were both conscripted early on during the war. She... I... well... same platoon,”</i> she chokes up. Her black eyes become glassy with tears. <i>“... Sorry. I really thought I could talk about it this time... but I just can’t.”</i>");
		output("\n\nTaking a deep breath, she tries to calm her trembling body. <i>“... Whoooh. Right. So. When she left me, I ended up in a medical hospital for a little while. They put me back on the front line when the war effort started going south, though.”</i>");
		output("\n\n<i>“When the Reds took Kressia, I figured it wasn’t long before the End, what with the nukes. If I’m going to die, I wanted to do it near where our old house was, here in No Ants Land - not in some hopeless defense of the capital.”</i>");
		output("\n\n<i>“... So that’s it. I wander the wastes, stealing what I can, robbing strays, all so I can stay close to where she and I lived. I kind of feel like she’s there, you know?”</i>");
		output("\n\n<i>“I know I’m a terrible person, but the whole world is terrible. I don’t think there’s a single thing worth salvaging anymore - we’re all just a bunch of trampled flowers, struggling to grow on scorched earth.”</i>");
	}
	processTime(4);
	addButton(0,"Next",talkToAntSloots,gold);
}

//Scars
public function askAntDesertersAboutScurrs(gold:Boolean = false):void
{
	clearOutput();
	showDeserter(gold);
	//Red/Briha:
	if(!gold)
	{
		output("You ask Briha about her scars; the one over her damaged eye and one to the side of her heart.");
		output("\n\nBriha touches her scarred eye self consciously. <i>“... T-these? I suppose you would be curious,”</i> she mumbles, <i>“The eye I got early on in the war from being careless.”</i>");
		output("\n\n<i>“I’d taken a pot shot with a rifle at a gold scout. When I moved up to grab her hand-held, she damn near sliced my face open with a knife. We struggled for a bit before I smashed open her temple with her radio.”</i>");
		output("\n\nThe red myr brings down her hand to rub the scar just next to her heart. <i>“... This one’s a bit more painful. My squad and I ran into some wire entanglements. While trying to get through, we were herded into a machine gun.”</i>");
		output("\n\n<i>“Thankfully, a shelling took out the enemy gunner and I was dragged off the field. They stitched me up, and now I’ve got a scar and a story to tell off-worlders wandering through the wastes,”</i> she bitterly smiles.");
		output("\n\n<i>“You, though, look at you! All scarless and " + pc.mf("handsome","pretty") + ". Off-world medicine really is something else, isn’t it?”</i>");
	}
	//Gold/Lys:
	else
	{
		output("You ask Lys about her scars; the one on her lower lip and on her belly.");
		output("\n\nLys laughs and rubs her lower lip. <i>“... Well, you don’t spend time on the front without walking away with scars of one kind or another, right?”</i>");
		output("\n\n<i>“The belly and the lip are actually connected. We were pushing forward to take an enemy trench. When we reached it, I looked over and a red shot me at point blank.”</i>");
		output("\n\nShe taps her belly, <i>“... The bullet went right through me. Thankfully, it missed all the important stuff. But I was so shocked I toppled forward and fell face-first into the trench.”</i>");
		output("\n\n<i>“When I hit the ground, one of my teeth dug into my lower lip and cut it in half. Good thing we took the trench, otherwise I wouldn’t be alive to laugh about it. The doctors stitched my lip and belly back together, but it scarred over - no room for cosmetics on the front.”</i>");
	}
	processTime(4);
	addButton(0,"Next",talkToAntSloots,gold);
}

//Approach (Pregnancy Event)
public function specialRedAntPreggosShitEvent():void
{
	clearOutput();
	showDeserter(false);
	// This is a once-off scene that occurs three or more months after red myr impregnation. The next encounter with the red myr / Briha is this one, where she hands over her egg (or child, if it’s beyond four months) to Steele to have transferred to the nursery.
	// Also treating the first Briha kid as speshul and remembering her details, because Jim will probably write stuff later for her.
	output("\n\nYou’re walking through the desolate and war-torn wasteland. Nearby, you spot ");
	if(flags["KNOW_RED_MYR_NAME"] != undefined) output("Briha");
	else output("a ragged looking red deserter");
	output(". She’s carrying a ");
	//overFourMonthsPregnant: 
	if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("small child wrapped in a bundle in her arms");
	else output("pale white egg in in her arms");
	output(".");

	//First Pregnancy && First Time Ever Seeing Her Pregnant
	if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == undefined)
	{
		output("\n\n <i>“Hi there, soldier. Probably a good as time as any to tell you you’re a father,”</i> she grins, gently stroking the ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“And before you ask, it’s definitely yours. I don’t get laid enough to mix</i>that<i> up.”</i>");
		flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
	}
	//Second Pregnancy && First Time Seeing Her Pregnant (this time)
	else if(flags["SEEN_RED_DESERTER_PREGGERS"] == undefined && flags["RED_MYR_BIRTHS"] == 1)
	{
		output("\n\n<i>“Hi there, soldier. You’ve gone and done it again - another bundle of joy,”</i> she grins, gently stroking the ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“We really do have beautiful children, you know?”</i>");
		flags["SEEN_RED_DESERTER_PREGGERS"] = 1;
	}
	//Else / Any other pregnancy time:
	else
	{
		output("\n\n<i>“Hi there, soldier. You missed the big event - lucky you!”</i> she smiles, gently stroking the ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("baby’s cheek");
		else output("eggshell");
		output(". <i>“");
		if(flags["RED_MYR_BIRTHS"] == undefined) output("Hurt more than getting shot, but </i>so<i> worth it.");
		else output("We really do have beautiful children, you know?");
		output("”</i>");
	}
	//Don’t Know Her Name:
	if(flags["KNOW_RED_MYR_NAME"] == undefined)
	{
		output("\n\n<i>“OH! By the way, the name’s Briha. Figure you should at least know the name of the mother of your child, right?”</i>");
		chars["RED_DESERTER"].short = "Briha";
		flags["KNOW_RED_MYR_NAME"] = 1;
	}
	var son:Boolean = (rand(2) == 0);
	//FirstKidWithBriha:
	if(flags["RED_MYR_BIRTHS"] == undefined)
	{
		flags["RED_MYR_BIRTHS"] = 1;
		flags["BRIHA_LATEST_SPAWN_AGE"] = 0;
		flags["BRIHA_OLDEST_SPAWN_AGE"] = 0;
		son = false;
		output("\n\nBriha lowers the bundle with a warm, motherly smile.  You edge forward, feeling your heart thumping madly in your chest.");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] < 120) output(" The egg is partially see-through, so you can see your own half-myr child floating within - defenseless, unborn, and truly precious. Even in her semi opaque shell, you can see a glimpse of [pc.hairColor] hair.");
		else output(" The world stops as you look down at your precious little daughter. Her hair, sparse and babyish, is a mess of [pc.hairColor], and two gorgeous [pc.eyeColor] eyes stare up at you.");
		output("\n\n<i>“See? She takes after you. Her name is Aya, after my grandmother,”</i> Briha smiles, then adds, <i>“...And before you say anything, I had to push her out, so I get to name her.”</i>");
		output("\n\nIt’s a girl. You have a baby girl named Aya Steele. You’re a <i>father</i>.");
		output("\n\n<i>“Okay, your time to hold her,”</i> her amber-haired mother tells you, hoisting ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("your newborn daughter");
		else output("the egg");
		output(" into your arms. You smile down at the bundle-wrapped baby, stroking ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120) output("her smooth, puffy cheek.");
		else output("Egg:her outer shell, protecting her from the world she has yet to enter.");

		if(flags["BRIHA_LATEST_SPAWN_AGE"] >= 120)  output("\n\nYour heart stops as your little daughter smiles up at you - an innocent, perfect little smile - and grabs one of your fingers. Her tiny hand clasps it and doesn’t let go. The world seems to stop, just for that perfect moment.");
		output("\n\nCoughing a little, Briha hugs her waist. There’s a tense look on her face. <i>“... Look. I’m a deserter. It-it breaks my heart into a million pieces, but you should take Aya. This place - not just the wastelands, but Myrellion - I don’t want her growing up here.”</i>");
		output("\n\nYou look at her intently. Her words are heavy, like each one is an effort to push out. Motherly concern is written all over her scarred face.");
		output("\n\n<i>“It’s a no-brainer, right? This world might end any moment, and even if it doesn’t, I’m a deserter. The Scarlet Federation will never take me back and I can never go to the Golds. What kind of future can she have here?”</i> She strokes ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] < 120) output("the fragile shell");
		else output("her baby’s cheek");
		output(", a tear running down her half-lidded eye. <i>“... With you, off-worlder, she can have a real future. Something better than this scarred dustball. She can make her mother proud.”</i>");
	}
	//SecondKid:
	else if(flags["RED_MYR_BIRTHS"] == 1)
	{
		flags["RED_MYR_BIRTHS"] = 2;
		flags["BRIHA_LATEST_SPAWN_AGE"] = 0;
		flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] = 0;
		son = true;
		output("\n\nBriha lowers the bundle with a warm, motherly smile.  You edge forward, feeling your heart thumping madly in your chest. ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] < 120) output("The egg is partially see-through, so you can see your own half-myr child floating within - defenseless, unborn, and truly precious. Even in his semi opaque shell, you can see a glimpse of [pc.hairColor] hair.");
		else output("The world stops as you look down at your precious little son. His hair, sparse and babyish, is a mess of [pc.hairColor], and two gorgeous [pc.eyeColor] eyes stare up at you.");
		output("\n\n<i>“Just like Aya, he takes after you. His name is Brahn, after my grandfather,”</i> Briha smiles, then adds, <i>“You know the rules. I do all the work, I get to name them.”</i>");
		output("\n\nA son! You have a son named Brahn Steele. And Aya has a little brother!");
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“... You know what to do. He can’t stay here - take him. Every second I look at him, I love him a little more.”</i>");
	}
	//Else: Third or more kid:
	else 
	{
		flags["RED_MYR_BIRTHS"]++;
		flags["BRIHA_LATEST_SPAWN_AGE"] = 0;
		output("\n\nBriha lowers the bundle with a warm, motherly smile.  You edge forward, feeling your heart thumping madly in your chest. ");
		if(flags["BRIHA_LATEST_SPAWN_AGE"] < 120) 
		{
			output("The egg is partially see-through, so you can see your own half-myr ");
			if(son) output("son");
			else output("daughter");
			output(" floating within - defenseless, unborn, and truly precious.");
		}
		else
		{
			output("The world stops as you look down at your precious little ");
			if(son) output("son");
			else output("daughter");
		}
		output("\n\n<i>“You’re wearing me out, stud!”</i> Briha chuckles, but the mother’s face is positively aglow. <i>“... And another younger sibling for Aya and Brahn. They definitely won’t be lonely growing up - not with this little one to fuss over.”</i>");
		output("\n\nSwallowing hard, Briha turns to you, a somber expression on her face. <i>“... You know what to do. ");
		if(son) output("He");
		else output("She");
		output(" can’t stay here - take ");
		if(son) output("him");
		else output("her");
		output(". Every second I look at ");
		if(son) output("him");
		else output("her");
		output(", I love ");
		if(son) output("him");
		else output("her");
		output(" a little more.”</i>");
	}
	output("\n\nWith a heavy heart, you take your infant child and kiss Briha goodbye. It’s not hard to call a pick-up pod to carry ");
	if(son) output("him");
	else output("her");
	output(" to Tavros station, where a flurry of nursemaids will no doubt make a huge fuss over the new addition to the Steele family. You take your time strapping your child into the cushy, overprotected capsule and making sure the readings are set so <i>nothing</i> happens to ");
	if(son) output("him");
	else output("her");
	output(" - not even the slightest jostle.");
	output("\n\nOnce you finally feel secure in the ship’s integrity, you send it on return back to the space station. You know that you’ll be able to visit ");
	if(son) output("him");
	else output("her");
	output(" any time there.");
	output("\n\nWhen you turn around to look for Briha, she’s understandably gone. Watching the launch must have been too hard for her.");

	// Record firstkid Aya and secondkid Brahn’s haircolor and eyecolor, copying it from the PC’s hair and eyecolor at the time of conception. Don’t worry about the other kids.
	// Add +1 kid to Tavros station.
	// Return to map, scene over.
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	StatTracking.track("pregnancy/briha kids");
	if(son) StatTracking.track("pregnancy/briha sons");
	else StatTracking.track("pregnancy/briha daughters");
	StatTracking.track("pregnancy/total births");
}

/*
output("\n\nMyr Deserter Combat");

output("\n\nCombat Description");

output("\n\n{Gold/Lys:");

output("\n\nYou’re facing off against a grizzled yet beautiful myr deserter. She’s dressed in a ragged Gilden Republic uniform. All the patches - her country, name, rank - have been torn off. Different rips in her uniform brazenly expose her cleavage and belly: the latter has a light, telltale scar.");

output("\n\nShe’s armed with a weathered combat shotgun with a sword bayonet on the end. She holds it in two hands, the other two clutching a pair of service revolvers.");

output("\n\nHer hair is a wild black and her lower lip is notably scarred.");

output("\n\n}");

output("\n\n{Red/Briha:");

output("\n\nYou’re facing off against an amber-haired ant-girl armed with a hatchet and a handgun. Given her desecrated Scarlet Federation uniform - her country, name, and rank patches are all torn off - she’s definitely a deserter.");

output("\n\nHer shirt is torn wide open in a very un-red like manner. Her pert, small breasts are on display, though there’s a bullet scar just to the side of her heart. There’s another scar over her right eye, which she seems unable to fully close.");

output("\n\nHanging from both her gently curving hips are hand grenades. They’re attached to her belt, ready to unclick and throw at a moment’s notice.");

output("\n\n}");
*/

//Combat Techniques / AI
//The deserter encounters, regardless of color, are pretty much the same stat-wise. Both have no shields, but decent HP and outstanding melee blocking ability to compensate. Basically, the Myr do extremely well against melee characters, but are weak against ranged attacks due to their poor eyesight.

//The deserters do these attacks 2/3rds of the time: ‘Melee Strike’, ‘Shoot’, ‘Barrage’, or ‘Grenade Throw’. The other third of the time, they do lust attacks.
//The Red Myr’s grenade throw is a lust-damage attack. The Gold Myr’s grenade does HP damage instead. Other than that, all the other attacks deal the same type and amounts of damage.
//Deserters are pretty quick on the uptake. If you’re below 40% HP or at 60 or higher lust, they spam HP or lust attacks respectively. If you are both, they opt for lust attacks.


output("\n\nDeserter Messages");

output("\n\nMiss Text: Your attack falls painfully short of hitting its mark. The female myr doesn’t even need to dodge.");

output("\n\nDodge Text: The seasoned soldier throws herself sideways. Your attack misses her by an inch and she deftly tumbles back to her feet.");

output("\n\nBlock Text: The female soldier brings up her {red: hatchet and deftly parries your attack. Throwing you off, she then twirls the hand-axe in her hand.}{gold: bayonet blade and masterfully redirects your attack. You’ve been blocked!}");

output("\n\nLust (PC Success) Text: The deserter’s cheeks flush and she swallows hard. Wiggling madly on the spot, she fails to suppress her arousal. You’ve got her all worked up!");

output("\n\nAttacks");

output("\n\n’Melee Strike’, ‘Shoot’, ‘Barrage’, or ‘Grenade Throw’. The other third of the time, they do lust attacks.");

output("\n\nMelee Strike");

output("\n\n{Red/Briha:");
output("\n\nThe battle-scarred beauty shoots a handful of bullets at you. When you’re dodging those, she darts in and lashes out with her hand-axe.");
output("\n\n}");

output("\n\n{Gold/Lys:");
output("\n\nThe battle-scarred beauty unloads a round of buckshot at you. While you’re dodging it, she darts in and stabs at you with her bayonet.");
output("\n\n}");

output("\n\n[Miss]: Her feint fails - you duck under her slicing blow and scamper out of the way. She reloads her gun with a loud click and a focused stare.");

output("\n\n[Hit]: Her feint succeeds - she lands a glancing blow with her blade {ShieldUp: and your shield crackles in protest/else: and you swear loudly. There’s no shield to stop her strikes}!");

output("\n\n[Critical]: Her feint is an overwhelming success - you’re completely caught off guard as she delivers a powerful strike with her blade. {ShieldUp: Your personal shield whines in protest. What a strike!/Else: With no shield to stop the blow, you’re forced to take it head on. Fuck-!}");

output("\n\nEffect: Decent physical damage. Small crit chance.");



output("\n\nShoot");

output("\n\n{Red/Briha:");
output("\n\nThe red deserter pulls back the jointed lock of her semi-auto handgun. After lining you up in her iron sights, she shoots.");
output("\n\n}");

output("\n\n{Gold/Lys:");
output("\n\nThe gold deserter reloads her combat shotgun and dashes up to you. Without aiming, she whips up the barrel and shoots.");
output("\n\n}");

output("\n\n[Miss]: Her attack falls far short of hitting you. Instead, {Red: her bullet whizzes past/Gold:the buckshot whizzes past} harmlessly.");

output("\n\n[Hit]: There’s a {Gold:cracking boom/Red:ringing shot} and your {GotShield: shield wildly flashes/NoShield: {Gold: chest is pelted with hot, fiery needles/Red: a fiery string passes through your chest}}. You’re knocked back{GotShield: <i>“, but your shield absorbs the impact.”</i>/KnockbackSuccess: and off your feet!”</i>/KnockbackFail: <i>“, but you don’t lose your footing.”</i>}");

output("\n\n[Critical]: There’s a {Gold: cracking boom/Red: ringing shot} and {GotShield: your shield violently flashes/NoShield: a hot, burning sensation sprays out from your chest. {Gold: You’re knocked back and off your [pc.feet]/Red: Your [pc.legs] go weak and you fall to the ground.}");

output("\n\nEffect: Decent physical damage with small crit chance. If the PC’s shields are down, there is a 25% knockback chance. 100% knockback chance on crit.");


output("\n\nBarrage");

output("\n\n{Red/Briha:");
output("\n\nThe grizzled soldier loads her semi-auto with a fresh magazine. After clicking back the arm-lock, she points it at you, and shoots repeatedly.}");

output("\n\n{Gold/Lys:");
output("\n\nThe grizzled soldier reloads her combat shotgun with fresh bullets. Pointing it at you, she unloads three consecutive blasts.");
output("\n\n}");

output("\n\n[Miss]: Her attack falls far short of hitting you. Instead, {Red: her bullets whiz past/Gold:the buckshot whizzes past} harmlessly.");


output("\n\n[Hit or Crit]: Your {GotShield: shield is pelted with bullets and it wildly flashes/NoShield: chest is pelted with bullets. Thin, fiery strings burn through you and sap your strength.} {Crit: <b>It’s a critical hit!</b>}");

output("\n\nEffect: High damage, low crit. No knockback chance.");

output("\n\nGrenade Throw");

output("\n\n{Red/Briha:");
output("\n\nThe scarlet-skinned soldier grabs one of the hand grenades from her lightly curved hip. With practiced precision, she lights the fuse, and tosses it at you.");
output("\n\n}");

output("\n\n{Gold/Lys:");
output("\n\nThe gold-skinned soldier moves two of her hands behind her back. Before you know it, she’s tossing a pin away with one hand. The other lobs a pineapple grenade at you!");
output("\n\n}");

output("\n\n[Miss]: With such shoddy vision, her grenade throw falls short of her mark. You dart back and easily dodge the resulting blast.");

output("\n\n[Hit - Red] There’s a loud ‘whump’ and a cloud of red mist swiftly engulfs you. Your skin prickles and your [pc.nipples] harden. Lower down, your [pc.groin] gloriously ache{s}. All you want to do is touch yourself!");

output("\n\n[Hit - Gold] There’s a loud explosion, followed by a deafening ringing noise. {Shields: Your shields waver and wobble, absorbing the concussive blast./NoShields: Shrapnel sprays your body and mark your [pc.skinFurScales] with thin, burning lines.}");

output("\n\nEffect: Decent attack success chance. For Gold, moderate phys damage. For Red, moderate lust damage.");

output("\n\nLust Attack #1 (Both)");

output("\n\nWith a sultry wink, the battle-scarred beauty runs her slender fingers down her torn top and tugs open her shirt. She flashes {Red: a scarlet-skinned breast and dark nipple at you. Even though it’s modestly sized, it’s perfectly round and cuppable!/Gold: a honey-hued breast at you. It jiggles out of its confines and you get a good glimpse at her dark, pierced nipple.}");


output("\n\nLust Attack #2 (Red Only)");

output("\n\nSpreading her legs, the battle-scarred beauty slides her hands between her thighs and tugs at the top of her pants. The upward pull forces the thin fabric to dig into her snatch. It forms the perfect camel toe, and a slight damp patch begins to form.");

output("\n\nLust Attack #3 (Gold Only)");

output("\n\nThe buxom gold deserter turns on the spot and raises her alien hindquarters. She exposes her glistening egg-slit to you. It winks invitingly at you, promising otherworldly pleasure.");

output("\n\nPC Loss");

output("\n\n{HP Loss:");

output("\n\nThe last of your strength leaves your battered body. {NotTripped: Suddenly you’re falling backward. You hit the ground and the air leaves your chest in a giant <i>“oof”</i>. All you’re able to do now is stare at the cavern roof, your limbs heavy and useless./Tripped: You’re unable to lift your limbs to get off the ground - they’re heavy and useless.}");

output("\n\nRather than leave you battered and bruised, the [monster.skinColor] skinned soldieress pulls out a first aid kit. She dutifully patches you up, bandaging and dressing your wounds. The salve she puts on it instantly numbs your ails.");

output("\n\n{First time Fighting Her:");

output("\n\n<i>“There you go, hon,”</i> the scrappy deserter smiles, patting your patched up cheek. <i>“... I told you it’s just your turn to be on the receiving end. I may be a turncoat, but I’m not a </i>total<i> bitch - just a little bit of one.”</i>");

output("\n\n}");

output("\n\n{else (not first time):");
output("\n\n	");
output("\n\n<i>“We just keep on running into each other, and you keep drawing the short end of the stick. It’s nothing personal, hon,”</i> the scrappy deserter reassures you, patting your patched up cheek. <i>“How about I find a way to make it up to you? I’ve got a few ways in mind.”</i>");

output("\n\n}");
output("\n\n}");


output("\n\n{Lust Loss:");

output("\n\nYou’re so aroused you can barely think straight. Panting heavily, {your [pc.weapon] slips from your fingers. Instead of picking it up,/you can no longer make a fist. Instead,} you find yourself touching yourself, fanning the flames of your wildly raging libido instead of putting them out.");

output("\n\n{PcNotTripped:");

output("\n\nStriding up to you, the seasoned soldieress presses a palm against your [pc.chest]. With a simple push, she knocks on your back. Instead of getting up, you gulp with delight. What does she have planned for you? A delighted shiver of anticipation scampers up your back.");

output("\n\n}");

output("\n\n}");

output("\n\n// If Red, Dildo Screw Sex Scene");
output("\n\n// If Gold, Sit and Screw Sex Scene");


output("\n\nPC Win");

output("\n\n{HP Loss:");
output("\n\n	");
output("\n\n{Don’tknowname: The} [monster.name] falls to her feet, utterly spent. Her {gold: combat shotgun and service revolvers/red: hatchet and primitive pistol} slip out of her hands. There’s a series of whumphs as they hit the ground.");

output("\n\nThere’s not an ounce of fight left in her - her exhausted expression affirms her submission to your superior skill.");

output("\n\n<i>“{First time meeting her: <i>“... Guess you weren’t such an easy mark after all.”</i>/else: <i>“... Guess it’s my turn after all.”</i>} My life is yours, soldier. What are you going to do with me-?”</i> Her singularly black eyes {Red: - one partially closed -} stare at you.");

output("\n\n}");

output("\n\n{Lust Loss:");

output("\n\n{Don’tknowname: The} [monster.name] falls to her feet and drops her weapons. Instead of picking them up, she feverishly touches herself. Her face is flushed as she lets out lewd little moans.");

output("\n\n<i>“... F-fuck-! I-I can’t stop!”</i> The [monster.skinColor] skinned deserter moans, <i>“It’s been far too long since I’ve had a good lay. Come on, soldier, h-have your way with me.”</i> She begs.");

output("\n\n{Red Only:");
output("\n\nRaising her knees and hips, she lewdly displays the damp spot between her thighs. The fabric against her pussy is utterly soaked. It clings to her pussy lips, showing you her sinful contours.");
output("\n\n	}");

output("\n\n}");

output("\n\nWhat do you do with her?");

output("\n\n[Dildo Screw] [Sit & Screw] [DoggyStyle] [Anal Sex] [Cum Spluge] [Hand Play]");



output("\n\nSex Scenes");


output("\n\nHand-Play (Gold)");

output("\n\n// PC can be any gender.");
output("\n\n// Not Available on PC loss");
output("\n\n// No fucking taurs.");
output("\n\n// Must have frontgenitals.");

output("\n\nYou ask {the} [monster.name] if she’ll pleasure you with all those hands of hers.");

output("\n\n<i>“Of course I can,”</i> she saucily smiles. {PCNotNude: Putting one hand on her hips, she gestures with the others at your clothes. <i>“You’ll want to take those off, while I watch. I insist.”</i>/Else: <i>“Let me just slip out of my clothes first.”</i>}");

output("\n\n{PCNotNude:You strip off your [pc.gear] and she watches with keen interest. Once you’re finished, she/else: She} slowly strips off her battered combat fatigues. Underneath, she’s wearing an olive camo bra and matching panties. Reaching behind her, there’s a tiny click, and her honey-hued knockers spill out, bouncing before your eyes.");

output("\n\nAs you lick your lips, thethe alieness saunters over, her sizable breasts jiggling  about. <i>“... I think it’s better if I leave on my panties. Can’t have you getting too excited, now, can I?”</i>");

output("\n\n{She/Lys} runs her finger along your cheek, a sultry smile on her face. You gulp and look down at her awesome cleavage and ring-pierced nipples. They’re so close, and so tuggable...");

output("\n\nBefore you can reach out to tease them, {the} [monster.name] wraps her arms around you. She pulls you close, pressing you against her plush breasts. With so many arms, you truly feel wrapped up by her. <i>“How does this feel? Nice?”</i>");

output("\n\nYou nod and turn your head. Staring into her entrancingly black eyes, you both inch closer together at the same time. Your lips are achingly close. At last, they press together, and she lets out a happy noise. Parting your mouth, your wet tongues touch and wrestle as you make out with {the gold myr/Lys}.");

output("\n\nAs you’re kissing her, two of her hands slide up to cup your cheeks and pull your face closer. Another hand teases down your naked spine, tracing up and down. You instinctively shiver with delight, relishing in the tantalising sensation as her tongue dances with yours. There’s so much going on at once, your senses feel like they’re overloading!");

output("\n\nYour lips part and {the} [monster.name] slowly kisses down your jaw and neck. You shiver with delight as she trails her way southward, making her way to your collarbone. She suckles on it, leaving little flushing marks.");

output("\n\nShe kisses down your body, plump breasts sliding down your [pc.skinFurScales]. Stopping face-first in front of your [pc.loins], she {pc.gotCock: reaches up and wraps her fingers around [pc.oneCock]. {AndGotBalls: Another hand reaches up to gently cup your [pc.balls]}./ElseGotPussy: gently probes [pc.onePussy]. You gasp as she slips a finger inside of you and wiggles it about. {AndGotClits: Another hand reaches up to flick and tease your [pc.clits].}");

output("\n\n{The} [monster.name] masterfully teases your loins, {stroking and cupping your [pc.cockNounSimple] and balls/stroking and fingering your sopping wet slit}. One of her hands slides {Two or more legs/between your legs/else: around your waist}. A single finger presses between your buttocks and slides inside of your [pc.assHole]. You moan in delight as {gotCock: you’re jerked off and fingered{, the while having your [pc.sack] simultaneously fondled}/you’re simultaneously fingered in both your [pc.pussy] and ass{, all the while having your [pc.clits] rubbed}}.");

output("\n\nJust when there’s nothing left for her last hand to touch, you look down to see {the} [monster.name] cupping and teasing her voluptuous breasts. She looks up at you with a sensuous grin on her honey-hued lips, teasing her plump puppies as she {tugs and finger-fucks you/double finger-fucks you}. Her delving digits brush your {prostate/g-spot} and you’re pushed over the brink!");

output("\n\nWith a loud cry, your [pc.thighs] quake and you {shoot [pc.cumColor] [pc.cumVisc] ropes of [pc.cumNoun] all over her cheeks. She continues to jerk you off and tickle your prostate, coaxing you to unload on her face, a satisfied smile playing on her spunk-stained lips./spastically cream yourself around her fingers. You wildly clench and drench them in your [pc.girlCum], bucking your hips wildly against her knuckles.}");

output("\n\nOnce you finish twitching, she pulls her fingers out and languidly licks your {[pc.cumNoun]-coated cock{s}/sloppy slit{s}} until {it is/they are} completely clean. Pulling back, she looks so satisfied you half-expect her to purr.");

output("\n\n<i>“Well, that was fun - thank you for the meal,”</i> {the} [monster.name] grins, slipping her clothes back on. Once she’s done, she gives you a quick kiss, picks up her weapon, and saunters off onto the battlefield.");

output("\n\nAnal Sex (Red)");

output("\n\n// PC must have cock.");
output("\n\n// Not available on PC loss");

output("\n\nYou stride up to {the} [monster.name], {OnBattleWinOnly: ,pull her to her feet} and turn her on the spot. Without warning, you you pull down her camo pants and underwear, and she lets out a cry of surprise.");

output("\n\n<i>“W-what are you planning...”</i> She breathlessly asks. Without answering, you {pull out [pc.oneCock] and grind it between her bare red buttocks. Her muscular butt feels divine against your [pc.sheathe], clenching it instinctively.");

output("\n\nAs you grind against {your pregnant lover’s/her} ass, you slide your hands up the bottom of her top and the camisole underneath. Her pert breasts are perfectly hand sized and you cup them with relish. The female soldier moans and arches her back into your efforts, rubbing her round butt against your stiffening tool.");

output("\n\n<i>“M-more... my nipples,”</i> she huskily begs. You indulge her. Lightly pinching her puckered buds, she trembles in your arms, letting out little gasps and moans. As you roll them between your fingertips, she practically melts in your arms. The more excited she gets, the more she wiggles her backside against [pc.eachCockNoun], stoking your lust and making you achingly stiff.");

output("\n\nYou order {the} [monster.name] to bend over, and she obediently does as you ask. Grabbing her gently curved hips in your hands, you press your [pc.cockHead] between her taut buttocks. {First Time: She lets out a squeal of protest when she realizes what you’re doing. <i>“W-w-w-what are you doing? N-not in </i>there<i>, that’s the wrong hole-!”</i>/She shivers as she realises what you’re doing. <i>“Y-you’re going to stick it in </i>there<i> again? But that’s so naughty...”</i>}");

output("\n\nYou tease her extremely cuppable breasts some more. Her protests lessen, until at last she caves, <i>“... O-o-oh all right. B-but be gentle, all right?{ It’s my first time.}”</i>");

output("\n\nWith a devilish grin, you continue to push your [pc.cockHead] into her narrow crack until it is pressed flush with her naughty pucker. Telling her to relax, you continue to grope and tease her tits.");

output("\n\nFinally, {the pregnant myr’s/the female soldier’s} narrow hole begins to slacken, and you’re able to slowly slip your tip inside. Because she’s so tense, her ring and rectum are gloriously tight. At the same time, it takes a lot of effort to sheathe yourself inside of her muscled backside.");

output("\n\nWhen at last your [pc.cock] bottoms out inside of her butt, you let out a throaty groan. Every inch of her narrow confined are deliciously wringing you. Reflexively, your [pc.cockHead] swells deep inside of her ass, and she lets out another sharp cry. <i>“... O-Oh - you’re breaking my ass!”</i> Her whole butt tenses up. Void; she’s so tight inside it’s almost criminal!");

output("\n\nHolding her back against you, you suck on her neck and pinch her nipples. Her clinging insides ripple around your [pc.cock]. Moaning into her shoulder, you can’t help but thrust upwards, using gravity to fully impale her on your turgid tool. This time {the} [monster.name] lets out a loud moan and trembles against you.");

output("\n\nEnthused by her response, you slowly pull yourself around of her naughty pucker and slide back in. Soon you’re slapping your hips against her rippling ass, the air filled with your shared moans and the lewd slapping of flesh.");

output("\n\nFeeling her flex and wring your [pc.cock] drives you into a lusty frenzy. You pinch and roughly tease her breasts, and the {female soldier/Briha} lets out a delighted cry. Her whole body quakes and she reaches up, clinging to your hands as she cums. Feeling her insides ripple and ring your throbbing tool pushes you over the brink, and you liberally unload your [pc.cum] inside of her tensed rectum.");

output("\n\nOnce you’re both finished cumming, you slowly pull out of her trembling buttocks. With a loud plop, you remove your [pc.cockHead]. Her asshole is left gaping in your absence, and a {tiny stream/long stream/river} of [pc.cumColor] pours out of her dark hole and dribbles down her glistening pussy lips. She moans in delight from your anal creampie, reaching between her thighs and massaging your [pc.cumVisc] [pc.cumNoun] into her crimson snatch.");

output("\n\n<i>“Mmm- that was really intense.”</i> she gasps, fingering your spunk into her hole. Even though you’ve just came, as she toys with her sloppy slit, you feel yourself twitching in response. What a sight! <i>“I think my ass is going to need a rest after that. It’s going to be a while before I can sit down.”</i>");

output("\n\nPulling up her trousers, {the pregnant woman/the red myr} gives you a saucy smile and then saunters off. You decide it’s probably time to get going as well.");



output("\n\nCum Splurge (Red)");

output("\n\n// Pc must have a cock.");
output("\n\n// Not available on loss.");

output("\n\nYou ask {the raven-haired deserter/Briha} to go down on your [pc.cocks]. She puts a hand on her hip and quirks a brow.");


output("\n\n{FirstTimeGivingYouHead:");

output("\n\n<i>“Are you sure? Asking my people for a blowjob... well, let’s just say you won’t be walking anywhere for a few hours,”</i> she playfully cautions, then adds,”</i>... Or so I hear. I’ve never had the chance to give one, you know?”</i>");

output("\n\n<i>“You’ll also have to put up with me being terrible. I mean, I’m confident in my venom, but not so much my technique, you know-?”</i>");

output("\n\n}");

output("\n\n{Else / Not first time:");

output("\n\n<i>“Well, if you’ve got the spare time, I mean, if you won’t be using your legs for the next few hours,”</i> {the pregnant woman/she} grins.");

output("\n\n<i>“I’m all for it. There’s something... I don’t know... indescribably satisfying about licking your [pc.cocksNoun].”</i>");

output("\n\n}");

output("\n\n{You hastily strip off until you’re standing in the buff. Meanwhile, she takes it slow, slipping/Slowly, she slips} her torn combat fatigues. Underneath she wears a simple cotton black camisole and a matching thong. Her top barely covers her [monster.belly] and accentuates her well-rounded breasts. You can see her nipples poking through the fabric.");

output("\n\nSeeing her in such a sexy yet simple outfit makes your [pc.cocks] stiffen. When she pulls off her top and bares her pert puppies, your [pc.cockHeads] {is/are} already pressing against your {Small: waist/Mid:belly/Long: chest}.");

output("\n\n<i>“Mmm, I see you’re already standing to attention, soldier,”</i> she chuckles. Sauntering over in nothing but her underwear, you see you’re not the only one who’s stiff. Her dark red nipples are already puckered. As if you didn’t have enough eye candy!");

output("\n\n{Pregs:With a little bit of effort, your large-bellied lover/She} drops to her knees before your dick{s}. With flushed cheeks, she inches closer to {it/them}. Her hot breath washes over your sensitive skin, electrifying your senses. You let out a low, throaty groan. How can you be this aroused when she hasn’t even <i>touched</i> you yet?");

output("\n\nWith a lick of her lips and intensity in her alien eyes, {the female deserter/Briha} edges closer to [pc.oneCock]. She parts her scarred mouth and gives {your [pc.sheathe]/one of them} a tentative lick. Her inexperience is obvious, but her face is flushed from lust. Is she acting on instinct?");

output("\n\nAs every groove of her tongue bastes your underside{s} in her warm saliva, you shiver with delight. Up and down, she lavishes your [pc.cocks] in her wetness. It’s not long before a fierce, fiery sensation begins to burn upwards from your loins. You flush with delight as diffused ecstasy seizes every inch of your body.");

output("\n\nWith a few more licks, your [pc.cockHeads] deliciously twitch{es} and begins to dribble [pc.cumNoun] like {a broken faucet/broken faucets}.  When her wet lips brush against your crown{s}, you feel it in achingly exquisite detail - the venom is definitely having an effect!");

output("\n\n{Your pregnant lover/The red deserter} suckles on {one of your shafts/your shaft}. You let out an rapturous cry. Without warning, you cry out and shoot [pc.cumVisc] ropes of [pc.cumNoun] all over her face. Your head{s are/is} so hypersensitive you almost faint from the pleasure as jets out your cock hole{s}.");

output("\n\nAfterwards, you fall down in a trembling mess. Your lower body is still trembling and twitching, and [pc.cumColor] [pc.cumNoun] is still spurting and gushing out of your dick{s}. Trying to grab {it/them} in your hands, you instead moan from the brushing of your fingertips against your [pc.cockColor] flesh.");

output("\n\n<i>“Oh, that won’t do-we’re not nearly finished yet,”</i> {Briha/She} purrs. You moan as the red-skinned woman crawls up to you on all fours, clad in nothing but a black thong.");

output("\n\nShe grabs [pc.oneCock], {each of them} now covered in warm spunk. Her slender fingers push through the [pc.cumVisc] mess and grip your hypersensitive pole. Lightning bolts of pleasure fly from your grasped rod. Throwing back your head, you let out a low, primal moan, giving yourself over to pleasure.");

output("\n\n<i>“That’s a good {boy/girl}. Just relax and give into it.”</i> She wraps her scarred lips around [pc.oneCockHead] and suckles wildly on it. You moan and let your hot seed gush out and over her tongue, all the while your [pc.balls] ache in protest. <i>“... Now to take you a little bit deeper.”</i>");

output("\n\nYou’re utterly blown away as she sucks [pc.oneCock] into her moist mouth. Her intoxicating saliva mixes with your [pc.cumVisc] [pc.cum] and pools around your [pc.cockHead]. It feels as intense as sex, if not <i>more</i> so!");

output("\n\nAs she sucks you off in her hot, spunk-filled mouth, you groan arch your back, a thin stream of drool trickling down your cheek. Right now you’re nothing but a [pc.race] font of [pc.cumNoun] for her to suck upon and you don’t care. Letting out carnal cries and moans, you buck your hips against her chin, utterly lost in the utter pleasure of her druggy drool, giving over every drop you{r [pc.balls]} have to give.");

output("\n\nYour brain utterly short circuits as she takes your [pc.cockHead] deeper and back into her throat. Babbling with delight, your whole body convulses, and you climax once more. It’s nothing more than a surge in the unstoppable stream drooling from your dick{s}.");

output("\n\n... After several orgasms, your entire body feels like lead. Your world spins and your [pc.cocksNoun] {and [pc.ballsNoun]} are filled with a hot, throbbing ache. Your loins are utterly [pc.cumNoun]-splattered. You can barely see {the} [pc.enemy.name]’s head roaming down at your hips.");

output("\n\nShe drags herself up your utterly sapped body. You tremble and groan as her soft breasts rub up your receptive chest, your loins twitching at the brush of her erect nipples. When she comes face to face with you, she’s wearing a mask of your [pc.cum]. You can smell it all over her - {the pregnant myr/the myr deserter} is utterly marked with your scent.");

output("\n\n<i>“That was fun,”</i> {Briha/she} purrs and licks her lips. When she notices your eyes are rolled back, the soldier instinctively checks your pulse. <i>“... Whoops, did I go a little bit overboard?”</i>");

output("\n\nUnable to lift even a single finger, you lie there on the ground, tiny pearls of [pc.cumVisc] dripping from your [pc.cocksNoun]. {If have won five or more fights: {The} [monster.name] lies on top of you, resting her pert breasts against your chest. Once she knows you’re okay, she gets dressed, kisses your cheek, and slips off.}");

output("\n\nIt takes at least an hour or two before you regain full motion, not to mention the time it takes you to clean up your messy loins. You’re still riding the euphoric high when you finish slipping on your gear. That really was something else!");

output("\n\n// PC loses two hours.");
output("\n\n// Balls are mother-fucking-emptied.");


output("\n\nDoggy Style (Both)");

output("\n\n// PC Win or Non-Hostile Consent Only");
output("\n\n// PC must have a dick.");
output("\n\n// Max capacity 16 inches.");
output("\n\n// Max girth four inches.");

output("\n\nYou stride up to {DontKnowName: the} [monster.name]. In an authoritative voice, you tell her to turn around, and lift her {Gold: abdomen/Red: butt} in the air.");

output("\n\nBlushing furiously, the [monster.haired] haired deserter does as you ask. She rolls on the spot{PregnantRed: - though she’s careful of her [monster.belly] -} and raises up her rear end. {Red: With one swift movement, you pull down her trousers and underwear to her knees. Her glistening red snatch is exposed to your gaze, a perfect camel-toe peeking between her thighs./Gold: Her glistening gold egg-slit is exposed to your gaze, positioned at the back of her large antish ass}.");

output("\n\n<i>“{FirstTime: I-I’ve never done it with a {male/real dick} before, so please be gentle,”</i> she requests/Else: J-Just like last time-?”</i>, she asks}.");

output("\n\nWith a light smile, you strip off your [pc.gear]. It falls to the ground around you, leaving you fully naked. Seeing her bent over, crotch exposed, has already got [pc.eachCock] achingly hard.");

output("\n\nYou can see {DontKnowName: the} [monster.name] peeking back at your turgid length{s}. Her {Gold: alien abdomen/scarlet butt} wiggles in nervous anticipation. Cute.");

output("\n\nReaching out, you slide your fingers and palms across both {Gold: sides of her golden rump/of her springy buttocks}. {PregRed/Your pregnant lover/Else: She} receptively pushes back into your hands. There’s a hot intensity in the air and your thoughts become drugged with lust - you want her, and you want her <i>now</i>.");

output("\n\nWith a not-so-gentle jerk, you pull her wet pussy flush against [pc.oneCock]. Your rigid underside presses against her soft, slippery folds, which part and kiss your undercarriage. Adjusting your movement, you slide your [pc.cockHead] inside of her warm confines and sheath yourself in her {Red:heavenly hole/Gold:otherworldly egg-slit}.");

output("\n\nAs your [pc.cockHead] caresses her inner walls, {DontKnowName: the} [monster.name] croons with delight. She arches her back and presses needily against you.");

output("\n\nYou groan with delight as she wrings your [pc.cock]. Her alien cunt feels so damn <i>good</i> squeezing around you. It’s all you can do not to blow your load. You firmly grab {Don’tKnowName: the} [enemyName]’s rump, holding on as her {Gold:ovi-hole/Red: pussy} milks your manhood.");

output("\n\n<i>“M-more! D-deeper!”</i> {Pregs: The pregnant deserter/Else: She} begs. You slap your hips against her {gold: gigantic gold bottom/red: beautiful red rump}. The air is filled with lewd smacking noises and her juices  dribble down {gold: your thrusting cock {and [pc.balls]}/red: her taut thighs}.");

output("\n\nWith a shrill cry, the [monster.hairColor] haired ant-girl cums out of nowhere, convulsing wildly around your [pc.cock]. She squeezes it hard as her hot juices flood down her narrow canal, spluttering against your [pc.cockHead]. Your entire length is basted in her hot, sticky warmth. Your senses are utterly seized with unspeakable pleasure.");

output("\n\nPushed over the edge, you grab and press your hips flush with her {gold: golden hindquarters/red: spasming ass}. Closing your eyes, you let yourself go to divine release. {Little splutters/Gooey spurts/Liberal gushes} of [pc.cumNoun] shoot from your [pc.cockNounSimple] and deep into her {honeyed/red} snatch, filling it with your seed.");

output("\n\n{Red+NotPregnant: Deep inside of her alien womb, your [pc.visc] seed swims up and seeks her eggs, basting them in your [pc.cumColor] virility.}");

output("\n\n{Knot:");
output("\n\n	");
output("\n\nAs you continuously cum inside of her, your [pc.knot] swells inside of her, locking deep inside of her sloppy pussy. She lets out a cry of surprise as you lock with her, followed by a low, throaty moan. Heightening her pleasure, you gyrate your hips. The stirring and spurting of your [pc.cockHead] inside of her [pc.cumNoun]-filled hole drives her to insensibility and reduces her to a babbling, pleasure-wrecked mess.");

output("\n\n}");

output("\n\nAfter what seems like an eternity of pleasure, you pull out of her {Gold: egg-hole/Red: snatch}. There’s a loud plopping noise and {tiny drops/thin streams/thick, gooey streams/a torrent} of [pc.cum] floods {red: down her well-worn thighs/gold: out of her winking, well-fucked snatch}.");


output("\n\nCrawling on her wobbly knees, {DontKnowName: the} [monster.name] turns around and grabs your sloppy [pc.cockNounSimple]. Slowly and intimately, she licks it clean, not letting a single drop of your [pc.cumFlav] [pc.cumNoun] go to waste.");

output("\n\n{Red/Briha:");

output("\n\nAs {Preg: the pregnant myr’s/else: her} drug-like saliva washes over your spunk-covered staff, a euphoric haze grips you and won’t let go. Your [pc.cock] stiffens once more and trembles. Letting out a sharp gasp, a tight pressure builds and coils in your loins. All it takes is a few more licks, and you’re spurting thick, [pc.cumVisc] ropes of [pc.cumNoun] all over her face and basting it in your seed.");

output("\n\nWith a satisfied smile, she looks up at you, her face utterly coated in [pc.cumColor]. She wipes off her cheeks, letting your gooey strings stick to her fingers. One by one, she sucks your [pc.cumFlav] [pc.cumNoun] off her fingers, a look of fluttering ecstasy on her face.");
output("\n\n}");

output("\n\n{Gold/Lys:");

output("\n\nOnce the raven-haired myr is finished, she looks up at you and erotically parts her mouth. Her lips and tongue  are  coated in [pc.cumColor].  With a single lick and gulp, she swallows the remainder.");
output("\n\n}");

output("\n\n<i>“... Delicious - your [pc.cumFlav] spunk really is delicious,”</i> she murmurs. <i>“{FirstTime: Does all of it taste like that, or just yours?/I really am addicted to the taste...}");

output("\n\nWhen she can finally stand, {Don’tKnowName:the} [monster.name] gives you {gold: a long goodbye kiss. As you’re swooning, she/Red: a quick peck on the cheek. As you’re lightly swooning from her intoxicating saliva, she} slips off with her clothes in her arms.");


output("\n\nDildo Screw (Red)");

output("\n\n// Two variants - PC loss and PC Win/Consent version. For Red Only.");
output("\n\n// Also a variant for the first time you get this scene, either loss or win/consent, where she introduces the dildo.");

output("\n\n{IF PC LOSS:");

output("\n\nFrom her kitpack, {Don’tknowname: the} [monster.name]} pulls out an imposing dildo, a full eight inches of veiny goodness. {Pregs: Your pregnant lover/Else: She} straddles your waist, sitting on top of you, and touches it against the tip of your nose.");
output("\n\n	");
output("\n\n	{ First Time Seeing Dildo Screw Scene:");

output("\n\nYour eyes cross as you stare at the camo-colored cock. It’s shaped just like a myr cock, but instead of being scarlet, it’s a mottled green from tip to base with the occasional splotch of chocolate brown.");

output("\n\n<i>“Like it?”</i> She purrs, <i>“It’s standard issue for us girls in the trenches. I’ve spent many a happy night with the Private inside of me, both of us quivering away.”</i>");

output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. It’s shaped like a dildo, but it’s actually a vibrator? Two separate motors - one in the tip and another in the base - wildly whir.");

output("\n\nDoes it look so thick because it’s right in front of your eyes, or is it <i>really</i>that big? A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");
output("\n\n	}");

output("\n\n	{Else / Not first time:");

output("\n\n<i>“You remember the Private, don’t you? That delicious feeling of him quivering about inside of you-I bet you missed it,”</i> she purrs.");

output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. The two separate motors - one in the tip and another in the base - wildly whir. A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");

output("\n\n	}");

output("\n\n}");

output("\n\n{ELSE PC WIN/CONSENT:");


output("\n\n	{ First Time Seeing Dildo Screw Scene:");

output("\n\nYou notice there’s a sizable lump in her kitpack. Curious, you ask her what’s inside of it.");

output("\n\nSurprised by your interest, the amber-haired ant-girl pulls out an imposing dildo, a full eight inches of veiny goodness. It’s shaped just like a myr cock, but instead of being scarlet, it’s a mottled green from tip to base with the occasional splotch of chocolate brown.");

output("\n\n<i>“... This? It’s standard issue for us girls in the trenches. I’ve spent many a happy night with the Private inside of me, both of us quivering away.”</i>");

output("\n\nYou ask {Don’tknowname: the} [monster.name] if she could use it on you. She blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");

output("\n\n<i>“... Of course. I mean, I’m no stranger on using it on other{PCisGirl: <i>“ girls”</i>/else: <i>“s”</i>},”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches the toy against the tip of your nose.");

output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. It’s shaped like a dildo, but it’s actually a vibrator? Two separate motors - one in the tip and another in the base - wildly whir.");

output("\n\nDoes it look so thick because it’s right in front of your eyes, or is it <i>really</i>that big? A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");

output("\n\n}");
output("\n\n{Else / Not First Time:");

output("\n\nYou ask {Don’tknowname: her} [monster.name] if she could use the Private on you. She shoots you a saucy grin, clearly happy with your request.");

output("\n\n<i>“... Of course. Lie back and I’ll whip him out,”</i> she smiles. The beautiful deserter gestures for you to lie back on the ground and you do so. She straddles your waist, sitting on top of you, and touches it against the tip of your nose.");


output("\n\nThere’s a clicking noise. The synthetic wang begins to wizz against your sensitive nose. The two separate motors - one in the tip and another in the base - wildly whir. A matching shiver courses through you, starting at your nose and ending at your [pc.toes].");

output("\n\n	}");
output("\n\n}");

output("\n\nShe runs it across the side of your cheek. The trembling tool pulses against your [pc.skinFurScales]. Gently, you part your [pc.lips], which are sensitively quaking from the point-blank pulsing. A breathy sigh escapes your lips and your heart begins to race.");

output("\n\nWhere is she going to stick it? Your mouth, {your pussy,} or perhaps in your ass? You can’t wait to find out!");

output("\n\nAs she runs it down your neck, a glorious shiver courses through your body, and you let out a loud, breathy moan. She presses it against your earlobe, your lips, your collarbone... it’s like a trembling wand. Everywhere it touches, magic sparks fly through your [pc.skinFurScalesNoun].");

output("\n\n<i>“Oh, you like it-? Trust me, I’m getting </i>just<i> as much pleasure watching,”</i> {DontKnowName: the battle-beauty/else: [monster.name]} whispers. Running the throbbing tip against your cheek, you find yourself rising to rub against it like a cat, your eyes half-lidded from dizzy pleasure. Void, she hasn’t even stuck it in yet!");

output("\n\nDesperate for further heights of pleasure, you meekly lift your [pc.hips] in the air. {NotNeuter:{GotCock: Your {[pc.cocks] {is/are} achingly hard}{Herm: and your}{GotPussy: [pc.pussies] {is/are} glistening wet}{ArmorOrLowerUnderwear: under your [pc.lowerUndergarment]/else: .}");

output("\n\n<i>“P-please... i-in my {GotPussy?: pussy/else: ass},”</i> you breathily beg. Every inch of your being aches for it inside of you, stirring up the inside of your {snatch/butt}.");

output("\n\n{GotArmor: After stripping off your [pc.armor], she/Else: She}{presses the pulsing phallus against your {GotUpperUndergarment: covered nipple, the vibrations deliciously travelling through your [pc.upperUndergarment]./Else: naked nipple.} Your [pc.nippleColor] nub receptively stiffens.");

output("\n\n{PCHasUpperUndergarment: <i>“Let’s get this out of the way, shall we-?”</i> {Don’tKnowName:The} [monster.name] whispers. She sensuously strips off your [pc.upperUndergarment] and/Else: Taking advantage of your toplessness, the deserter sensuously} kisses your [pc.chest]. Her soft lips tickle and brush your [pc.skinFurScales]. Your whole body prickles and feels ultra sensitive - every little touch feels deliciously electric and you tremble in delight. Is this the effect of her venom-?");

output("\n\nHer other hand slides down and out of sight. Between your [pc.thighs],  {IfPcHasLowerUndergarment: she tugs at your [pc.lowerUndergarment]. The fabric rubs against your [pc.groin], /elseNoUndergarment: she strokes {[pc.oneCock]/[pc.onePussy]/your bare loins}, }{NotNeuter: making you {Peen:  even more hard}{else if Vag: even more wet wet}/else Neuter: getting you even more worked up}. You let out a low, breathy moan. Instinctively, you lift your hips and grind against her hand, enthusiastically meeting her efforts.");

output("\n\n{GotLowerUndergarment: {Loss: No longer caring about your loss, you aid her as she/Else: She strips off your {gotPussy: damp} [pc.lowerUndergarment] and tosses it aside. Afterwards, you}{No LowerGarment: You} strip off her torn uniform, exposing the beautiful, scarlet-skinned body beneath. Her well rounded breasts are enough to make you gulp, not to mention her hard, puckered nipples.");

output("\n\nYou {fem: cutely/masc: teasingly} lick one of her dark buds. She lets out a husky moan and presses her pert breasts against your face and lips. You suckle and nibble on it, relishing in her naked body trembling against your [pc.skinFurScalesNoun], and her moist pussy rubbing against your [pc.thigh].");

output("\n\n<i>“Turn around and bend over,”</i> the naked deserter breathily orders you, her cheeks flushed with arousal. You obediently flip around and get on your hands and knees, raising your [pc.ass] {and [pc.tail]}.  Already, your {GotCock?: [pc.cocks] {is/are} pressing firmly against your [pc.belly] and dripping with pre-cum{Herm: , while your}{gotPussy: [pc.pussies] {is/are} sopping wet.}{FuckingNeuter: [pc.legs] {is/are} quivering with delight.}");

output("\n\nDragging the Private up your {inner} [pc.thigh], she drags it up to your {[pc.pussy]/[pc.ass]}. You moan as she drags the trembling tip around your needy hole, teasing your {slick lower lips/rim}. Pressing forward, she slowly sinks it inside of you. You moan as you’re filled up inch by glorious quivering inch, trembling in tandem.");

output("\n\nYou can feel it rumbling against {your cervix/the deepest part of your rectum} and you let out a carnal cry, bucking backwards against it. {Don’tKnowName:The} [monster.name] pulls back, then plunges it deep into your {Vag: sloppy snatch/Ass: forbidden hole}.  An explosion of pleasure seizes your senses. Void, that feels so good-! You arch your back in delight, panting like a dog, as drool drips down your chin. Animalistic delight seizes you, and soon you’re a slave to instinct, slapping your [pc.ass] back against her hand.");

output("\n\nIt’s not long at all before you reach that euphoric peak. As she stirs the Private around inside of your [pc.vagOrAss] and strains it against your {slippery/narrow} walls, your world becomes searing white. You shake spastically and let out a loud, howling cry{Dick: , shooting your hot, [pc.cumVisc] spunk all over your [pc.belly]}{Herm: and}{Vag: {squirting/ gushing} your warm, [pc.cumVisc] [pc.girlCumNoun] all over her hand}.");

output("\n\nExhausted, you fall face first with your [pc.ass] high in the air, the camo-cock still wobbling away inside of your [pc.vagOrAss]. With each spasmic aftershock, you lightly wring each artificial vein and crevasse. Your mind has melted into a puddle of pure pleasure.");

output("\n\nDimly, you’re aware of light kisses being rained down on your [pc.ass]. When the Private is pulled from your [pc.vagOrAss] with a sloppy, loud noise, you let out a delirious moan. In its place, licks are lavished upon your gaping hole. You shiver with delight - you’re still extremely sensitive right now. A second, lighter orgasm suddenly seizes you, and {Pussy: {you squirt all over her face/you dribble your girl juice all over her face}{elseCock: you shoot another lazy stream of [pc.cum] on the ground}{neuter: your eyes flutter and roll back into your head.}");

output("\n\n{PC Loss:");

output("\n\nSome time later, when you finally come to, you realise {Don’tKnowName:the} [monster.name] has already taken her leave. Shivering, you realise you’re covered in hickies. Not only that, you’ve lost some of your credits!");

output("\n\nGrumbling a little - but not too much - you put back on your [pc.gear]. Thankfully, your [pc.weapon] is not too far off. It seems she didn’t steal <i>everything</i> you owned.");
output("\n\n}");

output("\n\n{PC Win/Consent:");

output("\n\nSome time later, when you come to, you find {Don’tKnowName:the} [monster.name] nestled against your side. She looks up at you with one big, black eye and the other scarred one, peering through her messed up amber hair. Lightly, she grasps at your chest, nails teasing your [pc.skinFurScales].");

output("\n\n<i>“S-so, that was fun{NotFirstEncounter: , as usual},”</i> she breathily states. You’re acutely aware of her pert, naked breasts pressing up against you. <i>“... Um, I guess I should get going? Hopefully I’ll see you around...”</i>");

output("\n\n{The pregnant myr/She} kisses you on the cheek. You slightly swoon from her intoxicating venom, your eyelids fluttering. By the time you come down from your high, {the deserter/Briha has}’s already slipped off.");

output("\n\n}");

output("\n\nSit & Screw (Gold)");

output("\n\n// Two variants - PC loss and PC Win/Consent version. For Gold Only.");
output("\n\n// Also a variant for the first time you get this scene, either loss or win, where she introduces the strap on.");

output("\n\n{PC Loss:");

output("\n\nWhile you lie on the ground, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, your {GotCock: [pc.cocks] stiffen{s}}{Herm: and}{AnyButMale: you feel a delicious tingling sensation deep in your loins}.");

output("\n\nStriding up to you, {Don’tKnowName:the} [monster.name] brushes one of her bare feet against {the underside of [pc.oneCockNoun]/[pc.onePussy]/your loins}{GotArmorOrLowerGarment: <i>“, teasing you through your {[pc.armor]}{and}{[pc.lowerUnderGarment]}.");

output("\n\n{PC GotCock:");

output("\n\n<i>“Mmm, I think I’m going to borrow </i>this<i> for a while,”</i> the naked deserter sultrily purrs, <i>“... You don’t mind, right?”</i>");

output("\n\nRegardless of your answer, the busty battle-maiden strips off your [pc.gear]. You’re left lying there with your aching [pc.cocksLight] brazenly exposed. Despite your embarassment - or perhaps because of it - your [pc.cockHeads] swell{s} with arousal.}");

output("\n\n}");

output("\n\n{Else PC GotNoCock:");

output("\n\n<i>“Mmm, you’re lacking a little something-something here,”</i> the naked deserter sultrily purrs, <i>“... Thankfully, I’ve got just the thing to fix that.”</i>");

output("\n\nFirst, the busty battle-maiden strips off your [pc.gear]. After this, she reaches into her kitpack. Out comes a rather impressive looking strap on - ten inches of golden veiny goodness.  There’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended!");

output("\n\n<i>“We trench girls have got to help each other out. This little beauty is no fun on your own, you know? That’s where you come in,”</i> the raven-haired soldier explains, <i>“... {PChasPussy: How about both of us have a good time?/FuckingNeuter: I’ll have to remove the other end though. Sorry hon!”</i>}");

output("\n\n{NeuterPC:");

output("\n\nShe quickly unfastens the inner dildo and tosses it aside. You flush with embarrassment. So, you’re going to be ridden like a living sex-doll?");

output("\n\n}");

output("\n\n}");
output("\n\n}");

output("\n\n{Else PC Win/Consent:");


output("\n\n{ First Time Seeing Dildo Screw Scene:");

output("\n\nYou notice there’s a sizable lump in {Don’tKnowName:the} [monster.name] kitpack. Curious, you ask her what’s inside of it.");

output("\n\nThe raven-haired ant girl blushes and pulls out a strap-on dildo. It’s pretty impressive - ten inches of veiny goodness - and the same hue as a gold myr’s cock.");

output("\n\n<i>“... This? The Gilden Federation issues this to all the girls on the front line. We’ve got to use it on each other, mind you, since we can’t easily play with ourselves.”</i>");

output("\n\nYou notice there’s another, smaller protrusion on the other side, designed to stimulate the wearer. It’s double-ended! {PChasPussy: You ask her if you can use it on her./PCisNeuter: You ask her if it can be removed so you can use it on her.}");

output("\n\n}");

output("\n\n	{Else / Not First Time Seeing Scene:");

output("\n\nKnowing that {Don’tKnowName:the} [monster.name] has a double-ended dildo in her knapsack, you ask her if she can use it on you.");

output("\n\n	}");

output("\n\nShe blinks her big black eyes, clearly surprised by your request. At the same time, she gulps, and a delighted flush travels across her cheeks.");

output("\n\n<i>“O-of course! {FirstTimeSeeingScene: I mean, I haven’t had anyone to use it with for a while,}”</i> she breathily answers. <i>“Take off your things and lie down - I promise you won’t regret it.”</i>");

output("\n\nYou do as she asks, stripping off your [pc.gear] and lying back. As you watch on, the buxom beauty begins to slowly strip of her torn battle garb. It’s not long before you’re staring longingly at her honey-hued skin and ring-pierced nipples. Despite yourself, your {GotCock: [pc.cocks] stiffen{s}}{Herm: and}{AnyButMale: you feel a delicious tingling sensation deep in your loins}. {Neuter: Meanwhile, she quickly unfastens the inner dildo and tosses it aside.}");

output("\n\n}");


output("\n\n{PC Has No Cock:");
output("\n\n	");
output("\n\nYou lustily gaze at her pendulous breasts and ring-pierced nipples as she slides the strap-on into place. {A moan escapes your lips as your end slides gently into [pc.onePussy].} The female deserter smiles and makes sure the straps are done tight, until they’re well and truly hugging your [pc.hips].");

output("\n\n}");

output("\n\n<i>“Head against the ground,”</i> the buxom beauty requests. As you do so, she stands above your head. Lowering herself down to her knees, she squats over your face. Her bare loins are thrust against your face and she squeezes her ample thighs against your cheeks. You’re pinned down!");

output("\n\nDown below, you feel {[pc.oneCock]/your strap-on cock} being rubbed against with her ovipositor pussy. Since her abdomen stretches so far, it’s nothing for the ant-girl to face-sit on you while riding you with the pussy on her alien hindquarters.");

output("\n\n<i>“I like this position - I can look down into your eyes as we fuck,”</i> {Don’tKnowName:the} [monster.name] giggles, touching your [pc.hair] with her fingers.");

output("\n\nThe feeling is mutual - looking up from between her thighs, your world is filled with her massive mammaries and the golden hoops piercing her puckered nips. It’s a truly exquisite sight!");

output("\n\n{NotNeuter: At the same time, her dripping lower lips are gently teasing your {GotCock: [pc.cockHead]/None: fake cock-head and stirring up your own pussy in the process.} You moan as she lowers herself onto your shaft, swallowing it whole inside her sopping wet honeypot.");

output("\n\n<i>“Ooohh queens-!”</i> The nipple-pierced deserter moans. Your {[pc.cockHead] penetrates her until it’s lightly brushing against her cervix,/gilded cock is soon fully sheathed inside of her and her waist is pressed against your own.} Slowly, she begins to gyrate on top of you, all the while squeezing and wringing your {sensitive/synthetic} shaft. At the same time, her hands rest on your [pc.hair] and her jiggling thighs needily clutch your cheeks.");

output("\n\n{PC GotCock:");

output("\n\nYou groan in delight as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. Deep inside of {her, your [pc.cockHead] swells and twitches, and pearls of pre-cum dribble inside of her hot, narrow tunnel. The whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be blasting and filling her honey hole with your [pc.cum].");

output("\n\n}");

output("\n\n{Else if PC Got Pussy:");

output("\n\nYou let out a muffled moan as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. She’s literally stirring you both up as she gyrates her hips, rubbing the inside of the artificial cock around your inner walls.");

output("\n\nThe whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be creaming yourself around your end of the double dildo. Your thighs tremble with pent-up pleasure as your narrow walls are caressed, the sound of her lewd moans and pressing hips fanning the wet heat between your loins.");

output("\n\n}");

output("\n\n{else PC Neuter:");

output("\n\nYou let out a muffled moan as you watch her grind against you. Her bountiful breasts and nipple-rings bounce and sway before your eyes. The whole thing is insanely erotic, and you’re not sure how long you can hold out before you’ll be creaming yourself just listening to the sound of her lewd moans and feeling of her grinding insistently against you.");
output("\n\n}");

output("\n\nAs you reach climax, a trembling intensity seizes your body. With a choked gasp, you thrust upwards with your [pc.hips]. Your cock-head presses right against {Don’tKnowName:the} [monster.name]’s deepest depths. Quivering and shaking, you wrap your arms around her thick thighs. You can’t hold out any longer - you’re going to cum!");

output("\n\n{GotCock:");

output("\n\nIn a gooey gush, you spurt your [pc.cum] deep inside of the female deserter, letting your sperm {trickle/surge} up into her barren womb. As you climax, the nipple-pierced alieness also reaches her peak, crying out and cumming hard around your [pc.cock]. She spasmically squeezes and wrings your dick for every last drop, her trembling thighs clenching your cheeks.");

output("\n\n}");

output("\n\n{Else NoCock:");

output("\n\nYou both reach your peak at the same time, {GotPussy: both of your pussies clenching the shared length and dribbling your girl juice sloppily against each other./ElseNeuter:  her pussy twitches against you and she spurts and bastes you in her gooey girl juice.} Grinding in your shared spasmic throes, you both twitch and moan. As you cling to her legs, they cling to your cheeks, both of you clutching each other as you cum<i>long</i> and <i>hard</i>.");
output("\n\n		");
output("\n\n}");

output("\n\n{PC Loss:");

output("\n\nAfter you’re both finished, {Don’tKnowName:the} [monster.name] pulls herself off you. Her slick juices dribble all over your waist and you let out a pleasured sigh. After giving you a single kiss on the lips, she pulls the strap-on off your exhausted body, and stashes it back in her kitpack.");

output("\n\n<i>“I’d love to linger, but I really must get going,”</i> she informs you, an inflection of regret in her voice. However, after she’s done dressing, you’re pinned down once more as she steals some of your credits - and you’re too spent to resist!");

output("\n\n<i>“Don’t take it personally, hon. A girl’s got to eat, especially when she’s gone AWOL,”</i> she smiles and tucks the credits into her shirt. Thankfully, she leaves you with your things, slipping away without so much as touching {your [pc.weapon]/your Codex.}");

output("\n\n}");

output("\n\n{PC Win:");

output("\n\nAfter you’re both finished, {Don’tKnowName:the} [monster.name] pulls herself off you and rests against your chest. The pressing of her large, warm breasts, mixed with the cold contrast of her nipple rings, is incredibly pleasant. At the same time, {your [pc.cum] runs down her thighs and drips onto your [pc.legs]/her girl cum dribbles down her legs and onto your [pc.skinFurScales].}");

output("\n\n<i>“Mmm... that was wonderful{FirstTimeEncounter: . It’s been far too long},”</i> she dreamily murmurs. Some of her arms wrap around your waist, while the others stroke your cheeks. <i>“It can get lonely out here in the middle of nowhere. Hopefully I’ll see you around...”</i>");

output("\n\nOnce she’s done cuddling, she pulls herself off you, and you both get dressed. With one last kiss, she slips away into the night. As enjoyable a victory as that was, it’s probably time to move on.");

output("\n\n}");

