import classes.Characters.Varmint;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Accessories.VarmintLeash;
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
	// 1st Time Room Add
	if(flags["MET_CAMERON"] == undefined)
	{
		output("\n\nSitting by the gate to the field is a New Texan dressed in overalls and a wide-brimmed straw hat. For a moment, you think you’ve found the mythic flat-chested cow-girl by the figure’s extremely feminine face, nub-like horns, tiny cloven hooves, and slight figure - until your eyes wander down and see the very blatant bulge in his pants, holding what must be a pretty sizable member at bay. He seems to be in something of a huff, kicking at a fence post and thumbing the handle of a slug gun on his belt.");
		addButton(0,"Farmer",approachFarmer);
	}
	// Repeat Room Add
	else 
	{
		output("\n\nCameron is leaning up against the fence, mumbling to himself about the “darned varmints” running rampant in the fields still.");
		addButton(0,"Cameron",approachFarmer);
	}
	return false;
}

public function approachFarmer():void
{
	clearOutput();
	clearMenu();
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
		output("at you and wiping the sweat from his brow, he says, <i>“Darned varmints in the fields. It’s a downright epidemic, I tell ya’. There’s gotta be hundreds of the big, ugly bastards out there.”</i>");
		//Kind: 
		if(pc.isNice()) output("\n\n<i>“That’s not good,”</i>");
		//Misch: 
		else if(pc.isMischievous()) output("\n\n<i>“That’s gotta pester you, huh?”</i>");
		//Hard:
		else output("\n\n<i>“Sucks for you,”</i>");
		output(" you say.");

		output("\n\n<i>“Yeah, that’s puttin’ it mildly,”</i> he says, sighing. <i>“They’re eating the crop, and now apparently they’ve got their dirty noses into one of Gianna’s silicone shipments. Ran off with loads of the stuff. Supposedly they eat it. Yuck!”</i>");
		output("\n\nYou cast a glance to the magnum slung on his hip and ask if he’s going to be clearing the infestation out.");

		output("\n\nHe huffs at the question. <i>“I wish! This here used to be my daddy’s job, and he tasked me to clear the little bastards out, but... agh, look at me! Damn Treatment backfired on me! Was supposed to turn me into a big, buff hunk who could wrestle these varmints like that Steph Irson chick tackled that naleen on the TV! But noooo, I can’t even use the damn gun my dad gave me. Kicks so hard I damn near broke my nose, and you know what the little blue critter did? Just made this hissy little laughing noise and shat right on my boot while I bled everywhere.”</i>");
		output("\n\nThat’s unfortunate. Maybe you could help the little feller out?");
		if(!CodexManager.entryUnlocked("Varmints")) 
		{
			output(" <b>(New Codex entry unlocked: Varmints.)</b>");
			CodexManager.unlockEntry("Varmints");
		}
		//[Help] [Nah]
		processTime(3);
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
		// Options!
		if(pc.hasItemByClass(VarmintItem,1)) addButton(0,"Varmint",turnInAVarmint,undefined,"Hand Over a Varmint","Turn in a varmint you’ve bagged for some cash.");
		else addDisabledButton(0,"Varmint","Varmint","You haven’t caught any varmints to turn in yet.");
		if(pc.lust() >= 33) addButton(1,"Flirt",flirtWithCameron,undefined,"Flirt","Flirt with Cameron.");
		else addDisabledButton(1,"Flirt","Flirt","You don’t really feel like flirting at the moment.");
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
	output("\n\nYou’ve gained a <b>Lasso</b>! It’s been added to Key Items!");
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
		output("\n\n<i>“Well don’t that beat all! You’re a lifesaver!”</i>");
		flags["VARMINTS_CAUGHT"] = 1;
	}
	else 
	{
		output("\n\n<i>“Aww, sweet!”</i>");
		flags["VARMINTS_CAUGHT"]++;
	}
	output(" he cheers, taking the defeated beast from you.");
	output("\n\n<i>“Don’t worry, I’ll take care of these little bastards when you bring ‘em. Here, for your trouble,”</i> he adds, handing you a five " + (isAprilFools() ? "dogecoin" : "credit") + " chit. For a creature that tried to rip your throat out, a fiver seems a little cheap. Still, it’s a beer or a sandwich somewhere, right?");
	pc.credits += 5;
	output("\n\nYou take the payment, and Cameron takes the varmint. Which promptly goes flying into the back of his hover-pickup sitting nearby. You don’t ask what happens next to the critter.");
	processTime(3);
	pc.destroyItemByClass(VarmintItem,1);
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
	// if PC hasn't gotten 5+ varmints
	if(flags["VARMINTS_CAUGHT"] == undefined || flags["VARMINTS_CAUGHT"] < 5)
	{
		output("<i>“Hey, Cameron... what do you say we put the critter hunt away for a while and go some place a little more comfortable?”</i>");
		output("\n\nHe blinks. <i>“Are you... uh, I mean, I can’t get out of here yet. My daddy would tan my hide raw! Why don’t you try bagging five or so, and we’ll talk about... other stuff, okay?");
		if(flags["VARMINTS_CAUGHT"] != undefined) output(" You’ve already caught " + num2Text(flags["VARMINTS_CAUGHT"]) + "!");
		output("”</i>");
	}
	// if PC has bagged 5+ varmints, PC doesn't have a cock
	else if(!pc.hasCock())
	{
		output("<i>“Hey, Cameron, now that I’ve helped out with your critter problem... what do you say we get out of here and wrangle something more... fun?”</i>");
		output("\n\nHe blushes at the suggestion, shuffling his high-booted feet. <i>“I, uh...”</i> he looks up at you with his big, hazel eyes. <i>“Look, I appreciate the help with the critters an’ all, but, uh, I mean... ya seem nice and all, but I don’t ride your flavor of bull, ya know?”</i>");
		output("\n\nWhoops. You apologize for the unwanted advance, which Cameron brushes off. <i>“Don’t fret, it’s fine! Now, anything else I can do for ya?”</i>");
	}
	// if PC has bagged 5+ varmints, PC has a cock
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
			if(pc.cockThatFits(700) < 0) addDisabledButton(0,"Fuck Him","Fuck Him","You’re too big to fuck his ass.");
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
	showImage("CameronSplayed");
	output("Oh, you’ve got something in mind alright... you give Cam a little push onto the bed, smiling to yourself as he makes a panicked little yelp, landing with his legs nice and spread for you. You quickly dispose of his overalls and slink down to your [pc.knees], picking up one of your boy-toy’s boots and slowly pulling it off and freeing the dainty little hoof inside. You give it a little lick, tracing your [pc.tongue] up Cam’s leg to the inside of his thigh, all the way to the ");
	if(!panties) output("leg of his boxers");
	else output("rim of his lacey, girly panties");
	output(". He gives a little whimper as you near his bulging crotch, and you’re rewarded with a sharp smell of the musky little equine dong poking out of his underwear. But first, you make your way back down the other leg, freeing it of its boot and massaging the hoof inside.");

	output("\n\nYou take your time working back up to Cam’s ");
	if(!panties) output("boxers");
	else output("panties");
	output(", using your teeth to grab them and peel them down. With an almost audible pop, Cam’s flared little horsecock and balls flop free, the two heavy black orbs settling over his crotch and obscuring your view of the real prize. You lock eyes with him, and see that he’s chewing on his lower lip, nervously watching you, completely tame in your grasp. Perfect. You slip up from between his legs and strip your [pc.gear] off, letting your own [pc.cock " + x + "] flip onto his lap, resting against the faux-cow’s own half-hard member. His eyes go wide when he sees you -- feels you against him, but you can see the look of hunger in his eyes. The wanton, cock-craving glaze of a whore comes over the boy as one of his little hands reaches up and caresses your prick, giving it an experimental stroke.");

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
	output("\n\nYou take hold of the bottle and squirt a nice, thick coating into your palm. Cam just watches eagerly as you rub a bit between your fingers, then turn your attention to your lover’s tentpole. He gasps when you take his member in hand, stroking it from stem to flare with your cold, lube-slick hand. He shivers and moans, hips bucking up to meet your hand as your motions become a soft, gentle stroking, pumping his girthy cock until a little trickle of pre shines on his crown, trickling down to join the coating of lube you’re giving him. You don’t doubt that a slut like Cam could probably cum just from his ass, but it doesn’t hurt to give the little faux-cow a head start, does it?");

	output("\n\n<i>“Think you can return the favor?”</i> you ask, handing Cameron the lube bottle.");

	output("\n\nHe nods eagerly, splattering a hefty amount into his hands and leaning in to caress your [pc.cock " + x + "]. You suck in a sharp breath as the faux-cow’s cold hands touch your sensitive skin, but he’s clearly well used to lubing up ");
	if(pc.cockVolume(x) >= 500) output("big, thick ");
	else if(pc.cocks[x].cLength() < 6) output("little sissy ");
	output("cocks, and does an admirable job of getting you nice and slathered with lube. Every inch of your [pc.cock " + x + "] is glistening in the light by the time he’s done, a nice even coating of lube making you feel cold, slippery, and oh so hot all at once. Satisfied with his work, Cam shifts on the bed so that his legs are bent and spread, his ass just slightly off the edge of the bed. He takes hold of his cock and pulls it back, letting it flop wetly onto his belly.");
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
	output("You don’t doubt it. But a lubed cock is only half of the equation, isn’t it? You flash the faux-cow a wink and plant your hands on his raised thighs, getting a good look at the tight little black ring between his big butt cheeks. It winks nervously at you, trickles of lube staining it from the thorough cock-basting you’ve given its owner already. You lean in and give it a lick, dragging your tongue through the crack and up to the underside of Cameron’s hefty Treated sack, feeling the cum-filled orbs tremble at your touch. He gives a little whine when you turn your attention back to his hole, putting just enough pressure on it to force it open. Your [pc.tongue] slips in easily, probing into the tight little passage of Cam’s ass.");
	output("\n\nHis whole body reacts to your slow insertion, legs and cock trembling, chest heaving as he tries to breathe over the intense pleasure. Clearly the Treatment re-routed some nerves around here....");
	output("\n\n<i>“Tight </i>and<i> sensitive,”</i> you laugh. <i>“I bet all the bulls just love filling this hole, huh?”</i>");
	output("\n\nCam looks pointedly away from you, biting his lip and blushing hard. Well, that wasn’t a <i>“no,”</i> was it? You grin to yourself and get back to it, probing back into Cam’s dark star and slathering the quivering walls inside with thick coats of spittle, lubing them up just like your cocks. You spend minutes suckling on that tight pucker of his, using your tongue to lick and caress the faux-cow’s over-sensitive hole until you can see his hefty horsecock twitching -- you can feel his muscles squirming as you bring him to the edge. You let one of your hands snake up, wrapping around Cam’s slick schlong and giving it a few pumps, just enough to help the little bull tear down the last of his defenses. Cameron lets out a high, girlish cry and suddenly his chest is covered in cum, his cock spewing thick ropes of seed across his svelte little body. You keep pumping his cock and lapping at the ring of his ass all through his orgasm.");

	output("\n\nYou slip up from between Cam’s legs and take in the effect of your efforts: one cum-slathered faux-cow, weakly jacking himself off as spooge leaks from his cock onto his belly. He groans, a lust-addled look in his eyes.");
	output("\n\n<i>“S-sorry,”</i> he murmurs. <i>“The Treatment made me a mite bit too sensitive down there. Now I can’t stop... trembling.”</i> He moans as another thick trickle of spunk drools down and stains his fingers.");
	output("\n\nYou stroke the faux-cow’s thigh, soothing him... even as you squirt a little extra lube onto your hand and slather up your [pc.cock " + x + "] again, making sure it’s nice and ready for him. The best thing about a Treated lover? He’s ready to go again almost instantly.");
	pc.lust(25);
	processTime(7);
	// to Fuck Him
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
	output("Satisfied with the job you’ve done, you lean in over Cam and take hold of your [pc.cock " + x + "], angling it toward the slick, black ring of his ass. His eyes lock with yours, full of lust and hunger and unbridled need. You expect a little resistance when you start to push forward, but instead you find the little cow-boy’s ass opening wide to welcome you, sucking you in. You sink into Cam’s ass, both of you gasping and moaning as you spread him wide on your [pc.cock " + x + "].");
	output("\n\n<i>“Ahhh! It... it feels good,”</i> Cam admits, blushing furiously and pointedly avoiding your gaze. His cock, however, does most of the talking for him: every inch you slide into him makes his equine prick twitch and jump, rising on its own to a half-mast looming over his chest, drooling onto him as your [pc.cock " + x + "] mercilessly teases his inner walls. You start to pump into his ass with short, quick strokes that leave him moaning, fingers clawing for purchase on the bed as you go from gentle as silk to rough as a stallion. Every thrust makes his little cock bob and buck, throbbing with need as you abuse this faux-cow’s tight hole.");
	output("\n\nYou decide to have a little mercy on the poor boy and grab his lube-slick dick, jacking him off as you go to the same rhythm of your pistoning hips. The effect on his is immediate: a shrill cry of pleasure tears from Cam’s lips, and his hips buck in your hands, letting you slam your [pc.cock " + x + "] all the deeper.");
	if(pc.cockVolume(x) >= 500) output(" Cameron’s belly bulges, distending to take the huge girth of your shaft as you ram it in.");
	output(" A few more thrusts like that, and the girly faux-cow is screaming his pleasure and cumming");
	if(camCame) output(" again");
	output("! His cock squirms and stiffens in your hand, your first warning of what’s coming. With a mischievous grin, you angle the turgid rod of horseflesh toward Cam’s face. Rather than alarm, you see your lover open wide just in time to catch the first thick glob of spunk on his tongue. Eager slut! He gets a nice faceful of his own explosive orgasm, his Treated balls churning out a load most humans would have to fuck a whole day to match. As he cums his bucket-load over himself, Cameron’s ass seems to suck you in even more, his muscles caressing your [pc.cock " + x + "] like a warm, wet glove working hard to make you cum with him.");
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
	IncrementFlag("SEXED_CAMERON");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

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
		output(" <b>(New Codex entry unlocked: Varmints.)</b>");
		CodexManager.unlockEntry("Varmints");
	}
	if(flags["MET_VARMINT"] == undefined)
	{
		if(flags["VARMINTS_CAUGHT"] != undefined) flags["MET_VARMINT"] = flags["VARMINTS_CAUGHT"];
		else flags["MET_VARMINT"] = 0;
	}
	flags["MET_VARMINT"]++;
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Varmint());
	CombatManager.victoryScene(pcVictoryVsVarmints);
	CombatManager.lossScene(pcLosesToVarmint);
	CombatManager.displayLocation("VARMINT");
	
	addButton(0,"Next", CombatManager.beginCombat);
}

