//By Fenbutt

//Milo Boss
//Milodan War-Alpha
//Comes with standard lacky sidekick
//8’2" tall
//Shield Tech Spec.
//Accessory is shield bracers (slightly worse than feruzes)
//Wears Pyrite Heavy Industries jumpsuit (red/white)
//White fur, blue (open to change on this) mohawk
//Violet eyes
//Black cat/dog hybrid dick - knot + nubs & apple-sized balls
//At 100% lust, suit splits open with the force of his erection... and his lust max raises to 200. PHASE 2 BOIS!
//HP defeats also give him a boner, but no phase 2 fight happens (can use phase 2 bust for post-combat winscreen)
//Poison Gas grenade

//Post Combat
//(Loss) (Omni) Disables Ula and her reinforcements with a gas grenade. Makes you watch him fuck Ula before you’re knocked out.
//(Win) Ula returns with reinforcements. The milos are disabled, and into thankees
public function showWarAlpha(nude:Boolean = false, extras:String = ""):void
{
	if(extras == "") showBust("WAR_ALPHA" + (nude ? "_NUDE":""));
	else showBust("WAR_ALPHA" + (nude ? "_NUDE":""),extras);
	showName("MILODAN\nWAR-ALPHA");
}
//Encounter War-Alpha
public function encounterWarAlpha():void
{
	clearOutput();
	author("Fenoxo");
	showName("MILODANS\n& ULA");
	showBust("WAR_ALPHA","ULA_NUDE");
	output("You burst through the curtains and into the Chieftain’s bedroom where quite a scene is unfolding. The old korg himself is tied up and propped against the wall like a piece of broken furniture, but more pressing is the scene on the bed: a grinning, blue-haired milodan has Ula naked and pinned into the furs, his crotch bulging with wicked intent. Another saber-toothed cat-man with his crotchguard wide-open squats above her, his cock already released to dangle above her face.");
	output("\n\n<i>“[pc.name]!”</i> the korgonne princess squeaks at your arrival.");
	output("\n\nHer captors whirl around. The blue-haired one (who seems to be the leader) reluctantly lets go of Ula and thumbs his shield belt on. <i>“You! You’re the outsider that’s been giving my men so much trouble.”</i> He springs off the bed while his henchman zips up. <i>“Give up, and we won’t make it hurt too bad. Struggle...”</i> he shrugs, <i>“... and I can’t make any promises.”</i>");
	output("\n\nGiving up is not an option. <b>You’ll have to fight!</b>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",fightTheWarAlphaBooooi);
}

