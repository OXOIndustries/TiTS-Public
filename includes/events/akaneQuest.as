import classes.Characters.ZilMale;
/* AkaneQuest: My Kingdom For A Grenade
 * 
 * Flaggy flag-flags:
 * -AKANEQUEST_STAGE:
 * 0: talked about raid
 * 1: won, grabbed gun
 * 2: won, grabbed sword
 * */

public function showRaidBust():void
{
	author("SoAndSo");
	showName("\nTHE RAID");
}
 
public function akaneHasAnExclamationMarkOverHerHeadEmail():String
{
	var mailtext:String = "To [pc.name] Steele,";
	mailtext += "\n\nMadame Akane wishes to see you. She believes that you have certain qualifications necessary for one of our endeavours. As such, we request that you come to the CelVer Storefront if and when you can.";
	mailtext += "\n\nBest Regards.";
	mailtext += "\n\n<i>Below you is a";
	if (silly) mailtext += " snapshot of Akane smiling and giving you the ‘peace’ sign like a typical tourist with ice cream in the other hand.</i>";
	else mailtext += " picture of the sales rep from the Celeritas Veritas storefront with his hand waving in the air.</i>";
	
	return mailtext;
}

public function akanequestImInButton(slot:int):void
{
	addButton(slot, "I'm In", akanequestStartTheRaid, undefined, "I'm In", "Hell yeah, you’re ready to take down some scum! Well, actually go in at their mercy... but take it all down anyway!");
}

