import classes.Items.Miscellaneous.VarmintItem;
import classes.Items.Miscellaneous.Silicone;

/*Faux Cow Farmer
Farmer (First time)
Cameron (Repeat)
{if PC hasn't gotten 5+ varmints}
{if PC has bagged 5+ varmints, PC doesn't have a cock}
{if PC has bagged 5+ varmints, PC has a cock}
Fuck Him
Varmint Combat Encounter
PC Victory
PC Defeat*/


//Faux Cow Farmer
public function fauxCowFarmerBonus():Boolean
{
	//{1st Time Room Add}
	if(flags["MET_CAMERON"] == undefined)
	{
		output("\n\nSitting by the gate to the field is a New Texan dressed in overalls and a wide-brimmed straw hat. For a moment, you think you've found the mythic flat-chested cow-girl by the figure's extremely feminine face, nub-like horns, tiny cloven hooves, and slight figure - until your eyes wander down and see the very blatant bulge in his pants, holding what must be a pretty sizable member at bay. He seems to be in something of a huff, kicking at a fence post and thumbing the handle of a slug gun on his belt.");
		addButton(0,"Farmer",approachFarmer);
	}
	//{Repeat Room Add}
	else 
	{
		output("\n\nCameron is leaning up against the fence, mumbling to himself about the \"darned varmints\" running rampant in the fields still.");
		addButton(0,"Cameron",approachFarmer);
	}
	return false;
}

public function approachFarmer():void
{
	clearOutput();
	//Farmer (First time)
	if(flags["MET_CAMERON"] == undefined)
	{
		author("Savin");
		showName("\nFARMER");
		showBust("CAMERON");
		output("You step up to the svelte farmer boy and ask what the problem is.");
		output("\n\nHe jerks back when you speak, startled. Looking ");
		if(pc.tallness > 70) output("up ");
		else if(pc.tallness < 60) output("down ");
		output("at you and wiping the sweat from his brow, he says, <i>\"Darned varmints in the fields. It's a downright epidemic, I tell ya'. There's gotta be hundreds of the big, ugly bastards out there.\"</i>");
		//Kind: 
		if(pc.isNice()) output("\n\n<i>\"That's not good,\"</i>");
		//Misch: 
		else if(pc.isMischievous()) output("\n\n<i>\"That's gotta pester you, huh?\"</i>");
		//Hard:
		else output("\n\n<i>\"Sucks for you,\"</i>");
		output(" you say.");

		output("\n\n<i>\"Yeah, that's puttin' it mildly,\"</i> he says, sighing. <i>\"They're eating the crop, and now apparently they've got their dirty noses into one of Gianna's silicone shipments. Ran off with loads of the stuff. Supposedly they eat it. Yuck!\"</i>");
		output("\n\nYou cast a glance to the magnum slung on his hip and ask if he's going to be clearing the infestation out.");

		output("\n\nHe huffs at the question. <i>\"I wish! This here used to be my daddy's job, and he tasked me to clear the little bastards out, but... agh, look at me! Damn Treatment backfired on me! Was supposed to turn me into a big, buff hunk who could wrestle these varmints like that Steph Irson chick tackled that naleen on the TV! But noooo, I can't even use the damn gun my dad gave me. Kicks so hard I damn near broke my nose, and you know what the little blue critter did? Just made this hissy little laughing noise and shat right on my boot while I bled everywhere.\"</i>");
		output("\n\nThat's unfortunate. Maybe you could help the little feller out?");
		if(!CodexManager.entryUnlocked("Varmints")) 
		{
			output(" <b>New Codex entry unlocked: Varmints.</b>");
			CodexManager.unlockEntry("Varmints");
		}
		//[Help] [Nah]
		processTime(3);
		clearMenu();
		addButton(0,"Help",helpCameronBeAGiantSlut);
		addButton(1,"Nah",dontHelpCameron);
	}
	//Cameron (Repeat)
	else
	{
		author("Savin");
		showName("\nCAMERON");
		showBust("CAMERON");
		output("<i>“Hey!”</i> Cameron says as you approach. <i>“Got any varmints tied up for me? Or you got something else on your mind?”</i>");
		//{Options!}
		if(pc.hasItem(new VarmintItem(),1)) addButton(0,"Varmint",turnInAVarmint,undefined,"Hand Over a Varmint","Turn in a varmint you've bagged for some cash.");
		else addDisabledButton(0,"Varmint","Varmint","You haven't caught any varmints to turn in yet.");
		if(pc.lust() >= 33) addButton(1,"Flirt",flirtWithCameron,undefined,"Flirt","Flirt with Cameron.");
		else addDisabledButton(1,"Flirt","Flirt","You don't really feel like flirting at the moment.");
		addButton(14,"Back",mainGameMenu);
	}
}

