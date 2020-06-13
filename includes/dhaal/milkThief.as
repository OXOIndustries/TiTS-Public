public function showMilkThief(nude:Boolean = false):void
{
	showName("\nMILK THIEF");
	var bustS:String = "MILK_THIEF_";
	if(enemy.biggestTitSize() == 2) bustS += "SMALL";
	else if(enemy.biggestTitSize() == 8) bustS += "MEDIUM";
	else bustS += "LARGE";

	showBust(bustS + (nude ? "_NUDE":""));
}
//Quicktester
public function milkThief():void
{
	encounterMilkThief();
}
public function specialFenTreat():void
{
	for(var x:int = 0; x < pc.cockTotal(); x++)
	{
		if(pc.hasCock()) pc.cocks[x].cLengthRaw = 20 + rand(80);
	}
}

//FEN NOTE: Move this into Leila when she is added!
public function leilaIsCrew():Boolean { return false; }

public function hasBackTentaclesOrCocktail():Boolean
{
	return (pc.hasCockTail() || (pc.wingType == GLOBAL.TYPE_TENTACLE && pc.wingCount > 0));
}

//Encounter Texts
public function encounterMilkThief():Boolean
{
	author("Fenoxo");
	var tEnemy:ZaikaMilkThief = new ZaikaMilkThief();
	setEnemy(tEnemy);
	showName("FIGHT:\nMILK THIEF");
	showMilkThief();
	//First time!
	if(flags["MET_MILK_THIEF"] == undefined)
	{
		flags["MET_MILK_THIEF"] = 1;
		output("\n\nNo amount of alertness could prepare you for the sudden appearance of gun-toting zaika from the twilight sky. One moment, you’re minding your own business, the next, this strange woman stands up smoothly from her crotch, like she hopped a curb instead of plummeting hundreds of feet from a rooftop.");
		output("\n\n<i>“");
		if(enemy.biggestTitSize() <= 2) output("Hello there, Rusher. Don’t be alarmed, but I’m going to need you to give me all of your milk before I can let you go,”</i> says the flat-chested alien.");
		else if(enemy.biggestTitSize() <= 8) output("Mmm, don’t you look like a particularly tasty Rusher? I bet you’ll give me the loveliest milk, and make no mistake - you will be giving me all of your milk,”</i> says the chesty alien.");
		else output("Don’t run, Rusher. I’m not going to hurt you - quite the opposite.”</i> The leering alien licks her lips. <i>“I’m going to make you cum so hard that you won’t mind giving me your rich, creamy... mmmilk. Every, single, drop,”</i> she hungrily purrs.");
		output(" <i>“Don’t mistake my friendliness. <b>This is happening.</b> Make it easy on yourself, and I’ll be easy on you" + (enemy.biggestTitSize() > 8 ? ". So easy for you, baby":"") + ".”</i>");
		output("\n\nYour Codex chooses this moment to chirp, <i>“Hostile zaika detected! Care should be taken when traveling on Dhaal if lactating!”</i>\n\nPerfect timing, as always.");
		CodexManager.unlockEntry("Zaika");
		var lied:Boolean = false;
		//No boobs& no milk, no new PG: 
		if(!pc.isLactating() && pc.biggestTitSize() < 1) 
		{
			output(" <i>“I don’t have have breasts, let alone milk!”</i>");
			lied = true;
		}
		//Boobs & no milk:
		else if(!pc.isLactating()) 
		{
			output(" <i>“But I’m not lactating right now!”</i>");
			lied = true;
		}
		//No boobs+havemilk:
		else if(pc.biggestTitSize() < 1 && pc.isLactating()) 
		{
			lied = true;
			output(" <i>“I don’t have breasts, let alone milk!”</i> you lie.");
		}
		if(lied) output("\n\nThe zaika snorts. <i>“Don’t lie to me, off-worlder. I’ve been to the milk bars! Even your males can lactate, and you Rushers lie as easily as sleeping. I’ll just have to " + (enemy.biggestTitSize() <= 8 ? "take you down and see what kind of treats you have for me.":"fuck every sweet little treat out of you.") + "”</i>");
		//murgies
		output("\n\nYou try to talk her down, but the more you move your mouth, the more tightly the milk thief clutches her exotic-looking gun. <b>You’ll have to fight - or run!</b>");
	}
	//PC has high bovine score
	else if(pc.bovineScore() >= 3 && rand(2) == 0)
	{
		output("\n\nA zaika milk-thief drops from a rooftop vantage point with cat-like grace, raising her perverse milk-weapon with snappy certainty. <i>“Hey you! Cow!!! Give me your milk, and don’t give me any of that bull about not having any. We all know you bovine types are just " + (pc.tallness >= 6*12 ? "big, ":"") + "dumb, walking milk-tanks! I’ll even let you have an orgasm if you get down and give me those titties!”</i>");
		output("\n\n<b>You’ll have to fight!</b>");
	}
	//Repeat
	else if(enemy.biggestTitSize() <= 8)
	{
		output("\n\nAnother zaika milk thief plummets down from the rooftops, confidently raising her cream-sucking sex-toy of a weapon before she has a chance to stand back up. <i>“Hold it, Rusher. You’re not going anywhere.”</i> The tank on her back whirs, no doubt readying some kind of fluid-based chemical attack. <i>“Make this easy on us both. Let me fill up on all that milk you’ve got and I’ll give you a nice orgasm for the trouble!" + (enemy.biggestTitSize() > 8 ? " Maybe even two, because I’m so nice!":"") + "”</i>");
		output("\n\n<b>Time to defend yourself!</b>");
	}
	//Repeat huge tid variant
	else
	{
		output("\n\nOne of the zaika milk thieves that plague this area leaps down from on high, but the enormous weight of her swollen breasts leaves her stumbling on her cybernetic heels. She recovers before you can make your escape, stuttering, <i>“G-g-ive me all your milk!”</i> Her tail, tightly wrapped in a cream-covered cloth, rises up over her shoulder. <i>“Just give up already. We both know you’re a filthy, perverted cum-dump. Just do what comes naturally, Rusher-slut. Xenos like giving up their milk, because we let them cum all the time!”</i>");
		output("\n\n<b>You’ll have to fight her off!</b>");
	}
	//combat
	
	clearMenu();
	addButton(0,"Next",fightMilkThiefForReal,tEnemy);
	var milkTT:String = "Getting away from an augged-up alien would be hard. Why not see how good milking feels? At least you won't have to fight, just let your body do the work.";
	if(pc.isBimbo()) milkTT = "Getting milked and feeling good? Awyis! Why can't everyone offer you such a good time?";
	else if(pc.bovineScore() >= 4 || pc.isTreated()) milkTT = "She's a bit rude but when's the last time you got a proper milking? Why not see how good a zaika can make it?";
	if(pc.biggestTitSize() >= 1 && pc.isLactating()) addButton(1,"Milk Me",voluntaryMilkingByWilliamSan,undefined,"Milk Me",milkTT);
	else if(pc.biggestTitSize() >= 1) addDisabledButton(1,"Milk Me","Milk Me","You may have breasts, but they aren't ready for milking.");
	else addDisabledButton(1,"Milk Me","Milk Me","You need breasts for this.");
	return true;
}

public function fightMilkThiefForReal(tEnemy:Creature):void
{
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatMilkThief);
	CombatManager.lossScene(milkThiefLossRouter);
	CombatManager.displayLocation("MILK THIEF");
	CombatManager.beginCombat();
}

//[=Loss Scenes=]
public function milkThiefLossRouter():void
{
	if(pc.hasCock() && pc.biggestCockVolume() >= 1000 && !pc.isLactating()) loseAndGetHyperDooooocked();
	else loseToMilkThiefGetFuckoedAndMilkoed();
}

//[=Win Scenes=]
public function defeatMilkThief():void
{
	author("Fenoxo");
	if(enemy.lust() < 60) enemy.lust(60-enemy.lust());
	//Defeated in Combat HP
	if(enemy.HP() <= 1)
	{
		output("The milk thief collapses onto her hands and knees. She gasps for breath a few times" + (enemy.breastRows[0].breastRating() >= 32 ? ", dragging her awe-inspiring mounds on the pavement,":"") + " before collapsing in a defeated heap. She manages to roll over a moment later, looking at you ");
		if(rand(2) == 0) output("with an expression that’s equal parts aroused and confused. <i>“How... no, it doesn’t matter. Just fuck me, Rusher. You’re a pervert. I’m a pervert. If I can’t steal your milk, at least let me help you cum!”</i>");
		else if(enemy.breastRows[0].breastRating() == 8) output("with a confused expression. <i>“How... you can’t even get proper augs! Whatever.”</i> She spits, a split in her lip closing before your eyes. <i>“Hurry up and fuck me then. I’m randy as hell from my combat stims, and if you don’t fuck me, someone else will.”</i>");
		output("\n\nIt would seem that zaika is begging for you to help her out. Do you?");
	}
	//Lust
	else
	{
		output("The milk thief collapses in a horny heap, discarding any attempts at modesty as eagerly as she peels the sticky fabric covering from her tail-mounted omni-genital. <i>“F-f-fuck it’s no wonder we’re all going crazy for your milk when all you Rushers are this fucking sexy.”</i> She whines in the back of her throat. <i>“Screw stealing your shit. I want " + (pc.hasCock() ? "your seed":"you") + ". Fuck me, alien. Fuck me like one of your slutty concubines!”</i>");
	}
	output("\n\n");
	clearMenu();
	if(pc.hasVagina()) addButton(0,"TribTheTail",tribbyTailGalz,undefined,"Trib the Tail","You have a pussy, she has something that looks like a pussy, and it would feel really good to floss her sensitive tail between them.");
	else addDisabledButton(0,"TribTheTail","Trib the Tail","You would need a pussy to do this!");

	if(pc.hasCock()) 
	{
		
		if(pc.cockThatFits(1250) >= 0) 
		{
			//Tailfuck
			var tailfuckTT:String = "<i>“I can be convinced to let you go, but your tail’s gonna do the talking on that one.”</i>";
			if(pc.isBimbo()) tailfuckTT = "<i>“I heard all about your tails, elfy-ears! Lemme use it as a big cocksock, c’mon it’ll feel super good”</i>";
			else if(pc.isBro()) tailfuckTT = "<i>“Nice tail. How much me can fit in there?”</i>";
			addButton(1,"Fuck Her Tail",penisRouter,[fuckHerTailBuddddeh,80085,false,0],"Fuck Her Tail",tailfuckTT);
			//Facefuck
			var fuckyTT:String = "Right here in public: drill this girl's face. That'll teach her a lesson. Besides, she wants it.";
			if(pc.isBimbo()) fuckyTT = "Bad girls need a good dicking and, as you're keenly aware, fellatio is great behavioral adjustment!";
			if(pc.isBro()) fuckyTT = "This bitch wanted you to submit. Show her, and everyone else, what happens to those who come at you like that.";
			addButton(2,"Facefuck",penisRouter,[faceFuckDatBitch,1250,false,0],"Facefuck",fuckyTT);
		}
		//Too big
		else 
		{
			addDisabledButton(1,"Fuck Her Tail","Fuck Her Tail","Zaika tails are capacitive organs, but you’re much too hyper to wear one out in your current state. <b>Get some dick-diminishing drugs and try later!</b>");
			addDisabledButton(2,"Facefuck","Facefuck","Aliens are bendy and extravagant, but not this one. <b>Your oversized schlong" + (pc.hasCocks() ? "s":"") + " won't fit in that mouth, so diminish " + (!pc.hasCock() ? "it":"one") + " some!</b>");
		}
	}
	else 
	{
		addDisabledButton(1,"Fuck Her Tail","Fuck Her Tail","There’ll be no tail fucking this Dhaaling <b>without a penis!</b> Get you one.");
		addDisabledButton(2,"Facefuck","Facefuck","Sorry mate, <b>you don't have a penis.</b> That's an important tool for this job. Kinda blows, doesn't it?");
	}
	addButton(14,"Leave",CombatManager.genericVictory);
}

//[Tribby Tail] ~3500 words.
//Requires PC have pussy. Features options for where to let the tail cum. Could use an option for letting it cum inside your cunt.
public function tribbyTailGalz():void
{
	clearOutput();
	showMilkThief(true);
	author("Fenoxo");
	output("One minute, you’re fending off an aggressive alien’s attempts to harvest your bodily fluids, the next she’s propositioning faster than a single bridesmaid at a wedding reception. You’d be more surprised if this didn’t happen so frequently on the Planet Rush - and if you didn’t enjoy it quite so tactilely.");
	//Bimb
	if(pc.isBimbo()) output("\n\n<i>“Oooh, you’re going to be fun!”</i> you squeak, reaching down to help your former foe to her feet. <i>“I see a quiet place where we can like, screw without any lame jerks interrupting us.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Come on,”</i> you whisper, helping your former foe to her feet. <i>“I see a quiet corner over yonder we can play in. Probably safer than the streets.”</i>");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“Come with me if you want to " + (silly ? "live":"bone") + ",”</i> you quip, reaching down to help the fallen zaika to her feet. <i>“That quiet spot over there should be perfect. Secluded, no security cams, and I’m told a pretty hot spacer is walking that way now.”</i>");
	//Hard
	else output("\n\n<i>“On your feet,”</i> you say, reaching down to haul the thoroughly subdued zaika to her feet. <i>“Bad enough I had to teach you a lesson. I’m not gonna carry you just for a screw.”</i> You point to a darkened alcove not far away. <i>“Should be plenty private there.”</i>");
	//merge
	output("\n\nThe milk-thief follows after you with all the docility of a well-trained pet. Whatever kind of world Dhaal is, it has done an excellent job of teaching low-lives like her how to behave themselves when beaten. She whimpers softly, squeezing your hand with such surprising strength that you’re grateful she couldn’t clamp it around your neck in the fight. Good. The slutty thief" + (enemy.HP() <= 1 ? " still has access to a measure of her strength":"’s amorous inebriation hasn’t robbed her of her strength") + ".");

	//Smolboob & notlustloss
	if(enemy.breastRows[0].breastRating() == 2 && enemy.HP() <= 1)
	{
		output("\n\n<i>“What are you going to do?”</i> She considers you for a moment. <i>“I need a fuck, but I don’t want to do anything that’s going to hurt...”</i> Now in the alcove’s comforting shadows, her voice pitches down. <i>“But you can still use my egg-slit. I know that’s what you Rushers go for. I’ve seen the holos. You bang like rutting beasts...”</i> Her hand falls limply on your [pc.breast]. Where did her strength go? <i>“...and that’s okay, as long as you don’t ignore my tail. Okay? I do your pervy shit, and you make sure I still cum like a proper zaika.”</i>");
	}
	//Medboob || smol+lusty
	else if(enemy.breastRows[0].breastRating() <= 8)
	{
		output("\n\n<i>“How’re you gonna fuck me? Upside down? Sideways?”</i> She considers you for a moment. <i>“You aliens fuck so... directly.”</i> Gasping as the shadows envelop her fair form, she scans you with her faintly glowing, electronic eyes. <i>“You can fuck me like that. I may be civilized, but I can take it. I’m augmented. If you want to... a-abuse my egg-slit like some Rusher skank, I won’t complain. Just don’t make me wait any longer.”</i>");
	}
	//hugetid
	else output("\n\n<i>“I knew you were the perfect mark. Alluring, gracious in victory, and confident in taking what you want.”</i> She considers you for a moment, her tail squeezing tight against a shrink-wrapped thigh. <i>“You Rushers fuck with every part of your filthy, depraved bodies, and... it’s so fucking <b>hot</b>.”</i> Now inside the recessed alcove, she places her free hand over your [pc.breast], her electronic glow of her eyes scanning hungrily across your face. <i>“Use me like that. I can take it. Toy with my tail and my egg slit. Just because I’m civilized doesn’t mean I’m not your whore right now.”</i>");
	//merge
	//bro
	if(pc.isBro()) output("\n\nThere is such a thing as talking too much. You push her against the wall with a confident grunt of effort. The crotch of her jumpsuit rips open as easily as tissue paper. She might as well just stay naked. It would save you both some trouble. <i>“I’m in charge.”</i>");
	//bimbo
	else if(pc.isBimbo()) output("\n\n<i>“You say the sweetest things sugar-pie! Don’t you like, worry your pretty little head. I’m gonna make you cum so hard you’ll never wanna fuck anybody else ever again.”</i> Guiding the blushing rogue into place against the wall is as easy as throating a big, fat dick. The crotch release on her suit confounds you briefly, but the milk-hungry cutie taps a release with shaky fingers, exposing a " + (enemy.breastRows[0].breastRating() <= 8 ? "prim":"plump") + " slit to your lascivious attentions. <i>“Sooooo cute!”</i> you chirp.");
	//nice
	else if(pc.isNice()) output("\n\n<i>“Relax,”</i> you instruct as you guide her into place against the wall. <i>“This is the part where things get fun.”</i> You reach down, and with a few awkward probes, find the release for the crotch of her sheer suit. It snaps open cleanly, exposing her " + (enemy.breastRows[0].breastRating() <= 8 ? "prim":"plump") + " slit.");
	//misch
	else if(pc.isMischievous()) output("\n\n<i>“Awww, you’re cute when you’re being a lil hussy.”</i> You slap her ass and playfully push her against the wall. <i>“Don’t worry. All those stories you heard about us? All those tales of just how hard we make our partners cum? All true. Every. Last. One.”</i> She fumbles at the crotch of her suit, voluntarily exposing her " + (enemy.breastRows[0].breastRating() <= 8 ? "prim":"plump") + " slit as her breathing quickens.");
	//hard
	else output("\n\n<i>“You talk a big game, but we’re not here to talk.”</i> You shove her back against the wall, hard. <i>“We’re here to <b>fuck</b>.”</i> The crotch of her see-through suit feels slick against your fingers, but it only takes a hard pinch and a yank to rip it wide open, exposing the milk-hungry hunter’s " + (enemy.breastRows[0].breastRating() <= 8 ? "prim":"plump") + " slit.");
	//Merge
	output("\n\n<i>“B-b-but my tail.”</i>");
	output("\n\nYou grab her tail and rip the ");
	if(enemy.breastRows[0].breastRating() == 2) output("damp");
	else if(enemy.breastRows[0].breastRating() == 8) output("dewy");
	else output("sopping wet");
	output(" fabric away to expose what’s underneath: a big fat fucking omni-tool. The bulbous tip looks just as good for drilling a cunt as the opening at the end would be for fucking. No wonder these aliens ignore the treasures between their legs when they’ve got a tentacle for every occasion.");
	//No new PG
	//bimbo
	if(pc.isBimbo()) output(" You feed it into your lips without a second thought. It’s a cock, right? You suck those. You suck those so deep you can feel it snaking halfway down your throat before you remember that you had something else in mind. Dribbles of off-white leak from the tip when you pull it out.\n\nYou can’t wait to show her what you have planned.");
	//bro/hard
	else if(pc.isBro() || pc.isAss()) output(" Stuffing your thumb inside the socket confirms that the inside is quite sensitive, especially when you stir your fat finger in slow circles. Its squelches are almost as adorable as the alien’s gasps, and by the time you get bored enough to stop, off-white goo is sloughing out.\n\nIf she thought that was good, she’s going to love what comes next.");
	//Nice
	else if(pc.isNice()) output(" You spend a few moments admiring the organ, slowing circling your fingertip around the rim, much the gasping zaika’s delight. If she thinks this is good, wait until she finds out what you have planned.");
	//Mischiev
	else output(" You hold it up to your cheek and lock eyes with its inhuman owner, pretending for a moment that you want nothing more than her filthy tailpendage on your [pc.skinFurScales]. She’s gasping by the time you tired of the ploy.\n\nIf she thinks that was good, she’s going to lose her mind when she discovers what you have planned.");
	//merge
	output("\n\n" + (!pc.isCrotchExposed() ? "Peeling your way out of your [pc.crotchCovers] and l":"L") + "ining your bare crotch up with the zaika’s" + (pc.tallness <= 5*12 ? " (with the assistance of a nearby box)":"") + ", you give her a moment to appreciate the flushing surfaces of your [pc.multiCunt] and [pc.clits] before forcing her to feel them in the most direct way possible. You press yourself to her, clam" + (pc.hasVaginas() ? "s":"") + "-to-clam, and introduce her to the art of tribbing in the most direct" + (pc.wettestVaginalWetness() >= 4 ? ", wettest":"") + " way possible. Slick netherlips slide against squirming alien slot as you silently lock eyes. Her pinkish cheeks redden delightfully while you watch, and her pupils dilate slightly from the excitement.");
	output("\n\nHas a greedy thief ever looked so sexy and vulnerable at the same time?");
	output("\n\nYou’re not sure.");
	output("\n\nThe tail in your hand throbs in your grip. It’s engorging strangely, fattening up nicely. The ripened end blooms like a flower in spring, only this flower’s nectar is a perverse reproductive brew. Your confident presence must be having an effect on it, coercing it into taking a submissive, fuckable role. That’s fine by you. <i>“You want to use this?”</i> you ask, continuing to gyrate against the whimpering miscreant without a care. <i>“You want me to fuck this too?”</i>");
	output("\n\n<i>“Yesssss,”</i> the simpering slut hisses. She bites her lip to stifle any further response, apparently too proud to let herself go.");
	output("\n\nYou can fix that. All it takes is " + (pc.legCount > 1 ? "passing her weeping tailcunt under your [pc.thigh] and sliding":"threading her weeping tailcunt") + " into place between your conjoined crotches. Surrounded by " + num2Text((pc.vaginaTotal()+1)) + " weeping twats, the fully-blossomed bulb scissors closed into a tight, cunt-pleasing knot. You grab the stalk, and the zaika’s attempts to muffle herself fail completely. She squeaks with joy. When you pull it down, submerging her pussy-toting-phallus in rich, juicing quims, she moans like a whore.");
	output("\n\nYou join her.");
	output("\n\nDhaal’s cacophony of digitized advertisements and busy city life ensures that nobody will notice anyway, and if they do, who cares? There’s nothing wrong with ");
	if(!pc.hasCock()) output("two girls");
	else output("a " + pc.mf("cuntboy","herm") + " and a girl");
	output(" burning off a little post-scrap energy by humping their hot, sensuous femininities around a nice, cum-rich cock. Your hips roll and slide against each other’s in a nameless dance that nonetheless follows its own urgent, surging rhythm. How could anyone want anything less?");
	//hascock
	if(pc.hasCock()) 
	{
		output("\n\nPushing the exotic endowment higher only heightens your enjoyment. Not only does it slide through your tribbing gates but it also frots wonderfully against your [pc.multiCocks]." + (pc.hasCocks() ? " You surround it with maleness":" You press against it with your maleness") + ", grunting and groaning as the sweat-and-pussy-slick genitalia blends together into such a strong onslaught of sensation that you lose the ability to discern the fine details of your pleasure. A lesser [pc.manWoman] would probably pop on the spot, but you ride the tide of joyous friction for as long as you can.");
	}
	//merge
	output("\n\nYour tongue lolls out");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
	{
		if(pc.biggestTitSize() >= 3) output(" into your cleavage");
		else output(" onto your chest");
	}
	output(", but you let it.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.biggestTitSize() >= 1) output(" It takes too much effort to move it for too little gain, and the salty flavor of your own sweat-dampened cleavage somehow makes the friction between your thighs even more urgent.");
	else output(" Let her see. It takes too much effort to reel it back in.");
	output(" You’re going to show this milk thief what it means to fuck a Rusher. You grind harder against her, making her butt bubble out to the sides as its squished against the wall. Let this be her introduction to the UGC.");
	output("\n\nThe coming orgasm will be her orientation.");
	output("\n\n<i>“N-n-no! It’s too good!”</i> the once-proud zaika says, but as she speaks, you can feel her tail thrusting on its own, perfectly in sync with your hand’s guidance. <i>“Sex with a Peer can’t even be this good! You xeno sluts are g-g-onna break us!”</i> Faster and faster, that rogue organ races. It bumps across your [pc.clits] and flosses through your [pc.vagina]. There’s no missing when it swells with oncoming orgasm.");
	output("\n\nDo you let her cum there" + (pc.hasCuntTail() ? ", in your tail":"") + ", or stuff it in her mouth?");
	processTime(15);
	pc.changeLust(45);
	//[Cum There] [Her Mouth][YourTail]
	clearMenu();
	addButton(0,"Cum There",cumAsZaikaIs,undefined,"Cum There","Let her cum with her tail between you. You’ll probably get messy.");
	addButton(1,"Her Mouth",zaikaTailInZaikaMouf,undefined,"Her Mouth","Let her deal with her own mess!");
	if(pc.hasCuntTail()) addButton(2,"Your Tail",takeItInZeCuntTail,undefined,"Your Tail","Tails were meant to fuck tails!");
	else addDisabledButton(2,"Locked","Locked","You require a parasitic vagina-tail for this.");
}

//Tailpuss
public function takeItInZeCuntTail():void
{
	clearOutput();
	showMilkThief(true);
	author("Fenoxo");
	output("Time to give her a treat. You let your [pc.tailCunt] snake around your waist and dive down onto the spasming alien prong, swallowing it up with a burst of sensation so intense that your pleasure matches and then exceeds the milk thief’s own, driving you to near instantaneous climax.");
	if(pc.hasCock()) output(" Jets of [pc.cumNoun] spray all over your tail and her belly, but they might as well be someone else’s.");
	output(" The parasitic tube’s peristaltic gyrations are so much more powerful than your real vagina" + (pc.hasVaginas() ? "s":"") + ", and now that you’ve stopped trying to suppress its urges, they’ve somehow supplanted your own.");
	output("\n\nYou <b>want the cum.</b> You want to lay eggs. You want to squeeze so much cum out of her that you spend the next week pumping helplessly climaxing as your bloated tail lays dozens upon dozens of eggs. Stumbling sideways, your crotch detaches from the zaika’s sopping loins, but your tail holds firm. It milks the first ");
	if(enemy.breastRows[0].breastRating() == 2) output("blobby");
	else if(enemy.breastRows[0].breastRating() == 8) output("virile");
	else output("distending");
	output(" lances with a pernicious sense of glee. By the time the second shot rockets into your captivating appendage, your tail is pumping up and down of its own accord, putting eons of evolution into moving in precisely the right manner in order to obtain as much of its preferred food as possible.");
	output("\n\nThe thief sinks to her knees first, and you follow soon after, watching her ");
	if(enemy.breastRows[0].breastRating() == 2) output("breasts shrink down to tiny bee-stings.");
	else if(enemy.breastRows[0].breastRating() == 8) output("lovely breasts gradually give up two or three cup sizes to feed your parasite’s insatiable hunger.");
	else output("cow-grade tits wobble and drop cup size after cup size as they flood your parasite’s innards with what feels like gallons of semen.");
	output(" Aside from fluid gurgles and ecstatic gasps, the alcove is silent. The tails are fucking now, and that’s the way of things here. You just get to enjoy it.");
	output("\n\nOnly after slurping heedlessly against a dry tail-cock does the flexible tentacle’s space in your mind seem to recede. You blush as hard as the zaika while you pry your creampied tailcunt off of wriggling prick, yet expression holds nothing but warmth for you.");
	output("\n\n<i>“You... you may be strangers with strange bodies and stranger mores, but all it takes is the right tail to make you stop banging like a barbarian...”</i> She smiles, warmed by post-orgasmic glow. <i>“I’m glad you beat me.”</i>");
	output("\n\nYou are too.");
	processTime(6);
	pc.orgasm();
	feedCuntSnake(enemy);
	output("\n\n");
	CombatManager.genericVictory();
}

//Her mouth
public function zaikaTailInZaikaMouf():void
{
	clearOutput();
	showMilkThief(true);
	author("Fenoxo");
	output("You don’t need to be any messier. Yanking the zaika’s tail down and away from your tribbing twats, you twist it up and around until it’s right in front of her face. The lust-drunk milk-thief watches as dumbly for a second until you thrust it into her lips.");
	output("\n\nShe cums right on cue.");
	output("\n\nRich zaika seed ");
	if(enemy.breastRows[0].breastRating() == 2) output("flows up the flexible shaft and into her maw, forcing her to take swallow after swallow as her diminutive boobs shrink down to petite bee-stings.");
	else if(enemy.breastRows[0].breastRating() == 8) output("floods her cheeks, forcing her to take loud gulps to keep up with the flow. Even then, beads of cream jism dribble from the edges of her plugged maw well before her breasts finish dropping a cup size or two.");
	else output("bulges the stalk of her tail obscenely as it forcibly snakes deeper into her maw, plugging itself directly into her esophagus. Just in time too! If the bulges straining her gob into wide-open acceptance are anything to go by, a gut-flooding load like that would’ve blasted back out of her nostrils. Instead, she acquires a lovely cum-bump long before her enormous breasts finish shrinking down to F-cups.");
	output("\n\nThe powerfully erotic sight almost distracts you from your increasingly impassioned thrusts. Your body abandons the rhythm it once adhered to in order to grind your [pc.hips] against her as rapidly as possible. You twitch faster than a bellydancer, gyrating on instinct more than thought, crying out in absurd joy when you finally get the chance to join her in insensate bliss. You don’t even mind when you stumble away and cut the pleasure short. This was... satisfying.");
	output("\n\nThe sputtering thief tugs her tail out of her mouth with a curse, but you pay her no mind as you gather your things, not until she dares to grab your [pc.foot]. You look down at her cum-streaked face as she pants with her tail still violently twitching in her hand, even if it’s no longer pumping anything out. <i>“");
	if(pc.isBimbo() || pc.isBro() || !pc.isNice()) output("Don’t pretend you didn’t love every second of it.");
	else output("You liked it, didn’t you? I’m pretty sure dicks don’t twitch like that unless you really, truly loved every second of it.");
	output("”</i>");
	output("\n\nShe refuses to meet your eyes, but her blush deepens further.");
	output("\n\nFigures.\n\n");
	processTime(6);
	enemy.loadInMouth(enemy);
	CombatManager.genericVictory();
}

//Cum There
public function cumAsZaikaIs():void
{
	clearOutput();
	showMilkThief(true);
	author("Fenoxo");
	output("Feeling generous, you let the zaika achieve orgasm right where she is. Hot cum pumps out of her swelling organ, bursting out across ");
	if(pc.bellyRating() >= 40) output("the underside of your [pc.belly]");
	else if(pc.biggestTitSize() >= 3) output("your [pc.belly] and underbust");
	else output("your [pc.belly]");
	output(". With each potent ejaculation, the milk thief’s ");
	if(enemy.breastRows[0].breastRating() == 2) output("petite");
	else if(enemy.breastRows[0].breastRating() == 8) output("well-rounded");
	else output("considerable");
	output(" bust shrinks in a bizarre quirk of her alien anatomy. She’s not just cumming - she’s emptying the volume of her breasts in pure, creamy spunk.");

	//Smoltid
	if(enemy.breastRows[0].breastRating() == 2) {
		output("\n\nSadly, the defeated milker’s not exactly packing much up top. Her tits deflated into barely bee-stings, their volume wasted across your tummy and cuntlips. Still, there’s enough syrupy semen to make loud squelches with every passionate swivel of your hips as you race toward a climax of your own. You trib and grind through the mess until the zaika is quivering like she’s about to seize and you can’t quite control your hips anymore. You pound the thief into the wall with hammer-like strokes, battering her pussy and cock alike until you lose all control and stumble apart" + ((pc.hasCock() || pc.isSquirter()) ? ", squirting on the alley floor":"") + ".");
	}
	//medtid
	else if(enemy.breastRows[0].breastRating() == 8)
	{
		output("\n\nHuge blobs of spermy goodness roll across your tender netherlips, all but glueing your conjoined cunt" + (pc.hasVaginas() ? "s":"") + " to the defeated milker’s. It feels steaming hot to your sensitized skin, but in the best way possible. You smear the cum everywhere while you hump, chasing a climax of your own while the zaika throbs and dribbles. There seems to be no end to her reserves, not even when her breasts diminish to petite B-cups and her eyes roll so far back that you can see the circuits built into their backsides.");
		output("\n\nThe powerfully erotic sight almost distracts you from your increasingly impassioned thrusts. Your body abandons the rhythm it once adhered to in order to smash your [pc.hips] as violently against the thief’s as possible. You hammer her into the wall with bruising force, crying out in absurd joy when you finally get the chance to join her in insensate bliss. You don’t even mind when you stumble away with her cocktail glued to your crotch, leaking the last of its dregs onto your vulva.");
		output("\n\nAfter all that, it deserves the treat.");
	}
	//bigtid
	else
	{
		output("\n\nQuarts of spermy goodness do more than drench you. They <i>saturate</i> you");
		if(pc.hasFur() || pc.hasFeathers()) output(", absorbing so deeply into your " + (pc.hasFur() ? "fur":"feathers") + " that you feel more sponge than person, drenching you so thoroughly that your lower body almost instantly becomes a mass of thick, blobby white");
		output(". It feels so good that you almost attain your own climax on the spot; it feels like someone’s dumping bottle after bottle of pre-warmed lube over your simmering genitals. A galotian would be jealous of this level of wetness - and probably of this amount of cum.");
		output("\n\nYou don’t have a chance to think about kissing the zaika. Your body just does it. You lean forward and engage her in the deepest french you can manage, letting your eyes drift closed as you cum to the feeling of bathing in her spunk. The alley goes quiet save for the sloppy sounds of two ecstatic sluts smearing saliva, jism, and [pc.girlCum] against one another with wild abandon. A deep puddle forms under your feet, but neither of you minds in the slightest, not when there’s more pressing matters, like the heavenly texture of her skin.");
		output("\n\nIf you weren’t holding on so tightly, you might have tumbled away from the gifted thief at the apex of your pleasure. Instead, you spent every second of it in blissful embrace. When you do choose to let her go, she sinks to her knees in quiet submission, and though the zaika’s chest is still quite large, her breasts have diminished to nearly-normal E-cups.");
	}
	//merge
	output("\n\nRopey webs of spent seed cling to the fallen rogue’s thighs as she pants for breath.");
	//Bimbo
	if(pc.isBimbo()) output("\n\n<i>“See? Told you I’d give you a great orgasm. Maybe next time, you should try asking nicely! Lots of girls like getting milked, silly.”</i>\n\nHer expression remains confused as you gather your things and leave.");
	//Bro
	else if(pc.isBro()) output("\n\n<i>“That’s a good look on you,”</i> you dismissively grunt as you gather your things and leave the pacified alien to clean up the mess. You toss her tail’s covering in a trashcan after you get around the corner. She won’t be needing it any time soon.");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“See?”</i> you say through your own gasps. <i>“Everything goes so much more smoothly when we put the weapons down.”</i> You gather your things and leave the thirsty cyborg to ponder the life choices that led her here.");
	//Misch
	else if(pc.isMischievous()) output("\n\n<i>“Told ya I’m make you cum, and from the sounds of it, it’s an experience you’re not going to forget for a long, long time.”</i> You give the thirsty cyborg a wink and a wave as you gather your things, secretly thrilling at the way she blushes when you stride away.");
	//Hard
	else output("\n\n<i>“Next time you see me, don’t waste my time with a fight.”</i> You grab your things and glare down at her until she nods meekly, then leave the alcove.");
	processTime(6);
	pc.applyCumSoaked();
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Fuck Tail]
// Tooltip1: <i>“{bimbo: I heard all about your tails, elfy-ears! Lemme use it as a big cocksock, c’mon it’ll feel super good!/ bro: Nice tail. How much me can fit in there?/ else: I can be convinced to let you go, but your tail’s gonna do the talking on that one.}”</i>
// Tooltip2: There’ll be no tail fucking this Dhaaling <b>without a penis!</b> Get you one.
// Tooltip3: Zaika tails are capacitive organs, but you’re much too hyper to wear one out in your current state. <b>Get some dick-diminishing drugs and try later!</b>
// Taur compatible. Somewhat hyper compatible, really stuff that bitch’s tail. Can take up to three feet of cock? Yum. That thing’ll never close up again after I’m done HEH HEH HEH. From to Adj’s Ganger scene, around 4-feet dicks are the max I interpreted, so capacity does matter. Should still run it by him.
// Option to let her drink if you’re lactating.
// reminder that I use {titsSmall, titsMed, and titsBig} to differentiate the thieves from ‘controlled’ to ‘horny’ to ‘depraved’.
// reminder to use penisRouter

public function titsSmall():Boolean { return (enemy.breastRows[0].breastRating() == 2); }
public function titsMed():Boolean { return (enemy.breastRows[0].breastRating() == 8); }
public function titsBig():Boolean { return (enemy.breastRows[0].breastRating() == 33); }

public function fuckHerTailBuddddeh(x:int):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	output("<i>“");
	if(titsSmall()) output("V-Very well, off-worlder!");
	else if(titsMed()) output("You read my mind, alien!");
	else output("Perfect! I’m so ready!");
	output("”</i> the rosy girl answers, glancing nervously to the surroundings. Your previous scrape has drawn a jeering crowd expecting indecent entertainment. All of a sudden she bolts up and runs into your [pc.arms], nervous as hell. <i>“W-Well, let’s not do it out here!”</i> hisses the blushing bandit, pretending to be a lover driven by certain fantasies. <i>“There’s no guarantee we won’t get gangbanged! Um, please?”</i>");
	if(pc.exhibitionism() < 33 && pc.libido() < 33) output("\n\nSounds like she’s as much of a prude as you are. At least you are of one mind on something.");
	else output("\n\nIs that a hint of prudishness you’re detecting? Might as well heed her. Can’t breed if you’re too stressed.");
	output("\n\nThus you follow her down the side-street. Sensing it wouldn’t be wise to let <i>her choose</i> the location, you pull her into the second alley by her shoulders! The Gyre will not see what transpires here.");
	if(pc.isTaur()) output(" It’s a bit of an awkward fit for your ‘taur frame, but you make it work. Worst case scenario you might have to do a bit of wall-running to perform a one-eighty. No biggie.");
	output(" Setting back down, the would-be she-bandit");
	if(titsSmall()) output(" titters, blowing out her lips into a plump and teasing expression.");
	else output("’s tongue traces her lips with a shameless anticipation. If she’s this excited from kneeling in her conqueror’s presence, who knows what some cock will do?");

	output("\n\nWhile her fluorescent eyes" + (!pc.isCrotchExposed() ? " drink in the swelling bulge of dickmeat at your crotch":" roam the veiny [pc.cockColor " + x + "] texture of erecting dickskin on offer") + ", yours are following the lilac zaika’s fingers to the fasteners on her kit. The see-through bodysuit comes off like a calling curtain, or more aptly, pretty much the whole stage given the amount of gear detaching. Glad to see that they observe the rules of nature as much as everyone else in the galaxy. ");
	if(!pc.isCrotchExposed())
	{
		output("In mere seconds you have all the obstructions around your [pc.cocks] out of the way, just enough for " + (!pc.hasCocks() ? "it":"them") + " to proudly swing free" + (pc.balls > 0 ? " and your [pc.sack] to flop out":"") + ". Wouldn’t want to present anyone (or anything!) around here a chance to steal your stuff while you’re busy getting some tail.");
	}
	else output("Lacking any personal modesty, you needn’t do more than lovingly pump your [pc.cocks] until" + (!pc.hasCocks() ? " its erect shape is":" their stiffened shapes are") + " casting a darker shadow over the twilight alien.");

	if(pc.hasCocks() || (pc.hasCockTail() && pc.tailCount > 1)) 
	{
		output("\n\n<i>“Oh my, a Rusher that is also a hydra - you have more than one tail!”</i> she remarks, watching you stiffen in real time. <i>“Isn’t that a bit much? Does having additional tails really make a difference?”</i>");
		output("\n\nShe gets an answer in the form of a slight smile.");
	}
	// pc Chosen Cock Size <7
	if(pc.cocks[x].cLength() < 7)
	{
		output("\n\nThe girl kneeling at your [pc.footOrFeet] blinks a few times, evidently (and mockingly) unimpressed with the penis you’re hefting in her direction. <i>“I won’t even feel that!”</i> she blurts, excitement dimming with the photoreceptors in her mechanical eyes. <i>“How am I supposed to enjoy this? All you Rushers are supposed to be obsessed with oversizing your bodies!");
		if(pc.biggestCockLength() > pc.cocks[x].cLength()) output(" Why not the larger one...?");
		output("”</i> Her tail whips angrily atop the pavement. <i>“Eh, maybe that’s how it is for your kind; some don’t work, huh? Tiny little egg-holes and back-holes strain around tinier things!”</i> The supple band of her pussy-cock uncoils from her waist, seemingly satisfied that it won’t be getting it as hard as she might from a vengeful member of her own race.");
		if(pc.biggestCockLength() > pc.cocks[x].cLength()) output(" <i>“Or maybe you think you’re doing me a favor?”</i>");
		output("\n\n<i>“Oh whatever,”</i> she sighs, at once removing her purple cocksock and tugging the ring over her vaginal sheathe. The mouth of her tail opens with a lovely breath of cloying moisture, endless inches of inviting pinkness waiting to swallow all you’ve got. <i>“I’m gonna get my enjoyment’s worth out of this if it kills me.”</i> Her appendage drifts towards your groin to lay lacquering kisses of soaking-wet preparation on your ‘tail’. <i>“Get nice and hard for me like a silly Rusher should,”</i> she giggles, and hells, you do! <i>“Nice and hard so I can milk");
		if(pc.balls > 0) 
		{
			output(" that ");
			if(pc.ballDiameter() <= 2) output("little teeny");
			else if(pc.ballDiameter() <= 5) output("big yummy");
			else output("fat");
			output(" milk-pouch of yours");
		}
		else output(" this wibbly-wobbly lil thing"); //timey wimey
		output(".”</i>");
		output("\n\nCoated in the honey-slick weepings of her pussyjuices" + ((pc.isBimbo() || pc.isBro()) ? " (mmm)":"") + ", she reels back and sticks her tongue out. <i>“You won, so slide right in! Maybe if you can ‘do’ as well as you fight, I may get off. Rushers have a lot in common with our biggest sluts, so hit me with all you’ve got! Fuck me like you’ve fucked everyone who’s dared to stand against you!”</i>");
		if(pc.isBimbo()) output("\n\nSo rude! You’ll show her that <b>all</b> cocks are good!");
		else if(pc.isBro()) output("\n\nBitch. She’s about to get a lesson in how her superiors fuck.");
		else output("You roll your eyes - there’s more to sex than length.");
	}
	// pc Chosen Cock Size <14
	else if(pc.cocks[x].cLength() < 14)
	{
		output("\n\nYou throb a little bit harder having the undimmed eyes of your defeated foe ogling your package. Her slithering appendage perches on a shoulder, held in check by a cock-blocking ring. <i>“Ah of course, most off-worlders are generally that hung,”</i> she comments neutrally, but at the ends of her words you detect the fry of sensual intimacy. <i>“Your kind are odd. That would be too much for the average egg-bearer, wouldn’t it? So why does every Rusher have to have something oversized for their bodies and their mates? It certainly wasn’t to screw around with natives... was it? No matter, I guess that’s fine. At least I’ll feel something. Besides, it’s what makes all of you so hot, how desperately you try to sexually outdo one another!”</i> She smiles smugly, pulling the silky orchid sock from her bulb tip. <i>“I’ve seen all your videos, so don’t even deny it!”</i>");
		output("\n\nShe grins wickedly, pearly fangs pressing into the wine-black texture of her lips. The spongy tether of her multi-talented tail swings around as she divests it of its compressing ring. The cleft opens like a fruit, ambient neon illuminating the organic onahole’s pleasure-pink interior, sopping smoothness begging for something to suck on. Juicy spatters of hot honey land on your shaft, oozing curtains of sexual preparedness draping over your completely rigid member. It pulls back teasingly, hovering near a flushed cheek.");
		output("\n\n<i>“You won. Have at my tail, Rusher-[pc.boyGirl]. Let’s see if you do as well you fight!”</i>");
		if(pc.isBimbo()) output("\n\nOf course you can! Time to teach this meanie a lesson!");
		else if(pc.isBro()) output("\n\nYou’ll do more than that.");
		else output("Don’t mind if you do!");
	}
	// pc Chosen Cock Size <21
	else if(pc.cocks[x].cLength() < 21)
	{
		output("\n\nBlood fills your [pc.cock " + x + "] dizzyingly fast with iron pressure, and the inflated [pc.cockHead " + x + "] thickens out far enough to");
		if(pc.isTaur()) output(" graze the techie’s cheek now pre-smeared cheek");
		else output(" lay in the luminous locks of her [enemy.hair], drooling bounteous pre");
		output(". <i>“Oooh...”</i> marvels your predator-turned-prey, peeking around the girthy mass of [pc.dickSkin " + x + "]. <i>“That’s a tail to be proud of, but nowhere near as long as ours!”</i> A huff and fanged smirk. Her bulb-tipped tenta-tendril coils itself like a resting snake on her shoulder as she pulls the heavy cockring off. Off-white slickness drools from the cusp of her cloaca’s parted lips. Within is a gluttonous pink cradle, gloss plushiness promising to drain every drop.");
		output("\n\nIt blushes nearly the same color as she does.");
		output("\n\n<i>“Looks like I’m going to be milking you after all!”</i> The spongy texture of her head drifts forward to spread its lewd, room-temperature moisture across the unyielding surface of your mammoth hardness. <i>“Let’s see how far you make it... and how long you last. One thing I’ve noticed about oversized Rushers is they don’t last! It’d be sooo sad if you couldn’t hold on while doing me, wouldn’t it? Big, strong fighter who can’t keep it up for more than a minute or two...”</i> She giggles; her gives your [pc.cockHead " + x + "] a few love-taps.");
		if(pc.isBimbo()) output("\n\nPsh! You can last longer than everyone on this planet put together!");
		else if(pc.isBro()) output("\n\nThe only one needing to worry about stamina is her.");
		else output("\n\nIt’s not your endurance that needs to be questioned here.");
	}
	// pc Chosen Cock Size <31
	else if(pc.cocks[x].cLength() < 31)
	{
		output("\n\nIt’s cute seeing the zaika’s blossoming blush deepen into an appropriately humbled hue. Not only does your ");
		//parsecock, see if contains stallion - next variant based on this: 
		var cocky:String = ParseText("[pc.cock " + x + "]");
		output(cocky + " brush up against her cheek in a ");
		if(cocky.indexOf("stallion") == -1 && pc.isTaur()) output("stallion");
		else if(cocky.indexOf("porn") == -1) output("pornstar");
		else output("support beam");
		output("-shaming achievement of perpendicularity, the sheer weight of your rigid organ draping over her scalp is transforming her comfortable prostration into a restless stress position. Dispelling her mocking assurance that you’d be some typical Rusher was even better. You’re packing a totem pole of a dick that’s going to challenge the elasticity of her spongy cock-milker and she knows it. Its raw power drums into her mind at the urgent beating of your heart.");
		output("\n\n<i>“Oh - that’s large. How aren’t you stuck in place by this monstrosity, off-worlder?”</i> That question turns out to be a time killer: she’s already pulling the silky orchid covering and associated cockring off her tail and twisting the dripping, rubbery sinew around your gargantuan shaft. The oil-slickness of her appendage’s precum lathers your hypersexual pillar in butterflies of sheening prelube. <i>“Mmmyes, almost as good as the one in that popular video that pleasure pits like to play. Love how big aliens wanna get themselves, all trying to prove something, all trying to be better than the other slut. That’s what makes you Rushers so desirable,”</i> she purrs, fingers gingerly idolizing the length of your veiny beast. <i>“Gonna take this nice and deep. Gonna milk your dick really good...”</i>");
		if(pc.isBimbo()) output("\n\nYou can’t wait!");
		else if(pc.isBro()) output("\n\nHope so. For her sake, anyway.");
		else output("\n\nShe should have started with this!");
	}
	// pc Chosen Cock Size >32
	else
	{
		//big chungus!
		output("\n\nThe inexorable advance of the mythological obscenity you call a [pc.cockNoun " + x + "] is rapidly changing the larcenous zaika’s outlook on life. Inflating past footlong territory and blowing through double that. It comfortably sits at a whole three feet of genitail-destroying girth");
		if(pc.cocks[x].cLength() >= 33) output(" until the presses of the [pc.cockHead " + x + "] to her cheek renew its unyielding growth");
		output(". She goes from kneeling to sitting on the peak of her ass, hefting the veiny weight of your immense pole. [pc.CockType " + x +"] dick throbs in her palms, and so it seems, she’s at a complete loss for words. <i>“U-Umm, wow... a-are you really...”</i>");
		output("\n\nHer expression turns prideful, and, shivering in delight, she yanks off the subjugating ring from her cloaca’s neck, blushing all the fiercer as orchid hosiery drifts to the asphalt. <i>“I’ve never seen something so big! No one else has a cock like this. I thought all the videos were fake but you really put The Big Lurch to shame!”</i> Her tail anxiously wriggles around your thickness like a strawberry-wine wedding band, viscous spurts of knob polish warming your fuck-truncheon with waves of indecent moisture. <i>“There must be a lot of milk in this. That’s what size means in your environments right? The bigger they are, the more they make! Yes, right?”</i> S-Something like that. Arching back, you feel the perfect petals of her vine-mounted maw laying sloppy kisses on the full scope of your [pc.cock " + x + "], from [pc.knotOrSheath " + x + "] to [pc.cockHead " + x + "].");
		output("\n\n<i>“Don’t keep me waiting, off-worlder. I wanna milk you so bad!”</i> Completely exposed and horny as hell besides, the zaika thief shudders at your reactive throbs" + (pc.balls > 0 ? ", stealing glances at your bobbing ballsack":"") + ". <i>“This will be so worth it! I’ll have gotten fucked by the biggest alien tail, and nobody else!”</i>");
		if(pc.isBimbo()) output("\n\nGlad she likes ‘em big!");
		else if(pc.isBro() || pc.isAss()) output("\n\nIf it makes her happy, you’ll let her believe that.");
		else output("\n\nWell, if it makes her happy...");
	}
	pc.cockChange();
	// merge
	output("\n\nPlanting your [pc.footOrFeet], you grant her permission to begin. Fresh bliss connects to your [pc.cockHead " + x + "] like an electrical current, neon lights flashing behind your retinas. The apple-sized peak of her cloacal limb bumps against your urethral slit with a coaxing interest. The upper rim of its sluttily pursed maw swirls the most sensitive parts of your glans until, with a smile above and below, she-slash-it");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED)) output(" is impaled on your pointed fuck-pole, sweeping your [pc.cockColor " + x + "] breed-stick into an exotic pleasure experience");
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" stretches around the ram’s head of your billowing flare and seals down on the narrowness behind it - the cum-plugging saucer bulges the interior of her muscled tail rather nicely");
	else output(" sucks your" + (pc.cocks[x].cLength() >= 31 ? " massive":"") + " bulk into a place where fervent arousal literally pours off the walls");
	output(".");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) || pc.cocks[x].hasFlag(GLOBAL.FLAG_SPIKED)) output(" Once it’s gobbled up your ardor-fattened cock, the pliant organ begins to pleasure-seize, not expecting the rush of swabbing bliss that would follow within its malleable gullet.");
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_BASED)) output(" Once your tendril-equipped penis is quaffed, her tail immediately ‘regrets’ that decision. Trapped in the thirsty, coiling folds of her oral-like interior, your venomous stingers lash the walls of velvet invitation and introduce her to a world of pleasure that can’t be experienced naturally on Dhaal.");
	output("\n\nSweat rolls down your brow, droplets beating against your [pc.chestNoun] like a harsh ray of sunlight. Your [pc.hands] tighten as you gasp through clenched teeth. The otherworldly sensations of bucking into the tireless suction of alien tenta-cunt" + (pc.cocks[x].cLength() < 23 ? " as it flails and struggles to clench and squeeze your double-thick boner to the hilt":" thrashing and pumping two or three inches of overwhelming dick into its maw at a time") + " leave you breathless and panting.");
	// pc Rut
	if(pc.inRut()) 
	{
		output("\n\n<i>“Euch... that smell, w-what is that odor? I’ve never... sensed such... such...”</i> Stumbling for words and shivering in delight, it’s not just the zaika clinging to sanity. Her long, flickering ears fold back and her tongue hangs limp, awash in the sea of your rut-charged pheromones. The longer, muscled inches of her tail seem more sway to the aerial broadcast of breeding instinct. Although unused to the effects, her eagerness to become an off-worlder’s flexible fuck-puppet is clearly demonstrated by the frenzied need to be fertilized scouring through her.");
		output("\n\nFirst her tail, then the egg-slot. Just to make sure you have the best odds.");
		output("\n\n<i>“...Such depravity! I love it, oh I love it!!”</i>");
	}
	// merge
	output("\n\nOver a course of inconsistent thrusts and wanton moans, three feet of squelching tail-pussy draws you into a palace of omnipresent pleasure. From every direction it feels like a tongue is lapping and dragging and rasping and coiling on your slotted meat. Seemingly devastated by the passion of your overstimulated twitchings, the milk-thief’s chest subtly swells from the carnal attention");
	if(titsSmall()) output(", additional liquid ounces filling her petite bust with all the sensitivity that accompanies blossoming lust.");
	else if(titsMed()) output(". She quivers helplessly, every mental and motor function set on enveloping your dick.");
	else output(". Each sloshing, quaking orbit makes her eyes roll back above sharp, euphoric exultations. It’s going to be a game between her jiggling rack and your dick what makes her cum the most of her brains out.");

	// pc Chosen Cock Size >24
	if(pc.cocks[x].cLength() > 24)
	{
		output("\n\nYet there’s more to go. The enormous nerve clusters of [pc.dickSkin " + x + "] already swallowed light up with delight, their brethren jamming into utterly strained tentacle-hole. Instead of stalling or allowing fatigue to arrest its inexorable progress, inner contractions snake her talented tail closer to your pubic mound when rational control fails. Gorged to asphyxiated obesity by the sheer amount of ");
		if(pc.isHerm()) output("herm");
		else output(pc.mf("man","girl"));
		output("-beef, her tail undulates like mad, lurid slaps and wet thwacks squeezing you into the overstuffed fuck-hole, more, and more, until, finally, your [pc.cockNoun " + x + "] reaches its destination. The thickness of her organ, stretched into a happy festival balloon, looks ready to pop.");
	}
	// merge
	output("\n\n<i>“Aaaaahahhhhhhhh!”</i> the girl moans; the gelatinous-mouth of her vine-like appendage ‘bites’ down on your root");
	if(pc.hasKnot(x) && pc.hasSheath(x)) output(" after crossing the wide bulk of your knot, sliding on the slippery folds of your crinkled prick-sheath");
	else if(pc.hasKnot(x)) output(" after vaulting the angry barrier of your [pc.knot " + x + "]");
	else if(pc.hasSheath(x)) output(", plush lips slipping and sliding on the wrinkled folds of your protective sheath");
	output(".");
	if(pc.cocks[x].cLength() < 7) output(" You’re hardly that deep inside, but each inch fed into the living masturbatorium felt like three. At once. One look at how snugly fit you are in the tension-narrowed embrace, however, erases any lingering impotence.");
	else if(pc.cocks[x].cLength() < 14) output(" You’re a quarter deep inside the vast length of her tail-tunnel. Any pang of inadequacy you feel is quickly drowned out by what feels like four pussies’ worth of pleasure in the titillated tail-gut sucking on your loins.");
	else if(pc.cocks[x].cLength() < 21) output(" A little over halfway inside the zaika’s tail-tunnel, you marvel at the distended copy of yourself apparent through the outer skin, knowing that your awareness is about to be ejected straight off the planet when she gets started.");
	else if(pc.cocks[x].cLength() < 31) output(" There was almost too much cock for the lilac creature to handle, but here she is, oriented physically and mentally in another direction while three quarters of her very accommodating tail warmly pulse around your enormous tool.");
	else output(" There’s a sort of bump you feel when she shifts, and you can only deduce that to be the entrance to her egg-compartment. You’re bulging out the entirety of this zaika’s tail, choking every last inch of fuckable muff-tendril. Definitely a magnificent race!");
	output("\n\nYou slowly rock back and forth, a provocative sway that injects electrifying pleasure into every part of your body. Thirty-some inches of exotic muscle follows suit, transfixed by its death grip on your [pc.base " + x + "].");
	//hasBalls&notuniball:
	if(pc.balls > 0 && !pc.hasStatusEffect("Uniball")) output(" The motion sets your [pc.sack] to swinging, and it lurches up to slap into the cloaca-maw’s rubbery underlip. In fact, each movement disturbs the musky terrain between scrotum and penis: its involuntary nursings augment the pleasure by a significant factor.");
	output(" <i>“Ohhh wow.... ");
	if(pc.cocks[x].cLength() < 7) output("For as small as you are, that’s something else! You’re so hard and the throb is... is... Wow!");
	else if(pc.cocks[x].cLength() < 14) output("Maybe that’s just the right size! It teases me like it’s gonna go so much further, but it’s only... there! Oomph!");
	else output("Look at how badly my tail is stretched! It’s never gonna close again! I’ll need to pay out the rump for plasticity mods! And y’know what else? I’m gonna love spending that money just as much as I’m gonna love you breaking me apart!");
	output("”</i>");
	output("\n\nGlad to hear it.");
	processTime(25);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",fuckZaikaTailOnWinPart2,x);
}