//Notes on the Encounter.
//Varmints don't have Health, and they're immune to LUST. Rather, they have "Resistance" which degrades as you lasso them. Eventually, you'll get them down and tie them. 

//PC uses "Lasso" -- based on AIM
public function lassoAVarmint(attacker:Creature, target:Creature):void
{
	//clearOutput();
	//Set drone target
	//attacker.droneTarget = target;
	output("You twirl your light lasso, trying to get a bead on " + target.getCombatName() + ". When you’ve got enough spin, you let the lasso go, hurling it toward " + target.getCombatName() + "!");
	//Miss
	if(rangedCombatMiss(attacker, target)) output(" The glowing rope goes wide, scattering into the ground. You quickly reel it back in.");
	else
	{
		var damage:TypeCollection = new TypeCollection( { kinetic: 20 + (attacker.aim() / 2) } );
		damageRand(damage, 15);
		
		//Will this down the fucker
		if(damage.getTotal() - target.defense() >= target.HP())
		{
			output(" <b>You snag " + target.getCombatName() + " by the neck! You give the lasso a tug, throwing the creature to the ground in a defeated lump.</b>");
			target.createStatusEffect("Lassoed", 1);
		}
		//Naw, he's still up
		else
		{
			output(" You snag a ");
			if(rand(3) == 0) output("horn");
			else if(rand(2) == 0) output("leg");
			else output("spike");
			output(" on " + target.getCombatName() + ", barreling the creature to the ground.");
			target.createStatusEffect("Lassoed");
		}
		applyDamage(damage, attacker, target);
	}
}