//Nah
public function dontHelpCameron():void
{
	clearOutput();
	author("Savin");
	showName("\nFARMER");
	showBust("CAMERON");
	output("<i>“Well, good luck with that.”</i>");
	output("\n\nThe farmer shrugs. <i>“Yeah. Thanks. Here’s hopin’.”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Help
public function helpCameronBeAGiantSlut():void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON");
	output("You ask the farmer if maybe you could be of some help?");
	output("\n\n<i>“Woah, really? Hey, I’d owe ya one, " + pc.mf("brother","sister") + "!”</i> he says, a great big smile spreading on his face. <i>“Every varmint you wrangle down would be a big help. And I bet Gianna’d be stoked if you found her silicone shipments out there - she’s off in the milk barn, I reckon.”</i>");
	output("\n\n<i>“What do you mean ‘wrangle’?”</i> you ask, indicating the magnum he’s carrying.");
	output("\n\n<i>“Oh,”</i> he shrugs, <i>“Uh, well, offworlders aren’t allowed to carry guns, ya know? Something about rustlin’ cow-girls, I reckon. Anyway, less’n you want to go ");
	if(!pc.isTreated()) output("get Treated and ");
	output("become a citizen, I can’t give you Bertha here. Sorry. Gotta net the little bastards with this,”</i> he adds, handing you a... a lasso, of all things. Welp. At least it’s glowing, made out of some kind of modern high-durability, high-visibility material.");
	output("\n\nHe grins at you as you take the lasso. <i>“Thanks a million, " + pc.mf("brother","sister") + "! Oh, name’s Cameron by the way. I’ll be here dawn till dusk, if you’ve got any wrangled varmints for me to pop. Might could throw you some credits for ‘em even.”</i>");
	output("\n\nYou've gained a <b>Lasso</b>! It's been added to Key Items!");
	pc.createKeyItem("Lasso",0,0,0,0);
	clearMenu();
	processTime(4);
	flags["MET_CAMERON"] = 1;
	addButton(0,"Next",mainGameMenu);
}

//Turn in Varmint
//Give Cam all of your collected varmints. 
//Probably should keep track of these done
public function turnInAVarmint():void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON");
	output("You sling an unconscious varmint off your shoulder and dangle it in front of Cameron.");
	//If first Varmint: 
	if(flags["VARMINTS_CAUGHT"] == undefined)
	{
		output("\n\n<i>\"Well don't that beat all! You're a lifesaver!\"");
		flags["VARMINTS_CAUGHT"] = 1;
	}
	else 
	{
		output("\n\n<i>\"Aww, sweet!\"</i>");
		flags["VARMINTS_CAUGHT"]++;
	}
	output(" he cheers, taking the defeated beast from you.");
	output("\n\n<i>“Don’t worry, I’ll take care of these little bastards when you bring ‘em. Here, for your trouble,”</i> he adds, handing you a five credit chit. For a creature that tried to rip your throat out, a fiver seems a little cheap. Still, it’s a beer or a sandwich somewhere, right?");
	pc.credits += 5;
	output("\n\nYou take the payment, and Cameron takes the varmint. Which promptly goes flying into the back of his hover-pickup sitting nearby. You don’t ask what happens next to the critter.");
	processTime(3);
	pc.destroyItem(new VarmintItem(),1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Flirt
//See if Farmer Cam would be up for a proverbial roll in the hay. 
public function flirtWithCameron():void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON");
	//{if PC hasn't gotten 5+ varmints}
	if(flags["VARMINTS_CAUGHT"] == undefined || flags["VARMINTS_CAUGHT"] < 5)
	{
		output("<i>\"Hey, Cameron... what do you say we put the critter hunt away for a while and go some place a little more comfortable?\"</i>");
		output("\n\nHe blinks. <i>\"Are you... uh, I mean, I can't get out of here yet. My daddy would tan my hide raw! Why don't you try bagging five or so, and we'll talk about... other stuff, okay?");
		if(flags["VARMINTS_CAUGHT"] != undefined) output(" You've already caught " + num2Text(flags["VARMINTS_CAUGHT"]) + "!");
		output("\"</i>");
	}
	//{if PC has bagged 5+ varmints, PC doesn't have a cock}
	else if(!pc.hasCock())
	{
		output("<i>“Hey, Cameron, now that I’ve helped out with your critter problem... what do you say we get out of here and wrangle something more... fun?”</i>");
		output("\n\nHe blushes at the suggestion, shuffling his high-booted feet. <i>“I, uh...”</i> he looks up at you with his big, hazel eyes. <i>“Look, I appreciate the help with the critters an’ all, but, uh, I mean... ya seem nice and all, but I don’t ride your flavor of bull, ya know?”</i>");
		output("\n\nWhoops. You apologize for the unwanted advance, which Cameron brushes off. <i>“Don’t fret, it’s fine! Now, anything else I can do for ya?”</i>");
	}
	//{if PC has bagged 5+ varmints, PC has a cock}
	else
	{
		output("<i>“Hey, Cameron, now that I’ve helped out with your critter problem... what do you say we get out of here and wrangle something more... fun?”</i>");
		output("\n\nHe blushes at the suggestion, shuffling his high-booted feet. <i>“I, uh...”</i> he looks up at you with his big, hazel eyes. <i>“I think I’d be up for that, [pc.name]. Wanna maybe go back by my place?”</i>");
		output("\n\nYou nod, telling the effete bull-boy that you’d like that. He smiles nervously and motions toward his truck, telling you to get in. You do so, and it’s a quick jaunt in the hover-pickup from the fields to an attractive red ranch house a short ways across the fields. Cam parks just out front and leads you through the front door.");
		output("\n\n<i>“Good, my folks aren’t here,”</i> he says, visibly relieved. Cam guides you from the living room into his bedroom, a small room with a bed you’ll both only barely fit on and walls decorated with shelf after shelf of miniatures and figurines. <i>“So, uh, what now, [pc.name]?”</i>");
		processTime(1);
		clearMenu();
		if(pc.lust() >= 33)
		{
			if(pc.cockThatFits(700) < 0) addDisabledButton(0,"Fuck Him","Fuck Him","You're too big to fuck his ass.");
			else addButton(0,"Fuck Him",fuckCameronsButt,undefined,"Fuck Him","Fuck the cow-boy in the ass.");
		}
		else addDisabledButton(0,"Fuck Him","Fuck Him","You are not aroused enough for sex.");
		addButton(14,"Back",mainGameMenu);
		return;
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Him
public function fuckCameronsButt():void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON_NUDE");
	var panties:Boolean = (rand(2) == 0);
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	output("Oh, you've got something in mind alright... you give Cam a little push onto the bed, smiling to yourself as he makes a panicked little yelp, landing with his legs nice and spread for you. You quickly dispose of his overalls and slink down to your [pc.knees], picking up one of your boy-toy's boots and slowly pulling it off and freeing the dainty little hoof inside. You give it a little lick, tracing your [pc.tongue] up Cam's leg to the inside of his thigh, all the way to the ");
	if(!panties) output("leg of his boxers");
	else output("rim of his lacey, girly panties");
	output(". He gives a little whimper as you near his bulging crotch, and you're rewarded with a sharp smell of the musky little equine dong poking out of his underwear. But first, you make your way back down the other leg, freeing it of its boot and massaging the hoof inside.");

	output("\n\nYou take your time working back up to Cam's ");
	if(!panties) output("boxers");
	else output("panties");
	output(", using your teeth grab them and peel them down. With an almost audible pop, Cam's flared little horsecock and balls flop free, the two heavy black orbs settling over his crotch and obscuring your view of the real prize. You lock eyes with him, and see that he's chewing on his lower lip, nervously watching you, completely tame in your grasp. Perfect. You slip up from between his legs and strip your [pc.gear] off, letting your own [pc.cock " + x + "] flip onto his lap, resting against the faux-cow's own half-hard member. His eyes go wide when he sees you -- feels you against him, but you can see the look of hunger in his eyes. The wanton, cock-craving glaze of a whore comes over the boy as one of his little hands reaches up and caresses your prick, giving it an experimental stroke.");

	if(pc.cockVolume(x) >= 500) 
	{
		output("\n\n<i>“It’s so BIG,”</i> he moans, stroking you to full mast, taking in the full majesty of your erection. I... I dunno how I’m going to take it all...”</i>");
		output("\n\nYou assure him you’ll find a way, your eyes already going to the bottle of lube on his nightstand.");
	}
	else
	{
		output("\n\n<i>“It looks amazing,”</i> he moans, stroking you to full mast, taking in the full sight of your erection. <i>“I... I think I’m drooling a little...”</i>");
		output("\n\nYou wink at him and lean in to kiss him, brushing away any fear of that as your attention wanders to the bottle of lube on his nightstand.");
	}
	output("\n\nYou take hold of the bottle and squirt a nice, thick coating into your palm. Cam just watches eagerly as you rub a bit between your fingers, then turn your attention to your lover's tentpole. He gasps when you take his member in hand, stroking it from stem to flare with your cold, lube-slick hand. He shivers and moans, hips bucking up to meet your hand as your motions become a soft, gentle stroking, pumping his girthy cock until a little trickle of pre shines on his crown, trickling down to join the coating of lube you're giving him. You don't doubt that a slut like Cam could probably cum just from his ass, but it doesn't hurt to give the little faux-cow a head start, does it?");

	output("\n\n<i>“Think you can return the favor?”</i> you ask, handing Cameron the lube bottle.");

	output("\n\nHe nods eagerly, splattering a hefty amount into his hands and leaning in to caress your [pc.cock " + x + "]. You suck in a sharp breath as the faux-cow’s cold hands touch your sensitive skin, but he’s clearly well used to lubing up ");
	if(pc.cockVolume(x) >= 500) output("big, thick ");
	else if(pc.cocks[x].cLength() < 6) output("little sissy ");
	output("cocks, and does an admirable job of getting you nice and slathered with lube. Every inch of your [pc.cock] is glistening in the light by the time he’s done, a nice even coating of lube making you feel cold, slippery, and oh so hot all at once. Satisfied with his work, Cam shifts on the bed so that his legs are bent and spread, his ass just slightly off the edge of the bed. He takes hold of his cock and pulls it back, letting it flop wetly onto his belly.");
	output("\n\n<i>“I’m all yours, [pc.name],”</i> he moans, wiggling his girly hips at you.");
	pc.lust(25);
	processTime(9);
	//[Rim Him First] [Fuck Him]
	clearMenu();
	addButton(0,"RimHimFirst",rimHimFirst,undefined,"Rim Him First","Spit-slather his butthole.");
	addButton(1,"Fuck Him",fuckCamsButt,false,"Fuck Him","Get right to it and put it in his butt.");
}

//Rim Him First
public function rimHimFirst():void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON_NUDE");
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	output("You don't doubt it. But a lubed cock is only half of the equation, isn't it? You flash the faux-cow a wink and plant your hands on his raised thighs, getting a good look at the tight little black ring between his big butt cheeks. It winks nervously at you, trickles of lube staining it from the thorough cock-basting you've given its owner already. You lean in and give it a lick, dragging your tongue through the crack and up the the underside of Cameron's hefty Treated sack, feeling the cum-filled orbs tremble at your touch. He gives a little whine when you turn your attention back to his hole, putting just enough pressure on it to force it open. Your [pc.tongue] slips in easily, probing into the tight little passage of Cam's ass.");
	output("\n\nHis whole body reacts to your slow insertion, legs and cock trembling, chest heaving as he tries to breathe over the intense pleasure. Clearly the Treatment re-routed some nerves around here....");
	output("\n\n<i>“Tight </i>and<i> sensitive,”</i> you laugh. <i>“I bet all the bulls just love filling this hole, huh?”</i>");
	output("\n\nCam looks pointedly away from you, biting his lip and blushing hard. Well, that wasn’t a <i>“no,”</i> was it? You grin to yourself and get back to it, probing back into Cam’s dark star and slathering the quivering walls inside with thick coats of spittle, lubing them up just like your cocks. You spend minutes suckling on that tight pucker of his, using your tongue to lick and caress the faux-cow’s over-sensitive hole until you can see his hefty horsecock twitching -- you can feel his muscles squirming as you bring him to the edge. You let one of your hands snake up, wrapping around Cam’s slick schlong and giving it a few pumps, just enough to help the little bull tear down the last of his defenses. Cameron lets out a high, girlish cry and suddenly his chest is covered in cum, his cock spewing thick ropes of seed across his svelte little body. You keep pumping his cock and lapping at the ring of his ass all through his orgasm.");

	output("\n\nYou slip up from between Cam’s legs and take in the effect of your efforts: one cum-slathered faux-cow, weakly jacking himself off as spooge leaks from his cock onto his belly. He groans, a lust-addled look in his eyes.");
	output("\n\n<i>“S-sorry,”</i> he murmurs. <i>“The Treatment made me a mite bit too sensitive down there. Now I can’t stop... trembling.”</i> He moans as another thick trickle of spunk drools down and stains his fingers.");
	output("\n\nYou stroke the faux-cow’s thigh, soothing him... even as you squirt a little extra lube onto your hand and slather up your [pc.cock " + x + "] again, making sure it’s nice and ready for him. The best thing about a Treated lover? He’s ready to go again almost instantly.");
	pc.lust(25);
	processTime(7);
	//{to Fuck Him}
	clearMenu();
	addButton(0,"Next",fuckCamsButt,true);
}

//Fuck Him
public function fuckCamsButt(camCame:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showName("\nCAMERON");
	showBust("CAMERON_NUDE");
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	output("Satisfied with the job you’ve done, you lean in over Cam and take hold of your [pc.cock], angling it toward the slick, black ring of his ass. His eyes lock with yours, full of lust and hunger and unbridled need. You expect a little resistance when you start to push forward, but instead you find the little cow-boy’s ass opening wide to welcome you, sucking you in. You sink into Cam’s ass, both of you gasping and moaning as you spread him wide on your [pc.cock " + x + "].");
	output("\n\n<i>“Ahhh! It... it feels good,”</i> Cam admits, blushing furiously and pointedly avoiding your gaze. His cock, however, does most of the talking for him: every inch you slide into him makes his equine prick twitch and jump, rising on its own to a half-mast looming over his chest, drooling onto him as your [pc.cock " + x + "] mercilessly teases his inner walls. You start to pump into his ass with short, quick strokes that leave him moaning, fingers clawing for purchase on the bed as you go from gentle as silk to rough as a stallion. Every thrust makes his little cock bob and buck, throbbing with need as you abuse this faux-cow’s tight hole.");
	output("\n\nYou decide to have a little mercy on the poor boy and grab his lube-slick dick, jacking him off as you go to the same rhythm of your pistoning hips. The effect on his is immediate: a shrill cry of pleasure tears from Cam’s lips, and his hips buck in your hands, letting you slam your [pc.cock " + x + "] all the deeper.");
	if(pc.cockVolume(x) >= 500) output(" Cameron’s belly bulges, distending to take the huge girth of your shaft as you ram it in.");
	output(" A few more thrusts like that, and the girly faux-cow is screaming his pleasure and cumming");
	if(camCame) output(" again");
	output("! His cock squirms and stiffens in your hand, your first warning of what’s coming. With a mischievous grin, you angle to turgid rod of horseflesh toward Cam’s face. Rather than alarm, you see your lover open wide just in time to catch the first thick glob of spunk on his tongue. Eager slut! He gets a nice faceful of his own explosive orgasm, his Treated balls churning out a load most humans would have to fuck a whole day to match. As he cums his bucket-load over himself, Cameron’s ass seems to suck you in even more, his muscles caressing your [pc.cock " + x + "] like a warm, wet glove working hard to make you cum with him.");
	output("\n\nIt’s not enough, though. You fuck the faux-cow through his own orgasm, but you need <i>more</i> -- and Cam seems happy to give it. <i>“I want to feel it... feel you cum inside me!”</i> he mewls, barely audible over the wet sounds of flesh against flesh as you fuck him. His hands play across his bare chest, rubbing at the sea of semen he’s splattered across himself, putting on a show of playing with himself for you. He tweaks his stiff, white-smeared nipples, arching his back and gasping quietly. The mewling fem-boy’s display of lust does more for you than the feeling of his squirming ass ever could.");
	if(pc.isNice()) output(" You reach down, wiping away some of the splattered spooge on Cameron’s cheek before you kiss him. His legs wrap around you, drawing you in.");
	else output(" You give him a swat on the ass, gripping his taut behind tight until you can feel him clenching tight around you.");
	output(" A few more thrusts into Cameron is all you can manage before you feel the tell-tale tightness start in your [pc.balls]. You feel the surge of [pc.cumNoun] rushing up your [pc.cock " + x + "], and into the faux-cow’s tailhole. Cam’s breath catches as he feels the first squirt of spunk basting his bowels, and his fingers lock around your arms, holding you tight. You grunt in effort, hammering yourself home into Cameron’s warm, welcoming hole.");
	pc.cockChange();

	output("\n\nYou give a slight shudder as you finish yourself inside the faux-cow, holding yourself over him and looking down at the state you’ve left him in. Cam groans, planting a hand on his belly as if to feel the load you’ve shot into him. <i>“I love that feeling,”</i> he sighs, licking a little of his own spunk up from himself. <i>“Makes me feel like a real cow....”</i>");
	output("\n\nYou pat the faux-cow’s flank, rubbing his taut behind as you pull yourself from his tight sheath. He smiles up at you, eyelids heavy and contented. <i>“Do you want a ride back, [pc.name]? I could run through the shower...”</i>");
	output("\n\nGrinning, you tell Cam he better take a shower, but you can walk on back to the ranch. It’s not far away. He smiles and nods, closing his eyes as you grab your clothes and slip out of the house. It’s a short walk on back to the ranch, and it’s not long after that that Cameron’s truck comes rumbling down the road. He waves from the cabin, looking no worse for wear after what you just did to him.");

	processTime(16);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//
//Varmint Combat Encounter
public function varmintProc():void
{
	author("Savin");
	showName("FIGHT:\nVARMINT");
	showBust("VARMINT");
	
	output("\n\nAs you make your way through the field, you spot something... digging? Yeah, digging into the earth, trying to root up some of the crop. You pull the light lasso off your belt and step towards the strange, blue shape in the dirt.");
	output("\n\nSure enough, as you approach, the creature pokes its head up, revealing a jaw of razor-sharp teeth and large, thin spikes poking up from its flat head. The varmint growls at you and lunges!");
	if(!CodexManager.entryUnlocked("Varmints")) 
	{
		output(" <b>New Codex entry unlocked: Varmints.</b>");
		CodexManager.unlockEntry("Varmints");
	}
	clearMenu();
	addButton(0,"Next",startCombat,"varmint");
}

//Notes on the Encounter.
//Varmints don't have Health, and they're immune to LUST. Rather, they have "Resistance" which degrades as you lasso them. Eventually, you'll get them down and tie them. 

//PC uses "Lasso" -- based on AIM
public function lassoAVarmint():void
{
	clearOutput();
	//Set drone target
	setDroneTarget(foes[0]);
	var damage:int = 0;
	output("You twirl your light lasso, trying to get a bead on the varmint. When you've got enough spin, you let the lasso go, hurling it toward the varmint!");
	//Miss
	if(rangedCombatMiss(pc,foes[0])) output(" The glowing rope goes wide, scattering into the ground. You quickly reel it back in.\n");
	else
	{
		damage = 20 + pc.aim()/2;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		//Will this down the fucker
		if(damage - foes[0].defense() >= foes[0].HP()) output(" <b>You snag the varmint by the neck! You give the lasso a tug, throwing the creature to the ground in a defeated lump.</b>");
		//Naw, he's still up
		else
		{
			output(" You snag a ");
			if(rand(3) == 0) output("horn");
			else if(rand(2) == 0) output("leg");
			else output("spike");
			output(" on the varmint, barreling the creature to the ground.");
		}
		genericDamageApply(damage,pc,foes[0],GLOBAL.KINETIC);
		//Used to track if the PC downed the shithead with a whip or something else.
		foes[0].createStatusEffect("Lassoed");
		output("\n");
	}
	processCombat();
}

public function varmintAI():void
{
	//Maul
	//Powerful attack against prone targets
	if(pc.hasStatusEffect("Trip") && rand(2) == 0) getMauledBiyaaaaatch();
	//Ram
	//Powerful attack, chance to stun
	else if(rand(4) == 0) varmintRamAttack();
	//Leap Attack
	//Moderate melee, chance to knock prone
	else if(rand(2) == 0) leapAttackFromVarmint();
	else enemyAttack(foes[0]);
}

//Leap Attack
//Moderate melee, chance to knock prone
public function leapAttackFromVarmint():void
{
	output("The varmint leaps at you with its slavering jaws agape, teeth bared!");
	if(!combatMiss(foes[0],pc))
	{
		output(" Its teeth sink into you, and the sheer weight of its impact against your ");
		if((pc.hasStatusEffect("Trip") || pc.physique()/2 + rand(20) > 19) && !pc.hasStatusEffect("Stunned")) output("staggers you momentarily!");
		else
		{
			output("throws you right to the ground!");
			pc.createStatusEffect("Trip", 0, 0, 0, 0, false, "DefenseDown", "You've been tripped, reducing your effective physique and reflexes by 4. You'll have to spend an action standing up.", true, 0);
		}
		var damage:int = 12;
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		genericDamageApply(damage,foes[0],pc,GLOBAL.PIERCING);
	}
	else output(" You slip out of the way.");
	processCombat();
}

//Maul
//Powerful attack against prone targets
public function getMauledBiyaaaaatch():void
{
	output("While you're on the ground, the oversized varmint leaps onto you, savaging you with its huge teeth! You're able to get an arm up in time to save your throat, but it still grabs you and shakes its head, tearing into you.");
	var damage:int = 40+rand(6);
	//Randomize +/- 15%
	var randomizer:Number = (rand(31)+ 85)/100;
	damage *= randomizer;
	genericDamageApply(damage,foes[0],pc,GLOBAL.PIERCING);
	processCombat();
}

//Ram
//Powerful attack, chance to stun
public function varmintRamAttack():void
{
	output("The varmint lunges at you with its horns, slamming them ");
	if(combatMiss(foes[0],pc) && !combatMiss(foes[0],pc)) output("just past you, digging them into the ground.");
	else
	{
		output("into your [pc.leg], giving you a pointy, painful head-butt!");
		var damage:int = 12+rand(6);
		//Randomize +/- 15%
		var randomizer:Number = (rand(31)+ 85)/100;
		damage *= randomizer;
		if (!pc.hasStatusEffect("Stunned") && pc.physique() + rand(20) + 1 < 18)
		{
			output("<b> The hit was hard enough to stun you!</b>");
			pc.createStatusEffect("Stunned",1,0,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0);
		}
		genericDamageApply(damage,foes[0],pc,GLOBAL.PIERCING);

	}
	processCombat();
}

//PC Victory
public function pcVictoryVsVarmints():void
{
	author("Savin");
	showName("FIGHT:\nVARMINT");
	showBust("VARMINT");
	if(foes[0].hasStatusEffect("Lassoed"))
	{
		if(!pc.hasItem(new VarmintItem(),1))
		{
			output("You get the varmint on the ground with your lasso and yank it over to you. The blue creature gives a yelp of pain and frustration as you drag it in and tie it up. You give the defeated creature a swift punch, knocking it cold so you can transport it. Once done, it's easy enough to sling the creature over your shoulder and move on.");
			output("\n\n<b>Varmint bagged!</b>");
			if(pc.isTreated()) output(" <i>“Yee-haw!”</i> you cheer.");
		 	foes[0].inventory.push(new VarmintItem());
		}
		else
		{
			output("Despite getting the varmint to the ground, you don't have a way to carry it while you're already dragging another one around. Maybe you should go hand it off to Cameron before you try to wrangle anymore. Grumbling, you cut loose the fallen creature and watch it take off into the brush. Maybe it'll learn its lesson.");
		}

	}
	//output("\n\nWhile you’re bagging the varmint, you see (a cannister of silicone / a stolen, unmarked credit chit / a mostly intact to-go meal from the ranch house restaurant). You take possession of the varmint’s lonely possession.} ");
	else
	{
		output("The varmint hauls ass into the weeds before you can bring it down. Maybe you should look into using some kind of lasso on it.");
	}
	output("\n\n");
	genericVictory();
}

//PC Defeat
public function pcLosesToVarmint():void
{
	clearOutput();
	author("Savin");
	showName("FIGHT:\nVARMINT");
	showBust("VARMINT");
	pc.HP(-(pc.HPMax()-1));
	pc.lust(-50);
	output("Suddenly, the varmint lunges up and takes you right in the chest with its horned head, knocking you onto the ground. The creature barrels you over and gives you another brutal WHACK with its horns, and everything goes black....");
	clearMenu();
	addButton(0,"Next",pcLosesToVarmint2);
}

public function pcLosesToVarmint2():void
{
	clearOutput();
	author("Savin");
	output("You wake up some time later.");
	if(pc.credits > 1)
	{
		output(" You're missing some of your credit chits! What the hell eats CREDITS!?");
		var eatenCreds:int = (5+rand(6)) * pc.level * pc.level;
		if(eatenCreds > pc.credits) eatenCreds = pc.credits;
		pc.credits -= eatenCreds;
	}
	else output(" You're missing your dignity, but not much else.");
	output(" You dust yourself off and move on, a little sore from the beating.");
	processTime(120+rand(30));
	clearMenu();
	genericLoss();
}

public function varmintRoomsBonus():Boolean
{
	if (flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if (flags["FIELDS_STEP"] == undefined) flags["FIELDS_STEP"] = 1;
	else flags["FIELDS_STEP"]++;

	if((currentLocation == "564" && flags["TAKEN_SILICONE_564"] == undefined) || (currentLocation == "556" && flags["TAKEN_SILICONE_556"] == undefined) || (currentLocation == "552" && flags["TAKEN_SILICONE_552"] == undefined) || (currentLocation == "538" && flags["TAKEN_SILICONE_538"] == undefined)) 
	{
		output("\n\nA chewed-up bag of silicone is sitting in an area of trampled crops. It looks like the varmints got tired of trying to chew through the packaging and sought an easier food source.");
		addButton(0,"TakeSilicone",takeSilicone);
	}

	if(flags["FIELDS_STEP"] >= 4 && rand(3) == 0)
	{
		varmintProc();
		flags["FIELDS_STEP"] = 0;
		return true;
	}
	return false;
}

public function takeSilicone():void
{
	clearOutput();
	quickLoot(new Silicone());
	if(currentLocation == "564" && flags["TAKEN_SILICONE_564"] == undefined) flags["TAKEN_SILICONE_564"] = 1;
	else if(currentLocation == "556" && flags["TAKEN_SILICONE_556"] == undefined) flags["TAKEN_SILICONE_556"] = 1;
	else if(currentLocation == "552" && flags["TAKEN_SILICONE_552"] == undefined) flags["TAKEN_SILICONE_552"] = 1;
	else if(currentLocation == "538" && flags["TAKEN_SILICONE_538"] == undefined) flags["TAKEN_SILICONE_538"] = 1;
}