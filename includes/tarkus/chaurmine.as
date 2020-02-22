/*Chaurmine
by Aullama

Summary
Chaurmine is a saurmorian, a species of armored reptiles from Molis. Upon hatching, it was immediately apparent that Chaurmine was going to be an exceptionally strong and virile male; deep amber skin being a rare occurrence. Shortly after he reached maturity, he jumped at the first chance to get offworld, preferring to try an unknown life over being a matron’s favored cum pump. After being on his own for a long while, he eventually meets the PC on Tarkus. If the PC interacts more with Chaurmine on Novahome, he will meet the PC in the hangar and confess his feelings. Depending on how the PC reacts, they may find him on Uveto, where they help Chaurmine cope with his emotions via fighting, and then interacting with him in Uveto Station.

Mechanics/Technicalities
Chaurmine_helped_or_guarded 

Chaurmine_abandoned

Chaurmine_relationship ranges from 0% to 100%, initially caps at 50%

Chaurmine_novahome_event unlocks relationship cap from 50% to 100% cap.

Chaurmine_novahome_like

Chaurmine_novahome_meh

Chaurmine_novahome_dislike

Chaurmine_status_lover

Chaurmine_uveto_event


Equipment: TBD
meleeWeapon: Saurmorian Hammer
rangedWeapon: Saurmorian Railgun
armor: Saurmorian-fitted Tactical Groin Armor

Saurmorian Codex
https://docs.google.com/document/d/1Fm65BLvSkmSAaSBg0YB4A02VWkLepeQ4h0g5Ne_0kvk/edit?usp=sharing
*/

//Steele Meets Steel
//Can be encountered on Tarkus after Steele completes the first probe

public function showChaurmine(nude:Boolean = false):void
{
	var bustBone:String = "";
	if(nude) bustBone = "_NUDE";
	if(flags["MET_CHAURMINE"] == undefined || flags["MET_CHAURMINE"] == -1) showName("BIG\nREPTILE");
	else showName("\nCHAURMINE");
	showBust("CHAURMINE" + bustBone);
}
public function chaurmineRelationship(change:Number = 0):Number
{
	if(flags["CHAURMINE_RELATIONSHIP"] == undefined) flags["CHAURMINE_RELATIONSHIP"] = 0;
	if(change != 0)
	{
		flags["CHAURMINE_RELATIONSHIP"] += change;
		if(flags["CHAURMINE_RELATIONSHIP"] > 100) flags["CHAURMINE_RELATIONSHIP"] = 100;
		if(flags["CHAURMINE_RELATIONSHIP"] < 0) flags["CHAURMINE_RELATIONSHIP"] = 0;
	}
	return flags["CHAURMINE_RELATIONSHIP"];
}

public function chaurmineOnTarkus():Boolean
{
	if(flags["ABANDONED_CHAURMINE"] == undefined || flags["ABANDONED_CHAURMINE"] == 1 || flags["ABANDONED_CHAURMINE"] == 2)
	{
		if(chaurmineRelationship() < 50 && flags["CHAURMINE_LOVER"] == undefined) return true;
	}
	return false;
}
public function chaurmineAtWastes():Boolean
{
	return (flags["CHAURMINE_GUARDED"] == undefined && flags["CHAURMINE_HELPED"] == undefined && (flags["ABANDONED_CHAURMINE"] == undefined || flags["ABANDONED_CHAURMINE"] < 3));
}

public function encounterChaurmine():void
{
	showChaurmine();
	author("Aullama");
	//first encounter:
	if(flags["MET_CHAURMINE"] == undefined)
	{
		output("\n\nYour thoughts are interrupted as you hear the rumble of a conflict erupting in front of you.");
		if(CodexManager.entryUnlocked("Sydians")) output("\n\nA giant of a male sydian rolls into view, holding his jaw with a grimace as if he had just taken a heavy hit");
		else output("\n\nA massive creature covered in chitin rolls into view, holding its jaw with what looks like a grimace of pain, as if it had just taken a hit");
		output(", but shakes it off with an irritated growl.");
		output("\n\nHolding fast, the chitinous warrior smacks away a thrown chunk of dusty debris that bursts into a dusty veil, then grunts in surprise and pain as something rams ");
		if(CodexManager.entryUnlocked("Sydians")) output("him");
		else output("it");
		output(" hard right when the grimey cloud hides the clash. As you wait for the dust to settle, you catch hints of metal on a massive frame that is heavily panting. With its opponent seemingly driven off, it starts to relax and weakly fan away at the dirty air while you ");
		if(pc.isNice()) output("tentatively take a step towards it, not sure how this creature will react to your presence but not wanting to risk making any sudden moves.");
		else if(pc.isMischievous()) output("cross your arms across your [pc.chest] casually and shift your weight, impatiently waiting to see what it is.");
		else output("roll your shoulders and sigh in irritation. It seems every time you go somewhere, this shit happens. You ponder leaving, but doubtlessly something else would just pop out in front of you. Hell, maybe one of them will have something of worth to sell if you wait this out.");

		output("\n\nWhen the air clears enough, you are surprised to see the bestial visage of a massive, heavily armored being staring right at you. ");
		if(CodexManager.entryViewed("Saurmorians")) output("You frown; this looks like a saurmorian. To see one here, of all places, is more than a little odd. This one looks like a large male too, you note. Maintaining a safe distance, you uneasily shift your eyes from his shiny metallic-silver scales, looking incredibly heavy, to his adornment of three massive metal horns pointing up and forward dangerously, and inevitably locking your gaze on his");
		else output("Whatever this thing is, it’s noticeably bigger than its previous opponent. Covered almost entirely in metallic-silver scales on its powerful, hefty frame, it’s a wonder how the creature has managed to survive in this wasteland of rust. But there it sits, breathing and moving, as it stares at you with piercing azure eyes, each with a slitted pupil. Above its armored brows and snout sits a trio of hefty metal horns, curved up and forward much like that of some prehistoric creature. As it stands idle and lets you stare along its broad shoulders, bulging arms, up its thick plantigrade legs and heavy tail, it clearly isn’t aggressive. No, <i>he</i>, you correct yourself, as your inquisitive gaze finally falls upon his");
		output(" throbbing, black shaft; his groin all but exposed from the tattered remains of his gear. The thick and lengthy phallus, ribbed along its length, rises from an almost equine sheath. A sheath delicately encased by small scales, that is. From base to tip, the shaft looks roughly fourteen inches long, and at least three inches thick. It takes you a while to draw your eyes back down from its blunt head to the rather soft and smooth large sack below, the alluring skin a dark amber. Not wanting to stare any longer, you look into his face once more, and only now do you see his scales splattered in pink goo.");

		output("\n\n<i>“What, are you gonna try and eat me too?”</i> he growls in a deep, guttural voice, startling you out of your daze. Though you don’t think he means any enmity, there is a hint of apprehension in his tone, while he practically drips exhaustion. Shaking your head, you assure him that you’re not here to eat him, you just happened to chance upon the end of his fight. <i>“Some fucking luck you have then, huh?”</i> he coughs out a laugh as his panting turns to more stable breathing.");
		output("\n\nLooking at the metal behemoth’s situation with more than a little sympathy, you take cautious steps towards the beast. <i>“Look, this might be a </i>little<i> forward, but I think, for your safety-”</i>");
		output("\n\n<i>“No, get outta here,”</i> he blurts, his lips curling back in a snarl of disapproval.");
		output("\n\n<i>“-it would be best if I stayed,”</i> you continue, followed by a derisive snort from the brute.");
		output("\n\n<i>“I’m not your free show,”</i> he growls in dismissal, <i>“So fuck off.”</i>");
		output("\n\nYou shake your head at his bullheadedness, <i>“Well it’s up to you if you want one person, or a dozen at once after I leave,”</i> you comment with a shrug.");
		output("\n\nHe spends a moment contemplating, and just as you’re thinking to leave, he answers, rumbling <i>“Hmmph, even though it looks like standing there and gaping like some useless piece of trash is what you do best... If you stay, you help. Otherwise leave,”</i> he counters before you can respond, <i>“I’m not waiting to go soft just so you can have a chat.”</i> Seems he’s not one for subtlety.");
		flags["MET_CHAURMINE"] = -1;
		processTime(10);
		
	}
	//Repeat wastes encounter:
	else
	{
		output("\n\nMaking your way through the piles and hills of scrap and junk, you once again hear the sounds of combat ahead of you. Cautiously approaching the area the noises are coming from, you swiftly come upon the familiar sight of a massive bipedal reptile, encased in metal scales, caught in a brawl with a smaller form covered in a brown chitin.");
		output("\n\nDodging the lizard’s slow attacks when actually in reach, the feminine looking bug hums in mild amusement. <i>“Such a powerful male. And those scales look tasty... Oh I’m gonna enjoy taking you as mine,”</i> she coos excitedly, licking her lips.");
		output("\n\nAs soon she spots you, however, any thrill at her seemingly easy catch is replaced with growing trepidation. With surprising speed, the metal brute uses this momentary distraction to lunge forward, managing to grab onto one of her antennae. Yelping in alarm, the bug woman instinctively tries to jerk backwards out of his grip, only to give a pained whine as the he roughly pulls her back.");
		output("\n\nFinally noticing, or at least acknowledging you, the metal lizard turns to you with a sneer of irritation, his catch looking ever more sour as the powerful male shifts his attention elsewhere. <i>“Well shit, you really have good timing don’t y-”</i> the bug woman abruptly lashes her free antenae into her captor’s snout. The lizard’s grip unconsciously releasing the bug girl to try and clear the pink slime on his snout, allowing her to dash over the nearest scrap hill and disappear from sight.");
		output("\n\nWhipping his arms to try and dry them, he heaves a heavy sigh before turning to you. <i>“This better not become a thing, you asshole,”</i> he rumbles.");
		processTime(5);
	}
	clearMenu();
	//[Help him] Helping would more than likely involve getting your hands dirty... // Go to Help him
	addButton(0,"Help Him",helpChaurmine,undefined,"Help Him","Helping would more than likely involve getting your hands dirty...");
	//[Guard him] Or at the very least, watch him... // Go to Guard him
	addButton(1,"Guard Him",guardDatScaleDino,undefined,"Guard Him","Or at the very least, watch him...");
	//[Leave] With that attitude? He’ll be fine... // Go to Leave
	addButton(2,"Leave",leaveChaurmineToiletPaper,undefined,"Leave","With that attitude? He’ll be fine...");
}

//Help him
//All three options should result in PC getting the cum splattered effect
public function helpChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("Knowing where this is going, and figuring he has no patience for a show, ");
	//flaggedNude
	if(pc.isChestExposed()) output("you move toward the brute, and he gives an amused snort, <i>“D’ya go walking everywhere like that?”</i> You grin mischievously as you kneel next to him");
	else output("you start to head towards him only for him to growl disapprovingly, his scales lightly scraping together as he shakes his head. <i>“The shit you’re wearing. Off with it. If you’re going to jerk me off or whatever in the middle of nowhere, the least you could do is provide some proper eye candy...”</i> he barks, <i>“Just waist up, actually... Don’t want you getting any ideas, now.”</i> You shrug, figuring there’s no harm in going along with the strange request, and start to remove your [pc.upperGarments]. Hell, maybe it will prevent <i>him</i> from getting over excited. You kneel next to him once he is satisfied");
	output(". Up close you feel a heavy warmth radiating from the metal-scaled form in front of you, accompanied by his musk. Your own body becomes slightly flushed with heat in response, seeming to pool to your crotch. His piercing stare falters at your closeness, and takes in your [pc.skinFurScales] as he scans your face.");
	if(pc.hasVagina()) output(" His firey azure eyes abruptly turn downward, showing particular interest in your crotch as he catches your scent.");

	//flatChest
	if(pc.biggestTitSize() < 1) output("\n\nNoticing your [pc.fullChest], he nods absently ");
	// bustSize 1-10 
	// bustSize 11+: 
	else if(pc.biggestTitSize() < 11) output("\n\nHis gaze is drawn to your [pc.fullChest], a note of distaste on his metal scaled face");
	else output("\n\nHis cold eyes are quickly plastered to your [pc.fullChest], a thickly armored brow raised, as if he can’t believe they’re real. The poor guy is a tidal wave of confusion, disgust, and unfamiliar lust");
	output(" as he finally meets your eyes again. Apparently having had his fill, he continues to meet your gaze as his menacing armored visage remains quiet. You get to initiate, it would seem. His thick shaft reflexively jerks in open anticipation, looking even more solid than his scales.");

	processTime(5);
	pc.changeLust(5);
	IncrementFlag("CHAURMINE_HELPED");
	clearMenu();
	//[Handjob]
	addButton(0,"Handjob",handjobChaurminePaperTowells,undefined,"Handjob","You want to feel that pillar throb and pulse in your hands.");
	//[Blowjob]
	addButton(1,"Blowjob",blowjobChaurmineHelp,undefined,"Blowjob","He looks quite juicy.");
	//[Titfuck] // PC has bust size 11+
	if(pc.biggestTitSize() >= 11) addButton(2,"Titfuck",titfuckChaurmineToiletPaper,undefined,"Titfuck","Though he seems to dislike breasts, you <i>know</i> you can change his mind.");
	else addDisabledButton(2,"Titfuck","Titfuck",("You need " + (!pc.hasBreasts() ? "huge tits" : "bigger boobs") + " for this..."));
}

//Handjob
public function handjobChaurminePaperTowells():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Reaching out a hand, you grasp bestial girth pulsing to the metallic titan’s powerful heartbeat. This close, his musk gets much stronger, surprisingly rich and pleasant as your breathing grows quicker. He unconsciously relaxes at your touch, letting out a barely discernable sigh as your other hand softly caresses up his ribbed penis. While your other hand massages around his sheath, you glide up the incredible length of his monstrous cock before gently clutching his thick, blunt tip. Trying to ignore the growing heat in your ");
	if(pc.hasGenitals()) output("[pc.crotch]");
	else output("[pc.asshole]");
	output(", you pick up the pace.");

	output("\n\nMoving the grip you have at his sheath to his soft sack, you grab onto one of his large, bulging orbs, virtually too big to hold onto. At the same time, your other hand clenches his monstrous cock tightly as it starts slowly stroking, almost experimentally, up and down with increasing speed, wanting to do your best to milk this oversized lizard of his creamy prize. He relaxes further as a grunt of approval slips from his core.");
	output("\n\nHis now freely dribbling, onyx dick feels all the harder as his pre drenches his shaft and your hand, the growing mutual enjoyment sounding more and more wet while your grip slides up and down, unconsciously going faster and faster with each wet shlick. With a light gasp, you sheepishly realize you are still awkwardly fumbling with one of his oversized testes as you feel his pre slide down from his sheath and moisten your hand. Gathering more, you slather the orbs to a glistening shine as you caress and slide across the soft reptilian skin with your touch, feeling the bloated cum factories pulse in tune with his shaft in growing need.");
	output("\n\nOnce more noticing your ");
	if(pc.hasGenitals()) output("[pc.crotch]");
	else output("[pc.asshole]");
	output(" clench desperately, you cast a pleading gaze to the towering alien, only to see him staring at you imperiously; his armored snout splitting into a smug grin. As you caress and squeeze his bestial cum cannon though, secretly delighting in its ribbed length, his demeanor changes as he starts to groan and pant anew; gradually shifting from arrogance to simple indulgence. Seeing the effect you have on him, you grin playfully and decide your own needs can wait. You want to focus on the volcano of lust created from your touch laying before you.");

	output("\n\nContinuing to massage his bloated, churning, amber sack encouragingly, you move your other hand’s focus to the monstrous head of his massive cock. Wreathing the blunt, throbbing tip with your hand, you twist and jerk his glans vigorously, causing the brute to grunt and unconsciously thrust into your grip.");

	output("\n\nAfter a few moments of this, he seems to settle, only for giant armored hands to tightly grip your shoulders. Almost pausing as you nearly jump out of your [pc.skinFurScales], you shoot your eyes up to meet his glare as you lavish his manhood with your hands’ affections. With his azure eyes ablaze with an inner fire, the heat radiating from him becomes even more oppressive. He looks as if he wants to say something, but is panting too hard as the heat visibly shimmers off of him. His guttural breaths are interrupted as you lose your patience, writhing and grinding both hands against his glans. Tensing, he draws a deep breath as you firmly bring him over the edge.");

	output("\n\nHmm, he’s been rather belligerent, but given his condition it might be understandable. How do you treat him?");
	processTime(10);
	pc.changeLust(5);
	clearMenu();
	//[Gentle] Aww, he’s been having a bad day. Why not be a little sympathetic. // Go to Gentle // -10 Personality score
	addButton(0,"Gentle",gentleChaurmineHJFinisher,undefined,"Gentle","Aww, he’s been having a bad day. Why not be a little sympathetic.");
	//[Rough] This monstrous thing is having trouble out here? Maybe he could use a little tough love. // Go to Rough // +10 Personality score
	addButton(1,"Rough",chaurmineHJRoughEnd,undefined,"Rough","This monstrous thing is having trouble out here? Maybe he could use a little tough love.");
	//[Playful] That actually doesn’t really matter to you. What you want to see, though, is how far this cum cannon can ejaculate. // Go to Playful // +5 Personality score
	addButton(2,"Playful",playfulChaurmineHJend,undefined,"Playful","That actually doesn’t really matter to you. What you want to see, though, is how far this cum cannon can ejaculate.");

}

//Gentle
public function gentleChaurmineHJFinisher():void
{
	clearOutput();
	author("Aullama");
	showChaurmine(true);
	output("You " + pc.mf("grin triumphantly","softly coo") + " as you see his cum tanks tense right before his shaft bulges with what feels like a <i>massive</i> load. Hands clutching his stone hard girth, you massage along his urethral bulge with your thumbs as he releases jet after jet of cum into the air, only for it to rain back down onto you both. You gasp as you are drenched, creamy cum washing down your [pc.hair] and [pc.face] to flow in thick rivulets down your torso.");
	output("\n\nThrough your coating of lizard jizz, you gently milk his shaft from base to tip for every last drop, the titan’s shaft twitching obscenely from your hands alone. You silently revel in his tense convulsions, his hot breath and shimmering body seeming to envelope your world in his musk as you are coated in his potent seed.");
	output("\n\nThe brute’s writhing and thrusting dissipate, though he remains tense, and occasionally twitches excitedly. With a solid grip kept on his fat cock, you focus on his cumslit with a smothering finger. Lubed by what can be little more than pre at this point, the beast practically whines as you wreathe his incredibly sensitive tip in torturous yet blissful friction, less ejaculate emerging with each contraction. Figuring you’ll be nice, you stop your movements. But don’t let go.");
	output("\n\nYou let him ride out the last of his lengthy orgasm by his own movements; given that he hasn’t gotten too sensitive. After a few last thrusts, he seems to start to calm down, almost immediately going soft in your grip. Seems you nearly exhausted the titan. Certain that that’s the best you can do for him right now, you clear your face of what remains of his thick seed.");
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	pc.addNice(1);

	//[Next] // Go to Handjob End
	clearMenu();
	addButton(0,"Next",chaurmineHJEndoFinale);
}

public function chaurmineHJRoughEnd():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("Chafed by his rather off-putting demeanor, you swiftly clench the base of his jet-black shaft in a tight grip just as you see his sack tense and twitch in desperate release. As his pent up load is spontaneously trapped, the tin can reptile seizes and writhes violently, barking out a surprisingly canine yelp.");
	output("\n\nSmirking lightly in amusement, you manage to keep your grip on his shaft despite his contorting form. You can <i>feel</i> the pressure from all the backed up cum with nowhere to go; except back to the throbbing testes full to bursting with another load. You’d swear the brute’s balls almost swell, bloating with two orgasms and more, but maybe it was just a trick of the light. Regardless, he’s nowhere near finished, if his still twitching cock and thrusting hips are any evidence.");
	output("\n\nNoticing the rest of him to be still as a statue, you glance up to see him virtually frozen, with his eyes staring at you with a mixture of naked outrage, fear, and a drop of... arousal? As he opens his jaws as if to speak, you roughly twist at his scaled but soft sheath. His jaws reflexively slam shut at the sensation, resounding with an audible <i>snap</i> and a reverberant clang, before letting out a desperate whine.");
	output("\n\nSeeing that he now appreciates who’s actually in control, you decide to be nice this time. Eyeing his still clenching shaft and practically vibrating sack, both obscenely swollen from your denial, you release your handle of his sheath so you can grip his over sensitive tip and stroke the hard, swollen mass as swiftly as you can. Just as the large lizard breathes in a gasp, you take your other hand and clench hard onto as much of a bloated nut as you can, forcing many loads of cum through one orgasm. Though you’re not sure if this actually hurts him, he seems to be enjoying your rough handling.");
	output("\n\nAs his amber sack tenses intensely and seems to shrink, his ribbed shaft bulges even more. The metal behemoth’s hands claw at the air, and feet dig and tear into the ground in both incredible pain and sublime pleasure, forcing a hoarse growl from his maw as his bloated shaft fires rapid loads of thick seed onto his face and chest repeatedly, drenching him from horn to cock. As his release peaks in ferocity, you find yourself just as covered as he is, your chagrin almost causing you to miss his clenching spout of a shaft slow to a trickle.");
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	pc.addHard(1);
	//[Next] // Go to Handjob End
	clearMenu();
	addButton(0,"Next",chaurmineHJEndoFinale);
}

