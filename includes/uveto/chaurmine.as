//Chaurmine by Aullama

//Uveto Event
//Unlocks after PC completes Myrellion probe, and if PC chose Like or Meh in Novahome Event

public function chaurmineOnUveto():Boolean
{
	if(flags["CHAURMINE_LOVER"] != undefined && flags["CHAURMINE_LOVER"] != -1 && flags["ABANDONED_CHAURMINE"] != 3) return true;
	return false;
}

//Can be encountered in the Rift on Uveto
//Chasm
//Repeatable encounter until Chasm is chosen
public function chaurmineChasmShit():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("You sigh, coming to a stop in the icy snow. Though you’re not really tired, it wouldn’t be a bad idea to rest for a minute and get your bearings, and take a moment to scan your surroundings. Shielding your eyes from the frosty wind - as best you can, at least - you look for the horizon, and when that fails, you settle for peering around the immediate area. Plenty of snow here, even more there, lots of ice everywhere - yep, everything seems normal. At least, until you notice a stout, fluffy form dash down a wide path leading towards a massive crevasse, cursing angrily.");

	output("\n\nWell, this might lead to something interesting; or it could be nothing. Either way, you have a choice - leave, and risk losing the creature and wherever the trail leads, or follow it into the giant chasm to find who-knows-what.");

	processTime(3);
	clearMenu();
	//[Chasm] This seems a little odd. Better investigate. // Go to Inferno And Ice
	addButton(0,"Chasm",fenfernoAndIce,undefined,"Chasm","This seems a little odd. Better investigate.");
	//[Leave]
	addButton(14,"Leave",mainGameMenu);
}

//Inferno And Ice
public function fenfernoAndIce():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("After steeling yourself for what might lie ahead, you cautiously move along with the strange path, ignoring every agonising lick of the ice cold wind. Something you quickly realize, while observing the snow around you, is that the way you’re walking wasn’t cleared naturally; as if something hot and heavy stubbornly shoved its way through, given the alternating furrows of claws from four-toed feet in the snow, surrounded by round drifts formed more from heat than wind. You rack your brain trying to think of what on Uveto would make this sort of trail. It almost looks familiar, but you can’t place it - if you’ve seen something like this, it wasn’t in snow. The signs of heat only get more intense the closer you are to the crevasse.");
	output("\n\nOnce you find yourself at the mouth of the great chasm, its sides towering above, you absently note that the harsh wind has died down; blocked by the walls of the deep fissure, no doubt, as the shrill wails are torn from the frigid gale and forced to echo throughout the frozen cleft. The space within the glacial cleavage is thankfully wider than the creature-made trail - it looks at least several dozen feet wide, you think - and you sigh in relief. Wide enough to allow you moderate maneuverability, and the sleek walls of ice with nary a blemish making an ambush unlikely, the chasm looks as safe as one might get.");
	output("\n\nWell, it’s now or never.");
	output("\n\nAs soon as you enter, the cold tundra outside virtually disappears when your eyes adjust to the light, and everything is silent. Other than the gusts shrieking at you from above, the crevasse is incredibly quiet. Though unsettling, it also gives you a moment to marvel at the icy walls around you; the pristine, crystalline surface lets you see further into the ageless ice, where it almost glows, casting you and your surroundings in shades of cold blues. Breathing in the crisp air, you make a mental note to consider the possibility of going off the beaten path more often.");
	output("\n\nYour thoughts, and [pc.feet], are stopped in their tracks when a new sound echoes from further in, something resembling a snarl, or a bark, reverberating within the chasm. Without turning away from the direction the noise came from, you cast a glance over your shoulder, confirming that you’re not getting boxed in; you still have a way out, it seems, and you continue moving ever deeper into the frosty fissure knowing your back is safe.");
	output("\n\nA short time later you find yourself gradually losing patience for this place, but just as you start wondering if you shouldn’t turn back, your eyes spot a single, dark hollow along a wall.");
	output("\n\nNow, either something’s in there, or your name isn’t ‘[pc.name] Steele’.");
	output("\n\nA grin spreads across your [pc.face], and you cautiously approach the glacial hollow with renewed interest. Pausing at the mouth of the cavern, you hear the occasional metallic shuffle and smack on the frozen surface. Footsteps? Whatever it is, it’s getting closer, and with no hiding spots along the smooth walls, you straighten your ");
	if(pc.isTaur()) output("bestial body");
	else output("back");
	output(" in preparation.");

	output("\n\n<i>“[pc.name]?”</i> the cavern itself seems to rumble out.");
	output("\n\nWhat the-");
	output("\n\nA familiar, bulky form with metallic silver scales over tough amber hide stomps out from the nippy darkness, sweltering body steaming in the cold air. It’s Chaurmine.");
	output("\n\n<i>“Yeah, it’s me,”</i> he redundantly confirms");
	//ifSilly:
	if(silly) output(", redundantly");
	output(". His heavy scales clank and scrape together as he shivers excitedly to the feeling of the frigid draft from above, also rattling his gear - which seem to consist of his usual tactical groin armor, in addition to what looks like a massive, spiked sledge hammer and a heavy, black cannon.");
	output("\n\nWith a raised brow, you ask what he’s doing here.");

	output("\n\nThe titan lets out a huff of steamy breath, <i>“I </i>was<i> out here with the idea that there might be a group of milodans needing a beat down, but that turned out to be bullshit. Granted, this was days ago.”</i>");
	output("\n\nDays? What’s he been doing-");
	output("\n\n<i>“This frozen moon has been a godsend, [pc.name],”</i> he growls, indicating the wisps of mist flowing off his form with a shrug, <i>“There’s been a fire in me ever since I left Tarkus, except this won’t go away with a quick fap or a fuck - this refuses to be quenched,”</i> he finishes with clenched teeth.");
	output("\n\nWow. Feeling rather nervous in the face of his growing fervor, you’re reminded of the similar state he was in when you found him out in the wastes on Tarkus - though that was from an aphrodisiac, and seemed to go away once he shot a load.");
	if(pc.IQ() >= 50) output(" Though you know the answer already");
	else output(" Curious");
	output(", you ask what has him so heated.");

	output("\n\n<i>“You,”</i> he growls bluntly. His eyes scan your immediate surroundings before shifting back onto you, the azure orbs virtually ablaze with passion, <i>“I’m glad that we met out here, actually. There’s something I want you to do.”</i>");
	output("\n\nFiguring if he was just wanting a roll in the hay, you’d be doing that by now, so you carefully ask what it is he wants - or more accurately, needs - from you.");
	output("\n\nNot quite in the blink of an eye, but still surprisingly swift, Chaurmine grabs the haft of his hammer with an armored hand and swings the head to his feet - the impact enough to make you flinch as it smashes a large dent into the icy floor. <i>“I want you to fight me,”</i> he says, his massive frame tense, <i>“I want you to fight me without holding back, as if your life were at risk.”</i>");
	output("\n\nYou hesitate, having no desire to cause either of you injury - especially all the way out here.");
	output("\n\nNoticing your nervous demeanor, Chaurmine gives a bittersweet smile, <i>“Saurmorians aren’t people of complex feelings or relationships, [pc.name]. Saurmorians don’t feel these things - not the same way you do, at least. I need to know why I feel this way, and the best way I can do that is through what I do best.”</i> He pulls his lips back into a rumbling growl, <i>“Win or lose, I need to know why you have started this inferno inside me!”</i> The cold, humid air whips against the two of you from above, carrying the steam hissing off of his molten body in swaying motions, reminding you of tattered cloth. <b><i>“I need to know why you have claimed my heart!”</i></b>");
	output("\n\n<b>It’s a fight!</b>");
	processTime(15);
	
	flags["MET_CHAURMINE"] = 2;
	
	clearMenu();

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Chaurmine());
	CombatManager.victoryScene(beatUpCharmine);
	CombatManager.lossScene(pcLosesToChaurmine);
	CombatManager.displayLocation("CHAURMINE");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//PC Win
// +25% relationship
public function beatUpCharmine():void
{
	showChaurmine();
	author("Aullama");
	chaurmineRelationship(25);
	output("Panting in exhaustion, Chaurmine falls to his knees with a crash, cracking and chipping the ice with his weight. Darting forward, you ready yourself to catch the big lizard while you ascertain if he’s about to pass out or not. He’s not wobbling or shifting at all, and after roughly half a dozen heartbeats, he seems fine.");

	//firstWin:
	if(flags["CHAURMINE_WINS"] == undefined)
	{
		output("\n\nWith that settled, you figure it’s time to really confront the elephant in the room. Making sure he hears you, you ");
		if(pc.isNice()) output("gently turn his snout in your direction");
		else output("snap your fingers in an effort to grab his attention");
		output(". With as much of his focus on you as you’re going to get, you softly mention what he’s feeling is something most species feel - though it can affect every individual differently, the general meaning is the same. That feeling is");
		if(pc.isBimbo()) output(" - you can’t help but give a little squee -");
		output(" <b>love</b>.");
		output("\n\n<i>“Love...”</i> he cautiously rolls the word around on his tongue, as if trying a bitter food for the first time. Your eyes widen in surprise; he must have said the word in english, bypassing your translators - his guttural voice has a distinctly Italian accent to it.");
		output("\n\n<i>“Ahh... ");
		if(silly) output("I can see clearly now");
		else output("I understand");
		output(",”</i> he murmurs between heavy breaths before looking straight into your eyes; his own no longer a chaotic blaze of emotion, but shining bright with affection, <i>“Yeah... It’s - this feeling is still alien as fuck. I may never... Hah... never understand it. But it won’t scare me like that... never again.”</i>");
		output("\n\nYou blink in surprise, a hand absently dabbing away some sweat. After the state he was in, he’s all better now? Just like that?");
		output("\n\nThe brute grimaces slightly, <i>“No, my blood’s gonna burn every time I see you, [pc.name]. I’m still going to need your help with these... with this stuff. It still unnerves me, you know.”</i>");
		if(flags["CHAURMINE_LOVER"] == 1) output("\n\nYou nod");
		else output("\n\nYou shrug");
		output(", offering that you’re willing to help, even do <i>this</i> again if needed.");
	}
	//Repeating:
	else output("\n\nHelping Chaurmine to his feet as he catches his breath, you give his shoulders a squeeze, a small reminder that you’re still here.");
	output("\n\n<i>“See, that’s it right there,”</i> he mumbles, sniffling, <i>“I’m not alone...");
	if(flags["CHAURMINE_LOVER"] != 1) output(" Even if you don’t really feel the same way back, or whatever... You’re a good friend, [pc.name]");
	output("”</i>");
	output("\n\nIs that a tear?");
	output("\n\nThe lizard abruptly looks away, growling, <i>“Get outta here before you freeze, dumbass.”</i>");

	processTime(7);
	IncrementFlag("CHAURMINE_WINS");
	clearMenu();
	addButton(0,"Tender Care",TLCForChaurmineOnUveto,undefined,"Tender Care","Looks like he could use a little TLC.");
	addButton(1,"Fix",fixUpUvetoChaurmine,undefined,"Fix","Patch him - and you - up before heading out into the cold.");
}