//PC Victory
public function pcVictoryVsVarmints(clearText:Boolean = false):void
{
	if(clearText) clearOutput();
	author("Savin");
	showName("DEFEATED:\nVARMINT");
	showBust("VARMINT");
	if(enemy.hasStatusEffect("Lassoed"))
	{
		if(!pc.hasItemByClass(VarmintItem,1))
		{
			output("You get the varmint on the ground with your lasso and yank it over to you. The blue creature gives a yelp of pain and frustration as you drag it in and tie it up. You give the defeated creature a swift punch, knocking it cold so you can transport it. Once done, it’s easy enough to sling the creature over your shoulder and move on.");
			output("\n\n<b>Varmint bagged!</b>");
			if(pc.isTreated()) output(" <i>“Yee-haw!”</i> you cheer.");
		 	enemy.inventory.push(new VarmintItem());
			//output("\n\nWhile you’re bagging the varmint, you see (a cannister of silicone / a stolen, unmarked credit chit / a mostly intact to-go meal from the ranch house restaurant). You take possession of the varmint’s lonely possession.} ");
		}
		else
		{
			output("Despite getting the varmint to the ground, you don’t have a way to carry it while you’re already dragging another one around. Maybe you should go hand it off to Cameron before you try to wrangle anymore. Grumbling, you cut loose the fallen creature and watch it take off into the brush. Maybe it’ll learn its lesson.");
		}
		enemy.removeStatusEffect("Lassoed");
	}
	else
	{
		output("The varmint hauls ass into the weeds before you can bring it down. Maybe you should look into using some kind of lasso on it.");
	}
	output("\n\n");
	CombatManager.genericVictory();
}

//PC Defeat
public function pcLosesToVarmint(clearText:Boolean = false):void
{
	if(clearText) clearOutput();
	author("Savin");
	showName("LOST VS:\nVARMINT");
	showBust("VARMINT");
	output("Suddenly, the varmint lunges up and takes you right in the chest with its horned head, knocking you onto the ground. The creature barrels you over and gives you another brutal WHACK with its horns, and everything goes black....");
	var damage:Number = (pc.HPRaw - 1);
	if (damage > 0) applyDamage(new TypeCollection( { unresistablehp: damage }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
	pc.lust(-50);
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
		output(" You’re missing some of your credit chits! What the hell eats CREDITS!?");
		var eatenCreds:int = (5+rand(6)) * pc.level * pc.level;
		if(eatenCreds > pc.credits) eatenCreds = pc.credits;
		pc.credits -= eatenCreds;
	}
	else output(" You’re missing your dignity, but not much else.");
	output(" You dust yourself off and move on, a little sore from the beating.\n\n");
	processTime(120+rand(30));
	clearMenu();
	CombatManager.genericLoss();
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
		if(!varmintPackBonus()) varmintProc();
		flags["FIELDS_STEP"] = 0;
		return true;
	}
	return false;
}