//Playful
public function playfulChaurmineHJend():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Grinning lecherously, you immediately let go of his rigid phallus to let it jerk and twitch dangerously. Hearing a frustrated growl, you lurch out of his grip before he can grasp harder and lean lower near his sack. <i>“Ohhh no, we are NOT doing this, you FUCKER!”</i> he all but roars. Acting quickly as he bellows and he starts to shift forward, you clutch his bloated amber balls and lift, and instantly find your quarry.");
	output("\n\nLubing two fingers with the pre coating his testes from his increasingly flaccid penis, you firmly jam them into the metal giant’s puckered star, just as you feel his clawed hand grab your head. The form above you almost jumping to his feet from the penetration, feeling as if he’ll crush your fingers from his unexplored tightness and his tension. You continue your penetration of his surprisingly silky interior once he stills, though he doesn’t release his grip of your head; wary, but not objecting. Struggling with the vice grip on your delving digits, you manage to insert both fingers to the third knuckle, wriggling around in search of that hidden lump.");
	output("\n\nYour fingers, in as far as they can go, just barely graze what has to be his prostate. This thought confirmed when you hear him moan in alien pleasure and his fat, jet-black cock jump wetly on his armored midriff. Emboldened, you force in as much of your two fingers as you can, and rapidly twitch, grind, and wriggle your fingers. The reaction is instantaneous. The light but constant fluttering against his prostate making his massive member alarmingly hard as he yelps from the sensitivity alone.");
	output("\n\nLooking up and seeing his cock jerk and throb urgently, you grasp it near the tip, and aim away from the titanic titan as you sit up and lean onto him for leverage, your fingers still fluttering wildly within his pleasant depths. As you hold his beastly cock like some sort of heavy weapon, you feel it pulse and bloat, then fire volley after volley of pent up monster cum. Most of this bombardment lands a few dozen feet away, though a few weak throbs leak down your fingers onto his shaft. Suddenly losing your grip on the slippery willy, the onyx cock swings back up to collide against your face with a wet <i>smack</i> that echoes through the area.");
	output("\n\nMomentarily stunned, you take the next few cock blasts to the face, drenching you in the behemoth’s musky seed before you manage to retreat out of the way. Returning your slippery grip onto his shaft, you milk the last large pulse onto his chest with a resounding <i>splort</i> that you can’t help but grin devilishly to.");
	output("\n\nSatisfied, you straighten yourself as you release the brute’s cock, and caress his prostate one last time as your fingers exit his clenching depths. As the big lizard’s black dick thumps onto his torso, he groans tiredly and lets loose one last massive blast of his seed, coating himself in the musky glaze.");
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	pc.addMischievous(1);
	//[Next] // Go to Handjob End
	clearMenu();
	addButton(0,"Next",chaurmineHJEndoFinale);
}

//Handjob End
public function chaurmineHJEndoFinale():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("With a sigh that quickly turns into a growl, the metallic brute abruptly takes a step back, a hand dispassionately but firmly keeping you on the ground as he towers above you. As soon as he turns to start walking off, his hand slips off of your cum slathered form, letting you stand with a growl of your own.");
	output("\n\nBlushing hard at being covered in so much of a stranger’s seed, you struggle for words as the large lizard starts stomping off. You barely notice the air around you immediately cooling until you feel a reinvigorating jolt from the fresh air, waking you from your cum glazed haze.");
	output("\n\n<i>“Sooo are we done here...?”</i> you say, still-hot cum continuing to virtually pour off your form.");
	output("\n\n<i>“Yeah,”</i> he grunts, not even facing you to answer.");
	output("\n\n<i>“Just going to shoot and scoot? Not even a thank you?”</i> you huff, ");
	if(pc.libido() >= 75) output("absently licking thick seed from your lips.");
	else output("thick seed oozing down your [pc.face].");

	output("\n\nHis heavy tail swings with growing irritation as his only response.");
	output("\n\n<i>“A </i>little<i> gratitude would be nice, asshole,”</i> you note with a shake of your head, <i>“Especially since you got off so hard...”</i>");
	output("\n\nThis time he stops and turns to you, <i>“Thank you, I don’t know what I would have done without you,”</i> he growls dryly. He pauses, eyeing your cum covered form bemusedly, <i>“You should clean up, you’re a mess.”</i> Before you can inhale for a response he snorts in mild amusement, rumbling, <i>“You know, you’re right, you look better that way,”</i> he finishes with a light sway of his heavy tail, as if cutting off any retort.");
	output("\n\nAs he disappears from view, you note that he was walking towards Novahome.");
	processTime(8);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Blowjob
//This scene should make the PC orally stuffed
public function blowjobChaurmineHelp():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Kneeling in close, you take in the titan’s penis; a beastly member of incredible girth and intimidating length, outright equine in size. You unconsciously lick your [pc.lips] as the brute’s heat and musk surround you, unable to help yourself as you press your [pc.face] into his bloated amber sack. You let loose a moan as your own body flushes and heats up from his surprisingly rich and pleasant musk, his soft cum orbs seeming to encourage you as your [pc.face] nuzzles against the silky reptilian skin. Your [pc.tongue] darts out, but quickly finds itself repeatedly returning following the lizard’s grunts of approval. Spurred onward, you wrap as much of your [pc.lips] around each orb in turn, thoroughly tongue bathing the delightfully warm and throbbing cum factories before leaving the smooth, spit shined skin with a wet <i>pop</i>.");
	output("\n\nMaking your way upward as his captivating eyes follow your movements, you exhale onto the sheath surrounding the base of his turgid onyx shaft. As the beast rumbles in appreciation, you absently cup the churning sack below encouragingly while focusing on his sheath. Running your [pc.tongue] within the sensitive, musky flesh, you revel in the feeling of his studded skin. With a flare of his nostrils he vents a gust of hot air onto your [pc.face] as he reaches down and roughly clutches onto your [pc.hair], your hands unconsciously jumping from his amber sack to his thickly armored thighs.");
	output("\n\nRecoiling from both the heat and the sudden grip, your [pc.face] is swiftly forced back by the brute so your [pc.eyes] are locked with his own azure stars. <i>“Eyes stay up here,”</i> he casually grumbles. You nod with what room he allows, which isn’t much, as he uses his grip on your [pc.hair] to press your lips against his ribbed onyx shaft before grinding up and down its length. When he thinks you get the idea, he lets go to let you continue at your own pace. You do so with your eyes locked together, ");
	if(pc.WQ() < 70) output("and though you struggle to focus while you stare into his gaze, you sloppily make your way up to his bulbous tip after giving his black dick a generous coating of saliva.");
	else output("and you masterfully lavish the brute’s thick length with your [pc.tongue] as you make your way up to his blunt tip with a juicy slurp, your gaze matching his in intensity.");

	output("\n\nWith your eyes still on his, you plant your lips just above his heavy tip, waiting for a signal to continue. When none comes, you huff with a little irritation and slowly force the creature’s blunt head past your [pc.lips], having to strain your jaw to fit his bestial girth. With each ribbed inch popping past your lips and into your waiting mouth, the titanic lizard’s studded crotch grows closer and closer, giving your flattened tongue a saturated taste of his beasthood that will last.");
	output("\n\nFeeling the massive tip throbbing and drenching your gullet in pre, you stop to take a few deep breaths, casting a quick peek down as you get your bearings. When you feel another blast of hot air swirl against your head and down your back, you snap your eyes back up to the metal behemoth’s as you realize your mistake.");
	output("\n\nVirtually clawing your hands against his thighs");
	if(pc.tailCount > 0)
	{
		output(" and flailing your [pc.tails] wildly");
	}
	output(", you barely start to remove his shaft in panic when his claws are gripping your [pc.hair] once more, forcefully shoving his heavy cock down your throat to leak pre directly into your stomach. Unfocused eyes tearing up, jaw straining as your lips are mashed against his sheath, and gag reflex completely subdued, you barely register the large brute’s huff of indignation.");

	output("\n\nYou bring a shaking hand up to feel his ribbed dick bulging out your throat, turning you into a tempest of mixed signals and sensations as your body jerks and thrusts in both panic and arousal. Feeling your [pc.crotch] throbbing, you move your other hand down for some iota of pleasure, only for his heavily armored tail to painfully smack your hand away, denying you. With the growing need for relief, and the lack thereof, as well as your desperation for air, you writhe with his fat onyx cock impaling your throat as it throbs more and more urgently. You groan in defeat, your arms going limp, as he uses his grip on your ");
	if(pc.hasHair()) output("[pc.hair] to twist your head ");
	else output("head to twist it ");
	output("back and forth against his sheath, something he seems to greatly enjoy as you hear him growl and rumble louder and louder. As your eyes stare vacantly at nothing, you absently hope that he’s close to cumming, consciousness slipping further and further.");

	output("\n\nJust as you’re on the edge of the abyss, you feel the titanic lizard’s grip tighten. Swiftly, but gently, pulling you up and off his thick penis, you register the ribbed shaft surging out of your throat and past your stretched [pc.lips] with an almost comical <i>pop</i>-<i>pop</i>-<i>pop</i> until his monstrous tip is all that’s left for your mouth to suckle on, then that too is pulled out with a wet squelch.");

	output("\n\nMouth gaping and limp, frothy mix of saliva and pre dripping from your [pc.lips], your airless mind spends an extended second or two in a daze, before remembering how to breathe, allowing you one messy breath as his dripping black shaft bloats from base to tip before you are roughly shoved back down to his sheath. With a muted gag and sputter, you feel pulse after pulse of thick cum blasting straight into your stomach, the behemoth above you rattling your bones with a great roar of release. Just as your body cries for more air, and you feel your belly becoming more and more distended, the brute’s fat onyx cock makes its last exodus from your gullet. He withdraws slowly, inch by slow inch, flooding every vacated space in your throat with cum until he pops out of your flooded maw. Seed pouring from your gaping mouth, you register him basting and drenching your entire torso with one last surge of beast seed. Blinded, stunned, and desperate for air, you instinctively try to inhale through cum clogged airways, causing you to cough, hack, and gag as what feels like gallons of seed pours from your gullet.");

	output("\n\nWith a wheezing gasp of breath, your throat now clear, you notice you are laying on your side, the creature’s grip no longer holding you. You stiffly force yourself into a sitting position, a sigh slipping from your raw throat as you feel hot seed drip down your entire upper body. Swiping off the gobs of cum covering your [pc.face], you open your eyes to see a duo of thick four-toed, heavily scaled bestial feet in front of you, just out of arm’s reach as the familiar metal lizard they belong to stands, leaning against a large piece of scrap. It would seem he was watching over you... Or at least <i>watching</i> you.");
	output("\n\nSeeing that you haven’t drowned in his cum, he stands straight and proceeds to walk off without a word. More than a little miffed and insulted at this treatment, you start to shout after him, resulting in only wheezing coughs. Thinking he knows what you were trying to say, he points in the direction he is headed, north, and grunts <i>“Novahome.”</i> Well, not what you were going to ask, but it seems he might be at Novahome at some point. You’ll be able to speak then, at least.");

	pc.loadInMouth(chars["CHAURMINE"]);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Titfuck
public function titfuckChaurmineToiletPaper():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Seeing how he eyed your [pc.fullChest] gives you an idea. Sensually cupping your [pc.chest] with both hands, you compress your tits together to amplify the cleavage. Seeing him struggle not to even peek at your chest mounds causes you to giggle, the ensuing boobquake making it all the harder on him.");
	output("\n\n<i>“Something the matter? I’d </i>love<i> to help, but you gotta speak up first!”</i> you offer with a devilish grin, casually swaying your ensnaring cleavage from side to side.");
	output("\n\nWith an irritated growl, he snaps his eyes back to yours and sweeps an arm in a dismissive gesture, <i>“You can start by putting those...”</i> he starts to rumble, but pauses as his hand unintentionally bats a luscious boob, <i>“...those meat sacks away. As soft as they are...”</i> His apprehension all but crumbles with clashing desires.");
	output("\n\nYou roll your eyes with an agitated sigh, <i>“I was trying to be coy, dumbass. You can either play with my tits, or yourself,”</i> you huff.");
	output("\n\nEyeing your chest pillows with reluctant desire, he seems to come to a rather quick decision, <i>“Alright, fine, let’s use your body bags,”</i> he growls with a frown, his plated visage all the more bestial. With terms laid out, and agreements made, he proceeds to grab your shoulders and, to your delighted surprise, thrust his metal snout directly into your cleavage.");
	output("\n\nHappy to let the creature lead in his amateur chest worship, you sigh as you feel an incredibly soft and wet tongue wash a breast before homing in on a ");
	if(pc.isLactating()) output("[pc.milkyNipple], though he either ignores, or doesn’t notice your [pc.milk]");
	else output("[pc.nipple]");
	output(". With a groan, you arch your back as his intense lapping and licking continues, wanting more and more of this behemoth’s oral action. Looking down, you see a black tongue that, looking quite long, also looks incredibly canine. Shivering, you moan from the growing sensitivity of your luscious mounds. He goes on and on, adamantly cleaning the entirety of your [pc.chestFull] with longer, more insistent passion, his soft muscle a breathtaking experience. You’re almost driven to climax as you briefly fantasize about this lizard’s oral organ bathing you elsewhere.");
	output("\n\nJust as you start to relax in his grip, the metal brute virtually drops you onto your back, your luscious breasts heaving dangerously as your breath is knocked out of you. Grimacing, you look up at him with a scowl, only to be interrupted by a yelp as the titanic titan falls to his knees just above you to straddle your chest with a heavy <i>thunk</i>. As you calm down from almost having hundreds and hundreds of pounds of reptile fall upon you, you glance up to him and see his grim face marked by a slightly amused grin. Upon seeing your own less than amused look, he abruptly grabs his still solid, ribbed cock and slaps it ");
	if(pc.isLactating()) output("with a wet smack ");
	output("between your tits, sending the great swells wobbling.");

	output("\n\nNot wanting to wait for the main event much longer, you encouragingly compress your melons together to envelop the monstrous black mast weighing heavily on your torso. With this throbbing, ribbed girth nestled in boobs, he leans forward and gingerly places his fists above your head for balance, virtually shrouding your sight with the thick plates on his torso. Seems he can’t, or won’t, meet your eyes. He then begins at a rather fast pace, though whether from the excitement of the apparently taboo act, or the effect of the pink slime on his scales, you don’t know. At the very least, your cleavage is already being lubed by his leaking pre, immediately giving every movement an incredibly juicy, sloppy sound.");

	output("\n\nYou moan as you feel his ribbed length slip and grind against your [pc.chest], and hear the lewd sounds of slippery friction as the big brute ruts against your chest. As he thrusts and pants, the heat from his body starts to become thicker, more oppressive. It also becomes harder to ignore the monstrous head of the creature’s member bumping and grinding against your lips and [pc.face], but as soon as you start to lick and suckle the insistent meat he stops with a growl, <i>“No, tits only. I wanna test these tanks out by themselves,”</i> he rumbles down to you, his voice vibrating pleasantly throughout your being. With an exasperated sigh you lay your head back onto the ground, though you shortly coo excitedly as he picks up the pace. As his protected thighs slap against the bottom portion of your breasts, and his soft, heavy amber sack virtually caresses your midriff, you find it hard not to writhe from the intense sensations as he uses your upper body as a cock sleeve.");

	output("\n\nAfter what feels like an eternity of being dragged along the ground by the beast’s rut, you feel his undulations grow more erratic as his pants and grunts are almost desperate, hot gusts of his breath billowing from above your head. His breaths and pants abruptly stop, and he thrusts through your deep cleavage once, twice, and on the third you see his shaft bloat and urethra dilate obscenely, launching load after load right below your [pc.face], directly on your chin. You groan in both ecstasy and alarm with each new coating of beast cum, your [pc.face] just as utterly drenched as your [pc.fullChest]. During this one creature bukkake you register a note of discomfort, but can’t pin it, so you shelve the thought until his ribbed onyx penis has belched its last messy load, dribbling what seed is left as it continues to clench and throb. Releasing your massive tits with a rather sloppy slurp as his shaft is freed, you manage to determine the discomfort as an intense heat, heat coming from the almost steaming body above you.");
	output("\n\nNot daring to touch him and not quite able to slide from under his titanic form, you can only watch as he sits up flaccidly, his head weakly tilting back as his jaws almost screech open from his heated scales grinding together. With a great sigh of relief, you feel the dangerous incandescence virtually vanish as, with a sound somewhere between a growl and a sigh, you both see and <i>feel</i> the heat violently vent, almost burst, from between his jaws.");
	output("\n\nShortly the shimmering heat all but disappears, seeming to mean he’s recovered, as he stands with a much less audible creak from his scales. Snorting a hot breath of what you think is gratitude down onto you, he proceeds to lumber northward. Talking over his shoulder as well as his thick scales let him, he rumbles, <i>“What happened here never leaves this place. No one knows what we did because it never happened. But uh... I suppose I could help you improve your... technique, if we meet again.”</i> He grunts dismissively, leaving you to continue gratefully breathe in cool and fresh air.");
	processTime(35);
	pc.applyCumSoaked();
	pc.changeLust(10);
	if(pc.isLactating()) pc.milked(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function guardDatScaleDino():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");

	//This scene should increase PC lust by +25
	if(pc.isNice()) output("With a raised brow, you try to make it clear that you have no ulterior motives, nor desire to get hands on, you just want to make sure he isn’t taken advantage of in this state");
	else if(pc.isMischievous()) output("With a cheeky smile, you say you’ll <i>gladly</i> do what you do best, your smile widening as the big brute scowls in ever growing irritation");
	else output("Crossing your arms over your [pc.chest] with a scoff, you can’t help but note that he isn’t in a favorable position right now to make demands. In fact, you’d rather see how he avoids getting any more fucked than he is right now. As a growl resounds threateningly low from his core, his muscles tense in immediate outrage");
	output(". <i>“Oh, is that all?”</i> he snarls, tail lashing at the ground. <i>“Well why don’t you-”</i> he is abruptly cut off by a <i>tink</i> <i>tink</i> <i>tink</i>, and you see three syringes, each filled with a viscous pinkish/reddish substance, fall harmlessly to the ground at the metal lizard’s feet. Seeming to forget you exist, the brute slowly turns in the direction the needles must have come from, his scales scraping together with the motion.");

	output("\n\nIn the direction he turns, you see a raskvel several yards away, cursing as she reloads the gun in her hand with more syringes. As she mumbles something about ‘the hard way’, she jabs a finger in your direction, <i>“You! I see you. Back off, kay? I got dibs,”</i> she orders as the metal brute takes thundering steps towards her, his lips curled in rage. She holds her ground at his approach, though looking at least a little nervous, <i>“Alright big guy, gonna fuck you so hard those fine scales of yours will fall right off...”</i> she mutters more to herself than anyone else. ");
	if(pc.isNice()) output("Though you said you wanted to help prevent this sort of situation, the raskvel already seems outmatched... And she DID say that she had dibs.");
	else output("Mildly amused, you relax a little as you watch and anticipate the outcome.");

	output("\n\nAs soon as the creature’s shadow looms over her she makes her move. Dashing between his legs, the raskvel dodges a heavy stomp, giving the brute’s scrotum a tender caress as she passes. For the briefest moment she hesitates, as if debating taking advantage of this tender spot, then swiftly aims and fires several chemical filled syringes into the too-slow creature’s taint. The brute gives a heavy shudder as, what must be aphrodisiac, pours into his body. He gnashes his teeth, his anger and arousal rising with his resurging erection, while the raskvel between his legs quickly makes a run for his tail; as to why, you have no clue. Guessing where she’s going, the metal lizard raises his armored tail just as the little raskvel grabs on before abruptly bringing the hefty limb down, accompanied by a surprised <i>“OH SHI-”</i> right as it hits the ground with a thundering clap. As the beast sweeps his tail out of the small dust cloud, a visible heat shimmers off of his form. <i>“Why does LITERALLY every other thing here want to FUCK ME!”</i> he roars, wicked teeth bared in a snarl. In his increasing frenzy, he fails to notice his rising arousal until he is panting heavily, his ribbed, thick cock at full mast and throbbing needily.");
	output("\n\nLooking back to where his armored tail had struck the ground, his hand spears forward with a speed born of desperation and, just as quickly, returns with a dazed raskvel in a one handed grip.");
	output("\n\nNonchalantly flipping the raskvel ass up and gripping her massive hips with both hands, the oversized lizard thrusts a black, remarkably canine tongue against the petite reptile’s puffy lips. The stimulation being enough to snap her out of her daze, she gasps at the view of the large brute’s turgid length below, and excitedly coos when the monster holding her continues his cunnilingous with rising urgency and pants his hot breath down her back, nostrils flaring as he takes in her scent. You hear ecstatic moans from the raskvel, growing in volume and rapidity as she is gripped even tighter by the cunt-ravager, his jaws opening wider and his tongue plunging farther down the much smaller lizard’s drenched slit, practically cramming her into his maw as his soft tongue laps and slurps <i>deep</i> into her canal.");
	output("\n\nSeeming to savor her flavor during his tongue’s exodus from the raskvel’s drenched honeypot, he abruptly flips her upright again, then unceremoniously impales her onto his shaft before she can give more than an alarmed yelp. Pulled to the base of the girthy beast cock, the comparatively tiny raskvel looks stretched to her limit. For a split second she can only lamely stare at the immense bulge in her abdomen before crying out as she writhes and cums around the thick pillar, the metal beast looming over her growling his pleasure.");
	output("\n\nDone with any further foreplay, and the raskvel’s noise, he grips her throat tightly in one hand and starts to thrust quite vigorously, his other hand holding the corresponding hip tightly as the loose leg twitches and flails about. The combination of the sensual sound of grinding and thrashing bodies, and the big lizard’s scales scraping and clattering together result in quite the exotic symphony, creating fantasies of rough, primal mating. Letting go of all but the basest thoughts; rutting and fucking until your time-old instincts are satisfied, every womb bloated and filled to capacity with potent seed, and every raw phallus drained of every drop of cum. You are snapped from your thoughts by a ragged gasp of breath, and see the raskvel being gripped by both hips as she continually cums over and over again from the hard fucking and previous asphyxiation. As the petite reptile’s hacking and sputtering calms, the beast holding her almost doubles his pace, virtually punching the raskvel’s tender womb with every wild thrust. You’d be worried about the little lizard being harmed, but between her hoarse screams of ecstasy, and her femcum dripping and splashing everywhere with each sloppy thrust, she’s obviously having a good time.");
	output("\n\nMaintaining his tight grip on her hips, the metal brute yanks his raskvel-turned-cocksleeve down to the hilt, keeping her there as he abruptly holds his breath. The raskvel’s breath catches in her raw throat, chest heaving and gasping for air as you see her middle rapidly inflate, the soft cum-bloated orbs of the brute, lurching and tensing, forcing out load after virile load. As this goes on, the metal beast’s body seems to ignite with heat, shimmering and distorting the air around him dangerously. Just as you’re starting to worry, and the creature’s cum has backwashed from the overinflated and overheated raskvel from at least half a dozen more potent blasts, his claws release the little lizard from his grasp.");
	output("\n\nSlipping off of his softening shaft, the raskvel manages to land on her side with a pained grunt, panting hard from the exertion and heat. Both are quite disoriented, though the metal brute leans his head back to the chagrin of his scales, unpleasant scrapes and whines resounding until he aims his face upward and, limply opening his armored reptilian visage, seems to release a dangerous eruption of heat from his maw. Watching with more than a little fascination and apprehension, you see him relax as the tempest of searing air and steam dies down, and then he’s breathing normally once again. Having calmed his lust and, you’re willing to guess, at least some of his temper, you patiently wait as he lets out a few more heavy breaths before he looks to you with a slight smirk.");
	output("\n\n<i>“Thanks for your protection, really helped there,”</i> he grunts in a much more calm, monotone voice. You can’t tell if his dry sarcasm is tinted with humor or bitterness. With a sniffle and a snort, the large lizard turns to leave, before offhandedly saying <i>“In fact, I could use you again someday,”</i> and summarily stomps away.");
	IncrementFlag("CHAURMINE_GUARDED");
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
//If abandoned 3 times, removes Chaurmine from the game.
public function leaveChaurmineToiletPaper():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("With an attitude like that, he can go fuck himself, and you nonchalantly continue on your way.");
	output("\n\n<i>“Yeahhh that’s what I thought...”</i> he bellows as you walk away, his voice bitter with frustration and... regret?");

	//firstAbandon:
	if(flags["ABANDONED_CHAURMINE"] == undefined)
	{
		output("\n\nIn any case, maybe you’ll see him elsewhere, and in a better mood.");
	}
	//secondAbandon:
	else if(flags["ABANDONED_CHAURMINE"] == 1)
	{
		output("\n\nWell, he was fine before. He should be again. Though if you abandon him again, you very well may not see him again.");
	}
	//thirdAbandon:
	else
	{
		output("\n\nThis is getting annoying, hopefully you’re done with this fucker. Though the skittering of sydians you hear in the junk around you - headed towards the tin lizard - pretty much guarantees it. They’ll probably drive him off the planet.");
	}
	IncrementFlag("ABANDONED_CHAURMINE");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//On the Novahome
//Chaurmine can be found somewhere on novahome (the bar of the mess ideally) after either guarding him or helping him in the wastes
//Add to the bar of The Mess on Novahome

//Room description
public function chaurmineBonus(button:Number):void
{
	if(chaurmineOnTarkus())
	{
		//Not approached:
		if(flags["MET_CHAURMINE"] == -1)
		{
			output("\n\nAcross the bar, tucked away in a booth, a distinctive metallic glint catches your eye. Taking in the silvery scales on display on a gargantuan reptile, you quickly recognize that jackass you met out on the wastes. His gaze casually wanders, no doubt absorbing the delightful sight of the scantily clad staff. Your eyes meet his for a moment, and he casually motions to the seat in front of him.");
			//[Reptile] // Go to Approach Chaurmine
			addButton(button,"Reptile",approachTarkusCivilizedChaurmine);
		}
		else
		{
			output("\n\nLooks like Chaurmine is still here. That lonely fucker. Will you give him some company?");
			//[Chaurmine] // Go to Approach Chaurmine
			addButton(button,"Chaurmine",approachTarkusCivilizedChaurmine);
		}
	}

}

//Approach Chaurmine
public function approachTarkusCivilizedChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//first approach:
	if(flags["MET_CHAURMINE"] == -1)
	{
		output("Deciding you want to hear what this thing has to say in a more calm and civil environment, you step up to his large booth. As you draw nearer, you notice the glasses of a few empty drinks; it seems he gets along with the bar’s staff, at least.");
		output("\n\nWhen you reach your destination, you take a moment to get a better look at him, one you really couldn’t get in the wastes; Even though he’s sitting and hunched over to better reach the table, you’d put his standing height at just under ten feet, giving him height to complement his bulk. His metallic silver scales cover him from head to foot, virtually obscuring him in natural armor. Though you can occasionally see a hint of his thick amber hide beneath the layered scales. Just as shielded as the rest of him, his reptilian face has a bestial snout with a thickly armored bottom jaw. Three dangerous metal horns jut forwards and up from his head, two starting above his thick brows, and one thrusting upwards from his nose. You realize you’re on the verge of staring when you hear his tail, curled from behind him and down along a leg, momentarily scrape against the floor restlessly. His blazing azure eyes regard you with a reserved patience though.");
		output("\n\nSliding into the booth, you’re careful to avoid his long and hefty tail as ");
		if(pc.isNaga()) output("you coil yourself upon the seat silently");
		else output("you gingerly sit down");
		output(". Figuring that it’d probably be best to follow this creature’s odd sense of etiquette, you wait for him to speak first. There’s a moment of silence as he looks you over thoroughly. Though if there’s any lust in his gaze, you don’t see it. You cough to get his attention, before the silence can get <i>too</i> awkward, and his eyes snap up to bore into yours once more.");
		output("\n\n<i>“The stranger from the wastes,”</i> he rumbles, matter-of-factly, <i>“Come to louden my day once more...Thanks...”</i> Though said dryly, you can’t help but feel that there’s a little genuine gratitude in his words. You nod in affirmation, prompting him to give a nod of his own. <i>“Great. Name’s Chaurmine, by the way,”</i> he says calmly, <i>“And I know how naming goes " + (pc.saurmorianScore() >= 4 ? "in your culture" : "with [pc.aRace] like you, or whatever you are") + ". So before you ask; my kind don’t have those second names the same way you do; for now I’m just Chaurmine.”</i> He folds his arms conclusively, and with a snort motions for you to proceed.");
		output("\n\nWaving off a skimpy waitress checking on your table, ");
		if(pc.isNice()) output("you give Chaurmine a warm smile, <i>“Well, Chaurmine, it’s nice to meet you. I’m [pc.name] Steele.”</i>");
		else if(pc.isMischievous()) output("you can’t help but smirk at his words, <i>“Awesome. Name’s Steele. [pc.name] Steele.”</i>");
		else output("you suppress a grin and calmly state, <i>“You can call me [pc.name]. Or Steele. Or [pc.name] Steele. Just don’t say Steele [pc.name].”</i> You chuckle as Chaurmine rolls his eyes.");
		output("\n\nChaurmine leans forward and puts his armored elbows on the table, casually watching you.");
		flags["MET_CHAURMINE"] = 1;
		showChaurmine();
		processTime(6);
		clearMenu();
		//[Talk]
		//[Leave]
		chaurmineMenu(2);
	}
	//Repeating:
	else
	{
		output("Reaching Chaurmine’s large booth, ");
		if(pc.isNice()) output("you pause next to his table and start to greet him only to be interrupted by a snort of amusement, <i>“Just sit down, ya cunt.”</i> Though crude, there’s a slight smirk that belies any malice");
		else output("you slide into the seat opposite of him. <i>“Hey,”</i> he growls, not betraying any emotions - except for his armored tail, which twitches as you sit.");
		processTime(1);

		//[Appearance]
		//[Talk]
		//[Sex]
		//[Leave]
		chaurmineMenu();
	}
}

