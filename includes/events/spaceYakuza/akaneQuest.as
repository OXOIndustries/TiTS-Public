/* AkaneQuest: My Kingdom For A Grenade
 * lighterfluid is the one to blame for anything that breaks
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

public function showPetra(nekkid:Boolean = false):void
{
	author("SoAndSo");
	showName("\nPETRA, SE"); //TOO LONG?
}
 
public function akaneHasAnExclamationMarkOverHerHeadEmail():String
{
	var mailtext:String = "To [pc.name] Steele,";
	mailtext += "\n\nMadame Akane wishes to see you. She believes that you have certain qualifications necessary for one of our endeavours. As such, we request that you come to the CelVer Storefront if and when you can.";
	mailtext += "\n\nBest Regards.";
	mailtext += "\n\n<i>Below you is a";
	if (silly) mailtext += " snapshot of Akane smiling and giving you the ‘peace’ sign like a typical tourist with ice cream in the other hand.</i>";
	else mailtext += " picture of the sales rep from the Celeritas Veritas storefront with his hand waving in the air.</i>";
	
	return ParseText(mailtext);
}

public function akanequestImInButton(slot:int):void
{
	addButton(slot, "I’m In", akanequestStartTheRaid, undefined, "I’m In", "Hell yeah, you’re ready to take down some scum! Well, actually go in at their mercy... but take it all down anyway!");
}

public function akanequestRaidBriefing():void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	output("<i>“I, uh, got the email,”</i> you say plainly, the oddly curt message repeating in your head.");
	output("\n\nAkane rests her chin on her palms with a squinty-eyed smirk.");
	output("\n\n<i>“So what do you think? I’d normally be loathe to put you in harms way but this is such an interesting fit for you... lucrative as well,”</i> she says lazily from her chair, brushing her hair aside.");
	output("\n\n<i>“Then tell me what it involves...?”</i> you shrug.");
	output("\n\nAkane turns her head to her left, whispering to Cheo. The brief exchange becomes interjected with “why didn’t you tell [pc.himHer]” and angry gestures from both of them. Clearing her throat, she turns back to you.");
	output("\n\n<i>“Follow me, [pc.name],”</i> she says sweetly, beckoning you to her as she slinks off of the chair and strides for the door to the right.");
	output("\n\nYou follow her and Cheo as they enter through the sliding entrance, a gunmetal, ship-like corridor laid out before you. Akane’s heels sound like needles against metal as she leads the way, a sprightly <i>tink-tnk</i> taking you to some unknown hidden room.");
	output("\n\nThey both turn an abrupt sharp left into another sliding door. You follow in step, taken aback by the view of what could be a ship’s bridge or command center. There are agents of all kinds - masked and unmasked - at various terminals and tables, about thirteen by your reckon. In the middle of this 30 meter room is a large, oval table with a holographic display forming its surface. The whole room is shadowed and blue save for the terminal lights and central white bloom of the table itself. It stays unoccupied except for a highly detailed wireframe model of Tavros station hovering above its blank surface.");
	output("\n\nAkane strides with purpose to the center table and plants her hands on its edge. The model immediately zooms into a middle portion of the station. Is that the north side... east? You can’t quite make heads nor tails of the exact point that it’s zoomed in on. Then to make matters worse, a barrage of bullet points and obscure looking icons pop up all around it. Oh <i>joy</i>.");
	output("\n\n<i>“Now let me see... riiiight here, yes,”</i> murmurs the domme, her fingers manipulating the model with ease. She zooms even closer onto the location, the outside wireframe of the station turning into a photorealistic cutaway of the desired point: a warehouse...");
	output("\n\n<i>“There, alright. So, [pc.name]. This is one of our warehouses. Like any other, we use it to hold things and usually those things happen to be of a high value. It’s rather ordinary on the surface to the point where we don’t even lock it up that securely... but everything we ship into it is very well-sealed in appropriate containers. Something like this,”</i> she explains, swapping to an image of what seems to be a large case. It’s rectangular and of a dull silver with what looks like a sophisticated lock on the side. You could only guess as to how tough it actually is but if it’s good enough for a crime syndicate. With a quick swipe, she cycles back to the warehouse.");
	output("\n\n<i>“Beyond military grade for the items we’re moving, naturally. However, it seems a slaver ring has decided to use it for their dealing grounds. How they obtained entry isn’t the question, we already know that. What we don’t know is how compromised our stock is. It’s all hidden behind dummy walls and other tricks buuuut... some of our R&D for Celeritas Veritas find itself there and if those cretinous shits ever get their hands on that, well, I’ll get my hands on them eventually. Also yes, CelVer is actually a real company,”</i> she continues, turning to give you a look full of sass.");
	output("\n\n<i>“Of course, it’s entirely our fault in the first place that they got in at all. We doubt they port the gear needed to crack our codes and boxes but obviously, squatters will be prosecuted. We’ve been able to identify the </i>who<i> at least.”</i>");
	output("\n\nShe swipes her hand again, bringing up the image of a bulky figure in black and red Reaper IV armor. Said figure seems to be a female kaithrit, far too tall for the average and far too powerfully built for anything other than rough work. Instead of hair, her head is covered in abstract tattoos and everything from the neck down is a mixture of shiny bodysuit and hi-tech armor, some sort of shield generator on her left forearm and a foot long hilt of <i>something</i> in her right.");
	output("\n\n<i>“Name’s Petra, picked it up over the cameras. She’s filling some sort of ‘management’ role for this new cell of Black Void-affiliated slavers. Sort of like a consultant, only in armor and with the belligerence of a caged... well, large cat,”</i> she explains, spinning the model of Petra on its axis. <i>“She’s rather nasty from the sounds of things, has a predilection for young slaves... even more reason to have this whole thing removed. So we’ve got a nice tasty plan.”</i>");
	output("\n\nYou watch intently as it swings back to the warehouse.");
	output("\n\n<i>“We’ve already set ourselves up as a ‘prospective partner’ as a completely different company, ‘Sentient Acquisitions’. It’s a real company, just not ours, so hopefully they’ll take a bit of a fall here... Our very own Mr. Shan will be handling the trade, you remember him right? The guy who escorts you when you visit?”</i>");
	output("\n\nOh <i>him</i>.");
	output("\n\n<i>“Mmhm,”</i> you nod, picturing the diminutive Shan against the monster that is Petra. <i>“Who else is involved?”</i>");
	output("\n\n<i>“Me, Cheo, some others. You’ll not recognise them in their suits, especially Cheo. Dashing rogue that he is, mhmm. Oh let’s not forget you, of course,”</i> she quickly replies, prodding a finger into your shoulder. <i>“You’re going to be the goods.”</i>");
	output("\n\nAh ri-<i>wait, wuh</i>.");
	output("\n\n<i>“Are you sure about this? Really sure?”</i> you quickly ask, rightly concerned about that little bombshell.");
	output("\n\n<i>“It’s just Plan A, just so happens to be the only plan that involves bringing you on,”</i> she shrugs. <i>“I definitely wouldn’t have asked if I didn’t think you could do this, precious...”</i>");
	output("\n\nShe pulls you to her by the shoulder for a quick peck on your cheek. Whatever protests you have seem a little less pressing all of a sudden...");
	output("\n\n<i>“We’ll have you all safe and ready on the day, don’t worry. What you’ll actually be doing is putting on a brave face while, no doubt, getting a personal inspection. Meanwhile, we’ll have them cornered under cloaks and in a perfect position to dismantle sentries. If a fight breaks out, then we’ll break </i>you<i> out too. We’ll have your weapons on hand, although there’s no accounting for a quick swap of outfit in that sort of situation. Still, that’s how it is in general terms, what do you think? Ready to get this thing into motion?”</i>");

	flags["AKANEQUEST_STAGE"] = 0;
	
	akanequestImInButton(0);
	addButton(1, "Think It Over", akanequestMaybeLater, undefined, "Think It Over", "You need to consider it over or prepare, whichever.");
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
	output("\n\nThe two of you swiftly navigate the short corridors of the base, ending up in a well-used barracks of sorts. A large metal table with bundles of rope on top catches your eye. Ah, wait... you know what <i>that’s</i> for.");
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
	if (pc.hasBreasts()) output(" You marvel at how the rope arrangement has very competently covered your [pc.nipples], although even this soft material is itching...");
	output("\n\nHe seems to have contained your [pc.groin] behind some sort of pouch, giving you a small modicum of dignity.");
	output("\n\n<i>“Little different this time: I’ve got a trick knot hidden");
	if (silly) output(" in my pants right now and it’s pretty big");
	else output(" underneath your arm bind");
	output(", if things get too hard then I’ll take it out from underneath and undo the bindings. You’ll need about twenty seconds to undo the arm restraints but once they’re down, this shibari arrangement shouldn’t hinder you from combat movement. Got all that?”</i> he asks flatly, tapping the side of your arms and [pc.thighs] with his fingers.");
	output("\n\nYou nod, trying to get into the mindset of bowing to somebody’s mercy once again. The tension grows ever so slightly when the blindfold comes on again.");
	output("\n\n<i>“Right, Akane’s coming to collect you. All your things will be accounted for. Better make sure you can temper fight-or-flight when and if it’s needed, right?”</i> he finishes, leaving you standing there with a heft pat on your on the shoulder.");
	output("\n\nThe door slides open behind you and you hear his footsteps muffle as it closes.");
	output("\n\nSilence.");
	output("\n\nYou shuffle forward a little to gauge your awareness, finding your [pc.legs] to be unrestricted. You judge that you could still be combat ready if your arms could be moved, despite the less-than-optimal gear needed for firefights... then again, you’re just repeating what Cheo said back to you as a way to stave off this sense of deprivation.");
	output("\n\nThe brief moment of reflection melts away as the door slides open again and the familiar <i>click-clicks</i> of Akane’s metal feet slink towards you. You turn to face the vague direction of the sounds with unsteady movements.");
	output("\n\n<i>“Ah wait wait, hold on, hold on. Just stay put, [pc.name]. I need to double check all this for authenticity,”</i> asserts the domme. Her cooling metal fingers grip and drag across your [pc.skinFurScales], smooth and caressing movements that put you at ease with what little anxiety you had.");
	output("\n\n<i>As long as she’s in control... a-anyway.</i>");
	output("\n\n<i>“Holds up good, I’d expect nothing less from him of course. Right, well, if you’d allow me,”</i> she chimes sweetly, hooking her arm under your armpit. She prompts you forward with a nudge and you both take a few steps in sync to get a feel for this awkward lack of bodily awareness.");

	addButton(0, "Here We Go", akanequestHereWeGoRaidingAgain, undefined);
}

public function akanequestHereWeGoRaidingAgain():void
{
	clearOutput();
	showRaidBust();
	
	output("You’re not exactly sure where you’re taken.");
	output("\n\nThere’s a constant murmur of low voices and rushing feet around you yet Akane never lets go of you. The surfaces of the metal floors feel odd to place your [pc.feet] on but you keep up with her all the same.");
	output("\n\nYou feel calm for the moment, knowing that you’re in safe hands. What tickles your anxiety is what happens once she lets go...");
	output("\n\nAfter what feels like half an hour of traipsing and winding through corridors, you come to an abrupt halt. The air feels cool and stale, a varying period of heat making you think that you’re standing under a row of overhanging lights.");
	output("\n\nThe blindfold pulls away over one eye.");
	output("\n\n<i>“Shh. Throughout all this, just keep as quiet and play along. Shan and Cheo will be at your side, I’ll be... around. All good?”</i> whispers a winking Akane, holding a finger to her mouth.");
	output("\n\nYou nod confidently but the growing butterflies in your gut tremble something fierce.");
	output("\n\n<i>“It’ll be over soon, precious,”</i> she grins, donning an ornate black-and-gold mask in a similar style to her agents. You watch as Akane’s form dissolves into the air right before you, the blindfold then cutting your vision again.");
	output("\n\nYou hear her steps fade and muffle into nothing and then another hand grips you by your arm.");
	output("\n\n<i>“Easy, it’s me,”</i> growls the voice of Cheo, audibly on edge. <i>“Keep in character, all this will go smoothly.”</i>");
	output("\n\nHe prompts you forward through some large opening, the mechanical sounds from above leading you to think that it’s the main entrance to the warehouse. You stumble forward with several other unseen figures to the sides of you but you remember that these must be the escorts; Shan, Cheo, Akane and some others, surely...");
	output("\n\n<i>“Hold it,”</i> booms a loud, rough female voice from across the room, the sounds of heaving armor and heavy weapons clunking together coming closer. You all stop on unison, your rope bindings pulling across your [pc.skinFurScales] uncomfortably as the force halts you.");
	output("\n\n<i>“Scan ‘em,”</i> comes the same voice and a multitimbral whirr plays out around your ears. It’s over in seconds; a fast triple-beep finalizes it.");
	output("\n\n<i>“All clean,”</i> comes another voice, male this time. <i>“Free to process.”</i>");
	output("\n\n<i>“Bring [pc.himHer] forward then, Shan,”</i> says the female voice. Probably ‘Petra’...");
	output("\n\nA different hand on your right pulls you forward gently, bringing you under another hot overhead light.");
	output("\n\n<i>“I trust that this is a suitable product, Madam Petra,”</i> comes that familiar voice of his, the charm now much thicker than what you’ve had from him before. You wince internally as you hear ‘product’.");
	output("\n\nHeavy boot prints approach you along with a cracking knuckle.");
	output("\n\n<i>“Seems aight, so far. What even are ya, hm? [pc.Race]? And how much cash didja dump to look like that? Don’t matter, really. Defaulted on ya debts, get caught, ended up where you belong. Circle o’ life,”</i> comes the snarling voice, rugged yet still clearly feminine.");
	output("\n\nAn incredibly strong hand grips you by the throat!");
	output("\n\n<i>“And I bet [pc.heShe] is really regrettin’ it all. Age?”</i> continues the increasingly excited Petra.");
	output("\n\n<i>“20ish, a young one. We believe [pc.heShe] has no immediate family or friendly connections. Another number, although please ah...”</i> explains Shan. You can feel him standing in between the two of you and the hand roughly held around your throat withdraws. <i>“No touching until final purchase, yes? We would not want to sell you ‘damaged goods’.”</i>");
	output("\n\nYou internally thank Shan for his intervention; the grip on that bitch is something else! Only a little bit of pressure away from a crushed neck...");
	output("\n\n<i>“‘Spose so. Alright, we’ll take ‘em off yer hands. Probably good for cutting up and putting back together again, turn [pc.himHer] into some gimp for a seedy CEO... or maybe keep ya for myself,”</i> continues the slaver, fumbling with your blindfold.");
	output("\n\nShe pulls it up just so...");
	output("\n\n<i>“Boo. Nahahaha! Ahh look at this jizz dump, barely comprehending where it is. Right, over ‘ere Shan, we’ll talk prices and all that. Gotta wait for our guy with the money to get ‘ere, we’re not into getting tracked by U.G.C.”</i>");
	output("\n\nYou hear Shan say <i>“Very well, Madam Petra”</i> and you just about spy them heading for a large table in the centre of the warehouse. With what little vision you have and having been left to stand under the spotlight with Cheo by your side, you look all over your surroundings. Where you are is cramped. A large stack of heavy duty crates stands next to your left: perfect to dash behind for cover.");
	output("\n\nYou take note of the slavers: nine or ten in total, all in black-and-red combat armor. Not quite as all-protecting as pirate suits but intimidating all the same. Most have brutal looking shotguns slung over the backs...");
	output("\n\nPetra is a mountain of a woman. Six and a half feet by your guess, wide and maybe just a little too muscular for her bodysuit. Heavy plates cover the vital areas including a rather telling pelvic plate that juts out between her legs. She be <i>packing</i>.");
	output("\n\nIn terms of weapons, you can see a large looking hilt hanging loosely off her hip and a complex looking gauntlet on her left arm. Wonder what they could be...");
	output("\n\nCheo is... suited up? Oh and without his mask...");
	output("\n\nCompletely unrecognisable save for his tri-colored tail, a somewhat boyish faced Cheo stands next to you with folded arms. You notice his 5\" hair is a somewhat bushy bundle of brown, white and black. Black markings adorn his eyelids like some kind of warpaint, maybe a tattoo...? Snapping back to reality a second, you can’t spot any weapons on him. How does he plan to handle this if it goes");
	if (silly) output(" Trials in Tainted Space up?");
	else output(" tits up?");
	output("\n\n<i>“What do I do now?”</i> you whisper to him.");
	output("\n\n<i>“Shh, keep in character,”</i> is his terse response, a quick palm brushing your blindfold back over your eyes. You sigh to yourself and silently resign to continuing the act.");
	output("\n\nYou can barely hear Shan when he’s talking. His usually cheerful and rehearsed voice has become more clinical and explanatory as he talks about prices for ‘parts’ and ‘expenses’. Petra barely says a word, sometimes a “yes” or a “no” in as blunt a manner as possible. Occasionally she says words like “extreme” and “exclusive” in relation to... something.");

	addButton(0, "Wait For It", akanequestWaaitFooorIiiit, undefined, "Wait For It", (silly ? "Patience from Zhou." : "Patience wins out.") + " Wait for the signal.");
	addButton(1, "Provoke", akanequestImARebelMofo, undefined, "Provoke", "This is too slow, you think you can create a better opening for the team.");
}

public function akanequestWaaitFooorIiiit():void
{
	clearMenu();
	clearOutput();
	showRaidBust();
	
	output("It’s several blank moments of waiting before something happens again.");
	output("\n\nA cool hand comes to rest on your left shoulder and a whispering, dreamlike voice.");
	output("\n\n<i>“Dive to the left in twenty, nineteen, eighteen...”</i> comes the whisper, your blindfold lifted for a split second. You can see the air around you faintly shimmering with stealthed bodies. You keep the count in your head, a sudden bloom of adrenaline sobering you into action.");
	output("\n\nFifteen, fourteen, thirteen...");
	output("\n\nThe main warehouse door opens abruptly with its mechanical drones. At once, everyone turns to see what’s there...");
	output("\n\nThree unconscious bodies, piled loosely on top of each other, the white lights of the warehouse district casting their shadows into the room.");
	output("\n\nEleven, ten, nine....");
	output("\n\n<i>“Fuck is this?! Where’s the case, whe- Shan?! THE HELL,”</i> shouts Petra, leaping to her feet with her eyes set to kill.");
	output("\n\nBefore your eyes, Shan and his small entourage bleed away into the background. Although they ready their weapons sharpish, the slavers can only stand in place as their targets vanish before them.");
	output("\n\nOne by one, the grunts are taken down by invisible hands. First, a brutal blow to the back of the head and then a swift disarming kick to knock the weapons away. The crunching <i>czrrrkk</i> of energy making contact with armor makes you wince.");
	output("\n\nSix, five, four...");
	output("\n\n<i>“And you! C’mere!”</i> yells the kaithrit, spinning on her feet to charge you!");
	output("\n\nThree, two, one...!");
	output("\n\nMere feet before she can reach you, a flashbang separates you and her in a burst of harsh light and sound.");
	output("\n\nYou jump to the left just in time to avoid the worst of it, the large stack of crates finally becoming useful. Cheo kneels behind you with his hands on various weapons: a hardlight dagger, those glowing knuckle things... your [pc.weapon].");
	output("\n\n<i>“Here, just try to keep her distracted or something! We’ll take the rest down first,”</i> he growls, quickly pulling apart the knot around your wrists and handing you your");
	if (!pc.hasMeleeWeapon() || !pc.hasRangedWeapon()) output(" weapon.");
	else output(" weapons.");
	output(" You jump out from behind cover with your [pc.weapon] ready!");
	output("\n\n<b>It’s a fight!</b>");
	
	akanequestConfigureFight();
}

public function akanequestImARebelMofo():void
{
	clearMenu();
	clearOutput();
	showRaidBust();
	
	output("<i>“That one touched me,”</i> you say aloud, directing your gaze to where you had a peep: there’s three slavers over there, you’re sure. <i>“That one, right there.”</i>");
	output("\n\n<i>“Whassat? Thought this one was better trained, Shan,”</i> mocks Petra. <i>“If I’m gettin’ [pc.himHer], then I’m showin’ the way forward. Salvation if ya will. McGuinnugh, lovetap.”</i>");
	output("\n\n<i>“Madam, if I-”</i>");
	output("\n\n<i>“Nah, nah, you’ll get ya money Shan but I’m allowed my trial period. Forget property damage, I’ll just tip ya for insurance. McGuinnugh, gut ‘em,”</i> commands the kaithrit. Heavy steps come from your left like the pounding drums of war. What did you just star-<i><b>HRRRK</b></i>");
	applyDamage(new TypeCollection({unresistablehp: pc.HP() / 5}, DamageFlag.BYPASS_SHIELD), null, pc, "minimal");
	pc.createStatusEffect("Internal Bleeding", 15, 0, 0, 0, false, "Icon_Water_Drop", "This is going to need treatment...\n-15HP every turn.", true, 0, UIStyleSettings.gStatusBadColour);
	output("\n\nThe body of a very heavy shotgun slams into your guts, first crushing the wind from your body and then forcing your body to buckle over. The pain is unreal: just short of broken bones but there’s gonna be internal bleeding. This thought merely distracts you however.");
	output("\n\n<i>“No you DON’T,”</i> comes an aggressive, rough voice from somewhere.");
	output("\n\nWhat can only be described as the sharpest, most visceral neck snap in recent memory follows but that’s merely a trigger for the cascade of flashbangs that follows.");
	output("\n\nAll around, the air wobbles and screams with high pitched cacophony as gas, lasers and flashbang shrapnel flies above you. You’ve hit the floor and not even noticed until now what with having a hefty weight slammed into your body. Several pairs of grappling hands pull you along the ground and only stop when you yell out.");
	output("\n\n<i>“Why?! What was the point?!”</i> shouts the voice of Akane. Your blindfold is pulled away to reveal her and Cheo standing over you.");
	output("\n\nYou can only murmur a few words, too winded to string a thought out. You’ve still got your limbs: with a desperate shake, you try to free your hands.");
	output("\n\n<i>“Hang on, hang on. I guess if you’re still moving, you’re still shooting, as much as it pains me,”</i> growls Akane as she undoes your bonds. You’re barely on your feet when Cheo shoves your [pc.weapon] into your hands.");
	output("\n\n<i>“Here, just try to take her down! We’ll thin the numbers,”</i> he growls. You nod and ready yourself to face the smoke-covered tower that is Petra.");
	
	processTime(3);
	
	akanequestConfigureFight(true);
}

public function akanequestConfigureFight(provoked:Boolean = false):void
{
	//Prerpare rewards
	var playerWhip:PetraWhip;
	switch(pc.characterClass)
	{
		case GLOBAL.CLASS_ENGINEER: playerWhip = new PetraTech(); break;
		case GLOBAL.CLASS_SMUGGLER: playerWhip = new PetraSmuggler(); break;
		case GLOBAL.CLASS_MERCENARY: playerWhip = new PetraMerc(); break;
		default: playerWhip = new PetraWhip(); break;
	}
	
	var petra:AkanequestPetra = new AkanequestPetra();
	
	//Nakedificate pc
	if (!(pc.armor is EmptySlot))
	{
		petra.inventory.push(pc.armor);
		pc.armor.onRemove(pc);
		pc.armor = new EmptySlot();
	}
	
	if (!(pc.accessory is EmptySlot))
	{
		petra.inventory.push(pc.accessory);
		pc.accessory.onRemove(pc);
		pc.accessory = new EmptySlot();
	}
	
	if (!(pc.upperUndergarment is EmptySlot))
	{
		petra.inventory.push(pc.upperUndergarment);
		pc.upperUndergarment.onRemove(pc);
	}
	pc.upperUndergarment = new ShibariTop();
	
	if (!(pc.lowerUndergarment is EmptySlot))
	{
		petra.inventory.push(pc.lowerUndergarment);
		pc.lowerUndergarment.onRemove(pc);
	}
	pc.lowerUndergarment = new ShibariBottom();
	
	//Your reward is getting your things back. Go you!
	var items:Array = pc.inventory;
	pc.inventory = new Array();
	petra.inventory.push(playerWhip);
	
	//PC is an idiot
	if (provoked) CombatAttacks.applyBlind(petra, 2);
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	if (provoked) CombatManager.setHostileActors(petra, new AkanequestSlaver());
	else CombatManager.setHostileActors(petra, new AkanequestSlaver(), new AkanequestSlaver());
	//CHECK THAT THIS WORKS THE WAY I THINK IT DOES
	//UPDATE: IT DOES
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, petra);
	//Flags would be better, but...
	CombatManager.victoryScene(function():void{akanequestVictory(provoked, items)});
	CombatManager.lossScene(akanequestLoss);
	CombatManager.displayLocation("SLAVERS!");
	CombatManager.encounterTextGenerator(akanequestFightDesc);
	
	addButton(0, "WOO!", CombatManager.beginCombat);
}

public function akanequestFightDesc():String
{
	var encText:String = "You’re fighting Petra, a slaver executive for the Black Void! Alongside are two of her slaver grunts!";
	encText += "\n\nThe towering monster of a kaithrit is clad in heavy, tight armor with the black and red design of the Void. She stands well over 6’ tall and is heavily built in muscle if her tight suit is anything to go by. A large pelvic plate hints at a little something else that’s hidden away...";
	encText += "\n\nIn her right hand, she carries a tri-whip that glows and crackles in neon blue light and in her left is some sort of hardlight siege-shield. The bulky hexagraphic shield is enough to cover her fully from the front when she crouches.";
	if (CombatManager.enemiesAlive() == 3) encText += "\n\nTo her side are two slaver grunts. Although not as defensively equipped as normal Black Void pirates by having lighter plated armor, they all carry aftermarket Stormbull shotguns with obvious aftermarket tinkering.";
	else if (CombatManager.enemiesAlive() == 2) encText += "\n\nTo her side is a slaver grunt. Although not as defensively equipped as normal Black Void pirates by having lighter plated armor, he carries an aftermarket Stormbull shotgun with obvious aftermarket tinkering.";
	if (CombatManager.getRoundCount() == 1) encText += " \n\nCurrently, they’re too blindsided to face you having been disrupted with a flashbang.";
	
	return encText;
}

public function akanequestVictory(provoked:Boolean, items:Array):void {
	//You get your stuff back, yay
	var tempitems:Array = pc.inventory;
	pc.inventory = items;
	if (tempitems.length >= 1) itemCollect(tempitems);
	
	if (silly) output("\n<b>40000 Microfusion Cells Added</b>\n");
	var lust:Boolean = enemy.lust() >= enemy.lustMax();
	CombatManager.genericVictory(function():void{akanequestLoot(provoked, lust)});
}

public function akanequestLoot(wasProvoked:Boolean, lustWin:Boolean):void
{
	clearOutput();
	showAkane(false, true);
	moveTo("GAME OVER");
	
	if (lustWin) output("The over-aroused kaithrit clutches at her head as your sexual prowess somehow overrides her will to fight. She falls to her knees and then on to her hands, her weapons powering down.");
	else output("The beaten executive crumples to the ground from that last hit, her shield dissipating and her tri-whip powering down.");

	output("\n\nThinking quickly, you knock the sprawled lash away with your [pc.foot] and point your [pc.weapon] at Petra’s grimacing face.");
	output("\n\n<i>“Getchu... I’LL GETCH-”</i> growls the defeated kaithrit, lurching at you from underneath!");
	output("\n\nHer threat is cut short as she’s paused by something mid-grab.");
	output("\n\nWith a visible flicker, Akane’s stealth field powers down to reveal the disheveled mob boss gripping Petra by the back of her head. Her mechanical digits hook into the tattooed skin of the defeated exec, clearly causing her some amount of pain.");
	output("\n\n<i>“Ahh ahh ahh, no. None of that.");
	if (silly) output(" SHAME ON YOU."); 
	output(" You’re not getting <b>anywhere</b> near [pc.himHer]. For that, I think...”</i> threatens Akane through gritted teeth. <i>“I think you need to be put in your place, you mewling, frightened <b>failure</b>.”</i>");
	output("\n\nVisible mini-arcs of energy spring from her fingertips across Petra’s bald head. Her mouth hangs open to scream but it takes a good few seconds before anything more than a pitiful cry pours out. You back away, still with your weapon drawn. Best to give Akane some space...");
	output("\n\nThe first burst is over quickly. It leaves Akane grinning that telltale maniacal grin as her methods work their magic. On the other hand, it leaves Petra a wincing, gasping mess, struggling to hold herself up by her palms.");
	output("\n\n<i>“Again...!”</i>");
	output("\n\nThe second lingers for longer, Akane testing the soft limits of the defeated slaver. That pitiful cry turns into a tear-strewn scream, only interspersed by Akane’s hedonistic giggling.");
	output("\n\n<i>“Unnnff, absolutely pathetic once the shell is cracked,”</i> yells the mob boss, throwing the whimpering kaithrit back onto the ground. <i>“All the same with slavers: one sip of their own medicine and they’re vomiting all over the floor.”</i>");
	output("\n\nThe helpless Petra shudders and curls up in a state of trembling shock. Three agents come forward with their stealth fields lowered and restraints in hand; it’s only a few moments before she is bound into a complex, full-bodied rope-bind. Her muscled legs and arms bend behind her back and one knot holds it together on her spine. A pair of grav cuffs keep her hands tied and an agent puts a low-G setting on.");
	output("\n\n<i>“Orders? Where do they all go?”</i> asks one of the masked agents, lifting the large bundle of mewling cat-woman with one hand.");
	output("\n\n<i>“Ohhh, fffff, uh, U.G.C offices. Make sure Shan is in charge, he’s far too smooth for those officers to handle. Oh and send a nice note to Officer Batra, would you?");
	if (riyaOnCanada()) output(" Actually, she’s been moved, hasn’t she. Send a gift basket to the officers as well then");
	else output(" She’d appreciate all the hard work we’re doing for her");
	output(",”</i> directs a casually-toned Akane, intent on overseeing the busy cleanup work. Having seen the situation fully de-escalated, you approach her with your");
	if (!pc.hasMeleeWeapon() || !pc.hasRangedWeapon()) output(" weapon stowed away.");
	else output(" weapons stowed away.");

	if (wasProvoked)
	{
		output("\n\nSuddenly, pain hits. Not Akane’s pain, not that sort of lovingness. No, the damage done to your belly has caught up to you and you clutch your [pc.belly]. You look down to see red, purple and blue in a nasty pattern just under your stomach and dread to think of the internal damage.");
		output("\n\n<i>“Idiot [pc.boyGirl],”</i> sighs Akane, striding over to you with a medipen of some sorts in her hand. You do simply put your hands to your sides as she appraises your belly bruising, wincing and gasping as her cold, metal fingers irritate the damaged tissue.");
		output("\n\n<i>“Now now, I’ve done worse to you. I think so, anyway,”</i> she mutters, finding a particularly purple spot with the tip of the medipen. There’s a pinprick of heat as she pressed it down but the indescribable wash of cooled healing serum almost knocks you over as hard as the initial gut-smack.");
		output("\n\nIn seconds, there’s only a slight reddening in the hit area. Akane steps back with a smirk and simply tosses the medipen shell away.");
		output("\n\n<i>“Only one we’ve needed to use today,”</i> she smirks, ruffling your [pc.hair]. You get the impression that that’s going to be her way of saying thanks.");
	}
	
	output("\n\n<i>“We’re all done...? Just like that?”</i> you ask, idly fidgeting with your rope-restraint outfit. It became pretty rough against your skin in that fight...");
	output("\n\n<i>“Mmhmm, as planned.");
	if (wasProvoked) output(" Well, aside your ‘bold’ and ‘courageous’ use of derailment tactics.");
	output(" A few scuffs here and there but nothing serious. We’ve recovered our warehouse, no missing stock, no traps or unwanted obstacles. Perfect timing. I certainly couldn’t have done this without you,”</i> she appraises, cupping your chin between her fingers. <i>“So how about a little something from me, hm? We have some new tech here, perfectly functional prototypes ready for deployment and I thiiiink... you’re deserving of one. Especially with the way you handled that [pc.weapon]. Took down that waste of existence over there, too...”</i>");
	output("\n\nShe quickly strides off to an ordinary stack of silver-and-black cases, gesturing you to follow with her fingers. You do so, of course; the promise of useful tech is too much to turn down.");
	output("\n\nYou watch from her side as she separates out two similar looking cases and places them side-by-side. One is marked ‘CV-x808’ while the other is ‘CV-x1375’ in spartan lettering along the top. They’re both code-locked with a robust data pad on the seals of each. Akane only needs a few seconds to override the locks and <i>psssshhhh</i>... the smell of factory fresh materials hisses out from the boxes. Mmm, nothing like a good bit of new weapon smell!");
	output("\n\nAs the lids open, you take a gander at the items within.");
	output("\n\nOn the left is a large pistol, CV-x1375. Its smooth and svelte design belies its size, the white plating and shielding gives it a hi-tech feel and the stubby triple-barrels on the front suggest <i>serious</i> stopping power. From the looks of things, it could be some kind of obscure energy weapon.");
	output("\n\nOn the right is a hardlight sword-grip, CV-x808. Its ornate black-and-gold scheme speaks of its high value immediately and the grip looks tailor-made. The inch-wide, ovaline cross-guard is decorated with abstract gold leaf designs. You palm it over and stand taken aback by how light it feels.");
	output("\n\n<i>“So what’re you feeling, precious? More for the sword or the gun? You’ll be in good hands either way, I think these were originally meant for me but... mmmm, I’m leaning less towards either style of engagement these days.”</i>");
	
	addButton(0, "Sword", akanequestRewards, 2);
	addButton(1, "Gun", akanequestRewards, 1);
}

public function akanequestRewards(reward:int):void
{
	clearMenu();
	clearOutput();
	showAkane(false, true);
	
	flags["AKANEQUEST_STAGE"] = reward;
	
	if (reward == 2) 
	{
		output("You pick up the sword hilt and hold it forward into empty space. You examine it a little more thoroughly and find the name ‘Dancing Flashblade’ along the back of the grip. Your thumb finds the impulse trigger: a thought and a squeeze is all it takes.");
		output("\n\nIn a flash of white and a jolting <i>pisshhhhhh</i>, the blade forms from nowhere and shimmers with a gaseous light. Even fully activated, the weapon feels impossibly light in your hands, perhaps a few pounds at most. You give it a few small swings, finding that it adapts to your style fairly smoothly.");
		output("\n\nWell hey, you’ll take it!");
		output("\n\n<b>You got the Dancing Flashblade!</b>");
	}
	if (reward == 1)
	{
		output("You reach for the pistols grip and pull it up in both hands. You can tell it was the right choice as the weight takes you by surprise. You almost drop the thing back into its box! Directing it empty space, you try holding it up as you normally would with one hand. The sheer bulk and weight makes it challenging to keep up properly. Silly thing feels like lifting a cinderblock!");
		if (pc.physique() > 75 && pc.tone > 60) output(" Even with your particularly robust strength of body, holding it out in one hand for more than a minute becomes tiring.");
		output("\n\nWith two hands, the gun becomes much more manageable. Still heavy but the spread weight allows you to hold it up properly. You’d be very tempted to test fire this beast of a thing right now if you weren’t surrounded by jumpy Shukuchi agents...");
		output("\n\nStill, this must be one hell of a gun!");
		output("\n\n<b>You got the Lash Cannon!</b>");
	}
	
	output("\n\n<i>“Mmm, like it? I can already tell you’d make a better use of it than me. Not with these old hands, hmm,”</i> comments the mob boss, looking over her slender fingers. <i>“Now, go have fun. We’ll clean up here in no time and uhhh... come back to our little abode whenever you feel, precious.”</i>");
	output("\n\nAs you look over the weapons while she talks, she wraps her arms around your middle from the side and pecks you on the cheek.");
	output("\n\n<i>“Mmm, thank you for being such a good sport [pc.name]. And keep the outfit, it suits...”</i> she whispers, nuzzling your [pc.face] with her cheek. A small blush blooms under your skin and you nervously giggle as she praises your attire.");
	output("\n\n<i>“Right, go have fun! Shan will show you the way back.”</i>");
	output("\n\nAt those words, the diminutive Shan comes from the side seemingly from nowhere with a blindfold in his hand.");
	output("\n\nWell, once more isn’t going to hurt.");
	output("\n\nYou let him cover your eyes and lead you back out of this dusky warehouse section. In little time, you’re back at the ship deck!");

	addButton(0, "Nice!", akanequestBackToShip);
}

public function akanequestBackToShip():void
{
	clearMenu();
	clearOutput();
	moveTo("TAVROS HANGAR");
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	if (flags["AKANEQUEST_STAGE"] == 1) itemCollect([new LashCannon()]);
	else itemCollect([new DancingFlashblade()]);
}

public function akanequestLoss():void
{
	CombatManager.genericLoss(akanequestLossIntro);
}

public function akanequestLossIntro():void
{
	clearOutput();
	showPetra();
	
	if (pc.HP() == 0) output("You slam against the ground as that last hit makes contact. Shields and weapons power down while all around you, the agents of the Host Shukuchi are taken out one by one with electro-stunners or... a shotgun blast.");
	else output("You crumple against a wall as your own body works against you, far too plagued by its own arousal to even hold your [pc.weapon]. It gets knocked away from you, the sounds of Shukuchi agents getting picked off becoming a frightening awakening to your situation...");
	output("\n\nYou scramble for your strewn about gear, hoping for some spark of will or divine surge of something to get them to suddenly win. Akane is nowhere to be seen, neither is Cheo. That’s not your problem though...");
	output("\n\nBound in rope, prone and weaponless, you can only back against the wall as the towering kaithrit slaver rushes towards you. With her whip powered down and her hand free, she grabs you by the jaw with a vice-grip and hauls you up against the wall. It’s all done with surprising ease and you try desperately to knock her arm away... only for your fists to meet armor plating and ache from the struggle.");
	output("\n\n<i>“Eyy, don’t fret love. You’re gonna bloody love the next five weeks of ya life while we cut ya up, put ya back together again an’ set you on the straight’n’narrow, eh? Wouldn’t it be " + (silly ? "<b>laaaaaaaaaaavely</b>" : "lovely") + ",”</i> she growls in her brutish voice before chucking you into the awaiting arms of two suited slavers. A paralysing panic sets in as you realize that this is... it might just be...");
	output("\n\nQuick as anything, the two have you in cuffs and locks in seconds.");
	output("\n\n<i>“Roight. Who else we get? Who even were these fucks anyway?”</i> she barks, looking all around.");
	output("\n\n<i>“No idea, loadsa fancy tech though. Stealth fields innit. Musta wanted the warehouse like us,”</i> says one of the subordinates, his shotgun pointed at your sternum. <i>“Don’t matter in the end, this one’s prime real estate, eh Petra?”</i>");
	output("\n\nThe kaithrit nods and yanks you towards her. A medipen’s shadow flickers against the ceiling light and an exceedingly sharp pain enters your arm. It numbs almost immediately but the throbbing warmth blurs your... eyes and... sleep is... very nice idea right now...");
	
	addButton(0, "Uh...Next", akanequestLossPartII, undefined, "Uh...Next", "Weeeeeell, it’s not <i>every</i> day you get abducted by slavers. Think of it as an opportunity! A really grim one.");
}

public function akanequestLossPartII():void
{
	clearOutput();
	author("SoAndSo");
	showName("PLACEHOLDER\nNAME!");

	output("Pain.\n\nSilence.");
	output("\n\nIntermittent bursts of harsh, metal noises break the monotony of limbo.");
	output("\n\nIf it isn’t loud, uncomfortable noises then it’s a body-wide ache that keeps you ticking over. Your life is lived in darkness and sleep... you haven’t seen a proper face in a long while. Every so often, you think you can hear voices. You think you’re familiar with them but it’s impossible to say. They blur and bleed into each other eventually... maybe you were just dreaming them.");
	output("\n\nThe only constant is a shadow pain across parts of your body: face, genitals, skin, chest... you haven’t even been able to touch them to examine the damage. Throughout all this, you can’t even recall moving a muscle despite the flashes of fuzzy locations that you vaguely recall.");
	output("\n\nAll you can think of is... what next? When? Who? Where did my life go...?");

	addButton(0, "Where Is...", akanequestLossPartIII);
}	

public function akanequestLossPartIII():void
{	
	clearOutput();
	showPetra(true);
	
	output("You jerk awake, sitting yourself up.");
	output("\n\nYour eyes are tired and gummy but a few blinks clears the way.");
	output("\n\nYou look around the room...");
	output("\n\nIt’s a medium-large bedroom or guest room by the looks of things. Each surface that isn’t the floor is a mirror from corner to corner, forming a disorienting cube of objects within objects. There is no clear entrance. Along the sides are a variety of... fetish toys, bondage restraints, outfits and other related sundries. They’re placed on fancy-looking cabinets and racks, hyper-ergonomic and made of more mirrored material.");
	output("\n\nThere’s no obvious source of light but as you trace your vision along the walls, you can see gently-blooming, pinkish-white neon buried in the vertices of the ceiling.");
	output("\n\nYou catch a glimpse of someone looking in the mirror, oh wait... w-wait...");
	output("\n\nThat’s you.");
	output("\n\nIs it? It has to be.");
	output("\n\nBut it can’t be because that’s just... it’s not you!!");
	output("\n\nThe figure looking back at you has to be someone else. The skin is entirely hairless, impossibly smooth and feels like a spongy latex when you glide your fingers along it. It’s a verdant greyish-green, separated at the joints with black. The shape is entirely human: arms, legs, feet, everything. There are no fingernails, toenails or claws, just more latex. The eyes and whorish lips are a reflective black, completely devoid of color. The face is likewise smooth but androgynous... vaguely feminine but without a clear focus. Instead of hair, there’s just more smooth, green latex and... four horns, curved and planted at four corners of the head. It almost looks like some sort of natural crown if it weren’t for their oddly bovine shape. The ears are long, thin and elvish; thinking about them makes them move.");
	output("\n\nThe figure is short, no more than five or so feet. The body shape is a curvy pear with a mild, masculine width to the shoulders. Gorgeous hips, you think... grippable, flared and wide. Must be some caboose behind them.");
	output("\n\nThere’s nothing on the chest. Entirely flat, no nipples, nothing at all. And no... genitals. A blank space where something should be. You did have something there, right? Touching your pelvis feels like touching any other part of your body...");
	output("\n\n<i>Your</i> body. No way this could be you, no way! What did they do to you...?! Wher-");
	output("\n\nA hiss catches your attention and a seamless door slides open on the wall in front of you.");
	output("\n\n<i>“‘Ello, ‘ello, up and awake already, Prin?”</i> comes the rough, abrasive voice of... what was her name? Petra. A... slaver...");
	output("\n\n<i>Prin? Wuh?</i>");
	output("\n\n<i>“Puh-prin...?”</i> you stammer, taken aback by how girlish and high pitched your voice is.");
	output("\n\n<i>“Yeeeeeah, thas ya name now, innit. Didn’t have one before so I had ta give you a new one. Not my fault ya didn’t have any details on ya. What a shit show that all was,”</i> she explains. The hulking kaithrit looms closer to your bed with her fists on her hips. She’s dressed in little; a tight tank top and some camo shorts, neither of which do a good job of hiding her double D’s or her twitching bulge.");
	output("\n\n<i>“And now yer mine. ‘Ere in this club. Once I’m done with ya, the punters get a go. That’s your life now, Prin,”</i> she continues, her voice getting lower and more predatory. As she gets closer, you push yourself against the wall...");
	output("\n\n...Not like this!");
	output("\n\nQuick as a flash, she yanks something on your neck that pulls you to her, your face mere inches from hers. You peek at the mirror to see what it is: some sort of collar, one that... feels fused with your skin.");
	output("\n\n<i>“Yeeeah, how’s the feel, eh? Probably like nothing, maybe just a good hard pull. Don’t matter.”</i> The kaithrit grabs your forward pair of horns in both muscled hands and lines your face up with her bulge.");
	output("\n\n<i>“Well go on, get to work!”</i> she commands, shaking your head in her hands. You wince; not just from being shaken but by how natural your new horns feel...");
	output("\n\nIn that moment, you freeze. This isn’t right, this can’t be...!");
	output("\n\nAnother shake and you’re reconsidering angering a predator.");
	output("\n\nYou timidly tug down on Petra’s shorts, just enough to let her semi-hard package hang free over the rim. A 10 inch, nubby kaithrit cock greets you, maybe 2 and a half inches thick; two smooth testes, both the size of lemons... you almost choke at the sight of it all. But the smell... the <i>smell</i>...");
	output("\n\nWithout thinking, you grip the turgid meat in your palms and place the spiny head in your mouth. You swirl it and suck on it with just your tongue, amazed at how naturally it feels to do this and at much dexterity you have other your mouth-muscle.");
	output("\n\nThe kaithrit purrs with approval as her little polishing machine gets to work, satisfied with how quickly you’ve taken to your new role in life.");
	output("\n\nBut she’s not completely satisfied.");
	output("\n\nYou yelp as she slams her entire length down your throat! Instead of fighting it though, your body is welcoming. There’s no gag reflex. You can feel your neck flesh stretch and bulge with ease as the head ends up partway down your gullet. The spines tickling your throat send deliciously pleasurable shockwaves through your flesh and head, as if the lining inside was as sensitive as a fully aroused pussy...");
	output("\n\nYet you breathe normally through your nose like it was bypassing the blockage in your neck. Your new lips wrap like a seal around Petra’s shaft, a sphincter-tight hold that feels disturbingly natural.");
	output("\n\n<i>“Thaaat’s the stuff. Went in there and jimmied about with yer pheromone receptors so now I just gotta be standing next to you. You’re tailor made fer me...”</i> she purrs, getting used to the feeling of your handle-horns in her palms.");
	output("\n\nWith no physical resistance to stop her, she throat-fucks you on the spot with primal, aggressive need. Your view is only that of her tensing abs and the looming shadow cast by the pinkish light, the rare splatter of spit hitting her pelvis.");
	output("\n\nNever has sucking a beast of a cock felt so <i>good</i>. You’re certain your body has been wired to enjoy getting throat-fucked and when your new tongue wraps around her shaft, it too comes <i>alive</i> with pleasurable sensations.");
	output("\n\nIt’s not long before her purring turns into growls and grunts. With your lips as tight and as sensitive as they are, you feel her cock tense and twitch more and more in your mouth uni-");
	output("\n\n<i>“Nggg, fukkk!”</i>");
	output("\n\nWith one final slam, Petra dunks her shaft all the way in. An uncomfortably hot stream of her seed shoots effortlessly into your gut, the sheer heat and amount forcing your enhanced-body to the point of orgasm. You groan and moan as a full half minute passes of the kaithrit discharging herself down your hole... Your body wants this. <i>You</i> want this. You want <i>more</i>.");
	output("\n\nAs soon as she’s finished, she pulls her softening mast of your dribbling mouth-seal and roughly wipes the excess over your lips.");
	output("\n\n<i>“Perfect, jus’ fuckin’ perfect,”</i> she grunts through her teeth, still keeping your head level with her semi-hard shaft. <i>“Don’t even have to break you in... and now you’re on the clock. Let’s meet the clients.”</i>");
	output("\n\nHh - huh...?");
	
	addButton(0, "Uhh...", akanequestLossClients);
}

public function akanequestLossClients():void
{
	clearOutput();
	showPetra();
	
	output("You’re yanked by your flesh-collar from the mirrored room to a massive upper club level. The sudden noise is almost deafening but still enough for you to hear Petra command you to follow. You do so groggily, still having to get used to your remade limbs. You don’t have toes, only one single joint like a green latex sock.");
	output("\n\nShe takes you to a quieter corner, a little square seating arrangement with a bunch of johns in suits.");
	output("\n\n<i>“Service the boys, will ya?”</i> yells Petra over the music and immediately, you open your mouth on command and let your half-meter tongue roll out...");

	addButton(0, "Oh...", akanequestLossClientsII);
}

public function akanequestLossClientsII():void
{
	showBust();
	clearOutput();
	author("SoAndSo");
	showName("\nBAD END");
	
	output("That was your first night. Or day. It’s never clear what time of day it is: you only ever see the club. You live the life of Prin, the dedicated cum dump.");
	output("\n\nMost waking moments are of you servicing clients of all kinds with your mouth. Other times, it’s with your asshole, which has received similar treatment to your throat. It’s so elastic and comfortable for large insertions that, soon enough, getting fucked and blowing off random strangers is a matter of instinct and virtuosity.");
	output("\n\nYour sleeping hours are brief but thankfully so: the thought of a cock going unsucked hounds your idle hours.");
	output("\n\nOne day, you catch glimpse of a curious creature: a tall, thin woman dressed in black. Scars adorn the side of her otherwise-unmarked face and some of her body seems cybernetic. You briefly lock eyes with her in between a servicing.");
	output("\n\nThe woman sheds a single tear and strides away with her hands over her eyes.");
	output("\n\nYou think nothing of it and continue with your new life...");
	badEnd("<b>Bad End!</b>");
}