public function akanequestRaidBriefing():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("<i>“I, uh, got the email,”</i> you say plainly, the oddly curt message repeating in your head.");
	output("\n\nAkane rests her chin on her palms with a squinty-eyed smirk.");
	output("\n\n<i>“So what do you think? I’d normally be loathe to put you in harms way but this is such an interesting fit for you… lucrative as well,”</i> she says lazily from her chair, brushing her hair aside.");
	output("\n\n<i>“Then tell me what it involves…?”</i> you shrug.");
	output("\n\nAkane turns her head to her left, whispering to Cheo. The brief exchange becomes interjected with “why didn’t you tell [pc.himHer]” and angry gestures from both of them. Clearing her throat, she turns back to you.");
	output("\n\n<i>“Follow me, [pc.name],”</i> she says sweetly, beckoning you to her as she slinks off of the chair and strides for the door to the right.");
	output("\n\nYou follow her and Cheo as they enter through the sliding entrance, a gunmetal, ship-like corridor laid out before you. Akane’s heels sound like needles against metal as she leads the way, a sprightly <i>tink-tnk</i> taking you to some unknown hidden room.");
	output("\n\nThey both turn an abrupt sharp left into another sliding door. You follow in step, taken aback by the view of what could be a ship's bridge or command center. There are agents of all kinds - masked and unmasked - at various terminals and tables, about thirteen by your reckon. In the middle of this 30 meter room is a large, oval table with a holographic display forming its surface. The whole room is shadowed and blue save for the terminal lights and central white bloom of the table itself. It stays unoccupied except for a highly detailed wireframe model of Tavros station hovering above its blank surface.");
	output("\n\nAkane strides with purpose to the center table and plants her hands on its edge. The model immediately zooms into a middle portion of the station. Is that the north side… east? You can’t quite make heads nor tails of the exact point that it’s zoomed in on. Then to make matters worse, a barrage of bullet points and obscure looking icons pop up all around it. Oh <i>joy</i>.");
	output("\n\n<i>“Now let me see… riiiight here, yes,”</i> murmurs the domme, her fingers manipulating the model with ease. She zooms even closer onto the location, the outside wireframe of the station turning into a photorealistic cutaway of the desired point: a warehouse…");
	output("\n\n<i>“There, alright. So, [pc.name]. This is one of our warehouses. Like any other, we use it to hold things and usually those things happen to be of a high value. It’s rather ordinary on the surface to the point where we don’t even lock it up that securely… but everything we ship into it is very well-sealed in appropriate containers. Something like this,”</i> she explains, swapping to an image of what seems to be a large case. It’s rectangular and of a dull silver with what looks like a sophisticated lock on the side. You could only guess as to how tough it actually is but if it’s good enough for a crime syndicate. With a quick swipe, she cycles back to the warehouse.");
	output("\n\n<i>“Beyond military grade for the items we’re moving, naturally. However, it seems a slaver ring has decided to use it for their dealing grounds. How they obtained entry isn’t the question, we already know that. What we don’t know is how compromised our stock is. It’s all hidden behind dummy walls and other tricks buuuut... some of our R&D for Celeritas Veritas find itself there and if those cretinous shits ever get their hands on that, well, I’ll get my hands on them eventually. Also yes, CelVer is actually a real company,”</i> she continues, turning to give you a look full of sass.");
	output("\n\n<i>“Of course, it’s entirely our fault in the first place that they got in at all. We doubt they port the gear needed to crack our codes and boxes but obviously, squatters will be prosecuted. We’ve been able to identify the </i>who<i> at least.”</i>");
	output("\n\nShe swipes her hand again, bringing up the image of a bulky figure in black and red Reaper IV armor. Said figure seems to be a female kaithrit, far too tall for the average and far too powerfully built for anything other than rough work. Instead of hair, her head is covered in abstract tattoos and everything from the neck down is a mixture of shiny bodysuit and hi-tech armor, some sort of shield generator on her left forearm and a foot long hilt of <i>something</i> in her right.");
	output("\n\n<i>“Name’s Petra, picked it up over the cameras. She’s filling some sort of ‘management’ role for this new cell of Black Void-affiliated slavers. Sort of like a consultant, only in armor and with the belligerence of a caged… well, large cat,”</i> she explains, spinning the model of Petra on its axis. <i>“She’s rather nasty from the sounds of things, has a predilection for young slaves... even more reason to have this whole thing removed. So we’ve got a nice tasty plan.”</i>");
	output("\n\nYou watch intently as it swings back to the warehouse.");
	output("\n\n<i>“We’ve already set ourselves up as a ‘prospective partner’ as a completely different company, ‘Sentient Acquisitions’. Our very own Mr. Shan will be handling the trade, you remember him right? The guy who escorts you when you visit?”</i>");
	output("\n\nOh <i>him</i>.");
	output("\n\n<i>“Mmhm,”</i> you nod, picturing the diminutive Shan against the monster that is Petra. <i>“Who else is involved?”</i>");
	output("\n\n<i>“Me, Cheo, some others. You’ll not recognise them in their suits, especially Cheo. Dashing rogue that he is, mhmm. Oh let’s not forget you, of course,”</i> she quickly replies, prodding a finger into your shoulder. <i>“You’re going to be the goods.”</i>");
	output("\n\nAh ri-<i>wait, wuh</i>.");
	output("\n\n<i>“Are you sure about this? Really sure?”</i> you quickly ask, rightly concerned about that little bombshell.");
	output("\n\n<i>“It’s just Plan A, just so happens to be the only plan that involves bringing you on,”</i> she shrugs. <i>“I definitely wouldn’t have asked if I didn’t think you could do this, precious…”</i>");
	output("\n\nShe pulls you to her by the shoulder for a quick peck on your cheek. Whatever protests you have seem a little less pressing all of a sudden…");
	output("\n\n<i>“We’ll have you all safe and ready on the day, don’t worry. What you’ll actually be doing is putting on a brave face while, no doubt, getting a personal inspection. Meanwhile, we’ll have them cornered under cloaks and in a perfect position to dismantle sentries. If a fight breaks out, then we’ll break </i>you<i> out too. We’ll have your weapons on hand, although there’s no accounting for a quick swap of outfit in that sort of situation. Still, that’s how it is in general terms, what do you think? Ready to get this thing into motion?”</i>");

	flags["AKANEQUEST_STAGE"] = 0;
	
	akanequestImInButton(0);
	addButton(1, "ThinkItOver", akanequestMaybeLater, undefined, "Think It Over", "You need to consider it over or prepare, whichever.");
}