// Varmint Pack Enounter!
public function varmintPackBonus():Boolean
{
	if(flags["MET_VARMINT"] == undefined || flags["MET_VARMINT"] < 5 || pc.level < 6) return false;
	
	var levelChance:int = 5;
	if(pc.level >= 9) levelChance = 4;
	if(pc.level >= 12) levelChance = 3;
	
	if(rand(levelChance) == 0)
	{
		showName("FIGHT:\nVARMINT PACK");
		author("Jacques00");
		
		var numVarmints:int = 2 + rand(3);
		
		if(hasVarmintBuddy())
		{
			output("\n\nYour pet varmint perks up with uneasiness... It senses something...");
			output("\n\n<i>“");
			if(pc.isBimbo()) output("What is it, baby? Do ya hear something?");
			else if(pc.isNice()) output("Hm, something the matter?");
			else output("Damn, it’s trouble, isn’t it?");
			output("”</i> you ask.");
		}
		output("\n\nSuddenly, out of nowhere, a loud rustle catches your attention. Rushing in front of you is a");
		if(numVarmints == 2) output(" pair");
		else if(numVarmints == 3) output(" trio");
		else output(" group");
		output(" of varmints! It looks to be a hunting party rather than the lone scavengers you are used to seeing--but each appears equally as dangerous, if not more so.");
		output("\n\nThe creatures barely give you time to react before one of them lets out a sharp, vicious howl, signaling an obvious attack.");
		if(pc.isBimbo()) output("\n\nLike, <i>ohmygosh</i>, get ready!");
		else if(pc.isNice()) output("\n\nPrepare yourself!");
		else if(pc.isMischievous()) output("\n\nShit, you hate " + (hasVarmintBuddy() ? "being right all the time" : "surprises") + "!");
		else if(pc.isAss()) output("\n\nFucking, damnit!");
		else output("\n\nOH MY GOD!");
		
		IncrementFlag("MET_VARMINT_PACK");
		
		varmintPackFight(numVarmints);
		
		return true;
	}
	return false;
}
public function varmintPackFight(numVarmints:int = 4):void
{
	var f:Array = [pc];
	var h:Array = [];
	
	for (var i:int = 0; i < numVarmints; i++)
	{
		h.push(new Varmint());
		h[i].isUniqueInFight = false;
	}
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(f);
	CombatManager.setHostileActors(h);
	CombatManager.victoryScene(pcVictoryVsVarmintPack);
	CombatManager.lossScene(pcLosesToVarmintPack);
	CombatManager.displayLocation("VARMINT PACK");
	CombatManager.encounterText("A pack of hungry, hostile-looking creatures, these varmints are not looking to be friends with you. Blue spikes extend and razor-sharp teeth gnash as they throw threatening hackles your way.");
	
	showBust((numVarmints >= 1 ? h[0].bustDisplay : ""), (numVarmints >= 2 ? h[1].bustDisplay : ""), (numVarmints >= 3 ? h[2].bustDisplay : ""), (numVarmints >= 4 ? h[3].bustDisplay : ""));
	
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}
public function pcVictoryVsVarmintPack():void
{
	showBust("VARMINT");
	showName("DEFEATED:\nVARMINT PACK");
	author("Jacques00");
	
	output("Realizing defeat, the varmints give into their survivalist instinct and break free from you with a burst of renewed energy. They each scatter and sprint off--though one of them struggles and lags behind...");
	
	clearMenu();
	addButton(0, "Next", pcVictoryVsVarmints, true);
}
public function pcLosesToVarmintPack():void
{
	showBust("VARMINT");
	showName("LOST VS:\nVARMINT PACK");
	author("Jacques00");
	
	output("Howling in victory, the varmints quickly surround you. They are pretty coordinated for a bunch of scavengers! Then, one - the <i>alpha</i> you take it - rears its head at you, looking you dead in the eye...");
	
	clearMenu();
	addButton(0, "Next", pcLosesToVarmint, true);
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


/* How to Train Your Pet Varmint */

public function varmintRenamend():Boolean
{
	return (chars["VARMINTPET"].short != "varmint");
}
public function varmintPetName(article:String = ""):String
{
	if (!varmintRenamend()) return ((article != "" ? (article + " ") : "") + "varmint");
	return chars["VARMINTPET"].short;
}

public function varmintPetBustDisplay():String
{
	return "VARMINT";
}
public function varmintPetHeader():void
{
	showBust(varmintPetBustDisplay());
	showName("\n" + varmintPetName().toUpperCase());
}

// Varmint event check
public function varmintStowaway():Boolean
{
	// Can only produce once!
	if(varmintIsCrew()) return false;
	// Has a Varmint item? Yes.
	if(pc.hasItemByClass(VarmintItem)) return true;
	// Otherwise, no.
	return false;
}

// Is varmint a follower?
public function varmintIsCrew():Boolean
{
	return (flags["VARMINT_IS_CREW"] != undefined);
}
// Is wild varmint onboard the ship?
public function varmintIsWild():Boolean
{
	return (flags["VARMINT_IS_CREW"] == 1);
}
// Is varmint tamed?
public function varmintIsTame():Boolean
{
	return (flags["VARMINT_IS_CREW"] == 2);
}
// Is varmint following you into battle?
public function hasVarmintBuddy():Boolean
{
	return (pc.hasStatusEffect("Varmint Buddy"));
}
// Do you have the leash anywhere?
public function hasVarmintLeash():Boolean
{
	if(pc.accessory is VarmintLeash || pc.hasItemByClass(VarmintLeash)) return true;
	for (var i:int = 0; i < pc.ShipStorageInventory.length; i++)
	{
		var sItem:ItemSlotClass = pc.ShipStorageInventory[i] as ItemSlotClass;
		if (sItem.shortName == "Pink Leash" && sItem.quantity >= 1) return true;
	}
	// Remove leashed effect if none exists.
	pc.removeStatusEffect("Varmint Leashed");
	return false;
}

// Crew Menu Text
public function varmintOnShipBonus(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	// No varmints!
	if(flags["VARMINT_IS_CREW"] == undefined) return "";
	
	var bonusText:String = "";
	var btnText:String = "";
	
	// Wild Varmint:
	if(varmintIsWild())
	{
		bonusText += "\n\nThere’s still a wild, feral New Texan varmint sitting on your ship. You get glimpses of it from time to time, stalking between rooms on your ship. Still, so long as you leave your food unsecured, it doesn’t seem keen on bothering you";
		if(crew(true) > 0) bonusText += " or your crew";
		bonusText += ". After the first uncomfortable encounter, it hasn’t even left a mess anywhere.";
		
		if(pc.isBimbo()) btnText = "The cutie can’t be that mean, can it?";
		else btnText = "It looks dangerous. Better be careful.";
		
		addButton(btnSlot, "Varmint", getAPetVarmint, undefined, "Varmint Stowaway", btnText);
	}
	// Tame Varmint:
	else if(varmintIsTame())
	{
		bonusText += "\n\nYour pet varmint " + (!varmintRenamend() ? "" : (varmintPetName() + " ")) + "is";
		if(pc.hasStatusEffect("Varmint Leashed")) bonusText += " sitting happily in your quarters, swishing its tail and watching you as you wander about. Whenever you get close, its spikes flare up and it makes a high-pitched, trilling hoot at you.";
		else bonusText += " roaming freely around your quarters. It spots you as it wanders, happily hooting and trilling when you get near.";
		// if bimbo:
		if(pc.isBimbo())
		{
			bonusText += " SO CUTE!";
			btnText = "<i>Who’s a good little cutie-wooty? You are! Oh, yes you are!</i>";
		}
		else btnText = "Check up on the critter.";
		
		addButton(btnSlot, (!varmintRenamend() ? "Varmint" : varmintPetName()), approachPetVarmint, true, (!varmintRenamend() ? "Varmint Companion" : varmintPetName()), btnText);
	}
	return (showBlurb ? bonusText : "");
}

// Get a Pet Varmint
// Play if PC accidentally somehow wanders off of New Texas with a Varmint in their inventory (not in storage) and travels between systems.
public function getAPetVarmint():void
{
	clearOutput();
	author("Savin");
	showBust(varmintPetBustDisplay());
	clearMenu();
	
	if(flags["VARMINT_IS_CREW"] == undefined)
	{
		showName("\nUH-OH!");
		output("Your relaxed journey between systems is interrupted by a sudden crash from somewhere aboard your ship");
		// if Reaha crew:
		if(reahaIsCrew()) output(", and a shriek of alarm");
		output(". You curse and grab your gear, running out of your cabin and down the corridor to the common room. A moment later, though, you’re skidding to a stop and backpedaling out of your ship’s galley as a huge, snarling blue creature stomps out with a mouthful of protein cubes drooling out of its mouth."); 
		// if not-Treated ReahaCrew:
		if(reahaIsCrew() && !reaha.isTreated()) output("\n\nYour pudgy little cowgirl is up on the kitchen counter, wrapping her arms around herself and screeching. <i>“What’s it doing on the ship!?”</i> she yelps as soon as she sees you, flailing at the person-sized New Texan critter. <i>“[pc.name] do somethiiing!”</i>");
		output("\n\nSuddenly, you remember that you somehow managed to walk right off New Texas with the big blue bastard wrapped up and slung over your shoulder. How did you forget to turn this one in?");
		output("\n\nThe creature hisses at you, pacing around you, its huge claws clattering on the metal bulkheads under your [pc.feet]. The varmint gives you a wide berth, chomping its needle-like teeth on your food supply, staring at you with its beady little black eyes. Its long, sinuous tail smacks against a shelf on the far wall, sending some of your foodstuff crashing to the ground. The sudden sound spooks the creature, and it lunges away, leaping through a hatch and into another room. Shit.");
		// if not-Treated ReahaCrew:
		if(reahaIsCrew() && !reaha.isTreated()) output("\n\n<i>“[pc.name], kill it! Kill it!”</i> Reaha squeals, hiding behind you.");
		output("\n\n");
		
		processTime(8);
		pc.destroyItemByClass(VarmintItem, 1);
	}
	else showName("\nVARMINT");
	// Repeat Interactions
	// Trying to interact with a wild Varmint on your crew manifest
	output("Steeling yourself, you [pc.readyWeapon] and cautiously advance towards the hatch. The critters back on New Texas might have been relatively easy to wrangle in a wide open field where you could use your light-lasso, but things are a little too cramped in your living quarters to do anything other than either kill it or try and wrestle it down if the varmint attacks you.");
	output("\n\nInstead, when you step through the hatch, you find the giant critter curled up on a tattered mess of your clothes ripped down from the laundry hatch, munching quietly on the sack of protein cubes that it stole. You blink in surprise at the creature’s sudden change in attitude, and slowly step forward. The varmint looks up and glowers at you, its blue spikes rising like hackles when you get too close. Doesn’t look like it wants to be friends...");
	
	processTime(2);
	
	//[Kill it] [Leave it] [Try to Tame]
	if(pc.hasEquippedWeapon()) addButton(0, "Kill It", getAPetVarmintResponse, "kill", "Kill It", "Well, you can’t just let it sit there. It could attack at any moment!");
	else addDisabledButton(0, "Kill It", "Kill It", "You need to equip a weapon to do that!");
	addButton(1, "Leave It", getAPetVarmintResponse, "leave", "Leave It", "Well, it doesn’t look like it wants to fight. You suppose you could just leave it...");
	addButton(2, "Try to Tame", getAPetVarmintResponse, "tame", "Try to Tame", (pc.isBimbo() ? "You’re like, just as good as sleeping beauty or whatever. It’ll totally be your friend!" : "Try to Tame", "Maybe you could try to tame it?"));
}

public function getAPetVarmintResponse(response:String = "none"):void
{
	clearOutput();
	author("Savin");
	showBust(varmintPetBustDisplay());
	clearMenu();
	// Kill It
	if(response == "kill")
	{
		showName("GOODBYE,\nVARMINT");
		output("Wrangling it down with a lasso might be a challenge, but you know what fate awaits these varmints anyway. This time, though, you have your weapon. You walk in and put the thing down.");
		output("\n\nWith a sigh, you heft the big blue bastard’s body up and dump it into the airlock. One flush later, and it’s like it was never there to begin with.");
		// if not-Treated ReahaCrew:
		if(reahaIsCrew() && !reaha.isTreated()) output("\n\n<i>“Gross,”</i> Reaha says, rubbing at her tits. <i>“I thought I was rid of them when I moved. Yuck.”</i>");
		// Remove Varmint!
		if(flags["VARMINT_IS_CREW"] != undefined) flags["VARMINT_IS_CREW"] = undefined;
		// Meanie!
		pc.addHard(5);
		processTime(8);
	}
	// Leave It
	else if(response == "leave")
	{
		showName("IGNORED\nVARMINT");
		output("You shrug and turn away, deciding that you might as well live and let live. As long as it doesn’t completely eat you out of food, you can deal with it later.");
		output("\n\nThe varmint’s spikey hackles return to normal as you retreat, and it makes a strange, flutey cooing sound while it finishes your bag of protein.");
		// Add [Varmint] to crew tab. Doesn’t take up a space cuz it’s a giant blue space dog.
		flags["VARMINT_IS_CREW"] = 1;
		processTime(1);
	}
	// Try to Tame
	else if(response == "tame")
	{
		// if PC is a bimbo:
		if(pc.isBimbo())
		{
			showName("TAME A\nVARMINT!");
			
			flags["VARMINT_IS_CREW"] = 2;
			
			output("You put on your biggest, bubbliest smile and prance over to the growling critter, trying to direct as much of your mindless positivity at it as you can. Squatting down right in front of it, you introduce yourself and ask what its name is.");
			output("\n\nThe cute little varmint twists its head 180 degrees at you and makes an owl-like hoot. When you don’t attack it, though, the creature’s spikes flex back out, and it makes a great big huff in your face, blasting you with a horribly cinnamon-like breath that burns your eyes and nose. You make yourself giggle in spite of the burning breath and slowly reach out to stroke the critter’s big blue head-plate. It’s armored skin feels like ultra-smooth latex, glossy and brilliantly colored, getting rougher around the base of its spines. The varmint recoils a bit when you touch it, but after a few minutes of you searching out the equivalent of behind its ears to scratch (ear-holes, you guess?); it ends up making a purring hooting sound and wagging its big, spiky tail around like an oversized puppy.");
			output("\n\n<i>“Aww, you’re not so bad!”</i> you tease, scritching its snout until the varmint’s putty in your hands. Like, totally cute!");
			output("\n\nDeciding your cutey-booty new pet’s totally harmless");
			
			// Yay!
			if(hasVarmintLeash() || pc.credits >= 50)
			{
				if(hasVarmintLeash()) output(", you quickly grab your plus-sized animal collar and leash");
				else output(", you bounce over to your personal terminal and browse the extranet for a cheap plus-sized animal collar and leash. You get the delivery from a drone as soon as you set down at your destination,");
				output(" and present the bright pink, flower-colored collar to the varmint with a huge smile.");
				output("\n\nIt hoots again, but with a little coaxing, you get it to stretch out its neck and let you collar it. Ah, it’s soooo adorable! And the colors look so good together! You giggle and pull the person-sized puppy into a huge hug, right up until it actually licks your cheek... and burns your [pc.skinFurScales]. You yelp and wipe at your cheek, stumbling away as the varmint’s saliva burns you. Ouchie! Your new friend whimpers and retreats into the corner, letting you run to the head and wash yourself off. OwowowowOW!");
				output("\n\nYou huff and rub at your cheek as your nano-docs heal the burn on your skin. Better not let your naughty puppy do that again! Or maybe make sure it does that to anybody who wants to hurt you! <b>Maybe it’d make a cool battle buddy!</b>");
				
				pc.createStatusEffect("Varmint Leashed");
				// Has a leash already!
				if(hasVarmintLeash())
				{
					processTime(15);
				}
				// Get Leash!
				else
				{
					output("\n\n");
					processTime(72);
					pc.credits -= 50;
					quickLoot(new VarmintLeash());
					return;
				}
			}
			// Too poor!
			else
			{
				output(", you bounce over to your personal terminal and browse the extranet for a cheap plus-sized animal collar and leash... Unfortunately, you don’t even have enough funds to purchase a <b>50-" + (isAprilFools() ? "dogecoin" : "credit") + "</b> leash. Aw, fooey--looks like you have to pick up whoring and shake your money-maker if you know what’s good for you!");
				output("\n\nTo get over your disappointment, you decide to play with your adorable baby some more. You giggle and pull the person-sized puppy into a huge hug, right up until it actually licks your cheek... and burns your [pc.skinFurScales]. You yelp and wipe at your cheek, stumbling away as the varmint’s saliva burns you. Ouchie! Your new friend whimpers and retreats into the corner, letting you run to the head and wash yourself off. OwowowowOW!");
				output("\n\nYou huff and rub at your cheek as your nano-docs heal the burn on your skin. Better not let your naughty puppy do that again! Or maybe make sure it does that to anybody who wants to hurt you! <b>Maybe it’d make a cool battle buddy if you could afford to keep it on a leash!</b>");
				processTime(40);
			}
		}
		// if not a bimbo:
		else
		{
			showName("TAMING THE\nVARMINT");
			output("You slowly approach the varmint, arms outstretched in friendship, trying to gently coax it out of its corner. The creature just turns its head 180 degrees upside down and hoots at you, raising its spikes defensively. Another step closer and it stands up, head low and hissing.");
			output("\n\nUh, shit. You back up, right to the edge of the hatch, and the creature slowly sits back down. Doesn’t look like it wants any of what you’re selling right now.");
			output("\n\n<b>Maybe you should find a professional...</b>");
			
			// And now you have a varmint on your ship until Natalie Irson gets added :VVV
			flags["VARMINT_IS_CREW"] = 1;
			processTime(2);
		}
	}
	// Buy a leash!
	else if(response == "leash")
	{
		showName("LEASH\nPURCHASED!");
		if(pc.isBimbo())
		{
			output("You bounce over to your personal terminal and browse the extranet for a cheap plus-sized animal collar and leash. You get the delivery from a drone as soon as you set down at your destination, and present the bright pink, flower-colored collar to the varmint with a huge smile.");
			output("\n\nIt hoots again, but with a little coaxing, you get it to stretch out its neck and let you collar it. Ah, it’s soooo adorable! And the colors look so good together! You giggle and pull the person-sized puppy into a huge hug.");
		}
		else
		{
			output("You make your way to your personal terminal and browse the extranet for a cheap plus-sized animal collar and leash. You get the delivery from a drone as soon as you set down at your destination. It turns out the collar you ordered came in an unexpected color: bright pink with flower designs all over it...");
			if(pc.isNice()) output(" Oh, that’s nice, you guess. At least, it’s better than no collar at all!");
			else if(pc.isMischievous()) output(" You’ve got to be kidding--That’s seriously all they had left?");
			else output(" What. Now everyone will think you have some kind of pansy dog or something!");
			output("\n\nThe varmint hoots to get your attention. You get it to stretch out its neck and allow you to collar it. Uhm, the colors are a bit garrish in comparison, but a collar’s a collar and the leash will prove useful as long as you have it. You hunch down and give the critter a few positive scritches.");
		}
		output(" Learning from last time, you quickly stand before it has the chance to lick you. Even with a missed opportunity, the New Texan beast coos happily.");
		output("\n\n");
		processTime(35);
		pc.createStatusEffect("Varmint Leashed");
		pc.credits -= 50;
		quickLoot(new VarmintLeash());
		
		varmintDisappearsCancel();
		
		return;
	}
	
	varmintDisappearsCancel();
	
	addButton(0, "Next", mainGameMenu);
}


// Interactions w/ Tamed Varmint
public function approachPetVarmint(introText:Boolean = false):void
{
	clearOutput();
	author("Savin");
	varmintPetHeader();
	clearMenu();
	//When approaching Varmint.
	if(introText)
	{
		if(rand(2) == 0)
		{
			output("You walk towards your New Texan friend. Recognizing you, the critter eagerly jumps up and down, its spiky, whip-like tail wagging behind it.");
			if(pc.isBimbo()) output("\n\n<i>“Hey there, cutie-booty!”</i> you coo.");
			else if(pc.isNice()) output("\n\n<i>“Hey there, buddy!”</i> you encourage.");
			else output("\n\n<i>“Hey there, " + (!varmintRenamend() ? "runt" : varmintPetName()) + "!”</i> you tease.");
			output("\n\nThe varmint responds with a purring hoot, obediently waiting on you.");
		}
		else
		{
			output("You walk over to where " + varmintPetName("your") + " is");
			if(pc.hasStatusEffect("Varmint Leashed")) output(" sitting");
			else output(" roaming");
			output(". It looks up, cocking its angular, plated head to the side with curiosity. After a moment, its long tongue lolls out the side of its mouth and it starts huffing.");
		}
		processTime(2);
	}
	else output(varmintPetName("The") + " patiently awaits your action.");
	
	if(!pc.hasStatusEffect("Varmint Leashed") && !pc.hasStatusEffect("Varmint Unleashed Cooldown")) output(" It looks overly curious and paces around the deck. Is it a good idea to let it wander about so freely?");
	
	// [Pet] [Leash / Unleash] [Leave]
	addButton(0, "Pet", doVarmintPlayTime, "pet", "Pet", "Give " + varmintPetName("the") + " a pet.");
	if(!hasVarmintLeash())
	{
		addDisabledButton(1, "Leash", "Leash", "You’ll need to have a leash and collar in order to try this.");
		if(pc.credits < 50) addDisabledButton(2, "Buy Leash", "Buy Leash", "Unfortunately, you do not have enough money to buy a leash for it.\n\n<b>50 Credits</b>");
		addButton(2, "Buy Leash", getAPetVarmintResponse, "leash", "Buy Leash", "Maybe you should buy a leash for it or risk the varmint running away.\n\n<b>50 Credits</b>");
	}
	else
	{
		if(!pc.hasStatusEffect("Varmint Leashed"))
		{
			// Let it wander for an hour or so before being able to put it back.
			if(pc.getStatusMinutes("Varmint Unleashed Cooldown") > (1440 - 60)) addDisabledButton(1, "Leash", "Leash", ((!varmintRenamend() ? "It" : varmintPetName()) + " seems to enjoy the freedom too much. Perhaps you should wait a bit before activating the leash."));
			else addButton(1, "Leash", doVarmintPlayTime, "leash", "Leash", "Put " + varmintPetName("your") + " on a leash.");
		}
		else addButton(1, "Unleash", doVarmintPlayTime, "unleash", "Unleash", ("Take " + varmintPetName("your") + " off its leash and let it wander around the ship."));
		addDisabledButton(2, "Buy Leash", "Buy Leash", "You already own a leash so you don’t need to buy another. However, if you ever lose the one you have, you know where to buy a replacement.\n\n<b>50 Credits</b>");
	}

	if (varmintRenamend()) addDisabledButton(5, "Name It", "Name Varmint", ("Too late to change the name, " + varmintPetName() + " already got used to it."));
	else if(!pc.hasStatusEffect("Varmint Leashed")) addDisabledButton(5, "Name It", "Name Varmint", "You need to leash the varmint before you can give it a name.");
	else addButton(5, "Name It", nameTheVarmint, undefined, "Name Varmint", "Give your varmint a name.");

	addButton(14, "Leave", doVarmintPlayTime, "leave");
	return;
}

public function nameTheVarmint():void
{
	clearOutput();
	author("Stygs");
	varmintPetHeader();
	clearMenu();

	output("Now that the varmint is used to living with you on your [pc.ship], it might be a good time to finally decide upon a name for it. After all, you can’t keep calling it just ‘varmint’ forever, that’s just rude!");
	output("\n\nWhat do you want to call your New Texan pet from now on?");
	
	if(stage.contains(this.userInterface.textInput)) 
	this.removeInput();
	this.displayInput();
	output("\n\n\n");

	clearMenu();
	addButton(0, "Next", varmintNamingConventions, nameTheVarmint);
	addButton(14, "Back", function():void {
		removeInput();
		approachPetVarmint();
	}, undefined, "Back", "Best to think about this some more.");
}

public function varmintNamingConventions(retFunc:Function = null):void
{
	if(userInterface.textInput.text == "") {
		retFunc();
		output("<b>You must input a name.</b>");
		return;
	}
	
	// Illegal characters check. Just in case...
	if(hasIllegalInput(userInterface.textInput.text)) {
		retFunc();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(userInterface.textInput.length > 12) {
		retFunc();
		output("<b>Please select a name no more than twelve characters long.</b>");
		return;
	}
	chars["VARMINTPET"].short = userInterface.textInput.text;
	chars["VARMINTPET"].a = "";
	chars["VARMINTPET"].capitalA = "";

	clearOutput();
	author("Stygs");

	output("<i>“I think I am going to call you " + varmintPetName() + " from now on, what do you think about that?”</i> you say, smiling at the big blue varmint next to you.");
	output("\n\nYour alien puppy stares at you for a moment before suddenly emitting a soft hooting sound, thumping its hefty tail on the ground. Looks like it’s happy with the name you selected.");
	output("\n\n<i>“Well, I guess it’s settled then.”</i>");
	output("\n\n<b>Your varmint is now named " + varmintPetName() + "!</b>");

	if(stage.contains(this.userInterface.textInput)) 
	this.removeInput();
	varmintPetHeader();
	clearMenu();
	addButton(0,"Next",approachPetVarmint);
}

public function doVarmintPlayTime(response:String = "none"):void
{
	clearOutput();
	author("Savin");
	varmintPetHeader();
	clearMenu();
	
	if(response == "pet")
	{
		if(pc.isBimbo())
		{
			output("Aww, what a pretty space-puppy! You get down on the ground with your big blue cutie and give it a scritch under the chin, earning an adorable hoot and a tail-wiggle from it. <i>“Good boy!”</i> you cheer, moving your fingers a little faster and moving them all over its shiny smooth head-plate. " + varmintPetName("The") + " gurgles and nuzzles against your hands, slamming its tail heavily against the deck and bulkheads.");
			output("\n\nIt doesn’t take long for the happy space-puppy to roll into its back, paws in the air and spikes splaying out all around it, showing its spiny-plated belly. You scoop the critter down and give it a big hug, starting to scratch all over. It gurgles and hoots and paws at the air, wriggling like a big ol’ noodle while you play with it.");
			output("\n\nEventually, you decide you got other stuff to do. And stuff. So you give " + varmintPetName("your") + " a pet on the haunch and let it go. It hops up on its hindlegs and gives you a great big lick on the face before you can leave.");
		}
		else
		{
			output("You reach down and give " + varmintPetName("your") + " an affectionate scritch between the, uh, spiky ear-holes. Its enormous tail swishes heavily against a bulkhead, hammering it like a bag of rocks, and it emits a soft hooting sound. You guess that means it likes it?");
			output("\n\nAfter a couple moments, the huge beast flops onto its side, yawning and pawing at you, the deck, and its own curling tail. Taking the hint, you reach down and start scratching its... very rough, plated, spiky belly. It’s not exactly comfortable to pet, but your blue buddy seems to like it until your hand gets too sore to keep going. When you stop, it gives a defeated huff and curls up to take a nap.");
			output("\n\n");
		}
		pc.addNice(1);
		processTime(5);
	}
	else if(response == "leash")
	{
		output("You go over to where " + (!varmintRenamend() ? "the varmint’s" : (varmintPetName() + " is")) + " sitting, thumping its massive tail on your deck. It hoots quietly as you approach, swishing its tail a little faster. It doesn’t stop you as you hook its collar and leash around its tree-trunk neck, though its spikes rise a bit as you lock it in place. The great big beasty takes a big, huffing breath as you activate its leash and stands up, sauntering over to stand at your side. Looks like it’s ready to go! ");
		if(pc.isBimbo()) output("\n\nYou lean down and give it plenty of pets and kisses. What a good alien-puppy!");
		output("\n\n<b>The varmint is now leashed");
		if(flags["NATALIE_TAMES_VARMINT"] == undefined) output(" and will be prevented from leaving your ship");
		output("!</b>");
		processTime(3);
		pc.createStatusEffect("Varmint Leashed");
		pc.removeStatusEffect("Varmint Unleashed Cooldown");
	}
	else if(response == "unleash")
	{
		output("You crouch down and unclip your leash from the great big blue varmint’s neck, giving it a pat on the haunch and sending it on its way. " + (!varmintRenamend() ? "It" : varmintPetName()) + " makes a happy hooting sound and bounds down the corridor as fast as it can, ready to burn off some excess energy.");
		// if Anno/Reaha on crew:
		if(reahaIsCrew() || annoIsCrew())
		{
			output(" You almost immediately hear an alarmed shriek as it charges into");
			if(reahaIsCrew() && annoIsCrew()) output(" one of the girls’");
			else if(annoIsCrew()) output(" Anno’s");
			else output(" Reaha’s");
			output(" quarters.");
		}
		output("\n\n<b>" + varmintPetName("The") + " is now unleashed.");
		if(flags["NATALIE_TAMES_VARMINT"] != undefined) output(" " + (rand(2) == 0 ? "Thanks to Natalie" : "Fortunately") + ", the bond between you two is so strong that you don’t need to worry about it wandering off any time soon.");
		else output(" Even though it is tamed, there may be a chance that it will wander off by itself if left alone for too long!");
		output("</b>");
		processTime(5);
		pc.removeStatusEffect("Varmint Leashed");
		pc.createStatusEffect("Varmint Unleashed Cooldown", 0, 0, 0, 0, true, "", "", false, 1440);
	}
	else if(response == "leave")
	{
		output("You give " + varmintPetName("the") + " a pat on the head and leave it to its own devices for a bit.");
		processTime(1);
		
		varmintDisappearsCancel();
	}
	addButton(0, "Next", crew);
}

// Varmint Disappears
// 10% chance per day when landed on a planet with an untamed varmint.
public function varmintDisappearChance(deltaT:uint, doOut:Boolean):void
{
	if(!InShipInterior() || !varmintIsCrew() || pc.hasStatusEffect("Varmint Buddy") || pc.hasStatusEffect("Varmint Leashed") || pc.hasStatusEffect("Varmint Unleashed Cooldown") || flags["NATALIE_TAMES_VARMINT"] != undefined) return;
	
	var runawayChance:int = 1200;
	if (varmintIsTame()) runawayChance *= 2;
	
	// 1199/1200 to not run
	// (1199/1200)^minutes to not run over n minutes
	// 1 - ((1199/1200)^minutes) to run
	
	// Calculate the probability and scale it to 1-1000 to play nice with our implementation of rand()
	var runProbability:int = Math.round((1 - Math.pow(((runawayChance - 1) / runawayChance), deltaT)) * 1000);
	
	if(rand(1000) < runProbability && eventQueue.indexOf(varmintDisappears) == -1)
	{
		eventQueue.push(varmintDisappears);
	}
}
public function varmintDisappearsCancel():void
{
	var idx:int = eventQueue.indexOf(varmintDisappears);
	if(idx != -1) eventQueue.splice(idx, 1);
}
public function varmintDisappears():void
{
	clearOutput();
	author("Savin");
	showBust("");
	showName("MISSING\nVARMINT");
	clearMenu();
	
	output("As you pass by your airlock, you notice that it’s standing open somehow.");
	if(pc.isBimbo()) output(" Like, something’s missing...");
	else if(pc.isNice()) output(" Something’s wrong...");
	else output(" What the hell?");
	output(" You walk around the ship, looking for anything amiss. Everything seems to be where you left it... <b>except");
	if(varmintIsTame())
	{
		if(pc.isBimbo()) output(" your big, cutie-booty");
		else output(" your loyal");
	}
	else output(" the wild");
	output(" varmint’s nowhere to be found!</b> You give the whole ship another once-over to make sure, and sure enough, it’s long gone!");
	
	if(varmintIsWild())
	{
		// If not on NT:
		if(getPlanetName() != "New Texas") output("\n\nWell, looks like there’s going to be a varmint infestation here now.");
		// NT:
		else output("\n\nBack to where you came from, you big blue bastard!");
	}
	else
	{
		output("\n\n");
		if(pc.isBimbo()) output("Aw... You pout for a bit and hope that your little puppy is doing okay by its lonesome.");
		else if(pc.isNice()) output("Well, that was bound to happen if you didn’t keep it on a leash. Hopefully it’s okay out there.");
		else output("You should have known that thing was gonna run off! Keeping it tethered might have been a better option after all.");
		if(getPlanetName() == "New Texas") output(" At least it’s back home now.");
		else output(" One loose animal on " + getPlanetName() + " shouldn’t cause too much trouble, right?");
	}
	
	processTime(32);
	flags["VARMINT_IS_CREW"] = undefined;
	chars["VARMINTPET"].short = "varmint";
	chars["VARMINTPET"].a = "the ";
	chars["VARMINTPET"].capitalA = "The ";
	
	addButton(0, "Next", mainGameMenu);
}