//[Fight]
public function fightTheWarAlphaBooooi():void
{
	clearOutput();
	showWarAlpha(false,"MILODANMALE");
	author("Fenoxo");
	output("Ula bursts through the eight foot tall beast-man’s thighs the moment his attention is entirely on you, dashing through the curtain and around the corner before anyone can so much as make a grab for her tail. <i>“" + (korgiTranslate() ? "I’ll get help! Save the Chief!":"Help finding! Save Chief!") + "”</i>");
	output("\n\n<i>“Should I go after her, Alpha?”</i> the henchman asks, coming to stand beside his commander.");
	output("\n\nThe mohawked ‘alpha’ shakes his head dismissively. <i>“She has nowhere to run. Once we yank this thorn from our collective paws, it’ll only be a matter of time before I can have a sample of her.”</i> He shivers. <i>“That bitch smells better than mulled wine.”</i> Yanking a modern-style plasma pistol from a well-worn leather holster, her says, <i>“This won’t take long.”</i>");
	processTime(2);
	clearMenu();
	//actually start dis shit.
	var tEnemy:MilodanWarAlpha = new MilodanWarAlpha();
	var tEnemy2:MilodanMale = new MilodanMale();
	tEnemy2.wargiiQuestConfigure();
	tEnemy2.long = "This milodan is decked out in a light suit of combat armor. He brandishes a shock baton in one hand and a laser pistol in the other. Both look brand new and undamaged, ready to dish out plenty of pain. The brute beneath all the weaponry is a typical example of his species: tall and corded with thick ropes of muscle. Large fangs jut over his lower lip as he circles you, looking for an opening.";
	tEnemy2.HPMod = 30;
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy,tEnemy2);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(pcBeatsUpAMilo);
	CombatManager.lossScene(miloBossManWinsFite);
	CombatManager.displayLocation("MILODANS");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function miloBossManWinsFite():void
{
	var enemiess:Array = CombatManager.getHostileActors();
	while(enemiess.length > 1) CombatManager.removeHostileActor(enemiess[1]);
	showWarAlpha(true);
	author("Fenoxo");
	//Milo Boss Wins @ High Lust
	if(enemy.lust() >= 100)
	{
		if(pc.HP() <= 1) output("You drop to " + (pc.hasKnees() ? "one knee":"to the ground") + " and cannot rise again - not under your own power anyway.");
		//Lust
		else output("You don’t even try to stay upright, not when you’re this aroused and primed for sex. You can scarcely think of anything else.");
		//Merge
		output("\n\nFortunately, the alpha’s big, strong arms are there lift you up and throw you over the side of the bed like a ragdoll, his turgid length warm against the small of your back. It leaves small slick spot from where his pre kissed your [pc.skinFurScales].");
		var x:int = -1;
		if(pc.hasVagina()) x = x = pc.findEmptyPregnancySlot(1);
		if((x >= 0 && !pc.isCrotchExposed()) || (x < 0 && !pc.isAssExposed()))
		{
			output((pc.HP() <= 1 ? " You’re helpless to stop your":" You scarcely notice your") + " ");
			if(x < 0) output("[pc.assCovers]");
			else output("[pc.crotchCovers]");
			if(pc.HP() <= 1) output(" from");
			output(" being peeled off of you like an orange’s rind.");
		}
		output("\n\nA roaring, growing battlecry rises from down the hall, loud enough to give the lusty war-alpha pause. He casually slaps your bare ass. <i>“You just wait right there. I’ll be back in a moment.”</i>");
		output("\n\nYou look back over your shoulder to see the " + (pc.lust() >= 75 ? "sexy":"brutal") + " milodan leader clicking the activation studs on a pair of grenades. He walks around the corner, and you hear the metallic pings of hard impacts against a wall, followed by screams of alarm - and a pervasive hissing sound. Those same screams halt, only to be reborn as moans of desire and pleasure. A chorus of passionate voices, once lifted in determination, now rise in unrestrained sexual hedonism.");
		output("\n\nThe milodan returns with a cocky smile and an even harder, firmer cock. Wisps of pink smoke trail behind him, tickling your nose.");
		if(pc.lust() < pc.lustMax()) output(" They smell like... like sex. Like a hard, drooling milodan cock held right below your nose, tinting every breath with the indescribable aroma of a long night spent fucking under the blankets. It clings in a haze to the war-alpha’s fur. When he grabs you by the chin, you’re subjected to an even stronger whiff, one that finally pushes you past the point of resistance and straight into spread-leg servitude.");
		else output(" They smell like... not much of anything really. It’s hard to pay attention to the scents in your nose when you can be staring in awe at the war-alpha’s magnificent cock. It’s a sterling example of immaculate masculinity, one that leaves your mouth" + (pc.hasVagina() ? " and [pc.vaginasNounSimple]":"") + " watering with excitement, your heart thrumming in your chest. You might be sinking into spread-leg servitude, but so what?");
		output("\n\n<i>“Thought so.”</i> The brute is right behind you. He grabs you by the neck and tugs upward, lifting you up onto your forearms, your back shaped into a sensuous curve. <i>“Much better.”</i> He reaches through the gap in your [pc.thighs] " + (x >= 0 ? "to cup [pc.oneVagina], a single, furred finger sliding along the crease to test the moisture.":"to tap against your [pc.asshole], running a single, furred finger around the rim."));
		output("\n\nYou clench wantonly at the touch, anxious for him to be inside you already. A pinprick of terror lights up in the back of your mind: what if he decides not to fuck you? What if he punishes you for resisting by tying you down and forcing you to watch him getting his relief with the korgs in the hall? What if you got ");
		if(pc.hasVagina()) output("this wet");
		else if(pc.hasCock()) output("this hard");
		else output("this turned on");
		output(" for nothing?");
		output("\n\nHeat explodes into your [pc.vagOrAss " + x + "], splitting your musings apart as easily as the as the edges of your clinging, clutching passage. Your whole body squeezes in a powerful, instinctive paroxysm of pleasure, accompanied by a guttural moan. Your [pc.ass], practically levitating, rises up in response, struggling to take him deeper. Inches slide ");
		var capacity:Number = pc.analCapacity();
		if(x >= 0) capacity = pc.vaginalCapacity(x);
		if(x >= 0 && pc.wetness(x) >= 5) output("in on a curtain of leaking, slickened lube. Webs of excess cling to the milodan’s balls, splattering onto the ground the moment he finally hilts you.");
		else if(enemy.cockVolume(0) > capacity) output("in slow, agonizing ecstasy.");
		else if(enemy.cockVolume(0) > capacity * 0.66) output("steadily into your deepest recesses.");
		else output("in with ease, your well-prepared hole taking big dicks like it was built to do so.");
		if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
		else pc.buttChange(enemy.cockVolume(0));
		output("\n\nYou shouldn’t be enjoying this. You definitely shouldn’t be ");
		if(x >= 0) output("on the verge of creaming yourself");
		else output("on the cusp of climax");
		output(" from it. The war-alpha is a brutal invader, no matter how hard his cock is or how nice his fur smells. It shouldn’t matter if the nubs on his dick make your eyes cross when he pulls his cock back, because you’re supposed to be fighting him, not fucking him. You’re definitely not supposed to be moaning whorish encouragement");
		if(x >= 0) output(" or making puddles on the bed");
		else if(pc.hasCock()) output(" or leaking puddles of pre into the furs");
		output(".");
		
		output("\n\nWhat’s wrong with you? Why can’t you fight back?");
		output("\n\nYour eyes roll back as the milodan finally begins to fuck you in earnest. " + (pc.hasHair() && pc.hairLength >= 3 ? "Grabbing you by the [pc.hairNoun], h":"H") + "e pulls back, grunting with the pleasure of it, and slams himself home. The impact rocks your entire body forward");
		if(pc.biggestTitSize() >= 1) output(", your [pc.chest] " + (pc.biggestTitSize() < 20 ? "bouncing around":"jiggling more than bowls full of gelatin"));
		output(".");
		output("\n\nMaybe it’s his dick... or that gas. Does it even matter what the reason is when your [pc.vagOrAss " + x + "] gets to feel this nice? Maybe you’re just a fucking slut for letting big, strong creatures like this milodan have their way with you. Maybe you’ve just been one encounter away from giving up and letting your ");
		if(x < 0) output("blissfully twitching sphincter");
		else output("pliant, cock-thirsty cunt");
		output(" take control of your life. Whatever the reason... you’re here now. You might as well enjoy it, right?");
		output("\n\nYou might as well cum.");
		output("\n\nThe god-like girth of the alien’s prick pumps in and out with feral intensity. He’s fucking you without concern or care for your pleasure, but that just seems to make it hotter, somehow, like having your " + (x >= 0 ? "pussy ignored paradoxically makes it wetter, somehow":"asshole so basely abused paradoxically makes it clench harder") + ". You squeeze your [pc.thighs]" + (pc.isTreated() ? " and ripple your channel in the way that only Treated girls can, manipulating the male’s tender nerves closer to orgasm.":" and your channel together, trying to coax the male toward orgasm with you."));
		output("\n\nAn approving slap lands on your ass. <i>“Good girl.”</i>");
		output("\n\nThat’s all it takes to push you over the edge: a single slap on your upraised ass - well, that and the violently throbbing cock inside you. You cum in shameful, gape-mouthed delight.");
		if(pc.hasCock())
		{
			output(" Your [pc.cocks] ");
			if(pc.cumQ() < 10) output("spurt" + (!pc.hasCocks() ? "s":"") + " out dribbles of wasted, useless bliss");
			else if(pc.cumQ() < 200) output("spray" + (!pc.hasCocks() ? "s":"") + " out ropes of wasted, useless bliss");
			else if(pc.cumQ() < 1500) output("pump" + (!pc.hasCocks() ? "s":"") + " out heavy flows of useless, fur-drenching bliss");
			else output("erupt" + (!pc.hasCocks() ? "s":"") + " with gouts of wasted, floor-puddling bliss");
			output(".");
		}
		if(x >= 0)
		{
			output(" The way your pussy squeezes and flexes");
			if(pc.hasVaginas()) output(", flanked by its empty but equally impassioned sister" + (pc.totalVaginas() > 2 ? "s":""));
			output(", you’d think it was begging the milodan to knock you up. He must think you’re some kind of slut in heat, the way your body is pleading for cum. Maybe you want him to think that, because it makes your climax all the hotter. Your eyes roll back, and you clench again, so hard it almost hurts, just in time to feel a sense of all-encompassing warmth spreading through your middle.");
		}
		else output(" The way your pucker spasmodically squeezes and flexes, it all but begs for a load. Right now, you’re stretched into a living mold of milodan dick, and you’d like to add the biggest, juiciest cum bubble on top of it. With your eyes rolled back, you clench one last time, so hard it nearly hurts, just in time for a sense of all-encompassing warmth to spread through your middle.");
		output("\n\nThe gentle, pulsating heat ebbs slightly, then expands to reach whole new nooks and crannies of your interior. You marvel at the fullness and virility. Every second is a new reminder of just how much cum can be crammed into your body. Streamers of it wind their way down your convulsing [pc.legOrLegsNoun] as the brute finishes claiming you.");
		output("\n\nThe war-alpha pulls out of you, but you don’t move. You lie still. Breathing and moaning are about all you can manage. Aftershocks race through your muscles whenever you try to make use of them. More cum puddles beneath your gaped, milodan-soiled " + (x >= 0 ? "vagina":"anus") + ", but you’re too well and truly fucked to care.");
		output("\n\nMore milodan warriors arrive to declare victory just as you’re starting to doze off, but they aren’t alone. Ula appears on the bed next to you, naked and panting, filling the room with the scent of a korgonne in need. Her tongue flops out, and she kisses you, just in time for your handsome milodan alpha to claim her pussy too.");
		processTime(30);
		if(x >= 0) pc.loadInCunt(enemy,x);
		else pc.loadInAss(enemy);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",lustyMiloEndStuff,x);
	}
	//Milo Boss fucks Ula in front of you.
	else
	{
		showWarAlpha(true,"ULA_NUDE");
		output("As you sink down " + (pc.lust() >= pc.lustMax() ? "into the realm of self-pleasure":"to the ground, unable to rise again") + ", a dull rumbling radiates into the room, growing second by second into a roaring battlecry loud enough to give your victorious foe pause.");
		output("\n\nWith a snarl of irritation, the milodan barks, <i>“One minute,”</i> and turns away, trusting that you’re down for good. He grabs two grenades off of his belt. They’re bright purple things, stamped with stenciled-on illustrations of hearts. When he flicks the activation studs, they chirp and flash pink." + (pc.hasPerk("Gas Grenade") ? " Your own gas grenades aren’t much different, though these two are much bigger.":"") + " He leaves the chamber before you can ruminate further upon his armaments.");
		output("\n\nTwo high-pitched ‘pings’ sound as the weighty orbs ricochet off the hold’s superhard stone. The hissing of one hundred angry snakes follow. The urgent battlecry halts. One korg, somewhere out of view, coughs. Another moans. He is but the first of many. A female joins him, and another... and another. The sounds of a full-blown orgy kick into high gear" + (pc.lust() >= pc.lustMax() ? ", and you desperately wish the milodan had dragged you along, just so you’d have somebody to fuck - anybody!":"."));
		output("\n\nYou’re not really surprised by the war-alpha’s return, but you’re not sure where he got that gas-mask from... or why Ula is wrapped around his leg, lust-drunk and humping, leaving long smears of fragrant arousal in his increasingly matted fur. She’s heedless about her affections, rendered into little more than a rutting beast by the grenade’s potent chemicals.");
		output("\n\nThe war-alpha grabs Ula by the neck and lifts her up to eye-level before tossing the plush korg onto the bed. She lands next to you, spreading her legs expectantly.");
		output("\n\n<i>“Finally,”</i> the victorious sabercat announces, tugging the gas mask from his maw, <i>“the true jewel of Korg’ii Hold is...”</i> His nose wrinkles, and he licks licks his chops unthinkingly. <i>“She’s in... in... fuuuuck these bitches smell nice.”</i> He taps a featureless spot near the bulging crotch of his jumpsuit, and it splits right open, spilling the full weight of his erection into the open air. Two heavy, orange-sized orbs roll out after. They twitch within the taut confines of his fluffy sack, churning up a fresh load. On his next inhalation, the milodan’s gaze zeroes in on Ula’s bare pussy, presently seeping small rivers of moisture. <i>“Smells sort of like how fucking feels.”</i> Grinning, he strokes his cock in one long, smooth motion. A glistening droplet of pre appears at his crown as it visibly pulsates, fattening in excitement.");
		output("\n\nUla’s leg lifts high, held in the powerful invader’s paw like toy’s limb. He smirks at you, then lifts the other, striding forward so that his beastly cock is mere inches from its goal. This close, you can smell him too, not just Ula and her bewitchingly arousing, minty aroma. His scent is somehow more raw, more primal - like some exotic spice bathed in a layer of fresh sweat. It grows stronger by the second, as if his body is pumping out as much musk as possible to compete with the korgonne, but there’s no competing with Ula. Her pussy is everywhere, and it’s so fucking sexy that you can’t stop yourself from rolling around to get your face a little closer to her cunt.");
		output("\n\nYour hands dive " + (!pc.isCrotchExposed() ? "under your [pc.crotchCoverUnder] and ":"") + "into your crotch" + (!pc.hasGenitals() ? ", curling around to press at your [pc.asshole]":"") + ".");
		output("\n\n<i>“Oh, you wanted this pussy?”</i> The milodan smirks at you. <i>“Too bad.”</i> He carefully pushes forward, guiding his nub-lined tip directly into Ula’s drug-swollen cunt. The first few inches sink in like she’s made of half-melted butter before he’s forced to pause, moaning in delirious pleasure. <i>“Yesss,”</i> the war-alpha purrs, taking a moment to master himself. <i>“Buncha chubby broodmares, your whole race.”</i> He savagely thrusts the remaining nine inches of hard, alien cock deep into Ula’s sapphire snatch, clapping his balls into her ass with authority. <i>“And you’re mine!”</i>");
		output("\n\n<i>“Mmmhuh!”</i>");
		output("\n\nIt’s the first cogent thing Ula’s said.\n\n");
		//Image here?
		showImage("UlaWarAlphaSex");
		output("<i>“");
		output((korgiTranslate() ? "Knock me up":"Give warms! Warms pups!") + "!”</i> Ula throws her head back and screams in delight, thighs shaking. The trickles of girlcum sliding down her fluffy asscheeks thicken into coursing streams. <i>“Ooooh! Oh! " + (korgiTranslate() ? "So goood!":"Good warms!") + "”</i>");
		output("\n\nThe milodan draws back, knot audibly popping out of the korg’s elastic cunt and slams home once more. He fucks the korg princess hard. Ula’s body, made soft by biology and a life light in manual labor, jiggles all over. Her tits bounce and slosh around with the promise of how much milk they’re going to be filled with. Her ass ripples with the promise of how much bigger it’ll be after her first litter. Her tongue flops out of her maw in absolute bliss, already subservient to the milodan’s will. After a fuck like this, you just know she’s going to be licking his balls clean and loving every second of it...");
		output("\n\nYou whimper and masturbate. The force of the fucking actually splatters Ula’s increasingly well-used pussy-juice across your face, and it just makes it that much hotter.");
		output("\n\nIt shouldn’t be. You shouldn’t be enjoying this, but neither should Ula. Look at her - gasping and yipping in delight, welcoming the invader’s tool into her squeezing cunt like a long lost lover.");
		output("\n\n<i>“That’s right. Stay down,”</i> the war-alpha says, looking down at you as his cock slams through Ula’s gates with squelching impact. <i>“She’s my bitch now.”</i> His cock swells, the rounding bulb of its knot gaping the korgonne a little more on each stroke. <i>“Aren’t you, bitch?”</i> He lifts her legs higher, pulling her ass off the bed for the next thrust. <i>“Aren’t you?”</i>");
		output("\n\nThe Chieftain’s daughter doesn’t even hesitate. <i>“Yes! Milodan’s bitch!”</i> She grabs her tits in her hands and squeezes, kneading them as shivers of pleasure slide up her short frame. <i>“Breedings!”</i>");
		output("\n\n<i>“Hah! Yes, breedings!”</i> The war-alpha slams himself home, knot still expanding. His increasingly monstrous bulb stretches Ula so wide that you swear you can hear her hips creak. Fortunately for her health, the next hip-busting thrust is the last one. <i>“Take it!”</i> He knot stretches her glossed cuntlips into a near-perfect circle then burrows deeper, allowing them to snap snug against his still-impressive root. Just in time too - the big brute’s balls clench a split-second before you hear what sounds like a quart of cum flooding her reproductive passage. Her belly pooches upward in response, but rhythmic, gurgling spurts lift it higher with each passing second. The war-alpha growls in apparent delight, bending down to possessive grab Ula around the neck.");
		output("\n\nThe gibbering korgonne is clearly cumming through the entire thing. You can see her toes curl, the muscles in her legs standing out in stark relief through the padding of her fur. <i>“Yesss!”</i> the drugged korg announces! <i>“More!”</i> One hand cups her expanding belly, marvelling at how it rounds out, the other twists around to squeeze her nipple, pinching it hard. Her slobbering folds erupt, squirting excess semen and cuntjuice across the floor (and your face), and from the look on her face, Ula adores every second of it.");
		output("\n\nYour climax is as inevitable as it is shameful, yet it is also more powerful than a overloading capital ship’s reactor. Augmented by the up-close-and-personal exposure to Ula’s ambrosial juices, the orgasm rips through you. It squeezes you like a ragdoll.");
		if(pc.hasCock()) output(" Sputtering lances of [pc.cum] " + (!pc.isCrotchExposed() ? "soil your [pc.crotchCoverUnder]":"join the mixed juices on the ground") + ".");
		else if(pc.hasVagina())
		{
			if(pc.isSquirter()) output(" [pc.GirlCumNoun] erupts " + (!pc.isCrotchExposed() ? "into your [pc.crotchCoverUnder]":"from your [pc.vaginas]") + ", the tactile proof of your utter and complete defeat seeping down your thighs.");
			else output(" [pc.GirlCumNoun] trickles down your thighs in tactile proof of your complete and utter defeat.");
		}
		output(" You shudder weakly.");
		output("\n\nIt wasn’t supposed to be like this.");
		processTime(30);
		pc.orgasm();
		pc.applyPussyDrenched();
		clearMenu();
		addButton(0,"Next",miloNTREnd);
	}
}

