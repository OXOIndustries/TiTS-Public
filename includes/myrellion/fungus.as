import classes.Characters.GardeBot;
import classes.Characters.MyrInfectedFemale;
import classes.Creature;
import classes.GameData.CombatManager;
public function showInfectedMyr(nude:Boolean = false):void
{
	if(inCombat())
	{
		showName("FIGHT: INFECTED\nMYR FEMALE");
	}
	else
	{
		showName("INFECTED\nMYR FEMALE");
	}
	if(!nude) showBust("MYR_INFECTED_FEMALE");
	else showBust("MYR_INFECTED_FEMALE_NUDE");
}

public function showFungusQueen():void
{
	showName("FUNGAL\nQUEEN");
	showBust("MYR_INFECTED_QUEEN");
}

//Infected myrmedion enemy encounter
//Encounter text
public function infectedMyrmedionShit():void
{
	clearOutput();
	showInfectedMyr();
	author("Gardeford");
	if(flags["MET_INFECTED_MYR_FEMALE"] == undefined)
	{
		flags["MET_INFECTED_MYR_FEMALE"] = 1;
		
		output("As you wander through the deep caves you hear someone, or something, crying. You draw your [pc.meleeWeapon], fully aware that this could be a trap, and continue toward the noise. The stone around you is covered with dense clusters of mushrooms. Tiny toadstools that flash periodically with magnificent colors. The crying appears to emanate from a shadowed portion of the colorful cavern.");
		output("\n\nYou inch closer to the sound, calling out once you get close enough. Once the sound leaves your lips, you wonder whether it was a good idea. A pair of eyes turns toward you, shimmering with every color you can imagine, and you see them lurch as something begins moving closer to you. As it comes, you take a step back, forcing it to move into the dim lights before it reaches you.");
		output("\n\nWhat staggers into the multicolored glow appears to be a female red myr. A haggard and rather shabby looking one, but a red myr nonetheless. Trailing from her side is a lithe and ghostly fungal construct, with nippleless B-cup breasts free of obstruction on its chest. Its body trails down to the hips before seemingly disappearing into the myr’s, and a mushroom-like cap sits on its head, bobbing whenever it moves.");
		output("\n\n<i>“Physical contact inadvisable");
		if(silly) output(". The hormones will not actually come later");
		output(".”</i> Your Codex beeps, alerting you that this is a fungus that affects insectile races. The portion about effects on other races is sparse, but it gives the usual fluid contact warning for dangerous parasites. The afflicted ant-girl looks up at you when she hears the noise, her eyes narrowing and zeroing in on your own. Every few moments her gaze slips down to your crotch before she corrects it.");
		output("\n\n<i>“W-what are you looking at!? I’ll f-f-fuck you, I mean fight you! I meant fight!”</i> she says, obviously struggling with her words and prompting the ghostly mushroom to pat her on the head, congratulating her for managing to talk that much. As she talks she shakily rises to her feet, leaning against the cave wall to support herself. A rigid cock with the same coloration as her fungus, but decidedly more solid looking, lies just above her naked cunt, sporting an erection stiff enough that it stands nearly straight up. Above that the tattered remains of a shirt barely cover her above the midriff, leaving her own B-cups almost totally visible beneath.");
		output("\n\nThe pale white dick throbs as she moves, and you see her quiver when it bumps into her belly. You can see striations at the base where the new member apparently grew from her pelvis, no doubt a symptom of this fungal infection. The myr seems to gain a second wind, stepping into an offensive stance despite her weakened condition. It looks like there’s no way you’re getting out of this without a fight.");
		//Unlock not-cordecepts
		CodexManager.unlockEntry("Myr Fungus");
	}
	//Repeat encounter
	else
	{
		IncrementFlag("MET_INFECTED_MYR_FEMALE");
		output("As you walk through the caves you hear someone shout from behind you. You turn to find an infected myr standing in a battle stance.");
	}
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MyrInfectedFemale());
	CombatManager.victoryScene(winVsInfectedMyr);
	CombatManager.lossScene(loseToInfectedMyrYouSubbieSloot);
	CombatManager.displayLocation("INFECT. MYR");
	
	addButton(0,"Next",CombatManager.beginCombat);
}

//Win text
public function winVsInfectedMyr():void
{
	output("As you deal the finishing blow, your codex lights up. A brief glance at the screen nets you a warning that despite the fungi’s inability to parasitize non-insectile races there could be other side effects. It advises shying away from physical contact. Looks like you have a choice to make.");
	processTime(1);
	clearMenu();
	//[Sex] [Compassion] [Watch] [Leave]
	//Red femyr fuck/loss
	//accounts for male and female. Not taur friendly, yes naga friendly
	if(pc.lust() >= 33)
	{
		if(pc.hasCock() || pc.hasVagina()) addButton(0,"Fuck Her",infectedMyrFuckSlashLossSlashButtstuffNotReally,false,"Fuck Her","Have sex with the needy ant-woman now that you’ve secured your place on top.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","This action requires at least one standard genital.");
		//Red femyr win watch
		//no requirements
		if(pc.hasVagina()) addButton(1,"Compassion",girlyCompassionVictoryWithInfectedMyr,undefined,"Compassion","Give her compassion... with your lady parts.");
		else addDisabledButton(1,"Compassion","Compassion","You must have a vagina in order to undertake this action.");
	}
	else
	{
		addDisabledButton(0,"Fuck Her","Fuck Her","You are not aroused enough for this course of action.");
		addDisabledButton(1,"Compassion","Compassion","You are not aroused enough for this course of action.");
	}

	addButton(2,"Watch",watchInfectedMyrVictoryScene,undefined,"Watch","Watch her succumb to her own desires.");
	addButton(14,"Leave",leaveDatSlutBitch);
}

public function loseToInfectedMyrYouSubbieSloot():void
{
	infectedMyrFuckSlashLossSlashButtstuffNotReally(true);
}

//Red femyr win watch
//no requirements
public function watchInfectedMyrVictoryScene():void
{
	clearOutput();
	showInfectedMyr(true);
	author("Gardeford");
	output("The red myr falls to her knees, her face a mix of lust and frustration. You decide to listen to your codex and just watch what happens for now. Her arms twitch and begin to move toward her crotch, her hands reflexively grasping the cock that sprouts from it. She moans at her own touch, followed by a blushing glance at you.");
	output("\n\n<i>“W-why are you watching!? Go awa-ech,”</i> she begins, but as she talks the ghostly mushroom appears once more, sticking two fingers into her mouth to silence her. Some of the fierceness disappears from her eyes, and she quiets down. As if assured that her outburst is over, the apparition removes its fingers and pushes her forearms toward her nethers.");
	output("\n\nYou aren’t certain that the thing is solid, but her arms move with a slight delay as it prods them. Delicate fingers brush the milky white cock that protrudes from above her cunt, and her body twitches in response. After a few guided pumps she milks it without prompting, and the mushroom creature leans in, kissing her shoulder and rubbing her upper arms.");
	output("\n\nIts kisses migrate towards her head, starting at her shoulders and moving slowly up her neck. The tired ant-girl stares into the rainbow pools of its eyes, sticking out her tongue mechanically. Her fungal companion takes the muscle between its lips, looping its arms under hers as it hugs her close.");
	output("\n\nSince its body is mostly transparent, you can see her breasts as they are squashed against its own B-cups. Her tongue laps at the inside of its lips, stopping only when it is sucked further in by the suctioning fungus. The fatigued formicidae’s hands clamp tightly to the porcelain cock, but still slowly jerk its length.");
	output("\n\nA shudder runs through her body as the swollen member thickens between her fingers, pulsing a few times before it releases a blast of equally white cum. Along with her orgasm comes a resounding crack of noise, and for a moment the fungal apparition becomes fully solid. While its wholeness remains, it brushes the ant-girl’s bright red hair, combing and straightening with its fingers as it pats her head sympathetically.");
	output("\n\nIts form slowly returns to transparency until it’s left unable to directly touch its host, and her clinging arms fall through it only to hug her own shoulders. The shadowy being looks at you, its face heavy with sadness as its previously bright eyes shift between a number of dull colors. As you watch its expression changes, shifting from sorrow to unfettered resolve. It gives you a small nod, mushroom cap jiggling slightly before it turns its attention back to its host.");
	output("\n\nIt lowers its head to her crotch, kissing the now softening member that she still holds in her hands. At its touch the pale phallus gets a second wind, quickly returning to full hardness. The red myr moans, falling back and pumping her hips into the air, letting one of her hands act as an improvised onahole while the other squeezes one of her breasts. Her face is a mix of pleasure and concentration, and it’s obvious which is winning out.");
	output("\n\nThe chalky specter assists her in both endeavors. It brushes against both of her breasts, rubbing the nipples with its nose and lips. The hint of its touch sending shivers of pleasure through the haggard girl. On the other hand, its ghostly digits seems to be able to fully handle her cock, temporarily solidifying as they touch it, rubbing the throbbing muscle until it’s pulsing with readiness.");
	output("\n\nThe ravaged redhead grasps the hand like she wishes it would never leave, directing it to pump faster and faster along her dick. Streams of pre trickle from the tip and coat her length, giving it a perfect shine. She quits playing with her breasts and switches to her cunt, dipping two fingers in as she continues to work her cock. Her back arches and her toes curl as she’s brought to the edge of orgasm.");
	output("\n\nThe ghostly mushroom turns its body to her lower half, encasing the head of her opalescent penis in its lips. That feeling pushes her over the edge with force, and she cums in torrents, the first flying through the intangible body and raining back onto her tits. After that another crack of noise fills the room. The mushroom servant solidifies, swallowing the cum that gushes from her fountain.");
	output("\n\nIt doesn’t skip a beat once her orgasm ends. Just as it begins to fade its fingers join hers in teasing and fucking her cunt, and its brow furrows in concentration as it continues to suck her off, bringing her back to rigidity before her previous hard-on can fully soften. The poor girl closes her eyes, tensing as the reprieve that was about to come is snatched away. She gets no break as her second orgasm in as many seconds shatters her control.");
	output("\n\nCreamy jizz bubbles out of the mushroom creature’s mouth. Its body flashes with a rainbow of colors. This time when its host falls limp it remains fully solid, suckling her rod as if to make sure it’s truly still there. When it pulls up finally it gives you a happy smile and turns back to its host. The grateful ant-girl smiles as it touches her face and snuggles in close, squeezing various parts of its body to make sure it is going to remaining solid before gently rubbing its back.");
	output("\n\n<i>“T-thanks, I guess. I don’t think he will become like that again, and the constant horniness seems to be gone,”</i> she says with a contented grin. You aren’t sure what you did, but you nod and smile. The fungus attached to her looks at you, beaming with happiness, and tries to say something. No words come out, but it seems happy. After finishing, it gasps in a large breath and turns to kiss and hug its host, reveling in the touch it seems to have been denied for so long.");
	output("\n\n<i>“He said you looked strong, and he didn’t want to stay a burden. I’ll probably stay here a little longer and then I guess I’ll head back to the city. I hope I didn’t get fired while I was away,”</i> she says before leaning back for what you assume is a short nap. You decide to go back to your former endeavors, but after a show like that you might need to take a detour.\n\n");
	processTime(9);
	pc.changeLust(20+rand(10));
	//(lust+30)
	CombatManager.genericVictory();
}