//[Tender Care] Looks like he could use a little TLC // Go to Tender Care
//[Fix] Patch him - and you - up before heading out into the cold // Go to Fix

public function fixUpUvetoChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("After a small period of checking his injuries - and mending them as best as you can - you tend to yourself. Once all immediate wounds are gone, the both of you make your way out of the chasm, making idle chit-chat on the way.");
	output("\n\nJust before parting, Chaurmine mentions he has his ship parked on the moon’s station, and that he’ll be there if you want to talk.");
	restHeal();
	restHeal();
	output("\n\n");
	CombatManager.genericVictory();
}

//Tender Care
public function TLCForChaurmineOnUveto():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	if(pc.isNice()) output("You shake your head sternly, <i>“Not until we’re </i>both<i> ready to travel.”</i>");
	else if(pc.isMischievous()) output("You let out a light laugh, your [pc.face] splitting into an impish grin, <i>“I’m pretty sure right here is the </i>least<i> likely place I’ll freeze in.”</i>");
	else output("You let out a sigh, <i>“And he calls </i>me<i> the dumbass...”</i>");
	output(" Reaching for your things, you make a quick search for something that might make the situation more comfortable, like a blanket, ");

	//ExporersCloakEquipped
	if(pc.accessory is ExplorersCloak) output("and unclasp your cloak");
	else output("only to be interrupted by Chaurmine as he barks something about the nearby hollow. A quick trip shows a small chamber split off not too far in, which something was using as a shelter, and manage to return to the lizard with a serviceable bundle of cloth");
	output(". Walking up to the now-sitting titan - having moved from kneeling to sitting with his back to an icy wall - you feel the cold air behind you, dancing and streaming across your neck and down your back, contrasting with the hot air radiating from the form before you - licking along your [pc.face] like flames - and blazing down and around every part of you until you find yourself");
	if(pc.isTaur()) output(" laying your larger lower half along his legs, clumsily folding your own front legs onto his lap");
	else if(pc.isNaga()) output(" coiling your tail around his legs as you slide into his lap");
	else if(pc.isGoo()) output(" squished into his lap, sliding around his crotch and armored thighs");
	else output(" straddling his armored thighs");
	output(", the chilled wind all but gone. How has he not been melting all this ice?");

	output("\n\nIgnoring his amused smirk, you insistently wrap the two of you with your makeshift blanket, letting out a sigh as the two of you are covered by the soft material, trapping both your own body heat with the walking furnace beneath you. Hands now free, you run them along where you can reach, taking the opportunity to explore his body.");
	output("\n\nUp his heavy arms, your fingers trace along metal scales that feel more akin to plated armor. Then, past his shoulders and up his thick neck, your soft touch pauses at his jaw. You can <i>feel</i> the powerful muscles rippling beneath your fingertips - even with the covering of scales! Shifting to his lips, you laugh as a few digits are gobbled up by the titan, gently mouthing you. Your free hand reaches up to the horn sitting on his nose, like some metal spike; you make a note to remember to avoid its tip. Chaurmine rumbles appreciatively as your caresses cross his face, one hand cupping his strong chin as the other affectionately rubs up and down his snout. You relish the feeling of his hot scales as he moves with you, pressing his nose into your palm at the apex of each stroke.");
	output("\n\nA heavy hand covered in scorching scales runs up your back, drawing a gasp that’s forced into a moan as his hot scale-claws graze your [pc.skinFurScales] - and you realize things are really starting to heat up.");

	processTime(10);
	pc.changeLust(5);
	//[Cuddle] Stop the lewds, and just enjoy each other’s’ warmth. // Go to Cuddle
	addButton(0,"Cuddle",cuddelWithCharmineAfterBeatDown,undefined,"Cuddle","Stop the lewds, and just enjoy each other’s warmth.");
	//[Get Fucked] Chaurmine takes the reigns. He’ll probably get quite rough, though... // Go to Get Fucked
	addButton(1,"Get Fucked",getFuckedByChaurmine,undefined,"Get Fucked","Chaurmine takes the reigns. He’ll probably get quite rough, though...");
}

//Cuddle
public function cuddelWithCharmineAfterBeatDown():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("With a sigh you reach behind you, taking the lizard’s hand, and wrap it around your waist. Chaurmine gets the idea - his other hand pressing between your ");
	if(pc.hasWings()) output("wings");
	else output("shoulderblades");
	output(" - and you lean into him, wrapping your arms around his neck as he pulls you close.");

	output("\n\nYou spend what feels like hours wrapped around each other, the shelter of the blanket feeling like a miraculous sauna against the cold wind. You even start to doze off as the heat ");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("passes through your equipment and ");
	output("radiates through your body, Chaurmine rumbling contentedly.");

	output("\n\nEventually, though, you both begrudgingly agree that you must part. Though after having exerted each other, and having a nice rest, the mood is notably high. Just before going your separate ways, Chaurmine grunts something about meeting him near his ship on the moon’s station.");

	processTime(60);
	
	output("\n\n");
	CombatManager.genericVictory();
}

