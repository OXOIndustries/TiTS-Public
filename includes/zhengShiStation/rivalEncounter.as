/*
Meeting Jack/Jill and the New Hotness: Feruze
By Fenoxo Fenbutt, and only by Fenoxo Fenbutte.

New Bodyguard:
Firuze Vraqqis
Female Suula. Enhanced pussy-tendril venom. Causes euphoria and delayed convulsive, peristaltic contractions - uncontrollable ejaculation/squirting for a few minutes after orgasm.
8' tall, modest 10" dick, egg-sized balls
Boobs like that girl Garde was linking in chat the other day: https://i.pinimg.com/originals/1d/49/3f/1d493fc66160c0f36b786521c92f8af3.jpg
Yellow skin with a few orange stripes.
Purple Hair like this: http://vitalmag.eu/wp-content/uploads/2016/08/Ponytail-Hairstyles-for-2016-vitalmag1.jpg
Glowing orange cybernetic eyes - mechanical looking

Equipment/Fighting Style/Notes
Wears an electrified metal ball over her tailt. Tail whip! (+Trip)
Shield Aug bracers (shield boosting accessory PC can loot)
Polychromatic Skinsuit for armor. High mobility, basically a bodycondom that can become transparent or not on a whim. Crotch automatically opens when rubbed :3
Badger-tech equipped drone - automatic lust damage while her shields are up via slut beams!
Laser Pistol & Tranq darts
Uses very strong lust attacks if the PC is tripped. Sits on face and uses pussy venom, etc.

Personality:
A bit manic.
Low empathy but not overly cruel. "Don't worry, the venom makes you like it!"
Doesnt mind playing up the "hapless damsel" trope and then 180ing into wanton powerbottom or grinning ragedom.
*/

/*
	FLAGS:
	FERUZE_ZHENG_OUTCOME	- 1=won, 2=rats won for you, -1=lost, -2=special pusslost
	FERUZE_SEXED 			- times lewded Feruze total
	FERUZE_CAME_INSIDE		- times had sex scenes cumming inside her.
*/

public function showFeruze(nude:Boolean = false):void
{
	showName("\nFERUZE");
	showBust(feruzeBustString(nude));
}
public function feruzeBustString(nude:Boolean = false):String
{
	return ("FERUZE" + (nude ? "_NUDE":""));
}
public function showRivalAndFeruze():void
{
	showName(chars["RIVAL"].short.toUpperCase() + "\n& FERUZE");
	showBust(rivalBustDisplay(false),feruzeBustString(false));
}

public function cousinEncounterBonus():Boolean
{
	if(pirateResearchVesselStolen())
	{

	}
	else if(flags["FERUZE_ZHENG_OUTCOME"] == undefined)
	{
		showRivalAndFeruze();
		author("Fenoxo");
		output("\n\nPoised at the ship’s door are two figures - closest is the eight-foot tall");
		if(CodexManager.entryUnlocked("Suulas")) output(" suula with");
		else output(" creature with angel wings and");
		output(" the sharp-toothed grin of a true predator. In her shadow, your cousin leers out at you with [rival.hisHer] oh-so-familiar cock-sure smile. <i>“Hello there,”</i> [rival.name] says. Lines of code scroll across the codex in [rival.hisHer] hand, chipping away at the ship’s security. <i>“I should’ve known you’d be here. The air on this station is thick with the stink of low-lifes. Your kind of place.”</i>");
		output("\n\nYou hand shifts towards your [pc.weapon].");
		output("\n\n<i>“Look at that, another of the infamous Steele line who can’t manage to adhere to the simplest tenets of civilization. Why wait your turn when you can brute force your way through life and take it all for yourself?”</i> [rival.HeShe] spits in apparent disgust, the oblong blob of spittle sailing for long seconds into the foundry’s red glow. <i>“Well I’m not relying on that idiot with a dog-dick for brains anymore. You won’t get past Feruze.”</i> [rival.name] giggles to [rival.himHer]self. <i>“That inheritance belongs to </i>me<i>.”</i>");
		output("\n\n[rival.HeShe] clearly isn’t in a talking mood, but [rival.hisHer] hulking, yet feminine, bodyguard isn’t coming at you yet. You could back off for the moment if you aren’t ready to take them...");
		//[Fight] [Leave]
		clearMenu();
		addButton(0,"Fight",fightFeruze);
		addButton(1,"Leave",leaveCuzAndFeruze);
		if(ratputation() == RatsRaider.RAT_REP_GOOD_CEO) addButton(2,"???",questionQuestionQuestionRATS);
		return true;
	}
	else
	{
		if(pc.hasKeyItem("Teyaal’s Key Card")) 
		{
			output("\n\n<b>You have the keycard. You can enter the ship at any time.</b> (Enter ship via the ‘North’ button.)");
			addButton(6,"North",enterShip);
		}
		else addDisabledButton(6,"North","North","You’ll need some credentials to get past this lock... or some bespoke hacking software paid for by an asshole uncle. Maybe finding the credentials is the better idea.");
	}
	return false;
}

//[ ??? ]
// No Tooltip
// This option appears if 'Rat's Raiders' enemies [Rat Thieves] are befriended.
// Counts as winning the fight, but Feruze isn't sexed. Is an option so that people can fight and get Suula sex.
// Use both Group 1 and Group 2 _armored busts for this. Yes, all six of them.
public function questionQuestionQuestionRATS():void
{
	clearOutput();
	author("William");
	showRivalAndFeruze();
	output("[rival.name] looks irritable, glancing to the ship then back to you, one eye squint and the other shut. You open your mouth only to be cut off. <i>“Feruze, my upstart relative, in all [pc.hisHer] vacant-eyed lowliness, is perhaps planning something. Do keep [pc.himHer] entertained while I get this over with. [pc.HeShe] had [pc.hisHer] chance to leave well enough alone.”</i> [rival.name]’s head whips back once more, condemnation spilling out. <i>“And, leave [pc.himHer] alive if you must be rough. I’d like to savor my victory.”</i>");
	output("\n\nThe shark-toothed mercenary smiles widely, stepping between you, your cousin, and your destination. She tilts her head, idly saying, <i>“Aw, do you really think I’d kill someone that cute and fuckable?”</i> Her tail whips around, striking the railing hard enough to send pieces of it twirling into the forge, banging off something far below. Her augmented eyes focus on you, the light shining behind them as intense as the furnaces below.");
	output("\n\n<i>“Alright cutie-pie, last chance to back out!”</i> the hulking bodyguard chimes, feathery wings spreading with her broad battle posture. <i>“Don’t keep a girl waiting.”</i>");
	output("\n\nYour cousin sneers, turning back to the ship...");
	processTime(5);
	clearMenu();
	addButton(0,"Next",questionQuestionQuestionRATS2);
}

