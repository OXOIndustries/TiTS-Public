/* Sera: Disco 3000 */

/*

Sex Party
Premise/Plan
*One off event. Sera gets an invite to an exclusive SnM do where there will be lots of influential modders and individuals who might be interested in investing in her business. Takes the PC along as her “partner”. 
*Crux is PC makes choices throughout night which affect how well Sera does. Well = Sera can pay off debt, can maybe involve PC in her store as a partner. Not well = She can’t, but event will unlock path to breaking Jade in future, so PC can still unscrew things.
*PC gets to keep uniform regardless. Special sex scene if Sera approached in it maybe.
*In = Influence count.

New Flags:
SERA_PARTY_INVITE				Invitation/Quest status
SERA_INFULENCE					Sera's influence score
SERA_PARTY_ATTIRE				Sera's attire throughout the event
SERA_PARTY_STAGE1				PC's attire throughout the event
SERA_PARTY_STAGE2				Greeting type
SERA_PARTY_STAGE3				Answer to Sera's issue
SERA_PARTY_STAGE4				Option chosen
SERA_PARTY_DATE					Party finished timestamp
SERA_SALARY_DATE				Date of last salary pay
SERA_SALARY_PAID				Times paid salary

*/

// Influence count
public function seraInfluence(arg:Number = 0, set:Boolean = false):Number
{
	if(flags["SERA_INFULENCE"] == undefined) flags["SERA_INFULENCE"] = 0;
	
	if(set) flags["SERA_INFULENCE"] = arg;
	else if(arg != 0) flags["SERA_INFULENCE"] += arg;
	
	return flags["SERA_INFULENCE"];
}
// Inventory space check
public function seraSexPartyCanGo():Boolean
{
	if(pc.armor is EmptySlot) return true;
	if(pc.inventory.length < pc.inventorySlots()) return true;
	return false;
}
// Costume swapping
public function seraSexPartyWearOutfit(outfit:ItemSlotClass):void
{
	if(!(pc.armor is EmptySlot))
	{
		output("\n\n");
		var oldOutfit:ItemSlotClass = pc.armor;
		oldOutfit.onRemove(pc);
		itemCollect([oldOutfit]);
		pc.armor = outfit;
		outfit.onEquip(pc);
	}
	else
	{
		pc.armor = outfit;
		outfit.onEquip(pc);
	}
	pc.createStatusEffect("Armor Slot Disabled", 0, 0, 0, 0, true, "Blocked", "Better not. Sera will have a fit.", false, 0);
}

// Intro
public function seraSexPartyIntro(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "intro":
			showSera();
			
			output("<i>“Is it alright just to talk?”</i>");
			output("\n\nSera considers you silently for a long moment, tapping her chin.");
			output("\n\n<i>“Actually, I want to talk,”</i> she says at length. <i>“I got this through the mail today.”</i> She flicks a cream-colored card on her desk over to you. It’s an old-fashioned and elaborately gilt-edged invitation made out to Sera and guest, asking her to attend an “intimate get-together” at an address in Tavros. The host’s name is...");
			output("\n\n<i>“Jarvis,”</i> you read out loud. You turn the card over before looking at your mistress skeptically. <i>“Jarvis who?”</i>");
			output("\n\n<i>“You don’t know Jarvis?”</i> Sera grips the air with her claws and stares at the ceiling in exasperation. <i>“For One’s sake [pc.name]. You don’t </i>need<i> a second name when you are one of the most influential human modders in the galaxy! He personally </i>designed<i> most of the things I’ve used on myself. I heard that he was one of the original founders of Xenogen, but he’s been working independently for years now. I met him only once, back on Earth... I’m amazed that he remembers me. I mean I don’t know why – I don’t know what he’s doing here, why he sent a card when he could have fucking e-mailed me, who else is going to be there...”</i> she’s pacing back and forth, ranting almost, gesticulating fretfully.");
			output("\n\n<i>“What are you so wound up about?”</i> you ask as gently as you can. <i>“It’s just a party, right?”</i>");
			output("\n\nIn response the succubus reaches across the counter and grips you tightly around your arms, making you stare directly into her fluorescent yellow orbs. Her nails dig into your");
			if(pc.isChestExposed()) output(" flesh");
			else if(pc.isChestExposedByArmor()) output(" [pc.upperUndergarment]");
			else output(" [pc.armor]");
			output(" as she stabs the words out through her lips. <i>“Jarvis’s get-togethers are </i>legendary<i>, pet. Every influential person who has even a passing interest in gene-mods on Tavros, and star systems for light years around, will be there. It’s a once-in-a-lifetime opportunity to make contacts, network with the real galactic elite, talk to people who could invest in this place. Make a splash. Make people know I’m here! Not to mention the </i>things<i> that are supposed to go on at these parties... S ‘n M goes with modding like a wrist in a cuff. And when the rich are interested in S ‘n M...”</i> Her grip thankfully loosens as her eyes glaze over a bit.");
			output("\n\n<i>“So you will be going then, mistress?”</i> you prompt. Sera’s eyes focus back on you and she smirks.");
			output("\n\n<i>“With a guest, dear. With a guest who is going to show supreme gratitude for my generosity. Nothing says up-and-coming modder like a well-behaved, presentable bitch on a leash. You won’t even have to worry about a costume. I’ve got that sorted out...”</i> She laughs to herself, before going on more soberly. <i>“We only get one chance at this, [pc.name]. This is the biggest opportunity I will ever have to get the kind of contacts that could put this place on a secure financial footing, and everything we do and say with these people could make a difference. Jarvis won’t be here for long – it’s likely this is the only party he’ll be throwing on Tavros. So if you want to go prepare or primp or whatever, go ahead and do it. I can wait.”</i>");
			
			processTime(10);
			
			// [Jardi?] [Not Yet] [Let’s Go]
			clearMenu();
			addButton(0, "Let’s Go", seraSexPartyIntro, "party");
			addButton(1, "Not Yet", seraSexPartyIntro, "not yet");
			addButton(2, "Jardi?", seraSexPartyIntro, "jardi");
			break;
		// Jardi?
		case "jardi":
			showSera();
			
			output("<i>“What about Jardi?”</i> you ask. <i>“Couldn’t she go?”</i>");
			output("\n\n<i>“The invitation is only for two, and she works most nights,”</i> Sera replies. She gazes at you levelly, a small, knowing grin twitching her lips. <i>“I also got to think about... cachet. Which do you think is going to look more impressive as a conquest: A small, white church-mouse of a rahn, or the " + pc.rawmfn("son", "daughter", "offspring") + " of Fuck Rogers?”</i>");
			
			processTime(1);
			
			addDisabledButton(2, "Jardi?", "Jardi?");
			break;
		// Not Yet
		case "not yet":
			showSera();
			
			output("<i>“I’m not ready to do that,”</i> you say. <i>“Can you give me a bit?”</i>");
			output("\n\n<i>“Don’t make me regret inviting you by taking fucking forever,”</i> your mistress growls, picking at the counter with her strong nails. She’s a bundle of fidgety, tetchy nerves. You should probably try and hurry up if only to stop her picking apart the shop in agitation.");
			
			// [Party] option added to Talk options
			flags["SERA_PARTY_INVITE"] = 0;
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		// Party
		case "party":
			showSera();
			
			output("<i>“You finally ready?”</i> Sera gazes at you, twiddling with her collar. <i>“Remember: we only get one shot at this. I don’t want this party ruined because you’re about to birth space eels or whatever.”</i>");
			
			flags["SERA_PARTY_INVITE"] = 1;
			
			processTime(1);
			
			// [Let’s Go] [Not Yet]
			clearMenu();
			if(seraSexPartyCanGo()) addButton(0, "Let’s Go", seraSexPartyIntro, "lets go");
			else addDisabledButton(0, "Let’s Go", "You Can’t...", "Your inventory is looking quite full. Try putting some things in storage before trying this.");
			addButton(1, "Not Yet", seraSexPartyIntro, "not yet");
			break;
		case "lets go":
			showSera();
			
			// Prevent huge lust boost before the event!
			var lustTemp:Number = pc.lustRaw;
			
			//Time set to 19:00
			var nHours:Number = (18 - hours);
			var nMinutes:Number = (60 - minutes);
			if(nHours < 0) nHours = ((-1 * nHours) + 18);
			processTime((nHours * 60) + nMinutes);
			
			output("<i>“I’m ready for anything,”</i> you grin.");
			output("\n\n<i>“You better be. Come back here.”</i> You follow Sera’s flicking tail and pertly bouncing butt into the back.");
			output("\n\nSera has the house lights on in her back room. Denuded of its shadowy, spacey atmosphere it’s reduced to a disheveled bedroom: A chaos of clothes, makeup and various bottles and jars half-filled with odd-looking ointments and oils. She steps over to her wardrobe and begins to rummage around in it.");
			output("\n\n<i>“I can’t decide what to wear,”</i> she mutters. <i>“I do envy subs sometimes – making decisions can be a fucking nightmare.”</i>");
			output("\n\n<i>“What have you--?”</i> you begin. She points at the door without turning around. You turn around to look at what’s hanging there. It takes you a moment to discern exactly what the costume is.");
			
			if(pc.lustRaw > lustTemp) pc.lustRaw = lustTemp;
			
			// [School Girl] [Butler]
			clearMenu();
			addButton(0, "School Girl", seraSexPartyStage1, "schoolgirl", "School Girl", "Skirt, blouse, knickers – your mistress thought of everything.");
			addButton(1, "Butler", seraSexPartyStage1, "butler", "Butler", "It looks tight and distinctly truncated.");
			break;
	}
}

