import classes.Items.Toys.MindwashVisor;
//Mindwash Visor - By Adjatha with some Poached CoC scenes on the sliiiiide
//CoC Scenes for Mindwash Visor:
//https://docs.google.com/document/d/12UPRoKZyNskoJNRsNElMZ_0QDixsJDs76q3LOJIExtU/edit?usp=sharing
//Add the flagged CoC scenes as bonus content for the Visor, using static body variables


/*Additional Visor smut scene ideas
Futa - The Galaxy's Worst Delivery Girl (uniform, hat, thigh-high stockings, cocksock, blasted liberally by folks who don't want to pay)
Female - Does a Body Good (huge breasted, milky milf with breast pumps hooked to a dildo, the more she orgasms, the more milk is pumped from her tits to her womb)
Male - Size Matters (twinky male bullied by two hyper-endowed dickgirls, smooshed between their cocks while they frot one another with the protag between them)
Female - Daily Chores (farm life gal has stable filled with futa who must be milked for their cum like cows in an unusual way: condom blowjob inflated inside the gal's throat)
Futa - Thrill of the Hunt (bounty hunter in 'zero suit' hunting for bestial humanoid alien seed is overcome and spit-roasted between them)
Male - Sensitivity Training (asshole guy is sent by female employer to be hooked up to electric tabs and vibes, making his whole body hypersensitive, cum by mere touch)
Futa - Workplace anti-harassment video where the player is the aggressive boss and harasses their employees in exaggerated, stereotypical fashion w/ voiceover scolding
Male - Tank Kannon as a secret agent, hit by a mega dongulator ray by evil lethian Dr. Elle Phantis, she splits into three girls, brains, boobs, and butt (doc, elle, and phanny?)
Neutral - "Top Sluts: Spotting the Best" instructional video of going to bars, clubs, and brothels, explaining pros and cons of various sluts in mile-a-minute coked-out way*/

//Broken Lotus
//Allows the player to view a random Mindwash Visor scene from the Lotus Eaters VR Lounge on Canadia Station (maybe a discount of 250 credits)
//Add "Broken Visor" to Luca's "Business" prompt
//[Broken Visor]
//Mouseover (not yet selected) - One of the booths has an "Out of Order" sign over it. Damage from an overexcited guest, maybe?
//Mouseover (repeat) - The damaged VR booth is still roped off, but you're welcome to give it another try.  Cost: 250 credits

//Broken Visor - First Time
public function mindwashBrokenVisor():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	if(flags["LUCAS_MINDWASH"] == undefined)
	{
		output("You ask Luca about the closed off booth.");
		output("\n\n<i>“Ah yes,”</i> she frowns, her expression darkening. <i>“Not all damage comes from rowdy patrons. In this case, I believe we’ve had a saboteur. And right under my nose, too! If I ever catch who did it...”</i>");
		output("\n\nYou ask her what’s wrong with the machine?");
		output("\n\nShe lets out a sigh and waves dismissively. <i>“Rather than playing the approved simulations, that one seems to be picking up random extranet porn. Even worse, the safety limiters have been utterly stripped from the thing. Tess said the damage is so severe, I’d have to replace the whole thing.”</i>");
		output("\n\nYou’re a little surprised she’d keep something that might not be safe to use. Why not trash it?");
		output("\n\n<i>“Well, it’s not my poor baby’s fault, is it? Besides, I don’t think it’s extremely dangerous, just not up to the professional standards of my parlor. I think...”</i>");
		output("\n\nThe modded dzaan gives you an appraising look, her emerald eyes sweeping up and down while her plump lips purse in thought. <i>“I don’t suppose you’d like to take a look for me? See how safe it is to use? I won’t even charge you for it.”</i>");
		processTime(3);
		clearMenu();
		//[No Way]  [Couldn’t Hurt]
		addButton(0,"No Way",noWayMindwash);
		addButton(1,"Couldn't Hurt",mindwashingCouldntHurt);
	}
	else
	{
		output("<i>“Good luck,”</i> Luca offers as you head through the draped privacy cloth covering the sabotaged booth.");
		output("\n\nAs you settle in, you consider that it’d probably be best to keep your messes to a minimum. You strip, putting your equipment away from the splash zone and take your seat.");
		//if Bubble Buddy & penis:
		if(checkToyDrawer(BubbleBuddy) && pc.hasCock()) 
		{
			output(" Speaking of messes, you pull out your Bubble Buddy, and secure it on your [pc.cockLargest]. Picking up goo-filled condoms is a much easier cleanup than wiping down the interior of your ship!");
			if(pc.cockTotal() > 1) output("\n\n ...not that it’s going to do anything for the mess left by the rest of your body. But hey, every little bit helps.");
		}
		output("\n\nYou make yourself comfortable and put on the ‘Mindwash’ Visor. A feeling of elated disorientation passes just behind your eyes as your brain does the mental gymnastics needed to survive the visor’s hypnotic displacement. It flickers from a dangerously vibrant pink color to a more comforting blue and your muscles relax as the light radiates into you.");
		pc.credits -= 250;
		//play random Mindwash scene
		processTime(3);
		clearMenu();
		addButton(0,"Next",startMindwashSceneLucas);
	}
}

public function startMindwashSceneLucas():void
{
	pc.createStatusEffect("LucasMindwash");
	RandomInCollection([pumpTheSpy,invasionOfTheDickSuckers,cowifiedMindwash,petPro,doorToDoorDildos,gymTripScene,poorLittleWhiteGel,bodysuitBubblesScene,breakingTheLaw])();
}

//[No Way]
public function noWayMindwash():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	output("Strap yourself in to a sabotaged machine with no safety system in place? Sounds like a good way to get your brain burned out! You ");
	if(pc.isNice()) output("politely");
	else if(pc.isMischievous()) output("wryly");
	else output("firmly");
	output(" decline the patroness’ offer and excuse yourself. You’re nobody’s guinea pig.");
	///end and remove [Broken Visor] from Luca’s menu
	flags["LUCAS_MINDWASH"] = -1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Couldn’t Hurt]
public function mindwashingCouldntHurt():void
{
	clearOutput();
	showLuca();
	author("Adjatha");
	//non-bimbo
	if(!pc.isBimbo()) output("<i>“I’ve dealt with plenty of crazy machines, I think I can handle this one. Besides, it’s just a little porn, right?”</i>");
	//Bimbo
	else output("<i>“A free ride in the porn machine? And you’re not even going to charge me?”</i> You bounce up and down, clapping your hands in excitement. <i>“Strap me in! Strap me in!”</i>");

	//merge
	output("\n\nLuca smiles and leads you to the roped off booth. Privacy curtains have been hung all around it, but she pulls them aside for the two of you to step in. The state of the machine is a sad one. The compact and stylish visor has been pulled apart and vandalized into little more than a series of plates and wires with a holoscreen between them. The far end of the booth has even been defaced with graffiti, renaming the machine the <i>“Mindwasher”</i>");
	output("\n\nYou can see why she was reluctant to let anybody near this thing.");
	output("\n\nLuca excuses herself from the booth, visibly upset by what’s been done to it. With a bit of trepidation, you take off your equipment and a seat and lower the thin plates of the Mindwash machine to either side of your head. The curved hardlight screen flickers across your field of vision before engulfing your senses. A small host of error messages scroll across the screen before the pink light fades to a soft blue. Your body seizes up, muscles straining and the hot wash of panic surging up your gullet. You force yourself to relax, and the tension melts away. It seems your body can have only one master at a time and the visor is in control for now.");

	//Play random Mindwash Visor scene
	processTime(3);
	clearMenu();
	addButton(0,"Next",startMindwashSceneLucas);
}

public function mindwashNextButtonAndStatAwardsAndClears(cumNum:Number):void
{
	clearMenu();
	pc.taint(1);
	pc.libido(2);
	var noCumHarvest:Boolean = false;
	//Using the mindwash in Lucas
	if(pc.hasStatusEffect("LucasMindwash"))
	{
		pc.removeStatusEffect("LucasMindwash");
		if(flags["LUCAS_MINDWASH"] == undefined)
		{
			addButton(0,"Next",brokenMindwashVisorEpilogue);
			return;
		}
		else IncrementFlag("LUCAS_MINDWASH");
	}
	else if(pc.hasStatusEffect("BadgerMindwash"))
	{
		pc.removeStatusEffect("BadgerMindwash");
		if(flags["BADGER_MINDWASH"] == undefined) noCumHarvest = true;
		IncrementFlag("BADGER_MINDWASH");
	}
	if(checkToyDrawer(BubbleBuddy) && pc.hasCock())
	{
		if(cumNum <= 300) quickLoot(new SmallCumBubble());
		else if(cumNum <= 4000) quickLoot(new MediumCumBubble());
		else if(cumNum <= 10000) quickLoot(new LargeCumBubble());
		else quickLoot(new HugeCumBubble());
	}
	else addButton(0,"Next",mainGameMenu);
}

//After scene ends, add the following:
public function brokenMindwashVisorEpilogue():void
{
	clearOutput();
	showName("\nAFTERMATH");
	author("Adjatha");
	output("You’re still feeling lightheaded when you stumble out of the booth. Luca shuffles to your side and offers her arm to help you from tumbling over. <i>“Well? Is my baby okay?”</i> she asks with motherly worry.");
	output("\n\nYou relate what happened, more or less.");
	output("\n\n<i>“Well, at least it doesn’t seem to be outright dangerous, but I certainly can’t just open it up to the public. People with less mental fortitude might walk away still believing they’re the characters from the simulation! I’ll have to think on what to do with my poor, damaged visor.”</i>");
	output("\n\n<i>“I suppose you’re welcome to use it in the meantime. I’ll even give you half off, as a way of saying ‘thank you’ for testing it out for me.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("LUCAS_MINDWASH");
}

/*Mindwash Visor
//harvested from the Doll Maker and added to your key items menu. Able to install in your ship.
//alternately: buy a Tamani Corp version for mega buxxx?

//Add Mindwash Visor to Dr. Badger’s inventory if the player has not harvested it from the Doll-Maker
//Buy It From Badger
//[Mindwash x1] 5,250 credits
//mouseover: A pair of shallow, nipple-like plates that - once attached to the head - link via a hardlight holo-screen. Apparently Badger heavily modified this so that it broadcasts porn directly onto your memories, as if they were little more than blank canvas. Dangerous to use out in the open, so you’ll have to install it in your ship if you want to try it out.
*/

//[Install]
//upon returning to your ship and using the <i>“Mindwash”</i> item
public function installTheMindwashVisor():void
{
	clearOutput();
	showName("\nINSTALLING");
	author("Adjatha");
	//Not in ship.
	if(!InShipInterior())
	{
		output("You can’t make use of it without any power. Maybe take it back to your ship?");
		clearMenu();
		addButton(0,"Next",useItemFunction);
		return;
	}
	output("Now that you’re safe aboard your vessel, you can take a look at the Mindwash Visor you got from the Bimbotorium. The device is quite small, little more than a pair of plastic discs connected by a curving screen of hardlight. Despite the light hum it lets off, there is a socket on one side that’ll have to be hooked into your ship’s power supply. It seems the little toy is quite an energy hog.");
	output("\n\nYou plug it in next to a large, comfortable seat somewhere not too conspicuous and examine Badger’s visor. With the power on, its normally passive holoscreen is blinking with an inviting pink glow. One last check-through reveals an <i>“intensity”</i> gage on the side. It seems to go from <i>“Fuck Me Up”</i> all the way to <i>“Tabula Rasa”</i> so you go ahead and dial that down to the lowest setting. No sense in taking undue risks when dealing with Badger Tech.");
	output("\n\nNow that you’ve got it, though, do you really want to use it?");
	output("\n\n<b><i>“Mindwash”</i> has been added to your masturbate menu while on your ship!</b>");
	processTime(4);
	flags["MINDWASH_VISOR_INSTALLED"] = 1;
	pc.destroyItemByClass(MindwashVisor);
	clearMenu();
	//Go back to inventory instead?
	addButton(0,"Next",useItemFunction);
}

//[Mindwash]
public function mindwashMeShipVers():void
{
	clearOutput();
	showName("\nMINDWASH!");
	author("Adjatha");
	output("A holovisor that has been significantly altered by Doctor Badger. While broadcasting smut, It induces a state of semi-hypnosis in the viewer, suppressing their sense of self and thrusting them into the role of one of the characters instead. At max power, it could very well be used to brainwash someone, but you’ve turned down the intensity, so it should be safe to use recreationally.");
	output("\n\nWill you plug in, or convince one of your companions to give it a spin?");
	processTime(3);
	clearMenu();
	addButton(0,"Me",useShipMindwashMeee);
	addButton(1,"Celise",mindwashCelise);
	addButton(14,"Back",masturbateMenu);
	//Add Yammi and Pexiga scenes if there is demand for it
	//Maybe get other folks to write a scene or two for Anno & Reaha trying out the Visor?
}

//[Me]
public function useShipMindwashMeee():void
{
	clearOutput();
	showName("\nMINDWASHING...");
	author("Adjatha");
	//first time
	if(flags["MINDWASHED_SHIP"] == undefined)
	{
		output("With a bit of trepidation, you take off your gear, take a seat, and lower the thin plates of the Mindwash machine to either side of your head. The curved hardlight screen flickers across your field of vision before engulfing your senses. A small host of error messages scroll across the screen before the pink light fades to a soft blue. Your body seizes up, muscles straining and the hot wash of panic surging up your gullet. You force yourself to relax, and the tension melts away. It seems your body can have only one master at a time and the visor is in control for now.");
	}
	//repeat
	else
	{
		output("It’d probably be best to keep your messes to a minimum. You strip, setting your equipment away from the splash zone and take your seat.");
		if(checkToyDrawer(BubbleBuddy) && pc.hasCock()) 
		{
			output(" Speaking of messes, you pull out your Bubble Buddy, and secure it on your [pc.cockLargest]. Picking up goo-filled condoms is a much easier cleanup than wiping down the interior of your ship!");
			if(pc.cockTotal() > 1) output("\n\n ...not that it’s going to do anything for the mess left by the rest of your body. But hey, every little bit helps.");
		}
		output("\n\nYou settle in and put on the Mindwash Visor. A feeling of elated disorientation passes just behind your eyes as your brain does the mental gymnastics needed to survive the visor’s hypnotic displacement. It flickers from a dangerously vibrant pink color to the more comforting blue and your muscles relax as the light radiates into you.");
	}
	//merge
	processTime(3);
	clearMenu();
	addButton(0,"Next",mindwashVisorScenes);
}

//Maybe allow players to select gender if we have a lot of these eventually. Tech Specialists can get in there and slow down random selector enough to get a gender choice while non-Techies have to use a computer-savvy follower to do it for them?

//{{ A menu spits a torrent of small, preview images out. With the sheer volume of smut available, it’d be impossible to focus on a single one. With a little effort, you could at least narrow down what kind of character you’ll be inhabiting.
//[Random][Male] [Female] [Futa]  }}

//After making a selection, the game displays a random scene from the appropriate gender

public function mindwashVisorScenes():void
{
	pc.createStatusEffect("BadgerMindwash");
	RandomInCollection([pumpTheSpy,invasionOfTheDickSuckers,cowifiedMindwash,petPro,doorToDoorDildos,gymTripScene,poorLittleWhiteGel,bodysuitBubblesScene,breakingTheLaw])();
}

//Male Scenes
//1 - Pump the Spy
public function pumpTheSpy():void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("The visor’s light grows brighter and brighter before resolving with crystal clarity in an instant.");
	output("\n\nYou stand, arms crossed over your chest, as the gabilani girl rouses from the knock on the head your goons gave her. She’s not much to look at - a mere three and a half feet tall with narrow hips and a svelte frame. Her green skin is stuffed into a tight, black bodysuit, her arms and legs stretched wide and bound to an inclined table. She shakes her head, sending a cascade of long, red hair tumbling over her sharp features, black eyes slowly coming to focus.");
	output("\n\n<i>“The infamous Agent ‘Goblin,’ captured at last,”</i> you begin, rolling the name over your tongue with relish. <i>“We almost had you, back on Kakaris, but you’re every bit as slippery as the rumors say. We took a pretty big hit on that one.”</i>");
	output("\n\nThe spy narrows her eyes, testing her bonds one by one. <i>“Glad to be of assistance,”</i> she retorts. <i>“Anything to keep a credit or two out of your bank account, Thoroughbred.”</i>");
	output("\n\nYou lean forward, resting your palms on her plump inner thighs as you loom with suitable menace. <i>“Ah, but now that I’ve actually seen you, your weakness is all too clear. A gabilani who’s never given birth,”</i> you chuckle. <i>“That’s got to be some kind of miracle.”</i>");
	output("\n\nBeads of sweat trickle down her forehead and into her small cleavage. <i>“What? How would you-”</i>");
	output("\n\n<i>“These hips don’t lie,”</i> you interrupt, running your hands over the spy’s slim haunches. <i>“But don’t worry, I think with a little training, we could make quite a broodmother out of you.”</i> Seizing the thin latex of her suit right at the girl’s crotch, you give a savage yank and tear a hole in it. The flushed, emerald skin of her plump pussy shines up from the gap in her glossy black outfit.");
	output("\n\nWith a grin of wicked satisfaction, you throw off the clasps of your own uniform, revealing the charcoal hued sheath and heavy, basketball-sized testies swinging low against your knees. <i>“No one steals from Thoroughbred and gets away with it, Agent Goblin. It’s time you learned your place.”</i>");
	output("\n\nInch after inch of your massive, equine member begins expanding out of your sheath, flopping down heavily against the squirming operative. It grows inexorably, until all three feet of your bloated breeder lays atop the green girl. In all, your shaft is easily five inches across, with a fat medial ring and bulging veins that pulse with the effort of keeping your erection at full mast. <i>“I’ve broken more rebellious mares than you, gabilani slut.”</i>");
	output("\n\nShe wears a grin of defiance, but the heat radiating from her body tells a different story. <i>“Do you expect me to beg, Horse Member?”</i>");
	output("\n\nUsing both hands to guide the flat crown of your bitch-tamer to the tear in her suit, you press the mammoth cock against her fat pussy lips just hard enough to leave her gasping. <i>“No, Ms. Goblin,”</i> you laugh. <i>“I expect you to get fucked.”</i> Pushing hard, you force the blunt peak of your flesh pillar into the squirming saboteur, groaning at her tightness.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",pumpTheSpyII);
}