public function questionQuestionQuestionRATS2():void
{
	clearOutput();
	author("William");
	showBust("RATS_RAIDER_GROUP_ONE","RATS_RAIDER_GROUP_TWO");
	output("<i>“Oh no you don’t, villain!”</i> there’s a yell that catches you all of guard, and then a shock of lightning where [rival.name] stands. Two prongs bounce off with a near-blinding spark, barely missing your relative’s codex; a flurry of footfalls has you spinning to catch sight of... Well, damn... You can’t say you were expecting this. The sound of a stun-gun’s spooled wires reeling in only helps remind you that those mice are back.");
	output("\n\n[rival.name] steps back, securing [rival.himHer]self in Feruze’s shadow as you see the rest of the mouse-eared pirates stomp up, standing to your sides and leveling their sparking batons upward, arcs reflecting in their eyes. Sandwiched between six rats you can’t really do anything but fold your arms and stare your rival down with the biggest smile on your face. <i>“You told our boss a lie! How could you be so cruel as to mislead us, to tell us to go after someone who’s nice?”</i> the rodenian with pink fur bellows. <i>“But [pc.name] told us everything. You’re a criminal! A fiend! You’ll pay for that, and everything else!”</i>");
	output("\n\nFeruze bites her lip, scanning the arrangement of well-armed rogues standing before them. <i>“Uhh, boss... There’s seven of them now, you might wanna-”</i>");
	output("\n\n<i>“Fuck’s sake, of course I can see that!”</i> [rival.name] snaps, scrambling to holster [rival.hisHer] device. <i>“Next thing you’ll admonish me for is thinking that a gang of vermin louts would be enough to slow my worthless cousin down!”</i>");
	output("\n\n<i>“Not so worthless when [pc.heShe] can make friends out of [pc.hisHer] enemies...”</i> the suula snarks.");
	output("\n\n<i>“You-”</i> [rival.name] growls, <i>“you and I are going to have a long chat about your pay.”</i> [rival.heShe] scowls back to you and your tamed mischief. <i>“This isn’t over, not by a long shot, dear [pc.name]. I anticipated Feruze being bested, but you’ve outdone yourself this time. By all means, get the probe, but rest assured the coordinates are as good as mine!”</i>");
	output("\n\nThe two of them leap over the railing, Feruze’s angelic wings spreading and carrying her to safety next to the blue-white booster trail of your cousin’s belt.");
	output("\n\n<i>“Hey!”</i> the half-rodenian leans over the railing, nearly tumbling until her tail is yanked by another. <i>“We know this station better than you! You can’t get away from us!”</i>");
	output("\n\nAs quick as they came, five of the six rats all dash off after your cousin, tapping your waist or wrists with their tails lovingly as they go. The pink-furred rodenian smirks, <i>“We uh... we followed you when we saw you coming up here. Most people aren’t allowed near that ship, so we were worried. Anyway, stay safe okay?”</i> " + (pc.tallness > 5*12+8 ? " She hops up to give you a kiss on the cheek":" She plants kiss on your cheek") + " before hurrying after her friends.");
	output("\n\n<i>Worth the effort,</i> you think.");
	processTime(10);
	flags["FERUZE_ZHENG_OUTCOME"] = 2;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveCuzAndFeruze():void
{
	clearOutput();
	showRivalAndFeruze();
	author("Fenoxo");
	output("Holding up your hands, you step back.");
	output("\n\nYour cousin slaps [rival.hisHer] amazonian bodyguard’s thigh in amusement. <i>“Look at that! Maybe [pc.heShe] stumbled onto a second braincell during the rush. Smartest move [pc.heShe]’s ever made.”</i>");
	output("\n\nYou bite back your bitter reply and step away... for now.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].westExit);
}

//[Fight]
public function fightFeruze():void
{
	clearOutput();
	showRivalAndFeruze();
	author("Fenoxo");
	output("No point in delaying the inevitable. You pull out your weapon" + (pc.isBimbo() ? " with a playful wave to [rival.name]’s new bodyguard. Fur-ooze or something? Whatever, she’s plenty hot. Maybe you’ll get a chance to play when this is all over":"") + ".");
	output("\n\n<i>“Feruze. Be a dear and entertain my misguided relative while I secure the next batch of coordinates.”</i> After a moment of consideration, [rival.heShe] adds, <i>“Oh, I’d rather they stay alive for now. I’d like to savor my riches </i>and<i> my victory over this usurper.”</i>");
	output("\n\nThe mercenary shrugs and rolls her shoulders, angelic wings spreading wide behind her. <i>“You wound me, " + rival.mf("sir","ma’am") + ". An innocent girl like me?”</i> Her smile is wide and full of dagger-sharp teeth. <i>“I’d never kill someone that fuckable.”</i> Whipping around, her thick tail reveals that it’s been augmented with a mace-like head by smashing into the railing and sending chunks of shattered metal into the abyss. Four seconds later, you hear pieces clang into the prefab ceilings below. <i>“Well cutie-pie? You gonna make me work for it, or you just wanna kneel down and submit right away?”</i>");
	output("\n\nTime to fight");
	if(!CodexManager.entryUnlocked("Suulas")) 
	{
		output(" - after your Codex finishes chirping and notifying you about the new entry for a race known as the Suula");
		CodexManager.unlockEntry("Suulas");
	}
	output(".");

	processTime(5);
	//start combat
	var tEnemy:Feruze = new Feruze();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatFeruze);
	CombatManager.lossScene(feruzeLossRouter);
	CombatManager.displayLocation("FERUZE");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}


public function feruzeLossRouter():void
{
	if(enemy.statusEffectv1("Face Sat") == 100) pussyLickingLoseToFeruze();
	else normalLossToFeruze();
}

//Loss Scenes
//Loss Via Pussy-Licking
public function pussyLickingLoseToFeruze():void
{
	showFeruze(true);
	author("Fenoxo");
	output("You cum, not from " + (pc.hasGenitals() ? "your genitals":"your ass") + " but from your <i>tongue</i> and the ever increasing amount of suula venom circulating through your bloodstream.");
	//Dick: no new PG
	if(pc.hasCock()) output(" The strangest thing is the way it makes your [pc.cocks] squirt. It’s like an invisible hand is somewhere inside you and <i>squeezing</i> your most sensitive places, milking you with invisible strokes. Your abdominals go crazy, fluttering and convulsing in rhythmic, peristaltic motions that expel lance after lance of [pc.cum]" + (!pc.isCrotchExposed() ? " directly into your [pc.crotchCoverUnder]":" in wasted arcs") + ".");
	//Pussy no new PG
	if(pc.hasVagina())
	{
		if(pc.hasCock()) output(" Of course, your [pc.cocksLight] " + (pc.cockTotal() == 1 ? "isn’t":"aren’t") + " the only part" + (pc.cockTotal() > 1 ? "s":"") + " held captive by this strange bliss.");
		output(" Your [pc.vaginas] clench" + (pc.totalVaginas() == 1 ? "es":"") + " powerfully enough for you to feel the walls sliding against each other, almost grinding. It’s a hell of delight and friction that wrings [pc.girlCum] from you in ");
		if(pc.wettestVaginalWetness() < 2) output("slow trickles");
		else if(pc.wettestVaginalWetness() < 3) output("a steady dribble");
		else if(pc.wettestVaginalWetness() < 4) output("long, wet rivers");
		else if(pc.wettestVaginalWetness() < 5) output("wet squirts");
		else output("torrential, steaming-hot squirts");
		output(". You’re like a sponge being squeezed dry, hapless to do anything but worship pussy and " + (!pc.isCrotchExposed() ? "dribble into your [pc.crotchCoverUnder]":"dribble your excitement onto the catwalk") + ".");
	}
	//asshole with no genitals
	if(!pc.hasGenitals()) output("\n\nThe strangest thing is the way it makes your [pc.asshole] react. You aren’t just clenching down, you’re squeezing in peristaltic ripples. If there was a cock in your ass you’d be wringing every single droplet of cum from it. Instead you’re left to revel in friction of your rectal walls grinding against one another, every part of your ass nearly as erotic as your hyper-sensitized mouth.");
	//Nipcocks
	if(pc.hasNippleCocks())
	{
		output("\n\nYour [pc.nippleCocks] push out entirely on their own. You can’t control them any more than you can your rebellious tongue, and you certainly don’t care to try. They’re rock hard in the space of a second and spurting hot loads " + (pc.isChestExposed() ? "into the air":"into your [pc.chestCoverUnder]") + " in no time. Feruze seems to notice. After a moment of bemused giggling, and reaches down to " + (!pc.isChestExposed() ? "free them and ":"") + "stroke one, pumping so they can come out thicker and hotter, spattering on you like rain.");
	}
	//Merge
	output("\n\nUnusually, the pleasure doesn’t ebb or slow. It grows stronger with every thrust of your tongue or kiss of your [pc.lipsChaste]. Eating pussy never felt so good or so <i>necessary</i>. You smash your face upward into Feruze’s tentacled quim, literally fucking her with your face. Every touch is heaven. A lick is as good an hour of masturbation. Sucking her clit is eye-rollingly good. Your fingers curl into useless claws while your eyes roll back, but you don’t need to touch or see.");
	output("\n\nYou need to lick, and suck... and.... <i>More pussy.</i> You need more of Feruze’s pussy.");
	output("\n\nOne of her tendrils strokes your cheek lovingly as your frenzied box-munching increases her pleasure. Dribbles of her fragrant, alien juice trickle off your chin. She rocks back against you, and for the first time, you get the hear the slutty mercenary cooing in real pleasure. Maybe it’s the chemical her <i>perfect cunt</i> exudes altering your perceptions, but you’re coming to understand why some people refer to suulas as sirens. You cum a little harder to the sound of her voice, every blissful clench bringing with it something that feels a little like falling in love...");
	output("\n\n<i>“Oh yes!”</i> the shark-woman screams, <i>“Suck my fucking cunt, slut!”</i> She bounces on your face, slamming your head into the metal scaffolding, pussy-lips stretching wide to expose more of her amber interior.");
	output("\n\nYou give Feruze exactly what she wants. You worship her intoxicating quim. Throwing your [pc.tongue] in wide circles, you stroke all her inner walls, then swap to feathering the outer lips and tendrils with kisses. You even suck on some of them, one at a time, uncaring for what their invisible stings are doing to you. You are a storm of pleasure and want and desire, and this... this glorious golden cunt is the source of it all. Just breathing in a hint of its musk seems like it would be enough to keep you cumming for hours...");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",pussyLickingLoseToFeruze2);
}

public function pussyLickingLoseToFeruze2():void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("You don’t know how long you spent locked between Feruze’s thighs in perpetual orgasm, delighted to bring her to climax after climax. You do know that at some point you passed beyond the realm of conscious understanding and operated entirely in the realm of pleasure and animalistic impulses, desiring on the taste of your siren-goddess’s perfect pussy and the lilting cries of her pleasure.");
	output("\n\nFor hours, you were little more than a tongue on " + (pc.legCount == 1 ? "a [pc.leg]":"[pc.legs]") + ", fit to lick and wanting nothing more from life.");
	output("\n\nNow as you stir from exhaustion, you blink the gummy, leftover pussy-juice from your eyes and yawn, working your sore jaw back and forth. The stink of sex fills your nostrils like never before, and you ache all over from the endless climax... climaxes? Whether it was truly one endless orgasm or many spun together into a never-ending line, you cannot say, but a part of you fills with regret when you realize that Feruze is gone.");
	output("\n\nYou won’t get to lick her pussy any more, and the knowledge brings a tear to your eye.");
	output("\n\nSighing, you climb up on your [pc.footOrFeet] and glance to the ship’s door. It’s open. A small note hangs next to it:");
	output("\n\n\t<i>You are pathetic! You know that right? If I had known you’d lay down and take it from any pretty girl I presented you with, I would’ve saved a lot of money on dear Feruze’s fees. Anyway, I found the probe while you were busy, but since I’m soooo kind, I left it behind for you... if you think you can get past all the pirates onboard this beauty without enslaving yourself. Either way suits me, but if I do bump into you on the next planet, I don’t think a weak little slut like you is any real competition.");
	output("\n\tStill... it’ll be nice to have another chance to defeat you so totally. Then again, maybe you like that sort of thing?");
	output("\n\tTa ta,");
	output("\n\t\t[rival.name]</i>");

	output("\n\nBelow is an addendum written in purple:");
	output("\n\n\t<i>Heyyy there, champion box-muncher! Hope you had as much fun as I did! Look, there’s some nasty pirates on the ship, so you rest up and make sure you have a nice big cum before you go in there, okay? I want to make sure you make it to the next planet so we can do that again. Maybe next time I’ll wear some panties so you can tear them off with your teeth, maybe keep them as a keepsake?");
	output("\n\t\tHugs and cunny-kisses!</i>");

	processTime(126);
	
	//end! Make sure PC cums like 200 times.
	for(var x:int = 0; x < 194; x++) { pc.orgasm(); }
	pc.girlCumInMouth(enemy);
	pc.applyPussyDrenched();

	flags["FERUZE_ZHENG_OUTCOME"] = -2;
	//IncrementFlag("FERUZE_CAME_INSIDE");
	IncrementFlag("FERUZE_SEXED");
	variableRoomUpdateCheck();
	CombatManager.genericLoss();
}