public function lustyMiloEndStuff(x:int):void
{
	clearOutput();
	showWarAlpha(true);
	author("Fenoxo");
	output("Your growing complicity in the violation of Korg’ii Hold would bother you more if Ula’s potent pheromones weren’t flooding the room and turning the milodan victory celebration into an orgy. The one-time princess is fucked absolutely silly. Her eyes are rolled back so far that all you can see are the whites, and she’s too far gone to even try to kiss you anymore. Moans and barks have become her usual fare.");
	output("\n\nYou’re not much better. Another milodan warrior - any milodan warrior, really - lines up to sample his leader’s sloppy seconds, and that’s all it takes to transform you into a collection of lust and holes, begging for every milodan dick in a three mile radius.");
	output("\n\nThere’s a lot of milodan dick for you to take.");
	output("\n\nOne is thrust into your mouth, still saturated in the lingering taste of korgonne pussy. You hollow your cheeks with the effort of licking the minty flavor clean off his cock, swabbing your tongue back and forth like a dick-seeking sponge. There’s no rhythm to your technique, especially not with a second dick pounding in and out of your cum-packed " + (x >= 0 ? "pussy":"pucker") + ". You make up for it with raw enthusiasm.");
	output("\n\nYou suck, and you fuck, and you cum, and most importantly of all, you receive an endless bounty of milodan jizz to bathe yourself in. Creamy waves of it slide down the arch of your spine. Stomach-filling loads satisfy an entirely different kind of hunger. Being a milodan cum mop never felt so good.");
	pc.applyCumSoaked();
	processTime(45);
	clearMenu();
	addButton(0,"Next",lustyMiloEndStuff2);
}