public function pumpTheSpyII():void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("The short gabilani shudders, biting back a strangled cry. She grits her teeth and winces as her tender depths are savaged by the swollen lust of your eye-wateringly thick pole. She twists and pulls at her restraints as you buried inch after inch inside her. Hips quivering and chest dripping with sweat, she tosses her head side to side, unable to keep herself from moaning with long-denied need.");
	output("\n\nYou pull one hand up, bracing it against her thigh as your cock bottoms out inside of her. You grunt and give her a few thrusts, growing progressively fiercer with each one. <i>“What, already?”</i> you grumble. <i>“A third of my length is all you can handle? You’re not getting off that easily.”</i>");
	output("\n\nSnapping your fingers at your burly ausar goons, they step up on either side of the secret agent’s head. One roughly grabs her fiery mane of red hair, yanking her head back with his right hand while the left clenches down around her throat. The man zips open the crotch of his uniform, revealing a hefty 10 inches of canine cock, erect and ready to go. He positions himself inches from her reclined face, letting his dick twitch against her cheek as he reaches into a pouch at his side. He produces a handful of slightly gelatinous capsules that seem to glow with an eerie, emerald light.");
	output("\n\n<i>“It might not surprise you to know that most cunts in this galaxy can’t handle me,”</i> you gloat, giving the cock-stuffed slut a hard pump. <i>“But that’s what science is for, see? With a little GaloMax, you bitches will take every last inch and beg for more.”</i> With another nod, your waiting lacky carefully balances three of the pills on the shovel-like peak of his red rocket and jams it into the green girl’s mouth. Her eyes go wide and she chokes, but the meager might of her tongue is not enough to resist the unforgiving strength of the muscled ausar holding her. Every last bit of the thug’s meat slips past her lips until her nose is squashed up against his taut balls.");
	output("\n\n<i>“And just to make sure you don’t spit those pills back up,”</i> you narrate as your face-fucking tough produces a bright pink, hexagonal pill and swallows it with practiced ease. The result is immediate: his body shivers, his muscles tense, his abdomen rumbles, and he blasts a hot load of spunk right down the green girl’s throat, washing the GaloMax down with it.");
	output("\n\nYour underling pulls back before he knots the spy’s mouth, giving her enough air to sputter and gasp. <i>“W-what did you do to me? Everything feels... hot!”</i> Her perspiration-slick skin seems to shimmer, growing wetter and wetter until every inch of her body has a freshly oiled appearance. She pants, pulling at her restraints and finding the tight bindings no longer hold her. Her hands slip right out with a moist, squishing sound.");
	output("\n\nYou give her tummy an open-palmed smack and grin as the impact ripples across her frame. <i>“Don’t worry, I’ve just expanded your talents, Agent Goblin. Or, should I say, Agent Gooblin?”</i> You unhook and throw off the leg tethers before grabbing her behind her knees and hoisting her legs up. There’s only the slightest tension as you press her thighs against her breasts, practically folding the girl in two. She gasps and moans, unable to believe just how stretchy she’s become. <i>“Oh, it gets better,”</i> you assure her.");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",pumpTheSpyIII);
}