// Stage 1
public function seraSexPartyStage1(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	
	switch(response)
	{
		case "none":
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		// Let’s Go
		case "butler":
		case "schoolgirl":
			showSera();
			// Butler
			if(response == "butler")
			{
				output("You touch the fabric of the costume, tracing the cut of it, feeling your heart beat faster. You know that the essential idea of a butler is that they should look dignified at all times – looking at this, you know the exact opposite is going to be true.");
				output("\n\n<i>“You’d better be in that by the time I turn around,”</i> your mistress says coolly, examining a hat.");
				output("\n\nAfter gathering yourself a bit, you get to it. You remove your [pc.gear] and lay the laden dress hanger on the bed. First comes the thin, white shirt. You won’t have to worry about the cotton chafing your [pc.nipples]; the garment has a gaping square hole cut in the center of it, so that your abdomen and [pc.chest] will be bared to the air at all times. Sera provided pasties, at least - small, white circular ones. They and the fabric on your arms and back cling closely to your skin, shifting when you move, constantly reminding you of their presence.");
				// PC biped:
				if(pc.isBiped())
				{
					output("\n\nThe next item will be every bit as tight, but at least – you test the elastic of the white, barely-there thong – it will stretch a bit. You step into them and carefully slide them up your [pc.legs] until the cup is snug on your [pc.crotch], the line on your [pc.butt].");
					output(" Next, you pull on the neatly creased black trousers, buttoning them up, feeling the way they cling to your [pc.hips] and calves with a few careful steps. It comes as no surprise to you that the seat is cut out; you know without looking that your butt looks like you are wearing nothing at all, thong or no thong. The knowledge does not stop a thrill chilling its way through you as you consider yourself in the room’s full length mirror.");
				}
				// PC Naga/Drider:
				else if(pc.isNaga())
				{
					output("\n\nThe next item will be every bit as tight, but at least – you test the elastic of the white, barely-there thong – it will stretch a bit. You unclip the arms and carefully thread the crotch through the gap between your [pc.hips], fastening it up again so that the cup is snug on your [pc.crotch], up to the line on your [pc.butt].");
				}
				output("\n\nSera sits herself down behind you and applies the finishing touch; fastens the white collar around your neck and then tightens it, straightening the black bow tie primly. She considers the final product with you in the mirror, her grin widening as she drinks in the vision she’s created, and your cheeks burn as the all-consuming simmer of emotions you so often feel around Sera engulfing you; deep embarrassment, shameless arousal, submissive bliss at causing your sadistic mistress pleasure.");
				output("\n\n<i>“I thought I’d done enough to mark you out from the actual servants that are going to be there, but maybe I haven’t,”</i> she breathes. <i>“You’re pretty damn convincing. Maybe we’re going to have to do a few training lessons here, to make sure I can pick you out at the end. Make sure you’ve got a sweeter, softer mouth than any random waiter I could pick up. You’d like that, wouldn’t you? I could grip your hair and call you Jeeves...”</i> With visible effort, she stops her hand sinking downwards. <i>“...later, maybe. There will be time later...”</i> She takes a deep breath and then gestures irritably at the pile of clothes she’s created on her side of the bed. <i>“I can’t decide. What do you think I should wear?”</i> Flattered and vaguely confused by her asking your opinion, you consider the outfits she’s laid out with as clear a mind as you can.");
				
				output("\n\n<b>You are wearing a sexy butler costume. Equal parts ridiculous to slutty, it consists of a waistcoat and smart white shirt with the front cut out, white pasties plastered over your [pc.nipples], a black bow tie");
				if(pc.isBiped()) output(", a tight pair of black trousers with the seat cut out");
				output(", and a white thong.</b>");
				
				processTime(15);
				pc.changeLust(5);
				
				// Logistics
				// PC now wearing “Butler Costume”. Cannot take it off until night over.
				// PC attempts to take it off: Better not. Sera will have a fit.
				seraSexPartyWearOutfit(new ButlerCostume());
			}
			// School Girl
			if(response == "schoolgirl")
			{
				output("Your heart flutters a bit. Of course.");
				// PC hair shorter than shoulder-length:
				if(!pc.canStyleHairType() || pc.hairLength < 6)
				{
					output("\n\n<i>“Rub this into your scalp.”</i> You switch your attention back to Sera just in time to catch the unmarked plastic bottle she throws at you. You pool the cool, oozing liquid it contains into one hand and sniff it gingerly. Shampoo? Some kind of hair dye? The succubus raps the side of the bed impatiently and quickly you do as she asks, working the stuff into your [pc.hair]. Instead of forming a lather it sinks right into your scalp, making your whole head feel like it’s glowing with coolness. You jerk slightly as a prickly sensation works its way into");
					if(!pc.canStyleHairType()) output(" your hair, warping and changing its form");
					else output(" your hair roots, your follicles sprouting inches of new growth");
					output(". By the time the top of your head stops feeling like a hundred frosty ants are crawling over it you can’t actually see. You brush the hair out of your eyes to gaze dubiously at Sera, who is looking satisfied at the lush [pc.hairColor] mop she’s made you grow out.");
					output("\n\n<i>“You should keep it");
					if(!pc.canStyleHairType()) output(" like that");
					else output(" that length");
					output(", you know; much cuter. Easier to hold onto, too.”</i> She turns back to her own clothes.");
					
					if(!pc.canStyleHairType()) pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
					if(pc.hairLength < 6) pc.hairLength = 6 + rand(4);
				}
				// PC has beard:
				if(pc.hasBeard())
				{
					output("\n\n<i>“Stay still.”</i> Before you can react Sera has closed in on you and pressed some sort of thick, creamy paper against your chin and jaw. It’s sticky, clinging readily to your face. Wax? Oh God. She leers at you toothily. <i>“This stings.”</i> Rrrrrrrrrrrrrip. Yes. Yes it does. You howl in pain as, with one curt movement, Sera pulls every follicle of hair on your face off. <i>“God, I love that sound,”</i> the demon sighs. She tuts impatiently as you flinch away from her, touching the bare, smooth");
					if(pc.hasFur()) output("er");
					output(" [pc.skinNoun] on your cheeks and around your [pc.lips], hissing at how sensitive it feels. <i>“Don’t grow bum fluff that doesn’t suit you if you don’t want me to do it, then! Here...”</i> she throws a bottle of moisturizer at you. <i>“That’ll keep you silky and hairless, like a good bitch boy should be.”</i> Carefully you rub it into your burning skin. It does soothe it a bit, at least.");
					
					pc.removeBeard();
				}
				// {merge}
				output("\n\n<i>“You’d better be in that by the time I turn around,”</i> your mistress says coolly, examining a hat.");
				output("\n\nAfter gathering yourself a bit, you get to it. You remove your [pc.gear] and lay the laden dress hanger on the bed. First comes the thin, white, cotton blouse; it’s tight on your [pc.chest] and just by shifting around a bit you can tell it’s going to keep your [pc.nipples] tender and");
				if(InCollection(pc.breastRows[0].nippleType, [GLOBAL.NIPPLE_TYPE_DICK, GLOBAL.NIPPLE_TYPE_NORMAL])) output(" erect");
				else output(" engorged");
				output(" all night long.");
				
				var worePanties:Boolean = false;
				
				// PC biped:
				if(pc.isBiped())
				{
					output("\n\nThe next item will be every bit as tight, but at least – you test the elastic of the white, frilled panties with the word “SLUT” embroidered in tasteful pink on the seat – it will stretch a bit. You step into them and carefully slide them up your [pc.legs] and until they are snug on your [pc.crotch] and [pc.butt].");
					
					if(pc.hasGenitals()) worePanties = true;
				}
				// PC Naga/Drider:
				else if(pc.isNaga())
				{
					output("\n\nThe next item will be every bit as tight, but at least - you test the elastic of the white, frilled panties with the word “SLUT” embroidered in tasteful pink on the seat – it will stretch a bit. You unclip the arms and carefully thread the crotch through the gap between your [pc.hips], fastening it up again so that the panties are snug on your [pc.crotch] and [pc.butt].");
					
					if(pc.hasGenitals()) worePanties = true;
				}
				if(worePanties)
				{
					output(" The letters on your backside feel like they are burning onto your skin and ");
					if(pc.hasCock()) output("[pc.eachCock] hardens against");
					else output("[pc.eachVagina] beads onto");
					output(" the silky material");
					if(pc.totalGenitals() == 1) output(" it is");
					else output(" they are");
					output(" now closely filmed in as you look down at it. You have to stifle a small whimper; the teasing fabric seems to cause you a small feedback loop of arousal,");
					if(pc.hasVagina()) output(" the slicker your mons and more engorged your [pc.clits], the closer the panties cling and shift over them");
					else
					{
						output(" the stiffer your boy clit");
						if(pc.cockTotal() != 1) output("s");
						output(", the closer the panties cling and shift over");
						if(pc.cockTotal() == 1) output(" it");
						else output(" them");
					}
					output(".");
					if(pc.isBiped()) output(" Carefully you pull on the knee high socks and plimsolls provided, trying to take your mind off it.");
					
					if(pc.isBimbo() && !pc.hasPerk("Slut Stamp"))
					{
						// Create Tramp Stamp
						output("\n\n(<b>Perk Gained: Slut Stamp</b> - Wearing any form of clothing that dresses your lower body will increase your libido as long as you have genitals to be aroused by.)");
						// Slut Stamp
						// v1: Libido bonus (for wearing lower clothes)
						// v2: Min Libido bonus
						// v3: Max Libido bonus
						pc.createPerk("Slut Stamp", 10, 10, 10, 0, "A tattoo permanently emblazoned above your ass makes you horny faster while wearing anything clothing your lower body.");
					}
				}
				output("\n\nYou unclip the crucial piece of your party wear from the hanger and carefully fasten it around your waist. As with everything else, Sera has deliberately chosen a size too small for you; the short plaid skirt will bounce and bob merrily over your");
				if(pc.isBiped()) output(" [pc.butt]");
				else output(" [pc.lowerBody]");
				output(", but it won’t come close to fully covering it");
				if(pc.isTaur() || pc.isDrider()) output("... not that you could help it anyway");
				output(".");
				if(worePanties) output(" Nor the word emblazoned on it.");
				output(" You sit down, feeling hot, shamefully aroused in this tight, ludicrous uniform. Distracted, you don’t even realize what the little blobs of color still remaining on the rack are until Sera sits down behind you, plucks them off, and takes a handful of your [pc.hair] at the back.");
				output("\n\n<i>“Aaaand... there we go,”</i> she murmurs as she uses the two scrunchies to give you matching pigtails. She gets up and takes you in from the front. Your cheeks burn as she breaks out into a huge smile at the vision she’s created, that all-consuming simmer of emotions you so often feel around Sera engulfing you; deep embarrassment, shameless arousal, submissive bliss at causing your sadistic mistress pleasure.");
				
				output("\n\n<i>“Yesssss, that’s it,”</i> she breathes, stroking a nipple. <i>“Look down and blush, </i>be<i> the naughty little schoolgirl. Feel the guilt. You deserve to be punished, don’t you? Oh, that takes me back. I want to cane you and then nail you and then cane and nail you some more until you’re begging me to stop...”</i> With visible effort, she stops her hand sinking downwards. <i>“...later, maybe. There will be time later...”</i> She takes a deep breath and then gestures irritably at the pile of clothes she’s created on her side of the bed. <i>“I can’t decide. What do you think I should wear?”</i> Flattered and vaguely confused by her asking your opinion, you consider the outfits she’s laid out with as clear a mind as you can.");
				
				output("\n\n<b>You are wearing a schoolgirl costume - although you sincerely hope no <i>actual</i> schoolgirl dresses like this. It consists of a thin, clinging white blouse, a frilly pair of white knickers with the word SLUT emblazoned in pink on the seat,");
				if(pc.isBiped()) output(" knee-high socks and plimsolls,");
				output(" and a short plaid skirt one size too small for you. To compound all this, your [pc.hairNoun] has been drawn up into bobbing pigtails.</b>");
				
				pc.hairStyle = "pigtails";
				
				processTime(15);
				pc.changeLust(5);
				
				// Logistics
				// PC now wearing “Schoolgirl Costume”. Cannot take it off until night over.
				// PC attempts to take it off: Better not. Sera will have a fit.
				seraSexPartyWearOutfit(new SchoolgirlCostume());
			}
			
			flags["SERA_PARTY_STAGE1"] = response;
			
			// [As you are] [Casual] [Business] [Evening Dress]
			clearMenu();
			addButton(0, "As You Are", seraSexPartyStage1, "corset", "Her Usual Attire", "In her shop garb Sera is practically naked, her corset and various belts and straps serving only to brazenly frame her considerable assets to their best advantage.");
			addButton(1, "Casual", seraSexPartyStage1, "jeans and blouse", "Casual Attire", "A clean, simple pair of jeans and white blouse.");
			addButton(2, "Business", seraSexPartyStage1, "business suit", "Business Attire", "A smart suit, button-up shirt and knee-length skirt ensemble.");
			addButton(3, "Evening Dress", seraSexPartyStage1, "dress", "Evening Wear", "A long, slinky black dress.");
			break;
		case "corset":
		case "jeans and blouse":
		case "business suit":
		case "dress":
			showSera();
			
			if(response == "corset")
			{
				output("<i>“Go as you are,”</i> you suggest. <i>“This is an S ‘n M do, right? You’ve got it, flaunt it.”</i> ");
				output("\n\nSera considers this with a frown.");
				output("\n\n<i>“Yeah, I guess you’re right,”</i> she says, sliding a hand down the curve of her waist to touch the buckles of her imposing thigh-highs. <i>“Wouldn’t be all that comfortable wearing anything different anyway.”</i>");
				
				// In +20
				seraInfluence(20);
			}
			if(response == "jeans and blouse")
			{
				output("<i>“Go in those,”</i> you say, indicating a pair of jeans and a plain blouse. Sera looks at you incredulously.");
				output("\n\n<i>“You fucking serious?”</i>");
				output("\n\n<i>“Everyone there’s going to be dressed to the nines. This’ll make you stand out,”</i> you reason. <i>“Look like you don’t care about anyone’s superficial opinion of you. People will want to know who you are.”</i> ");
				output("\n\nSera thinks about this with a frown.");
				output("\n\n<i>“Alright then, we’ll try it,”</i> she says at last, picking up the jeans. <i>“I think you’re talking shit, though.”</i>");
				
				// In +0
				seraInfluence(0);
			}
			if(response == "business suit")
			{
				output("<i>“Go in that,”</i> you say, indicating the pinstripe suit, knee-length skirt and button-up shirt ensemble. Sera laughs.");
				output("\n\n<i>“That’s my old interview suit, dear. I don’t know why I even got it out.”</i>");
				output("\n\n<i>“Look at what you’ve made me dress up in,”</i> you say, plucking exasperatedly at your own shirt. <i>“That’s tailor-made to go with it. It matches, you’ll look both smart and totally perverse in it, and it’ll make you look like you mean business. It’s perfect... ma’am.”</i>");
				output("\n\n<i>“Yeah,”</i> breathes Sera, fingering the lapels. <i>“Yeah! Good call, slut. We’re gonna rock shit with this!”</i>");
				
				// In +50
				seraInfluence(50);
			}
			if(response == "dress")
			{
				output("<i>“Go in that,”</i> you say, indicating the long, slinky black dress.");
				output("\n\n<i>“That’s the safe option alright,”</i> Sera says, picking it up. <i>“I just... I dunno...”</i>");
				output("\n\n<i>“You won’t know most of these people, it’d be silly to take risks,”</i> you reason. <i>“You’ll look great in that, you’ll fit in, and once people look and listen to you you’ll have them hooked anyway.”</i>");
				output("\n\n<i>“Yeah, that’s exactly right,”</i> Sera says, nodding. <i>“I guess I just needed someone to say it. Thanks, bitch.”</i>");
				
				// In +40
				seraInfluence(40);
			}
			
			// Anything but “As you are”:
			if(response != "corset") output("\n\nSera quickly changes, unclipping her thigh highs and collar before squeezing her generous curves into the " + response + ". Although she has cut a small hole in the bottom half to allow her tail to poke out uninhibited, the way her high breasts, juicy behind and thick penis bulge, barely suppressed under the fabric, is unavoidable. You realize wearing virtually nothing on a day-to-day basis is not just a characteristic display of audacity for her; it’s simply the most comfortable thing to do. She snaps her claws in front of you, making you drag your eyes upwards.");
			// As you are:
			else output("\n\nDecision made, Sera drags a cursory comb through her blue hair, re-applies her make-up and then strides to the door.");
			// {merge}
			output("\n\n<i>“C’mon slut,”</i> she grins, offering you her hand. <i>“Let’s knock ‘em dead.”</i>");
			
			processTime(5);
			flags["SERA_PARTY_ATTIRE"] = response;
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage1, "leave");
			break;
		case "leave":
			// Move to Elevator.
			moveTo("LIFT: MERCHANT DECK");
			showLocationName();
			
			showBust("SERA");
			
			output("Gripping you tightly – perhaps so that you aren’t tempted to run away – she strides out of the Dark Chrysalis and onto the walkways of Tavros. Although the day-night cycle of the prodigious space station is drawing to a close there’s still lots of people out and about, and you feel plenty of eyes on you and your proud, supremely unabashed mistress.");
			
			// Schoolgirl:
			if(pc.armor is SchoolgirlCostume)
			{
				output(" You can feel the bob of your pigtails, the swish of your short skirt and the cool air between your [pc.thighs]. It feels everyone you pass is looking at your [pc.nipples] standing out underneath your thin blouse and the jounce of your scantily clad [pc.butt]...");
				// PC 5’11” or less:
				if(pc.tallness <= 71) output(" It doesn’t help that Sera is noticeably taller than you, further emphasizing your costume and status.");
				output(" The only thing to do is blush and look down, concentrate on moving your");
				if(pc.isBiped()) output(" white socks and plimsolls");
				else output(" [pc.legOrLegs]");
				output(" forward, and try to ignore the stares, murmurs and chuckles.");
			}
			// Buttler:
			else if(pc.armor is ButlerCostume)
			{
				output(" You can feel the cool air on your");
				if(pc.hasBreasts()) output(" unsupported");
				output(" chest; it feels like everyone you pass is looking at your [pc.nipples] standing out underneath the flimsy dots on your chest and the jounce of your bare [pc.butt]...");
				// PC 5’11” or less:
				if(pc.tallness <= 71) output(" It doesn’t help that Sera is noticeably taller than you, further emphasizing your costume and status.");
				output(" The only thing to do is blush and look down, concentrate on moving your");
				if(pc.isBiped() && pc.hasFeet()) output(" plain, black shoes");
				else output(" [pc.legOrLegs]");
				output(" forward, and try to ignore the stares, murmurs and chuckles.");
			}
			// {merge}
			
			processTime(15);
			pc.changeLust(5);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage1, "arrive");
			break;
		case "arrive":
			// Move to Res Deck.
			moveTo("RESIDENTIAL DECK 10");
			showLocationName();
			
			showBust("SERA");
			
			output("<i>“Isn’t this nice?”</i> opines the succubus pleasantly. A blunt tail spade cracks into your butt, making you jerk. She’s in her element. <i>“Two special friends enjoying an evening walk together. We should do it more often. I’ll bring the leash next time... ah, here we go.”</i>");
			output("\n\nYou are on the residential deck of Tavros. Unlike the rows of apartments and squashed-together shops found elsewhere, the dwellings here are large, separate buildings, mansions almost. Above it all a vast, transparent ceiling hangs, through which the glittering void of space gazes back. The price of places like these on a vessel like Tavros must be huge.");
			
			processTime(3);
			pc.changeLust(5);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage1, "estate");
			break;
		case "estate":
			// Move to Estate.
			currentLocation = "RESIDENTIAL DECK 11";
			rooms["RESIDENTIAL DECK 11"].southExit = "RES DECK EAST ESTATE";
			rooms["RES DECK EAST ESTATE"].northExit = "RESIDENTIAL DECK 11";
			rooms["RES DECK EAST ESTATE"].addFlag(GLOBAL.NPC);
			generateMap();
			showLocationName();
			
			showBust("SERA", "JARVIS");
			
			output("Sera drags you up to the doorway of one such tastefully white decorated estate. You can feel the bass vibrations of music and conversation, and there is a man stood outside in a smoking jacket with a glass of wine. He raises it and smiles as you approach.");
			output("\n\n<i>“Ah, Sera. I was beginning to think you weren’t going to make it – how pleasant to see you again.”</i>");
			output("\n\n<i>“Jarvis,”</i> coos Sera slyly in response, offering her other hand. Jarvis neither shakes nor kisses it, simply holds it for a moment while looking her with friendly, cunning interest. For a human supposedly of legendary modding fame he’s remarkably normal looking – he has a long, clean shaven, intelligent face with a mane of combed back brown hair. His voice, a low, measured murmur, immediately makes you think he’s never raised it in his life.");
			output("\n\n<i>“And you’ve managed to bring a companion along! How nice.”</i> You’re slightly surprised when, in kind, your hand is clasped and you find yourself being eyed with casual criticalness. <i>“");
			if(pc.armor is SchoolgirlCostume) output("Ah, the educational angle. Always a favorite of young Sera’s, I seem to recall. Refreshingly guileless. ");
			else if(pc.armor is ButlerCostume) output("Ah, the classist angle. Sera has been branching out a bit since I last saw her handiwork, it seems. ");
			output("Please, step inside. I’m dying to introduce you.”</i> A kaithrit waiter in a neat if extremely tight suit is standing by in the gloomy hall with a tray laden with full glasses.");
			output("\n\n<i>“Is [pc.he] allowed?”</i> says Jarvis, as he gives one to Sera. <i>“Or would certain rules be transgressed?”</i>");
			output("\n\n<i>“[pc.He]’s allowed,”</i> replies Sera breezily. A glass flute containing yellow fizz is handed to you. <i>“As long as [pc.he] doesn’t embarrass [pc.him]self too badly.”</i>");
			
			processTime(5);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "party time");
			break;
	}
}

