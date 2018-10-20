import classes.Characters.SlamwulfeDrone;

//Punk SecOp Core Idea
//Kaithrit, comes in female in male flavors. Shares several scenes with a few unique based on gender.
//Girl has big knockers. Boi has A or B cups.
//Wear’s <i>“augment weave armor”</i> that looks sorta like the crysis suit without a helmet
//Ideal for interfacing with tech. Can be remote-opened by a hack or the SecOp’s radio implant.
//Cybernetic implants have distinct seams
//
//Personality/Interaction Flow:
//Generally orderly and business-like. The pirate equivalent of cops.
//Notes the the PC isn’t supposed to be here (unless the PC has a jumper suit & bun ears or a rat armor and mouse ears).
//PC is escorted back to the elevator
//If PC resists, PC is subdued and dragged back to the elevator.
//Has a pair of <i>“Slut Goggles”</i> for restraining defeated foes. Uses electromagnetic fields to hyperstimulate the pleasure centers of the brain while suppressing the parts responsible for discerning between fantasy/reality. At the same time, they play high-def VR porn.
//Allows for lewd loss scenes from enemies who might not be turned on.
//Allows for more variety in loss scenes, ala Mindwash Visor.
//Still have the option of doing normal loss scenes instead, maybe gated behind turning on the enemy?
//If PC is goggled, comes to in the elevator, maybe randomly covered in fluids.
//
//Cybernetic Mods:
//Finger/Foot paw-pads replaced with rubberized grip assists
//Holovisor projected over eyes for targeting assist. Projectors built into sides of head.
//Antenna implant in right ear for always-on comms
//Sphynx-grade artificial tendons for hyper-pounce jumping. (12’ vertical leaps!)
//Male: 13”</i> robocock with rapid-brewing cum-tanks and throb-o-matic pulsator. (Latex/Rubbery in appearance.)
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

public function showPunkSecOp(nude:Boolean = false):void
{
	if(enemy == null || enemy.hasCock()) showBust("PUNK_SECOP_MALE" + (nude ? "_NUDE":""));
	else showBust("PUNK SECOP_FEMALE" + (nude ? "_NUDE":""));
	showName("PUNK\nSECOP");
}