public function lustyMiloEndStuff2():void
{
	clearOutput();
	showWarAlpha(true);
	author("Fenoxo");
	output("At some point, you stop getting fresh cocks to worship with your mouth. Ula takes their place - or rather, her thighs. The remains of five or six creampies are sloughing out from between them, " + (pc.isCumSlut() ? "and you get to clean it all up! Yay!":"and when surrounded by the pheromonal furnace that is Ula’s mouthwateringly juicy pussy, nothing sounds better than sliding your tongue inside to suck them down yourself.") + " Nostrils flaring, you gulp at the thick, cum cornucopia while breathing nothing but the korg’s vaguely minty fuck-scent.");
	output("\n\nThis is heaven. Climaxing helplessly around the cock in your [pc.vagOrAss], you spear your tongue deeper and deeper, not caring for the mixed juices caking onto your cheek or the way you moan in between swallows. Fluffy paws grab you by the back of the head and pull you deeper - so deep you can’t even breathe properly.");
	output("\n\nInstead of struggling, you lick faster. You work your tongue in spiraling circuits and constantly rotating figure eights. You suckle her clit like it has all the oxygen in the world. Cum dribbles from your chin while your eyes roll back. Darkness creeps into the edges of your vision, but there’s just so much pussy to lick and so many milodans to fuck...");
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",wargiiBadEnds);
}

