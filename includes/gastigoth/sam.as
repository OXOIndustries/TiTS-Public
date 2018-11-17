//Sam in the Galactic Prison
//Night Trap
//Rap Sheet
//Name: Samurenth “Sam” Tyraso
//Age: 24
//Crimes: 2 counts of Piracy, 7 counts of Grand Hacking, 17 counts of Cyber Theft, 3 counts of Cyber Assault, 4,478 counts of Identity Theft, Kidnapping, Assault With a Deadly Weapon, 2 counts of Attempted Homicide{Sillly mode:, Cyber Bullying, Hand Holding, Being a Girl on the Extranet}.
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

public function showSam(nude:Boolean = false):void
{
	showName("\nSAM");
	showBust(samBustString(nude));	
}
public function samBustString(nude:Boolean = false):String
{
	var bustString:String = "";
	//Pregnant
	if(flags["SAM_GAST_PREG_TIMER"] >= 80)
	{
		bustString += "TECHGUARD_JAIL_PREG";
	}
	else
	{
		bustString += "TECHGUARD_JAIL";
		if(nude) bustString += "_NUDE";
	}
	return bustString;
}


public function samCapacity():Number
{
	return 300;
}

public function samImprisoned():Boolean
{
	return (flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != undefined && flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != 4);
}