public function fuckZaikaTailOnWinPart2(x:int):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	output("The zaika’s indulgent acceptance of your [pc.cock " + x + "] deserves a reward. On that note, you reach down and foist her up, finding purchase on arms that can only react by looping about your nape and clinging tight. You use the opportunity to push her back into a wall, ending up face-to-face with the strawberry fae, letting out a feral gasp into her neck, biting down on her shoulder with absolute relish.");
	output("\n\nIt’s because of her tail. That glorious, fat-headed bundle of mind-melting muscle. Its firm innards are squirming, twisting and winding with a frightening quality. Quivering stickiness unbinds like a finger trap, pulling back just enough to emulate the oral suction of a thousand lungs all at once, angled downwind an enlarged vinculum.");
	if(pc.cockTotal() > 2) output(" The rest of your cocks ‘wap’");
	else output(" Your other dick ‘plap’s");
	output(" harmlessly against the poon-balloon’s luscious exterior.");
	output(" Even though you’ve got her pinned against the wall, it makes your [pc.legOrLegs] tremble bonelessly. Those decompressing sucks occur on maddening repeat, and again you chomp to cope, leaving cherry-red marks of your fierce mating behind, not caring where you do it. There’s no telling where her synthetic skin begins and ends, and that stuff is built to take a beating. Some chewing hasn’t marred the artisanal beauty of your latest screw so far.");
	output("\n\nEvery glob of precum you spurt into her breeding tube joins the lakes of dripping goo coating you in hot, streaming gouts. Simmering shellac washes over your nerve-tender [pc.cockNoun " + x + "] as if it were a sugary treat swishing and swashing in a pair of drooling cheeks. Right on top of the palate and tastefully enjoyed. Your flavor must be the most savory of any who’ve been in there, a hypothesis reinforced by the frequent ‘ulp, ulp, ulp’ swallows of her unresisting cunt-throat. Sometimes you can feel its strokes receding, exposing heated cockflesh to the icy bite of Dhaal’s air. Each time, it retightens a second later, sleeving your phallus in the soothingly warm protection of her");
	if(pc.cocks[x].cLength() >= 14) output(" sorely-stretched fuck-funnel.");
	else output(" gummy-juiced love-gutter.");
	output("\n\nYou can only assume that’s her way to agitate a lover.");
	output("\n\nThe pressure is incredible, but two can play at that game. Unclenching your teeth and lifting your head, you hook a finger and a thumb into the native girl’s jaw and turn her gaze on your [pc.face]. The ‘want’ she sees etched there, the strength and intensity and skill you’re using to propel her lusts beyond the planet’s gravity well, makes her cum. Urgently, insistently. Her tail practically cries out in her stead.");
	output("\n\nIt has to, because you’ve seized her glossy lips in a fervent kiss.");
	output("\n\nInterfaced and slobbering, you’re the one making all the moves, and you do them atop a dopey, slavering grin. You can tell from her moaning tone that she’s really trying to give back and please you, but her body won’t listen. Not while you jam it all in, not while you grip the wriggling organ and treat it like some kind of biological pump.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Wrapping her oral muscle up is a boon afforded you by the power of star-people science. All her elongated bits are being used, aggressively and forcefully. This is what it means to claim a mate.");
	output("\n\n<i>“Yyyeesh, pleesh...! Faaahhhhheyeloveeeit!”</i> croaks the zaika. You break the kiss, take a breath mid suck-pump, and press yourself into her with all possible might. She’s up against the wall and <b>you are <i>the fucking wall.</i></b>");
	//notHyper,HasBreasts: 
	if(pc.biggestTitSize() >= 1 && pc.cocks[x].cLength < 31) output(" Marshmallow softness interweaves and connects as your [pc.breasts] dock with hers.");
	//longTongue: 
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You shove yourself far into her throat, then puff out her cheeks with your exceptional size.");
	if (pc.hasPerk("Myr Venom") || pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Not only that, you");
		else output(" You");
		output(" saturate the plush wetness of her jaw with venomous saliva, and an overflowing downpour of the spiked stuff rains over your lips and chin. That was her first hit of aphro-spit, and you immediately sense how badly she needs more. The milk-addict could use another vice! Maybe it’ll encourage her to pursue friendlier, more sensual engagements.");
	}
	output("\n\nGrasping at her hair, making primal, animalistic love to her, you finally feel the inevitable pulse of orgasm rising below your stomach. You’re panting faster, caught up in it all.");
	if(pc.isLactating()) 
	{
		output(" However, a single thought rises in your mind: you <i>are</i> lactating. She wants milk. Would it be so bad to give her some now? A good slut deserves a tiny bonus, and she’s thrown herself all out of whack to make you happy. Such a gesture of mercy to send her on her way wouldn’t hurt.");
		processTime(20);
		pc.changeLust(20);
		clearMenu();
		addButton(0,"Breastfeed",giveZaikaMilkThiefAZaikaSnacc,x,"Breastfeed","Let her have the big suck.");
		addButton(1,"Cum",noBoobySucksuck,x,"Cum","There’s no time for breastfeeding when you need to cum this bad.");
		return;
	}
	else 
	{
		output(" You’re reacting keenly to her touches now, sparks of climax igniting full-blown ecstasy. The zaika’s yielding, shuddering, too-tender breast pushes into your [pc.chestNoun], faint roiling release quietly announced; you let loose all your surging passion then and there, primal and organic purpose pumping through your loins.");
	}
	// Option to breastfeed comes up if PC is lactating. If not, append the cum variants to the previous bit without starting a new scene. The writing will be consistent, breastfeeding is a simple option to enhance the experience.
	cummyWithZaikaMilkyThief(x,20);
}

// pc Chose To Breastfeed
public function giveZaikaMilkThiefAZaikaSnacc(x:int):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	output("Breaking the kiss is the only easy part of this. The torrid buffeting of her cock-hugging pussy-tail shoots pleasure straight into your " + (pc.balls > 0 ? "[pc.ballsNoun]":"prostate") + ". <i>“W-Wait, what are- Ah!”</i> is all she manages before you");
	if(!pc.isChestExposed()) output(" wrench out one of your [pc.breasts] and push her onto a [pc.nippleNoun]");
	else output(" shove her ‘o’-mouth onto a [pc.nipple]");
	output(", bending forward to press her puckered lips into your warm flesh, feeling her tongue lick all around the warm spot. The wonderful, maternal pleasure of having [pc.milk] suckled from your teat momentarily clears the fog of fervor from your mind. A couple of times she comes close to gagging on the treat she’s so badly wanted. Too much of the [pc.milkVisc] deluge spills before she figures it out, drinking herself into a fugue stupor right from your tap");
	if(pc.isBimbo()) output("\n\n<i>“Theeere you go! Nn - tastes super nice doesn’t it?”</i> you ask, playfully pinching her ear. <i>“My [pc.milkNoun] is the best around! Get all you can sweetie, cuz I’m about... mm! To cum!”</i>");
	else if(pc.isNice()) output("\n\nAs you stroke the back of her head, you ask how she likes it, knowing you won’t get an answer but for more unstinting [pc.milkNoun] guzzling. <i>“Take what you can. Maybe if you ask nicely to someone in the future, you can get this...”</i>");
	else output("\n\n<i>“Bet that’s what ‘ya like most,”</i> you laugh, tousling her hair into little tiny handholds. <i>“Make it count...”</i>");
	output("\n\nHer teeth sink into the [pc.milkNoun]-bearing flesh, drawing a groan out of your throat and a small squirting boobgasm from your chest. Detonation isn’t far behind.");
	cummyWithZaikaMilkyThief(x,0,true);
}

// pc Chose Not To Breastfeed
public function noBoobySucksuck(x:int):void
{
	output("\n\nNo - she doesn’t deserve a single drop. When she recovers from this, she can find it in someone else’s tits. Maybe next time one of her or her sister cream-addicts comes leaping down like some twisted superhero they’ll come at you nice enough to earn it.");
	cummyWithZaikaMilkyThief(x,0);
}

// merge
public function cummyWithZaikaMilkyThief(x:int, bonusTime:Number, breastfeeding:Boolean = false):void
{
	// pc Low Cum
	output("\n\nWriggling like the waves of a stormy sea, the zaika woman’s thumping tail carries you into explosive release. [pc.Cum] twitches out of your [pc.cocksLight] into the lust-sloppy cocksheath’s rippling vale." + (pc.cumType == GLOBAL.FLUID_TYPE_MILK ? " Does she know it’s pure milk too, not just regular semen? She’s gonna love this part the most.":""));
	if(pc.hasCocks()) output(" Wads of [pc.cumColor] bodypaint flex out from your unslotted penis" + (pc.cockTotal() > 2 ? "es":"") + ", caking the plummy slut in a fast-cooling reminder of your dominance.");
	output(" The yowls coming from your mouth seamlessly blend into the regular hustle and bustle on the adjoining street, simultaneously echoing down the nightmarishly-dark passage.");
	if(breastfeeding) output(" Your punky bandit throws back her head, sloshed by the creamy delight coursing through her veins, and you can’t help but give her the deepest kiss of her life.");
	else output(" You give the bandit the deepest kiss of her life.");
	output(" Spurts of heated nut ride along the shepherding walls into her egg-chamber");
	if(pc.virility() > 0) output(", hopefully attempting fertilization");
	output(". At the very height of climax, you squeeze her boob with your right hand, whisper soft praises, and thrust forward, ramming the full volume of your spunk through her dick-deluged cunt-tail. Everything goes white, the relentless sucking joy blissing you out. Each soul-draining yoke of her pliant muscles assail you at your most receptive. A sensation occurs that you can’t describe - you take the sharpest inhales of your life, and as this sequence of events carries on, you come to believe that you’ve lost the ability to breathe, to hear, and to see.");
	if(pc.hasVagina()) output(" Which is why the warm rush of femgasm means nothing. Your [pc.pussies] " + (pc.hasVaginas() ? "are":"is") + " creasing and throbbing to nobody’s interest.");
	// pc High Cum (add-on to low)
	if(pc.cumQ() >= 8000)
	{
		output("\n\nYou’re too young, too healthy, and too virile to give in and collapse. Catching your second wind, you decide that she needs to be ruined. It’s so inspiring that you manage to regain awareness, push her down and take control of that tail the way it was meant to be. Her body becomes a thousand times more sensual as you stuff it with more cum than it was built to handle. Great, brimming loads of [pc.cumVisc] [pc.cumNoun] inflate her smothering girth and make the writhing trip into her backside.");
		if(pc.hasKnot(x)) output(" It <i>would</i> slip out, but thanks to your [pc.knot " + x + "], you’re slowly turning her cum-clogged channel into an organic bubble-buddy.");
		else output(" Thick ropes of protein-glutted jizz fire in sequence, growing the girl’s abdominals into a dome-shaped shelter to house the incredible burden flowing in that direction.");
		// pc Hyper Cum (add-on to high)
		if(pc.cumQ() >= 30000)
		{
			output("\n\nIt’s a real struggle for her now. Were those augmentations and body mods meant to handle the excess being driven into her? It’s time to find out if she got her work done by a tech who knows their shit.");
			output("\n\nIn the haze of a climax that never ends, much like the night on this world, you blast waves of seed into her, watching her parts bulge to contain the titanic oceans of liquid appeal puddling up on her slutter-looking curves and spraying down her oviduct. [pc.CumNoun] delivered right to the door! Her body is groaning out past factory standard into a brand spanking (literally! That’s what you’re doing!) new tier of fecund native. She pleasure-seizes; her voice fails her; your spout overwhelms <i>her</i> spout with flash floods that soon have nowhere else to go, sheer gallons of fluid mass back-blasting into your crotch, old [pc.cumGem] festoons replaced by new. Slender no more, her ass-mounted tendril is now bloated with an unfathomable new weight that nobody on this planet could have trained her for. No amount of ultraporn could have prepared her for the lovely amount of [pc.cum] a determined alien would be hosing into her now-plumped slut-gut.");
			output("\n\nThoroughly washed by your inescapable urges, you finally come down from the ecstatic high, errantly twitching in her soft and squishy confines, eyes somehow finding their way back into the waking world. The unprecedented magnitude of your bliss has left her tummy in the blown-up shape of late-stage pregnancy, and that’s precisely what you wanted to have happen: for the limits of her once-slender body to be truly ballooned by all the gooey gallons your body could creampie her with.");
		}
	}
	// merge
	if(pc.inRut() || pc.libido() >= 66)
	{
		output("\n\nPulling free from the zaika girl’s drooping, cum-oozing limb," + (pc.cocks[x].cLength() >= 31 ? ", which snaps off like a tensioned rubber band,":"") + " you come to a disturbing realization: you’re still hard. Priapistically so. It wasn’t enough. Rather than fret about a possible future as a walking circus to the other zaika, you catch note of her shifting body posture. Lying on her back, the lilac succ-u-elf raises her legs and tries to turn over, revealing the light glint of a jewel between her thighs. Time to do her from both ends. Anything less and you can’t be satisfied.");
		processTime(10+bonusTime);
		//Not really in her cunt, but in case of future preggomancy!
		enemy.loadInCunt(pc,0);
		pc.orgasm();
		clearMenu();
		var cummies:Number = pc.cumQ();
		addButton(0,"Next",ruttyBoiFun,[x,breastfeeding,cummies]);
	}
	else 
	{
		output("\n\nStanding on your own after a mating ritual like that seems impossible, but emerging from the limp, cum-flecked orifice" + (pc.cocks[x].cLength() >= 31 ? " with the sound of a snapping rubber band":"") + ", you sputter out a few more ropes onto her body and go soft over a minute of panting convalescence. Once the fatigue on your shoulders eases up a tad, you stumble away from your opponent and get yourself back in order, wiping your [pc.cocksLight] clean with her tail covering before throwing it on her. It lands in her mouth. Further exploration awaits...\n\n");
		processTime(10+bonusTime);
		//Not really in her cunt, but in case of future preggomancy!
		enemy.loadInCunt(pc,0);
		pc.orgasm();
		enemy.milkInMouth(pc);
		if(breastfeeding) pc.milked();
		CombatManager.genericVictory();
		return;
	}
}

// pc Rut or High Libido - Fucks Her Vag Extra.
public function ruttyBoiFun(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var x:int = args[0];
	var breastfeeding:Boolean = args[1];
	var cummies:Number = args[2];
	output("Mounting and bracing yourself against the zaika’s egg-chute, you wiggle yourself past the plump folds and into the dark satin of her birthing hole");
	if(cummies >= 8000) output(", swimming upstream on the vast amounts of [pc.cum] you’d moments ago reamed into her");
	output(". Muscles designed for a hyper-specific purpose react against your penetration in magical ways, spitting lukewarm lubricants on supersensitive [pc.dickSkin " + x + "]. Believing your presence to be that of a daughter to be hatched, the lathing nerves of her front-hole, at first, make every futile attempt to eject your [pc.cock " + x + "], yet each contraction brings your cunt-stuffing fatness deeper and deeper," + (pc.cocks[x].cLength() >= 31 ? " until your [pc.cockHead " + x + "] presses on secret uterine gates":" until you bottom out [pc.knotBallsHilt " + x + "]-deep in the treacherous cunny") + ".");
	output("\n\nThe musical whines of a girl getting exactly what she needs resuscitate your mating imperatives like a defibrillator to the heart. After moulding the");
	if(cummies >= 8000) output(" cumflated");
	output(" zaika’s crotch-muff to your [pc.cockType " + x + "] shape you go at her, [pc.hips] slapping hard, frenetic rhythm into her pussy as deep and as lusciously as you can. It’s a gloopy, kinesthetic routine - you both groan and cry in harsh tones as you squirt into one another, She coaxes you onwards, legs wrapping" + (pc.isTaur() ? " around your flanks":" around your waist") + ", a broken in slut that’s had her satisfaction levels dialed into the red.");
	output("\n\nHer limp and spent tail, of course, remains on the ground in a sperm-fatigued coma. Doing it in this hole isn’t as pleasurable as it is for them as it would be for " + (pc.hasVagina() ? "you":"the girls you’re used to seeing") + ", but that’s why you’re" + (!pc.isTaur() ? " grabbing both of her tits, groping her to a full body orgasm":" pawing one foot across her breasts, working the most sensitive parts of her body into a full-frame orgasm") + "!");
	// pc Lactating
	if(pc.canMilkSquirt())
	{
		output("\n\nYour [pc.boobs] bead freely during the breeding. [pc.MilkGem] spheres of mother goodness form on your [pc.nipples]. Each time your groin collides with hers, [pc.milkVisc] maternal bounty squirts from your chest. Delicious boobgasms on top of the leg-locked sex you’re pumping into her." + (!pc.isTaur() ? " On top of it all, your bust slides symmetrically against her bosom, smooth, nipple-less cum-containers dominated by <b>real</b> boobs.":""));
	}
	// merge
	output("\n\n<i>“");
	if(breastfeeding) output("I’m gett-uhh... rutted! I’m-as-dumb-as-a-slut in a-a-all the veedeohs aaaaandd I... I loooove it!");
	else output("I can’t believe it! I’m being rutted by an alien! Just like in a-a-all the videos!");
	output("”</i> Your arousal steadily rises back to the point it was at before. Watching her face flash from one pleased expression to the next as her mouth sings your praises, you pulse inside the virginal confines of her egg-hole, bleary, and snared in the increasingly lusty grip of her overwhelming tightness. <i>“" + (breastfeeding ? "Yeeessss... will you feed me more milk? Then screw meee harderrr? This is what I wanted, and you deserve to breed me!":"I-I wanted you - but - I deserve to be yours! It’s so obvious now! I never had a chance!") + "”</i> A functioning body knows when something extraordinary is happening, and as hers comes to term" + (silly ? " - PUN INTENDED! HAHA! -":"") + " with the fact there’s something big, hard, and vaguely cylindrical repeatedly lodging itself in her lay-chamber, it starts to take steps to resolve the issue.");
	output("\n\nConsequently, sliding out becomes much easier and penetrating gradually morphs into a trial by fire - for only a moment, however! It stops fighting after the third growling thrust.");
	output("\n\nYou scream your love for this biomechanical creature, not caring who hears, thriving on the straining effort required, struggling not to laugh as the inner circuitries hiss and whine. Lactic acid builds up in your muscles, burning away the vestiges of your endurance - but you hold on! You’ve got breed her, properly! Someday she may find her way off this planet. You’ve got to teach her what to expect!!");
	output("\n\nIn time her hole adapts to the way it’s being used. The more you drill it, the closer you get to imprinting your genetics in that way your DNA programmed you to. Ceaseless orgasms on her part and soft, squishy contractions inflame your ardor, and you’re pushed over the edge, sweat flying from your [pc.hairNoun] and [pc.face].");
	output("\n\nJets of [pc.cum] squeeze into the zaika’s impossible vice, crushing and stern like a mother’s scorn. " + (pc.hasCocks() ? "Streamers of spoo fire out all around, ballistics of [pc.cumColor] climax. ":"") + "You try to bury your bone" + (pc.hasKnot(x) ? ", even knot her,":"") + " but you can’t");
	if(pc.cumQ() >= 2000) output(", even while you’re adding extra spermy pounds to her struggling gut!");
	else output(".");
	output(" The lurid lock of orgasm stuns you in place, and her vagina handles the rest. It’s the most bizarre feeling that, while you’re still pumping [pc.cumVisc] lassos of [pc.cumGem] jizz into someone, you’re being forced out, sliding in reverse, eventually staggering and slumping into a shuddering mess that instinctively humps and grinds against a ");
	if(pc.cumQ() + cummies > 20000) output("bloated tummy");
	else output("soft partner’s skin");
	output(". So you blow. You sputter and you squirt, feeling passing relief from the pressure.");

	// pc Multicock
	if(pc.hasCocks())
	{
		output("\n\nBut you still have" + (pc.cockTotal() == 2 ? " a dick":" other dicks") + " that haven’t had a go. Sucking in your gut," + (pc.cockTotal() == 2 ? " it soon discovers":" they soon discover") + " the leaking burrow of native pleasure here on Dhaal. Thanks to the rapt attentiveness of her body, your slithering" + (pc.cockTotal() == 2 ? " mass slides":" masses slide") + " in effortlessly; the first of your" + (pc.cockTotal() == 2 ? " twinned tools":" many tools") + " already stretched and lubed her up, so its brother" + (pc.cockTotal() > 2 ? "s":"") + " can dive painlessly into the cock-hugging pit, grease and work " + (pc.cockTotal() == 2 ? "itself":"themselves") + " into another orgasmic high. Cradling womb-walls provide you with all the pleasure you need to churn out fresh spurts of [pc.cumNoun].");
	}
	// merge
	output("\n\nAnd thus, a change from emptiness to fullness occurs again.");
	output("\n\nJust to be sure.");
	processTime(20);
	enemy.loadInCunt(pc,0);
	cummies += pc.cumQ();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",ruttyBoiFun2,[x,breastfeeding,cummies]);
}