//Regular Loss
public function normalLossToFeruze():void
{
	showFeruze(true);
	author("Fenoxo");
	//Drugged loss!
	if(enemy.hasStatusEffect("Face Sat"))
	{
		output("Feruze squats next to you intently. <i>“You put up a pretty good fight for somebody with a bloodstream full of hyper-enhanced suula venom.”</i> She strokes your " + (pc.hasHair() ? "[pc.hair]":"head") + " with the familiarity of a lover and shakes her head. <i>“[rival.name] underestimated you. You’re the real deal [pc.name].”</i> Her lips curl sweetly. <i>“And I am thrilled to tell you that the venom in your bloodstream is going to make you forget all about your injuries very, very soon.”</i> She continues to stroke and pet you, soothing your protests and struggles into placid complacence.");
		output("\n\nIs it another effect of her drugged cunt? Did the moments you spent buried in pussy sap your will that strongly?");
		output("\n\n<i>“See usually the venom’s just for keeping our mates hard, but mine’s special. Mine’s three or four times stronger than normal and modded with a few extra chems to make things extra fun.”</i> Feruze’s smile turns almost manic as she watches your [pc.hips] squirm and writhe. <i>“It makes you cum once enough of it is absorbed into the muscles around your groin. I’m not sure exactly how, but it’s something to do with how it makes them clench. Boy, girl, herm - it doesn’t matter. A few moments with my pussy is enough to make the most chaste monk drench his robes a couple of minutes later. And I gave you a nice big dose.”</i>");
		output("\n\nOh. That explains why your crotch is getting so warm, why every now and then an errant clench");
		if(pc.hasCock()) output(" sends your [pc.cocks] bobbing");
		else if(pc.hasVagina()) output(" makes your [pc.vaginas] sing");
		else output("tightens your [pc.asshole]");
		output(".");
	}
	//HP
	else if(pc.HP() <= 1)
	{
		output("<i>“Huh,”</i> Feruze muses, squatting down next to you. <i>“You’re a pretty good in a scrap. You know that right? Lasted longer than my boss back there would have, that’s for sure.”</i> She brushes her thumb across your forehead as intimately as one might a long time lover. <i>“Still, now that you’re on the floor, we can get to the real fun.”</i> She leans low and looks you over" + (!pc.isCrotchExposed() && !pc.isChestExposed() ? ", casually peeling you out of your equipment":"") + ", her eyes lingering overlong on your ");
		if(pc.hasCock()) output("[pc.cocks]");
		else if(pc.biggestTitSize() >= 3) output("[pc.fullChest]");
		else if(pc.hasVagina()) output("[pc.vaginas]");
		else output("[pc.nipples]");
		output(". <i>“I know you hurt right now, but...”</i> she whispers into your ear, <i>“the pain makes the pleasure so much better.”</i>");
		output("\n\nYou try to twist away, but there’s no point. The sharky merc is too strong, and you’re too beat up. When she straddles your chest" + (!enemy.hasStatusEffect("Face Sat") ? ", spreading the crotch of her suit to expose a tentacle-ringed cunt":", tentacle-ringed cunt squirming anxiously") + ", the most you can manage is an ineffectual slap on her thigh.");
		output("\n\n<i>“Oh, you brute!”</i> Feruze scowls and grabs your wrists, pinning them down. <i>“I was being nice to you. I was trying to make this good for you - give you something to think about besides your aches and pains. I was going to give you orgasms like you’ve never felt before.”</i> She leans down and licks your cheek, heavy tongue sliding slowly up to your ear. She snaps her jaw shut a hair’s breadth away, deadly teeth clacking. <i>“But I don’t think you deserve those kinds of orgasms. I think I’ll give you a different kind of climax... the kind that leaves you gasping and hornier than when you started. The kind that’s going to make you beg me for more...”</i> She flicks your nose. <i>“You ready?”</i>");
		output("\n\nYou wince and scowl up at her. <i>“Fuck you!”</i>");
		output("\n\n<i>“You wish,”</i> Feruze coos, dropping her weight onto your middle, just below your [pc.chest]. A star of hot wetness announces the exact location of her alien pussy, flanked by thin tendrils that slither and squirm through the increasingly moist patch of [pc.skinFurScalesNoun]. Everywhere they touch lights up with a sort of prickling, almost tickling sensation - like getting goosebumps on a chilly morning. Only, those places go sort of numb right after, like you can’t be sure that you felt anything at all.");
		output("\n\nWeird.");
		output("\n\n<i>“Oh ho! I know that look.”</i> Feruze laps at your other cheek and smashes her lips into a brutally firm kiss against your forehead. <i>“Somebody’s trying to figure out what big, mean Feruze’s juicy snatch is doing to them, aren’t they?”</i>");
		output("\n\nYou don’t give her the pleasure of an answer.");
		output("\n\n<i>“It’s suula venom. Well, mostly.”</i> She grinds her hips around, spreading the disconcerting sensation around. <i>“See our pussies are designed to keep our lovers nice and hard, but mine’s better. I got some enhancements from a friendly doctor, and now... now my venom’s three or four times as strong as normal... and more copious... and the best part is how it triggers an ejaculation response without fail. ");
		if(pc.hasCock()) output("Even if you didn’t have juicy dick" + (pc.cockTotal() > 1 ? "s":"") + ", it’d make you clench and cum");
		else output("Even without a dick, it’ll make you clench and cum like you had one.");
		output("”</i> She stands up, dribbling slickness over your [pc.chest]. <i>“Course it’d be better if I helped, but I think... I think I’ll watch it work. You should’ve been nicer, hot stuff.”</i>");
		output("\n\nFeruze leans against the railing she didn’t demolish and watches you intently, idly squeezing one of her breasts.");
		output("\n\nSure enough, her words ring disturbingly true. The numbness fades into a gentle, growing warmth. Everywhere her cunt touched returns to full sensitivity and then some. You can detect every little current of air as it washes over your [pc.skinFurScales], feeling very much like the slobbering tongue. Your whole body flushes as her pussy-secreted drugs spread through your bloodstream, but nowhere so powerfully as in your loins.");
		output("\n\nYour crotch grows warm and heavy, the muscles strangely slackening even as everything seems to engorge. Then, an abrupt clench sends your ");
		if(pc.hasCock()) output("[pc.cocks] bouncing and flinging dribbles of pre into the air");
		else if(pc.hasVagina()) output("[pc.vaginas] into exquisite, pleasure, the walls clinging tight to your [pc.clits]");
		else output("[pc.asshole] into a convulsion of pleasure");
		output(".");
	}
	//Lust
	else
	{
		output("Feruze squats next to you, watching you squirm in near-insensate passion. <i>“I don’t get it. I didn’t even touch you with my venom. You all but incapacitated yourself, didn’t you? Horny little mynx.”</i> She giggles and " + (pc.hasHair() ? "tussles your [pc.hair]":"pats your head") + ". <i>“I don’t know if a stupid slut like you deserves a proper fuck, but I can make sure you cum a couple times. Would you like that? Would you, [pc.boyGirl]?”</i>");
		output("\n\nYou moan in wanton agreement, arching your back and wiggling your hips.");
		output("\n\n<i>“Well then.”</i> The shark-skinned mercenary strips off your equipment and slides one leg over your chest to straddle you, casually tapping at the crotch. The seam splits wide, exposing a tentacle-ringed cunt with a big fat clit and a thick coat of feminine lubricant. <i>“How about this?”</i> She sits down, smearing her simmering snatch all over your [pc.skinFurScales]. Everywhere it touches prickles bizarrely, then goes halfway numb, but Feruze shows no signs of slowing. She gyrates and slides back and forth, coating a big fat patch of your form in juicy secretions and tingling strangeness.");
		output("\n\nYou whine in disappointment and desire. You wanted to cum! You want to cum so bad but all she’s doing is making you smell like her pussy!");
		output("\n\n<i>“Ohh, don’t look like that,”</i> Feruze says, patting you gently. <i>“The numbness is just so it doesn’t hurt while the venom gets into your bloodstream. In a second you’re going to feel very, very good indeed.”</i> She kisses your forehead slowly, still grinding against you. <i>“See my venom is three or four times more potent than most suula, and as an added bonus... it forces you to cum. I don’t even have to do anything. Just wait a couple minutes. Once it gets into the muscles around your crotch, it doesn’t matter if you’re a boy, a girl, a herm, or something else. You’ll start clenching and blissing out and cumming sooo hard.”</i>");
		output("\n\nThe grinning mercenary stands up, webs of glittering pussy-juice hanging in the air between her thighs. <i>“Now it’s just a matter of waiting and watching the show. You are going to give me a good show, right?”</i>");
		output("\n\nSure enough, her words ring disturbingly true. The numbness fades into a gentle, growing warmth. Everywhere her cunt touched returns to full sensitivity and then some. You can detect every little current of air as it washes over your [pc.skinFurScales], feeling very much like the slobbering tongue. Your whole body flushes as her pussy-secreted drugs spread through your bloodstream, but nowhere so powerfully as in your loins.");
		output("\n\nYour crotch grows warm and heavy, the muscles strangely slackening even as everything seems to engorge. Then, an abrupt clench sends your ");
		if(pc.hasCock()) output("[pc.cocks] bouncing and flinging dribbles of pre into the air");
		else if(pc.hasVagina()) output("[pc.vaginas] into exquisite, pleasure, the walls clinging tight to your [pc.clits]");
		else output("[pc.asshole] into a convulsion of pleasure");
		output(".");
	}
	//merge - no new PG
	output(" Your eyes snap open in alarm. That felt <i>good</i>. Really good. ");
	if(enemy.hasStatusEffect("Face Sat")) output("Better than running your tongue in slow circles around your sensitized mouth. ");
	output("The fact that you can’t even control yourself down there just makes it hotter, makes you wonder when the next clench is going to happen.");
	output("\n\n<i>“Oh, is it starting already?”</i> Feruze produces a dildo from somewhere and slides it into her pussy, letting the tendrils wrap around the base and squeeze. <i>“Ahhh, this is going to be soooo hot.”</i>");
	output("\n\n<i>Clench.</i>");
	output("\n\nYour eyes roll back from the sudden spasm. The heat in your crotch feels like it redoubles in the aftermath, like that powerful squeeze somehow concentrated the suula’s insidious, orgasm-triggering chemicals into an event denser knot.");
	//No new pg.
	//Dick
	if(pc.hasCock()) output(" You look down in disbelief at your [pc.cocks]. " + (pc.cockTotal() == 1 ? "It’s":"They’re") + " harder than you’ve seen " + (pc.cockTotal() == 1 ? "it":"them") + " in ages - harder than rebar and heavier than a lead weight. Stringy, slick pre-cum dribbles down the underside" + (pc.cockTotal() > 1 ? "s":"") + ", squeezed out in a heavy blob.");
	//Cunt
	else if(pc.hasVagina()) output(" You look down in disbelief at your [pc.vaginas]. " + (pc.totalVaginas() == 1 ? "It’s":"They’re") + " puffier than you’ve seen " + (pc.totalVaginas() == 1 ? "it":"them") + " in ages. The lips are obscenely engorged, your [pc.clits] rosy and thick enough that you can perceive gravity’s tug through the nerve-dense flesh.");
	//Ass
	else output(" You look down in disbelief at your groin, wishing you could see your spasming asshole, if only to better understand why it feels so engorged and sensitive, like it’s become a sexual organ all its own.");
	output("\n\nIf only you could fuck somebody right now! Feruze is so close, but she’s selfishly fucking herself, pumping that dildo in and out with swift strokes while watching you dance like a puppet on venomous strings. Why isn’t she fucking you? Why aren’t you fucking her? Why is it taking so long for the next spike of pl-");
	output("\n\n<i>Clench</i>");
	output("\n\nYour breath hitches in your throat, then slides out in a high-pitched cry of pleasure. Your back arches with the force of this one, lifting your [pc.hips] clear of the ground.");
	if(pc.hasCock()) output(" Ropey pre launches into the air before splattering down on your [pc.belly], squeezed out in an instant, almost like a proper orgasm.");
	else if(pc.hasVagina()) output(" Droplets of [pc.girlCum] trickle out as your quim" + (pc.totalVaginas() > 1 ? "s":"") + " abruptly become" + (pc.totalVaginas() == 1 ? "s":"") + " too pressurized for them to remain.");
	else output(" Ripples of squeezing delight roll through your abdomen, hot and hard and aching with the need for... something.");
	output(" Then you slump back to the ground, only to bounce back up in the aftershock, moaning in sudden excitement.");
	output("\n\nYou’re so tender and sensitive that even the metal below feels heavenly against your [pc.butts]. When you uncross your eyes and look back at Feruze, she licks her lips and winks.");
	output("\n\n<i>“Getting close, aren’t you?”</i> the suula asks knowingly. <i>“Don’t fight it.”</i>");
	output("\n\n<i>Clench</i>");
	output("\n\nYour [pc.tongue] lolls out.");
	if(pc.hasDickNipples()) output(" Bursting from hiding, your [pc.dickNipples] twitch in sympathetic pleasure, unable to be contained a moment longer.");
	output(" Your [pc.legOrLegs] twitch" + (pc.legCount == 1 ? "es":"") + " faster than the drumline in the latest dance music. Erotic energy burns in your blood, superheating your ever-tightening loins" + (pc.hasGenitals() ? " while musky sex-juices pump out in fits and starts":"") + ". Feruze was wrong to think you’d fight this. You could never fight this. Could never fight the mounting pleasure th-");
	output("\n\n<i>Clench</i>");
	output("\n\nBlubbering, your vision turns pink as you stare into the back of your eyelids, body taut" + (pc.hasGenitals() ? " and leaking":"") + ".");

	//Cocks no new PG
	if(pc.hasCock()) output(" You’re being milked better than a galotian’s cunt ever could. You can feel the fluid pooling together just underneath your [pc.cocks], the first dribbles of [pc.cumNoun] collecting on your [pc.belly].");
	//Vag’s no pg
	else if(pc.hasVagina()) output(" You’re being fucked better than the galaxy’s best dick ever could. Suula venom has your [pc.vaginas] almost glad to be empty, the better to feel every one of your folds as they slip and slide against one another.");
	//Butbois nopg (R rated)
	else output("\n\nYou’re being fucked by this venom, slowly but surely. It’s taken over your middle and your asshole, reduced you to someone who’d rather wait for the drugs in [pc.hisHer] system to bring him pleasure than reach down [pc.himHer]self.");
	//Merge
	output("\n\nOrgasm is close you can taste it, though maybe that’s just the scent of Feruze’s cunt in the air" + (pc.hasVagina() ? " intermingled with your own":"") + ".");
	output("\n\n<i>Clench</i>");
	output("\n\nStars, you need to climax so bad it hurts! ");
	if(pc.hasCock()) output("[pc.Cum] slops out in little half-shots. ");
	if(pc.hasVagina()) output("[pc.GirlCum] slicks your [pc.thighs]. ");
	output("The taut, rippling feeling in your middle never quite dissipates this time, instead rhythmically undulating in half-powered aftershocks that coerce you into screaming and begging for Feruze to fuck you. You manage to look at her pleadingly for a half-second before your eyes cross once more, and-");
	output("\n\n<i>Clench</i>");
	output("\n\nYou’re cumming. You’re cumming all over yourself, and you don’t care. You smell like pussy" + (pc.hasCock() ? " and spunk":"") + ", and inside you just wish that Feruze was sitting in your lap, coaxing you to greater heights of pleasure. Eyes rolling wildly, you feel your [pc.hips] scissoring up and down entirely on their own. You hump and pump");
	if(pc.hasCock()) output(" and spray your load without a care");
	else if(pc.hasVagina()) output(" and spray your more mundane pussy-juice all over the catwalk");
	output(", chemically driven past the point of reason. Again and again, you clench tighter than a whore’s corset.");
	output("\n\nBy the time the ecstatic feeling abates, you’re drier than a beach towel left to bake in the sun, but somehow... unfulfilled. Still horny. Still sensitive. You pant for your breath and look to Feruze, licking lips that feel more chapped than they should be.");
	output("\n\n<i>“Oh I can’t say no to that face.”</i> Pulling the dildo from between her legs with a wet-sounding ‘pop,’ the suula plunks it into your mouth and seats herself square on your lap");
	if(pc.hasCock()) 
	{
		output(", taking your sloppy, drooling [pc.cockNounSimple] inside herself");
	}
	else output(", spreading herself over you, tendrils prickling everywhere..");
	output(". <i>“Now you just cum whenever the urge takes you, we can forget all about that fighting you tried to do earlier.”</i>");
	if(pc.hasCock()) pc.cockChange();
	processTime(30);
	pc.orgasm();
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",normalLossToFeruze2);
}