public function pumpTheSpyIII():void
{
	clearOutput();
	showName("PUMPING\NTHE SPY");
	author("Adjatha");
	output("Letting loose your animalistic instincts, you brace yourself with the slut’s inner thighs and pound into the freshly stretchy spy’s cunt. Despite its tightness, it offers little in the way of restriction for your mass. The wet warmth of her body parts before your inches as foot after foot slams into her with slurping, suckling relish. She gapes in disbelief as her womb is filled by your flesh and expands upwards, visibly distending her gut and chest. A nearly perfect imprint of your arm-thick pole bulges under her skin, pushing up past her stomach and between her breasts.");
	output("\n\n<i>“M-my whole body is a pussy,”</i> she moans, her eyes rolling up in unexpected bliss. <i>“Oh... oh... oh fuck!”</i> she pants, breathlessly stroking the swell of your penetrating puss crusher. <i>“Fuck me,”</i> she whispers and sighs. <i>“Fuck me!”</i> Her high, thin voice becomes more frantic, crying out with sweet delight as you rock the little whore along your mast like a gooey green sex toy.");
	output("\n\n<i>“You want it, don’t you?”</i> you tease growling into her blissed-out face. Before she can answer, you hoist her upright pulling her down on your colossal cock like a spear. You grab both of her wrists and use them to pull her body down after every frenzied thrust tosses her small frame up, into the air.");
	output("\n\n<i>“Yes! Yes!”</i> she screams, the bulge of your shaft smacking against her lower jaw each time she’s yanked back down onto you. <i>“Oh! OH! FUCK! BREED ME YOU BEAUTIFUL EQUINE BASTARD! MAKE ME YOURS!”</i> she wails in orgasmic rapture.");
	output("\n\nYou grab her shoulders and turn her 90 degrees on your dick before hoisting her ankles up around her long, floppy ears. With a satisfied grunt, you release your seed deep into the broken bitch, her body no more than the latest in a long line of your cum dumps. Her throat bulges as your peak fountains hot cream into her freshly elastic womb. You watch with delight as her body fattens and shudders, drunk with your spunk.");
	output("\n\nHer narrow waist bloats, stomach swelling up with a pregnant bump that swiftly balloons into a nine-month burden. With her womb full to bursting, the gooey consistency of her body starts finding new places to redirect the weight of your subsequent loads. Your cream flows through her, filling her pathetically flat chest, expanding meger A-cups to a proper whore’s double Ds. Her ass inflates to cushiony orbs that practically beg for pounding. Even her hips and thighs fill out, growing wider and fatter until she looks every bit the broodmother you promised her.");
	output("\n\nWrapping one arm around her throat and leaning in close, you listen to her ecstatic mumbling. Her whole body swollen with your seed, the tight, black bodysuit she was wearing finally gives out - tearing at the seams across her legs, hips, gut, and bust. <i>“You’re not going to be very useful as a spy, Agent Gooblin, but I bet I can think of some use for you,”</i> you chuckle.");
	processTime(20);
	pc.lust(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",pumpTheSpyIV,cumNum);
}

public function pumpTheSpyIV(cumNum:Number):void
{
	clearOutput();
	showName("PUMP\nTHE SPY");
	author("Adjatha");
	output("Before you can subject the secret agent to any more of your endless depredations, light floods your eyes. You struggle, reaching out to hold on a bit longer but the visor’s scene has ended and you return to the real world. It takes you a minute or two to readjust to your real body and remember than you’re not the super villain Thoroughbred.");

	//player does not have a penis
	if(!pc.hasCock())
	{
		output("\n\nYou instinctively reach down to stroke your mammoth length, only to remember it was a simulation. Almost like a phantom limb, you can still feel the ghost of the colossal cock swinging from your hips, throbbing with need. You gradually get up and put your equipment back on.");
	}
	//player has a penis but no Bubble Buddy
	else if(!checkToyDrawer(BubbleBuddy) || cumNum == 0)
	{
		output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
		if(cumNum <= 0) {}
		else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
		else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
		else if(cumNum < 4500) 
		{
			output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
			pc.applyCumSoaked();
		}
		else 
		{
			output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
			pc.applyCumSoaked();
		}
		output(" You gradually get up and put your gear back on.");
	}
	//player has a penis and a Bubble Buddy
	else
	{
		output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
		//{player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//2 Cow-ified
public function cowifiedMindwash():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("As you walk briskly along the buzzing, neon-lit hall, you wave and flashing your big, bright smile to the clients you pass. A glance to one side catches your reflection in a mirrored meeting room window, so you pause to make a few adjustments. The figure smiling back at you is a young, svelte man, dressed in a sensible but stylish charcoal-grey number. Your suit is fitted exceptionally well and accented with a bold green-silver that picks out your clear, sharp eyes. You give yourself a wink before picking up your earlier, peppy pace.");
	output("\n\nWhen you make it to the meeting room, you’re feeling positively buoyed by the appraising looks you felt from those you passed on the way. Normally, you’d just shut down small fish like the two young, red-skinned vulkrim waiting impatiently for you. Clients without corporate backing tend to have too slim a return on investment to be worth the lending risk - at least, for someone like yourself anyway. But, you notice that the two scorpion-tailed men can’t help but seem taken aback at your cultivated style. You figure you’ll at least let them pitch their offer before rejecting it.");
	output("\n\n<i>“Gentlemen. How can you make money for my employer and I?”</i>");
	output("\n\nThe taller of the two, a Vulkrim with curving horns and a barrel-chested physique that strains against his ill-fitting suit, stands with a cough. <i>“Well, uh, it’s like this: We’ve got an invention that’ll make millions, but we need money for, um, distribution.”</i>");
	output("\n\nYou offer a polite laugh and lean back in your chair. <i>“Well, that’s a good start. Convince me.”</i>");
	output("\n\nThe big guy gives a goofy smile of relief and turns it over to his partner. The shorter of the two men fidgets with the spectacles at the bridge of his nose. <i>“You are, no doubt aware of the farming aggregate world ‘New Texas?’ What we want to do-”</i>");
	output("\n\nYou cut him off with a gesture and fold your hands on the table with a sigh. A pity - you were in such a good mood, too. <i>“I’m going to have to stop you there, boys. No doubt you’ve some proposal to vie for a share of New Texan milk money. Believe me when I say that I’d love it if you had a chance. There’s a ton of money locked in that monopoly.”</i> You sigh wistfully.");
	output("\n\n<i>“Unfortunately, it’s not going to work. Their ‘Treatment’ is far too effective. Any attempt at competition doomed from the start. I’ve looked into it on behalf of a half dozen people just like you two. There’s no way to get in there and make a profit.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashII);
}

public function cowifiedMindwashII():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("<i>“But, if you aren’t willing to try, then they’ll always be on top,”</i> the shorter Vulkrim protests, his crimson cheeks darkening to a russet, wine-colored flush.");
	output("\n\n<i>“We love investing in new Bioengineering,”</i> you shrug, <i>“but you’re not going for anything new, are you? Just reinventing the wheel. Been done, patented, and monetized. Our money’s better spent on cutting edge frontiers, not to start a tech war with,”</i> you wet your lips with the tip of your tongue, <i>“an incumbent hegemony.”</i>");
	output("\n\nThe tall vulkrim boy looks lost, turning to his companion for help, but the spectacled fellow merely grits his teeth, the plates of his chitin shifting under his cheap suit. Addressing you instead, the big guy produces a glowing tablet. <i>“Won’t you even look at the prospectus? The trial cases? Anything?”</i>");
	output("\n\n<i>“No can do, fellas,”</i> you puff, rising from your chair with a conciliatory gesture that indicates the meeting is over. <i>“Thanks for coming in and best of luck on your next moo.”</i>");
	output("\n\nYou blink. That was weird. You sniff the air, noticing a faint hint of citrus, as if someone had freshly zested a fruit. The big vulkrim looks just as surprised as you, but the shorter just stares with a dark, faint smile.");
	output("\n\n<i>“Ahem. As I was saying. We can’t moo the loan for your moo, but maybe another, smaller firm can moo your moooooo-”</i> Slapping your hands over your mouth, you take a step backwards. Beads of sweat start forming on your forehead. Something’s wrong. You reach for your pocket tablet, to call in security, but lose your focus as a band of heat wraps around your chest and chokes off your breath. The front of your suit coat begins drifting into your field of vision and you jerk back in shock as your chest expands before your eyes.");
	output("\n\n<i>“See,”</i> the smaller, devilish inventor sneers. <i>“We’re well past the concept stage. Aerosol instead of injection. 700% faster transformation. Sure, there’s the vocal bug, but that’s a small issue. And the best part? It’s gender indiscriminate. Anyone can become a milk cow. Well, except vulkrim, of course. Safety first.”</i>");
	output("\n\nSure enough, your pectorals are vanishing beneath the milky bulk of your newly acquired breasts as he speaks. You stumble towards the door, but a bout of vertigo drops you to your knees. A throbbing in your head turns to a splitting headache as small horns sprout from your brow. <i>“This is moo! I’ll moo the U.G.C.! You’ll never moo away with mooooo!”</i> You cry out in desperation as a slim, tufted tail slides out over the waist of your slacks.");
	output("\n\nThe big guy seems nearly as panicked as you are. <i>“We didn’t discuss this! I’m pretty sure this is illegal! Oh man, oh man, we are gonna get in so much trouble...”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashIII);
}

public function cowifiedMindwashIII():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("<i>“Relax!”</i> his partner scolds. <i>“It’s fine. Look how docile she’s getting.”</i> You blink, suddenly aware of how slack your posture has become, your movements dulled and sluggish. Wait, ‘she?’ You feel your face, only to find your masculine jaw has softened to a gentle curve, complementing your puffing lips and lengthening eyelashes.");
	output("\n\n<i>“Moo!”</i> you moo in protest. As if echoing your anger, the seams of your tailored suit groan. One by one, the very expensive stitches split along your fattening thighs and tits. Still prone, you try to stand but find the liquid weight filling your bovine acquisitions too much to handle. Buttons pop off as your cup size multiplies out of control.");
	output("\n\n<i>“None of our tests did anything like this! You gotta turn it off!”</i>");
	output("\n\n<i>“She just needs a little release,”</i> the smaller vulkrim grins, walking around you with an appraising eye. <i>“Isn’t that right, cow?”</i> His segmented tail whips around and smacks hard against your freshly cushioned rump, pulling a fresh moo from your fatigued form. <i>“She’s just as excited about this as we are, see? Get on board and tend to the slut already.”</i>");
	output("\n\nThrowing off the torn remnants of your ripped suit, the scorpion man invites his partner to a full look at your new body. Despite your panic, fear, and anger, the involuntary transformation has not left you untouched by its exhilarating sensitivity. Additionally, it seems that the feminizing effects of whatever gas the red-skinned inventors released, your cock has remained unchanged. Nine inches of stiffness bob with needy throbs above your taut balls.");
	output("\n\nThe taller, more sympathetic of the two stares unabashedly at your exposed organ and gulps. <i>“Well... it SEEMS like he’s enjoying it.”</i>");
	output("\n\n<i>“She,”</i> the smaller one corrects. <i>“Cows are female, bulls are male. Now, get over here and fuck this slutty cow.”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",cowifiedMindwashIV);
}

public function cowifiedMindwashIV():void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("Despite the worried nervousness on his face, the bigger scorpion-featured man moves behind you and runs his tail along the generous curve of your posterior. <i>“J-just so you know, I’m doing this under protest,”</i> he assures you.");
	output("\n\nPulling off his belt and stepping out of his pants, he reveals his own, thick member. The vulkrim’s shaft is as dusky crimson as his face, robed in loose foreskin about the sloped, spaded peak. You gulp, your tail flicking in upwards in an unintentionally inviting gesture.");
	output("\n\nA pinch on your breasts brings you back to the small man who has crouched next to your fattening tits. On the balls of his feet, he seizes both of your freshly thickened nipples between his forefingers and thumbs. <i>“Feels good, doesn’t it?”</i> he mocks. <i>“Being made into a cash chow instead of milking one? How about we get a sample for your bosses to taste?”</i>");
	output("\n\nHis pinching grip tightens, squeezing your flush peaks between his coarse knuckles. Rolling back to front in slow, cruel motions, the scarlet man tugs instantly at your massive mounds. A tremble shudders through you, nerves aflame with a building needs for release that drives you to hands and knees with gasping, mooing tremors.");
	output("\n\nA gradual, steady pressure below your flicking tail becomes a sudden, suffocating fullness in your lower half. A high, sharp ‘Moo!”</i> squeaks from your mouth as you force a ragged gasp from your overburdened chest. A pillar of stiff heat pushes into your rump with startling ease. The larger vulkrim grunts as his mast plows through your clenching rear, wearing your depths around his thickness like a too-tight sheath. You stretch to accomodate his girth even as your own prick leaps and bobs, waves of distress knocking aside your dignity. Ropes of jizz spurt your helpless bliss across the muted carpet.");
	output("\n\nWith the big man drilling your overstuffed ass and the other finger-fucking your over-filled melons, it takes scarcely any time to reduce you to a mooing, moaning cow slut. Little more than a slave to the intoxicating abuses piled upon you, your body feels utterly defenseless. Each hip-slapping thrust sends spasms of orgasmic fire to your swollen, empty member.");
	output("\n\nThe raw tugging at your udders is eventually rewarded with jets of pale white. Streams of milk spray from your engorged teats just like a prize cow. You expected an emptying feeling of relief and release for your first milking, but every calcium-laden spurt only adds to the flooding pressure swelling within your colossal cups.");
	output("\n\nRough fingers clenching around your thick thighs is all the warning you get before the scorpion-tailed man behind you launches into a body-swaying, frantic pace. Each stroke pumps the fullness of his manhood through your suckling sphincter and slams his tensed, firm abdomen against your wobbling asscheeks with loud, crisp claps. His heavy, swinging sack slaps your achingly exhausted balls with encouraging thwacks.");
	output("\n\nYou moo with unexpected huskiness as a fresh bolt of bliss cuts through your fatigued and over-wrought sissy-shaft. When your ass-pounding partner seizes your bovine tail with a hard tug and sprays hot, thick seed deep into your core, your body finds the strength for yet another orgasm. One final, untapped reserve of liquid lust mainlines through your painfully hard member in an explosive, spunk-spraying climax of complete surrender.");
	output("\n\nYou collapse atop your torso-sized endowments, panting, mooing, and staring into empty space as sticky passion is pumped into your fattening gut like a second heartbeat. Milk flows freely from your nipples, coaxed by the pressure of your body alone. The orchestrator of your humbling transformation wipes the milk from his hands with the tattered remnants of your extremely expensive and completely ruined suit. <i>“See? Works like a charm,”</i> he chuckles.");
	output("\n\nThe other man, finally finished flooding your rump with his seed, pulls out with a long, satisfied sigh. A steady stream of cum trickles out from your anal creampie while the one responsible cleans his shaft on the jiggling mass of your bovine ass. <i>“Yeah,”</i> he agrees, wiping his brow and buckling his overalls. <i>“But, um, how do we move her?”</i>");
	output("\n\nThe little guy gives you an appraising look. <i>“Hrm. That’s... that’s actually a good point. We probably should’ve done this closer to our place.”</i> With your ZZZ-cups each nearly the size of the rest of your body, you look less like a powerful, dynamic bank officer and more like a run-down cow trying to smuggle a pair of flesh-tone galotians under your chest. The devilish inventor gives you an experimental push, but only manages to send you swaying atop your milk-filled mountains.");
	output("\n\n<i>“Shoot. This milk-cow thing will be tougher to set up than I expected.”</i>");
	output("\n\n<i>“Plus, we’d need all the bottles and labels. Also somebody to transport the product to stores and off-world. Not to mention advertising...”</i>");
	output("\n\n<i>“Can I tell you something?”</i>");
	output("\n\n<i>“Sure.”</i>");
	output("\n\n<i>“I don’t even like milk very much. This just seemed like an easy way to make money.”</i>");
	output("\n\n<i>“Oh. Actually, me neither. I just thought the transformation bit was pretty cool and I didn’t want to discourage you.”</i>");
	output("\n\n<i>“Well, back to the drawing board. Maybe we could do something with honey?”</i>");
	processTime(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",cowifiedMindwashV,cumNum);
}

public function cowifiedMindwashV(cumNum:Number):void
{
	clearOutput();
	showName("\nCOW-IFIED");
	author("Adjatha");
	output("And, at that, the two leave the meeting room, discreetly turning on the ‘Meeting In Progress’ message on the exterior of the gently closing door. You vaguely wonder if the folks at New Texas are accepting resumes. Groaning as you feel more milk filling in your chest, light floods your eyes. You struggle, reaching out to hold on a bit longer but the visor’s scene has ended and you return to the real world. It takes you a minute or two to readjust to your real body and remember than you’re not a man-turned-heifer.");

	//player does not have breasts
	if(pc.biggestTitSize() < 1) output("\n\nYou instinctively reach forward to soothe your aching breasts, only to find [pc.chest]. You sigh and tell yourself it was a simulation. Almost like a phantom limb, you can still feel the ghost of the colossal rack hanging from your body, throbbing with need. Donning your gear before you head out, you give the machine a suspicious glance. It sits there, motionless.");
	//player has breasts
	else if(!pc.canLactate() && !pc.isLactating())
	{
		output("\n\nYour [pc.breasts] ache as you come to, but you’re conspicuously dry. It takes you a moment to remember that you’re not actually lactating, though your [pc.nipples] are as stiff and sore as if gallons had just been sucked from you. It’s a difficult and uneasy dissociation for you to manage, but you do your best to block out the intrusive, false memories while you put your gear back on and head out.");
	}
	//player has breasts and is lactating
	else
	{
		output("\n\nYour [pc.breasts] ache as you come to, and it’s not hard to see why. Apparently the vigorous VR milking you’d been experienced in simulation has managed to affect your actual mammaries as well! Streams of the warm fluid run down your skin and pool on the ground");
		if(pc.canMilkSquirt()) output(", and it seems like your squirting even managed to soak the panels in front of you!");
		else output(".");
		output(" Cleaning up what you can, you eventually put your gear back on and leave the visor alone for now.");
		pc.milked();
	}
	processTime(4);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//3 Invasion of the Dick Suckers
public function invasionOfTheDickSuckers():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("<i>“But Ace, I don’t think we’re supposed to be up here. Isn’t this, like, some kind of military base?”</i>");
	output("\n\n<i>“Aw, come on, Blu. Where’s your spirit of adventure? Besides, I’m almost positive the meteor crashed somewhere around here. Maybe it was a ship and somebody needs help!”</i>");
	output("\n\nYour gal gives an uncertain smile, but follows along all the same. The black scaled gryvain girl is taller than most terrans, yourself included, but manages to seem smaller as the two of you push through the wooded hillock. She wraps an arm around yours as your path takes you past the treeline and into a clearing of flattened brush and smouldering trunks. <i>“Do you hear that?”</i> she whispers, her azure-lacquered lips warm against your ear. <i>“Some kind of low whistle?”</i>");
	output("\n\nThe ground here is little more than a shallow crater and at its center lies a large, faintly glowing stone. <i>“Aw, it’s just some space junk,”</i> you sigh. <i>“Sorry to drag you all the way out here, Blu.”</i>");
	output("\n\nYou turn to your girlfriend, but something seems to have come over her. There is an intenseness to her gaze and she is already taking tentative steps toward the crater. Before you can catch up with her and ask what’s going on, you hear the crackle of electrostatic and voices from close at hand.");
	output("\n\n<i>“Shoot... I think you might’ve been right about that military base,”</i> you loudly whisper back to Blu. <i>“Lay low, I’ll check it out.”</i> Stooping down, you creep along the periphery of the crater to a recent path leading back to the standing trees.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersII);
}

public function invasionOfTheDickSuckersII():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("As you sneak closer, you can just make out five adult-sized shapes lying prone amid the soft brush. Wet slurping and husky moans carry faintly through the eerie hush of the emptied forest, urging you closer and closer, until your voyeuristic curiosity brings you a mere few feet from the apparent orgy.");
	output("\n\nAll five are in various states of undress, but what clothing they are still wearing all seems to be identical, dull fatigues. Some kind of security team? The two terran males you can spy are on their backs, eyes pinched shut and fingers digging into the dirt with bliss. Their bodies are poured over by hungering attentions the female members of the group. A grey furred ausar girl has her mouth and much of her throat filled with one man’s cock while the bronze-skinned dzaan and dark blue ovir take turns suckling at the other man’s shaft in long strokes.");
	output("\n\nA hot blush floods your cheeks as you gradually back away. Just some guards having fun, you figure as you’re turning back to check on Blu at the crater. Your foot loudly strikes a small, black rectangle and you look back to see if the rutting strangers heard anything. No one’s attention seems to be on you, so you carefully inspect what you nearly tripped over.");

	output("\n\nThe object proves to be a palm-sized communications device that faintly crackles while a nearly unheard voice talks quickly on the other end. You raise the com to your ear and listen in, only to realize the other voice isn’t just excited, it’s frantic. <i>“ Major Whang? Private Driver? Anyone? Do not - repeat - do NOT approach the female members of your unit! Exposure means contamination! Their lips! It’s in their lips!”</i>");

	output("\n\nAs you listen, you peer through the dim night back towards the orgy. Looking more carefully, you noticing something strange about all of the girls there. Each seems to be wearing identical, glossy black lipstick that doesn’t smudge no matter how much they smear their mouths all over the throbbing flesh of their companions. More than just this, you realize, their lips are huge- pornstar huge! The swollen puckers form glistening onyx ovals from just below their noses that reach almost all the way to their chins.");

	output("\n\nAs you watch with a mix of fear and arousal, it’s almost as if the donut-shaped lips are actually pulling the women’s heads on their dick-sucking mission. Their half-lidded eyes and disconnected expressions take on a new character as the sound of their slurping and sucking grows louder and more desperate. The men, utterly at the mercy of the cock-thirsty women, groan with the overture of release, but you dare not stay a moment longer.");

	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersIII);
}

public function invasionOfTheDickSuckersIII():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("Rushing back to the crater, you find Blu crouched at its edge, looking at your with confusion. <i>“What-?”</i>");
	output("\n\n<i>“No time,”</i> you yell as you take her hands and lift her to her feet. <i>“We gotta go! Some kind of infection... black lips... dick sucking...”</i> you pant unable to properly articulate what you’ve just seen. Rather than explain further, you pull your gryvain gal with you back the way you came. The trees whizz past in your flight and it’s not until you see the light of the city that you slow down enough to catch your breath.");
	output("\n\n<i>“I... I think we’re safe,”</i> you pant, giving Blu a great big hug. <i>“I- I don’t know what I saw. But we’ve got to call somebody. Have them check on those people. And that glowing rock. What even was that?”</i>");
	output("\n\n<i>“Hrm? Oh, it was nothing. Like you said: probably some space junk. It just had this oily goop inside. I dunno how it was glowing, though. That was kinda weird,”</i> Blu remarks, distractedly chewing her lower lip.");
	output("\n\nYou take hold of the gryvain girl’s shoulders and peer closer at her. <i>“Blu, did... did you wipe off your lipstick?”</i>");
	output("\n\nShe laughs lightly, cocking her head in confusion. <i>“What? What kind of question is that? No, of course not! Wouldn’t be much point in the nick name if I didn’t have my color on, ya goof.”</i>");
	output("\n\n<i>“It’s just... it’s your lips,”</i> you whisper with growing dread. <i>“They’re black.”</i>");
	output("\n\nShe touches her mouth, a bit annoyed. <i>“Ah geez, really? That’s weird. I got this brand ‘cause they said it doesn’t just wipe off. What’s wrong with you, anyway?”</i> she asks as she produces a tube of ultramarine blue and carefully circles her mouth with well-practiced ease. Pressing her lips together and then blowing you a kiss, she rolls her eyes. <i>“Better?”</i>");
	output("\n\nHer lips are still black. If anything, they seem thicker, puffier than just a moment ago. <i>“I think... I think something’s wrong,”</i> you whimper as you take a step back.");
	output("\n\n<i>“Oh don’t be so dramatic,”</i> Blu chides, yawning. <i>“Geez, I didn’t realize that run tired me out so much. Hey, how about we set your mind at ease with a little oral massage?”</i>");
	processTime(15);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersIV);
}