public function akanequestMaybeLater():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("<i>“I can come back to it, right? I need to prepare,”</i> you say bluntly, palming over your holstered gear.");
	output("\n\n<i>“Ifff you could be quick about it, dear [pc.name]. We don’t have a lot of windows to carry this out before they might start grenading the place,”</i> she sighs, swiping back to the model of Petra. <i>“I need to be here for a little bit, show [pc.himHer] out, Cheo?”</i>");
	output("\n\nCheo lurks out from the shadows with a blindfold in hand. Well, here we go again.");
	
	addButton(0, "Leave", akanequestLeaveYouCoward, undefined);
}

public function akanequestLeaveYouCoward():void
{
	clearOutput();
	
	output("With a sigh, you stand ready and close your eyes and turn around, the blindfold then comfortably tightening around your head.");
	output("\n\nYou’re taken back through the winding maze of doors, corridors and odd angles and quickly put out onto the Tavros merchants deck.");

	addButton(0, "Exit", akaneLeave);
}

public function akanequestStartTheRaid():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("<i>“I’m ready, show me what I need to do,”</i> you say with a smile, the prospect rising inside.");
	output("\n\n<i>“Excellent, follow Cheo and he’ll help you get sorted. I’d advise letting him handle your clothes and weapons, he’ll keep the former secure and take the latter with him. He’s even got a nice little box for it all. Or a big one, depending on your pieces. See you when I see you, precious,”</i> finishes the grinning domme, With a quick yank of your arm, she gives you one last peck on the cheek and pats down your [pc.hair].");
	output("\n\nCheo comes to your side with folded arms.");
	output("\n\n<i>“Coming or what?”</i> he says through his mask. <i>“You’re <b>going</b> to follow my lead on this for it to work. Play ball or get played.”</i>");
	output("\n\nTaking the hint, you nod and allow him to show you the way.");
	output("\n\nThe two of you swiftly navigate the short corridors of the base, ending up in a well-used barracks of sorts. A large metal table with bundles of rope on top catches your eye. Ah, wait… you know what <i>that’s</i> for.");
	output("\n\nMaking sure the door is firmly shut, Cheo turns to you with his blank mask seeming to bore into your eyes.");
	output("\n\n<i>“Strip.”</i>");
	output("\n\nWith a roll of the eyes, you turn away from him and begin removing your [pc.gear].");
	if (pc.exhibitionism() > 50)
	{
		output(" You take the chance to really hammer home the shape of your [pc.ass], the dirty voyeur inside you coming out to tease the poor ausar out of his");
		if (silly) output(" srsbsnsface.");
		else output(" serious demeanour.");
		output(" The slight clearing of his throat tells you all you need to know...");
	}
	output(" A few short minutes later and with your [pc.weapon] placed onto the table, you’ve bared all to the empty room.");
	output("\n\nThe sounds of rope trailing across the table and floor alert you to what comes next. Almost on impulse");
	if (silly) output(" PLAY IT AGAIN, TOSIN");
	output(", you spread your arms out and stand straight with the expectation of getting bound up.");
	output("\n\nHe’s quick and thorough but with the same professional approach as always. It feels ever so slightly looser than what you’re used to from him but even so, you quickly find that your arms and hands essentially become useless.");
	if (pc.hasBreasts()) output(" You marvel at how the rope arrangement has very competently covered your [pc.nipples], although even this soft material is itching…");
	output("\n\nHe seems to have contained your [pc.groin] behind some sort of pouch, giving you a small modicum of dignity.");
	output("\n\n<i>“Little different this time: I’ve got a trick knot hidden");
	if (silly) output(" in my pants right now and it’s pretty big");
	else output(" underneath your arm bind");
	output(", if things get too hard then I’ll take it out from underneath and undo the bindings. You’ll need about twenty seconds to undo the arm restraints but once they’re down, this shibari arrangement shouldn’t hinder you from combat movement. Got all that?”</i> he asks flatly, tapping the side of your arms and [pc.thighs] with his fingers.");
	output("\n\nYou nod, trying to get into the mindset of bowing to somebody’s mercy once again. The tension grows ever so slightly when the blindfold comes on again.");
	output("\n\n<i>“Right, Akane’s coming to collect you. All your things will be accounted for. Better make sure you can temper fight-or-flight when and if it’s needed, right?”</i> he finishes, leaving you standing there with a heft pat on your on the shoulder.");
	output("\n\nThe door slides open behind you and you hear his footsteps muffle as it closes.");
	output("\n\nSilence.");
	output("\n\nYou shuffle forward a little to gauge your awareness, finding your [pc.legs] to be unrestricted. You judge that you could still be combat ready if your arms could be moved, despite the less-than-optimal gear needed for firefights… then again, you’re just repeating what Cheo said back to you as a way to stave off this sense of deprivation.");
	output("\n\nThe brief moment of reflection melts away as the door slides open again and the familiar <i>click-clicks</i> of Akane’s metal feet slink towards you. You turn to face the vague direction of the sounds with unsteady movements.");
	output("\n\n<i>“Ah wait wait, hold on, hold on. Just stay put, [pc.name]. I need to double check all this for authenticity,”</i> asserts the domme. Her cooling metal fingers grip and drag across your [pc.skinFurScales], smooth and caressing movements that put you at ease with what little anxiety you had.");
	output("\n\n<i>As long as she’s in control… a-anyway.</i>");
	output("\n\n<i>“Holds up good, I’d expect nothing less from him of course. Right, well, if you’d allow me,”</i> she chimes sweetly, hooking her arm under your armpit. She prompts you forward with a nudge and you both take a few steps in sync to get a feel for this awkward lack of bodily awareness.");

	addButton(0, "Here We Go", akanequestHereWeGoRaidingAgain, undefined);
}

