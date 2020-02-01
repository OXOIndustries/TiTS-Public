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
public function encounterMilkThief():Boolean
{
	author("Fenoxo");
	var tEnemy:ZaikaMilkThief = new ZaikaMilkThief();
	setEnemy(tEnemy);
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
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatMilkThief);
	CombatManager.lossScene(milkThiefLossRouter);
	CombatManager.displayLocation("MILK THIEF");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
	return true;
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
	pc.lust(25);
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
		output(". There’s no telling where the most stimuli is coming from. You’re pulled to the reaming you’re getting and then back to the hardcore squirting of your bosom, loosing torrents of [pc.milkVisc] [pc.milkGem] fluid in breathtaking salvos.");
		output("\n\nRight now, every part of your body is being set off; you’re being tugged down two dangerous avenues of pleasure. Her custom milk-machine is relentless and tireless, a machine capable of making longer-lived New Texans into incapacitated husks. It’s so intense that you can’t focus on the pleasure you’re being forced to feel. It’s so powerful that your body refuses to act on autopilot. Is it because of her ero-gas? Is there something more to it?");
		output("\n\nToo fucked to care, you slip into uneven, oscillating, unseeing euphoria. Rather than try in vain to maintain any sort of cognizance you surrender to her thrusts, the spurts, the jolts and the shocks. Can anyone outside the alley hear you now?");
		if(pc.isTreated() || pc.bovineScore() >= 3) output(" Can they hear you mooing? Can they hear the cow[pc.boyGirl] being milked and loving every second of it?");
		else output(" Are you mooing? It’s absurd, but it’s possible.");
		output(" Each blast of steaming-hot lactation, guzzled up by the zaika’s pump and safely stored in her backpack, is worth a hundred orgasms. Endless [pc.milkFlavor] goodness flows, filling the bandit’s tanks full of mother nutrition. Rich, [pc.milkVisc] [pc.milkNoun], for her and her kind to get drunk and merry on, and for you to enjoy being robbed of.");
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
			if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output(" It's hard enough to walk now that your [pc.vaginaNoun " + y + "] remains <b>permanently somewhat pumped</b>.");
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
	CombatManager.genericVictory();
}