public function invasionOfTheDickSuckersIV():void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("<i>“Are- are you feeling okay, Blu? Feeling yourself?”</i>");
	output("\n\n<i>“Of course,”</i> she replies, her eyelids drooping as she fingers the exterior of her gently inflating, polished obsidian lips. <i>“Don’t make me beg,”</i> she sighs as she steps toward you and gently forces you to the ground. The O-ring of her puckered mouth seems to pulse as she moves closer and closer.");
	output("\n\nYour shaft springs upright as she unzips you, the bright metal tab held between her teeth. Wrapping her palms across your hips, Blu leans down to press her lips against the crest of your member, sucking it into her mouth in one fluid motion. Your fingers twitch as she swallows inch upon inch as easily as breathing, your swollen mast slipping between those black, pillowy cushions. Your cock tingles all along its length at the sucking pressure of her mouth. A wild urge to grab her head and pull it down into your lap seizes you, but all force has left your arms. Shuddering, you gasp and moan while Blu finishes her descent with a vibrating purr, pressing her thick, ebony O against the very root of your manhood.");
	output("\n\nShe doesn’t look up or even seem troubled by the thickness throbbing inside of her throat. Instead, she pulls back, twisting her head slightly to one side, then the other, savoring every square inch of your texture. Her tongue coils and teases, flicking and stroking while her lips pulse upon you. Bobbing up and down now, she begins her feast in earnest, suckling with increasing urgency while her fingers tighten their curled grip on your waist.");
	output("\n\n<i>“A-ah!”</i> you moan as the first tickling warmth of your orgasm blossoms within you. As if she can feel the nearness of her prize, Blu closes her eyes in complete concentration. The long, gurgling strokes give way to rapid, shallow gulps as she slams herself up and down the bottom inches of your length so fast her lips slap against your skin like a round of lively applause.");
	output("\n\nThe liquid weight of your climax surges within you, unable to withstand the heated embrace of your girl’s moist, wanton maw. You struggle to move through your strange paralysis, but Blu thrusts her own head down onto your lap as if trying to get even just a fraction of an inch closer to your nearing bliss. Her throat and tongue stroke eagerly and, never one to disappoint, the groaning release follows a moment later.");
	output("\n\nGouts of white-hot seed spurt from your tender tip, flooding the gryvain’s cheeks. A massive burst of achingly urgent cream geysers out of you, then a second, then a third. You bite the inside of your own cheek at the impossible volume of your endless release, nearly struck blind by the shivering pleasure electrifying your mind. Blu’s tongue dances across your hydraulic cum vein while her throat clenches and loosens with calm ease. You’re not sure if it’s to manage the overabundance of your release or to milk even more from you. Her shoulders roll and her gullet distends with the magnitude of her meal, gulping down the burdensome bounty one load at a time while her inflated cheeks puff again and again at the pressure of your measureless spunk.");
	output("\n\nDespite the cushiony deathgrip Blu’s lips have on the base of your shaft, the sheer quantity proves too much for her to restrain. Thick, white rivulets spurt past her glossy, raven cocksuckers in wild, pressurized streams. A frothy wash of your alabaster goo fills the narrow space between your lap and your girl’s face. Whip-like ropes of thick ejaculate jet out and slap against the two of you, forming a dripping curtain of hot passion.");
	output("\n\nWhen, at last, she has drained you of every last drop, Blu disentangles her cum-glazed face from your twitching thickness, pausing at the tip for one last kiss. You groan, utterly spent in a whole-body way you’ve never experienced before. The mere thought of movement is impossible - it’s as if she drank down the very core of your body, leaving nothing but an empty husk behind. You look up at her with a feeble, bleary gaze and discover her mouth has transformed into a perfect replica of the huge, inky ovals shared by the female soldiers near the crater. From nose to chin, a throbbing donut of a kisser stands out as black as space and as swollen as a freshly gorged predator.");
	output("\n\nYou try to reach out a hand, but only manage a single twitch of a finger. It doesn’t matter. Blu rises to her feet and casts her gaze out to the lights of nearby civilization. Looking, no doubt, for her next meal. Your vision swims and the faint memory of your gryvain girl’s deep blue scales fades into a dark, endless, ever-hungering blackness.");
	processTime(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",invasionOfTheDickSuckersV,cumNum);
}

public function invasionOfTheDickSuckersV(cumNum:Number):void
{
	clearOutput();
	showName("DICKSUCKING\nINVASION");
	author("Adjatha");
	output("The encroaching dusk vanishes in a flood of light as your visor turns off. You blink and scrub at your eyes, trying to put the residual memory of that hot temptation out of your mind. Invading aliens have been a popular smut plot practically forever, but living lipstick? You shake your head in disbelief.");
	//player does not have balls
	if(pc.balls < 2)
	{
		output("\n\nYou instinctively reach down to massage your poor, abused balls, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	else if(pc.hasCock())
	{
		if(!checkToyDrawer(BubbleBuddy) || cumNum <= 0)
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum <= 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			//{player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	else
	{
		output("\n\nYou instinctively reach down to massage your poor, abused cock, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//Female Scenes
//1 Gym trip
public function gymTripScene():void
{
	clearOutput();
	showName("GYM\nTRIP");
	author("Adjatha");
	output("Stepping through the gym doors, you can’t help but take a quick look around. The sound of clanking metal and grunting effort punctates the busy motion of your fellow exercise enthusiasts. It looks like most of the machines are already filled. Beefy bodies, slick with sweat, pump and heave, their muscles straining to the dull, thrumming beat of a bass-heavy jam. You can’t help but tremble with anticipation as you pull off your shapeless coat to reveal the lean, feminine curves beneath. You give your core a little smack, admiring the flex of your abs in the ceiling-high wall mirrors. Slipping a hairband around your long ponytail, you pull at the thin fabric of your form-fitting 2-piece, adjusting a bit to compensate for your large, stiff nipples before setting out onto the floor.");
	output("\n\n<i>“Best to start with some stretches,”</i> you remark to no one in particular as you head over the corner. Plush floor mats give you a bit of comfort as you hoist one arm over your head, then the other, you breasts straining against the feeble sports bra. You twist at your waist, admiring the subtle bounce in your booty as you flex. Moving down, you give a few slow kicks in the air. Your foot gets a little higher each time until you manage to catch your leg around the calf and pull your knee up to your ear.");
	output("\n\nYou wobble a bit, but manage to keep your balance as the stretch sends little, tight twitches through your thighs and groin. A tall, dark-skinned gryvain woman in a white one-piece pauses next to you, giving an appreciative glance. Her eyes travel from your suspended foot all the way down to your planted toes. She takes a step closer and then another.");
	output("\n\nThe faint bump of her phallus stiffens, swelling with excitement as she takes in the sight of your lean, athletic frame. She raises an eyebrow and gives you an approving nod as her tail follows the path of her eyes, running firmly against your inner leg until it reaches the bulge your pussy lips are making in your skimpy shorts. She gives you a few extra strokes, flitting her tail tip between your lower lips before turning aside, on her way to the sauna with a sly smile.");
	processTime(4);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneII);
}

public function gymTripSceneII():void
{
	clearOutput();
	showName("GYM\nTRIP");
	author("Adjatha");
	output("<i>“Better make this workout quick,”</i> you muse, watching the draconic woman sashay her way through the space like she were shopping at a meat market. You let your leg drop, shaking out the slight burn and hoist up the other leg in a similar fashion. This time, you draw the attention a small group of fit, ausar men. They jostle one another, chuckling as they approach and, without so much as a word to you, the begin groping your exposed form. Rough hands press against the small of your back and slide down over the taut orbs of your ass. Another pair produces a water bottle filled with a thick, creamy fluid. They tilt your head back and pop the nozzle between your lips before giving it a little squeeze.");
	output("\n\nFocusing as hard as you can on maintaining your balance, you absently swallow the gooey refreshment with deep, thirsty gulps. The dog boys laugh riotously as they grope you harder with each gulp you take. In no time at all, the plastic bottle is nearly empty and your body is throbbing with overheated stimulation. One presses his tongue at the base of your collar bone and draws the hot organ up your neck and across your chin. Then, with riotous laughter, they leave you alone to finish your unsteady, panting stretches.");
	output("\n\n<i>“Everybody’s so friendly here,”</i> you gasp, wiping a stray droplet of your unexpected protein shake from your lips. <i>“So what’s first? Upper body, legs, or core?”</i> A quick survey of the gym reveals that the butterfly press is open, so you strut over and take a seat. Lifting your arms at right angles, you firmly grip the wings on either side of you and, with a slow exhale of breath, draw your forearms forward until the rubber hemispheres on the machine’s arms bump together. You ease the machine back into its starting position, your pecs flexing against the restraint of your top with a faint tearing sound.");
	output("\n\nYou keep up the pace despite the warning, your chest and arms tingling with the effort until, finally, you finish the set. Large holes have torn into the fabric of your top, revealing tantalizing glimpses of your constrained breasts. Another set and the whole thing might just pop open! As is, sweat has left your skin glistening with an oiled polish. More people have stopped their exercises to stare, as if trying to get you to push your fabric to bursting through sheer force of will.");
	processTime(8);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneIII);
}

public function gymTripSceneIII():void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Moving to the next machine, you’re stopped by an outraged shout that pulls your attention back. A kui-tan girl has taken your place on the butterfly press. She’s dressed in little more than a string bikini that does nothing to hide her fuzzy balls and barely even covers her sheath. She turns in place to demonstrate that her whole back side has been soaked from the sweat you left on the machine.");
	output("\n\n<i>“Walking away without wiping down your machine?”</i> the fuzzy hardbody growls. <i>“Gym foul, bitch.”</i> At that, she reaches out and grabs at your shorts, yanking the thin material hard enough to tear a huge hole in your crotch. She advances, furious and ready to do a lot more than just tear your clothes off.");
	output("\n\nYou stumble back, a bit surprised, but thankfully the girl’s towering, bull-like personal trainer intervenes, darting in low and hooking his arms under her knees. With a huff of effort, he hoists her up and folds her legs up against her chest. He pulls a drawstring and her bikini bottom slips right off");
	output("\n\n<i>“Hey, sorry about that,”</i> he grunts, lifting and dropping the nuki girl atop his equine thickness like it was just part of his normal workout. <i>“No harm done, right?”</i> he asks with a hopeful grin. HIs cock cozy seems to have lost her original spit and vinegar, and has begun counting off reps for her trainer. Her multi-knotted shaft bounces up and down with each cycle but - quite thoughtfully - she’s put a condom on, so the bulging spurts of pre-cum merely make a wobbling bubble at her tip, rather than drench the equipment.");
	output("\n\n<i>“Oh, it was my fault, really,”</i> you assure the two with a laugh before moving on.");
	processTime(8);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",gymTripSceneIV);
}

public function gymTripSceneIV():void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Perhaps it was your run in with the kui-tan, but you find yourself moving to the exercise balls next. Huge and rubbery, the inflated spheres will give you a chance to work out a good variety of muscle groups. You select one with built-in handles and note that this model also has a seven inch rubber canine dildo affixed to it.");
	output("\n\n<i>“Ah, an extra grip. That’s a pretty good idea!”</i> Since you’ve already got a tear, you don’t even bother taking off your skin-tight shorts before planting yourself on the orb, sliding the shaft past your puffy labia and into your drooling depths. Your fingers tighten on the hand grips as your depths clench down on molded rubber inside you. Balancing on the balls of your feet, you begin rocking up and down atop the endowed globe, letting the fat knot smack against your ass each time. Your pace picks up and before long, you’re riding the ball for all it’s worth, panting and moaning as you go.");
	output("\n\nA sudden weight fills your gut and you know that you’ve accidentally taken the knot. You pause, taking an unsteady moment to gather yourself. A passing kaithrit notices your predicament, however, and comes to your aid. <i>“Doing alright?”</i> he ask with a purring slyness. Bracing his hands on your hips he gives you a few toe-curling bounces on the ball, just to make sure you’re stuck. <i>“Yup! Quite a little problem there! No worries, I know just the fix.”</i>");
	output("\n\nHe reaches around and hooks his fingers into the tears in your sports bra. With deliberate slowness, he tears them further and further until, finally, your top gives up the ghost and simply snaps apart, spilling your breasts to the open air. <i>“H-how is that supposed to h-help?”</i> you ask, unable to keep yourself from running a hand across the abdominal bulge left by the massive toy’s bloated knot.");
	output("\n\nThe imposing workout partner’s twin tails snake their way up to wrap around your sweat-slick breasts, squeezing nearly as hard as your thighs on the colorful orb you’ve been bound to. <i>“Hrm? Oh, right! Helping!”</i> He pushes against your back, folding you over while he grabs your ankles and lifts your legs up, leaving you a horizonal plank atop a pliant rubber ball. He tears the hole in your shorts a bit more and slaps his feline cock between your ass cheeks. Rocking you back and forth on the ball, the kaithrit coats his nub-covered member across the slick nectar of your oozing femme cum, polishing your ass at the same time. Then, with his hands firmly around your ankles, he pulls you back, onto his manhood.");
	output("\n\nThe double penetration leaves you moaning like a well-trained whore. The knotty knock in your pussy rubs against the cat boy’s hot meat in your ass, the nerve-filled wall between the two squeezed tighter than any workout could manage. You bounce, sweat, moan and cum as your body is pounded with rhythmic regularity.");
	output("\n\nA pair of ovir slap their long, thick phalluses across your face and you instinctively pull them both into your gasping mouth. With the rubber knot as a fulcrum, you wobble between back and forth between the cat and the lizards, slurping hungrily at both ends. When the cat blasts a hot load up your rectum, he give your ass a firm slap of satisfaction. He pulls out and checks the state of the knot. <i>“Huh. Still in there. Oh well! Good luck with that.”</i> He leaves you to the ovir girls at your front, but not before using his towel to wipe the dripping cum from between your legs. Another fitness enthusiast takes his place, ramming into you without so much as an introduction.");
	output("\n\nYou’re used as a workout machine in this way for an hour or two before, finally, your exhausted, shuddering body gives up its death grip on the exercise ball’s cock. You slide off and slip to the floor, face up and gasping. The slick abs you came in with have vanished under the liquid weight of your distended gut. Packed from both ends, a steady stream of white that oozes across your inner thighs and down your cheeks. A shadow up above draws your attention away from the sight of your bloated belly, only to reveal the kui-tan from before.");
	output("\n\n<i>“Still not cleaning up after you’re done,”</i> she tuts. The condom on her cock has been filled with perhaps two gallons of nuki-spunk, which she removes carefully, holding it above you. <i>“It’s about consideration for others, bitch.”</i> And with that, she drops the over-filled rubber ball onto your face, its un-tied ring spraying hot blobs all over you.");
	output("\n\nBlissed out and dripping everywhere, you wonder if the gryvain girl is still in the sauna. After all this, you could a good steam with a fat-cocked dragon girl.");

	processTime(8);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gymTripSceneV,cumNum);
}

public function gymTripSceneV(cumNum:Number):void
{
	clearOutput();
	showName("GYM\nTRIP!");
	author("Adjatha");
	output("Light floods your eyes as the porn clip ends and it takes you a minute or two to readjust to your real body. Just about every muscle in your body feels like its gone through a wringer. It’s almost impossible for you to struggle into your [pc.gear] without groaning. Before you leave, you give the visor a quick wipe-down, just in case. ");
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//2 - Door to Door Dildos
public function doorToDoorDildos():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	output("An inopportune knock at the your apartment’s entry hatch draws you away from the smutty holo you were just getting into. <i>“What timing!”</i> you pout, pausing the explicit material mid-thrust. <i>“Who could that be this late?”</i> With no time to slip panties on, you grab a short, metallic silver skirt and yank a tight, white top over your perky B-cups. With a hurried skip, you cross the room to the polished steel of your door, catching a reflection on the way. A blue-scaled raskvel looks back at you with a pleasantly heart-shaped face. Your ass-length feathery plumage is still quite messy from an hour of your sweaty, panting, private time, but it’ll have to do.");
	output("\n\nPressing a hand to the cool steel port, you open the door to a tall, thin feline girl. From your four-foot vantage, her face is almost entirely obscured by the massive, gravity-defying G-cup tits that are barely squeezed in a too-tight, strapless dress. Covered head to toe in black fur and a short, azure crop of spiked hair, the woman before you flashes a wide grin and  steps into your apartment without being invited.");
	output("\n\nWith a breathless enthusiasm she launches into her spiel. <i>“Hiya! I’m Mi’Dee and you’ll never believe what I’m selling! What could it be? Why, thank you for asking! It’s just about the bestest, most amazing thing ever produced by science, and I’m here to show you how it works!”</i>");
	output("\n\n<i>“What-”</i> is all you manage to get out before she starts up again.");
	output("\n\n<i>“You’re a girl, right? Yeah, totally. So, like, this is so cool you don’t even know. Have you ever wondered what it’d be like to have a dick? Sure you have! But gene mods can be expensive and can have all kinds of unwanted side effects like no-reason boners or erections lasting more than 72 hours, though personally I don’t see what’s so bad about that, ya know what I mean?”</i>");
	output("\n\nAs she blathers on, the hyper pussy cat produces a long, red box from her cleavage and clicks it open lengthwise. <i>“But now, you can totally enjoy all the benefits of a cock without all the messy cleanup involved! Ta da!”</i> She holds the contents up for inspection. There is an eight inch dildo nestled in the center and a small, thin ring about as wide as your pinkie.");
	output("\n\n<i>“But I already own-”</i> you start, gesturing at the small pile of toys you’d been using next to the paused holo-smut.");
	output("\n\n<i>“Oh, of course, we all own literally hundreds of dildos already. But this one is different! It’s so supery special that you’ll never even believe how crazy special it is! Just take the ring here,”</i> she nabs the device, <i>“and put it on your favorite clit.”</i> By way of demonstration, she yanks your skirt down around your knees and sinks to her knees in front of you.");
	output("\n\n<i>“Woah, hey!”</i> you protest, a bit embarrassed by how puffy your sapphire lips still are after your prolonged recreation. Your well-jilled clits are swollen to almost thumb-thickness and poke out from your dripping pussy like azure on-switches. Mi’Dee wastes no time, sliding the electronic ring around your top-most feminine nub with practiced ease.");
	output("\n\nA wave of unfamiliar impulses flood your body, washing through you with all the pressing urgency of rocket fuel igniting. Your knees knock, your hips shake, your tail lifts, and your toes curl. Biting down on your lower lip, you take a step forward and nearly collapse, leaning against the curvaceous salesgirl for balance. <i>“What... the...?”</i>");
	output("\n\n<i>“Oh, that’s just the techie stuff doings its, um, stuff! See, the ring is transmitting all the good feelings of the dildo into your little clitty, up your spine, and into your noggin!”</i> She pulls the dildo from the box and sure enough, you can feel the girl’s fingers around the wobbling shaft as if it were hanging between your legs. <i>“So friggin cool, am I right? So, how many can I put you down for?”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosII);
}

public function doorToDoorDildosII():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	output("Rather than paying attention to her, you jump up and nab the cock from the catgirl and grasp it with both hands. A tremble flits through your stomach and fresh warmth blossoms in your loins. <i>“This is... incredible!”</i> you gasp, stroking the dildo slowly at first. Mi’Dee nods encouragingly as you bring the tip to your lips and start sucking. <i>“I’m- sucking- my own- dick!”</i> you marvel between long, moist kisses.");
	output("\n\n<i>“Oh yeah, it’s super great! So, can I get your credit chit or...?”</i>");
	output("\n\nThe pleasure keeps growing, so you suck deeper and deeper, jamming the shaft deep enough down your mouth to leave a bulge in your throat. A tight tension overtakes your muscles and your fingers tremble, but no matter how much you suck, you can’t quite catch the tantalizing feeling of white-hot completion that seems to hang just out of reach. Desperate, you reach one hand under your top to tweak and massage a nipple while the other hand worries one of your long, dangling ears between your forefinger and thumb. Despite all the normal tricks, you just can’t hit satisfy the new organ.");
	output("\n\n<i>“Wow, you’re getting really into it, huh?”</i> Mi’Dee comments with a nervous smile. <i>“Um, should I just, like, check back later?”</i>");
	output("\n\nThe sound of her voice crystallizes your mounting frustration into an aggressive force. You kick off the skirt around your ankles and leap at the salesgirl with cock-madness in your eyes. She lets out an <i>“eep!”</i> of surprise and stumbles backwards, tripping over her six-inch heels and flattening on the ground. You draw the dildo from your throat as if unsheathing a weapon and brandish the saliva-dripping tool at the startled slut beneath you.");
	output("\n\n<i>“What, um, what are you gonna do with that?”</i> she inquires lightly, squirming between your thick thighs.");
	output("\n\nBy way of an answer, you yank down the top of her dress and expose her massive mammaries to the open air. Pink nipples top the colossal orbs, so you grab both peaks with one hand and squeeze them together while sliding the dildo in between them. Your hips buck as the tight valley of her copious titflesh sucks in your well-lubricated faux-cock and it’s all you can do to keep a hand on the base of it as you pump ferociously through the jiggling pussy cat’s mounds.");
	output("\n\n<i>“Ma’am, this isn’t really how these kinds of demonstrations are supposed to go!”</i> she wails as you use her over-inflated breasts as a heated fuck-sleeve, parting their yielding mass with rapid, relentless strokes. The bliss of your tit-fucking leaves your own cunt drooling with delight, but the climax just won’t come.");
	output("\n\nYou slide off of her stomach just to grab the sex kitten’s tail and flip her over. Hauling up the hem of her dress, you reveal the hefty booty beneath. She appears to have a pair of fist-thick balls and a kaithrit cock of her own, but your main concern is the warm, moist slit between her thighs. Just as she walked right into your apartment without so much as an introduction, you jam the dildo into her as deep as it will go. Mi’Dee yowls with surprise and scratches her fingers into your carpet as her knees go wide. She cranes her head around to say something, but you flatten yourself on her back, face planted in her booty, and use your feet to slam the back of her head down into the plush shag.");
	output("\n\nWith both hands, you pump the cock in and out of the sales girl’s pussy, every fold of her clenching depths transmitted through your body by the clit ring. You twist the shaft, feeling out her squeezing passages with urgent, unsatisfied lust that leaves you shivering. The catgirl’s tail wraps itself around your arms, while she mumbles and moans under your feet.");
	output("\n\nYou can feel her body tense beneath you and the kitty-cock between her legs twitches before discharging steady, pumping streams of jizz all over your floor. Staring at the throbbing balls inches from your nose fills you with envious despair and you spear her again and again with the dildo, feeling every trembling inch of her sweet slit but unable to flood her with the passion endlessly building inside you. <i>“I just... can’t... CUM!”</i> you cry with a mournful wail and everything goes dark.");
	processTime(10);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosIII);
}