//Encounter Texts:
public function encounterPunkSecOp():Boolean
{
	showPunkSecOp();
	var tEnemy:Creature = new CyberPunkSecOp();
	setEnemy(tEnemy);
	//First time male
	if(tEnemy.hasCock() && flags["MET_SECOP_MALE"] == undefined)
	{
		output("\n\n<i>“Hey, you aren’t supposed to be here!”</i>");
		output("\n\nA swaggering kaithrit in a suit that looks like it’s made from coiled steel is advancing with long, bounding leaps. The bright blue holovisor across his eyes flickers, painting a red outline around the shape of your body.");
		output("\n\nHe’s too sure of himself to bluff and too fast to hide from. You’ll have to fight!");
	}
	//Female
	else
	{
		output("\n\n<i>“Oh come on! Another one?”</i> A bosomy kaithrit in a suit that looks like it’s made from coiled steel is advancing with a slow shake of her head. <i>“Independents aren’t allowed up here without a boss’s okay and you, cutie, do </i>not<i> have a boss’s okay.”</i> The pale blue band of her cybernetically-projected holovisor lights up with an outline of your body as she finishes some kind of scan. <i>“Come on. If you walk back to the elevator on your own, " + pc.mf("you won’t have to tell everyone you got your ass whupped by a girl.","I won’t have to leave any bruises on that pretty face of yours.") + "”</i>");
		output("\n\nYou’ve been given a choice - be escorted away or fight for the freedom to continue your exploration.");
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
	if(rand(3) == 0) addButton(0,"Next",wsanTaurServicingLoss);
	else if(rand(2) == 0) addButton(0,"Next",slutSlutLossScene);
	else addButton(0,"Next",wallSlutPunkSecOpEnd);
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
	output("A low bass thrum ripples through the wall into which you’ve been embedded, though not uncomfortably. There’s a sort of inflatable, rubberized padding lining the socket around your low chest, stretching all the way to your waist. Your [pc.legOrLegs] dangle" + (pc.legCount == 1 ? "s":"") + " uselessly out the other side, not quite able to touch the ground" + (pc.tallness > 6*12+6 ? " in spite of your endless inches of height":"") + ". Worse is that your arms are similarly restrained, leaving you to rely on a band under your armpits to hold you up.");
	output("\n\n" + (pc.lust() < 70 ? "What you see does not inspire your confidence.":"What you see absolutely thrills your lust-addled brain.") + " Neon lights bathe a crowd of debauched laquines in unnatural pinks and blues as they writhe and twist about on a dancefloor, naked or next to it, casually swapping spit and bodily fluids like the obscene sluts they are. Around the pit of sweaty, grinding bunnies are walls like the one in which you now find yourself. Each one has at least three or four slack-jawed servants languishing in the same sort of bondage as you, already painted with two or three layers of thick laquine seed and begging for more.");
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
	output("\n\nHer partner is smaller but far more done up. Her pink fur all but glows under the flashing neon lights, complimented by luminescent purple mascara and lip gloss so shiny that you can see your reflection in it. She doesn’t bother stripping out of her fishnet shirt or package-defining, shrink-wrapped shorts, though the latter garment has gained a few gaps along the seam that appear to grow larger with every stitch-destroying throb of her bound dick. Pink winks at you and reaches between Gray’s legs to heft her balls for your inspection.");
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
	output("<i>“Hi there.”</i> A breathy voice whispers in your ears, accompanied by the sight of a faintly glowing kaithrit sex-pot. <i>“I’m Anayill Siltoya, and welcome to your first day on the job as a TamaniCorp female relief specialist, more commonly known as a pussy-slut.”</i> She smiles winningly. <i>“The idea of being blindfolded and mounted with your face in the seat of a chair for twelve hours a day might seem kind of scary to you right now, but I promise that by the time you’ve finished this training holo and undergone the complimentary libido adjustment, you’ll be looking forward to it.”</i>");
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

//Victory
public function defeatASecop():void
{
	var enemies:Array = CombatManager.getHostileActors();
	for(var i:int = 0; i < enemies.length; i++)
	{
		if(enemies[i] is SlamwulfeDrone) CombatManager.removeHostileActor(enemies[i]);
	}
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
	pc.cuntChange(x,enemy.cockVolume(0))
	{
		output("\n\nThe mewling feline’s eyes roll back from your [pc.vaginaNoun " + x + "]’s clutching embrace, and he makes a vain attempt to fuck you back. His hips surge upward, burying his cock in to the hilt, but he doesn’t have any leverage from this angle. Your bodyweight bears him right back down to the ground with a lurid squelch.");
		if(pc.vaginas[x].wetness() < 3) {}
		else if(pc.vaginas[x].wetness() < 5) output(" Dribbling pussy-juice trickles over his loins.");
		else output(" Streamers of pussy-juice soak his loins.");
		output(" Groaning in delight, the pirate grabs your [pc.thighs] and squeezes, too enamored by what you’re doing to him to speak, let alone think.");
	}
	//Have cock
	if(pc.hasCock()) 
	{
		output("\n\nYou grab him by the wrists and put his hands to work somewhere better: on your [pc.cocks]. Just like with your thighs, he sets to squeezing and stroking immediately, uncaring that it’s your phall" + (pc.cockTotal() == 1 ? "us":"i") + " that he’s tugging. His thumbs explore with slow strokes while his palms tighten up, hugging your veined length" + (pc.cockTotal() > 1 ? "s":"") + " firmly. You identify the exact moment he realizes what he’s doing by the sudden change in his strokes. A lifetime of jacking off his own dick has prepared him for this exact scenario, and rather than stopping, he shifts his grip and begins moving with purpose, wringing out a ");
		if(pc.cumQ() < 20) output("bit");
		else if(pc.cumQ() < 200) output("string");
		else if(pc.cumQ() < 2000) output("stream");
		else if(pc.cumQ() < 10000) output("spurt");
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
		if(pc.cumQ() < 50) output(" They fall in sticky webs on his chest.");
		else if(pc.cumQ() < 250) output(" They plaster his chest in a thick, dripping coat of masculine release.");
		else if(pc.cumQ() < 1000) output("They splatter his face and cascade over his chest in a thick, dripping coat of masculine release.");
		else if(pc.cumQ() < 5000) output("They drench him from head to belly in a puddling coat of exquisite, masculine release.");
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
		output("\n\nYour [pc.cocks] blast" + (pc.cockTotal() == 1 ? "s":"") + " out every drop of remaining [pc.cum] in your body.");
		if(pc.cumQ() >= 20000) output(" It’s a titanic deluge of room-flooding sperminess that catches you both completely by surprise. The kaithrit can do little but throw his arm up in front of his face as you hose him down and slowly bury his body in an ever deepening pool of [pc.cumVisc] spunk.");
		else if(pc.cumQ() >= 2000) output(" It’s a wonderfully thick wave of sperminess that takes you both by surprise. The kaithrit throws his arm up in front of his face, but it doesn’t stop you from painting him in a fresh layer of sloppy spunk, or producing a nice, thick pool of excess semen for him to bathe in.");
		else if(pc.cumQ() >= 100) output(" Splattering gouts of sperminess batter his face like erotic missiles, bursting into explosions of erotic relief.");
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
		output("\n\nSynapses humping with carnal desire, a fire burning burning bright and hot, you thrust your [pc.cocks] into the sinfully warm enclosure of the milky catgirl’s pillowy breasts" + (pc.hasVagina() ? ", your [pc.pussies] creaming from the rush of it all":"") + ". Her hot channel molds to the shape of your overwhelmingly powerful [pc.cockNounSimple " + x + "]; The antenna on the side of the pirate’s head wobbles from the impact of of your hips ramming against her divine bosom." + (pc.balls > 0 ? " Your [pc.sack] claps lewdly off her tits, coming away drenched in her nerve-inflaming blue milk before slapping and splattering into their underside again.":""));
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
		output("\n\nJust before climax, you slam your [pc.knot");
		if(y >= 0 && pc.hasKnot(y)) output("s");
		else output(" " + x + " ");
		output("] into the kaithrit pirate, sealing her pussy" + (y >= 0 ? " and ass simultaneously":"") + ". The thought that your liquid virility isn’t going anywhere else is the last satisfying thought you need to cross the orgasmic line.");
	}
	else output("\n\nAs your [pc.balls] prepare the first surge of cum, you slam your hips into the kaithrit pirate’s, a feral roar preceding your effortless ejaculation.");
	// PC low cum
	if(pc.cumQ() < 1000) output("\n\nHer synth-pussy makes it all too easy to achieve release, and with closed eyes you are intimately aware of the pleasant travel each rope of spurting [pc.cum] makes up from your [pc.balls] through your programmatically massaged urethra... right into the pirate’s waiting womb" + (y >= 0 ? " and colon":"") + ". You gently rock against her body, your [pc.cocks] flexing and swelling with salty deluge." + (pc.cockTotal() > 3 ? " [pc.CumVisc] [pc.cumNoun] sprays from your other dicks, warming your bellies with a helping of of [pc.cumFlavor]-flavored seed.":""));
	// PC plenty of cum
	else if(pc.cumQ() < 5000)
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
	output("\n\nThe pussy between the kaithrit’s legs may be cybernetic in design, but there’s no chance it wasn’t designed for your [pc.cock " + x + "] right here, right now. You lock-on to her boiling synthetic hole, balling your hands into fists, visible heat wafting from your grit teeth." + (!pc.isCrotchExposed() ? " You growl and rip off your [pc.lowerUndergarment] off with all speed, allowing your [pc.cocks] to leap from their lair, fat cables of of [pc.cumColor] pre-seed pouring from their ballooning tips, struggling to control your raging lusts.":"Fat cords of [pc.cumColor] pre-seed pour from [pc.eachCockHead], sizzling against the ground as you feverishly jerk yourself to full mast, growling as you seek to control your raging lusts."));
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
	if(pc.balls > 0) output(" The enchanting handjob your [pc.balls] " + (pc.balls == 1 ? "receives":"receiving") + " makes matters worse. <i>Better</i>.");
	output(" Stars be damned, whatever she’s doing isn’t nearly enough to relieve you of the pressure building down there, making you feel as if you’re about to explode!");
	if(pc.hasVagina()) output(" The effect it has on your [pc.pussy], or had, was felt in the " + (!pc.isSquirter() ? "body-rumbling feminine orgasm you just had":"projectile of [pc.girlCum] that just splattered the giggling pirate") + ".");

	output("\n\nWhen you feel two hands on your shoulder blades, you shrug them off and wrestle back! Though your vision may be blurred, the intoxicating scent of cyber-cunt and the sexual overclock inflicted on you give you just enough focus - <i>and strength!</i> - to stay in control. The robo-cat yelps when you spin and force her down, falling on her like a sack of bricks. Both of your [pc.arms] wrap around her body, manhandling the hell out of her tits, squeezing those pebbly cybernips to soak your hands and the ground in tasty trick milk." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " You press your your head to her back and, thanks to your endowed organ, work your [pc.tongue] around her waist, happily teasing her sensitive nips and mingle with her own augmented organ.":""));

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
	output("\n\n<i>“AwwAhaaaa!”</i> she cries ruefully, <i>“fine, fiiineeee! I give up I submit justfuckmealready!”</i>");
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
	// PC low cum
	if(pc.cumQ() < 1000)
	{
		output("\n\n[pc.CumVisc] [pc.cumNoun] spurts. and spurts, and spurts into the cyber-kitty’s stretched womb, her synth-pussy programmatically ensuring maximum [pc.sack] draining efficiency. Your [pc.cum] is delivered to the door by your swollen cumslit, and every throbbing, pulsing ejaculation vibrates her body and yours." + (y >= 0 ? " Your second [pc.cockNounSimple " + x + "], lodged deep in her ass, squirms against your first through the nerves separating them.":""));
		if(freecocks > 0) output("Your other " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", without " + (freecocks == 1 ? "a hole of its own, sadly paints":"holes of their own, sadly paint") + " part of your body or hers with [pc.cumColor] seed.");
	}
	// PC plenty of cum
	else if(pc.cumQ() < 10000)
	{
		output("\n\nThe kaithrit’s synth-pussy demonstrates its expertise at milking your " + (pc.balls > 0 ? "[pc.balls]":"body") + " of every drop of [pc.cumColor] spunk. As you fill her spread womb" + (y >= 0 ? " and spasming ass":"") + " with load after thick load of [pc.cumVisc] [pc.cumNoun], the indescribable sensation of a million gentle prods and palpations against your urethra make every tactile, voluminous ejaculation an exquisitely soft and memorable one. Her belly noticeably swells with the sheer amount your pour into her womb" + (y >= 0 ? " and colon both":"") + ".");
		if(freecocks > 0) output("Your extra " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", limply hanging outside, pitifully shoot" + (freecocks == 1 ? "s":"") + " over her butt and your body.");
	}
	// PC lots of cum
	else
	{
		output("\n\nYou have no idea if this techno-feline’s womb is modded, but it’s sure swelling gravid with [pc.cum] like any other would. Her spunk-sucking pussy expertly massages and and palpates your urethra, making every powerful ejaculation an exquisitely pleasurable and unforgettable experience as you pump her womb" + (y >= 0 ? " and colon":"") + " full and fuller with [pc.cumVisc] [pc.cumNoun].");
		if(pc.hasKnot(x)) output(" You’re bloating her so much that with each pulse and throb, [pc.cumColor] seed begins to leak out around your knot" + (y >= 0 && pc.hasKnot(y) ? "s":"") + ".");
		if(freecocks > 0) output(" Your unslotted " + (freecocks == 1 ? "member helplessly sprays":"[pc.cocksLight] helplessly spray") + " [pc.cum] all over her back and yourself.");
	}
	// Merge
	// PC not in rut
	if(!pc.inRut()) 
	{
		output("\n\nThe pirate cat falls on to your [pc.chest], ecstasy-ridden head landing to the side of yours. Her eyes rolled back some time ago, and now she simply lies splayed and panting in your embrace. Thankfully, the amorous tingle in the back of your head is gone. ");
		if(pc.hasKnot(x)) output("So long as your " + (pc.hasKnot(y) ? "[pc.knots " + x + "]":"[pc.knot " + x + "]") + " are inflated, you won’t be going anywhere, especially not as you’re still cumming a bit! You get your hands around her " + (pc.cumQ() >= 10000 ? "gravid ":"") + "belly and hold tight, hoping nobody else’ll stumble upon your tryst. Her gratified purring helps you catch some shut-eye in the meantime.");
		else output("With a big, sexy cat girl on top of you and your [pc.cocksLight] deflating warmly inside her, you have little strength after your monumental orgasm. Wrapping your hands around her " + (pc.cumQ() >= 10000 ? "gravid ":"") + "belly, you snuggle up and catch some peaceful shut-eye.");
	}
	// PC in rut
	else
	{
		output("\n\nGroaning and half-whimpering, you roll over on the augmented pirate and tug your ");
		if(pc.hasKnot(x)) output("barely deflated " + (pc.hasKnot(y) ? "[pc.knots " + x + "]":"[pc.knot " + x + "]"));
		else output("spent " + (y >= 0 ? "[pc.cocksLight]":"[pc.cock" + x + "]"));
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
	else if(pc.isBro()) output("You grin and at at your crotch. <i>“Yeah you can lick...”</i>");
	//Nice/Misch
	else if(pc.isNice() || pc.isMischievous()) output("\n\n<i>“Since you offered" + (pc.isMischievous() ? " sooo generously":"") + "... I do have something you and your tongue can take care of.”</i>");
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
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " nods all too seriously. <i>“Okay...”</i> [enemy.HeShe] crawls forward unsteadily" + (enemy.biggestTitSize() >= 2 ? ", nearly tipping over from the weight of her own jiggling tits":"") + ". [enemy.HisHer] visor shuts off to give [enemy.himHer] a better view, and [enemy.hisHer] wide, feline eyes drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. The slits of [enemy.hisHer] pupils widen in unexpected desire. <i>“That’s... a really nice pussy.”</i> [enemy.HeShe] licks [enemy.hisHer] lips" + (enemy.hasCock() ? ", the distention in the crotch of [enemy.hisHer] suit engorging until it splits apart to reveal the silvery length of [enemy.hisHer] cybernetic breeding tool.":", the silver of her suit splitting apart to reveal two hard nipples."));
	}
	//Lust
	else
	{
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " scrabbles forward madly" + (pc.biggestTitSize() >= 2 ? ", her heavy tits jiggling and bouncing as her armored suit pulls back to expose them":"") + ". <i>“Yessss!”</i> [enemy.HeShe] shuts down [enemy.hisHer] holovisor for a better view, allowing [enemy.hisHer] lust-dilated eyes to drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. <i>“I am going to eat the fuck out of this.”</i> [enemy.HeShe] licks [enemy.hisHer] lips, drooling slightly." + (enemy.hasCock() ? " The corded silver of [enemy.hisHer] armored suit splits at the crotch to reveal an equally reflective piece of cybernetic genitalia - all thirteen inches of throbbing robo-cock.":"") + " A too-pleased giggle announces just how happy this turn of events has made [enemy.himHer]. <i>“You have the prettiest pussy on station.”</i>");
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
	//Enemy lost by lust and is male
	if(enemy.lust() >= enemy.lustMax() && enemy.hasCock())
	{
		output("\n\nHeavy slapping sounds signal that something far lewder is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kitty-boy’s feet cradling [enemy.hisHer] cock, pumping up and down it, [enemy.hisHer] toes curled tightly around [enemy.hisHer] gleaming chrome cock-head. The strokes match the pace of [enemy.hisHer] tongue perfectly, like in [enemy.hisHer] head its [enemy.hisHer] dick that’s sinking so deeply into your folds, causing you to moan with such sweet happiness.");
	}
	//Enemy lost by lust and is female
	else if(enemy.lust() >= enemy.lustMax())
	{
		output("\n\nA second set of lurid squelches signals that something just as lewd is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kittenish woman’s incredible flexibility. She has one foot bent almost double, thrusting a few of her fluffy toes deep into her own cunt. The strokes perfectly match her tongue’s motions, like she’s substituting one limb for another. Maybe that’s why she’s so good with her tongue. She just folds herself in half and just licks herself into ecstasy.");
	}
	//Merge orgasm
	output("\n\nEverything changes when the augmented kaithrit’s tongue twists itself into a helix. Every part of your pussy is stimulated: the top, bottom, sides, and even your g-spot. What’s more, it makes you feel completely full, and it’s slowly uncoiling, widening to open you up further and further. You cry out in sudden ecstasy as it all becomes too much. With a scream of insensate bliss, you cum.");
	if(!pc.isSquirter()) output(" [pc.GirlCum] trickles into [enemy.hisHer] waiting maw and slicks [enemy.hisHer] cheeks.");
	else 
	{
		output(" [pc.GirlCum] floods [enemy.hisHer] waiting maw and bulges [enemy.hisHer] cheeks. Excess splatters across the rest of [enemy.hisHer] face until he’s glazed");
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
	output("\n\nSighing happily, you step away and wipe a bit of sweat from your brow. The security operative looks a lot more like a security slut, glazed in your juices as [enemy.heShe] is. He’s in no shape to stop anyone from going anywhere but balls-deep in [enemy.hisHer] ass in the near future... and honestly, [enemy.heShe] might like that. ");
	if(pc.isBimbo()) output("You smile sweetly. <i>“Like wow! You’re super good at licking pussy. Maybe you should just do that instead of trying to be like, mean and stuff!");
	else if(!pc.isAss()) output("You mumble, <i>“Thanks,”</i> wondering if he’s in any shape to understand. In the end, you suppose it doesn’t matter either way.");
	else output("What a slut.");
	output("\n\nGathering up your equipment, you spare a brief glance at your foe’s belongings for any prizes before you go.");
	processTime(25);
	enemy.girlCumInMouth(pc);
	pc.orgasm();
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
	else if(pc.isNice()) output("You gently but firmly inform the defeated feline that while you aren’t going to hurt or abuse him, you do expect [enemy.himHer] to make up for the trouble he’s caused with [enemy.hisHer] mouth and tongue.");
	//Misch
	else if(pc.isMischievous()) output("<i>“I’ve got good news and bad news for you, kitty-cat. The good news is that I won’t hurt you. I’m just gonna fuck your mouth. The bad news is that I’m going to leave afterward, so we won’t get to snuggle.”</i>");
	//Hard
	else output("<i>“You’re jaw’s going to be sore when we’re finished here, kitty-cat. I deserve a little payback for the trouble you’ve caused.”</i>");
	//Merge
	//Unexposed no new pg
	if(!pc.isCrotchExposed()) 
	{
		output(" It’s time [enemy.heShe] saw what he’s going to be servicing. You whip it out, all " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of [pc.cockNoun].");
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
		output("\n\nLike a thirsty galotion, [enemy.hisHer] eyes light up and lock on like the targeting system of a dick-seeking missile. <i>“I get to suck this?”</i> The holographic band across the kaithrit’s eyes fades away to give [enemy.himHer] an unobstructed view. <i>“Mmm... all of this...”</i> [enemy.HeShe] sniffs at it, nose twitching gently, then scooches even closer, [enemy.hisHer] ears falling back in contented submission. <i>“I don’t mind." + (pc.cocks[x].cLength() < 12 ? " It’s not stupid huge like what those jumpers pack.":"It’s not undersized like one of those rodenian rats. A little jaw-stretching will be... fun.") + "”</i> [enemy.HeShe] licks lips so that they shine. <i>“So fuck my face already, big [pc.guyGirl].”</i>");
	}
	//Merge
	output("\n\nYou need no further invitation. Grabbing the security operative by the back of the head (and careful of [enemy.hisHer] implants) you tug [enemy.himHer] forward onto your [pc.cock]. [enemy.HeShe] doesn’t struggle - anything but. [enemy.HisHer] mouth opens wide and [enemy.hisHer] tongue rolls out, offering you a slick red carpet to slide your [pc.cockHead] across on its journey to adoring oral service. [enemy.HisHer] [enemy.lipsChaste] feel wonderful, closing just tight enough to form a spit-slick seal once you’ve pushed past them and [enemy.hisHer] tongue... oh stars!");
	output("\n\nThe kaithrit’s tongue boils out of [enemy.hisHer] mouth like a living serpent, sliding out two inches for each one you add. This crossways motion assaults you with double the friction along your sensitive underside, like half your dick is slowly pumping in while the other half is midway through a real jack-hammering hummer. You gasp, then moan, then stop moving at all, content to revel in the sensation of that slick muscle spooling out - for now. You float on a curtain of undulating muscle, surrounded by the embrace of spit-slick lips.");
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
	output("\n\nYou fuck the punky security operative’s overlong muscle back into [enemy.hisHer] mouth with a single mighty push. Spit dribbles from [enemy.hisHer] cheeks in sudden surprise, and [enemy.heShe] lets out a single inarticulate gurgle. " + (pc.cocks[x].cLength() < 12 ? "Running your fingers through [enemy.hisHer] hair, you admire your prize. [enemy.HisHer] hot breath is washing over your [pc.thighs] and [pc.belly]. [enemy.HisHer] tongue squirms and wriggles beneath your [pc.knot " + x + "]. The longer you hold [enemy.himHer] there, the more comfortable [enemy.heShe] seems, and all too soon, the slut-cat’s cheeks are rhythmically hollowing with eager suckles.":"Running your fingers through [enemy.hisHer] hair, you admire your prize, impaled partway down your length. [enemy.HeShe] can’t take the whole thing. There’s simply too much [pc.cockNounSimple] for [enemy.hisHer] untrained throat to handle, no matter how [enemy.heShe] tries. [enemy.HeShe] can grab at your [pc.butt] and strain, water streaming down [enemy.hisHer] eyes, but [enemy.heShe] only manages another inch or two at the most.\n\nGood for him. Maybe next time you bump into him, he’ll be a little better at it."));
	//Low libido
	if(pc.libido() < 50) output("\n\n[enemy.HisHer] tongue refuses to let you go. It loops around and around even as you draw back, muscle coiled into a helix of cock-milking pleasure such that you can’t even tug your [pc.cockHead] the whole way out. You’re <i>forced</i> to thrust yourself back inside by the thirsty kaithrit. [enemy.HisHer] sloppy, silken maw demands it. Like a sexual tractor beam, it inexorably pulls you onward. It compels you to fuck [enemy.himHer] faster than you meant to. Harder.");
	//High libido
	else output("\n\[enemy.HisHer] tongue clings on tightly as launch into motion. Even when you draw back, [enemy.hisHer] muscle squeezes into a helix of cock-caressing pleasure that feels so sensually compelling that your [pc.cockHead] never quite manages to leave [enemy.hisHer] mouth - not that you ever had any intent to do so. You slam your hips forward and back, spearing your turgid length through this frothing, cutely pursed lips with glee. [enemy.HisHer] mouth is just so <i>fuckable</i>! You’d be jackhammering [enemy.hisHer] face even if [enemy.hisHer] tongue wasn’t lavishing you with heavenly sensations.");
	//Merge
	//Longdick jacking
	if(pc.cocks[x].cLength() > 12)
	{
		output("\n\nA soft-fingered hand wraps around the exposed length of your too-big dick with a sort of desperate affection. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles at its absolute limit, but [enemy.heShe] strokes all the same. [enemy.HeShe] jacks the extra dick like [enemy.heShe] can’t wait for you to bust a big, sloppy nut into [enemy.hisHer] mouth. [enemy.HeShe] strokes and [enemy.heShe] squeezes, adding a second hand to better please the jaw-straining boner. Leaking drool and pre provide plenty of pre-cum for [enemy.hisHer] nimble digits to work with as they wring you toward bliss.");
	}
	//else Second dick jacking
	else if(pc.cockTotal() > 1)
	{
		output("\n\nA soft-fingered hand wraps around " + (pc.cockTotal() == 2 ? "your other":"another") + " dick with a sort of desperate firmness. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles, slowly pumping that second cock. [enemy.HisHer] fingers curl and squeeze. [enemy.HisHer] palm, slick with sweat, glides effortlessly across the veiny length. At the apex of your thrusts, [enemy.heShe] squeezes tighter. When you draw back, [enemy.hisHer] grip relaxes. In no time at all, he’s twirling a finger in small circles just below the [pc.cockHead], smearing a dribble of pre-cum into your bare, musky maleness.");
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
		output("\n\nYour tremendously weighty nuts wobble back and forth with tremendous mass. They slap into the kaithrit’s collarbones aggressively, jiggling and jostling. [enemy.HeShe] swiftly abandons everything else to get [enemy.hisHer] hands on your oh-so-virile orbs, wrapping [enemy.hisHer] fingers possessively around your cum-swollen balls as if to claim the contents for himself. [enemy.HeShe] smothers them into [enemy.hisHer] face, drowning himself in your ball-musk, even while taking a dick-deep into [enemy.hisHer] throat.");
		output("\n\nThis cat is a real nut-slut! [enemy.HisHer] fingers sink into the capacious flesh as [enemy.heShe] sets into worshipping your [pc.balls], massaging them imploringly, begging them to brew up the fattest, thickest load of cum the galaxy has ever seen. Yet even with both hands, [enemy.heShe] can’t quite handle your rebellious sack or the fluid contents within. It wobbles dangerously with your ecstatic clenches. The more [enemy.heShe] plays with your balls, the more unstable they become, contracting and squeezing - so tight and heavy!");
	}
	//Merge
	output("\n\nYou’re so close!");
	output("\n\nThe kaithrit’s tongue tightens up abruptly, leaving you no time to think or react - only to swell in exquisite ecstasy. You cum straight into the capable little cock-sucker’s mouth. Pumping hard, you pound [enemy.hisHer] face through your climax, exactly the way [enemy.heShe] so clearly wants it. Tears stream from [enemy.hisHer] eyes while [pc.cumVisc] goo ");
	if(pc.cumQ() < 5) output("dribbles");
	else if(pc.cumQ() < 30) output("spurts");
	else if(pc.cumQ() < 300) output("pours");
	else if(pc.cumQ() < 1000) output("erupts");
	else if(pc.cumQ() < 5000) output("floods");
	else output("drowns");
	output(" [enemy.hisHer] throat.");
	if(pc.cumQ() >= 500)
	{
		output(" Watching [enemy.hisHer] cheeks bulge");
		if(pc.cumQ() >= 5000) output(" before giving out and releasing [pc.cumColor] sprays from the corners of [enemy.hisHer] mouth");
		output(" is a delight.");
	}
	if(enemy.hasCock()) output(" Meanwhile, a puddle of ignored, kittenish semen spreads below, hardly noticed.");
	//Second+ dick & 10+ mLs
	if(pc.cockTotal() > 1 && pc.cumQ() >= 10)
	{
		output("\n\nYou grab hold of your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " and make sure the rest of your orgasm goes exactly where it belongs: over [enemy.hisHer] ears and into [enemy.hisHer] hair");
		if(pc.cumQ() >= 500) output(", across [enemy.hisHer] forehead and down the tip of [enemy.hisHer] flaring nose");
		output(".");
		if(pc.cumQ() >= 1000) output(" Pretty much everywhere.");
		if(pc.cumQ() >= 5000) output(" You paint the kitty-[enemy.boyGirl] with your load inside and out until [enemy.heShe] is completely, thoroughly basted in cock-juice.");
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
		output("\n\nThe sight of it is enough to stir your passions and the parasite’s lusts together into a single torrent of focused desire. Droplets of lubricant dribble from your [pc.tailCount]. <i>“This is going to feel very, very good.”</i> You not entirely sure if you’re addressing him or your tail, to be brutally honest, but it hardly matters either way.");
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
	else if(pc.hasTailCunt(GLOBAL.TYPE_CANINE)) output("\n\nThe slim canid pussy at the end strains to swallow the feline’s girthy rod, its animalistic lips straining and taut. That silver cock is every bit thick as an ausar mod-junkie’s and and even harder. There’s a pang of disappointment as you slide down that there’s no knot to really pop your tail-pussy open, no gloriously engorged bulb of flesh to lock every droplet of cum inside, but the swollen mushroom head at the tip feels almost as good as it burrows deep, swallowed up by the concentric, flexing rings of muscle.");
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
		if(pc.cumQ() < 10) output("dribbles from the tip as your meager release peaks and wanes. Not even getting stuffed by a liter of virile, kitty-seed can bring you to produce any more.");
		else if(pc.cumQ() < 250) output("spurts in long ropes as your release peaks. With each eruption that’s shot inside you, you answer with your own, painting the kitten in [pc.cumColor] lines.");
		else if(pc.cumQ() < 8000) output("volleys forth in tremendous, kitten-soaking sprays. Each is more than an average man could hope to produce on his best day, and you’re pumping them out, one after another.");
		else
		{
			output("pours out in colossal eruptions, one after another. Each seed-filled tidal wave could impregnate a dozen women on its own, and you’re soaking the mewling kitten with all of them, splashing your [pc.cumFlavor] across his chin and face, drenching him in hot, liquid love." + (pc.cumQ() >= 15000 ? " A pool of it grows beneath him as you climax. There simply isn’t enough of him to hold it all, so you bathe him in it.":""));
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
	output("\n\nThe the soaking, milk-spraying tits clap back together, concussing you with bliss, just in time for you to continue your almost painfully intense orgasm. You cum with compulsive fervor, like you need to pump your molten, burning bliss directly into the fat kitty-titties. Wave after wave of glittering, liquid [pc.cumGem] pours into her cleavage only to rush back out, and through it all, the security operative is doing nothing but begging you to keep going, to keep slamming your hips into her jiggling cum-covered mounds.");
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