//Get Fucked
public function getFuckedByChaurmine():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");

	output("Chaurmine stands up with a growl, throwing off the warm cloth. You cry out in alarm, clinging to him tightly as he turns the both of you around and shoves your back against the wall of ice");
	if(pc.isTaur()) output(", your [pc.feet] thrashing and kicking along the ground clumsily");
	output(". <i>“I think it’s time we both stopped stalling,”</i> he murmurs, lips pulled back into a savage grin");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(", <i>“And take off your stuff.”</i> Biting a [pc.lipChaste], you give slight nod, shivering as the frosty air touches more and more bare [pc.skinFurScales] while you strip");
	output(", your [pc.nipples] stiffening in the cold. <i>“Don’t worry... The cold won’t be a problem until I’m done with you.”</i>");

	//pcIsTaur:
	if(pc.isTaur())
	{
		output("\n\nThe metal lizard leans in closely, his scaled lips grazing a [pc.ear], <i>“Get up on your feet, then turn around and brace yourself against the ice,”</i> and he steps back to give you space - you think. With a grunt, you do just that, managing not to slip once as you rise.");
		output("\n\nA yelp bursts past your [pc.lipsChaste] ");
		if(pc.hasWings()) output("and the [pc.wings] on your back thrash and flail ");
		output("as ");
		if(pc.tailCount > 0) output("you feel your [pc.tails] being restrained, and ");
		output("a hot sting is smacked into one cheek of your [pc.ass], and you look over your shoulder just in time to see Chaurmine’s free hand connect with your other cheek. His scales, though quite hot, feel very soothing on your sore, tender [pc.skinFurScales] with every grope and squeeze as your bared loins begin flushing with sparse heat.");

		output("\n\nAll this time your own hands have been bracing you against the frozen wall in front of you, until the cold becomes too much. With a hiss, you pull them back, supporting yourself on wobbling [pc.legs] as the titan kneels behind you, his steamy breath blowing down your [pc.ass] and crotch. You groan in frustration, very skeptical that Chaurmine can make this work. <i>“Th-this is nice Chaurmine, b-but it’s too c-”</i>");
		output("\n\nYou choke on your words as the tin lizard surges upward, shoving your upper body into the ice and squishing your [pc.fullChest] against the cold surface; your already stiff [pc.nipples] feeling hard enough to cut through the very ice in front of you. The brute behind you leans over your bestial body, getting as close to your humanoid upper half as he can, and you feel his searing breath licking over your shoulders as he growls, <i>“I </i>was<i> going to try some foreplay, but if you’re </i>that<i> impatient...”</i> What? Is he going in dry?!");
		output("\n\nYou gasp as you feel his pre slick shaft slap wetly against your crotch, both shocked at how scorching hot his fat alien-saur cock is, and ecstatic for the copious natural lube. Though you’re not sure when he took off his crotch guard, you have a hard time caring when your humanoid upper half is pressed against ice while the rest is wrapped in his musky, steamy heat.");
		output("\n\nHis chest rumbling, the titan wraps a scaled hand around your tauric form as his other hand grabs his ribbed shaft, dragging the throbbing length along your inhuman loins and [pc.ass] until he’s thoroughly soaked you in his sizzling pre-cum. You can only grit your teeth and groan as the conflicting heat and cold make your heart race, and the metal lizard drags his fat, blunt head along your flesh once more before aligning with your [pc.vagOrAss]. He grinds the tip - feeling more like a fist - hard against your ");
		if(pc.hasVagina()) output("vulva, your lower lips straining to wrap around his blunt glans");
		else output("[pc.asshole], your pucker straining to accommodate his blunt glans");
		output(", but manages to remain just on the edge of penetration.");
		if(pc.hasVagina() && !pc.isBlocked(0)) pc.cuntChange(0,chars["CHAURMINE"].cockVolume(0));
		else pc.buttChange(chars["CHAURMINE"].cockVolume(0));

		output("\n\n[pc.FullChest] feeling rather numb, you grunt as you struggle to push away from the ice wall, moaning at the increased pressure from the brute’s monstrous penis. Chaurmine chuckles, and just as you’re about to ask him what he finds so funny, the titan <i>pulls</i> you back into him as he thrusts, impaling your bestial half on over a foot of fat, xeno-saur cock.");
		output("\n\nYour entire body clenches taut, arching your back as your mouth gapes in a silent scream. He allows you but a moment to adjust for his obscene girth, before withdrawing from your [pc.vagOrAss] until that fist-sized tip is out with a wet <i>pop</i>, leaving you gaping. Even through his thick scales you feel his muscles tense, and with a rumbling growl his armored hips lurch forward, [pc.vagOrAss] stretching taut as he buries himself to the hilt once more with a wet shlick; the momentum pushing your [pc.fullChest] into the ice again, forcing intense sensations through your tingling [pc.nipples]");
		if(pc.hasCock()) output(" as you feel your [pc.cocks] throbbing and thumping into your tauric belly, flinging increasing amounts of pre");
		output(".");
		output("\n\nHe withdraws slowly, savoring your clenching, writhing walls milking his shaft - every fold and wrinkle bumping and grinding against the fat ribs in a way that has your [pc.abdomen] coiling with a tense heat - until he pops out again");
		if(pc.hasVagina() && !pc.isPlugged(0)) output(" with a gush of [pc.girlCum]");
		output(". Panting and sweating, you lean your humanoid half back and start rubbing and caressing your numb [pc.nipples]; you find the tingling sensations as you work to warm them up strangely stimulating, breath growing ragged from both the alien feeling and having your [pc.vagOrAss] stuffed with monster cock once more");
		if(pc.hasCock()) output(", your [pc.cocks] lurching and jerking with every motion, thick strands of pre-cum drooling and whipping from [pc.eachCock]");
		if(!pc.hasVagina()) output(" that are increasingly [pc.cumColor] everytime he bashes your prostate");
		output(".");

		output("\n\nPausing, the titan pants heavily across your shoulders, hot breath tracing along your [pc.skinFurScales]. He starts drawing his onyx cock out again, but falters as your ");
		if(pc.hasVagina() && !pc.isBlocked(0)) output("[pc.vagina]");
		else output("[pc.asshole]");
		output(" clings to the thick shaft stretching it wide, tender inner walls writhing and squeezing every fat rib. The delicious friction adds to the intense fullness, sending your [pc.fullChest] heaving against the ice.");

		output("\n\nYou hear him let out a feral snarl - or maybe it was ‘Fuck it’, you’re not sure - and suddenly he’s clinging to your tauric body with both arms, forcing your legs to lock in order to bear the sudden weight. He tenses, gripping you tightly, and his hard hips immediately begin pistoning in and out your [pc.vagOrAss] with bruising force. The building tension in your abdomen snaps, and you’re sent over the edge.");

		output("\n\nYour [pc.vagOrAss] clenches down on the intruding shaft like a vice, ");

		//pcHasGabilaniVag
		if(pc.hasVagina() && pc.vaginas[0].type == GLOBAL.TYPE_GABILANI && !pc.isBlocked(0)) output("your powerful muscles squeezing a yelp out of Chaurmine as he virtually comes to a standstill - though he manages to grind an inch or so in and out as his hips continue their rapid thrusts -");
		output("but Chaurmine just powers through, hips rapidly colliding into with head-to-hilt thrusts again and again");
		if(pc.hasVagina() && !pc.isBlocked(0)) output(" as [pc.girlCum] gushes out from around his fat, ribbed penis");
		if(pc.hasCock()) output(". [pc.EachCock] bloats as your seed rushes from your [pc.balls], and you give what token thrusts and jerks you can while [pc.cumNoun] coats your underbelly and the ice below");
		output(".");

		output("\n\nThe brute continues, not stopping even as you swiftly reach a second peak. It isn’t until your third that he plops his chin flat along your bestial body and, with a whimper, mashes his scaled sheath into your [pc.vagOrAss] as he reaches his own climax, panting and gasping for breath. His silky soft, amber sack tenses and jerks, the titan’s bulging and sloshing orbs flooding your depths with what feels like gallons of his thick, incredibly virile molten cum.");
		output("\n\nPanting and sweating against the ice - the cold hardly a concern as your body is ablaze with warmth - you’re more than a little proud to have taken the lizard’s entire load, without spilling a drop.");
		output("\n\nUntil Chaurmine reaffirms his grip with a smug grin.");
		output("\n\n<i>“Ohh no, we’re nowhere </i>near<i> done yet,”</i> he says with renewed energy, his xeno-saur penis still stone solid, still turgid and throbbing.");

	}
	//Else:
	else
	{
		output("\n\nFlipping you around, the metal lizard pins you against the icy wall, causing you to inhale sharply as your [pc.fullChest] touches the frigid surface. His hot hands contrast with the cold as they travel down your body.");
		output("\n\nA yelp bursts past your [pc.lipsChaste] ");
		if(pc.hasWings()) output("and the [pc.wings] on your back thrash and flail ");
		output("as ");
		if(pc.tailCount > 0) output("you feel your [pc.tails] being restrained, and ");
		output("a hot sting is smacked into one cheek of your [pc.ass], and you look over your shoulder ");
		if(pc.tallness > 96) output("just in time to see Chaurmine’s free hand connect with your other cheek");
		else output("only to see shift scales just behind you, though you <i>feel</i> his free hand collide with your other cheek");
		output(". His scales, though quite hot, feel very soothing on your sore, tender [pc.skinFurScales] with every grope and squeeze as your loins begin flushing with sparse heat.");

		output("\n\nAll this time your own hands have been bracing you against the frozen wall in front of you, until the cold becomes too much. With a hiss, you pull them back, supporting yourself on wobbling [pc.legs] as the titan ");
		if(pc.tallness > 60) output("stands");
		else output("kneels");
		output(" behind you, his steamy breath blowing down your shoulders and back. You groan in frustration, very skeptical that Chaurmine can make this work. <i>“Th-this is nice Chaurmine, b-but it’s too c-”</i>");

		output("\n\nYou choke on your words as the tin lizard growls dominantly, shoving your upper body harder into the ice and squishing your [pc.fullChest] against the cold surface; your already stiff [pc.nipples] feeling hard enough to cut through the very ice in front of you. The brute behind you leans ");
		if(pc.tallness > 90) output("against");
		else output("over");
		output(" you, and you feel his searing breath licking over your shoulders as he growls, <i>“I </i>was<i> going to try some foreplay, but if you’re </i>that<i> impatient...”</i> What? Is he going in dry?!");

		output("\n\nYou gasp as you feel his pre slick shaft slap wetly against your crotch, both shocked at how scorching hot his fat alien-saur cock is, and ecstatic for the copious natural lube. Though you’re not sure when he took off his crotch guard, you have a hard time caring when your chest is pressed against ice while the rest of you is virtually wrapped in his musky, steamy heat.");
		output("\n\nHis chest rumbling, the titan grips your neck with a scaled hand as his other hand grabs his ribbed shaft, dragging the throbbing length along your ");
		if(pc.hasVagina() && !pc.isBlocked(0)) output("[pc.vaginas] and ");
		output("[pc.ass] until he’s thoroughly soaked you in his sizzling pre-cum. You can only grit your teeth and groan as the conflicting heat and cold make your heart race, and the metal lizard drags his fat, blunt head along your flesh once more before aligning with your [pc.vagOrAss]. He grinds the tip - feeling more like a fist - hard against your ");
		if(pc.hasVagina() && !pc.isBlocked(0)) output("vulva, your lower lips straining to wrap around his blunt glans");
		else output("[pc.asshole], your pucker straining to accommodate his blunt glans");
		output(", but manages to remain just on the edge of penetration.");
		if(pc.hasVagina() && !pc.isBlocked(0)) pc.cuntChange(0,chars["CHAURMINE"].cockVolume(0));
		else pc.buttChange(chars["CHAURMINE"].cockVolume(0));

		output("\n\n[pc.FullChest] feeling rather numb, you grunt as you struggle to push away from the ice wall, moaning at the increased pressure from the brute’s monstrous penis. Chaurmine chuckles as his now shaft-free hand shifts to your [pc.hips], and just as you’re about to ask him what he finds so funny, the titan <i>pulls</i> you back into him as he thrusts, impaling you on over a foot of fat, xeno-saur cock.");
		output("\n\nYour entire body clenches taut, arching your back as your mouth gapes in a silent scream. He allows you but a moment to adjust for his obscene girth, before withdrawing from your [pc.vagOrAss] until that fist-sized tip is out with a wet <i>pop</i>, leaving you gaping. Even through his thick scales you feel his muscles tense, and with a rumbling growl his armored hips lurch forward, [pc.vagOrAss] stretching taut as he buries himself to the hilt once more with a wet shlick");
		if(pc.bellyRating() >= 15) output(" - your [pc.belly] bulging obscenely");
		output("; the momentum pushes your [pc.fullChest] into the ice again, forcing intense sensations through your tingling [pc.nipples]");
		if(pc.hasCock()) output(" as you feel your [pc.cocks] throbbing and thumping into your [pc.belly], flinging increasing amounts of pre");
		output(".");

		output("\n\nHe withdraws slowly, savoring your clenching, writhing walls milking his shaft - every fold and wrinkle bumping and grinding against the fat ribs in a way that has your insides coiling with a tense heat - until he pops out again");
		if(pc.hasVagina() && !pc.isBlocked(0)) output(" with a gush of [pc.girlCum]");
		output(". Panting and sweating, you carefully arch your back away from the ice and start rubbing and caressing your numb [pc.nipples]; you find the tingling sensations as you work to warm them up strangely stimulating, breath growing ragged from both the alien feeling and having your [pc.vagOrAss] stuffed with monster cock once more");
		if(pc.hasCock()) 
		{
			output(", your [pc.cocks] lurching and jerking with every motion, thick strands of pre-cum drooling and whipping from [pc.eachCock]");
			if(!pc.hasVagina()) output(" that are increasingly [pc.cumColor] everytime he bashes your prostate");
		}
		output(".");

		output("\n\nPausing, the titan pants heavily across your shoulders, hot breath tracing along your [pc.skinFurScales]. He starts drawing his onyx cock out again, but falters as your ");
		if(pc.hasVagina() && !pc.isBlocked(0)) output("[pc.vagina]");
		else output("[pc.asshole]");
		output(" clings to the thick shaft stretching it wide, tender inner walls writhing and squeezing every fat rib. The delicious friction adds to the intense fullness, sending your [pc.fullChest] heaving against the ice.");

		output("\n\nYou hear him let out a feral snarl - or maybe it was ‘Fuck it’, you’re not sure - and suddenly he’s clinging to your [pc.hips] with both hands, your legs limp as he raises your [pc.ass] to be more level with his monstrously thick penis, curving your spine. He tenses, gripping you tightly, and his hard hips immediately begin pistoning in and out your [pc.vagOrAss] with bruising force. The building tension in your crotch snaps, and you’re sent over the edge.");
		output("\n\nYour [pc.vagOrAss] clenches down on the intruding shaft like a vice, ");
		//pcHasGabilaniVag
		if(pc.hasVagina() && pc.vaginas[0].type == GLOBAL.TYPE_GABILANI && !pc.isBlocked(0)) output("your powerful muscles squeezing a yelp out of Chaurmine as he virtually comes to a standstill - though he manages to grind an inch or so in and out as his hips continue their rapid thrusts - ");
		output("but Chaurmine just powers through, hips rapidly colliding into with head-to-hilt thrusts again and again");
		if(pc.hasVagina() && !pc.isBlocked(0)) output(" as [pc.girlCum] gushes out from around his fat, ribbed penis");
		if(pc.hasCock()) output(". [pc.EachCock] bloats as your seed rushes from your [pc.balls], and you give what token thrusts and jerks you can while [pc.cumNoun] coats your [pc.belly] and the icy wall");
		output(".");

		output("\n\nThe brute continues, not stopping even as you swiftly reach a second peak. It isn’t until your third that he ");
		if(pc.tallness > 80) output("plops his chin onto your shoulder");
		else output("thrusts his head forward, impaling the ice above you with his horns");
		output(" and, with a whimper, mashes his scaled sheath into your [pc.vagOrAss] as he reaches his own climax, panting and gasping for breath. His silky soft, amber sack tenses and jerks, the titan’s bulging and sloshing orbs flooding your depths with what feels like gallons of his thick, incredibly virile molten cum.");

		output("\n\nPanting and sweating against the ice - the cold hardly a concern as your body is ablaze with warmth - you feel yourself getting more and more full, and look down to see your middle expand. A whimper slips past your [pc.lips], a smaller orgasm sending jolts through your form as the brute’s own climax ends - leaving you with a belly the size of a basketball, cum leaking from your [pc.vagOrAss].");

		output("\n\nChaurmine reaffirms his grip with a smug grin.");

		output("\n\n<i>“Ohh no, we’re nowhere </i>near<i> done yet,”</i> he says with renewed energy, his xeno-saur penis still stone solid, still turgid and throbbing.");
	}
	output("\n\nChaurmine fucks as if possessed, pistoning into you as you cum - hard - over and over until you’re a babbling, cum soaked mess, and everything else goes by in a blur. Before long, everything goes dark.");
	output("\n\nYou come to in a similar position you were in when this started, in the titan’s lap, though now he’s holding you still, armored hands clutching your shoulders as his heavy snout is thrust into your [pc.fullChest]. It quickly becomes clear what he’s doing when you feel his incredibly soft, black dog-like tongue lap and slurp your [pc.nipples], which he’s been doing for a good while - obvious by their obscenely puffy state");
	if(pc.isLactating()) output(" and the [pc.milk] drenching his muzzle - the occasional snorts escapes him, sends droplets of [pc.milkNoun] splattering every which way");
	output(". You gasp and moan to the occasional nip and bite from the brute. His grip remains firm, only letting up when he’s satisfied your nips aren’t virtually frozen.");
	output("\n\nSufficiently fucked, then recovered, the two of you make for the exit of the crevasse, commenting on the ice around you and the tundra beyond. Once you’re about to part, Chaurmine suggests finding him near his ship on the station’s hangar whenever you want to chat.\n\n");

	processTime(30);
	if(pc.hasVagina() && !pc.isBlocked(0)) pc.loadInCunt(chars["CHAURMINE"],0);
	else pc.loadInAss(chars["CHAURMINE"]);
	IncrementFlag("SEXED_CHAURMINE");
	pc.orgasm();
	pc.orgasm();
	CombatManager.genericVictory();
}