// pc Rut or High Libido - Fucks Her Vag Extra.
public function ruttyBoiFun2(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var x:int = args[0];
	var breastfeeding:Boolean = args[1];
	var cummies:Number = args[2];
	output("Timed perfectly with you, the zaika unleashes a great big sigh. Your insatiable ardor is now finally satisfied - for now. It’d be hilarious to see her try and go jumping around the planet now, raining the dregs of your DNA on everyone.");
	if(pc.inRut()) output(" Unfortunately, she curls up into a ball, breathing reduced to content quietness. Parts of her that once handled things like ‘immediacy’ or ‘awareness’ either shut down completely or restructure to cope with the most furious fuck of her life.");
	else if(breastfeeding) output(" Hopped up on boob-juice though, she won’t be doing any jumping, let alone walking! She’s babbling delirious on the ground with a wide, empty smile on her face" + (cummies > 8000 ? ", rubbing her stomach happily":", twisting her fingers in the collected mess around the used condom once called her tail") + ". Now <i>that’s</i> diplomacy.");
	else output(" She just might. Despite the intensity of your sex, she’s still quite aware of herself, turning her bliss-blasted eyes upwards. <i>“That was super fun.”</i> She gives a confident, if exhausted, grin. <i>“You’re definitely a cut above all the other Rushers, no doubt! I bet you’re gonna be leavin’ other girls like me wherever you go from here.”</i>");
	if(pc.isBimbo())
	{
		output("\n\nAs a thank you, you" + (pc.isLactating() ? " squeeze some [pc.milkNoun] into her lips for the good time!":" dribble the last of your [pc.cumNoun] past her lips.") + " Maybe she’ll come begging for more later?");
		if(pc.isLactating()) pc.milked(10);
	}
	else if(pc.isBro()) output("\n\nBefore leaving, you wipe your [pc.cocks] clean with her hair, using her cum-dump of a mouth to clean the [pc.cockHeads]. Good sluts deserve every drop.");
	else if(pc.isNice()) output("\n\nBefore returning to the journey, you place her tail coverings within arm’s reach and shift a few objects in the environment to better hide her. Dhaal won’t be as kind to the vulnerable.");
	else if(pc.isMischievous()) output("\n\nNot quite ready to step out, you bring your [pc.cocksLight] over to her face and jerk the last of your [pc.cumFlavor] loads onto her cheeks, brow, and past her panting lips. Her tongue darts to whip at the [pc.cockHeads], dripping with the stuff. Yeah, she liked that.");
	else output("\n\nOn your way out, after having wiped your [pc.cocksLight] off in her hair, you spot the ring and covering of her tail. Deciding she won’t be needing either, you toss them into obscurity.");

	// sceneTag: processTime
	processTime(8);
	// sceneTag: PC Cums x3
	pc.orgasm();
	// sceneTag: PC Rut Ends(?)
	if(pc.inRut())
	{
		pc.removeRut(false);
		output("\n\nSomething about so thoroughly fucking - so powerfully plowing and stuffing someone - has eased the rutting pressure in the back of your mind. Whether she got knocked up or not, your body feels confident it did its job.");
	}
	// sceneTag: Boobs might drain a little bit more.
	if(breastfeeding) pc.milked();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Hyper Docking] 2600 wurds, unedited
public function loseAndGetHyperDooooocked():void
{
	var x:int = pc.biggestCockIndex();
	//clearOutput();
	showMilkThief(true);
	author("Fenoxo");
	//HP
	if(pc.HP() <= 1)
	{
		output("You curse the mistakes that lead you here even as the weight of their consequences bears you to the ground. The feeble extension of your arm won’t ward the milk thief away. It won’t even slow her down. She advances with a saucy smile, backhandedly batting the gun away as she " + (pc.hasAirtightSuit() ? "breaks the seal of your airtight enclosure and ":"") + "fires a generous spray one of this planet’s favorite concoctions: Ero Gas. You hold your breath and put on your best glower, intent on waiting for the chemical to disperse.");
		output("\n\nYou can’t stifle your surprise when the alien spends her time examining your injuries, and instead of torturing them, she flips the dial on her gun to a strange glyph and pulls the trigger. Cold yet somehow warm gel slathers across injury after injury, making it impossible not to gasp as your wounds close one by one. The milk thief repairs your body even as her flagrantly dispersed gas ensures your arousal - a favor in exchange for artificially stoking your ardor.");
		var healing:Number = Math.ceil(pc.HPMax()/2);
		pc.changeHP(healing);
		output("\n\nPretty soon, you’re panting and " + (!pc.isErect() ? "hard":"somehow harder than you already were") + ", inadvertently sucking down more intoxicating lungfuls of the lusty inebrient. Your [pc.cocks] ");
		if(!pc.isCrotchExposed()) output("rip" + (!pc.hasCocks() ? "s":"") + " and tear" + (!pc.hasCocks() ? "s":"") + " straight out of confinement to heave up into the air and slap authoritatively against the pavement.");
		else output("heave" + (!pc.hasCocks() ? "s":"") + " and wobble" + (!pc.hasCocks() ? "s":"") + " up into the air before slapping authoritatively against the pavement.");
		output(" Cold asphalt ought to be reason enough to reverse the flow of blood, yet the inhalant swirling through your veins demands nothing but endless, firm rigidity. Your hammering heartbeat lifts your porn-grade pole" + (pc.hasCocks() ? "s":"") + " aloft only to let " + (!pc.hasCocks() ? "it":"them") + " slap down again and again, drumming out a clear and pernicious desire for sex with every inch of " + (!pc.hasCocks() ? "its":"their") + " cartoonish length.");
	}
	//Lust
	else
	{
		output("You curse the weight of your own bloated phall" + (!pc.hasCocks() ? "us as it":"i as they") + " drag you to the ground, not from weakness due to injury but from the growing sense of submissive arousal addling your nerves and making your genitalia too weighty to carry. The wet slap of cock against pavement rings out like a clarion call as the milk thief advances on your position. On some level you know you should probably make an attempt to crawl away or escape somehow. On the other hand, you’re so disturbingly hard that jacking off while she does whatever she wants seems increasingly like the best option.");
	}
	//merge
	//smoltid
	if(titsSmall())
	{
		output("\n\n<i>“Typical alien, too weighed down by [pc.hisHer] own bloated tail to do anything but fuck.”</i> She sneers down at your exposed length" + (pc.hasCocks() ? "s":"") + ", blushing slightly as she drinks in the multiple feet of urgently pulsating prick. <i>“How do you even walk with a dick like that? Or fuck? You’d kill one of your women trying to use that thing. It’s even bigger than mine!”</i> Her blush deepens as a depraved idea occurs to her. <i>“...I bet I could even fuck it like a real tail, and you’d cum just as hard as one of those ausar bitches in heat");
		if(pc.race().indexOf("ausar") != -1 && pc.inHeat()) output(" - which you are! Slut!");
		else if(pc.race().indexOf("ausar") != -1 || pc.inHeat()) output(" - which you sort of are, I guess!");
		else output("!");
		output("”</i>");
	}
	//Medtid
	else if(titsMed())
	{
		output("\n\n<i>“Daylight! You off-worlders are such greedy sluts! You can’t even keep your coverings on when you’re horny!”</i> The zaika nudges {your/a} trembling pole with her toes while her pink skin blushes a shade closer to purple. <i>“You’re so turned on you can’t even walk, let alone handle having a milking without a heart attack.”</i> She sighs theatrically. <i>“I guess it’s going to be up to me to show you how a zaika puts a tail like that to use.”</i> Her own curls over her shoulder inquisitively, the bulb at the tip packing tightly together in penetrating form. <i>“Especially since you’re the first Rusher I’ve met with a tail worth properly fucking!”</i>");
	}
	//Bigtid
	else
	{
		output("\n\n<i>“Stars and sunrays! You’re such a fucking mess. Look at you, practically pinned down by the weight of your own genitalia. Mmm,”</i> the zaika husks, openly stroking your trembling pole with her two-toed foot. <i>“I could fuck that tailslit just like one of ours I bet, but that doesn’t connect to your womb does it?”</i> She whimpers at the depraved thought. <i>“Bet you’d like that, skank. Bet you’d like getting fucked in the street like some dumb xeno whore while I knock your " + (pc.balls > 1 ? "stupid, dangly crotch-tits":"big dumb dick") + " up.”</i> Her tail appears over her shoulder, tightly-packed and ready to go. <i>“Ohh, this is your fault. I just wanted to m-m-milk you, but you had to be so... so... hot!”</i>");
	}
	//merge
	output("\n\nA crowd begins to gather, yet the churlish thief only laughs as she circles you. <i>“");
	if(titsSmall()) output("Look at this alien! Look at [pc.himHer], waving this big stupid fucktool around without any modesty! I’ll show [pc.himHer]!");
	else if(titsMed()) output("Isn’t that right? These aliens act like filthy fucking cumdumps, waving their dicks around in the air, always begging for a fuck. It’s only right I show [pc.himHer] what we do to sluts on Dhaal!");
	else output("They can see it too. They can see what a whore you are. That’s why I’m going to fuck you right here, in the street. I’m going to inflate that fat, useless tail of yours while my countrymen cheer me on, and it’s all your fault. If you Rusher’s weren’t walking cum-dumps and milk-tanks, you wouldn’t go around modding yourselves up to obscenity, proudly displaying your sexual equipment to an entire street of onlookers.”</i> She whimpers with barely concealed desire, putting on a dour face for the crowd. <i>“I’ll pump you so full of cum that you’ll be dripping zaika-seed for a week.");
	output("”</i>");
	output("\n\nOther aliens may jeer and call out in ripe disdain, but they can’t conceal how their tails wave and wiggle behind them, curling around arms and thighs for a hint of friction. Dewy damp patches appear on their multicolored tail-wrappings, evidence of their true thoughts: jealousy and desire.");
	output("\n\nThey all want to fuck you. Every last zaika. Societal norms hold back their roving appendages for the time being, but the near manic thirst in their eyes when they behold your unleashed maleness" + (pc.hasCocks() ? "es":"") + " reveals exactly what they’d do to you in private: fuck you back-to-back-to-back until your [pc.cock " + x + "] and every other hole in your body is impregnated with thick, zaikan loads.");
	output("\n\nThe presence of the milk thief’s tail against your [pc.cockHead " + x + "] rouses you from your ");
	if(pc.exhibitionism() < 33) output("shameful");
	else if(pc.exhibitionism() < 66) output("flattering");
	else output("exciting");
	output(" reverie in the most erotic way possible. You can feel it drooling slickness against your urethra");
	if(pc.cumQ() >= 100) output(", blending it into your own " + (pc.cumQ() >= 5000 ? "excesses of":"syrupy") + " pre");
	output(". Jeers and hoots of excitement ring out as the excited zaika urges her rear-mounted organ forward. The first inch of her bulb-shaped apex easily slips inside. The rest, especially the bulbous point just behind, requires vigorous wiggling and the discharge of something warm and wet into your rarely-violated penis-passage, but with a shared gasp of pleasure, you find yourself accepting it with sudden ease and a moan of submissive delight.");
	pc.cockChange(); //The weirdest virginity loss!
	output("\n\n<i>“It really is like a tail!”</i> the euphoric rogue calls.");
	output("\n\nCheers from the crowd roar back as she plunges her lengthy organ deeper into your urethra. You can feel it snaking through your cum-chute, distending it against the road, yet no matter how forcefully it burrows in, the pleasure only grows. She fucks you in a way your anatomy was never meant to be fucked. Coiling against itself, the turgid tail pulls out and pumps back in, slopping excessive grouts of pre over the closest onlooker’s feet while it works your cumslit open. After a particularly eager thrust, the next backstroke pops the zaika-knot the entire way out, spraying a fan of pre-cum across that same stranger’s front.");
	output("\n\nInstead of recoiling, the onlooker smiles, her hands busily caressing the stalk of her tail while she watches.");
	output("\n\nMeanwhile your [pc.cockNoun " + x + "] gapes open, weeping mixed lube in obvious excitement. A subconscious clenching of your muscles actually raises it up, eagerly and shamefully angling at the milk-thief to beg for more. You should stop it. You really should. You should push it back down instead biting your [pc.lipChaste] with a heavy blush and a whimper. You definitely shouldn’t shift to follow her tail’s every motion. Doing that would make you exactly what they all think you are: an eager slut too horny to feel shame.");
	output("\n\nAnd here you are, twisting around on the ground to beg for a deeper stroke, acting the part.");
	output("\n\n<i>“Awww yeaaah,”</i> the cream-thirsty zaika groans as she gets her hands on your [pc.cockHead " + x + "], marveling at the slick yet firm texture of it. <i>“This really is a whore’s tail.”</i> Her omnigenital plunges into the slick passage while she speaks, tantalizing you with friction in a place your brain was never designed to process. <i>“Bet when I finish up, you’re gonna be dragging it from alley to alley, looking for another dose of Dhaal’s second favorite kind of milk, aren’t you?”</i> She giggles, turning slightly to give her back-mounted genital a better angle with which to plow you.");
	output("\n\nIndescribable bliss wells up the moment she resumes fucking your [pc.cock " + x + "]. She goes deeper now. ");
	if(pc.cocks[x].cLength() <= 38) output("That lengthy tendril must be deep enough put pressure on your prostate from the front. With each of the milk thief’s thrusts, your [pc.thighs] quiver and your eyes threaten to roll back. Pre pours in an almost steady stream, like her fucking is milking the trembling gland for every ounce it can produce.");
	else 
	{
		output("That lengthy tendril reaches far enough inside of you that your [pc.cockHead " + x + "] actually plants a slobbery kiss on the small of her back. With each new inch that she claims, new nerves awaken and light up brighter than the neon lights illuminating your ");
		if(pc.exhibitionism() < 33) output("humiliation");
		else if(pc.exhibitionism() < 66) output("public use");
		else output("exhibitionist tryst");
		output(". So much pre pours out on the backstrokes that it almost looks like she’s milking you for it.");
	}
	output(" You’re going to cum soon, and there’s nothing you can do to stop it.");
	output("\n\n<i>“So lewd! We only let them come here because they’re top tier tail-drainers, right?”</i> With the audience watching, the cyborg’s words seem to grow crueler by the second. Yet her expression, when she’s looking down at you, seems almost apologetic, like she realizes that things have gotten out of hand but she has no choice but to see it through to the end. She strokes the top side of your [pc.cock " + x + "] while she plows it with faster and faster strokes, barely keeping it together long enough to say, <i>“[pc.HeShe]’s tighter than a virgin! It’s not right how good this feels!”</i>");
	output("\n\nTrue to her words, you can feel her tail swelling within you, thickening and plumping while it pounds deep. Lurid squelches fill the air as the gasping alien’s eyes roll back. Her chest, ");
	if(titsSmall()) output("petite as it may be, wobbles slightly as it visibly deflates");
	else if(titsMed()) output("curvaceous and ripe, wobbles as it drops a cup size");
	else output("jaw-dropping and wobbly, bounces as a cup size vanishes like magic");
	output(", the liquid within routing downward and suddenly, inside you, pumping a hot load directly into roiling depths.");

	//Enough cum to make the bitch’s plan backfire!
	var cumAmt:Number = 150;
	if(titsMed()) cumAmt = 1500;
	else if(titsBig()) cumAmt = 7500;
	if(pc.cumQ()/2 >= cumAmt)
	{
		output("\n\nConcealing the signs of pleasure on your face is impossible, especially when taking the milk thief’s load so deep inside your [pc.cock " + x + "] forces you straight to a climax of your own. For a moment, the pressure of your internal muscles clamping down wars with her gravity-assisted spunk-reserves, but only for a moment. Your ejaculation will not be denied, not by another’s orgasm, and certainly not by a tail-shaped plug. Clenching down, you reverse the fluid flow almost instantaneously, using a tide of your own [pc.cumNoun] to backwash the alien’s pearly offerings straight back to her tail.");
		output("\n\nWere the bulb at the tip still tightly clenched, you might have just blasted it out, but it had to open slightly to unleash its own load. That opening is the only vent for all the pleasure. Your climax, with your avalanche of seed, pries that opening wide as it floods up through the tail, pumping straight into the shocked zaika.");
		output("\n\n<i>“W-w-waitwhat?!”</i> the cyborg cries as her audience watches the base of her tail flare. Her eyes cross and her knees wobble from the sudden, unexpected flood, flipping her body’s sex switch from <i>“male”</i> to <i>“female”</i> in an instant. <i>“N-no! I’m fucking you!”</i> she babbles as her hands fly to her belly. The milk thief sinks to her knees while her womb’s inexorable pressurization becomes clear to the audience she has gathered. They tut and snicker in dismay.");
		output("\n\nWhat seemed a sure thing in this contest of bodies has swung violently in the UGC’s favor.");
		output("\n\n<i>“Oh,”</i> the milk thief gasps when a fresh lance spears straight through the tubular innards of her tails to wash whatever passes for her ovaries in [pc.cumNoun]. <i>“S-s-orry everyone,”</i> she babbles while you fill her full, creaming the proud alien into distended subservience to your oversized endowment, <i>“I g-g-uess I’m g-g-gonna be pregnant with a Rusher’s baby.”</i> She flops bonelessly onto her back with her eyes rolling. Meanwhile, the taut dome of her belly ");
		if(pc.cumQ() < 20000) output("shudders one last time as you finish injecting her with your superior seed.");
		else 
		{
			output("stretches higher and higher, growing into perfect preview of how she could look when with a ");
			var cumming:Number = pc.cumQ();
			if(cumming < 30000) output("pair");
			else if(cumming < 40000) output("trio");
			else if(cumming < 50000) output("quartet");
			else if(cumming < 70000) output("quintet");
			else output("gravball team");
			output(" of partway-terran babies growing within her.");
		}
		output("\n\nThe moment those involuntary, muscular clenches cease, the friction tying the zaika to you ebs enough to let her tail slip free, but its escape is slow and slack, more a function of your final tributes of spunk pushing free than any effort on your part. A bystander unwraps her tail and threads it into the gape-mouthed rogue while you extricate yourself, muttering something about how <i>“this is all her fault.”</i>");
		output("\n\nIn a way, it was. You gather your things before someone else makes a run at you.\n\n");
		processTime(35);
		//For potential preggening!
		enemy.loadInCunt(pc,0);
		pc.orgasm();
		CombatManager.genericLoss();
	}
	//Less cum than she has: orgasm into her orgasm, but she overwhelms you and buries you in it. Set balls 100% full, blue balls, etc.
	else
	{
		output("\n\nConcealing the signs of pleasure on your face is impossible, especially when taking the milk thief’s load so deep inside your [pc.cock " + x + "] forces you straight to a climax of your own. You may cum and clench, but she’s so much more virile than you could hope to be! ");
		if(titsBig()) output("Those weighty tits of hers are unfair advantage! Like two water towers, they keep her high-pressure spooge flowing in smothering quantities.");
		else if(titsMed()) output("Those high-up cum-tanks of hers must work like small water towers, utilizing a gravitational assist to keep her high-pressure spooge flowing in smothering quantities.");
		else output("Small as her breasts may be, their increased height offers them quite the gravitational assist when it comes to cum-pressure. Her load flows in with smothering force.");
		output(" Internally, you balloon with it, somehow still able to get off while your reproductive juices are suplexed into submission by foreign cream. You whimper when your eyes roll back, but the fullness feels so painfully pleasant that it’s hard to care.");
		output("\n\nJoyous cries echo off the concrete-like walls. They’re mostly your own, but some of them sound like they’re coming from the audience as well. You writhe in place as more and more zaika sperm infuses your [pc.balls], bloating " + (pc.balls <= 1 ? "it":"them") + " to ripe tenderness while your muscles spasm in uncoordinated, ecstatic paroxysms. Nothing makes sense but the pleasure, and you content yourself with that.");
		output("\n\nActing exactly as they expect you to, you writhe until the milk thief finishes using your [pc.cock " + x + "] and pulls out, unleashing a small stream of white-hued backflow. Her chest is noticeably lightened by the act, something she seems proud of when she raises her arms and cheers, <i>“" + (silly ? "Are you not entertained?":"Don’t let the offworlders fool you. Dhaal is every bit as grand as their so-called-core!") + "”</i>");
		output("\n\nRaucous cheering breaks out while the cyborg leans down to pat your head, stroking you as one might a treasured pet. <i>“I hope to see you again,”</i> she whispers over a high-pitched hum in her heels.");
		output("\n\nThen, the pavement under you almost shatters as she launches into the sky, leaving you alone with your shame and a steady leak from your slowly-recovering crotch.\n\n");
		processTime(35);
		pc.orgasm();
		pc.applyBlueBalls();
		CombatManager.genericLoss();
	}
	pc.exhibitionism(2);
	pc.exhibitionism(2);
}

//[Fucked( and Milked)]
// This is an omnisexual scene, vagOrAss compatible. And Taurs too.
// Zaika lady will render the PC supine, bind their wrists in her long tail, then fuck their pussy or butt with it while she milks them. Does not inherently require lactation, but she can force the PC to lactate if they have tits.
// In order of preference on milking: Breasts, Cocks, Pussies. 
// PC will be on their back in missionary if she uses the pussy, and doggystyle if she uses the butt( or the PC is a taur). Hands will be bound, molestation is inevitable.
// If PC in heat, will more vigorously breed them, want to have a completely different vaginal fuck scene there. If we ever do Zaika eggnancies, this would be a fantastic place to add her depositing one in you, maybe after being fucked herself.
// reminder that I use {titsSmall, titsMed, and titsBig} to differentiate the thieves from controlled to horny to depraved.

public function loseToMilkThiefGetFuckoedAndMilkoed():void
{
	showMilkThief(true);
	author("William");
	var milkPills:Boolean = false;
	var milkSucked:Boolean = false;
	var x:int = -1;
	if(pc.hasCock()) x = pc.smallestCockIndex();
	if(x >= 0 && rand(2) == 0)
	{
		x = pc.cockThatFits(600);
		if(x < 0) x = pc.smallestCockIndex();
	}
	else if(x >= 0 && rand(2) == 0) 
	var y:int = -1;
	if(pc.hasVagina()) y = pc.flattestVaginaIndex();
	output("The zaika attacker smiles widely, watching you stagger out a futile defense. A neon-lit silver dart fires from her tongue and instantly embeds in your shoulder. Strength flees your [pc.fingers] as a black-market relaxant washes through your veins. Your weapon clatters distressingly to the ground and skids out of reach, and you follow suit, begrudgingly accepting that open [pc.hands] will not dissuade an augged thief.");
	if(titsSmall()) output(" <i>“And <b>that</b> is that!”</i> she beams, victory quivering through her excited bones and venting at the tips of her emotive ears. <i>“Alas that not all star-people are able to act in good faith, but that’s where I and others come in.”</i>");
	else if(titsMed()) output(" <i>“Yes!”</i> your scantily-clad assailant chimes, something more than victory shuddering past the heavy ring on her sinuous tail and into the darkening spots on her tail covering. <i>“An off-worlder at my mercy, to give of [pc.himHer]self to me; this is my success, my claim!”</i>");
	else output(" <i>“A-ha! Where’s your superior technology now, xeno-[pc.boyGirl]!?”</i> she screeches, mad with lust. Her tail snakes forward, dripping ivory into its orchid-purple covering. The heavy ring keeping its turgidity in check is losing the fight against a depravity kept too long in captivity. <i>“All mine - to extract and to fill - success, all by my doing!”</i>");

	// pc Lust Loss
	if(pc.lust() >= pc.lustMax())
	{
		output("\n\nOverwhelming sensual heat builds in your crotch and in your [pc.chestNoun]. Pulsing warmth slithers across your [pc.nipples], residual aphro-attacks forcing them to glow and throb and melt in arrhythmic cadence; your head lolls back, the sheer intensity drawing out the last of your resistance. Pretty soon, the lilac-hued bandit is standing over you, chem-pistol aimed at your face while she fiddles with the knobs at it rear. <i>“");
		if(titsSmall() || titsMed()) output("Let’s just make extra sure you’re nice and happy and compliant. Some of you aliens have endurance for weeks!");
		else output("Ooh, subdued star-sluts sure make the most enticing noises! Let’s see how loud you can get, my sweet" + (pc.biggestTitSize() >= 1 ? ", milky":"") + " alien!");
		output("”</i>");
	}
	// pc HP Loss
	else
	{
		output("\n\nNot willing to give up, you grunt in irritation and try to rise, [pc.arms] like wobbly gel. At least for the moment you keep your head. Making it only a single inch, you look up to see the lilac-hued bandit aiming her chem-pistol down at you, twisting the bits on its end. <i>“");
		if(titsSmall() || titsMed()) output("Let’s not have any more of that - I wouldn’t want to have to hurt someone who can’t fight back. Leaves a... dark taste in my mouth. Besides, some of your alien friends are more durable than they let on! Can never be too careful in this line of work.");
		else output("Oh, my fuddled alien! Don’t worry, I’ll get rid of all those nasty urges in a moment! Then you’ll be nice and compliant - just how I’d like you to be.");
		output("”</i>");
	}
	// merge
	output("\n\nRather than tighten the trigger, she " + (pc.isTaur() ? "pops a swat":"sits on your belly") + " and jams the cup-ended barrel to your [pc.face], covering your forehead, nose, and mouth under the circular dome. Faced with suffocation, your instinctive gasp for air instead ensures the cloudy chemical billowing down the hose reaches deep into your sinuses. Higher mental function is drowned out by a hazy pink mist that envelopes your mind in the makeshift oxygen mask, concentrated, unfiltered discharges of ero-gas assimilating into your nerves, sweltering arousal cooking you from the inside out - prevalent blissful headiness that your consciousness flounders in.");
	output("\n\nWhite freckles shimmer as one elf-bitch becomes two. A flood of saliva that you can’t swallow in your pleasure-paralyzed state pours down your chin, and that damning scent of fruit yet to bloom squeezes on your brain. Chemically entranced, you’re barely aware of being dragged into an alleyway, having your [pc.gear] stripped from you piece by piece, and the lust. Fucking void, the lust!");
	if(pc.isHerm()) output(" Your straining [pc.cocksLightIsAre] doubly-tumescent, and your [pc.pussiesLight] left the beginnings of a [pc.girlCumVisc] trail to this sordid hideaway.");
	else if(pc.hasVagina()) output(" Your [pc.pussiesIsAre] dangerously swollen and puffy, leaking [pc.girlCumVisc] excitement unbidden, ready for a knot or the extra-thick and filling stretch a zaika’s endowment can provide.");
	else if(pc.hasCock()) 
	{
		output(" More rigid than a rutting bull’s, your [pc.cocks]");
		if(pc.isTaur()) output(" rouse" + (!pc.hasCocks() ? "s":"") + " to rutting ardor, bouncing against your undercarriage");
		else output("jut" + (!pc.hasCocks() ? "s":"") + " towards Dhaal’s polluted heavens");
		output(", hefty cockflesh freely beading [pc.cumGem] dollops of gathering virility.");
	}
	else output(" And no outlet, none! You’re a prisoner in your own sexless, lust-frantic form, writhing and moaning, reliant on your captor to use you as she sees fit!");

	var tidSize:Number = pc.biggestTitSize();
	output("\n\nStaring at you with her fluorescent, circuit-laced pupils, the zaika grins and tuts and hums, merrily tracing her six fingers across your [pc.skinFurScales]. Now that she has you all to herself away from the Gyre’s predatory eyes, she pinches your soft and hard places, delighting in the reactions, learning more about [pc.raceShort] anatomy in personalized increments. Even her tail can’t resist rubbing tender spots, oozing perverse curtains of warm lubricating oil in its wake.");
	// pc Has Breasts (If PC Has this, then check for Nipples next, then merge)
	if(tidSize >= 1)
	{
		output("\n\n");
		if(titsSmall()) output("<i>“Wonderful,”</i> she breathes, firm thumbs capturing your [pc.nipplesNoun]. <i>“An alien’s breasts!" + (pc.bRows() > 1 ? " More than two as well, interesting! Do you have a different flavor for each row?":"") + "”</i>");
		else 
		{
			output("<i>“Mmmyes, boobs! An alien’s boobs, just waiting to be touched and milked!”</i> she cries, treating your [pc.nipplesNoun] like the greatest of prizes by way of rough pinches and hellish twists." + (pc.bRows() > 1 ? " <i>“And so much! Most off-worlders carry two breasts, yet you have more? Oh the potential! And the capacity! Perhaps they can be set to make different flavors!?”</i>":""));
		}
		output(" Her roughness colors into gentle prods, searching gropes. She squeezes on either side of your tits until they bulge into pressure-narrowed teardrops, dreamily worshiping the texture of your [pc.breastsNoun], digits rapidly flicking back and forth over your [pc.nippleColor] teats.");
		if(tidSize < 4) output(" <i>“Not as large as they should be, though. A shame, star-[pc.boyGirl]. Small and meek don’t feed the hungry.”</i> Clicking her tongue inside her cheeks, she offers a conspiratorial grin, masterfully massaging your modest mammaries. <i>“But deficiencies can be fixed. Are we not all able to change, after all? Such things are not impossible with all the secrets your masters have given us.”</i>");
		else if(tidSize < 28) output(" <i>“An excellent size. Just like a gifted and happy cow-slut’s should be. Am I wrong?”</i> she quizzes with a dangerous leer that dehumanizes you into the bovine comfort she desires. <i>“As it stands, you’ll fill my tank... and then my stomach! Boobs like these belong in others’ mouths, providing sustenance and enjoyment!”</i>");
		else output(" <i>“Ooh, I saw how big you were before... but up close and indecent, I can’t believe my fortune! Imagine all the milk that you can produce with these beautiful, supple tanks! It’s like you want the whole city to know how productive a dairy-cow you can be!”</i> Her hands sink in so far that half her forearms vanish in bountiful titty. To this zaika, you’re just a pair of boobs to abuse. She graces you with a wink. <i>“You will be the best milking of my life. Once you’ve gotten a taste of how great is to be a Dhaal milk-slut, you’ll be begging for it. Tits this size prove me right!”</i>");
		// pc Has Dicknipples (takes priority over Lact, due to the fact it’s a big nip change)
		if(pc.hasDickNipples())
		{
			output("\n\nUnder a combined chemical and physical assault, there’s no holding back your [pc.dickNipples]. Noticing what’s going on, the milk-fetishist recoils in shock. Once-soft nippleflesh contracts into phallic rigidity, rising out from your [pc.chestNoun] into throbbing salute mere inches from her parted mouth. <i>“W-What!? Why do you have...!?”</i> Pulling together, she hazards a touch on the fervid profusions - they obligingly and enthusiastically twitch. <i>“Tails on your chest! Is there no boundary to the obscenity of your kind - but, what... sort of milk do they make!? Aliens should have milk here, do these make any? What purpose does this biology serve, I will know!”</i>");
			output("\n\nStars-in-her-eyes inspired, the energetic elf bears down on your mammary-dongs by the bases and pumps towards the tips with a know-how that could only come from regularly entreating other, perhaps more fortunate Rushers. Cunning fingers work your chesty handholds to an orgasmic high, and then her conniving lips are gingerly tasting the end, moist tongue snaking out to sample a fat droplet of [pc.milkNoun]. No hesitation. Her fingers press just south of your teat-sheath to encourage a greater flow of bounty and euphoria, and soon she’s on the other side" + (pc.bRows() > 1 ? ", and then the rest":"") + ", oral heat gliding forward on the lust-fattened meats of your exotic anatomy in slobbering delight.");
			output("\n\n<i>“An evolution? It must - yes! ...Maybe! One of conveniences for a milk-bar, easier to pour your famished customers their drinks, and providing far more options when suckling from the tap!”</i> Again she sucks down on one, cheeks hollowing on the reversal and popping exit. <i>“Mwah! Delicious! A girl can have her mouth filled with more of you, and as much of you as they wish! All the way to the creamy cow mound or right at the ends, for the Peer who can’t get away from their work! No spillage whatsoever; the possibilities are endless!”</i> The woman giggles, bringing up her gun.");
			if(pc.milkType == GLOBAL.FLUID_TYPE_CUM) output("\n\nShe doesn’t seem to notice that you’re not jetting milk through those things but why interrupt someone who’s about to get you off?");
			output("\n\n<i>“Let’s not waste any more time, I can’t <b>wait</b> to drain these! I’ll definitely get a bonus!”</i>");
		}
		// pc Has Fuckable Nipples
		else if(pc.hasFuckableNipples())
		{
			output("\n\nQuesting for maternal bounty, the zaika gets the thrill of a lifetime when her forceful digits");
			if(!pc.hasLipples()) output(" fall into the wet pits of your bangable titties");
			else output(" are slurped into the lip-shaped orifices on your exotic titties");
			output(". More boob-loving elf-alien is secreted away into your capacitive burrows as you arch back, breast-centric heat and pleasure blasting your mind as" + (pc.isLactating() ? " [pc.milkNoun]-sputtering":"") + " velvet reflexively clinches on its intruders.");
			output("\n\nThe shocked zaika yanks herself out");
			if(pc.lactationQ() >= 1000) output(", spilling enough [pc.milk] to feed a small family");
			output(". <i>“W-What!? Why do your boobs pretend to be tails, alien?!");
			if(pc.hasLipples()) output(" And why do they resemble mouths?");
			output("”</i> Bewildered though she may be, your attacker gladly plumbs the too-fuckable depths, thumbs pressing on the juicy recesses of your chesty tunnels with an uncertain curiosity");
			if(pc.isLactating()) output(", bathing in streaming [pc.milkVisc] wetness");
			output(". Elastic squish vibrates all around her. <i>“Maybe... I think I understand this evolution!”</i> Right on time her girthy tail slithers up, fervid bulb drooling steady streams of spunky lube over one before diving past the tender entrance, swelling carnality stroking the outermost brim extra-rough. <i>“Yes! That’s it! These are tail-slots! That’s incredible, who came up with this!? Genius! Brilliance! While supping from the alien cow one can experience joy unending inside another tit!”</i>");
			output("\n\nGiggling, the light-plum woman tugs free - unnf! - and gives your boobs an affectionate slap. Perhaps out of curiosity, she thrusts her tail into one boob to its innermost limit.");
			if(pc.isLactating()) output(" <i>“I see I’ve met the most interesting cow-slut of all time! A [pc.boyGirl] like you deserves to be savored before they’re bought up.”</i>");
			else 
			{
				output(" <i>“In any other timeline I’d be sad you lacked milk. But in this one, I can fix that!”</i> A finger pries into your sucky nipples as a way to control the gape of your mouth. Two chunky pills are popped inside, and before your tongue can flick them away she plants the delivering palm over your mouth and massages the length of your throat, forcing a gulp. <i>“There, now let’s see them spurt!”</i>");
				milkPills = true;
				pc.boostLactation(10);
			}
			if(milkPills) output("\n\nScratchy irritation claws its way into your [pc.breasts]. Lo and behold, whatever unlabeled drug was just forced in your gob is causing your [pc.nipples] to feel juicy, sensitive, engorged - you moan like a whore. Unfamiliar liquid weightiness fills your [pc.milkNoun]-jugs to the brim, milk ducts excitedly dilating to fulfill their duties. The zaika swoons and takes your chest for a ride, cupping both of your fountaining blimps to encourage healthy production. Fresh-hot [pc.milkFlavor] ambrosia squirts into her waiting mouth, a receptacle for the sublime boobgasms you’re being made to feel over and over.");
			output("\n\n<i>“Ooohhh... oh... not too much! I don’t wanna get high on your supply juuuuuuusht yet!”</i> she giggles in a very silly voice, twitching eyes running laps. A chemical bombardment has just begun in her mind. <i>“Weee’re gonna get all that OUT so I caaaaan sell it later and relaaax for a few days! Sim-pull!”</i>");
		}
		// pc Is Lactating (Add on to ‘Has Breasts’ if no dicknipples, new PG)
		if(pc.isLactating() || milkPills)
		{
			if(!pc.hasDickNipples()) output("\n\n");
			else output(" ");
			output("Burbling liquid warmth sloshes out of reach, but the molesting drow-alien senses your weighty burden, attracted like a bear to a beehive.");
			if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY) output(" Half-literal, in your case, given the amber treat brewing in there.");
			output(" Determined fingers start from the underboob, steadily spiraling their way towards your [pc.nipples]");
			if(pc.hasInvertedNipples()) output(", gradually exposing the inverted, untouched flesh");
			output(". Then they repeat, but nearer to the peaks, as if she were drawing all the heat in your breast towards those molten points. In your fleeting struggle to find protest you unearth a surfeit of wanton approval, empty grin turning to happy smile. [pc.MilkGem] droplets appear, and the zaika gasps, immediately lunging forward to squirrel the taste away on her palate before it rolls down the mouthwatering curvature of your [pc.milkNoun]-bloated swells. <i>“Exquisite! Oh yes! Milk! Mmmmilk! Yesyesyes!");
			if(pc.milkType != GLOBAL.FLUID_TYPE_MILK) output(" And not just any old milk! This is a new and unique flavor, oh my oh my oh my I can’t believe I get to experience this yesyesyes!");
			output("”</i>");
			output("\n\nThe hands massaging your treasure trove squeeze all at once - you scream, torrents of [pc.milkColor] fluid squirting into the milk-bandit’s maw, positioned just so to catch each and every [pc.milkVisc] offering");
			if(pc.nipplesPerBreast > 1) output(", though the fact your boobs are topped with more nipples than the average [pc.guyGirl]’s means some waste is inevitable");
			output(". Firm, unified tugs wring the first ounces of your tender bounty to pool in her cheeks and and dribble down her throat. Jizz trickles from the cleft of her serpentine bulb, beating the bind of her modesty ring.");
			output("\n\n<i>“Phenomenaaaallll... alien miiiilk....!”</i> She feverishly exclaims, catching some drip on her lips. <i>“Eye WILL be taking - all - of... thiiiis!”</i> She slurs; a chemical bombardment begins in her mind - narcotic and alcoholic all at once. <i>“Buuuuut don’t’chu worry my sweeeet milkee ay-lee’n,”</i> she pauses to smile wider; her genitail swoops in, drooling hardness hovering close to your [pc.face]. <i>“I won’t be leaving you entirely empty.”</i>");
			milkSucked = true;
		}
		// pc Isn’t Lactating (Add-on to ‘Has Breasts’ if no DixNips/FuckableNips, new PG)
		else
		{
			//Moved the "Hmm" dialogue as dicknips and fucknips both end with a dialogue endpoint. Two of those back to back without a line return would be jank, and cutting the Hmm likely doesn't impact the flow. (Sorry if I mangled this, Will!)
			if(!pc.hasDickNipples() && !pc.hasFuckableNipples()) output("\n\n<i>“Hmm.”</i> "); 
			else output(" ");
			output("You twist and squirm, only presenting more of your [pc.breasts] to horny fingers. The agile zaika leans close and whips her tongue back and forth across your [pc.nipples]. The moment she squeezes your boobs into bulging fullness she sucks a [pc.nippleNoun] into her lips. Her cheeks hollow down to pull a little harder, but no life-giving moisture bubbles to the surface. You do your best to hold it together, but the twilight’s neurotic daughter fondles the girth of your mounds in spiraling patterns that kill any and all forms of protest forming in your throat.");
			output("\n\n<i>“Unsatisfactory! No milk, and you strut around on our planet like you’re so important! No matter,”</i> she grins, squeezing extra tight, pressing her own chest to yours. <i>“You just need a little help figuring out why you’re here.”</i>");
			output("\n\nIn a flash the woman’s disappointment evaporates and she cheeks two small capsules. Bringing you into a dispassionate kiss, her tongue carries the spit-coated drugs past your [pc.lipsChaste] and the token resistance your [pc.tongue] mounts. A moan builds in the back of your throat as she imposes herself on you, stern fingers rubbing the front of your neck with an impatient blur to coax a natural swallowing reflex. Once you’ve taken your medicine, she pulls back and refocuses on your [pc.chestNoun], eagerly awaiting the expected changes by scooping up your tits to maximize her enjoyment.");
			output("\n\nTingles of lapping warmth radiate out from the center of your esophagus, and a heavy heat brings your [pc.skin] to a molten blush. Gurgles of discomfort catch in your throat. Panting and sweating, you arch back with little more than a squeak, fluid weight surging in your distending [pc.milkNoun]-tanks. Jiggling and growing into anticipatory palms, explosive detonations of blinding white lactatic sensation follow. Torrents of gushing overflow burst from each [pc.nippleColor] [pc.nippleNoun]. Your captor struggles to catch the initial flows in her mouth, pawing at your liquid-bloated melons as her rosy face is pasted in [pc.milkVisc], boobgasmic relief.");
			output("\n\n<i>“Wooow!”</i> she cries when it subdues to a mere spill, like that of champagne from a bottle. <i>“M-Moooosht Rushers don’t reeeeeact that shtrongly! Yer something else, and I can <b>taste</b> it!”</i> Her giddy mind shows the results of her body’s narcotic-slash-alcoholic reaction to breastmilk - a chemical bombardment. <i>“There’sh sho... mmm... hehe - so mush your boobs can’t even hold it all!”</i> She swoons and twitches, muscles relaxing and tensing rhythmically. <i>“imagine the crowds you could draw! I bet when my packs are full you’ll still be sat here, a nice little distraction for others!");
			if(pc.milkType != GLOBAL.FLUID_TYPE_MILK) output(" And yours is different from the white cream of a dairy-cow! How many are there, I wonder?");
			output("”</i>");
			output("\n\nShe twists the end of a tit for good measure and a thick spurt of life-giving goodness sprays out - into the waiting barrel of her gun. <i>“No more waste. Well... unfortunately, I may miss some. Still! Cow-sluts like you need a very good milking.”</i> Trembling and throbbing, you feel her omni-genitail, hard and slithering, rubbing against your [pc.thighs]. <i>“And, if I might add, a very good filling.”</i>");
			milkSucked = true;
			milkPills = true;
			pc.boostLactation(10);
		}
	}
	// pc flat Breasts
	//Fen note: DA BIG ELSE
	else
	{
		output("\n\n<i>“Oh... these aren’t breasts, are they?”</i> the zaika asks, her living tail slithering across your barren expanse of flatness. <i>“No, they’re not. Nothing! I guess you didn’t have milk here after all.”</i>");
		output("\n\nShe sighs and leans back, her mood pretty much ruined while yours gets stronger, in a manner of speaking. Before you can muster up an insult, you hear the sound of ‘eureka!’ in her snapping fingers.");
		// pc Herm (add-on, no new PG)
		if(pc.isHerm())
		{
			output(" The " + (titsSmall() ? "petite":"busty") + " alien loops her tail around your [pc.cocksLight]");
			if(pc.balls > 0) output(", touching a finger to your [pc.sack] before lifting it up to reveal your [pc.pussiesLight]");
			else if(pc.hasVagina()) output(" and touches a finger to [pc.oneVagina]");
			output(". <i>“Milk is more valuable, but you tricksy " + ((titsSmall() && titsMed()) ? "star-people":"xenos") + " bring us more treats than many flavors of tit-juices.”</i> The nerves in your hermhood light up, targeted stimuli cascading over your erogenous zones. <i>“I think I’ll take yourrrrr mmm... penis milk.");
			if(pc.balls > 0) output(" Your pouch-boob" + (pc.balls > 1 ? "s":"") + " should have plenty for me!");
			output("”</i> Sadly, you can’t find the gumption to laugh at her. <i>“And while I do that... <i>“ Her tail-bulb weaves further down. <i>“...I’ll make sure to give plenty in exchange!”</i>");
		}
		// pc Pussy (add-on, no new PG)
		else if(pc.hasVagina())
		{
			output(" <i>“It’s weird and gross to me, but some girls really like the taste of " + (!titsBig() ? "alien":"xeno") + " egg-hole.”</i> The zaika thief’s still-bound tail wedges itself into your soaking-wet labia, showering itself in [pc.girlCumVisc] ooze. The muscly appendage begins to slide and up and down, tantalizing your folds. <i>“I’ll stimulate this and store it away for just such a bunch of deviants!”</i>");
		}
		// pc Cock (add-on, no new PG)
		else if(pc.hasCock())
		{
			output("\n\nHer tail winds around the livid might of your [pc.cocks]" + (pc.balls > 0 ? " and the roundness of your [pc.sack]":"") + ", seizing the proof of your manhood in living bondage. <i>“Others of your kind called the juice here mmm... ‘penis milk’, I think. It’s not real milk, but it’ll do. Hydras are always desperate to make fools of themselves!”</i> The prehensile appendage heats up and jerks your member" + (pc.hasCocks() ? "s":"") + ", sinuous pleasure driving you closer to needed orgasm. <i>“And while you");
			if(pc.balls > 0) output("r leg-boob" + (pc.balls > 1 ? "s fill":" fills"));
			else output(" fill");
			output(" my tanks, I’ll fill you. It’s only fair, isn’t it?”</i>");
		}
		// Neuter; Absolutely Nothing!! (add-on, no new PG)
		else
		{
			output("\n\n...Caprice emerges right after. <i>“Why do you have nothing!”</i> she fumes. <i>“Where is your milk, and your juices? Strange and disgusting alien, no tails or holes to touch! Except...”</i> Your [pc.butts] clench up, compressing around the sudden approach of her curious tail. The tip pokes at your [pc.asshole], sawing against the only other vulnerable orifice you possess. <i>“Strange. You’re just a doll that exists to be filled and give nothing in return. A sponge only good for soaking up the mess on a floor. So be it! Filling you will be good compensation to having my time so rudely wasted!”</i>");
		}
	}
	// merge
	//[Next]
	processTime(10);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",milkThiefFuckAndMilk2,[milkSucked,milkPills,x,y]);
}