// Stage 2
public function seraSexPartyStage2(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	
	var outfitPC:String = flags["SERA_PARTY_STAGE1"];
	var outfitSera:String = flags["SERA_PARTY_ATTIRE"];
	
	switch(response)
	{
		case "none":
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "party time":
			// Move PC to isolated square. Time forward one hour
			currentLocation = "RES DECK EAST ESTATE";
			rooms["RESIDENTIAL DECK 11"].southExit = undefined;
			rooms["RES DECK EAST ESTATE"].northExit = undefined;
			generateMap();
			showLocationName();
			
			processTime(60);
			
			showBust("JARVIS", "KIRLARWE", "VEDICE");
			
			output("The three of you step into a large, well-lit hardwood floored room crowded with people. The air is dense with music, warmth, conversation and laughter. The way the throng, air and sound here ebb and flow you get given the vague impression there are many other rooms leading out from this one, each clustered with people and each with something slightly different going on. A far more concrete perception is that, looking around, neither you nor your mistress are going to stand out. Sera is conservatively modded");
			// Casual/Business
			if(outfitSera == "jeans and blouse" || outfitSera == "business suit") output(" – and certainly conservatively dressed -");
			output(" in comparison to some of the people here. You absorb as much of it as you can as Jarvis leads you to the nearest group: a tall, rather stern-looking digitigrade biped with a mask-like face and feathered crest, conversing with an even taller, voluptuous and stunningly attractive naga.");
			output("\n\n<i>“Princeps Kirlarwe of the Fifth Wing Anatae Commission, Vedice,”</i> says Jarvis, <i>“please let me introduce Sera Landon, and...”</i>");
			output("\n\n<i>“[pc.name],”</i> says Sera casually. <i>“[pc.name] Steele.”</i> Jarvis’s eyebrows arch slightly but neither the anat nor the naga look particularly impressed.");
			
			CodexManager.unlockEntry("Anatae");
			
			// [Say Hello] [Bow/Curtsey] [Do Nothing]
			clearMenu();
			addButton(0, "Say Hello", seraSexPartyStage2, "hello");
			if(outfitPC == "butler") addButton(1, "Bow", seraSexPartyStage2, "bow");
			else if(outfitPC == "schoolgirl") addButton(1, "Curtsy", seraSexPartyStage2, "curtsy");
			else addButton(1, "Appease", seraSexPartyStage2, "appease");
			addButton(2, "Do Nothing", seraSexPartyStage2, "nothing");
			break;
		case "hello":
		case "bow":
		case "curtsy":
		case "appease":
		case "nothing":
			showBust("JARVIS", "KIRLARWE", "VEDICE");
			
			// Say Hello:
			if(response == "hello")
			{
				output("<i>“Pleased to meet you,”</i> you say, trying not to sound too nervous.");
				output("\n\n<i>“Charmed,”</i> drawls Vedice, and Kirlarwe nods briefly. The latter’s attention turns to Sera, however the former does not; the naga’s eyes, heavily and archly browed in the Egyptian style, continue to run up and down you with interest.");
				// In +0
				seraInfluence(0);
			}
			// Bow/Curtsey:
			else if(response == "bow" || response == "curtsy" || response == "appease")
			{
				output("Feeling you should play up to it, you");
				if(outfitPC == "butler") output(" angle your arm across your stomach and bow");
				else if(outfitPC == "schoolgirl") {
					output(" take the fringes of your skirt");
					if(pc.hasLegs() && pc.hasKnees()) output(", bend a knee");
					output(" and curtsy");
				}
				else output(" greet them");
				output(" deferentially.");
				output("\n\n<i>“Oh that’s </i> adorable,” coos Vedice, clapping her hands together. Kirlarwe simply nods briefly, and turns his attention to Sera. The naga’s eyes, heavily and archly browed in the Egyptian style, continue to run up and down you with interest.");
				// In +20
				seraInfluence(20);
			}
			// Do Nothing:
			else if(response == "nothing")
			{
				output("You think you’d better let your mistress take the lead here.");
				output("\n\n<i>“Can [pc.he] talk?”</i> snaps Kirlarwe, after a moment’s pause.");
				output("\n\n<i>“When I allow [pc.him] to,”</i> replies Sera, with what you feel is supreme composure. The anat’s attention turns to her, however Vedice’s eyes, heavily and archly browed in the Egyptian style, continue to run up and down you with interest.");
				// In +10
				seraInfluence(10);
			}
			// {merge}
			output("\n\n<i>“Landon, eh?”</i> growls Kirlarwe, twirling the cherry in his cocktail. <i>“Rings a bell. I believe we did business on Earth with--”</i>");
			output("\n\n<i>“I work on my own,”</i> Sera cuts in frostily. <i>“I am the lead gene mod merchant on this station, but I am not a front for no f- damn Earth company. I’ve got big plans for Tavros.”</i> She puts a hand on her hip and smiles at the pair challengingly. <i>“So, you two don’t have any... companions?”</i>");
			output("\n\n<i>“Oh, I collect dear, but why would I bring along toys to a night like this?”</i> purrs Vedice, her glistening green lips curving into a smile as she continues to stare at you. <i>“Not as much fun that way.”</i>");
			output("\n\n<i>“I came here to meet people, not show off,”</i> says Kirlarwe in turn, unruffled. He reaches into his pocket, pulls out a tablet device, turns it on. <i>“Since you ask though, I left Tarka in charge of the twins, as a reward for good behavior. How is it going, Tarka?”</i>");
			output("\n\n<i>“Absolutely fine, master!”</i> comes the fizzled but palpably delighted reply. You distinctly hear a whip crack before he switches the phone off again.");
			output("\n\n<i>“You say you supply gene-mods to this station?”</i> he goes on, his fierce, blue eyes still on Sera. <i>“Now, that </i>is<i> interesting to me. I represent the main commissary arm of the Anatae Empire, which is currently...”</i>");
			output("\n\n<i>“Oh dear, they’re going to talk shop,”</i> sighs Jarvis, laying a hand on your shoulder. <i>“Run along, mingle, have fun " + pc.mf("Master","Miss") + " Steele – that’s what these little events are all about. I’m sure Sera will come find you if she has need of you.”</i> You look at Sera, who nods curtly, concentrating on what Kirlarwe is saying.");
			
			processTime(7);
			flags["SERA_PARTY_STAGE2"] = response;
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "explore");
			break;
		case "explore":
			rooms["RES DECK EAST ESTATE"].removeFlag(GLOBAL.NPC);
			generateMap();
			clearBust();
			showName("ESTATE\nCORRIDOR");
			
			output("Sipping your drink, you break off and wander aimlessly through the party. The buzz of the alcohol combines with the teasing touch of your slutty costume to make you feel warm and open, sensitized to what’s going on around you. Away from the main room the lighting is dimmer and things seem a lot less tense; there is an awful lot of whispering, giggling and closing of doors going on. You find yourself in a tiled corridor lined with plinths, upon each of which a slim man or woman is dancing slowly. They are all naked except for concealing latex gimp masks; underneath them groups of suited people with animal heads are talking amongst themselves animatedly. You pause by a door from which extremely heavy music seems to be emanating.");
			output("\n\n<i>“I wouldn’t go in there,”</i> a raven croaks to you in passing. <i>“Bass sauna, not for first timers. Try the rooms at the end.”</i> You shrug and follow his direction, past the slow dancers to the t-junction at the end. From the left you can hear wet, splashing sounds; to the right you can see flickering lights.");
			
			pc.imbibeAlcohol(35);
			processTime(15);
			
			// [Wet sounds] [Flickering lights]
			clearMenu();
			addButton(0, "Sounds", seraSexPartyStage2, "sounds", "Wet Sounds", "Go left, to the wet sounds.");
			addButton(1, "Lights", seraSexPartyStage2, "lights", "Flickering Lights", "Go right, to the flickering lights.");
			break;
		// Flickering lights
		case "lights":
			showName("ESTATE\nLOUNGE");
			
			output("You enter a darkened, plushily furnished lounge. A holographic projector dominates the room, standing in front of which a small group are talking and laughing excitedly around a console. On a circular couch in the middle of the room lie five other people, clad in bulky helmets. They occasionally twitch, writhe and moan. On the screen seems to be playing some sort of adventure movie; five scantily clad warriors are fighting off a swarm of bee-girls, their dripping stingers and ovipositors at the ready. It doesn’t look like it’s going well for the adventurers...");
			output("\n\n<i>“Hello,”</i> says a delicate blue mantis-like creature at your elbow. <i>“Are you here to bet, or to participate?”</i> It takes a moment to look you up and down. <i>“...I suppose that’s not much of a question, is it? Come; let’s get you suited up. You’re just in time for the next round.”</i>");
			
			processTime(3);
			
			// [Yes] [No]
			clearMenu();
			addButton(0, "Yes", seraSexPartyStage2, "lights yes");
			addButton(1, "No", seraSexPartyStage2, "lights no");
			break;
		case "lights no":
			output("<i>“No, I’m just here to watch.”</i> The mantis immediately turns its attention elsewhere.");
			output("\n\nYou watch the last ten minutes of the movie, which turns out to be needlessly gratuitous. You are uncomfortably aware you are");
			if(pc.hasGenitals())
			{
				if(pc.hasCock()) output(" tenting");
				else output(" moistening");
				output(" your costume");
			}
			else output(" blushing");
			output(" quite noticeably as you slip back out, the woozy groans and slurps of egg-stuffed bee slaves echoing in your ears.");
			
			processTime(12);
			// + Lust
			pc.changeLust(15);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "hallway");
			break;
		case "lights yes":
			output("You find yourself being led to the couch, where a dazed-looking woman is taking off her headset.");
			output("\n\nAfter a few moments you are plugged into the VR simulation with four others. You are designated a slim, male vulpine rogue called Rafa. Although you are dimly aware of your real body, lying on a couch in the real world somewhere, you certainly feel like your character as you and your party attempt to quest through a dungeon which turns out to contain a deeply unfair number of booby traps and fuck-hungry enemies. One of your troupe gets taken for a minotaur bride; the rest fall victim to the floor suddenly becoming a vast nest of tentacles. With your swiftness and reflexes you manage to escape it, wriggling, sneaking and ferreting your way further and further into the perverted underground maze, sheer determination driving you on – however not even hiding in a water barrel can prevent you finally being apprehended by two burly ausar soldiers.");
			output("\n\nAfter they have finished vigorously spit-roasting you they take you to their boss, a hellish hermaphrodite princess who seems vaguely familiar. She sticks a gold piercing through your nose and then demands you lick her feet. Although you fight against the magical influence as hard as you can the compulsion to do so eventually becomes unbearable – your small, red cock helplessly rigid with arousal, you get on all fours...");
			output("\n\nThe simulation clicks off. Woozily you are aware of cheers as you are dragged off the couch.");
			output("\n\n<i>“Bravo!”</i> reeds the mantis. Above the drunken throng clapping you and busily exchanging credit chits, you can see on the screen a haughty demon girl looking down and smiling cruelly at something happening out of shot. You feel dazed and sexually exhausted – how long have you been under? It feels like days. <i>“Such a display of bloody-mindedness I rarely get to enjoy. Your cowardice and slipperiness in particular – oh, it makes the pay-off so much more satisfying when players </i>engage<i> like that! I trust you’ll be staying for the next round?”</i>");
			output("\n\nWorried by your dissociated sense of time you decline, to groans and mocking boos of disappointment, and after taking a moment to rest on a side settee stagger back out of the games room as five more participants begin to helmet themselves.");
			
			processTime(25);
			// In +10, + Lust
			seraInfluence(10);
			pc.changeLust(15);
			restHeal();
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "hallway");
			break;
		// Wet sounds
		case "sounds":
			showName("ESTATE\nPATIO");
			
			output("You step out onto a paved outdoor patio, surrounded on three sides by French windows. There doesn’t seem to be anybody else here except for a powerfully built, bald ausar with a razor sharp beard. It’s a pool area – or at least, there’s definitely a large, square depression in front of you, filled with... something. The goop is a swirl of bright colors, run together like a painter’s discarded pallet and is seething and writhing with insane, liquid energy. Occasionally you pick out shapes in the kaleidoscopic formlessness, a body or a face, gone the next moment. It’s difficult to tell if they are part of the slime, or...");
			output("\n\n<i>“Galotians,”</i> baritones the ausar, sipping his drink. <i>“Two dozen of them kindly agreed to fast for a few days and then form themselves here.”</i> Two naked female top halves form above the morass briefly, beckoning with wiggling fingers, tinkling with laughter. <i>“I believe alcohol and over-enthusiastic swimmers have gotten them very giddy since.”</i> The ausar hikes an eyebrow and a smirk at you. <i>“What are you waiting for? I’m sure a");
			if(outfitPC == "schoolgirl") output(" school bicycle");
			else if(outfitPC == "butler") output(" butt boy");
			output(" could keep them occupied for a bit.”</i>");
			
			processTime(4);
			
			// [Yes] [No]
			clearMenu();
			addButton(0, "Dive In", seraSexPartyStage2, "sounds yes");
			addButton(1, "Refuse", seraSexPartyStage2, "sounds no");
			break;
		case "sounds no":
			output("He “pfft”s exasperatedly as you back off. <i>“Typical. Without mommy or daddy ordering you you’ve got </i>zero<i> backbone.”</i>");
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "hallway");
			break;
		case "sounds yes":
			output("<i>“Sounds to me like you aren’t brave enough to go in there yourself,”</i> you say, looking him in the eyes. They widen in surprise.");
			output("\n\n<i>“I...”</i>");
			output("\n\n<i>“Watch </i>this<i> then!”</i> Without thinking you");
			if(!pc.isNaga()) output(" stride");
			else output(" slither");
			output(" over to the edge and swan-dive straight into the warm, gooey morass.");
			// Naga:
			if(pc.isNaga()) output(" It’s more of a flop-dive really, but the way your tail reared and flowed into the pool probably looked impressive.");
			output(" The buzz you feel at your spontaneous audacity dissolves as a dozen soft hands and lips fasten themselves onto you, easily slipping beneath your meager clothes to touch, cusp and wetly pinch your flesh, impatiently searching out your [pc.crotch], slathering");
			if(pc.totalGenitals() + pc.balls <= 1) output(" it");
			else output(" them");
			output(" in milking, kneading goo. A cacophony of excited, tittering voices in your ears and your mouth full of goo, you find yourself pulled further and deeper into the pool, the pressure of the galotians and other trapped guests piling on top of you. You struggle – try and madly swim, even - but there’s nothing to grab onto, no purchase to be had except upon quivering wetness which coos delightedly when you sink your fingers into it. When your pulse is pounding in your head and you think you might scream you are carried to the top, allowed to breathe for a second, and then carried back to the depths where the licking, milking and fucking continues unabated.");
			output("\n\nYour eyes roll as one goo girl pressed on top of you forms a club-like limb, spreads your cheeks and vigorously fists your [pc.anus] with it,");
			if(pc.hasCock()) output(" forcing you to flex [pc.oneCock] down into a kneading orifice of one of her sisters");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina())
			{
				output(" forcing your [pc.vaginas] down the tentacle-like tongue");
				if(pc.totalVaginas() != 1) output("s");
				if(pc.hasCock()) output(" of her other");
				else output(" of one of her");
				output(" sisters");
			}
			if(pc.hasGenitals()) output(",");
			output(" all the while two others pull your upper half towards them, one forcing your face into her plump, oozing twat while the other squeezes your [pc.nipples], forming hungry suckers around them");
			if(!pc.isLactating()) output(" for milk that you can’t give her, no matter how intensely she tortures your teats.");
			else output(" for [pc.milk] that beads and then squirts out of you under the intense nursing.");
			output("\n\nAfter they have forced you to feed them what feels like several gallons of your sexual fluids you dimly feel the impact of some other foolhardy bathers dive-bombing in. The galotians slowly ebb you to the side where one of them lays your wet, limp form, leaving you with a teasing kiss before eagerly turning back to fight with her sisters over their next set of victims. Perhaps you should be grateful they apparently have others in there to amuse themselves with. You also feel grateful that, looking around tiredly, the ausar no longer seems to be around. There is a strategically-placed table covered with energy drinks, though. After you’ve hit one of those back and rested a bit you decide you’d better get back to the main party, no matter how much you currently feel like a wrung cloth.");
			
			processTime(35);
			// In +10, Lust reset
			seraInfluence(10);
			pc.orgasm();
			if(pc.hasCock()) pc.orgasm();
			if(pc.hasVagina()) pc.orgasm();
			if(pc.isLactating()) pc.milked(100);
			pc.exhibitionism(1);
			//pc.applyCumSoaked();
			pc.applyPussyDrenched();
			restHeal();
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage2, "hallway");
			break;
		// {merge}
		case "hallway":
			showName("ESTATE\nHALLWAY");
			
			output("You stagger back into the tiled hallway, blinking blearily. Most of the animal headed folk seem to have gone elsewhere, but the dancers on their plinths are still here. Except... they’re entirely still. They’re statues. Did you just imagine they were real? Or are they just frozen now, somehow? A conversation under the nearest plinth catches your beleaguered attention; an antelope-headed suit is arguing animatedly with what appears to be a floating blue drone.");
			output("\n\n<i>“-where you’re completely wrong. Investing in luxury items during a frontier rush is nonsensical. Basics, weapons, construction materials – yes. Gene mods? Who’s going to be interested in them when");
			if(flags["TARKUS_DESTROYED"] != undefined) output(" everyone’s watching Tarkus blow up on their vidscreens?");
			else output(" there’s situations like Tarkus?");
			output(" Self-defense, weapons, the fear factor – that’s where the money will be.”</i>");
			output("\n\n<i>“LONG TERM TRENDS FAVORABLE. CHANGING OF BODY AND SPIRIT NOT LUXURY,”</i> replies the blue drone. <i>“TIMES FLUID, CHANGEABLE. CULTURE, INDIVIDUALS WILL REFLECT THIS.”</i>");
			output("\n\n<i>“Try saying that in a non-six dimensional board meeting sometime,”</i> sneers the antelope. <i>“Me and every other stock broker is interested in </i>now<i>, not twenty years down the line.”</i>");
			output("\n\nYou wonder if you should butt in.");
			
			processTime(5);
			
			// [Butt In] [Don’t]
			clearMenu();
			addButton(0, "Butt In", seraSexPartyStage2, "butt in");
			addButton(1, "Don’t", seraSexPartyStage3, "next room");
			break;
		// Butt In
		case "butt in":
			output("<i>“Excuse me,”</i> you say to the antelope. <i>“But I think you’re wrong.”</i>");
			output("\n\n<i>“Yeah?”</i> He looks at you askance. <i>“Why?”</i>");
			
			processTime(1);
			
			// [New markets] [New shapes] [Long term]
			clearMenu();
			addButton(0, "New Markets", seraSexPartyStage2, "new markets", "New Markets", "Argue that the frontier rush will open up new markets of people interested in gene mods.");
			addButton(1, "New Shapes", seraSexPartyStage2, "new shapes", "New Shapes", "Argue that the frontier rush will present the public with exotic, alien shapes that they will want to become.");
			addButton(2, "Long Term", seraSexPartyStage2, "long term", "Long Term", "Argue that gene-mods have a lasting investment value.");
			break;
		// New markets
		case "new markets":
			output("<i>“Every sentient race we discover is a sentient race that suddenly discovers there’s a whole galaxy of incredible, exotic shapes out there,”</i> you say. <i>“That they can become, easily, for the right price. There’s massive amounts of money to be made, if gene mods were marketed to them well.”</i>");
			output("\n\n<i>“They don’t have </i>money<i>, fool,”</i> snaps the antelope. <i>“They have shiny fucking rocks and outdoor plumbing. Anyway, what’s the point in painstakingly researching an alien’s culture in order to advertise to them when their planet might blow up tomorrow?”</i>");
			// All Jade’s talk options used:
			if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2) output("\n\n<i>“Look, I met an orchan who transformed into a big, goddamn panda,”</i> you say heatedly. <i>“She wanted to be that panda so bad it didn’t even matter she started out with nothing. If you tell natives that you come from the stars to sell them their dreams, they’ll pay anything.”</i>");
			output("\n\n<i>“MEDITATIVE POINT ABOUT TWO WAY NATURE OF CULTURAL EXCHANGE MADE,”</i> drones his partner. <i>“");
			if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2) output("SKILFULLY INTERSECTED WITH EMOTIVE ANECDOTE.");
			output(" GREATER SHAME THAT MEN OF NUMBERS CANNOT APPRECIATE IT.”</i>");
			
			// In +20 if Jade, +10 if no
			if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2) seraInfluence(20);
			else seraInfluence(10);
			
			processTime(10);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage3, "next room");
			break;
		// New shapes 
		case "new shapes":
			output("<i>“I’ve been out onto the frontier,”</i> you say. <i>“There’s stuff out there that you wouldn’t believe. Sexy stuff. When the core-ward public see that through the broadcasts and extranet shows, they’re going to want it. They’re going to </i>be<i> it. Gene-mods are going to be massive.”</i>");
			output("\n\n<i>“How many times have I been fed that line?”</i> scoffs the antelope. He points at you aggressively. <i>“I don’t believe for a second a precious");
			if(outfitPC == "schoolgirl") output(" apple");
			else if(outfitPC == "butler") output(" shoe");
			output(" and cock polisher like you has been anywhere near the real frontier. What have you personally seen that is so damn impressive?”</i>");
			if
			(	(flags["TIMES_MET_NALEEN"] != undefined && flags["TIMES_MET_MALE_NALEEN"] != undefined)
			||	(flags["MET_SYDIAN_MALE"] != undefined)
			||	(flags["KING_NYREA"] != undefined || (flags["MET_NYREA_BETA"] != undefined && flags["MET_NYREA_ALPHA"] != undefined) || flags["MET_TAIVRA"] != undefined || flags["MET_SEIFYN"] != undefined)
			)
			{
				var count:int = 0;
				
				output("\n\n<i>“");
				// Naleen encountered:
				if(flags["TIMES_MET_NALEEN"] != undefined && flags["TIMES_MET_MALE_NALEEN"] != undefined)
				{
					output("Feline snake hybrids with double dicks and soft, furry breasts.");
					count++;
				}
				// AND Sydian encountered:
				if(flags["MET_SYDIAN_MALE"] != undefined) {
					if(count > 0) output(" ");
					output("Stacked, plated insect bipeds with orange, feathered cocks.");
					count++;
				}
				// AND Nyrea encountered:
				if(flags["KING_NYREA"] != undefined || (flags["MET_NYREA_BETA"] != undefined && flags["MET_NYREA_ALPHA"] != undefined) || flags["MET_TAIVRA"] != undefined || flags["MET_SEIFYN"] != undefined) {
					if(count > 0) output(" ");
					output("Cave amazons whose men are women and whose women have spiked vacuum dicks!");
					count++;
				}
				output("”</i> you state boldly, looking him in the eye.");
				
				if(count == 1) output("\n\n<i>“Yeah I’ve watched Steph Irson repeats, just like everybody else,”</i> he replies. <i>“They’re hot, sure. No statistical evidence they affect public taste whatsoever.”</i>");
				if(count == 2) output("\n\n<i>“Alright, those do sound pretty interesting,”</i> he says reluctantly. <i>“Not convinced they’re going to be any hotter than armaments, though.”</i>");
				if(count == 3) {
					output("\n\nThere’s a short silence.");
					output("\n\n<i>“Alright, those do sound pretty hot,”</i> the stockbroker says at last. <i>“Certainly better than antelopes,”</i> he adds, feelingly.");
				}
				// 1 = Inf +10, 2 = Inf +20, 3 = Inf +30
				seraInfluence((10 * count));
				output("\n\n<i>“FORGIVENESS FOR COMPANION REQUESTED,”</i> blares the drone. <i>“INSIGHT AND RELAY OF EXPERIENCE APPRECIATED. MINDS OF NUMBERS, FAST BUT FLAT, UNABLE TO APPRECIATE COLOR OF WIT.”</i>");
			}
			// Nothing encountered:
			else
			{
				output("\n\nYour mind goes blank and you find yourself mumbling only that you’ve seen some pretty amazing things.");
				output("\n\n<i>“I knew it,”</i> he brays. <i>“Go pitch your sale to someone who thinks with their balls, [pc.boy] – maybe if you do a good job emptying them they’ll be willing to listen to your bullshit.”</i>");
				// 0 = Inf -10
				seraInfluence(-10);
				output("\n\n<i>“A TALE TOLD BY A FOOL, FULL OF SOUND AND FURY, SIGNIFYING NOTHING,”</i> intones the drone morosely.");
			}
			// {merge}
			output("\n\n<i>“You ever gonna fetch me a break, Mike?”</i> snaps the antelope.");
			
			processTime(10);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage3, "next room");
			break;
		// Long term
		case "long term":
			output("<i>“Wars can end in a day,”</i> you say. <i>“Gene-mods are here to stay. In terms of long term value, they beat weapons easily.”</i>");
			output("\n\n<i>“You’re just repeating what he said!”</i> sneers the antelope. <i>“Is that really the best the pro-mod lobby has got to offer? Bleating “Here to stay”, ad infinitum. I already said: I don’t give a shit if your product is earning you five credits per annum, I want to know what’s going to be hot now!”</i>");
			output("\n\n<i>“ECHOES OF OWN VOICE IN EMPTY BOWL,”</i> intones the blue drone morosely. <i>“PLEASING, UTTERLY HOLLOW.”</i>");
			// Inf = -10
			seraInfluence(-10);
			
			processTime(10);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage3, "next room");
			break;
	}
}