public function doorToDoorDildosIII():void
{
	clearOutput();
	showBust("MIDEE");
	showName("DOOR TO\nDOOR DILDOS");
	author("Adjatha");
	output("When the light comes back, you and Mi’Dee are standing side by side, looking at the camera. <i>“We’ve had a lot of fun tonight,”</i> she starts with a wink, <i>“especially me. But abusing sex toys is no joke.”</i>");
	output("\n\n<i>“That’s right,”</i> you add, gesturing at the sticky, femme-cum dripping dildo in your left hand. <i>“Using toys is a great way to have fun by yourself or with others, but when you become reliant on them, you can end up in a situation like we just saw.”</i>");
	output("\n\n<i>“Gene mods can be expensive, but that’s only because you’re paying for quality,”</i> the black-furred catgirl explains, demonstrating her own, extensive modding with a bouncy twirl.");
	output("\n\n<i>“So please, before you go out and buy the latest in simulated pleasure, won’t you consider a more meaningful investment?”</i> You drop the dildo and wrap a hand around Mi’Dee’s waist as encouraging music swells.");
	output("\n\nA low voice over speaks at a rapid pace, just barely loud enough to be heard over the music. <i>“The preceding has been a paid presentation using compensated actors. The views and opinions expressed are not necessarily shared by this station and claims made are for dramatic appeal, not to be taken as literal statement of fact. This info-porn has been brought to you by ManUp and JoyCo. JoyCo: For Your Health.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",doorToDoorDildosIV);
}

public function doorToDoorDildosIV():void
{
	clearOutput();
	showName("ITS\nOVER");
	author("Adjatha");
	output("When the VR ends and you return to your body, you’re feeling more confused than disoriented. Is the visor playing first-person infomercials? ");
	if(pc.hasStatusEffect("BadgerMindwash")) output("Dr. Badger really IS evil!");
	else output("No wonder Luca was doubtful about opening this thing up to the general public!");
	//No actual orgasm!
	mindwashNextButtonAndStatAwardsAndClears(0);
}

//3 - Pet Pro
public function petPro():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("You blink to find yourself in a fairly large room, surrounded by huge dogs. No, that’s not quite right. You rub your eyes to reveal that what you took for mastiffs are, in fact, ausar wearing bondage gear. The collection of burly males around you are on all fours and outfitted with muzzle masks that resemble canine faces and thick, plush-stuffed paw gloves. Their tails wag eagerly, knotted cocks stiff and dripping with anticipation.");
	output("\n\nYour body relaxes as you realize you’re right where you belong: amid your beloved puppies right at feeding time. Your favorite time of day. You step over to a lounge cushion and recline with a warm sigh, letting your body drape over the well-used furniture. The ausar around the room prowl up to you, lust-drunk eyes taking in your vulnerable form and circling like predators. You can hear them sniffing, breathing in the scent of your sex.");
	output("\n\nOne of the pups, a big, pale-skinned she-wolf with white fur hops up, planting her paws on your shoulders. <i>“Oh, do you have a treat for me?”</i> you muse. Tipping your head back, you breathe in the sweet scent of her bubbling pre-cum as her rod strains inches from you. Craning forward, you plant your lips across the broad oval of her crest, savoring the salty moisture of her passion.");
	output("\n\nShe bucks against your mouth, provoking a slight laugh from you. <i>“Bad girl,”</i> you scold, slapping her tummy. <i>“Stay,”</i> you coo, running your fingertips across her under-vein as she whines helplessly. You soak in the desperate, needy desire of the bound bitch before flicking your tongue across her swollen cumslit.");
	output("\n\n<i>“Release,”</i> you command, allowing your pet to jump forward gratefully, jamming her length into your throat in a single thrust. Your relaxation is so deep that she bucks past your curling tongue and against the back of your mouth, pre gushing freely as she goes. You rest your fingers at the peak of your neck, enjoying the feeling of your esophagus bloating with the thick puppy pecker even as your mouth fills with the ballooning girth of her knot. You swallow and gulp with a milking motion that leaves your puppy pawing at you with her building climax.");
	output("\n\nJust as eagerly as she mounted you, she busts her nut deeply into your esophagus, sending jets of thick spunk gushing down into your stomach. Her balls lightly slap your chin as her abdomen grinds against your nose, making sure every last drop finds its way into your tummy. You rub the warm blossom of liquid weight in your gut and tap the girl on her thigh to make her back up. Reluctant but obedient, the white ausar retreats from your mouth, dragging her salty tip across your forehead as her member slowly goes flaccid.");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",petProII);
}

public function petProII():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("Another pupper moves up to take her place, this one a dusky-skinned male with a cock like a burgundy pipe. <i>“Oh, finally over your shyness?”</i> you ask the gifted dog. <i>“Well, let’s find a good place for you to bury that bone.”</i> The canine cock puts your jaw to the test, forcing you to lean way back just to maximize how far you can yawn. Slowly, he pushes his way in, groaning under his mask with a muttered oath. You lightly pinch his thighs in annoyance even as he feeds you fresh inches. New puppies always forget they’re not allowed to talk, you muse, licking his cockhead as best you can, considering the mouth-stretching bulk.");
	output("\n\nOther, less patient puppers crowd around you, finding a free leg or even just a patch of skin to rub their cocks on. So many treats, you gurgle in delight, rubbing your left hand around the big boy’s fat knot while the left fondles the heavy balls dangling in front of your eyes. The pressure on your throat is intense as you push yourself down the shaft, but when your lips hit the knot, your journey stops dead. No way you’re getting past that! A fresh gout of heat sprays across the back of your throat, filling your mouth with the cheek-bloating meal that dribbles past your mouth and down your face, into your hair. Soothing the pup with long, soft strokes, you reward his softly muffled woofs with extra attention from your swirling tongue.");
	output("\n\nHe pulls out and you let the dog nut slosh around your mouth for a bit longer, savoring the flavor that creeps up your nostrils and slides down your well-used throat. A thin ausar with jet-black fur pads up and jams his shaft into your open maw like it were a wet and waiting pussy. The sudden thrust sends the last pup’s seed splattering out in gooey streams. Grabbing your lower law with both paw-gloved hands, he bucks rapidly, forcing himself from tip to knot again and again, brutally facefucking your head with a low, rumbling growl. You gulp and squirm, toes curling as your body is rocked back and forth to the brutal pace of the fierce dog.");
	output("\n\nYour vision swims as you struggle to get air between his rapid thrusts and you reach up, between her legs to grab at his tucked tail. With a tug, you pull it aside and slip a finger into his ass, honing in on his prostate with practiced motions. A steady, rubbing pressure pushes him to release, his member swelling as his strokes lose speed and become ragged.");
	output("\n\nWhen at last he reaches his limit, he pulls back and presses his tip down directly onto your tongue. You can feel the boy’s orgasm through the liquid, salty pressure of his peaking pleasure, every rapid heartbeat a fresh spout of canine cum pumped directly onto your exposed taste buds. He drills the flavor of his passion into you with every fresh ejaculation, heat building on your sticky cheeks as a flush rises to your spunk-covered face.");
	output("\n\nYou give the black-furred pup encouraging scritches, swallowing eagerly until, finally, he runs dry. Your world gradually expands outwards once more as breathing comes easily again. Faintly, you’re aware of the gooey glaze your bare skin is soaking in. Some of the less disciplined ausar must’ve blown their loads over you while you were being face-fucked. <i>“Such a waste,”</i> you moan, coaxing another pup into your drool-slick mouth, and then another. You stroke the growing expanse of your belly as all your precious pets fill you with their sweet, sweet cum.");
	processTime(20);
	pc.lust(30);
	clearMenu();
	addButton(0,"Next",petProIII);
}

public function petProIII():void
{
	clearOutput();
	showName("PET\nPRO");
	author("Adjatha");
	output("By the time the fading taste of VR spunk is replaced by the glowing lights of the real, you’re still catching your breath from the exhaustive petplay orgy. Your jaw is sore and if feels like you’ve had enough to eat for a lifetime, but you’re otherwise none the worse for the wear. As you put your gear back on, you ponder, trying and failing to understand why some people don’t like dogs.");
	processTime(2);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//Futa Scenes
//1 - Poor Little White Gel
public function poorLittleWhiteGel():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("Your gel-like body shivers with anticipation. Shifting in your seat, you take a moment to look over your thin, pale form, atrophied from a week of no food. All around you, kui-tan girls are standing, nude and erect, laughing with disbelief. <i>“This is crazy,”</i> one of them sighs. <i>“You know that right? Even for a rahn, there’s no way you can handle all of us.”</i>");
	output("\n\n<i>“Trust me. I’m a professional,”</i> you respond, your fishbowl helmet muting your words to an almost indecipherable mumble. You give a thumbs up instead, and tap the glass sphere buckled around your head. The seal around your neck is tighter than you expected. <i>“Hopefully it’ll be flexible enough to let me swallow,”</i> you mutter to yourself. Well, nobody ever broke galactic records by playing it safe. You flash the Go sign and settle back, licking your alabaster lips.");
	output("\n\nThe girls around you take up their positions, waddling to carry their heavily over-filled testes. Each of them seems to be hefting a pair of beanbag chairs, the bloated orbs sloshing with each movement. They turn to the camera, one after another, lifting their fingers up in a V before popping the cap on a vial of nuki nut and gulping it down.");
	output("\n\nThe throes of cum cascade rush through their bodies as quickly as you’d hoped, and each grabs one of the suction cups attached to your chair. Popping it onto their swelling members, the girls crowd in close, the heat of their bodies radiating into your white membrane.");
	output("\n\nFat blobs of pre-cum begin bubbling up from the now moaning girls and the pump under your seat whirrs to life. The kui-tan goo is drawn up the cock-sucking sleeve, into the vibrating tubes, fed past your shoulders and into the dome around your peak. The fishbowl helmet fills with the alluring scent of cream a second before the thin fluid splashes down over your gelatinous forehead. You can’t help but laugh as the warm, sticky spunk flows down your face and pools around your neck. In just a few seconds, the pre has reached the bottom of your chin and a flash of doubt crosses your mind.");
	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",poorLittleWhiteGelII);
}