public function chaurmineMenu(disabledButton:Number = -1):void
{
	if(chaurmineOnUveto()) return chaurmineUvetoMenu();
	
	clearMenu();
	if(disabledButton == 0) addDisabledButton(0,"Appearance","Appearance","You just did this.");
	else addButton(0,"Appearance",chaurmineAppearance,undefined,"Appearance","Take a gander at the buff saurmorian.");
	if(disabledButton == 1) addDisabledButton(1,"Talk","Talk","Maybe you should do something else for a moment.");
	else addButton(1,"Talk",talkToChaurmine,undefined,"Talk","Find out some more about Chaurmine");
	if(disabledButton == 2) addDisabledButton(2,"Sex","Sex","Maybe do something else for a bit.");
	else if(pc.lust() < 33) addDisabledButton(2,"Sex","Sex","You aren’t really in the mood for this.\n\n(Lust 33+ required.)");
	else if(chaurmineRelationship() < 10) addDisabledButton(2,"Sex","Sex","He doesn’t seem ready for sex yet. Maybe talk to him, get to know him. See if he has any hobbies.");
	else addButton(2,"Sex",sexWithChaurmine,undefined,"Sex","Take the big brute for a ride.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function chaurmineAppearance():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("Chaurmine is a saurmorian. Standing at approximately 8 feet, 6 inches tall by ancient imperial measurements and 2.6 meters in the more accepted metric system. He wears little, remaining topless, but wears tough tactical groin armor fitted for saurmorian use.");
	output("\n\nHe has a thick and boxy reptilian face, covered in a tough, amber hide. Massive, incredibly heavy scales - a shiny metallic-silver - encase him from head to toe, virtually obscuring the underlying amber skin. His primal visage an example of rugged masculinity, he seems all the more bestial with his heavy scales guarding a massive jaw along his snout. His two eyes are solid pools of azure, each parted by a vertical slit for a pupil, his fiery gaze always seeming to sear through whatever he is focusing on. While hairless, his scales run extra thick along his jaw, over his head, neck and shoulders to cascade down his back and along his tail; as if mocking a more mammalian mane with metal scales. You assume he has ears, though you can’t see them. He has a black tongue, at first appearing canine, but a closer look reveals it to be wider and longer, as well as looking quite a bit softer. Three dangerous metal horns jut from his head; the two bigger horns starting at the back of his skull, the thick bases curving up along his head before protruding up just above his brows. The third one thrusting upwards from his nose.");
	output("\n\nHe has a humanoid upper body with the usual torso, arms, hands, and fingers. While human in function and structure, his fingers are covered in scales like the rest of him, which continue to grow from his fingers in place of nails or claws. A thick, reptilian tail sways behind him towards the ground, weighed down by incredibly heavy scales sheathing its length. His muscular thighs hold up his stout, strapping build, accentuated by a brawny ass. Two bulky plantigrade legs extend below his waist, ending in wide and flat saurmorian feet, with four toes tipped with scale-claws.");
	output("\n\nHe has beefy pecs, and a rock solid six pack. Both are shielded and reinforced by his thick scales. His form shows no signs of nipples.");
	output("\n\nBetween his legs sits an equine-looking sheath. Though being wrapped in fine scales gives it a densely studded appearance and texture. When aroused, from this sheath comes his monstrous saurmorian cock; a ribbed, midnight black shaft that’s 14 inches long and 3.5 inches thick and ending in a bulging, blunted head. A churning, cum-packed sack with two apple-sized testes swings heavily below his primal shaft, the same deep amber shade as the rest of his skin, but much softer and silkier. You estimate each testicle to be about 13 inches around and 4 inches across.");
	output("\n\nHe has one anus, placed between his hard cheeks where it belongs.");

	chaurmineMenu(0);
}

//Talk
//only asking about him is available at first
public function talkToChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("<i>“I wouldn’t mind having a chat, if you’re ok with that,”</i> you casually say.");
	output("\n\n<i>“Sure,”</i> he grunts with a shrug.");
	processTime(1);
	clearMenu();

	//[About him] Get to know the big guy.
	addButton(0,"About Him",aboutChaurmineTheCunt,undefined,"About Him","Get to know the big guy.");
	//[His home] Ask about where he came from.
	if(flags["CHAURMINE_HIM_TALKED"] != undefined) addButton(1,"His Home",talkToChaurmineAboutHome,undefined,"His Home","Ask about where he came from.");
	else addDisabledButton(1,"His Home","His Home","You don’t know him well enough for this.");
	//[Family] What was his family like?
	if(chaurmineRelationship() >= 25) addButton(2,"Family",talkAboutChaurminesFamily,undefined,"Family","What was his family like?");
	else addDisabledButton(2,"Family","Family","Your relationship with him isn’t well developed enough for this.");
	//[Back]
	addButton(14,"Back",backToChaurmineMain,1);
}

//About Him
// +5% to relationship
public function aboutChaurmineTheCunt():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("You want to know more about him.");
	output("\n\n<i>“Fine,”</i> he growls.");
	output("\n\nYou raise a brow. Is he really going to be as brusque as he was out in the wastes? ");
	if(pc.isAss() || pc.isBro()) output("Well if he doesn’t want to socialize, the fuck is he doing in a bar?");
	else if(pc.isMischievous()) output("Well two can play at this game, you figure, and return his stony expression with one of your own.");
	else output("You lean back with a sigh. Though you’re curious, you have better things to do than have your inquiries answered grudgingly.");

	output("\n\n<i>“You’re not familiar with saurmorians, are you?”</i> As you indicate that you’re apparently not, he nods with a grunt, <i>“Thought so. Saurmorians are, what do ya call it... Cold blooded? Well, kinda cold blooded. But we’re made for intense heat. On other worlds, our scales tighten to trap in warmth. This ends up a problem for us guys, since we’re more dense than the women,”</i> the brute growls, though you’re not sure if that last bit was a joke. <i>“Something about the men being underground more, where the more volcanic temps were, and needing less ventilation and more prevention of hot air,”</i> he rumbles as his azure peepers bore into your own eyes.");

	output("\n\nGlad that he’s actually talking openly, you note that he said saurmorians weren’t completely cold blooded. What did he mean?");
	output("\n\n<i>“Yeah, we kinda generate body heat like you warm bloods, but can’t cool off like one. That’s the problem with being on an alien world, I guess; we travel and fight and shit like we would back in the day, except our scales don’t open to help with releasing the heat. It’s why you’ll see most males as very apathetic, or callous, when out in the galaxy. Gotta keep our heads cool so we don’t get too hot headed,”</i> he finishes casually, again leaving you wondering if that last bit was intentional.");
	output("\n\nWell, you weren’t really expecting a xenobiology lesson. Anyways, that sounds like it could get difficult. Why would he or any other saurmorians be offworld then?");
	output("\n\n<i>“Other than being contracted off world for whatever reason, I can’t really say. I’m out here playing space cowboy because I decided to do what I </i>wanted<i> to do. Which, it turns out, is the same thing every other spacer sets off to do,”</i> Chaurmine grunts, idly picking at the table with a claw.");
	output("\n\nYou nod sympathetically. Not much different from what you’re doing, you figure. Though you have something more specific you’re looking for.");
	output("\n\nThis seems to pique a sliver of his interest, <i>“And what is that, then?”</i> You proceed to talk about your dad, and the quest he set you on in order to inherit the seat of CEO of Steele Tech. Chaurmine snorts in mild mirth, perhaps the first real indication of emotion since you sat down. <i>“Must have been quite a guy,”</i> he says, and you habitually nod in response.");
	output("\n\nTurning the topic back to him, you ask if he has a ship. Running off into space would be hard enough without one, let alone doing so as a huge lizard covered in metal.");
	output("\n\nChaurmine seems to spend a moment thinking over your inquiry, then lets out a sigh. <i>“Back then, if I was in a position where I had a ship, I’d either be well off enough to the point where I wouldn’t want to leave, or be forced to stay by military law,”</i> he growls, his tone stained with a touch of scorn, <i>“Nah, I started my fun in space hitchhiking. Though I did manage to get my own ship a few years ago...”</i>");
	output("\n\nFiguring you’ll humor him, and a little curious yourself, you ask him about his hard earned space vessel. It’s something he obviously takes some measure of pride in.");
	output("\n\n<i>“Damn right,”</i> he rumbles, <i>“Going from dirt-broke to owning a heavy Saurmorian Bulwark Command corvette is a </i>very<i> good feeling.”</i> He lets out a sigh as he leans back in his seat, though it almost sounds more like a growl to you. <i>“And I mean heavy by saurmorian standards. Yeah, it’s slow and isn’t the easiest to handle, but it’s easily the most durable ship in its class,”</i> he explains.");
	output("\n\nSounding like a vessel from the saurmorians’ military, you imagine this would have been outrageously expensive, let alone how it could be <i>legal</i>. How many years has he been wandering the galaxy?");
	output("\n\nThe brute growls and shakes his bulky head with a scrape of his scales, <i>“I think you, of all people, know the kind of money that can end up in your pocket in the more rough edges of society. Perfectly legal, too. The SBC decommissions aging ships, after stripping off their weapons of course, and eventually sells them to the public. Cash being worth more than scrap metal to my kind, you see.”</i>");
	output("\n\nYou nod, noticing he didn’t seem to care to count the years he’s been out here.");
	output("\n\n<i>“What about you,”</i> he growls, <i>“I doubt someone of your worth started a quest like this without a ride.”</i>");
	output("\n\nYou ");
	if(pc.isAss() || pc.isBro()) output("grin");
	else output("laugh nervously");
	output(" as you picture your old, inherited ship next to what his must be like. ");
	if(pc.isBro() || pc.isAss()) output("<i>“Well, it’s not a corvette, but my old man left me his clunky Casstech Z14. It’s in good shape for its age, and I’m proud to be its captain,”</i> you say with confidence.");
	else output("<i>“Well, uh, it was my dad’s before giving it to me. Many of his adventures in the old thing... I guess he wanted me to make my own with it too,”</i> you finish with a shrug.");
	output("\n\nChaurmine nods and leans forward. <i>“Must be some ship, huh?”</i> he rumbles.");

	processTime(15);
	if(flags["CHAURMINE_HIM_TALKED"] == undefined)
	{
		flags["CHAURMINE_HIM_TALKED"] = 1;
		chaurmineRelationship(5);
	}
	clearMenu();
	//[Tarkus] What brought him to Tarkus?
	addButton(0,"Tarkus",talkToChaurmineAboutTarkus,undefined,"Tarkus","What brought him to Tarkus?");
	//[Help] Maybe you could assist one another.
	addButton(1,"Help",talkToChaurmineAboutHelping,undefined,"Help","Maybe you could assist one another.");
	//[Back]
	addButton(14,"Back",backToChaurmineMain);
}

//Tarkus
public function talkToChaurmineAboutTarkus():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("So why is he on Tarkus specifically? Hardly seems like a place that would have anything of worth to him.");
	output("\n\n<i>“Not here for the locals, either,”</i> he grunts, <i>“I was hoping to find some outdated weapons that may have been thrown out. Every once in a rare while, old tech can still be useful. Though I haven’t found jack shit yet, and now I regret coming to this heap of junk. The air irritates my scales...”</i> He shivers, making his scales clank and clatter against each other.");
	output("\n\nThat brings up an interesting question: how have his scales not corroded? Not just from the environment, but the natives too.");
	output("\n\nChaurmine responds with a shrug as he growls, <i>“Hmph, fuck if I know. What I </i>do<i> know is that any of those bugs or fat-eared skinks that come near me are getting a fistful of these scales they covet so much!”</i> He curls an armored hand into a tight fist, his silvery scales reflecting the surrounding area like polished platemail. <i>“No, seriously, tell me if you see any bugs.”</i>");
	processTime(5);
	clearMenu();
	addButton(0,"Next",backToChaurmineMain);
}

//Help
public function talkToChaurmineAboutHelping():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("Considering your connections, and his apparent success, you bring up the possibility of the two of you assisting each other. You’d likely be an effective duo.");
	output("\n\nThis causes the tin lizard to shake his head, then rumble, <i>“Let me stop you there [pc.name]. I’m not gonna do the whole lone wolf spiel, but I do work alone. Besides, I’m pretty sure that would be a one sided deal.”</i>");
	output("\n\nWell, fuck.");
	//[Back]
	processTime(2);
	clearMenu();
	addButton(0,"Next",backToChaurmineMain);
}

//Talk about home
//Unlocks after talking about him - flags["CHAURMINE_HIM_TALKED"]
// +5% to relationship
public function talkToChaurmineAboutHome():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("You ask Chaurmine if he could, perhaps, tell you more about his species’ home planet. Molis, you believe it was called. You wonder what kind of world could create something like a saurmorian naturally.");
	output("\n\n<i>“Yeah, sure,”</i> he says with a slow nod, adding, <i>“Not much to say about it other than ‘it’s a massive rock’, really. Hell, your UGC dubbed it Molis. A massive, hot rock covered in volcanoes.”</i>");
	output("\n\nWell, you were hoping to get more details than that, ");
	if(pc.originalRace == "human") output("but it sounds similar to Venus.");
	else output("but it sounds kinda like a planet from terran space; Venus, to be exact.");

	output("\n\nChaurmine pauses and reaches for a big, outdated codex. After the better half of a minute, he snorts and turns his attention to you again. <i>“I guess, yeah. Though Molis is many times bigger...And not quite as hot or toxic on its surface...Otherwise, I guess I can see the resemblance,”</i> he says, putting his codex away before continuing, <i>“Not sure if your ‘Venus’ has any water or life on it, but Molis has rare bodies of water on it. The scarcity of water on the surface wasn’t a major concern in the past, what with moisture also being underground, but ever since the UGC found us, and our populations grew, water has become the biggest import of saurmorians.”</i>");
	output("\n\nNodding thoughtfully, you note that importing water must have put much less strain on the natural reservoirs.");
	output("\n\nThe tin brute gives an amused grunt, <i>“Of course, granted this was only a millennium or so ago,”</i> he says dryly. <i>“The planet </i>is<i> a surface of jagged black stone, just larger lakes and stuff.”</i>");
	output("\n\nAgriculture must be near impossible, you imagine. Stone surfaces are <i>usually</i> not a good source of nourishment for produce.");
	output("\n\nChaurmine stares blankly at you for a moment, <i>“Pro-doos?”</i> He blinks as understanding hits, <i>“Oh, you mean plants and shit, right? Never heard of a saurmorian family ever growing anything. Most-... well, everything on our world relies on meat and minerals.”</i> He taps a metallic scale on his nose for emphasis. <i>“That includes the few plantlife on Molis. I doubt any saurmorian has ever really thought about consuming those weeds,”</i> he grumbles.");
	output("\n\nYou stroke your chin thoughtfully. You think you have a better idea of what Molis is like.");
	processTime(5);
	if(flags["CHAURMINE_HOME_TALKED"] == undefined)
	{
		flags["CHAURMINE_HOME_TALKED"] = 1;
		chaurmineRelationship(5);
	}
	clearMenu();

	//[Exports] What kind of things do saurmorians export?
	addButton(0,"Exports",talkToChaurmineAboutExports,undefined,"Exports","What kind of things do saurmorians export?");
	//[Growing Up] He told you about Molis, but what about where he grew up?
	addButton(1,"Growing Up",chaurmineTalkAboutGrowingUp,undefined,"Growing Up","He told you about Molis, but what about where he grew up?");
	//[Back]
	addButton(14,"Back",backToChaurmineMain);
}