public function milkThiefFuckAndMilk2(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var milkSucked:Boolean = args[0];
	var milkPills:Boolean = args[1];
	var x:int = args[2];
	var y:int = args[3];
	// Vagina always chosen over Anus if the PC has one.
	output("Joining you in naked shame (not that she looks much different when stripped), fasteners are unclipped and unnecessary gear set aside. The purple sock is pulled from her tail organ’s bulb. Its maw opens, quiet squelchiness revealing a throat three-feet deep. Afterwards, she wriggles the fancy bit of jewelry from the neck of free-swishing genitalia. A metallic thud rings out from where the cockring hits the pavement.");
	output("\n\nYou, however, are too pleasure-drunk to do much more than stare at the mesmerizing sway of her chest. They’re quite entrancing now that you’re focused on them. Surely their owner will see to your pleasure soon. There’s no way you’d act against someone with a chest like that. Yes, her hips and ass are practically alarms screaming to anyone who will listen about her distinguished ability to bear kids. But man, those tits.");
	if(titsSmall()) output(" Her pink-hued boobs rotate ever-so slightly, too small for more than an eye-catching wobble, but under no circumstance does it diminish her beauty.");
	else if(titsMed()) output(" Her spunk-laden bust quivers, sloshing with liters of unspent seed. Regardless of what’s bubbling inside the pink orbs, and the lack of nipples, you can freely admit that she has a high quality rack.");
	else output(" Round, shapely plateaus - that’s one way to describe this addled zaika’s succulent cleavage. Gallons of spunk slosh within the hefty spheres, lending her broad bust a heaving, orgasmic quality.");
	output("\n\n<i>“");
	if(milkSucked) output("HAaaAa, aren’t you silly - my boobs aren’t like yours, but thas funny. You’re pretty funny.");
	else output("You know these aren’t like your star-people’s breasts, right?");
	output("”</i> The bandit bends in and gives you a kiss on the cheek, " + (milkSucked ? "sloppy":"smooth") + " tongue following your jawline from [pc.ear] to [pc.ear].");
	if(milkSucked) output(" <i>“Guess it makes.... Makes - sensh. Look what your milky titties are doing to me!”</i> She’s squinting with extreme pouty lips. <i>“Buuuut I saw all those vid-vidjeos before! The really slutty kind, y’know, where your tails are so big that you can get stuck under ‘em! You star uh, I mean milk-people reeeeeally like boobies, and who can blame you!? Look at the <b>power</b> of titty! I’m already a mesh!”</i>");
	else output(" <i>“Don’t get too used to them. Aliens must really like being milked I guess! To the point all your kind think about are big, round, heavy titties!”</i> Her chest puffs up to support a triumphant smile. <i>“I saw it all in those videos. Boobs have a tranquilizing power in your culture. Don’t try to deny it; pornos don’t lie. You sluts only wanna think about tails and hips and fat, jiggly udders!”</i>");

	output("\n\nIn some sort of friendly gesture, she arches up and presses the flawless, supple diameters of her boobs to your [pc.face], rocking her shoulders and gently batting their weight against your [pc.skinFurScales]. ");
	if(milkSucked) output("<i>“But hey, I’m gonna make you a mesh too!”</i>");
	else output("<i>“Get nice and turned on for me, alien...”</i>");
	output(" She grabs your head, and your sight goes from a sea of brilliant strawberry pink to warm blackness. Churning nothingness; you can feel the swell of her arousal, new liquid brewing in the ");
	if(titsSmall()) output("otherwise modest boobies of your once-foe");
	else if(titsMed()) output("muffling smother of zaika tits");
	else output("all-consuming weight of her chesty expanse");
	output(". " + (milkSucked ? "<i>“I’m gunna make you feel like you make me feel! Totally! I’m gonna milk you super good and make you feel super-er good! Buuut you’ll do what I say, right? Cuz you gotta listen to me to get to feel like this!”</i>":"You’ll do what I say, right? It’s sad that you don’t have any milk! But I do, in a manner of speaking...”</i>"));
	output("\n\nThe voice comes from everywhere and nowhere. Trapped in the ");
	if(titsSmall()) output("narrow valley");
	else if(titsMed()) output("wide fissure");
	else output("deep chasm");
	output(" of her compelling " + (silly ? "chesticles":"bosom") + ", you can’t look away, can’t turn your [pc.ears] off of the sound and its hypnotic frequencies. And then there are the fingers, the soft digits, maybe even her tail too, all massaging and drawing you deeper into this power. It’s a ludicrous thing, but hopped up on aphro-gas you’re only in a position to agree because the submissive coaxings will not be denied.");
	// She will Milk the vagina if the PC somehow doesn’t have boobs but is a girl. It’s like doubling up on the neuter duff.
	// pc Taur (In doggystyle, always)
	if(pc.isTaur())
	{
		output("\n\n<i>“" + (milkSucked ? "A’ight, you sit down and take it... um, easy. Yeah! Right up on the wall here, layin’ out, so it’ll be super easy for me!":"C’mere, you go ahead and sit down and rest. Right up against this wall, nice and laid out. Make it super easy for me, okay?") + "”</i>");
		output("\n\nYou’re brought out of the sheltering darkness and seared by ambient neon. You do as you’re told by the titillating zaika, laying your animal frame against one of the buildings responsible for this near-claustrophobic alley. Once you’re set, she climbs on your wide back and brings your arms behind your waist. <i>“Theeeere you go! I love how horny Rushers do what they’re told! Sorry you can’t get any boobies like this, but I’m sure if you put your mind to it, you’ll see them by feeling them.”</i> Indeed! They’re pressing into your back, distracting you from the looping bind of her tail ‘cuffing’ your wrists together and crawling towards your [pc.ass]. Agonizing pace, too. <i>“");
		if(milkSucked) output("Mmmyus.... Jush like a milk shlut should be!");
		else output("Wonderful. You have the makings of a milk slut" + ((!pc.isLactating() && !milkPills) ? "; well, if you had anything to offer on that front":"") + ".”</i>");
		output("\n\nFingers <i>made</i> to squeeze and touch your [pc.nipplesNoun] snake under your [pc.arms] and grab hold of the [pc.nippleColor] pebbles. <i>“This is the best part, mmm....”</i> Your head swims, and your tongue lolls out" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " to your [pc.chestNoun]":"") + ". Her voice presses harder, <i>“Milk sluts get to feel this every day. You just get to sit back, give us happy milk-brain, and be happy too! Being milked, the pleasure of it - fuck, maybe I’ll make enough cash one day to get my own tits? My own milk? I know that would be possible with your tech!”</i> The pinching intensifies, and you feel the phallic projection of her lube-dribbling tail casually squeezing its way between your [pc.butts], glazing your rump in hot spatters of ample prejaculate, prodding at your [pc.vagOrAss " + y + "].");
		if(pc.isLactating() || milkPills) output("\n\nThe cold synthy material of her gun suddenly presses onto " + (pc.totalBreasts() == 2 ? "your right boob":"one of your boobs") + ", sealing around the nipple" + (pc.nipplesPerBreast > 1 ? "s":"") + ". Locked into place by a nefarious clicking mechanism, an idle suction builds up under the dome. Your teatflesh grows puffier under the constant vacuuming stimulation. In a tone meeker than you thought you could summon, you sigh, dreamily. It’s not so bad. It’s nice and warm, and you’re being massaged from every angle. What’s not to like? Mmf, and that firm, insistent pressure back there, like you’re about to be stuffed full at a moment’s notice! <i>“Aww now that’s what I like to hear! Milk sluts should enjoy this part the most!”</i> She purrs in your ear, nibbling on it. <i>“Don’t forget! Good cows mooooo! Like that! So make sure you give it a try, ‘kay?”</i>");
		// cocksBeingMilked:
		else if(pc.hasCock()) 
		{
			output("\n\nPenetration into something cold and plastically ribbed alerts you to something amiss. In your periphery you can see her stretching a two-toed foot to your [pc.cocksLight], holding her milking gun steady. ");
			if(pc.cockTotal() > 1) output("One of your dicks");
			else output("Your dick");
			output(" is trapped inside the synthy dome barrel, up to the [pc.knotBallsHilt " + x + "]. <i>“I won’t be leaving without something to make the effort worth it. Good thing that your tail milk is valuable, too. Don’t worry about that none - after I push this button, you’re gonna find out just how good it is to be a milk slut.”</i>");
		}
		// pussiesBeingMilked:
		else if(pc.hasVagina()) output("\n\nFor a few terrible seconds, the zaika disappears. As you’re missing her closeness, you feel something tight slip onto your [pc.pussiesLight]. A mechanical click reaches your [pc.ears] as she returns, and an idle, warm suction builds up down there. <i>“Sorry about that. Just had to get ready.”</i> The return of her hands to your [pc.chestNoun] provokes an immediate swooning response - that, and the newly-pleasant warmth of her tail weaving across your sphincter. <i>“Now, when I push this button, you’ll find out just what it’s like to be a cow slut. In your own way, of course. This will certainly be unique...”</i>");
		else output("\n\n<i>“Imagine how much nicer this would feel if you had those kinda boobs. Or... anything else. In spite of all your advantages, you’re getting fucked and milked and made so happy by me.”</i> Hot breath washes over your shoulder in a wistful sigh. <i>“Two out of three won’t be so bad.”</i>}");
	}
	// pc Not Taur (PC on all fours for Anal, Missionary on Back if Vaginal)
	else
	{
		// pc Vagina
		if(pc.hasVagina())
		{
			output("\n\n<i>“" + (milkSucked ? "Mmhmmm, y’know what... you should be on your back and lemme milk you. I wanna see aaaaall you’ve got while I make you into my fave-rit cow!":"You know, I think you’d look great on your back, spread out, showing me everything about yourself. C’mon, do it for me.") + "”</i>");
			output("\n\nCompliance is not only easy but it feels good. Good enough to ignore the emptiness you feel separating from her cleavage’s protection. You’re in a dream" + (pc.tailCount > 0 ? ", wagging your [pc.tails]":"") + ", seamlessly transitioning from a bum lean to lying down on the ground" + (!pc.isNude() ? " on top of your discarded gear":" atop the smooth rubbery film she used for clothing") + ", " + (pc.legCount > 1 ? "spreading your [pc.legs]":"upthrusting your crotch") + " to reveal" + (pc.vaginalPuffiness(y) > 0 ? " the puffy swell of":""));
			//codernote: parse oneVagina early, and if it includes <i>“swollen”</i> or <i>“puffy”</i> replace it with <i>“plump”</i>
			var oneVag:String = ParseText("[pc.oneVagina]");
			oneVag.replace("swollen","plump");
			oneVag.replace("puffy","plump");
			oneVag.replace("plush","plump");
			output(oneVag + ", the vulva plush and throbbing. Sensual desire visibly steams around it.");

			output("\n\nTo any other zaika, it’d just be a weird egg-slit. But she knows the truth; she’s an expert in the methods of teasing a [pc.boyGirl] down there. After the supple rope of her multi-purpose organ has bound your wrists together, it snakes towards your nethers. What you feel rubbing");
			if(pc.balls > 0) output(" under your ballsack");
			else if(pc.hasCock()) output(" under your [pc.cocksLight]");
			else output(" just under your loins");
			output(", confidently swerving along the curvature of your feminine cradle, is the tail of an experienced breeder. The sounds you’re making are clear proof that she knows you better than you know yourself.");
			output("\n\n" + (milkSucked ? "<i>“Did you know we’re getting like, cyber-pussy mods cuz a lotta girls really like alien pussy? Gettin’ super wet while they’re milked and fucked, and loooving it!”</i> She sticks her tongue out, humming lewdly. <i>“They do all sorts’a things too! More than what uh, um, evalushion wanted! I think...?”</i>":"<i>“A lovely, lovely pussy,”</i> she praises. <i>“It’s not an egg-slit... but it can be. Your holes serve more purposes than they were designed for.”</i>") + " She lowers herself onto all fours and crawls up towards your [pc.face], a wolf closing in. <i>“" + (milkSucked ? "I know all bouts’ pussy!":"I know,") + "”</i> she coos, looming overhead; the fast-creeping sensation and adrenaline rush of being cornered is toe-curlingly pleasant, as is the intensifying foreplay. <i>“" + (milkSucked ? "Rushers are my specialty! Cuz I love all of you off-worlders, I learned all about you!":"Because I’m not some engine-huffing moto-cultist. I care about off-worlders. Rushers are my specialty.") + "”</i> A sweat-seeking tongue darts out, coiling around your chin before slipping past your [pc.lipsChaste]. Quaking shudders tremble in your [pc.thighs]. Craving affection and relief, you try to touch her, but it doesn’t work. You’re at her mercy, bound and squirming.");

			if(pc.inHeat()) output("\n\nYour body bucks forward. Not by your will, but by the heat of breeding season tingling in your womb" + (pc.hasVaginas() ? "s":"") + ". It doesn’t matter where you get the spunk from, you just need filled! <i>“Hmmmm?”</i> your captor queries, nostrils flaring. <i>“T-That smell um...”</i> Her cheeks turn near-black from an instant blush - she’s reacting to your pheromones! And so is her tail, by the feel of it! It just got a bit harder, and thicker, and your body senses it! <i>“" + (milkSucked ? "Ohhhhhhh, you must be wantin’ some children! That’s a pretty popular kinda smut in our circles! And I get to breed you too? Oh this is gonna be fun!":"<i>“Ooh, that’s the smell of animal heat! I’ve seen the genre of porn this was in, really popular, by the way! So I guess you wanna get some kids huh? I think I’ll try! You look like you need a really good stuffing!") + "”</i>");
		}
		// pc Buttehole
		else
		{
			output("\n\n<i>“" + (milkSucked ? "Awl-rite! Jush follow me and you’re gonna see how good the cows get it around here! Yer gonna like this the most!":"Let’s get you ready. Just follow me, it’ll be fine. When you’re in position, you’ll start to figure out how good a cow gets it around here.") + "”</i>");
			output("\n\nFingers with cybernetically-powered grip strength close on your triceps and pull you forward. Your eyes have to cope with Dhaal all over again, no longer submerged in teatless zaika boobflesh. Laying your head on her thighs, she whispers into your [pc.ear], <i>“" + (milkSucked ? "Arms back here sweetie-cow!":"Arms behind your back.") + "”</i> In no rush to rebel, you comply. The sinuous texture of her three-foot tail-organ loops around your wrists and binds them together, and then the head gently caresses its way in the direction of your [pc.ass] with the air of a dominatrix tickling her pet’s unclenching muscles. It adjusts to follow the arching curve of your spine, washing you inside and out with clusters of wet sensation.");
			output("\n\nSix delicate fingers tilt your chin upwards, and you’re staring " + (!titsSmall() ? "through wine-opal cleavage ":"") + "into the coquettishly-cast eyes of a considerate creature. <i>“You are in very good hands.”</i> Speaking of, they lift you higher, and higher, until you’re pressed back up to the silkiness of her pink skin, nuzzling into that spot you’re sure her heart is at. Potent lurching stimulation rises up at your rear - your [pc.asshole] is serving notice of possible home invasion, but your brain is currently on unpaid leave. The fat head of her obdurate tendril is swirling that supple entrance, pressing a fraction of an inch closer with every cycle. <i>“" + (milkSucked ? "Unlike erry’one else and their gangster friends, Rushers are my specialty! Cuz I care about ‘em lots!":"Do you know why? Unlike those filthy, desperate gangsters, I know all about your kind. Rushers are my specialty.") + "”</i> An augmented tongue, six inches in length, lashes out in advance of the kisses being peppered down your nose to your [pc.lipsChaste]. In your state, all you manage is a shuddering tremble, craving affection and relief. She has you, bound and squirming, at her mercy.");
		}
		// merge
		if(pc.isLactating() || milkPills)
		{
			output("\n\n<i>“And the milk especially!”</i> Her squeal comes after the break of the kiss. Something cold and round and encompassing surrounds one of your [pc.milkNoun]-filled [pc.nipplesNoun]. Somewhere, you notice that something big and heavy with a hose has been placed onto your [pc.breastsNoun], but you don’t mind it, because it feels good. Locking into place with an ominous click, the mechanism starts up, and an idle vacuuming stimulation assails your trapped tit. Not unlike a mouse’s squeaking, your voice raises to dreamy gratification. The coldness is gone, and now there’s just a lot of pressure and thrice as much pleasure. <i>“Letsh get started, my milky, crrrrrreamyyy alien,”</i> she says, pouring her words directly into your [pc.ear]. <i>“Will you moo for me? All cows moo. When you feel really good, try it! You’ll... you’ll... mmm... you’ll see why.”</i>");
		}
		else if(pc.hasCock())
		{
			output("\n\n<i>“Their fluids most of all,”</i> she says, breaking the kiss. In the next few seconds, you learn what it’s like to be fitted with a harness. She plunges [pc.oneCock] into the barrel of her liquid extractor deep enough for your [pc.cockHead " + x + "] to traverse the bumpy inner linings of its connecting hose. After an ominous click the wide dome-end of it seals down and traps your penis up to the [pc.knotBallsHilt " + x + "]. Braced against your pubic mound, the weapon-turned-milker produces an idle suction and ample warmth. <i>“Alien tail milk is just as valuable as their titty-cream, believe it or not. I hope you’ve got plenty to give me. Trust me, you’re gonna <b>want</b> to give me everything when I hit this button,”</i> she smiles. <i>“No downsides to being a milk slut.”</i>");
		}
		//pussiesBeingMilked:
		else if(pc.hasVagina())
		{
			output("\n\n<i>“But I admit, I don’t see the appeal of these juices.”</i> The kiss breaks. On that shivering note, the dome-end of her gun is fitting to your [pc.pussiesLight], sealing your feminine cradle" + (pc.hasVaginas() ? "s":"") + " in an airtight environment. Idle suction pulls your [pc.clits] into erectness. Something clicks, and she turns her attention back to you with a leer. <i>“Once I hit the button, you’ll find out why being milked is great. You can just... let go. It’s that easy!”</i>");
		}
		else output("\n\n<i>“I’m hurt you don’t have any milk or juice - it wounds me! I could make you feel sooo good if you had boobs for me to fill with cream, and then let me drain ‘em!”</i> Both sets of her lips press tight on your upper and lower pairs. <i>“But let’s get started anyway. Maybe I can convince you that you’re missing out.”</i>");
	}
	if(pc.isLactating() || milkPills)
	{
		output("\n\nTwo things happen faster than your consciousness is ready for. A button is pushed, and a universe of discovery and amazement happens in that direction, yet what transfixes your mind is her tail. Her milker activated to a heavy pulsing suction at the same moment her cock-tail lunged into your [pc.vagOrAss " + y + "]. The fullness of her girth rams into your " + (y >= 0 ? "honeypot":"rear end") + " without remorse, fucking loose extra [pc.milkVisc] volume in rapid thrashes.");
	}
	else
	{
		output("\n\nBraced against your captor, the fat head of her tentacle manages to wiggle past your [pc.asshole] and, when assured of its capability to enter, thrusts into the");
		if((pc.hasVagina() && pc.vaginalPuffiness(y) > 0) || (!pc.hasVagina() && pc.analPuffiness() > 0)) output(" puffed-up");
		output(" orifice with a gleeful cry. That you’re finally being fucked after all her teasing and taunting is a dream come true. You nearly choke on the delight crawling up your throat.");
	}
	// Three feet of 2-inch thick tail is gonna stretch ‘ya out.
	//Actually only 115 volume. Basically 3x a 12" dick, while actual 36"ers tend to be 6" wide, resulting in an exponential cuntblasting!
	if(pc.hasVagina()) pc.cuntChange(y,115)
	else pc.buttChange(115);

	// pc Vagina Looseness Low
	if(pc.hasVagina())
	{
		if(pc.vaginas[y].looseness() < 3)
		{
			output("\n\n<i>“Ouumm, yes! Delicious alien tightness!”</i> Overcome by three full feet of zaika tail, your [pc.vaginaColor " + y + "] muff-walls yield to her cunt-stuffing tendril. <i>“Give in to me, let me have it all. I will make you ready for more, and more!”</i> The head of her porny tail remains round like a clenched fist, but it’s contracted into a rigid phallic implement that splits open your [pc.vagina " + y + "], earning a steady, drooling trickle of your long-denied bliss. It conquers the virginal tightness of your sacred valley, savoring the climactic squeezings of your thirsty lushness. Rippling inner muscles do nothing to hinder the determined progress of alien advancement. Its shape can be felt bulging against your tummy, widening the hole from which [pc.girlCumGem] nectar gushes freely.");
		}
		// pc Vagina Looseness High
		else
		{
			output("\n\n<i>“Oooh! I love tight Rushers but there’s something - no, a lot of really good things to be said about a trained slut!”</i> All things considered, about as well as you can understand about this situation right now, you can’t deny having a loosened cunt is saving you many magnitudes of pain. With experience and relish the zaika’s elastic cock-tendril rams itself into your trained quim, many spongy inches, hardened into phallic rigidity, vanishing into the copious space beyond. Where otherwise you’d need a throbb-star in there to feel something, you have a vibrating tail pumping past the flow of long-denied bliss and sending a spark of vaginal ecstasy into your fluttering heart. Your pussy finally gets the return signal to clench, and it does so gloriously. <i>“Woow; did you get away from your owners? You’re taking all this tail like a high-priced cow!”</i>");
		}
	}
	// pc Anal Looseness Low
	else if(pc.ass.looseness() < 3 && !pc.hasPerk("Buttslut"))
	{
		output("\n\n’A-Aah! So tight!”</i> she moans, clinging to you hard. Every inch of thickset zaika fuck-tail fed into your backdoor opens a stripe of pain from your hip to your neck, tearing in the direction of your nape. She’s splitting you in half");
		if(pc.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) || pc.ass.wetness() > 0) output(" despite the natural lubricant it produces");
		output(". The pumping tendril climbs into your colon, its head rooting around up to no good. <i>“W-Wow! C-C’mon, you can handle it!”</i> When you catch your breath, sucking in your gut, the violated ring of your collaring sphincter manages to clench down on the rubbery pink vine swishing around up there. Gentler motions, and real pleasure, soon follow.");
	}
	// pc Anal Looseness High or PC is Buttslut
	else
	{
		output("\n\n<i>“Yeeeessss, opening up like a broodwhore! Just like my favorite alien vid! I bet you could handle two or three zaika all together!”</i> The nerves in your [pc.asshole] light up at the attention of something rigid and phallic, suckling at the winding tendril of bowel-stuffing intent. Your sphincter rhythmically clenches like the trained dick-pleasing vice it is, squeezing and pleasing the milk-thief’s intruding organ masterfully, slurping up yet more strawberry stalk into its depths. <i>“Oh f-f-fuck! Oh Wow! You really know how to handle a girl! I bet you’re just misplaced property, cuz you take it soooo well!”</i> Elastic and stretched though your slutty ass may be, it meets a worthy challenge in the two-inch thick endowment filling your grateful " + (pc.isFemboy() ? "boihole":"butthole") + " in eager lurches.");
	}
	// merge
	// Milking Boobs
	if(pc.isLactating() || milkPills)
	{
		output("\n\nWhat you do next is heave a gasping squeak. Your whole uncontrollable being is astonished in that second - overcome. It’s not the result of quivering climax or deep, wonderful sex. It’s the ounces of [pc.milk] welling up inside your [pc.breasts]");
		if(pc.lactationQ() >= 1000) output(", the pints and the liters raging through your ducts. It’s the gallons that burst out into the milker in that inexpressible way");
		else output(". Thin, squirting arcs of ambrosia worth their weight in gold hoovered up until there’s nothing left to give");
		output(". There’s no telling where the most intense stimulus comes from. You’re pulled to the reaming you’re getting and then back to the hardcore squirting of your bosom, loosing torrents of [pc.milkVisc] [pc.milkGem] fluid in breathtaking salvos.");
		output("\n\nRight now, every part of your body is being set off; you’re being tugged down two dangerous avenues of pleasure. Her custom milk-machine is relentless and tireless, a machine capable of making longer-lived New Texans into incapacitated husks. It’s so intense that you can’t focus on the pleasure you’re being forced to feel. It’s so powerful that your body refuses to act on autopilot. Is it because of her ero-gas? Is there something more to it?");
		output("\n\nToo fucked to care, you slip into uneven, oscillating, unseeing euphoria. Rather than try in vain to maintain any sort of cognizance you surrender to her thrusts, the spurts, the jolts and the shocks. Can anyone outside the alley hear you now?");
		if(pc.isTreated() || pc.bovineScore() >= 3) output(" Can they hear you mooing? Can they hear the cow[pc.boyGirl] being milked and loving every second of it?");
		else output(" Are you mooing? It’s absurd, but it’s possible.");
		output(" Each blast of steaming-hot lactation, guzzled up by the zaika’s pump and safely stored in her backpack, is worth a hundred orgasms. Endless [pc.milkFlavor] goodness flows, filling the bandit’s tanks full of motherly nutrition. Rich, [pc.milkVisc] [pc.milkNoun], for her and her kind to get drunk and merry on, and for you to enjoy being robbed of.");
		if(!pc.isTaur()) 
		{
			output("\n\nHer too. Plump amethyst lips seal around " + (pc.totalBreasts() == 2 ? "your free":"a free") + " tit, drawing out [pc.milk] in thirsty drags. Being fucked, being milked, and breastfeeding: three unique experiences coalescing into the most profound pleasure. You don’t have to move, don’t have to think, just hold it together and let yourself be drained.");
		}
	}
	// Milking Cock
	else if(pc.hasCock())
	{
		output("\n\nYour [pc.tongue] falls out of your mouth like " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "an unwound party ribbon":"a submissive pet’s") + ", followed closely by a hoarse gargle. The stimulation [pc.oneCock] endures is unlike the joys found in a tight hole or suckling mouth. If not for the [pc.skinFurScalesNoun] between you and the device, it may as well just pull " + (pc.balls > 0 ? "your [pc.ballsNoun]":"your prostate") + " out. It’s doing more than draining your [pc.cum]; it’s doing <b>much more</b> than milking your dick. You’re being harvested as if you were some farmyard animal, squirming around and utterly overcome by the weaponized pleasure.");
		output("\n\nAnd it doesn’t hurt. Not even a little.");
		output("\n\n[pc.Cum] flexes into the hose" + (pc.cumQ() >= 1000 ? ", and it never has a chance to pool":"") + ". You cum, and you cum, spurting [pc.cumFlavor] bimbo-feed like a broken-down fire hydrant one second and unloading thick ropes into the machine." + (pc.balls > 0 ? " Your [pc.sack] struggles to keep up with the production, redirecting as much arousal as possible to spur ejacualatory imperative.":"") + " Her tank’s appetite for [pc.cumNoun] is bottomless. You wonder, in the most distant recesses of your blank mind, how it must look. Are you doing a good job? Are you as virile a " + (pc.mf("stud","herm")) + " as she thinks you are? Is there more spooge than sperm arcing into that merciless tube?");
		output("\n\nNo way a New Texan could stand up to this." + (pc.isTreated() ? " You’re Treated, and look at how you feel! These zaika are modern day cattle rustlers!":"") + " [pc.CumNoun] vents in bulk, and into your [pc.vagOrAss " + y + "] she vigorously thrusts, rose-pink flesh pounding urgently into pre-slathered muscles. Head swimming, you surrender to uneven euphoria, riding the waves in a positive loop of perverse existence.");
	}
	// Milking Pussy (Possible pussy pumping effect!?!?!)
	else if(pc.hasVagina())
	{
		output("\n\nVaginas were never meant to be milked, but the zaika never got that memo. Pussy Pumps exist in the ‘verse, and those are fun little sex toys for the occasional bit of lewd fun in the bedroom. This thing, however. This fucking milker attached to your cunt is a top-of-the-line masterpiece, an artisanal nut-extracting, bosom-draining tool. Unparalleled suction yanks and tugs and hauls on your [pc.clits], sparking incandescent joy through the rest of your sodden hole. Every seeping ounce of [pc.girlCumVisc] lubricant and [pc.girlCum] is suckled into the unforgiving hose, pumping thirstily all of your alien treasure.");
		output("\n\nIs it really worth it to harvest femcum of all things? You don’t have time to consider the salacious details. Not with her tail railing you so hard, sawing into your poor, abused bumhole in ecstatic lurches and fervent spirals. The cool, soft edge of the milk-gun’s warm, synthy barrel slides and squishes against your sensitive mons");
		if(pc.vaginalPuffiness(y) <= 1) output(", air pressure reshaping your nethers and drawing out more passion-red cuntflesh");
		output(". No sweat, no girl juice remains. Your [pc.vaginasLight]" + (!pc.hasVaginas() ? " is a rupture":" are ruptures") + " in an orbiting battleship, vulnerable to the terrible sucking decompression of milking space. And yet this feels too good to be believed.");
		output("\n\nYou’re being robbed of all you have, but you still feel slick in an entirely pleasant way. Is it because you’re cumming yourself stupid? Is it because you haven’t been able to catch your breath for... yeah, you’ve lost track of time. Milkers were designed to suck on everything and do it well. In hindsight, your [pc.pussiesLight] never had a chance. The reservoir drinks deeply of your creaming cunt" + (pc.hasVaginas() ? "s":"") + ", whirring softly as it reduces you to something less than a person. Lurid juices leak, spurt" + (pc.isSquirter() ? ", and squirt in crazy fusillades of burbling ladygasm":", and occasionally squirt") + "! The barrage of pleasure, from the front and the back, is an indefatigable force of nature that is systematically redefining your concepts of pain and pleasure, reconstructing you from the euphoric stew you’ve been melted down into.");
		output("\n\nYou’re just a faucet. You cum because it’s all you’re required to do.");
	}
	// No Milking
	else 
	{
		output("\n\nUndeterred by her inability to milk you, the zaika thief reaches further into your [pc.asshole], spurting torrents of fuck-drool in lusty thrusts. The animalistic yowls she gives tells you how much she enjoys giving it to you, rough, deep, and with more tail than your tailhole knows what to do with. You’re nothing more than a cock-socket, only good for taking jizz and dick, fervidly, submissively. Her hands drift to touch your [pc.skinFurScales], obscenely flush at the height of her ero-gas’ capabilities. You’re her fuck-toy for the night. The least you can do is take her ");
		if(titsMed()) output("considerable ");
		else if(titsBig()) output("massive ");
		output("loads.");
	}
	// merge
	output("\n\n" + (pc.isTaur() ? "Nipple-less breasts, smooth and swollen with hot burden, rub against your back.":"You’re drawn up into the zaika’s excitement-laden boobflesh, back to familiar darkness.") + " Her bulb twitches inside the wild clamping embrace of your [pc.vagOrAss " + y + "]. Her trembling, empty breaths tickle your [pc.ears]." + ((pc.isLactating() || milkPills) ? " Her gun carries on in that aggressive way, milking potent volume from your paralyzed body, uncaring for the way it blows your brain apart.":"") + " Momentous arousal condenses down into the focal points of your critical system failure, sexual anarchy exploding in every tendon, every bone.");
	output("\n\nSyrupy tail-cock plows into you");
	if(!pc.hasVagina()) output(", almost completely inserted into your capacitive burrow.");
	else output(", half of itself vanishing into the gaped broodhole you once had the audacity to call a cunny");
	output(". Too many feet of prodigious tenta-tail reams your hole, brutalizing your tenderest places. Its enjoyment of you never stops, and each orgasm it wrings out of you seems only to reinvigorate it. Honestly, it’s unfair to say she’s not giving you a chance - you get two seconds of rest when you cum. Two seconds to suck in air before you’re banged a thousand-and-one-Dhaal-nights.");
	output("\n\nSo used to your own satisfaction, you do more than simply notice it when she cums. A screech of pleasure rushes through your triumphant enemy, and a train of sticky climax stretches through her serpentine length, blasting into your [pc.vagOrAss " + y + "] with enough strength to physically off-balance you. Each spasm of spunky release defeats the climactic tension of your sore body. Zaika jizz flows through the double-tied loop around your wrists, warm anodyne to the strain of hard sex. You’re aware of it, vaguely, and blissfully, swiftly overflowing into your gut and sputtering out of the corners of your dirty, used orifice.");
	if(!pc.hasVagina()) output(" Salty, creamy cum can be tasted. The answer to why is quickly felt in the upchuck of seed. She’s jamming so much nut into you that it’s going all the way through!");
	output("\n\nThe horny girl’s cock-tail balloons, thick, rupturing bursts of spunk plastering into you. At the very height of pleasure, your body finally gives into the savage carnality it has been forced to experience.");
	processTime(45);
	for(var i:int = 0; i < 5; i++) { pc.orgasm(); }
	// sceneTag: processTime
	// sceneTag: PC Cums. A lot.
	// sceneTag: PC is fully drained of milk if boobs were used.
	// sceneTag: Possible pussy pump? Heh heh.
	if(!pc.hasVagina()) pc.loadInAss(enemy);
	else pc.loadInCunt(enemy,y);
	clearMenu();
	addButton(0,"Next",milkThiefFuckAndMilk3,[milkSucked,milkPills,x,y]);
}