public function normalLossToFeruze2():void
{
	clearOutput();
	showFeruze(true);
	//Cock stuff.
	if(pc.hasCock()) 
	{
		output("Between the velvet clutch of her pussy and the almost narcotic euphoria of her potent venom, you dump countless loads directly into her waiting quim. In fact, there’s so much [pc.cumNoun] squishing between her thighs that she looks like she’s been on the receiving end of a hundred-man gangbang. Yet it’s never enough for you. Your next climax almost seem like it’s there to prove a point - that you’ll endlessly cum for this golden snatch. All it needs to do is appear, and you’ll gladly slide yourself into nirvana.");
		pc.applyCumSoaked();
		for(var x:int = 0; x < 25; x++) { enemy.loadInCunt(pc,0); }
	}
	//Pussy (Still displays if dick)
	if(pc.hasVagina())
	{
		if(pc.hasCock()) output("\n\n");
		output("Your pussylips are a swollen, sopping mess after so many climaxes. Feruze could make you " + (!pc.isSquirter() ? "dribble more":"squirt") + " just by blowing on your [pc.clit], but she’s doing so much more than that. She’s rocking back and forth, her tendrils wriggling in the most maddening way, diving into folds and creases so that every inch of their surface can pump more of her venom into your over-engorged femininity. The worst part is that even after hours, you can’t bring yourself to ask her to stop. If she crooked an eyebrow at you, you’d spread " + (pc.legCount > 1 ? "your [pc.legs]":"yourself wide") + " and smile.");
	}
	//Assboi (no puss/dick)
	if(!pc.hasGenitals())
	{
		output("Despite your lack of traditional genitalia, you’re still more than capable of entertaining Feruze for hours. With her pussy flush against your [pc.skin], your every twitch and tremble radiates into her clit and cunt, which in turn makes her slicker and wetter - and her tendrils more active. They’re always wriggling and squirming, driving your [pc.asshole] to pucker and relax, undulating through seemingly endless paroxysms of pleasure. And if course when she asks you if you want to keep going, you nod without thinking. It feels to good not to.");
	}
	//Dipples:
	if(pc.hasDickNipples()) output("\n\nYou’re glazed from head to toe in [pc.cum] from your [pc.dickNipples] on top of everything else. Those turgid spires tempted you with their ecstatic throbbing until you grabbed hold of " + (pc.totalNipples() == 2 ? "both":"two") + " and submitted to jerking them off. Feruze smiled at that, you recall, and reached out to help, circling the tip of one with a finger and gasping in delight when it spat it long lance of [pc.cumColor] into the air on command.");
	//Merge
	output("\n\nBehind the angel-winged goddess, the door to the ship opens and closes. You seem to recall noticing it doing that once before, but another climax wipes that concern away.");
	output("\n\n<i>“Quit playing with [pc.himHer], Feruze. We got what we came for.”</i>");
	output("\n\nThe shark-girl pouts but reluctantly rises, connected to you hours worth of collected suula juices stretched into lewd webs. <i>“Awww, okay. Give me a second to clean up, and I’m right behind you.”</i>");
	output("\n\nYour cousin nods, then strides away, careful not to get to close to your utterly debauched form.");
	output("\n\nFeruze leans down next to you, watching you squirm, and plants a kiss on your forehead. <i>“I hope you enjoyed all those orgasms as much as I did. Now you be a dear and rest up before you go after the probe yourself. You don’t have [rival.hisHer] stealth field, and there’s probably some pretty mean pirates inside. It’d fucking suck if we didn’t get to play on the next planet.”</i> After a moment, she hisses into your ear, <i>“And if you give up for me next time, maybe I’ll do the fucking and sucking...”</i> She straightens and turns away.");
	output("\n\nYou cum to the sight of her pale cheeks wobbling and swaying. Then you cum some more.");
	processTime(65);
	for(var y:int = 0; y < 25; y++)
	{
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",normalLossToFeruze3);
}

public function normalLossToFeruze3():void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("It’s a half hour later by the time your body works through the last of Feruze’s drugs. You’re sore from the waist down and a little dehydrated, but otherwise okay. The ship’s door is open. It seems your cousin left it that way for you. The probe must be secreted away somewhere inside.");
	output("\n\nYou resolve to be more careful in your next fight... and to consider Feruze’s offer the next time you see her.");
	processTime(35);
	output("\n\n");
	CombatManager.genericLoss();
	flags["FERUZE_ZHENG_OUTCOME"] = -1;
	variableRoomUpdateCheck();
	IncrementFlag("FERUZE_SEXED");
}

//Victory
public function defeatFeruze():void
{
	author("Fenoxo");
	showFeruze(true);
	//HP
	if(enemy.HP() <= 1)
	{
		output("Feruze stumbles once, then falls, catching herself on the intact railing with a look of surprise and respect writ across her predatory features. Dislodged feathers twirl in helix-shaped patterns as they fall toward the forges below. <i>“Uhhh, boss. You didn’t tell me [pc.heShe] was this fucking good. You might wanna evac.”</i>");
		output("\n\n[rival.name] sneers at Feruze. <i>“What a waste. Fortunately I anticipated such a failure. The coordinates are as good as mine.”</i> [rival.HeShe] pockets [rival.hisHer] glowing tablet with a cocksure smirk. <i>“If you can make it back to the ship, I’ll consider keeping you on... for a reduced rate. Do try to be less disappointing next time, hmmm, Feruze?”</i> With a flourish and a wave, [rival.name] tumbles backward off the catwalk... and high powered boosters in [rival.hisHer] shield belt flash, carrying [rival.himHer] away on streamers of neon-blue exhaust.");
		output("\n\nFuck.");
		output("\n\n<i>“Heyyy, [pc.name]?”</i> the injured suula murmurs, <i>“Looks like you won this little tussle... and you impressed me.”</i> She drops down onto her ass, the metal sphere at the end of her tail clanging loudly. <i>“So I think, now that I’m at your mercy, you should show me exactly what kind of [pc.manWoman] you are. We have time. [rival.name]’ll be fuming and bitching for hours... and I’d much rather be listening to our moans.”</i>");
	}
	//Lust
	else
	{
		output("Feruze’s knees knock together as she grinds her thighs together. The pistol in her hand drops to the mag-holster on her hip, freeing her fingers to clutch and squeeze at the heavy weight of one perky-nippled tit. <i>“Ooohhhh... Ummm, boss... You uh, never told me your cousin was this f-f-fucking sexy.”</i> She whines, high pitched, and sinks to her knees, then tumbles onto her back, legs splaying wide. <i>“So hot...”</i>");
		output("\n\n[rival.name] pockets [rival.hisHer] tablet and sighs. <i>“You disappoint me Feruze. The contract was quite clear that if your whorish inclinations got in the way of the job that you’d take an 85 percent reduction in pay. I suppose you didn’t want those credits quite so badly.”</i> [rival.HeShe] laughs cruelly. <i>“Not that it matters. I planned for such a contingency. The coordinates are as good as mine. Should you make it back to the ship in one piece, I’ll consider keeping you on at the new rate.”</i> [rival.name] waves off-handed in your direction and steps back, tumbling over the railing.");
		output("\n\nBlue-white flares of energy erupt from [rival.hisHer] shield belt to carry [rival.himHer] away on neon-glowing contrails.");
		output("\n\nFuck.");
		output("\n\n<i>“Heyyy, [pc.name]?”</i> the suula murmuers, stroking at the " + (enemy.hasStatusEffect("Face Sat") ? "open crotch of her painted-on suit and the sodden treasure beneath":"crotch of her painted-on suit until the space-age material scissors open to expose the sodden treasure between her thighs") + ". <i>“You wanna fuck me, baby? I’m all yours. If you don’t fuck me now, I’m gonna be fucking you in my dreams tonight, and if you do... I might do that every night.”</i> She moans wantonly, scooching closer. <i>“Please. I’d do it for you...”</i>");
	}
	flags["FERUZE_ZHENG_OUTCOME"] = 1;
	variableRoomUpdateCheck();
	processTime(5);
	//menu here
	output("\n\n");
	clearMenu();
	pc.lust(10);
	if(pc.lust() < 33)
	{
		addDisabledButton(0,"FuckHerPuss","Fuck Her Puss","You aren’t aroused enough for this.");	
		addDisabledButton(1,"Scissor","Scissor","You aren’t aroused enough for this.");
		addDisabledButton(2,"Big Titfuck","Big Titfuck","You aren’t aroused enough for this.");
	}
	else
	{
		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0 && pc.hasCock()) addButton(0,"FuckHerPuss",cockSelect,[fuckFeruzesPussy,enemy.vaginalCapacity(0),false,0],"Fuck Her Puss","Relieve yourself in the most tried and true method known to carbon-based life the universe over.");
		else if(pc.hasCock()) addDisabledButton(0,"FuckHerPuss","Fuck Her Puss","You don’t have a dick small enough to fit inside her.");
		else addDisabledButton(0,"FuckHerPuss","Fuck Her Puss","You need a penis for this.");

		if(pc.hasVagina()) addButton(1,"Scissor",tribFeruze,undefined,"Scissor","Squeeze your crotch together with Feruze and rub cunts until you’re satisfied.");
		else addDisabledButton(1,"Scissor","Scissor","You need a vagina for this.");

		if(pc.biggestCockVolume() > enemy.vaginalCapacity(0)) addButton(2,"Big Titfuck",cockSelect,[titfuckAndGrindFeruze,90000000,false,enemy.vaginalCapacity(0)],"Big Titfuck","You might be too big to fit inside any of her orifices, but you’re pretty damned sure you could wrap yourself up in those big tits of hers for a good time.");
		else addDisabledButton(2,"Big Titfuck","Big Titfuck","You need a very large penis for this scene.");
	}
	addButton(14,"Leave",leaveFeruzeAfterWinning);
}

public function leaveFeruzeAfterWinning():void
{
	clearOutput();
	showFeruze();
	author("Fenoxo");
	output("You step around the fallen suula. <i>“");
	if(pc.isBimbo()) output("You’re super pretty, but it wouldn’t be right with you working for that meanie. Look me up later and I’ll consider being the [pc.manWoman] of your dreams.");
	else if(pc.isBro()) output("Nah.");
	else if(pc.isNice()) output("Sorry cutie, but I’ve got a job to do.");
	else if(pc.isMischievous()) output("How about I give you my extranet address, and if you still feel this way in the morning, you give me a ring.”</i> You jot it down and pass it her way. <i>“‘Course you’d have to quit working for that douche first.");
	else output("Tempting, but I won’t let you distract me. Not this time.");
	output("”</i>");
	output("\n\nFeruze pouts" + (enemy.lust() < enemy.lustMax() ? ", backing away slowly.":" then nods, throwing herself from the catwalk with a lusty cry. Her flight path is drunken, addled by the frenzied pumping of one hand between her legs.") + " You’re left alone once more.");
	output("\n\n");
	processTime(4);
	CombatManager.genericVictory();
}