//PC Loss
public function pcLosesToChaurmine():void
{
	showChaurmine();
	author("Aullama");
	output("You slip and tumble to the frigid ground, losing your grip on your [pc.weapon] as you’re sent sliding along the slick ice for several feet. The steaming lizard stomps over, and you groan in dismay; you failed him. Hell, you failed <i>yourself</i>. You’re caught off guard, however, when he kneels next to you, and you notice his eyes; though still blazing azure orbs of passion, they’re not quite as chaotic or confused, his rather manic behavior calmed.");
	output("\n\n<i>“You, uh... You did good, [pc.name]. Thank you,”</i> Chaurmine rumbles.");
	output("\n\nYou sit upright with a grunt, ignoring the cold ice on your [pc.ass]. He’s really himself again, feeling better that easily? Just like that?");
	output("\n\nChaurmine shakes his head with a growl, <i>“Yeah no, [pc.name], my blood still boils. I don’t suddenly have the answers, dumbass. I just, uh... just glad that you didn’t run - that you stayed, and tried.”</i>");
	output("\n\nYou nod, glad to have been of help, even if you don’t fully know what you did.");
	output("\n\nThe two of you spend a while longer recovering and gathering your things before going your separate ways. On your way out, Chaurmine mentions that you can find him near his ship at the hangar within the station.\n\n");
	IncrementFlag("CHAURMINE_LOSSES");
	restHeal();
	processTime(40);
	CombatManager.genericLoss();
}

//On Uveto (Station)
//Unlocks after Uveto Event is completed
//Add to Uveto Hangar
//Room description
public function chaurmineUvetoStationBonus(btnSlot:int = 0):void
{
	//showChaurmine();
	//author("Aullama");
	output("\n\nIn the distance, you see the familiar sight of metallic silver scales covering a tall and bulky frame. Chaurmine lounges around the entrance to the umbilical connected to his large ship.");

	//[Chaurmine] // Go to Visiting Chaurmine
	addButton(btnSlot,"Chaurmine",approachCharmine);
}

// Visiting Chaurmine
public function approachCharmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//First visit when @ 100% relationship:
	if(chaurmineRelationship() >= 100 && flags["CHAURMINE_MAX_RELATIONSHIP"] == undefined)
	{
		output("Remembering his invitation down on Uveto, you decide to take him up on his offer. He sees you approaching, perking up as you give him a slight wave - the area growing warmer with his alien musk.");
		output("\n\n<i>“[pc.name],”</i> he says in a neutral tone.");
		output("\n\nReturning his greeting, you catch him looking at you with a smirk, but before you can comment the brute is speaking again.");
		output("\n\n<i>“Down on Uveto got me thinkin’; all this time, and you’ve helped me like, what, at least twice now? And the last one was... yeah,”</i> he growls, his smirk shifting into a frown. <i>“I was hoping you’d stop by, actually - was wanting to give you somethin’.”</i> Motioning for you to follow, he leads you into his pyramid-shaped ship.");
		output("\n\nYou follow the titan through the umbilical and into the roomy, airy interior of his bulky vessel. Looking around, everything seems as it was back on Tarkus - especially given how spartan the place is. As you catch up to the tin lizard, you find yourself in his large workshop, though much cleaner this time.");
		output("\n\n<i>“Though I’m not as resourceful as you are, hopefully this is enough of a thanks,”</i> he leans against a workbench, snout gesturing towards it, <i>“For, uh, being... you, I guess.”</i> The movement draws your eyes to the table’s contents.");
		output("\n\nWhat you see are two weapons, a hammer and some sort of large gun - virtually identical to the weapons Chaurmine uses; the hammer looks like little more than a massive block of dark gray metal with each end covered in spikes, the handle a thick pole made of incredibly dense and durable looking red-mahogany wood reinforced with the same metal as the head - it’s basically an intricately exaggerated bushing hammer. Meanwhile, the other weapon is a matte black gun with a long and bulky barrel - looking more like the barrel to a ship’s cannon - leading to the heavy receiver and its dual drum magazine. The huge hand-grip and stock are reinforced with what looks like a carbon fiber of some sort, while a carrying grip stands idle near the receiver.");
		output("\n\nChaurmine smiles with a hint of pride as you look over the displayed weapons, <i>“Saurmorian railgun, custom made for adjustable sized grips; and a ‘morian hammer, a high-frequency weapon made to shatter through armor.”</i> He idly picks at the work table with a scale-claw before continuing, <i>“Yeah, they’re not your fancy high tech lasers, but you’ll never find a ‘morian that would take anything but their own tech - these’ll last a lifetime, kick ass, and are satisfying to use. If you don’t mind the noise, at least...”</i> Chaurmine shrugs, a moment of silence between you. <i>“They’re for you... I uh, I made them. For you,”</i> he stammers.");
		if(pc.isBro()) output("\n\nSmiling broadly to this addition to your arsenal");
		else if(pc.isNice()) output("\n\nAwed that he would go through this much effort");
		else if(pc.isMischievous()) output("\n\nChuckling at the way he’s pretending to be nonchalant with this extremely generous gesture");
		else output("\n\nSmiling broadly to this addition to your arsenal");
		output(", you start to thank the tin lizard, only to be cut off by a growl.");
		output("\n\n<i>“No, this is </i>my<i> thanks to </i>you<i>, dumbass. Take it.”</i>");
		output("\n\nWell if he insists!\n\n");
		processTime(25);
		flags["CHAURMINE_MAX_RELATIONSHIP"] = 1;
		//[Next] // PC receives Saurmorian Railgun and Saurmorian Hammer
		quickLoot(new SaurmorianRifle(), new SaurmorianHammer());
		eventQueue.push(backToUvetoChaurmine);
	}
	else
	{
		output("Remembering his invitation down on Uveto, you decide to take him up on his offer. He sees you approaching, perking up as you give him a slight wave - the area growing warmer with his alien musk.");
		output("\n\n<i>“[pc.name],”</i> he says in a neutral tone.");
		processTime(1);
		chaurmineUvetoMenu();
	}
	if(flags["MET_CHAURMINE"] < 2) flags["MET_CHAURMINE"] = 2;
}

public function chaurmineUvetoMenu():void
{
	clearMenu();
	//[Appearance] // Go to Appearance
	addButton(0,"Appearance",chaurmineAppearance);
	//[Talk] // Go to Uveto Chat
	addButton(1,"Talk",chaurmineUvetoTalks);
	//[Sex] // Go to Uveto Sex
	if(pc.lust() >= 33) addButton(2,"Sex",chaurmineUvetoSexApproach);
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for this.");
	//[Leave]
	addButton(14,"Leave",mainGameMenu);
}

