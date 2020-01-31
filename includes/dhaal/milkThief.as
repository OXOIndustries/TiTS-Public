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

//Encounter Texts
public function encounterMilkThief():void
{
	author("Fenoxo");
	var tEnemy:ZaikaMilkThief = new ZaikaMilkThief();
	setEnemy(tEnemy);
	showMilkThief();
	//First time!
	if(flags["MET_MILK_THIEF"] == undefined)
	{
		flags["MET_MILK_THIEF"] = 1;
		output("No amount of alertness could prepare you for the sudden appearance of gun-toting zaika from the twilight sky. One moment, you’re minding your own business, the next, this strange woman stands up smoothly from her crotch, like she hopped a curb instead of plummeting hundreds of feet from a rooftop.");
		output("\n\n<i>“");
		if(enemy.biggestTitSize() <= 2) output("Hello there, Rusher. Don’t be alarmed, but I’m going to need you to give me all of your milk before I can let you go,”</i> says the flat-chested alien.");
		else if(enemy.biggestTitSize() <= 8) output("Mmm, don’t you look like a particularly tasty Rusher? I bet you’ll give me the loveliest milk, and make no mistake - you will be giving me all of your milk,”</i> says the chesty alien.");
		else output("Don’t run, Rusher. I’m not going to hurt you - quite the opposite.”</i> The leering alien licks her lips. <i>“I’m going to make you cum so hard that you won’t mind giving me your rich, creamy... mmmilk. Every, single, drop,”</i> she hungrily purrs.");
		output(" <i>“Don’t mistake my friendliness. <b>This is happening.</b> Make it easy on yourself, and I’ll be easy on you" + (enemy.biggestTitSize() > 8 ? ". So easy for you, baby":"") + ".”</i>");
		output("\n\nYour Codex chooses this moment to chirp, <i>“Hostile zaika detected! Care should be taken when traveling on Dhaal if lactating!”</i>\n\nPerfect timing, as always.");
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
	//9999 combat
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatMilkThief);
	CombatManager.lossScene(milkThiefLossRouter);
	CombatManager.displayLocation("MILK THIEF");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}