//Red myr Compassion win
//female only
public function girlyCompassionVictoryWithInfectedMyr():void
{
	clearOutput();
	showInfectedMyr(true);
	author("Gardeford");
	output("The disheveled myrmedion backs away from your assault, collapsing against the cave wall.");
	output("\n\n<i>“Stupid dick! I never wanted this. I just want to go back to Kressia and be normal,”</i> she confesses shakily, covering her face with her hands. The fungal manifestation at her shoulders looks on nervously, unsure of how to help her.");
	output("\n\nA part of you feels sad for the conflicted ant-girl, and you think of a perfect way to help her. You saunter over to the defeated myr, pulling apart her hands as gently as you can. The tearful girl looks at you in confusion before you pull her into a kiss, but relents to your advances almost immediately.");
	output("\n\nAs your [pc.tongue] dances with hers you feel a flush of pleasure in your neck, spreading to the rest of your body as the chemical lust in her saliva works its magic. It takes nearly a minute for you to work up the willpower to pull away from her ensnaring kiss, and even more to not return for seconds at the sight of her abandoned lips.");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("I dunno why you don’t want such a yummy looking cock, but if you really don’t like it I can still make you feel super good,");
	else if(pc.isNice()) output("We can feel good together without using your dick,");
	else if(pc.isMischievous()) output("We can just use this instead, you know,");
	else output("Stop crying. You still have a pussy don’t you?");
	output("”</i> you tell the pouting myrmedion as your fingers trace their way to her slit. The ravishing red-head sighs blissfully as you tease her entrance, and her body tenses as your thumb brushes her clit. You move in closer to your provisional partner, pressing your [pc.chest] against her arm. She leans into you in return, lavishing your neck with wet kisses.");

	output("\n\nIntoxicating lust pulses in your body, spreading in waves from every touch of her lips, and you pull the grateful ant-girl back by the hair before they overwhelm you. She moans and shudders as you reciprocate, kissing her throat as your fingers penetrate her yielding entrance. Chitinous legs close around your hand, and you push harder to compensate for the clenching passage.");
	output("\n\nEven this little bit of attention seems to be too much for the bedraggled myrmedion, and she twists in your grip as an orgasm wracks her body. Juices splash your digits as you continue to slowly caress her entrance and clit, and the porcelain cock above it thickens painfully. Before it can release its pent up load, however, it suddenly shrinks down to nothingness. You look on in surprise as it leaves only a small white spot above her cunt.");
	output("\n\nThe fungal manifestation that caused the issue looks equally surprised, staring at itself as its B-cup breasts grow into plush looking DD’s. The myr’s chest follows suit, growing what looks like three full cup sizes to end up even bigger than her manifestation’s, and splitting what remained of a shirt into nothingness. She looks down at her new endowments, still in a slight daze from the combination of her orgasm and this ordeal.");
	output("\n\n<i>“I look like a gold honeypot... Maybe you’re not all bad,”</i> she says with a bewildered stare, directing the last comment at the equally confused mushroom. The fungus seems to have fully solidified, and snuggles in close to its host, playing with her assets and sucking on one of the puffy nipples. You join it on the other side, pressing into her soft breast and teasing the hardened nub with your [pc.tongue].");
	output("\n\nThe marshmallowy mushroom transitions down to its hosts glistening pussy, and you spread her lips to give it a better view. Pillowy lips close around her clit, sucking dutifully as you return your attentions upward. You pull the exhausted myr into a kiss, gently biting her lip before playing with her tongue. She returns the gesture as best as she can, but her tounge surrenders to your guidance at every turn.");
	output("\n\nHer hot breaths come quicker as you continue, and you begin to think the girl might be a quick shot as the fungus’s ministrations bring her over the edge. The crimson haired ant-girl’s legs splay out and her chest heaves as she cums, moaning loudly and clutching at your body to steady herself. The fungal being scoots up to kiss her as she spasms, pecking softly at her insensate face until she recovers enough to reciprocate.");
	output("\n\nThe creature doesn’t have a tongue of its own, so it gently sucks on hers as they hug tightly to each other. Its mushroom cap is squashed down against her forehead, bending like a sponge to accommodate for the lack of space. For a second you’re worried that the ant-girl will damage the manifestation as she roughly caresses its body, but its pliant skin slowly reshapes itself after her grip is released.");
	output("\n\nCute and loving cuddles aside, your body is now full of two orgasms worth of the red myr’s lust inducing saliva, and you’re rapidly losing the ability to contain yourself. The now heavily relaxed ant-girl’s gentle kisses on your [pc.chest] do nothing to aid your situation, making your head swim with thoughts of other places you want her to kiss.");

	//pc taur
	if(pc.isTaur())
	{
		output("\n\nThoughts won’t help you to cum however, so you stand on shaky legs, spinning your tauric frame around to show off [pc.eachVagina]. The fascinated formicidae stares at your [pc.butt] for a few seconds before tentatively gripping each cheek, and her fingers feel pleasantly warm as they spread your lips for a better look at your dripping entrance.");
		output("\n\nJust looking isn’t getting you off any faster, so you scoot back further, bopping the unsuspecting myrmedion on the nose with your [pc.vagina]. She gives a yelp of surprise, but dives into your sex at your prodding. A lusty moan escapes you as pleasure courses through your veins, finally having a conduit to work through. Her tongue isn’t very big, but she uses it expertly to search for any weak spots near your entrance.");
		output("\n\nWhile the crimson-haired ant-girl laps hungrily at your insides");
		if(pc.hasClit()) output(", her fingers prod and tweak your [pc.clit], rubbing relentlessly in her efforts to pay you back");
		output(". Heated breaths feel cool on the venom drenched surface of your fuckhole, and in hindsight, having a girl with aphrodisiac saliva eat you out may not have been the best method of relief.");
		output("\n\nYour drug addled brain dismisses such thoughts, declaring this to be your best idea ever with every brush from her lust laced lips. In their restless motions your hands find their way to your [pc.chest], massaging your breasts before playing with your [pc.nipples]. Pleasure circuits fire off sporadically as they’re overloaded by the myrmedion’s ministrations.");
		output("\n\n<i>“F-fuck yesss,”</i> you slur as you cum, unable to do anything more than moan after the words leave your mouth. The alluring ant-girl lowers her mouth,");
		if(pc.hasClit()) output(" sucking on your clit");
		else output(" trying");
		output(" to keep you riding the waves of bliss for as long as possible. Even her venom can’t keep you going forever, and eventually you’re reduced to periodic twitches as the effects of the drug are flushed out.");
		output("\n\nWhen you regain control of your body, you spin yourself back to face the red myr. To your surprise she lies asleep on the cave floor, face coated in shiny femcum. Her mushroom partner lies under her, acting as a bed for the exhausted ant. You lean down and give her a kiss, on the cheek this time, before gathering your [pc.gear] and heading back to your explorations.");
	}
	//pcnottaur
	else
	{
		var x:int = rand(pc.totalVaginas());
		output("\n\nThinking about it won’t make anything happen, so you lie back, making sure to show off [pc.eachVagina]. The absorbed ant-girl stares for a moment before she realizes what you want, looking at your sex and spreading your lips with her fingers.");
		if(pc.vaginas[x].clits > 0) output(" Her breath tickles your " + pc.clitDescript(x) + ", but you want more than just her breath.");
		output("\n\nTaking the initiative, you pull her face first into your nethers, wrapping your [pc.legs] around her neck. She gives a surprised yelp in response, but quickly adjusts to lapping at your [pc.vagina " + x + "].");
		if(pc.vaginas[x].clits > 0) output(" The enamored myr quickly homes in on your " + pc.clitDescript(x) + ", alternating between sucking and licking at regular intervals.");
		output("\n\nIn hindsight, having a girl with aphrodisiac saliva eat you out might not have been the best method of release, but you dismiss such thoughts as her fingers push into your passage. The myrmedion fungal host gets into a rhythm, stroking your insides with her fingers");
		if(pc.hasClit()) output(" while she gently bites at [pc.oneClit].");
		output("\n\nYou thread your fingers through the redhead’s crimson locks, holding her in place and futilely trying to pull her closer. Your efforts reward you with blissful shocks as she slips down, plunging her tongue into your [pc.vagina " + x + "]");
		if(pc.totalVaginas() > 1) 
		{
			output(", and her fingers into your other cunt");
			if(pc.totalVaginas() > 2) output("s");
			output(". Your fuck-focused partner doesn’t skip a beat, flooding your pleasure receptors with a relentless wave of lust.");
		}
		output("\n\n<i>“F-fuck,”</i> is all you can manage as the assault becomes too much to resist, and your muscles lock up in orgasm. [pc.GirlCum] paints the myr girl’s face as ");
		if(pc.legCount > 1) output("your [pc.legs] lock tightly around her head");
		else if(pc.isNaga()) output("your tail constricts tightly around her body");
		else output("your [pc.leg] spasms against her body");
		output(", and you frantically attempt to rub against her face to prolong the effect.");

		output("\n\nEven her venom can’t keep you going forever, and eventually your spasming body calms down. Once you’re back in control of your functions, you look down to find a [pc.girlCum] drenched ant girl asleep in your lap. You gingerly lift her off, letting the fungal manifestation take your place as her pillow, before gathering your [pc.gear] and returning to your explorations.");
	}
	output("\n\n");
	imbibeVenomEffects();
	processTime(22);
	pc.orgasm();
	pc.orgasm();
	CombatManager.genericVictory();
}

//Red femyr fuck/loss
//accounts for male and female. Not taur friendly, yes naga friendly
public function infectedMyrFuckSlashLossSlashButtstuffNotReally(loss:Boolean = true):void
{
	if(!loss) clearOutput();
	showInfectedMyr(true);
	author("Gardeford");
	//if loss:
	if(loss) output("You fall to the ground, unable to hold yourself up any longer. The red-headed ant girl staggers for a moment, but manages to stay on her wobbly legs. The ghostly apparition at her side rubs her shoulders like a fight manager, relaxing her tense muscles so she doesn’t overexert herself.");
	//if win: 
	else output("You sit on the ground, ignoring your codex’s warning and beckoning for her to come closer.");
	//merge: 
	output("\n\nThe red myr host stumbles closer to you, looking unsure of what to do for a moment as her eyes dart to different parts of your body, examining you as thoroughly as she can. She reaches down and removes your ");
	if(pc.isCrotchGarbed()) output("[pc.lowerGarment]");
	else output("equipment belt");
	output(" with some difficulty, her fingers fumbling with ");
	if(pc.isCrotchGarbed()) output("the clothing");
	else output("your unique physiology");
	output(". When she finishes, she tries to stand but only makes it about halfway up, breathing heavily and staring at you before collapsing suddenly and humping wildly at your [pc.leg].");

	output("\n\nShe continues for a few seconds, her turgid cock feeling hot against your [pc.skinFurScales]. In no time at all she’s cumming, spurting a load of pearly jizz onto your [pc.leg] and ");
	if(pc.isChestGarbed()) output("[pc.upperGarment]");
	else output("stomach");
	output(". The addled ant-girl hugs herself close to your [pc.chest] as she cums, shuddering and moaning. You’re momentarily deafened as a resounding crack fills the air, and the formerly transparent fungal creature now seems to have solidified, looking directly at you with a needful expression.");
	output("\n\nThe entity takes your head between its hands and kisses you. For a moment you’re worried that it might be trying to infect you with something, but then a series of images flashes through your head, including what seem like a number of pictures of the ant girl getting progressively more agitated in everyday life. It ends with her sneaking to the tunnels in a daze and walking around alone.");
	output("\n\nAfter it’s done you are compelled to pull her to your face and kiss her, feeling something leaving you as you do so. Perhaps the thing did infect you with something. When she pulls back from the kiss you see a renewed resolve in the amber shine of her eyes. The pale mushroom fades out until all that’s left is the shimmery form and glowing eyes.");

	processTime(3);
	pc.changeLust(10);
	clearMenu();
	if(pc.hasCock() && pc.hasVagina())
	{
		output("\n\nHow do you fuck her?");
		addButton(0,"With Dick",infestedVictoryOrLossMaleScene,loss,"With Dick","Use your dick to please her.");
		addButton(1,"With Pussy",infectedMyrWinOrLossFuckForGirlTypes,loss,"With Pussy","Teach her how to use her new dick the only way you know how - with a nice, wet pussy.");
	}
	else if(pc.hasCock()) addButton(0,"Next",infestedVictoryOrLossMaleScene,loss);
	else addButton(0,"Next",infectedMyrWinOrLossFuckForGirlTypes,loss);
}