//Uveto Chat
public function chaurmineUvetoTalks():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("You return his greeting, relaxing as you bask in Chaurmine’s warm presence, and ask if the lizard has some free time; just for some chit-chat.");
	output("\n\nHe shrugs his broad shoulders, scales clinking and scraping together. <i>“Sure, not doin’ any bounties right now,”</i> he growls.");

	processTime(1);
	clearMenu();
	//[Bounties] With a job like that, he must have plenty of interesting or exciting bits to tell. // Go to Bounties
	addButton(0,"Bounties",bountiesChatWithChaurmine,undefined,"Bounties","With a job like that, he must have plenty of interesting or exciting bits to tell.");
	//[WhatNow] Ask what he plans on doing. // Go to What Now
	addButton(1,"What Now?",talkToUvetoChaurmine,undefined,"What Now?","Ask what he plans on doing.");
	//[Us?] Bring up the connection the two of you have. // Go to Us // Requires 100% relationship or Lover status
	if(chaurmineRelationship() >= 100) addButton(2,"Us?",chaurmineUvetoUsTalk,undefined,"Us","Bring up the connection the two of you have.");
	else addDisabledButton(2,"Locked","Locked","You need your relationship with Chaurmine to be a bit more developed for this.");
	addButton(14,"Back",backToUvetoChaurmine);
}

//Bounties
// +5% relationship
public function bountiesChatWithChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("<i>“You really wanna hear about me smashin’ faces?”</i> he says with a rumbling sigh, rolling his eyes and crossing his arms over his armored chest, <i>“Fine.”</i>");
	output("\n\nAt first using sparse details, Chaurmine’s exploits slowly start growing more and more intricate - especially with the more recent ones - as he seems to be enjoying this chance to talk about his career with a ");
	if(flags["CHAURMINE_LOVER"] == 1) output("dear flame");
	else output("close friend");
	output(". You occasionally comment on this or ask about that, but otherwise you let the tin lizard speak.");

	//Random chance for which ending is selected
	if(rand(3) == 0)
	{
		output("\n\n<i>“-was forced to hold them off, with nothing but a hold-out pistol,”</i> he recalls fondly, <i>“Even with the daynar whore clingin’ to me as she was wrapped around my cock, in the middle of the rented room, they were out matched. When it was all over, that daynar was fucked stupid and, uh... was maybe knocked up with some of the first saurmorian half-breeds.”</i> Once he’s done reminiscing, you ask if that’s possible - a half saurmorian - but he just nonchalantly shrugs off the question.");
	}
	//End2:
	else if(rand(2) == 0)
	{
		output("\n\n<i>“-and the UGC fucker had some beef with my target - an ausar named Paw or someshit - saying he knew where to find a gryvain that they were looking for,”</i> he rolls his eyes with an exasperated sigh, <i>“Of course, they ended up killing my paychit, even having the gall to ask my help in finding some rogue officer or somethin’, afterwards. For </i>free<i> of course.”</i> After his rant, you ask if they at least found that gryvain, though you only get a vague shrug in response.");
	}
	//End3:
	else
	{
		output("\n\n<i>“-never accepted that sort of ‘payment’ before,”</i> he says with a huff, the area around him heating up, <i>“But these, uh... These male kaithrit were </i>very<i> insistent. Then again, so was I - insistently pounding their supple asses, again and again. Also, I figured I’d be bold for once, and took a few, uh, ‘bonus’ payments.”</i> His smile as he finishes seems contagious, as you find yourself grinning back at the lizard");
	}
	processTime(10);
	if(flags["CHAURMINE_BOUNTIES"] == undefined)
	{
		chaurmineRelationship(5);
		flags["CHAURMINE_BOUNTIES"] = 1;
	}
	clearMenu();
	addButton(0,"Next",backToUvetoChaurmine);
}

//What Now
public function talkToUvetoChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("<i>“Wait,”</i> he casually growls as he leans into the wall next to him. He starts to lazily grind his two larger horns against the station wall, only to stop with a cringe to the resulting screech.");
	output("\n\nThat’s it? Just wait?");
	output("\n\nTurning back to you, Chaurmine’s already aggressive visage darkens as a weak sneer splits his muzzle. <i>“Yeah, that’s it. Sorry [pc.name], not all of us have a grand scavenger hunt made by our sire with a priceless lollipop to suck on afterwards,”</i> he says lowly, then pauses as his reptilian face softens, <i>“That was, uh... That came out more shitty than I meant...”</i> With a sigh, he returns to a much more neutral demeanor, <i>“Yeah, that’s ‘bout it right now. Wait for a client to contact me - usually an UGC officer or a warden that fucked up - then go pound the baddy and bring them in, and enjoy a hefty payday; that, and slothing it up between jobs is my life, and how it will be for a while. I’m happy with that, [pc.name].”</i>");
	output("\n\nStunned, you’re not quite sure what to say. Though you do try to assure him that you didn’t mean anything by-");
	output("\n\n<i>“It’s fine, [pc.name],”</i> Chaurmine murmurs.");
	output("\n\nAfter leaving a companionable silence grow, you chuckle as you bring up that maybe he should just pack up and join you.");
	output("\n\n<i>“Why?”</i> he murmurs.");
	output("\n\nWell, in case he were to fall victim to another aphrodisiac - wouldn’t want him falling for another spacer, now would you?");
	output("\n\n<i>“That’s not funny, [pc.name],”</i> Chaurmine says with a stony face, <i>“Aphrodisiacs are hell for a saurmorian.”</i> He grumbles something else, but you miss it. Something about ‘wasn’t the venom’, you think.");
	output("\n\nYou let out a sigh. Oh well.");

	processTime(7);
	clearMenu();
	addButton(0,"Next",backToUvetoChaurmine);
}

//Us
public function chaurmineUvetoUsTalk():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//pcIsNotLover:
	if(flags["CHAURMINE_LOVER"] != 1)
	{
		output("<i>“Hmm? Uhh, yeah, you’re a good friend, like I’ve said. Why bring that up?”</i> he raises a brow in confusion.");
		output("\n\nWhy indeed.");
		output("\n\n<i>“Something on your mind, [pc.name]?”</i>");

		processTime(1);
		clearMenu();
		//[Love?] Do you confess your mutual love to Chaurmine? // Go to Love
		addButton(0,"Love?",tellChaurmineYouLoveHim,undefined,"Love?","Do you confess your mutual love to Chaurmine?");
		//[Nevermind] Haha, nah. Just like always. Friends forever. // Go to Friends
		addButton(1,"Never Mind",nevermindSlootyButtslut,undefined,"Never Mind","Haha, nah. Just like always. Friends forever.");
	}
	//Love
	else
	{
		output("<i>“You know how worked up I get,”</i> he growls dangerously, the area around him getting hot, <i>“Do you really-”</i>");

		output("\n\n<i>“Love you,”</i> you say mischievously, but genuinely.");

		output("\n\nChaurmine rolls his eyes - but his tail twitches excitedly - and huffs out a burst of steam.");

		output("\n\nOh darn, you’ve done it again.");
		
		processTime(1);
		//[Sex] // Go to Uveto Sex
		clearMenu();
		addButton(0,"Next",chaurmineUvetoSexApproach);
	}

}

public function tellChaurmineYouLoveHim():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//pcIsBimbo:
	if(pc.isBimbo())
	{
		output("You feel your [pc.face] bloom with warmth as you blush. <i>“W-well, it’s just, like,”</i> you whimper, bottom lip quivering, before dashing straight into Chaurmine and wrapping your arms around him tightly - [pc.fullChest] squished against hot scales.");
		output("\n\nChaurmine grunts from the impact, <i>“Umph! The fuck-”</i>");
		output("\n\n<i>“I just- Remember when we talked, back on Tarkus, and stuff?”</i> you sniffle against his scales. Taking a calming breath, you promise yourself not to ruin the moment. But this is so beautiful...");
		output("\n\n<i>“Uhh, sure,”</i> he murmurs.");
		output("\n\n<i>“Well, after that and spending more time with you and talking out in the tundra and hearing your feelings and like-”</i>");
		output("\n\n<i>“Oh for fucks sake [pc.name]-”</i>");
		output("\n\n<i>“I love you!”</i> you gush");
	}
	//Bro/Hard:
	else if(pc.isBro() || pc.isAss())
	{
		output("You step up to Chaurmine, clapping him on ");
		if(pc.tallness < 84) output("the arm");
		else output("the shoulder");
		output(", <i>“Look, you know all that stuff you were saying down in the tundra?”</i>");
		output("\n\n<i>“Uh huh,”</i> he nods.");
		output("\n\n<i>“Yeah, I’ll make this quick,”</i> you squeeze his ");
		if(pc.tallness < 84) output("arm");
		else output("shoulder");
		output(", <i>“I love you back, man.”</i>");
	}
	//Else:
	else
	{
		output("<i>“Actually, yes, there is,”</i> you muse, <i>“It’s about us. After spending time together after Tarkus, I feel like we’ve grown even closer.”</i>");
		output("\n\n<i>“Huh, I guess you’re right,”</i> Chaurmine rumbles, <i>“Well, our ships are, uh, maybe closer. But-”</i>");
		output("\n\n<i>“No! No, that’s not what I mean,”</i> you sigh, <i>“What you were feeling down in the tundra, after our battle. I’ve been feeling that kind of fondness in return...”</i>");
		output("\n\n<i>“So you-”</i>");
		output("\n\n<i>“Yes, Chaurmine. I love you,”</i> a shudder runs down your spine, having finally said the words.");
	}
	output("\n\nThe brute works his jaw several times, before snapping shut. His glimmering azure orbs bore into your own eyes, burning with an ignited passion that he’s struggling to dampen. Steamy breath bursts from his flared nostrils - apparently he was holding his breath - and he grins impishly.");
	output("\n\n<i>“You fucker, that kind of talk is gonna get me more worked up than I was moonside. You wouldn’t want me burning down the station, would you?”</i> Heat shimmers off of his heavy form, his breath steaming.");
	output("\n\nYou gulp, almost regretting what you’ve just started.");
	output("\n\nAlmost");
	processTime(4);
	flags["CHAURMINE_LOVER"] = 1;
	//[Sex] // Go to Uveto Sex
	clearMenu();
	addButton(0,"Next",chaurmineUvetoSexApproach);
}