//Exports
public function talkToChaurmineAboutExports():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("You mention that if they import resources, they have to export as well.");
	output("\n\nChaurmine nods, <i>“Yeah, of course. I don’t know </i>everything<i> that’s exported, but obviously there’s plenty of meat, and metals. Molis still has minerals in its veins.”</i>");
	output("\n\nYou figured, with what he said the planet was like. Though you’re surprised they export their metal, given their scales. Do they take more potent supplements?");
	output("\n\n<i>“Mhmm. Well, we used to. Most of what we need these days is found in food. Well... </i>Our<i> food,”</i> the large lizard rumbles, absently scratching his jaw. Before you can comment, he grunts, <i>“Though most saurmorians still keep emergency pills of minerals on hand. Just in case, you know.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",backToChaurmineMain);
}

//Growing Up
public function chaurmineTalkAboutGrowingUp():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("When you ask about the actual place Chaurmine grew up, and what it was like, his response is a detached sigh.");
	output("\n\n<i>“Yeah... Okay,”</i> he grumbles. Seeing the look on your face, the brute gestures dismissively, <i>“Nah, not a sob story really. Just a boring, common one. Grew up in one of the slums outside the capital, Aegidis. The streets were narrow and packed, but most buildings were open and airy on the inside. Traditional saurmorian architecture, you see. Food and comfort usually weren’t a problem in the slums... usually.”</i>");
	output("\n\nSo he lived a simple, but comfortable life, you note as you nod for him to continue.");
	output("\n\nChaurmine actually snorts in minor amusement, <i>“I guess... Though there were some less than pleasant moments. A common thing to do for fun, and money, in the otherwise quiet alleys was to hold black markets of sorts and sell off the local stray dogs as exotic pets. Even forming fights for those interested in attack or guard dogs, to show off the merchandise,”</i> he spits out in distaste.");
	output("\n\nGiven his deepening frown, and his tone, you can assume how he feels about these <i>activities</i>. You are curious though; what do saurmorian dogs look like?");
	output("\n\nChaurmine looks confused for a moment, but recovers, <i>“Oh, right. You probably haven’t actually seen one. They’re armored, like us,”</i> he points to his scales. <i>“They walk on four pawed feet, and for size they uh,”</i> he looks around the bar, and back out to the cafeteria of the Mess, before shrugging and looking back to you, <i>“Uhh they’re roughly two raskvel tall, maybe one and a half wide, and three raskvel long. When full grown, that is. Offworlders tend to call them things like ‘metal mutts’ and ‘plate pups’, and probably others these days I haven’t heard.”</i>");
	output("\n\nYou’ll have to look into one of these ‘dogs’ someday, you note to yourself. Other than the alley markets, it sounds like his life tended to be more quiet, if not boring.");
	output("\n\nThe metal lizard makes to speak, but pauses, then hesitantly nods, <i>“Yeah, pretty much...Though that was mostly during my younger years. As I grew older I took as many heavy labor jobs as I could.”</i>");
	output("\n\nMakes sense, even menial labor would give him something to do back then. Though how could he start penniless as a spacer if he had so many jobs?");
	output("\n\nChaurmine actually shifts uncomfortably, almost looking a little flustered, <i>“Well, many young males reaching maturity took whatever work they could. Work that was often rewarded with, uh... grateful affection by the desperate females that hired them. Given our society or whatever, that’s almost always who had jobs available.”</i>");
	if(pc.isAss() || pc.isBro()) output("\n\nWell fuck, almost sounds like a phallus’ paradise. Though the lack of actual monetary pay would need to change... How could he leave such an opportunity?");
	else if(pc.isMischievous()) output("You stifle a laugh, picturing all the young men lining up for ‘work’. How you haven’t seen this porn-turned-reality on the extranet, you don’t know. Though it’s no wonder he took as many jobs as he could, is it?");
	else output("You nod with a slight flush. It would seem a topic he’s not entirely proud of. At the time though, it must have been worth it at least, right?");

	if(pc.isNice()) output("\n\n<i>“No, it wasn’t,”</i> Chaurmine scowls, the air that surrounds you and the booth heating up. <i>“Ever since I was young, it was made clear what I was. Even the pleasures those barren females showed to a naive, young Chaurmine were just reminders of what was expected of me");
	else output("\n\nChaurmine’s lips pull back in a snarl, baring his teeth, and you feel the air around you heating up. <i>“Fuck off, [pc.name]. Being seen as a dildo that also fixes shit for you gets </i>REALLY<i> old, really fast");
	output(",”</i> the lizard barks.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",backToChaurmineMain);
}

//Talk about family
//Unlocked permanently after reaching 25% relationship.
public function talkAboutChaurminesFamily():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	clearMenu();
	//first time:
	if(flags["CHAURMINE_FAMIRY_TALKED"] == undefined)
	{
		output("Knowing that you risk setting off his temper, you ask about his family. He’s barely said even a word about them.");
		output("\n\nChaurmine’s nostrils flare, but the rest of his primal visage remains passive, <i>“Yeah, how ‘bout that.”</i>");
		output("\n\nYou comment that he said his past really wasn’t a ‘sob story’, so you imagine-");
		output("\n\n<i>“Tell me, [pc.name],”</i> he growls low, and you feel his voice as much as hear it, <i>“Are you aware what it’s like having your future, your </i>purpose<i>, chosen for you when you’ve just hatched? As if your life were for someone else...”</i>");
		if(pc.isNice() || pc.isBro()) output("\n\nYou nod solemnly, mentioning how familiar you <i>are</i> to being born in such a way.");
		else output("You chuckle, shaking your head as you remark that he has no idea.");

		output("\n\nHis lips pull back into a snarl, and he opens his maw, but pauses a moment before calming himself. His irritation deflated into a somber demeanor, he looks at you with sympathetic eyes, <i>“Yeah... I suppose you’re right.”</i>");
		output("\n\nNodding, you ask him to explain what he meant, how his path was set for him.");
		output("\n\nThough he remains still, his bulky tail shifts in its position under the table irritably. <i>“I hatched with six siblings; a clutch of seven, unusually small for a woman of my kind to lay. On top of that, my matron- err, mother, seemed to lose all fertility; she never had a clutch after mine,”</i> he grunts dejectedly, then lets out a small snort, <i>“Heh, a dark joke while I was around was that I stole my matron’s potency. I was born with the signs of virility and strong blood, you see.”</i> Upon your confusion, he points first to his amber hide, hidden under his metal scales, and then his eyes; a blazing and fiery azure.");

		//read codex:
		if(CodexManager.entryViewed("Saurmorians"))
		{
			output("\n\nYou remember reading something similar from the saurmorian codex entry. Virile male offspring usually being groomed as they are raised by their families to be offered to more well off and politically powerful females. As a result, virile males tend to be treated as little more than prizes to be shuffled around, and seen as meal tickets to the families in the lower class. Little wonder that Chaurmine looks back to his past bitterly; he’d find that kind of life unfulfilling, no doubt.");
			output("\n\nChaurmine smirks, <i>“Looks like someone did their homework. While a comfortable life, enviable to many, I personally want to be more than just another brightly colored cum pump...”</i>");
		}
		//not read codex:
		else
		{
			output("\n\nConfused, you question what this has to do with his predetermined future.");
			output("\n\nThis earns an amused grunt from the lizard, <i>“Look, saurmorians almost always have their most fertile females in charge of their families and societies. The much higher class matrons, usually those at the embassy in Aegidis, tend to favor virile males. Whether out of some kink or something, I don’t know. But they pick from even the lowest family; as long as the seed is potent, the male and his family are taken in and cared for by his new matron.”</i>");
			output("\n\nYou nod thoughtfully, piecing it together.");
			output("\n\n<i>“So if I’m the last male from my lower class matron, and a virile one at that, what do you think they’re going to use me as?”</i> he questions somewhat bitterly.");
			output("\n\nWell when he puts it like that... Though you still question what would be so bad about that kind of life.");
			output("\n\nChaurmine only shakes his head, <i>“Some prefer not being an object...”</i>");
		}
		output("\n\nTaking it all in, you inquire about his actual family once more. He said he had six siblings. You’re curious about them, as well as his mother. Or ‘matron’, as he called her.");
		output("\n\nChaurmine sighs tiredly and shakes his head, <i>“I’ve been an open book for you, [pc.name]. This time I’m gonna stay closed...”</i>");
		processTime(10);
		flags["CHAURMINE_FAMIRY_TALKED"] = 1;
		//[Push]
		addButton(0,"Push",chaurmineFamilyPush,undefined,"Push","Push for more info. You’ve got to know more! (He might not like it though...)");
		//[Back]
		addButton(14,"Back",backToChaurmineMain);
	}
	//repeating:
	else
	{
		output("You cautiously inquire about his family yet again.");
		output("\n\nThis is met with a dismissive snort.");

		//[Push]
		addButton(0,"Push",chaurmineFamilyPush,undefined,"Push","Push for more info. You’ve got to know more! (He might not like it though...)");
		//[Back]
		addButton(14,"Back",backToChaurmineMain);
	}
}

public function chaurmineFamilyPush():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");

	output("Push the subject even though he resists");
	output("\n\nYou mention how open he’s been so far, feeling put off by having the ‘book’ close shut in front of you.");
	output("\n\nThis only earns you a hard frown. His nostrils puff out a gust of hot breath across the table as he folds his heavy arms over his chest dismissively.");
	if(flags["CHAURMINE_FAMIRY_TALKED"] == 2) chaurmineRelationship(-5);
	else flags["CHAURMINE_FAMIRY_TALKED"] = 2;
	processTime(2);
	clearMenu();
	addButton(0,"Next",backToChaurmineMain,1);
}

public function backToChaurmineMain(disabledButton:Number = 0):void
{
	clearOutput();
	showChaurmine();
	author("Fenoxo McHorseween");
	output("Will you do something else with the impassive lizard?");
	chaurmineMenu(disabledButton);
}

//Sex
//Unlocked after relationship reaches 10%
public function sexWithChaurmine():void
{
	clearOutput();
	showChaurmine();
	//first time:
	if(flags["SEXED_CHAURMINE"] == undefined)
	{
		output("Feeling the hot air from Chaurmine’s lingering irritation and frustration, you’re reminded of encountering him out in the wastes; he cooled off when calming down, which swiftly happened after an orgasm.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nYou delicately bring up his rising body heat, wondering how dangerous being in such a state for long can be. You imagine that could get unhealthy if he doesn’t <i>release</i> the stress heating him up.");
			output("\n\nChaurmine raises a brow, glancing down at an empty, sweating glass; the ice having melted a while ago and now sits as a shot of water, tinted with traces of the drink it held. <i>“I’m fine... Out in the wastes there, that was the hottest I’ve been, I think. And that was with the pink slime those bugs smeared on me; must have been some aphrodisiac or something,”</i> he states as he looks back to you, an odd look on his armored visage, <i>“So right now there’s nothing to worry about. Are you suggesting that we...?”</i>");
			output("\n\nYou nod and, with a nonchalant shrug, add how distraught he seemed out in the wastes. You’d rather not seem him in such a state again, if you can help it.");
			output("\n\nChaurmine leans back in his seat, his features softening, before breaking into a lecherous grin. <i>“Well, uh, thanks for the concern. Though a better place to cool off after heating up would be my ship,”</i> he growls, trying to sound seductive.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\nWith an impish smile, you ask Chaurmine if he’s feeling alright, mentioning that he looks a little hot. More than usual, that is.");
			output("\n\nHe remains bitter for a moment, until your words hit home. The brute responds with a grin of his own etched on his armored face, <i>“Nah, I’m fine. The heat’s not getting to </i>you<i>, is it?”</i> His heavy tail twitches with a thump, betraying his excitement.");
			output("\n\n");
			if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)) output("Nonchalantly, you coil your tail around his, though the brute’s is powerless against your more agile appendage. Playfully wrangling his tail with yours, you reply that you <i>are</i> feeling a little feverish.");
			else output("You playfully lay a [pc.foot] on the heavy appendage, pinning it to the floor. As he twitches his thick tail, mirth written on his face, you reply that you <i>are</i> feeling a little feverish.");
			output("\n\n<i>“I feel ya,”</i> he rumbles, flexing his tail for emphasis, <i>“This bar’s a stuffy place, but I dunno what else there is on this planet.”</i>");
			output("\n\nWell, he has a ship, doesn’t he?");
		}
		//Brute/Hard:
		else
		{
			output("\n\nReaching over the table, you grab one of Chaurmine’s horns in a tight grip, giving the surprisingly pliant titan an appraising look as you turn him this way and that.");
			output("\n\n<i>“The fuck are you doing?”</i> he asks, brushing your hand off of him.");
			output("\n\nYou shrug, remarking that you were just wanting to know his best angle before you fuck. You look him in the eyes as you say this.");
			output("\n\nThis earns a small chuckle from the brute. <i>“Right to the point, I like that,”</i> he states in approval.");
		}
		output("\n\nChaurmine moves out of the booth, stretching as he and his empty seat groan in relief, and motions towards the exit, <i>“C’mon, we have better places to be.”</i>");

		if(pc.isNaga()) output("\n\nYou slither out from your seat in the booth, stiffly uncoiling yourself before following Chaurmine out of the bar");
		else output("\n\nYou do much the same, stiffly stretching once you’re standing out of the booth. Once that’s done, you follow Chaurmine out of the bar");
		output(". After several long minutes walking along the landing bay, still quite far from your own ship, you note that you’re passing by larger and larger vessels.");
		output("\n\n<i>“You’ve never seen a saurmorian ship before, right?”</i> he grunts, snapping your attention back to him, <i>“Well if not, let me warn you, our spacecrafts are known for two things; they’re durable as fuck, and they’re big.”</i> He punctuates this with a jerk of his snout towards the ship you’re now standing before.");
		output("\n\nWell, it <i>is</i> big. With its thick, blocky hull girding its triangular shape, you wonder how the mammoth thing can even fly, let alone be piloted by a single person. Though faded and scratched, you can still clearly make out its matte black finish trimmed with chrome. Two massive cannons hang from the bottom of the ship near the middle. At the prow of the space vessel, you see the words ‘Vigilantus Gemma’ in the same matte black as the trim, though without the same wear and tear; it looks more recent.");
		output("\n\nChaurmine leads you up the swiftly lowered ramp up and into his ship, giving you your first look at what he must call home; in contrast to its blocky hull, the ship’s interior is made of round, concave walls, giving it a more airy feel. Though quite spartan, you’re sure you see a large workshop at the bottom of a flight of stairs, many weapons and other tech strewn about in pieces.");
		output("\n\nA sudden " + pc.mf("punch to your shoulder forces a grunt out of you","solid smack on your [pc.ass] forces a yelp from your lips") + ", and you turn to see that armored, reptilian visage grinning ");
		if(pc.tallness < 96) output("down ");
		output("at you mischievously. <i>“Yeah, tour’s over. Bed’s this way,”</i> he growls, leading you to a surprisingly cozy room, given the airy feel the rest of the ship gives. A glance around the place shows rather average furnishings, aside from what must be his bed; looking more like a soft beanbag with a heavy frame. Seeing your look, Chaurmine gives a shrug before explaining, <i>“My kind essentially sleep in beds of sand; comfortable for the scales. But I’ve found that most in the galaxy </i>don’t<i>, so I had to get a covering that, uh, my scales wouldn’t tear apart.”</i>");
		output("\n\nStanding next to the sand-bed, Chaurmine removes the few pieces of armor he has, letting them hit the floor with a hard thump. Since his crotch was basically the only thing covered, that’s where your eyes are drawn to, now that he’s fully bare; his large balls hang low, the thick but supple reptilian hide a rich amber, and his monstrous cock droops out if its sheath, half hard. The ribbed, onyx-black shaft pulses and grows in the fresh air, its blunt tip bobbing. The tin lizard crosses his arms over his muscular chest, heavy tail swaying excitedly behind him, <i>“");
		if(silly) output("Wah! What are we gonna do on the bed?”</i>");
		else output("So [pc.name], what do you wanna do?”</i>");
		processTime(20);
		pc.changeLust(5);
	}
	//Repeating:
	else
	{
		output("You bring up going back to Chaurmine’ ship, which earns you a grin and a nod.");
		output("\n\n<i>“Alright, calm down [pc.name]. We’ll bang, ok?”</i>");
		output("\n\nOnce again, Chaurmine moves out of the booth, stretching as he and his empty seat groan in relief, and motions towards the exit.");
		output("\n\nBefore long, you see the familiar words ‘Vigilantus Gemma’ on a ship with a worn matte black finish. Chaurmine motions to the lowered ramp, and leads you into his ship. Once in his airy but cozy room, Chaurmine removes the few pieces of armor he has, letting them hit the floor with a hard thump. Since his crotch was basically the only thing covered, that’s where your eyes are drawn to, now that he’s fully bare; his large balls hang low, the thick but supple reptilian hide a rich amber, and his monstrous cock droops out if its sheath, half hard. The ribbed, onyx-black shaft pulses and grows in the fresh air, its blunt tip bobbing. The tin lizard crosses his arms over his muscular chest, heavy tail swaying excitedly behind him, <i>“So [pc.name], what do you wanna do this time?”</i>");
		processTime(15);
		pc.changeLust(3);
	}
	//[Intimate Catch] Have him put that tool to use, without being <i>too</i> rough. // No taurs // Go to Intimate Catch
	//[Taur Oral You got it, why not fuck it? // Requires centaur-like body // Go to Taur Oral
	//[Handjob] You <i>still</i> want to feel that bulging, ribbed shaft in your hands. // Go to Ship Handjob
	//[Blowjob] His fat onyx shaft still looks <i>really</i> juicy. // Go to Ship Blowjob
	//[Titfuck] Maybe he could use some more convincing... // Requires breast size 11+ // Go to Ship Titfuck
	chaurmineSexMenu();
}

public function chaurmineSexMenu():void
{
	clearMenu();
	addButton(0,"IntimateCatch",intimateCatchChaurmine,undefined,"Intimate Catch","Have him put that tool to use, without being <i>too</i> rough.");
	if(pc.isTaur() && pc.hasGenitals()) addButton(1,"Taur Oral",chaurmineTaurOral,undefined,"Taur Oral","You got it, why not fuck it?");
	else addDisabledButton(1,"Taur Oral","Taur Oral","You need to have a centaur-like body and genitals for this.");
	addButton(2,"Handjob",shipHandjob,undefined,"Handjob","You <i>still</i> want to feel that bulging, ribbed shaft in your hands.");
	addButton(3,"Blowjob",chaurmineHJShipBeej,undefined,"Blowjob","His fat onyx shaft still looks <i>really</i> juicy.");
	if(pc.biggestTitSize() >= 11) addButton(4,"Titfuck",chaurmineShippyShipTitfuckyDuckyHucky,undefined,"Titfuck","Maybe he could use some more convincing...");
	else addDisabledButton(4,"Titfuck","Titfuck",("You need " + (!pc.hasBreasts() ? "huge tits" : "bigger boobs") + " for this..."));
	addButton(14,"Leave", leaveCharmineSex);
}