public function miloNTREnd():void
{
	clearOutput();
	showBust("WAR_ALPHA","ULA_NUDE");
	author("Fenoxo");
	output("You barely notice another Milodan enter the room, even if he is naked and soaked in korgonne juices. With a toothy grin, he points to you and asks, <i>“Alpha, you gonna use this one?”</i>");
	output("\n\nThe war-alpha himself, still rooted deep in Ula’s fertile quim, waves distractedly. <i>“Nah. Get [pc.himHer] out of here.”</i>");
	output("\n\nPressing an injector to your neck, the newcomer chuckles. <i>“With pleasure.”</i>");
	output("\n\nA faint hiss tickles your eardrum as the room wobbles. Darkness creeps into corners of your vision as your eyelids, too heavy to support any longer, drift closed. At least you can hear Ula moaning...");
	processTime(10);
	clearMenu();
	//[Next] - normal bad end
	addButton(0,"Next",wargiiBadEnds);
}

//Milo Boss Defeated
public function pcBeatsUpAMilo():void
{
	showName("\nVICTORY!");
	var enemiess:Array = CombatManager.getHostileActors();
	while(enemiess.length > 1) CombatManager.removeHostileActor(enemiess[1]);
	flags["WAR_ALPHA_DEFEAT_METHOD"] = (enemy.HP() <= 1 ? 1 : 2);

	author("Fenoxo");
	output("With the war alpha " + (enemy.HP() <= 1 ? "downed and cursing ineffectively":"splayed out on his back and jerking off harmlessly") + ", you have a moment to catch your breath - no more than a moment, though.");
	output("\n\nThe sound of a dozen roaring voices echoes in from down the hall, growing louder and louder by the second until a dozen bloodspattered korgonne burst into the chamber wielding just about every kind of gun you’ve ever seen - most of them clearly stolen from defeated invaders. Ula is in the center of the contingent, brandishing a pair of laser pistols and screaming her lungs out. They exclaim in surprise and awe at the state of your fallen foes. The twinkle of burgeoning respect flickers in the many alien eyes - respect and thanks.");
	output("\n\nAngry and horny, the mob turns its collective attention to the fallen milodan, taunting and teasing him as he’s dragged from the room. A necklace of heavy savicite is thrown around his neck as one korg mounts him, extracting justice from him, one hard dicking at a time.");
	output("\n\nUla does not partake in the excited debauchery. She turns to you, tears streaming from the corners of her eyes. She lunges forward, arms outstretched... and bounces past you, directly into her father’s arms. The old korg sags in such relief that his whole body wrinkles like a discarded blanket. Old, tired eyes blink closed. His breathless voice asks, <i>“" + (korgiTranslate() ? "Are you alright, Ula?":"You okaying, Ula?") + "”</i>");
	output("\n\n<i>“Yes,”</i> Ula says. She pulls back, looking from her father to you. <i>“" + (korgiTranslate() ? "Thanks to [pc.name].":"[pc.name] make so.") + "”</i> She’s pulled deep into another hug before she can say another word.");
	output("\n\nIn the distance, the sounds of combat are dying down. Rank and file milodans flee and surrender en mass without their leader to keep them organized. The tide has turned, and victory is at hand.");
	output("\n\n");
	processTime(15);
	eventQueue.push(wargiiHoldEpilogue);
	CombatManager.genericVictory();
}