//male
public function infestedVictoryOrLossMaleScene(loss:Boolean = true):void
{
	clearOutput();
	showInfectedMyr(true);
	author("Gardeford");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	//Dickfitz
	if(x >= 0)
	{
		output("You grasp the lithe myrmedion by the hips, maneuvering her until your [pc.cockHead " + x + "] is teasing her entrance. She sighs with relaxation, letting herself drop onto your [pc.cock " + x + "] slowly. Once she’s situated her hips gyrate in short circles, her insides tightening and loosening around your length, hugging you firmly as her speed increases.");
		pc.cockChange();
		output("\n\nThe ghostly mushroom brushes past your arm, and you feel compelled to move it to her chest, tweaking the nipple on one of her C-cup breasts until she gasps with pained pleasure. Her dick rubs between the both of you, squashed against her belly button and blossoming with pre. It looks a bit lonely, but the fungal creature comes to her rescue, placing a hand on the porcelain member despite its apparent intangibility. The myr coos and ceases to move as she’s assaulted with the dual feeling of having both her sexes stimulated. Without skipping a beat, you pick up the pace, moving for her. She continues to moan unintelligibly as the two of you double team her, legs clamping tightly around you as she climbs the mountain of euphoria.");
		output("\n\nYou look to the side and find the mushroom creature staring directly at you. It might just be your imagination, but you think you know exactly what it wants you to do, and you nod in confirmation. The red myr gasps as you lower her to the ground, placing her gently against the rock before doubling your speed in fucking her. The fungal sprite steps up its game as well, using both hands to milk her throbbing member.");
		output("\n\nSuddenly, she clamps almost painfully around you as a gush of pearly cream escapes her cumslit, and you thrust as deep as you can inside her, painting her insides with your own [pc.cum] as she orgasms around you. Another thunderous noise rocks the air as the ghostly mushroom becomes whole again. It quickly moves to her cock, catching the remaining spurts of jizz before they’re lost to the floor of the cave.");
		output("\n\nYou begin to thrust again before she can regain her composure, and the mushroom assists on her end, pressing its pert B-cups together in an attempted boobjob. It squishes tightly against her, and the remaining jizz gives her cock a slippery coating. The soft fungus slides easily along the underside of her sensitive organ, which returns to full rigidity and slips around her stomach with the friction.");
		output("\n\n<i>“B-but I just came”</i> she half complains as she grunts with lust. Her manifested partner ignores her, kissing the base of her cock as its boob-job numbs her mind. You join it in ignorance, thumbing her clit until her complaints become desire-fueled gibberish. The frenzied formicidae’s whole body is flush with heat, building up to what you are determined to make the biggest orgasm of her life.");
		output("\n\nYou lean around the alabaster figure, kissing up the side of her body and along her arm. Some of the heat within her transfers to your lips, but an unending supply restocks her flesh with fiery fervor. Her breath becomes deep and husky, and yours changes to match it. It’s only a matter of time before the lid covering your ardor is shaken off.");
		output("\n\nThe exhausted insect’s body is the first to give in, shifting from slowly weakening resistance to total submission. She manages a quiet moan as she cums, splashing your waist with steamy femcum as her cunt tightens around you. Her hands try desperately to find something to hold, but only manage to flail and stretch with her body’s twitching as her eyes dilate into pools of umber.");
		output("\n\nThe chalky white mushroom quickly takes her rod into its mouth before a flood of pearly liquid jets out of its nozzle. Some of its meal escapes, running in rivulets over her still orgasming vagina. The running liquid sets off her spasms anew, and she manages an exaggerated ‘mmm’ to show her appreciation. The fungus suckles her sperm like a vacuum, sealing around her cock after the initial torrent and holding fast as you piston in and out.");
		output("\n\nYou finally give in, unable to withstand the tension of her wet fuckhole, and fill her womb with rope after rope of [pc.cum], feeling completely satisfied as she shudders with each pulse. Your [pc.cum] mixes with her own cascading jizz and pools between her quivering cheeks. For a second you’re worried about her breathing, but she gasps in air at even intervals, and you pull yourself away from the tangle of flesh to sit for a moment and recover yourself.");
		output("\n\nOnce her torrent stops, the fungal entity pulls itself off her cock and gives you a smile. A series of happy images flash through your mind, and you give it a hesitant grin in return. You gather your [pc.gear], leaving the two of them to recover while you return to your previous endeavors.");
		
		enemy.loadInCunt(pc, 0);
	}
	//dicktoobig
	else
	{
		x = pc.biggestCockIndex();
		output("The troubled ant-girl looks at the size of [pc.eachCock] with more than a little apprehension. You suppose she isn’t used to seeing cocks the size of her torso, so you gently pull her in closer. Her body gingerly brushes over your [pc.skinFurScales], leaving her face to face with your [pc.cockHeadBiggest]. She gives your tip an awkward kiss, looking nervously into your eyes to gauge your reaction.");
		output("\n\nNot wanting to ruin her experience, you smile and moan a little louder than normal. Encouraged by your show, the red myr scoots up to kiss your [pc.lips], rubbing your [pc.cockBiggest] with the entirety of her petite frame. A surge of lust flares through your system as her venom flows unchecked into your body, and your [pc.cock " + x + "] grows harder in response.");
		output("\n\nYour partner’s breaths increase in speed as she picks up the pace, pushing herself up as she humps your throbbing member. Her smaller humanoid penis frots swiftly against your own, and by the way her eyes are glazing over youd say it’s about ready to explode. You grasp hold of her hips, aiding her to move even faster toward the sweet release she craves. The novice hermaphrodite’s pussy provides a slick shine of lubricant for her sliding, causing her to lose her grip and fall helplessly atop you.");
		output("\n\nA thunderous crack of noise ripples through the cave as the ant-girl’s body tenses in orgasm. Quiet moans are all she can manage as she covers your [pc.cockBiggest] with spurts of both jizz and femcum. The phantasmal apparition at her side solidifies suddenly, looking between the two of you in surprise. It’s confusion is quickly replaced with an elated smile as it locks lips with it’s host, who tries her best to respond in kind through an orgasm induced haze.");
		output("\n\nThe pair return their attentions to you after they finish, dotting your body with kisses that lead up to a doubled effort at your [pc.cockHeadBiggest]. Some of the red myr’s lust enhancing venom escapes your body in a drawn out moan as your [pc.cockBiggest] throbs hard enough to lift the ruby tinted tart clear off the ground, carrying her on a sea of musky, vein-bulging flesh. The ant-girl hips begin to gyrate again, mindlessly rubbing her twin sexes through her own puddle of mixed juices.");
		output("\n\nThe mushroom, on the other hand, seems totally in control of itself, lifting it’s host’s head and pulling her into a better position. It prompts her to follow as it ");

		if(pc.hasCockFlag(GLOBAL.FLAG_FLARED,x)) output("gently nibbles on your flare, starting at the bottom and heading up");
		else if(pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED,x)) output("Smooches your foreskin covered tip, pulling the extra cockflesh into her mouth momentarily");
		else if(pc.hasCockFlag(GLOBAL.FLAG_NUBBY,x)) output("plays with the tiny nubs that cover your tip, alternating between the sensitive protrusions");
		else if(pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) output("kisses your tip, focusing her attention on the very end of your titanic member");
		else output("sucks on your glans, sloppily kissing the underside");
		output(". The myrmedion mimic follows behind at a delay, copying the mushroom’s movements with mirrored accuracy. Your breath begins to quicken from the combined sensations of their dual blowjob.");
		output("\n\nWith your attention focused on the myr, you haven’t noticed the river of precum that now practically trickles from your [pc.cockBiggest]. You can feel it throbbing with the need for release, and for a moment you question your choice of position. The urgent pulsing numbs your thoughts before you can act on them, instead filling your mind with images of what’s coming. Even if you wanted to stop, the crimson plated ant-girl and her androgynous toadstool show no signs of letting up.");
		output("\n\nTheir stimulus proves too great to resist, and your limbs splay out as your massive cum-cannon ");
		if(pc.cumQ() < 15) output("spurts a few streams of [pc.cum] over both you and the grateful pair");
		else if(pc.cumQ() < 50) output("blasts a few thick pulses of [pc.cum] that coat all three of your faces");
		else output("gushes a torrent of [pc.cum] that washes back over your bodies");
		output(". The myr-mushroom tag team licks and sucks you clean as you recover from the ordeal, making sure to get every drop of the [pc.cumColor] liquid. You resign yourself to being pampered for a while, at least until your partner recovers from her sex craze.");
		output("\n\nAfter a few minutes she pushes herself off your [pc.cockBiggest], rubbing her eyes and blinking away the haze. For the first time in half an hour you see recognition in her eyes, and you swear she’s blushing, even through the flush of heat. Her mushroom companion smiles happily, kissing her on the cheek and nuzzling relentlessly at her side.");
		output("\n\n<i>“S-sorry. I kinda blacked out there,”</i> she says with a nervous laugh. <i>“I think I’ll stay here and rest for a bit.”</i>");
		output("\n\nYou nod and stretch yourself out, grabbing your [pc.gear] before heading back to exploring the caves.");
		
		enemy.loadInMouth(pc);
		imbibeVenomEffects();
	}
	output("\n\n");
	processTime(19);
	pc.orgasm();
	if(!loss) CombatManager.genericVictory();
	else CombatManager.genericLoss();
}

//female
public function infectedMyrWinOrLossFuckForGirlTypes(loss:Boolean = true):void
{
	clearOutput();
	showInfectedMyr();
	author("Gardeford");
	output("You kiss the pale redhead again, leaning back into the rock and moss to give her a better view of your body. The nervous ant-girl ");
	
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	
	if(x < 0 || pc.totalVaginas() == 1) output("gingerly lines her alabaster cock up to your [pc.vagOrAss], flinching cutely at her own touch, still somewhat unused to having what she’s packing");
	else output("looks confusedly at [pc.eachVagina], mumbling about why your reproductive system has to be so complicated before you take over and line her up with your [pc.vagina " + x + "]");
	output(". She clears her throat as if mentally preparing herself for whats to come, but you’ll be having none of that, proceeding to wrap your ");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("[pc.tails]");
	else output("[pc.legs]");
	output(" around her waist to pull her in.");

	output("\n\nAt first she gasps with surprise, her mind not comprehending what has happened. It doesn’t take long for her body’s impulses to reach it, however, and her gasp escapes as a moan. She grasps your [pc.chest] to steady herself as wave after wave of pleasurable impulses crash into her brain, her hands clenching unconsciously in time with the twitching of her cock as you run your fingers up her thighs with alien confidence. You own her reactions right now, and it’s ");
	if(pc.isNice()) output("amazing");
	else if(pc.isMischievous()) output("amusing");
	else output("alarming");
	output(". Are these your thoughts or the fungus’s?");

	output("\n\nFor now it doesn’t matter. You rub her body up to the chest, taking one of her pert C-cups in each hand. The overwhelmed myrmedion coos as you squeeze them, testing the firmness before you move on, rubbing her nipples in small circles with your thumbs and smiling as they harden under your attentions. Your companion recovers eventually, squeezing her handholds and brushing her fingers against your own [pc.nipples].");
	output("\n\nHer knees press into your hips as she slowly slides her way into your [pc.vagOrAss " + x + "], letting out a number of heavenly noises as she does so, and you feel the heat and hardness of her human-like member as it penetrates you. The needful ant-girl pushes until her dick ");
	if(enemy.cockVolume(0) <= (x < 0 ? pc.analCapacity() : pc.vaginalCapacity(x))) output("is totally enveloped in your " + (x < 0 ? "rectum" : "folds"));
	else output("can’t move any deeper");
	output(", still pushing but unable to go any further. When she pulls out, she remains just as slow, and as good as this must feel for her it’s not doing quite as much on your end.");
	
	if(x >= 0) pc.cuntChange(x,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));

	output("\n\nAs soon as her porcelain-colored cock is nearly clear of you, you pull her back with force, slamming it into you with full speed. The unexpecting myr nearly goes limp, her hips seizing up as you " + (x < 0 ? "sit" : "clamp") + " down on her length. You relocate your hands to her buttocks, prompting her to fuck you by pushing and pulling them. It takes a few repetitions, but she begins to shakily pound you.");
	output("\n\nHer pace increases over time, eventually mounting as she collapses into your [pc.chest], her arms unable to support her as she humps madly into your depths. The shade of her mushroom companion cheers her on silently, watching with something akin to longing as the addled ant-girl has the time of her life. You ");
	if(pc.tallness > enemy.tallness + 8) output("hug her head tightly as she pumps her hips with abandon");
	else output("kiss and lick her chest as it bobs in front of you, your [pc.tongue] leaving wet spots on her pale skin");
	output(".");
	output("\n\nYou can feel her impending orgasm coming before it’s completely obvious, with her cock growing hotter and throbbing more often inside you, swelling as it prepares to fill you with fresh cream. You doubt the thought will occur to her based on her current lust-drunk stupor, but you tighten your hold on her to stop her from pulling out. The fuck-hungry futanari hardly notices, moaning as she loses the ability to hold it in for any longer.");
	output("\n\n<i>“Hnng,”</i> is all she can manage as her reserves break free. You join her in moaning as the inner walls of your [pc.vagOrAss " + x + "] are showered with hot jizz. Despite your best efforts to the contrary a little of it washes back out and slides to the cave floor. Her feet slip on the moist ground as she tries to push deeper into you, and they splay out behind her as she sporadically humps and gushes cum.");
	output("\n\nA loud bang shakes your eardrums as the fungal creature becomes solid again. It quickly goes about massaging the redheaded ant-girl’s spasming legs, calming her body down enough to just lie against you and bask in the feeling. Then it grasps your shoulder, giving you a sympathetic look as it starts to fade again. You aren’t going to have it. You ");
	if(pc.hasTailCock()) output("shove your [pc.tailCock]");
	else if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.tailCount > 0) output("poke the tip of [pc.oneTail]");
	else output("dip two fingers");
	output(" into the exhausted ant’s cunt, setting off aftershocks from her previous orgasm.");
	output("\n\nThe apparition fully solidifies again, a look of surprise covering its features. You reach up and grab one of its perky B-cups, finding them to be soft as marshmallows and just as pliable, before pulling it down atop the lust addled myrmedion, figuring she could use the softness to relieve some of her tension. The mushroom’s presence seems to reinvigorate her, and she turns to give it a deep kiss before returning her attention to you.");
	output("\n\nShe begins to thrust into you again, much more confidently than the first time. The manifested fungus assists her with gentle pushes against her butt, stopping sometimes to guide her hands to your [pc.chest] for a squeeze or to give her own C-cups a reassuring fondle. You continue to thrust your ");
	if(pc.hasTailCock()) output("[pc.tailCock]");
	else if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.tailCount > 0) output("tail");
	else output("fingers");
	output(" into her cunt, matching her pace thrust for thrust.");
	output("\n\nDespite her facade of bravery, she’s still unused to having a cock. Ragged breathing grows heavier by the second, and your ‘assistance’ isn’t helping to keep her calm. Her dick throbs with need inside you, practically shouting for a third release, and her determined thrusts have become wild and mindless, driven by the need for greater pleasure. The inexperienced ant-girl has become a house of cards ready to fall with the slightest breath.");
	output("\n\nYou opt for something a little stronger, leaning up and giving her a deep kiss, playing with her tongue like a toy. She folds into you, cumming even as her hips continue to move instinctively. Her cock slips out of your [pc.vagOrAss " + x + "] and splatters both of your stomachs with cum, some even reaching your [pc.chest].");
	if(pc.hasCock()) output(" [pc.EachCock] spurts out a few ropes of [pc.cum], joining hers between your bodies.");
	output(" Her own love tunnel tightens intensely around your ");
	if(pc.hasTailCock()) output("[pc.tailCock], which releases a torrent of [pc.cum] that floods her insides");
	else if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.tailCount > 0) output("tail");
	else output("fingers");
	output(" as she cums with her feminine end as well.");

	output("\n\nYou grip her tightly as you deal with your own orgasm. Hot white lights flash in your head as you tense and moan in rapture, and when you finally come back to your senses the ant-girl is passed out atop you, with the fully solid mushroom creature in a similar state atop her. You gently slide the pair off of you and gather your [pc.gear], leaving them to sleep as you return to your previous endeavors.\n\n");
	//(pass 1 hr)(pc gets nastygerms)
	processTime(50+rand(20));
	if(x >= 0) pc.loadInCunt(enemy, x);
	else pc.loadInAss(enemy);
	pc.orgasm();
	if(loss) CombatManager.genericLoss();
	else CombatManager.genericVictory();
}