public function milkThiefFuckAndMilk3(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var milkSucked:Boolean = args[0];
	var milkPills:Boolean = args[1];
	var x:int = args[2];
	var y:int = args[3];
	var gotMilked:Boolean = milkPills || pc.isLactating();
	output("On jagged ground you awaken, sweaty, alive, and quite alone. Everything is fucking sore. Holy shit. Ugh, you’re so heavy as to look" + (pc.isPregnant() ? " extra":"") + " pregnant, too! While attempting to stand up, you bump your head into something dense. If anything, it takes your mind off the gravid weight and existential <i>emptiness</i> of your form.");
	//Changed how this worked a bit since it's possible to be lactating but dry, forcing the milkpills, but the big milkpills check a notch down doesnt work for that. Shifted that into the "isLactating" version with a bonus check to make sure the pill TF still goes thru.
	if(pc.isLactating() || pc.canLactate()) 
	{
		if(milkPills) pc.boostLactation(20);
		output(" Your [pc.breastsNoun] are...");
		//infiniteMilkPerk?:
		if(pc.hasPerk("Ever-Milk")) output(" not empty, but you won’t be breastfeeding any time soon");
		else output(" completely dried up, exhausted raisins with visible, over-ripe veins");
		output(".");
		pc.milked(100);
	}
	//else,pcForcedToLactate,Faded:
	else if(milkPills) 
	{
		pc.boostLactation(20);
		pc.milked(100);
		//no milkie
		if(!pc.canLactate()) output(" At least with that emptiness comes the knowledge that you aren’t still lactating. Looks like that stuff was temporary. If you don’t want to be turned into Dhaal’s latest milk-tank you’re gonna have to watch yourself around here!");
		//forcedToLactate,StillLactating:
		else output(" Empty though you may be, new liquid generation can still be felt inside. Whether her drugs were the good stuff or came from off-planet, there’s no denying <b>that you’re now lactating.</b> Given the zaika’s communal craving for alien milk, this may make you a tempting and vulnerable target in another creamy caper. Better cover up!");
	}
	output("\n\nTaking stock of your surroundings, the milk thief had the common courtesy to drag you over behind some dumpsters, and on your way out you had the poor luck of whacking into some detritus sticking out. And there’s your stuff! An inventory reveals... nothing taken!");
	output("\n\n<i>Because your ");
	if(milkPills || pc.isLactating()) output("[pc.milkNoun]");
	else if(pc.hasCock()) output("[pc.cumNoun]");
	else if(pc.hasVagina()) output("[pc.girlCumNoun]");
	else output("body");
	output(" was more valuable,</i> you sigh.");

	output("\n\nDhaal awaits. Hopefully you won’t have too much trouble making your way through the streets like this...");
	//handle potential vag-puffing?
	if(!pc.hasCock() && pc.hasVagina() && !gotMilked)
	{
		var puffable:Boolean = false;
		if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) puffable = false;
		//Lower odds once fully "pumped"
		else if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_PUMPED)) puffable = (rand(6) == 0);
		else if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) puffable = (rand(3) == 0);
		else puffable = (rand(2) == 0);
		//If we rolled puffable, lez do it:
		if(puffable) 
		{
			pc.inflateVagina(y);
			if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output(" It’s hard enough to walk now that your [pc.vaginaNoun " + y + "] remains <b>permanently somewhat pumped</b>.");
			else if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_PUMPED)) output(" Your <b>pumped and swollen</b> [pc.vaginaNoun " + y + "]-lips rubbing incessantly against one another will make your journey all the more arduous.");
			else if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_HYPER_PUMPED)) output(" Closing your [pc.thighs] is hard enough when your <b>[pc.vaginaNoun " + y + "] remains pumped to an absurd degree</b>.");
		}
	}
	//maybe a bit of dickgrowth from the suction?
	if(!gotMilked && pc.hasCock())
	{
		var adjustment:Number = 0;
		if(pc.hasPerk("Mini")) adjustment = -0.1;
		if(pc.hasPerk("Hung")) adjustment = 0.1;

		var cGrown:Boolean = false;
		//Always if below 8
		if(pc.cocks[x].cLength() < (8 + adjustment * 20)) cGrown = true;
		//Sometimes if below 14
		else if(pc.cocks[x].cLength() < (14 + adjustment * 30)) cGrown = (rand(2) == 0);
		//rarely if below 24
		else if(pc.cocks[x].cLength() < (24 + adjustment * 40)) cGrown = (rand(3) == 0);
		if(cGrown)
		{
			var old:Number = pc.cocks[x].cLengthRaw;
			pc.cocks[x].cLengthRaw += (.2+adjustment);
			var newS:Number = pc.cocks[x].cLengthRaw;
			output(" All the suction has left your [pc.cockNounSimple] with a little extra length " + (pc.isCrotchExposed() ? "swaying in the breeze":"stuffing your [pc.crotchCoverUnder]") + " - <b>" + Math.round((.2+adjustment)*10)/10 + " new inches to be exact</b>.");
			//seven inches
			if(old < 7 && newS >= 7) output(" <b>You’ve crossed over the threshold to having a seven inch dick - average for Terrans in this galaxy.</b>");
			//11"+
			else if(old < 11 && newS >= 11) output(" <b>You’re nearly a foot long. It’ll be almost impossible to hide, but on the flipside, there’s so much more of you to please. You can only imagine how good sinking all these inches in is going to feel.</b>");
			//Fourteen
			else if(old < 14 && newS >= 14) output(" <b>You’re big enough to match the length of many races’ forearms. Big enough to put a bulge in almost anyone’s belly.</b>");
			//18+
			else if(old < 18 && newS >= 18) output(" <b>You’d better be careful now that your dick is this big. An errant boner could easily rip right through cheap underwear. On the flip-side, you’re fairly certain you can please a centaur with ease.</b>");
		}
	}
	processTime(10);
	output("\n\n");
	CombatManager.genericLoss();
}

//[Facefuck]
// Tooltip1: {bimbo: Bad girls need a good dicking and, as you're keenly aware, fellatio is great behavioral adjustment!/ bro: This bitch wanted you to submit. Show her, and everyone else, what happens to those who come at you like that./ else: Right here in public: drill this girl's face. That'll teach her a lesson. Besides, she wants it.}
// Tooltip2: Sorry mate, <b>you don't have a penis.</b> That's an important tool for this job. Kinda blows, doesn't it?
// Tooltip3: Aliens are bendy and extravagant, but not this one. <b>Your oversized schlong{s} won't fit in that mouth, so diminish{ it/ them} some!</b>
// PC will facefuck the zaika thief right there, harder variants choking her on dick. Cocktail/Tentacles will make use of her tail. Exhibitionism variants needed. Everyone's watching! Taurs allowed.
// reminder to use penisRouter

public function faceFuckDatBitch(x:int):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	// pc Bimbo
	if(pc.isBimbo())
	{
		output("Submission is hot. Like, <i>fucking hot.</i> A red-hot blush");
		if(pc.hasFur()) output(" spreads quickly beneath your [pc.skinFurScales]");
		else output(" colors your [pc.face]");
		output(". Iron readiness pumps into your [pc.cock " + x + "], [pc.dickSkin " + x + "] rapidly swelling" + (!pc.isCrotchExposed() ? " into fat ‘n yummy bulge":" into rigid stiffness for the facefucking to come") + ". Many pairs of curious eyes watch you bound over to claim your lilac prize, [pc.hips] swinging");
		if(pc.biggestTitSize() >= 2) output(" and [pc.breasts] bouncing");
		output(" - once steady foot traffic is forced to reroute around the peanut gallery. Are their luminescent eyes on you? Your foe? Or your penis" + (!pc.isCrotchExposed() ? ", springing out into neon-lit tumescence":", [pc.cockType " + x + "] shape bobbing under the neon spotlight") + "? <i>You hope they like what they’re seeing!</i>");
	}
	// pc Bro
	else if(pc.isBro())
	{
		output("A good fight for dominance always gets you going. Your heart, your adrenaline; you’re covered in sweat. There’s a fire burning in your mind. In your loins too, by the smell of your amped-up sex drive. Blood rushes into your [pc.cocks]");
		if(!pc.isCrotchExposed()) output(", and your undies strain to hold back the irrepressible bloat of" + (pc.hasCocks() ? " all":"") + " the bulky manliness you’re packing");
		else output(", thickening your organ" + (pc.hasCocks() ? "s":"") + " with soon-to-be-orally-requited lust");
		output(". The living stream of zaika foot-traffic suffers a delay as several luminescent eyes stop to gaze upon the stud trudging towards his lilac opponent. You meet their glances on the way, compulsively thrusting or aiming your" + (!pc.isCrotchExposed() ? " now exposed":"") + " [pc.cocksLight] in their direction - of course you can’t resist the primal impulse to showboat, even flex an [pc.arm] for good measure. These girls are here to see you fuck. You don’t intend to disappoint.");
	}
	// pc Kind
	else if(pc.isNice())
	{
		output("Midway through one powerful throb, part of you struggles to accept this course of action. You’re about to fuck this girl in public, leave her vulnerable. It all seems pretty selfish, until another gentle pulse of ");
		if(!pc.isCrotchExposed()) output("tightly-packed cockflesh warms your groin with fresh, [pc.cumVisc] precum");
		else 
		{
			output("free-swinging cockflesh ");
			if(pc.cumQ() < 1000) output("oozes");
			else if(pc.cumQ() < 5000) output(" dribbles");
			else output("squirts");
			output(" [pc.cumColor] precum onto the pavement");
		}
		output(" - then you stop worrying. She attacked you, after all; she’s yours to lay. An amethyst sea of passing zaika gradually morphs into a line of luminescent eyes watching");
		if(!pc.isCrotchExposed()) output(" you fish out your [pc.cocks] and stride towards their fallen sister");
		else
		{
			output(" you ");
			if(pc.cocks[x].cLength() < 10) output("stroke");
			else output("heft");
			output(" your [pc.cocks] on a confident stride towards their fallen sister");
		}
		output(". ");
		if((pc.exhibitionism() < 33 && pc.libido() < 33))
		{
			output("Shame washes over you, red-wine color spreading along your cheeks. Putting out the catcalls and other astonishing jibes takes a strong force of will, but your elevated heart rate, and the embarrassment, remains.");
		}
		else
		{
			output("This is your element: exposed to dozens of lascivious aliens. People you don’t know, and whom you’ve never met, staring at the most intimate and private parts of your body, lit up by searing neon. Keeping them beguiled is your ");
			if(pc.exhibitionism() < 66 && pc.libido() < 66) output("greatest joy. Being center stage was what you were born for");
			else output("specialty. This is what you revel in most");
			output(".");
		}
	}
	// pc Misch
	else if(pc.isMischievous())
	{
		output("You get hard before your brain is done processing the thought - your [pc.cocks] tense at the promise of a good blowjob. ");
		if(!pc.isCrotchExposed()) 
		{
			output("The integrity of your underwear is threatened by the stitch-splitting");
			if(pc.hasCocks()) output(" bulges of dickmeat stuffed inside, each one squirting hot precum. Only downside to having more than one dick: they’re hard to tuck away!");
			else output(" [pc.cockType " + x + "] distension in your crotch. Hot precum darkens your lower wear.");
		}
		else
		{
			output("[pc.CumVisc] prejizz ");
			if(pc.cumQ() < 1000) output("beads");
			else if(pc.cumQ() < 5000) output("dribbles");
			else output("squirts");
			output(" from your [pc.cockHeads], landing wetly on the coarse roadway.");
		}
		output(" Gangsters and other bright-eyed miscreants stop several feet away to ogle the [pc.raceShort] swaggering towards a fallen zaika");
		if(!pc.isCrotchExposed()) output(", uncovering [pc.hisHer] ‘tail" + (pc.hasCocks() ? "s":"") + "’ in record time");
		output(" - scattered hoots and hollers reach your [pc.ears], but the bass-beat of throbbing-hard arousal helps you stay focused on the task at hand.");
		if(pc.exhibitionism() < 33 && pc.libido() < 33) output(" There’s certainly an element of shame to this. It’s only the sheer amount of horny you are that keeps your mind on task. Nobody needs to know how embarrassed this truly makes you feel, so you flash a hesitant grin and wave to the leering audience, bathed in the neon light.");
		else 
		{
			output(" This may be the first time some of these zaika are seeing a Rusher. Why hold back? You smile and wave, show off your goods, revel in the praise and shrug off the barbs. The most intimate parts of your body are highlighted by inescapable neon rays and, heart quickening, you love that the most.");
			if(pc.libido() < 66 && pc.exhibitionism() < 66) output(" You’re about to make an impression on the whole Gyre. Don’t disappoint.");
			else output(" All of Dhaal is going to hear of you after this. Right? Every two-chit ganger is going to want an eye on the hottest, sexiest Rusher. Having a loyal fanbase is such a mood boost!");
		}
	}
	// pc Hard
	else
	{
		output("\n\nVictory is sweet, especially against those who think they can walk all over you.");
		if(!pc.isCrotchExposed()) output(" Behind your crotchwear, your [pc.cocksIsAre] burgeoning into impassioned hardness, creating a [pc.cockType " + x + "] distension on your front.");
		else output(" Pure physiological need balloons your [pc.cocks] into ripe hardness. Your reproductive musculature flexes upwards, [pc.cumVisc] precum ");
		if(pc.cumQ() < 1000) output("beading");
		else if(pc.cumQ() < 5000) output("oozing");
		else output("squirting");
		output(" onto the coarse pavement.");
		output(" This catches the attention of nearby zaika, whose superficial ogling causes a coagulation of the herd that forces others to move around them. Miscreants and criminals whistle and cheer, watching as you approach the fallen thief to give her what she deserves with [pc.cocksLight] in hand.");
		//exhibition&Libido<33:
		if(pc.exhibitionism() < 33 && pc.libido() < 33) output(" Being exposed like this to a dozen horny aliens in the peanut gallery isn’t exactly easy, but you’re not one to beat around the bush. You’re about to lay all " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches on a native’s face before administering her throat the cock-sock aptitude test. Nobody else matters.");
		else 
		{
			output(" An audience is just a chance to build a reputation. Of course you revel in the attention, but you also can’t wait to unleash yourself on one of their own, really show them the hard dicking that awaits anyone who fucks with you.");
			if(pc.libido() < 66 && pc.exhibitionism() < 66) output(" You can’t wait - you hope they’ll be cumming to your performance before long.");
			else output(" Burning under the neon rays, you find yourself sweating from anticipation already. Your performance is going to leave an indelible mark on the Gyre’s alumni.");
		}
	}
	// merge
	output("\n\nShadowed beneath your [pc.cocksLight], the bandit darkens to a humbled black-violet hue, glowing aug eyes widening to admire your package. <i>“");
	if(titsSmall()) output("W-What are you doing?”</i> she hazards. <i>“We’re not... gonna do it out here? In front of the crowd!? T-That’s not - I mean aren’t you bothered? They’ll try to take advantage and, uh, um, take your stuff! I-I don’t think -");
	else if(titsMed()) output("T-That looks really nice and all but w-what are you suggesting, off-worlder?”</i> she quizzes nervously. <i>“Y-You can’t do me right here! We’ll both get gangbanged a-and nobody needs to see! They’ll take our stuff, you don’t want that to happen, right?");
	else output("Ooh, you’re that ready for me - b-but wait, I umm...”</i> Her voice fades into the murmur of surrounding onlookers; she’s learning! <i>“Y-You’re not gonna... like, I’m really horny but not that horny! W-We’ll be in danger out here! They’ll try to take your things and I-I won’t get off and-");
	output("”</i>");
	// pc Bimbo
	if(pc.isBimbo()) 
	{
		output("\n\n<i>“O-M-G,”</i> you squeal in exasperation, pinching the girl by her emotive ears and deploying significant amounts of physical reassurance up and down their length. <i>“Don’t you go worrying about any of them!”</i> you soothe, unable to stop rubbing your [pc.cockHeads] into her locks. <i>“Look, there’s " + (!pc.hasCocks() ? "a cock":"cocks") + " to suck! You just focus on breathing, okay? Nobody’s gonna touch us.”</i> You lean upwards, resting your meat on her face and biting your lower lip. <i>“’Course, they’re gonna be recording us I bet!”</i>");
		output("\n\nYou get even harder than you were before, thinking about asking the crowd for a copy.");
		output("\n\n<i>“Uhh,”</i> the blushing bandit eyes you nervously. <i>“So what do I do? Suck with my tail...?”</i> Curling upwards, the soft muscled length seats its bulbous head on her shoulder. The purple tailsock is dimpled by the liquid pressure darkening it in obvious lust.");
		output("\n\nLooks like she still needs some encouragement - and some instruction! Good thing you know a thing or two about fellatio. She’s gonna be the best oral fiend on Dhaal, mark your words!");
		output("\n\nYou grace her with a wink and a smile. <i>“Roll out your tongue and start licking! It’s easy and fun, trust me!”</i>");
	}
	// pc Bro
	else if(pc.isBro()) 
	{
		output("\n\nYour [pc.cockType " + x + "] girth drapes over the woman’s face with a hefty ‘plap’, obscuring her lips and nose under the iron curtain of your swollen flesh. <i>“Just suck" + (pc.hasCocks() ? " ‘em":" this") + ",”</i> you order, humping higher" + (pc.balls > 0 ? " to press your ballsack into her jaw":"") + ". Grabbing and twisting some of her chromatic hair into makeshift handholds, you pull back and slap her clean across the cheek with your [pc.cockHeads]. The voices all around rise in amusement. One person claps!");
		output("\n\nStill, you can’t just thrust into an unready throat like that. Now that your dominance is locked in, you ease up and pull back, but only a little. She needs to know whose cock owns her. Whose body is looming overhead, expecting obedience. The cream-seeking scoundrel is panting, strings of [pc.cumVisc] pre dribbling down her jaw from the wet impact. Her tentative voice comes, <i>“S-So... um, what do you want me to do? You mean suck with my tail?”</i> At its mention, her omni-genitail swerves upwards to rest on her shoulder, its ‘sock’ stained with precum.");
		output("\n\nLooks like you have a throat-slut to train and break in.");
		output("\n\n<i>“Lick,”</i> you grunt.");
		output("\n\nNice.");
	}
	// pc Kind
	else if(pc.isNice())
	{
		output("\n\nYou place a reassuring hand on her head, [pc.fingers] stroking towards the bases of her elfin ears. <i>“C’mon, you know that’s not gonna happen.”</i> She looks down to your [pc.cockHeads], sincerely curious as to what you want her to do. <i>“But I’m not letting you go just yet,”</i> you continue, guiding her eyes by lightly swaying your [pc.hips] - she’s captivated by your ‘tail" + (pc.hasCocks() ? "s":"") + "’. <i>“I need you to suck " + (pc.hasCocks() ? "these":"this") + " first. You wanted to milk me, right? Well, now’s your chance.”</i> Carefully, you rest your [pc.cockColor " + x + "] mast on her face, letting her enjoy the pulse of your undervein against her fae features. <i>“I’ll make sure you get every last drop, if that’s what you want.”</i>");
		output("\n\n<i>“Yes it - w-wait, uhhh...”</i> You can see the flicker of shy eyes wanting to turn and stare nervously at the crowd. A friendly [pc.hand] keeps her composed, and her mind on the job at hand. <i>“...With my tail you mean? You wanna let me milk you down here? I can do that!”</i> On cue her cock-pussy organ weaves sinuously to perch on her shoulder, its covering darkened by lust. <i>“Here, lemme just-”</i>");
		output("\n\n<i>“No no,”</i> you stop her, tracing a thumb around her wine-black lips. <i>“I want your mouth and your tongue.”</i> Steadying your breathing, you slowly pull back and smile warmly. Quivers of realization arc through her nerves. You watch a dozen facial expressions pass by with sweet relish, knowing that you’ve got an opportunity to train an oral cock-sock. <i>“Please start licking. Unless you want to sit here all night?”</i>");
	}
	// pc Misch
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Girl, who laid you out a second ago?”</i> you ask, clutching her hair, pulling her against your [pc.thigh]. <i>“Let ‘em try.”</i> You flash a sly wink. <i>“You’re mine right now, and" + (!pc.hasCocks() ? " this":" these") + ",”</i> you press your [pc.cockHeads] into her cheek, <i>“" + (!pc.hasCocks() ? "is":"are") + " yours. Hope you’re good at sucking dick because doing a good job on me is the only way I’m letting you go. Unless you really like it.”</i> You hump higher. <i>“Bet you do.”</i> Winking, you dig your nails into a sensitive spot behind her long ear. <i>“I <b>know</b> you do. You wanted to milk me that bad before? Look how hard and hot I’ve gotten. You sure you don’t want all this ‘milk’ to yourself? Be honest!”</i>");
		output("\n\nSoftened by your pheromones (though she doesn’t seem to understand that part, curiously), the zaika peers around the phallic veil and smiles, nodding slightly. <i>“O-Okay, I can do that. With my tail, right? That’s what you meant by sucking?”</i> A two-inch thick muscle of combined genitalia swims up to rest on her shoulder. Before she can pull the covering off, a swivel of the [pc.hip] and snap-back slaps your [pc.cockColor " + x +"] pole into her face. Such a glorious cockslap earns you a light applause.");
		output("\n\n<i>“Not quite, babe,”</i> you grin, thumb roaming around her mouth. <i>“Follow my lead - with your tongue. Lick me.”</i>");
		output("\n\nYou’ll make a cocksucker out of her yet!");
	}
	// pc Hard
	else
	{
		output("\n\nShrinking under your flashing glare, you pull the zaika up by her hair and flop your [pc.cocksLight] on her face. <i>“You wanted to fuck with a Rusher, here’s what you get. Hope those augs help with holding your breath, because now you’re about to find out what it’s like to be fucked stupid by a pissed off alien.”</i> Unsure of what you mean, she glances nervously to the onlookers, whose inhibitions are rapidly unwinding to the rough, lurid display you put on. Some of the soot sprites brazenly masturbate. Carrying on, you squeeze the milk-bandit’s hair and drag her nose straight into your [pc.knotOrSheath " + x + "] - mm, that texture. Her lips are more than suitable.");
		output("\n\n<i>“W-Wait! You want to fuck me right?”</i> she stammers, scrambling to produce her covered up tail. The supple muscle squishes around her tense fingers, swishing wildly to its owner’s elevated emotions. <i>“H-Here, my tail! It’ll be the best fuck of your li -”</i>");
		output("\n\nAnother cockslap. <i>“Wrong,”</i> you hook a finger into her mouth and pry her lips wide. <i>“You’ll lick " + (!pc.hasCocks() ? "it":"this") + ", then suck. All you have to worry about is doing what I say, and...”</i> She meets your lusty smile. <i>“...Taking whatever breath I let you have. Start.”</i>");
	}
	// merge
	output("\n\nBeneath a barrage of derisive and agitated commentary the warmth of a zaika’s tongue enfolds your [pc.cockHead " + x + "] in hesitant passion. At first, it’s a shy exploration of your slickened biology, ");
	if(!pc.isTaur()) output("but when you grab her head and start to guide her");
	else output("but when your undercarriage thoroughly shifts above");
	output(", she jumps slightly, moves faster. [pc.CumGem] prejizz flows like a soothing balm, carpeting her taste buds in [pc.cumVisc] reward. You sigh with bliss, exhaling hotly as she pants over your glazed topside. Her kind must be aware of what it means to be on one’s knees servicing a superior, but this may actually be her first time enjoying the glowing burn of humiliation and submission.");
	output("\n\nIn a public setting, no less.");

	output("\n\nSloppy amethyst lips slide down one side, forgetting to kiss. You ");
	if(pc.isBimbo() || pc.isNice() || pc.isMischievous()) output("gently remind");
	else output("sternly admonish");
	output(" her, and she learns, whimpering and smooching her way down the opposite. Better. The thief slopes down and around your undervein, caressing a serpentine pattern back to the neck of your lathered fatness, deep, plush slurps polishing your burly tumescence to an enviable shimmer. Unnatural colors reflect in the glossy coating. <i>“Nice tail, star-slut!”</i> screams an irrelevant figure. <i>“What are you going to do with that tail? Show off all night!?”</i> howls another shut-in. <i>“Mess her face up! It’s all your kind are good for!!”</i>");
	output("\n\nSlaver drips from your [pc.cockNoun " + x + "]" + (pc.hasCocks() ? ", and soon from the rest. With one-syllable commands, your meaty collection glistens like recently discovered artifacts":", and with further one-syllable commands, your meat soon glistens like an artifact recently discovered") + ". Your one-night pricksleeve takes hold of your ");
	//ParseText early and replace instance of <i>“prick”</i> with <i>“cock”</i>: 
	output(ParseText("[pc.cocksLight]").replace("prick","cock"));
	output(" with a teasing sensuousness. <i>“Errr... this is fine, right?”</i> she asks, sincerely interested in learning. <i>“Touching it is... satisfying, um, it just feels good to hold. It also tastes good. Its flavor and texture is naish,”</i> purrs the bandit, licking and puffing, earning guttural sounds of pleasant approval.");
	output("\n\n<i>“Makesh shense! Aliensh like ushing every hole!”</i>");

	output("\n\nThe savory juices you ");
	if(pc.cumQ() < 1000) output("secrete");
	else if(pc.cumQ() < 5000) output("squirt");
	else output("pour");
	output(" are to her liking. You " + (pc.isTaur() ? "hear":"watch") + " her swish the lubricating nectar around her mouth, open up, then swallow, exquisite glottal vibrations pleasing your bone in magical ways. The " + (pc.isTaur() ? "sound":"sight") + " invigorates your [pc.cocksLight]. An inexpert but otherwise committed performance is augmented by half-baked techniques she must have picked out from watching seasoned porn-stars in the act. <i>“Please, I want more of that...”</i> Plump lips awkwardly wrap around your cumslit and suck with intense force; you tense up as a hot, sumptuous gout of prejaculate floods her thirsty mouth. <i>“I washed a lot of vidjeos! I know how shtar-people like it!”</i> she giggles around your dick’s concealed" + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? " mesa":" peak") + ", fluttering her eyelashes. Another spurt, and she swallows the copious face-load.");
	if(pc.cumType == GLOBAL.FLUID_TYPE_MILK) output("\n\n<i>“W-Wuh... that’s...!”</i> Yes, it is. You’re packing a special kind of cummy milk, and it looks like it has the same effect as breast-juice would! <i>“M-Milk! You’ll let me have all of this!?”</i> she smiles widely, clutching your [pc.knotOrSheath " + x + "] like your groin just became the most important part of her life. <i>“Please say yes! I’ll do my best to milk you! For this - for you, I’ll be the best tail-socket! Just tell me what to do!”</i>");
	else output("\n\n<i>“W-Wow that’s delicious...”</i> She eases up, an obvious flush washing slowly down her body. Lovely, eager lips enfold you again, this time with a happier, more skilled approach. <i>“Mmmm... this is really yummy. Not as good as milk but...”</i> Pliant fuck-pillows, perfect...! <i>“...I’ll milk you, I don’t mind! Use me, you sexy off-worlder, show me what you’ve got! Milk yourself into me with all your might!”</i>");
	output("\n\n<i>“" + (pc.isBimbo() ? "You got it, hun!":"That’s the plan.") + "”</i>");
	output("\n\nMet with your approval, the zaika suck-slut’s fervor ramps up. You can tell she’s stopped worrying and learned to love the depravity. Poised pink fingers pump the length of your [pc.cocks], a blur of cybernetically-boosted alacrity that steadily increases your desire to release. For all her mechanical strength, the two-handed handjob isn’t crushing or impotent. You’re so sensitive that a " + ((pc.isTaur() && pc.equineScore() >= 2) ? "whinny":"burst") + " of pleasure rumbles up your throat! The excess of friction and the encouraging");
	if(pc.hasKnot(x) && pc.hasSheath(x)) output(" rubs and squeezes to your sheath and knot");
	else if(pc.hasKnot(x)) output(" squeezes on your [pc.knots]");
	else if(pc.hasSheath(x)) output(" rubs on your sheath’s outer folds");
	else output(" rubs");
	output(" fill your system with a unique sexual mirth.");
	processTime(10);
	pc.changeLust(35);
	clearMenu();
	addButton(0,"Next",faceFuckDatBitch2,x);
}