//Nevermind
public function nevermindSlootyButtslut():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("<i>“Haha, of course. I was just thinking about what great friends we make!”</i> You pantomime giving Chaurmine a punch to the shoulder.");
	output("\n\nHis armored brow creases in a frown. <i>“Uhh, yeah, I just said that.”</i>");
	output("\n\nGreat minds think alike.");

	processTime(2);
	clearMenu();
	addButton(0,"Next",backToUvetoChaurmine);
}

public function backToUvetoChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Fenoxo Fenfeeeeeeen");
	output("Is there something else you’d like to ask of Chaurmine? The big lug seems quite intent on you.");
	chaurmineUvetoMenu();
}

//Uveto Sex
public function chaurmineUvetoSexApproach():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Chaurmine motions you through the umbilical, and leads you into his ship. Making your way through the now-familiar ship, the two of you quickly leave a pile of discarded things in and around the corridor leading to Chaurmine’s bedroom. Once in his airy but cozy room, Chaurmine removes the few pieces of armor he has, letting them hit the floor with a hard thump. Since his crotch was basically the only thing covered, that’s where your eyes are drawn to, now that he’s fully bare; his large balls hang low, the thick but supple reptilian hide a rich amber, and his monstrous cock droops out if its sheath, half hard. The ribbed, onyx-black shaft pulses and grows in the fresh air, its blunt tip bobbing. The tin lizard crosses his arms over his muscular chest, heavy tail swaying excitedly behind him, <i>“So [pc.name], what do you wanna do this time?”</i>");

	clearMenu();
	//[Intimate Catch] Have him put that tool to use, without being <i>too</i> rough. // No taurs // Go to Intimate Catch
	//[Taur Oral] You got it, why not fuck it? // Requires centaur-like body // Go to Taur Oral
	//[Handjob] You <i>still</i> want to feel that bulging, ribbed shaft in your hands. // Go to Ship Handjob
	//[Blowjob] His fat onyx shaft still looks <i>really</i> juicy. // Go to Ship Blowjob
	//[Titfuck] Maybe he could use some more convincing... // Requires breast size 11+ // Go to Ship Titfuck
	//[Battle] Face the titan in battle again down on the icy moon. // Go to Battle // If PC lust is >50, set PC lust to 50
	chaurmineSexMenu();
	chaurmineUvetoSexMenuAdditions();
}

public function chaurmineUvetoSexMenuAdditions():void
{
	if(pc.hasPerk("Myr Venom")) 
	{
		if(pc.isTaur()) addDisabledButton(5,"Myr Venom","Myr Venom","This scene is not compatible with your body shape.");
		else if(!pc.hasVagina()) addDisabledButton(5,"Myr Venom","Myr Venom","You need a vagina in order to this.");
		else if(pc.isPregnant()) addDisabledButton(5,"Myr Venom","Myr Venom","This would not be safe to try pregnant.");
		else if(pc.blockedVaginas() > 0) addDisabledButton(5,"Myr Venom","Myr Venom","You have something blocking access to your feminine anatomy. Perhaps handle that, first?");
		else addButton(5,"Myr Venom",myrVenomChaurmineFun,undefined,"Myr Venom","You wonder; what would happen if...");
	}
	else addDisabledButton(5,"Locked","Locked","You need the “Myr Venom” perk for this scene.");

	addButton(6,"Battle",battleWithChaurmineVoluntarily,undefined,"Battle","Face the titan in battle again down on the icy moon.");
}