public function leaveDatSlutBitch():void
{
	clearOutput();
	showInfectedMyr(true);
	output("You decide you’ll leave the infected girl alone for now, and shake yourself off as you head back to exploring the caves.\n\n");
	CombatManager.genericVictory();
	processTime(5);
}

public function showInfectedMyrMale(): void
{
	
}

//Male myr intro
//(triggered first time you enter the cave tunnel on map)
public function maleInfectedMyrEncounter():void
{
	clearOutput();
	showInfectedMyrMale();
	author("Gardeford");
	output("You decide to explore the passage nearly buried under glowing fungi. Mushrooms cover nearly every surface of the stone walls, and you notice that the passage looks more hewn than natural. Deciding to investigate, you carefully avoid the fungi as you step through the rocky corridor, noticing that the toadstools alternate between a number of soft colors, mostly shades of blue and green.");
	output("\n\nThe passage would be totally dark, but the pulsing lights help you see rather clearly. The soft glow lets you walk for a minute or two before the walls begin to widen into a bigger cavern. The inside is brighter than the tunnel, and the reason for it is a sight to behold. A number of gigantic crystals dot the room, covered in titanic mushrooms. Most of the crystals are covered in a myriad of cracks, each full of sprouting mushrooms.");
	output("\n\nYou pause, thinking you see something amongst the shining crystals, but the strobing lights prevent you from focusing on one place for long enough to tell for sure. Dulled creaking emanates from the larger crystals, and you wonder how much the fungi have affected their structural stability.");
	output("\n\nAs you listen you hear another sound, like the buzzing of an insect’s wings, and you have just enough time to jump back before a pair of large creatures fall atop the spot you had been standing. The tiny toadstools nearby are squashed in the confusion, flashing red and yellow as they lie flattened, and begin to slowly reform even as they’re knocked around.");
	output("\n\n<i>“Another one? I must be the luckiest male ever! First I fall asleep and wake up with superpowers, then I get not one but two slaves,”</i> he says with glee. You don’t like the tone in his voice. The person talking is a pale myr with golden blonde hair. He stands totally naked and unashamed. A human-like, alabaster cock hangs between his legs, looking to be about 14 inches long.");
	output("\n\nHis companion remains quiet, and you notice that it ");
	if (!CodexManager.entryUnlocked("Nyrea"))
	{
		output("is a carapace armored creature your Codex identifies as a nyrea");
	}
	else output("is a nyrean female");
	output(". She kneels next to the myr, totally naked with large amethyst breasts and pseudo-penis exposed to the cavern’s cool air. ");
	if (!CodexManager.entryUnlocked("Nyrea"))
	{
		CodexManager.unlockEntry("Nyrea");
		output("Your Codex mentions they are a very domineering race");
	}
	else output("You know the females of the race to be dominant");
	output(", so the sight of the proud looking myr holding her by one of her nearly foot long ears while she begrudgingly eyes the ground is somewhat unnerving.");
	output("\n\n<i>“At first this slut thought she was the one hitting the jackpot, but then I realized I had super powers and she changed her mind,”</i> he says, leaning down next to her and kissing one of her ears. The nyrea shudders but hides whatever feelings she has as her captor stands. What you thought was a human looking cock opens like a three jawed mouth, with a slimy red tendril for a tongue. The tentacle slides up her cheek, leaving a shiny line of what you assume is pre-cum before it slides back and returns to a normal look.");
	output("\n\n<i>“So what do you say? I’m sure you two will get along wonderfully together!”</i> he says as if you’ve already agreed. When you inform him that joining his harem is not on your list of things to do his features change in an instant. Instead of the jovial ant-man you’d been treated to he smiles wickedly and speaks in a calm, calculated tone.");
	output("\n\n<i>“I guess I’ll have to convince you then.”</i>\n\nIt looks like you’ll have to fight.");
	//[fightshit]
	clearMenu();
	processTime(2);
	//startCombat("male infected myr");
}

//14" DONGER! (ALABASTER!)
/*
output("\n\nPhase punch");
output("\n\n//basic attack");
output("\n\nThe Gold myr punches with both of his right fists, leaping at you with harmful intent.");
output("\n\n//hit: The punches rattle you, nearly knocking you over.");
output("\n\n//miss: You dodge the punch, but a lean mushroom creature materialises and throws a single punch at you.");
output("\n\n//hit: the second punch hits you, not as heavy as the first two, but still damaging.");
output("\n\n//miss: You avoid the second punch as well, watching as the creature disappears like smoke.");

output("\n\nBullet punch");
output("\n\n//some mid % chance to use for any given attack");
output("\n\nThe myr throws his fists at you, and a number of alabaster fists emerge from the air around them, moving with varying degrees of speed.");
output("\n\n//hit: The punches slam into you one after the other, hitting different parts of your body with painful force.");
output("\n\n//miss: You avoid the rapid onslaught of fists, dodging to the side as they pass by, knocking rock chips off the cave wall.");

output("\n\nLightning");
output("\n\n//90% chance to use if pc is shielded");
output("\n\nThe myr steeples both his sets of fingers, and the mushroom creature solidifies above him. The air crackles around them as a flurry of spores shoot from its mouth in your direction.");
output("\n\n//hit: As soon as one of the spores connects with your (shield/body) a shattering blast of electricity courses along the path, igniting the small number of spores and nearly blinding you with light.");
output("\n\n//miss: The spores fly by you harmlessly, their course thrown off by cave air currents.");

*/