public function poorLittleWhiteGelII():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("There’s no time to consider just how much cum you’re planning on drinking, however, as the first of the kui-tan hits her peak and begins to gush like an oil derrick. She holds the suction cum to her triple-knotted mast and bucks her hips against the liquid girth of her over-filled balls. Her urethra widens and gouts of girl-jizz flood her tube, turning the translucent plastic off-white in an instant. Thick wads of seed zip through the pump and splash down on top of you in a slimy curtain, not all that dissimilar from your own natural coloring.");
	output("\n\nYour stomach rumbles as your senses flood with fresh nut. The smells, the feel, the warmth... you can hold back no longer and crane your face forward, sipping at the delicious load like it were a delicacy. Of course, every race has a different taste, but there’s something about an aged, kui-tan vintage. Harvested at the peak of cascade, when they’re so full they can barely walk? Why, it’s divine.");
	output("\n\nYou let the mouthful roll across your tongue, from one cheek to the other as its bouquet fills your mind and, with a swallow, your throat. The heavy gulp pushes down your neck, parting the seal just enough to let it sink into your midsection. Mustn’t digest it though. Not yet!");
	output("\n\nYou turn your attention outward again, pleased to find that another girl has begun her climax as well. Your helmet is filling up quick quickly now, rising from your chin to just below your eyes. The liquid heat of their passion all around you, it’s all you can do to cross your legs and squeeze your thighs tight. Opening your mouth once more, you being your work in earnest.");
	output("\n\nYou swallow quickly, almost disappointed that you can’t take more time to just bask in the jizz. One by one, your gulping quaffs keep pace with the big balled women around you. Regular oscillations flow down your neck, like the ripples of a river, carrying twin seas of spunk to the ocean filling your gut.");
	processTime(10);
	pc.lust(20);
	addButton(0,"Next",poorLittleWhiteGelIII);
}

public function poorLittleWhiteGelIII():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");

	output("Another kui-tan hits her peak and collapses atop her own balls. Her thick shaft begins pumping while her hands sink into the pliant mass of her swaying balls. Massaging her nuts more and more aggressively, the girl’s fluffy tail twitches and spasms while her cock milker hums at full power. Her goo seethes through the machine and hits your helmet like a flash flood. The water level rises despite your pace and ivory slime rises up over your eyes and ears, submerging you in an aquarium of nuki spoo.");
	output("\n\nWith your view of the outside world lost, your attention turns wholly on yourself. No need to bother with gulps, you figure. Parting your plumping lips into a wide O-shape, you open your throat entirely, forming an uninterrupted pipeline down into your belly. You can feel the weight expanding your formerly lithe waist into plump, then thick, then outrageous levels as gallon after gallon fills your body up like a gelatinous condom. Time becomes a faint memory as you lose track of just how much spunk you’ve swallowed.");
	output("\n\nThe other girls must’ve hit their climax at some point, because your stomach seems to have hit peak elasticity. Quickly, you divert the flow into your breasts, pumping them full of the sweet, salty cream. You can feel a pressure at the back of your nipples and you focus on removing the outlets as quickly as you can. If you started to spring a leak, it’d all be over! Still blinded by your spunk helmet, you press your palms down on the expanding orbs of your chest. D-cups, F-cups, J-cups... Z-cups... you stop tracking them once they too quiver with the tension of their pressurized contents.");
	output("\n\nYour ass comes next, swelling to fill the seat of your chair in moments before expanding outward with hips that would need to use loading bays as doors. Despite your concentration, you can feel the inevitable consequences of this much suspended seed inside yourself. All the tingling, heated hunger inside you seems to focus itself right at the base of your abdomen. A firm, gel appendage pokes up from your stretched skin and swells out past your massive belly. The pseudopod bulges in the middle and throbs against your cum-fattened thighs. Your fingers clutch at the armrests of your chair, silently resisting the orgasm that threatens to ruining everything, while the seemingly endless supply of sticky girl-spunk pours into you.");
	processTime(10);
	pc.lust(20);
	addButton(0,"Next",poorLittleWhiteGelIV);
}

public function poorLittleWhiteGelIV():void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");

	output("Just as you think you’ve hit your hard limit, the liquid pressure around your head recedes. You can hardly believe it, but you seem to be nearing the end. The kui-tan arrayed around you have run dry! They cling, exhausted, to your mountainous frame, hugging their albino cum-canister with the blissed-out fatigue of sated junkies. The pumps on their cocks keep sucking, but there’s nothing left but moans.");
	output("\n\nYou take a big gulp and manage to store it in a protrusion that vaguely resembles an ‘outtie’ belly button. There’s just a bit left, right at the bottom of the helmet, but you need a moment to take an assessment. It seems you’ve filled just about every inch of your body to capacity. Where can you keep this last, little bit? You wince at the nearness of your orgasm. What can you do?");
	output("\n\nA crash of inspiration strikes and you wind your long, rahn tongue down to slurp up the last of the cum, feeding it directly into your lips. Your pucker swells and bloats into a pair of wobbling lips that practically ache to suckle at the exhausted tips of the girls around you. With a final gasp, you open your mouth wide for the camera, running your tongue along its circuit to show that you’ve ingested every last drop.");
	output("\n\nThen, at last, you allow your body to start digesting. Your colossal, cum-filled frame wobbles at the effort. But, once a go’rahn starts drinking, there’s not a force in the galaxy that can stop her. The sheer ecstasy of your unfathomably vast meal hits all your buttons at once. With a cry of gushing joy that puts the fuzzy nukis around you to shame, your ovipositor erupts with volcanic force. Every gallon of swallowed seed is almost instantaneously drained of its precious biomass and converted into rahn ejaculate. Alabaster goo spews from your shaft, blasting up against the ceiling of the room and showering down on everyone in attendance with all the urgency of a fire suppression system.");
	output("\n\nYour fertility-idol bloat recedes, bit by bit, as the endless orgasm plasters opal over everything. The heat rouses the kui-tan from their slumber, the girls giggling and gasping at the deluge. You hadn’t intended to form any eggs, but sheer organic satisfaction courses through you with a breeding imperative, kicking repressed needs into overdrive. Fist-sized eggs form in your core before being swept away by the torrent, carried out of your spasming pillar and bouncing around the room like high-velocity rubber balls.");
	output("\n\nThe girls, looking rather like drippy white galotians from all the spoo, do their part to bring your geyser down. All of them wrap their arms around your now torso-sized member and begin pumping in unison. You add your own hands to the task and after a few more chair-shaking blasts, you finally reach the glorious, triumphant end.");
	output("\n\nDespite your copious release, the weight of your feat has left its mark on you. Your normally narrow, thin body has been pumped to the absurd proportions of a loo’rahn. A definite paunch in your belly and the extra thick hips and ass seem utterly out of place on your cream-polished frame. The eye-boggling Q-cups on your chest make you think twice about trying to stand up just yet, and the wobble of your inflated lips lets you know that the last gulp of all that nuki nut is still with you.");
	output("\n\nYou tap a water-proofed tablet dangling from one armrest and upload the video to the judging committee. After a brief wait, the screen blinks with a bright, golden glow. You’ve done it! You’re the new record holder for the most cum swallowed by a single humanoid organism at once! Now everybody will know the name...");
	processTime(10);
	pc.lust(20);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	addButton(0,"Next",poorLittleWhiteGelV,cumNum);
}

public function poorLittleWhiteGelV(cumNum:Number):void
{
	clearOutput();
	showName("RECORD\nSEEKER");
	author("Adjatha");
	output("...[pc.name] Steele!. Wait. Who? You blink, shaking your head in disorientation. Despite not being a rahn, you think you can still feel the strain of all that cum filling your body at once. When you move, you keep expecting the spunk-bloated, jiggling weight of all that fluid hold you down. It takes a few minutes to re-orient yourself to your old body, and longer still to get the taste of thousands of gallons of cum off your mind.");

	if(pc.hasCock())
	{
		//player has a penis but no Bubble Buddy
		if(!checkToyDrawer(BubbleBuddy) || cumNum == 0) 
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum == 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			//{player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	else
	{
		output("\n\nYou instinctively reach down to massage your poor, abused cock, only to remember it was a simulation. Nevertheless, you can still feel the ache of your utterly drained VR testes. You gradually get up and put your gear back on, moving slowly from the phantom fatigue.");
	}
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//#2 - Bodysuit Bubbles
public function bodysuitBubblesScene():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("<i>“Alright, I think we’re good to go. Hear me okay, Gin?”</i>");
	output("\n\nYou touch the small, buzzing beads body-glued to your throat and aural-holes self consciously. <i>“Yeah, loud and clear, Vee,”</i> you whisper almost inaudibly. You can hear the sound of bustling crowds just around the corner as Tavros station gears up for another busy, artificial day. Visitors and residents alike fill the crowded halls with the dull roar of their impatient rush.");
	output("\n\nYour tail swishes anxiously while you tug at the squeezing confines of your brand new body suit. Your busty ovir frame fills out the faux-latex well enough to leave little room for bunching, but you can’t help feeling practically naked in the thing. A second skin so fine, it’s almost like you’re wearing nothing at all!");
	output("\n\n<i>“How in the inky depths of the galactic core’s black hole did I let you talk me into this Vee,”</i> you hiss to your kui-tan friend on the other end of your communication rig. <i>“My sister said you’d be nothing but trouble, you know.”</i>");
	output("\n\n<i>“Trouble is just fun you don’t realize you’re having at the time,”</i> she shoots back with a scolding click of her tongue.");
	output("\n\n<i>“That doesn’t make any sense!”</i>");
	output("\n\n<i>“It doesn’t have to! Now get out there, you big baby. I’ll do it next time and the you can be the one making up encouraging quips.”</i>");
	output("\n\n<i>“Yeah, next time. Assuming this doesn’t get me thrown in jail,”</i> you mutter, squeezing your thighs together as you tighten your hands into fists. The nervous heat in your belly has migrated south and those ticklish butterflies have started doing some inappropriate things to the space below your hips. With a gulp, you step out of the back alley and join the crowded press of bodies moving through the space station’s commercial district.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneII);
}

public function bodysuitBubblesSceneII():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("The bulges of your puffy nipples stand out under the flush fabric, drawing some covert glances at you join the crowd. A few even notice the blatantly obvious swell of your lower lips, but the alien throng mostly mind their own affairs and shuffle inattentively past the glowing neon ads and holographic billboards. Blessedly, the few who do notice your state say nothing to the alert others to the blushing, squirming ovir in their midsts.");
	output("\n\n<i>“You can do this no problem, Ginny,”</i> your friend cheerfully observes. <i>“Everybody’s so plugged into their coms and tablets that they wouldn’t notice if you jammed your big, lizard cock up their asses.”</i>");
	output("\n\n<i>“Vee!”</i> You hiss, turning a darker hue at the hot flush that sweeps over you.");
	output("\n\n<i>“Oh, they can’t hear me! Relax and enjoy,”</i> the kui-tan adds, dismissively. Her suggestion, however, hits its mark and your imagination takes off.");
	output("\n\n<i>“They can’t, but I can! Just chill out with your-”</i> a jolt takes you out of your head-space and you realize you’ve just walked directly into an ausar girl. She lets out an distressed eep and nearly drops the thin screen she’d stopped to read. Turning around to scold you for your inattention, you’re treated to a smack across the face as her obviously augmented bust swings into your cheek like a pillowy fist. You teeter back and fall on your ass, reeling from the not entirely unwelcome surprise more than the impact itself.");
	output("\n\n<i>“Um, would you watch where you’re, like, going?”</i> the canine chirps in oblivious annoyance as she scans her screen for any damage or fingerprints. As she does, her gravity-defying tits continue their jiggling wobble in almost mesmeric fluidity.");
	output("\n\n<i>“But - but you’re the one who stopped first,”</i> you shoot back while the foot traffic parts around the two of you like a river of bodies flowing around an inconvenient island.");
	output("\n\n<i>“Uh, that’s ‘cause I got a super important message? Um, duh?”</i> Glancing down at you for the first time, her lips curl in distaste. <i>“Like, what are you even wearing? And, like, what is that between your legs?”</i>");
	output("\n\nThe righteous heat in your chest rushes up to your face as anger becomes embarrassment in an instant. You realize you’d been staring at the bimbo’s chest a bit too intently. The flutters in your gut have become the rush that you’d been fearing. A thick python of ovir masculinity has already snuck past your sheath lips as it engorges. Each heart beat thickens and lengthens the third leg as it creeps under your suit and up your abdomen. You throw both hands over the bulge and awkwardly rise to your feet. <i>“S-sorry!”</i> you yell too loudly and dive into the protective anonymity of the ever-moving tourist crowd.");
	output("\n\nYour kui-tan buddy meanwhile is cracking up in your ear, laughing herself breathless. <i>“Ha ha hah! Did you - are you - this is so fucking great... did you plan that? You gotta level with me: did you get a boner from falling on your ass or from being yelled at? Gin you kinky bitch, I never knew!”</i>");
	output("\n\n<i>“Neither!”</i> you shoot back. <i>“I’m into normal stuff,”</i> you mutter, your voice gaining volume as you press on. <i>“It was her big, fake tits, if you have to know! I’m into normal stuff! Normal! Not some weird humiliation fetish,”</i> you practically yell.");
	output("\n\n<i>“Fuck! My ears! That mic is set up for whispers, you scaly-tailed cunt! Warn me before you blow out my hearing next time!”</i>");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneIII);
}

public function bodysuitBubblesSceneIII():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("A sudden cold, sinking sensation overtakes you as you realize just how loudly you’d been yelling. The crowd has all but stopped in their tracks, staring at you with with a curious intensity. You can practically feel their eyes boring into you as your erection continues its ascent, winding between your breasts while the bodysuit clings so tightly your veins are showing. The medial ring emerges from your slit like a fat reminder just how plainly everyone can make out every last detail of your throbbing flesh through the immodest outfit.");
	output("\n\n<i>“Shit,”</i> you whisper, hunching over and ineffectually trying to hide your mast with both arms. All you really accomplish is squeezing your cleavage tighter while your manhood slides into it.");
	output("\n\n<i>“Don’t get off on humiliation, huh? Methinks she doth protest like a lying bitch. Did you forget to tell your dick about all your totally normal fetishes?”</i> Vee taunts into your ear.");
	output("\n\nThe people around you have begun whispering to each other and it’s all you can do to try to ignore it while you uselessly try to calm yourself. Your hips wiggle as warm, thin pre-cum begins to bubble past your broad peak and wash down your cock-stuffed cleavage. <i>“Everybody’s looking,”</i> you wail to your nuki friend as your body heat climbs another few degrees. <i>“What do I do?”</i>");
	output("\n\n<i>“Better not think about their hands all over your slutty scales,”</i> she teases. As if the suggestion was all it took, the clinging tightness of the faux-latex seems to transform into the hungry, obscene grip of hands all over you. Cupping your breasts, stroking your thighs, teasing your tail, pinching your nipples, tickling your underarms...");
	output("\n\nA shudder runs down your spine and a reflexive abdominal ripple sends a fat blob of spunk up your bulging trunk. A visible bubble of jizz fills atop your flat cockhead, drawing gasps from the crowd.");
	output("\n\n<i>“Did she just...?”</i>");
	output("\n\n<i>“Oh, how indecent!”</i>");
	output("\n\n<i>“Shameless...”</i>");
	output("\n\n<i>“Lewd!”</i>");
	output("\n\n<i>“Disgraceful...”</i>");
	output("\n\nThe words cascade around you and you moan, trying to pat down the cum bulge, only to send the warm spunk running down the rest of your body. Sticky heat seeps down the interior of your suit, your liquid lust oiling your body. You heart races faster and faster as the situation deteriorates.");
	output("\n\n<i>“What are you waiting for,”</i> Vee giggles to you in a private, coaxing whisper. <i>“Give the people a show.”</i>");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneIV);
}