//Fuck Her
//Fuck Feruze’s pussy, get dosed with venom, and shoot two loads in her and two loads over her.
public function fuckFeruzesPussy(x:int):void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("You ");
	if(!pc.isCrotchExposed())
	{
		output("peel out of your restrictive garments, not once taking your eyes off the suula’s " + (enemy.lust() >= enemy.lustMax() || enemy.hasStatusEffect("Face Sat") ? "wantonly ":"") + "presented form. When your ");
		if(pc.isErect()) output("[pc.cocks] spring" + (pc.cockTotal() == 1 ? "s":"") + " out, " + (pc.cockTotal() == 1 ? "it’s":"they’re") + " already hard and ready to go.");
		else output("[pc.cocks] flop out, " + (pc.cockTotal() == 1 ? "it’s":"they’re") + " only half hard but growing firmer by the second.");
	}
	else
	{
		output("reach down to your [pc.cocks]");
		if(!pc.isErect()) output(" and stroke the rapidly thickening, firming length" + (pc.cockTotal() > 1 ? "s":"") + ", not once taking your eyes off the suula’s " + (enemy.lust() >= enemy.lustMax() || enemy.hasStatusEffect("Face Sat") ? "wantonly ":"") + "presented form");
		else output(" and stroke the rock-hard length" + (pc.cockTotal() > 1 ? "s":"") + " slowly, building your anticipation while openly ogling the suula’s " + (enemy.lust() >= enemy.lustMax() || enemy.hasStatusEffect("Face Sat") ? "wantonly ":"") + "presented form.");
	}
	if(enemy.lust() < enemy.lustMax()) output(" Feruze smiles at the sight" + (!enemy.hasStatusEffect("Face Sat") ? " and fondles the crotch of her suit until it splits to reveal her golden cunt in all its tentacular glory":" and fondles at her exposed cunt in all its golden, tentacle-ringed glory") + ".");
	else output(" Feruze gasps, wide-eyed and stuffs another finger into her juicing, golden cunt, unashamedly finger-fucking herself.");
	output(" Squelches drift up to your ears while the scent of a very wet girl wafts to your " + (enemy.hasStatusEffect("Face Sat") ? "pussy-saturated ":"") + "nose. ");
	if(pc.cocks[x].cLength() < 7) output("Her cunt would swallow up dick up with ease. You can scarcely imagine how wonderful a pussy that large will feel on your smaller member.");
	else if(pc.cocks[x].cLength() < 17) output("Her cunt would fit very nicely around your cock.");
	else output("Her cunt is the perfect size for your cock. Just big enough enough to accept a meaty member and strain taut around it.");

	var cumQ:Number = pc.cumQ();
	//Tentacle Tail
	if(pc.hasCockTail() && pc.hasParasiteTail()) output("\n\n<i>“F-f-fuck, don’t think I can’t see that sneaky little fuck-parasite you’re carrying around.”</i> Feruze watches your [pc.cockTail] sway back and forth behind you. <i>“If it goes in my ass it’d better make me cum... because if it doesn’t...”</i> She trails off, licking her lips.");
	//Suula dick
	else if(pc.cocks[x].cType == GLOBAL.TYPE_SUULA) output("\n\n<i>“F-f-fuck how could I have known you’d have the perfect dick for me,”</i> Feruze purrs in between pumps. <i>“Nothing better than a nice suula dick to put me into the mood for a womb full of cum! I bet your venom’s nice and strong, isn’t it?”</i>");
	//Huge cumQ
	else if(cumQ >= 10000) output("\n\n<i>“F-f-fuck I can smell all the cum you’re packing.”</i> Feruze gestures to your cock as pre begins to leak from your widening urethra. <i>“Gonna have to hope the sterilex can keep up. D-don’t wanna quit my job ‘cause you got me pregnant.”</i>");
	//Have a dick that’s too big
	else if(pc.biggestCockVolume() > enemy.vaginalCapacity(0)) output("\n\n<i>“F-f-fuck I wish I could fit your biggest dick inside me.”</i> Feruze gestures to your over-sized cock in open desire. <i>“You’d break me in half with a fuck-monster like that. I guess it’s a good thing you brought something more to scale, you fucking " + pc.mf("stud","goddess") + ".”</i>");
	//Multiple dicks
	else if(pc.cockTotal() > 1) output("\n\n<i>“It’s a shame I only have the one pussy,”</i> Feruze purrs in between pumps. <i>“I’d love to sample </i>everything<i> you have to offer, but I suppose we’ll have to settle for the one this time...”</i>");
	//Horsecock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“F-f-fuck I can smell that dick from over here.”</i> Feruze gestures to your equine endowment in open desire, nostrils flaring. <i>“Such a beastly thing. So primal.”</i> Her pussy squelches around her fingers. <i>“I can’t wait to feel it inside me...”</i>");
	//Dogcock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output("\n\n<i>“F-f-fuck I can smell that dog-dick from over here.”</i> Feruze’s nose wrinkles as she drinks it in. <i>“Sooo many of those around, and I never get tired of watching the knots swell up, or feeling one claiming my cunt for the next hour...”</i>");
	//Else
	else output("\n\n<i>“F-f-fuck that looks good.”</i> Feruze’s purrs in between pumps. <i>“Got so hard just from looking at me!”</i> She whines in the back of her throat. <i>“It’ll be so much harder once you put it inside!”</i>");
	//Merge
	output("\n\nYou don’t keep the big girl waiting. Settling in between her legs, you brace against one thick thigh and line your [pc.cockHead " + x + "] up with your other hand, close enough to feel the suula’s heat radiating into your most sensitive skin. She’s wet enough that when she withdraws her fingers, the very air surrounding your girth feels steamy, like if you stayed in place long enough you’d build up a sheen of pussy-scented condensation. You aren’t going to wait long enough to find out.");
	output("\n\n<i>“Yesss,”</i> Feruze hisses through a clenched jaw as you push forward, spreading her lips apart to make room for your throbbing girth. Her tentacles react almost instantly, twirling and curling inward to caress your [pc.cock " + x + "]’s flanks. As you sink deeper, they clutch tighter, almost painfully so. Their every caress is both pleasant and uncomfortable, prickling along the edge of irritation. By the time you " + (!pc.hasKnot(x) ? "hilt yourself":"feel your knot brushing against those tendrils") + ", you’re a little numbed but no less hard.");
	//cockChange here
	pc.cockChange();
	output("\n\nYour confusion must be writ plain on your face.");
	output("\n\nFeruze gasps, hips shuddering, and tries her best to explain. <i>“My venom! It’s my venom! ");
	if(pc.hasCock(GLOBAL.TYPE_SUULA) || pc.race() == "suula") output("You should know! ");
	output("The tendrils are full of it, but don’t worry. It just makes you feel really good and cum really hard, I promise!”</i> She puts up her hands in surrender, then gasps grabs hold of her tits, tugging her nipples fiercely. <i>“Mmmm, no trick. Just normal suula stuff with a little extra. Mine’s wayyy stronger than normal, so make sure you fuck me twice as hard for the trouble!”</i> She moans, <i>“Punish my pussy!”</i>");
	output("\n\nIt figures that the moment you decide to get your dick wet, you thrust it deep into a drug-laced honeypot. The numbness begins to fade quickly, leaving a gentle sort of heat in its wake that builds into a sensation of additional engorgement, like your [pc.cockNoun " + x + "] is getting even fatter and harder. You become very aware of the texture of Feruze’s folds, the way they squeeze when she shifts position. She’s very slick. Her juices stream down your sides to dribble" + (pc.balls < 2 ? " out below":" out onto your [pc.balls], leaving them gleaming with the proof of her desire") + ".");
	output("\n\n<i>“Oh,”</i> you mumble, stunned by how fast-acting the effects are. <i>“You are </i>hot<i>.”</i>");
	output("\n\nFeruze tosses her head and groans delightedly. <i>“Then try moving. I get hotter.”</i>");
	output("\n\nShe already feels like a sweltering pot of sensuality and delight, but you do as you are bid and begin to work your hips back. Friction overwhelms your other senses. For a moment, you lose yourself in the slow slide through Feruze’s golden cunt, savoring the clutching squeezes of her tendrils and the ever-increasing awareness of your own <i>firmness</i>. You feel turgid enough to fuck a hole through armor plating, though you satisfy yourself by burying your titanium-strong boner back into Feruze’s thighs, pounding her pussy with jack-hammer like force. Copious juices spray back to drench your [pc.legOrLegs].");
	output("\n\nIt feels too good to stop and savor. You yank back and pound home again and again. Each stroke is faster than the one before, more impelled by chemical triggers to transform into feverish rutting. Feruze’s cunt squelches happily around your dick. Her tunnel relaxes to better let you slip inside, then grabs hold with every ounce of muscle to try and hold you inside, turning the backstroke into a heavenly cacophony of sensuous bliss. Muscles inside you clench hard enough to make your [pc.cockNoun " + x + "] jerk and twitch.");
	//Cocktail
	if(pc.hasCockTail() && pc.hasParasiteTail()) output("\n\nIt’s at this point that your rear-mounted penis makes the executive decision to forcefully insert itself into the winged woman’s rear entrance, just as predicted. The tail undulates madly with the effort of squeezing in, but after a few seconds of eager pushing, Feruze’s sphincter gives way to your pernicious pushes and lets you burrow inside her backdoor, squeezing reflexively once you’re five or six inches deep.");
	output("\n\nBelatedly, you discover that you’re about to cum.");
	output("\n\n<i>“Ohhhh fuck yessss!”</i> Feruze calls out, feeling your spasming cock expanding. <i>“Give me that cum. Fill me up!”</i> Her tail curls around your [pc.butt] possessively, pushing you deeper into her gushing quim" + (pc.cocks[x].cLength() > 14 ? ". Your [pc.cockHead " + x + "] butts against a ring of muscle inside her, rubbing it until it dilates ever so slightly, awarding you direct access to flood her womb":"") + ". <i>“Cum!”</i>");
	output("\n\nTrapped hilt-deep inside her, you give Feruze exactly what she wants. You couldn’t stop if you wanted to, but right now, you very much want to cum. You want to feel that white-hot torrent of [pc.cumNoun] surging through your body, stretching out your urethra in rhythmic pulses. You crave the effervescent ecstasy of your own puddling juices swirling around your cock in the moment of climax. So instead of thinking or talking or trying to pull out, you grab hold of Feruze’s big, fat, slutty tits and squeeze, groping your way through a cunt" + (pc.hasCockTail() && pc.hasParasiteTail() ? "-and-butt":"") + "-flooding orgasm.");
	if(pc.hasCockTail() && pc.hasParasiteTail()) enemy.loadInAss(pc);
	output("\n\n<i>“Ah ah ahhhh!”</i> the shark-girl gasps");
	if(cumQ >= 3000)
	{
		output(" as her belly begins to rise");
		if(cumQ >= 20000) output(", high-pressure squirts of seed backwashing out of her from the force of your ejaculation");
	}
	else output(" as she feels you letting go");
	output(". <i>“Yes! More!”</i> Her tentacles wrap around your [pc.knotOrSheath " + x + "] like a molten vice, flooding you with what feels like a double dose of erection-inducing venom.");
	output("\n\nIn the aftermath of your climax, you aren’t given the chance to calm down. You’re still horny, and your dripping-wet [pc.cockNounSimple " + x + "] is even more sensitive after orgasm. The velvet tunnel that grips you, soaked in your seed, is even more heavenly than it was a moment ago. ");
	if(pc.hasCockTail() && pc.hasParasiteTail()) output("Your tail refuses to stop thrusting. ");
	output("Your eyes keep trying to roll back in spite of the lack of any friction. What’ll happen when her tail lets you go? What’ll happen when you can fuck this god-tier cunt as hard as you want for as long as you want? You know you’ll find out in seconds, but those seconds take <i>forever</i>.");
	output("\n\n<i>“I’m yours, [pc.name].”</i> The suula’s muscular tail twitches. <i>“Do with me what you will.”</i> The pressure on your back fades away.");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",fuckFeruzesPussy2,x);
}