/*
//Male victory
//requires a dick
public function maleVictoryOverInfectedMyrMale():void
{

}


output("\n\nThe overpowered myr drops to the ground, his manifested assistant shimmering before it disappears completely. The nyrea <i>“slave”</i> is on him in a second, pinning all four of his arms beneath her knees and grinning wickedly. The gold myr struggles fearfully under her, but in his defeated state he appears to have lost his boosted strength, and she easily holds him down as she feels him up.");
output("\n\n<i>“Not so strong without your weird thing, are you! I’ll just have to teach you manners while I can so you don’t think about doing this to anybody else. If you want a harem you have to be strong like this [pc.guyGirl], because losers like you are better off as buttsluts in someone else’s harem.”</i> The pinned ant gulps as she says this, eliciting a laugh from her as she gets up, flipping him onto his stomach and holding his arms between her hands.");
output("\n\nShe lines herself up at the entrance to his rear, her bristly tip poking his cheeks. Before she does anything she seems to remember something and turns to you.");
output("\n\n<i>“Feel free to join in if you want, but don’t get too wild. This is just a gift for saving me,”</i> she says, presenting her amaranthine ass for you as she lines herself up with the myr’s.");
output("\n\n(malemyr option menu)");
output("\n\nYou couldn’t ask for a better reward from her, discarding your [pc.gear] onto a particularly wide mushroom that flashes yellow at you in protest. With a nod, the armored woman turns back to her prey, sinking a few inches into the protesting myr’s backside. His mushroom infected nerves must be influencing him, because despite his objections he moans as her knot bumps into his anal ring.");
output("\n\nYou move up behind her, cupping her soft butt in your hands as you spread her cheeks to make way for your [pc.cock " + x + "]. As you push into her, you gasp at the heated embrace of her insides when the anal passage parts before you. Your insertion pushes her forward enough for her knot to pop into her target’s own hole, a not so subtle moan marking the event for you. She shifts to accommodate the action from both ends, her muscles tensing as she moves and clamping around your [pc.cock " + x + "].");
output("\n\nThe carapace on her back is hard, but positioned so that the plates can move easily with her body’s movements. The exposed skin is softer, but toughened by life underground. Firm E-cups provide the perfect means to steady yourself as you hump into her, and you pinch her stiffening nipples as your hands pass them. The alpha predator’s ass clenches as the feedback from her knot reaches her, and the tightness makes it tough to move.");
output("\n\nIn the end you don’t need to accelerate your pace much. As the purple skinned cave-dweller fucks the golden ant-man, her anal passage gyrates around you like an exceptionally tight onahole. She hums pridefully as you squeeze her ample tits, kneading the pale mounds with both hands, and you follow up by moving a hand down her chest, cascading over the corset-like carapace that covers her stomach until you touch skin again. You tickle her knot as it tugs at the gold myr’s backside, setting her chitinous legs to quivering.");
output("\n\nShe presses back into you as you continue, looking over her shoulder and giving you a lusty glance. Obviously you’re doing something right, so you continue your massaging and fucking as she does the same. Her naturally plated armor starts off cool and refreshing, but soon matches your heat as the flames of your lust raise its temperature.");
output("\n\nThe nyrea alpha is the first to cum, burying herself in the myrmedion cocksock and shuddering in pleasure. Her passage to constrict your [pc.cock " + x + "] with heavenly pressure, pulling you along into blissful oblivion. You blast her insides{multicock:, and outsides too}, with an injection of [pc.cum], and not a single drop escapes while the two of you share an earth shattering pair of orgasms.{lotsacum: After you’re finished the nyrea is left with a pregnant looking belly-full of [pc.cum].} The ant-man sighs with pleasure, apparently having cum himself from the ordeal.");
output("\n\nYou extract yourself from the nyrea’s tight passage with some difficulty, as she resumed fucking the poor myrmedion the moment she came off the previous orgasmic high, and as a result you’ve returned to full hardness before you make it out of her anal love tunnel. {Your [pc.cum] dribbles out in pulses as she humps her prey with a satisfied smile. }She must be in a very good mood, because as you move around to her front she uses her long tongue to pull [pc.cockBiggest] up to her mouth.");
output("\n\n{lowcum: <i>“Good to go again, are you? This fool can barely go once,”</i>/cumfill: <i>“Enough cum to make me look full of eggs and you can still go again? This fool could learn something from you,”</i>} the nyrea dotes as she cleans you, inhaling your essence like an aphrodisiac as she slowly works her prey’s ass. Once you’re nice and spit-shined she grasps your hip with one hand, sucking your [pc.cockHeadBiggest] between her lips. The suction and her tongue work at the same time, creating a wonderful pleasure vacuum that threatens to have you in the heavens for a second time in as many minutes.");
output("\n\nYou manage to hang on with sheer willpower, wanting to get as much of this wonderful feeling as possible. The sensation of her warm tongue on your cumslit and her exhaled breath on your shaft is heavenly, but your need for release rises with her own, and her moans increase in volume as her cocktrap becomes too tight for her to resist. Her grip tightens while she sucks your [pc.cockHeadBiggest] with all she has, and you see the gold myr coat the ground with another shade of white.");
output("\n\nYou paint the nyrea’s throat a {pcwhitecum: similar/othercolor: different} shade, pouring rope after rope of [pc.cum] into her eager receptacle as you steady yourself with her needle-like hair.{lowcum: When your flow eases, the alpha slips a finger into your backside, massaging your prostate until another couple spurts join the rest.} Your [pc.cum] dribbles out of her lips and down the sides of her chin, meeting under her jaw to drop onto her bouncing breasts. The [pc.cumColor] rivers flow around her nipples until they drip into puddles on the myrmedion’s back.");
output("\n\nOnce your flow has stopped, she pulls back, licking her lips and grinning as she stands, pulling her softening member out of her chosen hole and picking up said hole’s owner by the waist. The hapless ant-man stays resigned to his fate for the moment, and the nyrea takes him {for/back to} her harem.");
output("\n\n<i>“One of these days I’ll have to get you to fertilize some of my eggs. They could use a strong father like you,”</i> she says as she carries her acquisition back to the caves. As you gather your gear and follow her you think you hear something in the larger expanse of the cavern. You look back warily, seeing nothing but the occasional floating spore and glowing mushrooms on the larger crystals. You shrug and head back to your previous endeavors.");

output("\n\n(next time pc visits this room fungal queen scene procs)");

output("\n\nFemale victory");

output("\n\n//requires girlbits");

output("\n\nThe overpowered myr drops to the ground, his manifested assistant shimmering before it disappears completely. His nyrea <i>“slave”</i> is on him in a second, pinning all four of his arms beneath her knees and grinning wickedly. The gold myr struggles fearfully under her, but in his weakened state he appears to have lost his boosted strength. She easily holds him down as she feels him up.");
output("\n\n<i>“Not so strong without your mushroom thing, are you? I think I’d rather let this [pc.guyGirl] have [pc.hisHer] way with me than have someone who needs to cheat. In fact, I think I’ll make you watch while [pc.heShe] does just that. Provided that’s something that sounds appetizing to [pc.himher],”</i> she says, directing the last comment at you with a lusty gaze. She leans down, biting the gold myr on the arm and eliciting a yelp as the paralytic toxin courses through his veins, preventing his recovery for a good amount of time.");
output("\n\nThe lavender-skinned nyrea scoots away from him, posing for you and making sure her body is prominently on display. She looks at you inquisitively, waiting for your response to her sideways request.");
output("\n\n(malemyr option menu)");
output("\n\nYou saunter over to her half-prone form, taking in the smooth looking curves of her corset-like carapace, and you notice her pseudo-penis beginning to stiffen as she eyes you in return. It would appear the lilac skinned huntress likes what she sees.");
output("\n\n<i>“{I’d love to teach him a lesson with someone as beautiful as you/I don’t see why not. Chances like this are rare after all/I’m sure we can work something out. It’s not often an alpha predator gives you free rein of her body},”</i> you tell her as you {tentacle and snake/goo/other/[pc.hasKnees()]} {coil/slip across her feet, reforming/position yourself/kneel} between her legs. She eyes you with eager anticipation, obviously waiting for you to take the lead. You lean in and kiss her to begin with, and her tongue jets into your mouth once yours pierces her lips, causing you to stiffen slightly as she plays around in your mouth. A small amount of venom must have been left over from the bite. There isn’t enough to fully paralyze you, but there’s plenty enough to get");
if(pc.hasClit() || pc.hasCock())
{
	if(pc.hasClit()) output(" [pc.eachClit]");
	if(pc.hasClit() && pc.hasCock()) output(" and");
	if(pc.hasCock()) output(" [pc.eachCock]");
	output(" stiff as your body would’ve been.");
}
else output(" your body as aroused as ever.");
output("\n\nYou pull back from the kiss, giving the nyrea a lusty gaze that she returns for a few seconds, before tackling her with another kiss. She catches you, and the two of you fall to the cavern floor, pressing into each other’s bodies as the lust inducing portion of the venom floods your veins. You moan as her firm E-cups press into your [pc.chest], the space between you growing tighter with each breath");
output("\n\nBoth of your voices escape as {your nipples brush together/her hard nipples graze your flesh}, the heat of your passion keeping you warm in the cool cave air. Your partner matches you breath for breath as you devour her essence, locking to your lips with wild fervor. Her lilac-colored melons press snugly against your {flat chest/ {larger/smaller/equally enjoyable} [pc.breastCupSize]’s}, keeping every bit of the heat between your bodies in its place.");
output("\n\nAfter what seems like an eternity, you manage to pull away from her intense kisses and duck lower along her body. Your lips touch her skin and chitinous carapace as you go, leaving remnants of desire that dot her frame from head to waist. She stares on longingly as you take her pseudo-penis in both hands, gripping it between them. A thin line of lubricant escapes its tip, trickling down to your hands where it creates a smooth sheen as you softly work the slippery liquid into her skin.");
output("\n\nYou lean in close and brush your nose against the rubbery spines that top her false cock, smiling as she twitches and sighs at the feeling of it. You slowly travel down her rod with your attentions, giving her a big wet smooch on the knot that sets her to moaning. The cute cave-dweller squeezes her tits to try and relieve the combination of pleasure and pressure welling up inside her, and you take advantage of the situation to suck at her pretty purple nipples, stroking the hardened nubs rapidly with your [pc.tongue].");
output("\n\nThe whole while, you begin to carefully line the end of her pseudo-cock up with the entrance to [pc.oneCunt]. You steadily gyrate atop her spiny head, glossing the tip with slick juices. The thick tool swells in your hand as you align it, spurting a little extra lubricant to make the job easier. The look in the poor woman’s eyes is one of utter need as you continue to tease her.");
output("\n\n//pc super tight");
output("\n\nYou don’t tease for too long, not wanting her to get tired of your antics and go full alpha. When you finally slip down on her impressive shaft, the lubricant makes the task a little easier, and her thickness is incredible, so much so that you think if you weren’t drugged out of your mind it might be a bit painful. For now, however, all you can feel is every inch and contour of her pseudo-cock as you slide down its length, continuing as such until you reach her knot, sitting atop the swelled bulb for a few seconds before resigning yourself with the fact that it won’t fit.");
output("\n\nThe nyrea doesn’t seem interested in whether her knot will fit, simply shuddering as she struggles to stay focused with your tightness constricting her most sensitive of external organs. You begin moving your hips in a circular motion, letting her well lubed pole shift and throb inside you. The haggard cavedweller lets out a loud moan, grabbing hold of your [pc.butt] with both hands to steady herself as her head falls back to the mossy ground.");
output("\n\nYou keep on the attack, lowering yourself to her neck as she holds you steady on her pseudo-cock. You lay kisses up her throat and all the way to her chin as her head arches back. The predator is at your beck and call while her sensitive shaft is trapped in your vice-like tightness, and you plan to enjoy every second of it. The nyrea babbles something about her cock and lubricant, but you just kiss her to silence it and continue fucking her.");
output("\n\nThe baffled beauty claws at your [pc.butt] for a few seconds before her body seizes up in orgasm. Your distraction gave her nerves enough time to overwhelm the defenses her brain had been organizing. You never stop moving your hips, keeping her locked in pleasurable agony, and can feel her heart beating fast through her chest.");
output("\n\nShe never gets the chance to calm down. Her pseudo-cock throbs needfully as you gyrate atop it. The spines on her tip are pressed so tightly by [pc.oneCunt] that you can only feel the impression of their sides on your walls. All the while your nethers polish the top of her swelling knot, leaving it shiny and dripping with your [pc.girlcum]. The nyrea female fades in and out of focus as you work her, alternating between assisting you and letting you do whatever you want.");
output("\n\nSlowly but surely, your drug fueled body begins to ease into the motions. Before you fully realize what’s happening the tight entrance of [pc.oneCunt] slips over her engorged knot, burying the sensitive globe in unbelievable pressure. The nyrea groans and gropes feebly at various parts of your body, giving you weak squeezes as her thoughts struggle against the overwhelming sensations they’re being subjected to.");
output("\n\n<i>“Can’t cum-mmm... too tight!”</i> she struggles to say, but you hardly hear her as the frantic throbbing of her knot echoes through your body. It overpowers every threshold that had stood firm until then, blowing your reason out of the way with blissful orgasm. You clamp down even tighter for a moment, kissing the nyrea to hopefully soothe her torment. She returns your sentiment, obviously trying her best to keep her mind off of current events.");
output("\n\nOnce your spasming has ended, you tug yourself off the still painfully swollen knot. It takes a few quick pulls, with the poor nyrea moaning at each one, but you eventually come off with a pop. You feel a tiny bit looser than before, but still plenty tight. You slide up her pulsing pseudo penis, leaving a slick shine on its length. A few seconds after your tightening ring leaves its tip the cave-dweller lets out a loud shout of pleasure.");
output("\n\nHer pseudo-penis swells once, the spines stretching gratefully, before squirting pulses of pent up lubricant. The sticky juices shower your body, leaving you as shiny as her rod and twice as slippery. The exhausted woman lies on her back, panting slowly and resting her eyes. You lie down with her, using her body for a pillow as you casually share your slippery coating with her and join her nap.");
output("\n\n//pc not too tight");
output("\n\nYou tease her for a little longer, but don’t push your luck too much. It would be a shame if she got impatient and rescinded her offer to be beta, so you glide down atop her impressive shaft, feeling the gentle throbbing of her rod against your inner walls. Her pseudo-cock fits you just right, and you continue until you reach her knot, sitting atop the swelled bulb for a few seconds before letting it work its way inside you.");
output("\n\nThe nyrea notices how perfect a fit she is for you, matching your gyrations and letting her cock slip around within you. You begin to slowly move up and down in the space between her knot and her pelvis. The tingly barbs that top her head poke at your inner walls, sending tiny shockwaves to the pleasure centers of your brain that scream for you to never stop feeding them such wonderful input.");
output("\n\nYou’re happy to do just that, collapsing onto the cave dweller’s firm E-cups as you hump her cock with fervor. The lubricant that drips from her tip mixes with your juices and slides down her legs, forming a puddle beneath you that’s equal amounts sticky and slippery. You rub one of your hands into the puddle, using it to massage one of her tits as you suck on its twin’s nipple. She moans as your sex greased fingers flit back and forth across her hardened bud.");
output("\n\nThe slickened orb of her knot feels amazingly warm inside you, and you can hardly feel the cool air of the cave anymore in the midst of your fervent love-making. The nyrean sub assists you by bucking her hips up in time with your riding, her lilac-shaded buttocks splashing in the pool of sex juices beneath you. In the heat of the moment, you pull her head toward you, catching one of her long ears with your [pc.tongue] and pulling it into your mouth. She shouts in pained pleasure as you bite down roughly, but doesn’t pull her ear away.");
output("\n\nAs you continue to nibble her sensitive aural organs, her hips slow to a snail’s pace. You appear to be overwhelming her nerves with the number of sensations you’re throwing their way, and she shivers with a feeling that’s far from cold as her pleasure continues to climb like the pressure of a boiler. You have a feeling it won’t be long until something is overloaded and all of that pressure floods out at once.");
output("\n\nEach time the ring of [pc.oneCunt] tightens around the bottom of her now fully swelled knot, the nyrea’s moans get the slightest bit louder. The veritable lake of juices beneath you grows large enough that your [pc.legs] lose(s) (their/its) traction, sliding out from under you and dropping you all the way to the hilt of her magnificent rod. Her eyes widen as her moans catch before they leave her lips. You kiss her throat in an attempt to relax the muscles as she cums, but the rapid twitching of her false-member quickly brings your own orgasm to bear.");
output("\n\nYou clamp tightly to the entirety of her length, trapping her within you as she breathes in deep gasps. Your position atop her can’t be helping her breathing situation, but you’re hardly in a position to move yourself. The two of you lie there spasming as the gold myr stares paralyzed at the cave ceiling. You hold tightly to each-other’s bodies to steady yourselves as you ride out the storm of lust and electric delight.");
output("\n\nOnce the two of you calm down, her knot and shaft slip out of you with a small pop, still connected to you by strings of pent up lubricant. She stays on the ground, muscles totally relaxed and breath steady. You stay atop her, using her body as a bed and pillow as you regain your strength. For now you’re content to join her in napping until you feel capable of walking again.");
output("\n\n//merge");
output("\n\nYou wake an hour or so later, getting up from your living cushion and stretching. She copies you, still looking a bit tired out, but smiling as she picks up the gold myr’s stiffened frame. He whimpers in pain but seems resigned to his fate. The nyrea smiles as she takes him off to be a part of her harem. She turns back to you before leaving the cave through the tunnel entrance.");
output("\n\n<i>“I’ll have to get you to bear some of my eggs sometime. They could use someone as strong as you to carry them,”</i> she says as she carries her acquisition out of the sub-cavern. You gather your [pc.gear] and begin to follow her, but stop for a moment. You turn around thinking you had heard something, but you only see the occasional white spore floating in the space around the giant glowing crystals. You shrug and return to your previous endeavors.");

output("\n\n(next time pc visits this room fungal queen scene procs)(pc stretched out a little if too tight)");

output("\n\nMalemyr option menu");

output("\n\n[yes](yes returns to scene)[nothanks]");

output("\n\nNothanks");

output("\n\nYou tell the nyrean huntress that you’ll have to bow out for now. She gives you an incredulous look, as if she can’t quite believe you would turn the opportunity down. In the end she simply shrugs before turning back to her former captor.");
output("\n\n<i>“Suit yourself, more fun for me”</i> she says, picking up the weakened myr and toting him out of the sub-cavern. You begin to follow her, but turn as you think you hear something deeper in the cave. All you see is a small number of white spores floating in the mass of glowing crystals. You shrug and return to your previous endevours.");

output("\n\nMale myr loss");

output("\n\n//no requirement");

output("\n\nYou collapse, unable to hold yourself up under the Gold myr’s assault, and he laughs as you fall, landing hard on the cave floor. Luckily your fall is cushioned by some mushrooms, but they don’t help soothe the ache in your body.");
output("\n\n<i>“Aww, looks like somebody can’t fight anymore. I’ll have to give you a taste of what life is like in my harem, but since I’m only going to take you if you want it... I guess you won’t be able to participate in the demonstration,”</i> he says with an exaggerated frown. He gives the nyrea female kneeling at his side a shove with his hip, pushing her toward you. She begrudgingly crawls toward you, her full breasts bobbing rhythmically as she moves.");
output("\n\nThe lilac skinned prisoner pauses in front of you, looking at once afraid and resilient. The ant-man nudges her on, a ghostly aura emanating from his shoulders. The nyrea bares her fangs, finally digging them into one of your arms, and you feel the paralytic poison almost immediately begin to stiffen your muscles, starting in your arm and spreading until you are unable to move beyond twitches. As if to add insult to injury, the toxin also leaves you feeling incredibly horny.");
output("\n\nThe gold myr pulls his slave back by one of her chitinous legs, letting her skid across the cave floor a few feet. He massages her shoulders with all four of his hands, but she doesn’t seem to relax at all. If anything she stiffens further at his touch, looking as if she wishes she was anywhere else right now. She directs a sideways glare in his direction that only you can see.");
output("\n\n<i>“I don’t know if you know this, but these nyrea have wonderful mouths. You’d never know cause all they want is harems of people to impregnate and fertilize their eggs with,”</i> he says, rubbing his humanoid cock on her face. You see what’s coming before he ever has the chance, and the nyrea bites down on his dick about three times as hard as she did on your arm. To your surprise he hardly reacts, grunting as he adjusts to her tugging.");
output("\n\n<i>“I thought you’d learned about how well that works the last time,”</i> he says with the same confident tone. His cock unthreads in her teeth, splitting into three jawlike feelers. The feelers spread, two up and one down, covering her chin and eyes as he directs her to face him. A slimy tentacle cock slithers about of the space between them, sliding into her mouth as its length fully escapes.");
output("\n\nThe bottom cockjaw holds her mouth open so you can see the tentacle dance with her tongue, tickling her cheeks and gums as it encircles as much as it can. The predator’s body twitches, her fists clenching as her myrmedion oppressor holds her arms down with his own lower pair. Her face begins to flush with each contact the tentacle has with her tongue. Whatever liquid it’s coated with must be some form of aphrodisiac.");
output("\n\nThis playful attitude continues until the lower jaw pushes her mouth shut around the tentacle’s base. The feelers begin to hum and glow softly as you see the tentacle bump against her cheeks at odd intervals. A few seconds after the humming begins the nyrea starts to suck on the base of the tentacle, making sure none of it escapes and even going so far as to press her head deeper into the ant-man’s pelvis.");
output("\n\nOnce she seems placated enough, he even removes his hold on her arms, letting them lie limp at her sides. His lower pair of hands move up to squeeze her firm E-cups, pinching each of her nipples between the knuckle of his pointer and middle fingers. She moans and continues to suck, her hands moving up to assist him in fondling her breasts. Her hands cover more space than his, squeezing the sizeable melons roughly while he plays with her nipples.");
output("\n\n<i>“That’s right, I should just go straight to this more often. The look suits you,”</i> he says as he brushes the spikes that make up her hair. He sighs happily and you hear her moan as she sucks the tentacock. Her cheeks swell, filling up with what you can only assume is cum. At first you think it will spill back out of her mouth, but the feeler at her throat begins to vibrate. she swallows the cum immediately, gulping it down even as her cheeks are filled again and again.");
output("\n\nWhen the flow finally stops the cock-jaws loosen and peel away. The nyrea’s eyes are unfocused and staring into nothingness. Her tongue lolls out of her mouth, remnants of the massive flood of jizz dripping off of it and onto her lilac-colored tits. Her hands smear the pearly cream over her skin like lotion, and the shapely curves coupled with her attitude make you jealous, unable to move because of the toxin in your veins.");
output("\n\nIgnoring you, the arrogant ant stands his former predator up. She stands nearly a foot and a half taller than him, his head barely reaching her breasts. His upper pair of arms hug her around the shoulders and pull him up into a kiss. Once he’s up, she grasps him around the waist with both hands, supporting him so that he’s on level with her head. His lower pair of hands slides over her cum slickened breasts, down her stomach all the way to her pseudo-penis.");
output("\n\nShe moans into his mouth as he strokes the sensitive instrument, coddling her knot with both hands before sliding one of them along the base and brushing her cat-like cockspines. With every strum of the needle-like protrusions she swells slightly larger in his hands. Droplets of clear lubricant fall from the hole at the tip of her pseudo-cock, falling wasted to the ground as she kisses her former prey with eyes closed.");
output("\n\n<i>“Now let’s get to the part you always love, fertilizing those perfect little eggs in your belly,”</i> he says, talking to her with a pleasant tone and rubbing her stomach for emphasis. In her state she doesn’t seem to wholly understand him, but at the mention of fertilization her pseudo-penis starts dripping lubricant about twice as fast as it had been before. The tips of the gold myr’s mouthcock latch onto her knot, beginning to vibrate softly and eliciting a moan from the nyrea. Her anticipation is apparent in her eyes, having finally found focus in the cock.");
output("\n\nThe slimy tentacle-cock tickles her barbs before sliding slowly into her slit. He pulls her into a kiss at the moment of penetration, and she nearly goes limp as her senses are overwhelmed by lust induced vertigo. Her chitinous legs quiver as her hold almost slips, but she manages to stay up through some mockery of will. The aphrodisiac laden tentacle slips inch by inch into her sex tube, the appendage only hardening further as her ovipositor is filled to the brim.");
output("\n\n<i>“It’s all the way in now, only a matter of time till you’re swimming in fertilized eggs. What should we do with them, eh? Maybe I should masturbate you till they all come out and then stuff them into your warm, welcoming ass. I bet you it’ll feel absolutely orgasmic when I do it,”</i> he whispers in her ear. Up until then the nyrea had been doing a good job keeping her footing, but as soon as he reaches the word orgasmic her knees buckle and she begins to fall.");
output("\n\nThe gold myr doesn’t skip a beat, fluttering his wings so their fall is nothing more than a soft glide to the cave floor. He lands using her beautifully pale purple breasts as a pair of soft pillows, planting kisses along them as she writhes in pleasure. The poor alpha can’t seem to stop cumming, thrusting her hips up and lifting the ant-man into the air. He smiles as she tenses, keeping balance with his upper arms while the lower pair stays focused on pumping her pseudo-cock.");
output("\n\nSoon enough he’s moaning as much as she is, and with one final clutching grasp of her tits he cums into her. She ceases her thrusting and cums quietly as her love canal is filled with copious amounts of spunk. {[pc.eachCock] hardens longingly/[pc.eachVagina] wettens sympathetically/you look on longingly} at the sight, and the power-crazed myrmedion holds her pseudo-penis straight as he covers every one of her eggs in his sperm.");
output("\n\nThis continues for a few seconds until both of them collapse into relaxation. The gold myr draws his hips up, pulling his tentacle dick from its improvised sheath. Its removal is like the popping of a cork, letting a steady stream of thick jizz trickle from its tip. He helps her into a sitting position, her legs flopping uselessly to the side, and holds her up with his left arms while his right pair massages her stomach and fondles her pseudo-cock.");
output("\n\n<i>“That’s it, just imagine you’re knot deep in a sexy myrmedion female, or another of your race, I don’t know what you savages prefer. The feel of their muscles contracting against you just makes you want to dump all your eggs inside right away, doesn’t it?”</i> he whispers, and the nyrea female groans at the thought, her faux-cock swelling as the first lucky egg begins its journey to freedom. The gold myr gently milks the tube as the eggs travel through it, watching them pop out one by one.");
output("\n\nThe eggs slip out slowly, kept warm outside by the puddle of virile jizz that’s expelled alongside them. Their owner doesn’t seem aware of them, lost in her fantasies of depositing them in a warm hole. Altogether four of the lukewarm eggs exit her hole, sitting nicely in their cum-puddle as the carapace armored girl continues to futilely contract. Small strings of cum and lubricant connect her to the eggs and new droplets form with every twitch of her muscles.");
output("\n\n<i>“Now they just need a warm place to stay. Your butt’s pretty cozy isn’t it? I’m sure they’ll love it there,”</i> he coos mockingly into her ear, but his words are totally lost on her. It seems like she’s still on cloud nine thinking of ovipositing her eggs. The myr seems to remember that you exist, shifting the endlessly orgasming cave amazon so that her purple pucker is perfectly visible to you. Between her chitinous legs you can see her full breasts pushing into the damp ground of the cave.");
output("\n\n<i>“But first we have to prepare your cavity! You’ll need some high quality lube so those eggs slip in easily, and you can’t exactly do it yourself, so I guess my cum will have to do,”</i> he says matter-of-factly, gripping her firm buttocks and massaging the cheeks as he lines the tentacle cock up between them. It slides up as if licking her before drilling into her hole. Despite her near drunken stupor she moans, hands gripping a pair of mushrooms to steady herself as her ass is drilled into ecstatic oblivion.");
output("\n\nHer pseudo-penis dangles between her legs, dribbling cum-lube cocktail as her whole body shudders with the fucking she’s trying to handle. The gold myr soon stops thrusting, lying against the taller girl’s back as he lets her ass milk him for all he has; he gives it all it wants, spurting rope after rope into her depths. This hole is unable to contain the flow, and a couple pulses of creamy spunk pour back out and run down her faux phallus only to fall into the rapidly growing puddle of sex juices that she lies in.");
output("\n\nThe gold myr wastes no time, picking up all of the eggs before the newly crafted incubator empties, one in each hand, and closes the jaws of his mouthcock. You watch paralyzed as he stuffs them one by one through her loosened hole. After the four eggs are firmly planted he plugs her up with a thrust of his dick; the nyrea female is only able to moan in rapture as he cements her status as a hotel for her own eggs.");
output("\n\n<i>“Good girl... now you can rest. If you liked what you saw be sure to come back. I’d still be happy to let you join, and I always love doing stuff like this,”</i> he says, picking up the insensate and heavily pregnant looking predator with two of his arms, carrying the taller woman off towards the crystal lattice while whistling. The toxin in your body wears off after a few minutes, leaving you tired and horny. You want nothing more than to get back to civilization and sleep or fuck, in whatever order comes quickest. Both at the same time would be okay if need be.");
output("\n\n(pc lose nothing but dignity)(lust +90)");
*/