// Stage 3 
public function seraSexPartyStage3(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	
	var outfitPC:String = flags["SERA_PARTY_STAGE1"];
	var outfitSera:String = flags["SERA_PARTY_ATTIRE"];
	
	switch(response)
	{
		case "none":
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		// Don’t/Next
		case "next room":
			rooms["RES DECK EAST ESTATE"].addFlag(GLOBAL.NPC);
			generateMap();
			// Time forward 2 hours
			processTime(120);
			
			showBust("SERA");
			showName("ESTATE\nBEDROOM");
			
			output("You step into another room. Although it is moodily lit and contains a few couples it thankfully isn’t quite as surreal as the ones you’ve just passed through. There’s a pool sauna here that is empty and bubbling away invitingly. It would surely be nice to get in, have some time to collect yourself a bit.");
			output("\n\n<i>“Bitch!”</i> Half the heads in the room turn.");
			output("\n\n<i>“I mean... [pc.name]-bitch,”</i> says Sera, closing her eyes. <i>“Here. Now.”</i> Nervously you follow the purple tail through the door from whence it came, through to a small, empty bedroom evidently serving as a cloakroom. Have you transgressed somehow? Sera closes the door and exhales slowly. You smell wine.");
			output("\n\n<i>“I don’t know how well this is going,”</i> she mumbles at last, looking down. <i>“Maybe it was a mistake coming here. I can’t impress these people at all, some of them are so... and I’m just a dumb shopkeeper, everyone can see that, nobody here is impressed by a few demon mods and I think... maybe I’m here because it’s one of their jokes I can’t understand...”</i> ");
			output("\n\nYour memory rewinds in alarm, trying to recall a time when Sera <i>ever</i> expressed self-doubt, particularly to you. You could try encouraging her. You do also know an absolutely fail-safe way of relaxing her...");
			
			// [Encourage] [Relax] [Nothing]
			clearMenu();
			addButton(0, "Encourage", seraSexPartyStage3, "encourage");
			addButton(1, "Relax", seraSexPartyStage3, "relax");
			addButton(2, "Nothing", seraSexPartyStage3, "nothing");
			break;
		case "nothing":
		case "encourage":
		case "relax":
			showBust("SERA");
			
			// Nothing
			if(response == "nothing")
			{
				output("You decide it’s better to let her face her demons herself, so to speak. Also it’s kind of funny to see your mistress so unsure of herself for once.");
				output("\n\nThe door suddenly bursts open, and two giggling humans come bundling in.");
				output("\n\n<i>“Oh,”</i> says the guy. <i>“Sorry, we didn’t know this room was taken.”</i>");
				output("\n\n<i>“No, it’s fine,”</i> replies Sera. She’s recovered her pose a bit, although she still looks quite grave and tense. <i>“We were just leaving.”</i> She sets her jaw and strides out without saying another word.");
				
				processTime(2);
				// Inf +0
				seraInfluence(0);
				flags["SERA_PARTY_STAGE3"] = response;
			}
			// Encourage
			if(response == "encourage")
			{
				// Nice/Misc:
				if(!pc.isAss()) {
					output("<i>“C’mon now mistress,”</i> you say kindly. <i>“You’re doing fine. Just keep being yourself. I’ve walked around and most of these people are complete posers. If you’re feeling uncomfortable, it’s because you’re one of the few people here who is real and not trying to pitch a hip image. Anyone who is worth impressing will be impressed by that.”</i>");
					output("\n\n<i>“Yeah...”</i> mumbles Sera. She raises her chin and looks at you fiercely, regaining her proud profile. <i>“Yeah, you’re damn right! If nothing comes of this I want it to be because they couldn’t accept me for who I am, not because I failed at playing their stupid games. C’mon slut, it’s getting towards the fun part of the evening and I don’t want to miss it because I was crying in a fucking closet.”</i> ");
					output("\n\nYou grin as you watch her stride out.");
				}
				// Hard:
				else {
					output("<i>“C’mon now mistress,”</i> you say kindly. <i>“You’re doing fine. Just keep being yourself. I’ve walked around and most of these people are complete posers. If you’re feeling uncomfortable, it’s because you’re one of the few people here who is real and not trying to pitch a hip image. Anyone who is worth impressing will be impressed by that.”</i>");
					output("\n\n<i>“Really?”</i> you say, sounding bored. <i>“Take it from someone dressed");
					if(outfitPC == "butler") output(" as a male prostitute");
					else if(outfitPC == "schoolgirl") output(" as a teacher’s piece of candy");
					else output(" like me");
					output(" - right now you’re sounding like a little bitch. I don’t know exactly what these people are looking for but I do know that nobody is impressed by self-doubt and self-pity. Herm the fuck up, get back out there and show everyone exactly why [pc.name] Steele kisses your ass.”</i> Sera has raised her chin, her fierce, proud profile regained by the time you’ve finished.");
					output("\n\n<i>“Yeah, you’re damn right! If nothing comes of this I want it to be because they couldn’t accept me for who I am, not because I failed at playing their stupid games. C’mon, it’s getting towards the fun part of the evening and I don’t want to miss it because I was crying in a closet. And you better believe I’m going to make </i>you<i> cry for taking that tone with me later, fuck-hole.”</i> ");
					output("\n\nYou grin as you watch her stride out.");
				}
				processTime(10);
				// Inf = +30
				seraInfluence(30);
				flags["SERA_PARTY_STAGE3"] = response;
			}
			// Relax
			if(response == "relax")
			{
				// Nice:
				if(pc.isNice()) {
					output("<i>“You’re doing fine,”</i> you say kindly. <i>“It’s nerves, is all. You know, I think a nice, sloppy blowjob from your favorite slave might help. What do you think?”</i> Sera wipes her nose.");
					output("\n\n<i>“Yeah,”</i> she says quietly. <i>“Yeah, that would help.”</i>");
					output("\n\n<i>“I’m sorry mistress, I don’t think I heard you.”</i>");
					output("\n\n<i>“Get");
					if(pc.hasLegs() && pc.hasKnees()) output(" on your knees");
					else output(" down there");
					output(" and suck me off, whore!”</i> she says, laughing at last. You smile at her affectionately and then sink downwards.");
				}
				// Misc:
				else if(pc.isMischievous()) {
					output("<i>“I’m sorry that the moment you find some people you can’t sexually intimidate you run away and cry about it to someone you can,”</i> you say, sweet as sugar. You purse your [pc.lips]. <i>“Would fucking my mouth make it feel better?”</i> Sera wipes her nose and takes a deep breath.");
					output("\n\n<i>“You always know what to say,”</i> she says quietly. When she speaks next, it’s in a voice of complete control. <i>“Get");
					if(pc.hasLegs() && pc.hasKnees()) output(" on your knees");
					else output(" down there");
					output(". I’m going to wash that smart-aleck mouth of yours out, and you’re going to thank me for the privilege.”</i> You smile at her winningly and then sink downwards.");
				}
				// Hard:
				else {
					output("<i>“I’m sorry mistress, I’m confused – did you come in here to whinge about alien cliques to your portable gloryhole, or to work your frustrations out on it?”</i> Sera wipes her nose.");
					output("\n\n<i>“Yeah. Yeah, that’s what I did, wasn’t it,”</i> she says slowly. She is back in full control of herself when she points downwards. <i>“Get");
					if(pc.hasLegs() && pc.hasKnees()) output(" on your knees");
					else output(" down there");
					output(" and start sucking, slut.” You smile at her winningly and then do as she demands.");
				}
				// {merge}
				output("\n\n");
				// AYA:
				if(outfitSera == "corset") output("Her twelve inch dick has spent the evening insolently bobbing back and forth in plain view; it falls readily into your hand and hardens immediately to your touch as you pull and stroke it, knowing you to be a close, dear friend.");
				// Dress:
				else if(outfitSera == "dress") output("Sera impatiently hikes the slinky black number up, allowing her twelve inch dick to spring out. It falls readily into your hand and hardens immediately to your touch as you pull and stroke it, knowing you to be a close, dear friend.");
				// Casual/Business:
				else {
					output("Sera’s twelve inch dick springs out the moment you finish unbuttoning her");
					if(outfitSera == "jeans and blouse") output(" jeans");
					else output(" skirt");
					output(" as if outraged at being caged up. It falls readily into your hand and hardens immediately to your touch as you pull and stroke it, knowing you to be a close, dear friend.");
				}
				output(" You place your [pc.lips] on her thick, blunt crown and envelope it in your mouth, kissing and tonguing the musky, purple head, tantalizing her for the main event as you let your hand roam inwards from the branch-like base. You know by now exactly how she likes it; you gently knead one of her balls whilst assiduously sucking the head, working your lips in particular to make the smacking, slurping noises that make her slide her claws down the nape of your neck and groan her approval. You slide your hand in between her smooth thighs to find her female sex, questing upwards with your fingers to stroke her wet, inner walls. You keep your movements gentle; this is a comforting mission, after all.");
				output("\n\nOr at least it is to begin with. Under your loving attention Sera quickly forgets her worries and focuses instead on what she likes doing best. You try to keep your mouth as soft a squeeze as possible as she begins to thrust her substantial hips forward more and more vigorously, her broad, juicy prick abrogating more and more of your mouth and tongue to its own pleasure; then you concentrate on suppressing your gag reflex as, with a bestial growl, she thrusts into your throat. You become focused entirely on accommodating the long, hard prick that is filling every inch of your mouth and esophagus; there is no question of doing anything but clutching Sera’s thighs as she takes a firm grip of");
				if(pc.hairStyle != "pigtails") output(" your head");
				else output(" your pigtails");
				output(" and fucks your face with all she’s got, her heavy balls batting into your chin. Your eyes roll as you feel pre-cum drool directly into your gut, a taster of what’s to come. Your only wish for it to be as good as possible for your mistress, you keep moving your lips and tongue rolling over the hard flesh thrusting curtly past them.");
				output("\n\n<i>“Oh you delicious little cocksucker, yes,”</i> gasps Sera, tightening her grip on your");
				if(pc.hairStyle != "pigtails") output(" head");
				else output(" hair");
				output(". <i>“I could put you in stocks, take you round the galaxy, make an easy fortune that way, if I didn’t want to keep this to myself so bad.");
				if(pc.hairStyle == "pigtails") output(" You’re going to keep the pigtails, aren’t you? Yes you are. A cumdump as good as you without handlebars is such a waste.");
				else if(outfitPC == "butler") output(" How did I ever think I could misplace you, Jeeves? The throat... I always forget how nice and obedient your throat is...");
				output("”</i> Her dirty talk makes you feel warm, aglow with blissful submission. You utter a low, muffled moan around the thick, musky meat stretching your throat, knowing by the urgency of her movements and the tenseness of her flesh she’s close. <i>“I know you’re hungry [pc.boy], don’t worry, it’s coming... a big, hot serving of a bitch’s rightful rew--”</i> The door opens.");
				output("\n\n<i>“Maybe I left it in he--oh!”</i> The big, square reptile creature stares agog at the scene. Your eyes shoot open and you clamp down on an urge to retch only with great difficulty. Sera is past caring; she keeps hold of you and continues pumping her trunk-like length into your mouth regardless. Shock, then embarrassment pass over the creature’s face as you look at each other; then, dawning revelation. <i>“...yes! </i>That’s<i> what I was going to say! That testicle mod, it worked perfectly! All night long, listening to that awful roehm go on and on about homeopathic solutions to infertility, how could it have slipped my mind?”</i>");
				output("\n\n<i>“Little... privacy?”</i> groans Sera.");
				output("\n\n<i>“Yes, yes of course. Thanks again!”</i> The door clicks shut. Sera surges her cock up and down every inch of your stretched throat for a few seconds more then holds you tight up to her hairless crotch as, with a heartfelt gasp, she unloads herself directly into your stomach, warming and filling you with her copious seed. Possibly because she doesn’t want to ruin your costume (yet) she doesn’t perform her usual trick of pulling out and splashing her last few spurts across your face and [pc.chest]; instead she makes sure you get every single drop, clenching up half a dozen times first down your throat and then, sliding out, in your mouth. She keeps a firm hand on your shoulder, waiting for you to swallow the thick slime down before presenting her oozing cock head to your [pc.lips].");
				output("\n\n<i>“What do you say?”</i> she asks brusquely after you’ve finished carefully licking it gleaming clean.");
				output("\n\n<i>“Thank you mistress,”</i> you say sweetly. She looks down at you, smiling");
				if(outfitSera != "corset") output(" as she readjusts her clothing");
				output(". You could swear it might be love that’s threatening to break out across her cruel features.");
				output("\n\n<i>“Thanks,”</i> she says in turn. <i>“I needed that. Bad.”</i> She coughs. <i>“Now c’mon, it’s getting towards the fun part of the evening and I don’t want to miss it because you’re such a needy cumslut I had to feed you in a closet.”</i> You grin as you watch her stride out of the room.");
				
				processTime(25);
				// Inf = +50, + Lust
				seraInfluence(50);
				pc.changeLust(15);
				pc.loadInMouth(sera);
				pc.loadInMouth(sera);
				sera.orgasm();
				pc.exhibitionism(1);
				IncrementFlag("SERA_PARTY_FUCKED");
				flags["SERA_PARTY_STAGE3"] = response;
			}
			// {merge}
			clearMenu();
			addButton(0, "Next", seraSexPartyStage3, "leave");
			break;
		case "leave":
			showName("ESTATE\nSAUNA");
			showBust("SERA");
			
			output("<i>“Most people have gone to the event room,”</i> Sera says as you emerge. <i>“I’m going there, and I want you there too. Don’t dawdle.”</i> Certainly there’s hardly anybody left in this dully lit room; the only other person you can see is Kirlarwe the anat, who is slumped looking morose in the sauna. You wonder whether to approach him, or follow after Sera.");
			
			// [Sauna] [Follow]
			clearMenu();
			addButton(0, "Sauna", seraSexPartyStage3, "sauna");
			addButton(1, "Follow", seraSexPartyStage3, "follow");
			break;
		// Follow
		case "follow":
			showBust("SERA");
			
			output("You have neither the time nor inclination to bother the moody anat. You hurry after your mistress.");
			
			processTime(1);
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "follow");
			break;
		// Sauna
		case "sauna":
			showName("ESTATE\nSAUNA");
			showBust("KIRLARWE");
			
			output("Kirlarwe looks up as you hesitantly approach the hot tub. Anat features are largely rigid but you think you see a gleam of recognition in his cold, blue eyes.");
			output("\n\n<i>“[pc.name] Steele, isn’t it? Join me if you wish. I won’t bite.”</i> He scoops some of the bubbling water up in his four-digit claws. It fades once away from the warm lights of the tub. <i>“Do not worry about your outfit. It’s holographic, see? Liquid light, or something along those lines.”</i> Carefully you sit yourself down in the tub. It’s a bizarre sensation; the water seethes and wraps itself around you as you’d imagine it would, but your skin remains quite dry. You feel tumble-dried.");
			output("\n\n<i>“You don’t look particularly happy,”</i> you say warily.");
			output("\n\n<i>“I have been trying to be happy all evening,”</i> he growls. <i>“It’s not working. My people have a pressing interest in luxury goods right now. We need reliable suppliers of things like alcohol and gene-mods if the Empire is to flourish, encourage others to join, to show we are not the repressive killjoys our detractors have us as. But that means dealing with - these kinds of people. And they are like...”</i> he lifts his claw and allows the liquid light to fade away from it again. <i>“I do not think a strong sense of civic duty is particularly useful at these sorts of functions. And as for entertainment – I would rather be at home with the three people that I love, and who love me in turn, for that.”</i>");
			output("\n\n<i>“What about my mistress?”</i> you say. <i>“She could provide what your frontier colonies will want, at least in part. And with investment...”</i>");
			output("\n\n<i>“Landon talks a good game, certainly. I have no indication whatsoever she is worth doing business with, though. I need someone who is a real specialist in gene-mods, not just any carpetbagger who stopped on the first station out here.”</i>");
			
			processTime(10);
			
			// [Cunt Nipples/Lipples] [Chocolate Cum] [Demon tail/tongue] [Cock shrinkage] [Estrobloom] [Chocolac] [Sera Herself] [Offer Blowjob]
			clearMenu();
			if(flags["SERA_UNLOCK_CLIPPEX"] != undefined) {
				if(InCollection(pc.breastRows[0].nippleType, [GLOBAL.NIPPLE_TYPE_FUCKABLE, GLOBAL.NIPPLE_TYPE_LIPPLES]))
					addButton(0, "Nipples", seraSexPartyStage3, "nipples", StringUtil.toDisplayCase(GLOBAL.NIPPLE_TYPE_NAMES[pc.breastRows[0].nippleType]), "Show him your specially modified nipples.");
			}
			if(flags["SERA_UNLOCK_SEMENS"] != undefined) {
				if(pc.hasCock() && InCollection(pc.cumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_CUM]))
					addButton(1, "Cum", seraSexPartyStage3, "cum", StringUtil.toDisplayCase(GLOBAL.FLUID_TYPE_NAMES[pc.cumType]), "Show him your specially modified cum type.");
			}
			if(flags["SERA_UNLOCK_LUCIFIER"] != undefined) {
				if(pc.tongueType == GLOBAL.TYPE_DEMONIC && pc.tailType == GLOBAL.TYPE_DEMONIC)
					addButton(2, "Tongue&Tail", seraSexPartyStage3, "tongue tail", "Demonic Tongue and Tail", "Show him your specially modified tongue and tail.");
				else if(pc.tongueType == GLOBAL.TYPE_DEMONIC)
					addButton(2, "Tongue", seraSexPartyStage3, "tongue tail", "Demonic Tongue", "Show him your specially modified tongue.");
				else if(pc.tailType == GLOBAL.TYPE_DEMONIC)
					addButton(2, "Tail", seraSexPartyStage3, "tongue tail", "Demonic Tail", "Show him your specially modified tail.");
			}
			if(flags["SERA_INCH_STEAL"] != undefined || flags["SERA_INCH_STEALING_SEX"] != undefined) {
				if(pc.hasGenitals())
					addButton(3, "CockShrink", seraSexPartyStage3, "cock shrink", "Cock Shrink", "Show him what Sera has done to your genitals.");
			}
			if(flags["PURCHASED_FROM_SERA"] != undefined) {
				if(pc.femininity >= pc.femininityMax() && pc.lipMod >= 2 && !pc.hasBeard() && pc.buttRatingRaw >= 9 && pc.tone <= 30 && pc.hairLength > 26)
					addButton(4, "Estrobloom", seraSexPartyStage3, "estrobloom", "Estrobloom", "Show him what Sera’s products have done for you.");
				if(pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK)
					addButton(5, "Chocolac", seraSexPartyStage3, "chocolac", "Chocolac", "Show him your modified milk type.");
			}
			addButton(6, "SeraHerself", seraSexPartyStage3, "sera", "Sera Herself", "Convince him about Sera.");
			addButton(7, "OfferBlowjob", seraSexPartyStage3, "blowjob", "Offer Blowjob", "Offer him some sex.");
			
			// Add more if more TFs get added mebbe
			break;
		case "nipples":
		case "cum":
		case "tongue tail":
		case "cock shrink":
		case "estrobloom":
		case "chocolac":
		case "sera":
		case "blowjob":
			showBust("KIRLARWE");
			
			if(response == "nipples") {
				output("<i>“See these?”</i> You");
				if(outfitPC == "schoolgirl") output(" unbutton your blouse");
				else if(outfitPC == "butler") output(" peel off your pasties");
				output(" and display your [pc.nipples] to him. <i>“Sera gave me them. She knows how to source extremely specialist stuff.”</i> The anat sits up and stares.");
				output("\n\n<i>“My,”</i> he grunts. <i>“You know, that’s probably the most interesting thing anyone’s shown me all night.”</i>");
				// Inf = +40
				seraInfluence(40);
			}
			else if(response == "cum") {
				output("<i>“Just... give me a moment...”</i> Trying not to feel too self-conscious, you reach into your");
				if(outfitPC == "schoolgirl") output(" knickers");
				else if(outfitPC == "butler") output(" thong");
				output(" and begin to pump your [pc.cock].");
				output("\n\n<i>“Please don’t do that,”</i> grates the anat, leaning away from you. <i>“I already said, I’m not interested in – oh.”</i> You don’t need to get all the way – you sigh as you drool pre-cum, its distinctively");
				if(pc.cumType == GLOBAL.FLUID_TYPE_CHOCOLATE_CUM) output(" rich brown");
				output(" beading from your [pc.cockhead].");
				output("\n\n<i>“Sera did that for me. ");
				if(pc.balls == 4) output("And...”</i> you present your quartet of testicles to him as tastefully as you can, which is not very. <i>“");
				output("She knows how to source extremely specialist stuff.”</i> The anat sits back and stares.");
				output("\n\n<i>“My,”</i> he grunts. <i>“You know, that’s probably the most interesting thing anyone’s shown me all night.”</i>");
				// Inf = +40
				seraInfluence(40);
			}
			else if(response == "tongue tail") {
				output("<i>“Don’t our bodies intrigue you, even a little?”</i>");
				if(pc.tongueType == GLOBAL.TYPE_DEMONIC && pc.tailType == GLOBAL.TYPE_DEMONIC) output(" Looking him in the eye you casually open your mouth, letting your sensuously long tongue roll outwards to touch the holographic foam. At the same time you shift your [pc.hips] and wiggle the fleshy spade of your tail at him.");
				else if(pc.tailType == GLOBAL.TYPE_DEMONIC) output(" You shift your [pc.hips] and wiggle the fleshy spade of your tail at him.");
				else if(pc.tongueType == GLOBAL.TYPE_DEMONIC) output(" Looking him in the eye you casually open your mouth, letting your sensuously long tongue roll outwards to touch the holographic foam.");
				output(" <i>“She could do that for your people, too.”</i>");
				output("\n\n<i>“They are interesting,”</i> he allows, drinking in your body. <i>“But I understand those transformations to be not all that popular outside of human circles. We’ll see.”</i>");
				// Inf = +20
				seraInfluence(20);
			}
			else if(response == "cock shrink") {
				output("<i>“See this?”</i> ");
				output("\n\nStanding up, you baldly");
				if(outfitPC == "schoolgirl") output(" pull down your panties");
				else if(outfitPC == "butler") output(" pull down your thong");
				output(" and display");
				if(pc.hasCock()) output(" [pc.eachCock]");
				else output(" [pc.eachVagina]");
				output(" to him. Kirlarwe smirks slightly.");
				output("\n\n<i>“Mm, yes. Am I supposed to be impressed?”</i>");
				output("\n\n");
				if(pc.hasCock()) output("<i>“It used to be bigger,”</i> you say placidly, looking him in the eye. <i>“But mistress didn’t like that. She doesn’t like her slaves having bigger dicks than she does. So she used a special cream to shrink me down, at the same time as transferring the tissue over to her. Did you catch yourself wondering why her tail is so long?”</i>");
				else
				{
					output("<i>“I used to be a");
					if(pc.hasVagina() && flags["SERA_CREATE_VAG"] != undefined) output(" guy");
					else output(" herm");
					output(",”</i> you say placidly, looking him in the eye. <i>“But mistress didn’t like that. So she used a special cream to change me, at the same time as transferring the tissue over to her. Did you catch yourself wondering why her tail is so long?”</i>");
				}
				output("\n\nThe anat has sat up straight, staring at you intently.");
				output("\n\n<i>“You... you aren’t lying about that, are you? I mean, who would... That’s easily the most interesting thing anyone’s shown me all night.”</i>");
				// Inf = +40
				seraInfluence(40);
			}
			else if(response == "estrobloom") {
				output("<i>“You wonder why I’m so pretty?”</i> You turn your head, simper slightly, allow him to see your beautiful, dimpling face in profile. <i>“Sera did that for me.”</i>");
				output("\n\n<i>“Sure, Estrobloom,”</i> shrugs Kirlarwe, unimpressed. <i>“I said </i>specialist<i> mods, not just someone who can supply standard beauty treatments.”</i>");
				// Inf = 0
				seraInfluence(0);
			}
			else if(response == "chocolac") {
				output("Holding his gaze, you slide your hands down to your [pc.nipples] and begin to knead them.");
				output("\n\n<i>“Please don’t do that,”</i> grates the anat. <i>“I already said, I’m not interested in – oh.”</i> You sigh as the liquid sweetness in your breasts surfaces readily, the rich brown dripping from your sensitive teats.");
				output("\n\n<i>“Sera did that for me. She knows how to source extremely specialist stuff.”</i>");
				output("\n\n<i>“Mm,”</i> he grunts, scratching his chin. <i>“I think I’ve seen that somewhere else before. Still... interesting.”</i>");
				// Inf = +20
				seraInfluence(20);
			}
			else if(response == "sera") {
				// Failsafe
				output("<i>“Sera advertises her modding ability through herself,”</i> you say. <i>“Don’t some of the things she’s got going intrigue you? The skin... the eyes... the phosphorous... difficult to believe she was baseline human, once.”</i>");
				output("\n\n<i>“They are interesting,”</i> he allows, scratching his chin. <i>“But I understand those transformations to be not all that popular outside of human circles. We’ll see.”</i>");
				// Inf = +20
				seraInfluence(20);
			}
			else if(response == "blowjob") {
				output("<i>“Why don’t you just lie back for a while,”</i> you say lowly and kindly, as you scoot over through the light water. <i>“Maybe once I’ve relaxed you a bit we can talk...”</i>");
				output("\n\n<i>“Get away from me!”</i> Kirlarwe angrily pushes you back. <i>“Haven’t you been listening to a single word I’ve said? Go on, get out of here! I regret wasting breath on someone like you.”</i>");
				output("\n\nYou beat a hasty retreat out of the pool and room. That could probably have gone better.");
				processTime(10);
				// Inf = -10
				seraInfluence(-10);
			}
			
			// Any option but “Offer Blowjob”
			if(response != "blowjob") output("\n\nYou sit and simmer in the bubbling, dry heat for a while longer and then, feeling you should go find out where Sera got to, get out and bid Kirlarwe farewell. He nods once without looking up, lost in his own thoughts.");
			
			processTime(8);
			
			// {merge w/ “Follow”}
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "follow");
			break;
	}
}