public function faceFuckDatBitch2(x:int):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	// pc Has Balls
	if(pc.balls > 0)
	{
		if(pc.isBimbo()) output("<i>“Remember!”</i> " + (pc.isTaur() ? "You rear back and swing your ballsack forward.":"You tap tap a finger to your nutsack.") + " <i>“If ‘ya want milk, gotta make sure to service the source!”</i>");
		else if(pc.isBro()) 
		{
			if(pc.isTaur()) output("The air shifts as you move, switching her focus from your maleness" + (pc.hasCocks() ? "es":"") + " to your slowly-rocking sack.");
			else output("Grabbing the back of her head, you shove her drippy lips into your ballsack.");
			output(" <i>“Right there,”</i> you grunt, only easing when she obeys.");
		}
		else output("<i>“If you want my milk...”</i> You " + (pc.isTaur() ? "canter forward to bring your [pc.ballsNoun] closer to her face":"pinch her ear and trace a finger down to your [pc.ballsNoun]") + ". <i>“...Lick here, too. I expect " + (pc.balls == 1 ? "it":"them") + " to shine.”</i>");

		output("\n\nOvercome with joy, the milk-fetishist’s lips stretch into a wide, obscene ‘O’ and plant themselves to the broadest portion of your ");
		if(pc.ballDiameter() <= 2) output("pouch");
		else if(pc.ballDiameter() <= 6) output("hefty scrotum");
		else output("bulging magnitude");
		output(". Wet, sucking pressure tugs on your ");
		if(pc.hasFur()) output("fuzzy");
		else if(pc.hasScales()) output("soft-scaled");
		else output("doughy");
		output(" testicle" + (pc.balls > 1 ? "s":"") + ", trading saliva for musky genital sweat, eager attitude weighing you down with a greater load of spooge. Hums and other little squeaks muffle through your heated [pc.ballsNoun] as you apply your new brand of nut-polish across the juicy exterior" + (pc.balls > 1 ? "s":"") + " of your ");
		if(pc.hasStatusEffect("Uniball") || pc.ballDiameter() <= 2) output("peachy");
		else if(pc.ballDiameter() <= 6) output("swaying");
		else output("sagging");
		output(" smoothness. You can’t suppress your urge to grind her into the most vulnerable and fragrant part of your body, loving the way her gluttonous tongue winds around your slippery jewel" + (pc.balls > 1 ? "s":"") + ", directing low frequency waves of submissive pleasure through the ");
		if(pc.hasStatusEffect("Uniball")) output("taut, girl");
		else if(pc.hasFur()) output("velvety");
		else output("doughy");
		output(" terrain.");

		output("\n\nWhen you ask if she likes it, she squeals, <i>“Yeeees!”</i> When you suggest how better she can use her mouth she answers, <i>“Right away!”</i> or some other form of affirmative communication that burdens your supple ‘nad" + (pc.balls > 1 ? "s":"") + " with fresh ");
		if(pc.cumQ() < 150) output("ounces");
		else if(pc.cumQ() < 1000) output("pints");
		else if(pc.cumQ() <= 4000) output("liters");
		else output("gallons");
		output(" of fluid weight. ");
		//ballSizeSmall:
		if(pc.ballDiameter() <= 2) output("After weaving her oral organ around your [pc.sack], she swallows the churning treasure trove into her mouth and lavishes the [pc.skinFurScalesColor] sphere" + (pc.balls > 1 ? "s":"") + " until a stream of slaver dribbles from her chin. When they slip out, she goes back to tugging them, rolling the contents between her fingers.");
		else if(pc.ballDiameter() <= 6) 
		{
			output("Hungrily, her thick oral muscle curves around the [pc.skinFurScalesColor] contents of your weighty nutsack, lapping circuits from west to east and north to south, cleaning it like a proper ball-slut should. Her journey culminates in noisily guzzling the slimy drip of pheromonally-charged moisture collecting at the tender bottom" + (pc.balls > 1 ? "s":"") + " of your ");
			if(pc.hasFur()) output("drenched nutfuzz");
			else output("spunk-factor" + (pc.balls == 1 ? "y":"ies"));
			output(", drooly murmurs feeding into your churning warmth. She emerges topside, showering kisses all the way to your [pc.base " + x + "].");
		}
		else output("As if hypnotized by your sheer, gravid mass, the zaika’s pace slows to one of reverence as she gives ball worship a try with all the effort of a virgin nut-slut. Delicate hands fondle the inhuman heat of your churning musk-cushions - luxurious, idolizing effort. Your [pc.ballsNoun] jiggle and jostle in the sensuous grasp of a creature who prizes them above all else, shuddering, smearing her face in pheromonal sludge. Suckling black lips drool over every available inch of [pc.raceShort] on a desperate quest to earn the [pc.cumVisc] treats roiling beyond, sounding and looking like a bitch in heat.");
		output("\n\n");
	}
	// Merge
	output("You can’t avoid arching back and humping her face. The projection of unquestionable dominance nearly sets you off. An infernal friction is built on the backstroke, and the lewd braying of your audience reaches a fever pitch. Craning her chin upwards, the cream-thief turned spurt-sucker writhes anxiously under your spit-slick pole, cradling the [pc.cockType " + x + "] shape of manmeat in her [pc.cumColor]-soaked hands. <i>“");
	if(titsSmall()) output("Are you cumming already?");
	else if(titsMed()) output("Oooh, can’t hold back, huh, you horny Rusher, you!");
	else
	{
		output("Wow, how’d you not cum from that!? I can feel you trembling everywhere!");
	}
	output("”</i> she asks");
	if(titsSmall()) output(" innocuously");
	else if(titsMed()) output(" smugly");
	else output(" saucily");
	output(", not yet realizing that you’re the alpha here - the one in charge.");

	// pc Rut OR Treated
	if(pc.inRut() || pc.isTreated()) output("\n\nIf she knows so much about off-worlders, then does she know about Rut? Can she smell the unleashed need to breed fanning off your [pc.dicksLight], gushing like a biological waterfall of concentrated, writhing <b>urge?</b> <i>“T-That odor... you’re...!”</i> The pink harlot marvels, fascinated by what she sees - you, from a completely different angle. <i>“Wow, aliens... have a smell like that when they wanna make kids... I’ve heard of... mmmf...”</i> Globs of precum pool on the cum-rag’s scalp, burning-hot with the boiling mania of primitive animal desire while she thoughtlessly licks at you, enraptured in a haze of incubative horniness.");
	// merge
	output("\n\nNo longer satisfied with foreplay, you blind the strawberry-skinned elf under the eclipse of your [pc.cocksLight] with a command to ‘open up’. Her pointed ears fold and twitch at the ends. ");
	if(pc.cocks[x].cLength() < 6) output("<i>“A-Alright, like this?”</i> she queries, grabbing your [pc.thighs] and stretching her jaw to capacity. Little panting breaths tickle the nerves on your modest endowment. <i>“Cuh-mon, I’m reddy!”</i>");
	else if(pc.cocks[x].cLength() < 11) output("<i>“E-Ermmm...”</i> She blinks, excitement warring with concern over the size of your well-endowed shaft. It definitely occurs to her that you expect to fuck her throat like you would the other parts of her! <i>“...Will it fit? I-I mean, maybe, but I’ve never had to take - can you go slow, maybe?”</i> Two seconds later, she opens the way and her tongue slithers out to welcome its guest" + (pc.hasCocks() ? "s":"") + ".");
	else if(pc.cocks[x].cLength() < 18) 
	{
		output("Your order is met with immediate resistance. <i>“W-Wait, you can’t mean for me to take this all in my mouth!”</i> she protests. <i>“This is gonna hurt me! I-I don’t think it’ll fit, can you -”</i> Lifting your rod, you let the heavy mass ‘plop’ on her face. A spark of inner embarrassment lights her up. <i>“");
		if(titsSmall()) output("O-oh, please go easy at first...! I’d do the same for you");
		else output("W-Well, nothing for it! Thrust all the way into my throat big [pc.guyGirl]");
		output("!”</i> At last, she opens her mouth and rolls out her tongue, begging for gentleness with her eyes.");
	}
	else output("Rebellion. Once she realizes that you intend to destroy her mouth with all " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of your throat-wrecking inseminator, her ears bristle in a panic. <i>“N-No way! That’s not gonna fit in my mouth! Not even the head of your tail will, you can’t be serious!”</i> Before she slips the net, you " + (pc.isTaur() ? "trip her and position your [pc.cockHead " + x + "] to her agasp mouth":"grab a sharp ear and smush her face into your undeniable rigor") + ". <i>“A-ah, okay, okay...”</i> she mewls, reluctantly assuming the position, tense... but unmistakably keen about something. Two fingers hook into the sides of her mouth and pry the oral gates open. <i>“Here you go!”</i>");

	// pc Bimbo, Kind, Misch
	if(pc.isBimbo() || pc.isNice() || pc.isMischievous()) 
	{
		output("\n\nRather than skewer her lips, you let gravity carry your [pc.cockHead " + x + "] through. ");
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output("The brim of your animal flare bends backwards a bit before slipping inside to taste the carnal heat of her inner muscles. If everyone around wasn’t quarreling and mocking, they’d have heard the wet pop it made.");
		else output("Your tip slides into a hot pocket of oral comfort, resting comfortably between the erotic affections of her hollowing cheeks.");
		//cockSize:
		if(pc.cocks[x].cLength() < 18) 
		{
			output(" The rest of your shaft sinks into her pillowy embrace, gradually filling the vacant centimeters between your [pc.cockColor " + x + "] inches and her happy lips until you flatten her uvula and poke into entrance to her throat, enjoying the flits and swishes of a tongue eager to serve. With your");
			if(pc.hasKnot(x)) output(" knot pressed to her succulent sex-tasters");
			else if(pc.hasSheath(x)) output(" sheath crinkling around her flawless DSLs");
			else output(" pubic mound mashed into her nose");
			output(", you let out a glad sigh that her lungs echo.");
		}
		else output(" That was the easy part. Her tongue is pinned outside her mouth, paralyzed by the penile mass advancing inexorably into her girth-warming embrace. Her jaw strains" + (pc.cocks[x].cLength() >= 24 ? " and cracks":"") + " around your virile dimensions, unable to gulp the goo you’re unloading on the way. Desperate gasps affix your mammoth bulk in an airtight environment; the zaika’s sorely-stretched cock-gobblers involuntarily nurse at your heavy roundness. Sat atop your once-foe’s uvula and poised to give her a memorable dicking, you let out a sigh that the cyber-bandit mimics" + (!pc.isTaur() ? ", rubbing her head affectionately":"") + ". She’ll be sniffing your crotch soon enough.");
		output("\n\nKindness probably gets people hurt around here, but if a few caustic remarks is all you have to endure then you’re not concerned. Everyone’s disappointment that you didn’t lance her throat and start pumping right away is heard loud and clear. Yet you push on. Her body tenses around the penetration, but insistent, patient pressure wins out over her oral system’s biologically-ingrained problems with indigestible things. You buck into the zaika’s sealed windpipe, swabbing clenching muscles on the descent - frictious, tightly-bound heaven. As she gurgles, you pull back up and let her breathe.");
		output("\n\nShe is thankful, of course. But you don’t intend to be so slow again.");
	}
	// pc Bro, Hard
	else
	{
		output("\n\nGurgling, sputtering shock vibrates your lancing [pc.cockNoun " + x + "] as");
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" the sensitive edge of your flare folds back and powers through");
		else output(" your tender inches spear past");
		output(" the lilac woman’s lips and into her voice-tube.");
		if(pc.cocks[x].cLength() < 18) output(" Small comfort for her that her jaw isn’t  braced around something more obscenely endowed.");
		else output(" In your savage advance, the sheer might of your maw-filling fatness cracks her jaw in such a way that it may not close the same way again.");
		if(!pc.isTaur()) output(" Pinching her nostrils shut");
		else output(" Swinging back and launching into a harder thrust");
		output(", you effortlessly feed the rest of your aching mast into her throat, pinning every movable function of her lust-slick twat-tube before triggering her into swallowing, thusly smashing her nose into your sweaty crotch");
		if(pc.hasKnot(x)) output(" and the fleshy bulb of your [pc.knot " + x + "] halfway into her gape");
		else if(pc.hasSheath(x)) output(", deep into the fragrant flesh of your sheath");
		output(".");

		output("\n\nThe delicious tightness of a confused, clenching throat spasms all around your pulsing boner" + (pc.hasCocks() ? " as your extra equipment slaps against her head":"") + ". Sauna-like depths squeeze tight, each and every tensing muscle clamping down and narrowing her windpipe into a mould that accurately renders your throbbing rigor down to the network of irritated veins lacing her wonderfully elastic fuck-gutter. Stunned and twitching, your partner goes limp, seemingly unable to gulp. Which is fine.");
		output("\n\nBut passing out wouldn’t be, so you rear back, let her hack and cough, let her robotic eyes drift back into position, and then you ravage her shallow organic weakness all over again. Curtains of off-[pc.cumColor] drool spill from the ruptured pipe of her cock-stuffed mouth. You’re met with a stadium’s worth of cheers - everyone liked that.");
		output("\n\nWait til they see what else you can do.");
	}
	// merge
	output("\n\nPlanting your [pc.footOrFeet]");
	if(pc.isNaga()) output(" and wrapping your snake-half around her body for stability");
	output(", you let loose, fucking the cyber-zaika’s head in luscious pumps, working");
	if(pc.cocks[x].cLength() < 18) output(" the entirety of");
	else output(" as much of your");
	output(" shaft into the girl’s pliant, sucking gullet, smearing the flavor of your penile ‘milk’ across the walls. You fuck her face like a [pc.manWoman] possessed, determined thrusts ");
	//random if the PC has more than 1
	var choices:Array = [];
	if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE || pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) choices.push("nubs");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) choices.push("hoss");
	if(pc.cocks[x].cType == GLOBAL.TYPE_SUULA || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_BASED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) choices.push("stingyboi");

	var select:String = "butt";
	if(choices.length > 1) select = RandomInCollection(choices);
	//hasFelineOrNubbyCock:
	if(select == "nubs") output("swabbing the full length of her throat with the " + (pc.cocks[x].cLength() < 12 ? "dozens":"hundreds") + " of rubbery spines interweaving on your maleness");
	else if(select == "hoss") output("pumping the fat loop of your medial ring deep into her face-cunt");
	else if(select == "stingyboi") output("dumping loads of venomous aphrodisiac into the tenderness closest to her rapidly-beating heart");
	else output("screwing darkness into the edges of her vision");
	output(". ");
	if(pc.isBimbo() || pc.isNice() || pc.isMischievous()) output("You’re not so brutal as to ignore her need for oxygen. When her consciousness ebbs you pull back to the brim of her pre-drenched puckers, wait a second or two, and glide back in on her third suck for air.");
	else output("Adapting to your rough pace, the pole-smoking zaika’s screams for mercy are banged right back down her throat along with scant, life-giving oxygen. It makes her innards glow hotter every time she inhales. It also opens her maw-pussy to you like the cloacal mouth of her genitail.");

	output("\n\nDeciding to give her over-burdened passage a moment of respite, you exit the tantalizing, hungry squish and steer into stretchy cheeks, fervid [pc.cockNoun " + x + "] puffing out wet velvet into lewd shapes, spurting [pc.cumVisc] waves that stream down or out. " + ((pc.isNice() || pc.isMischievous() || pc.isBimbo()) ? "With a grunt of alert":"With no warning") + " you lurch vigorously back into a pistoning pace, ironing out the fleshy membranes in your path and socketing your bowing member into the furthest recesses of her viscous wetness, gobs and gobs of throat-slime gushing along the cylindrical circumference of your ");
	if(pc.cocks[x].cLength() < 7) output("rod");
	else if(pc.cocks[x].cLength() < 18) output("beastly boner");
	else output("monolithic phallus");
	output(", trembling and quivering in the place you’ve conquered.");
	output("\n\nHer eyes bulge on your deepest dickings, synchronized with the compressions of a neck fit only for clinching orgasmically and guzzling down whatever effluence is pounded into it. Her upper body shakes like a seizure victim’s - an unrelenting sensory assault on your crotch by a body that’s too busy trying to wring every drop of lust-imbued jizz from its intruder. Resuscitated by struggles, her tail thrashes on the ground, fighting against an irresistible tide of slutty bliss, shaking loose its covering and opening up as if to entice a mate to ravage it like you’re ravaging its owner’s upper hole.");

	// has Cocktail or Back Tentacles
	if(hasBackTentaclesOrCocktail())
	{
		output("\n\nYou’re all too happy to grant its wish.");
		if(pc.hasCockTail()) output(" Your cocktail doesn’t need more than an iota of thought before its swerving down, drooling at the mouth in the presence of matched biology.");
		else output(" One of your tentacles gleefully careens towards the tube of reproductive joy, sticky droplets raining from its rounded tip.");
		output(" It doesn’t take long before a connection is established and your prehensile genitalia docks with hers. Because her cockring remains, fitting past its obstructive seam is a trial by fire for your additional sexy-bit, but with a lot of wriggling and plenty of thrusting (from both parties), the metal bends forwards over the knot of her dimpling cunt-tail’s fat fucking peak and flings off towards the randy, raucous onlookers, whom each laugh and praise your ingenuity. In the span of four thrusts, you’re traveling through the business end of her egg-hole as easily as you do her pronounced esophagus.");
	}
	// merge
	output("\n\nJust as you feel familiar, climactic tightness building in your [pc.knotBallsHilt " + x + "], " + (pc.balls > 0 ? "ball-":"prostate-") + "draining lips bending and bowing around your [pc.cockNoun " + x + "], you dare to face your audience.");
	if(pc.exhibitionism() < 33 && pc.libido() < 33) output(" Creatures of the night stare back, many engaged in porny acts that make you blush, sweat harder. Some are holding up colorful little gadgets, all aimed your way. A flash of white slices your [pc.eyes] - a photo taken. They’re recording this, memorializing it for their future relief!");
	else output(" Horny daughters of the twilight watch you with unfiltered glee, the trashiest among their highlighted number gyrating in graphically vulgar fashion or screaming obnoxious and unwanted suggestions. That’s not what you focus on though - it’s the cameras. Soul-stealing flashes capture this event in colorful pictures while the other outstretched devices are undoubtedly taking video of this. That makes you throb, <b>powerfully.</b>");

	var leilaHere:Boolean = false;
	// Leila Cameo! Random, 40% chance of appearing (Comment out until she is crew!)
	if(leilaIsCrew() && rand(10) <= 3)
	{
		leilaHere = true;
		//9999 update bust display to show both enemy AND Leila.
		output("\n\n<i>“Haa! Having fun there, ");
		if(pc.tallness <= 5*12) output("lunch-pail");
		else if(pc.tallness <= 6*12+6) output("wonder-[pc.boyGirl]");
		else output("giga-[pc.raceCute]");
		output("?”</i> A friendly voice out to you from a sea of strangers. Leila shoves and bullies her way to the front, codex in paw. <i>“Oh don’t mind me; you do you, ‘captain’!”</i> She casually lifts the gadget, obscuring her toothy grin - yep, she’s recording it too. Of course she would. Once a Jumper, always a Jumper, at least where one’s insatiable appetite for wank material is concerned. <i>“Did you slow down?!”</i> she bellows, tending the [leila.cockType] pole tenting her [leila.uniform]. <i>“Don’t look at me - fuck that slut’s face already! Gimme some good shit to get off to when I don’t have your ass bouncing on my cock!!”</i>");
		if(leilaIsCrew()) output("\n\nYou’ll deal with that insubordination <i>later.</i>");
		else output("\n\nDamnit... that bun is too needy sometimes!");
	}
	//Less common crew cameos since they dont have all the cum fun bonus.
	else if(rand(10) <= 3)
	{
		var crewBlurbs:Array = [];
		//Kiro Cameo Random :3
		if(kiroIsCrew() && !kiro.isBimbo()) crewBlurbs.push("Kiro");
		if(pennyIsCrew() && !penny.isBimbo()) crewBlurbs.push("Penny");
		if(mitziIsCrew()) crewBlurbs.push("Mitzi");
		var select2:String = "none";
		if(crewBlurbs.length > 0) select2 = RandomInCollection(crewBlurbs);


		if(select2 == "Kiro") output("\n\n<i>“Oh shit, Angel? Damn...”</i> The familiar, swaggering tones of your favorite law-breaking tanuki caress your ears as she casually barrels through the crowd" + (kiro.ballDiameter() > 14 ? ", nearly dragging her nuts behind":"") + ". Kiro’s bright red eyes fixate on the sight of your spit-slicked cock pounding away at the captive, and she wastes way no time in whipping out her own dick to stroke in unrestrained, hedonistic glory. She leans into the closest, bustiest zaika she can find and whispers something to her, and a second set of hands joins in servicing the kui-tan’s bestial pole. <i>“F-f-fuck her harder!”</i>");
		else if(select2 == "Penny") output("\n\n<i>“Whoah, what’s all this ruckus?”</i> Penny’s familiar voice cuts a hole through the crowd with ease, allowing the former peacekeeper to get a front row seat to the impassioned facefucking. <i>“Oh for fuck’s sake, mate, really?”</i> She folds her arms across her chest in annoyance" + (penny.hasCock() ? ", even as a telltale tent presents itself":", even if you can see her nipples tenting up right on cue") + ". <i>“You could have at least done this in private.”</i> She gestures lamely as you continue to fuck the zaika’s face, trying not to show how she’s starting to squirm. <i>“But I guess if you’re going to set core-rim relations back like this, I might as well stick around in case your defense needs a witness.”</i> She nods curtly. <i>“And that’s the only reason.”</i>" + (penny.hasCock() ? " One of her hands gently caresses an extremely unladylike distention in direct contradiction of her words.":""));
		else if(select2 == "Mitzi") output("\n\n<i>“Hey! Watch it! Ow, haven’t ya ever like, seen a gabilani before?”</i> squeaks a familiar voice that can’t quite manage to overcome its naturally bubbliness, no matter how irritated its owner is. <i>“What’s going on up here-”</i> [Mitzi.name] emerges from between a pair zaika laughing into their recording gadgets, making sure to rub her swishing hips against each of their tails in long, slow, gasp-worthy gyrations. <i>“-[pc.Master]!? Oh wow! You really are the best! Like, look at what you’re doing to her dumb, slutty face!”</i> She pauses, expression thoughtful as she begins to openly masturbate. <i>“I’ll make my face look juuuuust like that the next time you’re " + (pc.balls > 1 ? "slapping me around with your balls":"face-fucking a load into me") + ". And then... an...”</i> She trails off, but the squelching of her cunt rises in sympathy with her voyeuristic thirst, the pleasure too intense for your pint-sized gobbo-slut to do much but moan.");
	}
	// merge
	// multiCock
	if(pc.hasCocks())
	{
		output("\n\nPulling out is initially seen as a foolish move, but the viewers’ lack of faith promptly explodes into screeching delight when you slot your previously unused dick inside the insensate thief’s maw and rail her, twisting new measurements into the lovely vibrations of her throat. Thin flumes of spunky slaver roll down her jawline and onto her collarbone, and her fretful head twists wordlessly in spasming throes before comfortably stretching to this penis’ diameters while its brother bats into her right cheek. Shuddering gulps pull you deep into the euphoria-flooded ditch, imploring you to unload." + (pc.cockTotal() >= 3 ? " Once the second has had a go, the third plunges in, spunky slaver polishing her wobbling rack in a downpour of complete sluttery.":""));
	}
	// merge
	output("\n\nYour brain unlinks as your libido takes over, gagging the hapless milker-slut on your erection. The suction of a mouth combined with feral, [pc.knotBallsHilt " + x + "]-deep thrusts is overwhelming. You find a place where augmentation meets natural flesh, both tautly muscled in their own way. Managing to stay awake this long is an accomplishment that you reward with another spoo-splattering collision, claiming her vice-like neck and impact-bloated lips with hyper-turgid intent; the relentless, unfaltering slaps of your loins to her face are hotter and more intensely arousing than the last, every single time - it’s like you’re really shaping her into your personal onahole.");
	output("\n\nJackhammering into the native’s maw without mercy or care, you " + pc.mf("bellow","cry") + " out a second wind, gathering the last reserves of your energy into your overworked hips, panting like a dehydrated animal, and absolutely bludgeoning this bitch with enough dick to last her a lifetime. <b>You’re ready to burst.</b> You’re shaking from the aggressive twitching, loudly groaning before clenching. Plowing the suck-slut’s oiled orifice, orgasm crackles across your abdominals." + (pc.balls > 0 ? " The gravid density of your [pc.sack] ruthlessly claps into her lower lip, disturbing the rising tide of its fluid contents.":""));
	output("\n\nWhere do you cum; How do you make your mark?");
	processTime(25);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"In and Out",inAndOutThatMilkyThiefy,[x,leilaHere],"In and Out","Inside and outside!");
	addButton(1,"Inside",cummiesInsideIsWhereCummiesBelongDonchaKnow,[x,leilaHere],"Inside","Give everything you’ve got to her - don’t waste a drop!");
	addButton(2,"Outside",zaikasGetCumShoweredToBringMayFlowers,[x,leilaHere],"Outside","Hose her down!");
}

//[In and Out]
// if the PC has low cum output they’re gonna look pretty silly in these lul.
public function inAndOutThatMilkyThiefy(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var x:Number = args[0];
	var leilaHere:Boolean = args[1];
	output("Mindlessly riding your incoming climax, you pump hard and fast through the pink-skinned protein-milker’s pliable mouth, doing your best to remember the goal: in, and out - mark her like an owner their property! Worn like a tailor-made skank, she rocks against you, utterly transfixed by the whims of your [pc.cockType " + x + "] schlong.");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" Your flare billows out into a flat, feral peak, ready to assist in forcing the matter of oral fertilization.");
	if(pc.balls > 0) output(" Your [pc.balls] ‘whap" + (pc.balls == 1 ? "s":"") + "’ into her blissed-out face, the spread of her lush, panting fuck-pucker pretty much designed to take this kind of intensely pleasurable beating.");
	output(" The smells of climax creep up and make vague the urgency to orgasm. Fatigue sets in, and you slam against the stretched gape of your cock-whore’s agape mouth");
	if(pc.hasKnot(x) && pc.cocks[x].cLength() < 18) output(", driving the potent bulk of your [pc.knot " + x + "] to the surging apex");
	output(".");

	var cummies:Number = pc.cumQ();
	// pc Really Low Cum
	if(cummies < 50)
	{
		output("\n\nYou’re cumming, clenching out spurts of [pc.cum] into the bandit-bitch’s gullet, each dousing impact pounding successive shots of [pc.cumFlavor] treat into her gut. The fat ring of her blubbery lips cuts off retreat as the rose elf’s slurping cheeks suck your engorged shaft deeper, swimming in the rush of your throbbing heartbeat. Stuck in a famished loop of climax you struggle to emerge before you waste what little liquid passion you have in her belly");
		if(pc.hasCocks())
		{
			output(" and on the pavement - your unslotted phall" + (pc.cockTotal() == 2 ? "us":"i") + " sympathetically squirt your peaked ecstasy onto the cold, hard streets");
		}
		output(".");
		if(hasBackTentaclesOrCocktail()) output("\n\nThere’s more orgasmic sensation than there is ejaculation. While you’re busy above, your " + (pc.hasCockTail() ? "[pc.cocktail]":"phallic tendril") + " unleashes its sappy payloads into the room-temperature dampness of her tail. Virginal tightness milks your slithering mass quick and easy, and holds the intruder for further questioning when it offers up no more.  It’s entirely unexpected, and the croon of pitiful emission only highlights how unprepared you were to feed this thief’s desires.");
		output("\n\nPulling up through the exhilarated downspout" + (pc.hasKnot(x) ? " takes a lot of effort because of your [pc.knot " + x + "], but two hard pulls and you’re free":"") + ". Bursts of rapturous sensation tremble through your [pc.cockNoun " + x + "], joining a wave of clutching inner friction that demands you stay. You emerge from her throat in a splurting exit, caking her palate in one or two shots before withdrawing and pasting her upturned face in [pc.cumGem] spunk, managing paltry few ropes of jetting bliss before restraint is reinforced on your inflamed libido. Shivers of impotent embarrassment wriggle through your shoulders; the voices are clear again. They wanted something more than you gave.");
		output("\n\n<i>“Booo! The fuck was that!!?”</i>");
		output("\n\n<i>“Shitty show, shitheel! All that effort and you can’t even cover a bitch in cum!?”</i>");
		output("\n\n<i>“Let a real girl handle it next time, alien!”</i>");
		output("\n\n<i>“Aren’t you star-people supposed to be cum cannons on legs!?!”</i>");
		output("\n\nYour [pc.cocksLight] soften" + (!pc.hasCocks() ? "s":"") + " in moments without your sex drive to empower " + (!pc.hasCocks() ? "it":"them") + ". Everything comes back into shameful focus. Unencumbered by spunk, the bandit leans back, licking a stray drop from her upper lip, positively aglow. She seems satisfied, but faintly smug - you can’t place it. Oh, wait, the extra bit was disappointment. Fuck. <i>“I thought you would have more than that!”</i> Cyber eyes roll. <i>“Go on and get out of here before people beat you up! Now I know to avoid you in the future. All that strength and no milk! Hmph! It’s like you’ve never even attempted to please a partner before!”</i>");
		// Leila Appeared
		if(leilaHere)
		{
			output("\n\nYou were probably wrong to expect complete moral support from Leila, though she is quick to drag your ass away from the hecklers. <i>“Little young to be getting impotent, aren’t you [pc.name]?”</i> she elbows you playfully in the ribs. <i>“Well, you fuck good, but if you don’t have the nut to back it up what good are you? Think you need some dick pills in your life. I get spam about it all the time, might actually sign you up for one.”</i> You sigh and she pushes you forward. <i>“Don’t worry, I’ll edit that part out so you can keep your dignity, but I’m definitely gonna fap to that part where you gagged her.”</i>");
			output("\n\nThe bunny-girl slaps you on the [pc.ass]. <i>“Better make yourself scarce. This place is neat and all, but dangerous as fuck.”</i> Her teeth shine under the neon. <i>“Fucking fun as hell out here. Beats Zheng Shi by miles and I still get to kick teeth in. Hey, just be careful yourself! Bitches be desperate. They’ll make a milk-slave out of you if you let ‘em. Don’t go getting kidnapped by unenlightened cunts, okay?”</i> A pat on the shoulder and she takes off into the night, lop-ears swinging.");
			output("\n\nSmall comfort. Oh well, at least you got off...");
		}
		// Else
		else output("\n\nQuickly getting yourself in order, you hurry away from the scene with all the dignity you have left. Ducking into an alleyway and catching your breath, you resolve not to make a fool of yourself like that again. Once you’re certain you’re in the clear, it’s back on the journey for you...");
	}
	// pc Normal Cum
	else if(cummies < 1000)
	{
		output("\n\n[pc.Cum] rushes in throbbing spurts of sperm-packed release, barreling into the bandit-bitch’s strawberry stomach. Each sublime impact to the fat ring of her blubbery lips triggers another dousing surge of [pc.cumFlavor] slut-feed. Buried deep in the petty thief’s gullet, you pump your [pc.cumVisc] loads wildly and without care, every impulse in your body demanding the most fervent impregnation possible. Spunk jets in dizzying crescendos of orchestral libido as it degrades into a bestial, lustful haze." + (pc.balls > 0 ? " Your euphoric nutsack pulses energetically on the front of her mouth, an additional layer of churning feedback for the enraptured zaika.":""));
		if(pc.hasCocks()) output(" Liquid passion vents rhythmically inside and out; your extra " + (pc.cockTotal() == 2 ? "dick coats":"dicks coat") + " her hair in [pc.cumGem] discharge as well as fling thin arcs of slick ecstasy across the Gyre’s jagged floor.");
		if(hasBackTentaclesOrCocktail()) output("\n\nBlissful ejaculation lances the zaika’s tail as well. Your " + (pc.hasCockTail() ? "[pc.cockTail]":"tentacular tendril") + " unloads into the muscled wetness of your lay’s omni-tail, painting her egg-tube with bulging bulks of splatter. She must be craving motherhood with a tightness like that! As above, so below, you’re hosing her down as best you can, swelling her body with [pc.cumVisc] jizz.");
		output("\n\nAlthough you can’t give one-hundred-percent on both ends, you still remember your urge to mark her as a used slut. After flushing her mouth-pussy in bounteous [pc.cumNoun], your [pc.hips] carry your thick dick out of her mouth");
		if(pc.hasKnot(x)) output(" despite the profuse protest of your [pc.knot " + x + "]");
		output(", glazing her slimy throat while her tongue coaxingly draws out the rest of your " + (pc.balls > 0 ? "ball-":"") + "milk, and shoot gouts of creamy warmth into her trembling cheeks. You do this slowly so that she has the pleasure of tasting your DNA, swallowing it along with fresh air, before popping free and drawing [pc.cumGem] lines around her face with gratified hums. Sweet strings of [pc.cumColor] bliss dangle from her upwards-inclined jawline as she presents for the act, gleefully accepting the drenchings of your testosterone.");
		output("\n\nAs you shimmer in post-coital afterglow, you’re content in the knowledge that you’ve performed up to the standards of your viewers.");
		output("\n\n<i>“Oooh! An alien that knows how to show a girl a good time!”</i>");
		output("\n\n<i>“Could be better! I could cum all over that slut!”</i>");
		output("\n\n<i>“Hey, slut! Jerk a few more out on her hair!!”</i>");
		output("\n\n<i>“No, pinch her nose and fuck her face again! Come ooonnn!”</i>");
		output("\n\nNow that your sex drive has cooled and you’ve staked a fair claim on this milk-obsessed gal, you take a step back and admire the volume you’ve given her. You can sort of feel a soreness in your " + (pc.balls > 0 ? "sack":"prostate") + ". Damn, all you can think of now is you wish you had some more! <b>Imagine the damage you could do here!</b> Touching her lips, the petty pink cream-seeker bats her eyes towards yours, idly cradling her belly in a slow back-and-forth stroke. <i>“I really want some more...”</i> she pouts. <i>“" + (pc.cumType == GLOBAL.FLUID_TYPE_MILK ? "It was sooo good too! Not as shtrong as boobie-milk yet it gives me... this buzz... mmm.... ":"") + "Buuut if that’s all you’ve got, that’s okay, I guess. Maybe I’ll find you again and your tanks’ll be more full!”</i>");
		// Leila Appeared
		if(leilaHere)
		{
			output("\n\nLeila motions you over and " + (pc.isTaur() ? "hops on your back":"pulls you into a headlock") + ", taking the lead. <i>“Making friends out here, [pc.name]? That was hot. Could be better, room for improvement - room for more cum. But y’know, credit where it’s due,”</i> she grins, slapping you on the back. The sound ricochets down an alleyway. <i>“Fucking good video too, I’ll be fapping to that for a while. Until I get bored and try to find you doing that again. Nice work gagging that bitch, by the way.”</i>");
			output("\n\nThe bunny-girl stretches out and gives you a kiss on the cheek. <i>“Glad to see I’m not flying with a complete pushover. You take care of yourself out here.”</i> Her grin is illuminated by the neon shine. <i>“Fun as hell, but damn, these pointy-eared cunts are hair-trigger dangerous. Guess that’s just how it is when your planet’s being invaded and overtaken by a bunch of aliens. Don’t go getting kidnapped and turned into a milk slut.”</i> A paw fastens to your wrist and squeezes. <i>“I mean, seeing you with huge tits’d be great, but if you became a decoration that’d fuck me up. Again, careful, okay?”</i>");
			output("\n\nYou’ll try. She takes off into the night, lop-ears swinging.");
		}
		// Else
		else output("\n\nGetting yourself in order, you leave the vulgar natives to their business, not caring what happens in your wake. Nothing is new under the dystopian smog on Dhaal. Your breath steadies with every step until you’re in the clear. It’s time to get back to business...");
	}
	// pc High Cum
	else if(cummies < 10000)
	{
		output("\n\nTeeming ropes of deluging jizz launch into the strawberry woman’s tender insides. [pc.Cum] washes her throat out all the way down to the stomach, molten fluid pressure hosing into her swelling midsection. Her narrowing spout gulps down pint after pint of hot semen, spastically reacting to the steadily gushing volume of liquid. Drenching layers of sperm careen into the alien slut’s possibly-enhanced beely, sheets of [pc.cumVisc] spooge enlarging her into a gravid, pregnant form that’s already causing vulgar ructions among your audience. They’re loving every second of this, delighting in the fountaining churn of nut-butter weighing her down" + (pc.hasCocks() ? " and the bursting of [pc.cumGem] bliss from your unslotted [pc.cockHeads]":"") + ".");
		if(hasBackTentaclesOrCocktail()) output("\n\nAs above, so below - your overflowing breeding imperative floods her from two different, spunk-sopping ends. Your " + (pc.hasCockTail() ? "[pc.cockTail]":"back-mounted tentacle") + " mightily reams her poon-balloon with all possible strength, in feral need of impregnating her, of fertilizing the egg-cavern further up the cum-drunk shaft. Either way, you’re giving it your all - she’ll be a well-fed cum-slut by the end of this and a possible mother to your young. Win-win, right?");
		output("\n\nLiquid ecstasy undulates up her throat, but you’re pulling out of that inflated passage just in time to save her from gooey asphyxiation. Withdrawing from the bulk-burdened esophagus in a gushy, hyper-sexual wake" + (pc.hasKnot(x) ? " that your [pc.knot " + x + "] angrily acquiesces to":"") + ", you plump her mouth with copious amounts of [pc.name]-brand DNA that quickly stream out of her lips like a crack unsealed. Finally you emerge, and start pumping your hips to cake the [pc.cumGem]-festooned slut in [pc.cumFlavor] issue. Each thrust of the [pc.hips] unload fat, shimmering gobs that scatter on impact with the facefucked thief’s beautifully punished visage, lances of your unquestionable virility spraying across her jaw, cheek, webbing those glowy eyes shut in " + (pc.isHerm() ? "herm-":"") + "spunk, all while she presents her open mouth, dripping tongue, and wobbling boobs for the pasting of a lifetime. Fucking beautiful.");
		output("\n\nThere can be no doubt that you’ve left your mark.");
		output("\n\n<i>“Unbelievable! The alien cums like a zaika!!”</i>");
		output("\n\n<i>“Go for round two, drown that bitch!”</i>");
		output("\n\n<i>“Hey, my turn now, xeno! I bet I can get even more than that!”</i>");
		output("\n\n<i>“Aim some of that my way!!”</i>");
		output("\n\nTaking a deep breath and unclenching white-knuckled fists, you stagger back and collect yourself. The milk-fetishist is laid back in a puddle, the center of a tainted glade in a concrete jungle. Occasionally, she scoops some of your jizz and brings it to the black amethyst flower between her legs, feeds it into her tail, or sucks it off a finger. She’s complete and utterly pulverized. <i>“" + (pc.cumType == GLOBAL.FLUID_TYPE_MILK ? "Mmmyessss... miiiiilk, milky milkies cummsss, yess...":"Delishus... so good... alien cum...") + "”</i>");
		// Leila Appeared
		if(leilaHere)
		{
			output("\n\nLeila holds up her hand in an obvious gesture. High-fiving the jumpsuit-wearing bunny-herm, she wraps an arm around your nape and guides you away from the commotion. <i>“Fucking hot work back there, captain.”</i> She pats you on the [pc.ass]. <i>“That’s the [pc.boyGirl]-slut I joined up with.”</i> An elbow to the ribs. <i>“Nothing better than seeing dumb cunts getting what they deserve. Upjumped sluts all these uh, zaika, or whatever. I saw how you gagged her. Top-tier work. You may be as good as me at it!”</i>");
			output("\n\nLaughing, she gives you a kiss on the lips, and pockets her codex. <i>“Gonna be fapping to that show for a while. Maybe a month, if I’m optimistic. Then I’ll need something new. Hope you keep putting out that god, [pc.name].”</i> Leila waves and hops back. <i>“Just don’t go getting turned into someone’s big-titted decoration around here. Nothing sucks more wet, reeking ass than losing a friend, especially to bitches like these. Had it happen once. Fucking primitive zil on that planet...”</i>");
			output("\n\nThe tangerine laquine vanishes into the night, shouting back, <i>“Careful around here, okay?”</i>");
			output("\n\nShould watch out for herself.");
		}
		// Else
		else
		{
			output("\n\nLeaving the crowd of zaika behind, you don’t spare a thought as to what’s gonna happen to that thief. Probably get broken down into parts and become a fuck-nugget attraction in some backstreet brothel for all you know. Wouldn’t put it past some of the more bellicose of these lawless ladies...");
		}
		// merge
	}
	// pc Hyper Cum
	else
	{
		output("\n\nOrgasm crashes into you like a freighter trying to escape the pull of a black hole, subsequently spilling into the zaika’s food-tube turned cum-funnel. Rising tides of peaking ecstasy well up from your oceanic reservoir, gushing into the strawberry elf’s tender innards. The impossible bulk of [pc.cum], geysers of hot semen, flood into the stoppered bottle of the woman’s saturated esophagus. Arcing torrents of urethra-straining detonation bounce your [pc.cock " + x + "] up so hard that she follows it, attached to the pumping rupture of your incomprehensibly powerful ejaculations. Absolutely too much cum thrusts into her belly while you squish around in there, swelling her into the late stages of traditional pregnancy. Your cock-slave gags on the dick inside her, as well as three-times its presence in hyper-sexual overflow. She can’t swallow it, and her belly is now full.");
		output("\n\nThe inimitable laws of nature take over. As she writhes in the cream-clogged revelry, [pc.cumGem] jets of spunk spray out of the corners of her mouth" + (pc.hasKnot(x) ? " regardless of your knot’s interference":"") + ". Every new molten burst of oral varnish scatters the old so that the new can settle, and then the kinesthetic process repeats ad infinitum - you squirm and shift thoroughly all the while. Each and every last drop of your teeming lust lances the zaika’s belly. There’s no pulling out like this. Not with every powerful burst sending her into the mightiest cum-drinking clenches and " + (pc.balls > 0 ? "ball-":"prostate-") + "draining spasms." + (pc.hasCocks() ? " The crowd has fallen silent, though many scream and shout as ballistic bolts of arcing cream vent their way. You’re not so much [pc.cumNoun]-hosing this bitch as you are basting the crowd in splendid gallons of endless emission, completely oblivious to everything but the fact you are cumming and cumming so Goddamn much that very few creatures in existence could handle the magnificent rain.":""));
		if(hasBackTentaclesOrCocktail()) output("\n\nAs above, so below. Her poor tail is beholden to the lacquering abuse of your libido’s fathomless, frightening depths. Your " + (pc.hasCockTail() ? "[pc.cockTail]":"tentacle-dick") + " bombards her genitail with equal amounts curve-broadening spunk, continually reaming the limp, overfucked muscle into the ground even as unimaginable amounts are spilling out from its slackened maw. [pc.CumVisc] bounty flows, and all see how incredible a breeder you really are.");
		output("\n\nJerking loose from her mouth takes great effort on your part" + (pc.hasKnot(x) ? ", the irritated radius of your feral knot notwithstanding":"") + ". When you uncork the strawberry-hued alien, a [pc.cumColor] waterfall of your monstrous spunky flow drains from the pipe-spout underneath the semen bubbling out of her nostrils. Your pace outside is just as forceful as the one inside, so you set to gyrating and thrusting, trembling and wobbling as you knock her over and cast a lacquering storm of [pc.cumGem] vigor over her and all who surround you. Geysers of lancing cum splatter heavily against the cocooned form of your once-foe, and anyone else unfortunate enough to be caught in the writhing maelstrom. Sound dies down; you cry out the whole time, unable to articulate anything more complicated than ultimate absolution. None could ever match your output.");
		output("\n\nNobody. Ever. The minutes of climax are an eternity of goo-blasting euphoria. Only mythical space monsters were meant to take loads like this! Again, and again, you shower and splash the curvy zaika in waves of thickly-streaming nut, and nobody can stop you. Nobody would ever dare to stop you. This kind of thing has to end on its own. No ifs, ands, or buts. Everyone and everything around you is absolutely drenched in chunk wads and dripping wads. Silence reigns.");
		output("\n\n<i>“WHAT THE SHIT!”</i> screams one of the girls out there, and a cacophonous clamor breaks the otherwise awkward quiet.");
		output("\n\n<i>“WHAT THE FUCK WAS THAT!?”</i>");
		output("\n\nPlaintive sounds from people who weren’t even watching getting basted by secondhand spunk! You can’t help but start laughing. Which does hurt. Oh hell.");
		output("\n\n<i>“Fucking xeno-cum-tanks! Find a fucking milk bar you hydra-loving pigfat!!”</i>");
		output("\n\n<i>“WHO GOT ALL THIS ON ME!?”</i>");
		output("\n\n<i>“GET OUT OF THE WAY! FUCKING GROSS!”</i>");
		output("\n\n<i>“I get shit for breaking a window but we just let RUSHERS cum all over us!?? What the FUCK is up with that!?!?”</i>");
		if(pc.cumType == GLOBAL.FLUID_TYPE_MILK) 
		{
			output("\n\n<i>“W-WAIT! It tastes like Milk! No get off, that’s mine!”</i>");
			output("\n\n<i>“Fuck yourself!”</i>");
			output("\n\n<i>“Stop shoving me - who the fuck would even want it off the ground!? No - wait STOP LICKING ME! FUCK OFF!”</i>");
		}
		output("\n\nFinally stepping back, you realize the extent of the damage you’ve caused. This whole section of the street is utterly tainted. You can’t even find the thief who accosted you, but you can be sure she’s the giant undulating lump of [pc.cumNoun] at the center of your city-slicking puddle.");
		// Leila Appeared
		if(leilaHere)
		{
			output("\n\n<i>“Hahahaha!!! Holy fucking shit, [pc.name]!!”</i> Leila is beaming the biggest smile on your approach. Wait, is that... [pc.cumColor] jizz dripping from her ear? <i>“Nice, fucking gold star for you, captain cums-a-lot!”</i> The wad flies off on a sudden movement, landing on quarreling trio. <i>“That was so fucking cool, and hot. I knew I made the right choice coming with you, you big nut buster you!”</i> She grabs you by the arm and takes you away from the ruckus. <i>“God damn, that video is worth money. I’d upload it but... eh, I wanted it for myself. Don’t worry, I’ll send you a copy later. If I remember. Probably won’t.”</i> She slaps your [pc.ass].");
			output("\n\n<i>“Feelin’ better?”</i> she asks, and you nod. Then you get a deep kiss on the lips. <i>“Seriously, that was hot. Good fucking. Just, good fucking.”</i> She laughs. <i>“Oh my fucking goood you should have seen the fourth or fifth shot you put out, fucking streamed right over half the audience all at once like a ribbon. I was dying, like, seriously, I almost lost the camera then and there.”</i> You both share a laugh down the street; suddenly, she pats your back. <i>“Gotta run. This planet is really fucking creepy but that? That was worth seeing. You watch yourself out here, ‘kay?”</i>");
			output("\n\nHer too! Leila vanishes into the night, but you’ll certainly see her again.");
		}
		// Else
		else
		{
			output("\n\nThis isn’t a mess you’re keen on sticking around to clean up, or see who <i>has</i> to clean it up. Leaving the [pc.cumNoun]-scented garden behind, you’re a bit amused by what just happened. Busting a nut on a few dozen aliens like that. No matter how far you get, you can still hear the commotion, hundreds of pissed off gangsters and others clamoring all at once.");
			output("\n\nBut at least you can breathe easy! Not many can say they just walked away from a gang war in the making, still sore from the delicious ache of exhilarating release...");
		}
		// merge
	}
	//[Next] \\ Back to game
	// sceneTag: processTime
	// sceneTag: PC Cums
	//Back & cunt tails can impreg dat biiiiitch.
	processTime(7);
	enemy.loadInMouth(pc);
	if(hasBackTentaclesOrCocktail()) enemy.loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Inside]