public function wargiiHoldEpilogue():void
{
	clearOutput();
	author("Fenoxo");
	showBust("ULA",korgChiefBustString());
	output("You rest on the edge of the bed while Ula and her father coordinate with their countrymen to secure the rest of the hold. For every milodan that falls, the korgonne resistance becomes better equipped. Prohibitions against using core weapons are discarded upon Ula’s advice and her father’s reluctant pragmatism. Small teams of gun-toting hunters sprint by the door while two bleeding warriors take up guard positions to either side.");
	output("\n\nMore than once, a passing korg will notice you on their way by and thank you with a grateful smile.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Right-being, Ula ideas was.":"Right, Ula's ideas were.") + "”</i> The grizzled old korg climbs up onto wobbling legs with help from his battle-baptized daughter. <i>“" + (!korgiTranslate() ? "Knew trap-having milos. Knew needed core magics for safe-making, but Chieftain too dumb for listenings. Too old and too proud.":"She knew the milodans had planned a trap. She knew we needed to make use of the core-magics to stay safe, but I was too proud and too dumb to lend an ear.") + "”</i> He waves to you. <i>“" + (!korgiTranslate() ? "Outsider save hold. Save daughter. Me not even want allow inside, but Ula righting agains.":"Because of that, an outsider saved our hold - saved my daughter. I didn't even want to allow [pc.himHer] inside, but Ula was right again.") + "”</i> He shakes his head, ears flopping like tarps in a windstorm. <i>“");
	if(!korgiTranslate()) output("[pc.name] welcome here. [pc.name] many proves." + (silly ? " Such good.":""));
	else output("[pc.name] is welcome here. [pc.HeShe] has proved [pc.him]self many times over.");
	output("”</i>");
	output("\n\nThe pistol-packing princess shakes her head and makes to comfort her dad, but he pushes her away.");
	output("\n\n<i>“" + (!korgiTranslate() ? "No now-speaking. Ula listening-have one more time.":"No speaking now. Listen to me, Ula, one more time.") + "”</i> The Chieftain loudly barks for the attention of his new guards and any korgonne who happens to be close enough to hear. When he speaks again, it is at a full shout: <i>“" + (!korgiTranslate() ? "Ula save hold! Ula strong, and brave, and me not see it for many longs! But do now. Ula no longer Chieftain’s daughter. <b>ULA CHIEF!</b> Ula leader, and me just simple advisings-haver. Hear and make true!":"Ula's ideas saved this hold. Ula is strong, and brave, and it took me far too long to see it! But I do now. Ula is no longer the Chieftain's daughter. <b>ULA IS CHIEF!</b> I will be but her advisor, and she the leader. Hear my words and know them true!") + "”</i> He sags back down as if the effort of making the proclamation wearied him greatly.");
	output("\n\nA shocked Ula stands there, jaw hanging open in shock. She looks up to you");
	if(pc.isBimbo()) output(", and you kiss her full on the mouth, too excited for anything less. <i>“Congratskies!”</i>");
	else if(pc.isBro() || pc.isAss()) output(", and you fold your arms and tilt your head approvingly. <i>“Not bad.”</i>");
	else if(pc.isNice()) output(", and you slap her on the back. <i>“Congratulations!”</i>");
	else output(", and you shoot her with a pair of fully-loaded finger guns. <i>“Looking good over there, Chief.”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",wargiiHoldEpilogue2);
}