public function akanequestHereWeGoRaidingAgain():void
{
	clearOutput();
	showRaidBust();
	
	output("You’re not exactly sure where you’re taken.");
	output("\n\nThere’s a constant murmur of low voices and rushing feet around you yet Akane never lets go of you. The surfaces of the metal floors feel odd to place your [pc.feet] on but you keep up with her all the same.");
	output("\n\nYou feel calm for the moment, knowing that you’re in safe hands. What tickles your anxiety is what happens once she lets go…");
	output("\n\nAfter what feels like half an hour of traipsing and winding through corridors, you come to an abrupt halt. The air feels cool and stale, a varying period of heat making you think that you’re standing under a row of overhanging lights.");
	output("\n\nThe blindfold pulls away over one eye.");
	output("\n\n<i>“Shh. Throughout all this, just keep as quiet and play along. Shand and Cheo will be at your side, I’ll be… around. All good?”</i> whispers a winking Akane, holding a finger to her mouth.");
	output("\n\nYou nod confidently but the growing butterflies in your gut tremble something fierce.");
	output("\n\n<i>“It’ll be over soon, precious,”</i> she grins, donning an ornate black-and-gold mask in a similar style to her agents. You watch as Akane’s form dissolves into the air right before you, the blindfold then cutting your vision again.");
	output("\n\nYou hear her steps fade and muffle into nothing and then another hand grips you by your arm.");
	output("\n\n<i>“Easy, it’s me,”</i> growls the voice of Cheo, audibly on edge. <i>“Keep in character, all this will go smoothly.”</i>");
	output("\n\nHe prompts you forward through some large opening, the mechanical sounds from above leading you to think that it’s the main entrance to the warehouse. You stumble forward with several other unseen figures to the sides of you but you remember that these must be the escorts; Shan, Cheo, Akane and some others, surely…");
	output("\n\n<i>“Hold it,”</i> booms a loud, rough female voice from across the room, the sounds of heaving armor and heavy weapons clunking together coming closer. You all stop on unison, your rope bindings pulling across your [pc.skinFurScales] uncomfortably as the force halts you.");
	output("\n\n<i>“Scan ‘em,”</i> comes the same voice and a multitimbral whirr plays out around your ears. It’s over in seconds; a fast triple-beep finalizes it.");
	output("\n\n<i>“All clean,”</i> comes another voice, male this time. <i>“Free to process.”</i>");
	output("\n\n<i>“Bring [pc.himHer] forward then, Shan,”</i> says the female voice. Probably ‘Petra’...");
	output("\n\nA different hand on your right pulls you forward gently, bringing you under another hot overhead light.");
	output("\n\n<i>“I trust that this is a suitable product, Madam Petra,”</i> comes that familiar voice of his, the charm now much thicker than what you’ve had from him before. You wince internally as you hear ‘product’.");
	output("\n\nHeavy boot prints approach you along with a cracking knuckle.");
	output("\n\n<i>“Seems aight, so far. What even are ya, hm? [pc.race]? And how much cash didja dump to look like that? Don’t matter, really. Defaulted on ya debts, get caught, ended up where you belong. Circle o’ life,”</i> comes the snarling voice, rugged yet still clearly feminine.");
	output("\n\nAn incredibly strong hand grips you by the throat!");
	output("\n\n<i>“And I bet [pc.heShe] is really regrettin’ it all. Age?”</i> continues the increasingly excited Petra.");
	output("\n\n<i>“[pc.age]*, a young one. We believe [pc.heShe] has no immediate family or friendly connections. Another number, although please ah…”</i> explains Shan. You can feel him standing in between the two of you and the hand roughly held around your throat withdraws. <i>“No touching until final purchase, yes? We would not want to sell you ‘damaged goods’.”</i>");
	output("\n\nYou internally thank Shan for his intervention; the grip on that bitch is something else! Only a little bit of pressure away from a crushed neck…");
	output("\n\n<i>“'Spose so. Alright, we’ll take ‘em off yer hands. Probably good for cutting up and putting back together again, turn [pc.himHer] into some gimp for a seedy CEO… or maybe keep ya for myself,”</i> continues the slaver, fumbling with your blindfold.");
	output("\n\nShe pulls it up just so…");
	output("\n\n<i>“Boo. Nahahaha! Ahh look at this jizz dump, barely comprehending where it is. Right, over ‘ere Shan, we’ll talk prices and all that. Gotta wait for our guy with the money to get ‘ere, we’re not into getting tracked by U.G.C.”</i>");
	output("\n\nYou hear Shan say <i>“Very well, Madam Petra”</i> and you just about spy them heading for a large table in the centre of the warehouse. With what little vision you have and having been left to stand under the spotlight with Cheo by your side, you look all over your surroundings. Where you are is cramped. A large stack of heavy duty crates stands next to your left: perfect to dash behind for cover.");
	output("\n\nYou take note of the slavers: nine or ten in total, all in black-and-red combat armor. Not quite as all-protecting as pirate suits but intimidating all the same. Most have brutal looking shotguns slung over the backs…");
	output("\n\nPetra is a mountain of a woman. 6 and a half feet by your guess, wide and maybe just a little too muscular for her bodysuit. Heavy plates cover the vital areas including a rather telling pelvic plate that juts out between her legs. She be <i>packing</i>.");
	output("\n\nIn terms of weapons, you can see a large looking hilt hanging loosely off her hip and a complex looking gauntlet on her left arm. Wonder what they could be...");
	output("\n\nCheo is… suited up? Oh and without his mask…");
	output("\n\nCompletely unrecognisable save for his tri-colored tail, a somewhat boyish faced Cheo stands next to you with folded arms. You notice his 5’’ hair is a somewhat bushy bundle of brown, white and black. Black markings adorn his eyelids like some kind of warpaint, maybe a tattoo…? Snapping back to reality a second, you can’t spot any weapons on him. How does he plan to handle this if it goes");
	if (silly) output("Trials in Tainted Space up?");
	else output("tits up?");
	output("\n\n<i>“What do I do now?”</i> you whisper to him.");
	output("\n\n<i>“Shh, keep in character,”</i> is his terse response, a quick palm brushing your blindfold back over your eyes. You sigh to yourself and silently resign to continuing the act.");
	output("\n\nYou can barely hear Shan when he’s talking. His usually cheerful and rehearsed voice has become more clinical and explanatory as he talks about prices for ‘parts’ and ‘expenses’. Petra barely says a word, sometimes a “yes” or a “no” in as blunt a manner as possible. Occasionally she says words like “extreme” and “exclusive” in relation to… something.");

	addButton(0, "Wait For It", akanequestWaaitFooorIiiit, undefined);
}