//The Fun Part
public function samsPrisonRoom(impregnate:Boolean = false):void
{
	clearOutput();
	showSam();
	author("Night Trap");
	output("Upon entering the room, you are greeted to the ");
	if(flags["MET_SAM"] == undefined) output("sight of a dark-skinned ausar woman with light blonde hair and fur, who according to prison records goes by the name Sam.");
	else output("familiar sight of Sam the ausar.");
	output(" The curves of her petite frame are almost totally obscured by her orange suit, but her top has been unzipped enough for you to enjoy the cleavage of her extremely modest A-cup breasts, which are slightly emphasized by gravity. ");
	//Lightly pregnant:
	if(flags["SAM_GAST_PREG_TIMER"] <= 45) output("You can see a subtle swell to her belly. It looks like the email you received was true.");
	else if(flags["SAM_GAST_PREG_TIMER"] <= 135) output("She’s <i>unmistakably</i> pregnant: her formerly washboard abdomen is straining against her suit’s top and her tiny tits are beginning to swell.");
	else if(flags["SAM_GAST_PREG_TIMER"] != undefined) output("Her pregnant belly is absolutely massive, making it painfully obvious that she’s carrying more than one child. The staff have given her an anti-gravity harness for her swollen middle, and a few pillows to support her growing breasts for extra comfort.");

	output("\n\nThe earthy, feminine smell of her arousal is overwhelming. Even while still constrained in her prison uniform, her desperately horny pussy has managed to fill the room with a dense cloud of fuck-me pheromones that instantly ");
	if(pc.hasCock()) output("hardens your [pc.cocks]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("moistens your [pc.cunts]");
	output(". She’s obviously in an unearthly-deep heat. When the door hisses closed behind you, the sound finally draw’s Sam’s attention, and the fertile smell only intensifies.");

	output("\n\n<i>“Are you here to finally fuck me? Oh gods, just ");
	//already pregnant:
	if(sam.isPregnant()) output("fill me up with cum");
	else output("knock me up");
	output(" already! I knew they’d give me aphrodisiacs, but I had no idea a person could </i>be<i> this fucking horny! This is worse than the worst heat I’ve ever had! I’ve never wanted to get pregnant so badly in my life");
	if(sam.isPregnant()) output(", and I’m already fucking pregnant");
	output("! Just fucking ");
	if(sam.isPregnant()) output("cum as deep in my pussy as you can");
	else output("put some pups in me");
	output(", PLEASE!”</i> Sam writhes against her restraints as she begs you in a babbling, whining voice, only managing to move an inch or so before she eventually tires and goes limp in her bonds, her ears flat and her tail hanging low.");

	output("\n\n");
	if(flags["MET_SAM"] != undefined) output("It doesn’t seem like she recognizes you, or if she does, she doesn’t care.");
	
	clearMenu();
	
	if(impregnate)
	{
		addButton(0, "Next", samPrisonStuff, [true, true]);
		return;
	}
	
	if(pc.hasCock() && pc.cockThatFits(samCapacity()) >= 0) addButton(0,"Use Dick",samPrisonStuff,[true, false],"Use Dick","Take her with your dick.");
	else if(pc.hasCock()) addDisabledButton(0,"Use Dick","Use Dick","Much as you might want to give her exactly what she wants, there’s no way you could fit inside her.");
	else addDisabledButton(0,"Use Dick","Use Dick","You’d need a penis in order to use it.");

	if(pc.hasHardLightEquipped()) addButton(1,"Use Strap-on",samPrisonStuff,[false, false],"Use Strap-on","Give her an approximation of what she wants. A hardlight dick is still a dick, right?");
	else addDisabledButton(1,"Use Strap-on","Use Strap-on","You don’t have a strap-on to use!");

	addButton(14,"Nevermind",backOuttaPrisonVisit);
}

public function samPrisonStuff(args:Array):void
{
	var cocked:Boolean = args[0];
	var impregnate:Boolean = args[1];
	
	clearOutput();
	showSam(true);
	author("Night Trap");
	output("<i>“I think that can be arranged,”</i> you tell Sam, circling around behind her. Reacting purely on instinct, she raises her tail and firm little butt as high as her restraints will allow before she even consciously processes your words. Her ears perk up once she realizes what you’ve said, and she wags her tail as much as she can in its extreme vertical position. Just the presence of someone behind her causes her sopping puss to trickle fresh moisture in excitement. The air fills with even more of those pheromones, and when you actually begin to grope her small but muscular rump, the stain on her crotch nearly doubles in size.");

	output("\n\nSam lets out a keening whine as your molesting hands sink low enough to prod at her cunny. She instantly tries to buck her hips back to pull your fingers in, but her chains and the fabric of her suit bottom deny her effort. She wiggles her hind-end into your fingers desperately, panting and whining as she moistens to an unholy degree. Smirking to yourself, you slowly tug her ruined pants down, finding it quite easy given her tiny ass and hips. The only point of resistance is her pussy, a vibrant, pink flower blooming in arousal and leaking a visible stream of feminine nectar that sticks briefly in thick strands to the crotch of her pants before breaking its hold on the fabric. Sam moans desperately as her womanhood is bared, her vulva puffy and the entrance of her most private place winking at you hungrily.");

	output("\n\nWith nothing filtering it and your face this close to the source, the ");
	if(pc.isTreated() || pc.isAusar()) output("primally familiar");
	else output("alien");
	output(" scent of her arousal is intoxicating. You swear you feel light-headed for an instant as what feels like every drop of blood in your body rushes to your crotch, and before you can stop yourself you immediately begin lapping at the breed-ready ausar’s pussy. Sam moans loudly and instantly cums, squirting a torrent of ladyjizz onto your face, filling your sinuses with her pheromone-rich odor and soaking you in her pussy-scent. You wrap your [pc.lips] around her spasming lower ones and drink in as much of her orgasmic fluid as possible, probing your [pc.tongue] out to bathe your taste buds in her bitter-sweet juices.");

	output("\n\nWhen the flow begins to abate, you grab her ass to lap hungrily at her still-spasming labia, and Sam whines pathetically in overstimulation. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("You thrust your inhuman tongue into the dark ausar, spearing her sex with as much of your oral appendage as possible. Sam spasms fitfully in her bonds, alternatively trying to pull away and thrust back onto your tongue. She’s still coming down from her orgasm, but her hungry cunt has finally been penetrated properly, and her overly sensitive nerves war with her instincts for control of her reflexes, ultimately leaving the girl helpless against your oral onslaught. You ravage her juicy box, tormenting her dripping tunnel with your tongue while sucking at her swollen clitoris with your [pc.lips] until Sam is forced to cum once more, howling her overwhelming pleasure as she gushes more girly fluids all over your thirsty tongue. Her folds clench and spasm at your muscle so tightly that you are forced to extend more of the alien appendage. You wince as her vaginal muscles furiously milk your tongue for seed that just won’t come.");
	else output("Your tongue gathers as much of her moisture as possible, thirstily sampling her taste and lavishing as much pleasure as you can on her swollen mound. Sam trembles and nervelessly kicks her shackled legs when your [pc.lips] seal around her swollen clitoris. You polish her pearl with your tongue, running the appendage under her hood until she yelps from the painful pleasure. You take pity on the pretty jailbird and move upwards, thrusting your tongue into her drenched channel. She howls in delight and frustration, her body given just a cruel hint of the penetration it so badly craves even as her nerves are still sensitized by her last climax.");

	output("\n\nSam’s pussy weeps more bittersweet fluid in anguish, and you lick every drop of the delicious nectar you can off of her spasming folds. In just a short time, your rug-munching forces the ausar to another howling, gushing orgasm, all too soon after her previous one. It’s all you can do to withdraw your tongue from her clenching folds, her vaginal muscles desperately milking your appendage for seed that just won’t come.");

	output("\n\nBetween deep, gasping breaths, Sam manages to blabber out, ");
	if(silly) output("<i>“Insert pen0r into vag00! J-j-j-jam it in!”</i>");
	else output("<i>“Please! CUM IN ME!”</i>");

	//Cock:
	if(cocked)
	{
		var x:int = pc.cockThatFits(samCapacity());
		if(x < 0) x = pc.smallestCockIndex();
		output("\n\nWho are you to keep a lady waiting? After your vigorous bout of pussy eating, your manhood feels fit to burst, so you ");
		if(!pc.isCrotchExposed()) output("strip off your [pc.crotchCovers] as quickly as possible and ");
		output("begin slathering some of the cunny honey from your face onto your [pc.cock " + x + "] for lubrication. Not that you really need it with Sam’s faucet of a cunt. So close to her goal of being filled with dickmeat, her slippery pink tunnel clenches excitedly, still wracked with orgasmic aftershocks and drizzling femlube into Sam’s hiked-down pants. You slide your cock up and down through the sopping wet channel of her vulva to tease her a bit, savoring the incredible wet heat her uterus is exuding and the sticky sound of her juices sliding across your flesh. As your [pc.cockHead " + x + "] drags through her gates, the blonde-furred girl lets out the most pitiful whine you’ve ever heard. Feeling ");
		if(pc.isNice()) output("a bit guilty for the teasing");
		else if(pc.isMischievous()) output("amused at her predictable reaction");
		else output("annoyed at her useless noises");
		output(", you quickly slot your [pc.cockHead " + x + "] up with her entrance and thrust in to the hilt with a vulgar wet sound.");


		output("\n\nSam’s eyes shoot open as her jaw drops in a silent scream. The sudden penetration has robbed her of her senses, but her lower half instinctively knows exactly what to do. She thrusts her hips back into you as much as she can while restrained, and her still ecstatically-spasming tunnel pulls your [pc.cock " + x + "] in even further as it clenches and wrings your length with orgiastic fervor until you can’t help but groan and dribble a bit of pre-seed into her greedy pussy. The drugs flowing through the ausar’s veins have transformed her womanhood into a sloppy fuckhole with no purpose beyond milking cocks of their cum. You haven’t even moved your hips since the initial penetration, and you’re already tempted just to let Sam grind her toned hind-end into you and squeeze your dick with her internal muscles until you’re filling her with [pc.cumNoun].");

		output("\n\nYou spend a few long moments enjoying the vaginal adulation of your chosen prisoner. Sam’s cunt is sinfully tight, yet impossibly accommodating. The ausar woman’s dark-skinned body is toned all over, and that lean strength can be most keenly felt in her love tunnel. Her silken folds grasp and massage every inch of your [pc.cockNounComplex " + x + "], shrouding your length in hot, soft flesh. ");
		//PC is cock virgin: 
		if(pc.cockVirgin) output("For a virgin like yourself, it’s nearly too much to handle, and you have to exercise every ounce of willpower not to just cum on the spot. You don’t want your first time to be over so quickly though, especially when it’s with such an incredible cockholster as this. If all vaginas feel like this, you’re not sure you’ll ever again be willing to spend a second longer than you have to without being balls-deep in some girl’s pussy.");
		else output("This is not just a normal bitch in heat! Sam’s pussy is almost unnaturally hot and wet, and her cunny is milking your cock like a New Texas cow. It’s obvious to you that the drugs she’s been given have put her in this state, and as you once more fight off the urge to just let go and creampie Sam’s twat on the spot, you consider your money to have been well-spent.");
		output(" With that thought on your mind, you grab the horny prisoner’s narrow hips in a vice grip and begin thrusting into her.");
		pc.cockChange();

		output("\n\nOnce she feels your hips slapping into her small butt");
		if(pc.balls > 1) output(" and your balls slapping against her clit");
		output(", Sam’s ausar instincts take over. She whimpers submissively and lays her head down on the table, raising her tail and hindquarters as high as possible to allow gravity to aid your sperm in reaching her fertile womb. You laugh and slap her firm butt cheek, drawing a small moan from the overly-horny girl. Given her current state you don’t need to take it slow, and you quickly ramp up both the speed and depth of your thrusts until you’re bottoming out in Sam’s flooding snatch several times a second.");

		output("\n\nEach clap of [pc.skinFurScales] on flesh is accompanied by an absurdly wet squelch and a spray of feminine moisture as your [pc.cock " + x + "] splatters droplets of earthy ladylube all over your crotch and Sam’s thighs. Your [pc.cockHead " + x + "] drags a thick strand of the stuff out with each withdrawal, but before you’ve even speared into that silken vice again, more pheromonal nectar has already replaced the wasted lubricant. With no warning whatsoever, Sam throws her head back and howls in ecstasy as she squirts even more ladycum. Your shaft partially obstructs the flow of her ejaculation, causing the orgasmic fluid to spray everywhere in fine droplets, coating both the howling ausar and yourself in pearls of her fragrant girlspunk, some of them even landing on your face. Your nostrils flare and your cock thickens as her pheromones further pervert your mind, and you unthinkingly lick up every delicious drop your [pc.tongue] can reach.");

		output("\n\nThroughout Sam’s shuddering orgasm, her wet, velvety folds flutter, stroke, and clench every inch of your member, gripping it fiercely from every angle possible. You want so badly to just thrust to the hilt and enjoy the milking motions, but you know you’ll be pushed over the edge if you do, and you don’t want this to end yet. Instead, you increase the speed and force of your thrusts until you’re pushing Sam across the table with each hump, determined to maximize your pleasure before this drug-fueled ausar can force you to seed her womb. Sam’s howl cracks, the pitch of her voice wavering with every hip-jarring thrust of your [pc.cock " + x + "] into her thirsty cunt.");

		output("\n\nIn short order you’ve fucked the dark-skinned beauty into another squirting orgasm, and another soon after that. By now the both of you are covered in sweat and girly fluids. Sam is simply lying slack on the table, whining softly and panting heavily with her tongue out and drool puddling under her the way her cunny honey is puddling under your feet. Your [pc.cock " + x + "] is painfully erect and spurting creamy pre-cum freely. ");
		//ausar/huskar/half or any Treated: 
		if(pc.isTreated() || pc.isAusar()) 
		{
			output("Sam’s fertile pheromones have fogged your mind to the point that you’re a beast in rut, thinking only of driving your cock as deeply into a wet hole as possible, of impregnating the fertile female below you. You clutch her hips in a deathgrip instinctively, ensuring your bitch can’t leave before you seed her womb, heedless of the high-tech restraints already keeping her captive");
			if(sam.isPregnant()) output(" or that she’s pregnant already");
			output(". ");
		}
		output("You recognize from the tight feeling in your [pc.balls] that you’re on the verge of cumming, and you resolve to make the most of it. You grunt with effort as you hump Sam as fast as possible, slapping your ");
		if(pc.balls > 1) output("balls into her clit and your ");
		output("hips into her ass hard enough to bruise the both of you.");

		output("\n\nInstinctively sensing what’s happening, Sam stirs from her fucked-apart stupor and looks back at you. The ausar raises her tail again and humps back into you as hard as she can while struggling to form words between animalistic grunts and whines. <i>“Cum! Cu-UUHH-m in me! Knot me! Please fuUUUCK me ");
		//pregnant:
		if(sam.isPregnant()) output("even more ");
		output("pregnant! I can’t - GODS PLEASE - I can’t calm down until you FUCKING CUM IN ME!!!”</i>");

		output("\n\nSam’s words and behavior are more than enough to push you past the tipping point. With a feral roar, you grab her by the scruff of the neck and force her face down on the table, using your other hand to pull her narrow hips into you as hard as possible with each thrust of your hips. Your show of dominance thrills the submissive female to her core, and her whole body trembles with the mother of all orgasms as her cunt drenches your cock. ");
		//Knot: 
		if(pc.hasKnot(x)) output("You’re more than equipped to give Sam what she’s asking for, and your own instincts are screaming at you to knot her clenching box. You toe the line as close as you can to orgasm, greedily trying to get your money’s worth with this perfect pussy. Just as your [pc.cock " + x + "] begins to twitch with your ejaculate, you stab your [pc.knot " + x + "] into the biologically-intended sheath for it. Sam’s ausar anatomy accepts your breeding bulb eagerly, stretching to accomodate your sensitive ball of flesh at the exact moment your manhood throbs powerfully with the first heavy rope of your ejaculate.");
		else output("Unfortunately for Sam, you don’t have the knot she’s begging you to plug her with, but you’ve still got the virile seed she desperately wants to quench the raging fires of her lust. As your [pc.cock " + x + "] twitches and throbs powerfully in orgasm, you stuff her box in time with your ejaculations, almost blacking out at the feeling of her swampy cunny feverishly pulling your member back in each time.");
		output(" You groan loudly and double over her sweat-slicked back as your breed her orgasmically-contracting pussy.");

		//Pregnant:
		if(sam.isPregnant())
		{
			output("\n\nWith a litter of pups already occupying her womb, Sam’s cervix remains steadfastly closed. You’re too overwhelmed with your orgasm to care, and your biological imperative keeps you stubbornly cumming in the ausar’s already-pregnant pussy, as if she could carry more of your children if you just tried hard enough.");
			//anything more than big cummies:
			if(pc.cumQ() >= 500) 
			{
				output(" Your inhuman load quickly fills up Sam’s pussy, bathing every millimeter of her folds in your hot, [pc.cumFlavor] [pc.cumNoun], the rest backwashing out in high-pressure gouts of wasted [pc.cum] ");
				if(pc.hasKnot(x)) output("even in spite of your knot");
				output(".");
			}
			else output(" Your [pc.cock " + x + "] spurts lances of hot, [pc.cumFlavor] [pc.cumNoun], basting Sam’s folds in the proof of your virility.");
		}
		//Regular cummies:
		else if(pc.cumQ() <= 1000)
		{
			output("\n\nYour [pc.cock " + x + "] spurts lances of hot, [pc.cumFlavor] [pc.cum], basting Sam’s folds in the proof of your virility. ");
			if(pc.hasKnot(x)) output("Your knot ensures every drop stays right where it belongs. ");
			output("The blonde girl howls in delight as you fill her box, and squeezes down on you so hard it hurts, even after you’ve stopped cumming.");
			output("\n\n<i>“More! More! Give! Me! Pups!”</i> she manages a few more pleas, but you’ve given her all you have.");
		}
		else if(pc.cumQ() <= 10000)
		{
			output("\n\nYour [pc.cock " + x + "] gouts great flumes of hot, [pc.cumFlavor] [pc.cumNoun], filling Sam’s tunnel with just a few spurts and stuffing her fertile womb with the remainder. ");
			if(pc.hasKnot(x)) output("With your knot sealing her entrance, her cervix has no choice but to accept the entirety of your massive load.");
			else output("Much of your [pc.cum] spurts back out in pressurized jets, but the bulk of it is forced through her cervix.");
			output(" You dump gallons of virile seed in the fertile ausar’s defenseless womb, your body doing its damndest to pump out as many swimmers as possible to find Sam’s alien eggs.");
			output("\n\nAs your orgasm winds down, Sam’s trim, muscular belly hangs low on the table, jiggling with liquid weight as the girl smiles contentedly and visibly relaxes.");
		}
		else
		{
			output("\n\nSam howls in delight when she feels your [pc.cum] splatter against her cervix. Even when her stomach begins to swell with your load, she wags her tail happily and holds herself tightly against your ");
			if(!pc.hasKnot(x)) output("base, trying to minimize the backwash of pressurized cum");
			else output("knot");
			output(". When the volume of your load grows to the point that her belly looks like she’s 9 months pregnant with a whole litter, she groans with the effort of taking your seed. In an attempt to hold in as much of your [pc.cum] as possible, she squeezes her pussy so tightly it hurts you. In spite of her best efforts");
			if(pc.hasKnot(x)) output(" and your knot");
			output(", your cum simply has nowhere else to go, and the remainder of your seed jets out of her utterly full cunt.");

			output("\n\nRather than crying out in frustration as you might expect, Sam sighs dreamily, even as you continue cumming as deep inside her as you can. As your body does its damndest to stuff her defenseless womb with even more of your swimmers, the blonde ausar sighs dreamily and wags her trapped tail. <i>“So much...”</i> she murmurs happily, visibly relaxing, <i>“I’ll be </i>so<i> pregnant!”</i>");
		}
		if(pc.hasKnot(x) || pc.isTreated())
		{
			output("\n\nOnce you’ve finished breeding her, you take some time to simply stroke Sam’s canine ears");
			if(sam.isPregnant()) output(" and her pregnant belly");
			output(". Her tail wags beneath you as she nuzzles back into your hand, both her mating instincts and yours causing the pair of you to feel at least some temporary closeness with each other. Once your ");
			if(pc.hasKnot(x)) output("knot has deflated");
			else output("cock has softened");
			output(", you pull out of her and step back, the sated girl whining pitifully as you leave her feeling very empty. You stroke her head one last time with an only-partially sarcastic <i>“Good girl.”</i>");
		}
		else output("\n\nOnce you’ve finished breeding Sam, you pull out of her and step back, the sated girl whining as you leave her feeling very empty. You stroke her canine ears with a sarcastic <i>“Good girl.”</i>");
		output(" The instant her pussy is unplugged, a torrent of ");
		if(pc.cumQ() < 200) output("clear, earthy girlcum tinged off-[pc.cumColor]");
		else if(pc.cumQ() <= 1000) output("clear, earthy girlcum mixed with your [pc.cumNoun]");
		else output("your [pc.cumNoun], discolored by her clear, earthy girlcum,");
		output(" gushes out of her to splatter wetly into her ruined pants before she reflexively squeezes her internal muscles to hold in your cum. You admire your handiwork: Sam’s pretty, pink ausar pussy is clenched tight to hold in your cum after being thoroughly creampied, and you, she, and everything around you are splattered in your mixed sexual fluids. The jailbird herself is barely conscious, but her tail is swishing gaily, and her face looks totally content, as if this is the first time in a while she has been able to truly relax.");

		output("\n\n<i>“That... was awesome.”</i> Sam pants slowly as she gives you a tired thumbs up, the blonde fur of her hand slick with sweat. <i>“I’ve never been so fucking wet and horny in my life! You should come back again some time. Don’t worry, I’ll be all drippy and slutty again ");
		if(sam.isPregnant()) output("for your next visit");
		else output("if this doesn’t take");
		output(".”</i>\n\nYou ");
		if(!pc.isCrotchExposed()) output("quickly don your [pc.crotchCovers] again and ");
		output("bid the dusky criminal farewell.");

		//PUSSY-SOAKED CONDITION, pass an hour or whatever I don’t care, PC should cum once, Sam should have a high chance to get knocked the fuck up if/when that’s ever a thing.
		processTime(30);
		pc.applyPussyDrenched();
		if(impregnate) tryKnockUpSam();
		pc.orgasm();
	}
	//Hardlight:
	else if(pc.hasHardLightEquipped())
	{
		output("\n\nUnfortunately for the bound beauty, you have no such plans for her. After your vigorous bout of pussy eating, you’re so horny it hurts, so you ");
		if(!pc.isNude()) output("strip off everything but your [pc.lowerUndergarment] as quickly as possible and ");
		output("flick on your hardlight projector and begin slathering some of the cunny honey from your face onto your artificial wang for lubrication. Not that you really need it with Sam’s faucet of a cunt. So close to her goal of being filled with dickmeat, her slippery pink tunnel clenches excitedly, still wracked with orgasmic aftershocks and drizzling femlube into Sam’s hiked-down pants. You slide your strapon up and down through the sopping wet channel of her vulva to tease her a bit, savoring the incredible wet heat her uterus is exuding and the sticky sound of her juices sliding across the hardlight.");
		output("\n\nAs the head of your dildo drags through her gates, the blonde-furred girl lets out the most pitiful whine you’ve ever heard. She looks back at you with a lust-dazed expression before furrowing her brow in confusion. <i>“What is that? That’s not a cock! What are you doing?!? I need you to fuck me and cum in me! I don’t want some stupid dildo right now! I NEED CUM!!!”</i> Feeling ");
		if(pc.isNice()) output("a bit guilty for getting her hopes up");
		else if(pc.isMischievous()) output("amused at her predictable reaction");
		else output("annoyed at her useless noises");
		output(", you quickly slot your glowing member up with her entrance and thrust in to the hilt with a vulgar wet sound.");

		output("\n\nSam’s eyes shoot open and her angry demands cease as her jaw drops in a silent scream. The sudden penetration has robbed her of her senses, but her lower half instinctively knows exactly what to do. She thrusts her hips back into you as much as she can while restrained, and her still ecstatically-spasming tunnel pulls your hardlight’s projection in even further as it clenches and wrings your length with orgiastic fervor until you can’t help but groan and clutch her hips from the pleasure. The drugs flowing through the ausar’s veins have transformed her womanhood into a sloppy fuckhole with no purpose beyond milking cocks of their cum, and the orifice doesn’t care how futile the effort is. You haven’t even moved your hips since the initial penetration, and you’re already cumming as Sam grinds her toned hind-end into you and squeezes your photon phallus with her internal muscles in a manic effort to bear your children.");

		output("\n\nYou moan loudly from the vaginal adulation of your chosen prisoner. ");
		//Has pussy:
		if(pc.hasVagina()) output("Heat builds and boils over in your belly as [pc.eachVagina] creams your [pc.lowerUndergarment]. ");
		if(pc.hasCock()) output("The scent of your cum fills the air as [pc.eachCock] unloads in your [pc.lowerUndergarment]. When the smell reaches Sam’s nose, she begins screaming at you in a cracking voice, <i>“WHY AREN’T YOU PUTTING THAT JIZZ IN ME? FUCK YOU! FUCK YOU!!!”</i> She angrily thrusts her hips back against you and clenches down even harder on your hardlight cock, helpless but to obey her instincts.");
		output(" Sam’s cunt is sinfully tight, yet impossibly accommodating. The ausar woman’s dark-skinned body is toned all over, and that lean strength can be most keenly felt in her love tunnel. Her silken folds grasp and massage every inch of your strapon, shrouding your length in hot, soft flesh. This is not just a normal bitch in heat! Sam’s pussy is almost unnaturally hot and wet, and her cunny is milking your luminescent length like a New Texas cow. It’s obvious to you that the drugs she’s been given have put her in this state, and as you ride through an eye-crossing orgasm, you consider your money to have been well-spent. With that thought on your mind and your orgasm finally waning, you grab the horny prisoner’s narrow hips in a vice grip and begin thrusting into her.");
		output("\n\nOnce she feels your [pc.hips] slapping into her small butt, Sam’s ausar instincts take over. She whimpers submissively and lays her head down on the table, raising her tail and hindquarters as high as possible to allow gravity to aid your non-existent sperm in reaching her fertile womb. You laugh and slap her firm butt cheek, drawing a small moan from the overly-horny girl. Given her current state you don’t need to take it slow, and you quickly ramp up both the speed and depth of your thrusts until you’re bottoming out in Sam’s flooding snatch several times a second.");
		output("\n\nEach clap of [pc.skinFurScales] on flesh is accompanied by an absurdly wet squelch and a spray of feminine moisture as your phallic projection splatters droplets of earthy ladylube all over your [pc.lowerUndergarment] and Sam’s thighs. Your hardlight cockhead drags a thick strand of the stuff out with each withdrawal, but before you’ve even speared into that silken vice again, more pheromonal nectar has already replaced the wasted lubricant. With no warning whatsoever, Sam throws her head back and howls in ecstasy as she squirts even more ladycum. Your shaft partially obstructs the flow of her ejaculation, causing the orgasmic fluid to spray everywhere in fine droplets, coating both the howling ausar and yourself in pearls of her fragrant girlspunk, some of them even landing on your face. Your nostrils flare as her pheromones further pervert your mind, and you unthinkingly lick up every delicious drop your [pc.tongue] can reach.");
		output("\n\nThroughout Sam’s shuddering orgasm, her wet, velvety folds flutter, stroke, and clench every inch of your member, gripping it fiercely from every angle possible. You want so badly to just thrust to the hilt and enjoy the milking motions, but you know you’ll be pushed over the edge again and again if you do, and you don’t want this to end so simply. Instead, you increase the speed and force of your thrusts until you’re pushing Sam across the table with each hump, determined to maximize your pleasure before this drug-fueled ausar can force you to cum again. Sam’s howl cracks, the pitch of her voice wavering with every hip-jarring thrust of your strapon into her thirsty cunt.");
		output("\n\nIn short order you’ve fucked the dark-skinned beauty into another squirting orgasm, and another soon after that. By now the both of you are covered in sweat and girly fluids. Sam is simply lying slack on the table, whining softly and panting heavily with her tongue out and drool puddling under her the way her cunny honey is puddling under your feet. ");
		//ausar/huskar/half or any Treated AND has penis: 
		if(pc.isTreated() || pc.isAusar()) output("Sam’s fertile pheromones have fogged your mind to the point that you’re a beast in rut, thinking only of driving your cock as deeply into a wet hole as possible, of impregnating the fertile female below you. You clutch her hips in a deathgrip instinctively, ensuring your bitch can’t leave before you seed her womb, heedless of the high-tech restraints already keeping her captive, or that you can’t impregnate her with a hardlight cock. ");
		output("You recognize from the tight feeling in your lower half that you’re on the verge of cumming, and you resolve to make the most of it. You grunt with effort as you hump Sam as fast as possible, slapping your [pc.hips] into her ass hard enough to bruise the both of you.");

		output("\n\nInstinctively sensing what’s happening, Sam stirs from her fucked-apart stupor and looks back at you. The ausar raises her tail again and humps back into you as hard as she can while struggling to form words between animalistic grunts and whines. <i>“Cum! Cu-UUHH-m in me! Knot me! Please fuUUUCK me ");
		if(sam.isPregnant()) output("even more ");
		output("pregnant! I can’t - GODS PLEASE - I can’t calm down until you FUCKING CUM IN ME!!!”</i>");

		output("\n\nSam’s words and behavior are more than enough to push you past the tipping point. With a feral roar, you grab her by the scruff of the neck and force her face down on the table, using your other hand to pull her narrow hips into you as hard as possible with each thrust of your hips. Your show of dominance thrills the submissive female to her core, and her whole body trembles with the mother of all orgasms as her cunt drenches your hardlight. Unfortunately for Sam, you don’t have the knot she’s begging you to plug her with, or the virile seed she so desperately needs to quench the raging fires of her lust. As your strapon twitches and throbs powerfully in orgasm, you stuff her box in time with your ecstatic pulses, almost blacking out at the feeling of her swampy cunny feverishly pulling your member back in each time. You groan loudly and double over her sweat-slicked back as your mock-breed her orgasmically-contracting pussy.");

		output("\n\nWhen she once more feels your fake phallus twitching inside her without seeding her, Sam screams at you, sounding like she’s on the verge of tears. <i>“FUCK YOU! I NEED SOMEONE TO CUM IN ME! I CAN’T CALM DOWN IF MY PUSSY’S EMPTY!!! </i>PLEASE!!!<i>”</i> The desperate woman practically throws her hips back into you and painfully squeezes your inorganic cock in a final, insane bid at impregnation. You quickly reach down and turn off the hardlight projector, shutting off the crushing sensation of Sam’s now-agonizingly empty and still cum-hungry cunt trying to rip your non-existent seed out of you. The sudden emptiness causes the ausar to moan loudly and pathetically.");

		output("\n\nWhen you step back out of Sam’s reach and leave her fertile pussy gaped, she collapses in her restraints. The blonde-furred girl pants heavily and whines with bitter tears forming in her eyes, utterly exhausted but no less horny than she was before you coupled with her. Her ears are flat and her tail is drooping, but her heat-born instincts keep the fluffy appendage raised above her dripping box. <i>“I needed you to breed me...”</i> Sam whimpers pitifully. Her pink flower twitches with desperation and weeps more pheromone-rich moisture, but you ");
		if(!pc.isNude()) output("re-dress quickly and ");
		output("begin making your egress before that wonderful hole can coax you back into it. As you’re leaving, you look back one last time at Sam. She glares daggers at you, her tired eyes full of hate. She softly mutters where you can just barely hear her, <i>“I hate you...”</i>");

		//PUSSY-SOAKED CONDITION, pass an hour or whatever I don’t care, PC should cum twice, no Sam pregnancy check obviously (you monster)
		processTime(35);
		pc.applyPussyDrenched();
		pc.orgasm();
		pc.orgasm();
	}
	flags["MET_SAM"] = 1;
	IncrementFlag("SAM_PRISONED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//return 0-6 for number of babies she's impregnated with
public function tryKnockUpSam():int
{
	if(!sam.isPregnant())
	{
		var score:Number = gastigothKnockupChance(sam);
		
		//roll for pregnancy
		if(rand(10000) <= score)
		{
			flags["SAM_GAST_PREG_TIMER"] = 0;
			//Default is natural kids, can be changed via 2nd preg email
			flags["SAM_BABY_GENES"] = 1;
			flags["SAM_PREG_PAID"] = undefined;
			pc.clearRut();
			
			var x:Number = ((pc.virility() + sam.fertility())/2 + 0.25)/2;
			
			//6 Babies!
			if(rand(10000) <= ((Math.atan(x - 5) + Math.PI/2)/Math.PI)*10000)
			{
				flags["SAM_NUM_BABIES"] = 6;
			}
			//5 Babies!
			else if(rand(10000) <= ((Math.atan(x - 4) + Math.PI/2)/Math.PI)*10000)
			{
				flags["SAM_NUM_BABIES"] = 5;
			}
			//4 Babies!
			else if(rand(10000) <= ((Math.atan(x - 3) + Math.PI/2)/Math.PI)*10000)
			{
				flags["SAM_NUM_BABIES"] = 4;
			}
			//3 Babies!
			else if(rand(10000) <= ((Math.atan(x - 2) + Math.PI/2)/Math.PI)*10000)
			{
				flags["SAM_NUM_BABIES"] = 3;
			}
			//2 Babies!
			else if(rand(10000) <= ((Math.atan(x - 1) + Math.PI/2)/Math.PI)*10000)
			{
				flags["SAM_NUM_BABIES"] = 2;
			}
			//1 Baby!
			else
			{
				flags["SAM_NUM_BABIES"] = 1;
			}
			
			//Lets roll for genders 50/50
			flags["SAM_BABY_GENDERS"] = new Array();
			for(var i:int = 0; i < flags["SAM_NUM_BABIES"]; i++)
			{
				if(rand(2) == 0) flags["SAM_BABY_GENDERS"].push("M");
				else flags["SAM_BABY_GENDERS"].push("F");
			}
			
			processTime(1);
			return flags["SAM_NUM_BABIES"];
		}
	}
	return 0;
}

public function samGastBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	
	var c:UniqueChild = new SamUniqueChild();
		
	c.RaceType = GLOBAL.TYPE_CANINE;
	for(var i:int = 0; i < flags["SAM_NUM_BABIES"]; i++)
	{
		if(flags["SAM_BABY_GENDERS"][i] == "M") c.NumMale += 1;
		else c.NumFemale += 1;
	}
	
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
	if(traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
	if(traitChar.furColor != "NOT SET" && rand(2) == 0) c.furColor = traitChar.furColor;
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);
	
	StatTracking.track("pregnancy/sam sired", flags["SAM_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["SAM_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["SAM_NUM_BABIES"]);

	if(flags["SAM_TOTAL_KIDS"] == undefined) flags["SAM_TOTAL_KIDS"] = 0;
	flags["SAM_TOTAL_KIDS"] += flags["SAM_NUM_BABIES"];
	flags["SAM_GAST_PREG_TIMER"] = undefined;
	flags["SAM_NUM_BABIES"] = undefined;
	flags["SAM_BABY_GENES"] = undefined;
	flags["SAM_BABY_GENDERS"] = undefined;
	flags["SAM_PREG_EMAIL1"] = undefined;
	flags["SAM_PREG_EMAIL2"] = undefined;
	flags["SAM_PREG_EMAIL3"] = undefined;
	flags["SAM_PREG_EMAIL4"] = undefined;
	flags["SAM_PREG_EMAIL_CUSTOM"] = undefined;
}

public function samBabiesVisitOptions(button:Number):Number
{
	if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 0, 4*12) > 0)
	{
		addButton(button,"Sam's Kids",visitSamBabies, undefined, "Sam's Kids", "It only takes a moment to make a moment.");
		button++;
	}
	else if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 4*12, 9001) > 0)
	{
		addDisabledButton(button,"Sam's Kids","Sam's Kids","You don’t have any pups young enough to play with. Maybe when you finish the quest, you’ll have time to be a real parent.");
		button++;
	}
	//else output("\n\nDafuq is dis shit?");
	return button;
}