public function wargiiHoldEpilogue2():void
{
	clearOutput();
	author("Fenoxo");
	showUla();
	showName("\nAFTERMATH");
	output("Of course, in the wake of the battle for Korg’ii Hold, quite a mess was left was behind. Wounds had to be tended to. Barricades had to be cleared. Damage to the hold itself had to be cleaned or repaired. Celebrations had to be planned, and an inventory of captives and injuries had to be made.");
	output("\n\nSomehow, casualties were blessedly few. The milodans came planning to subdue the populace for use in slave labor - and the huge shipments of medicines they brought with them made it easy to keep the captured sabercats alive once they lost the battle.\n\nNow, the hold has a bellyful of disarmed (but hostile) milodan captives to deal with, and the decision falls on Ula’s shoulders.");
	output("\n\n<b>She looks to you for advice.</b>");
	output("\n\nYou could give council for mercy, suggesting that they be released into the wilds to live out the rest of their lives in the bitter chill, hiding from their Pyrite Industries debtors. It might not be pleasant, but they’d be largely free - something better than what they probably deserve.");
	output("\n\nYou could council Ula toward harshness, suggesting that the up-gunned barbarians fate they expected to subject the korgonne to: a life deep under the ice in the hold’s mines, digging up riches they’ll never get to enjoy. The moment they invaded the hold, they ripped up their leases on liberty.");
	output("\n\nOr you could offer a middle ground solution: put the milodans to work in the mines as punishment for the damage they’ve caused. Then allow those who aren't a risk to leave for the wilds - at the korgonne’s discretion, of course.");
	processTime(50);
	clearMenu();
	addButton(0,"Mercy",makeAWargiiChoice,0);
	addButton(1,"Harshness",makeAWargiiChoice,1);
	addButton(2,"Middle",makeAWargiiChoice,2);
}