public function fuckFeruzesPussy2(x:int):void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("You squeeze Feruze’s tits tighter and pound her cunt like a jack-hammer. Your rock-hard, cum-soaked dick flashes bright in the artificial light with every saw in and out of the creampied suula-cunt. Incredible pleasure flashes in your mind with every push in. Ribbons of spent jism spool out from the force of your fucking, but you know there’ll be more. You feel like you could fuck for ages. Like your dick is effortlessly dragging the rest of your body along on its ecstatic journey through her heavenly folds.");
	output("\n\nOrgasm is an inevitably. The only question is whether you’ll fuck Feruze to one along with you before your gift her cunt with another fresh load.");
	output("\n\nThe giggling, moaning shark-girl looks to be close herself. Every impact on her well-fucked pussy causes her to chirp in delight and roll her eyes half-way back. When you pinch her nipples, they stay up there a bit longer, and her mouth opens from the a spike of intense pleasure. Before long, she’s not even looking at you, just crying out and squeezing around your [pc.cock " + x + "]");
	if(pc.hasCockTail() && pc.hasParasiteTail()) output(" and tail");
	output(" like your own personal, shark-girl-shaped fuck-toy.");
	output("\n\n");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) showImage("feruzePussyFuckHorse");
	else showImage("feruzePussyFuck");
	output("Feruze’s eyelids close, and her forehead wrinkles in sudden concentration. She whimpers once, quiet and almost pained-sounding. Then she cums. A hoarse scream tears its way out of her throat while her cunt scissors tight on your [pc.cock " + x + "], muscles rippling wildly, trying to coax you into cumming right along with her.");
	if(pc.cocks[x].cLength() > 14) output(" Her cervix all but vanishes, yawning so wide that your next thrust pops your [pc.cockHead " + x + "] inside with casual ease.");
	output(" The shark-woman’s nipples puff up even more, the tips growing rock hard. Her fingers spasm wildly against the deck as she stares straight up in complete confusion, as if she can’t possible contain both the strength of her orgasm and her own psyche at the same time." + (pc.isBimbo() ? " She’d make a great bimbo!":""));
	output("\n\nThere’s no room for anything but climax.");
	output("\n\nYou’re no better. Hooked by her chemically-stimulating vagina, you feel the familiar tensing prelude to another monster orgasm and devote yourself to fucking her even harder. Her entire body rocks back and forth across the deckplates with the force of your cunt-pounding plunges. Her ass ripples, gleaming with spattered sex-juices");
	if(pc.hasCockTail() && pc.hasParasiteTail()) output(" and cock-tail drool");
	output(", and the screw-happy slut arches her back to the feeling of your first spurt of [pc.cum] pouring into her unprotected womb.");
	output("\n\nNothing else in the galaxy can quite compare to this moment for you, to cumming through a hyper-hard erection into a girl who’s losing her mind over your dick. As you squirt and groan, you thumb the suula’s nipples, reveling in the knowledge that despite being hired to oppose you, she’s thrown that away for a ride on your pussy-creaming cock. As much as her cunt’s aphrodisiac affections have caught you in their mesmeric web, so too is Feruze taken by the joy of being your blissed-out cum-dump. The over-sized, idiotic grin plastered on her face is proof enough of that.");
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",fuckFeruzesPussy3,x);
}

public function fuckFeruzesPussy3(x:int):void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("After your second orgasm, things get a little hazy. You’re still hard - so hard, but the suula’s pussy stops gripping you so tightly, owing to being packed full of cum. Feruze is still conscious - sort of - but she’s not really doing much. Mostly looks at you through hooded eyes and squeezes her tits.");
	output("\n\n<i>“Ummm...”</i> She blinks blearily. <i>“Wow.”</i>");
	output("\n\nYou pull out, hard cock ");
	if(pc.hasCockTail() && pc.hasParasiteTail()) output("and tail-prick ");
	output("glistening. Mixed pussy-juice and [pc.cumNoun] congeal into a fat droplet at the [pc.cockHead " + x + "]. Somehow, you’re still horny. Too hard to think properly, you grab your dick and stroke. The mess of musky lubricants makes your palm feel almost as good as the shark-girl’s cunt, and the ability to squeeze and caress at a moment’s notice. Jacking off shouldn’t feel this good, and you certainly shouldn’t be able to be wringing fat drops of pre out already.");
	output("\n\nBut here you are.");
	output("\n\nFeruze moans, <i>“Mmm, dick,”</i> and leans forward, eyes fixated square on your cock. <i>“F-f-fucked me so good.”</i> She purses her lips and leans forward to plant a kiss on your tender flesh, just beneath the [pc.cockHead " + x + "].");
	output("\n\nYou cum. Long ribbons of the stuff spray out into her hair and dribble onto her upturned face. The fuck-drunk suula recoils at first, then closes her eyes and opens wide, letting you spray the rest across her nose, cheeks, and forehead. Of course she catches some in her mouth, holding it there while you bust the rest of your enormous, creamy nut onto her features.");
	output("\n\nFinally feeling some modest degree of satisfaction, you slump back onto your [pc.butt], [pc.cockNoun " + x + "] still hard and twitching, dribbling the last of your orgasm out in the form of a single [pc.cumGem] droplet. You’re almost hyperventilating, you realize. Sweat coats you in a thin sheen. You were fucking your heart out, and you could really use a break after all that.");
	output("\n\nFeruze giggles and shovels the gooey stuff out of her eyes and into her mouth with one sordid lick after another. <i>“Mmmm, now that’s what I’m talking about.”</i> She blinks a few times, then looks your way, gasping when she sees that you’re still hard and aching. <i>“Oooooh nooooo,”</i> the [pc.cumNoun]-covered suula gasps, crawling closer. <i>“If I leave you this hard, you’ll never make it out of here in one piece.”</i> She touches the collar of her suit, and it peels away down to the waist, exposing the heaving globes of her chest in all their glory. <i>“And I don’t think I want to lose to you again, hot stuff.”</i>");
	output("\n\nSmiling sweetly, Feruze wraps your [pc.cockNoun " + x + "] in the cushy embrace of her wobbling tits. Her hands all but disappear into the hyper-soft skin, and you can feel why. Her tits feel completely natural, supple and spongy enough that one would be enough to encircle your length in a delightful tit-prison. Both are almost too good to be true. You tip over onto your back and gasp from the supernatural levels of excitement coursing through you. Your [pc.cockNoun " + x + "] throbs. Spurts of pre trickle out, mixing with her sweat as your body rushes to brew up <i>another</i> batch of cum.");
	output("\n\n<i>“I should’ve kept better control over my tentacles,”</i> Feruze admits, pushing her tits up and down, sliding you through the slick valley of her cleavage. <i>“It’ll take a while to burn that much venom out of your system, but we’re in this together now, aren’t we?”</i> She bounces her boobs off your crotch and slides them up your shaft. Squeezing them tightly, Feruze allows gravity to pull them down again, pausing halfway to lift one and then the other to create a back-and-forth hell of pleasure. <i>“You’re a fucking champion in every definition of the word.”</i> She pushes both tits down far enough for your [pc.cockHead " + x + "] to pop out of the top. She kisses it. <i>“And you’re going to get to cum all over me until you finally go soft.”</i> She licks a fresh bead of pre-cum. <i>“Even if it takes me all day.”</i>");
	output("\n\nFrom nowhere, an explosion of ecstasy compels you to fire another load for Feruze, this time glazing her cleavage in heavy puddles of [pc.cumNoun]. She pushes them the entire way down so that you can enjoy the warmth and gentle squeeze, watching your ejaculate fire into the air and splatter across her upper curve of her heaving globes. <i>“Nice one, [pc.Mister] Steele! But it feels like you’re not getting any softer, are you?”</i>");
	output("\n\nYou shake your head and close your eyes as the tits start to bounce once more.");
	sweatyDebuff(1);
	processTime(30);
	pc.orgasm();
	pc.lust(200);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFeruzesPussy4,x);
}

public function fuckFeruzesPussy4(x:int):void
{
	clearOutput();
	showFeruze();
	author("Fenoxo");
	output("You wake up next to a snoring, drenched Feruze. Her drone is buzzing around on perimeter watch" + (pc.hasCombatDrone(true) ? " along with yours":"") + ". You feel well-rested and exceedingly satisfied sexually, and judging by the contented girl’s snores, she feels similarly.");
	output("\n\nYou gather your things and make ready to leave when you notice a message in your Codex. It’s from Feruze. Clicking play summons a holo the disheveled shark-woman.");
	output("\n\n<i>“Don’t get the wrong idea about what we did. There was enough venom floating around to overcome even my tolerance - I think. Next time we meet, don’t expect me to start coddling your dick and making kissy faces at you.”</i> The projected image pauses while Feruze squirms around. <i>“Unless you manage to beat me and fuck me again. I don’t think you will though. I think I’ve got your dick trained by now. Next time, you’ll be begging me for a fuck.”</i> She winks, and the recording ends.");
	output("\n\nYou look to her unconscious body once more. Getting the next probe is going to be fun.");
	output("\n\n");
	IncrementFlag("FERUZE_SEXED");
	IncrementFlag("FERUZE_CAME_INSIDE");
	CombatManager.genericVictory();
}

//Trib Her
//Trib, venom apology, tendrils jerk clit to orgasm, then Feruze sucks cunt
public function tribFeruze():void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("Refusing to look a gift-shark in the mouth, you " + (!pc.isCrotchExposed() ? "shuck your bottoms and ":"") + "stride forward to the waiting suula" + (enemy.hasStatusEffect("Face Sat") ? " and her gleaming delta.":". She immediately plunges a hand down to the crotch of her suit. A single caress releases some hidden catch, and the paper-thin fabric scissors open to expose the gleaming delta beneath.") + " She’s quite juicy. Her pungent scent intensifies with your every forward step until your own aroma wafts up to stir into the pheromonal soup.");
	output("\n\nFeruze licks at her lips with intentional slowness. Spreading her legs wide, she presents her puffy, tentacle-lined pussy for inspection. The lips part ever so slightly to reveal a bulbous clit and a hint of the dusky interior. A bead of clear excitement races down one to make a break for her inner thigh. <i>“" + (enemy.lust() < enemy.lustMax() ? "I think I know what you want.":"Mmmm, I know what you want.") + "”</i> Eyes twinkling, the mercenary maiden grabs her ankle and lifts it into the air, spreading herself so wide that her cunt modestly gapes. <i>“" + (enemy.lust() < enemy.lustMax() ? "Get in here then.":"You wanna rub pussies. You wanna be a sloppy slut with me. Go on. Do it. Fuck me!") + "”</i>");
	output("\n\nYou sidle on in, ");
	if(pc.legCount > 1) output("one [pc.leg] against her generous thigh, then another, your frame arranged to properly scissor" + (silly ? " me timbers, YARR!":"."));
	else output("carefully contorting to line your monopedal form up between her generous thighs for proper scissoring.");
	output(" Your juicing genitals haven’t yet made contact, but they’re close - close enough that you can feel the combined moisture thickening the air with sexual humidity. A tiny scooch forward, and you’ll be fucking Feruze properly" + (pc.hasCock() ? " - well, properly for a woman. Your [pc.cocks] can wait this one out":"") + ".");
	output("\n\nYou pause there to gather your courage. Your breath is coming hot and fast with anticipation. In a moment, you’ll be dousing your cousin’s expensive mercenary in sapphic pleasure, but for the moment you want to savor the ecstatic thrill. This gorgeous specimen of femininity is spreading her legs for <i>you</i>. She’s looking at you longingly, waiting for the moment you deign to press your [pc.vaginaNoun] against her and grind into nirvana.");
	output("\n\nFeruze is not kept waiting long. You hitch your hips and gently squeeze yourself up against her. She gasps in delight, and you chirp right along with her. The contact of warm skin on warm skin is electric, and her tentacles are everywhere, gently ruffling your folds, slipping in slow circles around your [pc.clits].");
	if(pc.totalVaginas() > 1) output(" They even wiggle against your other quim" + (pc.totalVaginas() > 2 ? "s":"") + ".");
	output(" Her fluids are just slightly slicker than your own, reducing the friction slightly but making everything feel that much <i>wetter</i> in exchange.");

	output("\n\nOf course, your [pc.vaginas] " + (pc.totalVaginas() == 1 ? "is":"are") + " starting to tingle oddly. Prickling numbness races up and down your vulva" + (pc.totalVaginas() > 1 ? "e":"") + ", spreading out from where the tendrils touched you. You look up in confusion to find Feruze giggling slightly, thumbing at a nipple one-handed.");

	output("\n\n<i>“Sorry ‘bout that sweetness, but it’s just the suula venom getting you all warmed up.");
	if(pc.hasCock(GLOBAL.TYPE_SUULA) || pc.race() == "suula" || pc.hasVagina(GLOBAL.TYPE_SUULA)) output(" Of course you should know that.");
	output("”</i> One of her knees hooks around your [pc.leg] to pin you in place while she swivels her hips in short, shuddering circles. <i>“It uh - mmmm... It’ll feel really good in a sec. It just makes you cum really hard and really easy.”</i> She bats her eyelashes. <i>“So hard. Nobody has a bad fuck with a suula." + (pc.hasVagina(GLOBAL.TYPE_SUULA) ? " I sure won’t!":"") + "”</i>");

	output("\n\nThe blossoming heat that erupts in the wake of the bizarre numbness is proof enough of her claim - or at least a portion of it. Your [pc.vaginas] " + (pc.totalVaginas() == 1 ? "is":"are") + " warmer and wetter - or maybe just more aware of the wetness. You can certainly perceive Feruze’s cunt in greater detail. When you mash your sodden slit" + (pc.totalVaginas() > 1 ? "s":"") + " up against her, you swear you can feel the pores of her skin through [pc.oneClit]. Somehow even that feels sensual. You can experience her marvelous pussy in greater detail" + (pc.isBimbo() ? " than even the most bimbofied of bimbosluts":" than ever before") + ". It might feel like a slowly building bonfire between your [pc.thighs], but you like it.");
	output("\n\n<i>“Okay,”</i> you admit, <i>“that feels pretty great.”</i>");
	output("\n\nFeruze smiles too sweetly and smushes her pussy hard into yours, pressuring small rivers of girl-cum to trickle down the crack of her ass. <i>“Just pretty great?”</i> The tentacles swipe back and forth across every inch of skin they can get it. A few even snake into your clitoral hood to tickle the hypersensitive flesh inside." + (pc.hasVagina(GLOBAL.TYPE_SUULA) ? " Others seek out your own tendrils to wrap into tight, clutching double-helixes. Their intoxicating grip makes it impossible to gyrate very much but fills you with so much drug-augmented bliss that ride up to the very edge of blacking out.":""));
	output("\n\nYou can’t keep the moan out of your voice when you admit, <i>“Really fucking great! Stars, your pussy is so fucking hot!”</i> You wobble dizzily and press back into Feruze. <i>“And so fucking wet!”</i> Your [pc.vaginas] spasm unexpectedly but not unpleasantly, the walls of your channel" + (pc.totalVaginas() > 1 ? "s":"") + " grinding against one another with gleeful, involuntarily pressure until [pc.girlCum] sluices through the middle. Your crotch is absolutely, ruinously engorged. Everything down there is a sensuous, sopping mess, so badly afflicted that you can almost believe that you’re sponging up all the love-juice directly into your increasingly thick, sensitive lips.");
	output("\n\n<i>“Ah! Uh huh!”</i> Feruze coos, tail swishing behind, clanging noisily. <i>“F-f-fuck, your cunt" + (pc.totalVaginas() > 1 ? "s are":" is") + " as good as the rest of you. A proper fuckable twat!”</i> She gasps and slaps her hips against you once more. <i>“You’re gonna cum so hard in a sec, but I can make it better if you want. Can make it hotter and wetter.”</i> Her breasts heave and wobble in excitement as her amber cheeks flush. <i>“Say yes.”</i> She throws back her head and murmurs something unintelligible.");
	output("\n\nYou say, <i>“Yes!”</i> without thinking, half from how good it all feels, half from desire to experience more of this.");
	output("\n\n<i>“Mmm, brace yourself,”</i> the shark-woman whispers a moment before exposing you to a supernova of pure, incomprehensible pleasure. Her tendrils converge on your [pc.clits]" + (pc.totalClits() > 1 ? " one at a time":"") + " and wrap " + (pc.totalClits() == 1 ? "it":"them") + " in hot, slick cocoons, but they do not simply hold on. They stroke. They squeeze in arrhythmic bursts of confusing yet sensuous stimulation. They take your [pc.vaginas] by the horn" + (pc.totalVaginas() > 1 ? "s":"") + " and ride them into an orgasm so vast and all-encompassing that you forget about everything but pulsing, clenching bliss.");

	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tribFeruze2);
}