public function bodysuitBubblesSceneIV():void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("Blushing and shaking with lust now as much as embarrassment, you move your palms from uselessly trying to hide your huge, two-foot length to actively stroking it instead. A few gasps from the crowd are largely swallowed up the by far louder cheering as the pervs push their way to the front of your audience.");
	output("\n\nWith everyone totally obsessed with your softly moaning frame, you sink to your knees. The heels of your palms drive against the unyielding firmness of your cock while fresh waves of pre-orgasmic excitement flood your suit and stretch out the rubbery skin. With more pouring into the oh-so-tight suit, it begins to feel like you’re practically swimming inside the ballooning body condom.");
	output("\n\n<i>“Are all ovir like this?”</i>");
	output("\n\n<i>“...gotta be some guerilla marketing thing...”</i>");
	output("\n\n<i>“...how much can that outfit hold?”</i>");
	output("\n\nYou moan louder and stroke faster, enlisting your tail to help squish past the cum-swelling second skin in a race for your eagerly awaited climax. <i>“I am going to get you back so hard for this,”</i> you gasp into your mic while the kui-tan at the other end purrs stimulus right back.");
	output("\n\n<i>“Sure, sure. You’re not loving every second of this. Big finale now!”</i>");
	output("\n\nYou squeeze your tits together and start bobbing up and down, tit-fucking your cockhead with your own trapped cum as lubricant. When the peaking pleasure overtakes you, it does so in time with a roaring cheer from your audience of complete strangers. Jizz spurts from your bestial girth and, with nowhere else to go, spouts up and out of the bodysuit’s seal around your neck. Gouts of creamy alabaster shoot up, under your chin and into your hair and nostrils before pouring back down over your bloated outfit like a self-contained shower. The faux-latex glistens at the gooey varnish, cascades of white running down your shoulders, over your breasts, and pooling between your thighs as you helplessly pant and sway.");
	output("\n\n<i>“Damn, girl! How long you been saving that up?”</i> Vee asks, vocalizing the shocked sentiment of your speechless audience. <i>“I will never understand how those internal gonads work.”</i>");
	output("\n\nAwash with jizz, inside and out, you scarcely notice when station security pushes past the crowd to collect you. Steady pumps keep pushing waves of cream against your throat and down your body, but the cops lay hold of you all the same, lifting your boneless, blissed-out frame between them.");
	output("\n\n<i>“I’ll get bail for you this time, if you get bail for me next week,”</i> Vee offers with gleeful delight, no doubt already uploading the recording to the extranet.");
	processTime(10);
	pc.lust(15);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",bodysuitBubblesSceneV,cumNum);
}

public function bodysuitBubblesSceneV(cumNum:Number):void
{
	clearOutput();
	showName("BODYSUIT\nBUBBLES");
	author("Adjatha");
	output("Your shoulders sag as the simulation fades and the station security are no longer supporting you. You breathe a sigh of relief at not actually being arrested for that little show, though a twinge of outrage is still there. People do way worse than that! How dare they arrest you for a little dare!");

	if(pc.hasCock())
	{
		//player has a penis but no Bubble Buddy
		if(!checkToyDrawer(BubbleBuddy) || cumNum == 0) 
		{
			output("\n\nYou glance around and realize your in-simulation orgasms were matched by real world ones as well.");
			if(cumNum == 0) {}
			else if(cumNum < 20) output(" Spurts of jizz have left dripping blobs on the panels and across the floor. It’s a bit embarrassing, but shouldn’t be too hard to clean up.");
			else if(cumNum < 100) output(" Large puddles of cum are pooled around your feet and you even seem to have hit yourself with some of it while you were under. You clean up as best you can, but somebody else is going to have to give this place a good scrub. Whoops!");
			else if(cumNum < 4500) 
			{
				output(" The panels around you are practically coated with the dripping curtain of cum you’ve released. Your body didn’t fare much better, and everything is sticky. You should really consider getting something to catch all this next time!");
				pc.applyCumSoaked();
			}
			else 
			{
				output(" A sudden wave of exhaustion hits you and you numbly glance around. Every surface is coated in dripping streams of spunk, from the walls to yourself, and even the machine itself. Thankfully, it seems to be waterproof. You don’t have the energy to clean up, so you’ll just have to stew in your own juices for a while longer.");
				pc.applyCumSoaked();
			}
			output(" You gradually get up and put your gear back on.");
		}
		//player has a penis and a Bubble Buddy
		else
		{
			output("\n\nWhen you’ve finally put the after-effects of the simulation aside, you note that your rubbery cum-sheath has a present for you. It seems your VR orgasms were mirrored in real life and the Bubble Buddy has collected the results. You twist-seal the package and put your gear back on.");
			//{player gains cum bubbles as if taking the Masturbate option with the Bubble Buddy}
		}
	}
	processTime(2);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//#3 - Breakin’ the Law
public function breakingTheLaw():void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("The rear hatch slides open with a whisper, noise following after like thunder following the rain. <i>“Whoo! We did it! Bastards never saw it coming, either. Fuck the UGC!”</i> The speaker, a boisterous galotian adopting the features of an eye-poppingly well-endowed human woman rolls into the ship’s interior with a further hoot of victory.");
	output("\n\nHer companion, a purple rahn, enters more deliberately, tossing a lab tech’s uniform into the ship’s incinerator slot as she does so. <i>“We’re not free and clear yet,”</i> the gel woman cautions, rolling a number of stainless steel capsules in the palm of her hand. <i>“The police and security forces will be looking for amorphs.”</i> She turns to you with a thin smile. <i>“Time for you to earn your share.”</i>");
	output("\n\nReflexively, you pull your big, fluffy kui-tan tail in front of your face. <i>“O-okay Miss Violet,”</i> you stammer nervously.");
	output("\n\nThe rahn sighs, stalking toward you. <i>“It’s Violet. Just Violet. They’re code names, Brown, not surnames.”</i> She kicks a wide, steel ring as she approaches, sending the device sliding next to you. <i>“And stop leaving your cockring jerk-off toys around the ship. It’s unsanitary,”</i> she hisses, inches from you.");
	output("\n\n<i>“But, if the fuzz is supposed to believe she flies around with massive balls all the time, wouldn’t a lot of toys sell the ‘pervert’ angle better?”</i> the galotian thief asks, sloshing next to the rahn mastermind.");
	output("\n\n<i>“I... suppose so,”</i> she admits grudgingly. <i>“No time to argue about it now anyway. Let’s get underway. First,”</i> she enumerates, bringing her palm to her mouth and swallowing all but one of the capsules, letting them float inertly in her gelatinous body. <i>“Next.”</i> She lifts the last pill between her forefinger and thumb, pulling the full weight of her pheromone control to break on your defenseless body. <i>“Sit.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",breakingTheLawII);
}

public function breakingTheLawII():void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("You’re on your butt in the captain’s chair before you realize you’d been moving. <i>“Open up,”</i> she murmurs and you pull the zipper of your inconspicuous flight-suit open, bearing your C-cup breasts and massive, 26” kui-tan cock. The knotty phallus is so thick it’s almost like a third leg resting atop your softly furred thighs. Your sac is as close to empty as you could get it, barely an inch across and virtually lost beneath the unfuckably thick member.");
	output("\n\n<i>“Can’t we have a celebratory snack first,”</i> the goo girl whines.");
	output("\n\n<i>“You’ll have all you can drink in a few minutes, Green. Patience.”</i> Violet takes the single capsule and pulls the two halves of its containment apart, revealing a squishy blob of ooze that glows with neon, lime-green light. <i>“The latest in Fixed-Body abuses,”</i> the rahn muses, using the term like a curse. <i>“Forget GaloMax, Formula 469 will give them all the flexibility of a galotian and the structure of a rahn, targeted exactly where they want.”</i> She sneers, looking at you as if you were responsible for the thing, rather than a hired accomplice to the theft. <i>“Notes destroyed, files wiped, and prototype stolen; let’s see them come back from that.”</i>");
	output("\n\n<i>“Yeah, but, don’t we kinda need it to work, Violet? You know, to hide an’ stuff?”</i>");
	output("\n\nThe purple girl turns her focus on you once more. <i>“Let’s see what science has wrought.”</i> She drops the goo onto your urethra before swallowing the empty canister along with the others. A cold, slimy sensation spreads across your crest as the transformative sinks into your body, going to work on your cock and balls immediately. You shudder as the chill of exposure turns hot, your flesh losing consistency for a moment before solidifying once more. You hiccup once and just like that: it’s done.");
	output("\n\nYour penis feels a bit alien. There is a slight delay in sensation, making it feel as if someone else’s cock were between your legs. Experimentally, you put a pinkie at the tip of your shaft and push down. The flesh now feels softer, as if it were little more than gel. You push the digit into your urethra and it takes it with hardly any difficulty, swallowing the digit up to the third knuckle.");
	output("\n\nYou’d expected pain or at least discomfort, but the feeling is, if anything, intoxicating. You push more fingers in, marvelling at how pliable your mast has become. The fat prick stretches and gapes as your whole fist pushes in, doubling girth to accommodate the firmness of your hand. Pulling out, you flex and the shaft returns to its prior state, no worse the wear for your insertion.");
	output("\n\n<i>“The coppers are gonna be looking for some amorphs, but they’ll never think to check the kui-tan with two girl-sized balls,”</i> Green gloats, her excited impatience drawing her to your side with fawning affection. <i>“Ready or not, here I come,”</i> she giggles.");
	processTime(10);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",breakingTheLawIII);
}

public function breakingTheLawIII():void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("The galotian criminal puts her fingertips to your phallus and all but dives in with delighted squeals. Your permissive penis takes on her hands and forearms as easily as your lungs take in air. You lean back in your chair, biting your lower lip as your body expands with each passing moment. Green, both arms inside, mimes taking a big breath before lowering her head and ducking in, shoulders and all. The slime gal’s body warmth floods into you like an orgasm in reverse, her liquid body sliding through your sensitive, muscled interior, stretching the fleshy pole with her curvaceous form.");
	output("\n\n<i>“S-slower!”</i> you beg as the faint ache of churning cum production starts deep within you. As if she can sense the brewing meal, Green hastens her descent, her breasts slipping past your swallowing slit, followed by her belly. You flex and gasp, doing your best to keep from jizzing her right back out, closing off your muscles and pulling her deeper into you, an inch at a time.");
	output("\n\nYour triple-knotted cock is an virtual parody of itself- nearly two feet across as the green girl is sucked down into your ballooning balls. Her absurd hips press against your drug-treated body and are caught for a long, wonderfully tantalizing moment before being pulled in with a wet plop.");
	output("\n\nWith the girl’s thickest spot swallowed, the rest is pulled in like water being sucked down a drain. Your urethra narrows and she kicks her feet daintily as  her gooey legs slip down and vanish into you, your cock returning to its normal size a moment later.");
	output("\n\nGasping, you tremble and try to calm yourself. Your previously tunnel-sized cock shows no signs of its trial, not even the slightest stretch mark. The only sign that the galotian girl didn’t simply vanish is hanging between your legs. You scoot forward and let your nearly 3’ wide ball plop off your lap and down onto the floor with a burdened jiggle. You perch at the edge of the captain’s chair, rubbing your sing, mammoth nut gently, feeling the slight movements of Green within as she no doubt feasts on the cum steadily filling up her hiding place.");
	output("\n\nYou raise your gaze to Violet and are about to invite her in to fill the other orb when your voice cracks as a monumental orgasm sweeps through your momentary lapse of concentration. You shudder and gasp, fingers digging into your armrests as your chest heaves. You feel heat surging upward as the galotian, recently settled, is forced upward once more.");
	processTime(10);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",breakingTheLawIV);
}

public function breakingTheLawIV():void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("A purple hand slams the stainless steel ring down onto your member, shutting off the release before it forces Green right back out. Violet shakes her head in exasperation. <i>“Try to be a professional,”</i> she scolds as you tremble your way through the dry shudders of your ring-locked climax. Once the threat has passed, Violet removes the sex toy and hands it to you with a look of disdain. <i>“Just in case you find yourself unable to hold back again.”</i>");
	output("\n\nGulping, you nod silently and spread your knees, holding your mast in both hands. Rather than dive in like her companion, Violet moves forward and climbs onto your lap. Delicately, almost modestly, she raises one leg and presses her toeless foot to the peak of your heart-shaped cockhead. She wiggles as the elastic urethra opens and her purple gel and sinks into you, engulfed her up to the ankle. Her pheromones flood your senses once more and she grabs you by the jaw, locking eyes with you. <i>“Do. Not. Cum.”</i> You nod, mutely, as she slips one leg down to the knee into your stretching body.");
	output("\n\nAs matter-of-factly as if she were putting on stockings, the doh’rahn bends over and hooks a finger around your widened peak, stretching it further to allow her to slip her other foot inside as well. Firmer than her galotian partner-in-crime, you can clearly make out the outline of Violet’s slender legs deforming your shaft as she slides into your bit by bit. You groan and your tail thumps heavily on the floor, but her command stays with you and the orgasmic bliss simply keeps building without any hint of release. Her hips slide into your now girl-shaped mast as her feet slide down into your balls, and a muscle spasm drags her deeper in, up to her chest.");
	output("\n\nWith the rahn halfway down your devouring cock, you figure now is as good a time as any. <i>“V- Violet?”</i>");
	output("\n\nThe gel girl rolls her eyes as she sinks into you, her breasts slipping inside the form-fitting phallus. <i>“Please don’t tell me you’re going to profess your love for the girl going into your balls.”</i>");
	output("\n\n<i>“N-no. It’s just that... you’re under arrest.”</i>");
	output("\n\nThe look of annoyed boredom slips into such authentic shock that you very nearly orgasm despite her earlier command. <i>“Wha-”</i> is all she can get out before you flex the full strength of your highly-trained groin muscles and pull her down, into your balls in a sudden, slurping motion. Her arms fly up and are swallowed too, her hands vanishing past the lip of your shaft as she joins the galotian.");
	processTime(10);
	pc.lust(25);
	clearMenu();
	addButton(0,"Next",breakingTheLawV);
}

public function breakingTheLawV():void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("You fit the cockring around your member, fitting it securely around the base of your lowest knot. With a comforting hand, you stroke the full length of your 6’ balls, feeling the two girls squirm helplessly within. <i>“Amorphs,”</i> you chuckle, reaching for the communicator hidden in the seat of your chair. <i>“Act like a push-over and they’ll assume you’re as spineless as they are.”</i> You pull the com to your mouth but hesitate. The sloshing inside of you keeps up at a steady pace, the girls pushing against the confines of their fleshy prisons, perhaps trying to communicate with one another through your internal walls.");
	output("\n\nYou set the com aside and pat the entrapped criminals almost affectionately. <i>“We planned out this sting for months, but not a single scenario went down like this,”</i> you admit. <i>“Still, I have to say, I’m pretty appreciative. Maybe enough to give you girls that celebratory snack after all.”</i> In preparation for the capture, you’d emptied your sac, so you swing your chair around and reach into a bin on the floor. Retrieving a fat, blobby balloon of a condom from it, you untie the tip and watch the white goo sloshing warmly within. <i>“A really big snack.”</i>");
	output("\n\nYou lift the condom to your lips and slurp down the fresh nuki nut, swallowing the slightly salty jizz with satisfaction. A kui-tan cum cascade can be tough to handle under normal circumstances, but this time you’ve got help. The narcotic euphoria sweeps over you as heat builds under your fur. The tip of your tail twitches and your ears flick in agitation. <i>“I hope you girls are still hungry,”</i> you moan, grabbing your shaft and sliding a thumb up and down the sensitive peak.");
	output("\n\nYour body goes into full blown cascade with a white flash behind your eyes that leaves you panting and pawing at your ring-sealed mast. Your balls begin filling with fresh spunk, filling the girls’ prisons with the thick batter of your alabaster seed. You can feel the two inside you, palming at your inner walls, trying to force their way out, to no avail. The two colossal orbs grow larger as they fill, bloating outwards with every rapid heartbeat.");
	output("\n\nBy the time your testicles have reached nearly double their girl-filled girth, the struggles within have ceased. Perhaps sensing the futility of their attempts, or simply overcome by their gooey thirst, the two seem to set about their task. You rest your palms on either nut and coo with delight as you can feel them slowly shrinking, bit by bit, as the girls drink their fill and more from your flooded depths. Just how long can you keep them like this?");
	output("\n\nYou pick up your com once more and click it on. <i>“This is ‘Brown.’ No sign of the amorphs. I will head back to the rendezvous and try to meet back up with them.”</i>");
	output("\n\nYou click the com off and toss it aside. That’ll keep the UGC satisfied for the time being. You’ll let them out eventually, but for now, the three of you can have plenty of fun right where you are.");
	processTime(10);
	pc.lust(25);
	var cumNum:Number = pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",breakingTheLawVI,cumNum);
}