// Stage 4
public function seraSexPartyStage4(response:String = "none"):void
{
	clearOutput();
	author("Nonesuch");
	
	var outfitPC:String = flags["SERA_PARTY_STAGE1"];
	var outfitSera:String = flags["SERA_PARTY_ATTIRE"];
	
	// Create Vedice
	var ppVedice:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppVedice.hasVagina()) ppVedice.createVagina();
	ppVedice.shiftVagina(0, GLOBAL.TYPE_NAGA);
	ppVedice.vaginas[0].wetnessRaw = 5;
	if(ppVedice.totalVaginas() < 2) ppVedice.createVagina();
	ppVedice.shiftVagina(1, GLOBAL.TYPE_NAGA);
	ppVedice.vaginas[1].wetnessRaw = 5;
	
	switch(response)
	{
		case "none":
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		case "follow":
			rooms["RES DECK EAST ESTATE"].addFlag(GLOBAL.NPC);
			generateMap();
			showLocationName();
			clearBust();
			
			// Time forward 1 hour
			processTime(60);
			
			output("You hurry back into the big, main room where you started. The atmosphere is quite different from when you first entered – the lights have been dimmed, vast numbers of cushions have been laid out on the floor, muffling music heavy on the bass is playing, and a blue-tinged smoke hangs in the air which makes erotic memories tingle for you as it hits the back of your throat. Most of the remaining party goers are here and either in the process of getting, or already are, gleefully naked. Sera is in the middle of it, having apparently walked straight in and helped herself to the first two people she ran into. She’s not noticed you yet; she’s laughing to herself as the petite male kaithrit with the freckles");
			if(outfitPC != "butler") output(" dressed in a latex servant’s costume");
			else output(" dressed in an outfit not dissimilar from your own");
			output(" licks her nipple; the rahn in her other arm is frowning as she rummages between the demon’s thighs, her eyes distinctly unfocused.");
			output("\n\nVedice, on the other side of the room, certainly has noticed you. The decadently long snake lady has got someone trapped in her coils, but she has eyes only for you. She smiles wickedly as she holds your eye, wriggling her curvy body, letting her olive skin and green scales flow. It’s difficult to take your eyes off her. You’re startled out of your daze when you realize that Jarvis is also here; he’s sitting on his own in a quiet corner, smoking.");
			output("\n\nIt’s difficult to concentrate in here. Again you feel open and sensitized, intensely aware of your tight, submissive clothing and the increasing urgency with which beautiful flesh of all shades and hues around you is being grasped and melded together. Dimly you consider who you should approach first.");
			
			// [Sera] [Vedice] [Jarvis]
			clearMenu();
			addButton(0, "Sera", seraSexPartyStage4, "sera");
			addButton(1, "Vedice", seraSexPartyStage4, "vedice");
			addButton(2, "Jarvis", seraSexPartyStage4, "jarvis");
			break;
		// Jarvis
		case "jarvis":
			showBust("JARVIS");
			
			output("The blazer-attired host raises an eyebrow at you as you approach his seat.");
			output("\n\n<i>“I – my mistress sent me to you,”</i> you say, with a sudden burst of creativity. <i>“To see if you wanted anything.”</i>");
			output("\n\n<i>“How very kind of her,”</i> Jarvis murmurs in his measured, buried tone, his half-smile widening. <i>“Should I believe that, given she spared not a glance in my direction when she came in and that you arrived separately? Yes, I think I will. I do enjoy pleasing fictions, as you may have already gathered, " + pc.mf("Master","Miss") + " Steele.”</i> He taps his cigarette into an ashtray and sighs.");
			output("\n\n<i>“This will be hard for you and certainly for your mistress to believe, but when you get to my age you get a bit tired of the actual mechanics of sex, no matter how well wealth may have preserved you. The excitement of the chase, watching pretty young things satiate themselves, agog with the magic of discovery of themselves and others... no, those desires, on the other hand, they never leave you. Hence...”</i> He gestures at himself sitting in his chair and laughs wryly, his eyes on the increasingly frantic orgy in front of him. <i>“Voyeurism! The first and final perversion, domicile of horny young boys and lonely old men. You run along back to your mistress – and I do mean your mistress, not dear Vedice, who will eat you for breakfast - and thank her, " + pc.mf("Master","Miss") + " Steele. I suspect she will happily take credit. And then </i>enjoy<i> yourself. That is how you can best please me.”</i>");
			
			processTime(3);
			// Inf +20
			seraInfluence(20);
			
			// [Stay and Watch] [Sera] [Vedice]
			addButton(2, "Stay&Watch", seraSexPartyStage4, "stay");
			break;
		case "stay":
			showBust("JARVIS");
			
			output("<i>“I’d rather stay,”</i> you say. <i>“If that’s alright.”</i>");
			output("\n\nJarvis considers you a moment longer.");
			output("\n\n<i>“Are you ashamed to say you find participating a bit too intimidating? A strange shame to have, all things considered. But I don’t mind.”</i>");
			output("\n\nHe claps once, and a few moments later a kaithrit servant places a chair next to his, which you climb onto. You watch the sprawling theatre of noisy, frantic sex in companionable silence for a bit. Sera is by now sat back in a throne of cushions, balls deep in the cat twink; the rahn is sat back to back with him on the demon’s lap, sighing as your mistress runs her tongue up and down her smooth breasts, catching her nipples with her teeth hungrily. A gimp of indeterminate sex is face deep in her pussy, below the steady jounce of her male genitalia. All self-doubt forgotten, Sera looks like a pig who’s found the world’s deepest wallow.");
			
			processTime(2);
			flags["SERA_PARTY_STAGE4"] = response;
			
			// [Age] [Xenogen] [End]
			clearMenu();
			addButton(0, "Age", seraSexPartyStage4, "age");
			addButton(1, "Xenogen", seraSexPartyStage4, "xenogen");
			addButton(2, "End", seraSexPartyStage4, "end");
			break;
		case "age":
			showBust("JARVIS");
			
			output("<i>“How old are you, exactly?”</i> you ask,");
			if(!pc.hasCock()) output(" crossing your legs");
			else output(" squeezing your thighs together");
			output(". Jarvis snorts.");
			output("\n\n<i>“Neither a polite nor easy question that, Steele. Your father was </i>much<i> more charming.”</i> He squints in memory. <i>“That would have been... let’s see... Calirbe station. Much better situated than this one, above a ringed gas giant 50 times the size of Jupiter. The views were indescribably erotic, the party went on for a whole week – longer, because Victor talked a whole group of us into going ring surfing with him. Even then, you could see he had a fine future talking his way into every boardroom and bedroom in the galaxy...");
			// Inf > 170:
			if(seraInfluence() > 170) output(" although from the way I understand it, you’re even better than he was. People always underestimate submissives.");
			output("”</i>");
			output("\n\nYou close your eyes. This is beginning to sound wearingly familiar.");
			output("\n\n<i>“You didn’t...”</i>");
			output("\n\n<i>“Would it matter if I had?”</i> Jarvis shakes his head with a toothy grin, clearly enjoying your discomfort. <i>“It doesn’t seem to matter how disparate the galaxy has become or how far they have pushed their own boundaries, children never seem to lose a certain naivety about their parents’ sexuality.”</i> He lowers his voice. <i>“In your mind, do you see him as a big spoon or a little spoon?”</i>");
			output("\n\n<i>“And that was your first frontier rush?”</i> you ask, desperately changing the subject. He laughs.");
			output("\n\n<i>“This will be the fourth I’ve sat through, darling. Your father’s weakness was impulsiveness, and that’s what did for him in the end. If you don’t tamper with your genes too much, acquire wealth via patience and prudence and - of course - eat your greens, you can live for quite some time.”</i> He sighs, stubbing out his cigarette. <i>“Too long, for most. I am the oldest human I know, and it’s not because I lived healthier than everybody I knew of my generation. To live this long, you need... not to get too upset about seeing the same patterns emerge, over and over again. To love the sight of young people finding things out and applying it, even if you’ve seen it a million times before. To never feel that you’ve experienced everything the galaxy has to offer, even if that might be the most pleasant fiction of all. And, yes... develop a few hobbies.”</i>");
			output("\n\nHe smiles happily at the Bacchanalian scene currently unfolding in front of him.");
			
			processTime(5);
			
			addDisabledButton(0, "Age");
			break;
		case "xenogen":
			showBust("JARVIS");
			
			output("<i>“Is it true you founded Xenogen?”</i>");
			output("\n\n<i>“Oh, yes,”</i> says Jarvis, concentrating on a triple-dicked cundarian who is penetrating two gryvain at once, whilst some sort of satyr in turn vigorously buggers him. <i>“Not the first project I turned my hand to, but probably the most successful. And not alone, of course, but when you outlive all your co-founders people get into the unfortunate habit of crediting you and you alone. And blaming you and you alone for everything that went wrong.”</i> He runs a hand through his swept back hair. <i>“I don’t have much to do with them these days, of course. Even if you don’t visibly age you can’t last forever in a boardroom – no matter how perceptive or experienced or famous you might be the law of averages states you’re going to have a bad period at some point, and when that happens the thrusting young things under you see it’s time to shunt the old man in the direction of a likely pasture. It’s important to know that it’s going to happen some time, and be ready to go on your own terms.”</i>");
			output("\n\nHe laughs.");
			output("\n\n<i>“Does that sound bitter? I hope not. I produced hundreds of gene-mods I am proud of, I never lost the passion for that.”</i> He’s silent for a time. <i>“People are shaped by what they observe about the world. If you have the power to change how it looks, to change the aesthetics of being itself... you can change how people think, you can create new patterns of behavior you would never have imagined from your starting point. I think I may have managed to do that, once or twice with my very best creations, during my career. Broke the mold. It gives you hope, that, an urge to continue living. That sentient life isn’t simply a double helix, endlessly duplicating itself unto the void.”</i>");
			output("\n\nHe watches contemplatively as a large number of such helixes are squirted up the cundarian’s back.");
			
			processTime(5);
			
			addDisabledButton(1, "Xenogen");
			break;
		case "end":
			showBust("JARVIS");
			
			output("You spend the next hour or so sitting and chatting lightly with Jarvis, after which the prodigious orgy reaches something of a critical mass and breaks down a bit. The participants either split off with catches they’re particularly taken with to other parts of the mansion, or collapse in an exhausted heap. Sera is in the latter group, comatose with a big smile on her face, her arms and tail wrapped around various groaning aliens. You have felt an enduring level of arousal throughout it all,");
			if(pc.hasGenitals()) {
				if(pc.hasCock()) output(" [pc.eachCock] tenting your costume uncomfortably");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" [pc.eachVagina] slickening your underwear so it clings to you even tighter");
			}
			else output(" visibly blushing and shifting in your seat");
			output(", however towards the end you think you can almost grasp Jarvis’s perspective – you feel like you’ve experienced the sexual smorgasbord more vividly from observing it from a short distance than if you’d been buried underneath it.");
			output("\n\n<i>“Thank you for your company " + pc.mf("Master","Miss") + " Steele, it’s been a pleasure,”</i> murmurs Jarvis as finally you get up, preparing to take on the formidable task of waking Sera and convincing her it’s home time. <i>“I hope you can find your way to one of my little get-togethers again some time.”</i>");
			
			processTime(72);
			pc.changeLust(15);
			
			// {merge}
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "fin");
			break;
		// Vedice
		case "vedice":
			showBust("VEDICE");
			
			output("You can’t take your eyes off the snake woman. And really, why would you want to? Her luscious breasts, her dusky skin, the plush curve of her waist morphing into the striking patterns of her lower body, it’s a treat just to look at. And to touch... yes, you want that. You want that a lot. You aren’t really aware that you are moving across the room, stepping over prostrate bodies, eyes fixed on the naga. Her smile widens and she writhes her body slowly. Every time a lithe ripple runs up her considerable frame it feels like it’s shimmering through you, intensifying as you get closer, until it seems as if she’s a body of heat, every movement she makes radiating a throb of arousal through your own, sensitive form. By the time you stumble to a halt in front of her you’re completely transfixed. A small groan from her tail momentarily catches your attention. Trapped in her coils is a powerfully built, bald ausar with a razor sharp beard. His eyes are unfocused and he gasps as Vedice’s viridian tip slowly teases his nipple.");
			output("\n\n<i>“No, no, up here dear,”</i> hums Vedice. Gladly you return your eyes to her upper half, and her glistening lips split into a wide smile. <i>“That’s it, [pc.name] Steele, keep watching. It’s so pleasant, isn’t it? How warm and soft it feels to see me dance.");
			if(pc.hasLegs() && pc.hasKnees()) output(" Kneel for me");
			else output(" Prostrate yourself before me");
			output(" and maybe... maybe I’ll let you touch.”</i>");
			output("\n\nImmediately you do as she asks. Anything to touch that. It’s so hot, and there’s so much of it... it feels like she’s arching over you, all around you, and all you want to do is lick her, make her throb through you with approval.");
			output("\n\n<i>“Mmm, very good [pc.name] Steele,”</i> she hums, leering wider as she gently places a single finger on your crown. You stifle a whimper,");
			if(pc.hasVagina()) output(" [pc.oneVagina] wetting itself instinctively");
			else if(pc.hasCock()) output(" [pc.oneCock] straining against your outfit");
			else output(" your [pc.asshole] flexing with longing");
			output(" as pleasure pulses through you. <i>“Why do some people insist on bringing a prized toy to these things?”</i> she sighs, gently running her finger down your jaw line. <i>“They parade it around in front of me and as a result I am compelled to take it away from them, just to show how pathetic their attempts at domination are in comparison to mine. And it’s so easy, isn’t it dear? It’s not so much that toys don’t have willpower; it’s that they don’t </i>want<i> to have willpower. I am the only person here who can truly oblige that.”</i>");
			output("\n\nHer words echo and roll through your skull like the way her flesh coils and sways in front of you, a mountain of relentless beauty. The words could have emerged from your own mouth, you are no longer sure. It doesn’t matter; your thoughts are hers. Your goddess points downwards.");
			output("\n\n<i>“I’m giving you the honor of licking me first, darling. You will never taste anything better in your life. Do a good job and who knows... maybe I will add you to my permanent collection.”</i>");
			output("\n\nBlushing at the sheer magnitude of the privilege bestowed upon you, you carefully remove the gauzy blue shift shielding her wide front. At the meeting of scale and skin she has a dilated genital slit, out of which peek not one but two glistening vaginas. They sit next to each other clit-to-clit, rather like a pink number eight on its side. You bend forward and sink your tongue into the sucking heat of one.");
			output("\n\n<i>“That’s right dear,”</i> laughs Vedice. <i>“Taste infinity.”</i> Oh stars... her juices seem to melt into your [pc.lips] and tongue like sugar, and after a few seconds they begin to feel incredibly sensitive. When you reach in and lap at one of her pink buds again you cannot stifle a moan; it’s as if your mouth has become a vagina itself, and you are tribbing your mistress with it.");
			if(pc.hasCock()) {
				output(" [pc.EachCock] bulges, every worshipful lick you take in the naga’s channel sending fresh heat surging down");
				if(pc.cockTotal() == 1) output(" it");
				else output(" them.");
			}
			else if(pc.hasVagina()) {
				output(" [pc.EachVagina]");
				if(pc.isSquirter()) output(" dribbles");
				else output(" gushes");
				output(", every worshipful lick you take in the naga’s channel sending fresh heat blossoming through it/them.");
			}
			output(" Vedice’s sighs fill your ears");
			if(pc.hasTail()) {
				output(", and your [pc.tails] wag");
				if(pc.tailCount == 1) output("s");
				output(" back and forth happily, glad that you are of some small satisfaction to Mistress");
			}
			output(".");
			output("\n\n<i>“Ooh, not bad,”</i> she coos. Other guests are drawn to her as she writhes, moths to a flame, and without any guidance from her whatsoever put their lips to her olive skin. She strokes their heads vaguely; the ausar cries out as she tightens her coils whilst you bend your tongue deep into her, lavishing one tunnel with attention whilst bending it into her other. <i>“");
			if(pc.hasVagina() && !pc.hasCock()) output("I don’t usually take girls but I can tell your previous owner had you particularly well-trained... or maybe you are simply a born, groveling pussy-licker. I think I could make an exception...");
			else output("It’s a shame your previous owner did not grow out your dick. Obvious insecurity. In my experience, toys with the biggest penises are the easiest to lead; one whiff of pussy and...”</i> she laughs, stroking your [pc.hair] as you helplessly lick her dripping pink. <i>“Well, you know.”</i>");
			output(" The pleased hum of your goddess’s voice coupled with the ecstatic taste and texture of her sex is too much; still buried in her double snatch you tense up and moan as you cum,");
			if(pc.hasGenitals()) {
				if(pc.hasCock()) {
					if(pc.cumQ() < 200) output(" spurting");
					else output(" jetting");
					output(" [pc.cum] onto the floor in front of you");
				}
				else {
					output(" your pussy clenching up and");
					if(!pc.isSquirter()) output(" dribbling");
					else output(" spurting");
					output(" [pc.cum] down your [pc.hips]");
				}
			}
			else output(" your ass clenching and relaxing profusely");
			output(".");
			output("\n\n<i>“Oh dear,”</i> says Vedice in a distant voice, looking down at you lazily as she ruffles the hair of the naked human man licking her nipple. <i>“You");
			if(pc.hasGenitals()) output(" made a mess at my feet");
			else output(" came");
			output(". Without my permission.”</i> You feel snowballing dismay. How could you have been so feckless? You have to look away from her heavy-browed, disapproving visage, the shame is too great. <i>“Since this is a special occasion, and you have such a skilled tongue, I am going to forgive you this one time,”</i> she whispers. Warmth spreads through you again, the sun of forgiveness beaming down on you. <i>“Do it again and I will");
			if(pc.hasGenitals()) output(" make you lick it up and then");
			output(" lock you in chastity for a month, understood?”</i> You nod vigorously, not even daring to speak without her permission. <i>“I suppose now you wish to continue worshipping me.”</i>");
			output("\n\n<i>“Please, mistress,”</i> you groan. The words vibrate on your glistening, sensitized lips, making them throb, sending fresh arousal buzzing down to your core.");
			output("\n\n<i>“Oh, very well,”</i> Vedice sighs, as she thrusts her wet, addictive holes into your face. Joyfully you continue licking, curling your tongue deep into her, kissing her twin clits, making her gush and coo and when, a timeless age later, she coolly demands you cum you do so without hesitation, without stimulation; you need none, when there is the endlessly fascinating flesh of your goddess in front of you to explore with the wonderful, wet, tender mouth she’s given you...");
			
			processTime(55);
			// Inf 0
			seraInfluence(0);
			flags["SERA_PARTY_STAGE4"] = response;
			
			pc.changeLust(150);
			pc.orgasm();
			if(pc.hasCock()) pc.orgasm();
			if(pc.hasVagina()) pc.orgasm();
			pc.girlCumInMouth(ppVedice);
			pc.girlCumInMouth(ppVedice);
			pc.applyPussyDrenched();
			pc.exhibitionism(1);
			
			// {merge}
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "fin");
			break;
		// Sera
		case "sera":
			showBust("SERA");
			
			output("Your mistress instructed you to come here; it would be impolitic not to go to her, to put it lightly. Sera’s fluorescent eyes light up even further when they land on you, carefully picking your way through the heaving bodies towards her.");
			output("\n\n<i>“My [pc.boy],”</i> she says, lowly and gleefully. She sinks down onto a throne of cushions, carefully shifting the kaithrit and rahn to either side of her - the hands and tail she’s got buried in their nether regions ensuring they won’t go far - and spreads her thighs, displaying her improbably long, thick erection to you");
			if(flags["SERA_PARTY_STAGE3"] == "relax") output(", not bowed by your recent oral feats in the slightest");
			output(". <i>“Best seat in the house, and I saved it just for you. Show everyone what a well-trained slut you are.”</i>");
			output("\n\nYou put your hands on her soft thighs and slowly brush your way up it, letting her cock slide down");
			if(outfitPC == "butler") output(" your bared chest");
			else if(outfitPC == "schoolgirl") output(" your thin blouse");
			if(pc.hasBreasts()) output(" between your [pc.chest]");
			output(", breathing in its intoxicating musk as you do. You rise up, feeling the blunt bulb of her head travel down your abdomen and then poke impatiently between your [pc.hips]. It is with an exaggerated bob of your [pc.butt]");
			if(outfitPC == "schoolgirl") output(", causing your skirt to bounce and reveal your underwear,");
			output(" that you turn around.");
			if(outfitPC == "butler") output(" With the seat cut out from your tight trousers, your mistress has immediate access to her sugar, and you need do nothing else but pull your thong to one side and sink downwards.");
			if(outfitPC == "schoolgirl") output(" Slowly you pull down your knickers and sink downwards.");
			output("\n\n");
			// PC has vagina:
			if(pc.hasVagina()) output("You consider for a moment penetrating yourself on your [pc.vagina] – certainly your body cries out for it, seeping excitement down your thighs to the feeling of that juicy demon cock nestling into your nether regions – but your mistress wants a display, so a display it is. ");
			output("You press your [pc.anus] against the dome of Sera’s cock head, arching your back and biting your finger exaggeratedly at the intensity of it spreading your sphincter. You hear her growling in enjoyment, the two sluts she’s laden herself with gasping as she manhandles them more vigorously the further you descend, sliding more and more of her thick, hot pole into your colon. With no lubricant");
			if(pc.ass.wetness() >= 3) output(" except your own");
			output(" it’s lip-bitingly tough – but you have to do it, your mistress demands it, or so it seems in your smoky, sex-clouded mind. Your eyes cross as you keep going, your body straining to accommodate her");
			if(pc.hasGenitals()) {
				output(",");
				if(pc.hasCock()) output(" [pc.eachCock] jerking spontaneously as her meat rides over your prostate");
				else output(" [pc.eachVagina oozing excitement as her meat presses through into your tender walls");
			}
			output(". You moan hoarsely in triumph as you finally sit all the way down, her bloated balls pressing against your [pc.butt], utterly filled and plugged with your mistress.");
			
			pc.buttChange(sera.cockVolume(0));
			
			output("\n\n<i>“Such a good [pc.boy],”</i> breathes Sera, and you tense up around her in exultation.");
			output("\n\n<i>“I could’ve done that,”</i> mumbles the freckled kaithrit.");
			output("\n\n<i>“We’ll see,”</i> replies Sera coolly. <i>“Do a good job licking my pussy and who knows...”</i> She begins to slowly pump into you, drawing her massive prick out of your disgracefully abused sphincter only to firmly push it home again, jouncing you in her lap");
			if(pc.hasGenitals()) {
				output(", deliberately bending into you to press her hardness into your");
				if(pc.hasCock()) output(" boy buzzer");
				else output(" vaginal walls");
			}
			output(". The cat-boy’s fluffy ears tickle your [pc.hips] as he gets on his knees below you; behind, you feel the delightful softness of the rahn as she clambers onto Sera’s lap. The alien girl is soon bumping back into you, crying out gleefully as the succubus hungrily does things to her you can’t see but certainly can hear. Sera thrusts her sexes into you and the kaithrit demandingly as she teases the rahn, laughing ecstatically at her ability to satiate her own over-reaching carnal greed.");
			
			processTime(20);
			flags["SERA_PARTY_STAGE4"] = response;
			
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "sera sex");
			break;
		case "sera sex":
			showBust("SERA", "VEDICE");
			
			output("You don’t pay any attention to the smooth shifting sound until it is right on top of you; your own world is centered necessarily around the very large, hot obstruction in your butt, your mouth opening to the wonderful sluttiness of being able to take every inch like a champ and reveling in the warm tenseness of an approaching orgasm. Your eyes shoot open when somebody immediately in front of you speaks in a dusky, throaty voice.");
			output("\n\n<i>“I must say dear, I am quite jealous,”</i> says Vedice, rolling her “r”s as she takes in the scene of frantic decadence in front of her. The incredibly tall and voluptuous snake woman has brought along the person trapped in her incredibly long, patterned coils – a bald, powerfully built ausar with a razor sharp beard, his eyes unfocused – but she pays him zero attention, aside from teasing a red nipple with her tail’s tip. <i>“What an obedient, well-trained toy you’ve brought along! It’s so rare to see that kind of loyalty and dedication displayed at these dos, you know. I wonder - may I make use of [pc.his] mouth?”</i>");
			output("\n\n<i>“Since you asked so nicely,”</i> says Sera loftily. You are in no state to protest as she gets up and shoves you forward, repositioning you on your hands");
			if(pc.hasLegs() && pc.hasKnees()) output(" and knees");
			else output(" and [pc.legOrLegs]");
			output(" on the floor, her cock still firmly wedged in your [pc.butt]. Soft pressure spreads itself on your back as the cat-boy is ordered to plant his cute, round butt on you; he murmurs in disquiet at the two exquisitely evil-looking women he is now sat between. You stare up at the curvy, olive-skinned colossus that is Vedice. Her glistening, green lips split into a wide smile as she dilates the genital slit at the meeting of skin and scale, opposite your face. Within she has not one but two glistening vaginas. They sit next to each other clit-to-clit, rather like a pink number eight on its side.");
			output("\n\n<i>“You’ll enjoy this dear,”</i> she purrs. <i>“Trust me.”</i> Whether you will or not you have little choice in the matter; Sera’s thighs smack into your");
			if(pc.tone < 65) output(" soft");
			else output(" muscular");
			output(" behind as she continues to rail you, the rahn now buried in her pussy behind her driving her on to fuck you harder and harder, the hard cock stretching your guts forcing your face forward into the naga’s extravagant wet heat. You slather one of her clits in attention, and then curl your tongue deep into her tunnel, making her coo. Oh stars... her juices seem to melt into your [pc.lips] and tongue like sugar, and after a few seconds they begin to feel incredibly sensitive. When you reach in and lap at one of her pink buds again you cannot stifle a moan; it’s as if your mouth has become a vagina itself, and you are tribbing her with it.");
			if(pc.hasCock())
			{
				output(" [pc.EachCock] bulges, every worshipful lick you take in the naga’s channel sending fresh heat surging down");
				if(pc.cockTotal()) output(" it");
				else output(" them");
				output(".");
			}
			else if(pc.hasVagina())
			{
				output(" [pc.EachVagina]");
				if(!pc.isSquirter()) output(" dribbles");
				else output(" gushes");
				output(", every worshipful lick you take in the naga’s channel sending fresh heat blossoming through");
				if(pc.totalVaginas() == 1) output(" it");
				else output(" them");
				output(".");
			}
			output(" Vedice’s sighs fill your ears, combining with the gasps of the kaithrit and the sound of the pinching and pulling of his tight flesh as both she and Sera idly torture him.");
			output("\n\n<i>“I like your mods,”</i> husks your mistress. <i>“Where did you get them?”</i>");
			output("\n\n<i>“Phyrae’s, on Sar Burer,”</i> replies Vedice, doing something that makes the boy on your back clench his slim thighs into your ribs and whimper. <i>“Very exclusive - as I’m sure you’re aware, darling - and stocks some </i>very<i> naughty things thanks to Sar Burer’s private charter. It can be such a bother getting on and off there, though.”</i>");
			output("\n\n<i>“You should come to my place,”</i> says Sera. She pauses to slam her palm into your [pc.butt], making you jerk into the slathering heat of Vedice’s pussies and clench up around her dick. The naga murmurs approvingly. <i>“Tavros has the same legal loopholes – as I’m sure you’re aware – and I could show you some things that would interest you.”</i>");
			output("\n\n<i>“Maybe I will,”</i> hums Vedice. <i>“I do like your eyes. Right there, dear – that’s it. That’s it...”</i> She sighs with deep satisfaction as you surround both her clits with your tender, throbbing lips, tenses up and then rewards you by slathering a gush of lubricant all over your face. The heat coursing through you from whatever sensitizing substance she’s exuding from her pussies combined with the heavy, unrelenting thrusting of your mistress’s fevered prick are too much; you groan woozily into Vedice’s wet womanhoods as you seize up with orgasm");
			if(pc.hasGenitals())
			{
				output(",");
				if(pc.hasCock()) {
					if(pc.cumQ() < 200) output(" spurting");
					else output(" jetting");
					output(" [pc.cum] onto the floor in front of you");
				}
				else {
					output(" your pussy clenching up and");
					if(!pc.isSquirter()) output(" dribbling");
					else output(" spurting");
					output(" [pc.girlCum] down your [pc.hips]");
				}
			}
			output(".");
			output("\n\n<i>“Bit undisciplined, isn’t [pc.he]?”</i> says the naga dispassionately.");
			output("\n\n<i>“Yeah, but... ungh... lasting power like you wouldn’t believe.”</i> The rahn slurps and Sera throws her head back and wails out in double orgasm, pumping surge after surge of cum into the quivering mess that is you. You exhale hoarsely as you feel your intestines being filled with heavy, liquid warmth. She rests for a moment against you, her dick still wedged firmly in your ass. <i>“Like, we can go as many times as you like,”</i> she goes on, breathing hard. <i>“[pc.he] will take it all. Won’t you, piggy?”</i>");
			output("\n\n<i>“Sounds good to me,”</i> says Vedice dreamily. <i>“I was just getting started anyway.”</i> ");
			output("\n\nThis time the cat boy howls and practically jumps off your back to whatever it is she does to him. You moan as the two dommes push into you from either end again, concertina-ing you and drowning everything else in the world out except their dripping, intoxicating, insistent sexes...");
			
			processTime(45);
			// Inf +30
			seraInfluence(30);
			
			pc.changeLust(150);
			pc.orgasm();
			pc.orgasm();
			if(pc.hasCock()) pc.orgasm();
			if(pc.hasVagina()) pc.orgasm();
			pc.girlCumInMouth(ppVedice);
			pc.girlCumInMouth(ppVedice);
			pc.girlCumInMouth(ppVedice);
			pc.girlCumInMouth(ppVedice);
			pc.loadInAss(sera);
			pc.loadInAss(sera);
			pc.loadInAss(sera);
			pc.loadInAss(sera);
			sera.orgasm();
			sera.orgasm();
			pc.applyPussyDrenched();
			pc.exhibitionism(1);
			IncrementFlag("SERA_PARTY_FUCKED");
			
			// {merge}
			clearMenu();
			addButton(0, "Next", seraSexPartyStage4, "fin");
			break;
		// Fin
		case "fin":
			rooms["RES DECK EAST ESTATE"].removeFlag(GLOBAL.NPC);
			// Time +2 hours
			processTime(120);
			moveTo("9018");
			showLocationName();
			
			showBust("SERA");
			
			output("It is some time later. You are walking back to the Dark Chrysalis through the thankfully peaceful walkways of Tavros, arm-in-arm with Sera.");
			// Sat and watched:
			if(flags["SERA_PARTY_STAGE4"] == "stay") {
				output(" Although she’s gripping you firmly, her breast pushing into your side, it is not you that needs the support. The clack of her stilettos is unsteady.");
			}
			// Went to Sera:
			if(flags["SERA_PARTY_STAGE4"] == "sera") {
				output(" It’s not altogether obvious who is supporting whom. Sera is quite drunk but you are");
				if(pc.hasLegs()) output(" walking");
				else output(" moving");
				if(pc.hasKnees() && pc.isBiped()) output(" knock-kneed");
				else output(" very tenderly");
				output(", your [pc.anus]");
				if(pc.hasGenitals()) output(" and [pc.groin]");
				output(" mightily sore.");
			}
			// Went to Vedice:
			if(flags["SERA_PARTY_STAGE4"] == "vedice") {
				output(" It’s not altogether obvious who is supporting whom. Sera is quite drunk but you are");
				if(pc.hasLegs()) output(" walking");
				else output(" moving");
				output(" very tenderly, your [pc.groin] sore and mind a hung over, green-flavored haze.");
			}
			output("\n\n<i>“Whoo!”</i> crows your mistress, her voice echoing off the surrounding darkened buildings. <i>“What a night. Don’t those rich pricks know how to party? I told you they did, didn’t I? And you... you didn’t believe me,”</i> she goes on, poking you in the [pc.chest] in a tone of deepest satisfaction. She stumbles slightly.");
			// Sat and watched:
			if(flags["SERA_PARTY_STAGE4"] == "stay") {
				output(" <i>“You know I’m - I’m very angry with you. Why didja spend all night sitting with Jarvis like some - some sitting thing? I wanted you to come and have fun with me.”</i>");
				output("\n\n<i>“You told me to go over to him,”</i> you reply calmly. <i>“Present myself as a gift.”</i>");
				output("\n\n<i>“I - ? Yeah, I did, didn’t I,”</i> Sera agrees confidently. <i>“Just – don’t spend all night gifting yourself to old guys next time, okay? I wanna do some unwrapping too.”</i>");
			}
			// Went to Vedice:
			if(flags["SERA_PARTY_STAGE4"] == "vedice") {
				output(" <i>“You know I’m – I’m very angry with you. Why didja wander off with that snake cow for, huh? I’m your mistress, not her.”</i> She giggles slightly. <i>“You know if I hadn’t stepped in, I could have sworn she was going to take you home with her! Probably to, like, a snake pit or something.”</i> She laughs hilariously at her own Wildean wit. <i>“Good thing your mistress looks out for you even when you’re being the sluttiest of sluts, ain’t it?”</i>");
				output("\n\n<i>“Uh huh,”</i> you say fervently. You close your eyes as once again your lips tingle and the taste of Vedice comes vividly back; your [pc.groin] throb");
				if(pc.totalGenitals() + pc.balls <= 1) output("s");
				output(" achingly at the same time. You really hope the blowback the evil naga has inflicted on you doesn’t last.");
			}
			// Went to Sera:
			if(flags["SERA_PARTY_STAGE4"] == "sera") {
				output(" <i>“And we showed ‘em, didn’t we? How to really get down. ‘Specially that snake cow. A snot like her actually coming over and asking to use you...”</i> Sera closes her eyes and savors it, squeezing you tightly. <i>“I’ll always remember that. What a team we make!”</i>");
				output("\n\n<i>“Uh huh,”</i> you say dully. You close your eyes as once again your lips tingle and the taste of Vedice comes vividly back; your [pc.groin] throbs achingly at the same time. It occurs to you that one part of this team is taking many more for the team than the other, so to speak. But then you did agree to all of this, obliging slut that you are.");
			}
			output("\n\nBy the time you get back to the Dark Chrysalis, Sera has sobered up a bit. She breaks off from you, trailing her hand down your arm as she fumbles for her key.");
			output("\n\n<i>“Keep the costume. My thanks for coming along. Make sure to get plenty of use out of it – I’m sure I won’t be the only one who thinks you look cute in it...”</i> She gets the door open and turns back to you. <i>“Seriously [pc.name], thanks for doing this. I had a good time, and – it made it easier, knowing you were around, ‘n I could talk to you. And even if nothing comes of it, we got loads of free sex and booze out of it, didn’t we? That’s what really matters.”</i> She smiles and disappears inside.");
			
			// Shut the Dark Chrysalis for about 6 hours afterwards
			pc.createStatusEffect("Dark Chrysalis Closed", 0, 0, 0, 0, true, "", "", false, 360);
			flags["SERA_PARTY_INVITE"] = 2;
			flags["SERA_PARTY_DATE"] = GetGameTimestamp();
			
			clearMenu();
			addButton(0, "Next", seraExitToMain);
			break;
	}
}