//Myr Venom
public function myrVenomChaurmineFun():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	var x:int = rand(pc.totalVaginas());
	output("Basking in the warmth radiating from the titan before you, you turn the question over in your head, each new desire more lascivious than the last. Your thoughts grind to a halt, however, when you catch a hint of Chaurmine’s musk; a heady scent that leaves images of bestial power, primal urges... <i>rutting</i>. Recalling how worked up he was in the wastes on Tarkus, you can’t help but wonder how much of an effect other aphrodisiacs could have on him. You lick your [pc.lips] as you steel yourself for what is to come, ");
	if(pc.isSquirter()) output("your [pc.vaginas] soaked in feminine excitement");
	else output("[pc.vaginas] beading with feminine excitement");
	if(pc.hasCock() && !pc.isCrotchExposed()) output(" while your [pc.lowerGarments] are strained by your [pc.cocks].");

	output("\n\n<i>“Could you, uh, help me with my things?”</i> you ask with a coy smile");
	if(!pc.isChestExposed()) output(" tugging at your [pc.upperGarment] for emphasis.");
	else if(!pc.isCrotchExposed()) output(" tugging at your [pc.lowerGarment] for emphasis.");

	output("\n\nNodding with a grunt, Chaurmine hooks a claw through your [pc.upperGarments] and draws you closer, his black shaft twitching eagerly with another person so close. As more of your [pc.skinFurScales] is bared, his hands become more passionate; a warm hand glides down your back, ending with a caress on your [pc.ass] that turns into absent groping. The lizard’s other hand ");
	if(pc.biggestTitSize() <= 1) output("traces along your [pc.fullChest], and he hums appreciatively from the gasps you make as he grazes your [pc.nipples] teasingly");
	// largest bust 2-7 // 
	else if(pc.biggestTitSize() <= 7) output("apprehensively, almost delicately cups your [pc.fullChest], his palm teasing a [pc.nipple] with every light squeeze");
	//largest bust >7: 
	else if(pc.biggestTitSize() <= 11) output("apprehensively, almost delicately cups your [pc.fullChest], his palm teasing a [pc.nipple] with every light squeeze");
	else output("struggles with your [pc.fullChest], your [pc.chest] virtually bursting out of the [pc.upperGarment] that contained them. He eventually acquiesces to pinching and kneading your [pc.nipples]");
	output(".");

	output("\n\nYou sigh dreamily as Chaurmine’s warm hands grope and knead your body, and you ");
	if(pc.tallness < 72) output("stretch your arms up towards the large lizard");
	else output("lean into him");
	output(", your [pc.lips] parting for a taste of a titan.");

	output("\n\nChaurmine rears his head back, giving you an odd look as his groping stops. <i>“Uh...You ok?”</i> he asks with confused concern.");

	output("\n\nYou blink in shock, the mood ruined right before you could use your lustful venom. <i>“Y-yeah, I’m fine Chaurmine,”</i> you stammer, hoping to recover at least <i>some</i> of the lost momentum, before continuing in a more seductive tone, <i>“I was just wanting to share a kiss.”</i> You run your [pc.tongue] over your lips for emphasis, wetting them with a glossy sheen of your aphrodisiac-laced saliva.");
	output("\n\nThe lizard snorts derisively, planting both hands on your [pc.ass] and squeezing hard enough to force a whimper past your moist lips. <i>“You’re fucking weird, [pc.name],”</i> he growls, <i>“But fine, whatever...”</i> He grudgingly ");
	if(pc.tallness >= 72) output("lowers");
	else output("shifts");
	output(" his bestial face close to you once more.");

	output("\n\nHis black, canine-esque tongue shoots out of his maw, the incredibly soft muscle slapping against your lust coated lips as he gives your [pc.face] a curt lick. He retreats ");
	if(pc.isBimbo()) output("as you giggle playfully");
	else output("before you can even gasp");
	output(", a smirk on his snout as he licks his chops and takes in your taste.");

	output("\n\n<i>“That’s all you’re getting,”</i> he states matter-of-factly, <i>“I don’t know if you get off to that at all, but I don’t... Even if you </i>do<i> taste pretty good...”</i> His body abruptly blooms with heat, nostrils flaring in agitation and alarm. Barely a moment later, though, he grunts out an <i>“Umph!”</i> as you feel his monstrous shaft bolt to full mast against your loins, the ribbed length flexing and pulsing urgently.");

	output("\n\n<i>“Are you sure?”</i> you moan as you are pressed against his hot, solid form, ");
	if(pc.tallness < 84) output("taking the chance to run your [pc.tongue] along a thick scale girding his muscular chest");
	else output("and lean in to run your [pc.tongue] along his thickly armored jaw");
	output(". You have no idea if your venom even affects him through his scales, but it seems to encourage the lizard nonetheless.");

	output("\n\n<i>Finally</i> letting go of your [pc.ass], doubtlessly leaving large imprints on each cheek, Chaurmine clutches onto your [pc.hair] possessively as his free hand dabs a finger at a spit polished scale. <i>“Heh... Heh, you motherfucker...”</i> he pants hotly, his increasing body heat spreading throughout the room. Grinding his rock-solid shaft against your [pc.vaginas], ");
	if(pc.isSquirter()) output("soaking the ribbed length in [pc.girlCum]");
	else output("getting a healthy sheen of [pc.girlCum] along its length");
	if(pc.hasCock()) output(" and trapping your [pc.cocks] between two sultry bodies");
	output(", he shudders as he tries to give you a sour look, but comes across as nervously needy; you stifle a laugh. <i>“Yeah, laugh it up... cunt... So funny, I bet, heh”</i> he manages to grunt out, reaffirming his heavy hand’s grip on your [pc.hair], <i>“But... can you finish what you... what you just started? Heh...”</i>");

	//pcIsBimbo:
	if(pc.isBimbo())
	{
		output("\n\nThis time you can’t hold back a giggle. <i>“Wow, just that little bit got you good! We didn’t even, like, make out or anything. We’ll have to be careful,”</i> you say, nibbling on a lip, <i>“I mean, any more and you might become a, uh, ");
		if(pc.PQ() < 40) output("a ra-rav-, a ravo-... a sexy beast");
		else output("a ravenous, insatiable thing");
		output(", and totally stuff every ho-”</i>");
	}
	else output("\n\nYour hands glide along the lizard’s chest, fingers delicately tracing the bulging muscles that can be discerned from beneath his thick scales. <i>“And what did I just start?”</i> you say sultrily, holding his attention with a lidded gaze, <i>“Are you going to lose control? Hold me down and use me?”</i> You lick your lips once more, voice little more than a breathy whisper. <i>“Fuck me? </i>Breed<i> m-”</i>");

	output("\n\nHot, hard pressure abruptly clenches your throat shut, and your body writhes as you choke and gag on your words. Chaurmine - tightening his hand’s grip around your neck - blasts your [pc.ear] with searing breath as he closes in, breathing in your scent with another huff and a snort. <i>“Yeah, I just might,”</i> his guttural voice rumbles, dangerously low.");
	output("\n\nYour hands cling pleadingly to the beast’s thick wrist");
	if(pc.hasWings()) output(", [pc.wings] thrashing and battering his metal scales");
	if(pc.tailCount > 0) output(" and your [pc.tails] twitch and flail");
	output(" as wild, electric excitement surges along your nerves, crotch throbbing urgently.");

	output("\n\nMaybe you didn’t think this through.");

	output("\n\nThe moment he sees your eyes - gone from sultry seduction to a confused swirl of arousal and fear - Chaurmine releases you, to your great relief. You slip from his hand, coughing and sputtering as you crumple to the floor, struggling for breath on hands and knees; though the look you give him makes his tail twitch nervously, and once you’ve risen to your knees, your breathing calms with another cough and a gag. Just how hard was he gripping you? For fucks sake!");

	output("\n\n<i>“Chau-”</i> you all but croak as you try to speak, and a hand softly rubs your raw throat with a grimace. The tin lizard hesitantly moves to help you, but you stop him with a raised hand - leaving him standing as he pants and heat shimmers in waves from his bulky form. Planting a hand on your [pc.hip], the other one points down to the floor insistently. Nodding a grunt, he drops to his knees with a hard <i>thunk</i>.");

	output("\n\nChaurmine looks you over with concern, panting, before grumbling, <i>“[pc.name], I-”</i>");

	output("\n\nNope, not what you want.");

	output("\n\nYou shoot your arm up to one of his larger, skull mounted horns, gripping the hot metal tightly. With a harsh tug, you pull the titan - who gives a shrill yelp - down onto his hands, where he’s left panting as his tail sways in agitation. Your firm hold keeps his head tilted to one side, letting you lean close - his nose pressing into your [pc.chest] - and softly but imperiously whisper into where (you think) his ear is. <i>“You want to flood my womb </i>that<i> badly, huh? Well I can’t just let any creature, as </i>hot<i> and </i>throbbing<i> as it may be, to be allowed to mate with me. No no, only the most disciplined, regal, and virile stallion of a beast may be allowed to breed me,”</i> you breath, [pc.lipsChaste] brushing his metal scales as you playfully cast a cursory glance around his room. <i>“You’ll have to do, though... Just don’t. Make. A sound.”</i> You punctuate your quiet words with a wet kiss on a scale - and smile as you feel the brute shiver.");
	output("\n\nWith a pleased hum, you settle back onto your knees, and let go of the lizard’s horn. You’re surprised as, free from both your hand as well as your [pc.chest], his blazing azure stars meet your own eyes with plenty of rebellious spirit - though he remains quiet for now. Turning around, you slowly get to your [pc.feet], smirking as you tease the lusty lizard with an arch of your back; blatantly displaying your [pc.ass] and arousal-slicked crotch. Straightening your back, you casually meandering around him, taking a moment to admire the powerful, robust body at your [pc.feet]. Regardless of your earlier teasing, from his proud horns to his swaying tail, he’s the spitting image of masculinity and virility. An adonis. A <i>breeder</i>.");

	output("\n\nOh, this should be good.");

	output("\n\nChaurmine growls impatiently between hot breaths, fidgeting as he turns to look at you. Wagging a finger at him, you lean in close once again to whisper one more warning, <i>“Not. A. Sound.”</i> With that taken care of, you continue sauntering around the brute - stopping at his tail.");

	output("\n\nKneeling in between his legs, you grab his heavily armored tail to lift it out of your way - the weighty, bulky appendage feeling surprisingly pleasant - only to find out that male ‘morian tails aren’t meant to lift very far. He growls softly as his tail strains in your grip, but you ease up, flopping his tail over your head");
	if(pc.hasAntennae()) output(" - sending your antennae bobbing on top of your head -");
	output(" as you prowl between his scaled legs; letting more and more of his tail drape over your head and down your back");
	if(pc.hasWings()) output(" and threading through your [pc.wings]");
	output(", you make your way to your real target - that sloshing, swaying sack, filled to the brim with the titan’s potent cum.");

	output("\n\nUnderneath him, the heat coming off of Chaurmine becomes smothering. That, combined with the rich, potent musk practically pouring from the primal adonis virtually pulls you forward, and before you know it your [pc.lipsChaste] are pressing into the thick but silky soft hide - the churning orbs lurching at your touch. With a devilish grin, you ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("slide your far reaching mouth-muscle around the hot, amber flesh; wrapping around and kneading the top of his sack, and fondling and weighing the bulging orbs with the very tip of your [pc.tongue]");
	else output("drag your [pc.tongue] along the hot, amber flesh, leaving a sloppy trail of your special spittle");
	output(", and coo quietly as the titan cries out - hips quivering and jerking - from the potent dose of venom applied directly to his fat testicles. You can actually <i>feel</i> his cum tanks bloating further as they pulse against your tongue, slowly swelling with seed as your venom kicks them into overdrive.");
	output("\n\nLavishing the breeder’s soft hide with ever increasing enthusiasm, you almost miss noticing his hips shift from erratic jerks to more stable and regular thrusting; raising a hand to his still rock-solid shaft, you feel the blunt tip bumping and grinding against his scaled belly with every thrust, coating his abs with slick pre-cum. Your brow creases in a frown - he can’t cum so soon. You bring both hands up to the brute’s fat, throbbing shaft, one hand clutching tightly to the base - practically buried in his scaled sheath; your other hand fondles and strokes its way to the blunt glans, angling the dripping tip away from his abs. Chaurmine lets out a groan, turning it into a growl as he reaches a heavy hand to his crotch, desperate for any stimulation.");
	output("\n\nCatching him be surprise, you give him that stimulation.");

	output("\n\nHis pulsating sack glistening with your lusty saliva, you settle on giving him absentminded licks, sucks, and the occasional nibble - shifting your focus to your hands. Your digits drenched in the lizard’s copious amounts of pre-cum leaking from his blunt head, it’s easy for you to immediately slide your hand up and down the xeno-saur’s penis at a rapid pace; every bit of slick friction creating incredibly wet, juicy sounds for your [pc.ears]. Your other hand - clenched tightly near the base of his shaft, virtually stuffed into the brute’s sheath - remains still, acting as a natural cock ring around Chaurmine’s distended, ribbed cock. You hum into his swollen balls when you hear him cry out in pent up need, the approaching hand instead smacking where it first was onto the floor - catching himself as he almost tumbles over. Grunting in surprise, your [pc.lips] abruptly pop off the bulging orb they were wrapped around with a messy slurp - the tin titan’s hips piston aggressively as he pants, bulky tail swinging side to side and heavy jaw hanging agape.");

	output("\n\nWith a shuddering growl - sounding more like a groan - Chaurmine’s diamond-hard shaft flexes and clenches in a frenzy and his testicles jounce as he’s forced to an intense peak. You feel his thick cum surging towards release - though with your hand clenching the brute’s cumvein tightly, there’s nowhere to go but back. You can actually <i>see</i> his amber nuts swell, slowly expanding from the backed up seed. The lizard whines as his distended balls stop, seemingly unable to swell any further, almost looking like heavy cantaloupes as they bulge around your [pc.lipsChaste]. Though not anywhere near the scale of something like a kui-tan, you’re still pleased by the display.");

	output("\n\nChaurmine’s scale-claws scrape the hard floor as he pulls the two of you to his bed - his upper half making it onto the odd mattress - all but snarling as he twists and contorts in an effort to see what you are doing while his armored hips continue their desperate pistoning. <i>“Fffuckin- what the </i>fuck<i>, [pc.name]?”</i> he bellows, <i>“Th-that-... You’re weren’t supposed to-...”</i> He gives up words with a whimper, instead returning to panting heavily.");

	output("\n\nWhether from his rut or his temper - or both - the space underneath the lizard is becoming incredibly uncomfortable, forcing you to abandon that juicy sack and shaft before you suffocate. Standing with a hand supporting you on sweltering scales, you gasp as your lungs are filled with warm, but comparatively frigid air. Free from your grasp, Chaurmine lets out a huff of scorching breath in relief.");

	output("\n\nSeeing the titan’s distended xeno-saur cock twitch and throb above the swollen, cum-engorged balls, sloshing with their gooey weight, only fans the flames to your own ardor - loins aching with intense desire ever since your venom seeped into the lizard. Slyly sliding onto the odd bed, you lean in close to Chaurmine, letting all of his senses take in your sweat slicked body as each hand grips one of his upper horns - and tenderly caressing and cupping the scaled titan’s fat, ribbed phallus and churning sack with your [pc.feet]");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", and the tip of [pc.eachTail] tickles and teases his cumslit");
	output(".");
	output("\n\n<i>“You’ve disobeyed me multiple times now,”</i> you whisper into his scales, <i>“That’s not how a virile breeder should act, is it?”</i> You wait for him to answer, grinning when he curls his armored lips into a growl - at least, you think that’s a response to your question - and give his onyx penis an encouraging squeeze. <i>“No, it isn’t. Now, are you going to show me what a great breeder you are? Show me that you even </i>can<i> breed?”</i> you taunt, every breathy syllable you whisper a challenge to the rutting lizard.");
	output("\n\nYou slip further back onto the alien bed, pulling Chaurmine with you by his horns, until you come to rest against the headboard. Chest heaving as the titan’s heat envelops you again - leaving you panting just as much as him - you tug his horns back once he’s on top of you, forcing him to expose his throat to you in a very submissive gesture. He growls in displeasure, neck scales vibrating with every rumble. With a hum, you glide your [pc.tongue] over his scales; over the collar bone, up his neck, and finally polishing the long scales along his jaw, producing the delightful sound of wet flesh caressing hard, smooth metal. Chaurmine shivers and gasps as yet more venom seeps into his blood. Through your own haze of pent up need and smothering heat, you momentarily worry if you’ve gotten carried away with your venom...");
	output("\n\nHis searing cock bumps into your [pc.thigh], drawing a gasp from your [pc.lipsChaste]");

	output("\n\n...Nah, he’ll be fine, and so you pull his head down as you breathe into his ear (you think) once more. <i>“Show me what you need,”</i> you command with a whisper, grinding your [pc.crotch] against the lizard’s wide, monstrous cock for emphasis. You let out a pleased sigh when Chaurmine brings his sweltering hands to your shoulders, gripping you roughly as he shifts you onto your back, pinning you beneath him. Nibbling on a lip, you wrap your [pc.legs] around the brute’s hips - his scales hot - in a bid to speed things up, cheering inwardly as his throbbing, monstrously thick cock slaps against your [pc.vagina " + x + "]. Holding back a dumb grin at the sensation, you notice Chaurmine staring at you with wild eyes containing a fierce storm of lust and rage, absently grinding his pre slick shaft against your lust lubed folds as he pants and drools, sizzling spittle dripping onto your [pc.chest]. You seem to have flooded the titan with enough venom that he wants nothing more than to ravage you - but waits for your word. <i>Perfect</i>.");

	output("\n\n<i>“<b>Breed me</b>.”</i>");

	output("\n\nChaurmine throws his head back and releases a primal roar right as he thrusts, loud enough to shake the hull and leave your ears ringing. Dazed, it all seems to happen in a heartbeat; his shaft spreading you wide, vaginal folds stretched taut as he thrusts to the hilt, your head thrown back as you scream in pained ecstasy and your back arches, muscles straining in the titan’s grip. It all crashes through you at once, and by the second heartbeat, you’re cumming your brains out.");
	pc.cuntChange(x,chars["CHAURMINE"].cockVolume(0));

	output("\n\n[pc.eachVagina] spasms and writhes, gushing [pc.girlCumNoun] with every powerful thrust of the lizards hard hips as they force surge after searing surge of white-hot bliss through your cock-tunnel and igniting your every nerve");
	if(pc.hasCock())
	{
		output(", setting off [pc.eachCock] and ");
		if(pc.cumQ() < 500) output("glazing your middle and [pc.fullChest] with thick volleys of [pc.cumNoun]");
		else output("drenching your entire [pc.belly] and [pc.fullChest] with barrage after barrage of [pc.cumNoun] - even coating the metal titan -");
		output(" from your [pc.balls]. Heart racing, arms flailing, every brutal thrust jostling your body and flinging crystalline drops of sweat and saliva");
		if(pc.isLactating()) output(" and [pc.milkColor] [pc.milkNoun]");
		output(", and even [pc.cumColor] [pc.cumNoun]");
		output(" off your body");
	}
	if(pc.biggestTitSize() >= 1) output(" as your [pc.fullChest] jiggle");
	output(" with the wild movements, [pc.tongue] flopping about limply - he’s hardly begun and he’s already fucked you silly!");

	output("\n\nBetween every one of his savage thrusts and your gasps of his hot musk, you move your hands to your [pc.belly], ");
	if(pc.bellyRating() >= 30) output("wishing you could feel his distended cunt-wrecker bulging through your [pc.skinFurScales]. You settle for outlining where you feel your womb is, setting a visible target for Chaurmine - and squeal in delight as the sight causes his thrusts to speed up");
	else output("moaning in aroused awe as you feel his fat cunt-wrecker bulging obscenely into your hands through your [pc.skinFurScales]. Cupping your distended flesh, you move in rhythm to his thrusts, effectively jerking him off through your [pc.skinFurScales]. Chaurmine grunts, and you squeal in delight as his thrusts come faster");
	output(".");

	output("\n\nIn the middle of another of your delirious and mind wracking orgasms, Chaurmine suddenly doubles over, jaws clamping onto your neck as he gives one last ass-bruising thrust into your [pc.vagina " + x + "]. Your hands zip up to his jaws, earning you disapproving snarls as you give weak attempts at prying his jaws open - the painful grip of his teeth most definitely breaking the skin. You feel his fat xeno-saur cock twitch and flex inside you, bloating even further as his backed up seed distends the already thick cumvein, and stretching your vaginal walls painfully as the thick cum rushes towards your womb.");

	output("\n\nThe first powerful blast virtually floods your uterus, basting your fallopian tubes, and continues to spout the titan’s virile seed. Gurgling and gagging, your hands scrape and claw at Chaurmine’s teeth as you cum <i>hard</i>, your writhing and contorting causing your expanding middle to jiggle and wobble. With every voluminous blast, your belly expands further and further until, with a whimper, you can’t take any more; the excess reptile goo dripping and leaking around his outrageously wide cock, more seems to enter you than exit - eventually bursting and streaming out with every additional drop of cum. Your sight starts to waver, seeing vague spots while the edges of your vision darken.");

	output("\n\nSuddenly, the pressure on your throat is removed, and the cock spearing you pulled out with the most scandalous and obscene slurp. You cough and sputter as you struggle to breathe, spittle coating your [pc.lipsChaste] and chin, and bring a hand to your neck - wincing as you feel what are clearly punctures from the fucker’s teeth. Speaking of, where is that-");

	output("\n\n<i>“Get up,”</i> Chaurmine rumbles from above. Oh, your [pc.eyes] were shut. <i>“I said </i>Get. Up.<i> Steele.”</i>");

	output("\n\nThat’s when you notice his still turgid, fully erect penis pulsating against your [pc.thigh].");

	output("\n\nReading your reaction, Chaurmine’s maw splits into a sour sneer, <i>“Yeah... I’m not done with you yet, and I won’t be for a </i>long<i> time. You have yourself to thank for that.”</i> His hot hands abruptly turn you onto your side, and he aims his fat, cum dripping phallus through your [pc.ass] and against your [pc.asshole].");

	pc.buttChange(chars["CHAURMINE"]);

	output("\n\nOh, fuck.");

	output("\n\nChaurmine ruts for hour after hour, desperately using every orifice available to sate the lust you’ve planted in him. All the while, you feel like little more than a filled condom, wrapped around that monstrously thick penis and packed with more and more hot cum. Every orgasmic pulse from the titan sets off one of your own - though it all passes by in a blur, eyelids fluttering over eyes perpetually rolled up into your skull.");


	processTime(60);
	for(var y:int = 0; y < 15; y++)
	{
		pc.orgasm();
	}
	pc.loadInAss(chars["CHAURMINE"]);
	pc.loadInCunt(chars["CHAURMINE"],x);
	if(pc.hasCuntTail()) pc.loadInCuntTail(chars["CHAURMINE"]);
	if(pc.hasFuckableNipples()) pc.loadInNipples(chars["CHAURMINE"]);

	clearMenu();
	addButton(0,"Next",chaurmineVenomsSlootings2, x);
}