public function tribFeruze2():void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("When you come to, you’re still puss-to-puss with Feruze, jerking your hips in shaky undulations. Pinkish white starbursts go off behind your eyes while your voice lilts in whorish delight. The shark-girl is just as turned on and just as wet" + (pc.isSquirter() ? ", even glazed in a liberal coat of your squirted secretions":", maybe moreso, her thighs glazed in thick coats of her dribbling secretion") + ".");
	output("\n\n<i>“Mmm,”</i> you groan, not entirely in control of your voice.");

	output("\n\nFeruze smiles, stretching out to ");
	if(pc.clitLength > 2)
	{
		output("jerk on " + (pc.totalClits() > 1 ? "an":"your") + " oversized clit");
	}
	else output("rub " + (pc.totalClits() == 1 ? "your":"a") + " throbbing clitty");
	output(" until you squeal. <i>“You’re fucking hot like that, [pc.name].”</i> She pulls her legs and cunt away, revealing an enormous web of half-dried fluid and a smear of fresh juices, but her hand remains. <i>“Gotta get a taste,”</i> she murmurs. <i>“Who knows when I’ll get another chance.”</i>");
	output("\n\nYou nod excitedly. <i>“Lick me.”</i>" + (pc.legCount > 1 ? " Your [pc.legs] fall open even wider.":" Your [pc.butt] lifts off the ground in anticipation.") + " <i>“Suck my cunt. Suck my fucking pussy!”</i>");
	output("\n\nFeruze shudders at your order and slinks forward face first. <i>“Of course.”</i> Her hair is damp with sweat and matted, but she’s never looked prettier. <i>“You’re the fucking champion. Took me apart on the battlefield, and you were still gracious enough to return my affections.”</i> She kisses your pussy so soulfully that you swear her tongue is transmitting raw affection directly into your nerves. <i>“I know you’re all hopped on venom, but I’ll lick you through it.”</i> Her lips glisten with your [pc.girlCum]. <i>“And when I win next time... I’ll get you to do this for me.”</i>");
	output("\n\nThe tongue inside you licks you to another orgasm, one that has you screaming ‘YES’ at the top of your lungs over and over again. Still, Feruze refuses to stop licking. Her face might as well be part of your [pc.vagina], her nose burrowed so deeply that she can’t help but indulge in great big breaths of feminine musk. One arm wraps around the small of your back to keep you from twitching and writhing off the side of the scaffold. The other cups one cheek of your [pc.butt], kneading it excitedly.");
	output("\n\nBy the third such climax, you stop trying to sit up and see what’s going on. You just lay there, occasionally thrusting your hips, wallowing in the sensation of Feruze’s worship. Her tongue doesn’t seem to mind. If anything, your apparent enjoyment of her affections encourages her to try harder, to kiss and lick more aggressively. When she slurps [pc.oneClit] into her mouth and swirls her tongue around it, you black out once more...");
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",tribFeruze3);
}

public function tribFeruze3():void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");

	output("You awaken with a smile on your face and a lingering tingle of satisfaction between your [pc.thighs]. Your head is on the warmest, softest pillow: Feruze’s breast. She’s snoring with a smile on her face while her drone buzzes around in the air, keeping watch over her slumbering form. It doesn’t react when you scamper up onto your [pc.footOrFeet] and gather your things. Nor does it stop you from moving on.");
	output("\n\nYour Codex, however beeps with an alert about a stored message. When you play it, Feruze’s face materializes in holographic form, covered in what can only be your juices. <i>“Hey, just so you know, I’m pretty sure I might have tagged myself with a bit of venom there too, so don’t read too much into that little tryst. Drugs are crazy like that! We’ll have to be enemies the next time we run into each other again, but I promise that if I win, I’ll be every bit as nice to you as you were to me.”</i> Her tongue snakes across her lips, savoring the remnants of your flavor. <i>“And if I lose again... well, that won’t be so bad, will it? Just be careful out there. If anyone’s going to pin you to the ground, it’s going to be me.”</i>");
	output("\n\nThe message blinks off, leaving you more or less alone with your thoughts.");
	processTime(60);
	pc.applyPussyDrenched();
	pc.orgasm();
	IncrementFlag("FERUZE_SEXED");
	output("\n\n");
	CombatManager.genericVictory();
}