/*

0-90: You suck, or possibly did not suck enough
100-190: You did good
200-250: Congratulations you are the champion of whoring yourself out and your chariot awaits

*/

// Conclusion
public function seraSexPartyConclusion():void
{
	clearOutput();
	author("Nonesuch");
	
	output("<i>“How have things been going? Since the party, I mean.”</i>");
	
	// If <5 days since party event finished:
	if((flags["SERA_PARTY_DATE"] + (5 * 24 * 60)) > GetGameTimestamp())
	{
		showSera();
		
		output("\n\n<i>“I’m chasing things. Phoning numbers, sending e-mails, poking people who said they wanted to hook up, that kind of thing,”</i> replies Sera. <i>“There might be one or two interesting developments, we’ll see. These things take time bitch, don’t fret over it.”</i>");
		
		processTime(1);
	}
	// If >5 days
	else
	{
		showBust("SERA","FIX");
		
		if(seraInfluence() <= 90)
		{
			output("\n\nThere’s a strange, wet rasping sound coming from somewhere, but it doesn’t seem to have anything to do with Sera, who has gotten up and slowly tack-tacked around the counter in response to your question, listlessly running her fingers over her ornaments.");
			output("\n\n<i>“I dunno,”</i> she says eventually. She examines her prints for dust and then sighs. <i>“To be honest [pc.name], I don’t think anything’s gonna come from it. I leave messages on numbers I got given and nobody ever responds, I send emails and get automated responses, telling me to leave messages on OTHER automated emails, and... it’s bullshit, all of it’s bullshit. None of those pampered core-ward tourists are really interested in some podunk mod shop on the edge of nowhere - I feel stupid, like a used whore for even trying with them. It’s for the best, really. I will make this place a success my own way, without having to suck a mile of dick to do it.”</i>");
			output("\n\nWhatever she says you can tell from the slump of her shoulders and the way she’s not looking at you that she’s bitterly disappointed. She sighs and dismisses it with a shake of her head, strides back behind the desk. <i>“It doesn’t matter. I mean in terms of the party itself, it was very productive. Wouldn’t you say, Fix?”</i>");
			output("\n\n<i>“Yes mistress,”</i> says a small voice on the other side of the counter; the rhythmic rasping sound stops momentarily. Moving so that you can see over it you find the source – a slender kaithrit boy with apple cheeks and freckles, naked except for a latex shorts and chastity device combo, finishing off the bowl of wet, off-white substance in front of him with his rough, pink slip of a tongue. He has eyes only for the purple succubus towering over him. <i>“Please now may I - ?”</i>");
			output("\n\n<i>“Go into the back,”</i> Sera orders coolly. <i>“We’ll see if you’ve done enough to earn a thorough prostate examination in a moment.”</i> She smirks at his retreating back before returning to you. <i>“Was there something else you wanted?”</i>");
			
			processTime(5);
			flags["SERA_PARTY_INVITE"] = 3;
		}
		else if(seraInfluence() <= 190)
		{
			output("\n\nThere’s a strange, wet rasping sound coming from somewhere, but it doesn’t seem to have anything to do with Sera, who has gotten up and briskly tack-tacked around the counter in response to your question, running her fingers over her ornaments.");
			output("\n\n<i>“Oh...not bad, not bad,”</i> she says, examining her prints for dust. Although she’s feigning nonchalance it’s clear she’s been waiting for you to ask this question for some time. <i>“I’ve definitely been getting more customers through the door. Paying ones too, rather than looking ones or maybe-I’ll-go-across-the-street-to-the-other-place-because-I’m-a-fucking-jackass ones. People have been placing orders as well, and I’ve found a new supplier who trades in </i>really<i> cool shit, so I’ll be in a better position to meet demand. Much better than all that though...”</i> she’s clutching the Anubis ornament excitedly as she talks to you, her inhuman eyes lit up, affectations of casualness forgotten.");
			output("\n\n<i>“...Today I secured a commission to supply a whole frontier colony with luxury mods for a year. A year! I can use the money from that to pay off my outstanding debt. You wouldn’t </i>believe<i> how that has been hanging over me, pet. I kept imagining never being able to get rid of it, and then getting indentured to some creepy psychopath or having to phone my dad asking for help... it’s gone. I’m free. Free to really enjoy myself.”</i> She grins widely at you, yellow eyes running up and down your frame, before turning with a flick of blue hair and sashaying back behind the counter. <i>“Isn’t that nice, Fix?”</i>");
			output("\n\n<i>“Yes mistress,”</i> says a small voice on the other side of the counter; the rhythmic rasping sound stops momentarily. Moving so that you can see over it you find the source – a slender kaithrit boy with apple cheeks and freckles, naked except for a latex shorts and chastity device combo, finishing off the bowl of wet, off-white substance in front of him with his rough, pink slip of a tongue. He has eyes only for the purple succubus towering over him. <i>“Please now may I - ?”</i>");
			output("\n\n<i>“Go into the back,”</i> Sera orders coolly. <i>“We’ll see if you’ve done enough to earn a thorough prostate examination shortly.”</i> She smirks at his retreating back before returning to you. <i>“Thanks again for helping me, [pc.name]. I don’t think any of my other bitches would have been anywhere near as useful as you were at that party. Now... was there something else you wanted?”</i>");
			
			processTime(6);
			flags["SERA_PARTY_INVITE"] = 3;
		}
		else
		{
			output("\n\nThere’s a strange, wet rasping sound coming from somewhere, but it doesn’t seem to have anything to do with Sera, who has gotten up and tack-tacked around the counter in response to your question, absentmindedly running her fingers over her ornaments.");
			output("\n\n<i>“It’s been... I don’t know how to put it.”</i> She laughs suddenly, a sound of pure joy, undistorted by her usual strains of malice. <i>“It’s like everything I’d been doing here up until that party was just </i>playing<i> at being a merchant. Now I’m actually doing it. I’m so connected, so many doors I didn’t know fucking existed have opened for me, I can’t even keep up. There have been lots more customers coming in, loads of orders being placed - more than I can cope with right now - but since I’ve been approached by half a dozen new suppliers that won’t be a problem for long. Much better than that though...”</i> she’s clutching the Anubis ornament excitedly as she talks, her inhuman eyes shining.");
			output("\n\n<i>“...I’m actually getting commissions. Three frontier colonies have asked me to supply them with luxury mods for a year, with views to extend. A year! I can use the money from that to pay off my outstanding debt. You wouldn’t </i>believe<i> how that has been hanging over me, pet. I kept imagining never being able to get rid of it, and then getting indentured to some creepy psychopath or having to phone my dad asking for help... it’s gone. I’m free. Free to really enjoy myself.”</i> She grins widely at you, yellow eyes running up and down your frame, before turning with a flick of blue hair and sashaying back behind the counter. <i>“Isn’t that nice, Fix?”</i>");
			output("\n\n<i>“Yes mistress,”</i> says a small voice on the other side of the counter; the rhythmic rasping sound stops momentarily. Moving so that you can see over it you find the source – a slender kaithrit boy with apple cheeks and freckles, naked except for a latex shorts and chastity device combo, finishing off the bowl of wet, off-white substance in front of him with his rough, pink slip of a tongue. He has eyes only for the purple succubus towering over him. <i>“Please now may I - ?”</i>");
			output("\n\n<i>“Go into the back,”</i> Sera orders coolly. <i>“We’ll see if you’ve done enough to earn a thorough prostate examination shortly.”</i> She smirks at his retreating back before returning to you. <i>“You know,”</i> she says huskily, leaning on the counter, pointedly displaying her breasts to you, <i>“By performing so well at that party, really making those fat cats’ heads turn, you’ve actually made life harder for me. There’s so much that needs to be done, I’m going to have to start employing people. And I think I know who I’m going to engage first.”</i> She leers at you.");
			output("\n\n<i>“Me? But I can’t...”</i>");
			output("\n\n<i>“Calm your tits,”</i> Sera replies serenely. <i>“You have things that need doing on the frontier, you’ve made that obvious. But I am putting you on the payroll. Small weekly stipend as my field researcher. All you gotta do to claim it is to report in.”</i> She’s grinning widely, following the curve of her generous bust with her fingers, obviously enjoying herself. <i>“Don’t think of it as a reward. Think of it as a leash. A reason you have to come back here and address your mistress, let her do the things she does to you at the same time.”</i> She bites her lower lip. <i>“Now... was there something else you wanted?”</i>");
			
			processTime(7);
			flags["SERA_PARTY_INVITE"] = 4;
			flags["SERA_SALARY_DATE"] = GetGameTimestamp();
		}
	}
	
	clearMenu();
	addButton(0, "Next", seraMenu);
}