public function akanequestWaaitFooorIiiit():void
{
	clearOutput();
	showRaidBust();
	
	output("It’s several blank moments of waiting before something happens again.");
	output("\n\nA cool hand comes to rest on your left shoulder and a whispering, dreamlike voice.");
	output("\n\n<i>“Dive to the left in twenty, nineteen, eighteen...”</i> comes the whisper, your blindfold lifted for a split second. You can see the air around you faintly shimmering with stealthed bodies. You keep the count in your head, a sudden bloom of adrenaline sobering you into action.");
	output("\n\nFifteen, fourteen, thirteen…");
	output("\n\nThe main warehouse door opens abruptly with its mechanical drones. At once, everyone turns to see what’s there…");
	output("\n\nThree unconscious bodies, piled loosely on top of each other, the white lights of the warehouse district casting their shadows into the room.");
	output("\n\nEleven, ten, nine….");
	output("\n\n<i>“Fuck is this?! Where’s the case, whe- Shan?! THE HELL,”</i> shouts Petra, leaping to her feet with her eyes set to kill.");
	output("\n\nBefore your eyes, Shan and his small entourage bleed away into the background. Although they ready their weapons sharpish, the slavers can only stand in place as their targets vanish before them.");
	output("\n\nOne by one, the grunts are taken down by invisible hands. First, a brutal blow to the back of the head and then a swift disarming kick to knock the weapons away. The crunching <i>czrrrkk</i> of energy making contact with armor makes you wince.");
	output("\n\nSix, five, four…");
	output("\n\n<i>“And you! C’mere!”</i> yells the kaithrit, spinning on her feet to charge you!");
	output("\n\nThree, two, one…!");
	output("\n\nMere feet before she can reach you, a flashbang separates you and her in a burst of harsh light and sound.");
	output("\n\nYou jump to the left just in time to avoid the worst of it, the large stack of crates finally becoming useful. Cheo kneels behind you with his hands on various weapons: a hardlight dagger, those glowing knuckle things… your [pc.weapon].");
	output("\n\n<i>“Here, just try to keep her distracted or something! We’ll take the rest down first,”</i> he growls, quickly pulling apart the knot around your wrists and handing you your weapon");
	//if (s}
	output(". You jump out from behind cover with your [pc.weapon] ready!");
	output("\n\n<b>It’s a fight!</b>");
	
	akanequestConfigureFight();
	
	addButton(0, "WOO!", CombatManager.beginCombat);
}