public function leaveCharmineSex():void
{
	clearOutput();
	showChaurmine(true);
	author("Fenoxo");

	output("You unexpectedly decide that you’re going to leave.");
	output("\n\n<i>“Fuckin’ tease,”</i> the reptile grunts.");
	output("\n\nYou make your way back to the bar, red-faced.");
	if(pc.hasFur() || pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) output(".. or at least as red-faced as someone with [pc.skinFurScales] can get.");
	processTime(14);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function intimateCatchChaurmine():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	//Vaginas should have priority over asses if the PC has both
	var x:int = -1;

	var choices:Array = [-1];
	for(var i:int = 0; i < pc.totalVaginas(); i++)
	{
		if(!pc.isBlocked(i)) 
		{
			choices.push(i);
			choices.push(i);
			choices.push(i);
		}
	}
	//3-1 odds for pussy is good enough for me!
	if(choices.length > 1) x = choices[rand(choices.length)];

	//pcDitz:
	if(pc.isBimbo())
	{
		output("Biting a [pc.lip], you look ");
		if(pc.tallness < 72) output("up to");
		else output("at");
		output(" Chaurmine with your best needy pout; your [pc.eyes] doubtlessly wide and wistful. <i>“Ya know big guy, you can be pretty rough out there in the wastes. D’ya think you could be, like, a little softer this time? In fact, the softer you are, the harder you’ll </i>totally<i> get, I promise,”</i> you say sweetly, clasping your hands together against your [pc.chest]");
		//pcChestSize 1-3 // 4-10 // 11-20 // 21+:
		if(pc.biggestTitSize() < 1)
		{}
		else if(pc.biggestTitSize() <= 3) output(", squeezing the mounds with your [pc.arms]");
		else if(pc.biggestTitSize() <= 10) output(", enhancing the enticing cleavage pressing against your [pc.arms]");
		else if(pc.biggestTitSize() <= 20) output(", the mouth watering mammaries bulging deliciously against your [pc.arms]");
		else output(", your hands virtually disappearing into your jiggly pillows");
		if(pc.tailCount > 0) output(", and wagging your [pc.tails]");
		output(".");
	}
	//Brute:
	else if(pc.isBro())
	{
		output("You cross your arms over your own [pc.chest] as well. <i>“Alright bro, how ‘bout this; I relax, and you treat me nice. Sound good? Do me a solid, and maybe I’ll do </i>you<i> solid,”</i> you say with a cheeky grin.");
	}
	//else:
	else
	{
		output("<i>“Well, I was thinking; our lives seem to have plenty of lively and vigorous moments. Why not have a more relaxing time, just the two of us? Maybe a certain [pc.race] getting pampered by a walking space heater?”</i> you suggest seductively.");
		if(pc.tailCount > 0)
		{
			output(" Your [pc.tails] twich");
			if(pc.tailCount == 1) output("es");
			output(" nervously as Chaurmine raises a brow at the request.");
		}
	}
	output("\n\n<i>“So what you’re saying, is that you want me to do all the work,”</i> he teases, a grin splitting his armored snout. Not really caring for a response, he slowly turns you around with a scaled hand, his other one pawing at your ");
	if(!pc.isCrotchExposed()) output("bare [pc.skinFurScales]");
	else output("[pc.gear]");
	output(". With your back to him, ");

	//pcHeight<60:
	if(pc.tallness < 60)
	{
		output("Chaurmine leans down, his warmth encompassing you as he caresses your sides; his heavy hands delicately exploring what he can reach. You sigh, starting to relax, only to tense up with a startled yelp when Chaurmine clutches your [pc.hips], lifting you off the ground");
		if(pc.hasWings()) output(", causing your [pc.wings] to flail in alarm");
		if(pc.tailCount > 0) 
		{
			output(" as your [pc.tails] whip");
			if(pc.tailCount == 1) output("s");
			output(" about");
		}
		output(". The tin lizard brings your head level with his, resting his prominent chin against your shoulder. <i>“Let’s hope you didn’t bite off more than your size can chew, </i>snack<i>, I can only be so gentle”</i> he growls, followed by a light, moist caress that flicks across your [pc.ear].");
		output("\n\nThe slight touch is enough for a gasp to slip out of you");
		if(pc.hasCock()) output(", your [pc.cocks] pulsing excitedly");
		if(pc.hasVagina()) output(" as [pc.eachVagina] flushes in arousal between your thighs");
		output(". Reaching a hand back towards the lizard’s face, you awkwardly but affectionately rub his armored snout.");
	}
	//pcHeight 61-84:
	else if(pc.tallness < 84)
	{
		output("Chaurmine wraps a heavy arm just under your [pc.chest], ");
		if(pc.biggestTitSize() >= 3) output("your [pc.breasts] bulging around his scales ");
		output("and pulls you against him, careful not to grind your ");
		if(pc.isChestExposed()) output("[pc.skinFurScales]");
		else output("[pc.gear]");
		output(" against the edges of his hard, heavy scales. With a pleased huff, his hot breath billowing down against you, he runs a hand");
		if(pc.hasHair()) output(" through your [pc.hair]; his scale-claws feeling like a warm comb as they caress your scalp");
		else output("along your scalp; his scale-claws massaging their warmth into you");
		if(pc.hasEmoteEars()) output(", and a moan slips through your [pc.lips] when the titan lightly grazes your [pc.ears]");
		output(".");

		output("\n\nReveling in the heat and continuing affections, you reach up to Chaurmine’s bestial visage, tenderly rubbing his armored jaw");
		if(pc.hasCock()) output(", your [pc.cocks] pulsing excitedly");
		if(pc.hasVagina()) output(" as [pc.eachVagina] flushes in arousal between your thighs");
		output(".");
	}
	//pcHeight>85:
	else
	{
		output("Chaurmine excitedly pulls you against him, thrilled with having a partner more <i>his</i> size.");
		output("\n\nYour chin is clutched in his large hand, forcing a surprised gasp from your [pc.lips] before being tilted to the side; your neck bared to him submissively. Hot breath ");
		if(!pc.isChestExposed()) output("blasts across your [pc.skinFurScales]");
		else output("licks at your [pc.skinFurScales] through your [pc.gear]");
		output(", the titan’s reptilian snout pressing into you and deeply inhaling your scent, as he hums to himself.");

		output("\n\n<i>“It’s a shame I have to be gentle,”</i> he whispers, lips brushing a [pc.ear], <i>“I’d enjoy seeing what you can take. You’ll just have to owe me one...”</i> He lightly nips your [pc.ear], almost purring as a ragged breath is caught in your throat");
		if(pc.hasCock()) output(", your [pc.cocks] pulsing excitedly");
		if(pc.hasVagina()) output(" as [pc.eachVagina] flushes in arousal between your thighs");
		output(".");
		output("\n\nReaching up and clamping onto one of Chaurmine’s larger horns, intending to clarify that this should make you <i>even</i>, your attempts at meeting him eye-to-eye are interrupted as his grip tightens possessively followed by a deep growl. Looks like you’ll have to clear this up later...");
	}
	output("\n\nYou let loose a sigh as you relax against his surprisingly comfortable body; almost as if he were a sun-kissed stone, feeling warmer every moment, not a mass of hard muscles and metal scales. Gravity shifts as, at the sound of heavy scales scraping together, Chaurmine sits on his previously neglected bed, the thick cushion groaning in protest with you now held in his lap. ");
	if(!pc.isCrotchExposed() || !pc.isAssExposed()) output("The soothing heat of his scales against your [pc.skinFurScales] is exquisite");
	else output("Your [pc.gear] is swiftly stripped, the heat of his scales against your bare [pc.skinFurScales] exquisitely soothing");
	output(", and the lizard is quick to loop his arms under yours and place his scaled hands above your [pc.chest], clinging to you tightly. Already captivated by the virile brute, his claws gliding along your collarbone, your only reaction to the feel of his armored snout against your neck is to pull him harder against you.");

	output("\n\nChaurmine gives an amused huff and a snort, taking a moment to indulge in your essence. His black canine-like tongue darts out to lightly brush the nape of your neck, and he rumbles happily as the next, more insistent, caress of his tongue draws a deep moan out of you. Before long the scaled titan is contentedly lapping along your neck, turning your [pc.face] this way and that, virtually purring as your [pc.arms] slip from the grip they had on his face to hang at your side. All the while the lizard absently grinds his turgid shaft against your crotch");
	if(pc.hasVagina()) output(", [pc.eachVagina] coating the thick cock in [pc.girlCum]");
	if(pc.hasCock())
	{
		output(" as your [pc.cocks] bob");
		if(pc.totalCocks() == 1) output("s");
		output(" with every movement");
	}
	if(pc.balls > 0) output(" and your [pc.balls] lightly bump and bounce on top of the brute’s ribbed length");
	output(".");

	output("\n\nAfter what feels like a blissful eternity, Chaurmine deems you clean with a final slurp along your jaw. You laugh lightheartedly at his enthusiasm, only to yelp as his claws scrape down your [pc.chest]. He starts toying with your [pc.nipples], and your body wants to writhe from the stimulation, but his hot scales soothe your tense muscles; instead you shudder lightly in his grip, jerking suddenly ");
	if(pc.hasFuckableNipples()) output("whenever the lizard manages to slip a thick finger into your [pc.nipples]");
	else output("with every tug and pull of your [pc.nipples]");
	output(".");
	if(pc.isLactating()) output(" Your [pc.fullChest] leak their lactic cargo over Chaurmine’s armored hands, and down your torso. He brings a [pc.milk] coated hand to his lips, that black tongue shooting out and licking his digits clean. You hear him grumble something about ‘sticky scales’, the titan’s hand returning to your [pc.chest] with a firm grope.");
	output(" <i>“Gentle... You were supposed to be gentle,”</i> you moan");
	if(pc.tailCount > 0) output(", your [pc.tails] twitching to the rough sensations");
	output(" as his hard nose presses against your neck, taking another deep draught of your scent.");

	output("\n\nHe freezes, no longer mauling your [pc.chest]. <i>“Yeah... sorry,”</i> he whispers, smooth scaled lips brushing against your [pc.skinFurScales]. In a surprising display of dexterity, Chaurmine slowly lays the both of you along his strange bedding, both arms still wrapped around you. Satisfied, he runs a hand down your [pc.belly], his claws grazing your [pc.skinFurScales] so lightly it actually starts to tickle");
	//pcHasPrehensileTail:
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output("; your [pc.tails] wrap");
		if(pc.tailCount == 1) output("s");
		output(" around his armored leg as if to anchor yourself to him");
	}
	output(". Gliding lower, his hand moves to your crotch");
	//pcHasCock:
	if(pc.hasCock())
	{
		output(", and he wraps his scaled fingers around your [pc.cockBiggest], his grip a little unsure. <i>“I’ve, uh, held very few cocks. So bear with me...”</i> he bluntly admits, his hand treating your shaft to shy strokes and caresses, <i>“Starting to see the appeal, though.”</i> His smooth scales feel warmer and warmer against your cock, and as he gets more familiar with your penis he often slathers the [pc.cockHeadBiggest] in your leaking pre-cum, drawing deep moans from your core. He even probes your cock slit, lightly teasing the sensitive flesh");
		if(pc.balls > 1) output(". Your [pc.balls] receive similar attention whenever his touch reaches your [pc.sheathBiggest]. His warm and slick hand on your [pc.sack] cups the churning orbs, as if weighing them. Meanwhile, his own virile cum tanks virtually slosh to every movement in sympathy");
		output(". Your jaw clenches in concentration, eager for more of the slick reach around but not wanting it to end, grunting as the titan’s hand bottoms out with every thrust. Just as you are reaching that glorious peak, breath ragged and body tense, he lets go of your throbbing cock");
	}
	output(".");

	//pcHasVag:
	if(pc.hasVagina())
	{
		output("\n\nHe quickly zeroes in on your [pc.clits], the lizard’s fingers teasing [pc.eachClit] as he runs them along your mons. Moans slip from you at his touch, your lower lips wedged between his [pc.girlCum]-slicked digits. You suddenly jolt, half in alarm and half in pleasure, when two of his sharp scale-claws curve and dip into [pc.oneVagina]; the grip he has on its outer folds is delightfully smooth. Writhing and whining in his arms, you’re thankful that his claws are apparently too wet and lubed up by your [pc.girlCumNoun] juices to cause harm or discomfort; instead, his claws and scales have <i>just</i> enough of an edge to stimulate your inner walls with the most lascivious friction. On the verge of a toe-curling high, you cry out in distress when he slides out of your [pc.vagina], the mind blowing friction gone as he brings his ");
		if(pc.isSquirter() || pc.girlCumQ() >= 500) output("[pc.girlCum] drenched hand");
		else output("[pc.girlCum] sheened fingers");
		output(" to his rapacious tongue, rumbling happily as he licks himself clean");
		output(".");
	}
	
	output("\n\n<i>“Fuck... It’s time to fuck,”</i> he pants, overexcited from exploring your body. Shifting so both armored hands cling to your [pc.hips], he draws his ");
	if(x >= 0) output("dripping, ");
	output("xeno-dino cock back so his blunt tip bumps into your [pc.vagOrAss " + x + "].");

	//pc has cock, no vag, no self-lubed ass:
	if(pc.hasCock() && x == -1 && pc.ass.wetness() <= 0)
	{
		output("\n\nYou tense when you feel his round, fat head against your pucker. He is <i>thick</i>. With no lube. He can’t be going in dry, can he? Before a word can leave your mouth, you flinch as a large hand returns to your still-hard shaft; one confident tug followed by another.");
		output("\n\n<i>“Need lube,”</i> Chaurmine blurts out, seeing your distress, <i>“Not really something I keep on-hand, ‘cept for now.”</i>");

		output("\n\nYou pant, already on edge from before, giving strained grunts in response to each stroke along your [pc.cockBiggest].");
		if(pc.biggestCockLength() >= 8) output(" Taking your length in a two handed grip, he works your cock hard, stroking the column of meat while kneading and wreathing your [pc.cockHeadBiggest] in hot scales");
		else output("His other hand roams over your [pc.belly], caressing your [pc.skinFurScales] while rubbing your straining shaft");
		output("; the lizard’s own bulging member continues to press into your [pc.ass], his hard head leaking its own lubricant against your pucker. He seems set on using your cum, though.");

		output("\n\nWell, you won’t complain, especially as you feel your middle clenching, drawing up a molten heat from your [pc.balls]. You cry out, thrusting your [pc.hips] against his grip as you cum, ");
		//pcCumVolume<500mL // 500-3000mL // >3000mL:
		if(pc.cumQ() < 500) output("coating his hand in a thick layer of [pc.cum]");
		else if(pc.cumQ() < 3000) output("glazing his hand and, after he aims your shaft away from you, a shocking amount of his room with a healthy layer of your seed");
		else output("your [pc.cockBiggest] blasting the lizard’s hand like a cannon, almost making a mess until Chaurmine aims your shaft away, and you just keep going. After what feels like minutes, and a final clench of your shaft, your [pc.cum] drips off the mattress and into the growing puddle on the floor. Chaurmine only snorts in amusement");
		output(". After a few last dry lurches, your [pc.chest] heaves as you try to catch your breath, shuddering as the brute’s hand slips off your penis.");

		output("\n\n<i>“That’s more like it,”</i> his breath whispers hotly on your [pc.ear], grinning as you moan when you feel his cum coated digits on your [pc.ass] before sliding in, lubing your pucker with every wriggle and bend of his fingers. Once he’s satisfied, his fingers make an exodus of your sphincter with an enticing ‘shlick’, covering his ribbed monster cock with what’s left");
		output(".");
	}
	output("\n\nYou feel him tense up, using his grip to pull you tighter against his blunt head as he grinds against you. <i>“Relax, [pc.name], and I guarantee you you’ll enjoy this,”</i> he sultrily breathes, his words almost hot enough to feel like flames licking at your neck. His hot breath, steamy atmosphere, warm embrace; all these have made you pretty relaxed already, but you let out a sigh and give him a wiggle of your rear anyways. This seems to satisfy the metal lizard, and he abruptly thrusts, your breath catching as he enters with a wet <i>pop</i>.");

	var capacity:Number = 0;
	if(x >= 0) capacity = pc.vaginalCapacity(x);
	else capacity = pc.analCapacity();
	
	//pcIsAnalOrVagVirgin:
	if((x < 0 && pc.analVirgin) || (x >= 0 && pc.vaginalVirgin))
	{
		output("\n\nYou give a hoarse grunt and clench your teeth together, your tender walls writhing and wreathing the titan’s tip as he momentarily fights for more ground. He stops when he can’t make any progress, growling in pained pleasure at the tight grip.");
		output("\n\n<i>“[pc.name], breathe,”</i> his words gladly obeyed as you let out a strained gasp, chest heaving as you try to accommodate the obscenely thick insertion, <i>“Fff-fuckin’, damn [pc.name], am I the first one in here?”</i>");
		if(pc.isMischievous()) output("\n\n<i>“Why? Are you- is it in yet?”</i> you struggle to ask with a level voice, let alone a straight face");
		else output("\n\nYou moan as his bulging penis flexes, before nodding, your face blushing");
		output(". Though feeling stretched taut, you’re finding the intense sensation more and more pleasureable.");

		output("\n\nRumbling in approval as your tender passage becomes less constricting, albeit at glacial speed, he shifts his hips and stirs your insides with his bulbous head. <i>“Shoulda told me I was gonna be your ");
		if(x < 0) output("butt");
		else output("cunt");
		output(" buster,”</i> he growls, <i>“Even with all this lube, a cock like mine can be, urgh, rough.”</i>");

		output("\n\nHe extracts his blunt tip from your [pc.vagOrAss " + x + "] with a grunt and a pop, and waits for your word. Though you take a few moments to collect yourself, you quickly signal your readiness with a wiggle of your [pc.hips], which Chaurmine clutches tight with an amused snort, before thrusting in once again.");
	}
	
	if(x >= 0) pc.cuntChange(x,chars["CHAURMINE"].cockVolume(0));
	else pc.buttChange(chars["CHAURMINE"].cockVolume(0));
	
	output("\n\nYou cry out in shameless ecstasy,");
	//pcOrificeCapacity<135cubedinches:
	if(capacity < 135)
	{
		output(" your mind unable to wrap itself around the monstrous girth tunneling into your [pc.vagOrAss " + x + "]. Your breath catches with every fat, bulbous rib along his length that slips past your ");
		if(x >= 0) output("lower lips");
		else output("backdoor");
		output(", and before long, [pc.fullChest] heaving, more and more of your [pc.vagOrAss " + x + "] is stretched painfully taut, and Chaurmine hisses when he’s to the hilt");
	}
	//>135cubedinches:
	else
	{
		output(" your body gleefully accepting the deliciously thick kind of shaft it’s been made for; your [pc.vagOrAss " + x + "] clinging tightly to the obscene penis as if it were a perfectly made custom glove, your stretched inner walls pulsing along its length. Chaurmine rumbles appreciatively as his scale-studded sheath presses and wrinkles against your [pc.vagOrAss " + x + "]");
	}
	output(".");

	output("\n\nYou move a hand to your [pc.belly], ");

	if(pc.bellyRating() >= 30) output("and though there’s no outer sign of his cock, you still feel that fat tip throbbing heavily inside you.");
	else output("softly gripping the bulging outline of his fat cock against your [pc.skinFurScales], and gasp as you feel - and <i>see</i> - the titan’s blunt head lurch and throb at your touch.");

	output("\n\nDeciding you’ve adjusted to his ribbed shaft, Chaurmine begins giving slight, almost delicate thrusts, gradually drawing more and more monstrous girth out each time, your gasps growing louder with his intensifying rhythm. It almost feels like he’s counting each fat rib on his penis, withdrawing one by one. You stifle a laugh with a lip bite and a moan, your pleasure headed towards an immense peak as more and more cock is repeatedly thrust into your [pc.vagOrAss " + x + "]");
	if(x < 0 && pc.hasCock()) output(", sawing against your prostate");
	output(". Even as things grow heated, your [pc.hips] writhing to match every thrust, Chaurmine seems to remain focused on your pleasure as he pants searing breath against your neck; a large hand catches you by surprise, moving from your side to your crotch.");

	//ifVaginal:
	if(x >= 0)
	{
		output("\n\nYou moan with abandon as he flicks a claw past [pc.oneClit], [pc.skinFurScales] glistening with a growling layer of sweat from a coiling heat building with each thrust and grind against your most sensitive flesh. [pc.OneVagina] contracts excitedly, milking Chaurmine’s monstrous shaft for his strong seed, and fill your womb to the brim. His armored hips thrust a touch faster, metal scales smacking wet and loud against your [pc.ass], but maintains enough thought to diddle your [pc.clits]");
		if(pc.hasCock()) output(", ignoring your jouncing [pc.cocks]");
		output(". He seems to be waiting for you to give in first.");

		output("\n\nYou do exactly that.");

		output("\n\nGasps and moans slip from your [pc.lips], [pc.legs] thrashing as your overcharged nerves send bolts of bliss up and down your body, setting off the tense heat coiled tight around your core; your body tensing, your [pc.arm] absently swings back to grab onto Chaurmine’s armored muscular ass and you throw your head back as if to scream.");

		output("\n\nBut all comes out is a surprised gasp as Chaurmine wraps you in his arms, clutching you softly but safely as he all but stops his thrusting. Wrapping a heavy arm around your [pc.belly], he holds you close to his hot scales, ignoring your orgasmic writhing against his grip. At the same time, his other hand cups the chin of your [pc.face], and affectionately runs his wide, black dog-like tongue along your [pc.skinFurScales], lapping up the glistening sweat.");

		output("\n\nAs you pant, coming down from your high, you frown. Did he just... ? You were just over that glorious peak, why would he-");

		output("\n\n<i>“Relax, [pc.name],”</i> he hums, still washing your upper body, <i>“We’re not done yet. Just. Relax.”</i>");

		output("\n\nWith a calming breath, you do your best with his iron-hard shaft still throbbing in your depths. His hot grip while his tongue lavishes your [pc.skinFurScales] <i>does</i> help, though.");

		output("\n\nBefore you know it, Chaurmine is tenderly thrusting into you again, his tongue now caressing just behind a [pc.ear] with the occasional nip. Though not as intense of a peak, your still-sensitive nerves quickly have you at a luscious edge once more; your hand still clasped onto the titan’s ass, otherwise you remain much more lax.");
		if(pc.hasCock()) output(" [pc.EachCock] remains at full mast, however; leaking [pc.cum] with every thrust.");

		//pcHasTailCock:
		if(pc.hasTailCock())
		{
			output("\n\n[pc.EachTailCock] whips around excitedly, moving towards that precious mouth-muscle caressing your [pc.skinFurScales]. Chaurmine pointedly ignores your [pc.tailCocks]. Moaning, you boop his snoot with [pc.oneTailCock] insistently, which earns you a snort and a token lick; your [pc.tailCocks] wriggling excitedly in victory.");
		}

		//pcHasTailVagina:
		if(pc.hasTailCunt())
		{
			output("\n\n[pc.EachTailCunt] wraps and grinds against Chaurmine’s limbs, luxuriating in the friction of his girl-cum lubed scales. You then get the to move [pc.oneTailCunt] up to the lizard’s lapping tongue; hoping for some extra oral action. Chaurmine eyes the approaching pussy-tipped tail, snorting in amusement as it drips girl-cum everywhere. Deciding to humor you, he takes a moment to drag his black tongue up your tail’s slit, sending shivers up and down your spine. You’ll have to see if he can do that more some other time...");
		}

		output("\n\nYou gasp, the fat cock spreading you wide, grinding against your tight walls, hits <i>that</i> spot. Swooning as the renewed inner heat boils over, you all but cream yourself silly on that juicy shaft, ");
		if(pc.isSquirter()) output("[pc.girlCum] gushing from your [pc.vaginas], drenching both of your lower bodies in your love lube");
		else output("streams of [pc.girlCum] running down into the lizard’s studded sheath");
		output(". You can’t help but shudder with each luxurious contraction.");

		output("\n\nChaurmine hums, continuing to thrust even as [pc.oneVagina] massages and milks his alien dino-cock and you twitch nervelessly in his grasp. Just as one climax tapers off, another is hot on its heels, and another after that; Chaurmine keeps a steady pace as he plays your limply writhing form like a fiddle, fucking you from one warm, luscious high to another. All while lavishing gentle but insistent licks wherever his black tongue can reach.");
		processTime(20);
		pc.loadInCunt(chars["CHAURMINE"],x);
	}
	//ifAnal:
	else
	{
		if(pc.hasCock())
		{
			output("\n\nYour breath catches as hot, smooth scales run along your [pc.cockBiggest], the already-turgid shaft buzzing as sensitive nerves light up with every touch. Pre-cum liberally leaks from [pc.eachCockHead], glossing [pc.eachCock] and Chaurmine’s scales. Each thrust and groan you make into his hand mirrors his massive girth in your [pc.ass], grinding and pressing against your prostate; [pc.eachCock] throbs and bulges almost painfully as that sensitive bulb is mashed again and again.");
		}
		//pcHasTailCock:
		if(pc.hasTailCock())
		{
			output("\n\n[pc.EachTailCock] whips around excitedly, moving towards that precious mouth-muscle caressing your [pc.skinFurScales]. Chaurmine pointedly ignores your [pc.tailCocks]. Moaning, you boop his snoot with [pc.oneTailCock] insistently, which earns you a snort and a token lick; your [pc.tailCocks] wriggling excitedly in victory.");
		}
		//pcHasTailVagina:
		if(pc.hasTailCunt())
		{
			output("\n\n[pc.EachTailCunt] wraps and grinds against Chaurmine’s limbs, luxuriating in the friction of his girl-cum lubed scales. You then get the to move [pc.oneTailCunt] up to the lizard’s lapping tongue; hoping for some extra oral action. Chaurmine eyes the approaching pussy-tipped tail, snorting in amusement as it drips girl-cum everywhere. Deciding to humor you, he takes a moment to drag his black tongue up your tail’s slit, sending shivers up and down your spine. You’ll have to see if he can do that more some other time...");
		}
		output("\n\nYou cry out, tender backdoor writhing and milking the monstrous onyx cock, as Chaurmine sets a solid rhythm. His tongue flicks your [pc.ear], the titan’s hot breath searing, his panting interrupted with an occasional grunt.");
		output("\n\nYou’re forced ever closer to that blissful peak, clutching the sturdy sheets tightly and your [pc.legs] tensing, as your anal walls are spread taut and slathered in the lizard’s increasingly copious pre-cum.");
		output("\n\n<i>“C’mon, [pc.name], don’t hold back. Hah... just let go,”</i> he pants, each tip to base thrust making a deliciously slick sound. You can’t help but follow his word, and you exult in Chaurmine’s smothering warmth as your [pc.ass] grips and pulses the occupying shaft in an an intense anal orgasm.");
		if(pc.hasCock())
		{
			output("\n\nHe slaps his metal-scaled hips into your [pc.ass] with a loud smack and holds you tightly against him, the monstrous insertion knocking the wind out of you. Your [pc.fullChest] heaves as you gasp for breath, body twitching whenever your [pc.hips] grind and thrust back against him, his shaft pressing hard on your prostate. [pc.eachCock] practically drooling [pc.cum].");
			output("\n\nThe scaled hand stroking your [pc.cockBiggest] suddenly shifts to your [pc.cockHeadBiggest], gently but insistently kneading and massaging your sensitive flesh. You groan long and low as you cum, and cum <i>hard</i>; [pc.eachCock] bloating with seed from your tender, pent-up [pc.balls]. ");
			if(pc.cumQ() < 500) output("Streams of your [pc.cum] splashes against Chaurmine’s scaled palm, hot cum slowly running down your [pc.cockBiggest], gooey strands stretching and breaking from his palm as he removes his hand");
			else if(pc.cumQ() < 3000) output("[pc.Cum] splashes the lizard’s scaled palm, and you keep cumming until your [pc.crotch] and his hand are coated in your hot seed, and thick, gooey strands of cum slowly drip onto the bed");
			else output("Chaurmine grunts in surprise as your [pc.cum] smacks into his palm, almost forcing the hard hand off of your [pc.cockHeadBiggest]. Thick streams burst from between the titan’s fingers, drenching you, the bed, Chaurmine, and even some furnishings in thick layers of hot, musky cum");
			output(".");
			if(pc.cockTotal() > 1) output(" The luscious mess made even worse thanks to your [pc.multiCocks].");
		}
		output("\n\nChaurmine hums as you cum yourself silly, breath hot on your neck as he lightly laps your [pc.skinFurScales] with his black tongue. <i>“I’m not done with you yet, [pc.name]. I’m just starting to enjoy this,”</i> he growls.");
		processTime(20);
		pc.loadInAss(chars["CHAURMINE"]);
	}
	output("\n\nMercifully, after a few more orgasms, Chaurmine decides to end it, growling as he thrusts one final time into your [pc.vagOrAss " + x + "]. His bloated, sloshing sack jerks, potent seed being pumped from his cum tanks. You moan as you feel his fat, iron-hard shaft twitch and flex in your depths, practically stirring your insides on its own as his pent up load distends his cum-vein, the bulging ribs along his length almost pulsing with the titan’s powerful heartbeat. Your breath hitches as his thick and hot cum surges into you, flooding your [pc.vagOrAss] while he holds you still.");
	output("\n\nSoon, your [pc.belly] starts to round out, and you pant and sigh at the sensation. As his own pleasure comes to an end, he pulls his monstrous cock free and aims his last blast to coat your [pc.crotch] in his hot seed, while the rest oozes out of your [pc.vagOrAss " + x + "].");
	output("\n\nTo your surprise, Chaurmine wraps both arms around you, and his armored snout softly presses into the nape of your neck. You signal your readiness to part, only for the lizard to growl and clutch you possessively. <i>“You had your time, [pc.name], now this is mine,”</i> he rumbles while rubbing his snout along your [pc.face], softly pinning your head against a pillow in covetous affection.");
	output("\n\nWell, you <i>are</i> pretty worn out, and the warmth encompassing you is incredibly soothing. Would you rather leave, or stay with the lizard for a while?");

	pc.orgasm();

	//[Stay]
	//[leave]
	chaurmineRelationship(5);
	IncrementFlag("SEXED_CHAURMINE");
	clearMenu();
	addButton(0,"Stay",stayWithCharmineAfterRiding);
	addButton(1,"Leave",leaveChaurmine);
}