public function fungusQueenRoomBonus():Boolean
{
	if(CodexManager.entryUnlocked("Myr Fungus") && flags["LET_FUNGUS_QUEEN_DIE"] == undefined && flags["FUNGUS_QUEEN_SAVED"] == undefined)
	{
		fungalQueenEncounter();
		return true;
	}
	return false;
}

//Fungal queen encounter
//(unlocked after male myr is defeated)
public function fungalQueenEncounter():void
{
	showFungusQueen();
	author("Gardeford");
	output("\n\nYou can hardly see the titanic crystals, or any glow reflecting from them for that matter. The air is filled with white spores of varying sizes, looking almost like snowflakes floating in the cool air. The many fungi that dot the cave walls glow a dim blue, making the crystalline spores shine and reflect as they fall.");
	output("\n\nAt least you think that’s what they’re doing at first. The tiny balls of light seem to be falling, but upon closer inspection they simply fall a few feet before spinning in the air and curling around on a repeating loop. You note that none of them hit each other, spiraling in intricate swirls through the open space. The larger mushrooms shudder periodically, releasing a cloud of new spores that move to fill another area of the cave.");
	output("\n\nYou ");
	//pc infected: feel compelled to move further into the cave
	output("move cautiously further into the cavern");
	output(". The agile spores alter their looping course slightly to avoid you as you walk by, moving like dancers out of your way. They resume their prior course when you leave their specific zone, so you pay them little attention, merely being careful not to touch them as you pass. You also make sure to avoid the scattered toadstools that litter the floor.");
	output("\n\nThe gems before you are obscured to some degree by the false snow, and you can only see a few parts of them at any given time. It isn’t long before you notice that you are walking between two of the colossal structures, their shining surfaces mostly devoid of intrusion by the fungus except at the creases. Softly glowing mushrooms spread tendrils into any opening");
	output("\n\nAs you approach the rear of the cavern a sound catches your attention. It sounds familiar, but difficult to place. It sounds like music, but unlike any you can describe. The words, if they can be called that, are not ones your mouth can make, and you find no answers in your Codex’s translator. You must be the first space farer to hear these noises, whatever they are.");
	output("\n\nA cloud of spores moves, allowing you to see a little further ahead, and you tense at the sight they reveal. A female gold myr sits on a chair sized mushroom, surrounded by a tiny whirlwind of spores that pulse with vibrant colors. She bobs in time with the sounds, her eyes totally blank and staring at nothing as the fantastic colors reflect in them. Her hair is a shining gold, looking as if it were literally dipped in the metal instead of the average blonde.");
	output("\n\nBeside her is the source of the noise. A tall, stark white figure stands a few feet from her reclining form. Standing might not be the most appropriate word for it though, as instead of feet she is simply anchored to a half sphere. Upon closer inspection the half sphere is actually the pregnant looking belly of a red myr, one who looks equally enraptured by the song as the other girl. The tall white woman is perfectly still atop her seemingly ecstatic host.");
	output("\n\nUnlike the other fungal manifestations you’ve seen");
	if(flags["MET_INFECTED_MYR_FEMALE"] == undefined && flags["MET_INFECTED_MYR_MALE"] == undefined) output(" (pictures of on the codex)");
	output(", she appears to be wearing a translucent gown that flows from her shoulders down to the base of the stalk that connects her to the myr. The gown flows as spores collide and brush along its length, and it glows with a rainbow of colors as it is touched. Another very noticeable difference is the flower-like nipples that tip her E-cup breasts, easily visible beneath the fluttering dress. Her figure is curvy and full, but below the butt her legs meld into a single mushroom stalk. Her hair, unlike the caps of the other mushroom creatures, falls to the middle of her back. It seems totally transparent, more like strands of glass than hair, but flashes with colors that match her dress.");
	output("\n\nShe notices you staring and returns your gaze with a smile, her eyes glowing with a welcoming blue light. The song stops as she does so, and you take a step back, or at least attempt to as a cloud of spores pushes you onward, closer to this queen-like fungus. The snowy spores around the two of you obscure your view of the cavern, and the queen beckons for you to come closer. You feel yourself stagger toward her despite the situation, and nothing about her seems frightening, but part of you feels like she should be. When you get close enough she turns to the gold myr, brushing her hair and holding her chin.");
	output("\n\n<i>“Don’t be overwhelmed. I couldn’t help but notice you, and I think we both have things that can help one another,”</i> her words come slowly and haltingly through the mouth of the myr. After she finishes she turns back to you, steepling her fingers and waiting patiently for your response. You ask her what she means, and one of her hands returns to the myr.");
	output("\n\n<i>“This cave has... something you look for. I don’t know what you call it, a metal material. There is a deposit. This one’s superior officers let slip about it, so now I know. I have something I wish for you to do. If you do not wish for this metal, I am sure I can share other things with you that may make my offer more appealing. I hope you will at least consider what I ask,”</i> her tone is more serious than before, but her face remains as sincere as it was when she first glanced your way.");
	output("\n\nYou ask her what exactly she wants you to do. She rubs the gold myr gently, as if to prompt a faster tone.");

	output("\n\n<i>“The red one’s biological sister is coming with something to get rid of this place. Normally this would not be a problem, but what she is using is technology from your people. Some kind of forest wrecking machine. I wish for you to protect me from this machine while I disperse. I can provide you with assistance, but will be unable to do anything by myself. Please defend these two girls. I will deal with what comes after,”</i> she says pleadingly.");
	output("\n\nIt looks like you have a decision to make.");

	//[Accept] [Talk] [Sex] [leave that shit]
	processTime(10);
	clearMenu();
	addButton(0,"Accept",fuckYesPlantLadyIllSaveYou,undefined,"Accept","Defend this lady.");
	addButton(1,"Talk",fungusQueenTalkShit,undefined,"Talk","Get some answers.");
	addButton(2,"Sexytime",queenFungusBoobsuck,undefined,"Sexytime","Mushroom queen or not, she’s got a rockin’ bod. Throw caution to the wind for some fun.");
	addButton(3,"Abandon",fuckOffQueenAndDie,undefined,"Abandon","Abandon these spore-addled fools to their fate. It’s not your problem.");
}