public function akanequestConfigureFight():void
{
	var petra:AkanequestPetra = new AkanequestPetra();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(petra, new AkanequestSlaver(), new AkanequestSlaver());
	//CHECK THAT THIS WORKS THE WAY I THINK IT DOES
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, petra);
	CombatManager.victoryScene(akanequestVictory);
	CombatManager.lossScene(akanequestLoss);
	CombatManager.displayLocation("BLACK VOID\nSLAVERS!");
			
	var encText:String = "You’re fighting Petra, a slaver executive for the Black Void! Alongside are two of her slaver grunts!";
	encText += "\n\nThe towering monster of a kaithrit is clad in heavy, tight armor with the black and red design of the Void. She stands well over 6’ tall and is heavily build in muscle if her tight suit is anything to go by. A large pelvic plate hints at a little something else that’s hidden away…";
	encText += "\nIn her right hand, she carries a tri - whip that glows and crackles in neon blue light and in her left is some sort of hardlight siege-shield. The bulky hexagraphic shield is enough to cover her fully from the front when she crouches.";
	encText += "\n\nTo her side are two slaver grunts. Although not as defensively equipped as normal Black Void pirates by having lighter plated armor, they all carry aftermarket Stormbull shotguns with obvious aftermarket tinkering.";
	encText += "\n\nCurrently, they’re too blindsided to face you having been disrupted with a flashbang.";
	CombatManager.encounterText(encText);
	
}

public function akanequestVictory():void
{
	clearOutput();
	
	output("u won yay");
	//output(enemy.HP);
	
	CombatManager.genericVictory();
	
	addButton(0, "liv", akaneLeave);
}

public function akanequestLoss():void
{
	clearOutput();
	
	badEnd("u loss dud");
}