//Stay
public function stayWithCharmineAfterRiding():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");

	output("With a contented sigh, you melt into Chaurmine’s warm arms as you both bask in the afterglow. As you both doze off, he continues to rub his snout along your shoulders, neck, and [pc.face] with affectionate caresses. You absently moan whenever you feel his teeth poke your [pc.skinFurScales] with soft bites and nibbles.");
	output("\n\nThis continues for what feels like a blissful eternity, luxuriating in the steamy and surprisingly tender treatment from the cuddly lizard. At some point he even turns you around to face him, tilting your [pc.face] back to lavish you with soft licks from collar bone to jaw; he ends up washing this side of your neck just as much as the other, his chest rumbling happily to every moan and sigh you make.");
	output("\n\nEventually though, time catches up, and Chaurmine sits upright, saying that he has things to do and it’s time to part. You give a heavy sigh, reluctant to release your arms from around his neck. If only-");
	output("\n\nYou let out a yelp as Chaurmine abruptly stands, holding your weight while your [pc.feet]");
	if(pc.hasWings()) output(", as well as your [pc.wings]");
	if(pc.tailCount > 0) output(" and your [pc.tails]");
	output(" kick, thrash, and flail for a grip. You laugh with mirth as his stomps take you to the ship’s crew showers.");

	processTime(65);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Leave
public function leaveChaurmine():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	if(pc.isGoo()) output("While a part of you wants to indulge yourself, you can’t stay here on <i>his</i> time, and you shift your gooey self out of his grip. Chaurmine only sighs in mild irritation.\n\n");
	output("After a few minutes, Chaurmine still seems to have not had his fill, but he relents; he guides you out into the corridor and into a large shower. Obviously meant for a small saurmorian crew. Once clean and proper, you exit the ship and onto the landing bay, ready for... whatever.");

	processTime(4);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Taur Oral
public function chaurmineTaurOral():void
{
	clearOutput();
	showChaurmine();
	output("<i>“Wait,”</i> he grunts with a raised hand, and motions for you to turn, <i>“Spin... Uh, please.”</i>");
	output("\n\nYou ");
	if(pc.isNice()) output("feel your cheeks bloom with warmth as a blush creeps across your [pc.face]");
	else if(pc.isMischievous()) output("smirk smugly, having a good idea of where the brute’s eyes will undoubtedly go");
	else output("raise a brow at his tone");
	output(", but decide to humor him. With deliberate, languid motions, you slowly turn your tauric form in a circle for the titan’s appraisal");
	//pcNotFullyNude:
	if(!pc.isCrotchExposed() && !pc.isAssExposed() && !pc.isChestExposed()) output(" and, knowing he’ll want to see everything, remove your [pc.gear]");
	output(". His azure eyes run along bare [pc.skinFurScales], taking in your [pc.thighs] and [pc.legs]");
	if(pc.tailCount > 0) output("; the movements of your [pc.tails] momentarily catch his attention too");
	output(". ");
	//pcExhibScore 33-49.5
	if(pc.exhibitionism() < 33) {}
	else if(pc.exhibitionism() < 50) output("Heat spreads through you as Chaurmine absorbs your naked form, and you take deep, slow breaths to calm your speeding heart.");
	else if(pc.exhibitionism() < 66) output("With every part of you that Chaurmine’s eyes pass over, a small shiver creeps its way up your spine as you feel that distinct thrill of being so exposed.");
	else output("Your breath catches as Chaurmine’s azure orbs roam over you, your heartbeat thundering in your ears as your [pc.legs] quiver, struggling to keep you upright; you can almost <i>feel</i> his gaze along your [pc.skinFurScales]. A part of you wishes this juggernaut of a corvette had a crew, for all the more eyes to see you in such a lewd state. Heat pools to your [pc.crotch] at the thought.");

	output("\n\nHe runs a hand down your tauric body, and his claws graze your [pc.skinFurScales], sending a shudder down your frame that follows his touch. Inevitably, he ends his exotic pilgrimage standing behind you with a rough grope of your [pc.ass]; your [pc.feet] shuffle in anticipation.");

	//pcHeight<84inches:
	if(pc.tallness < 84)
	{
		output("\n\nKneeling down, Chaurmine brings himself closer until his breath is hot against your rear. You let out a yelp as the lizard’s claws shift to your [pc.thighs] and easily haul them upwards, putting you in the unfamiliar situation of your front half still wobbling on unsteady legs, while the back half of your tauric body is raised up to the titan’s maw.");
	}
	else
	{
		output("\n\nYou feel his hot breath lick down the back of your tauric body as he lowers his snout to be level with your rear, and moan as his armored hands move from your ass to your [pc.thighs].");
	}

	//pcHasTail:
	if(pc.tailCount > 0) 
	{
		output(" He grunts in mild amusement, seeming to enjoy the movements of your [pc.tails].");
		if(pc.hasTailCunt() && pc.hasTailCock())
		{
			output(" He growls in surprise the moment he feels the impact of excited [pc.tailCocks] against his snout, which glistens with more and more pre-cum each time you poke and prod his scales. You cry out, laughing as playful nips dot your [pc.tailCocks], the lizard grinning mischievously at your reaction");
			output("\n\nHe snorts as his face is rubbed by your [pc.tailCunts] between pokes of your [pc.tailCocks], vying for the lizard’s attention as his scales are coated in fem-lube. [pc.OneTailCunt] then creeps down his torso, and you gleefully wrap it around the titan’s shaft");
			output(".");
		}
		//pcHasTailCock:
		else if(pc.hasTailCock())
		{
			output(" He growls in surprise the moment he feels the impact of excited [pc.tailCocks] against his snout, which glistens with more and more pre-cum each time you poke and prod his scales. You cry out, laughing as playful nips dot your [pc.tailCocks], the lizard grinning mischievously at your reaction.");
		}
		//TailCunt:
		else if(pc.hasTailCunt())
		{
			output(" He snorts as his face is rubbed by your [pc.tailCunts], vying for the lizard’s attention as his scales are coated in fem-lube. [pc.OneTailCunt] then creeps down his torso, and you gleefully wrap it around the titan’s shaft.");
		}
		output(" All too soon though, he’s batting your [pc.tails] out of the way, giving him access to your loins.");
	}
	output("\n\nChaurmine’s hot breath gusts against your groin, drawing an anticipatory gasp from your lungs");

	//pcChestSize1+/lactates
	if(pc.biggestTitSize() >= 1 && pc.isLactating()) 
	{
		output("; your [pc.nipples] puff up excitedly, and you ");
		if(pc.hasFuckableNipples()) output("slip a few fingers in teasingly");
		else output("give them a pinch");
		output(" as you run your palms along your [pc.chest]");
	}
	else output("; your [pc.nipples] puff up excitedly");
	if(pc.isLactating()) output(", [pc.milk] leaking around your fingers");
	output(".");

	//pcHasCockNoCunt:
	if(pc.hasCock() && (!pc.hasVagina() || pc.isBlocked(0)))
	{
		output("\n\nReaffirming his grip, the brute’s dark canine-like tongue slaps just below your [pc.asshole], dragging down to tease your perineum.");
		output("\n\n<i>“A shame you don’t have a cunt back here,”</i> he murmurs against your taint, drawing his snout down to your ");
		if(pc.balls > 0) output("[pc.sack]");
		else output("[pc.sheathBiggest]");
		output(", his hot breath making your heart-beat quicken as you hear the humor in his tone; he’s hardly disappointed, <i>“Ahhhh fuck it. I’ll find something.”</i>");

		if(pc.balls > 1)
		{
			output("\n\nHe shoves his armored nose into your [pc.balls], taking a long draft of your musky scent, letting it out with a steamy huff. You groan long and low as you feel his wide, incredibly soft tongue curl around a [pc.ball], cupping the churning orb as it slurps and polishes your [pc.sack]. As he’s lavishing your [pc.balls] with affection, your [pc.cocks] throbbing and pulsing, smacking against your tauric belly, his oral-muscle gently takes");
			if(pc.ballDiameter() >= 9) output(" as much of your cum tanks as it can");
			else output("your [pc.balls]");
			output(" between his massive jaws; though not painful, the slight poke of his teeth against you is intense, and you can’t help but let out a small whimper when a deep rumble reverberates from the titan’s core as he starts to lightly suckle.");
			output("\n\nAfter several long minutes of fueling your ardor into a soul-searing heat, his head bobbing with every gulp and slurp, he releases your [pc.scrotum] from his maw. Licked, polished, and suckled until you can almost hear them sloshing with [pc.cum], your [pc.balls] receive a parting lap.");
		}

		output("\n\nYour rear is suddenly ");
		if(pc.tallness < 84) output("dropped and ");
		output("pushed, a grunt forced out of you as you’re shoved up to the strange bed. <i>“Put those [pc.feet] of yours on the frame");
		//pcHeight84+: 
		if(pc.tallness >= 84) output(". Don’t worry, it’ll hold");
		output(",”</i> he curtly commands, and you readily comply. As your front [pc.feet] step onto the solid structure, it’s clear it would take <i>a lot</i> of force to cause any damage. The thing might as well be a small marble pool.");

		output("\n\nOnce you are in position, Chaurmine slinks to the floor next to you, virtually crawling in order to put his armored snout level with your [pc.cocks]");
		if(pc.tallness >= 84) output(" despite the size of your large, bestial body");
		output(". Seeing him balance on his hands and feet - his heavy tail swaying behind him, the titanic scales layered down his shoulders and back shining in the light - gives you the image of some prehistoric creature.");

		output("\n\nRidiculous. Though you decide to keep the thought for later as soon as his heated breath licks across your [pc.crotch] like flames.");

		output("\n\n<i>“Ya know, this usually isn’t my kind of thing, but fuck me if you’re not starting to show me the appeal,”</i> the lizard grunts, and you feel your face heat up as you blush from the compliment.");

		output("\n\nEyeing [pc.eachCock], his black almost-canine tongue darts out to slap against your [pc.cockHeadBiggest], the momentary flicker of soft, moist friction drawing a gasp from you. A rumble reverberates from the titan as he hums to your reaction, enticing him to continue. He shifts focus though, licking [pc.eachCockHead] and reaching up to stroke [pc.eachCock], and you can’t help but moan to every touch; his snout and hands are soon shining and dripping with your pre-cum, which he leaves to trickle in ever increasing amounts down his arms and vibrating chest. He begins to pant, wreathing your [pc.cocks] in his searing breath; the sensation causes you to twist your upper body just to be certain he’s not starting a fire down there.");
		output("\n\nNo fire, but your angle lets you easily see the titan’s bulging erection, throbbing over a sloshing sack. While you can see the fat mass of alien-dino cock, you’re not able to reach it.");

		//pcHasTailCunt:
		if(pc.hasTailCunt())
		{
			output("\n\nThat is until you remember the [pc.tailCunts] you were dutifully keeping out of his way. Shifting [pc.oneTailCunt], you move the neglected honeypot closer to Chaurmine’s blunt head as it bobs to his movements; he seems not to notice [pc.oneTailCunt], his attention focused on your own [pc.cocks].The moment it is in reach, you launch your slit-tipped tail against Chaurmine’s lurching shaft.");
			output("\n\nYou cry out as your tail’s lips are stretched taut around the brute’s ribbed cock, while he pauses in lavishing your [pc.cocks], instinctively thrusting <i>fast</i>, and <i>hard</i>, as his penis is wrapped in writhing bliss. You flinch, the awkward angle straining your otherwise flexible appendage and forcing the sodden lips against the lizard’s sheath, the fat cock forming a distended bulge along its length; at least it wasn’t a regular cunt.");
			output("\n\n<i>“[pc.name], ya gotta... hah, ya gotta warn me. When ya do that,”</i> he glares at you as he pants, having calmed down. He doesn’t seem keen on removing the attached orifice though, letting your sore tail-pussy suckle the onyx cunt-wrecker.");
		}

		output("\n\nHis armored nose presses your [pc.multiCocks] into your tauric belly, phallic flesh hot against [pc.skinFurScales]. At first humming to the pleasant friction, your breath catches the moment his delicious tongue completely flops out, maybe twelve inches, and lavishes [pc.eachCock] with full, wet caresses from stem to [pc.eachCockHead]. Left breathless, you absently twitch your [pc.thighs] as you’re absorbed in the brute’s exquisite oral affections.");
		output("\n\nClenching, pulsing, [pc.eachCock] feels tighter with every wet lap and lick from that divine tongue, and heat spreads throughout your body, pooling into your [pc.balls]. The heat and tension coil together into a timebomb of lust; each tick marked by your bulging, clenching [pc.cocks] and twitching [pc.thighs]");
		if(pc.balls > 0) output(" between powerful pulses and throbs of your [pc.balls]");
		output(".");

		output("\n\n[pc.Feet] pawing at the sturdy bed frame, you can’t resist that tense heat any longer, not with Chaurmine’s black tongue insisting for your release. Unable to hold back, you give a low moan as [pc.eachCock] bloats with incoming seed, the indescribable bliss of molten passion forcing its way out of [pc.eachCockHead] consuming your entire being as you ");
		if(pc.cumQ() < 500) output("coat Chaurmine in");
		else if(pc.cumQ() < 2000) output("soak Chaurmine in many layers of");
		else output("absolutely drench Chaurmine in torrential loads of");
		output(" your [pc.cum].");

		//pcHasTailCunt:
		if(pc.hasTailCunt())
		{
			output("\n\nYour orgasm also sets off your [pc.tailCunt] suckling and tugging at the titan’s shaft, writhing and coiling wildly around the monstrous, ribbed member as it douses his crotch in fem-cum. Chaurmine can only grunt and gasp as he’s shoved over the edge, his armored thighs quivering before giving slow, <i>hard</i> thrusts into your tail mounted slit; his fat, heavy testicles swing with every lunge, even as they pull taut, twitching with every virile pump.");
			output("\n\nThe feeling of his hot, thick seed basting [pc.oneTailCunt] leaves you breathless. His potent cream floods [pc.oneTailCunt] until trails of alabaster trickle out from around his engorged penis, your cunt-tail feeling bloated and stuffed with cum. He gives a few last token thrusts, riding out the pleasure, before tugging [pc.oneTailCunt] off of his monstrous cock, the blunt head coming out with a <i>pop</i> and a burst of potent alien seed.");
		}
		else
		{
			output("\n\nAs he’s covered in your seed he reaches a hand to his own throbbing length, moaning to the feeling of his scales against the ribbed shaft. A few tugs, and he’s virtually fucking his hand, the lizard’s distended onyx cock slick with pre-cum while his fat, heavy testicles sway between his armored legs. Rising up onto his knees, he takes his shaft into a two handed grip, stroking the shaft and kneading that blunt tip as he aims at your own [pc.cocks].");
			output("\n\nYou feel as well as hear the deep growl from the brute’s chest as his pent up sack clenches taut to his form - though still heavy enough to wobble with every thrust - and surges thick cum through his bloated shaft; load after potent load lands on your [pc.cocks], his virility soon sloughing off [pc.eachCock] in gooey strands.");
		}
		output("\n\nYour chest heaves, tauric body shuddering in blissful aftershocks as your [pc.feet] absently paw at the cum-slicked bed-frame-pool. A heavy hand lands a wet, solid smack onto your [pc.ass], and you turn back to see Chaurmine giving you a smug grin as cum runs off of the both of you.");
		processTime(30);
		pc.orgasm();
		if(pc.hasTailCunt()) pc.loadInCuntTail(chars["CHAURMINE"]);
	}
	//pcHasVagina:
	else if(pc.hasVagina())
	{
		var x:int = rand(pc.totalVaginas());
		output("\n\nChaurmine practically purrs as he takes in [pc.eachVagina], and you moan lasciviously as his humming sends exquisite vibrations through you to your [pc.clits]");
		if(pc.hasCock()) output(" and [pc.cocks]");
		output(". He moves his armored snout closer to your [pc.vagina " + x + "], nostrils flaring as he takes large lungfuls of your scent, and the brute licks his chops.");
		if(pc.vaginalVirgin) output(" Chaurmine lets out a noise almost like a gasp, <i>“Hmm? Ahh, I smell a </i>virgin<i>.”</i> He grins at your dubious look, <i>“The nose knows, and so do I. I’m going to savor this,”</i> he rumbles, returning his attention to your [pc.vagina " + x + "].");

		output("\n\n<i>“Yeah, </i>just<i> what I was lookin’ for,”</i> the titan murmurs, flicking his black canine-like tongue against your labia, drawing another moan from your [pc.lips].");

		output("\n\nYou peer at the lizard over your shoulder, ");
		if(pc.isNice()) output("smiling warmly at him, <i>“Heh, good for us both that you, uh, found what you-”</i>");
		else if(pc.isMischievous()) output("unable to hide the smirk on your [pc.face], <i>“Uh huh. Mmm, I hope you know what you’re-”</i>");
		else output("a smug smile on your [pc.face], <i>“I know. Took you a while tho-”</i>");
		output(" Your words are cut off as his soft tongue abruptly slaps against your outer lips again, the oral-muscle dragging up your [pc.vagina " + x + "] as his saliva mixes with your [pc.girlCum]");
		if(pc.hasCock()) output(" while [pc.eachCock] leaks clear pre-cum");
		output(", swiftly making your [pc.crotch] a slick mess as more and more leaks with each sloppy lick. [pc.Feet] paw and knead the floor with each staggered breath you take, [pc.chest] heaving. You can’t help but try and at least wiggle your hips a bit, your body crying out for you to give in and writhe in pleasure; this just earns a growl from the brute.");

		output("\n\nYour rear is suddenly ");
		if(pc.tallness < 84) output("dropped and ");
		output("pushed, a grunt forced out of you as you’re shoved up to the strange bed. <i>“Put those [pc.feet] of yours on the frame");
		if(pc.tallness >= 84) output(". Don’t worry, it’ll hold");
		output(",”</i> he curtly commands, and you readily comply. As your front [pc.feet] step onto the solid structure, it’s clear it would take <i>a lot</i> of force to cause any damage. The thing might as well be a small marble pool.");
		output("\n\nOnce you are in position, Chaurmine slinks to the floor behind you, virtually crawling in order to put his armored snout level with your [pc.vaginas]");
		if(pc.tallness >= 84) output(" despite the size of your large, bestial body");
		output(". Seeing him balance on his hands and feet - his heavy tail swaying behind him, the titanic scales layered down his shoulders and back shining in the light - gives you the image of some prehistoric creature.");
		output("\n\nRidiculous. Though you decide to keep the thought for later as soon as his heated breath licks across your [pc.crotch] like flames. The change in position still puzzles you though.");
		output("\n\n<i>“Uhm, wasn’t the last position better-”</i>");
		output("\n\n<i>“No,”</i> the brute curtly answers. He flashes you a grin before his black tongue is giving even more lascivious licks along your [pc.vagina " + x + "].");
		output("\n\nEvery drag of that tongue feels more electric than the last, with just enough friction in the increasingly slick cunnilingus to leave you gasping. Salivating like a ravenous beast, the lizard drools a thick mixture of saliva and [pc.girlCum] from his massive jaws, your [pc.vagina " + x + "] subject to his sloppy, overzealous affections; all too soon, you begin to feel a mounting heat, your moans growing more and more wanton.");
		output("\n\nBetween heated moans, you can’t help but silently lament at being incapable of giving the titan mutual attentions from your position.");
		//pcHasTailCunt:
		if(pc.hasTailCunt())
		{
			output("\n\nThat is until you remember the [pc.tailCunts] you were dutifully keeping out of his way. Shifting [pc.oneTailCunt], you move the neglected honeypot closer to Chaurmine’s blunt head as it bobs to his movements; he seems not to notice [pc.oneTailCunt], his attention focused on your own rear-mounted pussy lips.The moment it is in reach, you launch your slit-tipped tail against Chaurmine’s lurching shaft.");
			output("\n\nYou cry out as your tail’s lips are stretched taut around the brute’s ribbed cock, while he pauses in lavishing your [pc.vagina " + x + "], instinctively thrusting <i>fast</i>, and <i>hard</i>, as his penis is wrapped in writhing bliss. You flinch, the awkward angle straining your otherwise flexible appendage and forcing the sodden lips against the lizard’s sheath, the fat cock forming a distended bulge along its length; at least it wasn’t a regular cunt.");
			output("\n\n<i>“[pc.name], ya gotta... hah, ya gotta warn me. When ya do that,”</i> he glares at you as he pants, having calmed down. He doesn’t seem keen on removing the attached orifice though, letting your sore tail-pussy suckle the onyx cunt-wrecker.");
		}
		output("\n\nYou feel slight pricks on your labia, and your heart skips a beat");
		if(pc.hasCock()) output(", [pc.cocks] lurching and smacking against your bestial belly");
		output(". Then more light poking and tugging at your tender lips - your chest heaves, struggling for breath. Once more, and the floodgates are opened; you wail as you cum, <i>hard</i>, writhing and thrashing as Chaurmine nips and bites at your labia, ");
		if(pc.isSquirter()) output("[pc.girlCum] splashing the titan’s upper body");
		else output("your [pc.girlCum] drizzling onto his snout");
		output(". You fair little better, your tauric body’s haunches drenched with a slick mixture of saliva and girl-cum from [pc.ass] to [pc.feet]");
		if(pc.hasCock()) output(" as your [pc.cum] paints your tauric tummy and Chaurmine’s bed");
		output(".");

		//pcHasTailCunt:
		if(pc.hasTailCunt())
		{
			output("\n\nYour orgasm also sets off your [pc.tailCunt] suckling and tugging at the titan’s shaft, writhing and coiling wildly around the monstrous, ribbed member as it douses his crotch in fem-cum. Chaurmine can only grunt and gasp as he’s shoved over the edge, his armored thighs quivering before giving slow, <i>hard</i> thrusts into your tail mounted slit; his fat, heavy testicles swing with every lunge, even as they pull taut, twitching with every virile pump.");
			output("\n\nThe feeling of his hot, thick seed basting [pc.oneTailCunt] leaves you breathless. His potent cream floods [pc.oneTailCunt] until trails of alabaster trickle out from around his engorged penis, your cunt-tail feeling bloated and stuffed with cum. He gives a few last token thrusts, riding out the pleasure, before tugging [pc.oneTailCunt] off of his monstrous cock, the blunt head coming out with a <i>pop</i> and a burst of potent alien seed.");
		}
		else
		{
			output("\n\nAs he’s covered in your [pc.girlCum] he reaches a hand to his own throbbing length, moaning to the feeling of his scales against the ribbed shaft. A few tugs, and he’s virtually fucking his hand, the lizard’s distended onyx cock slick with pre-cum while his fat, heavy testicles sway between his armored legs. Rising up onto his feet, he takes his shaft into a two handed grip, stroking the shaft as he brings that blunt tip to your [pc.vagina " + x + "].");
			if(pc.vaginalVirgin) output(" Chaurmine waits, looking to you for permission. It’s easily given, your lust lost face all but begging for his monstrous shaft.");
			output("\n\nYou feel as well as hear the deep growl from the brute’s chest as he a single, tip to hilt thrust into your depths, his pent up sack clenches taut to his form - though still heavy enough to wobble with every twitch - and surges thick cum through his bloated shaft; load after potent load surges into your [pc.vagina " + x + "], his virility soon gushing out from around his cock in gooey strands, the thick seed oozing down your [pc.thighs]. After a few token thrusts, he pulls out until his monstrous penis bursts out with a <i>pop</i> and a flood of seed.");
			pc.cuntChange(x,chars["CHAURMINE"].cockVolume(0));
		}

		output("\n\nApparently wanting <i>more</i>, Chaurmine makes a noise somewhere between a laugh and a snarl before plunging his hard nose forward, stretching your rear-mounted lips taut around his snout as it manages to push its way in ");
		if(!pc.hasTailCunt()) output("and force more of his hot cum to gush out");
		output(". You can only whimper and whine between hauls of air into your tensed body, twitching as the heat of another climax builds just as the last one peters out. Sloppy snuffles and snorts start coming from that massive snout as its owner breaths your feminine musk straight from the source. His jaws part, and that sinfully soft and slick tongue starts lapping at your inner walls.");
		output("\n\nAfter what feels like an eternity of ecstasy, your explosions of back to back orgasms come to a heel, allowing your thoughts to coalesce into a single consciousness once more, and you come to with a gasp. You’re still on Chaurmine’s corvette, though you’re laying on your side, and every muscle feels either exhausted or sore. A wet gurgle of a growl draws your attention behind you; a panting Chaurmine squats at your rear, watching you with a predatory patience, his snout and jaw dripping a frothy mixture of saliva and cum. You must not have been out for long at all then.");
		output("\n\nPropping yourself up on an elbow, you ignore your protesting muscles as you address the lizard, <i>“W-what the-”</i>");
		output("\n\n<i>“Like twenty, thirty seconds. Tops,”</i> he interjects between his heavy panting. Though not what you were going to ask, you accept the statement with a nod as a hand tenderly massages your raw throat.");

		processTime(30);
		pc.orgasm();
		pc.orgasm();
		if(pc.hasTailCunt()) pc.loadInCuntTail(chars["CHAURMINE"]);
		else pc.loadInCunt(chars["CHAURMINE"],x);
	}
	output("\n\nOnce the two of you have had a moment to catch your breaths, Chaurmine guides you toward the ship’s multi-person showers. On the way there, there’s something you have to ask.");
	output("\n\n<i>“So, uh, what kind of mod work did you do for a tongue like that?”</i>");
	output("\n\nHe stops to look back at you, <i>“Huh? What mods?”</i> His armored brow is raised in confusion.");
	output("\n\n<i>“Your tongue. You haven’t used any genetic modifications on it?”</i>");
	output("\n\n<i>“Uh, no... Why?”</i>");
	output("\n\nVisiting Molis suddenly sounds <i>very</i> appealing.");
	
	chaurmineRelationship(5);
	IncrementFlag("SEXED_CHAURMINE");
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ship Handjob
public function shipHandjob():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Reaching out a hand, you grasp bestial girth pulsing to the metallic titan’s powerful heartbeat. This close, his musk gets much stronger, surprisingly rich and pleasant as your breathing grows quicker. He unconsciously relaxes at your touch, letting out a barely discernable sigh as your other hand softly caresses up his ribbed penis. While your other hand massages around his sheath, you glide up the incredible length of his monstrous cock before gently clutching his thick, blunt tip. Trying to ignore the growing heat in your");
	if(pc.hasGenitals()) output(" [pc.crotch]");
	else output(" [pc.asshole]");
	output(", you pick up the pace.");

	output("\n\nMoving the grip you have at his sheath to his soft sack, you grab onto one of his large, bulging orbs, virtually too big to hold onto. At the same time, your other hand clenches his monstrous cock tightly as it starts slowly stroking, almost experimentally, up and down with increasing speed, wanting to do your best to milk this oversized lizard of his creamy prize. He relaxes further as a grunt of approval slips from his core.");

	output("\n\nHis now freely dribbling, onyx dick feels all the harder as his pre drenches his shaft and your hand, the growing mutual enjoyment sounding more and more wet while your grip slides up and down, unconsciously going faster and faster with each wet shlick. With a light gasp, you sheepishly realize you are still awkwardly fumbling with one of his oversized testes as you feel his pre slide down from his sheath and moisten your hand. Gathering more, you slather the orbs to a glistening shine as you caress and slide across the soft reptilian skin with your touch, feeling the bloated cum factories pulse in tune with his shaft in growing need.");
	output("\n\nOnce more noticing your ");
	if(pc.hasGenitals()) output("[pc.crotch]");
	else output("[pc.asshole]");
	output(" clench desperately, you cast a pleading gaze to the towering alien, only to see him staring at you imperiously; his armored snout splitting into a smug grin. As you caress and squeeze his bestial cum cannon though, secretly delighting in its ribbed length, his demeanor changes as he starts to groan and pant anew; gradually shifting from arrogance to simple indulgence. Seeing the effect you have on him, you grin playfully and decide your own needs can wait. You want to focus on the volcano of lust created from your touch laying before you.");
	output("\n\nContinuing to massage his bloated, churning, amber sack encouragingly, you move your other hand’s focus to the monstrous head of his massive cock. Wreathing the blunt, throbbing tip with your hand, you twist and jerk his glans vigorously, causing the brute to grunt and unconsciously thrust into your grip.");
	output("\n\nAfter a few moments of this, he seems to settle, only for giant armored hands to tightly grip your shoulders. As you give a surprised gasp, you shoot your eyes up to meet his glare as you lavish his manhood with your hands’ affections. His azure eyes blaze with suppressed passion as he pants heavily. His guttural breaths are interrupted as you lose your patience, writhing and grinding both hands against his glans. Tensing, he draws a deep breath as you firmly bring him over the edge.");
	output("\n\nIn the brief heartbeat before the artillery fires, you think back to your thoughts in the wastes, and how you might want to treat him again - on his own ship, too!");

	processTime(15);
	pc.changeLust(5);
	clearMenu();
	//[Gentle] It <i>is</i> his ship you’re on. And you <i>are</i> here because of your insistence. // Go to Gentleship // -5 Personality score
	//[Rough] Fuck it. It’s his ship, he’s safe. He’s a big guy. He might even appreciate a little rough handle from a familiar face. // Go to Roughship // +5 Personality score
	//[Playful] You really don’t care. You actually want to see how much of his room he’s willing to coat in gooey seed. // Go to Playfulship
	addButton(2,"Playful",playfulChaurmineHJEndingOnShip,undefined,"Playful"," You really don’t care. You actually want to see how much of his room he’s willing to coat in gooey seed.");
	addButton(1,"Rough",roughChaurmineHJFinisherOnShip,undefined,"Rough","Fuck it. It’s his ship, he’s safe. He’s a big guy. He might even appreciate a little rough handle from a familiar face.");
	addButton(0,"Gentle",gentleChaurmineHJFinisherOnShip,undefined,"Gentle","It <i>is</i> his ship you’re on. And you <i>are</i> here because of your insistence.");
}