// Tooltip: Give everything you’ve got to her - don’t waste a drop!
public function cummiesInsideIsWhereCummiesBelongDonchaKnow(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	var x:int = args[0];
	var leilaHere:Boolean = args[1];

	output("It’s always better when someone swallows. Surrendering to your bestial ferocity, you rail the pink-skinned milk-seeker’s malleable maw. There's absolutely no chance that you won’t breed her thirsty, front-mounted suck-hole. Esophageal membranes close around your pistoning phallus like a pussy ready to lock in a mate’s seed. ");
	if(pc.isBro() || pc.isAss()) output(" All the better, you think. You don’t care if she gags or chokes. You just want to cum.");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" Your flare stretches out into hole-stretching readiness, the feral, fleshy mesa primes to ensure fertilization in the carnal velvet of her conquered throat.");
	if(pc.balls > 0) output(" Your [pc.sack] slaps giddily and gleefully into the cum-slut’s chin, beating rhythmically against lips designed to take intense, brutal couplings like this.");
	output(" Climax burbles up from the depths of your gut, a rising tide that lifts all your boats. Just as tension starts to flush, you slam against your dicksucker’s luscious stretched mouth");
	if(pc.hasKnot(x) && pc.cocks[x].cLength() < 18) output(", maximizing your chances at faux-impregnation with the squishy insertion of your [pc.knot " + x + "]");
	output(". Overcome by sexual haze, you let loose.");

	var cummies:int = pc.cumQ();
	// pc Normal Cum
	output("\n\nThe inner tenderness of your urethra is soothed by spurting rushes of [pc.cum]. [pc.CumColor]-hot ropes of exhilarating bliss launch from your [pc.cockHeads] in gouts of [pc.cumFlavor] protein. Every pump and squirm coaxes the zaika thief’s throat-muscles into a docile submissiveness, every over-fucked, jizz-coated cluster happy to receive the cream spilling from your mast. Slamming forward" + (pc.balls > 0 ? ", mashing your nutsack into her jaw":"") + ", you fuck the spunk-milking coils, wringing out as much orgasm as you can into the slut’s taut oral embrace." + (pc.hasCocks() ? " Jets of unsheathed [pc.cumNoun] sail through the air in shimmery arcs that ‘plap’ uselessly against the pavement. Another layer of debauchery on the Gyre’s surface to evaporate away under the evernight sky.":""));
	if(hasBackTentaclesOrCocktail()) output("\n\nSperm-packed cream spills into the milk-bandit’s tail-hole, suffocating the housing gel-walls of her three-foot-long vaginal throat in steady streams of fluid pressure. Your " + (pc.hasCockTail() ? "[pc.cockTail]":"tentacle") + " drives into the uncharted depths, stuffing it to the brim with foreign fullness and all the orgasmic quantity that accompanies it. This serves only to amplify your climactic stupor, cumming from multiple angles, enjoying the fastening grip of a pussy-tail desperately needing to be bred.");
	// pc High Cum (add-on to Normal)
	if(cummies >= 3000)
	{
		output("\n\nYou’re just getting started. Regaining the wherewithal to move and shudder, you renew the liquid volume parting her oral muscles, drowning her in enough [pc.cumVisc] jism to fill a bucket, maybe even a bath-tub on your best days. Volumes of flooding jizz round out her abdominals into a third storage tank for musky bodily fluids. Zaika tits store cum, right? Well now her belly does too, and it looks the part! It wobbles, looking like it needs to be cradled and stroked, to remind her of the seed-gushing Rusher who just pumped her, in lip-squishing, crotch-smacking ‘whaps’, whom gave her the feeding of a lifetime. She wanted your milk. She’s getting it, every drop of [pc.cumFlavor] goodness, flowing relentlessly into her depths, climbing up the downspout and warming your phallus in a mould of its own fluid making.");
		output("\n\nAgain you shove forward, grinding against the puff of her cock-warming orifice, cries of bliss racing from your lungs" + (pc.balls > 0 ? ", endless, churning throbs of your nutsack brimming against her silken flesh":"") + ". Absolute delight.");
	}
	// pc Hyper Cum (add-on to High)
	if(cummies >= 15000)
	{
		output("\n\nTo her dismay, your titanic efforts are still far from over. You have enough cum to feed a clan of ");
		if(CodexManager.entryUnlocked("Fanfir")) output("fanfirs");
		else if(CodexManager.entryUnlocked("The Treatment")) output("cow-girls");
		else output("galotians");
		output(" and you’re not afraid to make this milker look the part. Her entire body jolts in tune with the renewed geysering vigor of your subsequent loads, legs kicking, arms spasming; the crowd goes wild, clapping and hooting and cheering. A flurry of shutterstock captures the time lapsed moments of the pink-skinned bargain skank’s curves broadening to house the gargantuan magnitude of hot-hot semen you pour into her. Bulging torrents of abdomen-inflating heat sprays into her stomach, and down every conceivable passage that will grant it access. None of their race could ever hope to cum this hard. They know it, you know it. Not even their so-called hydras. You hope this will earn you some amount of street cred, and that those who see this will prefer to avoid coming to blows with you lest they become a certain off-worlder’s next sentient bubble buddy.");
	}
	// merge
	output("\n\nYou sigh, and the resultant shivers carry the blissed-out tingle all the way to your [pc.fingers] and [pc.toes]. You’re sweating from the brow, super aware of every tingling droplet trailing down your [pc.skinFurScales].");
	if(pc.hasKnot(x)) output(" Tugging your knot free of a mouth is a lot easier than from a pussy. It makes you laugh dazedly when the tugs cause some unswallowed effluence to squirt from the openings as you jimmy free.");
	else output(" The maw-locked bandit attached to your cock is out of it - her eyes have fled into unconsciousness, and she hangs in the firmament, merely an ornamental for your cock.");
	output(" Filaments of [pc.cumNoun] follow you out. She’s in no position to swallow.");
	if(cummies >= 15000) output(" Oh she’s breathing, and she’s fine, but you’ve fucked her so hard and ruthlessly that she’s going to be out of it for a while!");
	else output(" Even though you didn’t pump <i>that much</i> into her... she’s still a bit dazed and stupid, only capable of articulating moans and hiccups.");
	output("\n\n<i>“Hot shit! Best action I’ve seen all day!”</i> crows one of the night-time hermaphrodites.");
	output("\n\n<i>“Guess you xenos have it in you after all! Come by later and we’ll show you how real girls take it!”</i>");
	output("\n\n<i>“Not bad off-worlder! Really showed that slut did ‘ya!?”</i>");
	output("\n\n<i>“She’s faking it! Fuck her face again, she’s totally ready for another go!”</i>");
	if(cummies >= 3000) output("\n\n<i>“Damn! Look how fat she got!! All these rushers are good for the same thing: making skanks fat on spunk! Hahaaa!”</i>");
	if(cummies >= 15000) output("\n\n<i>“Not just fat, that bitch won’t be walking for days! Look at the SIZE of that BELLY! I doubt a hydra could do any better!”</i>");
	// Leila Approached
	if(leilaHere)
	{
		output("\n\n<i>“Hey captain facefucker!”</i> Leila ushers you over and hurriedly steals you away from the quarreling, bickering zaika. <i>“");
		if(cummies < 3000) output("Gave it to her good, didn’t ya? But you didn’t cumflate her. Not good enough for a laquine, just let you know. Gonna have to edit the jizzing part out, T-B-H.");
		else if(cummies < 15000) output("You cum good, but not as good as me. I’ll be happy to show you how it’s done. But hey, at least I got some good fap material out of it. Room for improvement though!");
		else output("I could fucking feel that geyser split from where I was standing. Hottest thing I’ve seen all day. Just for today though. Knowing I’ve got a captain who goes out to fuck bitches up like that is the best thing all the time.");
		output("”</i> The tangerine laquine slaps you on the [pc.ass] and lays a kiss on your cheek. <i>“Thanks for the vid, [pc.boyGirl]-wonder. Come watch it with me later and maybe I can cum down your throat the way you did hers.");
		if(cummies < 3000) output(" You know, except for the part where you didn’t even fatten her up.");
		output("”</i>");
		output("\n\nYou elbow her in the tit and she feigns great offense. <i>“Anyway, you watch the fuck out on this planet. It’s fun, and it’s cool, and there’s dumb sluts to pump full of jizz, but these girls are fucked in the head. Back alleys, especially on a planet that never sees the sun, are always scary. Nobody enters them fearlessly unless they own the territory. Don’t go getting turned into someone’s milky wall mount, [pc.name]. Okay? See ya.”</i>");
		output("\n\nYou high five and she hops off, easily blending into the night like any other miscreant. Her training will serve her well here.");
		output("\n\nAs yours will you.");
	}
	// Else
	else
	{
		output("\n\nExtricating yourself from the surrounding zaika, you flee before anyone gets any bright ideas to take advantage of you. Whatever they do to the thief isn’t your concern. You got what you wanted in the end, and that’s all that matters. The Gyre will swallow her up and spit her out later. Whatever happens, it’s her problem now.");
	}
	//[Next] \\ Back to game
	// sceneTag: processTime
	// sceneTag: PC Orgasms
	processTime(7);
	enemy.loadInMouth(pc);
	if(hasBackTentaclesOrCocktail()) enemy.loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[Outside]
// Tooltip: Hose her down!
// Hyper cum output hits the crowd (and Leila) some lul.
public function zaikasGetCumShoweredToBringMayFlowers(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	var x:int = args[0];
	var leilaHere:Boolean = args[1];
	output("Aching inches of throbbing [pc.cockNoun " + x + "] swab the zaika’s oral orifice, rapid, luxurious pumps that carry you to her deepest, tightest places, and outwards, into the coolness of Dhaal’s atmosphere. It’s nice when someone swallows, but it’ll be more fun, you think, to coat this girl in cum. You’re nothing if not merciful - she won’t be knocked out by what you’ve got coming.");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" With your flare swelling into a round peak, you scrub the insides of her twat-gullet extra hard. Alas, you won’t need to seal anything in this - this time.");
	if(pc.balls > 0) output(" Your hyper-ready nutsack claps hard into the luscious pucker of your shuddering dick-sucker. All the orgasmic weight churning up inside it grows heavier with subsequent collisions, and your senses are wholly possessed by the ocean of need rising.");
	output(" Despite the fact that you’ve got a mouthload of meat stuffed into this overstretched onahole, you’re" + (pc.hasKnot(x) ? " gonna ignore your [pc.knot " + x + "]’s desires and you’re":"") + "... gonna pull... out... NOW!");

	var cummies:Number = pc.cumQ();
	// pc Normal Cum

	output("\n\nFat threads of [pc.cum] surge from your [pc.cockHeads], bursting with molten force, striping the zaika’s pink-wine flesh in steaming loads of [pc.cumFlavor] semen. Her color-shifting hair gets absolutely drenched by your seed, and by the third and fourth cumshots respectively, you’ve given her some brand new earrings to be proud of. [pc.CumGem] decorations dribble down the cum-slut’s pasted face, while you thrust your hips" + (pc.isTaur() ? " and pump your [pc.cocksLight]":"") + " for all you’re worth. Grateful for the treats, the vigorously fucked thief opens her palms to catch the spillage and keeps her mouth open, eager for a taste of your [pc.milkNoun " + x + "].");
	if(pc.cumType == GLOBAL.FLUID_TYPE_MILK) output(" Given it IS real milk, in a way, you know that you’re doing her a huge favor right now.");
	output(" Keeping it all aimed at her is a tough prospect, but if you can’t reward your whore then you’ll definitely be the laughing stock here. That can’t happen!");
	if(hasBackTentaclesOrCocktail()) output("\n\nWhilst you’re busy up top, your " + (pc.hasCockTail() ?"[pc.cockTail]":"tentacle") + " makes handy work of her tail. Matched with rear-mounted genitalia of your own, her overfucked tail spasms around the alien insertion, a glove bulging with thick [pc.cumVisc] gouts of seed splitting its vice apart. You can spot the spheres of spouted liquid in her tail’s soft muscles, traveling through the serpentine coil and into her egg-duct. Fucking hot.");
	// pc High Cum (add-on to Normal)
	if(cummies >= 2000)
	{
		output("\n\nSensing that your orgasm is nowhere near over, the milk-thief wordlessly assists with that. The softest hands on the most sensitive cockflesh make your eyes roll back from the overwhelming sensations of touch short-circuiting your brain. Sputters of half-finished orgasm are sparked into a relentless tide of impactful bursts that startle her at first, but then she takes your violent ejaculations like a champ, working your [pc.cocks] like " + (!pc.hasCocks() ? "a lever":"levers") + ", aiming the vast majority of your [pc.cumNoun] reservoir to the places it needs to go, hosing herself down in thick layers of glaze. All too quickly, the whole of her body overflows with the gouts of free-spurting spunk, and now she’s like a new breed of galotian or rahn. Each fat liquid stream that hits her sends a cascade of sperm in all directions, a wild varnishing rain that impresses your audience greatly.");
	}
	// pc Hyper Cum (add-on to High)
	if(cummies >= 15000)
	{
		output("\n\nBut it’s far from over. Oh she has no idea the tsunami she’s brewing up right now. Instinctive convulsions scour upwards, twisting about your spine. Your [pc.fingers] stretch out and go crazy in the joints. When ‘it’ hits, she hits the ground, knocked back by what feels like the most powerful streaming gush of jizz. Following that expulsion are <i>even greater volumes!</i> How you remain standing now is a mystery that’ll never be solved. The only " + (pc.hasCocks() ? "parts of you that exist are between your [pc.thighs]":"part of you that exists is between your [pc.thighs]") + ", flexing out its entire inflamed length and girth in jizz in contiguous streams of virile potential.");
		output("\n\nIt’s glorious. Absolutely glorious. You’re not even yourself, you’re just floating in whited-out darkness, thwacking your hips forward and just <b>cumming</b> in all directions. Arcs of splatter stain your brand of sexual graffiti on the walls and windows of nearby buildings. Storefronts are ruined. Every drop of your monstrous, teeming lust is deposited on everyone who dares stand near. If your crotch was a spaceship and your " + (!pc.hasCock() ? "urethra a hull breach":"urethras were hull breaches") + ", then the sheer <b>venting</b> you’re doing is explosive decompression that floods the street in a biblical climax that refuses to abate. The phantom sensation of her hands clings to you, and by comparison, you feel nothing of yourself. You just cum, because it’s all your body’s good for.");
	}
	// merge
	output("\n\nWhen your head stops craning and fixes itself, it’s like a plug being inserted into a robot. Your sight clicks back on, and you’re very aware of being surrounded by a" + (cummies >= 15000 ? " glowing [pc.cumGem] crowd":" cheering, clapping crowd") + ". Letting out the air you’ve been holding, you wonder if you’ve breathed at all in the last five or ten minutes. Once you do, everyone erupts into obscene howls.");
	// normal cum
	if(cummies < 2000)
	{
		output("\n\n<i>“Hahaha! Look at that, the alien can’t really cum as much as us! What do we have to fear from Rusher sluts?”</i>");
		output("\n\n<i>“Aww, I was hoping to see that slut get really messed up!”</i>");
		output("\n\n<i>“Still fucked really good! Hey, do round two, maybe you’ll cum better, haaa haha!”</i>");
		output("\n\n<i>“Hey xeno-bitch! Look how a real girl cums!!”</i>");
		output("\n\nYou sigh.");
	}
	// high cum
	else if(cummies < 15000)
	{
		output("\n\n<i>“Nice cream, off-worlder! Got any more in there?”</i>");
		output("\n\n<i>“Fuck that was hooot! And I got it all on tape, yes! We really need some cummy rushers like that in the bars!”</i>");
		output("\n\n<i>“Milk is great but seeing an off-worlder cum is... kinda hot!”</i>");
		output("\n\n<i>“Wow, [pc.heShe] cums like we can! That’s pretty impressive! But I’d be even more impressed if [pc.heShe] came like a REAL alien!”</i>");
		output("\n\nIgnore the peanut gallery.");
	}
	// hyper cum
	else
	{
		output("\n\nSilence is broken by a screech. <i>“WHAT THE FUCK IS THIS!?”</i> A clamor of bickering and bitching immediately breaks out.");
		output("\n\n<i>“WHAT HAPPENED TO ME?! WHAT IS ALL THIS GUNK AND WHERE DID IT COME FROM!?”</i>");
		output("\n\n<i>“FUCKING OFF-WORLDERS! Spraying CUM ALL OVER THE TOWN... why do we put up with this!?”</i>");
		output("\n\n<i>“I didn’t know there was an orgy going on!”</i>");
		output("\n\n<i>“So bitches can be brought up for drawing on the walls and yet a rusher can just swoop in and cover us all in cum? What the fuck!!”</i>");
		if(pc.cumType == GLOBAL.FLUID_TYPE_MILK) 
		{
			output("\n\n{hasMilkCum: <i>“Oh wow! It tastes like - IT IS MILK! C’mere you, I want -”</i>");
			output("\n\n<i>“Stop pushi - HEY, get off you stupid sluuuuaaaahhhh-!”</i>");
			output("\n\n<i>“Have you no shame!? Stop licking that off the ground!!”</i>");
		}
		output("\n\nLaughing hurts, but you can’t help yourself. Not only did you hose down your suckslut, but you’ve caked the entire audience too. Well, they wanted to watch!");
	}
	// merge
	output("\n\nAs for the thief.... Well, she’s off in dreamland. You admire your handiwork. ");
	if(cummies < 2000) output("Most of the augmented lines where organic meets technical have been painted over by smeared jism.");
	else if(pc.cumQ() < 15000) output("She looks like she just got back from working the twelve-hour shift at a popular glory hole. Just <i>rolling</i> in jizz!");
	else output("She’s the center of her own spermy galaxy, rolling around like a pea in a pod, if the latter was a fucking gigaton of [pc.cumVisc] gunk.");
	output(" She’s too busy scooping everything into her mouth, uncaring for the witnesses. Finger after finger slides into lips that slurp the digits clean of all your still-warm [pc.cumNoun]. The view reinvigorates your [pc.cocksLight], but you’re not keen on going another round like this. No way. It’s time to ghost.");
	// Leila Appeared
	if(leilaHere)
	{
		output("\n\nLeila has already pocketed her codex and is clapping her gloved hands as you join her in vacating the area." + (cummies >= 15000 ? " There’s... two wads of [pc.cumGem] spunk clinging to her lop ears.":"") + " <i>“");
		if(cummies < 2000) output("Gotta say, was a bit disappointed with that ending, [pc.name]. Imagine out of billions of sperm, and ending up with a kid like you who can’t even cover a bitch in cum.”</i> She snorts and laughs. <i>“Just kidding, but seriously, get some fuckin’ semen’s friend or something.");
		else if(cummies < 15000) output("Not a bad ending, [pc.name]! Fucking native bitches like you mean it and showing ‘em what you’ve got! I can respect that. God, that was hot. I was throbbing the whole time. Can’t wait to get back and watch it.");
		else output("You cum as good as me. Maybe a little better. Nothing better than fucking a slut’s face and nuking her in jizz, right? Right?");
		output("”</i>");

		output("\n\nYou elbow her in the ribs and she smacks you on the [pc.ass]. <i>“Okay, well, I’ve gotta get going. Glad I saw that. Hey, just a reminder, be fucking careful. This planet’s right out of every horrible techno-fetish movie ever made. These zaika or whatever ain’t right in the head, but I guess living in abject poverty does that. Casting a stone from a glass house, myself. Or rather, a house that moves through the vacuum of outer space to ferry me across the stars to fuck bitches in every star system. Hah.”</i> She waves and hops off. <i>“Just watch out around here, okay?”</i>");
		output("\n\nHer too!");
	}
	// Else
	else
	{
		output("\n\nNobody follows you, thankfully. What the Gyre will do to that milk thief you’re not entirely sure, and you probably don’t want to find out. Given the nature of her augs, if she’s not careful she’ll be picked apart by the vultures. Whatever happens, you got what you wanted out of that ordeal.");
	}
	// merge
	//[Next] \\ Back to game
	// sceneTag: processTime
	// sceneTag: PC cums
	processTime(7);
	enemy.applyCumSoaked()
	if(hasBackTentaclesOrCocktail()) enemy.loadInCunt(pc,0);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//[+Submit to Milking+]
// This option should be available to a PC with Breasts who may or may not be lactating. In keeping with the attitude alignments of other Zaika in the Gyre, an offer should be made. If the PC submits, she will tail-cuff them, molest, domme, make treated gals moo, etc.
// Submitting too many times to milk thieves should lead to getting forcibly TF'd: bigger nipples, boobs, puffy nipple flag added, generally looking more like a dairy slave.
// PC should be temporarily marked somehow so that other thieves can pick them out; make them known. Maybe using a patch like in Wsan's milk bar, which could mean auto submissions and Bad Ending. Getting added to a milk bar and making it the newest hotness.
// reminder that I use {titsSmall, titsMed, and titsBig} to differentiate the thieves from controlled to horny to depraved.

	// Add the option [Get Milked] next to the fight option. May need some extra text. Only shows up if the PC is actively lactating!

//[Get Milked]
	// Tooltip: {bimbo: Getting milked and feeling good? Awyis! Why can't everyone offer you such a good time?/ cowgirl: She's a bit rude but when's the last time you got a proper milking? Why not see how good a zaika can make it?/ else: Getting away from an augged-up alien would be hard. Why not see how good milking feels? At least you won't have to fight, just let your body do the work.}
	// Sets you up in an alley to be milked. Many submissions put a pleasure patch on the player? Make them more agreeable to milking?
	// Forced TFs. Nipples puff up, greater lactation, regeneration. Drugs for bigger boobs. Lots of titty worship. Based on horniness level, the Zaika will either make you suck her tail (titsSmall) or (titsMedium) titfuck you while she does the work (and, titsBig, the mouth as well! Lewd!)

//Fen notes:
	//Requires breasts of B-cup+ - enough to be "really heavy" for bimbos.
	//Requires able to be milked right now.