//Titfuck/Grind
//For dicks too big to fuck her. Discover her suit is REALLY slick and fuck the bodycondom-clad suula’s tits (and arms and legs if big enough)
public function titfuckAndGrindFeruze(x:int):void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	if(!pc.isCrotchExposed()) output("A few twists and tugs and your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " allowed to " + (!pc.isErect() ? "spill out, lengthening with each beat of your racing heart until you’re tumescent enough to rise and thrust meaningfully toward the submitting suula.":"thrust out of the terribly restrictive confinement, able to throb and just meaningfully at the submitting suula.") + " ");
	output("You grab " + (pc.cockTotal() > 1 ? "one":"the") + " pillar of cockmeat around the [pc.knot " + x + "] and gently stroke upward, lifting it higher as you work your way to the [pc.cockHead " + x + "], so far away.");

	//8’+
	if(pc.cocks[x].cLength() >= 12*8) output("\n\n<i>“H-holy fuck that’s a monster cock!”</i> Feruze gapes in stunned awe, jaw working back and forth as her brain tries to make sense of the absolute enormity of your erection. <i>“I don’t know how you can walk around with all that gorgeous dick hanging there, but f-fuck. You don’t need to get this probe. You need to start recording you fucking. Take a little Throbb and you’d put Tank Kannon out of business. Be the " + pc.mf("King","Queen") + " of ultraporn.”</i> She licks her lips. <i>“I’d be your first customer.”</i>");
	//5’+
	else if(pc.cocks[x].cLength() >= 12*5) output("\n\n<i>“Holy fuck that’s a big cock.”</i> Feruze gapes in stunned awe. <i>“You don’t even need the probes. You could just do porn. Lounge around and holo yourself getting worshiped by a half-dozen cock-addicted fuck-sluts.”</i> She licks her lips. <i>“Glaze tit after tit and get to blow all your royalties on cute outfits for the ones that stick around.”</i>");
	//Horsedick special
	else if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Fuck yes, that’s a huge horse-cock.”</i> Feruze gapes in surprise, nostrils flaring. <i>“I love the scent of these - the musk. The way they’re just as fat and turgid along the entire length, ribbed with a big juicy ring in the middle to make my pussy pop as it saws in and out...”</i> She moans. <i>“Betcha every horse-pussy on station is just a little wetter with this baby around, pouring out pheromones for the air circulators to blow around every level.”</i>");
	//Dogdick special
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output("\n\n<i>“Fuck, aren’t you just the biggest-dicked " + pc.mf("bulldog","bitch") + " on station.”</i> Feruze’s eyebrows lift as she takes in the entirety of your length. <i>“Shame you need a special kind of size-queen to bury that bone... and the knot. That’s a hip-splitter right there. Probably gets wider than the babies you fuck into girls.”</i>");
	// Biggus Cattus (potential?) - Thanks, William!
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“Ohhh fuck yeah! Bet you had those cyber-kitties creaming themselves at the sight of this beast. Your nubs are probably bigger than the dicks they replaced.”</i> Feruze brazenly ogles every inch of your presented length. Chewing her lip, she blushes brighter when your <i>“barbs”</i> flare wider. <i>“You could mount a kaithrit on each of them and bring them off better than their males ever could, all with this single... magnificent... dick.”</i>");
	//3’6”</i>+
	else if(pc.cocks[x].cLength() >= 3*12+6) output("\n\n<i>“Oh wow that’s a big fucking dick.”</i> Feruze gapes in surprise. <i>“I could tell it was big but not </i>that<i> big. You must be sweet on leithans, huh? Those big ‘taur bitches are the only species I know built to take dick like that. Probably having a dozen of waddling broodmares stumbling around with your half-breeds back home.”</i>");
	//Else
	else output("\n\n<i>“Mmm, now that’s what I call a bitch-breaking dick.”</i> Feruze’s eyes widen in delight and surprise. <i>“Cock like that’d ruin bigger, sluttier suulas. Could probably tempt a galotian to give up her core for a single night with it. Watch her sense of propriety melt into wanton cum-thirst. That’s the power of a big cock.”</i>");
	//Merge
	output("\n\nReveling in her adoring words, you step forward to place your [pc.cock " + x + "] directly into the lusty mercenary’s upraised palms. The weight of it surprises her; her arms buckle slightly. An incredulous smile reveals the gleaming white triangles of her teeth, as sharp as they are pleased. Shifting slightly, the shark-woman braces her tail against the deck to crawl closer, her hands gently exploring your presented mast, tracing the veins here or there");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output(", cupping the medial ring with a happy coo");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE) output(", giving your knot a none-too-subtle squeeze");
	output(". She smiles sweetly, <i>“You got so hard for me.”</i> Tilting her head, she kisses your urethral bulge, her tongue slipping out to savor the salt-tang of your skin. <i>“And you can’t even fuck me.”</i> She pouts up from around the inhumanly wide erection. <i>“But you can fuck my tits. You can fuck my tits until you’re smearing my face with cum.”</i>");
	//Bimbo
	if(pc.isBimbo()) output("\n\nTrilling out a happy giggle of your own, you chirp, <i>“Of course! I’m gonna make you like, cum yourself silly too! It’ll be so fun seeing your eyes roll back while you’re soaking in spooge!”</i>");
	//Bro
	else if(pc.isBro()) output("\n\nYou snort, <i>“Was gonna anyway,”</i> but the apparent happiness on your face and the mighty twitch of approval from your cock communicates your approval better than words ever could.");
	//Nice
	else if(pc.isNice()) output("\n\nYou say, <i>“I’m glad we’re on the same page. I’ve been waiting for a chance to do this since I saw you.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou wink back at her. <i>“I was thinking the same thing, angel. You sure you didn’t come down from heaven to give me the titfuck of a lifetime?”</i>");
	//Hard
	else output("\n\nYou answer, <i>“Of course I can, and I will.”</i>");
	//Merge
	output("\n\n<i>“Oh yesss,”</i> Feruze hisses, leaning back to raise her breasts higher. They wobble slightly under their own weight, the shrink-wrap of her suit insufficient to fully support their mass. One hand still reverently exploring, she guides your [pc.cock " + x + "] down into the gleaming valley with the other. It comes as a pleasant surprise that her exotic garment doesn’t feel sticky like rubber or latex. It’s oily and slick. When you graze the side of one cushy breast, you’re treated to a slow slide down low-friction bliss. Your ");
	if(pc.hasKnees() && pc.legCount > 1) output("knees almost buckle");
	else output("[pc.legOrLegs] almost give" + (pc.legCount == 1 ? "s":"") + " out");
	output(" as you’re squeezed into the middle.");
	output("\n\nA reflexive impulse thrusts your [pc.hips] forward, plowing your [pc.cock " + x + "] through the shark-woman’s heavenly mounds forcefully enough to smack your [pc.cockHead " + x + "] into her flushed cheek. She recoils, tits jiggling, and stares up at you in shock and... adoration?");
	output("\n\n<i>“Take what you want,”</i> Feruze gasps, grabbing her tits and squeezing them tightly enough to slow your humping - and briefly stun you with the pleasure of their pillowy squeezing. <i>“You won it fair and square.”</i> She tips her head back and tilts to the side to give you a proper lick, her voice vibrating through your shaft in a muffled moan. <i>“You don’t just have a champion dick. You are a champion. You took this big, bad suula mercenary down and made her juice herself to thought of servicing such a potent dick. And now you get to own my tits for the next for the next few hours. They’re yours. Use them.”</i> Her fingers dance across her nipples, plucking anxiously at them. <i>“Use me.”</i>");
	output("\n\nBreathing hard, you grab the sides of Feruze’s breasts, feeling her heart hammering through them, and <i>push</i>. You plow your [pc.cock " + x + "] through the euphoric vise while " + pc.mf("groaning in sensuous satisfaction","moaning like a well-fucked whore") + ", not entirely able to comprehend how good it feels to take her tits all the way to your [pc.knotOrSheath " + x + "]. This time she’s ready. The orange-striped shark’s lips are the only thing you bump into on the other side. They kiss and suck. They guide a long, wet tongue into drawing figure eights between the veins.");
	output("\n\nYou ache for more, but with no more dick to thrust into those glorious globes, you’re forced to reverse course, trailing spit and kisses the entire way. You saw backwards, leaving to Feruze look on with something like disappointment. She licks your residue from her lips like an addict chasing one last hit, her eyes wide and dilated. Faintly you hear the sound of sloppy squelching, and you realize where her hands have gone now that you’ve taken control of her tits - straight into the sopping, alien honey-pot between her legs.");
	//Bimbo
	if(pc.isBimbo()) output("\n\nYou giggle and realize that you won’t have to help her cum after all! She can do it all on her own, so long as you keep letting her kiss and suck on the big fat cock she’s so enamored of.");
	//Merge
	output("\n\n<i>“More,”</i> Feruze cries. <i>“Fuck my tits more!”</i>");
	var cumQ:Number = pc.cumQ();
	output("\n\nYou give her exactly what she wants, squeezing her cushy mounds until your fingers all but disappear into the spongy flesh, then pump back through the slippery canyon. Your [pc.cock " + x + "] smothers the mercenary’s sultry visage with its heaving bulk. She reacts much as you would expect: with a louder, wetter sound from below and gurgling, sucking delight above. Feruze works your cock so ecstatically that the underside is almost completely glazed in spit. When you draw back, her face shines with a layer of it" + (cumQ > 100 ? " swirls into your drooling pre":"") + ". She hums in pleasure and watches raptly when your [pc.cockHead " + x + "] withdraws into her pillowy bosom, waiting for it to emerge with pursed lips and flaring nostrils.");
	output("\n\nMinutes pass with only the slick sounds of female masturbation and the rhythmic slap of heaving tits smacking into your [pc.belly]. They wobble eye-catchingly, almost hypnotically You pinch and pull the nipples sometimes. Other times you smush Feruze’s tits into a tighter vise. You allow them to fall apart in order to better behold your pulsating boner, then wrap yourself back up in tight, hot, suula-tit, redoubling the force of your thrusts. Your masturbating cock-receptacle tilts her head this way and that, her eyes closed and happy, collecting ");
	if(cumQ < 25) output("dribbles");
	else if(cumQ < 1000) output("streams");
	else if(cumQ < 5000) output("ceaseless flows");
	else output("thick waves");
	output(" of syrupy pre on her cheeks. She wants the cum you can feel well up inside you. She wants it all over her.");

	//Bone dry
	if(cumQ < 5)
	{
		output("\n\nIf only you weren’t so free with your affections. You climax, but it’s almost a dry orgasm. Dribbles and trickles and [pc.cumNoun] leak out on the shark-girl’s forehead into a weak puddle. The bulk of your sexual juices are undoubtedly plastered elsewhere on Zheng Shi or its inhabitants. Still, the suula’s eyes cross to watch what you offer emerging, and at the sight of it, she shudders into a squirting peak of her own, sending slick dribbles through the catwalk’s grating to rain below.");
	}
	//Normal
	else if(cumQ < 150) output("\n\nYou climax. Spurting out your [pc.cumNoun] directly onto Feruze’s forehead, you hold still and give her the privilege of moving around to catch the individual ropes in different places. A few on her cheeks, one across the bridge of her nose. She even rolls out her tongue to gather the last [pc.cumFlavor] dregs. It’s swallowing that load that puts her over the edge herself. Her eyes cross and her arm shudders jerkily while dribbles of squirting pussyjuice slip through the catwalk grating to rain over the foundry below.");
	//Big boi
	else if(cumQ < 1000)
	{
		output("\n\nFeruze came to the right person. You spurt your [pc.cum] in long, heavy ropes that spatter in starbursts wherever they land. The first explodes across her forehead, spreading from her eyebrows up into her hair, and by the time she’s taking the second on her cheek, the suula reaches a squirting climax of her own, spraying pussy-juice through the grating to rain down on the foundry below. Her mouth falls open and is summarily filled by your [pc.cock " + x + "], her lips painted as well. Yet you always seem to have more - more than enough to coat her other cheek and plaster her hair beneath a [pc.cumColor] helmet.");
		enemy.applyCumSoaked();
	}
	//huge boi
	else
	{
		output("\n\nFeruze has no idea how lucky she is to have found you. Spraying [pc.cum] in a long, torrid lance, you paint her from the top of her hairline to her eyebrows, the fuckjuice falling so thick that ropes of it roll down into her eyes, forcing them closed. Her mouth falls open in an ecstatic scream only to be muffled by a burbling deluge of jaw-flooding spooge. You can hear her pussy squirting and spraying, but you pay it little mind, intent on basting this big-titted mercenary completely. You squeeze her wobbling boobs tight to wring out more and encase her hair in a matted, [pc.cumColor] helmet. Then you draw back to fire " + (cumQ >= 10000 ? "more":"the last") + " jets across the orbs that brought you so much pleasure. Plenty pools in her cleavage, but most spills onto the hot peaks of her nipples, creating volcano-like flows of sperm, racing to glaze as much shine-encased breast as possible.");
		//Extrahuge boy - appended to previous
		if(cumQ >= 10000)
		{
			output("\n\nThe shark-woman finishes cumming long before you. She collapses back under the tidal wave of [pc.cum] you’ve buried her in and moans in confused, semi-satisfied lust. Her fingers scoop up cupfuls of the stuff as she tries to make sense of your absurd orgasm. All the while, you’re still going, assaulting her curvaceous form with torrential outpourings of seed. Feruze gulps down some of it, then giggles insanely. <i>“So much cum! No wonder I lost to you. You’re a fucking sex god!”</i> She begins to shovel as much as she can between her thighs, pushing it in until just as much as squirting out around her fingers as is creampieing in. <i>“F-f-fuuuck that feels good.”</i>");
			output("\n\nYou assist her by spending the last of your orgasm right there, at the junction of her thighs. Your [pc.cockHead " + x + "] brushes aside her fingers, and you allow three massive pulses to fire into her, visibly puffing up her belly from the volume. <i>“There,”</i> you say, <i>“is that what you wanted?”</i>");
			output("\n\nFeruze answers by cumming again.");
		}
		enemy.applyCumSoaked();
	}
	//Merge
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",titfuckAndGrindFeruze2,x);
}

public function titfuckAndGrindFeruze2(x:int):void
{
	clearOutput();
	showFeruze(true);
	author("Fenoxo");
	output("Satisfied, you make ready to gather your things when Feruze’s sex-scented fingers grab you by the [pc.leg]. <i>“Wait,”</i> she begs.");
	output("\n\nYou stop, looking down at her in confusion. Concern is writ plain on her sopping features.");
	output("\n\n<i>“There’s some nasty pirates in there. [rival.name] had a prototype stealth field to slip past them, but you’ll need to be ready.”</i> She shudders with an aftershock of pleasure. <i>“I might have " + (pc.balls > 1 ? "emptied your balls":"drained you dry") + ", but you need to be rested up if you’re going to face them. I need... a rematch. I want a chance to beat you, and maybe pin you under me.”</i> Feruze’s golden cheeks are almost crimson. <i>“Besides, if you’re out of the running, I’m out of a job. Be careful.”</i> Her fingers release your [pc.leg]. <i>“Be careful, [pc.misterMiss] big-dick CEO.”</i>");
	output("\n\nYou nod and watch the suula stumble up onto her feet");
	if(enemy.hasStatusEffect("Cum Soaked")) output(", dripping everywhere");
	output(". She waves drunkenly, then launches herself over the railing." + (enemy.hasStatusEffect("Cum Soaked") ? " Every flap of her wings dislodges a rain of your DNA onto the foundry below.":""));
	output("\n\n");
	processTime(10);
	IncrementFlag("FERUZE_SEXED");
	IncrementFlag("FERUZE_BIG_DICK_TITFUCKED");
	CombatManager.genericVictory();
}

/* 9999 - procs after getting probe!
output("\n\nIf you won cousin email");
output("\n\nI bet you thought you beat me this time. Well too bad, mutt. See, I didn’t quite crack the door, but I did compromise enough of the onboard security system to split a copy of the ship’s security feed to my tablet. I wouldn’t have needed to if they didn’t have really good security, for pirate scum, but I’m not going to let a little thing like that stop me. But who cares about pirates? What’s important is that you accessing the probe delivered the coordinates directly to me from the comfort of my own ship. By the next time I see you, I’ll already have the next probe, and Feruze will be properly prepared.");

output("\n\nCya snotbag,");
output("\n\n[rival.name]");
*/