//[=Loss Scenes=]
public function milkThiefLossRouter():void
{
	if(pc.hasCock() && pc.biggestCockVolume() >= 1000) loseAndGetHyperDooooocked();
	else
	{
		output("(<b>Content coming soon! - like, Thursday-Friday soon!</b>)\n\n");
		CombatManager.genericLoss();
	}
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
			var tailfuckTT:String = "<i>“I can be convinced to let you go, but your tail’s gonna do the talking on that one.”</i>";
			if(pc.isBimbo()) tailfuckTT = "<i>“I heard all about your tails, elfy-ears! Lemme use it as a big cocksock, c’mon it’ll feel super good”</i>";
			else if(pc.isBro()) tailfuckTT = "<i>“Nice tail. How much me can fit in there?”</i>";
			addButton(1,"Fuck Her Tail",penisRouter,[fuckHerTailBuddddeh,80085,false,0],"Fuck Her Tail",tailfuckTT);
		}
		//Too big
		else addDisabledButton(1,"Fuck Her Tail","Fuck Her Tail","Zaika tails are capacitive organs, but you’re much too hyper to wear one out in your current state. <b>Get some dick-diminishing drugs and try later!</b>");
	}
	else addDisabledButton(1,"Fuck Her Tail","Fuck Her Tail","There’ll be no tail fucking this Dhaaling <b>without a penis!</b> Get you one.");

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
	output(" You’re going to show this milk thief what it means to fuck to fush a Rusher. You grind harder against her, making her butt bubble out to the sides as its squished against the wall. Let this be her introduction to the UGC.");
	output("\n\nThe coming orgasm will be her orientation.");
	output("\n\n<i>“N-n-no! It’s too good!”</i> the once-proud zaika says, but as she speaks, you can feel her tail thrusting on its own, perfectly in sync with your hand’s guidance. <i>“Sex with a Peer can’t even be this good! You xeno sluts are g-g-onna break us!”</i> Faster and faster, that rogue organ races. It bumps across your [pc.clits] and flosses through your [pc.vagina]. There’s no missing when it swells with oncoming orgasm.");
	output("\n\nDo you let her cum there" + (pc.hasCuntTail() ? ", in your tail":"") + ", or stuff it in her mouth?");
	processTime(15);
	pc.lust(45);
	//[Cum There] [Her Mouth][YourTail]
	clearMenu();
	addButton(0,"Cum There",cumAsZaikaIs,undefined,"Cum There","Let her cum with her tail between you. You'll probably get messy.");
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
public function titsMed():Boolean { return (enemy.breastRows[0].breastRating() == 2); }
public function titsBig():Boolean { return (enemy.breastRows[0].breastRating() == 2); }

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
		else output("It’s not your endurance that needs to be questioned here.");
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
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) || pc.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_BASED)) output(" Once your tendril-equipped penis is quaffed, her tail immediately ‘regrets’ that decision. Trapped in the thirsty, coiling folds of her oral-like interior, your venomous stingers lash the walls of velvet invitation and introduce her to a world of pleasure that can’t be experienced naturally on Dhaal.");
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
	if(titsSmall()) output("For as small as you are, that’s something else! You’re so hard and the throb is... is... Wow!");
	else if(titsMed()) output("Maybe that’s just the right size! It teases me like it’s gonna go so much further, but it’s only... there! Oomph!");
	else output("Look at how badly my tail is stretched! It’s never gonna close again! I’ll need to pay out the rump for plasticity mods! And y’know what else? I’m gonna love spending that money just as much as I’m gonna love you breaking me apart!");
	output("”</i>");
	output("\n\nGlad to hear it.");
	processTime(25);
	pc.lust(25);
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
	if(pc.hasCocks()) output(" harmlessly against the poon-balloon’s luscious exterior.");
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
		pc.lust(20);
		clearMenu();
		addButton(0,"Breastfeed",giveZaikaMilkThiefAZaikaSnacc,x,"Breastfeed","Let her have the big suck.");
		addButton(1,"Cum",noBoobySucksuck,x,"Cum","There's no time for breastfeeding when you need to cum this bad.");
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
	if(pc.isBimbo()) output("\n\n<i>“Theeere you go! Nn - tastes super nice doesn’t it?”</i> you ask, playfully pinching her ear. <i>“My [pc.milkNoun] is the best around! Get all you can sweetie, cuz I’m about... mm! To cum!");
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
		output("\n\nStanding on your own after a mating ritual like that seems impossible, but emerging from the limp, cum-flecked orifice{ bigDick: with the sound of a snapping rubber band}, you sputter out a few more ropes onto her body and go soft over a minute of panting convalescence. Once the fatigue on your shoulders eases up a tad, you stumble away from your opponent and get yourself back in order, wiping your [pc.cocksLight] clean with her tail covering before throwing it on her. It lands in her mouth. Further exploration awaits...\n\n");
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
	output("\n\nThe musical whines of a girl getting exactly what she needs resuscitate your mating imperatives like a defibrillator to the heart. After moulding the{ hyperCum: cumflated} zaika’s crotch-muff to your [pc.cockType " + x + "] shape you go at her, [pc.hips] slapping hard, frenetic rhythm into her pussy as deep and as lusciously as you can. It’s a gloopy, kinesthetic routine - you both groan and cry in harsh tones as you squirt into one another, She coaxes you onwards, legs wrapping" + (pc.isTaur() ? " around your flanks":" around your waist") + ", a broken in slut that’s had her satisfaction levels dialed into the red.");
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
	output("Timed perfectly with you, the zaika unleashes a great big sigh. Your insatiable ardor is now finally satisfied - for now. It'd be hilarious to see her try and go jumping around the planet now, raining the dregs of your DNA on everyone.");
	if(pc.inRut()) output(" Unfortunately, she curls up into a ball, breathing reduced to content quietness. Parts of her that once handled things like 'immediacy' or 'awareness' either shut down completely or restructure to cope with the most furious fuck of her life.");
	else if(breastfeeding) output(" Hopped up on boob-juice though, she won't be doing any jumping, let alone walking! She's babbling delirious on the ground with a wide, empty smile on her face" + (cummies > 8000 ? ", rubbing her stomach happily":", twisting her fingers in the collected mess around the used condom once called her tail") + ". Now <i>that's</i> diplomacy.");
	else output(" She just might. Despite the intensity of your sex, she's still quite aware of herself, turning her bliss-blasted eyes upwards. <i>“That was super fun.”</i> She gives a confident, if exhausted, grin. <i>“You're definitely a cut above all the other Rushers, no doubt! I bet you're gonna be leavin' other girls like me wherever you go from here.”</i>");
	if(pc.isBimbo())
	{
		output("\n\nAs a thank you, you" + (pc.isLactating() ? " squeeze some [pc.milkNoun] into her lips for the good time!":" dribble the last of your [pc.cumNoun] past her lips.") + " Maybe she'll come begging for more later?");
		if(pc.isLactating()) pc.milked(10);
	}
	else if(pc.isBro()) output("\n\nBefore leaving, you wipe your [pc.cocks] clean with her hair, using her cum-dump of a mouth to clean the [pc.cockHeads]. Good sluts deserve every drop.");
	else if(pc.isNice()) output("\n\nBefore returning to the journey, you place her tail coverings within arm's reach and shift a few objects in the environment to better hide her. Dhaal won't be as kind to the vulnerable.");
	else if(pc.isMischievous()) output("\n\nNot quite ready to step out, you bring your [pc.cocksLight] over to her face and jerk the last of your [pc.cumFlavor] loads onto her cheeks, brow, and past her panting lips. Her tongue darts to whip at the [pc.cockHeads], dripping with the stuff. Yeah, she liked that.");
	else output("\n\nOn your way out, after having wiped your [pc.cocksLight] off in her hair, you spot the ring and covering of her tail. Deciding she won't be needing either, you toss them into obscurity.");

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
		output(" (<b>+" + healing + " HP</b>)");
		pc.HP(healing);
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