public function voluntaryMilkingByWilliamSan():void
{
	clearOutput();
	showMilkThief(true);
	author("William");

	// pc Bimbo
	if(pc.isBimbo())
	{
		//submittedToMilkTimes>4:
		if(milkThiefVolunteerMilkings() >= 3) output("Finally! You’ve been needing this for a while, and you’re not about to turn down a milk lover’s hospitality!");
		else output("Now that you’ve got someone else bringing it to your attention, you’ve gotta admit, your [pc.breasts] are really heavy! At this point you don’t care (or remember, T-B-H) that she’s being rude and huffy, only that she’s happily willing to take care of a super serious problem for you!");
		output(" <i>“Sure!”</i> you chirp, grabbing your tits and aiming the [pc.nipples] to your pink ambusher - gosh, it’s so cute that she’s the color of fun! <i>“I’ve got loooots of [pc.milkNoun] if you, like, wanna milk me! I’m really horny now that’cha mention it!”</i> You guess you’re a little too dumbly excited at letting some alien get at your titties, because you squeeze too hard on the [pc.nippleColor] nubs and");
		if(pc.isChestExposed()) output(" fire off " + (pc.totalNipples() > 2 ? "a salvo of":"two") + " [pc.milkGem] torrents that splatter against the pavement, much to her chagrin");
		else output(" wetten the front of your [pc.chestCovers] with dark, [pc.milkVisc] splotches, much to her chagrin");
		output(".");

		output("\n\n");
		if(titsSmall()) output("<i>“T-That’s great!”</i> she stammers. <i>“But please do not waste any!”</i> she cries, hurrying over to keep you from doing that anymore. <i>“Come with me, my dear milky alien. Let’s get you nice and drained, okay?”</i>");
		else if(titsMed()) output("<i>“W-Well that’s really nice and all but you’re wasting it! Don’t do that!”</i> she stamps her foot. <i>“Come on, before anyone else notices, okay?”</i>");
		else output("<i>“Nooo! Don’t waste any of thaaat!”</i> she whines, staggering over to stop you. <i>“Look, let’s just duck into there - see? And <b>then</b> we’ll touch your big milkies, okay?”</i>");
		output("\n\n<i>“Kaaaay!”</i> you beam.");
	}
	// pc Cowgirl
	else if(pc.isTreated() || pc.bovineScore() >= 4)
	{
		//submittedToMilkTimes>4
		if(milkThiefVolunteerMilkings() >= 3) output("Part of you realizes the inherent danger of acquiescing to a stranger’s demands like this... but it’ll feel good. These girls care about cows like you. They’ve never steered you wrong: each time in her hands has been relaxing and fulfilling.");
		else output("You’re not ignorant to the dangers of hefting milk around on Dhaal, but... you’re also not ignorant to the pleasures of a good milking. Besides, if it gets this glasses-wearing nerd out of your way without a fight, you’ll be glad to relieve some of this fluid burden to continue on unmolested.");
		output(" <i>“Alright,”</i> you start, [pc.fingers] swirling around your [pc.nipples], setting your jiggly assets to churning. Boob-based bliss bubbles up in your head right away, all that sloshing [pc.milk] inside fit to burst out. [pc.NippleColor] titflesh engorges, hardening ");
		if(pc.isChestExposed()) output("into outlined peaks against your [pc.chestCovers].");
		else output("into captivating pebbles that capture the zaika’s attention.");
		output("\n\n");
		if(titsSmall()) output("<i>“Oh, that’s a good cow,”</i> she says with trace condescension. Relaxing, the augged girl trundles forward, glowing eyes atwinkle. <i>“Come on, let’s get you out of sight. If I try milking you right here, everyone will see! And then we’ll be in big trouble.”</i>");
		else if(titsMed()) output("<i>“That’s what I like to hear, cow[pc.boyGirl]!”</i> the lilac bandit squawks, leaping into your " + (silly ? "DMs":"personal space") + " in one big augmented bound. <i>“Now let’s get you off the street, milk-tank. Cows have lots of fun getting milked, but not when they’re disturbed!”</i>");
		else output("<i>“Mmyesss, obedient cooowwws!”</i> The neurotic and sexually pent-up creature shimmies about on the spot - you roll your eyes. When they reset, you find that she’s got her head buried in your cleavage. <i>“C’mon milky cow, let’s go empty these big soft milkies...”</i>");
	}
	// pc Else
	else
	{
		if(milkThiefVolunteerMilkings() >= 3) output("You’ve given yourself up to these masterful milkers enough times to realize that provoking a fight would be a foolish idea. The scales have fallen from your eyes: they care about milk, and they care deeply about the [pc.boyGirl]s who give it to them. Spending an hour or two cumming your tits and brains out is worth it - every time.");
		else output("A brawl on Dhaal’s slummy streets is commonplace, but you’re not willing to pick a fight with an alien on her home turf. Least of all with the Gyre’s opportunistic hellions streaming to and fro in your vicinity. As you touch your [pc.breasts], you feel warm in the chest. There’s plenty of [pc.milk] in there to satisfy her. Besides, you’ll likely have a big cum while doing it.");
		if(pc.isNice()) output("\n\n<i>“Alright,”</i> you raise your [pc.hands] and the proverbial white flag. <i>“If you want to milk me, go ahead.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“You got me,”</i> you shrug and sigh. <i>“I’ve got milk - and you can have it. Provided we don’t have to come to blows.”</i>");
		else output("\n\n<i>“If you try anything, it’s your head,”</i> you grunt, opening your palms. <i>“Milk me, then.”</i>");
		output("\n\nTaken aback by your submission, the zaika girl smiles and leaps forward, mere inches from colliding with your [pc.face]. ");
		if(titsSmall()) output("<i>“I’m glad to hear it!”</i> she says. Her big smile is only moderately sinister. <i>“Now, come with me, Rusher. If you don’t want anything bad to happen that is. That isn’t a threat, by the way - look around us. Thieves, one and all! They don’t deserve your milk!”</i>");
		else if(titsMed()) output("<i>“You’ve made the right choice, alien!”</i> she chimes, rubbing the densely-packed weight of her own bosom, moaning between big vocabulary. <i>“I’ll be sure to ahh... drain you very, very well! And the, mm, expeeerience will be delightful, I’ll make this absolutely pleasurable for you!”</i>");
		else output("<i>“Awesome! That’s greaaaat!”</i> she giggles, biting the peak of her lower lip and giving you the delirious ‘eye’ over the rim of her sultry glasses. <i>“Once you’ve gotten milked by a zaika, you’ll <b>beg</b> us to keep doing it. Because it feels sooo good, and we handle our cows with care. I’ll make one out of you, and then you’ll see - this isn’t so bad!”</i>");
		if(milkThiefVolunteerMilkings() >= 3) output("\n\nYou nod affably.");
		else output("\n\n<i>If she tries anything...</i> you think.");
	}
	// merge
	output("\n\nOnly a few eyes catch you drifting off into an empty alley. Standing between you and freedom, the zaika thief idly taps a thigh with the barrel of her gun, admiring your [pc.fullChest]. Regardless of this situation, you can’t detect an ounce of malice or ill intent in the way she regards your bosom. The girl’s got the face of an eager student excited to study her favorite subject in close detail.");

	// pc Chest Not Exposed
	if(!pc.isChestExposed())
	{
		if(titsSmall() || titsMed()) output("\n\n<i>“Alright, let’s see ‘em!”</i> she chirps; in but a moment you have your [pc.breastsNoun] free from confinement and swaying before her. One of the thief’s fingers reaches gently for a [pc.nipple], prodding it as if flipping a switch. <i>“Niice,”</i> she grins. The incessant stroking picks up until a droplet of [pc.milkNoun] forms and wobbles atop the nail. <i>“Mmmmmmilllk!”</i> she hums. <i>“Life isn’t so bad, not when succulent aliens bring us this kind of treat!”</i>");
		else output("\n\nBefore you can bring your bust to bear, the big-tiddied thief pushes you against the wall and takes over. Pleasure flutters through you as her " + (pc.biggestTitSize() < 10 ? "larger ":"") + "chest smushes into yours. Within seconds she’s got your [pc.breastsNoun] bouncing in her hands, letting out [pc.milkVisc] trickles of [pc.milkNoun]. <i>“Yeeessss... you’re a milky one, there’s no denying it! I bet you can’t wait for me to empty you!”</i>");
	}
	// pc Chest Exposed
	else
	{
		output("\n\n<i>“");
		if(titsSmall()) output("Ahhh it’s about time!");
		else if(titsMed()) output("Finally!");
		else output("C’mere; I can’t wait!");
		output(" These tits of yours wobbling on every step, I can hear all that milk <b>ssssloshing</b> inside when your weight shifts!! Coy, teasing Rusher-[pc.boyGirl]!”</i>");
		output("\n\nPushed against the wall, though without harm, you’re unable to stop the breast-fetishist from having her way with your [pc.boobs]. The thief’s breath washes hotly over your [pc.nipplesNoun], thumbs and forefingers closing roughly around the [pc.nippleColor] corks of your tanks and plucking rapid-fire. Meanwhile, a string of spit-soaked kisses are planted on the top of your rack. Having her bust smushing into yours forces a");
		if(pc.isTaur()) output("whinny");
		else output("whimper");
		output(" of pleasure to burst from your lips, along with two [pc.milkColor] torrents of knuckle-coating [pc.milkNoun]. <i>“Myesss, milk, miiilk...!”</i> She goes to lick some up, but yanks back, shaking her head like a wet cat. <i>“First, I milk you. Then I can skim off the top!");
		if(titsSmall()) output(" You’ll love this, I promise!");
		else if(titsMed()) output(" You won’t regret this, alien!");
		else output(" Don’t forget to moo, got it?! That’s important!");
		output("”</i>");
	}
	// merge
	output("\n\nBrought to the ground, time is stretched by pleasant gropes. The zaika kisses your [pc.nipplesNoun] too many times to count, achieving an instant contact high from the [pc.milkFlavor] residue. ");
	if(pc.isBimbo()) output("You cry out in encouragement, hot, damp wetness subsuming you above and below.");
	//cowgirl:
	else if(pc.isTreated() || pc.bovineScore() >= 4) output("She’s determined to coax a moo out of you, but you refuse to give up that easy. No matter how dreamy she gets over your tits, you’re n-not that... easy!");
	else output("Breasts meekly out-thrust, you do your best not to make too much noise. Her giddy, relentless molestations make you twitch and gasp as your body weeps liquid excitement.");
	output(" Your muscles slacken and tighten in quickening cycles, and you heave against the wall, just a set of boobs glad for someone else to take charge.");

	// pc Nipples Inverted
	if(pc.hasInvertedNipples())
	{
		output("\n\n<i>“Oooh, you’ve got the shy nipples, hmm?”</i> the zaika giggles musically. <i>“Let me introduce myself. I want to make a good first impression...”</i> Hot, strangely-scented exhalations pass over your areolae, making it next to impossible to think. Fingers shift tentatively around the [pc.nippleColor] hidey-holes concealing your [pc.nipplesNoun]. The smallest of her digits wiggles its way inside, touching on firm flesh, while the rest massage the surrounding squish back. <i>“Heey little titty! Come on out!”</i> Whatever reluctance those [pc.milkNoun]-taps had is an afterthought when they spring forth, attracting both the neon light and that of her brightly-shining eyes. <i>“Oooohhhhh, so pretty!”</i>");
	}
	// pc Dicknipples
	else if(pc.hasDickNipples()) 
	{
		output("\n\n<i>“W-Woah...”</i> the thief, gawks, lovely ministrations slowing to hesitant crawls across maternal flesh. <i>“Why are your tits expanding into tails?”</i> A nervous hand brushes against the tip of your [pc.dickNipple] and her face displays a bristling shock at the subsequent stabbing <b>throb</b> of your obscenely-modded feature. <i>“Hmmm... well, I know you’ve got something in there!”</i> she laughs, twisting the neck until a mind-altering boob-phallus-gasm springs a leak of [pc.milkNoun] that she quickly samples. <i>“Ooh, well, I think there are plenty of girls who’ll like this! I said I’d milk you, and I meant it!”</i>");
	}
	// pc Fuckable Nipples (+Lipple Check)
	else if(pc.hasFuckableNipples())
	{
		output("\n\n[pc.NippleColor] wetness parts like fleshy velvet around the augged bandit’s questing fingers. She slips " + (!pc.hasLipples() ? "inside the sensitive cavities":"past the lip-shaped openings") + ", discovering the exotic secrets of your unnatural chest. Her unexpected entrance provoked a long, lusty groan, but it was the abrupt exit that hammered your forebrain. <i>“W-Woah! Nipple-tails!? So wait... there’s uhh, there’s milk in here, right?" + (pc.hasLipples() ? " In these uhhh, mouth things?":"") + " That leakage earlier wasn’t some kind of alien trick was it?”</i> Not the least bit confused, she dives back into your chest-mounted pleasure-passages, understandably concerned that you might have been dishonest earlier. Sure enough, a heavy squirt of [pc.milk] warms her paws and she pulls free from the suckly, squelchy embrace. <i>“Woow, there’s a loooot of potential in that kind of design! We’ve got so much to learn about your kind!”</i>");
	}
	// pc Nipples Normal
	else
	{
		output("\n\nThe massage wakes your [pc.nipples], and the round [pc.nippleColor] buds tighten to the lithe creature’s caresses. It’s little surprise that they’re " + (pc.totalNipples() == 2 ? "both":"all") + " throbbing and pulsing, every sumptuous nerve tender from tit-centric arousal. Silky pink fingers coax out moans and whimpers, drawing [pc.milkNoun] up the well. Before you can catch your breath, your mammaries are set to a heavy jiggle that knocks out whatever wind you had left inside. She lets your chest sway there, left-right-left-right, a bit of an up and down wobble, but that’s not what’s getting you: it’s the molten-hot friction glowing at the tips of your " + (pc.isBimbo() ? "fun-bags":"milk-jugs") + ", physical and liquid stimulation swirling without and within respectively.");
		output("\n\nFuck, she’s good at that...");
	}
	// merge
	// pc Breast Rating <3
	if(pc.biggestTitSize() < 3)
	{
		output("\n\nIn spite of how good it feels to have a true boob lover exploring your body with gentleness and restraint, you can’t help but feel that something’s lacking. Having a sexy girl feeling you up should be cause for celebration, yet the pleasure of it is noticeably subdued. Too small for much more than weak ripples to pass through them, your bust, while exquisitely soft, must disappoint her.");
		output("\n\n<i>“Aww, what’s wrong?”</i> she queries gently - then it clicks. Her experience in groping across the many cup sizes from outer space gives her an inkling. <i>“Oooooh - feeling a little down? Wishing you had some more? Weeeelll... to be honest, I do too!" + ((pc.isTreated() || pc.bovineScore() >= 4) ? " Cows are supposed to have big, smothering milkers! Still...":" But it’s fine.") + "”</i> The fluid-swollen shapes of your mammaries clap together; you squeak. <i>“You’ve got plenty of sensitivity, and that’s what makes Rushers so hot and attractive! Big boobs, little titties, whatever! They’ve all got milk, so they’re all good!”</i>");
	}
	// pc Breast Rating <10
	else if(pc.biggestTitSize() < 10)
	{
		output("\n\nThe milk-seeking thief grabs your [pc.breasts] and lays into them more forcefully than before, licking around your collarbone, her head of hair tickling your [pc.skinFurScales]. The elf-eared cyber-fae cocks her head to the side and kisses you on the shoulder, trailing down to the ampleness of your cleavage, motorboating your shapely chest with pants of wet, drooling desire. Brief and silly though it might have been, you wouldn’t mind a repeat.");
		output("\n\n<i>“These are my favorite size!”</i> The tone in her voice suggests she’d be jumping for joy were you not sitting down. <i>“I loooove boobs that I can hold onto with my arms. They’re good enough to smother and dive into without drowning me!”</i> Her lips, moist like fresh strawberries, part into a delighted ‘o’, poised to clamp down on a nipple and give a mighty suck. The excruciatingly pleasant way she handles your breasts means she can see the bosomy pleasure connecting to your brain. Those tweaks and clasps make your eyes move further back every time.");
	}
	// pc Breast Rating <18
	else if(pc.biggestTitSize() < 18)
	{
		output("\n\nFaced with a titanic amount of boobflesh, the obsessive zaika does the only logical thing: dives headfirst into your high-quality cleavage. Everything above her slender shoulders disappears into your superlative chest, fully embosomed in your [pc.breasts]. Hyperventilations tickle your nervous system with pangs of pure pleasure from the inside, then her tongue slithers out, sliding over veins and heavily-swollen lactic ducts. Her hands busy themselves with the deep softness of your heavenly bust from the outside, squeezing and rubbing and <b>imprinting</b> copious [pc.raceShort] plumpness onto her brain. It’s impossible not to laugh from the reflexive twitches of her elfin ears tickling your [pc.nipples].");
		output("\n\nComing up for air with a triumphant gasp, the lilac woman shivers languidly, as though she were idly hopping on a trampoline. <i>“You have the BEST boobs ever!! Now, I like ‘em just a bit smaller, but ooohhh this is SUCH a TREAT!”</i> Keeping her squeals down lest she invite an audience, or worse, she rests her chin on the shelf of your enlarged rack, a wistful smile on her face. <i>“I’m so happy you’re letting me milk you! I’ll take all this burden off you and maybe find you again!”</i> She gives you a slow massage to make up for the selfishness, reverently licking the [pc.skinFurScalesColor] topsides of your gorgeously-thick tits. Even her tongue depresses halfway into the mammarian sea.");
	}
	// pc Breast Rating Else
	else
	{
		output("\n\nFrom the way the zaika slowly loses herself to frustration and swooning madness, it’d be accurate to say there’s simply too much boob for one girl to control. Hand-smothering breastflesh swaddles the girl’s small but aug-strong limbs up to the elbows - she can heft them just fine, but the filled mass <b>spills</b> like gelatin around her limbs. Eminent plumpness seizes her and she twists and turns under the shuddering mountains of maternity. Pulling back, she changes tactics, letting the big, awkward blimps rest on the ground" + (!pc.isTaur() ? " and hide your [pc.legOrLegs] under immense bosomy weight":", creamy prominence spreading out in the gap between bodies") + ".");
		output("\n\nEven when settled, the pre-existing, wanton jiggling undulates around your throbbing peaks. Tits dominate your torso and obscure most of your body under all-natural heft. Their weight is difficult enough, but carrying around gallons of [pc.milkNoun] has made them larger than they ought to be. Geez, you really <b>do</b> need milked!");
		output("\n\n<i>“These are too big! They’re almost unusable, like they should only be set up as displayed trophies! Did you think you’d come here and make big money being the biggest fattest cow ever!? How would anyone just let you walk by?”</i> Seeing her pretty lips formed into a huffy pout is worth the burden of cow-caliber udders like these. <i>“I guess all you have to do is swing your shoulders around and you’ll clear the streets! I better be careful milking these, or my tank will break!”</i> Speaking of tanks, she’s back to desperately trying to heft and control yours, but, again, there’s too much [pc.raceShort] for one zaika to handle! <i>“Hmmf, these are so unwieldy! You need to be mounted in a wall!”</i> Something clicks in her head, and she sighs mournfully. <i>“Ahhh I’m sorry for my rudeness but... mmmm...”</i> Gentle rubs pick back up again, startlingly wonderful in their motions. <i>“I loooove Rushers and their boobies, and yours are just sooooo big they make my brain stop working...”</i>");
		output("\n\nWobbling tits do have that effect on people.");
	}
	// merge
	output("\n\n<i>“Before I start, I really need a more uhh <b>substantial</b> taste. I just <b>have</b> to know... even if it’s gonna make me dumb and dopey! For science! And uhh, you know, stuff!”</i> As the bespectacled beauty closes in on a nipple like a cat craving cream, you think to yourself there’s no motive behind it other than that she <i>really</i> wants to suckle from your teat.");
	// pc Lactic Cum && dicknipples
	if(pc.milkType == GLOBAL.FLUID_TYPE_CUM && pc.hasDickNipples())
	{
		output("\n\nGrabbing hold of and giving your nipple-prick a solid jerk, the girl swallows your ‘tail’ between two wet cheeks that suck down on its throbbing skin. Immediately, a spurt from the inner reservoir launches past her smooth, luscious mouth and into her throat. Bending sinuously on the reverse, her lips pop free of the teased organ, smacking together judgmentally. <i>“Hmm - it tastes like cum! Not much milkiness to it at all, buuuut I guess that’s fine! Hydras buy this stuff all the time!”</i>");
	}
	// pc Milk (Chocolate)
	else if(pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK)
	{
		output("\n\nWhile your elfin milker lets out a huffy groan, lung-induced suction slurps the dark cream from your tit, her palate getting a shot of pure decadence in the form of chocolate milk. The circuits against her synthetic corneas flash, like everything behind them closed down spontaneously. Swallowing your treat, she reels back with the dumbest smile ever. <i>“Eye’m... wow... that’sh... grmmmm... woooow... that’s so THICK!”</i> She smacks the side of her head, pulling on an ear. <i>“Why’sh it so good? That’s... I’ve never had that flavor before! Oh my yes, you are DEFINITELY going to get milked of everything!”</i>");
	}
	// pc Milk (Strawberry)
	else if(pc.milkType == GLOBAL.FLUID_TYPE_STRAWBERRY_MILK)
	{
		output("\n\nClosing around her chosen nipple, the zaika’s lips perch on your milk-squirting nub and vigorously partake. A deep lungful causes a sort of rupture that sprinkles her entire mouth in sweet, rich decadence. The trouble she has concentrating on the now isn’t just from imbibing narcotic alien lactation - this is her first taste of strawberry milk. <i>“W-Whaaaaat is that stuff!? I’ve... that flavor isn’t natural but it’shhhh incredible! Mmmyes, yesyesyes, I get to bring back super valuable milk! Awright, no more waiting - time to milk you reaaaally gud!”</i>");
	}
	// pc Milk (Vanae; Maiden and Huntress - how come there’s two, they’re not different)
	//Because writers, Will. Because writers. -Fen
	else if(InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK))
	{
		output("\n\nYou’re in no position to warn her of the aphrodisiac qualities lacing your special brand of lactation. Capturing a few errant trickles of [pc.milkColor] goodness, she suckles hard from your mammary peak and learns first-hand that she shouldn’t go around filling her gob with anything that looks tasty. Not only do her augged up eyes simulate a dizzied crossing effect, but her cheeks bloom a beautiful sangria, quivering around an intoxicating rush. Her tongue hangs from her mouth when she recoils. <i>“This stuff makes me!! Urgh... it’sh not jusht milk but... there’s something - a-ha! Alien stims their own milks? Err, you Rushers are making your own milk stims!? Of course! We’re gonna learn all about thish, just... after I milk you!”</i>");
	}
	// pc Milk (Leithan)
	else if(pc.milkType == GLOBAL.FLUID_TYPE_LEITHAN_MILK)
	{
		output("\n\nLeithan breastmilk is known in the Core as being alcoholic to non-leithans. You’re not in any rush to warn her of its particular qualities because a mischievous part of you still lurks under all the lust, eager to see the tit-sucking zaika’s reaction. Drunken intoxication strikes her like a meteor - her eyes roll in multiple directions, displaying microscopic circuit networks flashing on the artificial cornea. But then you feel her ragdoll, turning into a boneless pink heap of gelatin. With a surge of life-or-death adrenaline she whips back and wipes her mouth, spitting what she didn’t swallow out. <i>“T-The fuccccccccckkk! That stuff’s WAY TOO STRONG!!”</i> She screams and smacks herself in the head. <i>“OK, WELL, I know I’m not gonna mesh with YOUR milk! This is definitely a label that’ll have girls knocked the hell out when they try it! Gotta handle your milking with special care, hazard titties!”</i>");
	}
	// pc Lactic Honey
	else if(pc.milkType == GLOBAL.FLUID_TYPE_HONEY)
	{
		output("\n\nShe can already keenly discern the unique nature of your lactation - syrupy, molasses-thick honey, sticky treacles of the stuff sliding down the edges of your [pc.breastsNoun]. Full of wonder, she tenderly samples the alien bounty, rolling her tongue around the nipple before swallowing a globful. Her eyes widen in shock, and she goes at it again, and again before eventually parting. <i>“That’sh... not strong! It’s... got some kind of milk quality to it, gets me all light in the head, but that <b>taste,</b> oof!”</i> One more suck, just for the sake of it. <i>“Wow, this stuff is gonna be hard to milk, but don’t worry - I specialize in unique cases like this!”</i>");
	}
	// pc Lactic Sugar Glaze
	else if(pc.milkType == GLOBAL.FLUID_TYPE_SUGAR)
	{
		output("\n\nSeeing her freckles light up from a taste of your ultra-sweet sugar-milk is almost blinding. Actually, they probably shouldn’t do that, but y’never know what kind of augmentations these girls might be loaded with. That aside, she’s already a mindlessly slurping mess, visage wrinkled down around the source of your exceptional treat. <i>“W-Wow that’s... sharp and chilly in a way!”</i> Her lips smack a dozen times, and she can’t quite seem to lick them clean of whatever abnormality is bothering her.");
	}
	// pc Lactic Blueberry Yogurt
	else if(pc.milkType == GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT)
	{
		output("\n\nNobody could miss the bizarre amalgam of goopy fluid emerging from your [pc.nipplesNoun]. Not quite milk but not quite food, the blueberry-scented substance throws her for a loop when she guzzles it down, quaffing the lactic yogurt in tit-pleasing gulps. It doesn’t have much of a narcotic hit to it, apparently, because she stays there slurping it up for longer than you’d have thought. <i>“You aliens...!”</i> she fondly grins, showing off every tooth in her maw. <i>“...Always full of wonders and new experiences. Where would we even begin to emulate this flavor? I feel like I should take you with me before anyone else gets their sticky hands on your boobies! It has the flavor of stimmed milk without any of the drawbacks, and less of a mental hit... mmm... I won’t waste a single drop!”</i>");
	}
	// pc Lactic Nectar (Only thing Gold Antskanks are good for!)
	else if(pc.milkType == GLOBAL.FLUID_TYPE_NECTAR)
	{
		output("\n\nAs your boob-lover dreamily guzzles from your nectar-rich breast, she enters a dreamy, moany, whimpery state that is, honestly, kind of cute. Both of her hands rise to knead your chest, her whole body swooning, changing colors from a head-to-curling-toe blush. The revitalizing nectar churning inside must be to her liking! <i>“I can’t imagine... how...”</i> She laps at your [pc.nipples] like a thirsty animal. <i>“This can’t be right it’s... got almost intoxicating hit to it but it’s... no, it’s like a stim! It gives me energy, makes me feel better! I feel <b>stronger</b> just drinking it. No milk on this planet does that!”</i> A big wide grin blooms across her fetching features. <i>“I’m going to get the highest price for your ‘milk’ - no no, not milk. This is better than milk. Like that thing I think I heard about in a holo once... ambro-sheuh!”</i>");
	}
	// pc Milksap
	else if(pc.milkType == GLOBAL.FLUID_TYPE_MILKSAP)
	{
		output("\n\nRadiating curiosity, the glow in her eyes changes hues, dimming the more of your thin, creamy favor she slurps out. She pulls herself away very reluctantly, drifting in a clearly-intoxicated stupor. <i>“This ish... uhmm...”</i> Wiping the residue from her chin with her knuckles, the titty-loving zaika gathers a few droplets on a fingertip for closer inspection. <i>“Whyyy does this taste soooo funny? It’s like uhhh if...”</i> There’s a series of unintelligible grumblings there. <i>“Ugh!”</i> A shake of the head and she brings her milker to bear. <i>“Thish goes down super easy and like uh it’s even stronger than usual milk! Eye’m gunna make everyone go dumb and silly with this, so gimme all you’ve got!”</i>");
	}
	// pc Milk (Regular)
	else
	{
		output("\n\nThe zaika delicately plants herself around a tit, sealing her mouth shut and, lungs heaving, sucking hard at your hidden bounty. A fat rope of white milk plasters her upper esophagus in rich, creamy nourishment. The circuits in her eyes... they don’t spark, but some sort of light show plays against the artificial cornea. You can only surmise that’s what it’s like for robot-eyes to go cross. <i>“Yes - yesh!”</i> she slurs. <i>“That’sh the... the good stuff. Yes - huufff! Let’s get... let’s get you milked!”</i>");
	}
	// merge
	output("\n\nFiddling with the back end of her pistol, the plastic-like dome barrel end of it resizes to fit the front of your cup size perfectly. Idle suction pulls at you, light but strong enough to make your eyes roll back for a moment. A mechanical click seals the device to your jug. It’s so comfortably attached that she no longer needs to hold it, but the trigger is yet to be pressed. The zaika closes in on your [pc.lipsChaste], her finger tightening on it. <i>“");
	if(titsSmall()) output("Thank you very much for this, alien...");
	else if(titsMed()) output("Just let it happen...");
	else output("I’m gonna make this very good for you...");
	output("”</i>");
	output("\n\nHer lips press against yours, and something clicks.");

	processTime(25);
	pc.milked(1);
	clearMenu();
	addButton(0,"Next",voluntaryMilkingByWilliamSan2);
}

// sceneTag: PC Lust maximizes
public function voluntaryMilkingByWilliamSan2():void
{
	clearOutput();
	showMilkThief(true);
	author("William");
	output("Your consciousness condenses down to a few tight, wet passages. [pc.Milk] channels through the ducts in your breasts in the direction of a pulsing vacuum, glittering [pc.milkGem] wealth bursting from firmed flesh into the greedy hose’s tubing. The weapon fit to your tit is more powerful than some industrial breast pumps. Every [pc.milkColor] drop inside can be felt individually sliding and pooling, collecting into ropes of thickly-scented richness before being sucked out to feed the tank on her back.");
	output("\n\nThe machine is not gentle, but she is. Although the rough intensity of this process has blotted out most of Dhaal and your nervous system is a shorted mess of misfiring signals, the zaika girl is there to kiss you and massage your [pc.breasts] in that tender way of hers. It’s a creamy whirl of an experience that goes from somewhat painful to deliciously pleasing. With every tense in your torso, with every circle of her hands beneath your [pc.chestNoun], and between long seconds of therapeutic pashing, you start to feel that there’s something... <i>right</i> about this.");

	//Technically incorrect but done for style IMO -v. Don’t let some amateur forum typoslut tell you different.
	output("\n\nAbout riding an impossible chain of squirting boobgasms in the hands of someone interested in your pleasure and comfort.");

	output("\n\nLactic heaven. Your head is held against hers so that she can kiss your open, moaning mouth. Your [pc.eyes] have gone back somewhere, scant color visible under the lids. This ‘thief’ isn’t really a thief. Someone who makes you feel this good is surely incapable of harmful intent, and besides, you agreed. Maybe some people would resist, but that’s just because they’ve yet to figure out how good this actually feels. The brain is an adaptable thing, however. When the raw <b>ebbing</b> coalesces into perfect clarity, your thoughts are dominated by the sensations feeding into your [pc.fullChest], occupying the front and back halves of your mind.");

	output("\n\nDampness. Wetness. Slipperiness. You’re abuzz with the pure, peaceful feelings of soaked fingers and moist tongues stroking over your [pc.skinFurScales]. Happiness like this shouldn’t exist, least of all not in some dirty alleyway between dangerous streets, <i>but it does.</i> Each sense-engulfing touch is an illustration of how <i>right</i> the choice you made was. Having that custom-made boob-sucker dangling from your chest, siphoning away everything you’ve got... the realization, the knowledge, it all rams into you then and there.");
	if(pc.isHerm()) output(" Orgasm practically pounces up from your [pc.cocks] and [pc.pussies], faraway matters to the gushing of [pc.milkVisc] [pc.milkNoun].");
	else if(pc.hasVagina()) 
	{
		output(" [pc.GirlCum] ");
		if(!pc.isSquirter()) output("spits");
		else output(pc.girlCumQ() < 1000 ? "squirts":"sprays");
		output(" from your [pc.pussies] in a sequence desynchronized from the regular gush of [pc.milkVisc] [pc.milkNoun].");
	}
	else if(pc.hasCock()) output(" [pc.Cum] arcs from your [pc.cocks] in vibrant, forceful tune to the endless gush of [pc.milkVisc] [pc.milkNoun].");
	output(" A pair of fingers closes around " + (pc.totalBreasts() > 2 ? "a":"your") + " so-far-unused boob, getting it ready for its upcoming duty.");

	var growBoobs:Boolean = false;
	var growNipLength:Boolean = false;
	var growNipWidth:Boolean = false;
	var boostLactation:Boolean = (rand(2) == 0 || pc.milkMultiplier < 100);

	if(pc.breastRatingUnlocked(0,pc.biggestTitSize()+4))
	{
		//below D? 50%
		if(pc.smallestTitSize() < 4) growBoobs = (rand(2) == 0);
		//below J? 33%
		else if(pc.smallestTitSize() < 29) growBoobs = (rand(3) == 0);
		//Else 20%
		else growBoobs = (rand(5) == 0);
	}

	//Niplength:
	if(pc.nippleLengthRatioUnlocked(pc.nippleLengthRatio+0.25))
	{
		//Ratio up to < 2: 50%
		if(pc.nippleLengthRatio < 2) growNipLength = (rand(2) == 0);
		//Ratio up to < 3: 33%
		else if(pc.nippleLengthRatio < 2) growNipLength = (rand(3) == 0);
		//Ratio up to < 4: 20%
		else if(pc.nippleLengthRatio < 4) growNipLength = (rand(5) == 0);
		//else Ratio: 10%		
		else growNipLength = (rand(10) == 0);
	}

	//NipWidth
	if(pc.nippleWidthRatioUnlocked(pc.nippleWidthRatio+0.1))
	{
		//Gain: 0.25 if below 2, then 0.1 each.	
		if(pc.nippleWidthRatio < 2) growNipWidth = (rand(4) == 0);
		else growNipWidth = (rand(12) == 0);
	}

	// pc Nipples Getting Puffier/Bigger
	if(growNipWidth || growNipLength)
	{
		output("\n\nEverything in your head should have floated away, but an alarming development shocks you back to cognizance for a few seconds. Just because you can’t see what’s going on doesn’t mean you don’t have plenty of time to familiarize yourself with a change going on in your [pc.nippleNoun]. All this jiggling and jostling has brought you into contact with most of its inner lining, but you distinctly sense the newness of untouched ground. <b>Is your nipple puffing up inside of it?</b> It must be. There’s no other explanation. It could be getting smaller, but there’s no reason for that. Anyway, it’s <b>a lot</b> sexier to consider that your tits are gonna puff up.");
	}
	// merge
	output("\n\nYou nearly choke on something small and capsule-shaped sliding past your uvula and into your gut, a pair of fingers stroking the length of your neck. You’re pretty sure that’s a big cause for concern but the excruciatingly awesome <b>heat</b> that blooms in your chest nukes that anxiety. The wonderful release in your [pc.breasts] magnifies tenfold. You become instantly aware of a greater lactic load sloshing inside the cup of a tireless milk-sucker - you’re lactating even harder, splashing your overtaxed tap. Is that even possible? Whatever. You slip into an ecstatic ditch");
	if(pc.isBimbo() || (pc.isTreated() || pc.bovineScore() >= 4)) output(" with a happy loud ‘moo!’");
	output(", only aware of the skill and control that someone else has over your titties.");
	// pc Breasts Enlarging
	if(growBoobs)
	{
		output("\n\nHeaving, swelling weight carries your [pc.breastsNoun] further down to the nipple-sucker’s tugging whims. There’s no way your breasts are growing; it’s just a blissful illusion. Fingers squeeze tight around rapidly-burgeoning flesh you realize now you didn’t have before - yes! You <b>are</b> getting bigger! Sumptuous mammaries jiggle with each percussive heartbeat, rapidly ballooning in size; the softness is everywhere; new tissue connects and dilates to handle the steady flow of [pc.milk].");
	}
	// merge
	// pc Submitted >4 times
	if(milkThiefVolunteerMilkings() >= 3)
	{
		output("\n\nPuffing up. Getting bigger. Lactating harder - and more. Aren’t you just kidding yourself at this point? <i>You deserve to be milked like this every day of your life.</i> Boobgasms are better than regular... gasms. Whatever they’re called. They’re so shameful and mind-blowing!");
		output("\n\nIt’s a lot easier to lie back and get hooked up to a machine, have a dozen dirty, filthy fingers massaging out your [pc.milkGem] burden. It’s a win-win: you and they feel good, <b>and</b> you get the satisfaction of knowing you provide them nourishment and recreation. You’d fit right in here on Dhaal, you know it. Hooked into a nice wall or maybe even your own stall, a great, big-tittied reminder that relief is always on hand to those who search for it. The girl all over you would probably help with that.");
		output("\n\nYou sigh, entirely uncertain. It’d be a big decision. But every time you consider a life of having your boobs practically worshiped, a quartet of feathertips caress their way across your heart. It makes you pant and blush and just <i>so happy</i> that it stops feeling like a bad or dangerous idea and more like a natural calling. Milky [pc.boyGirl]s need to be on-hand for anyone and everyone.");
	}
	// merge
	output("\n\nBeing milked is to enjoy an uninterrupted stream of pleasure. That’s why it comes as a shock when the gun is pulled from your well-drained tit and set firmly on " + (pc.totalBreasts() > 2 ? "the next":"the other") + ".");
	if(pc.bRows() > 1) output(" She’s got a lot of [pc.raceShort] boob wobbling in front of her, and she’s gonna milk ‘em all!");
	output(" <i>“Haahhnn...”</i> you groan, the enjoyment restarting all over again, [pc.milk] splashing into a thoroughly soaked drainer-barrel. You don’t feel the least bit sore, not with her there soothing the light aches away, rubbing [pc.milkColor] webs into your areolae.");

	// thief Tits Small (oral)
	if(titsSmall()) output("\n\nSuddenly, the kiss breaks, but you’re not left alone for long. The zaika’s tenta-tail sweeps across your brow, spilling a thick layer of spunky slime across your [pc.face]. The bulb presses to your [pc.lips] and has little difficulty wiggling its way in with constant, firm pressure. It enters your throat with ease, bulging your windpipe around its mass before gently fucking the hole you once used for food. Sweet, cummy slaver pours down your chin or rolls into your belly: yet more warmth. You suck on it like it’s your favorite flavor of lollipop, the girl’s fat, muscular tail wearing you like its newest sock.");
	// thief Tits Medium (titfuck)
	else if(titsMed())
	{
		output("\n\nAs the zaika girl breaks the kiss, a fat, lush bulb drools a stream of viscous precum across your [pc.face]. Nestled between your [pc.breasts], the whole of her tail fucks your cleavage, screwing through with solid pumps and noisily rebounding off your flushed  cheeks. The heavy thickness of her spunk-packed bust pressures your bosom into squeezing tighter on the excited organ. There’s too much length of tail to be obscured in any size of tits, and on a lacquer of friction, it bounces your boobies around itself, feeding you small tastes of sweet spunky slime as it slides effortlessly into peaking bliss between your [pc.breastsNoun].");
	}
	// thief Tits Big (both)
	else
	{
		output("\n\nWhen the too-horny zaika breaks the kiss, something fat and smooth and muscly jams itself into your open gob. The sexual taste of her carnal fervor spills down your jaw and into your gut, and the desperate organ wastes no time in wearing you like a new sock. The jerky motions of it squirming through your uppermost passage are at odds with the squeezing at your middle; the tendril is nestled square against your chest, trapped in the pillowy softness of your milky titties. Lusty vocalizations fill your ears - hers, yours, one and the same. Wanton enjoyment pounds its way into your gullet, immediately unloading a few ounces of the many gallons weighing her mammoth chest down upon yours. Windpipe bulging around the cumming tail, you suck it for all you’re worth, no match for the combination of pleasures that have transformed you into a squirting dairy slave.");
	}
	// merge
	output("\n\nMusky odor fills your nostrils as the milking reaches a fever pitch. You lose track of what is what, and a gush of overflowing spunk");
	if(titsSmall() || titsBig()) output(" clogs your throat");
	else output(" paints your [pc.face] and [pc.breastsNoun] in steaming-hot loads of sperm");
	output(". The vine rubbing against your insides goes crazy, ");
	if(titsSmall() || titsBig()) output("driving its stickiness further into your welcoming depths");
	else output("showering you in oozing bliss");
	output(".");
	if(pc.hasGenitals()) 
	{
		output(" Timed perfectly with your squirtgasms, your crotch explodes in another grand fireworks display that your lover is happy to see to - that porny tail of hers plunges down and ");
		if(pc.hasCock()) output("swallows up " + (pc.hasCocks() ? "a":"your") + " dick and gorges itself on [pc.cum]");
		else if(pc.hasVagina()) output("smashes into " + (pc.hasVaginas() ? "one of your holes":"your pussy") + " without mercy, soon providing you with what you need most to keep churning out fresh spurts of milky goodness.");
	}
	output("\n\nShivering spasms contort you in the throes of full-body release; her gun unhooks for a new target. You float in and out of the waking world, unable to focus on any one angle of bliss. Awareness is a thing of the past.");
	if(pc.libido() >= 66 || pc.isBimbo() || (pc.isTreated() || pc.bovineScore() >= 4)) output(" Good cows like you don’t need it anyway.");
	output(" Everything dissolves into complete blackness and numbness. Sensations of movement wink out of existence.");

	processTime(60);
	//[Next]
	// sceneTag: PC Orgasms
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	// sceneTag: PC Titgasms (reduce milk :)
	pc.milked(100);
	// sceneTag: PC Nipples DO Get Fatter (Length and width Ratio +1/+2/+3?)
	// (Done Below -Fen)
	// sceneTag: PC Areolae can be Pumped (there’s a flag but it’s vestigial?? Plz check)
	// (Fen note: Nahhhhhhhh)
	// sceneTag: PC Breasts can get bigger.
	// (Fen note: Done below)
	// sceneTag: PC Lactation Mod can increase by +1 up to, i dunno, +5? +6?
	if(boostLactation) 
	{
		if(pc.milkMultiplier < 100) pc.boostLactation(15);
		else pc.boostLactation(8);
	}
	if(titsSmall() || titsBig()) pc.loadInMouth(enemy);
	if(titsMed()) pc.applyCumSoaked();
	pc.taint(2);
	clearMenu();
	addButton(0,"Next",voluntaryMilkingByWilliamSan3,[growBoobs,growNipLength,growNipWidth,boostLactation]);
}

// sceneTag: PC Lust maximizes
public function voluntaryMilkingByWilliamSan3(args:Array):void
{
	clearOutput();
	showMilkThief(true);
	author("William");

	var growBoobs:Boolean = args[0];
	var growNipLength:Boolean = args[1];
	var growNipWidth:Boolean = args[2];
	var boostLactation:Boolean = args[2];

	output("Your aching muscles flex and unclench, awakening from dormancy. As you stir, the city’s neverending neon twilight greets you. The Gyre growls all around you, a beast waiting to kill whoever it can just because it can.");
	output("\n\nBut not you. The zaika who took your milk has graciously made a little hiding spot out of all the items in this alleyway. You’re hemmed in by at least two dumpsters, one trash can, and a blanket that exudes the pungence of some foul industrial cleansing process. Set in front of your feet is a neat pile of all your things.");
	output("\n\nAfter extricating yourself from the makeshift fort, you check everything and determine it’s all in order... and that you’ve been");
	if(pc.hasPerk("Ever-Milk")) output(" drained to an excessive degree. The storage space to handle your infinity cream won’t ever be developed!");
	else output(" completely and utterly milked");
	output(". There’s a bit of chafing, but overall, you’re doing fine.");
	//nipplesGotFatter:
	if(growNipWidth || growNipLength) 
	{
		output(" Additionally, you can tell <b>your [pc.nipples] are now ");
		if(growNipWidth && growNipLength) output("larger");
		else if(growNipWidth) output("wider");
		else output("longer");
		output(".</b> They’re looking fatter and more engorged, and the swelling hasn’t reduced even in a non-aroused state. If you don’t have a good nursing bra, now’s a good time to get one... unless?");
		if(growNipWidth)
		{
			pc.nippleWidthRatio += 0.1;
		}
		if(growNipLength)
		{
			if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio += 0.25;
			else pc.nippleLengthRatio += 0.1;
		}
	}
	//Boob bigger
	if(growBoobs) 
	{
		var growAmt:int = rand(4)+1;
		for(var i:int = 0; i < pc.bRows(); i++)
		{
			pc.breastRows[i].breastRating(growAmt);
		}
		output("\n\nFrom the first step you take, your equilibrium screams in protest. Adjusting to newfound weight, you discover that whatever drugs the girl had cheeked you have <b>expanded your chesty assets into " + pc.breastCup(pc.biggestTitRow()) + " territory</b>. The smut-glazed mounds heave in a wider orbit, wonderfully sore from extra growth on top of a thorough draining. A cascade of prickling arousal pokes at you from behind their [pc.nippleColor] peaks. You... you almost can’t wait to do something with them now.");
	}
	//lactationModIncreased
	if(boostLactation) 
	{
		output("\n\nSomething wet makes you wince before you get back to your journeys. Fresh, warm [pc.milkNoun] at once soothes and glosses your sore nippleflesh. Yet more [pc.milkVisc] [pc.milkColor] bounty starts to leak. Maybe you weren’t as drained as you thought. Maybe it was her drugs...? Whatever the case, you might be one of the more productive ");
		if(pc.bovineScore() >= 4 || pc.isTreated()) output("cows");
		else output("milk-" + pc.mf("males","maids"));
		output(" out there now. Nothing’s ever certain when having pills forced down your throat! <b>You’re lactating even harder!</b>");
	}
	output("\n\nExiting out into Dhaal again, ");
	if(milkThiefVolunteerMilkings() >= 3) output("you honestly can’t wait for another lurking milk bandit to target you. Hopefully your tits will regenerate in time for the next girl to make use of them...");
	else output("you resolve to try and keep your head should you need to bribe your way past another augmented thief in the night.");
	
	//[Next] \\ Back to game
	// sceneTag: processTime
	processTime(35);
	IncrementFlag("MILKTHIEF_V_MILKED");
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function milkThiefVolunteerMilkings():Number
{
	if(flags["MILKTHIEF_V_MILKED"] == undefined) return 0;
	else return flags["MILKTHIEF_V_MILKED"];
}