//Any choice:
public function makeAWargiiChoice(x:int = 0):void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("Ula listens with rapt attention to your argument" + (pc.isBimbo() ? ", however poorly laid out it might be":"") + ". She nods in agreement as you proceed, and by the time you’ve finished saying your piece, the new Chieftain is utterly convinced of the merits of your plans.");
	//Release
	if(x == 0) output("\n\nThe elders and guards she briefs on her decision are clearly displeased by what she has to say, but after a brief argument, the fluffy firecracker has the old dogs backing down and grumbling on their way to see her orders executed.");
	//Harsh
	else if(x == 1) output("\n\nThe elders and guards she briefs on her decision are entirely too pleased to hear what she has to say. When they leave, they’re laughing and bouncing with eager, vindictive glee. Ula shakes her head, seemingly unsure.");
	//Middle
	else output("\n\nThe elders and guards she briefs on her decision seem unmoved. One of them mutters that they ought to be in the mines forever, but the fluffy firecracker puts down the dissent with a laser-like glare.");
	//Merge
	flags["WARGII_MILO_SOLUTION"] = x;
	flags["WARGII_PROGRESS"] = 3;
	processTime(10);
	clearMenu();
	addButton(0,"Next",wargiiHoldEpilogue3);
}

public function wargiiHoldEpilogue3():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("A week of feasting, congratulations, and labor-intensive repair work devours your time like a glutton at an eating contest, but you do eventually manage to pry yourself away from it all, explaining that your future lies out amongst the stars. The hold itself is almost fully repaired, and aside from the odd clawmark still needing filled in and polished down, you’d never know it was the sight of a recent battle.");
	processTime(60*24*6);
	output("\n\n<b>You saved Korg’ii Hold! +<b>750,000</b> XP!</b>");
	clearMenu();
	addButton(0,"Next",wargiiHoldEpilogue4);
}

public function wargiiHoldEpilogue4():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	output("A korg youngling scampers up before you go too far");
	var score:Number = wargiiScore();
	if(score >= 50) 
	{
		output(", flanked by a warrior");
		if(score >= 90) output(" and " + (flags["MET_TUUVA"] == undefined ? "the blacksmith":"Tuuva"));
	}
	output(". <i>“" + (!korgiTranslate() ? "Hold want you have these shinies. Know core folks worse than gem-hearts, so give shinies for thanks.":"The whole hold wants you to have these. We know you core folk crave shinies worse than a gem-heart, so we thought these would be a suitable gift to show our thanks.") + "”</i> A bag ");
	if(score < 50) output("half filled");
	else if(score < 90) output("filled");
	else output("overflowing");
	output(" with jewelry-grade gemstones is thrust into your hands.");
	if(score >= 50) output(" <i>“And these battle prizes yours for keeping-safe.”</i> The warrior hands you a deactivated energy blade and a high grade laser pistol. It must have belonged to one of the officers.");
	if(score >= 90) output(" Finally, " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the blacksmith") + " tosses a suit of metal-reinforced kordiiak-hide armor onto your overburdened form. <i>“Keeping safe outside!”</i>");
	var credits:Number = 75000;
	if(score >= 50) credits += 25000;
	if(score >= 90) credits += 50000;
	output("\n\n<b>You get a " + credits + " credit advance from Steele Tech for these gems. Score!</b>\n\n");
	//collect stuff here :3 - ring given out elsewhere.
	pc.credits += 150000;
	//Set location back to normal
	currentLocation = "KORGII B12";
	removeUvetoCold();
	flags["WARGII_OVER_TIMESTAMP"] = GetGameTimestamp();
	if(score >= 90) quickLoot(new PyriteIndustriesPlasmaBlade(), new PyriteIndustriesSuperchargedLaserPistol(), new KordiiakHideArmor());
	else if(score >= 50) quickLoot(new PyriteIndustriesPlasmaBlade(), new PyriteIndustriesSuperchargedLaserPistol());
	else 
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Never ran :3
public function neverRanBonusUlaGift():void
{
	clearOutput();
	showUla();
	author("Fenoxo");
	//Signet of Bravery - ring of solid diamond shrouded in a twisting, silver spear. +5 physique/aim and +25 HP but disables flee.
	output("Ula pops up at the sight of you, ears twitching nervously. <i>“" + (!korgiTranslate() ? "[pc.name]! Am knowing we giving many thanks already, but stories still told about how you never run from fight.":"[pc.name]! I know we gave you many thanks already, but with all the stories about how you never even ran from a fight...") + "”</i> She smiles proudly, producing a small box. <i>“" + (!korgiTranslate() ? "Thought deserved extra for good alien-being. Great, even!":"We thought you deserved more for being such a great alien.") + "”</i> The canine Chieftain hands you the box. <i>“" + (!korgiTranslate() ? "Wear when want feel brave. Good gem. Got from deepest mine where rocks more potent.":"Wear this when you need to be that brave again. The stone is a good one, mined from the hold's deepest depths, where the gems are most potent.") + "”</i>");
	output("\n\nYou’re not sure what to make of that last bit, but you thank newly-minted Chieftain for the ring nonetheless" + (pc.isBimbo() ? " with a sloppy kiss":"") + ".\n\n");
	flags["WARGII_NORAN_REWARD"] = 1;
	quickLoot(new SignetOfBravery);
}