//Talk
public function fungusQueenTalkShit():void
{
	clearOutput();
	showFungusQueen();
	author("Gardeford");
	output("You ask the queenly mushroom about what exactly she is, and how she knows about what’s going to happen. She smiles sympathetically and nods in your direction.");
	output("\n\n<i>“I thought you might ask for something like this. Some of my knowledge tells me that your races refer to my kind as ‘queens’. The myrmedion have queens, and our role is not much similar to the things they do. I don’t rule over anyone, and our species doesn’t have that kind of society,”</i> she says, shifting around on her stalk. You ask her for a better comparison if that one is so inadequate. She thinks for a moment before responding.");
	output("\n\n<i>“I am more like your race’s books and ‘data bases’. Anything that a spore I make learns or knows, I remember. When one of the myr is a host to my spores, I learn about her life, and everything that she knows. I have been particularly lucky in that one of my hosts was a high ranking military general. In the past one even became a queen. I obtained a wealth of information from that time, and recently I have gotten quite the variety of information about your races,”</i> she says, choosing her words carefully. She speaks fondly of the memories she has gained, and you ask her how long her race has been leeching off the myr. She looks uncomfortable, but continues.");
	output("\n\n<i>“I do not like your choice of words, but it has been for a long time. If we were alive at the time of the myrmedion races’ conception then the memories of it have been either lost or taken. My own memories go back a number of hundreds of years. This is longer than any like me normally last, and why I must disperse with such haste. All of my memories are stored in these tiny spores. A bigger memory produces a bigger spore,”</i> she says, weaving her free hand through the flutter of spores that whirl around her. You ask her what she would consider the fungus, if not parasitic.");
	output("\n\n<i>“My memories of these words are all from your races. They tell the myrmedions that we are a harmful thing that should be removed with haste. Before this, those who hosted us were seen as rarities, sometimes shunned, but never treated wrongly. Now they are taken away, previous hosts are hounded on the streets, sometimes attacked after dark. Their own families report them to a company that your races brought here, and they are taken for studies. I don’t know what they mean by this, but nothing useful is being learned by the things they do, and the <i>“participants”</i> don’t come back. The doctors gave examples of terrible parasites from other planets to make the myrmedions afraid. We are not like that,”</i> she asserts. Her tone is deadly serious.");
	output("\n\n<i>“One of my hosts looked through an encyclopedia on what your races call the extranet. If anything we are more like symbiotic beings than harmful parasites. We gain our sustenance from things that are perfectly healthy for our hosts, and apart from that rough first patch of time, our hosts suffer no adverse side effects bar a slightly raised libido and some tough reintroduction if their spores are of opposite genders. The ones who host us specifically have a slightly tougher time, but that is why we disperse,”</i> she says, looking sympathetically at the girl from whom she appears to be growing. You ask her what dispersal is, and why she needs it.");
	output("\n\n<i>“When one of us has lived as long as I have the memories build up inside us, and eventually we must forget if we do not disperse. Dispersal takes a number of minutes, longer for every memory we contain. If it becomes bad enough I will need to split myself into two or three others. I only hope I can find enough hosts should that time come. In an emergency I can store memories in the mushrooms scattered in the caves, but they are such fragile things to entrust with important knowledge.”</i>");
	output("\n\n <i>“This one has graciously volunteered to be my next host,”</i> she says with a motion to the gold myr. <i>“The other is her sister, the product of an odd pairing. She came to visit her near to every day, and was glad to take her place for the next iteration. I would not make her do it twice, as they have been separated long enough,”</i> she says, looking somehow relieved and saddened at the prospect. You thank her for telling you all that she has and think of something else you can do.");
	processTime(7);
	clearMenu();
	addButton(0,"Accept",fuckYesPlantLadyIllSaveYou,undefined,"Accept","Defend this lady.");
	//addButton(1,"Talk",fungusQueenTalkShit,undefined,"Talk","Get some answers.");
	addDisabledButton(1,"Talk","Talk","You just did that.");
	addButton(2,"Sexytime",queenFungusBoobsuck,undefined,"Sexytime","Mushroom queen or not, she’s got a rockin’ bod. Throw caution to the wind for some fun.");
	addButton(3,"Abandon",fuckOffQueenAndDie,undefined,"Abandon","Abandon these spore-addled fools to their fate. It’s not your problem.");

}

//Sex: breast suckling [codex warning about infection]
public function queenFungusBoobsuck():void
{
	clearOutput();
	showFungusQueen();
	author("Gardeford");
	output("You ask the fungal library if you can have some fun with her massive tits. She looks surprised for a moment and you ask why, as anyone would love to play with them.");
	output("\n\n<i>“Are you sure? You might come out of it with something <i>“bad”</i>");
	//output(", but it seems something like that is already inside you");
	output(",”</i> she says with a smile. She beckons for you to come closer, letting the flashing dress drop from her shoulders. The flowery petals that surround her nipples are a deep shade of purple, looking almost wet in the light. Curiously, you don’t see any nipples at their centers, just blackened holes.");
	output("\n\n<i>“You might have to play with them a bit for the nipples to come out,”</i> she says informatively. You step closer for a better position, being careful to avoid the legs of her myr host. The fungal queen’s breasts are free in the air before you, lining up perfectly with the curves of the rest of her upper body. You reach out and grasp them gently, one in each hand, and at once are nearly sucked into their spongy softness, your fingers almost swallowed whole by the marshmallowy masses.");
	output("\n\nHer breasts feel like memory gel, remaining indented for a few seconds when you pull your hands back, and gradually return to their original bouncy forms after each squeeze. You take them from the sides, letting your hands sink in an inch or two before kneading them forcefully and squishing them together. Suddenly, you hear a moan from somewhere you can’t quite detect.");
	output("\n\n<i>“Physical contact lets you hear me directly,”</i> she explains as you continue kneading her. Her voice sounds similar to the one that she had used through the myr, but a bit older sounding. The queen’s pleasurable noises continue to play out in your mind as you try to coax her nipples from their hiding places. Her soft hands cover yours, assisting in your ministrations.");
	output("\n\nAfter about a minute of massaging, you’re pleased to see two orange nipples pop out of the holes that they were hiding in. They aren’t very big in comparison to the tits they sit upon, but her flowery areolae more than make up for it. You tweak and pull on one of the titanic teats, pleased to see it squirt a small amount of clear liquid that splatters onto the sitting gold myr’s face. She licks her lips absentmindedly, cleaning herself up as best as she can.");
	output("\n\nYou grin hungrily, lean into the nipple that remains free, and give it a gentle bite. The juice that covers and leaks from her nips is sweet, tasting a little like peaches, but more sugary. You have to drink it gradually because of the intensity, and she moans at each of your slow, mouth-filling draws. You continue to tug on her other bud, soaking the gold myr in sweet fluid as the juices squirt over every inch of her body that they can reach. Honeyed milk runs in small streams over her breasts.");
	output("\n\n<i>“My boobs didn’t do this to start with, but after being attached to a number of golden myrmedions they began to leak sweet fluids. The girls all love to do this, so I’m pleased that it makes you happy as well,”</i> she says as you suckle, pressing your face into the soft memory foam of her melons. The flower petals that make up each of her areola smell like freshly picked mushrooms, only making you feel hungrier as you drink.");
	output("\n\n<i>“Hmm... There’s something different in your blood. Something smaller than my spores; I might be able to do something with this. This might feel a bit weird, but bear with me,”</i> she says. You tense yourself in anticipation, but nothing comes for a number of seconds and you relax. The moment you do, however, a wave of pleasure courses through your body. You cum on the spot, ");
	if(pc.hasGenitals()) 
	{
		if(pc.hasCock()) output("[pc.eachCock]");
		else output("[pc.eachVagina]");
		output(" soaking ");
		if(pc.isCrotchGarbed()) output("your [pc.lowerGarment]");
		else output("her stalk");
		output(" with your ");
		if(pc.hasCock()) output("[pc.cumNoun]");
		else output("[pc.girlCumNoun]");
		output(". ");
	}
	else output("wriggling and twitching in ecstasy. ");
	output("You try to gasp around her nipple, sucking an overwhelming amount of juice out of it in the process. Peachy milk spills from your cheeks and runs over your [pc.chest].");
	output("\n\n<i>“Those machines make you compatible even though you aren’t myrmedion. I can make every nerve you have feel like those that respond to sex. It’s a little bit more crude than the connection I can form between myself and the myr, but I hope it still felt enjoyable to you”</i> she says, patting you on the head.");
	output("\n\nYou stand after you recover yourself, and she positions a number of spores above your head. The cluster turns to a watery substance, washing away the stickiness that covered you. Another cluster brushes you like a towel, sponging up the liquid until you’re completely dry. You smile, adjusting your [pc.gear], and think of something else to do.");
	processTime(23);
	var ppFungusQueen:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppFungusQueen.breastRows[0].breastRatingRaw = 7;
	ppFungusQueen.breastRows[0].breasts = 2;
	ppFungusQueen.breastRows[1] = new BreastRowClass();
	ppFungusQueen.breastRows[1].breastRatingRaw = 7;
	ppFungusQueen.breastRows[1].breasts = 2;
	ppFungusQueen.milkType = GLOBAL.FLUID_TYPE_NECTAR;
	ppFungusQueen.milkMultiplier = 100;
	ppFungusQueen.milkFullness = 100;
	pc.milkInMouth(ppFungusQueen);
	pc.changeHP(50);
	pc.changeEnergy(200);
	pc.orgasm();
	flags["SUCKED_FUNGUS"] = 1;
	clearMenu();
	addButton(0,"Accept",fuckYesPlantLadyIllSaveYou,undefined,"Accept","Defend this lady.");
	addButton(1,"Talk",fungusQueenTalkShit,undefined,"Talk","Get some answers.");
	//addButton(2,"Sexytime",queenFungusBoobsuck,undefined,"Sexytime","Mushroom queen or not, she’s got a rockin’ bod. Throw caution to the wind for some fun.");
	addDisabledButton(2,"Sexytime","Sexytime","You just finished up some sexytime hijinx. You need to make a decision.");
	addButton(3,"Abandon",fuckOffQueenAndDie,undefined,"Abandon","Abandon these spore-addled fools to their fate. It’s not your problem.");
}