public function chaurmineVenomsSlootings2(x:int):void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("You come to, coughing and sputtering (again) as your burning lungs cry for air (again). Thick cum bursts past your white-stained [pc.lips] and nose, though you keep the rest down with a gag. You groan as you pull yourself off of the cum-caked bed, sore muscles protesting under sticky [pc.skinFurScales] until your rotund belly prevents you from sitting up, and you prop an arm behind you as the other drapes over your cum gravid form. You shudder, your body caked with drying seed - you even feel it oozing from every hole; the sticky goop seeping out of [pc.eachVagina] and [pc.asshole] as more drips from your chin and onto your [pc.fullChest]");
	if(pc.hasTailCunt()) output(" - [pc.eachTailCunt] bloated and leaking gobs of cum as well");
	if(pc.hasFuckableNipples()) output(", even your [pc.nipples] weren’t spared, the brute having left them tender and sore from being gaped then stuffed with cum");
	output(".");

	output("\n\nA cough draws your attention to Chaurmine, standing in the doorway leading into the corridor with thick arms crossing his chest. His azure eyes, calm once more, stare at you critically. <i>“[pc.name], I don’t know what you did - fuck, I dunno what </i>I<i> did - but we should, uh... avoid doing that again. I mean it,”</i> his voice almost cracks with concern.");

	output("\n\n<i>“I’m fine Chaurmine, I’m alright,”</i> you assure him, grimacing at your raw throat - but something he said catches your ear. <i>“You really don’t remember anything?”</i>");

	output("\n\nHis scales scrape together as he shakes his head, but pauses. <i>“Well, I didn’t say </i>that<i>. I vaguely remember being both livid whenever I looked at your lips, and being hornier than ever before at the same time,”</i> Chaurmine growls, <i>“But whatever, hop in the showers and get the fuck off my ship.”</i>");

	output("\n\nYou moan, rubbing your head as Chaurmine steps beside his bed and helps you onto your [pc.feet], only to end up carrying you as your [pc.legs] refuse to work. While you’re held tenderly in his warm arms, you swear you hear him mumble to himself, <i>“Gotta admit, the result is pretty fucking hot though...”</i>");

	processTime(120+rand(50));
	for(var y:int = 0; y < 5; y++)
	{
		pc.orgasm();
	}
	IncrementFlag("SEXED_CHAURMINE");
	pc.loadInAss(chars["CHAURMINE"]);
	pc.loadInCunt(chars["CHAURMINE"],x);
	if(pc.hasCuntTail()) pc.loadInCuntTail(chars["CHAURMINE"]);
	if(pc.hasFuckableNipples()) pc.loadInNipples(chars["CHAURMINE"]);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Battle
public function battleWithChaurmineVoluntarily():void
{
	clearOutput();
	showChaurmine(true);
	if(pc.lust() >= 50) pc.lust(50,true);
	output("With him already worked up, it may be a good idea to head out into the tundra and wear off his pent up energy. You wouldn’t mind a chance at beating him again either. Chaurmine seems to like the plan.");
	output("\n\nThe two of you hurry off towards the elevator, making the trip down and out of Irestead in relative silence. It takes you a while, but a crevasse is eventually found for what you have in mind - it’s not the one you originally fought in, but it will do.");
	output("\n\nShimmering with heat, Chaurmine grows increasingly excited, panting misty breath as the cold air steams heavily off of his scorching body.");
	output("\n\n<i>“I hope you’re ready to do this again, [pc.name],”</i> he snarls, his teeth bared savagely.");

	processTime(30);
	//move to riiift
	moveTo("UVIP Z22");
	// Add cold!
	addUvetoCold();
	
	var chaur:Creature = new Chaurmine();
	chaur.credits = 300 + rand(201);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(chaur);
	CombatManager.victoryScene(beatUpCharmine);
	CombatManager.lossScene(pcLosesToChaurmine);
	CombatManager.displayLocation("CHAURMINE");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}