public function visitSamBabies(choice:Number = -1):void
{
	clearOutput();
	author("Night Trap");
	showName("VISIT\nPUPS!");
	
	var boy:Boolean;
	
	//Build menu for playing
	if(choice == -1)
	{
		output("Which age group will you check on?");
		clearMenu();
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 0, 1) > 0) addButton(0,"0-1 Month",visitSamBabies,0);
		else addDisabledButton(0,"0-1 Month","0-1 Month","You have no pups in that age range.");
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 2, 4) > 0) addButton(1,"2-4 Months",visitSamBabies,1);
		else addDisabledButton(1,"2-4 Months","2-4 Months","You have no pups in that age range.");
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 5, 48) > 0) addButton(2,"5+ Months",visitSamBabies,2);
		else addDisabledButton(2,"5+ Months","5+ Months","You have no pups in that age range.");
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 49, 9001) > 0) addDisabledButton(3,"4+ Years","4+ Years","These pups are too old to visit.");
		return;
	}
	else if(choice == 0)
	{
		
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 0, 1) == 1)
		{
			boy = ChildManager.ofUniqueTypeAndGenderInRange(SamUniqueChild, ChildManager.GENDER_MALE, 0, 1);
			output("The pup you "+pc.mf("fathered", "sired")+" with Sam is still a tiny little thing. " + (boy ? "He" : "She") + " hasn't opened " + (boy ? "his" : "her") + " eyes yet, but " + (boy ? "he" : "she") + " still sniffs the air inquisitively and whines plaintively whenever " + (boy ? "he" : "she") + " detects your scent until you pick up and hold " + (boy ? "him" : "her") + ".");
		}
		else
		{
			output("The pups you "+pc.mf("fathered", "sired")+" with Sam are still tiny little things. They haven't opened their eyes yet, but they still sniff the air inquisitively and whine plaintively whenever they detect your scent until you pick up and hold them.");
		}
	}
	else if(choice == 1)
	{
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 2, 4) == 1)
		{
			boy = ChildManager.ofUniqueTypeAndGenderInRange(SamUniqueChild, ChildManager.GENDER_MALE, 2, 4);
			output("Your ausar " + (boy ? "son" : "daughter") + " is amazingly energetic for " + (boy ? "his" : "her") + " age. " + (boy ? "He" : "She") + " spends most waking hours wiggling around in " + (boy ? "his" : "her") + " cradle, instinctively training the muscles needed for crawling. Whenever the little pup finally runs out of energy, " + (boy ? "he curls his" : "she curls her") + " fluffy canine tail inwards and hugs it tightly as " + (boy ? "he" : "she") + " falls asleep again.");
		}
		else
		{
			output("Your little pups crawl all over each other and their surroundings, constantly sniffing and staring at everyone and everything around them. They wag their fluffy little tails whenever they're happy, which Briget says is primarily when you're around. Whenever they see something flashy on a computer or codex screen though, they all crawl over to it, wagging their tails and staring curiously until they fall asleep curled up against each other.");
		}
	}
	else if(choice == 2)
	{
		if(ChildManager.numOfUniqueTypeInRange(SamUniqueChild, 5, 48) == 1)
		{
			boy = ChildManager.ofUniqueTypeAndGenderInRange(SamUniqueChild, ChildManager.GENDER_MALE, 5, 4*12);
			output("Your ausar " + (boy ? "son" : "daughter") + " crawls around sniffing and staring at everything. The little pup is insatiably curious, and " + (boy ? "he" : "she") + " seems especially interested in computers. Whenever you hold " + (boy ? "him, he" : "her, she") + " reaches for your codex, making a sound almost like a happy little bark when you pull the device out for " + (boy ? "him" : "her") + " to stare at.");
			output("\n\nYou hope Sam's proclivity for hacking hasn't been passed down to her child...");
		}
		else
		{
			output("Your little pups crawl all over each other and their surroundings, constantly sniffing and staring at everyone and everything around them. They wag their fluffy little tails whenever they're happy, which Briget says is primarily when you're around. Whenever they see something flashy on a computer or codex screen though, they all crawl over to it, wagging their tails and staring curiously until they fall asleep curled up against each other.");
			output("\n\nYou hope they don't have the same proclivity for hacking as their mother...");
		}
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}