//Accept
public function fuckYesPlantLadyIllSaveYou():void
{
	clearOutput();
	showFungusQueen();
	author("Gardeford");
	output("You tell the queen that you accept her terms, and will help her to fight the coming machine. She looks grateful, turning to the gold myr.");
	output("\n\n<i>“Thank you. You help us more than you may know,”</i> she says before her entire body begins to dissolve. The amount of spores in the room seems to double, thickly clouding the air and surrounding you like a tornado wherever you move. A similar barrier surrounds the gold myr and her sister, who now lies on the ground with a normal looking belly. From behind you comes an immense explosion, and you turn to find its source.");
	output("\n\nFlames wreath the corridor that leads to the cavern, and the mushrooms change from soothing blue to a panicked red strobe. A titanic construct walks through the fire on eight spidery legs, stopping at the door to stare at you. Its mechanical parts are covered in flashy plastic-looking tiles, but you can see a denser metal plating beneath them. A company label you don’t recognize is openly emblazoned on its shoulder, consisting of a number of erratic lightning bolts spreading from a thumbs up. A large flamethrower replaces a hand on one of its arms, while the other has a menacing diamond tipped pneumatic hammer. It notices you standing and releases what you assume is a prerecorded message.");
	output("\n\n<i>“Innocent civilian. Move away from this area with haste. This Deconstruction Unit has been designated to purge all life in this section of the caves. If you stay, ERROR will hold no responsibility for your injuries,”</i> it drones in a jovial voice. Afterwards it pauses, giving you time to leave. It’s too late for that now, so you ready your weapons and prepare to defend the queen’s ritual. The next time it talks it does so without the jovial warning tone.");
	output("\n\n<i>“Brandishing weaponry against construction robots is a violation of U.G.C. property damage law, and this unit is authorized to engage in lethal self-defense. Engage and die,”</i> it says, readying its tools to destroy you and your surroundings. The pilot flame of its arm bursts to life as a menacing addition to its statement. Suddenly a second voice joins in, apparently through a comm link attached to the machine.");
	output("\n\n<i>“Sabine! Are you there?! Don’t worry, this thing’s gonna get you out of there. Your sister has some connections with these space-farers, though I never guessed it would be this easy to get something this big. They all think with their loins,”</i> comes a womanly voice from atop the robot. You guess it must be a relation of one of the two myr girls, but luckily it doesn’t seem she’s come in person. You have no reason to hold back.");

	processTime(5);
	clearMenu();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new GardeBot());
	CombatManager.victoryScene(beatUpConstructoBot);
	CombatManager.lossScene(roboQueenFightPCLoss);
	CombatManager.displayLocation("ROGUE BOT");
	
	addButton(0,"Next",CombatManager.beginCombat);
}

//Combat
//You are fighting the Kiha Corp Deconstruction Unit.
/*The giant construct shoots small gouts of flame at surrounding mushrooms whenever its focus is not taken by you. Its pneumatic hammer pulverizes the crystal structures, shattering them like glass depending on where it hits when near them. Getting close to it might be dangerous. You have a limited amount of time before it destroys everything in the room, and a limited amount of defendable space to use before it destroys the spores that protect you.

(pc has 3 <i>“platforms”</i> to move between. pc can move then shoot, but not vice versa. These start out shielded and halve all damage received. Each use of firestorm removes this shield. If firestorm is used on an unshielded space it results in a loss for the pc. The boss is immune to adverse status effects and lust damage. It has no shields, but high hp.)
*/

public function updateGardeBotCover():void
{
	if(enemy.statusEffectv1("Sporebutt") == 1) 
	{
		output("\nYou’re to the left of the robot.");
		if(enemy.statusEffectv2("Sporebutt") > 0) output(" There’s enough intact spores and crystals in the area to shield you from much of its damage.");
		
	}
	else if(enemy.statusEffectv1("Sporebutt") == 2) 
	{
		output("\nYou’re positioned roughly in front of the robot.");
		if(enemy.statusEffectv3("Sporebutt") > 0) output(" There’s enough intact spores and crystals in the area to shield you from much of its damage.");
	}
	else 
	{
		output("\nYou’re to the right of the robot.");
		if(enemy.statusEffectv4("Sporebutt") > 0) output(" There’s enough intact spores and crystals in the area to shield you from much of its damage.");
	}
	output("\n\n");
}

public function gardeBotBonusButtons():void
{
	if(enemy.statusEffectv1("Sporebutt") == 1) 
	{
		addDisabledButton(10,"Left","Left","You can’t move any farther in that direction.");
		addButton(12,"Right",gardeBotMove,2,"Right","Circle toward the cover to the right. Perhaps it will offer more protection.");
	}
	else if(enemy.statusEffectv1("Sporebutt") == 2) 
	{
		addButton(10,"Left",gardeBotMove,1,"Left","Circle toward the cover to the left. Perhaps it will offer more protection.");
		addButton(12,"Right",gardeBotMove,3,"Right","Circle toward the cover to the right. Perhaps it will offer more protection.");
	}
	else
	{
		addButton(10,"Left",gardeBotMove,2,"Left","Circle toward the cover to the left. Perhaps it will offer more protection.");
		addDisabledButton(12,"Right","Right","You can’t move any farther in that direction.");
	}
}

public function gardeBotMove(arg:int = 1):void
{
	var tEnemy:Creature = CombatManager.getHostileActors()[0];
	
	tEnemy.setStatusValue("Sporebutt",1,arg);
	clearOutput();
	output("You shift into a different section of the cavern");
	if ((tEnemy as GardeBot).pcHasSporeShield()) output(" where the spores can still protect you");
	CombatManager.processCombat();
}

//Loss
public function roboQueenFightPCLoss():void
{
	author("Gardeford");
	output("You collapse from the force of the giant’s attacks, looking up to see its menacing white eyes staring at your helpless form. A number of whirring clicks sound in its body before its flamethrower moves into your vision. The pilot flame glares menacingly, filling the air with the smell of burning fuel. The last thing you see is a flash of bright light as the high pressured blast of fire burns you into oblivion.");
	output("\n\n<i>“Threat eliminated.”</i>");
	badEnd();
}

//Victory
public function beatUpConstructoBot():void
{
	clearOutput();
	showFungusQueen();
	author("Gardeford");
	output("The machine clicks and sputters a few times, its flamethrower releasing gouts of fuel with no flame. The lighting mechanism clicks but malfunctions, and the robot’s entire arm and torso explode in a pressurized pop. You stagger over to the area where the myr sisters are still sitting and check to make sure they are uninjured. The spores seem to have protected them from any burning.");
	output("\n\nYou watch as all of the spores in the room zoom in and swirl around the gold myr, surrounding her until you can’t see her anymore. A bright flash of light forces you to shield your eyes for a few seconds, and when you can see again you see the red myr standing with the queen, now placed atop the gold myr. She turns to you, holding the red ant-girl’s hand to keep steady.");
	output("\n\n<i>“Thank you. You may take your material now. Please help this girl back to the surface, if you wouldn’t mind,”</i> she says through the eager redhead. You walk behind her to find the material she was talking about. A few meters back is a small spire of crystalline rock. Your codex scans the formation and identifies it as crystallized sophinol, a prized fuel source. If that robot’s flames had touched it you might not be standing here right now. In a few minutes you’ve filed a claim on the fuel crystals through Steele Tech’s central servers.");
	output("\n\nWhile you walk through the caves, you want to ask her what her time as host to the queen was like, but the words do not come. She talks at great length about what she’s going to do to her sister when she next sees her, and how much of a lesson she’s going to give her. She could’ve gotten people killed because of her stupid misguided actions.");
	output("\n\nAs you leave the cave there’s a commotion outside; a man in a biohazard safety suit moves up to you, grasping your shoulder. At first your hand goes for your weapon, but then he pulls off the mask, revealing an unassuming middle-aged man.");
	output("\n\n<i>“You there! I work with KihaCorp’s interplanetary shipping department. I was looking at the books this morning and it seems one of our deconstruction units was sent here without permission. You wouldn’t happen to have seen one recently would you? It’s a spider-legged thing with a flamethrower and a big pnuematic hammer, kinda hard to miss,”</i> he asks, looking thoroughly serious. You reply that you just destroyed one to stop it from igniting a cluster of fossilized fuel that might have altered a good amount of the caves infrastructure.");
	output("\n\n<i>“Shit fucking... Fuck! Those things cost a fortune. Sorry, I’m just having waking nightmares imagining the paperwork I’m going to be filling out later. Well, I’ll send in a drone to recover the diamond bit. It sucks I’ll have to report this to the higher ups, but I’m sure they’ll be mollified when we find the fucker who sent it out. Don’t worry about getting charged for the damage or anything. It’ll be coming out of his or her paycheck,”</i> he says, going back to a small shuttle that takes off toward the DMZ. You wonder if they’ll find him for a moment before continuing on your own way.");
	//(pc get 2-3000 credits)
	output("\n\n<b>You make 15,000 credits from your mineral claim!</b>\n\n");
	pc.credits += 15000;
	flags["FUNGUS_QUEEN_SAVED"] = 1;
	currentLocation = "2S11";
	variableRoomUpdateCheck();
	CombatManager.genericVictory();
}

//Pc fucks off
public function fuckOffQueenAndDie():void
{
	clearOutput();
	showFungusQueen();
	author("Gardeford");
	output("You decline the queen’s call for help. The fungal woman looks saddened, but nods.");
	output("\n\n<i>“Please take these girls with you at least, they should not have to share my fate,”</i> she says before slowly dissolving into a cloud of tiny spores. The myr she had formerly been attached to sits up groggily, smiling when her eyes settle on her sister. You motion for them to follow you out of the cave, but the two stay in their place.");
	output("\n\n<i>“No, we’ll stay with the queen. If you’re fine with a little blood on your hands, you should be okay with a river of it. Were I strong enough to hold you here I would have you share our fate, but I am not, so leave us,”</i> The gold myr says, her red sister nodding emphatically. You turn away, heading out through the mouth of the mini-cave. On your way out, you hear a mechanical commotion. A large construct walks by you on your way back to the normal caves, releasing a jovial message as you pass it.");
	output("\n\n<i>“Good evening, innocent civilian! Do not worry, soon this section of the caves will soon be purged of contaminants! This Deconstruction Unit will make sure of that. Continue on with your explorations,”</i> it says loudly, continuing toward the cavern you came from. You head back to the deep caves, leaving that mess behind you.");
	output("\n\nOr you would have, if not for the cacophonous explosion that rocks the caves a few moments later. You’re knocked to your knee");
	if(pc.shields() > 0)
	{
		output("s, your shield fizzling out");
	}
	output(" as the shockwave and thunderous noise batter your body. When you recover enough to stand you turn to see that the entrance to the cavern has been caved in completely, with scorch marks radiating outward from the former tunnel.");
	if(pc.shields() > 0) pc.changeShields(-pc.shieldsMax());
	output("\n\nYou continue on your way, steeling yourself against what happened.");
	pc.addHard(5);
	//(pc can’t go there no more.)
	flags["LET_FUNGUS_QUEEN_DIE"] = 1;
	processTime(8);
	clearMenu();
	variableRoomUpdateCheck();
	addButton(0,"Next",move,"2S11");
}