public function breakingTheLawVI(cumNum:Number):void
{
	clearOutput();
	showName("BREAKIN'\nTHE LAW");
	author("Adjatha");
	output("When the smut fades away, you feel a deep emptiness that leaves you cold. You reach out for the massive balls housing your goo girls before remembering that it was just a porn. Still, the memory stays with you, making it difficult for you to stand and put on your gear, as if  you were still burdened by your cum-bound captives.");
	output("\n\nFaintly, you wonder if Formula 469 is a real thing or not.");
	processTime(2);
	mindwashNextButtonAndStatAwardsAndClears(cumNum);
}

//[Celise]
//Spaceship only
public function mindwashCelise():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	if(flags["CELISE_MINDWASHED"] == undefined)
	{
		output("Honestly, you’re not even sure if Doctor Badger’s technology works on galotians. But your emerald goo girl rarely seems to mind being a test subject, as long as there’s jiggly, gushing fun afterwards. You find her blobby puddle snuggled up against a heated pipe near the rear of your ship and with a poke, manage to rouse her from the quivering nap.");
		output("\n\nHer head molds out of the slime and glances around. <i>“Hrm? Oh! Hiya [pc.name]!”</i> Her face beams with playful mirth. <i>“What’cha up to?”</i>");
		output("\n\n");
		if(pc.isNice()) output("You explain the Mindwash Visor as best you can to goopy girl, but her short attention span interferes with your attempts. <i>“A new toy? Sure! I’d love to play with you,”</i> she giggles, completely ignoring your safety warnings. Hoo boy.");
		else if(pc.isMischievous()) output("<i>“Hey Celise! Do you ever wish you could be other people?”</i> She shivers and changes her shape to vaguely resemble you. <i>“Uh, not like that, I mean in your mind.”</i> Celise stares blankly, then changes her shape into you again. <i>“You know what? Forget it. I got a new toy. Come test it out with me.”</i> She nods excitedly, all too happy to help out.");
		else output("You give Celise a doubtful look and ask if she even has a brain to be washed. <i>“My whole body is my brain,”</i> she chirps, helpfully. <i>“Pound for pound, I’m probably the biggest brain on the ship. So super dooper smart, I should get, like, smart-girl glasses.”</i> Rolling your eyes, you just motion for her to follow you.");

		output("\n\nYou and your galotian head to the chair you’ve set up for the visor and with squelching slurps, she climbs up and wiggles into place. Her goo pools around the cushion and drips onto the floor, but her jiggly curves manage to stay solid enough to let you lower the visor down around her eyes. <i>“Ooooooo. Pretty!”</i> She starts poking at the visor, but you pull her hands back down to the arm rests.");
		output("\n\n<i>“Just sit there and let the machine work,”</i> you advise, flipping the external switch to activate the machine and stepping back to watch.");
		output("\n\n<i>“This feels funny. Am I-”</i> she stops mid sentence as the visor hits its stride. Lights start flashing across the screen at a rapid pace while the goo girl’s body swells and contracts, as if her whole form were taking a deep, steadying breath. ");
		//if Celise has tentacles activated: 
		if(flags["GIGACELISE"] == 1) output("The mass of her writhing tentacles slips back into her body, sucked up to allow her breasts to swell once more to the porn-star levels she is no doubt experiencing. ");
		output("Your emerald friend’s long, slimy tresses sink into her back and shoulders, leaving a short, sensible bun perched atop her head. Her body changes bit by bit, until she’s nearly unrecognizable from the girl she was at the start of all of this.");

		output("\n\nThe reshaped goo twitches, her mouth curled in an O of pleasure and you notice dimples form on the outside of one of her breasts. They run across the globular surface, sliding in shrinking circles until they reach her big, puffy jade nipple. As her fat areola squeezes outward, you realize what those dimples must’ve been: fingers. Her body is acting out what her mind is experiencing.");

		processTime(4);
		clearMenu();
		addButton(0,"Next",mindwashCeliseFirstimeII);
	}
	else
	{
		//these scenes are randomly selected from all the component listed next to each other
		output("All you have to do is crook a finger at your galotian and the green girl climbs up into the seat you’ve set aside for the Mindwash visor. She squirms a bit to get comfortable and giggles as you lower the mask over her eyes. With a little tweak to the intensity settings, you send her off into a very smutty dreamland.");
		output("\n\nThis time, Celise reforms into ");
		var celiseScene:Number = rand(6);
		if(celiseScene == 0) output("a well endowed kui-tan, her nuts swollen with seed and need.");
		else if(celiseScene == 1) output("a feminine ovir, her trunk-like shaft slipping out from between her thighs like a floppy third leg.");
		else if(celiseScene == 2) output("a masculine, well-built ausar with muscles so tight that you can practically see veins in the goo.");
		else if(celiseScene == 3) output("a particularly busty zil girl, her belly gravid with and extremely advanced pregnancy.");
		else if(celiseScene == 4) output("a built  thraggen, drooping balls the only part of her that’s not rock hard.");
		else output("a long-eared raskvel, her huge hips squishing against the limits of the chair’s armrests.");
		output(" Celise seems to adjust to her new shape almost immediately, as if she’d worn it all her life. The flickering light of the visor seems to send pink trembles through her goo as the show gets started.");

		output("\n\nWith little ceremony, her body starts telling you everything you need to know about the scene she’s currently experiencing. ");

		celiseScene = rand(4);
		if(celiseScene == 0) output("A host of finger indentations spread across her body, dozens fo invisible people clutching and groping every inch of her form.");
		else if(celiseScene == 1) output("Her mouth goes wide as an invisible mass thrusts into her maw, filling one cheek, then the other as handprints form around the back of her head.");
		else if(celiseScene == 2) output("Her knees are lifted and spread to accommodate the unseen girth of an absurdly massive shaft is forced, inch by inch, into her ass.");
		else output("Her hands sink between her legs, frantically pressing into her reformed anatomy with all the pent-up lust of a horny teenager.");

		output(" You can hear Celise moan but only faintly, as if her voice were coming from some vast distance. She wiggles and squirms, knees trembling and chest fluttering as she blushes with a deep, forest green flush.");

		output("\n\nYour galotian winces as ");
		celiseScene = rand(4);
		if(celiseScene == 0) output("a clear hand-print appears across her ass so violently you imagine you can almost hear the slap.");
		else if(celiseScene == 1) output("the underside of fingers appear around her neck, tightening just enough to make her take short, shallow gasps.");
		else if(celiseScene == 2) output("her hair jerks down, pulled by some unseen force with a tug fierce enough to yank her head back.");
		else output("a human-shaped footprint presses down on her crotch, shifting from side to side and driving its heel against her throbbing body.");
		output(" The violence startles you, but the goo girl just squeaks out a cooing whimper. Chest heaving with swelling excitement, she ");

		celiseScene = rand(4);
		if(silly && rand(2) == 0) output("affects a falsetto, proclaiming <i>“Oh, what a lovely tea party!”</i>");
		else if(celiseScene == 0) output("calls out for daddy to give her more.");
		else if(celiseScene == 1) output("begs them to let her cum.");
		else if(celiseScene == 2) output("defiantly asks if that’s all they’ve got.");
		else output("eggs them on, crying out <i>“Again! Harder!”</i>");

		output("\n\nYou aren’t sure if there’s any response from the hidden participants in the porn Celise is experiencing, but the action carries on. For the next hour, she is subjected to ");
		
		celiseScene = rand(4);
		if(celiseScene == 0) output("dozens of tongues licking her all over while just as many cocks force themselves into her ass, one after another.");
		else if(celiseScene == 1) output("a series of slapping impacts across her face that knocks her head to and fro, until she’s disoriented, drooling, and pinching her nipples hard enough to make herself yelp.");
		else if(celiseScene == 2) output("a rising and falling weight atop her lap, invisible thighs squeezing and grinding into the goo’s base with heedless abandon.");
		else output("a seemingly endless array of small pinpricks as needles are being forced into her arms, shoulders, thighs, and ass, filling her with dizzying number of unknown drugs.");
		output(" Through it all, she whispers heated groans and whimpering moans, occasionally offering faint encouragement as much to herself as the invisible figures leaving their indents across her supple, verdant mass.");

		output("\n\nWhen the porn reaches its peak at last, you’re ");
		if(pc.isNice()) output("almost relieved that your poor goo’s ordeal is coming to an end.");
		else if(pc.isMischievous()) output("still trying to reconstruct the plot in your head, filling in characters and motivations like a mad lib.");
		else output("practically taking notes on some fun new things to try out yourself.");
		output(" Celise gurgles as ");

		celiseScene = rand(3);
		if(celiseScene == 0) output("her interior parts to allow non-existent loads of cum to pour down her lips and up her ass in twin torrents that rush to meet in her middle.");
		else if(celiseScene == 1) output("large holes open through both nipples, heavy piercings weighing down her teats with and leaving ring-like indentations on her pliant peaks.");
		else output("gushing release spurts from her body with the honey-thickness of long-teased bliss.");
		output(" At the height of her climax, the bimbo’s expression is one of glowing rapture, triumphant in her needful indulgence.");

		output("\n\nRippling waves of orgasmic pleasure send wobbling vibrations through the girl’s gelatinous form, ultimately shaking her self-control away. She collapses into a puddle of goo once more, and you pull the visor aside, switching it off. It takes a bit longer than usual for her to reform, but your slimy friend returns with a big, dopey smile all the same. <i>“I dunno how you guys do it! Being solid is crazy!”</i>");

		output("\n\nYou assure her that, yes, it is quite crazy and help her down from the chair. If it were anybody else, you’d worry about subjecting them to the machine this intensely, but something tells you that Celise will just keep springing back to her old self, no matter what the visor throws at her.");
		processTime(75);
		pc.lust(25);
		IncrementFlag("CELISE_MINDWASHED");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function mindwashCeliseFirstimeII():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("The rounded peak of her nipple is pressed inward by an invisible force, squishing her bloated teat inward, further and further. As if opening with a heated sigh, the tip of her peak dilates, widening enough to allow what could only be a phallus into her massive, jiggling breast. You round the goo and stare down the two-inch tunnel being pressed into her and even reach a finger out to wiggle the digit in the deepening hole. If you didn’t know better, you’d think Celise were getting nipple-fucked by an invisible cock. Not a big deal for a galotian, but one has to wonder who the porn star was for whatever she’s watching.");
	output("\n\nThe other breast experiences a similar procedure: unseen hands roughly grabbing the weighty mass before a fat phallus pushes past her impossibly pliant peak. More hands form around her knees and pull her plump thighs apart. A pair of indentations on her abdomen seem to suggest a double-dicked participant has entered the orgy and in short order he goes to work as well. Both her pussy and her asshold widen with intangible girth, all four shafts in her pushing deeper and deeper. Once every tunnel infiltrating the girl’s body seems to have reached its limit, she turns her head over one shoulder and the the ‘o’ of her moaning delight is pulled to the very limits of her cheeks, the largest cock of all jamming itself past her tongue and down her widening throat.");
	output("\n\nShe jiggles with the weight of her unseen partners’ lust, her molded form possessed by thirty minutes of frenzied thrusts. She seems perpetually on the threshold of a full-body orgasm as her frame is plied to exhaustion by by unquenchable lusts. Cylindrical tunnels visibly bisect her body again and again, thrust after thrust. There is a sense of tension, every point of penetration widening more  and more until, at last, the invisible masses are pushed to their limits and fat bulbs pop into place. Celise - or more accurately, whoever she is watching - has just been quintuple knotted. The experience is too much for her, and the girl starts helplessly squirting in the intensity of her climax. Because her simulated partners have nothing real filling her tunnels, the galotian’s gooey juices start spraying out of her pussy, drenching her inner thighs and dripping into a pool on the chair seat.");
	output("\n\nThe outlines of knotted phalluses pump with the disjointed, shallow strokes you’d expect of four people reaming a single girl, all while the galotian squirms and creams herself with gushing, sloppy gurgles. The shaft in her throat bloats and you can practically see the path of its invisible spunk as the peak sprouts a thin offshoot which rolls down her chest and pools in her middle in an expanding, empty stomach. One after another, the knotted tunnels reach their own climax in the girl, pouring the bloating contents of their bliss into her overfilled form.");
	output("\n\nThe imaginary dog dicks try to pull out, but the knots are too large and her body too tight, so they content themselves with a slow, lazy series of half-hearted thrusts, enjoying the spunk-filled cock holsters.");
	processTime(15);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",mindwashCeliseFirstimeIII);
}

public function mindwashCeliseFirstimeIII():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("The lights on the visor go out and immediately, Celise loses her consistency. The girl splashes into her seat like a popped water balloon, the smut machine dropping atop the puddle like a crown. You retrieve the visor and set it off to the side as Celise slowly reforms into her normal shape. She looks woozy and every so often, you can see her nipples inverting, as if being pushed inward by more invisible penises.");
	output("\n\n<i>“So, how was it?”</i> you ask, coyly.");
	output("\n\n<i>“It was squelchin’ awesome!”</i> she gushes, throwing her arms wide. <i>“It was like I was a totally different girl! Like, all solid an’ stuff! And there were all these other ausar guys and they were totally reaming me, but I couldn’t just reform, so I had to take all the pressure and it was AMAZING. Can I go again? Can I? Can I?”</i>");

	if(pc.isNice()) output("\n\nOn the one hand, you doubt it could really do much to harm the irrepressible goo, but on the other, you don’t want to take the chance. After all, Badger technology shouldn’t be taken lightly. You allow her to use the visor once a day, and only for an hour at a time. Tough but fair.");
	else if(pc.isMischievous()) output("\n\n<i>“Hey, knock yourself out,”</i> you remark with a shrug and a wink. <i>“Just remember the visor’s not going to actually feed you, so be sure to pay your captain a visit from time to time.”</i> She looks alarmed at the thought of a missed meal and you doubt she’ll just plug herself in while you’re aboard the ship, just in case.");
	else output("\n\nYou didn’t really set up the Mindwash so the goo girl could spend all her time on it. You insist she not use it unless you’re there to supervise. Can’t have the bimbo breaking valuable tech, after all.");

	output("\n\nShe looks at the visor and back at you, practically bubbling with delight <i>“Oooo, thank you [pc.name]! What a cool toy!”</i> She leaps forward, practically throwing herself at you and wrapping her arms and legs around you in a full-body hug that puts a bit too much pressure on your ribs. You tense at first, but accept the over-stimulated goo’s embrace.");

	output("\n\n<i>“Yay toys,”</i> she whispers as she gives you another big squeeze.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("CELISE_MINDWASHED");
}