// Salary
public function seraGetSalary():void
{
	if(flags["SERA_SALARY_PAID"] != undefined && !pc.hasKeyItem("Sera’s Collar"))
	{
		seraGiftCollar();
		return;
	}
	
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var surpriseSex:Array = [seraMenu];
	var selFunc:Function = seraMenu;
	
	if(pc.hasCuntTail()) surpriseSex.push(getTailUsedBySera);
	if(pc.hasParasiteTailCock()) surpriseSex.push(seraCockvineScene);
	if((flags["MET_FEMALE_RASKVEL"] != undefined || flags["MET_MALE_RASKVEL_GANG"] != undefined || flags["MET_KEROKORAS"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined) && pc.hasGenitals()) surpriseSex.push(seraTongueFuckBonus);
	
	if(surpriseSex.length > 0) selFunc = surpriseSex[rand(surpriseSex.length)];
	
	output("<i>“So... can I have my salary? Mistress?”</i> Sera leans back on her stool, crosses her legs.");
	output("\n\n<i>“Tell me about the things you’ve seen first,”</i> she says. <i>“And gotten on your knees for, no doubt.”</i>");
	output("\n\nWith the help of your codex you outline what you’ve been up to, the planets you’ve visited and the sights you’ve seen.");
	
	if(selFunc == seraTongueFuckBonus)
	{
		seraTongueFuckBonus();
		return;
	}
	
	output(" Sera seems glazed by this formality she’s invented for you at first, but does gradually get into it, making you go back over your hornier exploits until you find yourself more embarrassed about them than you did even at the time. That she makes you feel red is palpably what she really wants from this “field research”, and she’s got a big shit-eating grin on her face by the end.");
	output("\n\n<i>“Very good, Steele,”</i> she purrs. <i>“Could definitely do with more bits about you getting alien reproductive fluid samples all over your face, though. Think about that for next time.”</i> She taps her store screen carelessly, and your bank account is updated.");
	
	processTime(15 + rand(16));
	
	seraGetDosh();
	
	clearMenu();
	addButton(0, "Next", selFunc);
}
public function seraGetDosh():void
{
	/*
	var weeksPast:int = Math.floor((GetGameTimestamp() - flags["SERA_SALARY_DATE"]) / 60 / 24 / 7);
	var totalCredits:int = 0;
	for(var i:int = 0; i < weeksPast; i++)
	{
		totalCredits += 1500 + rand(501);
	}
	*/
	
	// Weekly cap instead:
	var totalCredits:int = 1500 + rand(501);
	
	output("\n\nYou’ve earned " + totalCredits + " credits!");
	
	pc.credits += totalCredits;
	flags["SERA_SALARY_DATE"] = GetGameTimestamp();
	IncrementFlag("SERA_SALARY_PAID");
}