//Gentleship
public function gentleChaurmineHJFinisherOnShip():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("You " + pc.mf("grin triumphantly","softly coo") + " as you see his cum tanks tense right before his shaft bulges with what feels like a <i>massive</i> load. Hands clutching his stone hard girth, you massage along his urethral bulge with your thumbs as he releases jet after jet of cum into the air, only for it to rain back down onto you both. You gasp as you are drenched, creamy cum washing down your [pc.hair] and [pc.face] to flow in thick rivulets down your torso.");
	output("\n\nThrough your coating of lizard jizz, you gently milk his shaft from base to tip for every last drop, the titan’s shaft twitching obscenely from your hands alone. You silently revel in his tense convulsions, his hot breath and shimmering body seeming to envelope your world in his musk as you are coated in his potent seed.");
	output("\n\nThe brute’s writhing and thrusting dissipate, though he remains tense, and occasionally twitches excitedly. With a solid grip kept on his fat cock, you focus on his cumslit with a smothering finger. Lubed by what can be little more than pre at this point, the beast practically whines and groans your name as you wreathe his incredibly sensitive tip in torturous yet blissful friction, less ejaculate emerging with each contraction. Figuring you’ll be nice, you stop your movements. But don’t let go.");
	output("\n\nYou let him ride out the last of his lengthy orgasm by his own movements; given that he hasn’t gotten too sensitive. After a few last thrusts, he seems to start to calm down, almost immediately going soft in your grip. You moan passionately as you lick his seed from your ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("face and ");
	output("lips, Chaurmine’s tired cock twitching at the sight.");
	pc.addNice(1);
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",chaurmineHJShipRecovery);
}

//Roughship
public function roughChaurmineHJFinisherOnShip():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Figuring this time there’s no point in ruining the moment, you shift your grip on Chaurmine’s alien-saur cock, and rapidly jerk your hands along the bloated shaft; one hand goes up as the other goes down, giving him a hard milking. The tin can reptile seizes and writhes violently, barking out a surprisingly canine yelp.");
	output("\n\nSmirking lightly in amusement, you manage to keep your grip on his shaft despite his contorting form. You can <i>feel</i> the pressure from all the backed up cum, the throbbing testes already full to bursting with another load as the first bulges his shaft. You’d swear the brute’s balls almost swell, bloating with two rapid orgasms and more, but maybe it was just a trick of the light.");
	output("\n\nAs his amber sack tenses intensely and seems to shrink, his ribbed shaft bulges even more. The metal behemoth’s hands claw at the air, and feet dig and tear into the ground in both incredible pain and sublime pleasure, forcing a hoarse growl from his maw as his bloated shaft fires rapid loads of thick seed onto his face and chest repeatedly, drenching him from horn to cock. As his release peaks in ferocity, you find yourself just as covered as he is, your chagrin almost causing you to miss his clenching spout of a shaft slow to a trickle.");
	output("\n\nFeeling his hot breath billow down onto you, you glance up to see him trying and failing to suppress every heave and jolt, with his eyes staring at you with a mixture of naked outrage and a drop of... arousal? As he opens his jaws as if to speak, you roughly smother his bulging urethra with a thumb, grinding the oversensitive flesh until his cock has one last powerful contraction. You grin to the feeling of his thick cum bursting around the impeding digit. His jaws reflexively slam shut at the sensation, resounding with an audible <i>snap</i> and a reverberant clang, before letting out a desperate whine.");
	pc.addHard(1);
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",chaurmineHJShipRecovery);
}

//Playfulship
public function playfulChaurmineHJEndingOnShip():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Grinning lecherously, you immediately let go of his rigid phallus to let it jerk and twitch dangerously. Hearing a frustrated growl, you lurch out of his grip before he can grasp harder and lean lower near his sack. <i>“Ohhh no, we are NOT doing this AGAIN, you FUCKER!”</i> he all but roars. Acting quickly as he bellows and he starts to shift forward, you clutch his bloated amber balls and lift, and instantly find your quarry.");
	output("\n\nLubing two fingers with the pre coating his testes, you firmly jam them into the metal giant’s puckered star, just as you feel his clawed hand grab your head. The form above you almost jumping to his feet from the penetration, feeling as if he’ll crush your fingers from his unexplored tightness and his tension. You continue your penetration of his surprisingly silky interior once he stills, though he doesn’t release his grip of your head. Wary, but not objecting. Struggling with the vice grip on your delving digits, you manage to insert both fingers to the third knuckle, wriggling around in search of that hidden lump.");
	output("\n\nYour fingers, in as far as they can go, just barely graze what has to be his prostate. This thought confirmed when you hear him moan in alien pleasure and his fat, jet-black cock jump wetly on his armored midriff. Emboldened, you force in as much of your two fingers as you can, and rapidly twitch, grind, and wriggle your fingers. The reaction is instantaneous. The light but constant fluttering against his prostate making his massive member alarmingly hard as he yelps from the sensitivity alone.");
	output("\n\nLooking up and seeing his cock jerk and throb urgently, you grasp it near the tip, and aim away from the titanic titan as you sit up and lean onto him for leverage, your fingers still fluttering wildly within his pleasant depths. As you hold his beastly cock like some sort of heavy weapon, you feel it pulse and bloat, then fire volley after volley of pent up monster cum. Most of this bombardment lands with a wet <i>thud</i> against the opposing wall and its furnishings, though a few weak throbs leak down your fingers onto his shaft. Suddenly losing your grip on the slippery willy, the onyx cock swings back up to collide against your face with a wet <i>smack</i> that echoes through the area.");
	output("\n\nMomentarily stunned, you take the next few cock blasts to the face, drenching you in the behemoth’s musky seed before you manage to retreat out of the way. Returning your slippery grip onto his shaft, you milk the last large pulse onto his chest with a resounding <i>splort</i> that you can’t help but grin devilishly to.");
	output("\n\nSatisfied, you straighten yourself as you release the brute’s cock, and caress his prostate one last time as your fingers exit his clenching depths. As the big lizard’s black dick thumps onto his torso, he groans tiredly and lets loose one last massive blast of his seed, coating himself in the musky glaze.");
	pc.addMischievous(1);
	processTime(5);
	pc.changeLust(5);
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",chaurmineHJShipRecovery);
}

//Handship Ending
public function chaurmineHJShipRecovery():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("As you wait for Chaurmine to recover, you absently clean your [pc.hands] of his rich seed, [pc.tongue] weaving and slurping around each digit. Feeling the thick virility oozing down his scales as he stands, the lizard instinctively shakes, attempting to fling as much of the sticky cum off as he can; apparently not caring about the mess already drenching his space. Chaurmine gives you an irritated glare, shoving you to the ship’s large showers.");
	IncrementFlag("SEXED_CHAURMINE");
	chaurmineRelationship(4);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ship Blowjob
