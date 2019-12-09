import classes.Characters.SlamwulfeDrone;

//Punk SecOp Core Idea
//Kaithrit, comes in female in male flavors. Shares several scenes with a few unique based on gender.
//Girl has big knockers. Boi has A or B cups.
//Wear’s “augment weave armor” that looks sorta like the crysis suit without a helmet
//Ideal for interfacing with tech. Can be remote-opened by a hack or the SecOp’s radio implant.
//Cybernetic implants have distinct seams
//
//Personality/Interaction Flow:
//Generally orderly and business-like. The pirate equivalent of cops.
//Notes the PC isn’t supposed to be here (unless the PC has a jumper suit & bun ears or a rat armor and mouse ears).
//PC is escorted back to the elevator
//If PC resists, PC is subdued and dragged back to the elevator.
//Has a pair of “Slut Goggles” for restraining defeated foes. Uses electromagnetic fields to hyperstimulate the pleasure centers of the brain while suppressing the parts responsible for discerning between fantasy/reality. At the same time, they play high-def VR porn.
//Allows for lewd loss scenes from enemies who might not be turned on.
//Allows for more variety in loss scenes, ala Mindwash Visor.
//Still have the option of doing normal loss scenes instead, maybe gated behind turning on the enemy?
//If PC is goggled, comes to in the elevator, maybe randomly covered in fluids.
//
//Cybernetic Mods:
//Finger/Foot paw-pads replaced with rubberized grip assists
//Holovisor projected over eyes for targeting assist. Projectors built into sides of head.
//Antenna implant in right ear for always-on comms
//Sphynx-grade artificial tendons for hyper-pounce jumping. (12' vertical leaps!)
//Male: 13" robocock with rapid-brewing cum-tanks and throb-o-matic pulsator. (Latex/Rubbery in appearance.)
//Female: Artificial cunt with patented cock-control™ technology and optional expando-clit upgrade. Still soft and squishy but with a visible seam where it meets the organic parts of her. Sort of like this.
//Aphrodisiac lactating cybernips?
//Tongue is long and has a subdermal muscle augmentation that makes it very strong and very coordinated. Can curl into a helix and press out on every part of the PUSS.
//
//Combat Abilities & AI:
//Grins before attacking if the PC uses a stealth field. Sees right through it courtesy of the visor. (Effectively dispels the status)
//Summons a Slamwulf drone (1x/fight). Basic kinetic attack drone.
//HoT shield restore (33 energy)
//Volley (20) energy)
//(1x fight: smuggled stims for energy restore)
//If disarmed: punch!
//Once above 50 lust:
//Puts on gasmask and tosses aphrogas grenade (Lust over time - think I can reuse the status from myrellion)
//Fuck_Boy_Protocols.exe - Slamwulf teeth retract swap with aphrodisiac injectors.
//Bouncing Tease - Leap onto PC’s shoulders and open suit, rubbing junk in face. +Tease! Suit seals back up after.
//Weapon Hack - disable energy weapons

/* ============= FLAGS ===================
	SECOP_SLIT_SLUTTINGS	Count of slit slut hypnoprogram.
	SECOP_WALLSLUTTINGS		Count of wall slut hypnoprogram
	SECOP_TAURSLUTTINGS		Count of Wsan's taurslut scene.

*/

public function showPunkSecOp(nude:Boolean = false):void
{
	if(enemy == null || enemy.hasCock()) showBust("PUNK_SECOP_MALE" + (nude ? "_NUDE":""));
	else showBust("PUNK_SECOP_FEMALE" + (nude ? "_NUDE":""));
	showName("PUNK\nSECOP");
}
public function secOpMaleSubmission(arg:Number = 0):Number
{
	if(flags["SECOP_MALE_SUBMISSION"] == undefined) flags["SECOP_MALE_SUBMISSION"] = 0;
	flags["SECOP_MALE_SUBMISSION"] += arg;
	if(flags["SECOP_MALE_SUBMISSION"] < 0) flags["SECOP_MALE_SUBMISSION"] = 0;
	return flags["SECOP_MALE_SUBMISSION"];
}
public function secOpFemaleSubmission(arg:Number = 0):Number
{
	if(flags["SECOP_FEMALE_SUBMISSION"] == undefined) flags["SECOP_FEMALE_SUBMISSION"] = 0;
	flags["SECOP_FEMALE_SUBMISSION"] += arg;
	if(flags["SECOP_FEMALE_SUBMISSION"] < 0) flags["SECOP_FEMALE_SUBMISSION"] = 0;
	return flags["SECOP_FEMALE_SUBMISSION"];
}
//Encounter Texts:
public function encounterPunkSecOp():Boolean
{
	var tEnemy:Creature = new CyberPunkSecOp();
	setEnemy(tEnemy);
	showPunkSecOp();
	//First time male
	if(tEnemy.hasCock())
	{
		if(secOpMaleSubmission() >= 3)
		{
			maxSubmissionSecopEncounterText(tEnemy);
			return true;
		}
		output("\n\n<i>“Hey, you aren’t supposed to be here!”</i>");
		output("\n\nA swaggering kaithrit in a suit that looks like it’s made from coiled steel is advancing with long, bounding leaps. The bright blue holovisor across his eyes flickers, painting a red outline around the shape of your body.");
		output("\n\nHe’s too sure of himself to bluff and too fast to hide from. You’ll have to fight!");
		
		IncrementFlag("MET_SECOP_MALE");
	}
	//Female
	else
	{
		if(secOpFemaleSubmission() >= 3)
		{
			maxSubmissionSecopEncounterText(tEnemy);
			return true;
		}
		if(InCollection(pc.race(),["rodenian","half-rodenian","mouse-morph","mouse-boy","mouse-girl","rat-morph","rat-girl","rat-boy","rat-man","mouse-man"]) && rand(2) == 0 && !pc.hasStatusEffect("MausbullyCD") && pc.hasGenitals())
		{
			mausBullyScene(tEnemy);
			return true;
		}
		output("\n\n<i>“Oh come on! Another one?”</i> A bosomy kaithrit in a suit that looks like it’s made from coiled steel is advancing with a slow shake of her head. <i>“Independents aren’t allowed up here without a boss’s okay and you, cutie, do </i>not<i> have a boss’s okay.”</i> The pale blue band of her cybernetically-projected holovisor lights up with an outline of your body as she finishes some kind of scan. <i>“Come on. If you walk back to the elevator on your own, " + pc.mf("you won’t have to tell everyone you got your ass whupped by a girl","I won’t have to leave any bruises on that pretty face of yours") + ".”</i>");
		output("\n\nYou’ve been given a choice - be escorted away or fight for the freedom to continue your exploration.");
		
		IncrementFlag("MET_SECOP_FEMALE");
	}
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatASecop);
	CombatManager.lossScene(loseToPunkSecOP);
	CombatManager.displayLocation("PUNK SECOP");
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
	return true;
}

//Loss Visor Intro (Generic)
//For use with all visor intros unless ya’ll wanna get fancy.
public function loseToPunkSecOP():void 
{
	var enemies:Array = CombatManager.getHostileActors();
	for(var i:int = 0; i < enemies.length; i++)
	{
		if(enemies[i] is SlamwulfeDrone) CombatManager.removeHostileActor(enemies[i]);
	}

	var submission:Number = (enemy.mf("m","") == "m" ? secOpMaleSubmission(1):secOpFemaleSubmission(1));

	//Personal scenes~
	if(submission == 3)
	{	
		if(enemy.mf("m","f") == "f") smotheringFemdomWivTittyKitty();
		else SecOPFucksYourThroat();
		return;
	}
	//Bad ends
	else if(submission >= 4)
	{
		if(enemy.mf("m","") == "m") slaveslutBadEnd();
		else luckyCatchBadEndWithFSecop();
		return;
	}
	//On to normal visors :3

	//showPunkSecOp();
	output("The grinning cyber-kitty strides over your slumping form" + (pc.lust() >= pc.lustMax() ? ", not even so much as bothering to glance at your exposed genitalia or the libertine attentions your hands are determined to give out.":", barely looking down") + ". <i>“Not giving me any trouble now, are you?”</i> [enemy.HeShe] reaches behind [enemy.hisHer] back, producing a pair of blinking goggles with a simple, elastic strap. <i>“Yeah, I think you’re done fighting, but just to be safe, you can take a ride in the goggles while I get you out of the restricted zone.”</i>");
	output("\n\nThe last thing you see before the goggles’ inner blackness envelops your vision is a white-fanged, cheshire grin.");
	output("\n\n<i>“Hold still.”</i>");
	output("\n\nThere is a click, and a snap of static blasts your retinas. You mentally recoil as a high-pitched whine slaps your eardrums, growing ever louder and more disorienting. Dizzy, you vaguely feel your mouth fall open as your mind decouples with your body.");
	output("\n\nYou are the static. The whine is gone. Gentle, soothing fuzz is everything and nothing.");
	//Might swap the below for certain scenes that are less immersive and more programmy
	output("\n\nWhen the visor’s perfectly-rendered, three dimensional programming resolves into clarity, you’re right there with it - a little foggy-minded perhaps. You aren’t sure how you got here, how you came to be in this scenario, but <i>it is too real to reject as anything but your true and natural life</i>.");
	processTime(1);
	clearMenu();
	var forcedScenes:Array = [];
	if(flags["SECOP_SLIT_SLUTTINGS"] == undefined) forcedScenes.push(slutSlutLossScene);
	if(flags["SECOP_WALLSLUTTINGS"] == undefined) forcedScenes.push(wallSlutPunkSecOpEnd);
	if(flags["SECOP_TAURSLUTTINGS"] == undefined) forcedScenes.push(wsanTaurServicingLoss);
	if(forcedScenes.length > 0) addButton(0,"Next",forcedScenes[rand(forcedScenes.length)]);
	else
	{
		if(rand(3) == 0) addButton(0,"Next",wsanTaurServicingLoss);
		else if(rand(2) == 0) addButton(0,"Next",slutSlutLossScene);
		else addButton(0,"Next",wallSlutPunkSecOpEnd);
	}
	/*More mindfucky variant:
	else
	{
		output("\n\nWhen the visor’s perfectly-rendered, three dimensional programming resolves into clarity, it does so with absolute authority. Your attention is dominated utterly by the imagery and audio presented to you. The raw <i>resolution</i> beaming into your brain feels like it occupies the entire front half of your brain. Meanwhile, the back half is buzzing with a vague sense of pleasure... and arousal.");
		processTime(1);
		clearMenu();
		//addButton(0,"Next",);
	}*/
}

//Wall Slut
public function wallSlutPunkSecOpEnd():void
{
	clearOutput();
	showName("WALL\nSLUT");
	author("Fenoxo");
	IncrementFlag("SECOP_WALLSLUTTINGS");
	output("A low bass thrum ripples through the wall into which you’ve been embedded, though not uncomfortably. There’s a sort of inflatable, rubberized padding lining the socket around your low chest, stretching all the way to your waist. Your [pc.legOrLegs] dangle" + (pc.legCount == 1 ? "s":"") + " uselessly out the other side, not quite able to touch the ground" + (pc.tallness > 6*12+6 ? " in spite of your endless inches of height":"") + ". Worse is that your arms are similarly restrained, leaving you to rely on a band under your armpits to hold you up.");
	output("\n\n");
	showImage("VRWallSlut");
	output((pc.lust() < 70 ? "What you see does not inspire your confidence.":"What you see absolutely thrills your lust-addled brain.") + " Neon lights bathe a crowd of debauched laquines in unnatural pinks and blues as they writhe and twist about on a dancefloor, naked or next to it, casually swapping spit and bodily fluids like the obscene sluts they are. Around the pit of sweaty, grinding bunnies are walls like the one in which you now find yourself. Each one has at least three or four slack-jawed servants languishing in the same sort of bondage as you, already painted with two or three layers of thick laquine seed and begging for more.");
	//Not aroused yet
	if(pc.lust() < 40) output("\n\nA sense of pervasive warmth alerts you to something you’d rather not admit - that there’s something hot about all this. Maybe it’s the sights all around you and the way a grinning fuck-bunny strides up to the kaithrit to your left and just thrusts into her waiting, willing maw like she’s nothing more than a piece of extremely fuckable meat. Maybe it’s the sex-saturated air tickling your nose with the musky odor of raw, ready herm-cocks and eager cunts. Maybe you just <i>like being held naked in a wall and presented for public use</i>.");
	//Already Aroused
	else output("\n\nYou flush with pervasive warmth, even beyond what the muggy, fuck-scented air would warrant. This entire scenario is just so unbelievably hot! You watch a grinning fuck-bunny stride up to the kaithrit to your left and thrust a full seventeen inches of equine-shaped dick into the kitty’s accepting maw. The herm doesn’t seem to care one whit for her cock-sucker’s comfort, treating her like the little more than a disposable holster for her mammoth meat. A twinge of jealousy runs through you while you watch. <i>Why didn’t she pick you?</i>");
	//Merge
	output("\n\nA heavy hand slaps your ass, jerking you out of your reverie. You wiggle your ass back into it before you’ve even processed what’s going on, but when a muffled shout of, <i>“nice”</i> reaches you through the wall, you can’t help but blush from head to buttcheek.");
	output("\n\nSo there’s people on the other side of the wall as well!");
	if(pc.hasCock())
	{
		output(" There’s no way you could hide the rigidity of your [pc.cocks] or the strings of pre that dangle from your [pc.cockHeads].");
		if(pc.biggestCockLength() >= 26) output(" Hung as you are, you’re giving everyone a front row seat to your own personal hyper-endowed bondage show.");
	}
	if(pc.hasVagina())
	{
		output(" You wonder how many eyes are staring at your [pc.vaginas] right now. Can they see ");
		if(pc.wettestVaginalWetness() < 3) output("how wet you’ve gotten");
		else if(pc.wettestVaginalWetness() < 4) output("the shine of your excessive lubrication");
		else if(pc.wettestVaginalWetness() < 5) output("the rivers of lubrication streaming down your [pc.thighs]");
		else output("the webs of lubrication cascading down your [pc.legOrLegs], advertising what an absolutely sodden slut you’ve turned yourself into");
		output("?");
	}
	output(" Maybe it’s your [pc.asshole] that’s getting the attention. You couldn’t stop someone from prying your [pc.butts] apart for a better view, let alone thrusting inside... <i>You hope whoever is back there likes what they see.</i>");
	output("\n\nObviously the mystery man on the other side approves. The squeeze he gave your shudderingly pleased heiny was nothing less than absolutely appreciative.");

	//Not turned on fully.
	if(pc.lust() < pc.lustMax()) output("\n\nMaybe this isn’t so bad. Maybe you can have some fun while you’re stuck here. Maybe... it’d be kind of fun to let one of those libidinous laquines fuck a few loads into your belly. You lick your lips.");
	//Turned on fully.
	output("\n\nImmobilization aside, this is pretty awesome. You’re sure that you’re going to have a pretty good time while you wait here. Maybe even suck a few ball-draining loads straight into your belly.");
	//Merge.
	output("\n\nLooking over at the girl to your left, you note that her straining, cum-smeared lips quirk and quiver in between thrusts, so obviously pleased to have such heavy spheres slapping into her chin. When she blinks and recovers enough to take in her surroundings, she gurgles with pleasure and stares straight into the laquine’s sheath imploringly, all but begging it to crinkle around her mouth and stay there, embedded to the hilt. She shudders, nipples hard, and her eyes roll back once more - just in time for another thrust.");
	output("\n\nDid she orgasm from getting face-fucked?");
	output("\n\nWill you?");
	processTime(30);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",wallSlutLossPart2);
}
public function wallSlutLossPart2():void
{
	clearOutput();
	showName("WALL\nSLUT");
	author("Fenoxo");
	output("Two giggling laquines halt their impassioned gyrations long enough to see you, and after a moment’s discussion, stride your way with heavy hips swinging. It would seem you’re going to find out what a real face-fucking is like sooner rather than later - twice over. One of the bunnies is already stripping down, peeling out of glossy, pre-soaked garments with an eager grin writ upon her gray-furred muzzle. A heavy, eighteen inch slab of gleaming black horse-meat flops between her legs, weighing heavily on her a pair of sack-straining, apple-sized balls.");
	output("\n\nHer partner is smaller but far more done up. Her pink fur all but glows under the flashing neon lights, complemented by luminescent purple mascara and lip gloss so shiny that you can see your reflection in it. She doesn’t bother stripping out of her fishnet shirt or package-defining, shrink-wrapped shorts, though the latter garment has gained a few gaps along the seam that appear to grow larger with every stitch-destroying throb of her bound dick. Pink winks at you and reaches between Gray’s legs to heft her balls for your inspection.");
	//Bimbo
	if(pc.isBimbo()) output("\n\nOh fuck yes! You don’t care that you’re drooling or that you that your mouth is already open wide. You thrust your tongue invitingly and look up with your best <i>“fuck my useless cum-dump of a mouth”</i> eyes. This is going to be so fun!");
	//Cum Addict?
	else if(pc.isDependant(2)) output("\n\nOh fuck yes! You can scarcely believe your luck. You’re always down to take a thick load of jism down your throat. There’s something about the salty, creamy taste that leaves you so delightfully pleased. You wouldn’t want to go a day without it, let alone miss out on everything these two hunnie bunnies are packing. You open wide and roll out the red carpet before they change their mind and decide to fuck some other slut. You need the cum, damnit!");
	//Heat
	else if(pc.inHeat()) output("\n\nYou’d much rather they take you from the other side of the wall. Two thick, creamy loads of laquine honey would be exactly what you need to extinguish your burning need to breed. They’d probably pump so much into you that you’d look pregnant from the get-go, but you’ve got to make do with what you have. If that means opening wide and rolling out your tongue like a red carpet, so be it. Maybe a stranger can fuck a baby into you while you suck them off...");
	//Else
	output("\n\nYou’re too turned on by this point to come up with any objections to this turn of events. Already, your mouth is filling with saliva at the thought of tasting Gray’s big, hard boner. You look up as they get closer and flash your most winning smile. Maybe they’ll be gentle - or at least wait until you’re too cock-drunk to care before they start really pounding away at your face.");
	//Merge
	output("\n\nGray’s dick comes to rest right in front of your [pc.face]. You cross your eyes for a better look at the veiny beast, admiring how it glistens under the club’s lights, layered in a thick coat of pent-up pre. It actually muffles the musk under a cloud of head-spinning sweetness. The tip is fat and flared like any average laquine’s, but the shaft is what’s special. Instead of one ring around the middle as is typical of the equine endowed, she has four, spaced evenly along the shaft.");
	output("\n\nMidway through that observation, the biggest, fattest dick in the universe is pushing past your [pc.lips] and onto your tongue, and it tastes... kind of sweaty. There’s the salty flavor of long hours spent dancing in the club mixed with bits of sweetness from freely dribbled pre, and beneath it all lurks the raw, meaty taste of her cock. You unintentionally flutter your eyelashes as you try to cope with the taste, not resisting in the slightest as it slides deeper into your mouth. It pauses at the entrance to your throat long enough for Pink to kneel next to you snap a quick holo-selfie.");
	//can deepthroat
	if(pc.canDeepthroat()) output("\n\nWhen the gray-furred slut-bun deigns to thrust the rest of the way into your drooling cock-socket of a face, you welcome it. Your throat is practically built to take deep dickings. Gag reflexes are a thing of the past. Groaning so that your voice can pleasantly vibrate the thick laquine rod on its journey, you try not to cum on the spot. There’s something so magnificent about being taken and filled so completely that you can scarcely believe you’re getting to experience it.");
	//Can’t deepthroat
	output("\n\nWhen the gray-furred slut-bun deigns to thrust the rest of the way into your drooling cock-socket of a face, you’re surprised to find that your gag reflex is curiously absent. There’s no pain or discomfort at all! You’re free to lie there and enjoy the sensation of being absolutely stuffed with cock. You can’t be blamed for groaning like a wanton slut as slobber dribbles down your chin or delighting in the warm wet trickles of pre bubbling into your belly. You mentally utter a prayer of thanks to whatever god blessed you with this sublime, dick-pleasing ability.");
	//Merge
	output("\n\nTears bead at the corners of your eyes, but not from pain. There is certainly a physical element to the small droplets of budding moisture; your jaw is sorely strained by the slick stick of herm-meat bracing it wide, pinning your tongue to the floor of your mouth. Tears are part of the job. There’s a reason pornstars get the heavy-duty waterproof mascara. Why ruin your make-up on the first take?");
	output("\n\nYet your watery leakages are driven by something else - something joyous, spurred around a mental state that’s slipping inch by inch into a euphoria-flooded ditch. Yes, you feel dirty. You feel used. You feel balls slapping into your chin and the rich musk of your groaning laquine lover tickling your nostrils. You feel ");
	if(pc.hasVagina()) output("your [pc.vaginas] flexing in anxious need, your [pc.hips] wiggling to rub your slippery lips around your very swollen [pc.clits].");
	else if(pc.hasCock()) output("your [pc.cocks] straining and dribbling, each cock-filled swallow provoking " + (pc.cockTotal() == 1 ? "it":"them") + " to twitch passionately.");
	else output("your [pc.asshole] rhythmically clenching and relaxing, offering itself to anyone who wants to play.");
	output(" All of those degradingly sexual sensations blend together into a gestalt of disturbingly erotic relief, the more casually you’re used, the more enjoyable the situation becomes.");
	output("\n\nYou don’t have to worry about piloting a ship or looking for probes while you’re bound up and face-fucked like this. You don’t have to talk or fight or even think if you don’t want to. You just have to hang there and remember to breathe when you get the chance. You can smile and look up while you wiggle your tongue under Gray’s big, throbbing horse-cock, or you can passively sit there and let her hips do all the work, pounding that many-ringed horse-cock nearly into your belly on every thrust. Either way, dribbles of thick laquine cream flow in a buffet of endless rewards.");
	output("\n\nThe euphoric buzz of submissive service presses heavily in the back of your mind as you’re used, flattening out unkind thoughts in the same way that the thick phallus irons the wrinkles out of your tongue. You gurgle out a half-giggle when you feel the bunny-horse’s heavy nuts twitch, sloshing with seed that’s just out of reach. You " + (!pc.isDependant(2) && !pc.isBimbo() ? "aren’t sure why, but you want it. The very idea of such a turgid, bestial prick ballooning <i>for your lips</i>, cumming for your stomach, is exquisitely erotic. Enough to make your [pc.thighs] quiver.":"can’t wait for her to unload. The very idea of such a turgid, bestial prick ballooning <i>for your lips</i>, cumming for your stomach, is almost orgasm-worthy on it. You hollow your cheeks, automatically sucking a little hard to wring out all the yummy bunny-cream."));
	output("\n\nThe second cock slapping onto your head jolts you out of your slurping reverie, reminding you that there’s <i>two</i> horny laquines with a need for service. Pink is leaking almost as much as gray, her pre-seed sliding " + (!pc.hasHair() ? "over your scalp":"into your [pc.hair]") + " like sexual shampoo. You bat your eyelashes innocently up at her, at least until the curtain of slick herm-goo cascades down your forehead and webs them shut. You’re left to get by on taste, smell, and feel, and right now, all three of those sensations are utterly suffused by throbbing hard cock.");
	output("\n\nUntil a finger hooks into the corner of your mouth and pries it wider.");
	output("\n\nSpit and pre bubble out of the gap in the brief moment it takes Pink to plug the hole with her cock, pressing so hard that the burgeoning flare of her blunt tip folds back a bit before it pops inside. Once it burrows in, the rest of the narrower shaft has an easy time of it. Gray already stretched you and lubed you up. The second prick can glide right in alongside its sister, the two big, sweat-greased poles gliding against your throat and each other in an orgy of phallus-obsessive lust. They pump back and forth through your maw, forcing your jaw so wide that you doubt it’ll ever close the whole way again. Your [pc.lips] are tight and shining, glossy with the mixed juices, hugging the sloppy poles like one big cock-ring.");
	output("\n\nIf you weren’t coated in a thick layer of goo already, the bunny-sluts would see your eyes rolling back from a combination of ecstasy and oxygen deprivation. They’re too busy fucking your face to care, though. They take turns, one pumping in while the other slides out, providing each other with an extra layer of friction while at the same time allowing enough room for the other wide-hipped bun-slut to go balls-deep into your cock-molded throat. Heavy balls brutalize your chin even as your stomach swells with the doubled loads of pre. Bubbles of it dribble out of your nose and the corners of your sluttily straining mouth.");
	output("\n\nDizzy from lack of oxygen, you can only imagine how depraved you look, but you’ve got a pretty good idea, remembering how the other wall-mounted cock-socks looked, gasping and glazed, their eyes vacant but dazedly happy, ropes of white cream dangling from their chins, so thick that it forms perverse webs.");
	output("\n\nYou’re just like them, or at least you will be soon.");
	output("\n\nBoth girls begin to properly flare at about the same time, their swollen horse-members competing to see which can stretch you wider. The cooperative rhythm they had falls apart into a series of juddering thrusts, both pumping as deep as they possible can, fighting with sweaty hips to get a quarter inch deeper.");
	output("\n\nYou shudder as the feeling drives you to a miniature orgasm, your whole body shuddering in confinement.");
	output("\n\nCum pumps into your body a moment later. Pumping is the only way to properly describe how they pneumatically inflate you, the twinned streams of sperm-packed herm-spooge flooding your innards with gusto. The padded restraint actually gives a little to make room for your expanding [pc.belly]. Cute grunts fill your dizzy ears, drowning you in the sound of their audible pleasure while they drown the rest of you in far more visceral cum. Excess spunk sprays out of the corners of your mouth when your taut cum-gut reaches, but they’re still cumming. Thick, cummy dribbles coat your lip from where they leak out of your nose.");
	output("\n\nOne of the girls slaps the wall, and you hear a mechanical click.");
	if(pc.hasVagina())
	{
		output(" A plastic cock, every bit as big as the one in your mouth slams hard into your [pc.oneVagina], pounding you with rapid, brutal strokes that would bring you to orgasm - if you weren’t already sliding over your peak from the feeling of being used as a living cum-sponge.");
		if(pc.vaginalVirgin) output(" <b>It isn’t real, but you feel despoiled all the same, your virginity stolen by the powerful thrusts of this dildo.</b>");
	}
	else if(pc.hasCock()) 
	{
		output(" A slick, rubberized tube slides over [pc.oneCock], pulsating in rhythmic gyrates that would have you orgasming in seconds - if you weren’t already sliding over the edge from the feeling of being used as a living cum-sponge.");
	}
	else 
	{
		output(" A big, fat, plastic cock pounds into your [pc.asshole], fucking you with brutal strokes that would bring you off in seconds if you weren’t already slipping into ecstasy from the feeling of being used as a living cum-sponge.");
		if(pc.analVirgin) output(" <b>It isn’t real, but you feel despoiled all the same, your virginity stolen by the powerful thrusts of this dildo.</b>");
	}
	output("\n\nYou climax so hard that your entire body seizes and thrashes. Not even the restraints can hold you strill. Your shuddering, squeezing throat milks out one last rope before the laquines slide back and watch you pleasure-seize. Of course they’re still cumming. Heavy ropes splatter across your brow and your back. They bathe you in cum while the mechanical stimulation suspends you in an endless orgasm that refuses to abate, even when your vision narrows into a black-lined tunnel.");
	output("\n\nThe last thing you see are Gray and Pink holding their dicks up to your lips. The last thing you feel is their taste on your tongue.");
	output("\n\nYou pass out with the knowledge that being a slut feels very, very good.");
	processTime(40);
	pc.orgasm();
	pc.libido(1);
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",wallSlutEpilogue);
}

public function wallSlutEpilogue():void
{
	clearOutput();
	showPunkSecOp();
	author("Fenoxo");
	output("You’re outside the cargo elevator");
	if(pc.isHerm() && pc.isSquirter()) output(" and drenched in your own mixed fluids");
	else if(pc.hasCock()) output(" and covered in your own [pc.cum]");
	else if(pc.hasVagina() && pc.isSquirter()) output(" and drenched in [pc.girlCum]");
	else if(pc.hasVagina()) output(" and decidedly moist between the [pc.thighs]");
	if(pc.hasVagina() && pc.isSquirter()) pc.applyPussyDrenched();
	if(pc.hasCock()) pc.applyCumSoaked();
	output(". You open your mouth on instinct, but there’s no dicks there this time - just a laughing kaithrit and the slow tingle of your brain untangling itself.");
	output("\n\nTwirling a pair of antigrav cuffs around one finger, the security operative turns away. <i>“Keep your nose out of where it doesn’t belong.”</i> [enemy.HeShe]’s entirely too amused to deliver it seriously. <i>“Freelancers don’t belong around the special project. Really. But if you make a thing out of this, I’ll make sure you belong <i>to me</i>. Got it?”</i> [enemy.HeShe] looks back over [enemy.hisHer] shoulder, enjoying your flushed state. <i>“Or keep coming back, I guess. I could use a slave like you.”</i>");
	output("\n\n");
	moveToElevatorAdjustment();
	CombatManager.genericLoss();
}

//Slit Slut hypnoprogram
public function slutSlutLossScene():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	IncrementFlag("SECOP_SLIT_SLUTTINGS");
	output("<i>“Hi there.”</i> A breathy voice whispers in your ears, accompanied by the sight of a faintly glowing kaithrit sex-pot. <i>“I’m Anayill Siltoya, and welcome to your first day on the job as a TamaniCorp female relief specialist, more commonly known as a pussy-slut.”</i> She smiles winningly. <i>“The idea of being blindfolded and mounted with your face in the seat of a chair for twelve hours a day might seem kind of scary to you right now, but I promise that by the time you’ve finished this training holo and undergone the complementary libido adjustment, you’ll be looking forward to it.”</i>");
	output("\n\nAnayill flashes two thumbs up, and " + (pc.lust() < pc.lustMax() ? "you are suddenly, irrevocably horny. It’s a warm buzz of pleasure, like she just swept you up in a hug, mixed with an undercurrent of want and desire.":"you are suddenly more than just horny. You’re pleased to be so. You’re <i>happy</i> to be aroused. Somehow, her approval has made your rampaging libido feel like a good thing."));
	output("\n\n<i>“That feeling? What you’re feeling right now? That’s what you’re going to be feeling every day on the job. And that’s on a bad day.”</i> Her wink is so comically overdone that you wish you could make yourself cringe at it, wish you could find it anything less than wonderfully endearing. What a cutie! <i>“At TamaniCorp pleasure is our specialty, and soon to be yours.”</i> Anayill playfully mimes shooting at you. <i>“So hold still, and let’s get started with your training.”</i>");
	output("\n\nThe curvy kaithrit’s image retreats to the corner of your vision. A pink flash occupies everything. You wince, but it is swift to fade into a new reality. Not entirely unexpectedly, you’re mounted in a chair, your upraised face immobilized between two cushions. From the neck down, every part of you is wrapped in something soft and breathable. Gentle vibrations stimulate your muscles to keep you from cramping.");
	output("\n\nYou sigh in relief. It’s not all that bad.");
	output("\n\n<i>“I promised you’d like it! Since we don’t have all day to waste on training like those dopes over at KihaCorp, why don’t we start the programming?”</i> She snaps her fingers.");
	output("\n\n<i>Static.</i>");
	processTime(4);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",pussySlutV2);
}

public function pussySlutV2():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Cutsie nervous lizardgirl with a chubby pussy
	output("A young girl, covered head-to-toe in reptilian scales, looms above. Her knees knock together, but she’s naked as the day she was born (or hatched), her chubby, aroused pussy easily visible. The lips are deliciously thick. A thin droplet rolls down the left one as she turns and hesitantly spreads her thighs, better displaying her cunt. The velvety entrance is closed for now, but the lower she squats, the more it twinkles with moisture and twitches with barely suppressed arousal.");
	output("\n\nYour lips are suddenly very, very parched and your ");
	if(pc.hasCock()) output("[pc.cocks] very hard");
	else if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas] very wet");
	if(!pc.hasGenitals()) output("crotch simmering");
	output(". Her scent is reaches your nose, mild and alien but desirable all the same. You thrust your [pc.tongue] out, straining to reach it, yet she’s not low enough yet. A single droplet forms on her clit when her silky, delectable slit drops a few inches lower. She’s almost there. Her ass is almost ready to sit down on the cushions and grant you access to that slippery treasure trove of feminine moisture and...");
	output("\n\n<i>Static.</i> <i>“Very good. You’re a natural!”</i>");
	processTime(4);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",pussySlutV3);
}

public function pussySlutV3():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Confident MILF terran. Very wet.
	output("The sweet-looking reptile-woman has vanished. In her place, a grinning terran approaches. She’s well into her thirties by the look of her, blessed by the combined curvaceousness of births and a life well lived. She smiles sweetly and pivots in preparation. Her pussy is nothing like the lizard-girl’s. It’s less engorged but so much <i>wetter</i>. Juices stream down her thighs as she wiggles into position, her hands reaching down to hold onto either side of the seat for support.");
	output("\n\nThe thick scent of mature cunt strikes you like a brick to the face. One moment you’re gazing up, licking your chops thanks to a sense of lust you don’t entirely understand, the next you’re straining against the box’s soft confines, desperate to smash your face into <i>her</i> box and drink in her scent for the rest of your days. She’s sweet and perhaps more importantly, <i>fertile</i>. Her pussy flexes and winks, droplets as clear as morning dew hanging from her lips.");
	output("\n\nOne falls onto your outstretched tongue and splashes its tangy flavor over a wide swath of your tastebuds. It’s delicious - better than icecream. On some level you know that the taste itself isn’t really that amazing, that the tingle in the back of your head is playing hell with your nerves and cross-wiring disparate sensations into a soup of swampy, puss-addicted submission, but you can’t help it. You want it. You want that slick, wanton hole smashed into your face.");
	output("\n\nWatching it descend is like unwrapping a christmas present; with each passing second, more glorious detail is revealed. The gentle slopes of aroused feminine lips resolve into a hypnotic wonderland of glittering lust. The clit pops out of the hood, hovering over tongue, promising to reward your tongue with more heavenly taste once you adequately serve it. Slowly yawning open, the bright pink interior at last reveals itself, flexing and squeezing in anticipation of taking your entire tongue to the root.");
	output("\n\n<i>Static.</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV4);
}

public function pussySlutV4():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	output("The glowing kaithrit is back. Anayill? Whatever her name is. You can’t be bothered to look up to her face, not when she’s missing her bottoms and swiveling her hips to keep your increasingly cunt-focused thoughts between her legs.");
	output("\n\n<i>“Good news! If you’re hearing this, then the program has identified you as an exceptionally receptive pussy-slut-in-training.”</i> She dips a finger into her twat and lifts the glistening digit up in front of you, waving it back and forth and smiling when you futilely lunge for it, still bound in the traitorously pleasant confines of your slut-box. <i>“That or your training goggles have had the power bumped to unsafe levels to expedite your training. Either way, you’ll be tasting a whole lot more of this soon.”</i>");
	output("\n\nThat drenched fingertip pushes into your mouth, and you’re in heaven. Your tongue swirls rapidly around, harvesting it of every bit of its perfect moisture. Your cheeks hollow as you suck hard, pulling it in to the knuckle.");
	output("\n\n<i>“Oh my, you are <b>ravenous</b>! Let’s just verify that your dopamine responses stay stupidly high when dealing with a few of our more exotic clientele, and we can get you set up and ready to lick in no time!”</i> Anayill snaps her fingers.");
	output("\n\n<i>Static.</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV5);
}

public function pussySlutV5():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Big phat leithan
	output("Your mouth is <i>empty</i> once more, and your giggling kaithrit trainer is gone! Fortunately something else has taken her place: something six-legged and armor plated with big, fat, cunt that looks like it belongs on an animal instead of a person. Rubbery black lips ring the six-inch long gash, winking in mild arousal as a thumb sized clit slowly reveals itself along the underside. A sheen of gleaming moisture coats the innermost edge of the " + (CodexManager.entryUnlocked("Leithans") ? "leithan":"creature") + "’s chubby folds, gradually spreading outward as she canters back on noisy hooves.");
	output("\n\n" + (!CodexManager.entryUnlocked("Leithans") ? "There’s probably a humanoid torso mounted up there somewhere, but you’re long past caring about the specifics of who or what sits on your face. So long as you have a pussy present and ready to drop onto your mouth, you’re happy.":"You know there’s undoubtedly a human torso mounted up there, but you’re long past caring about what the rest of your partner looks like so long as they have a pussy present and ready to press against your face.") + " Even if the " + (!CodexManager.entryUnlocked("Leithans") ? "alien":"leithan") + " wasn’t a second away from smashing her puffy hole onto your mouth (and she is), you’d be content just being this close to it, getting into drink in its uniquely pheromonal signature while you watch its wetness spread.");
	output("\n\nBeads of girlcum drizzle down her clit, collecting into a shimmering droplet a moment before that huge pleasure-nub bounces against your chin. Gloriously engorged lips smother your cheeks as the entirety of the alien’s big fat quim spreads over your [pc.face], enmeshing you in a cunnilingual heaven.");
	output("\n\nYou can scarcely breathe, a thought that paradoxically fills you with pleasure. Your own comfort comes secondary to this puffy pussy’s satisfaction. That sinful knowledge and the deluge of decadent pheromones leave you dizzy and throbbing with passion");
	if(pc.hasCock()) output(", your [pc.cocks] jerking and dribbling at the very peak of ecstasy");
	else if(pc.hasVagina()) output(", your own [pc.vaginas] drooling and rhythmically clenching at the very peak of ecstasy");
	output(". This sapient she-mare has given you more cunt you could have imagined in your wildest dreams, and as you struggle to inhale the slightest bit more of her musk, you realize that this feels an awful lot like falling love.");
	output("\n\nEyes closed, you worship her on autopilot. Your tongue somehow <i>knows</i> exactly where to go and what spots to lick. It traverses the maze of rippling muscle with a native’s intimate knowledge, whipping up to caress clusters of nerves and flexing to slide across neglected channels. Your jaw hurts from opening so wide, but it’s the only way to satisfy the aching thirst for more girlcum. You’re dimly aware that you’ve become drenched in it from the top of your head all the way down to your chin, but you want more. You want to bathe in it. You want to drink her relief until your body is more pussy-juice than water.");
	output("\n\n<i>Static!</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV6);
}

public function pussySlutV6():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Kuitan!
	output("You sigh when relief when you realize that there’s still a pussy on your face. You won’t have to face the room’s cold air or wait, <i>bored</i> and alone without a cunt to occupy your time. This one’s not quite as big or as wet, but it’s much, much softer. The flesh has a spongy, forgiving quality to it that begs for your tongue to spear deep inside. Soft fur tickles your cheeks... and your chin as your nose picks out a pair of twinned musks, one feminine and one a richer, masculine note.");
	output("\n\nYou’re servicing a hermaphrodite! While it may be a surprise, it doesn’t slow you down. Why would it? Having a heavy bar of balls rubbing against your chin just gives you an additional piece of feedback. When they clench and rise up, you know you’re doing something right. You slurp and lick at the furry herm’s unsatisfied female anatomy until her balls pulse with a swell of freshly brewed cum. At the same time, a rush of fresh, girlish goo pours into your maw, and you realize that you’re addicted to the taste already. The concentrated flavor of this furry slut’s slit is the most wonderful thing in all the known universe.");
	output("\n\nUncaring for how loud it sounds, you suck with abandon. You make love to the juicy honeypot with your face and smile when her balls churn and rock against your chin. Daringly, you slide your tongue down to favor them with a lick, but just one! You’re right back into that pussy after, where you belong. That exploratory caress was only to take your slick-furred client’s attention somewhere else so that you could surprise her with a sudden, deep thrust.");
	output("\n\n<i>Static.</i> <i>“Very good. Now keep licking! An orgasm ought to convince you that you made the right decision by coming to us!”</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV7);
}

public function pussySlutV7():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Doublecunted pornoslut with strawberry and vanilla pussyjuice.
	output("The furry woman’s soft slit and soothing squeezes are gone. In her place is a pink-skinned humanoid with two pussies. You nearly cream yourself with relief at the sight. You get to service two whole vaginas at once? You get to nuzzle your nose in between <i>two</i> sodden slits and inhale their enticing aroma while your tongue flutters back and forth, gathering their combined precipitations? It’s almost too good to be true.");
	output("\n\nYou’re so taken aback by the delightful muff buffet that you miss another intriguing attribute of your girlishly blessed guest - each of her pussies has <i>two</i> clits - one above and one below. For a second you wonder how she can walk anywhere without cumming, how she can manage to grind those four sensitive nubs between her thighs together without driving herself mad. Then you see the state of her thighs. They’re drenched. The fragrant, fruity scent of her girl-cum is everywhere as she fidgets atop you, humping your face even before you’ve started to lick.");
	output("\n\nJust like before, your tongue flashes out, arbitrarily choosing the leftmost entrance to burrow into. <i>She tastes like ripe strawberries.</i> You swoon from the flavor, but still you lick. You breathe through your nose, drowning yourself in her, your mind increasingly vacant of all but the raw sensory experience, the carnal sights and smells occupying every part of your brain that isn’t busily directing your tongue’s eager flexing. Everything is strawberries and slickness and passion and-");
	output("\n\nThe transition to the second pussy happens instantaneously, this one vanilla flavor. It shocks you back to cognizance for a second, but only for a second - long enough for you to mentally remark that you really, really love working for TamaniCorp. Then you’re back on autopilot. Vaguely happy to be so desirous and so very useful in the way that you derive arousal.");
	output("\n\nA screech of pleasure from above is better than a ");
	if(pc.hasCock()) output("mouth around [pc.oneCock]");
	else if(pc.hasVagina()) output("cock in [pc.oneVagina]");
	else output("cock in your [pc.asshole]");
	output(". The rush of girlcum flooding your mouth and drenching your cheeks is stunningly pleasurable. Your eyes would be crossed if they weren’t rolled back so far. Her orgasm is everything. Your tongue twirls from clit to clit to prolong it as long as possibles. Thighs quiver against your forehead, the sign of a job well done. Your breaths are rapid and feverish as her climax wrings a second torrent of strawberry-vanilla approval all over your face, and you’re cumming too.");
	output("\n\nYour orgasm rips through your body and your brain, ecstasy intertwined with the sight and taste of climaxing pussy. Arousal interweaves with the scent of a lusty woman and the warmth of her thighs." + (pc.hasCock() || pc.isSquirter() ? " There is no room in your mind to wonder what happens to your own sexual fluids, though if you had the mindspace to puzzle over it, you’d assuredly come to the conclusion that your new home is designed handle such emissions.":"") + " You lick throughout, somehow aware the more aggressively you serve her the better your own climax will feel.");
	output("\n\nBy the time the sticky thighs deign to rise, you’re so dizzy that you know you’d collapse if you tried to stand up. The pink-skinned girl sighs happily and pulls up her panties, leaving you to lick her residue from your lips.");
	output("\n\nThis is heaven.");
	output("\n\nAnayill reappears, flashing two thumbs up. <i>“Congratulations on completing your TamaniCorp female relief specialist training. By now you’re a certified pussy-slut! Since you may have completed your training before the rest of your class, I’m authorized to simulate the experience of servicing me personally until your supervisor comes by to take you to your service chamber. And don’t worry! We still have weeks of on-the-job reinforcement training to go through, so you’ll be seeing a lot more of me-”</i>");
	output("\n\n<i>Static.</i> The goggles are ripped off your face.");
	processTime(30);
	pc.orgasm();
	pc.libido(2);
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",pussySlutEpigloe);
}

public function pussySlutEpigloe():void
{
	clearOutput();
	showPunkSecOp();
	author("Fenoxo");
	output("You’re outside the cargo elevator");
	if(pc.isHerm() && pc.isSquirter()) output(" and drenched in your own mixed fluids");
	else if(pc.hasCock()) output(" and covered in your own [pc.cum]");
	else if(pc.isSquirter() && pc.hasVagina()) output(" and drenched in [pc.girlCum]");
	else output(" and decidedly moist between the [pc.thighs]");
	output(". You open your mouth on instinct, but there’s no pussy there this time - just a laughing kaithrit and the slow tingle of your brain untangling itself.");
	output("\n\nTwirling a pair of antigrav cuffs around one finger, the security operative turns away. <i>“Keep your nose out of where it doesn’t belong.”</i> [enemy.HeShe]’s entirely too amused to deliver it seriously. <i>“Freelancers don’t belong around the special project. Really. But if you make a thing out of this, I’ll make sure you belong <i>to me</i>. Got it?”</i> [enemy.HeShe] looks back over [enemy.hisHer] shoulder, enjoying your flushed state. <i>“Or keep coming back, I guess. I could use a slave like you.”</i>");
	processTime(2);
	output("\n\n");
	moveToElevatorAdjustment();
	CombatManager.genericLoss();
}

// Boi Cat - Get Throatfucked
// PC will be stripped, cuffed, and have their mouth swabbed with aphro milk. The SecOp will then facefuck the PC.
// William
public function SecOPFucksYourThroat():void
{
	showPunkSecOp(true);
	author("William");
	// PC HP loss
	if(pc.HP() <= 1)
	{
		output("The cat-pirate laughs to himself when you stagger and fall to the ground in defeat, rendered down into a pliable state. He swaggers forward, twirling the plasma rifle in his hand before nonchalantly dropping it. The weapon slides just a few inches away while he comes to loom over you.");
		output("\n\n<i>“You’ve been causing a lot of problems up here,”</i> he grins, <i>“and we’ve got a pretty good profile of you so far. A" + indefiniteArticle(pc.race()) + ", that’s obvious, but what are you snooping for? You a merc taking the wrong job? A shitty thief? Just want to touch something that you’ve got no business being near? Doesn’t matter I guess. Really... you were given fair warning.”</i>");
		output("\n\nPredatory eyes roam up and down your body when his projected holovisor dissipates. His fluffy ears twitch menacingly just before he opens his mouth, the suit coming apart to reveal his pulsing and pre-beading prick. " + (flags["PUNK_SUCKOP_SUCKED_OFF"] == undefined ? "<i>“For all the trouble you’ve caused, I think it’s time you learn what happens to rulebreakers around here.”</i>":"<i>“Looks like you need another lesson, huh?”</i>"));
	}
	// PC Lust loss”</i>);
	else
	{
		output("The kaithrit boy chuckles knowingly, flashing his white fangs when you fall to your knees and masturbate" + (!pc.isCrotchExposed() ? " through your [pc.crotchCovers]":"") + " with not much of a care in the world. He swaggers forward, casually dropping his weapon with a heavy impact. The rifle slides a few inches away while his metallic armor peels apart layer-by-layer, presenting you with his engorging cyber-cock. The multiple coils and fleshy colors unwrinkle and swell out into augmented prurience as his hefty balls churn underneath that pre-leaking testament to technology.");
		output("\n\n<i>“I have no idea what you’re roaming around here for, why you keep coming back. I’m starting to wonder if you’re some escaped slave with a weird fetish. Doesn’t matter. Seeing you like that turns me on too much to just strap you in a pair of goggles and ferry you out. No, you’ve caused too many problems after being given fair warning.”</i>");
		output("\n\nHis previously serious tone of voice is replaced by one struggling not to laugh, to boast about this victory between breaths. " + (flags["PUNK_SUCKOP_SUCKED_OFF"] == undefined ? "<i>“I think you need to be taught a lesson, one that’s clearly not coming through in your virtual escapades.”</i>":"<i>“I’ve been waiting for you to come around, too. I enjoy using you even more than the ones upstairs.”</i>"));
	}
	// Merge
	output("\n\nHe’s positioned in such a way that his fully erect and hovering cock seems so much bigger than it actually is. The weighty, cum-packed sack, as synthetic as his life-like dong, swings beneath it, forcing out a blob of pre in advance of whatever he has planned for you. While you ogle that self-lubricating spire, he’s already pulling you up to your knees" + (!pc.isNude() ? " and stripping you of your equipment with calculated precision":"") + ". A cold pair of grav-cuffs are slapped on your back-bound wrists for good measure, locking you into a submissive and easily fucked position.");
	output("\n\nThe punky kaithrit runs a warm, possessive hand " + (!pc.hasHair() ? "over your head":"through your [pc.hair]") + (pc.hasEmoteEars() ? ", rubbing at your [pc.ears] with small but firm fingers":"") + ". The way he does it makes you shiver in pleasure" + (pc.HP() < pc.HPMax() ? ", enough that the pains and injuries from the fight seem non-existent now":"") + ". That hand descends over your face until two fingers rudely stretch your [pc.lipsChaste] apart and explore your mouth, leaving prints along your teeth and indents in your mouth.");
	output("\n\n<i>“I wonder how well your throat can stretch. I could show you pictures for days of all the sluts I’ve fucked into stupidity with this dick, " + (flags["PUNK_SUCKOP_SUCKED_OFF"] == undefined ? "but I’ve never gone all the way in someone’s mouth. Always been curious...":"and I’m looking forward to expanding your presence in the portfolio.") + "”</i>");
	// Normal throat
	if(!pc.canDeepthroat()) output("\n\nA pair of fingers dive abruptly into your throat, the suddenness of that thick insertion and their pressure against your neck making you gag and choke straight away. <i>“Not modded at all, I see.”</i> A lusty huff follows that revelation. <i>“Best part of breaking in a new slave is fucking that resistance away while stretching them into a real cock-sleeve.”</i>");
	// SnakeByte
	else if(flags["USED_SNAKEBYTE"] != undefined) output("\n\nThere’s some perverse pride when he shoves his fingers into your throat and all it does is make your eyes blur with pleasure and your nethers seethe with lust. <i>“No gag reflex, and a-”</i> When the kaithrit’s hands discover your ribbed throat, he gasps in surprise, his ears flexing out the shock of the prize he’s claimed. <i>“A ribbed throat... Unbelievable that a prize slut like you would just be wandering around. And you’re even getting turned on by this?”</i> He flashes you a cheshire-grin, <i>“I think I should collar you before anyone else finds out.”</i>");
	// Dumbfuck + Treatment (Dumbfuck would only remove gag reflex)
	else
	{
		output("\n\nWhen two fingers thrust uncaringly down your throat, the butch boy purrs when there’s no resistance, and you secretly thrill about your lack of a gag reflex. <i>“Nice... Either you’re a well-trained cocksucker or you’ve got a few choice mods. I like a little resistance, but I like when your eyes are open, too.”</i>" + (pc.isTreated() ? " He paws at your esophagus, the stimulation against your erogenous neck making you squirm and try to suck him even deeper. <i>“You like it when I do that?”</i> his slit pupils dilate with surprise. <i>“Now <b>this</b>,”</i> he moves a little faster, enough to make you moan, <i>“is going to be good.”</i>":""));
	}
	// Merge
	output("\n\nHe pulls his hand back to cup his so-fondleable nutsack, rubbing towards the toy-like head insistently until a stream of violet stream of precum fills his hand. When it’s spilling around his fingers he thrusts his slime-soaked paw past your lips. Before he’s even bathed your palate in liquid libido, arousal blazes through your gums and cheek muscles, the air pressed by your lungs thickening and overheating. Your whole body suffuses with chemical warmth until you’re glassy-eyed and salivating like a drugged-up whore, lurid thoughts replacing obstinacy with carnal adoration.");
	output("\n\nYou want to feel this everywhere, you whine for it. Your impulsive attempts at speaking are less a request for more, instead they’re a way to stroke his hand with your strangely-hot lips and stoke that need for stimulation and your aching desire to suck and worship his cock. Every breath you take this close is full of his aroma: powerful, ruthless, unstoppable.");
	output("\n\nPerhaps... transcendent.");
	output("\n\nYour [pc.lipsChaste] feel like hypersensitive latex, the sparks of pleasure dancing along their swollen creases submerging you in his commanding presence. You lurch closer, sliding your tongue around his digits and especially your [pc.lips]. You want to get closer to his modded maleness; you can’t imagine what it would feel like now. Even the slightest brush of his callous mit over your stretched lips ");
	if(pc.isHerm()) output("makes [pc.eachCock] and [pc.eachVagina] dribble helplessly");
	else if(pc.hasVagina()) output("makes your [pc.pussies] " + (!pc.isSquirter() ? "dribble":"squirt") + " helplessly");
	else if(pc.hasCock()) output("makes your [pc.cocks] spurt helplessly");
	else output("makes you squirm helplessly");
	output(". You lick at his fingers, his wrist, groaning in delight at this erotic thrill, wishing that he hadn’t cuffed you so that you might show your willingness a bit better.");
	output("\n\n<i>“That’s the reaction I’d expect from a willing slave. Either you are one, or you’re naturally suited to be one,”</i> he says, entirely enthused. <i>“A cock-hungry trespasser all to myself,”</i> he blurts, his artificial dong throbbing in reaction, <i>“tell you what, work hard enough and maybe I’ll keep you. Then you’ll have as much of this as you want.”</i> He strokes his tumescent techno-meat, bringing that pulsing pillar of augmented masculinity closer. ");
	if(pc.libido() < 33) output("A spike of fear stings the back of your mind, puncturing the miasmal lust accumulating there for a second before it fills gain. You’re far too aroused to think about disagreeing.");
	else if(pc.libido() < 66) output("You nod your head slowly. The movement is automatic. You want his dick, and you can’t wait for it to make you feel good.");
	else output("You nod happily, spreading your lips as far as they’ll go to make room for his throbbing bluntness, looking like it desperately needs a hole to fuck.");
	output("\n\nHe withdraws and grabs onto your head just before he shoves his jaw-straining dick straight into the purple-smattered hole " + (pc.libido() < 66 ? "he’s created":"you’ve created") + ". Tears well at the corners of your eyes");
	if(!pc.canDeepthroat()) output(", but the pain is quickly replaced by the nerve-numbing cock-juice rinse beforehand");
	else output(", but you’re in no pain" + (flags["USED_SNAKEBYTE"] != undefined ? "; your jaw even widens to an obscene degree to service his fat prick":"") + ". The nerve-numbing cock-juice rinse and your powerfully erotic throat make this intensely pleasurable, it feels unspeakably good");
	output(". The squelching glide of his ultra-smooth mecha-cock across your [pc.lips] ignites all the arousal coursing in your veins, its majestic trip something you relish on a very deep level. The taste alone makes your head swim while the uniquely appealing musk of an alpha kaithrit affirms your sense of belonging beneath him.");
	output("\n\nYour [pc.tongue] is automatically pinned by his unyielding mechanical prong, preventing you from servicing him the way you want until he buries that robo-dick in your neck" + (!pc.canDeepthroat() ? ", your gag reflex stopping him halfway":", your lack of resistance allowing him to settle balls-deep") + ". The smooth and slimy head oozes arousing pre straight into your gut, the rivulets becoming a thin layer of faux-stomach acid.");
	if(pc.canDeepthroat())
	{
		output(" His plump and shiny orbs press into your chin, tensing with enough force that you wonder if he’s about to unload." + (pc.libido() >= 66 ? " You’d beg for it if you could. If the pre put you in this state, then what would his cum do?":""));
	}
	// Treatment + Snakebyte
	if(pc.isTreated() || flags["USED_SNAKEBYTE"] != undefined)
	{
		output("\n\nThe mental pressure of his dominance and the physical pressure of his cock against your erogenous gut-hole push you over the edge. Your eyes nearly roll back all the way, pleasure ebbing and growing inside even as pinkish and purplish orgasm assaults your mind. ");
		if(pc.isHerm()) output("[pc.CumNoun] spurts and shoots into your between his legs, forming a [pc.cumColor] puddle broken up by the " + (pc.isSquirter() ? "drenching streams":"streams") + " of [pc.girlCumNoun]. The tingling down there, the way your cunt" + (pc.hasVaginas() ? "s clench":" clenches") + " frantically, leaves your loins bewildered that sucking cock could be so pleasurable.");
		else if(pc.hasVagina()) output("[pc.GirlCum] " + (pc.isSquirter() ? "squirts in aromatic waves":"gushes in fragrant streams") + " from your [pc.vaginasNoun], your inner walls grinding against each other and contracting so tightly as if incapable of believing that your oral performance has brought your [pc.vaginas] to shameful climax.");
		else 
		{
			output("The sudden twitch of your [pc.cocks] and the clenching of your [pc.balls] is little warning before [pc.cumNoun] fires off in ");
			var cumQ:Number = pc.cumQ();
			if(cumQ < 10) output("small spurts");
			else if(cumQ < 150) output("thick jets");
			else if(cumQ < 2000) output("floor-drenching ropes");
			else if(cumQ < 25000) output("puddling deluges");
			else output("room-flooding waves");
			output(" that pool under the self-assured pirate’s legs.");
		}
		pc.orgasm();
		output(" Your shuddering only makes him smile and caress your cheek lovingly.");
	}
	// Merge
	output("\n\nThe cyber-cat simply plows your face on inhumanly agile hips, thrusting in perfect, consistent pumps that make adaptation impossible. " + (!pc.canDeepthroat() ? "Even though it makes you cough, sputter, and shut your eyes out of stress, he grants no reprieve. He batters away your gag reflex with his immaculate throat-stretcher to the point that his slick and churning nuts are clapping wetly off your chin, your body loving every second of it.":"You feel your cheeks burn brighter when you realize how much this turns you on, especially since it doesn’t hurt. You watch him with blissed out pride, enraptured by the frenetic pace at which he works to satisfy his lusts on the most perfect throat-slut: you. You try to swish and swash your tongue over his synthetic maleness while working your muscles to draw him even deeper, maybe even get a potent taste of those slick and churning nuts while you’re at it. Whatever makes him moan, whatever brings him closer to cumming, <i>you want to do it</i>."));
	// PC normal throat
	if(!pc.canDeepthroat()) 
	{
		output("\n\n<i>“I love that feeling..!”</i> he groans, hilting himself to speak, <i>“Training a slave’s throat until it stretches, when it’s ready to service better than before, fuck me, you’re doing well!”</i> He pulls back and slams into your maw again, fluid splattering in mixed beads all around. Weighty orbs leave their signatures of musk on your face, marking you as his property. <i>“N-nice... Hope you don’t pass out, but I wouldn’t complain. If you do, it means you’ll have a better chance of staying up next time.”</i>");
		output("\n\nYou’re being used like a toy, maybe even something less than one, but you don’t care. You need to suck. You want to suck. His ambrosial pre trickles down your mouth, dripping to your [pc.thighs]. The kindling aphrodisiac in your bloodstream makes your mouth radiate heat more powerful than an industrial furnace. You bob up and down on his thick tool before long, going cross-eyed from how amazing it is when your glowing lips are caressed by cockflesh, your desperate breaths for air shaking his perfect balance. ");
		if(pc.isHerm()) output("Your [pc.cocksNoun] and [pc.vaginasNoun]");
		else if(pc.hasVagina()) output("Your [pc.vaginas]");
		else if(pc.hasCock()) output("Your [pc.cocks]");
		if(pc.hasCock() && pc.totalGenitals() > 1) output(" twitch");
		else if(pc.hasCock()) output(" twitches");
		else if(pc.totalGenitals() == 1) output(" tingles");
		else output(" tingle");
		output(" violently enough for you to feel light-headed, fluid" + (pc.isHerm() ? "s":"") + " drizzling out of your ");
		if(pc.isHerm()) output("hermaphroditic orifices");
		else if(pc.hasVagina()) output("femininity");
		else output("masculinity");
		output(" in wanton enjoyment.");
		
		output("\n\nHis hand rubs at your head with halting firmness, <i>“Good [pc.boyGirl], but slaves don’t set the pace unless told to. And you,”</i> he grips tighter than before, <i>“weren’t given an order.”</i>");
		output("\n\nThe techno-feline buffets your abused throat, hammering savagely, animalistic moans loosing from his as he holds his cock-sleeve in place. You’re brain rattles from the unceasing thump of crotch against face, his entire lower body moving with the relentless rapidity of a jackhammer. Just when you thought you were used to the rough treatment, something <b>vibrates</b> your optimism into the ether. Your confused mind struggles to understand what’s going on in your neck, struggles to breathe, struggles to retain itself.");
		output("\n\nThe high-quality motor powering his cock transforms this entire scenario. Your jittery moans are a product of your cock-quaking voice-box. The audible buzz of such a sex-toy is present in his loins, and the eye-crossingly sublime effect is felt <i>everywhere</i>, to say nothing of the effect it has on your clitorally-sensitive [pc.lips]. Water runs down your face before mingling with the effluvium; strain becomes synonymous with ecstasy.");
		output("\n\nThe motorized pulsing makes your throat clench in all new ways around his mostly-burrowed mast. All you can hope to do while waiting for him to cum is revel in the bone-shaking dizziness that magnificent cock inflicts upon you. You’re being chipped away at like a boulder, vibrated down into an unseeing and unthinking cocksucker. You’re not sure anymore if it’s your legs shaking, him, or you, merely a passenger in a ship that’s plummeting towards a planet, burning up in the atmosphere.");
		output("\n\nYou cum. At least, you think you’re doing that. The force of it is overshadowed by the incessant vibrations. A warm rush fills your throat like the aphrodisiac milk before it. He’s cumming. He’s cumming so powerfully. Those simple thoughts are all you can be sure of. Anything more... is something your brain can’t quite handle.");
		output("\n\nWhat good is thinking anyway...");
	}
	// PC modded throat
	else
	{
		output("\n\nYou can barely view him as your enemy anymore, not when he starts purring, not when your own pleasure strengthens with his. He hilts himself in your neck, basking in the moistness of your " + (flags["USED_SNAKEBYTE"] != undefined ? "ribbed, ":"") + " precum-washed muscles clenching around him with such intensity and heat that a pussy is obsolete in comparison. <i>“There has to be some logical explanation for what you’ve got,”</i> the dick-wielding kitty husks, <i>“either someone misplaced the most valuable slave on frontier space, or you did this to yourself because you just love sucking cock that much!”</i> His words make you titter, a shameful wave of drug-fueled bliss washing over your heart. With a mouthful of dick, all you can do to answer is lick." + (pc.isTreated() || flags["USED_SNAKEBYTE"] != undefined ? " Lick, and cum from only using your tongue and throat.":""));
		if(flags["USED_SNAKEBYTE"] != undefined) output("\n\nHe opens his mouth again, but all that comes out is a supremely pleasured moan, feral and eminent in texture. Your ribbed throat-muscles grind and squirm around his techno-dick like a nubby gryvain cunt, but you are so much more. He strokes your head adoringly, barely moving his hips while your nose squirms against his belly" + (pc.tailCount > 0 ? ", wagging your [pc.tails] in sync with him":"") + ". Your segmented neck jerks his cock divinely, blinding him with the raw sensuality of your slutty throat, modified only to suck gloriously endowed dick and suck it better than anyone else. " + (CodexManager.entryUnlocked("Slyverens") ? "Even the Slyveren. ":"") + "You sense some remorse when the punky cat asserts again, dragging you off with a regretful whine.");
		output("\n\n<i>“You can’t be some random merc for hire, not with eagerness like that,”</i> he " + (flags["USED_SNAKEBYTE"] == undefined ? "breathes":"pants") + ", <i>“but good slaves don’t set the pace unless told to. And you,”</i> he grins, <i>“weren’t given an order.”</i> He inhales and slams himself into your throat again, an act no less pleasurable than ");
		if(pc.hasCock()) output("having [pc.oneCock] rubbed");
		else if(pc.hasVagina()) output("having [pc.oneVagina] fingered");
		else output("having your [pc.asshole] screwed");
		output(". <i>“F-fuck.. Just... fuck. Your throat needs to be fucked!”</i>");
		output("\n\nForcing himself on you with greater presence, your head is tilted all the way up until your collarbone burns from overstretching between his scissoring thighs. He savagely piledrives your mouth-pussy so hard that his overfull ‘nads threaten to slip inside your mouth too. The techno-feline’s cyber-cock effortlessly plows your gaping and distending oral cavity with the relentless rapidity of a jackhammer. " + (flags["USED_SNAKEBYTE"] != undefined ? "Unbelievably, perhaps thanks to his leering position, his testes squirm into your maw when he drives his cock all the way to the base! Your jaw is stretched all the way to its enhanced limits, and both of his sumptuous balls slip inside your mouth after every thrust. Your cheeks fill out with his sack as well as every inch of his indomitable dick, until your entire head looks like the mold of a fine dick! ":"") + "<i>“I can’t believe... oh... Fuck!!”</i> the kaithrit heaves, pawing frenziedly at your scalp." + (flags["USED_SNAKEBYTE"] != undefined ? " <i>“Your mouth was tailor made for cock! No one else in this galaxy could bulge with dick like this!”</i>":""));
		output("\n\nHe says nothing more, intent on using you like the superb cock-sucking slut you are. You’re nothing more to him than a dick-pleasing holster, perfectly crafted by circumstance and drugs to be the number one jizz sucking whore this galaxy has ever known. Aphro pre, spit, sweat, all sorts of ambrosial liquids blaze trails down your cheeks, down your mouth, all dripping " + (pc.biggestTitSize() >= 1 ? "onto your [pc.breasts]":"into the void") + " or to somewhere else on your sweat-slick [pc.skinFurScalesNoun].");
		output("\n\nYour throat is buffeted by the mechanical cat’s hips. Even though you’ve been pushed into an awkward position where all you can do is look up while you are facefucked into the next star system, you still gargle and swallow, lamely groaning through every perfectly consistent pump.");
		output("\n\nYou consciously work all those internal muscles while you stare into his hooded eyes. The palpable joy you feel seeing how hot he is, feeling how hard he is, is only matched by the mind-numbing pleasure you yourself receive every time that mecha-shaft conquers your too-sensitive lips again, again, again...");
		output("\n\nAn inferior throat and a lesser slut’d be fucked and knocked senseless by this point, unable to handle the sheer amount of kitty-meat this studly cat is packing. When you think you’re doing everything for him, when you think your own needs could not be more satisfied, everything around you rumbles as the military-grade motor powering his phallus activates. The audible buzz of a vibrator reaches your [pc.ears], but it’s felt <i>everywhere</i>. It’s not a second when that numbing rattling occupies your senses and you’re cumming.");
		output("\n\nMind-muddling pleasure prevents you from seeing straight, but your eyes remain open and locked to the feverish feline’s. The electronic thrum of his cyber-dong forces your well-fucked passage to convulse and quiver in previously unknown and decidedly exquisite ways. His dick vibrates your bones down to the marrow, the effect it has on your rubbery lips is itself indescribable. You can’t contain yourself anymore. Your eyes roll back, nearly all the way, ecstasy surging and soaring throughout your body.");
		output("\n\nYou’re nothing but a passenger on a ship, passing through turbulent space. You have the barest grasp on your thoughts, but even when you hold tight they’re soon vibrated away like a rapidly chipped boulder. You can’t tell if you’re shaking, he’s shaking, or if you’re both plummeting down to some planet, burning up in the atmosphere.");
		output("\n\nYou cum. You know you’re doing that. The force of your own many orgasms is enough to match the strength of those incessant brain-washing vibrations, locking you in a rapturous limbo you’re not keen on leaving. He’s cumming too. He’s cumming so powerfully that you can feel your entire body expanding and swelling out, widening in some obscene expectation for an even wider cock.");
		output("\n\nThe oxygen depletion, however, is irrefutable at this point.");
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",wakeUpFromThroatfuckingCybercat);
	processTime(30);
	pc.orgasm();
}

public function wakeUpFromThroatfuckingCybercat():void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	pc.loadInMouth(enemy);
	// PC normal throat
	if(!pc.canDeepthroat())
	{
		output("Before you’ve even opened your eyes, you’re shaking. You’re naked, you’re sore, but ironically you aren’t cold. You find yourself in a familiar place: just outside the elevator, face-to-face with the grinning kaithrit SecOp. He fiddles away on a small device while you groan and sputter to life, first noticing your belongings in a pile nearby.");
		output("\n\nWhen your eyes settle on him, he flips the screen, showing you a few pictures of you cumming your brains out all over his cock, the entire mast shoved down your messy face. Orgasmic and extreme are a few words to describe the fetid debauchery on display. ");
		if(pc.libido() < 33) output("You quiver when reminded of that.");
		else if(pc.libido() < 66) output("You feel horny again being reminded of that.");
		else output("You nearly ask him to send you a copy.");
		output("\n\nHis two tails click, <i>“When I get horny again I’ll be jerking off to these exclusively. I actually wouldn’t mind if you kept poking your nose around here, I’ll just have it poking my crotch when I fuck your face again. If you keep it up, maybe I’ll make some room for you upstairs. You’re a lot more entertainment than the others.”</i>");
		output("\n\nThe armored cat walks off while the saltiness of his cum lingers on your taste buds and the stench of his balls clings to your face.");
		output("\n\nWhen you retrieve your codex, a beep alerts you to an unread message. You open it up to find those very same pictures he showed you and much more, a message telling you that he’d be glad to do this every day and night. ");
		if(pc.libido() < 33) output("You shake your head and hit delete.");
		else if(pc.libido() < 66) output("You swallow hesitantly and ‘forget’ to delete those dirty images.");
		else output("Arousal building, you chew your lip while copying them to another folder.");
	}
	// PC modded throat
	else
	{
		output("The taste and smell of salty, nerve-igniting cum is what you sense before your eyes open. You feel incredibly relaxed, satisfied, and most importantly, warm. When you take in your surroundings, you find that you’re in the elevator again, the kaithrit SecOp fiddling away on a small device while you rouse. Your clothes and other belongings are in a loose pile nearby.");
		output("\n\nWhen you look at him, he flips the electronic screen around to show you a few pictures of you attached to his cock, cumming your brains out, all sorts of " + (pc.isBimbo() ? "yummy ":"") + "fluids dripping down your very messy face. He laughs ");
		if(pc.libido() < 33) output("when you quiver");
		else if(pc.libido() < 66) output("when you blush");
		else output("when you drool");
		output(" at the sight of his entire " + (pc.libido() >= 50 ? "cock":"manhood") + " shoved into your maw.");
		output("\n\nThe ‘punk’s tails click while he pockets his computer, <i>“Wank material like this doesn’t do that throat any justice. I think I might actually start looking for you when I get horny. I might also start preparing a place for you upstairs.”</i> His fanged grin is borderline sadistic. <i>“If I could look forward to your nose grinding against my crotch while I rub across every inch of that wicked throat you’ve got, I’d want for nothing else. But until you figure out if you’re a slave or not, stay away from the foundry, or I <b>will</b> slap an unbreakable collar on that pretty neck of yours.”</i>");
		output("\n\nThe kitty fondly waves near his fangs before stomping down the passage, his threat lingering in your mind much too long, much like his ballstench on your face.");
		output("\n\nWhen you retrieve your codex, a beep alerts you to an unread message. You open it up to find those very same pictures he showed you and much more, a message telling you that he’d be glad to do this every day and night. ");
		if(pc.libido() < 33) output("You shake your head and hit delete.");
		else if(pc.libido() < 66) output("You swallow hesitantly and ‘forget’ to delete those dirty images.");
		else output("Arousal building, you chew your lip while copying them to another folder.");
	}
	processTime(25);
	pc.loadInMouth(enemy);
	moveToElevatorAdjustment();
	CombatManager.genericLoss();
	IncrementFlag("PUNK_SUCKOP_SUCKED_OFF");
}

// Titty Kitty - Smothering Femdom 
// PC will be mounted and smothered by the kitty's tits. They will be forced to ingest a LOT of the synthetic vanae milk and then be ruthlessly dommed by the augmented woman, depending on genitalia.
// I'm just going to roll 'taur PCs on their back for this.
// William

// Note on these loss scenes: Please set the M. SecOp and F. SecOp loss scenes (Throatfucking and this Femdom) to be viewable only after the PC gets one or two VR-visor loss scenes. The bad end path is based around escalating punishment in the form of the two non-visor loss scenes.

// Under // Bad Ends you'll see some more info. Basically, after the PC sees Smothering Femdom or Get Throatfucked, PC will start gaining submissiveness towards M. or F. SecOps. After three losses it maxes out and the bad end sequence can trigger.

public function smotheringFemdomWivTittyKitty():void
{
	showPunkSecOp(true);
	author("William");
	// PC HP loss
	if(pc.HP() <= 1) 
	{
		output("You stagger back and fall to the ground with eye-blurring impact. The grinning cyber-kitty saunters forward, the clacks of her heavy armor ringing in your ears until she’s looming above, staring down, both fangs gleaming against her glossy black lips. She chucks her rifle aside and draws her tongue across those ebon pillows, humming quietly, looking ready to pounce the small, defenseless interloper sprawled out before her.");
		output("\n\n<i>“You know, cutie,”</i> she speaks with a certain controlled ferocity that silences the station, visor fizzing away into nothing, <i>“you <b>were</b> told to stay away from the restricted area. I don’t know what’s got you coming back so much... but as you can see, I’ll take you down you any time you try.”</i> The pony-tailed ‘punk squats and clasps your cheek, two fingers trailing assertion and control across your [pc.face] wherever they go. The studied kaithrit’s ocular augments manifest as reticles trained on you with a naked thirst inhabiting the neon-turquoise.");
		if(flags["SECOP_FEMALE_TITTYSMOTHER"] == undefined) output("\n\n<i>“I don’t think the goggles are having the desired effect here, so it’s time to get a bit more personal. Seems to me you need a very strict lesson in <b>obedience,</b> [pc.raceShort].”</i>");
		else output("\n\n<i>“But I don’t think I mind your obstinance. You’re a very obedient [pc.boyGirl] when I get personal. I’m starting to feel bad about beating you up, because I think you enjoy this part, being a little pet.”</i>");
	}
	// PC Lust loss
	else
	{
		output("You whine and thrust forward, your futile attempt at relief tangling your [pc.footOrFeet] and sending you to the ground. Your impact prompts a strained gasp as you work to relieve the pressure at your crotch, focusing all your efforts on masturbating. In the haze of lust you don’t even notice the bosomy security operative looming over you, arms folded under her great big breasts, sharp fangs gleaming against glossy black lips rippling with a lusty purr’s vibrations.");
		output("\n\n<i>“I really don’t understand why you’ve chosen to ignore the warnings you’ve been given, why you insist on entering the restricted area...”</i> The dangerous and... <b>very beautiful catgirl</b> squats next to you, arresting the clumsy frenzy of your automolesting [pc.arms]. <i>“Shh... everything from here is for me to decide.”</i>");
		if(flags["SECOP_FEMALE_TITTYSMOTHER"] == undefined) output("\n\n<i>“Hmm... I think the goggles aren’t going to be enough. I think,”</i> she says, her bombshell boobs spilling out from her unsealing suit, <i>“you need a strict lesson in <b>obedience,</b> [pc.raceCute].”</i>");
		else output("\n\n<i>“You’re too unruly for the goggles, but I know you’ll calm down when I give you my lesson again. If you ask me, I think you enjoy being my obedient little [pc.raceCuteShort].”</i>");
	}
	// Merge
	output("\n\nThe sleek weave of armor encasing her voluptuous body slides apart with a low mechanical whine. Her superbly stacked rack <i>flops out</i>; studded onyx nipples harden before your eyes, droplets of a purplish lactic treat leaking from the potent pebbles. She raises a hand that curls around one of the nubs, and, with a victorious flex of the wrist, unleashes a thin stream of pale violet fluid from her breast. The sweet-smelling eruption smacks into your upper lip just below your nostrils, ");
	//libidoLow:
	if(pc.libido() < 33) output("and out of traitorous instinct your [pc.tongue] darts out to taste it, licking the opened shape of your mouth clean");
	else if(pc.libido() < 66) output("and despite your position you eagerly lap it up, desperate to slake your thirst as much as your lust");
	else output("and you gladly lap it up, opening wide for more of that ambrosial treat the moment you finish lapping the residue from your thirsty suckhole");
	output(". A note of approval on her lips fills you with a strange sort of satisfaction.");
	output("\n\nYou feel good... but demotivated. Then, you’re suddenly aware of just <i>how fucking big</i> the lawless kaithrit’s boobs are, and how easy the slightest jiggle makes it easy to lie there and stare. They’re big enough to smother an entire arm all the way to the shoulder, large enough to engulf your entire head... huge enough to make you realize they’re all that you can see. Inside and out, the techno-junkie is loaded with ballistics - these are easily the most impressive in her arsenal.");
	output("\n\nAnd they’re getting closer.");
	output("\n\nA nervous breath escapes your [pc.lipsChaste] as she straddles you, clutching you between her thighs and guiding her superlative sugarmounds nearer to your trembling mouth. She coos, <i>“Now that you’re where you belong, it’s time ");
	if(flags["SECOP_FEMALE_TITTYSMOTHER"] == undefined) output("you get a taste of the life that’s waiting for you, [pc.raceShort]-slave-to-be");
	else output("we pick up where we left off, pet. Once you’re nice and trained, you’ll be ready for your slave collar");
	output(".”</i> Fingers rub towards moist, leaking nipples, squeezing softly until they shape into teardrops. Fat beads of lactic fluid bubble to the surface of her mesmerizing areolae. The operative’s organically-enhanced titties are so malleable that you’re hypnotized by their forgiving pliability. It’s hard not to spend valuable time thinking about those being <i>your [pc.hands]</i> on them. <i>“Trust me...”</i> She aims the fluid-weighted girls down with a salacious smile. <i>“...You’ll be thanking me for being so gentle once you submit.”</i>");
	output("\n\nNerve-inflaming numbness makes you feel so weak, a realization that paradoxically feels rather... <i>necessary.</i> You can’t do anything without her. You can’t fight, can’t resist, only be hypnotized by a power that grows more compelling with every new detail you discover on the boundless tracts of unsagging boobflesh. Those pendulous, trance-inducing jugs, inches from your [pc.face], are the source of her sultry voice, automatically tuned to be as sexy and charming and seductive as possible.");
	output("\n\n<i>“<b>Drink,</b>”</i> she exhales, her deeply uttered command fluttering in your [pc.ears]. <i>“You’ll feel better and...”</i> the kaithrit nibs your ear, breathing out two last words in deep, sweeping chord, <i>“...you’ll be ready to listen.”</i>");
	output("\n\nThe last few seconds of your history seem to be missing like corrupted fragments on a data drive. All that your addled brain clocks is that your [pc.lipColor] lips are firmed around the wet source of your unnatural arousal, suckling away sans voluntary input and filling your emptiness with nourishment and liquid relaxation. Slow, soothing gulps of her mind-melting milk permeate every nook and cranny of your body with ebbing, flowing warmth, the effect no different from having someone tuck you into a warm bed on a cold winter’s night.");
	output("\n\n<i>“The VR programs are nothing like the real thing, are they?”</i> she asks, pinching your [pc.ear]. One arm keeps the beauteous babe’s boob hefted for your consumption. <i>“Oh, they’re good for quick, easy training. It’s effective, undoubtedly. Logically... heh.”</i> She snickers only slightly maliciously. <i>“...But it takes all the fun out of the process. You can see it for yourself, feel it. I know exactly what’s happening inside you.”</i> Your kitty-lover leans closer so that you can feel her breath wash down your [pc.skinFurScales]. <i>“You want more, and more... and you don’t want to stop. Am I wrong? You could struggle right now.”</i>");
	output("\n\nHuh? Wait... it’s true. You manage to look away from the sedating jiggle of her chest for a second. Cybernetic augments lend her a flexibility and shape unavailable to most out there, and... she’s not wrong! She’s sort of... hovering over you, propped up on her legs!");
	output("\n\n<i>“See? Nobody’s keeping you here... <b>but you.</b>”</i> More tit is pressed into your mouth, causing an overflow of pale-purple to dribble down your chin. Void... it feels like your lips are ensorceled, or glued to it. The passionate, forgiving quality of her nipple is so wonderful! <i>“Honestly, it’s a fitting position for you. You’re rather ");
	if(pc.isFemboy()) output("adorable. A sweet, harmless little thing like you... it’s a mystery how you got here. I’m surprised you’re not tailing after that rat man’s group nor hooked into one of those fancy biometric chastity cages for the head Viper. All the better for me.");
	else output(pc.mf("dashing. A handsome stud like you needs someone to take charge, let you sit back and enjoy yourself, all so that your mistress can enjoy herself... mmm-make ends meet.","fetching. Any up-and-coming pirate would cherish a pleasure-slave like you, so servile and open to [pc.hisHer] training. But none more than me."));
	output("”</i>");
	output("\n\nYou can’t bring yourself to hate this, can’t force yourself to stop. Drinking from her has become as natural as breathing. She continues to instruct you, stroking your [pc.hairNoun] until you can’t even bear to think anymore. The owner of this succulent breast kneads her capacious milk-tank in a suggestible circle, inexorably siphoning your will. Just keeping your eyes open has become an oppressive bother. Your mind drifts across the sea of aphrodisiac-infused cream while her unhindered fingers massage away your stress... <i>and the knowledge that she’s your enemy.</i>");
	output("\n\nThis kaithrit isn’t your foe, she’s not an outlaw: she’s your goddess. She’s divinity manifest, charting your course towards total surrender. While you suck from one juicy breast, the other is still there, bouncing, nuzzling its colossal soft self into you. When you let out a breathy groan, your free will puffs out with it.");
	output("\n\n<i>“Umfff... there you go");
	//repeat:
	if(flags["SECOP_FEMALE_TITTYSMOTHER"] != undefined) output(", pet");
	output(".”</i> Violet milk sprays out on your hollowed cheeks, radiating power and enjoyment. Where it sprinkles, your body tickles, reddening with raw need. Pleasure wells up inside, an erotic force that she’s in absolute control of. <i>“See how easy it was to let go, and how sublime it felt when your worries and troubles disappeared? <b>That</b> is what subservience truly is... and I felt every bit of yours.”</i> She begins to rock back and forth, delight and desire coalescing into a powerful expression on her face. <i>“Whatever brought you here doesn’t matter. Your life before this doesn’t matter.”</i> God! You’re sway to the waves! <i>“It felt so good to let go, didn’t it? That’s why the goggles are so impersonal. Your transition to a better life just <b>happens</b> with them, and we lose out on this quality time together.”</i> Her purrs feed incredible vibrations into your body, raising all the hairs on your frame while you groan in absolute joy. The exciting perception of those tiny follicles all moving at once is so heavenly that it’s like a gentle breeze brushing over your [pc.skinFurScalesNoun] on a hot summer’s day.");
	output("\n\n<i>“Let me assure you: you’re not being broken in. I have no such violent intentions.”</i> She strokes your cheek lovingly, imploringly, ensuring that her every word is embedded into your memories. <i>“You’re being taught a valuable lesson. Free will is a terrible burden not meant for obedient [pc.boyGirl]s like you.”</i> Her vocalizations lick at the back of your buzzing brain, making them seem more right with every utterance. <i>“Before you met me, you were little more than an unformed, aimless traveler. You know I’m right. That’s why you’re here, listening to me so intently.”</i>");
	output("\n\nHer essence nestles deep inside, always more to follow it down to your expanding gut. Filthy bliss billows into all recesses of your slackened form. As you grow more relaxed and more aroused, you tremble and shake, crying out in raging, unbidden ecstasy, a slave to the seething in your nethers. It hurts, it burns, and most of all, <i>there’s nothing you can do about it.</i> Your willpower, and whatever else could tell you that this should be alarming, has drifted away on the endless currents of your kitty’s milk.");
	output("\n\n<i>“Shh-sh-sh...”</i> she soothes, patting your cheek. The bosomy kaithrit hefts her heavenly boobflesh and hushes you by thrusting both jutting nipples into your mouth and <i>squeezing.</i> <i>“We’ll see to that soon. It’s important for you to understand this part. Once you realize your place, you’ll also realize that your pleasure comes at your owner’s pleasure.”</i> Gouts of libido-spiking milkiness splashes your taste buds like a fertile field, and when your gums are thoroughly sunk in her glorious treat, you finally lose your equilibrium - whatever sense of control you had is now completely gone.");
	output("\n\nShe keeps her glaring, unerring sight locked to yours, wiggling her hips and swishing her twin-tails left and right" + (pc.tailCount > 0 ? ", sometimes brushing your [pc.tails] with them":"") + ". They eventually stop, winding around your waist in a gesture of alien dominance. Through her prehensile appendages, she declares to you through touch alone that you belong to her.");
	output("\n\nEvery suckle from her teat is arousing, in more ways than it ought to be. Your [pc.lipsChaste] are abnormally sensitive, feeling a lot like genuine sex-organs. Squelches like latex against wet latex bloom between the pirate’s muffled musings. It nearly makes you cum when she pulls her breasts away and the teats caress your pleasure-tasters. The augmented catgirl settles on your [pc.chest] with the heavy, contented sigh of a successful huntress.");
	output("\n\nA fuzzy, dreamlike feeling envelopes your entire being. The more you genuflect on the soothing wobble and sensual sway of her bosom, the more you realize that this isn’t a dream. For once you feel... calm... <i>It calms you to stare at her</i>, to worship her with your [pc.eyes]. The longer you focus on her and the sparkling droplets streaming from her divine tits, the deeper you sink into that feeling, that amazing feeling that eliminates all anxiety, obliterates stress, and makes you feel <i>so secure.</i>");
	output("\n\nAnd the deeper she sinks into your consciousness.");
	processTime(8+rand(9));
	pc.lust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",nextBoobsuckingKaithritMindwashing);
}

public function nextBoobsuckingKaithritMindwashing():void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	output("<i>“Now, let’s see...”</i> the punky feline purrs, " + (!pc.isCrotchExposed() ? "pulling apart your clothes to expose the flushed curtain of [pc.skinFurScalesNoun] behind them":"her groping of your [pc.skinFurScales] taking on a new urgency") + "." + (pc.isTaur() ? " For good measure, she flips you over on your back, a process that should be more strenuous than it turns out to be. The milk is incredible, as is her weight atop you!":"") + " She cranes her head towards your crotch, looking over what’s on offer.");
	// pc Herm or Cock
	if(pc.hasCock())
	{
		output("\n\nNimble fingers are bundling your [pc.cocks] in a blanket of teasing warmth. Her touch is tender and caring - every fondling stroke to [pc.cockType] dickmeat reinforces just how good it feels to give in to her. <i>“Lovely toy" + (pc.hasCocks() ? "s":"") + ",”</i> she smirks, jacking you just a little bit faster in a leaned-back straddle" + (pc.hasVagina() ? "; one of the kitty’s hands intrudes further down, discovering your [pc.pussiesLight] hidden in the shadow of your male half":"") + ". The position exposes her own pussy for your inspection, a slightly moist and visibly augmented cunt aching with need. <i>“Mm... I wonder if you can feel how hard you are, little [pc.boyGirl].”</i> You can! You’re so hard it fucking hurts! Any second now your [pc.cockHeads] might twitch, erupt with incendiary delight! <i>“I can feel it. You want to cum very hard. You’re so ready to obey now...”</i> she stares pointedly, <i>“...aren’t you?”</i>");
		output("\n\nShe asks that in a mellow, honey-sweet tone, and you’re nodding along unthinkingly, so very ready to do anything asked to get the release you crave.");
	}
	// pc Pussy Only
	else if(pc.hasVagina())
	{
		output("\n\nAgile, blunt-clawed digits are wandering your vulnerable field of pussyflesh. Your kitty-conqueror’s hands delve into [pc.eachPussy], stroking at the innermost edges, teasing out fresh wetness. <i>“Ah, so ready to be claimed. I wonder if you realize just how horny you are. It’s hot enough that my sensors are already warning me not to stay long!”</i> She laughs, raking her fingers through the [pc.vaginaColor] slit" + (pc.hasVaginas() ? "s":"") + " of your " + (pc.puffiestVaginalPuffiness() > 0 ? "plump ":"") + "femininit" + (!pc.hasVaginas() ? "y":"ies") + ". In no time flat she’s gliding across the slickened surface" + (pc.hasVaginas() ? "s":"") + " of your dewy twat" + (pc.hasVaginas() ? "s":"") + ", fracturing your mind with the prospect of being penetrated knuckle-deep in one go. Leaned back, straddling you from the [pc.chestNoun]-down in cowgirl position, she stokes your incendiary libido to mentally unsafe heights. The passing of the seconds gradually reveals her aroused, synthetic quim. <i>“Now, little [pc.boyGirl]...”</i> she stares pointedly, <i>“do you want to cum? Your body squirms at my touch, but it won’t achieve anything. Not until I allow it. You’re so ready to obey... am I wrong?”</i>");
		output("\n\nA second ago you were inclined to bathe in her milky presence. Her words are bringing forth the most painful of realizations, however: you need to cum. You’re signaling it and you don’t even realize it. Of course you tell her she’s right, nodding eagerly; you’ll do anything to get the release you crave.");
	}
	// pc Neuter
	else
	{
		output("\n\n...Rather, what’s <i>not on offer.</i> <i>“Hmm?”</i> The kaithrit feels around your barren crotch. There’s a moment you sense some disappointment in her reactions. Certainly, there’s some detachment in her eyes, but then she turns to you again, tenderness and sympathy in the bright light of her augmented vision. <i>“So be it. Everyone is useful, regardless of what they choose to do with their bodies. It takes bravery and confidence to go into the galaxy like that. I’m quite impressed. But...”</i> she titters, <i>“...I’m more amused by how compliant you really are. What good are you to anyone but being their next lay? After this, you’ll be more than that to me. I want you to serve me.”</i> Her waist presses forward, presenting more of her artificial vagina. <i>“I will grant you the pleasure of compliance... but only if you really want it. Do you, my little pet?”</i>");
		output("\n\nThe impact of her words is harmless on the surface level, but deep down they’re blanketing you in a submissive haze. It feels genuinely good to be useful to others. You have no means of expressing your libido, but that doesn’t mean you don’t want to earn her favor, pay her back properly for how good she’s made you feel. Of course you want it! You want to please her! She’d be surprised by your empathy right now!");
	}
	// merge
	output("\n\n<i>“Then simply ask for it,”</i> she replies, adding sharply, <i>“<b>properly.</b>”</i>");
	if(pc.isBimbo()) output("\n\n<i>“I wanna cum! Please! I’ll be a good girl if I can cum lots!”</i> you cry out deliriously.");
	else if(pc.isBro()) output("\n\n<i>“Let me cum,”</i> you grunt in defeat, nostrils puffing pangs of denial. <i>“I’m already yours.”</i>");
	else if(pc.isNice()) output("\n\n<i>“P-Please, let me cum, mistress...!”</i> you beg, entirely uncertain if you’re really embracing the pleasure of servitude. <i>“Anything you say!”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“I-I submit - let me cum!”</i> you say breathily, unsure if you’re placating her or yourself. Some of your latent sarcasm does inject itself, though. <i>“I’ll do what you want if... if you do what I want!”</i>");
	else output("\n\n<i>“Yes...!”</i> you hiss, defiant in your tone. <i>“I’ll listen...”</i>");
	output("\n\nWearing a cheshire grin, she crows delighted, <i>“You’re already learning well your most important lesson as a <b>slave.</b>”</i> A genial pat on the head turns into a long, loving stroke of your [pc.ear] that pinches the ");
	if(pc.earType == 0 || pc.earType == GLOBAL.TYPE_SYLVAN) output("lobe");
	else output("tip");
	output(". While her words reverberate through them, she pushes off a few inches from your torso and pivots, seating a curvy, round ass on your collarbone. The kaithrit’s twin black tails weave through the air, corkscrewing around your head while their owner wiggles back, massaging your forehead with her creamy thighs. <i>“Before you can submit, you must learn to please your betters correctly. You will do as commanded and nothing more.”</i> Her tone stops you from smashing your nose into her box, only adding to your wanton writhing.");
	output("\n\nBackward movements of bubbly ass rest a chrome-colored clitoris on your chin. In defiance of its color and make, it’s surprisingly rubbery. It doesn’t just throb, it wiggles with a self-aware sentience, pleasing itself on its own terms against your [pc.skinFurScalesNoun]. You’re then hit with the first taste of her pheromones. It’s a rich saccharine scent distinct among expensive products, not the cloying, gooey accumulation that is natural lube. Her modified muff hones in on your salivating mouth, finally planting its silky, synthetic slopes to your [pc.lipsChaste]. It takes all your willpower to remain composed and not start servicing that obviously ready hole... and of course, you fail. All the prickling heat in your body drives you to deliver short, staccato strokes to the flexing cuntlips warming your [pc.face] in the valley of her sumptuous rear.");
	output("\n\n<i>“Stop.”</i> She pushes up, both tails squeezing on your brain, embedding the command. <i>“You will act only when told. Your innate enjoyment, however, is noted.”</i> The kitty-cat’s hourglass hips set down again, filling your nostrils with even more of that crisp, erotic scent and blinding you under her sizable butt. This time, you manage to keep your tongue from acting on that tantalizing crease, which is made all the more difficult by the steady flow of juices. Large droplets of the stuff splash your palate and tonsil, mixing with residual aphro-milk to make your head swim and your body burst into pleasure.");
	output("\n\nOccupying your view of Zheng Shi is your mistress’ pillowy posterior.");
	// pc Herm or Cock (append, no new pg)
	if(pc.hasCock()) 
	{
		output(" While you can’t see what’s going on in front, you can feel it. The kaithrit’s mammoth mammaries abruptly wrap around your [pc.cocksLight], engulfing your mast" + (pc.hasCocks() ? "s":"") + " in a sensuous crevice of dick-compressing heaven. <i>“Mmm...”</i> she hums, surely smiling from the contact of cock to her hefty bosom. <i>“I once heard one of the Vipers say that " + (!pc.hasCocks() ? "a dick this hard is":"dicks this hard are") + " a sign of subservience.”</i> Lithe arms tighten the velvety vice around your rigid boner" + (pc.hasCocks() ? "s":"") + ", coaxing out lurid volumes of almost boiling precum. <i>“Yes... this is perfect,”</i> she purrs, already sliding her divine boobies down to your [pc.knotOrSheath] and projecting their magnificence through every inch of [pc.dickSkin]. <i>“Just relax, and wait for my command.”</i>");
		output("\n\nSlurps and kisses to your [pc.cockHeads] polish the crown" + (pc.hasCocks() ? "s":"") + " of your phallus" + (pc.hasCocks() ? "es":"") + " at the nadir of her titfucking. Hot slaver washes away on the upwards friction to be repeated. [pc.CumColor] slime mixes with spit, aggravating your pulsating, pent-up need. Raw, animalistic urge simmers just below, begging for real pleasure that her absurdly long tongue begins to offer. Noisy squelches and a full-body throb alert you to the spill of more milk. The kaithrit’s chesty slipperiness bathes your manhood in so much drugged fluid that when your crotch throbs, your entire body <i>pulsates</i> like a fusion core. Clinging violet juice soaks into the outstretched veins on your meat, weighing you down with anarchic sexual desire.");
		if(pc.balls > 0)
		{
			output("\n\nThat’s not all. The busty kitty’s cream floods onto your [pc.sack], drenching your ");
			if(pc.hasFur()) output("fuzzy");
			else if(pc.hasScales()) output("scaly");
			else output("doughy");
			output(" scrotum in phosphorescent euphoria. Rather than climaxing immediately the sensations there magnify tenfold. Your [pc.balls] enlarge" + (pc.balls == 1 ? "s":"") + " like unscratchable itches, tightening your loins even further. At this point, you could snap like a coil and go mad. Your thickening load of teeming sperm serves your body notice that it will be responsible for any loss in faculty once it’s unloaded. You twist about for all the good that does, some sort of swirling, churning weightiness pacifying your sudden spasms until you’re a fluttering thing sliding in and out of your kind mistress’ oh-so soft cleavage. Whatever effect she has on you is undeniably good - you feel full, fuller than ever. Full enough to impress anyone with how much spunk your swollen [pc.ballsNoun] will pump out!");
		}
	}
	// pc Pussy (append, no new pg)
	else if(pc.hasVagina())
	{
		output(" Being unable to see what she’s doing only amplifies the pleasure you suddenly feel. She deploys her tongue in all its wriggling, serpentine glory. Wet, augmented muscle spirals out from her lips to abuse your " + (pc.puffiestVaginalPuffiness() > 0 ? "plump ":"") + "[pc.pussiesLight]. It proves itself a wonderful tool in her proverbial drawer, writhing and twisting and lashing at your [pc.thighs] and [pc.clits]. Before long she’s pressing inside, skewering your [pc.vaginaColor] interior impatiently, pushing out on every single nerve all at once until you clamp down and cum, slathering the technological organ with rivulets of [pc.girlCumVisc] orgasm.");
		output("\n\n<i>“Exquisite taste, pet,”</i> she compliments, slurping and kissing your anatomy clean. You can’t hope to steady your breathing, not with her own folds winking smut upon your features. <i>“The flavor of submission is such a sweet treat.”</i> In post-orgasmic sensitivity she’s gleefully plowing your nethers with that inhuman tendril again, working over you in ways neither you nor anyone else could match. <i>“I can tell you liked that. It must feel so good to be properly touched, to have your needs satisfied by someone who knows you better than you know yourself, yes?”</i>");
		output("\n\nWhat she does next blasts you with an extreme amount of pressure and pleasure all at once that your irises contract to thin points. The station goes while and you register nothing for long, unconscious seconds. Your muffled cries vibrate through her pelvis, gradually weakening in the haze of horniness billowing from it. <b>She’s squirted her aphrodisiac milk there.</b> It’s all you can think to comprehend. It feels <i>so wet,</i> like more moisture has collected there then is physically possible. Even if you were standing naked on a seabed, you would not feel as drenched as you do now.");
		output("\n\nIt teaches you very clearly that her secret bounty is as effective on the exterior as it is the interior.");
		output("\n\nYou cum again at the insertion of a single finger - Fuck! She’s right! It feels too good! And then again you cum, and again... your [pc.pussiesLight] " + (!pc.hasVaginas() ? "is":"are") + " bursting with bliss, glowing like the sizzling-hot source of a beacon’s light. Whimpers and cries build in the back of your throat, rising and falling to the wave of your conductor’s wands. You’re just a playtoy at this point, and that’s a fate you gladly accept so long as she keeps finger-fucking you into the next star system!");
	}
	// pc Neuter (append, no new pg)
	else
	{
		output(" <i>“No genitalia doesn’t mean you can’t feel anything, pet. In fact, think of it this way...”</i> A lengthy tongue longer than any organic muscle slides across every inch of your [pc.thighs], forming itself into a thong for your barren nethers. The tip laps around you [pc.asshole], threatening to pierce it in lieu of any other hole. <i>“...You having nothing now doesn’t mean you can’t receive a gift later. It’s a canvas for us to work on, change as your owner desires. Anyone expecting no more than a juicy fuck doesn’t see the value in a body like yours.”</i>");
		output("\n\nThe kaithrit’s techno-tendril lances your poor bum then and there, wiggling and writhing. Untender motions invade deeper into your bowels, sliding on ample lubrication. Sweat and saliva mix to make you groan from pressure, quivering and slobbering with a face full of cyber-cunt. The tip pushes deeper, sliding around your intestines, certainly capable of finding its way deeper into your body and riding on pathways never meant to be traveled in reverse. She’s content to hang back, however, stay where she thinks you’re comfortable.");
		if(pc.hasPerk("Buttslut")) output("\n\nIt surprises her when you beg for it, when you stammer out the words she can’t believe she’s hearing. You want her to <b>own your " + (pc.analPuffiness() > 0 ? "plumped-up ":"") + "ass.</b> You implore her to go deeper, encouraging her with a desperate twitch and provocative whimper. So she does, packing your colon and stretching it out in that indescribably pleasurable way. Demonstrating your buttslut tendencies is usually more pleasurable than being pounded full of dick. But the way her tongue moves, tucking itself between your [pc.butts]... oh fucking VOID! It’s INCREDIBLE!");
	}
	// merge
	output("\n\nShe’s not ignoring your [pc.face] while she works. As expected from a woman of her caliber, this kaithrit is humping and grinding your face with her potent pussy, smearing you in her uniquely appealing fragrance. Possessive rocks of her glistening vulva shine you in a glaze of intense desire. It gives you reason to whine - <i>why aren’t you allowed to lick yet?</i> It smells so good! The way it makes you feel being this close to it and not being allowed to please it, to lap at it, to worship it... that brings a tear to your eye.");
	output("\n\n<i>“Lick.”</i>");
	output("\n\nYou happily gurgle into the cunt cupping your mouth; finally! The order you’ve been waiting for!");
	output("\n\nAnd as it turns out, an order you could never be prepared for. Your head nearly goes white when your [pc.tongue] touches down on the kitty’s kitty. The mollifying touch of your mistress’ cunt ends your agitations, simultaneously opening itself wider for further inspection. Glistening slopes of steaming-hot puss yawn to accept your oral length, held back by some supernatural (or technological, most like) force.");
	output("\n\nExploring the pirate pussycat leads you to discover a real kind of booty. The one on your face is definitely just for show. Sticky, clear runnels of lube glaze your taste buds in exotic alien nectar. All the slime splashing your energetically pumping organ helps loosen a hole that you realize is cinching down, squeezing with cock-milking efficiency. You expect your face to be numbed by the force of her mesh-like innards, but they rub you like a lover’s hand on the cheek. They’re following you, aiding your service, tugging and grinding only when you slow.");
	output("\n\nSprawling hinterlands wobble around your eyes, effortlessly humping, tucking you deeper inside the kaithrit’s prodigious canyon. All the oral attention sets her hips to bucking - she’s in control, though you’re not sure for how long. She gasps, feeling her own tension drain in eye-webbing waterfalls of gummy goodness. Wads of pre-gasm spurt out, broadcasting the titty-kitty’s promise of a deliciously messy climax. Satisfied gulps keep your mouth mostly empty of the unrelenting tides, though you can’t shake the idea you’re just an extended pussy pump.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("\n\nA yelp and laugh sets your [pc.chestNoun] to jiggling. No doubt she’s very impressed by the girthy length of your tongue. It’s no match for hers, but it’s stretching her so wonderfully. All the tightness you impart drives her to squirt a thick rope of slick wetness in reaction to your unstoppable oral advance. On its own, that one orgasmic emission floods you. It tastes better than all the juice before it, too - it tastes like <b>approval.</b>");
	// Herm or Cock + Cum
	if(pc.hasCock())
	{
		output("\n\nThe best and biggest bosom on station jacks your hungry [pc.cocksLight] in a frenzy. Husky moans wash over the throbbing and dripping fuckstick being polished and lavished by optimal amounts of titflesh. The sea of saturated jiggle laps and rows and heaves and squeezes on your manhood" + (pc.hasCocks() ? "s":"") + ", always a little faster, always a little harder. You’re so firm and eager, going crazy from all the praise. Wet licks to your dilated urethra jerk your hips upwards, barely managing a centimeter from the deck. Curvy hips respond to your nearing detonation, suffocating you in all the pussy you could ever want. Molten pressure builds in the center of your loins, so ready to explode out.");
		output("\n\nBut she won’t let it. <i>“Before I allow you to cum, you will speak four simple words. You belong to me. Say them!”</i> she growls, supple, squishing breasts wringing out another moan. <i>“You... belong... to... me.”</i>");
		output("\n\nHer gloating, wicked tone stirs you. It spreads the sea in your brainwashed cortex. You obey, because that’s what you’ve been conditioned to do. <i>“I belong to you!”</i> Spatters of milk throw more fuel to the fire. <i>“I belong to you!”</i> you shout again, and it strengthens. It’s so close to erupting out. You’ll get to cum if only you make her certain she heard right...");
		output("\n\n<i>“I belong to you!”</i>");
		output("\n\nSpunk gushes out; your spasms flop you around like a beached fish. ");
		//lowCum:
		if(750) output("[pc.Cum] spills forth in creamy torrents, plastering the elysian meadow between your mistress’ heartbeat-thumping breasts. They bulge and deform around your spurting [pc.cocksLight], burying " + (!pc.hasCocks() ? "it":"them") + " in the depths of her crushing valley. The taut embrace coaxes submission and sperm in masterful spate, filling her cleavage with the proof of your virility and obedience.");
		//higherCum:
		else output(" [pc.Cum] launches out; ropes of [pc.cumVisc] spooge packed with submission and sperm coat your mistress in an orgasm born of submission. It coats her face, it spatters her tits, it tells her exactly what kind of prize slave you are. It tells her, more than anything else, that you listened, that you obeyed.");
		output(" [pc.CumGem] arcs of seed buffet her, draining your individuality per successive shot. Your [pc.thighs] jolt upward, eager to empty yourself of all that ejaculate now, some part of your mind perhaps too accepting of your place - when will she let you cum again, after all? Best to enjoy it now.");
	}
	// Pussy and Neuter + Cum
	else
	{
		output("\n\nMilk squirts helter-skelter from the sea of excessive boob weighing upon your [pc.belly] all the while a tongue bathes your nether regions on its own. More efficient than a shower and some soap, it has oiled your [pc.skinFurScalesNoun] and every conceivable erogenous zone in warm sheens of saliva. It’s so relaxing. All you need do is sink back, let her go to work on your [pc.vagOrAss], and remember to breathe when her assiduous cunt gives you such a precious opportunity. She controls you. Her voice is everywhere in your thoughts. Her visage, punky and domineering, is embedded on your frontal lobe. Thick ass cheeks buffet you while orgasm draws near, aided by a twist of that magical " + (!pc.hasVagina() ? "anal":"pussy") + "-pleasing spear.");
		output("\n\nRegardless of the fact that your entire body is libidinous mush, unable to move, and so badly wanting to cum... it can’t. <i>Because she hasn’t allowed it yet.</i> <i>“Mmm... if you wish to cum... if you want to feel the love of a mistress... then you need only say four little words for me. <b>You belong to me.</b> Say them... and you may cum.”</i>");
		output("\n\nHer hypnotic tone is irrefutable. It reminds you of the one thought that your brainwashed cortex is capable of: that you obey, because you’ve been conditioned to. <i>“I belong to you!”</i> you shout, and your waistline jerks up. Everything is numb and prickly and hot, agonizingly heavy. You can sense your climax boiling inside, waiting for the right moment. <i>“I belong to you!”</i> you cry this time, and it gets nearer.");
		output("\n\n<i>“I belong to you!”</i>");
		output("\n\nLightning bolts charged with overwhelming sex drive strike the top of your head and scour towards your groin. ");
		if(pc.hasVagina()) 
		{
			output("Ardor explodes from your swollen [pc.pussiesLight]. It’s the orgasm of a lifetime, vibrating you like the resistance of an atmosphere on a planet-bound vessel. You’re trapped between starbursts and impacting asteroids, shattering into chunks and pieces much like your brain.");
			if(pc.isSquirter()) output(" You clamp down and pleasure seize, wetness bolting out of your " + (!pc.hasVaginas() ? "snatch":"aligned snatches") + " in maddening squirts.");
			else output(" Wetness trickles out in volumes unimagined, likely spurred to flooding by all the milk motivating your system. Needful expulsions of [pc.girlCum] rob your brain of the ability to send electrical signals.");
			output(" You don’t know where your [pc.girlCum] is going, but you don’t care. It’s taking your life with it, gradually reducing you to an unshaped lake of black-out desire between every clench and contraction.");
		}
		else output("Jolts of unexpressed release taper out towards the tips of your body, inner heat venting and overflowing that you could believe steam is hissing out of your pores. As orgasm rams another pounding rhythm of spasmodic release into you, you let out a blissful little sigh.");
	}
	// merge
	output("\n\nAll the while, lust-made-fluid inundates you starting from the head. Femme-cum is everywhere. Javelins of spattering, superheated girlmusk soak into your [pc.hairNoun], dribble across or into your [pc.ears]; it flows down your torso, curtains every limb. It makes you feel dirty, it makes you feel used. But most of all... it makes you feel <i>owned.</i> And that thought, strangely enough, produces only happiness rather than spite.");
	output("\n\nOnce again you lose track of yourself. All of a sudden the kaithrit is off you, sealed up in armor again. There you are, looking at your midden form, gummed up in the leavings of your encounter. For a second you think it a dream until she’s bending low, whispering instructions that you subconsciously accede. You move your hands to the front of your waist, and open them, lifting your wrists for the grav-cuffs being snapped snugly to the [pc.skinFurScalesNoun].");
	output("\n\nAfter that, nothing.");

	// sceneTag: processTime by 20~\rand minutes
	processTime(20+rand(10));
	// sceneTag: PC gets ‘Milk Bath’ effect.
	pc.applyMilkBathed();
	// sceneTag: PC gets ‘Pussy Drenched’ effect.
	pc.applyPussyDrenched();
	// sceneTag: PC cums
	pc.orgasm();
	pc.girlCumInMouth(enemy);
	clearMenu();
	addButton(0,"Next",postLossCuntsuckin);
}

public function postLossCuntsuckin():void
{
	moveToElevatorAdjustment();
	clearOutput();
	author("William");
	output("Life comes at you fast. Air rushes into your lungs when you gasp awake, seated in Zheng Shi’s cargo elevator. The lusty kitty-pirate is nowhere to be seen.");
	output("\n\n<i>“If you continue to show yourself here, I will see to it that your training is completed.");
	//hasCollar:
	if(pc.accessory is MaikesCollar || getWornCollar() != null) output(" That collar you wear clearly comes from an unsuitable master.");
	output("”</i>");
	output("\n\nYou’d jolt back in shock, but there are the armored baps of an augmented pirate pushing against you. Two hands at your waist unlock the cuffs responsible for your bondage, coming away alongside two black tails latched around your abdominals. Before she stands, she nibbles at your [pc.ear], a fang sinking into the appendage just deep enough to cause a wince.");
	output("\n\n<i>“Any more intrusions, interloper, and your freedom ends,”</i> she smirks over her shoulder, hefting her rifle. <i>“But you’ll be back. [pc.BoyGirl]s like you crave attention. And when you come back,”</i> she closes her hand into an O shape, <i>“that’s when you’ll be mine. But that wouldn’t be so bad, would it? Whatever you’re doing with your life, I can’t say, but judging by your skillessness...”</i> she laughs, <i>“you’d be better off living it on your knees.”</i>");
	output("\n\nWithout another word she returns to her patrol, leaving you alone and covered from head-to-toe in leftover effluvium of varying colors and scents. The smell brings an instant twinge of arousal. More... more than it should, in fact. All the milk she made you drink has likely had an effect on your libido...");
	processTime(7);
	pc.libido(2);
	output("\n\n");
	IncrementFlag("SECOP_FEMALE_TITTYSMOTHER");
	CombatManager.genericLoss();
}

// Bad Ends
// Submission to F. SecOp and M. SecOp will be tracked after the PC is subject to one of the non-Visor loss scenes. After about three losses in total, the PC can be bad ended. Next encounter to a maximum dominance SecOp will proc this. The SecOp in question will toss Steele a collar and offer to let them submit. PC can fight for freedom, submit, or lose and be bad ended anyway.
// Subbiness goes down if the PC wins any fight with subbiness. It starts at 0% and goes to 100%.
// If PC bad ends to boi cat, becomes a pleasure slave whored out at Cherry’s wall and his personal use cum-dump. Brain gets fried so that the difference between reality and hypno-VR-programming is completely lost to the PC.
// If PC bad ends to titty kitty, they will be used as a means to test all sorts of new augments and features that she gets, a real life of pleasure. But they’re also hopelessly and eternally addicted to aphro-milk.
// William

// Encounter blurb for bad end, max sub to a SecOp

public function maxSubmissionSecopEncounterText(tEnemy:Creature):void
{
	showPunkSecOp();
	output("\n\n<i>“Stop where you are.”</i>");
	output("\n\nThe voice of a meandering kaithrit does indeed stop you in your tracks. The patrolling operative leaps into view and waltzes up with self-aware bravado. The turquoise holovisor over [enemy.hisHer] eyes evaporates in a digital mist - [enemy.heShe] doesn’t need another superfluous scan of you.");
	output("\n\nOne of the stolid cat’s hands hefts an energy rifle over [enemy.hisHer] shoulder while the other reaches behind to produce an item. A gleaming metallic accessory, circular in shape, is thrown in your direction. It lands on the floor with an ear-numbing slam, rolls a few inches, and lies flat. When you look at it, recognize it for what it is, the ‘punk’s voice reverberates in the vulnerable din.");
	output("\n\n<i>“You heard me well enough before, and here you are again. Anyone else’d shoot you on the spot. I’d rather not damage my new property, though. I’ll give you a choice. Either put that on... or resist. Either way, I think we both know how this is going to end.”</i>");
	output("\n\nThe memories of your use at the cyber-cat’s hands flash before your eyes. Part of you can’t deny the offer. It... has an appeal you can’t quite place: trade your freedom and be swept away on endless rivers of bliss. No more probes. No more fighting. No more thinking. Just submit...");
	output("\n\n...For an impotent moment you stare at the device, a cold-silver slave collar. It’s obviously heavy, and it’s much larger than what the work-slaves wear. A visible latch at the back is pre-opened, ready to be snap shut around its intended recipient: <b>you.</b> Past pleasure and present dread resolve into a disconcerting blend. This extant ultimatum coalesces into an amalgam of humiliation and determination vying for control over your next critical action.");
	output("\n\nIt takes more effort than you care to admit to turn away from the execrable piece of jewelry and face your opponent. [enemy.HeShe] saunters forward, cheshire grin on [enemy.hisHer] face. The kaithrit’s ready for anything.... You only have a second to decide your fate before it’s decided for you.");
	//[Fight] \\ Tooltip: You won’t give up! <b>But if you lose this fight...</b>
	//[Submit] \\ Tooltip: The pleasure you’ve experienced tempts you even now. It was all just a taste of the life waiting for you, if only you would allow yourself to be seized by it.
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatASecop);
	CombatManager.lossScene(loseToPunkSecOP);
	CombatManager.displayLocation("PUNK SECOP");
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	clearMenu();
	if(enemy.hasVagina()) 
	{
		IncrementFlag("MET_SECOP_FEMALE");
		addButton(1,"Submit",luckyCatchBadEndWithFSecop,true,"Submit","The pleasure you’ve experienced tempts you even now. It was all just a taste of the life waiting for you, if only you would allow yourself to be seized by it.");
	}
	else 
	{
		addButton(1,"Submit",slaveslutBadEnd,true,"Submit","The pleasure you’ve experienced tempts you even now. It was all just a taste of the life waiting for you, if only you would allow yourself to be seized by it.");
		IncrementFlag("MET_SECOP_MALE");
	}
	addButton(0,"Fight",fightOrBadEndGooooo);
	return;
}

public function fightOrBadEndGooooo():void
{
	clearOutput();
	showPunkSecOp();
	author("William");
	output("[pc.Weapon] raised, you step back in an aggressive stance.");
	output("\n\nThe kaithrit does the same. <i>“Gonna make me earn it, huh? That’s fine. Training you has been a welcome reprieve from the daily grind.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//[M. SecOp Bad End] - Slaveslut
public function slaveslutBadEnd(volunteered:Boolean = false):void
{
	if(volunteered) clearOutput();
	showPunkSecOp(true);
	author("William");
	// pc Lost The [Fight]
	if(!volunteered)
	{
		if(pc.HP() <= 1) output("A twisting dart of plasma careens into your [pc.weapon], shattering it into several halves that fling from your hands. Before you can react, the pirate leaps forward and slams into your gut, knocking you to the ground and sitting himself on your [pc.belly] with an immaculate and pitiless grin.");
		else output("Sweat builds around your neck like a strangling whirlpool of all-consuming desire. You drop your [pc.weapon] and paw at your [pc.skinFurScales], a prisoner in your own unresponsive body. Wicked and pitiless laughter fills your ears, reverberating in the darkness behind your eyelids. A sudden foot to the [pc.chestNoun] shoves you to your back, and when you open your eyes, there sitting on top of you is the fanged kaithrit with a wide grin.");
		output(" <i>“One last chance, trespasser, and you failed. I’ll admit, it was worth the effort, and a fun diversion. Nothing better than success, right? Well, for me anyway.”</i> His right hand extends, palm opened, and the collar on the floor, as if yanked by an industrial magnet, flies into his grip. <i>“Don’t make this any harder... not that you could. You’ve been conditioned rather well so far. You’ll take to your new life smoothly.”</i>");
		output("\n\nYour [pc.arms] won’t move with his legs pinning them - all they can do is squirm. One hand lifts your head by the chin ");
		//wearingCollar:
		if(pc.accessory is MaikesCollar || getWornCollar() != null)  output("and slices off your old collar ");
		output("while the other whacks the ");
		if(pc.accessory is MaikesCollar || getWornCollar() != null)  output("new ");
		else output("warm ");
		output("choker to your neck. As heavily as it hit the floor, it snaps shut with bleak conclusiveness, strong enough to make your eyes cross from a tsunami of overwhelming reality. Its inescapable grasp tightens around your throat, hissing steam as it flattens your [pc.skinFurScales] to become a permanent fixture on your body.");
	}
	// pc Chose To [Submit]
	else
	{
		output("<i>“Resistance is pointless.”</i>");
		output("\n\nThat’s what your brain is telling you, and you stumble over all attempts to refute it, incapable of formulating a coherent argument. Your inability to defend yourself from the cyber-cat is a shame reflected in every synapse, pressing heavily on your mind.");
		output("\n\nAnd then your brain reminds you of what he’s capable of giving you. A life of pleasure unending in service to something better than you are. His taste flickers on your tongue even now. Being some pirate’s cock holster was more pleasurable than you’d given it credit for, encompassing you in the inexpressible succulence of total submission. Memories vibrate apart, recollection of your mind-wiping orgasm bringing a shudderingly sweet and ecstatic sensation back to you. You want it again.");
		output("\n\nSuddenly you’re knelt beside the device, hefting it, each lewd fantasy making a mockery of your perception of time. If you put this on, then that will be your life now and forever. He’s only given you a sampling of what it’s like to be a slave.");
		output("\n\nYou want more. That’s why you throw your weapons ");
		if(pc.accessory is MaikesCollar || getWornCollar() != null)  output("and old collar ");
		output("away and press the warm device comfortably and snugly to your throat, a shameful heat like morning sunlight blossoming through your loins all the way to your fingertips. You feel the crushing weight of your choice, of the life you’re leaving behind, and let it all go by snapping the slavemaking device to your neck where it belongs, every stress and worry disappearing in a fleeting moment of urgence. The silver necklace hisses steam and cinches down, flattening your [pc.skinFurScales] to become a permanent fixture of your quivering body.");
		output("\n\n<i>“Now lie back,”</i> your <b>owner</b> commands, and you obey. You were already doing so before he finished his sentence, and you can’t tell if it was really you making the choice. You don’t have long to contemplate it before your <b>Master</b> is sat atop your [pc.belly].");
	}
	// merge
	output("\n\nBefore you can ask or wonder <i>what now,</i> your brain goes sluggish and for... lack of a word... or many words... crashes. Blurriness and a surreal feeling of queasiness overwhelm you. It lasts forever, worsening overtime. Invisible fingers poke and prod at your skull, then your brain, reaching and coaxing like you’re undergoing open brain surgery. If the existential discomfort was the darkness, then the soul-soothing wellness you feel at the end of it is the light.");
	output("\n\nHoney-gold contentment works its way down your neck and through your body. Waves of complacency clear your sight. You let out a breath, only now realizing that the criminal cat on top of you is naked. His armor has pulled away to reveal his flexing chrome cock, beading violet, aphrodisiac-laced precum. His artificial dong is heavily engorged, flapping from either a heartbeat or some underlying mechanic. It dominates your view - hell, it’s so close you have to cross your eyes just to get a decent look at it.");
	output("\n\n<b>You want it.</b> Deep down, you really want it. Your dilated eyes admit it, your wiggling, paralyzed tongue demands it. Depraved visions of dragging your taste buds over the synthetic texture of his burgeoning tool flash before your [pc.eyes]. You inhale through your nose, taking in your master’s appealing male aroma, instantly imagining yourself buried nose-deep in those plump balls resting on your [pc.chestNoun] and washing the succulent orbs all day and night.");
	output("\n\nHe brings the toy-like head of his cock to rest on your [pc.lips], shudderingly pleased by what he sees. <i>“Ahhh... what I’m about to say, I may as well be talking to myself. But no matter how much you fine tune a collar or prepare the slave, there’s always some part that lingers, a little bit of old self that recognizes. It’ll be gone soon. So if it’s there, let me explain...”</i> The calm kaithrit grasps the sides of your temple and scoots forward, smearing his tangy, flavorful lube across your [pc.face]. <i>“That collar’s hijacked more than your nervous system. It’s generating an EM field across your brain, intercepting all electrical signals while allowing me to send my own. The goggles we use to program our pleasure-slaves utilize a similar function... but not to this strength. Those target specific areas, replay an infinitesimal fraction of pleasure. But this? A wireless thought is all it takes to give you an order now... and so much more.”</i>");
	output("\n\nYou smile, because he smiles. It opens your mouth to accept the freshest droplets of palate cleansing cock-juice. Now, without words, you hear his voice. It’s almost hallucinatory, a little staticy. On a level deeper than language you know what was meant: <i>“Give me your name.”</i>");
	output("\n\n<i>“[pc.name],”</i> you answer in a voice that’s not your own. It has no inflection or emotion. It would be scary, but with that hi-tech collar weaving its spell on your cerebrum, you don’t feel anything remotely unsettling. Another question comes, and you mouth an immediate and telling answer, <i>“I’m [pc.name] Steele. I came to Zheng Shi to find my father’s probes. I can’t inherit the company without them.”</i>");
	output("\n\n<i>“Hrmm,”</i> your owner purrs, tapping your cheek thoughtfully. <i>“Heh. In other words, a wayward rusher. I can decide what to do with that information later. For now...”</i> His hips smack forward, burying thirteen inches of cyber-phallus in your gullet and pinning your [pc.tongue] to the thick underside. Raw, dizzying alpha-musk wafts into your nostrils when <i>Master</i> presses your nose to his pubic mound, slick with perspirant, rubbing your head all around his grafted girth. <i>“I’ve spent long enough chasing you,”</i> he moans. <i>“I’ve put enough of my associate’s resources into your apprehension. The investment I’ve put into modifying this device as well... oh, it’ll take you some time to pay it off.”</i>");
	if(!pc.canDeepthroat()) output("\n\nHis thrust should have made you gag, but that reflex has been defeated by the inimitable power of mad science.");
	else output("\n\nYour tonsils and uvula knowingly stood aside for his jaw-stretching organ, proving that your innate training as a cocksucker has followed you into subservience.");
	output(" Being taken so fully and so abruptly by something so large is indescribably intense. It bows easily towards your belly in this position, a feat inferior dicks wouldn’t accomplish. You feel absolutely no pain when his huge bluntness reverses to exit amid a <b>Command</b> for your mouth to slaver on all over his fuckstick. Hot inches of spit-shined mecha-cock emerge, savoring the stretching sweep of your [pc.lipsChaste] until it pops free. Your [pc.tongue] lashes out at his turgid synth-meat to clean and polish it, begging it back into your very wet, extremely willing, and unbelievably eager maw with rapid-fire strokes to the crest.");
	output("\n\nAnd you’ll never know if it’s really <i>you</i> doing it.");
	if(flags["USED_SNAKEBYTE"] != undefined) output("\n\nMaster can’t resist thrusting in again, actually meowing when his heavy mast swims into the exotically muscled channel of your modded throat. Ribbed rings of ball-milking quality add a frisson of friction that the kaithrit just can’t get enough of. He grinds into that organic mesh of boner-girding bliss, willing you to suck and hollow your cheeks around his deliciously smooth schlong, eager to find ways to strain it - he doesn’t succeed. Shifting over you, he shoves his apple-sized balls into the obscenely-wide entrance of your accommodating jaw until your eyes roll back. <i>“This is <b>all mine!</b> Fuck! I can’t... believe it!”</i> Simply by pleasing himself at your expense, he pleases you, and knowing that you’re pleasing him pleases you! Profoundly orgasmic mental pressure squeezes down on top of the brainwashing blanket, your erogenous oral zones attempting to achieve climax and failing. He almost cums. Almost... but then he pulls out again.... Noo!");
	output("\n\n<i>“Not only do I control what you feel and what you taste,”</i> he huffs excitedly, <i>“but what you see.”</i>");
	output("\n\n<i>Static.</i>");
	output("\n\nWait, why were you-");
	output("\n\nA flood of graphic pornography crackles in your [pc.eyes]. Some sort of quantum floodgate breaks and your optics, organic though they may be, are hacked into. Real memories of who you were and what you were even doing here filter out so that they don’t trouble a consciousness undergoing a rewrite. Flickering images of VR porn crackle appear and disappear - those you recognize.");
	output("\n\n<b>The immense library you don’t.</b> You find yourself at the center of the entire galaxy’s scandalous sexual productions, the star in every single director’s cut. One second you’re the breeding mare for a gang of masked, gimp-suit wearing leithans. The next you’re tied naked to a bondage cross while haughty saurmorians and rich libertines throw things at you for amusement. Is this really someone’s fetish? You’re not the kind to kink-shame but-");
	output("\n\nIn the span of the next three seconds you’re licking at the most artificially endowed pussy that’s not there, sucking asteroid-sized nipples on spine-liquefying boobs the size of fucking planets, and kissing some Ausar-themed Adonis that is so disgustingly beautiful that only an insouciant apartment dweller could be blamed for its unrealistic features.");
	output("\n\n<i>Static.</i>");
	output("\n\nNow you’re sucking cock. Is it real? Everything around you is inverted, like a photo-negative picture advertising some new teenage flick. It tastes wonderful, so it must be real! The groaning, magisterial kaithrit on top of you is humping away, anxiously pumping into your mouth and stretching your [pc.lips] to their limit. It feels so good to just <i>accept</i> that raw energy, let it mold you. You empathize greatly with how badly he wants to facefuck you, drive that maw-gaping mast ever deeper with successive, savage strokes. You can sympathize with all that dangerously-high tension rutting your suckling cheeks balls-deep.");
	if(pc.tailCount > 0) output(" Your [pc.tails] bristle" + (pc.tailCount == 1 ? "s":"") + " with the idea of cumming from being so ruthlessly claimed.");
	output("\n\n<i>Static.</i>");
	output("\n\nThe kitty’s gone, and in his place is a gigantic, barbaric lizard-man, dual-dicked and jackhammering both jaw-breakers into a gargling mouth you can’t be sure isn’t yours. Cascades of reptilian jizz stream into your overfilled cheeks; the sensory overload is unbelievable. Involuntary gulps on your part swallow endless onyx inches of breeding mass meant for mythological titans while a throat stretched into an industrial pipe guzzles thick rivers of gut-swelling slurry. Balls the size of melons, stinking of bestial musk, smash into your... gigantic boobs!?");
	output("\n\n<i>Static.</i>");
	output("\n\nYou stop asking where you end up. It feels good. Why bother worrying? It’s happening for a reason, after all, and that reason is it feels soooo goooooood...");
	output("\n\nNow you’re face-down and ass up, [pc.vagOrAss] being plunged desperately by someone you can’t see - you’re blindfolded. Girlish grunts overlap the smack of hauling hips - fuck! That’s hot! She must be a dick-girl, or a full hermaphrodite. She’s definitely got a pair of hefty, full nuts... and they’re soft and fuzzy! Oh you wish you could see her. Whatever fictitious scenario this is, that’s your only criticism of it! How much better this circumstance would be if you could only see the <i>raw emotion</i> beaming on the futanari’s face? Your mystery lover’s luscious pumps bring your libidinous mania to a peak. Can’t she go any faster!?");
	output("\n\n<i>Static.</i>");
	//pcSawWallSlutVR:
	if(flags["SECOP_WALLSLUTTINGS"] != undefined) output(" Oooh! You recognize this club! And you recognize those horny bunnies!");
	else output(" Now you’re in some sort of club... and the air <b>reeks</b> of horny bunnies.");
	output("\n\n<b>You LOVE horny bunnies!</b>");
	output("\n\nPink and Gray laquines, fully naked, have their padded fingers hooked into your head and are plowing your leaky front suck-hole for all its worth. You don’t have the control necessary to pleasure them, only sit back and watch them plunge through the tension-pinched band of your windpipe past the immensely-strained band that is your cock-gobbling lips. Oh fuck! It’s full of cum; the slut-bunnies orgasmed a while ago, <i>that’s</i> why it’s so hard to do anything! Pink pulls her totemic pillar away and gray’s four-ringed sledgehammer acts as a plunger. It thrusts in, barreling into your belly, and emerges with a firm yank. A fast-oozing pillar of cum pours from the hole, so exquisitely pleasurable. Now you know exactly how champagne bottles feel after being shaken and uncorked!");
	output("\n\nAnd, thank goodness you don’t have to worry about things like breathing!");
	output("\n\n<i>ZZZZzzZZsttttatic</i>");
	output("\n\nIncoherent gurgles are all you make out. Your senses are so completely fried at this point you only exist in an erotic anthology that could go on forever." + (silly ? " <b>Sounds exactly like the game you’re playing, doesn’t it?</b>":"") + " Trapped in a chair licking pussies for a virtual facade of Tamani Corp is a delight you can’t wait to have crop up again. You’re cumming on an endless loop, fingers clenching and unclenching at nothing. In fact, your whole body’s doing that. You’re no longer a body, you’re just an erogenous zone drifting from timeline to fake, super sexy timeline. Oh look, you’re fucking some pregnant, child-swollen bunny bitch! Aw, and now she’s gone!");
	output("\n\nBut that’s fine, now you’re riding the twitching form of a very important looking dog man! He’s dressed up like a soldier, maybe you’re his CO giving him the reward of a lifetime! Ssssshit... then there’s... aw this one sucks! You’re all alone! Thank the VOID it’s over though, because now you’re having the time of your life fucking in a freefall. This can’t be safe, but holy damn is it a thrill!");
	output("\n\nWhite noise overwhelms you and your senses go flat and white. In some place... in some reality you cannot comprehend, you feel... full. It’s weird. You don’t want to feel this. Why is everything so blank and joyless now?");
	output("\n\nDarkness comes, and then there’s a glitchy whine.");
	output("\n\n......");
	processTime(60);
	pc.lust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",slaveslutBadEnd2);
}

public function slaveslutBadEnd2():void
{
	clearOutput();
	showName("WALL\nSLUT");
	showBust("BORED_JUMPER_EQUINE_NUDE");
	author("William");
	output("<i>“I’ll pay you back, I promise! I want it so bad c’mooonnnn I’m like the only one who hasn’t gotten to try [pc.himHer] out!”</i> whined a zipsuit-wearing laquine, gray-furred and stupidly horny. <i>“Besides, I don’t need the whole amount, just a little extra pleeeeaaassse!”</i>");
	output("\n\n<i>“Fiiiine,”</i> a brown-furred one groaned, tossing her crewmate a credit chit. The gray-furred one, eyes wide and giddy, transferred the monetary value to hers in the blink of an eye, hopping for joy until her sweaty getup squeaked and creaked.");
	output("\n\n<i>“I’ll get it back to you, promise!”</i>");
	output("\n\nAll Gray gets is a shrug of the shoulders while she turns towards a huge wall full of presented mouths and crotches. Cherry’s Tap Hall, one of the two premiere attractions on Zheng Shi’s recreation deck, was always busy. Crowds of pirates belonging to the top five or freelancers looking for a nice, wet hole to pump full of unspent seed grazed shoulders and chose a disposable pleasure-to mounted in the so-called ‘Slut Wall’. It was like a soukh at its busiest, and at the time, it was busier than it had ever been.");
	output("\n\nThe overexcited Jumper made her way down the sexual corridor lit a yummy, erotic red, whimpering softly from the squelching glide of an erect dick tightly bound in her skin-tight latex zipsuit. She hadn’t cum all day. Waiting any longer would leave the poor herm with a serious case of blue-balls. While there were sluts open for business as far as the hungry eye could see, she, like half a dozen other outlaws, was here to try out a popular new attachment to the sexual stockade.");
	output("\n\nIf she thought she was in agony getting there, she had no idea what it would be like to wait in line for that reputed slave. Everybun in her crew talked about [pc.himHer]. All the other bunnies got a go, later lamenting how other slaves felt so unsatisfying, particularly on the matters of oral sex. The lewdness of flesh being urgently pressed into a servile piece of fuck-meat replayed again and again as a train of at least twenty mercs all taking their turn on the [pc.raceShort] sex-toy hooked into this wall, turning the largest profit out of all other contracts.");
	output("\n\nGray waited, ears lifting in delight. For everyone that left the line, cocks satisfied and messy with rainbow lipstick, another two appeared behind her. In her rubbery fingers she clutched the the credit stick filled with the exact price of Zheng Shi’s preeminent cumdump, thinking very, very hard about the amazing fuck to come. She’d gotten close enough to note the hired muscle keeping watch of this slave, dangerous weapon in hand.");
	output("\n\nShe paid the lump no mind, blinking the anticipatory excitement from her eyes. A Corona Lord left the booth, making her next in line. Like a kid in a candy store she darted around the corner, finally laying her eyes on the station’s most distinguished oral whore.");
	output("\n\nStepping forward, Gray noted the cum-flecked features of the [pc.boyGirl] installed there, and the name ‘[pc.name]’ on a tag in the corner. In ordinary fashion, [pc.hisHer] torso jutted out, arms bound in rubberized compartments. [pc.HisHer] mouth was available, and from it hung a ridiculously long tongue that was longer than the average rodenian was tall. The hedonistic laquine had already unzipped, baring fourteen inches of precum-glossed horsemeat to the [pc.raceShort] salivating over [pc.hisHer] next customer with a thousand-yard stare. [pc.HeShe] had a ");
	if(pc.isFemboy()) output("cute");
	else output(pc.mf("handsome","beautiful"));
	output(" face, [pc.ears]");
	if(pc.hasHair()) output(", [pc.hair]");
	output(", and " + (pc.bRows() == 1 ? "a ":"") + "[pc.fullChest].");
	output("\n\nBut what was really incredible, aside from the floor-reaching organ dangling from the [pc.raceShort]’s mouth, was [pc.hisHer] augmented lips. Apparently one of the Cyber Punks provided this slave, got [pc.himHer] modded up with a pair of perpetually transfiguring lips that constantly swapped from one color to the next on the full RGB spectrum. Seemingly at random, the upper and lower lips deflated and inflated independent of each other, too!");
	output("\n\nWithout further delay, the sweat-lathered cred stick was rammed into the slot nearby. Price paid in full, the feral laquine thrust her beefy dick forward, holstering her mammoth girth into a ribbed throat designed for maximum dick-pleasing effect. The cock-slave’s tentacle of a tongue wound around her latest client’s sheath and pheromone-drenched nutsack, tip juggling the densely-packed apples behind the cum-taut pelt. <i>“Aaaahhh f-f-fuck!”</i> the lapine woman screamed, gripping [pc.name]’s ");
	if(pc.hasHorns()) output("horns");
	else if(pc.hasLongEars()) output("ears");
	else if(pc.hasHair() && pc.hairLength >= 2) output("hair");
	else output("head");
	output(", struggling to pull out from suddenly-shifting DSLs that loved to hug and squeeze and touch, holding so firmly so as to provide the ultimate cock worship.");
	output("\n\n[pc.name] expected this ferocity - everyone went at [pc.himHer] this way. One touch of those impossibly silky soft lips and they were slamming their schlongs in with all possible vigor. Ball-draining gulps capable of decompressing a capital-class starship kept the hapless slut-bunny from pulling out more than a couple inches <i>at most.</i> Although she occupied the dominant role, she, like everyone else, didn’t have the strength or endurance to handle the glory of those unreal sensations sweeping her off her feet. The mouth of this slave was like a cock-pump, pulling on every veiny inch of musky bunny-dick in ways only ultraporn-stars with fap-worthy pole-smokers could.");
	output("\n\nBut a laquine knew how to fuck. They knew how to breed. She wasn’t gonna be done in by some gulping! Rearing back, Gray thrashed on the verge of spermy decoration, pushing through bloated cock-pillows custom made for pleasing the galaxy’s menagerie of penises in one or two bobs of the exotic neck. Conjuring up her inborn hardiness, Gray fucked those blubbery cock-cushions like the slippery twat they imitated, staining her veiny hardon in a multitude of colors to remind her of the fun she had.");
	output("\n\n[pc.name]’s lower lip caressed the bunny-bitch’s spongy cumvein, the upper lip shrinking in contrast to the growing of the bottom. Blue and green lips, glazed in the cum of a thousand criminals, strained into a jizz-flecked pucker imploring the needy slut to give in and let gush waves of spunk to add to the reservoir most certainly sloshing within the slave’s containment. If Gray could see her pricey prostitute’s eyes, they’d be frantically swerving and rolling in a style similar to REM sleep. But, she couldn’t, focused as she was on leaving an imprint of her crotch in her [pc.face], riding her libido to mountainous proportions.");
	output("\n\nGray’s beret fell right off her head when she thumped forward, knees knocking and losing strength. Her throat-filling mass could no longer contain itself, not in the face of those magnificent deep-throaters. She did more than cum, she cracked like a planet. The latent ‘pink note’ stoking the Tap Hall’s alumni into debauchery prolonged her barbarically elongated male orgasm. The taut throat loosened then clamped down again on the pirate-bun’s aching dong, tending to the defiant member until its length had been fully sapped of sperm and sex drive.");
	output("\n\nAnd so she crab-walked away, barely managing to tuck her horsedick away in time for the next customer to see to [pc.name].");
	output("\n\nThe cycle repeated ad infinitum...");
	days += 7;
	processTime(4*60+rand(20));
	clearMenu();
	addButton(0,"Next",slaveslutBadEnd3);
}

public function slaveslutBadEnd3():void
{
	clearOutput();
	author("William");
	showPunkSecOp(true);
	output("<i>“Oh, yeah. It’s taken care of. In fact, we’ve done more than break even. Yeah. Yeah. Yes, boss, that too.");
	if(crew(true) > 0) output(" Ah, good. I’m sure " + (crew(true) > 2 ? "some of ":"") + "our intruder’s former staff will bring us in even more money when we find prospective buyers.");
	output("”</i>");
	output("\n\nYour master’s communications aren’t for you to care about. He’s embedded to the hilt in your throat for a reason. You love that look on his face, those smiles he gives, all without breaking stride in what sounds very important.");
	output("\n\n<i>“Huh. You found it? So our trespasser wasn’t lying, then. With that company’s fortune and immediate family for ransom, we may just be able to take on the Black Void soon. I’m sure Vanika is already hounding you for a share.”</i> He grabs your head and forces you back and down again, eyes nonchalantly aimed to the ceiling of this dim little sex pit. <i>“Ah, yeah, [pc.heShe]’s where she always is. I was away too long, so I decided my quality time is best spent here for the week.”</i>");
	output("\n\nYou suck, lick, swallow, and gulp. There’s a little static in your eyes but you don’t mind it. The little pulse in his balls channeling through your many-times slapped chin tells you he’s so close to cumming. Just a little harder, in that spot you know Master likes. Apparently you’ve gotten so good at it you managed to interrupt his chat!");
	output("\n\n<i>“Ah, don’t worry. I’ll see you soon. Maybe,”</i> he laughs.");
	output("\n\nWhen his neck cranes to face you, he allows himself to cum, lets you tap the urge that begins his long-overdue release. Master was away for so long.");
	output("\n\n<i>“Who knew that you were so valuable,”</i> he puts a hand on your head. <i>“I have to say, I never expected this in my line of work. Don’t worry. The rest of the galaxy will never know our little secret.”</i>");
	output("\n\n<i>Static.</i>");
	days += 3;
	processTime(10+rand(1000));
	badEnd();
}

//[F. SecOp Bad End] - Lucky Catch
public function luckyCatchBadEndWithFSecop(volunteered:Boolean = false):void
{
	if(volunteered) clearOutput();
	showPunkSecOp(true);
	author("William");
	// pc Lost The [Fight]
	if(!volunteered)
	{
		if(pc.HP() <= 1) output("Your footing is lost, and the kaithrit across from you fires an aimed shot that disarms you. Your [pc.weapon] breaks apart in a matter-obliterating discharge of plasma, leaving you helpless to stop her from stepping forward and claiming her prize. While you fall to the ground exhausted and beaten, she throws her weapon aside, softly laughing per meandering step.");
		else output("No longer will your libido be denied. It remembers the conditioning. It blooms at the supple, sensuous sway of her female form. It explodes at the jiggle of her armored breast and at the memory of your lips being wrapped around the source of infinite joy. You fall, losing your [pc.weapon] in the descent, and struggle to masturbate, no longer able to defend yourself from a life of slavery.");
		output(" <i>“There you have it. See? Told you I wouldn’t hurt you. Much,”</i> she chuckles.");
		output("\n\nYou manage to look over and she’s gone... and then two hands weave under your [pc.arms] and around your front. The cool, oppressive touch of her armor to your [pc.skinFurScales] settles into your core, driving in the truth of your situation with every beat of the heart.");
		output("\n\nThe victorious operative whispers into your ear, <i>“Now... it’s time for you to stop fighting it. You know your life is here...”</i> She opens one of her hands and the silver collar on the floor is tugged towards it by a powerful magnetic force. <i>“...in this collar. You’ll be taken care of" + ((pc.accessory is MaikesCollar || getWornCollar() != null)  ? ", moreso than your previous owner seems to have cared":"") + ". You will want for nothing ever again. You will spend your days thinking of how best to please me. Such is the ease of being a slave.”</i>");
		output("\n\nShe brings the open loop of gleaming metal to your neck and pulls the inorganic snare back, snapping the slavemaker to your throat. The circuit is completed tight and oppressively, deafening you with the sound of its closure. When it cinches down, hissing steam to close permanently around your neck, it scares you, makes you squirm... but the kaithrit is there, stroking your [pc.hairNoun] gently, whispering sweet nothings into your [pc.ear] to soften your transition to your new life.");
	}
	// pc Chose To [Submit]
	else
	{
		output("There’s no denying that siren call echoing somewhere in your head. You’ve had a taste of the life that’s waiting for you. The flavor of obedient submission has coursed through you, allowed you to cum, shown you what a good [pc.boyGirl] like yourself will receive if [pc.heShe] listens. The memories of being beneath that lovely kaithrit come rushing back. She spoke softly, treated you sincerely, eased you into this.");
		output("\n\nEvery step you take to the collar gets easier than the last. First you shed your weapons, and then your worries. Left - color is brought to your cheeks. Right - the color deepens. Left - you remind yourself of her meticulous care. Right - you realize how wonderful the shame of being so inferior and yet so useful and desired is.");
		output("\n\nAll of a sudden you’re holding the silver collar and the kaithrit is gone. The alluring prospect of giving up your stresses and your quest to become a pleasure-slave curls your mouth upward. You’ll be <i>hers.</i> You’ll get more of her milk. Most of all, you haven’t forgotten what you said to her. That admittance before is replaying in your mind.");
		output("\n\n<i>“You belong to me.”</i> She appears behind you, arms wrapped around your torso. She places a hand on your wrist, crooked fingers gently ushering the device to your throat." + ((pc.accessory is MaikesCollar || getWornCollar() != null) ? " You didn’t even notice how quickly or silently she took your old collar off.":""));
		output("\n\nYou belong to her. That’s why you fit the ");
		if(pc.accessory is MaikesCollar || getWornCollar() != null) output("new ");
		output(" collar snugly to your neck and cinch it shut. An agonizing moment comes - your old life ejects into the ether - it goes, and then... nothing. The device closes with a quiet hiss, flattening your [pc.skinFurScales] below its implacable circumference. Once it’s become a permanent fixture of your body, the quiet that settles over you makes you feel so <i>liberated.</i>");
		output("\n\nMore than you ever have before.");
	}
	// merge
	output("\n\nA moment of queasiness blots Zheng Shi out; you fall backwards, though you’re propped up. You can’t tell what’s doing it until the sensation clears, yet there’s still some kind of <i>interference</i> in your mind, electrical in nature. Something vague and unnatural tingles in the back half of your brain. Overhead, below a fluorescent light, is the face of a gorgeous woman, gazing intently. Her eyes have a dizzying radiance to them, filling the cracks in your shaky memory. You have no idea what’s going on, but you meet those glowing irises above and the grinning face leaning ever closer.");
	output("\n\nGlossy black lips shimmer in the light, mouthing words you can’t hear. Those succulent pillows, sweet as black licorice, purse into a friendly pout and everything clears. The low whine in your [pc.ears] dissipates and the uneasiness in your gut simmers down. <i>“Nnmm...”</i> you moan, sitting up, much too confused. It’s a little hot in here, weirdly enough");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output(" too warm! These clothes are making it unbearable! Thankfully you have beauteous woman there to help get them off!");
	else output(", almost hot enough to sweat. Fortunately, the beauteous woman at your side has a rather cooling touch!");
	output("\n\n<i>“How do you feel?”</i> she asks smilingly. <i>“Perhaps a little nauseous. It will pass, as all pain does.”</i> She grabs your [pc.ass] and gives it a firm squeeze, walking that same hand over your [pc.thigh] and [pc.hip]. <i>“It feels so, so good doesn’t it?”</i> The kaithrit narrows her eyes mischievously, grasping at the back of your [pc.hairNoun]. <i>“Oh, no need to be so quiet.”</i>");
	output("\n\nYou still can’t find your voice, but she seems rather understanding of the whole scenario. You nod, for now, hoping you can be a little more candid soon. It’s almost a little scary how intensely she stares at you, watching your eyes. Attention from a woman this beautiful is rather difficult to handle. You’re not worthy of it. Really, it’s too much...");
	output("\n\nWhen you cast your eyes down, she lifts them back up. <i>“None of that. I have some things I’d like to tell you. When you feel up to talking you may speak freely... but only to me. You will be as quiet as a mouse-  well,”</i> she chuckles, <i>“as quiet as they can be around here. Simply put, you will answer only to me and no one else. Understand?”</i>");
	output("\n\nAutomatically, you agree. You’re nodding so fast that your neck begins to ache! Nothing in this universe would make you happier than to comply with that order! Interestingly, you feel <i>even better</i> in light of that admittance, like someone just put a nice, warm shirt on you after a long steamy shower. What residual tension you felt has been soothed away so thoroughly you wonder if you’ll feel that blissful sensation again if you acquiesce to another request!");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she pats you on the head. <i>“Once you’re adjusted to your collar, I’d like us to get a little more intimate in the future. I’d love to hear all about your life. I bet nobody else has ever given you the time of day. I’m sure there’s a lot of things you’d be eager to tell me, right?”</i>");
	output("\n\nFor her!? Yes! Absolutely!");
	output("\n\nA small shiver works its way through your muscles, like your entire body had been fatally parched and is now being nourished by a life-giving spring. While some small part of your brain is trying its damndest to tell you this artificial euphoria isn’t all it’s cracked up to be... you don’t care. Mimicked though it might be, the innocuous pleasures that your obedience grants you are still glorious waves of emotional contentment you’re happy to ride on.");
	output("\n\nFor a while she doesn’t say anything. The black-furred catwoman with a fierce, possessive profile shifts her weight to another shoulder, buxom boobies rocking gently. If she were a model waiting for a score, any judge who held up less than ten-fucking-out-of-ten would be a liar. And liars get stomped! You could sit here watching measurements of her juicy chest slide around, take your eyes and your pathetic little brain with them. You don’t want to look away, such is their captivating power.");
	output("\n\nViolet-purple beads form at the inky plateaus of her onyx nubs, lending them a lovely ebony shine when they sag and leave behind moisture. A whine builds in your throat when it drips onto the deck and you want so badly to catch it, savor it. Unformed need sets your limbs to twitching, aberrant electrical signals running through a body subject to the whims of a very playful mistress.");
	output("\n\nIf you could look away from her boobs, you’d see an analytical, hawkish expression poking and prodding, sizing you up. Her breaths, her heartbeats, her little laughs, they all keep your sluggish brain focused on what matters most: heavy, taut, milky mammaries bouncing and swinging. <i>Why won’t she let you touch them? Why won’t she give you another order?</i>");
	output("\n\n<i>“Do you want them that badly?”</i> she asks, fully aware of your stacked lust, how badly you want to nestle deep into them. <i>“Well, slave? Can you answer yet?”</i>");
	output("\n\n<i>“Y-Yes!”</i> you blurt, loosening that throbbing lump in your throat.");
	output("\n\n<i>“Ooh... I think that’ll be fine. We can see to the more <b>active</b> arrangements later. But before I give you a little treat, tell me your name.”</i> Her finger strokes the metal of your collar, little touches feeding through the fancy bit of jewelry to stimulate the rest of you.");
	output("\n\n<i>“[pc.name]!”</i> you answer, completely incorrigible. <i>“[pc.name] Steele!”</i>");
	output("\n\n<i>“Mm, that’ll do. Come, drink all that you can.”</i> She sits up proper, hefting her shaky bosom with an inviting smirk.");
	output("\n\nWith all the force that your electronic bondage will allow you throw yourself into the purring kaithrit’s lap, prostrating yourself to the undersides of those smothering mountains. Grasping the back of your head, she slides one of the large, jutting nipples into your mouth, quietly ordering you to suckle.");
	output("\n\nDiscomfort immediately fades as you gulp down bliss-imbued milk. Worry is massaged away by the two tails wrapping around your abdomen. The epic mounds of curvesome rapture press into you, deforming around your form until pretty much all you can ‘see’ is an expansive squish. <i>“Touch them... gently.”</i> Oh, she spoils you! Your [pc.hands] rise, athrill that they too can feast on these sumptuous breasts. Twitches of pure pleasure run through her body while you squeeze your upquirked mouth full of libido-spiking juice. Spurts of thick warmth splash into the back of your throat. Your cheeks can’t handle the overflow, and a line of kitty-cream trickles down your [pc.lipsChaste].");
	output("\n\n<i>“Don’t waste it,”</i> she sternly reminds, wiping a finger to the [pc.skinFurScalesNoun]-striping excess, stuffing it delicately into your maw once there’s room. Her tenderness and sincerity, mixed with the rich, delectable milk filling your gut, bring exuberant tears to your eyes that she also wipes away. <i>“Better,”</i> she coos. <i>“Remember your manners while your mouth is full. What I’m about to say I will not repeat, so those ears better still be working.”</i>");
	output("\n\nJoy blooms in your fluttering heart, layering over a hunger that just doesn’t abate. You listen on your linear mindset.");
	output("\n\n<i>“Hearing your mistress’ needs will be your whole purpose from now on. You will do only as I command, will serve my needs. It will make you feel very happy. You won’t care where my work takes us. You will always be at my side, pleasuring me, taking care of me, being the most valuable thing to me.”</i>");
	output("\n\nBubbling lactic fluid gurgles in your throat. Your response is muffled under the eternal streams, but <i>fuck</i> <b>yes</b> that’s what you want to do! Your eyes sort of roll back at the same time, too. Any more of that pleasure will make you shut down!");
	output("\n\n<i>“Don’t get too excited,”</i> she winks, stroking your face. <i>“You will never get any rest until I’m satisfied. You’re going to be there for me at all times of the day should I need you. Lucky for you, I’m a rather needy girl. I like getting new things, like trying out my new toys, seeing to my property. You’re going to help me with that in any way I choose.”</i>");
	output("\n\nHer fingernails rake your scalp, focused behind your [pc.ears]. On the cusp of slavish orgasm, she massages her desires into your head. Now your eyes have rolled back, and you’re simply basking in your goddess’ divine, feminine aroma. The ceaseless streams of ambrosia inspire the worst kind of gluttony...!");
	output("\n\n<i>“I’ll take care of you, protect you, because you’re my slave. Nobody’s going to hurt you. You’ll get to spend every day thinking about how your mistress will come back rich from a raid, wanting to sit back and relax.”</i> Her soft, sweet tones fade into heavy pants. <i>“It’ll be nice, having a reason like you to keep kicking ass. Life’ll be so damn-”</i> she winces, your incisor grazing her nipple <i>“...easy. So much more fun. Heh, you get to suck on boobs for the rest of yours while I have to work even harder. Good thing we found each other.”</i>");
	output("\n\nShe presses forward, squirting a throat-clogging volume of serenity-inducing love into you. You’re so hot and horny that you can’t do anything but replay everything she said on repeat, cumming to the thought. You’re thrashing in her lap, shuddering and quivering as your belly swells and you suck and suck, breathlessly enchanted...");
	processTime(50);
	pc.lust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",luckyCatchBadEndWithFSecop2);
}

public function luckyCatchBadEndWithFSecop2():void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	output("<i>“Mmm, a little deeper there, [pc.name]. I think you’re holding that tongue back. You wouldn’t be trying to annoy me, would you?”</i>");
	output("\n\n<i>“Nnnoooo, mistress,”</i> you groan.");
	output("\n\nMistress’ ass wiggles, and the pussy on your [pc.lipsChaste] stretches around them. You’re trying that new tongue she got for you a while ago and, sadly, you’re not as proficient with it as she’d like. It’s demotivating to hear the bored sighs from above and the tactile lack of enthusiasm in her blinding flanks. But you’re her slave, and a good one at that. You’ve been mouth-deep in twat innumerable times (how did that happen anyway?), you just have to find-");
	output("\n\n<i>“Ahh!”</i> she twitches suddenly. That’s why she likes you, because you’re a quick learner. Lashing <i>that spot</i> with giddy exultation, you pack your owner’s infallible muff full of juicy, inorganic flesh, spearing her baby-factory in a singular lunge. Your brain’s coping mechanisms are finally kicking in with this rad new augmentation mistress graciously had installed for you, turning you into the ultimate cunt-kisser, demonstrated by the way your new flesh undulates in curvy motions. <i>“Mmm, that’s a good [pc.boyGirl]. It always takes a little encouragement and you’re just the fucking best.”</i>");
	output("\n\nThere’s a kind of madness in the way you devour her augmented womanhood. Her clit bulges out, inflating with lust - you get a [pc.hand] around it, jerking the erectile fuckpole until she’s bucking the way <i>you</i> love. You impale her right up to the ovaries, still not entirely sure if that part of her is modified or not. The sounds she’s making lanced on your cock-shaming muscle motivates you to drive more of your incredible gift into her soakingly-aroused wetness. <i>“Right there, [pc.name]!”</i> she meows, a full-body purr setting in just before she cums. Orgasm begins with a squirt, and then a slow, steady trickle of femme-cum to slather your trunk-like tongue in succulent bliss.");
	output("\n\nYour withdrawal is long, slow, and provocative. It’s the embodiment of total, delighted submission. There’s no impulse, only a drag of noisy, lurid flesh from a tensing wet hole of fervently-fucked nerves. You’ve done this so much you know exactly what she enjoys regardless of what kind of firmware upgrades her very-functional vagina obtains.");
	output("\n\n<i>“Every night is one to remember,”</i> she growls appreciatively, sitting up and letting you taste fresh air. <i>“Who needs a harem when they can have someone so damn devoted?”</i>");
	output("\n\nYou clean your face - a task very easy thanks to your new organ - and patiently watch her turn around and sit surprisingly daintily on your collarbone. Your kaithrit owner’s face glows a radiant cherry-red as she balances perfectly. This view is the rightful reward for a very good [pc.raceShort]-[pc.boyGirl]. She pets your cheek, <i>“Nice work. Hmhm,”</i> she titters softly, leaning back. <i>“You know better than anyone how good you are at that, but that doesn’t mean I’m going to stop telling you.”</i>");
	output("\n\nHer flattery makes you swoon.");
	output("\n\n<i>“I’m not nearly satisfied, however. I can’t quite contain my excitement. I think tomorrow will be a great time to go and claim those company funds you were promised. What do you think, [pc.name]?”</i>");
	output("\n\nYou swallow, though you’re not sure why. Steele Tech’s like any other corporation: run by greedy assholes having their dance macabre, trying to make off with as much as they can before it goes under. Apparently the brother of the recently deceased CEO has suffered some rather unfortunate losses. His " + rival.mf("son","daughter") + " also got abducted. It’s not going well for them.");
	output("\n\n<i>“Best to put them out of their misery, right? Imagine all we could get with that money. The Black Void will be on the run at last, and once these gangs have smashed them good, I  may just get out of the whole lawless game. I’ve always wanted to go to the planet Bacchus for a vacation. Did you know the sunsets there are violet-red? That the clouds change colors based on the seasons? I could see us there. Could see myself there,”</i> she closes her eyes, showing a smidge of uncharacteristic weakness. <i>“...Could see me and you at the top of our own suite, not a care in the universe, living well forever.”</i> It remains while she gropes you, touching you all over, enjoying your tactility. <i>“Goodness, I sometimes can’t believe how lucky I am to have you around.”</i>");
	output("\n\nYour fingers curl into the plain sheets of her bunk while she scoots backwards, straddling your two legs");
	if(pc.isTaur() || pc.legCount == 1) output(" - she’s well within her right to change you as she sees fit");
	output(". <i>“Now, that was a decent rest. This little extra I’ve gotten... I want to see what it’ll do to your face. I’ve been thinking about this all week.”</i>");
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	output("\n\nShe’s referring, of course, to a new upgrade she’s teased you about. Not the first one she’s gotten - you still have some less-than-stellar things to say about the ‘Dong Drainer’ software that some buffoon peddled to her! Sliding up over ");
	if(pc.hasCock()) 
	{
		if(x >= 0) output("your [pc.cock " + x + "]");
		else if(pc.hasCock()) output("the hardlight strapon she makes you wear alongside your mountainous bitch-breaker");
		else output("your hardlight strapon");
	}
	output(", the kitty-domme slides down your ");
	if(x >= 0) output("veiny");
	else output("luminous");
	output(" pole, smoothly and gently, meowing every inch of the way.");
	output("\n\nYou’ll never get enough of that sound.");
	output("\n\n<i>“If you cum right away, well... I think I’ll have to withhold your reward,”</i> she giggles, cupping a tit.");
	output("\n\nFuck that! You’ll endur-");
	output("\n\nAlthough your " + (x < 0 ? "artificial ":"") + "erection has spread her wonderfully, the most indescribable sensation worms its way through your nervous system at a rate your brain cannot cope with. Such a strange feeling; there’s no throb, no twitch, just some kind of soul-crushing pleasure numbing your pelvis. Some faintly bussing texture rubs across the glans of your warm" + (x < 0 ? ", glowing":"") + " erection, interfacing one-on-one with the nerves there before overloading them with ecstasy. Naturally, your [pc.face] contorts and twists into a photo-worthy expression of maddening excitement, the kind of sensitivity so out of this fucking galaxy it has to be an unsafe VR sequence.");
	output("\n\nGreat, heavy boobs tremble and her whole body vibrates. She is <i>definitely</i> vibrating. <i>“T-T-This mod... f-fuck me... I wasn’t ready for that either!”</i> Your mistress cums straight away. <i>“But let’s make the most of this!”</i>");
	output("\n\nAs it turns out, a pussy equipped with an industrial-grade motor capable of bone-rattling vibration is really hard to ‘make the most out of’ in one session. Half a minute in on most nights and you were both legless. But you’re more than fine with that. It takes at least a week or two to finally adapt, and it quickly becomes the favorite in your brilliant evenings. The irresistible shine of gratification on her face is matched only by the glow of sensual submission on yours.");
	output("\n\nYou can’t remember the last time you ever felt pain, stress, agony, any of those things. You’re so busy keeping up with a modded kaithrit on her life of hedonism and conquest that you don’t have time to be bored enough to entertain such thoughts. Once you helped her nab the Steele Tech inheritance for the Cyber Punks, things changed on Zheng Shi. A fleet of ships outfitted with the kind of hardware capable of bringing down super-stations and capital ships in the U.G.C. quickly became a force to be reckoned with, cutting heavily into the Black Void’s operations before reducing them to a shadow of their former power.");
	output("\n\nZheng Shi and its gangs, to your knowledge, are still a terror among the stars, spoken of in low whispers at the Confederation’s parliament, operating from secrecy. The staff they’ve kidnapped from Core worlds and from the BV were, last you heard, cranking out awesome reserves of firepower to give them the edge on their campaigns.");
	output("\n\nBut none of that really matters to you, or to your mistress. You both took off to the other edge of known space, finding a comfy life in a skyscraping penthouse with a view of amethyst sunrises and ruby-purple sunsets. She even taught you a thing or two about body modification, entrusting you with her bi-monthly maintenance. Claiming you offered her a passport to comfort and wealth, ensuring that neither you nor her will ever want for materials or succor.");
	output("\n\nYou’re never apart. Practically every day is spent tucked away in a safe, secure domicile, much too caught up in fucking the hell out of each other in increasingly depraved ways. While another boilerplate U.G.C bulletin flashes on the massive wall-display, warning about another raid by an army of bunny pirates, your kaithrit’s testing out a multi-clit attachment, flinging the remote control against the wall and into a bunch of sparking pieces while jolts fly from her little head-mounted antenna.");
	output("\n\nWhen you’re both spent, you flop over on the couch in a tangle of overstimulation.");
	output("\n\nIt kinda bites you really have no idea how you ended up here, but here there is only feeling, no more knowing.");
	output("\n\nYou love it, and will never think of giving it up.");
	badEnd();
}

// F. SecOp Nursing Handjob
//FEN NOTE: REQUIRES GENITALS. IF HAS COCK, MUST BE COCK THAT FITS.
// Unique random scene only for PCs classified as a mouse or rodenian of any kind, have encountered Rat’s Raiders (rat thief encounter for now) at least once, have encountered Sec.Ops once, and have genitals.
// It just happens randomly while wandering the Forge Deck, like that Mouse and Slavebreaker scene, and has a cooldown of about 3-5 days.
// F. SecOp will approach and bully the PC, inevitably forcing them into a position where they get nursed on aphro milk while she gives a handy/fingers the puss. PC can either run, fight, or allow it to happen. These are generic girls. Just pretend it’s a new person every time. It’s niche enough as is.
public function mausBullyScene(tEnemy:Creature):void
{
	//force female encounter?
	showPunkSecOp();
	author("William");
	pc.createStatusEffect("MausbullyCD");
	pc.setStatusMinutes("MausbullyCD",60*36);
	IncrementFlag("MET_SECOP_FEMALE");
	output("\n\n<i>“What are you doing skulking around here?”</i>");
	output("\n\nA kaithrit operative encased in an armored suit leaps into view, multi-colored ponytail whipping from inertia. <i>“Hmm... that’s curious...”</i> The projected band of light shielding her eyes dissolves, and yet she doesn’t assume a hostile stance. Instead, she’s content to stand there, gazing at you incredulously. <i>“One of that goofball’s rats, huh?”</i> Her pale eyes wander across your mousey appearance, lingering unusually long on your rodent appendages. <i>“Don’t you all work in groups?");
	if(pc.armor is RattyArmor) output(" Look at you, all dressed up and all alone! Get too distracted trying to find something valuable?");
	else output(" Not even in uniform. Didn’t take them for the hazing types, to be honest.");
	output("”</i>");
	output("\n\nDoes... <i>does she think you’re part of <b>Rat’s Raiders</b>?</i> You don’t offer any response other than a wary look. You’re not sure if this is an elaborate ruse or if she’s genuinely fooled. It doesn’t seem likely, but maybe you can shake this heat safely if she thinks you belong here.");
	output("\n\nThe grinning kaithrit advances a step and you retreat one. <i>“What?”</i> She steps forward, you step back. <i>“Afraid of something?”</i> Another step, this time with a change in posture that presents more of her shielded bosom. Now she leaps forward, closing the gap half-way. <i>“Can’t see why,”</i> she remarks with a fresh injection of sarcasm, circling around and changing your direction. <i>“It’s not like there’s an itinerant mouse lost in unsafe territory...”</i> Her expression turns outright mischievous, a sort of predatory wickedness sustaining it.");
	output("\n\nOne hand goes to cup the underside of her boob, armor folding back in the process to expose the hard tips of her jet-black nipples, moist... and not from sweat. <i>“Lost but found,”</i> she snickers. A glossy purple sheen coats the plump nub, thickening to the wringing twist of a thumb and two fingers. <i>“Good thing, too. Who knows who else might have found you, wanted to hurt that cute face of yours.”</i>");
	output("\n\nYou fail to avert your eyes from the cyber-kitty’s teasing. The careful and easily followed movements of her fingers make for an entrancing show. It’s an obviously arousing show... and one that’s distracted you long enough. The only thing that jolts you out of this game of cat and mouse is the wall impeding your backwards progress. Suddenly you realize just how expertly she’s entrapped you, and how very close she (and her beautiful rack) is.");
	output("\n\nFuck! How could this have happened? Stupid, sexy, busty catgirls! You could stop her right here and blow your cover, or make a break for it! Whatever she has in mind can’t be good!");
	output("\n\nHer demeanor shifts to something victorious. How presumptuous! But... she’s almost got you... and... maybe that wouldn’t be so bad if those tits kept getting closer? Right? They’re really big, and she’s squeezing the supple flesh so passionately. Maybe you’re looking at this all wrong?");
	output("\n\nWhat do you do!?");
	processTime(3);
	pc.lust(5);
	clearMenu();
	addButton(0,"Fight",fightDatMausBullier,tEnemy,"Fight","You can’t cower here! Show her that a mouse is no cat’s prey!");
	addButton(1,"Run",runFromFemSecShop,undefined,"Run","Make a break for it - <b>Hopefully!</b>");
	addButton(2,"Let Her",letHerSecOpBullyYou,undefined,"Let Her","Let her close the distance, see where it goes. Submitting to some sexy and extremely dangerous pirate with huge tits can’t be all bad, right?");
}

//[Fight]
// Tooltip: You can’t cower here! Show her that a mouse is no cat’s prey!
// You just have a totally normal fight, like always.
// Could always come back to add a more PC-dommy variant to this.
public function fightDatMausBullier(tEnemy:Creature):void
{
	clearOutput();
	showPunkSecOp();
	author("William");
	output("It takes a heroic effort to blot out the sizeable image of big milky boob from your mind, but when you do, you raise your [pc.weapon] and tell her to back off.");
	output("\n\n<i>“Huh?”</i> she blinks, immediately suiting up and grabbing her rifle. <i>“Fuck! You’re not part of that gang! Just some wandering asshole with a mouse fetish. Thanks for ruining my mood. I’ll try not to bruise that face of yours too badly.”</i>");
	if(silly) output("\n\nHave at thee, foul knave!");
	clearMenu();
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatASecop);
	CombatManager.lossScene(loseToPunkSecOP);
	CombatManager.displayLocation("PUNK SECOP");
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, tEnemy);
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);

}

//[Run]
// Tooltip: Make a break for it - <b>Hopefully!</b>
// PC has to make a willpower check, and then a reflex check. If either fail, get booli’d.
public function runFromFemSecShop():void
{
	clearOutput();
	showPunkSecOp();
	author("William");
	// pc Willpower Fail, <40%
	//Fen note: converted this to diceroll.
	if(pc.willpower() + rand(20)+1 < 30)
	{
		output("You stumble in one direction only to be held back by the infinite power of " + (silly ? "nano-augmentation":"bombshell boobies") + ". The kaithrit’s sensuously swaying breasts freeze you in place. Any direction you turn she’s there, even in places you can’t see. Every step makes it very clear that your place is backed up on a wall - trapped - and staring at them. Why run? Why make a fuss? Beautiful, supple tits are there- Always. There.");
		output("\n\nAnd now they’re engulfing your [pc.face] into a valley you have no hope (or inclination, really) of fleeing. <i>“That’s better. See? Nothing to worry about,”</i> the operative says in a mocking, tone, stroking your big round ear and weaving her black tails around your waist. <i>“What to do with a lost, little mouse[pc.boyGirl]?”</i>");
		//[Next] \\ Go to [Bullied]
	}
	// pc Willpower Success, <100%
	else
	{
		output("Gulping, you immediately scan for an escape vector lest you be completely ensorceled by the techno-feline’s swaying chest. Before darting off, you perform a feint and sprint in the other direction!");
		// pc Reflex Fail, <75%
		//Fen note: converted this to diceroll.
		if(pc.reflexes() + rand(20)+1 < 40)
		{
			output("\n\nBefore you make it even halfway down the corridor, the lawless kitty-cat leaps ahead by virtue of her superior limbs. The bitch didn’t even bother to cover up her chest! Before you can issue your [pc.legs] a change in direction, you barrel face-first into a pair of pendulous jugs. The impact of [pc.skinFurScales] to aggressively-warm flesh causes them both to flop back on either side and slap together around your head, banded tight by a pair of arms now wrapped around the back of your [pc.hairNoun].");
			output("\n\n<i>“Got ‘ya,”</i> she coos, waltzing you back to the wall like a bully their mark against a locker. Her two black tails have wound around your waist. <i>“Now, what to do with you, my little mouse[pc.boyGirl]...”</i>");
			//[Next] \\ Go to [Bullied]
		}
		// pc Reflex Success, <100%
		else
		{
			output("\n\nNo matter how fast your feet beat against the floor, the kaithrit operative’s always one leap ahead, bounding insane distances by virtue of her augmented limbs. Giggles of delight circulate through your [pc.ears] up until she heads you off in an obvious trap. You saw it coming, and were only barely prepared by great reflex to make the shift in direction necessary to bypass her and her hypnotic, mind-controlling boobs. She grabs nothing but air while you twist around a corner, daring not to look over your shoulder.");
			output("\n\nHeart beating and lungs burning... you’ve shaken her. Whew.");
			output("\n\nDammit. Speaking of shaking, <i>those tits...</i>");
			pc.energy(-10);
			pc.lust(5);
			processTime(8+rand(3));
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
	}
	pc.lust(pc.lustMax());
	// sceneTag: PC lust maximizes
	clearMenu();
	addButton(0,"Next",letHerSecOpBullyYou);
}

//[Let Her...]
// Tooltip: Let her close the distance, see where it goes. Submitting to some sexy and extremely dangerous pirate with huge tits can’t be all bad, right?
public function letHerSecOpBullyYou():void
{
	clearOutput();
	showPunkSecOp();
	author("William");
	output("You inhale, deeply, and take your mind off the potential dangers. If she <i>really thinks</i> you’re a member of the rat pack, then she certainly wouldn’t want to be the one to kick off some gang war on a station this size. Besides, why run? She’s already got you cornered, got you where she wants you. The view isn’t all that bad, and it’s getting better by the second. Her nipples inexorably stiffen into puffy, suckable pebbles. You swallow your worries and remind yourself that what she’s doing is designed to give <i>only you</i> pleasure before letting more of that healing wobble come in.");
	output("\n\nWhen she takes the final step that pins you between her and the wall, you’re wholly engulfed in kaithrit boobflesh. Your [pc.face] is smothered in the fathomless depths of her warm, slightly-sloshing cleavage. Both of her warm, fluid-filled mammaries close around your cheeks, then your head, and you can’t help but feel relaxed, if a little hazy. A gentle sort-of writhing works out all your tension while a steady hand strokes the outer rim of your mousy ear and two tails warp around your waist.");
	output("\n\n<i>“See? No need to be on edge, cutie. I’m not some random merc who’ll fuck anything that moves, and we have to <i>try</i> not to kill each other around here. That said, what should I do with you...”</i>");
	output("\n\nWhatever it is, you honestly can’t wait for it now.");
	processTime(4);
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",getBulliedByFemSecop);
}

public function getBulliedByFemSecop():void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");

	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	// Cock takes priority, but you’ll see.
	output("<i>“Stay still.”</i>");
	output("\n\nNot a second after her whisper enters your mind that she swaps positions and drags you to the ground with her. She sits back against the wall and lays you across her lap in the blink of a cybernetic eye, cradling you under her matron-sized bosom. Purple droplets of her milky juice bubble out of nipples enlarged to the size of battering ram heads, trickling down the flaw-free curves of her mouse-smushing bosom. <i>“There,”</i> she coos" + (pc.tailCount > 0 ? ", her tails restraining your own":"") + ". <i>“I saw you from far away and just <b>had</b> to have you here. I know this is all happening so fast, but something about you just made me want to get comfy. Your group doesn’t spend enough time on relaxation, and since I myself need a little relief... why not help at least one of them with that?”</i>");
	output("\n\nShe leans forward and her rack- no, <b>shelf</b> of titty ‘pools’ across your head and [pc.chestNoun], obscuring you. The pumps of her heart can be felt in your cheeks and behind your eyes. Even though everything is dark, you can still see the shape of her titties inside your ocular lids, and every impressible cardiac beat defines and outlines her chest more clearly. <i>“Feeling better? I guess I should just get to the point: you’re not in danger, but you are gonna be really horny after I’m done. You’ll thank me later, sweetie.”</i>");
	output("\n\nThe kaithrit’s slightly-muffled words have the ring of truth, and you nod, quite unable to speak as is. By now, the power of her tits has gotten so compelling that you graciously accept your role as an uninitiated rat thief if just to indulge more in it. Her plush, expansive boobs, jiggling and rippling all over, have a unique kind of shakiness that could probably brainwash an entire star system.");
	output("\n\n<i>“Touch me,”</i> she breathes, pulling away. <i>“I want you to feel me. Play with them.”</i> It’s hard to pay attention to her voice when you’re so wide-eyed and distracted by the quaking wobble playing out in her sprawling chest. Their warm, milk-taut softness was everywhere. You want to be completely surrounded in that again. <i>“C’mon,”</i> her shoulders gyrate, clapping her dreamy tits together hard enough to spurt, <i>“don’t keep me waiting. They’re yours.”</i>");
	output("\n\nA finger wipes away the drool from your parted lips. When did that happen? How long have you been staring like some teenage virgin? Cupping and hefting the [pc.hand]-overflowing boob, you appreciate its weight. Almost immediately the black-tailed kitty-cat moans, though you can’t tell if she’s that sensitive or loves this as much as you do. Underneath all the machine augmentation, she’s still a woman with very organic needs.");
	output("\n\nShe really won’t stop you, and you eagerly give into your emotions and boob-lust, delighting in her ear scritches and head rubs. Rubs and caresses reward you with an approving, full-body purr that quickly and silently takes you out of Zheng Shi. Gropes and rough squeezes evoke heart-catching meows. The grinning and gratified operative shifts a little, biting her lower lip, face reddening with uncontrolled lust. <i>“Just keep touching,”</i> her aroused voice flutters. <i>“I only want you thinking of how good they feel, how lucky we are to be in this position. I want you to see these boobs in your dreams.”</i>");
	output("\n\nLust-heat blooms in your groin as the imperious pirate-cat returns the favor.");
	// Herm or Cock (append, no new pg)
	if(pc.hasCock())
	{
		output(" " + (!pc.isCrotchExposed() ? "Slender fingers briskly tug your clothes away until your [pc.cocksIsAre] exposed, writhing and throbbing in the air. ":"")  + "Burningly-red dickskin is wrapped up tight between the cat’s digits, her palm sliding up your rigid flesh in ardent see-saws of the wrist. <i>“Dribble some precum for me, cutie. Show me how much you love my tits.”</i> You already were, but her slutty spiel is an invisible coaxing directly to the surface of your prostate. [pc.CumColor] lube <i>squirts</i> at her request, and you can only marvel at how ready to please your [pc.cocksLightIsAre]. <i>“Good [pc.boyGirl], she sighs" + (pc.balls > 0 ? ", fondly kneading your ballsack":"") + ". Don’t you worry about any raiding or training or working, you just think about me.”</i>");
		output("\n\nYou sink further into the commanding kaithrit’s mind-melting presence, secretly ashamed that you ever thought of turning her away. The smooth, wet pressure of her hand finds all the good spots on your juicy dick, matching the strength you apply to her burgeoning, messily-leaking breasts. Modified muscles map your girth until every vein is stroked-to-swelling on rhythmic jackings. <i>“Mmm...  hrrryes...”</i> she groans, half-meowing again, eyes shining while she handles your meat.");
		if(pc.balls > 0) 
		{
			output("\n\nThe feisty feline, in a feat of manual alacrity, thumbs your cumvein while her fingers drop to your [pc.sack]. <i>“");
			if(pc.ballDiameter() < 3) output("Such a lovely size, " + (pc.balls == 1 ? "it fits":"they fit") + " into my hand.");
			else if(pc.ballDiameter() < 6) output("Ahh, what a good size. " + (pc.balls == 1 ? "A b":"B") + "ig, full, ball" + (pc.balls == 1 ? " like this":"s like these") + " must make cumming feel so good.");
			else output("Oh my, what a package you carry around. Why are you rats so opposed to a good time when you get this swollen?");
			output("”</i> Her fingers trace a flowing script into the sperm-stretched exterior of your churning nutsack, writing instructions for it on how to get even bigger. She does a lot with one hand. Although you’re missing the practiced snaps of her wrist around your mast, her thumb keeps your [pc.knotOrSheath " + x + "] company so that she can make you writhe with ecstasy. The ball-slut jostles your breed-stash until thick quantities of goo pour from your peak, staking her claim on your virility by paying thoughtful and meaningful tribute to your tight and unstably-clenching [pc.ballsNoun]. Something tells you your orgasm is going to be all the better for this.");
		}
		if(pc.hasVagina()) output("\n\n<i>“Ooh, you’re the first mouse I’ve seen to have both. Most of you are rather plain, no offense.”</i> Your [pc.cocksLightIsAre] abandoned in a moment of tribulation to your [pc.pussy]. Too late you realize how much your [pc.vaginaColor] cunny needed the attention, and now that it’s gotten a taste it’s pulsing and glowing, letting loose a deluge of [pc.girlCumFlavor] juices for the possessive pussy-cat’s use. Her plunging fingers push you nearer to premature climax, taking you for a spin around that hole by stroking only barely the insides. <i>“That’s right. Moan for me.”</i>");
	}
	// Pussy only (append, no new PG)
	else if(pc.hasVagina())
	{
		output(" " + (!pc.isCrotchExposed() ? "You don’t even feel the kaithrit slip your clothes away to expose your [pc.pussies]. ":"") + "Juice-glazed pussyflesh bursts in pleasure the moment it feels your dom’s fingers exploring the " + (pc.puffiestVaginalPuffiness() > 1 ? "pumped ":"") + "exterior, rubbing up and down your vulva until fresh, syrupy lubricants are smeared on its needy surface. Every fingertip swims through your [pc.vaginaColor] slit, spreading your feminine slopes a little bit wider with each pass. <i>“");
		if(pc.wettestVaginalWetness() < 2) output(" Ah... I was expecting a little more wetness. Don’t worry, we can fix that.");
		else if(pc.wettestVaginalWetness() < 3) output(" Just a little touching and you could maybe fill a bucket. That’s cute. Let’s try for more, shall we?");
		else output(" You’re going to flood the forge deck at this rate... but that’s exactly what I want to see from a good [pc.boyGirl].");
		output("”</i>");
		output("\n\nA whine builds in the back of your throat and you arch into her thighs. All that finger-pumping ecstasy drives you into a miniature orgasm. Your eyes glaze over; you gasp in joy, already dizzy from knuckle-deep abuses. Smooth plunging nails rake against clusters of nerves, dragging you from one visceral internal clenching to the next. A swirling thumb revolves around every circular inch of your [pc.clits]. You’re squeezing so hard that you almost trap her inside, spunking her to the elbow in thick, cummy dribbles, all the while being told <i>what a very good [pc.boyGirl] you are.</i>");
		if(pc.vaginalPuffiness(0) > 0 || pc.vaginas[0].type == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Your pussy is rather obscene, isn’t it? Oh, please don’t take that as a criticism,”</i> she giggles, delicately cupping the huge, swollen lips ringing your womanhood. <i>“There’s so much here you might even be able to handle a leithan. Those Jumpers would crawl out of the metalwork to fuck this.”</i> Sweat and pussy-greased fingers squeeze the chubby folds of your outer cunt together, truly in awe of how much there is to enjoy. She can’t quite settle into one place for long, too enamored with pressing and rubbing as much of it as possible.");
		if(pc.clitLength >= 3) output("\n\n<i>“Getting into the mods, huh?”</i> Before you can wonder what she means, her masterful hand curls around your clitoral anatomy, swollen and grown to sizes never intended by nature. <i>“Look at that, big enough to use like a penis, and far, <b>far more sensitive.</b>”</i> Your love-rod is tweaked and tugged like a lever, and your body reacts in the most blissfully pliant and aggressive manner: by cumming, and it’s an almost painfully extended process. She shows no signs of caring that you’re about to shut down, at least until it’s nearly too late.");
	}
	// merge
	output("\n\n<i>“More,”</i> she practically slurs, <i>“drink from me.”</i> You’re unprepared for the forward shift that slides one pluckable nipple past your [pc.lipsChaste]. On instinct you seal around the tap and suckle from kaithrit bosom, cheeks hollowing to draw out all the yummy treat. A cool, prickly sensation spreads through your membranes when her milk squirts onto your tastebuds and drowns your palate. Rising heat elicits a groan and steady drool as your sensitivity magnifies, elevated to precarious heights.");
	output("\n\n<i>“Keep it up. I want you to cum really hard.”</i> You dial up the pace of your boob-fondling, letting your mind drift after the first gulp. Her creamy treat nourishes you, at once revitalizing and enervating. You’re so pliable that you don’t want to ever get up from this position. Feeling her hand ");
	if(pc.hasCock()) output("around your [pc.cockNoun]");
	else if(pc.hasVagina()) output("inside your [pc.pussyNoun]");
	output(" while you wiggle your tongue around a bursting teat is overwhelmingly erotic.");
	output("\n\nA second effect makes itself known. Something in her milk makes your [pc.lipColor] lips feel swollen and engorged as a heat once ticklish becomes intense and almost suffocating. If you could see your cheeks now, you wouldn’t blame anyone for thinking you fell victim to a Rainbotox prank. There’s numbness, and it disappears every time your lips firm for another suck, and that sensation is now so intense that it’s blindingly pleasurable.");
	output("\n\n<i>“Good [pc.boyGirl], good [pc.boyGirl],”</i> she murmurs, eyes shut while she gives you a handy. The scent of sex fills your nostrils. Rivulets of lactic purple flow from your overstuffed cheeks, your body simply incapable of keeping up with the flow. Forget Steele Tech. Forget the inheritance. You just want to sit here and be nursed all day. Who knew that a pirate could be so tender, so passionate?");
	output("\n\nYou squeeze the buxom boob until bursts of torrid goodness are ignoring your reflexes and flooding your gullet. Once or twice you spare a [pc.hand] to squeeze her other boob, dousing your [pc.skinFurScales] in more drug-enhanced milk. It occurs to you that if she told you to do anything, instructed you carefully, you may end up listening too obediently. Fortunately, training you to do anything isn’t her goal, as evident by her incessant yowlings. The knowledge that she’s some random criminal surfaces only to get dunked like an unwelcome guest.");
	output("\n\nShe’s vibrating inside and out. There’s certainly no way either of you are going to stop, bound together on a journey to orgasm. Your pelvis squirms with the need to vent your raging arousal. All your aphrodisiac-imbued needs compress down into a singular surge too much for you to endure.");
	// Hermgasm or Cockgasm
	if(pc.hasCock())
	{
		output("\n\nHeart thumping, breeding urge rushes through your [pc.cocksLight]. She makes every attempt to maximize it while your mouth goes slack. Waves of juice rush out from top and bottom - milk from your lips, and [pc.cum] from your [pc.cockHeads]. The [pc.cumVisc] fusillade spatters her hand and the floor in [pc.cumColor] jizz, your squeals fading into horizons of soothing kaithrit titty." + (pc.balls > 0 ? " A squeeze to your nutsack expedites the process, launching a rope of steaming-hot cum straight towards the overhead light.":"") + " Your [pc.hips] jerk upwards, gliding through the palm-pussy until your sperm-packed spooge is thoroughly spent so that her wrist wears your seed like a [pc.cumGem] bracelet.");
		if(pc.hasVagina()) output("\n\nIt’s not over yet. She’s seeing to your feminine sex, tweaking and tugging the clit and forcing a hermaphroditic orgasm. Various buttons and switches are thrown, and [pc.girlCum] bathes her in estrus fragrance. " + (pc.isSquirter() ? "Your waist locks up, detaching you from your lower end. Your [pc.pussiesLight] rob everything of muscle control, squirting in tune with fading masculine bliss.":"The gaspless, depthless sensation of girlish ejaculation combined with fading masculine bliss remains a sensation uneroded by repeated experience. Just <b>feeling</b> the syrupy lines leaving your body, trailing down flushed, satisfied skin...."));
	}
	// Pussygasm
	else if(pc.hasVagina())
	{
		output("\n\nYou scream. It’s as necessary an urge as ejaculation. Your [pc.vaginaColor] interior is opened to an obscene degree by the unsympathetic operative’s grip, swirling you in the final prelude to system-crashing bliss. Your tongue goes slack; you arch back and needfully wiggle; you fall from the milky nipple, half-gargling on what’s still in your maw. " + (pc.isSquirter() ? "A squirt of [pc.girlCum] girds her wrist with a fancy bracelet of [pc.girlCumGem]-encrusted girlmusk, and then more. [pc.EachPussy] rob the rest of you for the strength needed to make these hip-straining discharges work, post-eruption always leaving you quivering and anticipating the next.":"Sweat builds on your brow while you’re fingered into incomprehensible ecstasy. She’s so good with it that you feel that sort of gaspless, depthless enjoyment, all the thick beads of venting lady-lust trailing down well-sated pussyflesh. [pc.GirlCumGem] leavings mark the kaithrit’s hand in your fragrant dew."));
	}
	// merge
	output("\n\nSighing contentedly, you relax in her lap, on her thighs, sleeping on a puffy white cloud under a blanket of boob. A stroke to your head keeps you conscious. <i>“Good, good, now...”</i> she huffs, slowly moving. You’re suddenly aware of a new scent in the air. <i>“I hope you don’t think that this was all about you. Oh, spoiling you’s fun, but don’t you think about resting yet, mouse[pc.boyGirl].”</i>");
	output("\n\nShe lays you flat on your back and positions herself between your legs, straddling your waist as if to fuck you missionary. " + (pc.hasCock() ? "Your [pc.cockNoun] slaps into your belly with a wincing clap.":"Your [pc.pussyNoun] winks, secreting a little more juice.") + " Hovering above your genitalia is <i>her</i> pussy, an obvious implant with seams separating it from her body. The synthetic, gushy crease is already swollen, ready to fuck.");
	output("\n\n<i>“Time for you to hold up your end,”</i> she cackles.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mouseBullyFuckyWucky);
}

public function mouseBullyFuckyWucky():void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	
	var x:int = pc.cockThatFits(enemy.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("Right. How could you forget the part where she backed you into the wall and laid claim to your body? She takes her time, too, lifting you up in preparation to enjoy you amazon style.");
	// Herm or Cock (append, no new pg)
	if(pc.hasCock())
	{
		output(" Your tender [pc.dickSkin] is hefted and aligned with her beading passage. She doesn’t delay, ");
		if(pc.cockVolume(x) > enemy.vaginalCapacity(0)) output("sliding you into that silky-wet pocket and stretching her taut channel of artificial muscle around your [pc.cockType] girth");
		else output("planting her silky-wet pocket on your totemic girth and grinding against it");
		output(".");
		if(pc.cockVolume(x) > enemy.vaginalCapacity(0)) output(" <i>“Hah, aren’t you supposed to be a thief? Crawling through tight spaces, keeping a low profile... the only thing you can fit in your pocket is this big dumb dick. Maybe don’t get into the illegal stuff next time, huh?”</i>");
	}
	// Pussy Only (append, no new pg)
	else if(pc.hasVagina()) output(" Her silky-wet cunt plants down on your [pc.pussy], grinding her techno-slit into yours regardless of post-coital tenderness. The sheerest kind of joy prompts you to let out a muffled cry as your vaginal flesh is assaulted by the alien catgirl in such a manner. Vulva slides off vulva, and clit deflects off clit - it’s the most perverse thing.");
	// merge
	output("\n\nThere’s absolutely nothing you can do about the way she takes you right here, right now, riding you into the deck. One gyration she laughs, the other she meows, the next she purrs, and so forth. She drowns your crotch in twat, putting your body through its paces. Now you know why those rats always travel in groups. It’s not because rodenians are vulnerable, it’s because these predatory cats have it out for them. At this point, you believe it, and what actually hurts just a little is knowing that they won’t thank you for taking this heat for them.");
	output("\n\nThe kaithrit’s boobs, bulging downward, maintain their glorious roundness to spite gravity. Aphrodisiac-laced milk spills out in continuous bubbly tides, painting your [pc.skinFurScales] with violet highlights. Not only is your appearance temporarily bathed in lactation, but the chemical inside it responsible for your addled state of mind seeps into your dermis, reigniting the spark in your libido.");
	output("\n\nCreamy amethyst straits pour off your [pc.chestNoun] and abdomen. The rotation of her hips is unnatural, aided by limbs capable of more than their biological counterparts. <i>“Make that face again!”</i> she cries, fire in her leonine eyes. Her hips rise up and smack down, thwapping against your [pc.thighs], and you make that face again. The next time is better than the last. Pleasure-saliva flings off in arcs with every pelvis-chipping plow. <i>“Finding you was the best luck I’ve had lately. I’ve gotta go out soon, and I didn’t want to be so distracted. Maybe you’ll share this with your friends when you get back? When I’m done? Wouldn’t mind having a few more of you in my lap if you’re this much fun!”</i>");
	output("\n\nThe operative lays into you proudly and ferociously, driving you to cum. You’ve already cum three times, but here’s the fourth laying into you and driving into her. She always cums at the same time, saturating you in sizzling-hot relief. You don’t think you have anymore in you; you beg for a little mercy, hoping she might want to take it a little bit slower.");
	output("\n\nOf course, she doesn’t. In fact, your disjointed comments only intensify her want to <b>use you.</b>");
	// Herm or Cock
	if(pc.hasCock())
	{
		output("\n\nSoaking-wet kaithrit muff, a machine in its own right, practically vacuums another orgasm out of your innards. You can’t do anything but wear gradual expressions of excitement and ahegao that she’s no doubt snapping photos of with some hidden augment to jill herself off with later. Her grip strengthens on your limbs as she comes down again, engaging every possible function of her cock-milking quim. It controls your orgasm, denies it for effect, produces it when desired. The realization that her pussy is such a technological marvel that it can do this to you doesn’t give you the means to resist its extremely acute efficacy.");
	}
	// Pussy Only
	else if(pc.hasVagina())
	{
		output("\n\nBeautifully sopping-wet, the kaithrit’s twitching quim slips into yours. One hill of vaginal flesh rakes against your own and against the inside, desperately seeking pleasure best found from a male. All you can do is sit there and wear expressions of ecstasy and ahegao like you’re trying on new clothes at the boutique - something tells you she’s snapping plenty of pics. Her pussy is meant to take cocks and handle them with thought-obliterating precision, but against another pussy its arsenal is simply unnecessary or superfluous. One part isn’t, however, and that’s her rapidly extending clit, growing well into footlong territory, exposing vast amounts of overly sensitive flesh, the stimulation of it taking her nearer to desired release.");
	}
	// merge
	output("\n\nYou cum again, hoping the sixth... eighth...?");
	
	/*OLD
	output("\n\nNo, it’s not over yet. She wants at least one more. Your sore crotch is already telling you how much it’s going to hate you for this, that you didn’t do a good enough job of getting away or asserting to avoid the aches and pains that will come.");
	output("\n\nAt least all the milk you’re catching is reducing it, somewhat...");*/

	//New
	output("\n\nNo, it’s not over yet. She wants at least one more. Your sore crotch is already telling you how much it’s going to hate you for this, that you didn’t do a good enough job of getting away or asserting to avoid the aches and pains that will come.");
	if(pc.cockVolume(x) < enemy.vaginalCapacity(0)) output(" Your [pc.face] is a mess of your own seed, pumping lamely out of a bulky dick slapping lewdly into your own body." + (pc.isBimbo() ? " Sucking it happens naturally, you can’t let any more cum be wasted!":""));
    
	output("\n\nAt least all the milk you’re catching is reducing the stress, somewhat...");



	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",theEndOfMausBullyReal);
}

public function theEndOfMausBullyReal():void
{
	clearOutput();
	output("nGroaning woozily awake, you sit up with a shock and rush of air, frantically checking your vicinity for the catgirl... or any other pirate. Wait, this isn’t where you were...");
	output("\n\nOh wait, it is. You, and your belongings, were moved out of sight. Yeah. Still the same area, because the stink of your tryst is still in the air. It’s a thoughtful gesture, but not one you’re entirely happy about. Alas, that kaithrit was little more than a love ‘em and leave ‘em Sagittarius...");
	output("\n\nWhen you take stock of yourself for a change, you’re absolutely drenched in milk... and still rather horny. Your [pc.legsNoun] go bowlegged the moment you stand, the after-effects of your sex still lingering. Inside, too, there’s also a higher temperature. That milk no doubt had a rather strong effect on your libido...");
	processTime(25);
	pc.libido(2);
	pc.applyMilkBathed();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Victory
public function defeatASecop():void
{
	var enemies:Array = CombatManager.getHostileActors();
	for(var i:int = 0; i < enemies.length; i++)
	{
		if(enemies[i] is SlamwulfeDrone) CombatManager.removeHostileActor(enemies[i]);
	}
	if(enemy.mf("m","f") == "m") secOpMaleSubmission(-1);
	else secOpFemaleSubmission(-1);
	//HP
	if(enemy.HP() <= 1) output("Falling to the ground with a whine and a burst of sparks, the kaithrit security operative barely catches [enemy.himHer]self on [enemy.hisHer] hands and knees. [enemy.HisHer] arms wobble for a second before [enemy.heShe] pivots to fall heavily on [enemy.hisHer] [enemy.butt]. <i>“Fine, fine. I guess you </i>do<i> belong up here. Just... don’t fuck me up too bad, alright? If you try and off me, every other Cyber Punk on station’ll be swarming over you worse than Rat’s Raiders on a corporate freighter.”</i> [enemy.HeShe] jabs sharply at the antenna above [enemy.hisHer] ear, panting heavily but otherwise lacking any life threatening injuries. <i>“If the apology isn’t good enough for you, there’s other ways I can make this up to you with my tongue. Just... no more weapons, okay?”</i>");
	//Lust
	else output("With a cry of all-consuming lust, the kaithrit security operative falls heavily on [enemy.hisHer] knees. The metal coils of [enemy.hisHer] suit part as if by magic to reveal the fullness of [enemy.hisHer] " + (enemy.hasCock() ? "gleaming, 13-inch robotic cock":"absolutely drenched alien cunt and needy little clit") + ". <i>“Ffffffffuck! You’re so hot!”</i> [enemy.HeShe] " + (enemy.hasCock() ? "wraps both hands around the metallic behemoth and pumps hard.":"thrusts three fingers deeply into her hungry passage, the other palm grinding hard just above.") + " <i>“I don’t even care if you belong up here! You belong fucking me!”</i> The mewling feline’s ears fold back as [enemy.heShe] looks up at you. <i>“Please! I need you!”</i>");
	output("\n\n");
	clearMenu();
	//Get Licked - Either
	if(pc.hasVagina()) addButton(0,"Get Licked",vaginaRouter,[getLickedBySecop,0,0,0,false],"Get Licked","Force the kitty-[enemy.boyGirl] to apologize with [enemy.hisHer] tongue.");
	else addDisabledButton(0,"Get Licked","Get Licked","You need a vagina for this.");
	//Facefuck - Either
	if(pc.hasCock()) addButton(1,"Facefuck",penisRouter,[faceFuckDatPussy,9998,false,0],"Facefuck","Put this mouthy Cyber Punk kaithrit to work on your dick.");
	else addDisabledButton(1,"Facefuck","Facefuck","You need a penis for this.");

	//Girl SecOp
	if(enemy.hasVagina())
	{
		if(pc.isTaur()) addDisabledButton(2,"Fuck Her","Fuck Her","Your ‘taur frame prevents this.");
		else if(pc.hasCock())
		{
			if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(2,"Fuck Her",penisRouter,[fuckTheSecopGirl,enemy.vaginalCapacity(0),false,0],"Fuck Her","The big-titty cyber-kitty has plenty of augments. You could take her for a spin, really test drive her sensitive bits.");
			else addDisabledButton(2,"Fuck Her","Fuck Her","This cat may have a special kind of pussy, but even it can’t handle your girth. You’d slag her system!");
		}
		else addDisabledButton(2,"Fuck Her","Fuck Her","You’ll need a penis to fuck that robo-pussy. You doubt she has the means or the inclination to surgically attach one to you.");
		if(pc.hasCock() && pc.biggestCockVolume() > enemy.vaginalCapacity(0)) addButton(3,"Hyper Titfuck",penisRouter,[hyperDickThatKittysTits,100000,false,enemy.vaginalCapacity(0)],"Hyper Titfuck","You’ve got a dick so big she could never hope to take it in her pussy... so put her tits to work.");
		else addDisabledButton(3,"Hyper Titfuck","Hyper Titfuck","You need a battleship class dick for this - one too big to possibly stuff into her pussy.");
	}
	//Male SecOp
	else
	{
		if(pc.hasVagina()) addButton(2,"Fuck Him",vaginaRouter,[fuckHimSecOp,enemy.cockVolume(0),0,0],"Fuck Him","You won’t be satisfied with taking anything less than his dick.");
		else addDisabledButton(2,"Fuck Him","Fuck Him","You need a vagina to do this.");
		if(pc.hasTailCunt() && pc.hasParasiteTail()) addButton(3,"Tailmilk",tailMilkTheMaleSecOp,undefined,"Tailmilk","Milk him with your parasitic tail.");
		else addDisabledButton(3,"Tailmilk","Tailmilk","You need a parasitic cunt-tail for this.");
		if(!pc.isTaur() && !pc.isNaga()) addButton(4,"Catch Anal",secOpMaleAnal,undefined,"Catch Anal","A little bit of foreplay before intense anal sex.");
		else addDisabledButton(4,"Catch Anal","Catch Anal","You can’t be a taur or a naga for this.");
		if(pc.biggestTitSize() >= 3) addButton(5,"Titfuck",secOpMaleTitfuck,undefined,"Titfuck","Let his kitty dick fuck your titty pit.");
		else addDisabledButton(5,"Titfuck","Titfuck","You need to have breasts at C-cup or larger to try this!");
	}
	addButton(14,"Leave",CombatManager.genericVictory);
}

//Fuck Him
//By Fenzo
//You won't be satisfied with taking anything less than his dick.
//You need a vagina for this.
public function fuckHimSecOp(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	
	var cumQ:Number = 0;
	
	output("You prowl forward and push the security operative onto his back" + (pc.legCount > 1 ? ", straddling his supine form":", perching above his supine form") + ". <i>“Just because you lost doesn’t mean that you can’t have fun making it up to me, kitty-cat.”</i> You run your hands down the tightly coiled metal of his armor, admiring how it clings to the pert mounds of his A-cups. Circling lower, you caress his upper thighs, making slow laps around the " + (enemy.lust() < enemy.lustMax() ? "prominent bulge":"blatantly exposed length") + " of his maleness. <i>“How’s that sound?”</i>");
	//Lust Win
	if(enemy.lust() >= enemy.lustMax()) output("\n\nA whorish moan and staccato pumps of the kaithrit’s hips serve as all the answer you need. <i>“Please! Let me fuck you!”</i> His gleaming cyber-rod slaps against his belly, bouncing and dripping, slowly building a web of dribbling pre.");
	//HP Win
	else output("\n\nA pleased groan provides all the answer you need, but he deigns to speak regardless. <i>“Th-that’s... okay.”</i> His metal suit parts at the loins to reveal the bare, 13-inch length of his cybernetic chrome-bone, hard and beginning to twitch. When your fingers drift close, it strains and rises, almost creaking with mechanical engorgement. A single bead of pre wells up at the tip as he admits, <i>“I want to fuck you.”</i>");
	//merge
	output("\n\nYou" + (!pc.isCrotchExposed() ? " pull your [pc.crotchCovers] out of the way and":"") + " barely suppress a giggle. <i>“You’ve got it all wrong. I’m going to fuck </i>you<i>.”</i>");
	output("\n\nSeizing his prick in one hand, you barely have time to admire its heft and girth before your [pc.hips] slide downward, kissing the chromed crown with your netherlips before plunging it inside, gratefully accepting inch after inch of sublimely hard cock. It’s <i>hot</i> - not just passionate and enticing in the way that a footlong dick can be but in its raw warmth. Just taking it in makes you sweat and drip, your [pc.vaginaNoun " + x + "] creaming itself in delight. You moan from the feeling of splitting yourself on such a magnificent dick.");
	output("\n\nNo wonder this cute little kaithrit got himself augmented. This is a god-tier cock!");
	
	//Cuntchange
	pc.cuntChange(x,enemy.cockVolume(0));
	
	output("\n\nThe mewling feline’s eyes roll back from your [pc.vaginaNoun " + x + "]’s clutching embrace, and he makes a vain attempt to fuck you back. His hips surge upward, burying his cock in to the hilt, but he doesn’t have any leverage from this angle. Your bodyweight bears him right back down to the ground with a lurid squelch.");
	if(pc.vaginas[x].wetness() < 3) {}
	else if(pc.vaginas[x].wetness() < 5) output(" Dribbling pussy-juice trickles over his loins.");
	else output(" Streamers of pussy-juice soak his loins.");
	output(" Groaning in delight, the pirate grabs your [pc.thighs] and squeezes, too enamored by what you’re doing to him to speak, let alone think.");
	
	//Have cock
	if(pc.hasCock()) 
	{
		output("\n\nYou grab him by the wrists and put his hands to work somewhere better: on your [pc.cocks]. Just like with your thighs, he sets to squeezing and stroking immediately, uncaring that it’s your phall" + (pc.cockTotal() == 1 ? "us":"i") + " that he’s tugging. His thumbs explore with slow strokes while his palms tighten up, hugging your veined length" + (pc.cockTotal() > 1 ? "s":"") + " firmly. You identify the exact moment he realizes what he’s doing by the sudden change in his strokes. A lifetime of jacking off his own dick has prepared him for this exact scenario, and rather than stopping, he shifts his grip and begins moving with purpose, wringing out a ");
		cumQ = pc.cumQ();
		if(cumQ < 20) output("bit");
		else if(cumQ < 200) output("string");
		else if(cumQ < 2000) output("stream");
		else if(cumQ < 10000) output("spurt");
		else output("waterfall");
		output(" of pre-cum with apparent glee.");
	}
	//Merge
	output("\n\nSimply enjoying being prick-deep isn’t going to be enough for you. You lift your [pc.hips] slowly");
	if(pc.hasCock()) output(", happy his hands continue to service your boner" + (pc.cockTotal() > 1 ? "s":"") + ",");
	output(" and shiver at the erotic thrill of taking this fearsome space-pirate and turning him into your personal chrome-cocked dildo. Then you drop yourself down, savoring the erotic rush of fucking such a studly cock. On impact, you ignore the squelching sloppiness of your lusty cunt and spring back up, looking down to see your juices staining the cat-boy’s silvered shaft and balls, clearly marking them as <i>yours</i>. You flash a smile and increase the tempo, moaning out loud as you avail yourself of your pointy-eared prize.");
	output("\n\nWhen the kaithrit stops matching you moan for moan and looks up with surprisingly alert eyes, you’re too horny to care. When his smile transforms from one of sensuous adulation into one of predatory delight, you’re too focused on the feeling of his cock’s seams tickling your flashing-red nerves to notice. When his cock lurches inside you and begins to buzz with powerful vibrations - that, you notice. You notice in the only way such a powerfully turned on person can - by cumming.");
	output("\n\nYou cum all over the kaithrit’s vibrating mecha-cock, [pc.thighs] quivering and clenching" + (pc.isSquirter() ? ", squirting girlish delight over the entirety of his lower body":"") + ".");
	if(pc.hasCock())
	{
		output(" Ribbons of [pc.cumNoun] fly from your [pc.cocks] while he strokes.");
		if(cumQ < 50) output(" They fall in sticky webs on his chest.");
		else if(cumQ < 250) output(" They plaster his chest in a thick, dripping coat of masculine release.");
		else if(cumQ < 1000) output("They splatter his face and cascade over his chest in a thick, dripping coat of masculine release.");
		else if(cumQ < 5000) output("They drench him from head to belly in a puddling coat of exquisite, masculine release.");
		else output("They absolutely bury him in a wave of exquisite masculine release. Every inch of his body is covered in your cascading goo, anointing him in your pleasure.");
	}
	output(" You feel like a guitar’s string, like that magical cock is playing you, pulling you tight and twanging climax after shuddering climax from your taut form. Back arching, your [pc.chest] heaves as you try not to hyperventilate.");
	output("\n\n<i>“N-n-nice,”</i> the security operative growls, trying to hold back himself. Your scissoring [pc.vaginaNoun " + x + "] doesn’t make it easy for him. It ripples and squeezes in orgasmic delight, tugging and flexing demandingly. Mid-orgasm, you can think of little more than wanting him to cum - of wanting him to paint your walls white with his kittenish seed, and he’s so close to giving it to you. He bites his lips as he watches your climax reduce you to a dribbling, moaning mess.");
	output("\n\nIf you kissed him right now, he’d definitely cum. He’d cum so fucking hard. Or you could keep riding him, and see how long this little stud-cat can last.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Kiss Him",kissDatKittyWithCock,x,"Kiss Him","Make him cum! You want it!");
	addButton(1,"Ride Him",rideDatKittyWithCock,x,"Ride Him","Ride the vibrations! Of course, it’ll be hard to stay on top this way...");
}

//Ride Him
public function rideDatKittyWithCock(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	output("You lean back, bracing your hands on the floor as you scream your way through the end of your orgasm. The kaithrit is below is still grinning, his dick buzzing with a military-grade motor, assaulting you with shockwaves of pleasure that make it difficult to do anything but sit there and <i>get fucked</i>. Maybe you should’ve kissed him while you had the chance - while your muscles still worked right.");
	output("\n\nSimply staying atop this lawless kitty-punk is hard enough. The way his cock makes your cunt clench is debilitatingly arousing. Every second you spend reveling in his machine-augmented ecstasy makes it harder to think about anything but the clenching in your tender quim. Each throb robs you of control of a new muscle in exchange for a tighter grip on his rod. Your mouth falls open, and you drool a little bit, suddenly cumming again.");
	//Cocks
	if(pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		output("\n\nYour [pc.cocks] blast" + (pc.cockTotal() == 1 ? "s":"") + " out every drop of remaining [pc.cum] in your body.");
		if(cumQ >= 20000) output(" It’s a titanic deluge of room-flooding sperminess that catches you both completely by surprise. The kaithrit can do little but throw his arm up in front of his face as you hose him down and slowly bury his body in an ever deepening pool of [pc.cumVisc] spunk.");
		else if(cumQ >= 2000) output(" It’s a wonderfully thick wave of sperminess that takes you both by surprise. The kaithrit throws his arm up in front of his face, but it doesn’t stop you from painting him in a fresh layer of sloppy spunk, or producing a nice, thick pool of excess semen for him to bathe in.");
		else if(cumQ >= 100) output(" Splattering gouts of sperminess batter his face like erotic missiles, bursting into explosions of erotic relief.");
		else output(" It isn’t all that much. Enough to paint a few lines of erotic relief on the cat-boy’s tummy.");
	}
	//merge
	output("\n\nYour vision goes white, your eyes rolled back into unseeing ecstasy. A sense of spinning, of slipping in sexjuice and sliding onto your back squeaks in beneath the red-hot currents of overclocked bliss. You flop and flail, but you’re nothing but a passenger in your body. The cock pistoning into your [pc.vagina " + x + "] has you by the [pc.clit], forcing you to experience nothing but pleasure and texture and warmth and the unsubtle, automatic clenching of your depravity-encouraging musculature.");
	output("\n\nYou start to ask him to stop, but the thought <i>vibrates</i> apart.");
	output("\n\nYou cum.");
	output("\n\nYou try to look at what’s happening, but your eyes cross. Your mouth falls open and you drool " + (pc.biggestTitSize() < 4 ? "all over yourself":"on your own [pc.chest]") + ". Your pussy pulses happily and squirts." + (!pc.isSquirter() ? " You didn’t know you could squirt. Didn’t know you could get this wet without some kind of body-mod.":"") + " It’s the only part of you that works anymore. The pleasure is slowly breaking you down, abrading the thinking parts of you with orgasm after orgasm until your flesh is so tender and prone to pleasure that your brain can’t catch a single second to recover in between climaxes.");
	output("\n\nIf you could stop cumming long enough to think, you’d realize that you’re basically the kaithrit’s fuck-toy at this point. But then, you don’t need to think while he’s buzzing in your slit. You can just cum - and cum and cum...");
	processTime(20);
	for(var i:int = 0; i < 7; i++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",getFuckedStupidByKitties,x);
}
public function getFuckedStupidByKitties(x:int):void
{
	clearOutput();
	showName("\nALONE...");
	author("Fenoxo");
	output("You awaken drenched in your own sweat. The ache " + (pc.legCount > 1 ? "between your [pc.legs]":"from below") + " is significant and yet somehow still sort of pleasant. Cum dribbles out of you from where the kaithrit was fucking you.");
	if(pc.totalVaginas() > 1) output(" And from your other puss" + (pc.totalVaginas() > 2 ? "ies":"y") + " too.");
	output(" He’s long gone at least, and it seems he didn’t bother to steal from you either.");
	output("\n\nYour Codex is beeping. You unlock it to discover a few dozen pictures of you cumming yourself senseless, covered in drool and sex-juice like some kind of drugged-out porno-skank. A note is appended at the bottom, promising that the next time he sees you, he’s going to be the one coming out on top.");
	output("\n\nSure thing.");
	pc.libido(1);
	processTime(10);
	for(var i:int = 0; i < pc.totalVaginas(); i++) { pc.loadInCunt(enemy,i); }
	output("\n\n");
	CombatManager.genericVictory();
}

//Kiss Him
public function kissDatKittyWithCock(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	output("You tumble forward, your arms sliding behind the kaithrit’s back in a surprise hug as you plant your [pc.lipsChaste] on his in an impassioned kiss. There’s no real technique to your lip-lock, just the frenzied smashing of your face against his and the desire to taste and experience every part of his body. He responds in kind, tongue thrusting deep, curling and twining around your own. Mid-orgasm, his spit may as well be ambrosial to you.");
	output("\n\nThrumming in ecstasy, your whole body spasms along with the waves of pleasure. You feel it nowhere more keenly than you cunt, which even now continues to display its adulation for your feline foe’s tremendously girthy member with loving squeezes and steady flows of [pc.girlCum].");
	output("\n\nA spike of warmth in the very deepest parts of your passage lets you know the exact moment your partner caves in and cums. You can feel his studly semen splattering against your " + (pc.isPregnant(x) ? "sealed ":"") + "cervix, pulse after pulse of kaithrit cream erupting in torrents of volcanic release. Of course his tongue goes limp in the moment, but that just lets you kiss him that much harder, sucking and slurping while you milk every drop of seed from steadily draining balls.");
	output("\n\nHe’s cumming for <i>you</i>. It’s <i>your</i> pussy that won out, that conquered his steadily vibing dick. You can feel it in the way his body rhythmically tenses and relaxes, the way his pussy-drenched balls flex again and again. Creamy white drools out of you as his whole body locks in one last, violent ejaculation, and the cat goes limp.");
	output("\n\nHe lays on the ground panting, eyes closed" + (pc.hasCock() ? " and covered in your cum":"") + ", halfway toward drifting in dreamland.");
	output("\n\nYou break the kiss and rise, slowly extracting your new favorite dildo. A little cum dribbles down your [pc.thigh] while you gather your gear and make to leave. That little cat was a pretty good fuck.");
	processTime(10);
	pc.loadInCunt(enemy,x);
	output("\n\n");
	CombatManager.genericVictory();
}

// Fuck Her
// Scene idea overall: PC will go down on the kaithrit, and can choose to drink her milk or not, but they’ll still get squirted. She’s outputting aphrodisiac vanae milk. If the player drinks, she’ll try to domme the PC cowgirl style, but the PC will win back and fuck her into the ground. If the player gets squirted, they’ll pound her doggy style. Vanae milk makes the imbiber horny as hell and can induce psychoactive effects. Either way, you’re both walking away happy. Well, she’s not walking away for a while after this.
public function fuckTheSecopGirl(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	// ‘Punk HP Loss
	if(enemy.HP() <= 1)
	{
		// PC bimbo
		if(pc.isBimbo()) output("<i>“A tongue’s, like, nowhere near good enough for me right now,”</i> you shake your head imperiously" + (!pc.isCrotchExposedByArmor() ? ", throwing your [pc.armor] to the side":"") + ". <i>“I wanna see what else you’ve got in your toybox, kitten!”</i>");
		// PC bro
		else if(pc.isBro()) output("You chuckle good-naturedly, and a little airheadedly" + (!pc.isCrotchExposedByArmor() ? " as you get yourself free of your [pc.armor]":"") + ". <i>“No, a tongue’s not in the cards. What say you and I put those metal bits to use?”</i>");
		// PC kind
		else if(pc.isNice()) output("<i>“I’m willing to bet you owe a lot of people more than a little tongue action.”</i> You fold your arms and smirk. <i>“Myself included,”</i> you point to her crotch" + (!pc.isCrotchExposedByArmor() ? " just before shucking your [pc.armor]":"") + ".");
		// PC misch
		else if(pc.isMischievous()) output("<i>“A thinly veiled threat is a shitty apology, kitten. That aside, your mouth’s just a bonus,”</i> you kneel next to her, running a hand gently across her sugary chest and down to her warm crotch" + (!pc.isCrotchExposedByArmor() ? " before slipping out of your [pc.armor]":"") + ". <i>“I think I’ve earned something a little more fun than that...”</i>");
		// PC hard
		else output("<i>“I agree. No more of <i>your</i> weapons,”</i> you huff, sinking down near the bosomy techno-feline, grasping for her crotch" + (!pc.isCrotchExposedByArmor() ? " after nonchalantly removing your [pc.armor]":"") + ". <i>“But mine’s going to need a lot more than a tongue.”</i>");
		// Merge
		output("\n\n<i>“Uh, alright,”</i> she calmly acquiesces. Her fancy suit practically disassembles just a moment later. The kaithrit pirate’s massive tits, enormous G-cups, spill out, much more exaggerated than her womanly curves. A purplish, semi-transparent liquid oozes from her budding teats. With a comfortable sigh, she spreads her thunderously thick legs, making sure you get an eyeful of her canvas; her most obvious features are the seams where organic meets synthetic.");
		output("\n\nShe’s strangely happy to expose her modified body to your analytical eyes... maybe she likes showing off the work she’s had done?");
		output("\n\nBefore you can be impressed by her obvious genital augmentation, and entranced by the tell-tale scent of ripe catgirl in the air, you find yourself gazing longingly at her matronly chest; your eyes half-close and you bite your lower lip. You’re wholly captivated by the traces of feline sweat trailing along her sugar-pillows and the marble-violet beads of gooey goodness leaking from her puffy cyber-nips.");
		output("\n\n<i>“Those modded, too?”</i> you blurt out, a shameless and silly grin etched on your reddened face. Your [pc.cocks] " + (!pc.isCrotchExposedByLowerUndergarment() ? "press against your [pc.lowerUndergarment], soiling your undergarments with every hypnotizing jiggle of titflesh":"jump to full mast, pulsing with every hypnotizing jiggle of titflesh") + ".");
		output("\n\nBlinking in mite surprise, the punky cat smirks as the light of her hi-tech visor evaporates. She wraps her arms under her luxurious, lactating chest, rocking her shoulders with a sexy bounce. <i>“Oh... A little. Do you like them? It’s doubtful you’ve encountered quality like this...”</i> she purrs, rolling her milk-bubbling teats between her fingers, sprinkling the ground with criminally wasted cream." + (pc.cocks[x].cLength() >= 18 ? " <i>“It seems they’re to your liking,”</i> she winks, her slit-pupils widening in admiration of <i>your</i> strongly throbbing equipment.":""));
		output("\n\nYour cortex is overwhelmed by the tranquilizing wobble of bombshell tits, and you soon dive mouth-first into those soft, irresistible mounds of ambrosial goodness. You drag your [pc.tongue] over one nipple and then the other, handling these heavenly boobs with the utmost care - this comely bust deserves nothing less. A strange, inflaming buzz in the back of your mind makes your [pc.eyes] cross with every smearing droplet you hungrily lap up, and a rush of warmth blossoms throughout your body. Bubbling, almost boiling pre-seed floods from your [pc.cocksLight]" + (pc.hasVagina() ? ", and you feel a distinctly stronger heat emanating from your [pc.pussies]":"") + ". The orderly feline coos quietly, content to hold her arms together, to thrust her divine chest out into increasingly greedy palms.");
		// PC breasts small (A-cup > C-cup / rating: 1 to 3 )
		if(pc.biggestTitSize() < 4) output("\n\nYou can’t ignore the wincing pangs of envy burning through your cheeks: this kitty-pirate’s size makes your own [pc.breasts] look bland and pathetic in comparison." + (pc.isBimbo() ? " Really, there’s no reason <i>you</i> should have these kinds of blasé tits! In this galaxy of all places!":"") + " One firm hand " + (!pc.isChestExposedByUpperUndergarment() ? "slips your [pc.upperUndergarment] aside, giving":"gives") + "your [pc.nipples] a little appreciation in return, though! <i>“Good size for a wanderer like yourself, and pleasantly soft. Oh, your nipples are just right! So hard they could cut rock, in fact!" + (!pc.canLactate() ? " If only you had milk to share...":" And your taste is simply sweet...") + "”</i>");
		// PC breasts big (D-cup to big FF-cup / rating: 4 to 14)
		else if(pc.biggestTitSize() < 15) 
		{
			output("\n\n<i>“You like mine? I like yours, too. You’ve got an ideal size, even if they’re not quite a match to mine,”</i> the pirate smiles, gingerly " + (!pc.isChestExposedByUpperUndergarment() ? "slipping your [pc.upperUndergarment] aside and ":"") + "cupping one of your jugs and rubbing towards your own [pc.nipple]" + (pc.canLactate() ? ", squeezing a little [pc.milk] from your tank before inquisitively tasting it. <i>“Oh, that’s lovely. A little bigger and we could make a dairy cow out of you...”</i>":"") + ". You press your [pc.breasts] into her own, rubbing your docked bodies together");
			if(pc.mf("","f") == "f")
			{
				if(pc.cowScore() > 1) output(", mooing like a wanton slut");
				else output("utterly blissed out by this girl-on-girl sluttery");
			}
			output(".");
		}
		// PC breasts bigger (GG-cup or more / rating: >=16)
		else
		{
			output("\n\n<i>“I can see why you love mine, you’ve got... quite a pair yourself, cutie...”</i> The bosomy SecOp seems a little envious of your [pc.breasts]! She moves a hand ");
			if(!pc.isChestExposedByUpperUndergarment())
			{
				output("past your [pc.upperUndergarment] ");
			}
			output("to your [pc.breasts], her fingers tracing lovingly along your ");
			if(pc.canMilkSquirt()) output("[pc.milkType] leaking ");
			if(pc.biggestTitSize() >= 50) output("giant ");
			output("tits, the pliant [pc.skinFurScalesNoun] of your marshmallows fill the space between her fingers." + (pc.canMilkSquirt() ? " <i>“You’d make a good dairy cow with udders like these. Are you Treated?”</i>":" <i>“A shame you have no milk. You’d look good as a dairy-slave, if not a perfect cock-sleeve.”</i>") + " You " + (pc.cowScore() > 1 ? "moo":"moan") + " with every crest of mutual pleasure, bubbly feelings flaring across your brain.");
		}
		// Merge
		output("\n\nYour ecstasy-filled caresses go from gentle to eager, and you’re absolutely certain this fluffy-eared goddess appreciates the tremendous respect you demonstrate to her life-giving chest. You kiss her lightly on the lips, licking slowly across her chest, back down to where the milk drizzles in growing quantities, spilling out like a stream the more aroused the shapely milky-cat becomes. You fondle those snug jugs lovingly in a trance of mammarian design, rolling her yielding breasts in circles" + (pc.balls > 0 ? ", receiving an equally worshipful finger-show on your [pc.sack]":"") + ". You press your body closer, panting and gasping quietly, breathing in the potent, balmy scent of horny kaithrit until you feel a hand on the back of your head. <i>“I think I have an idea of what you <i>reeaalllyyy</i> want...”</i> she hums hotly in your [pc.ear]. <i>“Go ahead, drink to your heart’s content...”</i>");
		if(pc.WQ() < 40) output("\n\nStars, that sounds absolutely fucking wonderful right now! Does she have any augment that can show her how rock hard you are right now? But then... Gosh, you won’t get to enjoy these tits the way you want...");
		else output("\n\n\n\nWhilst that sounds amazing, there’s something about her milk that’s clearly affecting your libido. It’s probably nothing serious! Getting a bellyful of kitty cream is as good a reward as any, regardless of how horny it’ll get you!");
	}
	// ‘Punk Lust Loss
	else
	{
		// PC bimbo
		if(pc.isBimbo()) output("<i>“Fuck yeah, babe! See? It’s totally great when we can just skip the rough housing and get right to what matters most!”</i> you sing, dropping down to the cyber-slut’s level, already moving in for a wet, needful, rewarding kiss." + (!pc.isCrotchExposedByArmor() ? " You break it momentarily just to get your [pc.armor] out of the way. Pesky clothes!":""));
		// PC bro
		else if(pc.isBro()) output("<i>“That’s what I’m talking about!”</i> You fall to your knees and promptly kiss her in barely contained lust." + (!pc.isCrotchExposedByArmor() ? " You break it for a second, receiving a little help in getting your [pc.armor] off.":""));
		// PC kind
		else if(pc.isNice()) output("<i>“I’m glad we could come to terms,”</i> you muse, sinking to the over-aroused pirate’s level, beckoning her with a come-hither pawing. <i>“Come on, let’s take a break together.”</i>" + (!pc.isCrotchExposedByArmor() ? " Just before she gets to you, you shuck your [pc.armor].":""));
		// PC misch
		else if(pc.isMischievous()) output("<i>“First I don’t belong, and now I belong with you?”</i> You chuckle softly, grinning toothily at the whimpering kitten as you kneel down" + (!pc.isCrotchExposedByArmor() ? ", divesting yourself of your [pc.armor]":"") + ". <i>“Looks to me like it’s the other way around!”</i>");
		// PC hard
		else output("\n\n<i>“You’re lucky I think you’re worth my time.”</i> You fall to your own knees, grinning needily at the wide-eyed and hungry cat. <i>“I’ve been looking for a treat myself.”</i>" + (!pc.isCrotchExposedByArmor() ? " You nonchalantly throw your [pc.armor] aside.":""));
		// Merge
		output("\n\n<i>“Oohh, fuck! Don’t hold back, I need you on me!”</i> the punky pirate cries, the light of her hi-tech visor evaporating in an impatient flash. Her fancy armor hastily disassembles, allowing her huge G-cups and curvaceous frame to spill out from their metallic confines. The kaithrit moans loudly in relief - a sexy sound that gets your blood going. Semi-transparent liquid sprinkles from her sugary tits, criminally wasting itself outside of a deserving belly. The sight of her groping her whorish tits on the way has your [pc.cocks]");
		if(pc.cumQ() > 500) 
		{
			output(" spurting boiling pre-seed like a faulty hose");
			if(!pc.isCrotchExposedByLowerUndergarment()) output(", drenching your straining [pc.lowerUndergarment] with potent musk");
			output(".");
		}
		else output(" straining and beginning to dribble a bit of pre-seed.");
		output("\n\nShe bares her modified, seam-lined body to you as you close in for a warm and wet kiss that she excitedly returns, wrapping her soft-muscled arms around your neck, and thrusting a powerfully augmented tongue past your [pc.lipsChaste]. Your [pc.tongue] is pinned straight away as she gives your cheeks, your teeth, and your throat a once-over, smugly flexing that smooth cybernetic organ all throughout your jaw in impossible shapes, pressing obscenely against every cluster of velvety jawflesh before testing your throat. " + (!pc.canDeepthroat() ? "You gag and cough almost immediately, and she promptly relents.":"Your unresistant throat seals around what it thinks is a big, meaty cock, returning the favor with wet hugs."));
		output("\n\nYour [pc.skinFurScalesColor] hands are drawn to her milk-drizzling melons; the cyber-kitty’s [enemy.skinColor] hands lunge for your crotch. ");
		if(pc.cocks[x].cLength() >= 25) output("<i>“Mmmh, looks like you’re going to be a " + (silly ? "purrfect":"perfect") + " fit...”</i> she moans, manicly groping your sizeable " + (!pc.isCrotchExposedByLowerUndergarment() ? "bulge":"cock") + ".");
		if(!pc.isCrotchExposedByLowerUndergarment()) output(" She hungrily paws at your [pc.cocks], straining mightily against your clothes, desperately looking for the means to remove your [pc.lowerUndergarment]. It doesn’t take her long at all.");
		else output(" She lustfully jerks your [pc.cocks], moistening her hands and arms in the sheer amount of pheromonal pre-seed flowing from your [pc.cockType " + x + "] meat.");

		output("\n\n<i>“Mmh... That scent... Give me that! I want your dick!”</i> You press yourself to the catgirl’s body, eyes crossing as she furiously pumps your [pc.cock " + x + "]. <i>“Fuck yes... You’re so hard, you’re everything I need!”</i>");
		if(pc.hasClit())
		{
			output(" With her so focused on your manhood, you’re surprised she takes the time to include your [pc.clits], tugging on the ");
			if(pc.clitLength < 2) output("beady bud");
			else output("pseudo-cock");
			if(pc.totalClits() > 1) output("s");
			output(" of clitoral flesh.");
		}
		output("\n\nYou nibble her puffy, synthy nipples, and suck out the barest trickle of ultra-sweet cream in a ginger taste test. A thrumming ache rises in the back of your mind as you gulp it down; your body gradually ignites with every lapped up bead of pirate milk that trickles down her supple, pliant titflesh. Your brain is utterly subsumed by the warmth of fondling, teasing, cupping, <i>worshiping</i> this robo-cat’s heavenly chest, so much so that orgasmically pumping your [pc.cum] all over her is about to become the reality.");
		output("\n\nWell, it will as soon as you bury your raw and ready bone between her vast expanse of eye-encompassing tits and drench her in [pc.cumNoun]!");
		output("\n\nSynapses humping with carnal desire, a fire burning burning bright and hot, you thrust your [pc.cocks] into the sinfully warm enclosure of the milky catgirl’s pillowy breasts" + (pc.hasVagina() ? ", your [pc.pussies] creaming from the rush of it all":"") + ". Her hot channel molds to the shape of your overwhelmingly powerful [pc.cockNounSimple " + x + "]; The antenna on the side of the pirate’s head wobbles from the impact of your hips ramming against her divine bosom." + (pc.balls > 0 ? " Your [pc.sack] claps lewdly off her tits, coming away drenched in her nerve-inflaming blue milk before slapping and splattering into their underside again.":""));
		output("\n\n<i>“Good [pc.boyGirl]..!”</i> she cries out, squeezing her cushions hard around you again. <i>“Get yourself ready, enjoy this to your heart’s content, because I have no patience for inadequate lovers!”</i>");
		// PC cock smaller
		if(pc.cocks[x].cLength() < 8) 
		{
			output("\n\nYour [pc.cock " + x + "] is easily smothered by the sheer volume of the techno-feline’s heavenly boobflesh, but that’s no big deal, it’s as warm as her pussy promises to be! You wantonly hump her chest, staring into her [enemy.eyeColor] feline eyes. They’re dilated with hunger, widened by the lust addling her modified brain. Your pre-seed soon lubricates her entire torso, mixing with the sweat and treacle of ultra-sweet milk");
			if(pc.cockTotal() > 1) output(", the moistening process aided by your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " flopping around nigh uselessly");
			output(".");
		}
		// PC cock bigger
		else
		{
			output("\n\nYour [pc.cockHead " + x + "] makes frequent trips to the kaithrit’s mouth, your length and girth conquering this pirate slut’s breasts with every pump through her slime-slick channel. She sucks and kisses your [pc.cockNounSimple " + x + "] tip where possible, slurping pre whilst keeping her cock-compressing tits taut with one arm. Her free hand ");
			if(pc.balls > 0) output("adoringly caresses your [pc.sack].");
			else if(pc.hasVagina()) output("busily assaults your [pc.pussy], several fingers deep.");
			else output("happily strokes your taint encouragingly.");
			output(" You’ve soon lubed up her entire torso, mixing your [pc.cumColor] pre-seed with the sweat and treacle of ultra-sweet milk");
			if(pc.cockTotal() > 1) output(", the moistening of her breedable body made easier thanks to " + (pc.cockTotal() > 2 ? "all ":"") + "your otherwise uselessly flopping cock" + (pc.cockTotal() > 2 ? "s":"") + ".");
		}
		// Merge
		output("\n\n<i>“H-hey,”</i> the punky cat swoons, <i>“before you get started... maybe you’d like to have a drink?”</i>");
		output("\n\nTo your mind, all but drowned in the need to fuck, breed, and fuck again, the question almost doesn’t register. <i>“If you get a good drink, you’ll be <i>more</i> than ready to show me who belongs to who. I guarantee it...”</i> she purrs, letting your throbbing cock slide free. The milk flowing from her chest gleams in the light, forcing you to come to a decision.");
		if(pc.WQ() < 40) output(" Stars, she knows her body better than you do, obviously! A quick drink, more fuel for the fire, and you’ll take this kitten to pound town! What could go wrong?");
		else output(" In this brief reprieve, it’s abundantly clear that her milk has gotten you hornier than usual. If you drink that... Well, what does it matter? You’ll just get hornier, what’s the worst that could happen?");
	}
	//[Drink] [Don’t Drink]
	processTime(15);
	pc.lust(50);
	clearMenu();
	addButton(0,"Drink",drinkDatCatMilk,x,"Drink","What’s a little refreshment before the main course?");
	addButton(1,"Don’t Drink",dontDrinkAtTheKittyWell,x,"Don’t Drink","Nah... Madam Titty Kitty’s milk would just get in the way of a good fuck.");
}

//[Drink]
// Tooltip: What’s a little refreshment before the main course?
public function drinkDatCatMilk(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	var y:int = -1;
	if(pc.cockTotal() > 1)
	{
		y = pc.cockThatFits(enemy.analCapacity());
		if(y == x) y = pc.cockThatFits2(enemy.analCapacity());
		if(y == x) y < 0;
	}
	if(flags["PUNKMILK_DRANK"] == undefined) output("No way you’re passing on that opportunity.");
	else output("You know what you’re getting into, but the chemical rush is far too good to pass up.");
	output(" You smile carefree as you move to the cyber-kitty’s modded nipple... You wrap your [pc.lipsChaste] around her delectable teat and <i>suck</i>. Your cheeks hollow and your mouth purses as mouth wateringly sweet milk floods your maw; a mind-blowing flavor is absorbed into your gums and, seemingly, throughout your entire body before you’ve even quaffed it. After swallowing, you gasp, your vision blurs... and you suck <i>harder</i> than before. Void, fuck, damn, it tastes <i>wonderful</i>! A firm, gentle hand ");
	if(pc.hasLongEars()) output("caresses your [pc.ears]");
	else if(pc.hasHair()) output("runs through your [pc.hair]");
	else output("runs over your scalp");
	output(", urging you accept more of this bounty.");
	output("\n\nAfter the second gulp, you feel as though you’ve been wreathed in lustful fire. You grasp ineffectively against your body, every working receptor numb and <i>burning</i>. It’s like every cluster of nerves within have been consumed in a wildfire of inexpressible desire. Blissfully overclocked by her modded milk, she clutches your head closer, subduing you with yet another batch of hand-milked cream. One thing you <i>do</i> feel, submerged in this viscous wave of lactic-induced arousal, is the hand around your [pc.cock " + x + "], pumping your impossibly rigid cock with just enough tease that it feels like your length and girth are expanding following every thumping heartbeat.");

	// PC cock small <=6
	if(pc.cocks[x].cLength() < 7) output("\n\n<i>“Not doing so hot down there, huh?”</i> she whispers, commenting on your [pc.cockNounSimple " + x + "]. <i>“That’s fine. I’ve got an adaptable pussy, and a few new modifications that a good little assistant like you can help with,”</i> the pirate murmurs sweetly, ringing your [pc.cockHead " + x + "] with her thumb and index finger. <i>“Besides, a little modesty goes a long way. A shame those oversized rabbits don’t know the meaning of the word.”</i>");
	// PC cock big >=7
	else if(pc.cocks[x].cLength() < 12) output("\n\n<i>“Nice package, [pc.boyGirl]. Just the size I was looking for to test a few new modifications,”</i> the security cat purrs, jerking and pumping with focus on your [pc.cockHead " + x + "]. <i>“Now that I’ve got you right where I want you, you’re going to be a good, loyal assistant, right?”</i>");
	// PC cock bigger >=12
	else if(pc.cocks[x].cLength() < 18) output("\n\n<i>“O-ho... That’s quite an endowment you’ve got there, big [pc.boyGirl]!”</i> Two lissome hands wrap securely around your [pc.cockHead " + x + "], palms rubbing around the crown of your [pc.cockType " + x + "] mast. <i>“This is ideal... And you’re even bigger than those dimwitted fuckbunnies. <i>You</i> will make a perfect assistant.”</i>");
	// PC cock biggest >=18
	else output("\n\n<i>“Ha, shit, I thought you were big before, but you just keep growing don’t you? Now this... Oh yes, you’re going to be an <i>excellent</i> assistant!”</i> The catgirl squeals as your [pc.cockHeads] throb" + (pc.cockTotal() == 1 ? "s":"") + " under her dual touch. Her insatiable molestations soon pacify you. <i>“Ready to start?”</i>");
	// Merge
	output("\n\nYou pull back, groaning dully, staring at the pirate whose predatory fangs are bared to your sweat-dotted face. ");
	//punkHPLoss: 
	if(pc.HP() <= 1) output("<i>“See? I knew this is what you wanted.”</i>");
	else output("<i>“That’s the look I was waiting for!”</i>");
	output(" She grips your shoulders and insistently pushes you onto your back. The giggling pirate clamors atop your shudderingly hot and drooling form. Her long, oh-so flexible tongue flitters out, descending and collecting all the spit decorating your [pc.face], before worming its way to your [pc.cocks], crushed under her slimy robo-slit and between her [enemy.skinColor]-skinned thighs. From there, she gives an adoring lick to [pc.eachCockHead]" + (pc.hasVagina() ? ", and even your [pc.clits]":"") + ".");
	// PC big clits
	if(pc.totalClits() > 0 && pc.clitLength > 3)
	{
		output("\n\nYou cry out deliriously when your oversized clit" + (pc.totalClits() > 1 ? "s are":" is") + " stimulated in equal measure, the arcs of lightning-like pleasure making you spread eagle - or attempt to - when her tongue is able to hug " + (pc.totalClits() == 1 ? "it":"them") + " like a glove" + (pc.clitLength > 5 ? ", jerking the gratuitous flesh like any other cock":"") + ".");
	}
	output("\n\nIn your stupor, you grasp and babble for something to hold on to, feeling like your [pc.balls] " + (pc.balls == 1 ? "is":"are") + " about to explode, to say nothing of your pre-spewing [pc.cocksLight] that feel" + (pc.cockTotal() == 1 ? "s":"") + " fat, swollen, and in dire need of release." + (pc.hasVagina() && pc.wettestVaginalWetness() > 2 ? " A puddle of femslime pours out from your [pc.pussies], pooling beneath your [pc.legOrLegs] - Three fingers thrust in your cunt post-orgasm for good measure.":""));
	output("\n\n<i>“Aw, can’t handle the pressure?”</i> The buxom pirate rubs her artificial cunt against your ");
	if(pc.hasKnot(x)) output("knot");
	else if(pc.hasSheath(x)) output("sheath");
	else output("base");
	output(", her clit... Woah. Last time you looked at her clit, it was as big as a nut, but now it’s more like a pseudo-cock of profoundly sensitive flesh frotting against your [pc.cock " + x + "]." + (pc.cockTotal() > 1 ? " <i>“I’m glad you have more than one, cute stuff, I’ll give you some points for preparation. I quite like when my assistants are </i>packed<i>!”</i>":"") + " Her teasing hand eases out several ropes of pearly pre that sloughs " + (pc.cocks[x].cLength() > 15 && pc.biggestTitSize() >= 1 ? "between your tits and ":"") + "on your [pc.belly].");
	output("\n\nSitting upright, the domineering kaithrit cups one jiggling tit, squirting you with more lust inducing milk. ");
	if(pc.libido() <= 33) output("You flinch and try to keep more from sliding down your throat, but the spatter on your [pc.lipsChaste] produces a similar effect.");
	else if(pc.libido() <= 66) output("You mumble happily, parting your [pc.lips] for the rain of savory tit-cream.");
	else output("You squeal in happiness, " + (pc.biggestTitSize() >= 1 ? "squeezing your own [pc.breasts]":"pinching your [pc.nipples]") + " as you make an earnest effort to catch everything, even using your fingers to wipe up what lands outside your accepting mouth.");

	output("\n\nWith ");
	if(pc.cockTotal() == 1) output("your cock in hand");
	else if(pc.cockTotal() > 2) output("your cocks smushed together");
	else output("two cocks in hand");
	output(", the cyber-kitty lifts her hyper-feminine body and aligns your [pc.cock " + x + "] with her pussy, letting her torrid precipitations finish your lubrication.");
	if(pc.cockTotal() > 1) output(" She wraps her fuzzy, prehensile tails around " + (pc.cockTotal() == 2 ? "your second cock":"one of your extra cocks") + ", guiding it between her marvelously thick ass cheeks.");
	output(" <i>“Look up here,”</i> she calls, stroking your cheek. You do so, meeting her [enemy.eyeColor] eyes as best you can. <i>“Now, that’s enough foreplay. Let’s begin!”</i>");
	output("\n\nYour limbs buck and spasm in the searing heat of rut; your chest heaves in torturous relief that the voluptuous pirate is finally starting! Your [pc.cockHead " + x + "] prods against the syrupy folds of her augmented gash, a wave of girlcum rushing over it. Without your [pc.cockNounSimple " + x + "]’s input, her vagina widens on its own. You’re eased in at the pirate’s frictionous pace in defiance of your impatient thrusts. And the alien feel of her sweltering, synthetic slit, something you expected to be colder, clenches red-hot around every inch of your cock in ways you wouldn’t have thought possible. The muscles of her cunt impress upon your manhood methodically, not wantonly, and as you sink further into her artificial holster, you loose a feral roar, squeezing her thighs and clit with the same strength her erotically undulating tunnel applies to you.");
	pc.cockChange();

	output("\n\n<i>“Ooh! T-t-that’s...”</i> the kaithrit slumps forward");
	if(pc.cockTotal() > 1) output(", using her tails to rub your second cock against her divine ass" + (pc.cockTotal() > 2 ? ", her fat, expanded clit grinding against your third":""));
	output(".");
	if(pc.cockVolume(x) <= enemy.vaginalCapacity(0)) output(" <i>“Good fit, cutie, I’m learning a lot about you already.”</i>");
	else output(" <i>“Tight fit... But oh my, I can feel everything... As if you’re a part of me...”</i>");
	output("\n\nYou can see the sparks of incredible concentration in her feline eyes, and following her subtle facial tics, you feel your [pc.cock " + x + "] <i>assaulted</i> in ways that no normal pussy could manage. It’s more than a glove molding itself to your [pc.cockType " + x + "] shape, it’s a biocybernetic organism, and its electrons are firing at peak efficiency. Every light bounce inside your needily throbbing dick, every breath you take, is met with a massage-like pleasure that leaves you panting and begging for more of its muscular cock-grinding.");
	output("\n\nHolding your [pc.arms] for support, she rides you leisurely, taking her time on the top of your pole. You try to thrust back, but as if anticipating your impatience, your [pc.cockHead " + x + "] rebounds off her sealing canal, blocking you from taking ground you’ve yet to be given while also trapping you in its molten confines. In response to your libidinous temerity, your juice-slathered cock is pulverized from the infinite directions of augmented kaithrit cunt, demonstrating its chastity function all too well. <i>“Anxious, are you? That’ll pass, sweetie. Besides, you’re all mine right now,”</i> the slutty technophile coos. <i>“The treat I’ve given you will keep you going for as long as you’re needed.”</i>");
	output("\n\nHer loose smile is almost a challenge to you now, to take back control... somehow." + (pc.inRut() ? " It’s so fucking hard to stay rational; you were in a state of rut before you found her, but that damned milk is making it <i>so much harder</i>... You’ve got to fuck her so badly, you can’t afford to stay under her when you’ve got loads that need pumped in her!":""));
	output("\n\nShe teases your [pc.cockHead " + x + "], her walls clamping down on your cum-tube from top to bottom, preventing even the tiniest drop of pre from emerging. A soundless scream surges up your throat, and you half-whine under her authoritative constraint, feeling the pressure building as a pocket of pre fights against her and your body, only concerned with its own existence. <i>“Going to sit still now? Be a good [pc.boyGirl]? Or do I need to put the restraint goggles on you?”</i>");
	// PC bimbo
	if(pc.isBimbo()) output("\n\n<i>“Yes! Yes! I’m a good girl! I’ll totally behave, I promise!”</i> you fuck-drunkenly giggle behind half-lidded eyes.");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“I understand. You lead, I’ll follow, it’s your show...”</i> you murmur in assent, a lopsided smile on your fuckdrunk face.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“I promise... I’ll be a good [pc.boyGirl],”</i> you hoarsely say, eyeing her sputtering tits.");
	// PC misch
	else if(pc.isMischievous()) output("\n\n<i>“I... I think that’s a good idea...”</i> you mutter, an eye on her sputtering tits. <i>For now</i>, you muse.");
	// PC hard: 
	else output("\n\nGrowling and making another futile attempt, you tell her what she wants to hear: <i>“Yes...”</i>");
	// Merge
	output("\n\n<i>“Oh, good. Although, there’s an idea for the future...”</i> she simpers, falling down just a bit more as she resumes her previous pace... An agonizingly slow pace leaving you yearning. Her body wants to pull you deeper, but her mind is stubbornly resisting your cock! When her breathtaking boobs leak above your face... <b>That’s it!</b>");
	output("\n\nWith a surge of energy, you reach up and pull her down, taking her intoxicating tit in mouth again with a plan in mind. <i>“There, see? Now that we’ve worked out where you <i>really</i> belong, let’s urrgkk-!!”</i>");
	output("\n\nBefore the presumptuous kitten can finish her train of thought, you derail it. You about headbutt her with the speed of your kiss, forcing her own milk upon her. Taken completely by surprise, she ends up hooked on her own supply; the shock of it all smashes her self-control to atoms, and your cock glides all the way through her confused cunt, [pc.cockHead " + x + "] battering against her womb in the most halting feeling of pleasure you’ve had since this started!");
	output("\n\nThe kaithrit SecOp screams in pleasure, feebly grappling with her jostling tits. Hyperventilating, she slumps onto your chest" + (pc.biggestTitSize() >= 1 ? ", docking with your [pc.breasts] between wild molestations":"") + ". <i>“Oohhhh, you cheeky- little...”</i> A shrill, cat-like whimper erases her cool, collected facade; her voice fades into sibilant, body rumbling purrs.");
	output("\n\nNow in control of this sexcapade, you roll over on top of the insensate kaithrit, mauling her high quality bosom and spreading her legs nice and wide, busily thrusting her into the ground with every gyration of your [pc.hips].");
	// PC bimbo
	if(pc.isBimbo()) output("\n\nGiggling, you huskily taunt her: <i>“I belong deep inside and right up here, babe! Let’s get to that stress test!”</i>");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“We’ve worked out the details just fine, hun,”</i> you nod sagely, ready to start a stress test of your own.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“What was it you said... Something about being a good assistant?”</i> you breathily ask, cupping her pussy lovingly. <i>“Let’s move on to that. I’ve got a lot of energy stored up...”</i>");
	// PC misch
	else if(pc.isMischievous()) output("\n\n<i>“I think you wanted that to happen. Now, what was that about helping you with a few <i>tests</i>?”</i> You punctuate the last word by slapping her ass.");
	// PC hard
	else output("\n\n<i>“Alright, bitch,”</i> you scowl, <i>“let’s put the ‘stress’ in those tests of yours...”</i>");
	// Merge
	output("\n\nBolstered by the buxom cat’s starry-eyed submission, you hike her languid legs over your shoulders and buck your hips against her own" + (y >= 0 ? ", slamming your once useless [pc.cockNounSimple " + y + "] into her asshole as well!":".") + " The intense pleasure you derive from your all-conquering pumps washes away the previous emasculation in soothing waves. Without a rational brain to control it, her pussy doesn’t revert to a more plebeian state. In fact, its vacuumous suctions are now as vigorous and frantic as the mind once guiding it! One moment it fights to prevent your inward stroke, and the next it seals around your [pc.base " + x + "], denying any consistency.");
	output("\n\nBut that’s just fine. Even though she’s got all the cock-controlling technology a pirate’s payday can buy, it’s neither a match for how fucking horny you are nor how hard your [pc.cocks] are.");
	output("\n\n<i>“Fuck me, cutie! Pound me with everything you’ve got!”</i> For a split second of clarity, her pussy releases you just long enough for you to smash your hips into her, ramming into her womb with all the strength your over-stimulated muscles can provide. Grunting loudly, you fuck her ferociously, ignoring the vice that tries in vain to stop you; you set a pace despite the obstacles, bashing straight through the walls rather than looking for an alternative solution or playing it slow. Every time your dick punches through her contracting canal, pain-pleasured howls fill your [pc.ears].");
	output("\n\nHer tits jiggle with the intensity of a tidal wave, her head-tenna wobbling as if it were weathering a storm. Bellowing, you fall into the pirate’s embrace" + (pc.cockTotal() > 3 ? ", your extra cocks grinding between your bellies and her delicate super-clit":"") + ". You hook your arms under hers, dominantly grinding against her chest, concentrating solely on plowing her waterfalling cunt with everything you’ve got; you’re going to fuck her into the ground so hard that she’ll need new limbs to stand again!");
	output("\n\nYour savage thrusts are short, rapid, then long and powerful; your valiant [pc.cockType " + x + "] phallus enters and exits with lewder and louder smacks of sweat and femjuice. Peaking, your arousal assaults the edges of your consciousness, and knowing she’s right there with you in experiencing this groundbreaking success of an orgasm, you hug the cyber kitty as tight as you can, her tails wrapping around your waist");
	if(pc.hasVagina()) output(" as you feel [pc.eachVagina] " + (!pc.isSquirter() ? "dribble lightly":"squirt hard"));
	output(".");
	if(pc.hasKnot(x)) 
	{
		output("\n\nJust before climax, you slam your [pc.knot" + ((y >= 0 && pc.hasKnot(y)) ? "s" : (" " + x)) + "] into the kaithrit pirate, sealing her pussy" + (y >= 0 ? " and ass simultaneously":"") + ". The thought that your liquid virility isn’t going anywhere else is the last satisfying thought you need to cross the orgasmic line.");
	}
	else output("\n\nAs your [pc.balls] prepare the first surge of cum, you slam your hips into the kaithrit pirate’s, a feral roar preceding your effortless ejaculation.");
	var cumQ:Number = pc.cumQ();
	// PC low cum
	if(cumQ < 1000) output("\n\nHer synth-pussy makes it all too easy to achieve release, and with closed eyes you are intimately aware of the pleasant travel each rope of spurting [pc.cum] makes up from your [pc.balls] through your programmatically massaged urethra... right into the pirate’s waiting womb" + (y >= 0 ? " and colon":"") + ". You gently rock against her body, your [pc.cocks] flexing and swelling with salty deluge." + (pc.cockTotal() > 3 ? " [pc.CumVisc] [pc.cumNoun] sprays from your other dicks, warming your bellies with a helping serving of [pc.cumFlavor]-flavored seed.":""));
	// PC plenty of cum
	else if(cumQ < 5000)
	{
		output("\n\nHer synthetic pussy makes every attempt to suck your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("body");
		output(" dry of [pc.cum], the rhythmic tightening against your urethra and [pc.cocksLight] seemingly programmed for maximum spunk-draining effectiveness. Your ");
		if(pc.balls > 1) output("nuts");
		else output("prostate");
		output(" clench");
		if(pc.balls <= 1) output("es and churns");
		else output(" and churn");
		output(" [pc.cumVisc] [pc.cumNoun] into the catgirl’s womb" + (y >= 0 ? " and ass":"") + ", lightly distending her belly against your own, and thanks to your gifted output, even starts backing up against the seal of your crotch" + (pc.hasKnot(x) ? " and knot":"") + ", faint amounts of [pc.cumColor] seed leaking from her well-used hole" + (pc.cockTotal() > 3 ? " where it mingles with the puddles fired off by your extra dicks":"") + ".");
	}
	// PC lots of cum
	else
	{
		output("\n\nWhether or not her womb is modded, it swells gravid with [pc.cum] like any other, her fancy pussy ensuring every copious shot rocketing from your depleting [pc.balls] finds its place inside, the rhythmic massages against your urethra ensuring maximum cum-milking efficiency. Your [pc.cocksLight] flex powerfully with every [pc.cumVisc], teeth-gritting eruption" + (y >= 0 ? ", filling her ass just the same":"") + ", and with shut eyes you can bask in the glory of every satiny pulse of ejaculation." + (pc.cockTotal() > 3 ? " Your extra cocks blow between your bellies, [pc.cumColor] spunk splattering everywhere, soon puddling with what backs up and spills out of her seed-filled bitch-hole.":""));
	}
	// Merge
	// PC not in rut
	if(!pc.inRut()) output("\n\nSighing euphorically, you push yourself up, feeling the amorous tickle in the back of your mind fading away. The feline’s eyes rolled back a long time ago, and she lies splayed and panting." + (pc.hasKnot(x) ? " You won’t be going anywhere with your knots locking you together, so you snuggle your head in her cleavage for now, hoping nobody else will stumble upon you. Her gratified purring lulls you into a relaxing nap rather quickly.":" You collapse again, exhausted from your efforts, and snuggle your head against her pillowy chest, idly hoping nobody else finds you like this. The gratified purring in her chest lulls you into a relaxing nap rather quickly."));
	// PC in rut
	else 
	{
		output("\n\nGrowling like a feral beast, you wait just a few minutes to pull ");
		if(pc.hasKnot(x)) output("your somewhat deflated knot" + (y >= 0 && pc.hasKnot(y) ? "s":"") + " out");
		else output("your [pc.cocksLight] out");
		output(", dragging a pained yelp from the feline whose eyes have rolled back. Even as she lies splayed and panting, you’re not satisfied yet, not after what her milk has done to your hyper-libidinous mind. You thrust back in her messy hole" + (y >= 0 ? "s":"") + ", ruthlessly starting round two as she mutters in abject bliss...");
	}
	//[Next]
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	clearMenu();
	addButton(0,"Next",fuckDatPussiesPussyPostDrinkyDrank,x);
}

public function fuckDatPussiesPussyPostDrinkyDrank(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	// PC not in rut
	if(!pc.inRut()) 
	{
		output("<i>“Oof...”</i> the kaithrit sputters, alerting you of the fact that your one-eye-open nap is over. Damn shame too, these tits are executive-grade pillows...");
		output("\n\nYou withdraw your spent [pc.cocksLight] from her, and are surprised when her tongue darts out to clean " + (pc.cockTotal() == 1 ? "it":"them") + " of the sexual effluvium. <i>“Nice feature,”</i> you say. She giggles at your gratefulness, and soon you’re ready for another round!");
		output("\n\n<i>“That was an exemplary performance,”</i> she calls, gazing fondly at you as she stews in your [pc.cum]. <i>“If you can perform like that, maybe I should find you a hall pass. I could use someone like you on call.”</i>");
		output("\n\nYou disregard the comments and saunter off from her content tittering, knowing she or one of her partners will accost you again regardless of how you respond.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	// PC in rut
	else
	{
		output("Your wet dreams are filled with pussies. Torrid, syrupy pussies hovering over your face, over your [pc.cocks], suspended in a space surrounded by an infinite amount of waiting holes between comically thick legs drizzling with the scent of ripe fruit begging to be bred. At a whim you see them all being plowed, fucked senseless - vivid moanings fill your head. When you reach out, you can conjure up the gorgeous partner you want. Even though you’re not moving, you are... you’re fucking one, then another, surfing on the breeder’s waves, your tired hips unceasingly thrusting back and forth, in and out of velveteen holes, silky slits...");
		output("\n\nGasping, your [pc.eyes] open, and you suck air, utterly deprived. You sit up with a deep groan and look around. The sights and smells reach you quickly. Your lower body is plastered with [pc.cum], and your kaithrit partner, lying to your side, is lying face down, also utterly painted and claimed by your [pc.cumColor] seed. The ecstatic thrill you felt before is still there, but dulled and blunt, as regrettably benign as your limp [pc.cocksLight].");
		output("\n\nYou cough and gather your things. Before you leave, the cyber-kitty sputters to life, <i>“N-N-no more...”</i> she whines. You can hear the cybernetics whirring and rattling in her body from here, pushed well past operational safety limits. Both organic and inorganic have been utterly exhausted and damn near slagged. <i>“I-I can’t go another...”</i>");
		output("\n\n<i>“Well, maybe you should think about that next time you target random people, kitty-cat!”</i> you giggle. That also hurts. <i>“Y-yeah.. Ohh... But that was an outstanding performance... for a solo act... Maybe I’ll find you a hall pass, and you can help me with a few more tests?”</i>");
		output("\n\nYou dismissively shake your head at her spunk-spattered smile, turning and heading off. You get the feeling she and her friends will be down your throat again regardless of what you say.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
		pc.removeRut();
	}
	IncrementFlag("PUNKMILK_DRANK");
	processTime(30);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Don’t Drink]
// Tooltip: Nah... Madam Titty Kitty’s milk would just get in the way of a good fuck.
public function dontDrinkAtTheKittyWell(x:int = 0):void
{
	clearOutput();
	showPunkSecOp(true);
	var y:int = -1;
	if(pc.cockTotal() > 1)
	{
		y = pc.cockThatFits(enemy.analCapacity());
		if(y == x) y = pc.cockThatFits2(enemy.analCapacity());
		if(y == x) y < 0;
	}
	author("William");
	if(flags["PUNKMILK_DRANK"] == undefined) output("Something about that milk doesn’t sit right with you, and you shake your head, carrying on as you were.");
	else output("You know what to expect from Cyber Punk milk, and you shake your head.");
	output(" Frowning, the ‘punk pirate withdraws, and with a predatory grin, squeezes her tits, squirting you with an ample amount of her semi-transparent cream. A ribbon of milk flies between your [pc.lipsChaste], melding with your gums and trickling down your throat, forcing a gasp from your aching lungs. A libidinous conflagration engulfs your body - the tingle you felt in your head is now a viscous layer drowning out all other needs but the desire for pure, unfettered <i>sex</i>. Your gravelly groans are as flat as the cyber-kitty’s ears.");
	output("\n\nThe effect her love-drug milk has on you is near instantaneous, but it’s noticeably gradual in how <i>hot</i> you feel right now. Your nervous system is numbed and assimilated into the all-consuming lust for pussy - sweet, juicy, and bitter pussy." + (pc.inRut() ? " You were already dying for a pussy or four to fuck and fill and fuck again, but somehow her amatory cream amplifies the savage sex drive at the controls of your brain.":""));
	output("\n\nThe pussy between the kaithrit’s legs may be cybernetic in design, but there’s no chance it wasn’t designed for your [pc.cock " + x + "] right here, right now. You lock-on to her boiling synthetic hole, balling your hands into fists, visible heat wafting from your grit teeth." + (!pc.isCrotchExposed() ? " You growl and rip off your [pc.lowerUndergarment] off with all speed, allowing your [pc.cocks] to leap from their lair, fat cables of [pc.cumColor] pre-seed pouring from their ballooning tips, struggling to control your raging lusts.":"Fat cords of [pc.cumColor] pre-seed pour from [pc.eachCockHead], sizzling against the ground as you feverishly jerk yourself to full mast, growling as you seek to control your raging lusts."));
	output("\n\nSlinking forward, the cyber-kitty licks her lips, her hands swimming around your [pc.cocksLight] in systematic patterns. Her warm fingers draw a prolonged gasp from your salivating mouth as she further agitates your raging hardon" + (pc.cockTotal() > 1 ? "s":"") + ".");
	output("\n\nShe’s trying to take the lead.");
	// PC cock small <=6
	if(pc.cocks[x].cLength() < 7) output("\n\n<i>“Heh, think you can satisfy me with this size?”</i> the pirate husks. <i>“Aw, don’t worry about it. I appreciate a little modesty, those dimwitted rabbits could learn about it one of these days. I’ve got an adaptable pussy, you’ll be feeling...”</i> she leans in, <i>“all...”</i> she purrs hotly, <i>“you need to feel soon enough. So long as you behave...”</i>");
	// PC cock big >=7
	else if(pc.cocks[x].cLength() < 13) output("\n\n<i>“Good size, [pc.boyGirl]. Not too big, not too small. Not that it matters either way, my pussy will adapt and change to milk any size.”</i> The woman leans in, purring in your ear, trying to subdue you. <i>“Now that you’re ready, you’re going to behave yourself, right?”</i>");
	// PC cock bigger >=13
	else if(pc.cocks[x].cLength() < 18) output("\n\n<i>“Damn, big [pc.boyGirl], that’s a wonderful tool you’ve got there.”</i> The lissome pirate’s hands wrap around your [pc.cock " + x + "], sinking into your girth. <i>“Bigger than those rabbits. Now if you behave, I think we can get some real work done...”</i>");
	// PC cock biggest >=18
	else output("\n\n<i>“G-geez... How can you walk around with something like that?”</i> The kitten’s hand glides across your massive [pc.cockNounSimple " + x + "]. <i>“Oh well, you carried it right to me. If you behave, I’ve got a few things you can do with that cock of yours...”</i>");
	// Merge
	output("\n\n<b>BEHAVE!?</b> Who is she kidding? You’re so hard that your [pc.cocks] could knock this station out of alignment with " + (pc.cockTotal() == 1 ? "its":"their") + " burning erection" + (pc.cockTotal() > 1 ? "s":"") + ", and " + (pc.cockTotal() == 1 ? "it feels like it’s":"they feel like they’re") + " growing <i>bigger and harder</i> as the seconds tick by.");
	if(pc.balls > 0) output(" The enchanting handjob your [pc.balls] " + (pc.balls == 1 ? "receives":"are receiving") + " makes matters worse... No, <i>better</i>.");
	output(" Stars be damned, whatever she’s doing isn’t nearly enough to relieve you of the pressure building down there, making you feel as if you’re about to explode!");
	if(pc.hasVagina()) output(" The effect it has on your [pc.pussy], or had, was felt in the " + (!pc.isSquirter() ? "body-rumbling feminine orgasm you just had":"projectile of [pc.girlCum] that just splattered the giggling pirate") + ".");

	output("\n\nWhen you feel two hands on your shoulder blades, you shrug them off and wrestle back! Though your vision may be blurred, the intoxicating scent of cyber-cunt and the sexual overclock inflicted on you give you just enough focus - <i>and strength!</i> - to stay in control. The robo-cat yelps when you spin and force her down, falling on her like a sack of bricks. Both of your [pc.arms] wrap around her body, manhandling the hell out of her tits, squeezing those pebbly cybernips to soak your hands and the ground in tasty trick milk." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " You press your head to her back and, thanks to your endowed organ, work your [pc.tongue] around her waist, happily teasing her sensitive nips and mingle with her own augmented organ.":""));

	output("\n\nYou fall back just a bit, lowering your face into her overheated nethers where you deliver a long, succulent lick to her slightly parted pussy. The taste is... fuck, it’s phenomenal, and it sends you into the next level of overdrive! You rabidly lick up, down, and up again, nibbling on her fat button of a clit, forcing louder and louder groans from the kitty-pirate. You spread the forgiving flesh of her pussylips, drinking down the sweet fruit oozing endlessly from her heavenly folds. Your hot breaths against her cunt make her thrust that ravishing quim into your face, burrowing your [pc.tongue] between ribbed walls that squeeze like an ocean wave against your parched muscle. You tug yourself free and reassert yourself, keeping a few fingers busy down there.");
	output("\n\n<i>“Ooh, this... Did I underestimate your ability?”</i> the ponytailed slut looks back, grinning as her two puffy tails wrap possessively around your waist. <i>“But I wonder how long you can last. I think you’re - Achh!”</i>");
	output("\n\nYou smack her square on her jiggling ass, the wobbles and ripples of her [enemy.skinColor] flesh and loud, sexy yelps inflame your befuddled mind further. You smack again, again - <i>THWACK!</i> - then knead it slowly. When you squeeze her malleable globes, her reddening skin sinks easily between your fingers. There’s far too much kitty assflesh to be held by your hands alone. You mount her, getting your hands back on those sputtering melons dangling from her chest, ramming your [pc.cocks] between her quivering, palatial thighs" + (pc.cockTotal() > 1 ? " and her pillowy derriere":"") + ".");
	if(pc.cockTotal() > 3) output(" The rest of your dicks flop uselessly, wetly smacking against her legs and ass, spurting [pc.cumColor] pre all over her.");
	else if(pc.cockTotal() > 2) output(" Your extra dick smacks wetly against her shuddering legs, painting it [pc.cumColor] with pre-seed.");

	// PC bimbo
	if(pc.isBimbo()) output("\n\n<i>“Alright, sweetie! I think this... right here... Hehe!”</i> You thrust again, squealing in trembling pleasure, her thighs closing around your girth as you hump and giggle. <i>“...is where I belong! Now just you sit there and - ooohh - behave!”</i> The buxom catgirl cranes her neck, teeth burrowed in her lower lip, smirking at the giggling, half-minded slut that is you. That seductive look is meant to be a challenge, but wanton lust can be seen struggling for dominance in those widening pupils.");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“Looks like we’ve both found where we belong. Me, right on top of my feisty feline, and you, right beneath your stud,”</i> you grin, grunting loudly as you rapidly buck your hips in this intercrural foreplay. The augmented kaithrit glances at you, her fangs burrowed in her lower lip, a smirk spreading across her flush and sweating face. The expression on her face is definitely a challenge, but you can see she’s struggling to avoid surrendering to her needs. Poor thing.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“Uhmm...”</i> you grunt, thrusting between her swaddling thighs, grinding your crotch against thick pirate ass, gently fondling and kneading her voluptuous assets with deep, stinging gasps. <i>“I think it’s fair to warn you how horny I am after that stunt of yours.”</i> Your pumps between her velveteen valleys are deliberate, doing just enough to soothe your furious erection" + (pc.cockTotal() > 1 ? "s":"") + ". <i>“Hope you’re ready for this..!”</i> The cyber-kitty giggles when she looks back to you, her fangs burrowed in her lower lip in a wide smile.");
	// PC mischievous
	else if(pc.isMischievous()) output("\n\n<i>“You know, I don’t mind that little attempt of yours, gotta do what you can to stay on top and in shape around here, right?”</i> You gasp when her plump thighs clench around your [pc.cocksLight]. <i>“But hey... Umf!”</i> You pull back and thrust in hard, making her squeak. <i>“We’re both about to get what we want and a lot more. In fact, I’m a little jealous. After I’m through with you, I think you’ll have had the real fun in this.”</i> The kaithrit woman meets your confident grin, her fangs sinking into her lower lip, a wide, challenging expression on her face. She dares you to live up to the hype, but at the same time, you can see significant effort to stay in control of her instincts.");
	// PC hard
	output("\n\nYou accentuate every thrust in the security cat’s warm leg- and ass-cleavage with a sharp smack to her jiggling rump. <i>“This is just what you wanted, isn’t it, slut?”</i> you growl, thrusting just a bit faster. <i>“You aren’t getting off easy, not after that little stunt.”</i> Moaning loudly, a wave of girl cream washing over your [pc.cocksLight], the lip-biting cyber kitty gazes at you. There’s some resistance left in her challenging eyes, but it’s giving way to overwhelming desire for more.");
	// Merge
	output("\n\nRearing back, you line your [pc.cock " + x + "] up with her pussy. The slightly puffy lips are caked in juice that’s run down to her knees, leaving an extra pair of obvious (and fragrant!) lines on her body that mark the roads other secretions walk. You rub your [pc.cockHeads] into her folds, humming in delight as her smooth skin and expanding clit fold and flex in the presence of your musky member" + (pc.cockTotal() > 1 ? "s":"") + ". Wait, expanding clit? <i>“Nice, you losing control already?”</i> you ask, slipping a few fingers around that pseudo-cock of hyper-sensitive flesh. The SecOp refuses to comment, but her body reacts appropriately.");
	output("\n\nAfter lubing [pc.eachCock] up, made difficult by her temptress hips and your vanishing self-control, you thrust inside her cyber-pussy" + (y >= 0 ? " and her ass":"") + ", intent on making " + (y < 0 ? "it":"them") + " your own.");
	pc.cockChange();
	output("\n\nImmediately you wince at the tightness of her wet cunt. You’ve only slipped a few inches and, damn, it’s like her body is fighting a battle against your dick! " + (y >= 0 ? "Fortunately, as you press your exploratory [pc.cockNounSimple " + x + "] into her ass, the barricades of sensitive nerves and spasming muscles fold to your [pc.cockHead " + x + "]. ":"") + "You pull back and thrust in a bit harder, feeling like you’ve accomplished nothing. The effect this has is far from pleasurable: it’s aggravating the hell out of your overcharged libido.");
	output("\n\n<i>“H-having trouble?”</i> the punky cat grins, moaning as you gain another inch. <i>“Are you?”</i> is your hasty response. You’re determined to get in there. And yet, as you take just a little more slathering ground, her leaky cunt constricts all around your [pc.cockHead " + x + "] so tightly and so... <i>methodically</i>. There’s no other word for how <i>alive</i> her inner walls are, how despite their nature, it feels like a million fingers pressing from infinite directions, each point of pressure minute but unbelievably effective. Your urethra is pressed and squeezed by those innumerable phantom digits, preventing even the tiniest drop of pre from spurting. Despite the intense vaginal pressure on your dick, she coaxes you further in, giving your straining cock what can be described as the ultimate massage.");
	output("\n\nBut regardless of the good that can be said, in this battle of wills, hers is getting the upper hand." + (y >= 0 ? " With your [pc.cock " + y + "] under control half-way inside, you can hardly do anything with the one in her tight butt, itself desperate to stake its claim.":""));
	output("\n\n<i>“This pussy can be used to stimulate a partner in ways that normal pussies can’t achieve. And because I can - Aaohh!”</i> the kitten’s ears fold when you reposition, growling as you struggle against her. <i>“I can control you with just a thought now that you’re in there. R-r-ready to admit defeat - <i>Ah!</i> - yet?”</i>");
	output("\n\n<b>Fuck that!</b>");
	output("\n\nYou grab her tails and lift her ass up, and your " + (y >= 0 ? "[pc.cocksLight] slip":"[pc.cock " + x + "] slips") + " in a bit deeper. You’ve still got so much more to give if you could just... get that fffffucking...");
	output("\n\nGasping loudly, the vice around your dick draws a raspy, pained breath from your lungs. You keel over her back, still squeezing roughly on her ass. She denies you and at the same time stimulates your [pc.cockType " + x + "] shaft with precisely applied strength, backing up your balls in the worst way possible. This wouldn’t be so bad if she’d just let that robo cunt do what it was made for and instead <i>milk</i> your cock! <i>“Come on stranger, I’m all for a good time, but as they say... if you can’t <b>hack</b> it, you might as well... <i>step back</i>.”</i>");
	output("\n\nUrrghhh! You whimper now, the stress becoming intolerable. For all the ground your valiant dick struggles to maintain, it’s a losing battle. You slap her ass, you jerk her oversized clit, you maul her boobs, but in this vaginal stalemate, the enemy territory continues to close in all around. The more breaths you take, the more like a snake it feels, closing around you tighter and tighter, demanding you submit.");
	if(pc.hasVagina()) output(" Even your [pc.pussies] " + (pc.totalVaginas() > 1 ? "are":"is") + " denied, the pressure on your [pc.cocksLight] making it impossible to cum whatsoever..!");
	output("\n\nYou frantically glance at the pirate’s head, noting she’s been unusually quiet the last minute. Her head is slumped and her body is undergoing its own earthquake. Her pained howls give you hope when you reposition over her: you plunge further in, so close and yet so far from hilting her.");
	output("\n\nBut the shred of pleasure you derive from making your own way inside her restores your sense of control. Your vision clears just enough to see the gratuitous puddle of milk that’s leaked from her chest, and you finally realize what you have to do. You lean down, your [pc.skinFurScales] contouring to her arched back, and run your fingers through the thickest gatherings of her cream and carry it to her mouth. Her cable-like tongue hangs from her jaw; you hurriedly swab her mouth with her own supply.");
	output("\n\n<i>“Mmmh!!”</i> she moans, squirming against you. But that does it! <i>“AhhhgHhhAAAA!”</i> she screams, letting the breath she held for so long go, and with it... her grip on you.");
	output("\n\nWith each passing second, you fall further into her kitty hole until you finally breathe your own sigh of relief: your [pc.cockHead " + x + "] bowls over her G-spot and gives its warmest, stickiest greetings to her womb, signaling its victory with a heavy pulse.");
	if(y >= 0) output(" Your extra [pc.cockNounSimple " + x + "] in her ass claims her colon as its own, fully hilted inside.");
	if(y < 0 && pc.cockTotal() == 2 || y >= 0 && pc.cockTotal() == 3) output(" Your extra dick spurts a long rope of pre not unlike a thread of cum over her leg, your [pc.balls] finally liberated of chastity mode.");
	else if(pc.cockTotal() > 2) output(" Your extra dicks spurt long ropes of pre not unlike cords of cum over her legs, your [pc.balls] finally liberated of chastity mode.");
	output("\n\nSweat dripping from your entire body - you lean down to her twitching ear, and tell her that she now belongs to you.");
	output("\n\n<i>“AwwAhaaaa!”</i> she cries ruefully, <i>“Fine, fiiineeee! I give up I submit justfuckmealready!”</i>");
	output("\n\n<i>With <b>all</b> pleasure</i>. Time around you seems to hold its breath as you withdraw from her pussy, the universe waiting with bated breath as some horribly edged creature - you - overcomes its trial-by-pussy and <i>earns</i> this fuck. With your [pc.cockHeads " + x + "] just barely inside her now berserk cunny" + (y >= 0 ? " and stretched ass":"") + ", you laugh loudly as you conquer this cat, slamming your [pc.cocksLight] into her so hard that her cervix spreads and her whole body crashes to the ground. The confused synth-pussy you pound retains its vacuumous strength, vigorously sucking on your dick like a throat, its servos firing in all the right places to masterfully administer pleasure to your cock.");
	output("\n\nThe floodgates broken, you froth at the mouth in your haze of rut as you mercilessly plow her, pulling on her arms as you do. She screams praises and encouragements, urging you on and on; conjuring up all the strength in your over-stimulated and aching muscles, you rise to the occasion and the pace of a jackhammer. Her cunt seals its red-hot muscles to block your pleasurable path, but you carry on without regard, your [pc.cockHead " + x + "] punching right through her clenching canals.");
	output("\n\nThe antenna on her head and her super-tongue wobble, the babbling ‘punk’s fingers crimp. Glancing down, you see her tongue weaving around her hyper-engorged clit and wrapping taut and firm around your [pc.cocksLight] in an exotic and incredibly arousing display ");
	output("that carries on to your ");
	if(pc.balls > 0) output("[pc.balls]");
	if(pc.balls > 0 && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas]");
	if(pc.balls == 0 && !pc.hasVagina()) output("[pc.asshole]");
	output(". When you bury your prick" + (y >= 0 ? "s":"") + " inside, her tongue follows you inside.");
	output("\n\nYour powerful, rhythmic pumps receive the full cooperation of her augmented body; your thumping thrusts go from lengthy to short, slow to swift. Your [pc.cockType " + x + "] phallus glides in and slides out of her flooding snatch, the obscene sounds of dripping femjuice, overflowing pre, and waterfalling sweat reaching unrecorded volumes and vulgarity. When you slam your hips against hers one last time" + (pc.balls > 0 ? ", your [pc.balls] tightening just beneath her dominated twat":"") + ", you bellow and yank her up as you lie on your back.");
	output("\n\n<i>“Wha-!”</i> the pirate squeals, but with no strength in her limbs, she plunges down on your [pc.cocks]");
	if(pc.hasKnot(x))
	{
		output(", your " + (y >= 0 && pc.hasKnot(y) ? "[pc.knots " + x + "]":"[pc.knot " + x + "]") + " spreading her hole" + (y >= 0 ? "s":"") + " past their limit and ensuring maximum breeding potential. The strain on her backside sounds very much to her liking");
	}
	output("! Fully inserted, the first rope of [pc.cum] launches through your dick with such ease and such intimate, detailed sensation that you blissfully shudder in this mind-shattering climax" + (pc.hasVagina() ? ", one that [pc.eachVagina] sympathetically add to more from the inside than out":"") + ".");

	var freecocks:Number = pc.cockTotal() - 1;
	if(y >= 0) freecocks--;
	var cumQ:Number = pc.cumQ();
	// PC low cum
	if(cumQ < 1000)
	{
		output("\n\n[pc.CumVisc] [pc.cumNoun] spurts. and spurts, and spurts into the cyber-kitty’s stretched womb, her synth-pussy programmatically ensuring maximum [pc.sack] draining efficiency. Your [pc.cum] is delivered to the door by your swollen cumslit, and every throbbing, pulsing ejaculation vibrates her body and yours." + (y >= 0 ? " Your second [pc.cockNounSimple " + x + "], lodged deep in her ass, squirms against your first through the nerves separating them.":""));
		if(freecocks > 0) output("Your other " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", without " + (freecocks == 1 ? "a hole of its own, sadly paints":"holes of their own, sadly paint") + " part of your body or hers with [pc.cumColor] seed.");
	}
	// PC plenty of cum
	else if(cumQ < 10000)
	{
		output("\n\nThe kaithrit’s synth-pussy demonstrates its expertise at milking your " + (pc.balls > 0 ? "[pc.balls]":"body") + " of every drop of [pc.cumColor] spunk. As you fill her spread womb" + (y >= 0 ? " and spasming ass":"") + " with load after thick load of [pc.cumVisc] [pc.cumNoun], the indescribable sensation of a million gentle prods and palpations against your urethra make every tactile, voluminous ejaculation an exquisitely soft and memorable one. Her belly noticeably swells with the sheer amount your pour into her womb" + (y >= 0 ? " and colon both":"") + ".");
		if(freecocks > 0) output("Your extra " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", limply hanging outside, pitifully shoot" + (freecocks == 1 ? "s":"") + " over her butt and your body.");
	}
	// PC lots of cum
	else
	{
		output("\n\nYou have no idea if this techno-feline’s womb is modded, but it’s sure swelling gravid with [pc.cum] like any other would. Her spunk-sucking pussy expertly massages and palpates your urethra, making every powerful ejaculation an exquisitely pleasurable and unforgettable experience as you pump her womb" + (y >= 0 ? " and colon":"") + " full and fuller with [pc.cumVisc] [pc.cumNoun].");
		if(pc.hasKnot(x)) output(" You’re bloating her so much that with each pulse and throb, [pc.cumColor] seed begins to leak out around your knot" + (y >= 0 && pc.hasKnot(y) ? "s":"") + ".");
		if(freecocks > 0) output(" Your unslotted " + (freecocks == 1 ? "member helplessly sprays":"[pc.cocksLight] helplessly spray") + " [pc.cum] all over her back and yourself.");
	}
	// Merge
	// PC not in rut
	if(!pc.inRut()) 
	{
		output("\n\nThe pirate cat falls on to your [pc.chest], ecstasy-ridden head landing to the side of yours. Her eyes rolled back some time ago, and now she simply lies splayed and panting in your embrace. Thankfully, the amorous tingle in the back of your head is gone. ");
		if(pc.hasKnot(x)) output("So long as your " + (pc.hasKnot(y) ? "[pc.knots " + x + "]":"[pc.knot " + x + "]") + " are inflated, you won’t be going anywhere, especially not as you’re still cumming a bit! You get your hands around her " + (cumQ >= 10000 ? "gravid ":"") + "belly and hold tight, hoping nobody else’ll stumble upon your tryst. Her gratified purring helps you catch some shut-eye in the meantime.");
		else output("With a big, sexy cat girl on top of you and your [pc.cocksLight] deflating warmly inside her, you have little strength after your monumental orgasm. Wrapping your hands around her " + (cumQ >= 10000 ? "gravid ":"") + "belly, you snuggle up and catch some peaceful shut-eye.");
	}
	// PC in rut
	else
	{
		output("\n\nGroaning and half-whimpering, you roll over on the augmented pirate and tug your ");
		if(pc.hasKnot(x)) output("barely deflated " + (pc.hasKnot(y) ? "[pc.knots " + x + "]":"[pc.knot " + x + "]"));
		else output("spent " + (y >= 0 ? "[pc.cocksLight]":"[pc.cock " + x + "]"));
		output(" from her. A hoarse moan follows as you gaze down, still overwhelmingly hot, the need inside yet to be quenched. Your [pc.cock " + x + "] is still pulsing, and when you close your eyes, it’s a body-rattling beat that makes you shudder in abject awareness of your deific needs. You plunge inside her messy hole" + (y >= 0 ? "s":"") + " again, beginning round two with the blissed out kitten...");
	}
	//[Next]
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	clearMenu();
	addButton(0,"Next",dontDrinkTheCatMilkPart2,[x,y]);
}


public function dontDrinkTheCatMilkPart2(args:Array):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	var x:int = args[0];
	var y:int = args[1];
	// PC not in rut
	if(!pc.inRut())
	{
		output("<i>“Gahh...”</i> the kaithrit sputters, rousing you from your one-eye-open nap. <i>“Where...”</i> She looks to the left, meeting your [pc.eyes] with flicking ears. <i>“Oh.”</i>");
		output("\n\n<i>“Yeah, ‘oh’,”</i> you grin. ");
		if(pc.isBimbo()) output("<i>“Do I get a kiss, mmmhh?”</i>");
		else if(pc.isBro()) output("<i>“Ready for another round?”</i>");
		else if(pc.isNice()) output("<i>“Hey yourself.”</i>");
		else if(pc.isMischievous()) output("<i>“You disappointed?”</i>");
		else output("<i>“For your sake, I hope you’re not going to start something.”</i>");

		output("\n\nShe simply leans in and gives you a kiss on the cheek. The catgirl kips up with inhuman agility and slowly disentangles from you, sliding your [pc.cocksLight] from her pussy" + (y >= 0 ? " and ass":"") + ". <i>“That was an excellent performance, whoever you are,”</i> the woman looks down as you yourself begin to stand. <i>“Perhaps I should find you a hall pass? I could use an eager [pc.boyGirl] like you around.”</i>");
		output("\n\nYou disregard her comments. She folds her arms, already back to the way she was before your encounter, waving fondly as you leave. You know that no matter what you say, it wouldn’t change what is bound to happen again in the future.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	// PC in rut
	else
	{
		output("You passed out a while ago. Time doesn’t matter, not here in this dreamland of unfettered sex. Your body may have stopped breeding, but your mind is still at it. Even here on this euphoric cloud you still fuck. Legs part all around you, exposing their juice-slathered pussies to your inspection. At a whim you have another gorgeous partner to fuck senseless, your " + (pc.balls > 0 ? "[pc.balls]":"body") + " producing an endless amount of [pc.cum] to help you knock up every comer. You’ve got this down to a science, one minute and one-hundred thrusts for each sexy girl that comes your way. You pound, you slam, and you-");
		output("\n\n<i>Breathe</i>.");
		output("\n\nYou awaken with a painful gasp, shooting up and clutching your buzzing head. You frantically try to determine how much time has passed, but it’s futile. What you can see is your body absolutely caked in [pc.cum]. To your right... the punky cat who tried to get the best of you is lying languid, panting for air. She is also utterly painted in your [pc.cumVisc] [pc.cumColor] seed, thoroughly claimed.");
		output("\n\nYou cough, sore throat and all, as you gather yourself. The cyber-kitty sputters to life, whining, <i>“Oohh... please, n-no more... I can’t go again...”</i> From here, you can hear the cybernetics rattling violently in her modified frame, organic and inorganic parts both utterly exhausted and pushed well past operational safety limits.");
		output("\n\n<i>“I think next time I’m in heat, I’ll come find you again,”</i> you say with a giggle. That also hurts.");
		output("\n\n<i>“Y-yeah... You could help me with some other tests in the future. M-maybe I should find you a hall pass?”</i> the stammering kitten flashes you a spunk-spattered smile. <i>“You did unspeakably well... for a solo pirate.”</i>");
		output("\n\nYou shake your head and move on. You know that regardless of what you say, she and her friends will be down your throat again.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	processTime(15);
	output("\n\n");
	CombatManager.genericVictory();
}

//Get Licked - Either
//Force the kitty-[enemy.boyGirl] to apologize with [enemy.hisHer] tongue.
public function getLickedBySecop(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("You giggle at the silly, sexy cat-[enemy.girlBoy]. <i>“Shhh, let’s just have some fun, okay? Don’t think about all that other stuff, and you just worry about my pussy, ‘kay?”</i>");
	//Bro
	else if(pc.isBro()) output("You grin and at your crotch. <i>“Yeah you can lick...”</i>");
	//Nice/Misch
	else if(pc.isNice() || pc.isMischievous()) output("<i>“Since you offered" + (pc.isMischievous() ? " sooo generously":"") + "... I do have something you and your tongue can take care of.”</i>");
	//Hard
	else output("You chuckle. <i>“Since you’re on your knees, why don’t you put that wiggling tongue of yours to work on my pussy.”</i>");
	//Merge
	//Pussy exposed - no new PG
	if(!pc.isCrotchExposed()) output(" You reach down to your proudly displayed slit" + (pc.totalVaginas() > 1 ? "s":"") + ", sliding your palm gently across the lusty mound" + (pc.totalVaginas() > 1 ? "s":"") + " before slowly spreading " + (pc.totalVaginas() == 1 ? "it":"one") + " open with two fingers to reveal the [pc.vaginaColor " + x + "] interior.");
	//Not exposed - no new pg
	else output(" You peel out of your clothing to reveal the contours of your [pc.vaginas]" + (pc.hasCock() ? " and [pc.cocks], though you keep your fingers squarely around the former. Dicks are fun, but you’ve got a serious desire to feel this kitty’s thick, wet tongue.":". With a slow, teasing gesture, you reach down to spread " + (pc.totalVaginas() == 1 ? "your lips":"one’s lips") + " wide, revealing your [pc.vaginaColor " + x + "] interior."));
	//Moirge
	//HP win
	if(enemy.HP() <= 1)
	{
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " nods all too seriously. <i>“Okay...”</i> [enemy.HeShe] crawls forward unsteadily" + (enemy.biggestTitSize() >= 12 ? ", nearly tipping over from the weight of [enemy.hisHer] own jiggling tits":"") + ". [enemy.HisHer] visor shuts off to give [enemy.himHer] a better view, and [enemy.hisHer] wide, feline eyes drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. The slits of [enemy.hisHer] pupils widen in unexpected desire. <i>“That’s... a really nice pussy.”</i> [enemy.HeShe] licks [enemy.hisHer] lips" + (enemy.hasCock() ? ", the distention in the crotch of [enemy.hisHer] suit engorging until it splits apart to reveal the silvery length of [enemy.hisHer] cybernetic breeding tool.":", the silver of [enemy.hisHer] suit splitting apart to reveal two hard nipples."));
	}
	//Lust
	else
	{
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " scrabbles forward madly" + (pc.biggestTitSize() >= 12 ? ", [enemy.hisHer] heavy tits jiggling and bouncing as [enemy.hisHer] armored suit pulls back to expose them":"") + ". <i>“Yessss!”</i> [enemy.HeShe] shuts down [enemy.hisHer] holovisor for a better view, allowing [enemy.hisHer] lust-dilated eyes to drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. <i>“I am going to eat the fuck out of this.”</i> [enemy.HeShe] licks [enemy.hisHer] lips, drooling slightly." + (enemy.hasCock() ? " The corded silver of [enemy.hisHer] armored suit splits at the crotch to reveal an equally reflective piece of cybernetic genitalia - all thirteen inches of throbbing robo-cock.":"") + " A too-pleased giggle announces just how happy this turn of events has made [enemy.himHer]. <i>“You have the prettiest pussy on station.”</i>");
	}
	//Merge
	output("\n\n" + (enemy.lust() >= enemy.lustMax() ? "<i>“Thank you.”</i>":"Flatterer.") + " You can wait no longer. Grabbing [enemy.himHer] by the back of the head, you push the kaithrit’s face into your [pc.vagina " + x + "], smashing [enemy.hisHer] cutely twitching nose into [pc.oneClit] and [enemy.hisHer] cheeks into your [pc.thighs]. [enemy.HisHer] lips are already wet, though whether [enemy.heShe] kept them that way for your pleasure or merely accepted a gift from your own ");
	if(pc.vaginas[x].wetness() < 3) output("wonderfully moist");
	else if(pc.vaginas[x].wetness() < 4) output("wonderfully wet");
	else if(pc.vaginas[x].wetness() < 5) output("beautifully drenched");
	else output("wonderfully drooling");
	output(" cunt remains unclear. You hold [enemy.himHer] in a two-handed grip, careful of [enemy.hisHer] cybernetic antenna, and rock [enemy.himHer] back and forth, your [pc.hips] rolling, sending sparks of delightfully dominant pleasure coursing up your spine.");
	output("\n\nA spear of warm flesh shatters your concentration and coordination with a single thrust. The cyber-kitty clearly has no qualms about going tongue deep. As your hands fall away, [enemy.heShe] presses forward all the harder, pushing inch after inch deeper. The muscular organ is surprisingly strong and coordinated. It burrows and twirls with ease. Sometimes it undulates in horizontal waves that leave your [pc.vagina " + x + "] quivering and your heart hammering. With how deep it is and how it casually manhandles your passage, you feel almost like a marionette, twitching on its strings.");
	//Puffy pussy -Andor equine?
	if(pc.hasPlumpPussy(x) || pc.vaginas[x].type == GLOBAL.TYPE_EQUINE)
	{
		output("\n\nYour insides aren’t the only place your cunt-hungry kitten tends to either. [enemy.HisHer] hands come to rest at either side of [enemy.hisHer] face, thumbs on the chubby exterior of your outer lips. With a pussy as fat and swollen as yours, [enemy.heShe] can all but lose [enemy.hisHer] face on the inside while massaging the exterior portions with [enemy.hisHer] thumbs. The digits slip and slide across your rubbery, hyper-engorged flesh as if they can’t quite believe there’s that much cunt to play with, that much pussy to adore, and then they settle into place, pressing and rubbing in small, blissful circles.");
		output("\n\nEvery caress produces a sopping wet squelch.");
	}
	//Big Clit
	if(pc.clitLength >= 2)
	{
		output("\n\nYour [pc.clit] isn’t ignored either" + (pc.totalClits() > 1 ? " (at least, not all of them)":"") + ". When your cat-eared lover thrusts [enemy.hisHer] tongue, [enemy.hisHer] head rocks back, dragging [enemy.hisHer] nose along the underside. You clench in delight as you realize that no only is [enemy.heShe] fucking your slit - he’s grinding [enemy.hisHer] face into your oversized button, spreading your fragrant juices further and further across [enemy.hisHer] eager, cunt-drunk face.");
		//Cocksize clit (added on)
		if(pc.clitLength >= 5) output("\n\nYou nearly cum when a hand reaches up to curl around your oversized feminine anatomy. The too-sensitive clitoral flesh was never meant to be so large or stimulated so strongly. [enemy.HisHer] fur is like a silky sleeve for your throbbing girl-boner. You’d be drooling cum into [enemy.hisHer] palm if it were a dick" + (pc.hasCock() ? ". As it is, that’s happening a bit higher":"") + ". The gigantic love-button strains and flexes, but [enemy.heShe] expertly controls it, licking all the while. The security operative knows [enemy.hisHer] way around your anatomy, and your body loves [enemy.himHer] for it.");
	}
	//Balls
	if(pc.balls > 0)
	{
		output("\n\nStill slurping and sucking, the thirsty kaithrit shows no signs of caring that your [pc.sack] is resting on [enemy.hisHer] head, not even when your [pc.balls] clench or twitch. [enemy.HeShe] looks so silly, ");
		if(pc.ballDiameter() < 4) output("wearing " + (pc.balls == 1 ? "it":"them") + " as a hat");
		else if(pc.ballDiameter() < 7) output("half-buried in ball" + (pc.balls > 1 ? "s":""));
		else if(pc.ballDiameter() < 10) output("nearly buried in ball" + (pc.balls > 1 ? "s":""));
		else output("buried in ball" + (pc.balls > 1 ? "s":""));
		output(".");
	}
	//Cock - no new PG if balls.
	if(pc.hasCock())
	{
		if(pc.balls == 0) output("\n\n");
		else output(" ");
		output("Your [pc.cocks], sadly, get" + (pc.cockTotal() == 1 ? "s":"") + " no such attention. " + (pc.cockTotal() == 1 ? "It twitches":"They twitch") + " all alone above, unattended by your fuzzy-eared partner. It’s only when " + (pc.cockTotal() == 1 ? "it leaks":"they leak") + " pre-cum that you finally cave in and grab hold, pumping and groaning, so turned on by the tongue’s skillful manipulations that you can’t help but masturbate.");
	}
	if(enemy.lust() >= enemy.lustMax())
	{
		//Enemy lost by lust and is male
		if(enemy.hasCock()) output("\n\nHeavy slapping sounds signal that something far lewder is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kitty-boy’s feet cradling his cock, pumping up and down it, his toes curled tightly around his gleaming chrome cock-head. The strokes match the pace of his tongue perfectly, like in his head its his dick that’s sinking so deeply into your folds, causing you to moan with such sweet happiness.");
		//Enemy lost by lust and is female
		else output("\n\nA second set of lurid squelches signals that something just as lewd is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kittenish woman’s incredible flexibility. She has one foot bent almost double, thrusting a few of her fluffy toes deep into her own cunt. The strokes perfectly match her tongue’s motions, like she’s substituting one limb for another. Maybe that’s why she’s so good with her tongue. She just folds herself in half and just licks herself into ecstasy.");
	}
	//Merge orgasm
	output("\n\nEverything changes when the augmented kaithrit’s tongue twists itself into a helix. Every part of your pussy is stimulated: the top, bottom, sides, and even your g-spot. What’s more, it makes you feel completely full, and it’s slowly uncoiling, widening to open you up further and further. You cry out in sudden ecstasy as it all becomes too much. With a scream of insensate bliss, you cum.");
	if(!pc.isSquirter()) output(" [pc.GirlCum] trickles into [enemy.hisHer] waiting maw and slicks [enemy.hisHer] cheeks.");
	else 
	{
		output(" [pc.GirlCum] floods [enemy.hisHer] waiting maw and bulges [enemy.hisHer] cheeks. Excess splatters across the rest of [enemy.hisHer] face until [enemy.heShe]’s glazed");
		if(pc.girlCumQ() >= 3000) output(", and you’re barely getting started. You gird [enemy.himHer] in girlish lust and leave [enemy.himHer] kneeling in a puddle of it");
		output(".");
	}
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] squirt" + (pc.cockTotal() == 1 ? "s":"") + " sympathetically, emptying your [pc.balls] into [enemy.hisHer] hair");
		if(pc.cumQ() >= 3000) 
		{
			output(" and ");
			if(!pc.isSquirter()) output("a new");
			else output("the");
			output(" puddle");
		}
		output(".");
	}
	output("\n\nYou stumble back as your [pc.vaginas] steal" + (pc.totalVaginas() == 1 ? "s":"") + " your attention from the rest of your muscles, the long tongue swirling and twirling as it slides out, flicking droplets of passion and saliva into a airborne spray. The cat-[enemy.boyGirl] sits there stunned");
	if(enemy.lust() >= enemy.lustMax())
	{
		if(enemy.hasCock()) output(", leaking [enemy.hisHer] own cum all over [enemy.hisHer] toes");
		else if(pc.hasVagina()) output(", quivering with half her foot lodged in her quim while she cums");
	}
	else output(" for a moment before [enemy.heShe] begins to masturbate, too impassioned to hold back any longer");
	output(".");
	output("\n\nSighing happily, you step away and wipe a bit of sweat from your brow. The security operative looks a lot more like a security slut, glazed in your juices as [enemy.heShe] is. [enemy.HeShe]’s in no shape to stop anyone from going anywhere but balls-deep in [enemy.hisHer] ass in the near future... and honestly, [enemy.heShe] might like that. ");
	if(pc.isBimbo()) output("You smile sweetly. <i>“Like wow! You’re super good at licking pussy. Maybe you should just do that instead of trying to be like, mean and stuff!");
	else if(!pc.isAss()) output("You mumble, <i>“Thanks,”</i> wondering if [enemy.heShe]’s in any shape to understand. In the end, you suppose it doesn’t matter either way.");
	else output("What a slut.");
	output("\n\nGathering up your equipment, you spare a brief glance at your foe’s belongings for any prizes before you go.");
	processTime(25);
	enemy.girlCumInMouth(pc);
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}

//Facefuck - Either
public function faceFuckDatPussy(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Don’t worry, " + enemy.mf("mister","miss") + " kitty cat. I’m just gonna use your mouth a little, but it’ll be totally fun!”</i>");
	//Bro
	else if(pc.isBro()) output("You hook your finger the modded up feline’s mouth and rudely swab it around. <i>“This’ll do.”</i>");
	//Nice
	else if(pc.isNice()) output("You gently but firmly inform the defeated feline that while you aren’t going to hurt or abuse [enemy.himHer], you do expect [enemy.himHer] to make up for the trouble [enemy.heShe]’s caused with [enemy.hisHer] mouth and tongue.");
	//Misch
	else if(pc.isMischievous()) output("<i>“I’ve got good news and bad news for you, kitty-cat. The good news is that I won’t hurt you. I’m just gonna fuck your mouth. The bad news is that I’m going to leave afterward, so we won’t get to snuggle.”</i>");
	//Hard
	else output("<i>“You’re jaw’s going to be sore when we’re finished here, kitty-cat. I deserve a little payback for the trouble you’ve caused.”</i>");
	//Merge
	//Unexposed no new pg
	if(!pc.isCrotchExposed()) 
	{
		output(" It’s time [enemy.heShe] saw what [enemy.heShe]’s going to be servicing. You whip it out, all " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of [pc.cockNoun " + x + "].");
		if(pc.isErect()) output(" It’s already hard." + (pc.hasPriapism() ? " You couldn’t go soft if you wanted to right now.":""));
		else output(" Simply extracting it was enough to bring you to full hardness.");
	}
	//Exposed no new pg
	else output(" Already delightfully exposed, you give your " + (!pc.isErect() ? "increasingly rigid":"straining") + " erection a squeeze and a shake, aiming it straight at the pirate’s face.");
	//Merge
	//Not Lust
	if(enemy.lust() < enemy.lustMax())
	{
		output("\n\nLike a teenager on prom night, [enemy.hisHer] eyes go wide, not in shock or rage or denial... but in desire. [enemy.HeShe] licks [enemy.hisHer] lips, then tilts [enemy.hisHer] head and licks them again. Despite [enemy.hisHer] exhaustion and mild injury, [enemy.heShe] leans a little closer and lets [enemy.hisHer] ears flop back submissively. The holographic band across [enemy.hisHer] eyes fades away to give [enemy.himHer] a better view. [enemy.HisHer] nose wrinkles as [enemy.heShe] takes in your scent. At last, [enemy.heShe] looks back up with a blushing smile. <i>“This... I don’t mind. It’s a nice dick.”</i> [enemy.HeShe] licks [enemy.hisHer] lips again. <i>“Very nice.”</i>");
	}
	//Lust
	else
	{
		output("\n\nLike a thirsty galotian, [enemy.hisHer] eyes light up and lock on like the targeting system of a dick-seeking missile. <i>“I get to suck this?”</i> The holographic band across the kaithrit’s eyes fades away to give [enemy.himHer] an unobstructed view. <i>“Mmm... all of this...”</i> [enemy.HeShe] sniffs at it, nose twitching gently, then scooches even closer, [enemy.hisHer] ears falling back in contented submission. <i>“I don’t mind. " + (pc.cocks[x].cLength() < 12 ? "It’s not stupid huge like what those jumpers pack.":"It’s not undersized like one of those rodenian rats. A little jaw-stretching will be... fun.") + "”</i> [enemy.HeShe] licks lips so that they shine. <i>“So fuck my face already, big [pc.guyGirl].”</i>");
	}
	//Merge
	output("\n\nYou need no further invitation. Grabbing the security operative by the back of the head (and careful of [enemy.hisHer] implants) you tug [enemy.himHer] forward onto your [pc.cock " + x + "]. [enemy.HeShe] doesn’t struggle - anything but. [enemy.HisHer] mouth opens wide and [enemy.hisHer] tongue rolls out, offering you a slick red carpet to slide your [pc.cockHead " + x + "] across on its journey to adoring oral service. [enemy.HisHer] [enemy.lipsChaste] feel wonderful, closing just tight enough to form a spit-slick seal once you’ve pushed past them and [enemy.hisHer] tongue... oh stars!");
	output("\n\nThe kaithrit’s tongue bolts out of [enemy.hisHer] mouth like a living serpent, sliding out two inches for each one you add. This crossways motion assaults you with double the friction along your sensitive underside, like half your dick is slowly pumping in while the other half is midway through a real jack-hammering hummer. You gasp, then moan, then stop moving at all, content to revel in the sensation of that slick flesh spooling out - for now. You float on a curtain of undulating muscle, surrounded by the embrace of spit-slick lips.");
	//Nice
	if(pc.isNice())
	{
		output("\n\nYou may have claimed [enemy.hisHer] mouth by force, but you’re not an asshole about it. You pause and simply savor it. No need to be rough when the kaithrit is slobbering [enemy.hisHer] tongue all over you, looping around into an organic snare. [enemy.HeShe] looks up at you imploringly, all but begging you to fuck [enemy.hisHer] face.");
		output("\n\nSo be it.");
	}
	//Misch
	else if(pc.isMischievous())
	{
		output("\n\nYou take a moment to appreciate the glorious position which you now occupy. Your enemy is bested and making up for the inconvenience with [enemy.hisHer] mouth, [enemy.hisHer] slobbering tongue fully extended and looping itself around your girth in an organic snare. Amazing as it feels, it could be better. [enemy.HeShe] can handle a little more, right?");
	}
	//Hard
	else output("\n\nLike a conquering warrior, you pause in the moment of your victory to savor it - until the kaithrit runs out of slobbering tongue to extend and settles for looping it around you in an organic snare.");
	//Merge
	output("\n\nYou fuck the punky security operative’s overlong muscle back into [enemy.hisHer] mouth with a single mighty push. Spit dribbles from [enemy.hisHer] cheeks in sudden surprise, and [enemy.heShe] lets out a single inarticulate gurgle. " + (pc.cocks[x].cLength() < 12 ? "Running your fingers through [enemy.hisHer] hair, you admire your prize. [enemy.HisHer] hot breath is washing over your [pc.thighs] and [pc.belly]. [enemy.HisHer] tongue squirms and wriggles beneath your [pc.knot " + x + "]. The longer you hold [enemy.himHer] there, the more comfortable [enemy.heShe] seems, and all too soon, the slut-cat’s cheeks are rhythmically hollowing with eager suckles.":"Running your fingers through [enemy.hisHer] hair, you admire your prize, impaled partway down your length. [enemy.HeShe] can’t take the whole thing. There’s simply too much [pc.cockNounSimple " + x + "] for [enemy.hisHer] untrained throat to handle, no matter how [enemy.heShe] tries. [enemy.HeShe] can grab at your [pc.butt] and strain, water streaming down [enemy.hisHer] eyes, but [enemy.heShe] only manages another inch or two at the most.\n\nGood for [enemy.himHer]. Maybe next time you bump into [enemy.himHer], [enemy.heShe]’ll be a little better at it."));
	//Low libido
	if(pc.libido() < 50) output("\n\n[enemy.HisHer] tongue refuses to let you go. It loops around and around even as you draw back, muscle coiled into a helix of cock-milking pleasure such that you can’t even tug your [pc.cockHead " + x + "] the whole way out. You’re <i>forced</i> to thrust yourself back inside by the thirsty kaithrit. [enemy.HisHer] sloppy, silken maw demands it. Like a sexual tractor beam, it inexorably pulls you onward. It compels you to fuck [enemy.himHer] faster than you meant to. Harder.");
	//High libido
	else output("\n\[enemy.HisHer] tongue clings on tightly as launch into motion. Even when you draw back, [enemy.hisHer] muscle squeezes into a helix of cock-caressing pleasure that feels so sensually compelling that your [pc.cockHead " + x + "] never quite manages to leave [enemy.hisHer] mouth - not that you ever had any intent to do so. You slam your hips forward and back, spearing your turgid length through this frothing, cutely pursed lips with glee. [enemy.HisHer] mouth is just so <i>fuckable</i>! You’d be jackhammering [enemy.hisHer] face even if [enemy.hisHer] tongue wasn’t lavishing you with heavenly sensations.");
	//Merge
	//Longdick jacking
	if(pc.cocks[x].cLength() > 12)
	{
		output("\n\nA soft-fingered hand wraps around the exposed length of your too-big dick with a sort of desperate affection. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles at its absolute limit, but [enemy.heShe] strokes all the same. [enemy.HeShe] jacks the extra dick like [enemy.heShe] can’t wait for you to bust a big, sloppy nut into [enemy.hisHer] mouth. [enemy.HeShe] strokes and [enemy.heShe] squeezes, adding a second hand to better please the jaw-straining boner. Leaking drool and pre provide plenty of pre-cum for [enemy.hisHer] nimble digits to work with as they wring you toward bliss.");
	}
	//else Second dick jacking
	else if(pc.cockTotal() > 1)
	{
		output("\n\nA soft-fingered hand wraps around " + (pc.cockTotal() == 2 ? "your other":"another") + " dick with a sort of desperate firmness. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles, slowly pumping that second cock. [enemy.HisHer] fingers curl and squeeze. [enemy.HisHer] palm, slick with sweat, glides effortlessly across the veiny length. At the apex of your thrusts, [enemy.heShe] squeezes tighter. When you draw back, [enemy.hisHer] grip relaxes. In no time at all, [enemy.heShe]’s twirling a finger in small circles just below the [pc.cockHead " + x + "], smearing a dribble of pre-cum into your bare, musky maleness.");
	}
	//Sheath Fingering?
	if(pc.hasSheath(x))
	{
		output("\n\nJust when you think it can’t get any better, a fingertip wriggles into your [pc.sheath]. A second chases after it a second later" + (pc.cocks[x].cLength() < 12 ? ", and then a tongue too":"") + ". The invaders probe your most sensitive locale with reckless abandon, pressing on hypersensitive nerves not meant to be pressed. Bolts of maddening pleasure race up your spine while the depraved pussycat explores the slick interior of your straining cock-holster. One finger wiggling back and forth brings you to a dangerously orgasmic edge, your whole middle clenching and flexing.");
	}
	//Pussy fingering
	if(pc.hasVagina()) output("\n\nA single intrusion into your [pc.vaginaNoun] nearly steals the strength from your [pc.legOrLegs]. That’s all your overheated entrance needed to light up like a town square Christmas tree, glowing and pulsing and thrumming with pure joy. You whine in the back of your throat, somehow continuing to face-fuck the cat-eared operative, but thrilling at the sudden appearance of a second finger. It pushes you to the very edge of bliss, then swirls you back and forth across the precipice for what feels like ages.");
	//Ball fondling
	if(pc.balls > 0) output("\n\nYour bouncing nut" + (pc.balls > 1 ? "s":"") + ", churning up a thick load of [pc.cumNoun], soon find" + (pc.balls == 1 ? "s itself":" themselves") + " in possession of a pair of eager palms. The kaithrit’s hands abandon everything else to pay homage to your lust-fattened orb" + (pc.balls > 1 ? "s":"") + ", stroking and squeezing, gently caressing the underside of your sack in an effort to coax an even larger orgasm from you. It feels like it’s working too. You feel heavier and tighter the longer [enemy.heShe] fondles. Pre dribbles freely into [enemy.hisHer] mouth in thicker and thicker quantities.");
	//Ball milking?
	if(pc.balls > 1 && pc.ballDiameter() >= 5)
	{
		output("\n\nYour tremendously weighty nuts wobble back and forth with tremendous mass. They slap into the kaithrit’s collarbones aggressively, jiggling and jostling. [enemy.HeShe] swiftly abandons everything else to get [enemy.hisHer] hands on your oh-so-virile orbs, wrapping [enemy.hisHer] fingers possessively around your cum-swollen balls as if to claim the contents for [enemy.himHer]self. [enemy.HeShe] smothers them into [enemy.hisHer] face, drowning [enemy.himHer]self in your ball-musk, even while taking a dick-deep into [enemy.hisHer] throat.");
		output("\n\nThis cat is a real nut-slut! [enemy.HisHer] fingers sink into the capacious flesh as [enemy.heShe] sets into worshipping your [pc.balls], massaging them imploringly, begging them to brew up the fattest, thickest load of cum the galaxy has ever seen. Yet even with both hands, [enemy.heShe] can’t quite handle your rebellious sack or the fluid contents within. It wobbles dangerously with your ecstatic clenches. The more [enemy.heShe] plays with your balls, the more unstable they become, contracting and squeezing - so tight and heavy!");
	}
	//Merge
	output("\n\nYou’re so close!");
	output("\n\nThe kaithrit’s tongue tightens up abruptly, leaving you no time to think or react - only to swell in exquisite ecstasy. You cum straight into the capable little cock-sucker’s mouth. Pumping hard, you pound [enemy.hisHer] face through your climax, exactly the way [enemy.heShe] so clearly wants it. Tears stream from [enemy.hisHer] eyes while [pc.cumVisc] goo ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 5) output("dribbles");
	else if(cumQ < 30) output("spurts");
	else if(cumQ < 300) output("pours");
	else if(cumQ < 1000) output("erupts");
	else if(cumQ < 5000) output("floods");
	else output("drowns");
	output(" [enemy.hisHer] throat.");
	if(cumQ >= 500)
	{
		output(" Watching [enemy.hisHer] cheeks bulge");
		if(cumQ >= 5000) output(" before giving out and releasing [pc.cumColor] sprays from the corners of [enemy.hisHer] mouth");
		output(" is a delight.");
	}
	if(enemy.hasCock()) output(" Meanwhile, a puddle of ignored, kittenish semen spreads below, hardly noticed.");
	//Second+ dick & 10+ mLs
	if(pc.cockTotal() > 1 && cumQ >= 10)
	{
		output("\n\nYou grab hold of your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " and make sure the rest of your orgasm goes exactly where it belongs: over [enemy.hisHer] ears and into [enemy.hisHer] hair");
		if(cumQ >= 500) output(", across [enemy.hisHer] forehead and down the tip of [enemy.hisHer] flaring nose");
		output(".");
		if(cumQ >= 1000) output(" Pretty much everywhere.");
		if(cumQ >= 5000) output(" You paint the kitty-[enemy.boyGirl] with your load inside and out until [enemy.heShe] is completely, thoroughly basted in cock-juice.");
	}
	output("\n\nYou push the cock-addled kaithrit away after achieving satisfaction. [enemy.HeShe] looks up at you dimly, panting lustily, like swallowing all that cum forced [enemy.hisHer] obviously cybernetic brain to begin a very thorough rebooting process. All pride or resistance is gone.");
	output("\n\nWhile you give [enemy.hisHer] possessions a quick search, you are confused by the satisfied expression on [enemy.hisHer] face as [enemy.heShe] simply licks [enemy.hisHer] lips and paws at [enemy.hisHer] lust-reddened genitals.");
	processTime(30);
	pc.orgasm();
	enemy.loadInMouth(pc);
	output("\n\n");
	CombatManager.genericVictory();
}

//Taur servicing
//By Wsan
public function wsanTaurServicingLoss():void
{
	clearOutput();
	author("Wsan");
	IncrementFlag("SECOP_TAURSLUTTINGS");
	showName("‘TAUR\nSERVICE");
	output("Chaos reigns. Jostled from every side as people continually brush past you, knock into you, and almost send you spinning like a top, the din of metal clashing thunders in your ears. A rough hand squeezes your arm and turns you around to gaze into the displeased visage of a gruff-looking older ausar man wearing a chef’s hat.");
	output("\n\n<i>“What are you doing just standing around?! Get this out to table seven!”</i> he barks in your face, practically tossing clinking plates into your arms.");
	output("\n\nCompared to the noise of the kitchen, the setting out here is positively peaceful. Pleasantly modulated lights provide a dim ambience, your trip taking you past various tables and their servers in various states of undress. You wind up in the outdoor area, walking down an idyllic paved pathway flanked by various beautiful forms of greenery, ferns and bushes alike. Lifting a particular large frond leaf out of the way, you finally find your destination - four tauric women sitting at a table, sipping their drinks and chatting next to the pond.");
	output("\n\nYou give them a friendly smile of greeting - the extent of your allowed ‘initiative actions’ as dictated by policy - and begin depositing their meals in front of them, listening to the girls talk.");

	//Coco - small dick, huge balls. ‘Coke bottle’
	//Prue - tiny girl, horsecock
	//Kay - dogcock, likes to knot boys
	//Jenny - friendly, no cock
	if(pc.isTaur()) output("\n\n<i>“Oh, wow,”</i> the blonde one says, smiling at you. <i>“I didn’t know they had ‘taur staff here. Do you think they sent [pc.himHer] out here just for us?”</i>");
	else output("\n\n<i>“Oh, wow,”</i> the blonde one says, smiling at you. <i>“They sent us a real cutie, huh?”</i>");
	output("\n\n<i>“Oh, my God. Do you think they’ll let us stand up to breed [pc.himHer]?”</i> the woman with black hair murmurs, eyes roving over you. <i>“Can you do that here?”</i>");
	output("\n\n<i>“Isn’t the point to let them service you while you eat? I didn’t see any of the other tables doing it...”</i> the brown-haired one says hesitantly, looking around the table.");

	if(!pc.hasVagina()) output("\n\n<i>“You can’t breed a boy, Kay,”</i>");
	else output("\n\n<i>“She’ll be on contraceptives, Kay,”</i>");
	output(" the shortest girl sighs, rolling her eyes." + (!pc.hasVagina() ? " <i>“Even if you try really hard.”</i>":" <i>“All of them are.”</i>"));

	output("\n\n<i>“Y’never know,”</i> the black-haired leithan girl presumably called Kay replies, grinning. <i>“I know I said I wasn’t that hungry when we came out, but now I’m all </i>kinds<i> of hungry. [pc.heShe] looks delicious.”</i>");
	output("\n\n<i>“Well, the rest of us are starving for actual food,”</i> the short girl says, amusedly putting her fork into the steak you brought her, <i>“so the least you could do is wait a bit. Get the actual experience before you get us kicked out.”</i>");
	output("\n\n<i>“Fiiine,”</i> Kay says, sighing and leaning back in dramatic defeat before sulking over the table. <i>“You’re never any fun, Prue.”</i>");
	output("\n\n<i>“Wach yo’ mouf,”</i> the short girl replies through a mouthful of steak while she jabs a fork at Kay. She swallows before continuing. <i>“I share all the boys that come by the apartment and that’s all you’re getting outta me.”</i>");
	output("\n\n<i>“That does count as fun,”</i> the blonde agrees, nodding. She beams at you, practically glowing with radiance. <i>“Hi, I’m Jenny. Come sit here!”</i>");
	output("\n\nShe pats the ground next to her and leans against you with the ease of a social butterfly once you’ve settled there, pointing at each of her friends. <i>“Kay’s a real type A kind of girl, but she’s the best. And Prue is her roommate!”</i> She turns to you and whispers, eyes wide. <i>“Isn’t she adorable?”</i>");
	output("\n\n<i>“I can hear you, Jenny,”</i> Prue sighs in exasperation, ears flicking atop her head. <i>“Stop telling people I’m cute.”</i>");
	output("\n\n<i>“Awww, but I can’t help it!”</i> Jenny whines before resuming her little tour, seemingly enjoying describing her friends to you. <i>“Then the quiet one with brown hair next to Prue is Coco. She’s a little shy, but she’s my best friend. We all met in highschool! So, that’s a start,”</i> she says, putting a hand on your shoulder with a grin. <i>“But you already know how to get better acquainted with us, right?”</i>");
	output("\n\nYou do. Kay snorts with laughter as Jenny turns her body to the side, lifting her skirt with her tail and presenting her immaculate behind. You can see a slick, juicy black pussy between her hindlegs, gleaming with wetness.");
	processTime(10);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",wsanTaurServicingLoss2);
}

public function wsanTaurServicingLoss2():void
{
	clearOutput();
	showName("‘TAUR\nSERVICE");
	author("Wsan");
	output("<i>“Classic Jenny. Always with the silver tongue,”</i> Kay says, shaking her head. <i>“Get the boys </i>and<i> girls eating out of your hand then into your bed.”</i>");
	output("\n\n<i>“It’s nice to be nice!”</i> Jenny says, picking up her fork and eating while you bring yourself lower to the ground to start serving her. <i>“I like it.”</i>");
	output("\n\n<i>“Mmhm,”</i> Coco nods, already a quarter done with her mountain of food. You notice her watching Jenny’s face from the corner of her eye as you dip your tongue into leithan marepussy, savoring the taste. The genial blonde girl lets out an unconscious sigh of satisfaction while she eats and Coco quickly focuses back on her food, blushing a little.");
	output("\n\nYou adjust yourself so that you’re lying sideways with your face parked right in front of Jenny’s winking, scented muff, her needy pheromones permeating your immediate surroundings. They fill you with warmth, the need to serve and service, and you couldn’t be more happy to do so. She gasps when you press into her, squishing your nose between her curvy buttcheeks and shoving your tongue right inside her squeezing cunt.");
	output("\n\n<i>“Jeez! [pc.heShe]’s not shy about making n-new friends, huh?”</i> she remarks to the table.");
	output("\n\n<i>“Obviously not,”</i> Prue murmurs, watching you from over the top of her glass as she takes a sip.");
	output("\n\nDetermined to show her a good time, you enjoy a feast of your own, sucking on her thick, rubbery lips and running your tongue over her gumball-sized clit at the bottom of her hot pink insides. The sheer restraint she displays is impressive, but cracks in the facade begin to show after a couple of minutes of hard work, the leithan girl leaning on the table hard for support.");
	output("\n\n<i>“D-does it feel good?”</i> Coco asks her timidly.");
	output("\n\n<i>“U-uh, [pc.heShe]’s really good,”</i> Jenny admits, breathing hard through her nose. <i>“Jeeez!”</i>");
	output("\n\n<i>“Your nips are tenting your top,”</i> Kay points out with a lewd smirk. <i>“That’s cute.”</i>");
	output("\n\n<i>“Hold up, I-I think I’m gonna-”</i> Jenny groans, wincing. <i>“Uh- uuuhhhnnn!”</i>");
	output("\n\nWith a loud, sensual moan, she cums hard in front of all her friends, her ass shaking and flexing with the effort. You’re squeezed between her cheeks and tongue-trapped in her tight, spasming marecunt, her soft walls enveloping you as femcum splatters your face and drips down your chin.");
	output("\n\n<i>“Well, not like she tells anyone upfront...”</i> Kay says, idly watching the spectacle.");
	output("\n\n<i>“But Jenny’s a huge squirter,”</i> Prue finishes, nudging Coco. <i>“Wanna go next with me?”</i>");
	output("\n\nCoco breathes hard, unabashedly watching Jenny struggle through the orgasm washing over her. You squeeze the cumming leithan’s ass with your hands to make her sing a little more forcefully, giving her some long bottom-to-top licks to finish her off while she squirts across your tongue.");
	output("\n\n<i>“Coco,”</i> Prue hisses, jabbing her with an elbow a little more forcefully this time. The brunette starts, jumping in surprise as Jenny lets out a last moan of bliss and you lift yourself from her sated pussy, leaving her to slump over her plate of food sweaty and panting.");
	output("\n\n<i>“Oh! I- what did you say?”</i> Coco asks Prue, confused.");
	output("\n\n<i>“I asked if you wanted to go next,”</i> Prue says, wiggling a finger at you. <i>“C’mere.”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",wsanTaurServicingLoss3);
}

public function wsanTaurServicingLoss3():void
{
	clearOutput();
	showName("‘TAUR\nSERVICE");
	author("Wsan");
	output("Prue gets up from the table and as you circle around to sit between them, you find they’re both packing a little something extra. In Coco’s situation the term ‘little’ seems appropriate, her horsecock only six inches long despite being as thick as a soda can, but her balls are utterly enormous. She twitches nervously as you stare in open disbelief, averting her gaze while you check out her massive nads. Each one of them is the size of a melon, hanging low in her sack, their weight readily evident just from an eye test.");
	output("\n\n<i>“We call her ‘coke bottle’ ‘cuz if you shake her up she’ll make a real mess,”</i> Kay helpfully informs you.");
	output("\n\n<i>“Kay!”</i> Coco says, embarrassed, while the black-haired woman laughs good-naturedly.");
	output("\n\n<i>“Relax and have some fun,”</i> Kay says, rubbing Coco’s head. You don’t hear what she says next because you’re staring in shock at Prue’s three-foot equine cock, scarcely believing your eyes.");
	output("\n\n<i>“Cat got your tongue?”</i> Prue says, smirking. <i>“Don’t worry, I’m actually really gentle. Kay’s the rough one.”</i>");
	output("\n\n<i>“The boys never complain,”</i> Kay says, shrugging.");
	output("\n\n<i>“Yeah, but you could at least go a little easier on them when it’s </i>three<i> in the morning and your roommate is trying to sleep!”</i> Prue huffs. <i>“Listening to a kaithrit guy mewling through the walls gets old.”</i>");
	output("\n\nYou ignore the girls’ friendly bickering, seeing an opportunity to really light up their night. Sliding your " + pc.mf("pants","skirt") + " down, you lie on your stomach in front of Coco, who eyes you nervously while Prue gets into position above you. You rub the stubby horsecock Coco presents you with, earning a quiet sigh of appreciation as it pumps with blood. She might be nervous, but she’s all too ready for this.");
	output("\n\nCraning your head forward, you take her between your [pc.lips] and give her a long, hard suck to start her off. Her immediate reaction is to let out a cute grunt and learn forward, her underside quivering. She’s <i>sensitive</i>. You let your tongue play all along her length, slathering her entire cock with saliva before you take it down your throat and kiss the skin of her underside.");
	output("\n\n<i>“That looks nice,”</i> Prue suddenly says from above, sitting down on top of you. With her weight spread evenly across her legs, the ‘tiny’ girl’s weight is hardly noticeable at all. <i>“Don’t skip me.”</i>");
	output("\n\n<i>“P-Prue,”</i> Coco moans, and you can spy her fingers white-knuckled underneath the table pressing upwards into it. She doesn’t know how to deal with how good it feels, poor girl. <i>“Uunnh...”</i>");
	output("\n\n<i>“See? Feels good to have a cutie’s mouth around your dick,”</i> Prue murmurs, shuffling forward and aligning herself. You can feel her big, blunt cockhead pressing at your [pc.vagOrAss], signalling your impending penetration. With a cock in your mouth and another pressing into you from behind, these two are about to make you airtight.");
	if(pc.hasVagina()) 
	{
		output(" <i>“I’ll leave [pc.hisHer] ass for you, Kay.”</i>");
		output("\n\n<i>“Daaaamn straight,”</i> Kay croons, picking meat off Prue’s plate. <i>“Can’t wait.”</i>");
	}
	output("\n\nPrue slides her massive slab of erect horsemeat into your fuckhole, distending it around her flare while you moan into Coco’s cock. She might be a small girl, but there’s a <i>lot</i> of pent-up power in those hips of hers. Soon enough she’s got you spread around her tree trunk of a dick, stretching you out both body and mind, leaving you feeling like you lack the mental capacity to even handle her. Luckily for you, her inexorable advance of little thrusts and cute moans creates enough back and forward motion that Coco doesn’t even notice your mindblown state, instead letting breathy sighs and pants escape her lips as Prue slides herself home.");
	output("\n\n<i>“Gooood, you’re tight,”</i> Prue grunts, lifting her hind half up a little to withdraw before gently sliding herself back home.");
	output("\n\n<i>“Isn’t everyone tight for you?”</i> Kay asks curiously, popping chips into her mouth.");
	output("\n\n<i>“Yeah, but... ugh. [pc.heShe]’s really something else.”</i>");
	output("\n\n<i>“P-Prue,”</i> Coco moans, knitting her hands together. <i>“I’m going to... to cum really soon...”</i>");
	output("\n\n<i>“Mmm, that’s fine, I’ve still got time,”</i> Prue mutters, starting to fuck you a little more meaningfully. <i>“Damn, that’s good.”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",wsanTaurServicingLoss4);
}

public function wsanTaurServicingLoss4():void
{
	clearOutput();
	showName("‘TAUR\nSERVICE");
	author("Wsan");
	output("You have what feels like two feet of flared horsecock inside your " + (pc.hasVagina() ? "stretched-out cunt":"taut asshole") + " but fuck if it doesn’t feel amazing to be servicing two beautiful girls at once. Thinking back on it, this is exactly why you took the job... the chance you might end up like this, erotically speared on two thick cocks as they pump inside your holes and threaten to fill you with thick, virile sperm. You begin to massage Coco’s enormous balls, rubbing her while she lets out a deep moan of satisfaction. You can actually feel them filling, slowly expanding with liquid weight, growing warmer in your hands by the second.");
	output("\n\n<i>“Hhh-huh, huh, hhhhnh,”</i> Coco pants, almost whining in need. She’s so <i>close</i>, you can feel her throbbing in your mouth, she just needs a little push over the edge...");
	output("\n\n<i>“Put a finger in her pussy,”</i> Jenny whispers in your ear. <i>“She looooves it.”</i>");
	output("\n\n<i>“Jenny?”</i> Coco groans. <i>“What... what are you-”</i>");
	output("\n\nShe suddenly stops, her back half tensing gradually until her entire body is rigid, then begins to shiver and shake.");
	output("\n\n<i>“Oh! OH! OH, GOD!”</i> Coco screams, opening her mouth wide and glancing breathlessly at Jenny. Her best friend watches her cum her brains out, elbow on the table and chin in her palm with a sexy smile on her face. <i>“FUCK! FUCK! FUCK! GOD!”</i>");
	output("\n\nHer cockhead instantly balloons to three times its previous size in your throat and a <i>waterfall</i> of slick equine cum surges from her widening cockhole. So fierce you can’t even put your tongue in front of the flow, all you can do is just open your throat for her use and let her cum herself to pieces. She hardly seems to be breathing at all, but you don’t have time to worry. Seeing her friend cumming so hard, a little bit of animal instinct ignites in Prue, the formerly self-titled ‘gentle lover’ suddenly bringing her modest hips down into you with significantly more force.");
	output("\n\nYou clutch Coco’s swollen sack with one hand and her pussy with the other and hang on for dear life as a stream of extremely thick, creamy spunk pours down your throat unendingly. Given the very blatant visual progress of her ball size, you’re going to be sucking her down for a <i>long</i> time. Time that Prue clearly intends to use to get herself off, her voice growing louder above you with every passing second. She’s rutting your fuckhole at full force now, slamming herself into your squeezing-tight {cunt/ring} with reckless abandon and moaning as loud as she can, indulging herself in animal instinct.");
	output("\n\nFace to face with a companion mired so deeply in the pits of debased pleasure, it doesn’t take her long to bust a massive nut inside you. Angling herself down and snorting savagely, she thrusts herself balls-deep inside you and squeezes them against your opening, all but forcefully emptying herself out into your " + (pc.hasVagina() ? "defenseless womb":"guts") + ". Gone is the cute, endearing shorty that was sitting at the table. In her place is a wild beast, stamping her hooves and grunting in release.");
	output("\n\n<i>“Poor Prue,”</i> Kay murmurs affectionately, patting her unaware friend’s head. <i>“She doesn’t even know what she’s doing right now.”</i>");
	output("\n\nYou can hardly hear her talking, so enamored are you with the seed splattering into your stomach and lining your insides. Your stomach has long since started to swell with the sheer mass of her liquid depositions, like you’re nothing more than a condom to be masturbated with and discarded, filled with wasted semen. Prue getting off just further exacerbates the issue, her sheer size meriting an orgasm proportional to that of a breeding stallion.");
	output("\n\nSomewhere in amongst it all, you cum yourself, your");
	if(pc.isHerm()) output(" stiff cock spewing jizz all over the ground while your crammed-full pussy milks Prue’s iron-hard dick even harder");
	else if(pc.hasCock()) output(" cock spurting jizz all over the ground, leaving a puddle of your own below you");
	else if(pc.hasVagina()) output(" your crammed-full pussy milking Prue for all she’s worth in the middle of her orgasm");
	else output(" your abused asshole milking Prue for all she’s worth in the middle of her orgasm");
	output(". Your gurgles and suckling moans go unheard over the two girls’ voices.");

	output("\n\nPrue’s the first to give out, slumping unconscious on top of you before Kay and Jenny helpfully lift her off your prone form. That just leaves you to swallow down every last drop Coco has to give you while her friends watch, smirking and occasionally picking at their plates. Their knowing grins drive you crazy and Coco crazier, her embarrassment utterly overridden by the fetishism of having them observe her ruthless seeding of your stomach.");
	output("\n\nBy the time she finishes cumming and falls down exhausted, you look like you’ve swallowed a beach ball." + (pc.biggestTitSize() >= 1 ? " Your breasts sit comfortably atop your cum-inflated stomach, perkier than ever thanks to the support of stretched-taut skin beneath them.":" Your skin is stretched taut, just barely managing to contain the virile liquid inside you.") + " Jenny looks at Kay and winks.");
	output("\n\n<i>“Guess it’s your turn, then,”</i> she says.");
	output("\n\n<i>“God, </i>finally<i>,”</i> Kay bursts out while Jenny giggles. <i>“Thought I was gonna be here all night.”</i>");
	output("\n\n<i>“Coco’s like that sometimes,”</i> Jenny replies, looking over at her KOed friend fondly and twirling her hair. <i>“I think it’s cute.”</i>");
	output("\n\n<i>“Yeah, well... hmm. Are you done eating?”</i> Kay asks her.");
	output("\n\n<i>“Huh? Yeah, I guess. Looks like our friend can’t swallow another bite either,”</i> Jenny says, winking at you.");
	output("\n\n<i>“Well, that’s too bad, ‘cuz I’m gonna have [pc.himHer] over the table until I make ‘em talk,”</i> Kay grunts, pulling you over to the table and bending you over.");
	output("\n\n<i>“Kay, don’t be rude,”</i> Jenny reprimands her.");
	output("\n\n<i>“It’s not </i>rude<i>,”</i> Kay says, poking her tongue out at her friend. <i>“I’m just gonna mark my territory.”</i>");
	output("\n\n<i>“Oh boy, here we go,”</i> Prue says wearily, recovering next to Jenny. <i>“All aboard the Kay-train.”</i>");
	output("\n\n<i>“Gonna fill you up from the other end now,”</i> Kay says, grinning wolfishly. <i>“Maybe it’ll all come out your mouth.”</i>");
	processTime(10);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",wsanTaurServicingLoss5);
}

public function wsanTaurServicingLoss5():void
{
	clearOutput();
	showName("‘TAUR\nSERVICE");
	author("Wsan");
	output("When the other two girls don’t react to that, you realize they’re in almost as deep as you are. They <i>want</i> to see her violate you, to rut you until seed comes spilling from back between your lips. She’s a strong, athletic stud, and they intend to enjoy watching her put on a show.");
	output("\n\n<i>“Hope you like dogcock,”</i> she murmurs to you privately. <i>“‘Cuz I got a huge one and a fat fucking knot with your name on it, cutie.”</i>");
	output("\n\nPolicy is to play up the reaction when you’re penetrated, but there’s no need. Three flushed faces watch you as your mouth hangs open and a deep, slutty moan of pleasure comes out, Kay’s tapered tip slides deep into your" + (!pc.hasVagina() ? " well-lubricated,":"") + " stretchy asshole, driving you forward before she catches you expertly with her middle set of legs. If Prue was a sledgehammer, Kay is a fucking piledriver. She’s on you like a thraggen in heat, holding you firm while she slams into your ass with ridiculous strength. You’d always knew ‘taurs had powerful hindlegs, but this is something else entirely...");
	output("\n\n<i>“Kay was on the track team,”</i> Jenny says, smiling. <i>“Mostly to bang the athletics boys, though.”</i>");
	output("\n\n<i>“And set the local records,”</i> Kay pants, grunting below her breath. <i>“But yeah, mostly for the boys." + (pc.mf("m","") == "m" ? " Like you, you sexy fucking whore.":"") + "”</i>");
	output("\n\nYou’re ruthlessly banged out in front of the three girls, Coco having risen from her stupor to sit alongside the other two and watch in amazement while you grit your teeth in pleasure and subject yourself to Kay’s merciless riding technique. She’s an expert in the saddle, that’s for sure, no doubt owing to her past experience. You’re already about to cum and she shows no signs of being close or even slowing down at all, sweat running down her body. Your eyes flutter closed as you feel yourself approach the peak when, suddenly, she stops completely, her cock buried in your ass. Your eyes spring open in surprise.");
	output("\n\n<i>“Say my name,”</i> Kay tells you quietly.");
	output("\n\n<i>“Typical Kay,”</i> Prue says, sighing.");
	output("\n\nYou’re <i>really</i> not meant to do that, but it’s that or she won’t fuck you. You know her type; she will absolutely not fuck you if you don’t submit, that’s for certain, and looking into the faces of her friends you can see they know too. It only takes a second for you to hang your head in surrender.");
	output("\n\n<i>“Kay...”</i> you moan quietly.");
	output("\n\n<i>“Thaaaat’s right,”</i> she sighs, sinking herself deeper. <i>“Don’t worry your little head, we’re not gonna </i>tell<i> anyone. We just wanted to make sure you knew you were my little fucking bitch. Now take it!”</i>");
	output("\n\nShe weighs down on you like a ton of bricks, but fuck if she can’t make you cum like a champion.");
	if(pc.isHerm()) output(" Your half-hard cock spurts all over the table, making a huge mess amidst their dinner plates while your well-used pussy sends Prue’s warm cum rolling down your shaking thighs with every flex");
	else if(pc.hasCock()) output(" Your half-hard cock spurts all over the table, making a huge mess amidst their dinner plates that Jenny idly dips a finger into and puts on her tongue");
	else if(pc.hasVagina()) output(" Your well-used pussy sends Prue’s warm cum rolling down your shaking thighs with every flex, eliciting an appreciative sigh from her");
	else output(" Your asshole clenches down on her so tightly that for a moment you can feel her fucking heartbeat through her cock, matching your own and beating like a drum inside you");
	output(". Kay snickers above you, taking pride in your obvious pleasure.");
	output("\n\n<i>“Glad you’re enjoying your ride, slut,”</i> she grunts. <i>“Now take the knot!”</i>");
	output("\n\nYou can’t help it. You scream in elation as she forces her enormous knot into your asshole, gaping you so wide you instinctively know you won’t be sitting down for weeks before she slips all the way in. You almost pass out when she begins to cum but manage by some miracle to stay standing, teetering on the edge of consciousness while she voids the contents of her hanging balls into your slick guts.");
	output("\n\nOnce she’s finally finished with you and lets you slump to the table, the other girls are on you like hyenas. They take from you everything you have to give and more, stripping you out of your clothes and ravaging your body until your eyes are rolling in your head and you’re cumming nonstop while they blow loads into your mouth and ass, all over your face");
	if(pc.hasHair()) output(" and in your hair");
	output(", and Kay finishes up by slamming her knot" + (pc.hasVagina() ? " all the way up your sloppy cunt and ejaculating into your womb":" all the way into your mouth and adding to the pool of ejaculate in your tummy") + ". Dinner lies completely forgotten, forsaken in the search to satisfy another hunger altogether.");

	output("\n\nIt’s not like the arrangement isn’t to your liking. Between the four centaur girls, you’re passed around and forced to cum from being penetrated top to bottom, Jenny’s marecunt rubbing across your face while you sink a fist into Prue’s asshole and stimulate her prostate from the inside. Then Coco’s mounting her best friend while she sucks Prue’s cock and you’re forced to watch from atop Kay’s cock, instructed to bounce on it and not stop until she cums inside you.");
	output("\n\nWhen the night finally ends, it finds you lying on your back looking up at the starry night, coated from head to toe in centaur sperm. You are utterly sated and you’ve given these girls a night they’ll no doubt never forget, even in among their apparently hectic lifestyle. You don’t know that regular sex will ever satisfy you again after this. These weren’t girls... they were <i>demons</i>, beings of lust that exist to steal souls by way of carving them out of you with desire.");
	output("\n\nThe last thing you see before your swimming vision goes black is Jenny, her flowing blonde hair messy as can be and fluttering in the cool breeze while she stands above you. She smiles down at your prone form and drops a credit chit on your chest. <i>“Keep the change, beautiful,”</i> she murmurs, blowing you a kiss. <i>“We’ll be back again.”</i>");
	processTime(120);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeUpFromTaurStuff);
}

public function wakeUpFromTaurStuff():void
{
	clearOutput();
	showName("\nALONE");
	output("You’re outside the cargo elevator");
	if(pc.isHerm() && pc.isSquirter()) output(" and drenched in your own mixed fluids");
	else if(pc.hasCock()) output(" and covered in your own [pc.cum]");
	else if(pc.isSquirter() && pc.hasVagina()) output(" and drenched in [pc.girlCum]");
	else output(" and decidedly moist between the [pc.thighs]");
	output(". You open your mouth on instinct, but there’s no centaur for you to please - just an empty elevator and your shame.");
	output("\n\n");
	processTime(10);
	moveToElevatorAdjustment();
	CombatManager.genericLoss();
}

public function moveToElevatorAdjustment():void
{
	moveTo("ZSF G16");
}

//Tailmilk
public function tailMilkTheMaleSecOp():void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	output("You respond by stroking [pc.tails], hefting " + (pc.tailCount == 1 ? "it":"one") + " to display the brazenly wet, winking entrance to your tailcunt. <i>“I’m hungry,”</i> you coo, husky with erotic promise, <i>“and you’re going to feed me.”</i>");
	//Lust
	if(enemy.lust() >= enemy.lustMax()) 
	{
		output("\n\nThe kaithrit’s eyes widen. <i>“Yes!”</i> He pulls his hands away to better present his chromed cock for your use. <i>“Do it. Fuck me with your tail!”</i>");
		output("\n\nThe sight of it is enough to stir your passions and the parasite’s lusts together into a single torrent of focused desire. Droplets of lubricant dribble from your [pc.tailCunt]. <i>“This is going to feel very, very good.”</i> You tease, not entirely sure if you’re addressing him or your tail, to be brutally honest, but it hardly matters either way.");
	}
	//HP
	else
	{
		output("\n\nThe kaithrit’s eyes widen. <i>“That’s a cunt snake!”</i> He briefly recoils, blushing hotly when he realizes what you intend to do with it. The coiled metal on the cat’s groin shifts hesitantly, then draws open like a stage’s curtains to reveal the chromed cock beneath. It’s already most of the way hard. When he looks up to stare at slithering entrance you’ve presented him with, it firms up the rest of way. <i>“I’ve never fucked one of those before.”</i> He squirms on the ground. <i>“It doesn’t have teeth in there, does it?”</i>");
		output("\n\n" + pc.mf("Chortling","Giggling") + " in response, you lift your [pc.tailCunt] for his inspection. A trickle of wetness leaks out as the parasite’s lusts and your own merge together into a single torrent of desire. <i>“It’s going to feel very, very good. Promise.”</i>");
		output("\n\nThe operative’s gleaming cock twitches at that.");
		output("\n\n<i>“Oh ho! Somebody’s ready to go, isn’t he?”</i> You caress the cat-boy’s boner. <i>“Isn’t he?”</i>");
		output("\n\nWith a loud gulp, the kaithrit replies, <i>“Yes!”</i>");
	}
	//Merge
	output("\n\nYou release your mental control over your [pc.tail], tenuous at the best of the times. You doubt you could hold it back much longer if you tried. Lunging forward like a starving beast, its cunt-lips open wide and drool a line of alien-brewed girlcum across your conquest’s abdominals. A hot flash of pleasure radiates up your spine from the parasite as it closes in, blossoming into an intoxicating sense of warm, hedonistic delight as it makes contact with the cat-boy’s swollen crown.");
	//Horsepussy
	if(pc.hasTailCunt(GLOBAL.TYPE_EQUINE)) output("\n\nThe fat mare-pussy at the end audibly squelches around the feline’s rod, its chubby lips wobbling slightly as it is split open, lips beautifully taut. That silver cock is every bit as thick as the horse-cocks your cunt was meant to take, every bit as beautifully girthy. There’s a pang of disappointment from your tail that he has no medial ring to grind against your nerves, but the swollen mushroom tip at his head feels every bit as good as a flare as it burrows deeper, pulled inside by the concentric, flexing rings of muscle.");
	//Dogpussy
	else if(pc.hasTailCunt(GLOBAL.TYPE_CANINE)) output("\n\nThe slim canid pussy at the end strains to swallow the feline’s girthy rod, its animalistic lips straining and taut. That silver cock is every bit thick as an ausar mod-junkie’s and even harder. There’s a pang of disappointment as you slide down that there’s no knot to really pop your tail-pussy open, no gloriously engorged bulb of flesh to lock every droplet of cum inside, but the swollen mushroom head at the tip feels almost as good as it burrows deep, swallowed up by the concentric, flexing rings of muscle.");
	//Otherpussy
	else output("\n\nThe wet, tentacle-mounted pussy at the end strains to swallow the feline’s girthy rod, its lips wet dribbling clear lubricants as it slides down. There’s a pang of disappoint that he isn’t somehow thicker, that his cock isn’t covered in exotic, stimulating nubs, or that his dick mounted among a bevy of clit-stimulating tendrils. Still, his swollen, mushroom-like head strokes gloriously down your passage, swallowed deeply by your concentric, flexing rings of muscle.");
	//Merge
	output("\n\n<i>“Hooo-wowww...”</i> the cat-boy moans, his fingers scrabbling madly against the deck. His eyes roll wildly, flashing the whites as the pleasure overwhelms his self-control. All the while, your tail plunges down his cock, greedily slurping against the base while clear juices slick the surface of his quivering testes. The kaithrit gasps in whorish delight, his back arching, his tails flailing. His cock heaves, bouncing your parasitic tentacle around as it tightens down, the folds undulating madly.");
	//No cock:
	if(!pc.hasCock()) output("\n\nThe chest of his armored suit pops open in response to some unspoken signal, and his fingers curl up to tug and pinch at his gently crinkled nipples, the pert swells of his oh-so-feminine breasts heaving and flushed. The feline’s eyes close, and his ears fold further and further back the longer your tail is allowed to continue its erotic work. His louder, lewder moans subside into soft whimpers of delight as he slides into some fantasy, no doubt mounted by an alien lover with the most <i>marvellously</i> pleasurable pussy.");
	//Cock
	else output("\n\nLicking his lips, the feline’s pleasure-addled gaze rises up from your slobbering parasite-cunt to your [pc.cocks]" + (pc.cockTotal() > 1 ? ", fixating on [pc.oneCock] after a moment of indecision":"") + ". He gingerly reaches up to heft it, fingers deftly squeezing around it a moment later. His eyelids drift closed the moment he starts jacking you off, like he’s sliding into a fantasy where he’s fucking a dick-girl with the wettest, tightest pussy in the galaxy. He doesn’t need to see the [pc.cockNoun] he’s stroking to wring out droplets of pre or massage it into your skin, working it like oil into leather.");
	//Merge - tailfukken here
	output("\n\nYour [pc.cuntTail] works up and down the kaithrit’s cock with firm, assertive strokes. It does not jerk or tremble. The motions are swift and automatic. Machine-like ripples stream back and forth along the flexing, squeezing tube of your rear-mounted cunt, coaxing the cybernetic feline to ever greater heights of pleasure. He lifts his hips to better present his prick to be milked, his taut body trembling with the mounting need to cum. You can sense he’s going to blow soon. You can feel it through your tail somehow, and <i>you crave it</i>. In the back of your throat, you <i>thirst for his spunk.</i>");
	output("\n\nCoaxing your parasitic appendage to go faster with a thought, you implore it to take full advantage of the cat-man’s helpless state and inhumanly rigid length, and it does. It slaps into the security op’s crotch with lewd splatters. In the brief moments his shaft is exposed, it shines with the sheer amount of lubricant you’ve produced. His urethra bloats under your watchful eyes, and your conjoined snake pours a wave of pleasured anticipation up your spine in response. Cum! He’s going to cum!");
	//His cummies here set off your cummies
	output("\n\nTorrid pulsations strain against your tail’s powerful muscles, and it answers by filling your mind with the sense of its incredible warmth, the blessed, creamy sensation of potent pulse after potent pulse flooding everything. Involuntary muscle movements wick the orgasmic fluid higher and higher into your tail, devouring it to some hidden place. Those same motions make more room for the squealing kitten’s cream to pour into, and he does so with aplomb. Moaning now, he " + (!pc.hasCock() ? "tugs his nipples":"jacks your [pc.cock]") + " and babbles in confusion over just how <i>perfect</i> your parasite pussy is.");
	//Optional squirter bit
	if(pc.isSquirter()) output("\n\nSo wonderful is the feeling of swallowing up the cat-eared pirate’s seed that your feminine anatomy lurches into sudden, sympathetic orgasm. [pc.GirlCum] gushes out in a steaming spray, soaking him from waist to chest. The pert swells of his breasts glisten with your licentious rain, and as you cum violently the shaking of your hips carries the stream higher to paint his face. It’s like your tail isn’t just milking him; it’s milking you, wringing you out like damp sponge.");
	//Optional dick PG.
	if(pc.hasCock()) 
	{
		output("\n\nErotic heat surges to your bare loins where it can be worked by the kaithrit’s violent pumps, shaped into the rising swell of potent ejaculation. You join him in moaning and ejaculating, every inch of dick straining and clenching. [pc.Cum] ");
		var cumQ:Number = pc.cumQ();
		if(cumQ < 10) output("dribbles from the tip as your meager release peaks and wanes. Not even getting stuffed by a liter of virile, kitty-seed can bring you to produce any more.");
		else if(cumQ < 250) output("spurts in long ropes as your release peaks. With each eruption that’s shot inside you, you answer with your own, painting the kitten in [pc.cumColor] lines.");
		else if(cumQ < 8000) output("volleys forth in tremendous, kitten-soaking sprays. Each is more than an average man could hope to produce on his best day, and you’re pumping them out, one after another.");
		else
		{
			output("pours out in colossal eruptions, one after another. Each seed-filled tidal wave could impregnate a dozen women on its own, and you’re soaking the mewling kitten with all of them, splashing your [pc.cumFlavor] across his chin and face, drenching him in hot, liquid love." + (cumQ >= 15000 ? " A pool of it grows beneath him as you climax. There simply isn’t enough of him to hold it all, so you bathe him in it.":""));
		}
	}
	//Neither cock or squirter
	if(!pc.hasCock() && !pc.isSquirter()) 
	{
		output("\n\nHe’s right too. Your [pc.cuntTail] is perfect. Perfect for milking cocks. Perfect for making <i>you</i> cum. Perfect for riding a wave of orgasmic delight that leaves you drooling and pleased to have done such a good job of feeding your drooling little ride-along. Your eyes cross and your hips shake. Your muscles give out, and you drop down onto the security operative, hips twitching while your tail continues to suck to slurp, milking this cute kitten dry.");
	}
	//Dicknipple squirtan?
	if(pc.hasDickNipples()) output("\n\nArching your back, you give over all control to your pleasure. Your [pc.dickNipples] burst forth, bare and dripping, trembling after being so long suppressed. Musky streams of long-denied semen coat their undersides as they shoot their perverse load over your foe’s head. In the brief moment before his vision is obscured, his eyes seem almost hypnotized by the sudden appearance of your nipple-cocks, like he’s getting to see the perversely erotic sight for the first time.");
	//milksquirties PG?
	else if(pc.canMilkSquirt()) output("\n\nArching your back, you give over all control to your pleasure. It’s everywhere, all-consuming, much like the pressure in your [pc.chest]. [pc.Milk] bursts forth from your [pc.nipples] in a wave of lactic relief, pouring out in forking streams. You’re a soaking-wet, dripping mess, and you can’t be bothered to care, not when you’re getting filled up with cum, satisfying the alien addiction to feeding your tail. It feels too good. You squeeze your nipples and scream in pure joy, redoubling the flow.");
	//Merge
	output("\n\nThe cat-boy’s climax ends before your own. The spurts of creamy, oh-so-virile semen diminish to a slow dribble, yet you’re allowed to fly along on a blissful cloud. Your tail continues to suck and to slurp. You can hear the sound of it, the slutty slobbering of your folds rhythmically clenching to draw up the last few dregs of spunk. Even once he’s gone dry, it’s still sucking, still filling you with pleasure.");
	output("\n\nDragging your [pc.tailCunt] off that shining, chrome dong feels like it should be a crime, but you have things to do. Besides, your parasite has plenty of seed to please it for the foreseeable future. You can sense it in the back of the mind. It’s like a hot bundle of contentment that’s right there, reminding you that you’ve been a very, very good host whenever you’re not thinking of anything else.");
	output("\n\n<i>“Fuck.”</i> The security operative licks his lips and pants. <i>“You... so fucking good...”</i>");
	output("\n\nYeah. You are.");
	processTime(30);
	pc.orgasm();
	feedCuntSnake(enemy);
	output("\n\n");
	CombatManager.genericVictory();
}

//Hyper Titfuck
public function hyperDickThatKittysTits(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	output("You respond " + (!pc.isCrotchExposed() ? "by pulling out your":"with authority borne of your") + " massive cock, flopping the weighty member directly into the security operative’s jiggling tits and face with such force that it bowls her flat onto her back." + (!pc.isErect() ? " The contact predictably excites you into full hardness, your member creeping higher with each pulse of your hammering heart, smothering the cat-girl in an ever-expanding curtain of cock.":" You’re so hard that the impact generates an audible thwack. The cat-girl all but disappears beneath your turgid length, buried in a curtain of cock.") + " <i>“I think I’m going to need more than your mouth.”</i>");
	output("\n\n<i>“Like these?”</i> Her voice is understandably muffled beneath your mighty fuckstick, but the meaning becomes clear the moment her silvery suit opens up. Coils twist and writhe over each other in their hurry to slide to the side, scissoring open to expose the full, weighty swells of the kaithrit’s tits. Bright, almost luminous purple milk beads at her nipples, promising to dribble everywhere the moment you so much as squeeze one of her heavenly mounds. Your [pc.cock " + x + "] already rests in the middle, distending the pillowy flesh around its girth.");
	output("\n\nTit-fucking this cat would be so easy.");
	//Treated :3
	if(pc.isTreated()) output("\n\nLeaning to the side, the operative looks up at you with glassy eyes. <i>“Why’s your cock smell soooo good?”</i> She nuzzles against it, rubbing its scent onto her cheek. Both her ears slowly fold back in ever increasing submission while her nipples tent higher and harder. Her nostrils flare wildly as she takes long, deep inhalations along your [pc.cockNounSimple " + x + "]. <i>“You smell like getting fucked feels.”</i> She starts to lick you, then moans whorishly, hips quivering. <i>“Please tell me you’re going to fuck my titties. Please!”</i>");
	//Not treated
	else output("\n\nLeaning to the side, the operative wears a silly smile. <i>“You gonna tittyfuck me with this huge fucking dick?”</i> She rubs her cheek against it, one fuzzy ear tickling at your [pc.cockHead " + x + "]. <i>“Go ahead.”</i> She gently licks along the length of one vein, making it throb. <i>“You won.”</i> She kisses another spot. <i>“You and that sexy cock deserve a prize.”</i> Her breath bathes you in puffs of excited warmth as her heart rate accelerates. <i>“Fuck my tits.”</i>");
	//Merge
	output("\n\nYou don’t need the encouragement to grab hold of breasts that magnificent, yet you appreciate it all the same. Sinking your fingers deep into her soft mounds, you squeeze them up against your enormous girth, groaning in delight. Twin purple arcs spray up out of her nipples from the pressure, filling the air with their sweet, fruity scent. Alien milk spatters softly over your quiveringly erect [pc.cockNounSimple " + x + "], warm and wet in all the best ways, while the soft embrace of her cushiony bosom massages your sides, rubbing the dribbling fluid in.");
	output("\n\nYour cock is so hard and clenching so powerfully that you can almost hear your skin creak from the strain.");
	//Treated
	if(pc.isTreated()) output("\n\n<i>“Mmmm, yeah, rub that milk in you big, fucking " + pc.mf("","she-") + "bull! Gonna make you spunk so fucking hard for my tits!”</i> Eyes rolling wildly, she takes a long, slow lick up the underside of your [pc.cock " + x + "], culminating in a forceful twirl of her tongue that scoops a dollop of oozing pre-cum directly from your slit. <i>“You taste almost as good as you smell.”</i> Her nose presses against your [pc.cockHead " + x + "] as she sucks in a deep lungful of highly saturated pheromones. <i>“Can’t wait till my milk makes you all cummy...”</i>");
	//Untreated
	else output("\n\n<i>“Ohhh yeah, rub it in.”</i> She takes a long, slow lick along the underside of your [pc.cock " + x + "], culminating in a heated kiss against a urethra that feels increasingly filled with creamy, drizzling pre. <i>“Get it all over so you can nut suuuuper hard. It’s special milk after all.”</i> Her eyes twinkle with knowing, lusty excitement while she plants a few more smooches against your [pc.cockHead " + x + "]. <i>“Nothing makes a cock cum like being soaked in synthetic vanae milk.”</i>");
	//Merge
	output("\n\nAs a sense of sublime, blessed warmth radiates into your [pc.cockNounSimple " + x + "] as more and more purple cream dribbles onto your skin. Your nerve endings feel tender, supercharged from the lactic contact, better able to inform you of the exact texture and firmness of this sex-kitten’s sensuously <i>squishy</i> titties. You can measure exactly how slippery the milk is, precisely how hot it feels to bathe in. You can sense how firm her nipples are how much she loves to feel your sopping-wet rod sliding between them.");
	output("\n\nIt’s drugged. Of course it is. You can feel it pounding your brain with sexual bliss whenever you try to think of anything but fucking - of ramming yourself into her jiggling, squirting, fountaining tits again and again.");
	if(pc.balls > 0)
	{
		output(" Your [pc.balls] " + (pc.balls == 1 ? "is":"are") + " suddenly heavy. Purple cream clings to your [pc.sack] as you feel it fill, so heavy on your mind that you wonder how you can stand.");
	}
	output(" If the only thing her drugged milk is doing is making you want to fuck her tits even more, is that so wrong?");
	output("\n\nWhy should you worry about it? You’re so hot and hard, so drenched in endless kitten milk that leaves you aching for those curvaceous pillows. Your hips rock back and forth to a subconscious rhythm, sliding your oversized erection into that heavenly valley, your [pc.cockNoun " + x + "] gleaming under a haze of purple, intoxicating milk.");
	//Untreated
	if(!pc.isTreated()) output("\n\n<i>“Go ahead and cum in my tits" + (pc.mf("m","") == "f" ? ", big guy":"") + ",”</i> the kaithrit says while you’re on a backstroke, revealing the liberal glaze of pre you’ve dribbled across her face and hair. Her lips shine with it. <i>“We both know you want to. With that much milk soaking you, you must be soooo full of cum, and my tits must feel sooo good.”</i> She wraps her arms around her your dick to pull it deeper into her cleavage, her forearms squishing her tits tighter, forming a vice of slick, cream-drenched skin to wring your orgasm out with.");
	//Treated
	else output("\n\n<i>“Gimme that cum!”</i> the kaithrit cries, shuddering in scent-and-tit-based bliss. <i>“Gotta be so full of it. All that milk making you so full of so much yummy jizz...”</i> When you slide back, you realize that she’s absolutely drenched in pre, soaked in it from the crown of her head all the way into her cleavage. Her tongue whips out to gather as much as she can before you thrust back up to bury her in cock once more. <i>“Just dump it on me. Soak me in. Make me your slut. Make me you-”</i> Her voice coats off into a sloppy-sounding smooch when your cock returns. <i>“-ohgod just gimme cum!”</i>");
	//Merge
	output("\n\nLike magic, your climax arrives exactly on cue. It grabs hold of your cock and squeezes tight, pleasure and need corkscrewing together as your " + (pc.balls <= 0 ? "body":"[pc.sack]") + " quivers with the effort of unloading a torrent of fresh-brewed seed. There’s no controlling it. There is only the primal need to orgasm, to feed this kitten the cum she requested, to unload every single drop of painfully pent-up jism directly into her tits with every ounce of force you can muster.");
	output("\n\nYour hips swish back and forth like the pistons on an old timey locomotive at full speed, savaging the kaithrit’s tits with heavy slaps. Your [pc.cockHead " + x + "] swells" + (pc.hasKnot(x) ? " along with your knot":"") + ", and your urethra follows a split-second later, so loaded with [pc.cumNoun] that it lifts up a few inches before the kaithrit can pull it back down, smushing straight into her cleavage. The force of your eruption actually pushes her tits apart, revealing twin tidal waves of seed that race down her belly and up her neck. One drenches the cat-girl’s body from the waist down. The other crests at her chin and splashes across her blushing cheeks, glazing her in a thick mask of [pc.cumColor].");
	output("\n\nThe soaking, milk-spraying tits clap back together, concussing you with bliss, just in time for you to continue your almost painfully intense orgasm. You cum with compulsive fervor, like you need to pump your molten, burning bliss directly into the fat kitty-titties. Wave after wave of glittering, liquid [pc.cumGem] pours into her cleavage only to rush back out, and through it all, the security operative is doing nothing but begging you to keep going, to keep slamming your hips into her jiggling cum-covered mounds.");
	output("\n\nYou grab her nipples for extra support, hard, and the kaithrit screams in something that sounds halfway like approval before rambling into ever more passionate exhortations for you to cum even harder. The best part is that you do. With her nipples crinkling and dribbling under your thumbs, you revel in heavenly sensation of your [pc.cock " + x + "] bloating the cat-girl’s tits with superhuman quantities of seed.");
	output("\n\nYou cum harder than you knew you could. The climax steals your sight, your eyes rolling back into pure whiteness. It steals your voice, reducing your attempts at speech to gibbering moans. Soon enough, you aren’t even listening to the cat-girl’s pleading moans, just the thrum of your heartbeat hammering in your ears, working overtime to ensure that your [pc.cumNoun]-spurting [pc.cockNounSimple " + x + "] stays completely, ridiculously hard.");
	output("\n\nYou don’t mind in the slightest, not with your head filled with the sensation of plundering the big tittied kitty’s sublimely slick cleavage. It squeezes you with each pump and each squirt. Her boobs milk you. They wring your dick dry, they massage your endless sexual effluvia back into you. And there’s always more milk" + (pc.balls > 0 ? ", slicking your [pc.balls]":"") + ", coaxing you to new heights of sexual ecstasy.");
	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",moreBigTittyKittyTitfuck,x);
}

public function moreBigTittyKittyTitfuck(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	output("When you come to, your [pc.cocks] ache" + (pc.cockTotal() == 1 ? "s":"") + " and you feel like you’ve just run a marathon. The kaithrit is nowhere to be seen, though there is a sizeable lake of seed to mark the location of your obscene tryst as well as a small pouch she left behind in her haste to escape." + (pc.isTreated() ? " Your Codex has a few dozen pictures of the thoroughly bukkaked girl pressing herself worshipfully against your cock along with a small note informing you that she couldn’t help but shovel a few litters worth of kittens into her cunt.":""));
	//Balls:
	if(pc.balls > 0)
	{
		output("\n\nSpeaking of pouches, your own nutsack is feeling rather swollen. ");
		if(pc.ballDiameter() < 4) output("It’s heavier than you’re used to, so much so that you can tell at a glance that <b>it’s gotten bigger</b>.");
		else if(pc.ballDiameter() < 8) output("You have to be careful when rising not to squeeze it too tightly between your thighs. All that milk did something to <b>make your balls bigger.</b>");
		else output("Rising is more difficult with so much extra weight swinging down there. <b>Your [pc.balls] are bigger, somehow, and undoubtedly more capable.</b>");
		pc.boostCum(2);
		pc.ballSizeRaw += 2+rand(3);
	}
	//No balls
	else 
	{
		output("\n\nYou wince at an ache just behind your crotch when you move to rise. There’s an almost painful tenderness, like <b>something inside you is swollen or enlarged</b>. Being drenched in so much drugged milk undoubtedly left its mark on you, or at the very least on your [pc.cock " + x + "]. You’re certain you’ll be cumming a little harder from now on.");
		pc.boostCum(6);
	}
	output("\n\n");
	processTime(25);
	CombatManager.genericVictory();
}

public function secOpMaleAnal():void
{
	clearOutput();
	showPunkSecOp(true);
	author("Shifty");

	output("With a toothy grin, you ");
	if (!pc.isAssExposed()) output("shed your [pc.assCovers], swiftly but artfully and seductively, breaking eye contact with the exasperated feline only when you have to. You take pride in your handiwork, drinking in the sight of the worked up outlaw before you. When the pile of obstructive interloping garb falls to the hot ground, you ");
	output("slide yourself forward,");
	if (pc.isNude()) output(" and without any pesky clothes to interfere with your performance, you");
	output(" take a knee, and crawl into the woefully empty space between his gorgeous thighs. You glance up at the blushing face of the conquered Kaithrit, the red glow displaying more lust than embarrassment. His breath comes quickly from his heaving chest; a display of debauchery like no other, and damned if having this much shining synth cock before you doesn’t put you in the mood, but who are you kidding? You were ready to get plowed by this thing since the Cyberpunk plopped his ass down in defeat... But still, the more appetite before a meal, the better it tastes, and this thing looks just delicious.");

	output("\n\nYou creep forward between his legs licking and kissing the metal mast of masculinity, throwing in a light nibble or two for good measure. Your victim restrains his arms by balling them up around the hot ground and braces his legs by clenching his toes and spreading his thighs wider in invitation.");

	output("\n\nYou lay into the metal rod, letting your hand fly up and down the upper half of the shaft, bringing your face in close with his crotch. You reach out with your [pc.tongue] and lap at his synthetically augmented meat, making a real show of getting him ready for what’s coming. Suckling, moaning, and nibbling at his package, you let him really enjoy the feeling of your mouth before you even wrap your lips around it in earnest. You steal a glance up to assure yourself that he’s enjoying your tongue.");
	output(" When you find him biting his lip in pleasure, mind awash with desire and longing, you drag that oral muscle from the base of his shaft to his pelvis, mischievously robbing him of that extra input of pleasure. You tease him with what he’s lost by tracing designs only you can make out onto his body, drinking in his expressions of arousal. His face is scrunched up with a pending bliss, ready to accept any and all sources of pleasure, but irritated at having lost your tongue, despite how brief the moments were that he had it. Your hand still aims to please, however, and does quite a good job of it. The sounds of it flying up and down his shaft turn lewder and lewder with each pass, going from an almost soundless, wet friction to the pre-drenched and noisy mess that it is now.");
	output("\n\nYou smirk in satisfaction, knowing that the reigns are in your hands as you gaze into his frustrated but pliant eyes. You drop your tongue from his pelvis down to his balls, rewarding him for his obedience.");
	output("\n\nAs your oral organ plays with his testes, gauging the load trapped within, his teeth grit harder and he bares his canines at you. It appears you’ve hit something of a sweet spot!");
	output("\n\nYou moan into his flesh, making a world-class show of this foreplay and not breaking eye contact once since making it. You switch from lapping to suckling as you draw your tongue, and the Kaithrit’s ball, into your mouth, drawing a gasp of pleasure from your lover. You let your tongue continue its design work, letting an incomprehensible alphabet fall onto the pirate’s scrotom as you passionately trace each unique curve onto its skin with your tongue, every so often getting a groan, moan, gasp, or even a yelp while you make sweet love to each testicle before pulling away.")
	output("\n\nThe absence of your mouth is deeply felt, it seems, as your lover whimpers with disappointment and switches from a pleasure-blanked expression to almost a scowl, only to take back unspoken words as you lay your mouth back onto his dick. That frown twists into a pleasured grimace as he bites back the moans forming in his chest.");
	output("\n\nYou carry yourself up his chrome cock, still putting your tongue to work as you follow the rod up and up, savoring the sweet taste of pink-tinted aphro pre, until you finally arrive at the glans. You still stare deep into his eyes as you breathe deliberately onto his tip, letting the hot air tickle him.");
	output(" This earns you a long moan of anticipation as he rolls his hips to get more of that wonderful sensation, his impatience oozing from his throbbing dick. It proves to be quite contagious. You plant your lips onto the very tip of the glans and let it sink down. The moan being wrenched out of the Kaithrit continues and raises in volume and pitch as you slowly let the battering ram of his member break down your oral gates. As soon as the glans fully enters your mouth, you find yourself rewarded with a powerful squirt of arousing precum. The taste is salty and sweet in all the right ways; so dirty and just so very right. You keep it in your mouth as you play with his tip, letting your tongue flick at the cum slit.");
	output("\n\nYou admire the cute reactions of bliss the Kaithrit seems to be futilly fighting. The way his open mouth pants foggy breaths, the way his eyes seem to glass over more and more with pure lust, and above all, the way he looks at you, going from a hungry glare to a starving stare.");
	output("\n\n<i>“Hahn...”</i> He moans through grit teeth. <i>“Mnh! Suck it, you beautiful thing!”</i> He pleads as he rolls his hips, trying to fuck your mouth in the most subtle way he can get away with.");
	output("\n\nThe temptation to wrap your lips around his cock in earnest nags at you incessantly, but you’ve got better things planned. With a melancholic parting kiss, you wordlessly carry your attentions higher, [pc.tongue] listlessly trailing over his barely toned middle, stopping to trace each faded ab into memory with your oral organ. One, two, three, you trace over the soft musculature and memorize the dainty curves, peaks, and valleys.");
	output("\n\n<i>“J-just let me fuck you!”</i> He whines, shifting his hips audaciously in an attempt to return his member to your mouth, growling with barely restrained frustration.");
	output("\n\nFour, five, six pack. You move your [pc.legOrLegs] forward, shuffling and scooching closer before planting your [pc.hands] on the kitty’s spit-slickened torso to help balance yourself as you shift your attention to his pecs and the pierced pink pair of A-cup personalities. You envelope one of his nipples in your mouth with rather impressive speed, circling your tongue around the perky target’s bullseye.");
	output("\n\n<i>“Mnh! Ahn! S-stop teasing meeeee!”</i> He moans and mewls with frustration and pleasure, the pre practically spilling from his cock and streaming between his thighs.");
	output("\n\nYou pull the nipplering with a playful growl, making the security operative’s moans of sexual frustration pick up in pace. You twist it in your mouth, nibble lightly, and kiss it. Then, just as suddenly as you had stopped to clamp onto the ring, you let go of it, and the nipple altogether, the metal of it clicking quietly against your teeth as it flies out. The sudden slack sends his A-cups jiggling for a fleeting but arousing moment. You dart your face below the pecs and lick his sweaty underboob, lavishing his chest in your attentions.");
	output("\n\nBut as fun as boob-play is, you must admit that even you are getting anxious for the main course, so you finally withdraw from the cleavage and the spit-shined reddening nipple before moving your body forward, [pc.legOrLegs] quickly overlapping the cyborg toy’s own while still dragging your tongue up and up, trailing along the fuckboy’s neck, under his jaw, and then flinging yourself into a fiery and passionate kiss.");
	output("\n\nFully saddled on his lap, you can feel the full effects of his powerful throbbing and insistent humping. You wrestle with the powerful tongue in his mouth, earning approving sighs and groans. When you pull back, you are both left panting, wanting more.");
	output("\n\n<i>“You want it?”</i> You ask with mischief in your tone, flashing a cheeky smirk as you raise your hips higher until it hovers directly over the object of your lusts. <i>“Come get it.”</i> You wiggle your exposed pucker over the feline’s metal dong with as much blatant intent as you can manage to lace the act with. <i>“Give me a fucking that’ll leave me numb for days.”</i> You order, leaving that line to play with his head and let the fantasies spill into it.");
	
	processTime(12);
	clearMenu();
	addButton(0,"Next",secOpMaleAnalPart2);
}

public function secOpMaleAnalPart2():void
{
	clearOutput();
	showPunkSecOp(true);
	author("Shifty");

	output("That proves to be the final straw.");
	output("\n\nHis look instantly takes a more predatory hue, the frustrated and cute look with folded ears shed for a much more assertive aura as he bucks hard under you, instantly plunging his massive tool inside your [pc.asshole] and gritting his teeth violently. The sting of the sudden penetration and the raw pleasure that is fired through your nerves proves to be too much, overwhelming you with too many sensations to keep up with.");
	if (pc.legCount == 1) output(" Your [pc.legOrLegs] shut ");
	else output(" Your [pc.legOrLegs] shuts "); 
	output("down, everything below the belt rapidly losing control and ignoring your orders. You fall forward, limp as a wet noodle, screaming with unabashed, shameless delight that could only be from a buttslut who is getting exactly what [pc.heShe] wants.");
	output("\n\nLithe arms catch you and hold you close with synthetically augmented strength. Thirteen inches of raw, technologically enhanced <i>man</i> throbs and drools powerfully within your colon, enjoying the warmth of your newly rearranged anatomy as it shifts your insides to better pleasure the masculine rod.");
	output("\n\nA few moments pass, moments you might say were quiet were it not for your labored moans and pants of breathless pleasure and pain. It takes a few moments for your eyes to uncross and for your tongue to find itself placed back in your gaping maw and your ");
	if (silly) output("ahegao’d ");
	else output("broken expression ");
	output("reorganizes back to one of passive contentment. It takes even longer to realize that your lover has not been ravaging your [pc.asshole] while you recovered from the initial penetration.");
	output("\n\nYou look up with a tentative glance to see a sharp and predatory grin leering down at you. He looks giddy to be in charge at last, but far from satisfied.");
	output("\n\n<i>“Ready?”</i> He asks with no small amount of intimidating desire.");
	output("\n\nYou’re honestly surprised beyond belief that he exercised the restraint required to prevent continued thrusting, especially after all that you’ve just put him through in preparation. You nod hesitantly, a blush falling on your cheeks as you realize just how vulnerable you’ve allowed yourself to become; embarrassed, but oddly unashamed.");
	output("\n\n<i>“Get ready to regret teasing me, you sexy jerk.”</i> He smirks with a chuckle.");
	output("\n\nHe pulls back his hips like a fist winding up for a haymaker. The ridges and troughs of his synth cock scraping along your anus has you gasping and panting with lust and need before the thrust even starts. And when it does? When the wind up is finally complete and the tip of his swollen pleasure rod is all that links your rump with his cock, no amount of mental bracing could prepare you for the massive riptide of tormenting pleasure that leaves you drowning.");
	output("\n\nYour eyes lose focus and even just preventing them from crossing again is exercising all your willpower. Your [pc.tongue] has once again left its place in your mouth, lolling out and drooling spit like a braindead slut. The cock inside you burns hotter than even any star, you swear to yourself. It burns so good!");
	if (pc.legCount == 1) output("\n\nYour [pc.legOrLegs] has ");
	else output("\n\nYour [pc.legOrLegs] have "); 
	output(" ceased all function, but who needs " + (pc.legCount == 1 ? "it" : "them") + " anyway? The catboy’s own will carry you on his dick, his hips slapping against your ass until he sates himself with your body. Echos fill the corridors of the mines of reciprocated moans and babbling gibberish that could only be from a bitch in heat; that could only be from you.");

	if (pc.ass.looseness() < 2)
	{
		output("\n\n<i>“F-fuck! You’re tighter than- mnh! Any slave on this fucking ship!”</i> His face contorts with effort and pleasure as he ravages your tight ");
		if (!pc.hasVagina() || !pc.hasBreasts()) output("boypussy");
		else output("backdoor");
		output(". <i>“Damn!”</i> He hisses. <i>“This ass is a fucking keeper!”</i> He declares in delight.");
	}
	else if (pc.ass.looseness() < 4)
	{
		output("\n\n<i>“N-not bad!”</i> He slams upwards under you, burying his mast. <i>“Not all that loose, for a slut like you.”</i> He debases you, twisting your expression with his dick and stinging you with his burning words, the belittlement only adding to your pleasure.");
	}
	else
	{
		output("\n\n<i>“Woah! You’re an absolute buttslut, aren’t you?!”</i> He expresses sheer surprise in his voice as he effortlessly plows your loose hole. <i>“Holy fuck, I haven’t bagged a bum this loose in forever!”</i> He continues sliding in and out with minimal effort to further emphasise his point. <i>“Hah! Good thing you’re still damn " + (pc.femininity > 40 ? "cute" : "hot") + ", cause watching my bitches make faces like the ones your making right now... It’s much better than having a hole squeeze my dick with bone-crushing pressure.”</i>");
	}

	output("\n\nThrusts stack on quickly, and you try to hold on to sanity by counting them; a futile effort, as you barely break the double digits before your brain goes as numb as your [pc.legOrLegs]. Each time he bottoms out, each time his hips meet your [pc.ass], your expression grows looser and looser. You glance down while you still have the control. Watching his cock disappear inside you like a magic wand into a top hat is hot as Hell! To further demonstrate just how deep he’s fucking you, just how wide he’s stretching you, you can see a pistoning, phallic bulge shifting up and down your belly.");
	output("\n\n<i>“O-oooh! God!”</i> You moan with unadulterated lust and heat. <i>“Ffffu-ahn!”</i>");
	output("\n\nYou twitch incessantly, the arms you have wrapped around the Kaithrit’s back spasm and your [pc.belly] flexes uncontrollably, no doubt to the 13 inch pussy-pounder’s pleasure.");
	output("\n\nYou’re nearing your end. Orgasm approaches you with great haste.");
	if (pc.hasCock())
	{
		output(" Your [pc.cock] throbs powerfully and forebodingly, swearing up and down that another second of this will have it spewing a wasted load of your semen all over yourself and your kitty-cat lover, that another punch to the prostate will have you creaming yourself unconscious.");
		if (pc.hasVagina()) output("Your cock isn’t the only part of you about to burst, either.");
	}
	if (pc.hasVagina()){
		output(" Your [pc.pussy] clenches around a phantom prick, milking a nonexistent load out of an imaginary cock. It’s coming, and fast; that desired high you’ve been careening towards with each thrust of the mecha dong is finally here.");
	}

	output("\n\nThe cyborg lover you’ve been pleasuring seems to take no end of satisfaction from watching your reaction to his every thrust and every movement; from the muscle spasms to the slack expression and glassed-over eyes. At least, if his leering grin is anything to judge. <i>“Hanging in there, hot stuff?”</i> he asks, teasingly. <i>“Cause I’m just getting started.”</i>");
	output("\n\nYou might think for a moment that he’s just fucking with you, but one look at those hungry eyes, one glance at those pearly white teeth in that debauched smile, tells you he’s not kidding. Your heart would sink to your stomach if it weren’t so full of cock. You’re about to cum, and cum hard at that, while he’s just warming up?");
	output("\n\nFuck it! Who cares? The pleasure you find yourself awash in is the kind that people would kill just to get a taste of, and you’re drowning in it. Who cares if he fucks you into your grave? This dick is the kind of thing that would make Anno green with envy. You let yourself go, content to enjoy the consequences that might come with this orgasm.");
	output("\n\nYour [pc.legOrLegs] spring to life, tightening around the femboy’s hips, trying to keep the invader within you as you clench, spasm, and twitch in warning of your impending release. Your [pc.asshole] milks the phallic tool for all its worth, trying desperately to coax your lover into joining you in sexual bliss before too much proves to be too much for you. The friction, the lewd squelching, the moaning, and the closeness all unite to pluck apart your resolve. You lean forward into the Kaithrit’s embrace, panting and whimpering into his feline ear to display just how much he’s breaking apart your psyche. You don’t need to pull back to know that he’s grinning ear to pointed, feline ear at your debasement. With a final moan, you clench your teeth, close your eyes, and enjoy absolute bliss.");

	if (pc.hasCock())
	{
		var cumQ:Number = pc.cumQ();
		if (cumQ < 100)
		{
			output("\n\nThe meek puddle of your rejected seed swiftly pools between your bodies. The sensation of your [pc.cum] between your flesh has the Kaithrit panting, apparently turned on to no end by the presence of your blatantly inferior load. <i>“Hah! Aww!”</i> He jests through labored pants. <i>“Hehe... Cute little load for a cute little [pc.boyGirl].”</i> He flashes a superior, glaring smile.");
		}
		else if (cumQ < 1000)
		{
			output("\n\nBiting your lower lip with lust, you moan as the sensation of your [pc.cum] spreads between you and your lover, the sizeable load filling the valleys of the Kaithrit’s musculature before the excess dribbles onto the floor. <i>“Not... Hah... Bad...”</i> He remarks between horny breaths that seem to steam even in this hot environment.");
		}
		else
		{
			output("\n\nYou scream with unbridled and unrestrained need. Your voice echoes off the walls and must make the poor pirate’s ears ring due to your closeness, but it’s hard to care when your this fucking hot! Your flushed [pc.skin] could melt glaciers, and it only gets worse when your molten load of [pc.cum] fills what little empty space is between you two before falling onto the floor, wasted. The puddle swiftly turns to a pool, then a mire. Your lover looks down at your cum-cannon of a member in awe. <i>“Holy fuck!”</i> He cries with lust rich in his wavering voice. <i>“Hahn! An ardent buttslut, </i>and<i> a prize-winning stud... I scored a fucking lottery!”</i> He grins with malice, swiftly recovering from the initial shock.");
		}
	}
	if (pc.hasVagina())
	{
		output("\n\nYour ignored [pc.vagina] " + (pc.hasCock() ? "also " : ""));
		if (pc.isSquirter() >= 1000) output("sprays like a geyser beneath you, ingraining your feminine scent into the Kaithrit boy’s fair flesh");
		else output("dribbles and squirts its feminine load onto the Kaithrit boy’s pelvis and belly");
		output(", unabashedly getting off hard to the anal punishment you’ve been receiving so well. <i>“Hah! Nice!”</i> He says into your [pc.ear].");
	}

	output("\n\nYou collapse into your lover’s lithe and synthetically augmented arms, panting and moaning weakly as his still-erect cock throbs powerfully in your colon. The pre spilling into your gut would ordinarily tell you he’s not far off either, but he’s been painting your insides with the stuff since the initial penetration. You sigh heavily into his ear.");
	output("\n\nHe chuckles darkly and shifts his weight, throwing you off balance entirely, forcing you to rely on his embrace for support as you feel completely paralyzed by exhaustion. For a moment, you think you’ve rolled off, but his arms are still inextricably wrapped around you. Your orgasm-burnt mind whirls to comprehend the situation before it becomes embarrassingly clear: he’s put himself on top, missionary style.");
	output("\n\nYou look into his hungry- no, his starving eyes as they drink up your form and trace your contours, from your [pc.thighs] to your [pc.eyes]. His hips pivot slightly and forebodingly, teasing out subtle whimpers and mewls from your lips. <i>“Hey, what’s wrong? I told you I’m just getting started.”</i> He grins his predatory grin, canines showing in full form. <i>“Cross your fingers you can stay sane after I’m done with you... Of course, if you can’t, that’s fine too.”</i> One arm disentangles itself from the other in your tight and cum-slathered embrace to reach a hand to your face. He traces your jaw and cradles your chin sensually. <i>“" + (pc.femininity > 40 ? "cute" : "hot") + " face like this...”</i> His still embracing hand reaches down to cup one of your lower cheeks. <i>“This perfect [pc.ass] of yours... I’ve always got room upstairs for these.”</i> His grin stretches wider. <i>“So, think you can take all </i>this<i>?”</i> His metal rod twitches inside you powerfully.");

	if (pc.libido() >= 70)
	{
		output("\n\nDespite having just finished, the way he talks, the way he prods, and the way he drinks up your body with his eyes seems to coax out your arousal, this heat caring little for for your prior orgasm. Your nethers begin to stir, [pc.genitals] growing hot");

		if (pc.hasVagina() && pc.hasCock()) output(", wet and hard");
		else if (pc.hasVagina()) output("and wet");
		else if (pc.hasCock()) output("and hard");

		output(". The corners of your mouth twitch into an open-mouthed smile, as you can’t find the strength to close your panting maw.");
		output("\n\n<i>“F-fuck yes!”</i> You cry in glee. <i>“Give it to me! Fuck me like an animal, you kitty crook!”</i> You’d squeeze him with your [pc.legOrLegs], wrap him and hold him close and deep, but " + (pc.legCount == 1 ? "it" : "they") + " stopped listening a long time ago. So instead, you settle to begging for more and hoping it’ll be enough to keep him going.");
		output("\n\nHe flares his brow, curious and intrigued, before grinning like a madman. <i>“You’re something special, all right! Let’s see who can hold on longer!”</i>");
		output("\n\nHe giggles with utter glee as he begins his thrusts anew, the sounds of your moans and cries of ecstasy ricocheting off the cavern walls in between lust-maddened cries of <i>“More!”</i>");
	}
	else
	{
		output("\n\nYou gulp back your nervousness and fear, the lump in your throat preventing any objection. You can probably kiss your sanity goodbye at this point, because given the sheer rift in libido and stamina between the two of you, you’ve enlisted yourself to be passenger as soon as you sat down on his dick.");
		output("\n\n<i>“Better find something to bite down on, because this might be a while.”</i> He ominously warns before suddenly resuming his thrusts, beating down your vocalizations into incoherent babble with the sheer force of his ravaging humps.");
	}

	pc.orgasm();
	pc.buttChange(enemy.cockVolume(0));
	processTime(20);
	clearMenu();
	addButton(0,"Next",secOpMaleAnalPart3);
}

public function secOpMaleAnalPart3():void
{
	clearOutput();
	showPunkSecOp(true);
	author("Shifty");

	if (pc.libido() >= 90)
	{
		output("You don’t remember when it happened, but somewhere along the way, you must have found yourself back on top, riding the Operative, because as your conscience grants a faint sliver of lucidity to your sex-burnt mind, you realize that your cheek is not on the hot rock floor, but on the heaving chest of your victim-turned-dominator-turned-partner as his hand absently strokes your hair");
		if (pc.earType == GLOBAL.TYPE_FELINE || pc.earType == GLOBAL.TYPE_VULPINE || pc.earType == GLOBAL.TYPE_LUPINE)
		{
			output(", petting your cute [pc.ears] in a very pleasurable way that has you moaning and nuzzling into the electric touch");
			if (pc.tailCount > 0) output(", and lazily wagging your [pc.tails] with listless content");
		}
		output(".\n\nYou yourself are quite breathless, you realize. You pant hot breaths of exhaustion over a pool of drool that has begun to grow on the Kaithrit’s chest. He seems to pay no mind, however, apparently just as worn out as you are.");
		output("\n\n<i>“Holy... Shit...”</i> He remarks through his quick panting breaths. <i>“You’re amazing!”</i> he declares.");
		output("\n\nYou’d reply to his complement, but you’re too busy chasing your breath and wrangling up the scattered pieces of your brain, so instead you’re content to remain cuddled with the cause of this glorious afterglow. A moment that passes within a few minutes as your lover carefully shuffles you off of himself.");
		output("\n\n<i>“I’d love to stay for a while longer, especially with a sex machine like you, but I have stuff I gotta get to.”</i> He excuses as his augmented armor expands from the larger cybernetically enhanced parts of his body to encapsulate himself in the protective suit. <i>“Hope I catch you again, hot stuff.”</i> He winks provocatively before setting off, leaving you to slowly rise in place to shake off the remnants of the afterglow.");
		output("\n\nMan, you should’ve asked him for a number!");
		output("\n\nYou gather your equipment before setting off again, rather fiercely satisfied for the time being.");
		pc.loadInAss(enemy);
		processTime(20);
	}
	else
	{
		output("The hours tick away with blissful agony, or maybe they were minutes. It doesn’t matter at any rate. You run through positions faster than a warp gate jump between a planet and its moon before you settle into a final position: you, face down into the ground with your ass hiked into the air, arms limply fallen to the ground and wrists against your knees. Your eyes are rolled to the back of your head and your tongue lolled out, licking the abrasive, spit slathered ground with each thrust of the pirate’s powerful hips. Your body convulses and contracts with involuntary muscle spasms as yet another orgasm");
		if (pc.hasVagina()) output(" coaxes out a spray of [pc.girlCumNoun] from your sore, untouched pussy to add to the pool spreading on the ground.");
		else if (pc.hasCock()) output(" coaxes out yet another spray of semen from your sore, untouched member to add the the pool spreading on the ground."); 
		else output(" wracks your broken body with another wave of pleasure.");

		output("\n\nFrom behind you, the moans that had at first provided the small comfort that you are pleasuring your partner begin to pick up in intensity and even gathers a small measure of ferocity to them before the Kaithrit broadcasts his orgasm to the world. <i>“I’m cumming!”</i> he cries out. <i>“I’m gonna... Fill you up until you look nine months pregnant!”</i>");
		output("\n\nHis announcements fall on deaf ears, only serving to playback the pirate’s fantasies to himself, as you are far gone, the rolled back eyes betraying no consciousness within the living cocksleeve that was your body.");
		output("\n\nA few more powerful, ass-bruising thrusts cram his metal meat into your backdoor before one final, devastatingly powerful hump pushes you into the ground, your [pc.genitals] mashing painfully into the rocky floor. Now, with no position or technique remaining beyond you laying on your belly, he finally begins to finish.");
		output("\n\nThe chrome coil within you throbs with foreboding power and you feel his testicles rising, brushing your thighs as they reach his pelvis before the throbs finally begin to yield his cum. But before he fills you up, the Kaithrit tenses up and pulls back, withdrawing from your used hole. You don’t need to turn your head to know he’s jacking off like the galaxy is about to end, the grunts and gratingly rapid squelches echoing off the walls as he admires your red, bruised ass and your total lack of awareness, taking pride in his work.");
		output("\n\nThen you feel the utter torrent begin to coat you, his aim at first your back, then your legs, your [pc.genitals], before finally and tauntingly ending the one-man bukkake on your ass. It feels like a statement: that you weren’t worth finishing inside.");
		
		output("\n\n<i>“Ahh... Ahn! Hah. That was fun...”</i> He pants labored breaths, huffing over the sound of metal uncoiling and striking against more metal as his armor begins to encapsulate him. <i>“Thanks for the fuck. Hope it was good for you too, but err...”</i> You hear a shuffling behind you, growing louder and closer before a ");
		if (pc.hasVagina()) output("femcum");
		else output("cum");
		output("-slathered hand presents itself before you, depositing a gift into you open panting maw. <i>“I’m pretty sure you did.”</i> He chuckles as you swallow the snack.");

		output("\n\nYou hear something hit the ground before his footsteps finally fade away.");
		output("\n\nWhen you finally begin to stir, it’s not without great fatigue and a particularly potent soreness in your ass and cheeks. You groan as the aftereffects of your bout hit you with full force; the consequences of over-extending yourself... But damned if it wasn’t worth it.");
		output("\n\nYou gather your [pc.gear] before leaving the scene, leaving behind rather copious evidence of your escapades for perhaps some other pirate to find.");
		
		pc.applyCumSoaked();
		sweatyDebuff(1);
		soreDebuff(1);
		processTime(45);
	}
	pc.orgasm();
	pc.orgasm();
	output("\n\n");
	CombatManager.genericVictory();
}


/*
Player wins against Male punk SecOp. Player lets secop use player’s tits. SecOp (optionally) injects silicone into the player’s tits unless they refuse. Pleasure ensures either way.

Requirements to start scene:
C cups or bigger
Not a taur
Sufficient lust (33+)
Biped with knees, apparently

Also, I just realised that this will probably spark a million threads from newbie players about removing silicone from their body, because they’re the same type of players to just report Badger as soon as they meet her.
*/

public function secOpMaleTitfuck(response:String = "intro"):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Natetheman223");
	
	switch(response)
	{
		case "intro":
			output("Looking down at the kitty boy, you raise a brow while you consider what that body can do - other than fight.");
			if(!pc.isChestExposed()) output(" You begin to work your [pc.upperGarments] off, freeing your [pc.tits].");
			else output(" Your [pc.hands] idly climb up to your [pc.tits], thinking about what you’re going to do with them.");
			output("\n\n");
			if(enemy.HP() <= 1)
			{
				output("<i>“Hey, catboy. If you see me getting my clothes off, you should probably start getting your’s off, too,”</i> you suggest, " + ((pc.isBiped() && pc.hasKnees()) ? "crouching to your [pc.knees]" : "getting down") + " between the security operative’s legs. He nods quickly at that, seeming nervous yet subtly aroused. Your [pc.eyes] are drawn to the bulge in his cyber-suit, which disappears while said suit comes loose. He must’ve disabled his defenses.");
			}
			else
			{
				output("<i>“Nice to see you are already prepared for this,”</i> you remark, " + ((pc.isBiped() && pc.hasKnees()) ? "crouching to your [pc.knees]" : "getting down") + " between the security operative’s legs. He nods quickly at that, seeming nervous yet subtly aroused. Your [pc.eyes] are drawn to the naked package he is carrying below his belt.");
			}
			output(" You watch his cock spring up");
			if(!pc.isBimbo() && pc.libido() < 30) output(" and a smile forms on your [pc.lips] as you prepare yourself");
			else if(pc.isBimbo() || pc.libido() >= 70) output(" and a singular droplet of drool falls from your slightly opened mouth");
			output(". You set his discarded armor to the side and take a good look at his sleek, nude body, your focus eventually coming right back down to the chrome cock shining in front of you.");
			if(silly) output("\n\n<i>“Wow! Your penis is gigantic!" /*+ " Gigantic! Your penis is literally the biggest thing in the tri-state area! Your penis is bigger that a small elephant! It’s bigger than like, a tree! A big ol’ tree! Lots of branches on your penis! You must wake up every morning and thank the good Lord above! You’re truly blessed!"*/ + " Congrats!”</i> You exclaim" /*+ " the entire thing"*/ + ", barely holding a straight face.");
			output("\n\nHe gasps as you place your hand on the base of his gleaming dick, gently stroking up the shaft, to the tip, and back down to his balls. You carefully cup the orbs, giving them a very light squeeze as you kiss the head of his member. A tiny line of saliva connects your [pc.lips] to his cock for a brief moment as you break away. You lean forward and look into his pretty blue eyes, grabbing your [pc.tits] and placing each of them on either side of his 13-inch prick. With your boobs in position, you start your journey towards making this kitty blow his load.");
			output("\n\nBobbing up and down, you wobble your [pc.tits] against his penis, occasionally kissing the tip for encouragement. Although you’re moving quite slow now, it’s still enough to make the SecOp moan lightly with pleasure. He holds his arms submissively at his sides while you continue. The tiny droplets of aphro-laced pre-cum slipping from his cock-head show you how good of a job you’re doing, and you interpret it as a reason to speed up.");
			output("\n\nSo you do.");
			output("\n\nGrabbing the side of your tits harder, you squeeze them together on the catboy’s towering dick as your motions increase in speed. More little drops of drugged semen flow from his tip, sliding down his shaft to meet the breast flesh of your cleavage. It’s warm... so, so warm.");
			if(pc.isBimbo() || pc.libido() >= 30) output(" You take a finger and slide it up your boob, cleaning off a small bit of the cum and licking it from your digit - all while continuing the titfuck. God, it’s so good.");
			output(" The spunk serves as a lubricant of sorts; it’s perfectly wet and sloppy, more than enough to reduce the friction of the ongoing act.");
			output("\n\nYour eyes gaze up to the catboy’s face again. He’s panting and moaning, his cheeks are red, and his tongue is lolling out.");
			if(!silly) output(" He’s going to cum soon, that’s for sure. Just don’t stop.");
			else output(" Don’t stop him now... don’t stop him now... cuz he’s having A GOOD TIME! HAVIN’ A GOOD TIME!");
			output(" That’s not all, though. He’s reaching for his gear, dragging out several very large syringes full of... wait, is that... silicone in them? It’s a clear, gelatin like substance, but it’s somewhat hard to tell while you continue bouncing your [pc.tits] up and down on his dick. He manages to grab one in each hand. Is he going to do what you think he’s going to do with those? Now would be a good time to act, or just let him go for it.");
			output("\n\n");
			
			processTime(9);
			
			// [Stop him] [LetItHappen]
			clearMenu();
			addButton(0, "Stop Him", secOpMaleTitfuck, "stop", "Stop Him", "There’s no way he’s going to inject that substance into you.");
			addButton(1, "LetItHappen", secOpMaleTitfuck, "let it", "Let It Happen", "Silicone or not, whatever’s in those needles will increase the fun.");
			break;
		case "stop":
			output("You just wait for the right moment as you resume pleasuring him, pretending you have no idea what he’s doing, despite the fact that you’re ready. He prepares to sink the syringes into you, aimed right at your [pc.tits]. As they come down your hands move off your chest to catch his wrists, gripping them tightly. You look at him right in the face with a smug smile while you hold his arms in place.");
			output("\n\n");
			if(pc.siliconeRating("tits") <= 0) output("<i>“What’s the matter, are a pair of [pc.breastCupSize] tits too small for you?”</i> you ask");
			else output("<i>“I’ve already got enough silicone in my girls; I don’t need more,”</i> you say");
			output(", still tightly holding his arms up.");
			output("\n\nHe blushes as he speaks, saying, <i>“I just thought that... it could be a bit more fun... if they were a bit bigger?”</i> He’s nervous, clearly, and plenty of factors contribute to that.");
			output("\n\nYou twist his wrists slightly, causing him to yelp and drop the syringes to the floor.");
			if(!pc.isAss()) output(" You push them to the side, out of range of his reach.");
			else output(" You grab them both and " + (!silly ? "throw" : "yeet") + " them off to the side, so hard that they shatter when they hit the floor, splashing silicone all over the ground.");
			output(" <i>“Let me show you that they don’t need to be any bigger to make you have a good time. Now,");
			if(pc.isNice()) output(" please, don’t");
			else output(" you’d better not");
			output(" try anything else.”</i>");
			output("\n\nYou place your hands back on your tits, squishing them against his cock. It’s just as hard as ever, pre-cum still leaking from the tip. Except now, you’re more determined than before to show him what you’re capable of with your current chest. Moving your [pc.tits] up and down at " + (!silly ? "a higher speed" : "Mach 3") + " should show him. You continue where you left off, just much faster now, forcing your [pc.breastsNoun] up and down rapidly on his cock, all while his body hopelessly shakes and trembles with pleasure.");
			output("\n\nThe <i>‘ah’</i>s coming from his mouth get higher and higher, his hips starting to buck upwards to send his dick between your [pc.breastsNoun] faster as he finally reaches his peak. A thick rope of aphro-laden semen explodes from his tip, shooting just past your face and up into the air. He moans loudly and girlishly as several weaker spurts blow from his tall dick. Eventually, the orgasm subsides and you slow you pace...");
			if(pc.isBimbo() || pc.libido() >= 30) output(" but not before you make sure to lick up the lust-drugged cum from his cockhead. It’s just sooo good...");
			output(" He breathes very heavily, his lips parted slightly while he begins to calm down.");
			if(pc.isBimbo() || pc.isAss() || pc.libido() >= 70) output("\n\nA thought crosses your mind. Maybe you’re not done just yet. You take the kitty’s dick into your hand, suddenly squeezing it tightly. He winces as you jerk him off almost painfully. You bite your lip; you can practically see the masochistic tendencies on his face. After squeezing out a few more drops of semen, you decide to leave the security operative alone with an erection." + (!pc.isBimbo() ? " After all, after that little stunt he tried to pull, he deserves it." : ""));
			output("\n\nAfter some time, you sit up and begin to wipe yourself off. The kitty watches you, also sitting up slowly, though by the time he actually gets ready, you’re already");
			if(!pc.isChestExposed()) output(" clothed and");
			output(" on your way.");
			output("\n\n");
			
			processTime(5);
			// +50 lust
			pc.lust(50);
			
			CombatManager.genericVictory();
			break;
		case "let it":
			var bigPumps:Boolean = (pc.isBimbo() || pc.libido() > 70);
			
			output("You decide not to act. Whatever he’s got in those syringes, silicone or other, will most certainly make this more fun. You just keep bouncing your tits on his dick, completely ignoring his actions and putting your focus on the member in front of you.");
			output("\n\nWith your focus on the almost hypnotic, gleaming cock, you only see the needles for maybe a half second before they plunge into each of your boobs. You wince at the sudden poke only able to stop and watch as the kaithrit rapidly forces over half of the sloshing contents into your chest. Your breasts swell rapidly as the self-guided bio-silicone gelatin enters them, " + (pc.hasFeet() ? "your toes curling" : "your butt clenching tightly") + " while you blow through cup sizes. Now that the draining vessels are right in front of you, you can really see just how <i>huge</i> they are. The SecOp’s hands can’t even completely wrap around each one, and you’re forced to watch as his thumbs keep pushing the hammers down farther and farther, sending more and more silicone into you. He looks at you with a devious smile as he pulls the empty needles out.");
			output("\n\n<i>“");
			if(pc.siliconeRating("tits") <= 0) output("Just thought you could do a better job with bigger boobs...");
			else output("I could tell you already had silicone in your boobs, I just thought you might want more...");
			output("”</i> he says, looking at your now swollen breasts.");
			if(bigPumps)
			{
				output("\n\nYou look down at your jugs. They’re way bigger than they were... but are they really big enough? Surely he’s got more he’d love to pump into you. <i>“More,”</i> you say simply.");
				output("\n\n<i>“Wait, you’re not ma-”</i>");
				output("\n\n<i>“More!”</i> you shout, squeezing your breasts tightly around his dick. He quickly grabs two more syringes from the messy pile spilling from his pack and proceeds to plunge them into your boobs again. Even more bio-silicone flows into you, and you wait patiently while biting your lip. Eventually, all the tit-swelling gel in the second set is inside your breasts. The kaithrit seems... intimidated by you, with the power move you just pulled. Your boobs are huge compared to what they were before. He then pulls the needles out.");
			}
			output("\n\nYou remain unfazed by the changes you just underwent, wobbling your freshly inflated boobs up and down on the metallic dick between them. You can literally feel the freshly injected implants under your hands, like all that’s separating you from grabbing them directly is a layer of [pc.skinFurScales]. Regardless of what’s inside your tits, the kaithrit obviously loves how they feel on his dick.");
			output("\n\nMuch more pre-cum than before flows out from the tip of his cock, practically pouring out onto your blown-up balloons. You don’t mind a bit, using the drug-laced fluid as lubricant like you did earlier. He seems to be enjoying this <i>much</i> more than he was before he gave you the little ‘upgrade’. In fact, you’re fairly sure he’s going to cum soon!");
			output("\n\nYou start moving faster, trying to get used to giving boobjobs with huge boobs. You can feel the security operative shaking as he bucks his hips harder into you, his shaft repeatedly poking from the top of your bust. It’s a very pleasant experience for both of you.");
			output("\n\nThe <i>‘ah’</i>s escaping from his mouth get higher and higher, his hips bucking harder to bury his dick deeper into your tits as he finally reaches his peak. A thick rope of semen explodes from his tip, shooting just past your face and up into the air. He moans loudly and girlishly as several weaker spurts blow from his tall member. Eventually, the spurts subside and you slow down...");
			if(pc.isBimbo() || pc.libido() >= 30) output(" but not before you make sure to lick up the lust-drugged cum from his cockhead. It’s just sooo good...");
			output(" He breathes very heavily, his lips parted slightly while he begins to calm down.");
			output("\n\nYou stand up while the SecOp recovers, looking at your new breasts. Bio-silicone is stuffed tightly within them.");
			if(pc.siliconeRating("tits") <= 0) output(" The mass seems to act a lot like your natural boob-flesh normally would, though its bounce defies gravity and tends to form a perfectly rounded sphere within each of your boobs, making them distinctly shaped. You’ll have to get used to this.");
			if(!pc.isChestExposed()) output(" Now stood up, you get dressed. Your chest feels pretty tight in your clothes, but it’s not exactly unpleasant.");
			output("\n\nBy the time the catboy has fully recovered, you’re up and on your way.");
			output("\n\n");
			
			processTime(7);
			// +6 breast silicone normally
			// +12 breast silicone if >70 libido or PC is a bimbo
			nymFoeInjection(pc, 3, (!bigPumps ? 6 : 12));
			// Max out lust
			pc.maxOutLust();
			
			CombatManager.genericVictory();
			break;
	}
}