//This scene should make the PC orally stuffed
public function chaurmineHJShipBeej():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");

	output("Kneeling in close, you take in the titan’s penis; a beastly member of incredible girth and intimidating length, outright equine in size. You unconsciously lick your [pc.lips] as the brute’s heat and musk surround you, unable to help yourself as you press your [pc.face] into his bloated amber sack. You let loose a moan as your own body flushes and heats up from his surprisingly rich and pleasant musk, his soft cum orbs seeming to encourage you as your [pc.face] nuzzles against the silky reptilian skin. Your [pc.tongue] darts out, but quickly finds itself repeatedly returning following the lizard’s grunts of approval. Spurred onward, you wrap as much of your [pc.lips] around each orb in turn, thoroughly tongue bathing the delightfully warm and throbbing cum factories before leaving the smooth, spit shined skin with a wet <i>pop</i>.");
	output("\n\nMaking your way upward as his captivating eyes follow your movements, you exhale onto the sheath surrounding the base of his turgid onyx shaft. As the beast rumbles in appreciation, you absently cup the churning sack below encouragingly while focusing on his sheath. Running your [pc.tongue] within the sensitive, musky flesh, you revel in the feeling of his studded skin. With a flare of his nostrils he vents a gust of hot air onto your [pc.face] as he reaches down and roughly clutches onto your [pc.hair], your hands unconsciously jumping from his amber sack to his thickly armored thighs.");
	output("\n\nRecoiling from both the heat and the sudden grip, your [pc.face] is swiftly forced back by the brute so your [pc.eyes] are locked with his own azure stars. <i>“Relax, [pc.name],”</i> he casually grumbles. You nod with what room he allows, which isn’t much, as he uses his grip on your [pc.hair] to press your lips against his ribbed onyx shaft before grinding up and down its length. When he thinks you get the idea, he lets go to let you continue at your own pace. You do so with your eyes locked together, and you masterfully lavish the brute’s thick length with your [pc.tongue] as you make your way up to his blunt tip with a juicy slurp, your gaze matching his in intensity.");
	output("\n\nWith your eyes still on his, you plant your lips just above his heavy tip, waiting for a signal to continue. A grunt comes from above, signaling you to slowly force the creature’s blunt head past your [pc.lips], having to strain your jaw to fit his bestial girth. With each ribbed inch popping past your lips and into your waiting mouth, the titanic lizard’s studded crotch grows closer and closer, giving your flattened tongue a saturated taste of his beasthood that will last.");
	output("\n\nFeeling the massive tip throbbing and drenching your gullet in pre, you stop to take a few deep breaths, casting a quick peek down as you get your bearings. When you feel another blast of hot air swirl against your head and down your back, your muscles relax and your [pc.eyes] sultrily look up to meet Chaurmine’s.");
	output("\n\nKneading your hands against his thighs");
	if(pc.tailCount > 0) output(" and swaying your [pc.tails] in anticipation");
	output(", you barely start to move down his shaft when his claws are gripping your [pc.hair] once more, forcefully shoving his heavy cock down your throat to leak pre directly into your stomach. Unfocused eyes tearing up, jaw straining as your lips are mashed against his sheath, and gag reflex completely subdued, you barely register the large brute’s pleasured grunt.");

	output("\n\nYou bring a shaking hand up to feel his ribbed dick bulging out your throat, turning you into a tempest of mixed signals and sensations as your body jerks and thrusts in both panic and arousal. Feeling your [pc.crotch] throbbing, you move your other hand down for some iota of pleasure, only for his heavily armored tail to painfully smack your hand away, denying you. With the growing need for relief, and the lack thereof, as well as your desperation for air, you writhe with his fat onyx cock impaling your throat as it throbs more and more urgently. You groan in defeat, your arms going limp, as he uses his grip on your [pc.hair] to twist your head back and forth against his sheath, something he seems to greatly enjoy as you hear him growl and rumble louder and louder. As your eyes stare vacantly at nothing, you absently hope that he’s close to cumming, consciousness slipping further and further.");

	output("\n\nJust as you’re on the edge of the abyss, you feel the titanic lizard’s grip tighten. Swiftly, but gently, pulling you up and off his thick penis, you register the ribbed shaft surging out of your throat and past your stretched [pc.lips] with an almost comical <i>pop</i>-<i>pop</i>-<i>pop</i> until his monstrous tip is all that’s left for your mouth to suckle on, then that too is pulled out with a wet squelch.");
	output("\n\nMouth gaping and limp, frothy mix of saliva and pre dripping from your [pc.lips], your airless mind spends an extended second or two in a daze, before remembering how to breathe, allowing you one messy breath as his dripping black shaft bloats from base to tip before you are roughly shoved back down to his sheath. With a muted gag and sputter, you feel pulse after pulse of thick cum blasting straight into your stomach, the behemoth above you rattling your bones with a great roar of release. Just as your body cries for more air, and you feel your belly becoming more and more distended, the brute’s fat onyx cock makes its last exodus from your gullet. He withdraws slowly, inch by slow inch, flooding every vacated space in your throat with cum until he pops out of your flooded maw. Seed pouring from your gaping mouth, you register him basting and drenching your entire torso with one last surge of beast seed. Blinded, stunned, and desperate for air, you instinctively try to inhale through cum clogged airways, causing you to cough, hack, and gag as what feels like gallons of seed pours from your gullet.");
	output("\n\nWith a wheezing gasp of breath, your throat now clear, you notice you are laying on your side - your equipment gone - as running water pours onto you. A shower. You prop yourself on an arm, coughing and sputtering up a few last dregs of frothy cum and saliva. A pair of scaled hands haul you upright, the streams of hot water scouring your [pc.skinFurScales] clean, and you find yourself face to face with Chaurmine; his azure orbs darkened with worry.");
	output("\n\n<i>“So, uhm... Are you, uh, are you alright [pc.name]? Can you stand on your own?”</i> He turns to shield you from the spraying water, the showers cascading down his massive frame with metallic pitter-patters.");
	output("\n\nYou nod, brushing a hand along your fucked-raw throat.");
	output("\n\nHis relief palpable, Chaurmine gingerly sets your [pc.feet] onto the floor, squeezing your shoulders tenderly. <i>“Sorry. Got a little rough, huh?”</i> You glare at him weakly, and his tail twitches.");
	output("\n\nFeeling quite guilty, Chaurmine insists on letting you relax in his massive showers until you are fully recovered. He sits the both of you against a wall, below the main torrent of the massive crew-sized showers but able to unwind in the hot mist, leaning you back against him ");
	//pcIsTaur // isNaga // isGooBlob // else: 
	if(pc.isTaur() || pc.isNaga() || pc.isGoo()) output("with your tauric body sprawled out to the side; his heavy tail is plopped onto your bestial side");
	else if(pc.isNaga()) output("as you wrap your [pc.feet] around the two of you");
	else if(pc.isGoo()) output("even as you absorb him into your [pc.feet]");
	else output("and awkwardly shifts his armored tail around as best he can, leaving it stiffly onto a [pc.thigh]");
	output(". The metal lizard holds you until you’re fully recovered - though it’s probably until he feels less guilty - and promptly makes sure things are in order before shepherding you off of his ship.");

	processTime(25);
	pc.changeLust(10);
	pc.loadInMouth(chars["CHAURMINE"]);
	IncrementFlag("SEXED_CHAURMINE");
	chaurmineRelationship(4);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Ship Titfuck
public function chaurmineShippyShipTitfuckyDuckyHucky():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");
	output("Remembering how much he hated loving your [pc.fullChest] gives you an idea");
	if(!pc.isChestExposed()) output(", and you strip your [pc.gear]");
	output(". Sensually cupping your [pc.chest] with both hands, you compress your tits together to amplify the cleavage. Seeing him struggle not to even peek at your chest mounds causes you to giggle, the ensuing boobquake making it all the harder on him.");
	output("\n\n<i>“I think you know the answer to that very well, a few girls I know could use something large, and throbbing to wrap around,”</i> you offer with a devilish grin, casually swaying your ensnaring cleavage from side to side.");
	output("\n\nWith an irritated growl, he snaps his eyes back to yours and sweeps an arm in a dismissive gesture, <i>“You can start by putting those...”</i> he starts to rumble, but pauses as his hand unintentionally bats a luscious boob, <i>“...those meat sacks away. As soft as they are...”</i> His apprehension all but crumbles with clashing desires.");
	output("\n\nYou roll your eyes with an agitated sigh, <i>“Oh come on, I know how much you love these. Just us here, no need to pretend,”</i> you huff.");
	output("\n\nEyeing your chest pillows with reluctant desire, he seems to come to a rather quick decision, <i>“Alright, fine, let’s use your body bags,”</i> he growls with a frown, his plated visage all the more bestial. With terms laid out, and agreements made, he proceeds to grab your shoulders and, to your delighted surprise, thrust his metal snout directly into your cleavage.");
	output("\n\nHappy to let the metal lizard lead in his amateur chest worship, you sigh as you feel an incredibly soft and wet tongue wash a breast before homing in on a ");
	if(pc.isLactating()) output("[pc.nipple], though he either ignores, or doesn’t notice your [pc.milk]");
	else output("[pc.nipple]");
	output(". With a groan, you arch your back as his intense lapping and licking continues, wanting more and more of this behemoth’s oral action. Looking down, you see a black tongue that, looking quite long, also looks incredibly canine. Shivering, you moan from the growing sensitivity of your luscious mounds. He goes on and on, adamantly cleaning the entirety of your [pc.fullChest] with longer, more insistent passion, his soft muscle a breathtaking experience. You’re almost driven to climax as you briefly fantasize about this lizard’s oral organ bathing you elsewhere.");
	output("\n\nJust as you start to relax in his grip, the metal brute virtually drops you onto your back, your luscious breasts heaving dangerously as your breath is knocked out of you. Grimacing, you look up at him with a scowl, only to be interrupted by a yelp as the titanic titan falls to his knees just above you to straddle your chest with a heavy <i>thunk</i>. As you calm down from almost having hundreds and hundreds of pounds of reptile fall upon you, you glance up to him and see his grim face marked by a slightly amused grin. Upon seeing your own less than amused look, he abruptly grabs his still solid, ribbed cock and slaps it");
	if(pc.isLactating()) output(" with a wet smack");
	output(" between your tits, sending the great swells wobbling.");

	output("\n\nNot wanting to wait for the main event much longer, you encouragingly compress your melons together to envelop the monstrous black mast weighing heavily on your torso. With this throbbing, ribbed girth nestled in boobs, he leans forward and gingerly places his fists above your head for balance, virtually shrouding your sight with the thick plates on his torso. Seems he can’t, or won’t, meet your eyes. He then begins at a rather fast pace, though whether this is from the excitement of the apparently taboo act, you don’t know. At the very least, your cleavage is already being lubed by his leaking pre, immediately giving every movement an incredibly juicy, sloppy sound.");

	output("\n\nYou moan as you feel his ribbed length slip and grind against your [pc.chest], and hear the lewd sounds of slippery friction as the big brute ruts against your chest. As he thrusts and pants, the heat from his body starts to almost feel like it’s become thicker, more oppressive. It also becomes harder to ignore the monstrous head of the creature’s member bumping and grinding against your lips and [pc.face], but as soon as you start to lick and suckle the insistent meat he stops with a growl, <i>“No, tits only. I wanna test these tanks out by themselves,”</i> he rumbles down to you, his voice vibrating pleasantly throughout your being. With an exasperated sigh you lay your head back onto the ground, though you shortly coo excitedly as he picks up the pace. As his protected thighs slap against the bottom portion of your breasts, and his soft, heavy amber sack virtually caresses your midriff, you find it hard not to writhe from the intense sensations as he uses your upper body as a cock sleeve.");

	output("\n\nAfter what feels like an eternity of being dragged along the ship’s cool floor by the beast’s rut, you feel his undulations grow more erratic as his pants and grunts are almost desperate, hot gusts of his breath billowing from above your head. His breaths and pants abruptly stop, and he thrusts through your deep cleavage once, twice, and on the third you see his shaft bloat and urethra dilate obscenely, launching load after load right below your [pc.face], directly on your chin. You groan in both ecstasy and alarm with each new coating of beast cum, your [pc.face] just as utterly drenched as your [pc.fullChest]. During this one creature bukkake you register a note of discomfort, but can’t pin it, so you shelve the thought until his ribbed onyx penis has belched its last messy load, dribbling what seed is left as it continues to clench and throb. Releasing your massive tits with a rather sloppy slurp as his shaft is freed, you manage to determine the source of the discomfort; his claws grip your shoulders tightly, as if to keep you from moving.");
	output("\n\nChaurmine’s chest heaves above your [pc.face] as he catches his breath.");
	output("\n\nShortly the he removes his claws, seeming to mean he’s recovered, as he stands with a slightly audible creak from his scales. Snorting a hot breath of what you think is gratitude down onto you, he proceeds to lumber to what can only be the ship’s showers. Talking over his shoulder as well as his thick scales let him, he rumbles, <i>“What happened here never leaves this place. No one knows what we did because it never happened. But uh... I suppose I could help you improve your... technique, if you want.”</i> He grunts dismissively, leaving you to continue gratefully breathe in the thick, musky air before promptly following him, the scandalously messy and sloppy sounds preceding you reverberating in the ship’s halls.");

	processTime(25);
	pc.applyCumSoaked();
	chaurmineRelationship(4);
	IncrementFlag("SEXED_CHAURMINE");
	pc.changeLust(10);
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Novahome Event
//Unlocks at 50% relationship, taking place in the Eastern Hangar tile just east of Steele’s ship on the Novahome
public function novahomeChaurmineGoodbyeBonus(btnSlot:int = 0):void
{
	//Removes Chaurmine from The Mess
	//Add to Eastern Hanger tile description
	output("\n\nEasily spotted among the droves of much shorter and less metallic people, you see Chaurmine standing near his corvette in the distance. He’s looking at his clunky codex, occasionally interrupted when he shoos away a few curious or grabby raskvel.");
	addButton(btnSlot,"Chaurmine",whatsNewChaurmine,undefined,"Chaurmine","Ask him what’s new.");
}

//What’s New
public function whatsNewChaurmine():void
{
	clearOutput();
	showChaurmine(true);
	author("Aullama");

	output("Curious about why he’s out here in the hangar, you make your way over to the tin lizard, ");
	if(pc.tallness < 60) output("bumping into");
	else output("almost knocking over");
	output(" a few careless raskvel as you call out to him. He doesn’t seem to notice you, remaining focused on his codex, a stern expression set on his reptilian face. Or is that his regular look? Either way, you decide to settle at roughly arm’s length distance and wait as his claws tap at the screen.");
	output("\n\nA moment later and he lowers the old device. <i>“[pc.name],”</i> he grunts, scales along his neck and shoulders lightly scraping against each other as he shifts to regard you.");
	output("\n\nYou return the greeting, and naturally ask what he’s doing out here in the hangar. ");
	//Kind // Mischievous/Bimbo // Hard/Bro
	if(pc.isBro()) output("You raise a brow; maybe he should come with you to the bar, it looks like he could use a drink");
	else if(pc.isNice() && !pc.isBimbo()) output("Your brow creases in worry; he’s not in any kind of trouble is he?");
	else if(pc.isMischievous() || pc.isBimbo()) output("An impish grin splits your [pc.face]; is he hiding something?");
	else output("You raise a brow; maybe he should come with you to the bar, it looks like he could use a drink");
	output(". This only earns you an amused snort.");

	output("\n\n<i>“What? No, just work. Reviewing some things before I head out,”</i> Chaurmine grunts, stowing his codex.");
	output("\n\nYou comment on how fortunate it is, then, that you just happened to be passing by.");
	output("\n\nThe brute nods, <i>“Yeah.”</i>");
	output("\n\nWell, he hardly seems to be in a rush. Perhaps you could strike up a conversation before he has to leave.");

	processTime(10);
	clearMenu();
	addButton(0,"Work?",chaurmineLeavingWorkTalk,undefined,"Work?","He has a job after all, huh?");
	addButton(1,"Where?",chaurmineLeavingWhere,undefined,"Where?","So where is he going?");
	addButton(2,"How Long?",chaurmineLeavingHowLong,undefined,"How Long?","How long does he think this job will take to complete?");
	addButton(14,"Leave",confessingThingsToChaurmineLeaving);
}

//Work?
public function chaurmineLeavingWorkTalk():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("With a coy smile, you remark that with how long he’s been slouching at The Mess, you were wondering if he even remembered what a paycheck was.");
	output("\n\n<i>“Heh, back when I was a freelance bodyguard, hardly knew the word,”</i> he growls dryly.");
	output("\n\nNaturally, you inquire about his current occupation.");
	output("\n\n<i>“Hunting,”</i> Chaurmine grunts simply.");

	if(pc.isBimbo()) output("\n\nYou gasp, bringing a hand to your [pc.lips] in dismay. Oh no! What does he even hunt? The poor things!");
	else if(pc.isBro()) output("\n\nYou nod in approval, offering your assistance if he ever needs it. There’s really only one thing someone like Chaurmine could be hired to hunt, after all.");
	else output("\n\nYou sigh at the vague answer, and though you already know, you ask what he’s hired to hunt.");

	output("\n\nThe lizard nods, saying, <i>“Jailbirds,”</i> with a grin.");

	if(pc.isBimbo()) output("\n\nIt dawns on you what he means by ‘hunting’. You giggle to yourself before biting your lip mischievously, and express your gratitude for people like him that help keep such rotten birds in their cages.");
	else output("\n\nYou nod. Makes sense, someone like him being a bounty hunter.");

	output("\n\nChaurmine gives a nonchalant shrug, <i>“What can I say. I enjoy it.”</i>");

	processTime(5);
	addDisabledButton(0,"Work?","Work?","You already did this.");
}

//Where?
public function chaurmineLeavingWhere():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("Is he able to tell you where he’s going? Maybe the two of you will cross paths.");
	output("\n\nChaurmine shrugs, <i>“Maybe, but I doubt it. I’m headed to the Siretta system; my mark is on one of the moons of a Jovian gas giant, at the edge of the system. I should be there in roughly fourteen hours after I depart.”</i>");
	processTime(2);
	addDisabledButton(1,"Where?","Where?","You already did this.");
}

//[How long?] How long does he think this job will take to complete? // Go to How long?
public function chaurmineLeavingHowLong():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("Sounds like quite the adventure, and you ask when the two of you might meet again.");
	output("\n\nArmored brow creasing, he gently shakes his head, <i>“I can’t tell you that. It’s classified.”</i>");
	output("\n\nSuppressing a grin into a smirk, you raise an eyebrow of your own, skepticism written on your face as you wait for his <i>actual</i> answer instead of his usual dry humor.");
	if(pc.isBimbo()) output(" Try as you might though, you can’t hold back a small giggle.");
	output("\n\n<i>“Really though, I dunno, maybe a week, probably longer if there are multiple jobs. If you </i>are<i> in that area by then, you might find me fuckin’ around on a station or something,”</i> he growls with a shrug.");
	processTime(4);
	addDisabledButton(2,"How Long?","How Long?","You already did this.");
}

//Confession
public function confessingThingsToChaurmineLeaving():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("The both of you spend a moment in companionable silence, the fluctuating crowds passing by seeming a world away. Before it can get awkward though, you mention that the two of you should be on your separate ways, and wish him luck on his mission.");
	output("\n\n<i>“Hey uh, [pc.name], wait...”</i> Chaurmine stammers before you can leave, a flicker of uncertainty in his azure eyes, <i>“Look, this isn’t the kind of thing that saurmorians say, so it’s gonna sound awkward coming from me.”</i>");
	output("\n\nLooking at him curiously");
	if(pc.isBimbo()) output(" with wide eyes");
	output(", you gesture for him to continue.");
	output("\n\nHis heavy, scaled tail twitches before he speaks up, <i>“I like you.”</i> Though you can’t see it, you can certainly feel his blush as heat visibly shimmers off his body.");
	output("\n\nThis seems to be very unusual territory for the tin lizard, as small of a confession as it may seem. How do you take this?");

	processTime(4);
	clearMenu();
	//[Like] Return his affection. // Go to Like
	addButton(0,"Like",tellChaurmineYouLikeLikeHimAndStuff,undefined,"Like","Return his affection.");
	//[Meh] Keep things simple. // Go to Meh
	addButton(1,"Meh",chaurmineFeelingsReactionMeh,undefined,"Meh","Keep things simple.");
	//[Dislike] Eww. // Go to Dislike
	addButton(2,"Dislike",dislikeChaurmine,undefined,"Eww.");
}

//Like
public function tellChaurmineYouLikeLikeHimAndStuff():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//pcIsBimbo:
	if(pc.isBimbo())
	{
		output("With a gasp, you clutch your hands over your chest, heart skipping a beat. A beatific smile quickly splits your face before letting out a squee in delight, and you bolt forward before the lizard can react, wrapping as much of his steamy, bulky form as you can into a tight hug.");
		output("\n\n<i>“I like you back big guy!”</i> you gush as you squeeze him tighter against your [pc.chest].");
	}
	//Bro/Hard:
	else if(pc.isAss() || pc.isBro())
	{
		output("A broad grin spreads across your face, and you lean over to ");
		if(pc.tallness < 84) output("clap a hand on his armored arm");
		else output("clap him on the shoulder");
		output(". You give a hot scale an encouraging squeeze.");
		output("\n\n<i>“I like you too, bro. I like you too,”</i> you say soothingly.");
	}
	//Else:
	else
	{
		output("A warm smile brightens your face as you reach over and take one of his armored hands into your own. You give a hot scale a comforting pat, which is returned with an appreciative squeeze.");
		output("\n\n<i>“I like you as well, Chaurmine,”</i> you murmur affectionately.");
	}
	output("\n\nAs if exactly what he had hoped you would say, much of his tension virtually melts off of his hulking body; though his tail sways with more energy. The brute spends a few heartbeats relishing the feeling of your [pc.skinFurScales] on his metallic scales - however much he can feel through those thick plates of armor, that is - and runs his scale-claws along your [pc.hair].");
	output("\n\nRegretfully, he shifts out of your grip with a huff. <i>“Yeah I really should be going now. Thanks, [pc.name],”</i> his voice vibrates through a soft smile on his armored snout.");
	output("\n\nThough his hot scales felt incredibly soothing, you nod silently as he turns to stomp up the ramp into his bulky ship. You sigh, the air around you immediately cooling, as you take in the lizard’s seemingly small but huge revelation.");
	output("\n\nHopefully you’ll run into him again, and soon.");
	processTime(8);
	//[Next] // Gain lover status // Increase relationship by 50% (of current)
	flags["CHAURMINE_LOVER"] = 1;
	chaurmineRelationship(Math.round(chaurmineRelationship()/2));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Meh
public function chaurmineFeelingsReactionMeh():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	//pcIsBimbo:
	if(pc.isBimbo())
	{
		output("<i>“Aww! That’s so </i>cute<i>! Haha, I bet you say that to all the girls,”</i> you laugh, waving a hand in a dismissive gesture. The brute almost looks hurt for a moment, before his armored visage becomes rather stony, and guarded.");
		output("\n\n<i>“Yeah, all the time,”</i> he growls, turning to his ship, <i>“I should head off now. Talk to ya later, [pc.name].”</i>");
		output("\n\nYou blink, befuddled at the change in his mood, only to gasp as you’re hit with the gravity of what you just said, <i>“O-oh no! I’m sorry big guy, I didn’t know that you-...”</i> You nibble on a lip, brow creasing as you wring your hands together nervously, <i>“I mean, I like you too. Just not in the same way you like </i>me<i>. I’m sorry Chaurmine...”</i>");
	}
	//Bro/Hard:
	else if(pc.isAss() || pc.isBro())
	{
		output("You give a solemn nod, deciding to be upfront with the brute. <i>“I’m gonna be frank with you, my dude,”</i> you state as you reach over and give his thick arm a squeeze, <i>“It’s cool that you feel this way, but I don’t. You’re a good friend and fuckbuddy, let’s keep it that way.”</i>");
	}
	//Else:
	else
	{
		output("You sigh, smiling softly as you regard the large lizard. <i>“Wow, Chaurmine. Um, I’m flattered, but if you’re saying what I think you’re saying... I like you as a friend, and you’re not bad in the sack, and I’d rather keep it that way, for things to be simple. I’m sorry, Chaurmine,”</i> you murmur somberly.");
	}
	output("\n\nChaurmine’s features soften, and he nods with a grunt, <i>“That’s, uh, fine by me, [pc.name]. We can keep things simple. That’s just fine.”</i> He shifts uncomfortably, scales on his neck scraping together as he looks from you to his ship; not wanting to leave, but not knowing what else to say. With an encouraging smile, you extend a hand, which he gingerly shakes with his own armored hand.");
	output("\n\nYour hands part with a heavy sigh from the metallic titan - though the breath leaves him with a confident stance - and he gives you a parting nod. With a growl, he heads up the ramp leading into his ship, looking more relieved than anything else.");
	output("\n\nThough not what his heart seemed to want, he still seems content.");

	processTime(8);
	flags["CHAURMINE_LOVER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dislike
public function dislikeChaurmine():void
{
	clearOutput();
	showChaurmine();
	author("Aullama");
	output("You grimace at his words, your displeasure obvious. It was hardly your intention to go further than a one or two night stand with this creature, and now he’s become <i>smitten</i> with you. Seeing your reaction is all Chaurmine needs, and his scaled lips pull back in a scowl, clearly not pleased.");
	output("\n\nHe swiftly turns to his ship, stomping up the ramp leading into its bowels with heavy steps. That armored tail comes close to batting into you, forcing you to take a step back before shouting after the brute.");
	output("\n\n<i>“Fuck you,”</i> is the response you get as Chaurmine disappears into his bulky ship.");
	output("\n\nWell shit. You have no idea if you’ll see the lizard again, but with that reaction, it’s doubtful you really <i>want</i> to.");

	processTime(6);
	flags["CHAURMINE_LOVER"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}