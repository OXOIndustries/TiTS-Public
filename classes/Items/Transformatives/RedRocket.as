package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	
	public class RedRocket extends ItemSlotClass
	{
		
		//constructor
		public function RedRocket()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "R.Rocket";
			//Regular name
			this.longName = "Red Rocket"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Red Rocket";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This black-market transformative was allegedly created by the notorious Dr. Badger to celebrate the anniversary of the end of the Terran-Kaithrit War. What that has to do with a drug that causes its users to grow enormous, hyper-virile dog-dicks remains to be seen. Nonetheless, once she released the microsurgeon code on the open market, complete with fabricator blueprints for its trademark shape, the canine-focused treats spread far and wide across the cosmos. Surges in supply always routinely occur around celebratory holidays - particularly ones which feature fireworks.\n\nIt looks like a small, red rocket ship, all of two inches long. The bottom edge is especially thick.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Fenoxo");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:int = 0;
				var changeLimit:int = 1;
				var temp:String = "";
				var x:int = -1;
				if(rand(2) == 0) changeLimit++;
				if(rand(3) == 0) changeLimit++;
				if(changes < 3 && rand(2) == 0) changeLimit++;

				//Consume
				output("Down the hatch! You open wide and pop the miniature rocket ship into your maw. It fizzles on contact with your saliva, melting into a salty, spicy goo in the span of a heartbeat. Before you can swallow the illicit payload, the moisture wicks into your tongue and takes your spit with it, leaving your mouth notably dry but your heart fluttering with artificial excitement.");

				pc.taint(1);

				//No dick: Grow one.
				if(!pc.hasCock())
				{
					output("\n\nThe spicy flavor rockets down your spine and into your crotch, somehow able to be tasted at the ");
					if(pc.hasVagina()) output("dewy juncture " + (pc.legCount == 1 ? "below":"between your [pc.legs]"));
					else output("senstivie patch of bare [pc.skin]");
					output(". It’s warmer than a summer’s night and more insistent than a lover’s touch. You moan involuntarily, rocking your [pc.hips] forward. Electric currents sizzle through your groin as something <i>new</i> and powerful flexes. Panting, you throw your head back and moan.");
					output("\n\nA ridge appears " + (pc.hasVagina() ? "just above your [pc.vaginas]":"at the very center") + ", red and irritated-looking yet so deliriously, wonderfully erotic. Recovering for a moment, you look down in awe, just in time to see a red-pointed tip emerging from your distending flesh. It glistens and pulsates, quivering to the beat of your heart. You watch it grow with building excitement. It’s like there’s a wick lit inside you, and for every inch of it that burns down, another inch of blossoming, crimson cock is released.\n\nThree inches of proud canine phallus wiggle imploringly. You grab them and tug unthinkingly, accelerating the release of your fourth inch of dick. The resulting spasms of relief and excitement nearly make you cum, but something holds you back. <i>It’s not ready yet.</i>");
					output("\n\nYou thrust pump your new tool with feverish excitement. Beads of sweat pour from your brow, and tiny droplets have begun to bead at the tip of your demanding new endowment. It flexes in your fingers, straining to pack on more mass, forcing your hand halfway open to make room for more of the tender cock’s glossy skin. All the while, more length emerges from your sizzlingly aroused loins.\n\nYou’re almost there. You can feel it. Like a rocket about to go off, you can feel the tension in the air and inside you, all that potential energy about to emerge in one explosive burst.");
					output("\n\nA heavy weight rolls into place against the underside of your [pc.skin]. Your sheath strains in response, stretching wide, revealing a bulge of hotrod red cock below. The pressure mounts. Your eyes cross from just how good it feels to grow to a dick. You barely notice your descent to the ground or the sloppy, lurid sounds that your hand makes as it jacks off your pre-cum-slathered rod. All that matters is giving <b>your new dog-cock</b> what it wants. All that matters is stroking and straining, and the increasingly heavy weight of your organ’s powerful new knot pushing hard, fighting to burst into existence and reward you with your first bit of canine cum.");
					output("\n\nIt heaves. Your eyes cross in pleasure and-");
					output("\n\nPOP!");
					output("\n\nOrgasm explodes up your spine, setting off a chain reaction of dog-dick-infused bliss-bombs in your brain that leave you drooling and panting, eyes crossed. Rope after rope sprays out in a seemingly ceaseless load. You feel like you’ve had it packed inside you forever, like your body was making cum every second you didn’t have a dick and you’re just now getting to let it out. The spurts splatter your [pc.chest] and [pc.belly]. They soak your hand. You tremble and whine, uncaring if you sound like a dog in heat. The mere thought is enough to trigger a new memory of juicy ausar cunt, the musky scent of a bitch in heat, begging you to slip inside and breed her.");
					output("\n\nYour orgasm redoubles, determined to flood every inch of your imaginary breeding toy’s cunt, filling her with jism. Rope after rope spills you. You pour salty cream like a faucet, milking it out of your hyper-sensitive knot with tender squeezes and pure, perfect delight.");
					output("\n\nThis is what you want.");
					output("\n\nThis is what you need.");
					output("\n\nAs your orgasm winds down, you remain flushed and excited. Your new, seven-inch dog-dick won’t go completely soft, not yet. Maybe you ought to cum again. Or find somebody to breed.");
					pc.createCock();
					pc.shiftCock(0,GLOBAL.TYPE_CANINE);
					pc.cocks[0].cockColor = "red";
					pc.cocks[0].cLengthRaw = 7;
					pc.libido(4);
					pc.orgasm();
					pc.changeLust(34);
					pc.boostCum(2);
				}
				//Dick but a canine dick to change
				else if(pc.cockTotal(GLOBAL.TYPE_CANINE) < pc.cockTotal())
				{
					var selCock:int = -1;
					for(x = 0; x < pc.cockTotal(); x++)
					{
						//Find first dicko.
						if(pc.cocks[x].cType != GLOBAL.TYPE_CANINE) selCock = x;
					}
					//Failsafe.
					if(selCock < 0) 
					{
						selCock = 0;
						output("\n\n<b>ERROR. Attempted to TF dick but didn’t find a dick to TF. Whoops. Damned RedRocket.</b>");
					}
					output("\n\nThe residual warmth from the spice and the strange method of absorption doesn’t linger in your mouth for long. You feel it slide into your chest; a little spreads into your arms, but the bulk collects lower, infecting your crotch with heat and unfiltered need " + (!pc.isErect() ? "that forces you to a fully erect state":"that pumps you past the point of hardness into complete rigidity") + ".");
					//If !exposed
					if(!pc.isCrotchExposed()) output("\n\nThe act of removing your [pc.crotchCovers] seems automatic. You don’t even realize you’re doing it until your firm state is proudly displayed.");
					output("\n\nYou ache with desire, maleness");
					if(pc.cockTotal() > 1) output("es");
					output(" jutting free.");
					if(pc.cockTotal() > 1) output(" One in particular throbs more than the other" + (pc.cockTotal() > 2 ? "s":"") + ": your [pc.cock " + selCock + "].");
					output(" You reach down to give it a squeeze, and the answering sensation of taut, tight pleasure nearly knocks you out. You collapse, panting heavily. Your tongue won’t stay in your mouth anymore than your hand will let go of your dick.");
					output("\n\nYou squeeze again. This time the ecstasy comes with a fantasy: the mental image a canine woman, bent over and presenting. She’s soaked, her cunt <i>dripping</i> with excitement as she watches you over her shoulder. Her scent is everywhere. It consumes you. It makes your cock ache. The urge to mount her is nearly overwhelming, yet your body won’t cooperate.");
					output("\n\nSitting with your pointed cock in your hand, can only let it play out.");
					if(!pc.cocks[selCock].hasFlag(GLOBAL.FLAG_TAPERED)) output(" Wait, your dick doesn’t taper like that, does it?");
					output("\n\nYou squeeze.");
					output("\n\nThe fertile bitch’s image solidifies in your mind. She’s wiggling now. Her tail flicks back and forth beneath your nose, pussy-juice dripping from its sodden fur. She’s in heat. She needs the dick as much as you need to give it to her. Your knot swells against your fingers, aching and insistent.");
					if(!pc.cocks[selCock].hasFlag(GLOBAL.FLAG_KNOTTED)) output(" You’re glad to have developed one. You can see in her eyes that she appreciates the canine addition, lust over it as intensely as you do her.");
					else output(" You can see the want in her eyes. She aches for it nearly as much as you ache for her. Who cares if it feels a little different, a little less alien and a little more canine. She loves it.");
					output("\n\nYou whine. Pre-cum dribbles from the top like water from a leaky pipe. There’s enough to soak your palm, allowing your pulsating, reforming dick’s movements to pleasure you, all without a single stroke.");
					output("\n\nYou can’t help but squeeze. Your bitch-taming knot demands it.");
					output("\n\nPussy-juice coats your tongue. The furry cutie is rubbing her snatch into your face, and you love it. You spear your eager muscle deep inside, and she squeals, spreading her legs obligingly. The fluff of her tail is soft on your forehead, and the drippings that fall from her clit spatter hot on your cock, charged with promise.");
					output("\n\nShe pulls away. <i>“Not yet.”</i> The admission seems to hurt her almost as much as it does you. <i>“Not until you prove it to me.”</i> She wipes some of her slick, feminine leavings from your chin with a sad smile. <i>“Show me you can be my big dog.”</i> She kneels below, eyes locking onto your fire-red mast." + (pc.cocks[selCock].cockColor != "red" && pc.cocks[selCock].cockColor != "crimson" ? " You’re so hopelessly aroused and overheated that your dick going red seems almost normal.":"") + " <i>“Show just how well you can fill me.”</i> She licks the fragrant fluid from her fingertips. <i>“Cum.”</i> Wide, begging eyes flick up. <i>“Please. Cum.”</i>");
					output("\n\nYou squeeze, fingers tight around your knot.");
					output("\n\nThe fantasy explodes into a million shards of unfiltered, orgasmic bliss. Cum blasts out of you so hard that it feels like something inside you is popping. Maybe it’s the eye-crossing bursts of pleasure in your head, or the way your muscles clench down with the effort of disgorging your enormous cum-load. Maybe it’s just your heart hammering what feels like a thousand times a minute as your palm lovingly caresses your " + (!pc.cocks[selCock].hasFlag(GLOBAL.FLAG_KNOTTED) ? "new ":"") + "knot, milking you for more and more jism.");
					output("\n\nYou paint a fan of virile ropes in front of you, but it isn’t enough. If you’re going to be a proper breeder, you’ve got to cum as much as possible. Your big, bulging bitch-breaker has to squirt like a firehose when you climax. You <i>need</i> to be a walking cum-fountain, ready to impregnate the first slut in heat you stumble into.");
					output("\n\nYeah, that sounds nice. You tug your <b>new canine dick</b> a few times, enjoying the shape and feel of it, proud to know that you’ll be locking it in lovers left and right.");
					pc.shiftCock(selCock,GLOBAL.TYPE_CANINE);
					target.cocks[selCock].cockColor = "red";
					pc.libido(4);
					pc.orgasm();
					pc.changeLust(34);
					if(pc.cockTotal(GLOBAL.TYPE_CANINE) < pc.cockTotal()-1) output(" If only the others would follow suit.");
					else if(pc.cockTotal(GLOBAL.TYPE_CANINE) < pc.cockTotal()) output(" If only the other one would follow suit.");
					pc.boostCum(4);
				}
				//Else: Selection from random other changes:
				else
				{
					var choices:Array = [];
					//Increase knot multiplier to 1.8x
					for(x = 0; x < pc.totalCocks(); x++)
					{
						if(pc.cocks[x].knotMultiplier < 1.8) 
						{
							choices.push("knot");
						}
						if(pc.cocks[x].knotMultiplier < 1.5) 
						{
							choices.push("knot");
							choices.push("knot");
						}
						if(pc.cocks[x].cLength() < 12) choices.push("grow");
						if(pc.cocks[x].cLength() < 18) choices.push("grow");
						if(pc.cocks[x].cLength() < 24) choices.push("grow");
						choices.push("grow");
					}
					if(!pc.inRut())
					{
						choices.push("rut");
						choices.push("rut");
					}
					//cumdrool
					choices.push("cumdrool");
					choices.push("cumdrool");
					var select:String = choices[rand(choices.length)];
					if(select == "knot")
					{
						var biggestMultiplier:Number = 0;
						for(x = 0; x < pc.cockTotal(); x++)
						{
							if(pc.cocks[x].knotMultiplier > biggestMultiplier) biggestMultiplier = pc.cocks[x].knotMultiplier;
						}
						//< 1.5
						if(biggestMultiplier < 1.5)
						{
							output("\n\nA delightful, pulsating sensation ripples through your [pc.knot]" + (pc.cockTotal() > 1 ? "s":"") + " as you imagine " + (pc.cockTotal() == 1 ? "it":"them") + " buried deep, squeezed into place by furiously orgasming canine cunt" + (pc.cockTotal() > 1 ? "s":"") + ". The fancy fades, but when you reach down, you discover that your <b>your [pc.knot]" + (pc.cockTotal() > 1 ? "s":"") + " " + (pc.cockTotal() == 1 ? "has":"have") + " grown.</b>");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.cocks[x].knotMultiplier < 2) pc.cocks[x].knotMultiplier += 0.1;
								if(pc.cocks[x].knotMultiplier < 2) pc.cocks[x].knotMultiplier += 0.1;
							}
						}
						//< 1.8
						else
						{
							output("\n\nYour [pc.knot]" + (pc.cockTotal() > 1 ? "s":"") + " swell" + (pc.cockTotal() == 1 ? "s":"") + " as the drug gathers in your bloodstream, pouring every drop into the bulging canine swell" + (pc.cockTotal() > 1 ? "s":"") + " <i>that you adore so much</i>." + (!pc.isCrotchExposed() ? " When did you pull your clothes out of the way?":"") + " You gaze down in wonder at the expanding bulb" + (pc.cockTotal() > 1 ? "s":"") + ", hanging heavy with the promise of knottings to come. You’re going to ruin bitches. When you walk away from their stretched and gaping pussies, they’re going to realize that you’re the only one who can satisfy them and come running back to beg you for another cunt-ruining knotting.\n\n<b>Your knot" + (pc.cockTotal() > 1 ? "s are":" is") + " bigger!</b>");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.cocks[x].knotMultiplier < 2) pc.cocks[x].knotMultiplier += 0.1;
							}
						}

					}
					else if(select == "grow")
					{
						//< 12
						if(pc.biggestCockLength() < 10)
						{
							output("\n\nA surge of heat and arousal concentrates in your crotch, burrowing into your [pc.cocks] and making " + (pc.cockTotal() == 1 ? "it":"them") + " strain in absolute rigidity. Every beat of your heart redoubles the sense of tightness. It’s ecstasy and agony, feeling your cock" + (pc.cockTotal() == 1 ? "s":"") + " plumping up, the pointed tip" + (pc.cockTotal() == 1 ? "s":"") + " stretching farther and farther.");
							output("\n\nThere’s a brief mental flash of a anthropomorphic border-collie girl with her hands wrapped around [pc.oneCock], tugging at it obligingly, and then the sensation abates. The urgency is gone, but the added size remains. <b>Your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " " + (pc.hasPerk("Hung") ? "two inches":"an inch") + " bigger!</b>");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 2;
								else pc.cocks[x].cLengthRaw += 1;
							}
							pc.changeLust(40);
							pc.libido(0.5);
							pc.boostCum(1);
						}
						//< 18
						else if(pc.biggestCockLength() < 18)
						{
							output("\n\nThe weight of your [pc.cocks] intensifies, and your mouth abruptly floods with drool. You find yourself sitting down, your head swimming. A woman’s voice is talking to you, telling you how you’re such a good [pc.boyGirl] for her. She’s patting your head, but your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " so hard.");
							output("\n\n<i>“That’s it. Keep growing.”</i>");
							output("\n\nThe words alone are enough to make your masculine endowment" + (pc.cockTotal() > 1 ? "s":"") + " swell an inch longer.");
							output("\n\n<i>“The bigger you get, the better a breeder you’ll be.”</i> Soft fur brushes your ear. <i>“One look at you, and bitches will be lining up to have your pups, won’t they?”</i>");
							output("\n\nYou nod, fixated on your own crotch and the expanding length" + (pc.cockTotal() > 1 ? "s":"") + " of meat on display." + (!pc.isCrotchExposed() ? " When did you take off your [pc.crotchCovers]?":""));
							output("\n\n<i>“Good [pc.boyGirl]. You’re making me so wet.”</i> She steps in front of you, presenting you with the sight of her dewy delta. <i>“But you’re not big enough to claim me, are you?”</i> She gathers some of her dripping arousal and smears it on your nose. <i>“Now be a good [pc.boyGirl] and <b>grow.</b>”</i>");
							output("\n\nYou look back down, breathing her scent even as the phantasm vanishes, watching your dog-dick" + (pc.cockTotal() > 1 ? "s":"") + " grow into the bitch-breaking rod " + (pc.cockTotal() == 1 ? "it was":"they were") + " meant to be. " + (pc.cockTotal() == 1 ? "It wobbles":"They wobble") + " under their own weight, but when you find that girl for real... when you find her she’ll be there to hold you up... and guide you into her cunt.");
							output("\n\nOnce you’re big enough.");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 3;
								else pc.cocks[x].cLengthRaw += 2;
							}
							pc.changeLust(40);
							pc.libido(0.5);
							pc.boostCum(1);
						}
						//< 26
						else if(pc.biggestCockLength() < 26)
						{
							output("\n\nYour eyes drift closed when the Red Rocket hits. It suffuses your body, spreading relaxation and desire in equal measure. You can feel most of it in your [pc.cocks], where it congeals into a heat as crimson as the drug’s name would imply.");
							output("\n\nPower and virility flood into your loins in equal measure. You can tell by the way it tickles at your brain, setting off sparks of passion that make you grunt and lust. The idea of getting up to find someone to pin down and fuck is increasingly tempting, but <i>you’re simply too relaxed.</i>");
							output("\n\nYou look down instead.");
							if(!pc.isCrotchExposed()) output("\n\nWhen did you get naked?")
							else output("\n\n");
							output("\n\nThe mountain of pulsating meat that greets your gaze wobbles from its own weight, but it’s what’s behind the dick" + (pc.cockTotal() > 1 ? "s":"") + " that scours the thoughts from your brain. A drooling canine-morph - border-collie by the look of her - kneeling over your tumescent tower" + (pc.cockTotal() > 1 ? "s":"") + ".");
							output("\n\n<i>“Uhhh... hi.”</i> Her nose wrinkles, and she licks [pc.oneCock].");
							output("\n\nShe can’t possibly be real, but it feels real all the same. That wet, slick tongue feels like heaven on your rigid member. It’s touch somehow makes you harder, maybe even larger.");
							output("\n\nAnother lick.");
							output("\n\nYou whine and thrust your hips upward, sliding your pointed, canine tip into her mouth.");
							output("\n\nThe beautiful girl accepts it gladly, sucking you for a moment that feels like an hour. When she stops, it’s to swaddle you in a voice as sweet as warm honey. <i>“You’re such a big [pc.boyGirl].”</i>");
							output("\n\nAnother suck, and the world disappears. You are your [pc.cocks]. You throb, and you strain, and you <i>engorge</i>, pumping more and more of yourself into your dick so that you can reach deeper into <i>her.</i>");
							output("\n\n<i>“That’s a good dog.”</i> Her tongue comes back, wrapping around you, and both hands cup at your [pc.knot]. <i>“My good alpha.”</i> She squeezes and strokes, the soft pads of her fingers gliding on a curtain of lubricating pre and spit. <i>“You’re getting so <b>big</b> and <b>hard</b>. And twitchy.”</i> She giggles.");
							output("\n\nHer laughter is music to your ears. Somehow, making her smile is hotter than her tongue on your [pc.cock] or her fingers squeezing your sensitive bulb. A little extra plumpness slips into your groin, forcing her hands slightly apart.");
							output("\n\n<i>“You’re going to make all the girls cum so hard.”</i> She leans down and swallows you, casually taking fully half of your length into her maw. Pre-cum spurts into her so freely that when she pulls up, her lips are coated by glossy webs. <i>“You’ll fuck me, if you ever see me again, won’t you?”</i> She looks up hopefully, pumping your length intently.");
							output("\n\nYou nod. <i>“Yes!”</i>");
							output("\n\n<i>“Good [pc.boyGirl]. You can fuck my mouth today.”</i> With that declaration, she opens wide and presses her lips against your [pc.cockHead], pausing briefly before beginning a rapid descent to your [pc.sheathOrKnot]. The collie-girl shows no signs of slowing, sliding you deeper and deeper along her tongue until you’re nestled in her throat.");
							output("\n\nShe keeps going, and you keep growing. You can feel yourself pulsate with raw, expanding power. The dog-girl’s eyes smile when you do. Still, she goes down... and down... and down... until those plush, perfect lips surround your knot and begin go kiss and stroke it.");
							output("\n\nYou cum for her. You pump rope after rope directly into her throat, and the canine woman simply looks up at you excitedly, her stomach gurgling with each new deposit. One handed, she reaches up to pat your head, somehow making you cum all the harder.");
							output("\n\nOnce you’ve been drained to her satisfaction, the smiling dog-girl releases you, completely unmarked by your orgasm. <i>“That’s my good [pc.boyGirl].”</i> She pats your cock. <i>“You’ll ruin my pussy one of these days.”</i> After a moment she adds, <i>“But you’re going to ruin lots of girls pussies, aren’t you?”</i>");
							output("\n\nYou grunt in the affirmative, eyes drifting closed. When you awaken a minute later, she’s gone, but <b>your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " longer than ever.</b>");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 3;
								else pc.cocks[x].cLengthRaw += 2;
							}
							pc.changeLust(40);
							pc.orgasm();
							pc.ballFullness = 0;
							pc.libido(0.5);
							pc.boostCum(1);
						}
						//< 48
						else if(pc.biggestCockLength() < 48)
						{
							output("\n\n<i>“Holy fuck,”</i> a feminine voice exclaims.");
							output("\n\nTurning around, you see a nude collie-girl eying your exposed crotch with undisguised lust.{ What happened to your clothes?} <i>“You got so big!”</i> She stretches out, gently caressing [pc.oneCock] as one might an object of religious worship. <i>“This is a pack alpha’s dick.”</i>");
							output("\n\nYou nod in agreement as she pushes on your chest, guiding you to the ground.");
							output("\n\n<i>“And I bet it’ll get bigger for me.”</i> She straddles it, the tip pressing against her clit, and eases herself down. She doesn’t ask for consent because it’s implied in your hardness and your scent.");
							output("\n\nThe raw desire pouring off of the both of you is so thick you could cut it with a knife.");
							output("\n\n<i>“Dicks <b>always</b> get big for me.”</i> She slides down the first foot of your pole, her silken walls clutching tight to your impressive girth. It feels like her hips are actually broadening to accept you, deforming her body into a pornographic parody of a brood-mother’s body. <i>“Because the bigger they are.”</i> She scooches a few inches lower. <i>“They harder they’ll cum.”</i>");
							output("\n\nOnce more, you find yourself struck by the supreme logic of her statements. The simple act of being held by her slippery pussy is almost as good as two full strokes in and out with a lesser cock. You can only imagine how hard you’ll cum when she takes you to the root.");
							output("\n\n<i>“Hey, breeder [pc.boyGirl]. Wake up.”</i> The anthropomorphic border-collie snaps her fingers in front of your face, getting your attention once more. <i>“I know it <b>feels like your brains are sliding into that big, stupid dick</b>, but that’s just your body being a good dog and doing what all good dogs do for me: growing.”</i>");
							output("\n\nThe angular distention of your tip visibly slides up her belly, bulging higher and hotter, even though her hips have slid no lower. Now that you’ve been roused by the hypnotizing pleasure of her pussy’s heavenly caresses, you can feel exactly what she’s talking about. Weight is shifting around, drawing more and more of your attention into your dick.");
							output("\n\nIt really does feel like your brain is being pulled down in there, but you suppose it’s just new nerves being developed to complement the bigger cock. Your nervous system is flowering right alongside your blossoming cock. The veins pulsate and swell. New ones appear as your girth subtly widens, pulling her lips taut.");
							output("\n\n<i>“There we go. The deeper you go... the bigger you get.”</i> She sinks down with that prophecy ringing in your ears, but you can’t spare a single moment of thought on it.");
							output("\n\nYou’re too hard. You’re too hard and her cunt feels too good. The more obviously your [pc.cock] becomes outlined on her stomach, the more blood you feel flowing into your dick, and the more distracted by pleasure you become.");
							output("\n\nThe cock-swelling dog-girl sinks deeper still, almost to the root now. Her middle strains like a furry condom around you, letting you watch your length pulsate. You keep engorging. You keep growing. You’re never too big or too hard. There’s only the silken, sweet embrace of cunt and the taut, blissful experience of enlarging.");
							output("\n\n<i>“Ah!”</i> she cries in bliss. <i>“The knot!”</i> Her lips strain around it, cupping at it and slobbering rivers of girlish deligh. <i>“I need it.”</i> She looks down at you with eyes of fire. <i>“And you need it. You need to be bigger.”</i> Her hips pop, and then your knot pops inside her.");
							output("\n\nFireworks explode in your head, but she’s still talking.");
							output("\n\n<i>“You’re a big, horny, fuck-hungry dog-stud. Ah!”</i> The dick-swelling slut bounces in place, rolling your trapped bulge inside her entrance. <i>“Gotta knock up all us canine bitches.”</i> She whimpers, nipples hard. <i>“Can’t help but cum in every one of us!”</i>");
							output("\n\nThrough it all, you’re cumming. Your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " jerking and squirting. Heavy bulges slide through your expanded urethra{s}, determined to inseminate every girl with a pair of fluffy ears in a ten mile radius. Your knot swells, and more jism issues forth. Your rider, stuck as she is, keens in delight. Her belly balloons with your load, and her eyes roll back.");
							output("\n\nWhen you finish, she’s clutching at her taught middle and mouthing, <i>“Such a good [pc.boyGirl],”</i> again and again.");
							output("\n\nOf course you are. If being a good [pc.boyGirl] means cumming like this, then you’re the best [pc.boyGirl] in the galaxy.");
							output("\n\nYou blink, and the dog-woman is gone. <b>[pc.EachCock] is still bigger, though.</b>");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 4;
								else pc.cocks[x].cLengthRaw += 3;
							}
							pc.changeLust(40);
							pc.orgasm();
							pc.ballFullness = 0;
							pc.libido(0.5);
							pc.boostCum(1);
						}
						//else
						else
						{
							output("\n\nYou briefly lose consciousness as ever drop of blood in your entire body shifts into your [pc.cocks] at once. When you come to, it’s to the sight of the world’s biggest, stiffest dog-cock: hard, heavy, and leaking.");
							output("\n\nBut it isn’t big enough. You know it isn’t big enough, because it’s growing. The cumslit winks as the flesh expands at an uneven pace, pulling open and closed again as it inches up your [pc.chest]. You reach down to pet it, only to have it jump and drool.");
							output("\n\n<i>“My my,”</i> comes a voice that sounds as good as a tongue on your dick would feel. <i>“You’ve gotten so big.”</i> It’s source steps into view. She’s a collie-girl, naked. And she’s in heat.");
							output("\n\nYou can smell it. Your dick can smell it.");
							output("\n\n<i>“You’re such a fucking dog, getting so big.”</i> The wet lips of her vagina kiss your [pc.cock] as she settles into place. <i>“It’s too big to fuck.”</i> She rocks back and forth, dragging her sopping clitty against your rigid veins. <i>“But I want it. I want it so bad.”</i> She leans forward, stroking it, caressing it, encouraging it to swell larger. <i>“I want to milk it and suck it and shovel your hot cum into my cunt until I’m pregnant.”</i> After a moment she adds, <i>“Dick this big’d give me 20 pups, wouldn’t it?”</i>");
							output("\n\nYou nod. At least twenty. Your [pc.cockHeads] climb higher.");
							output("\n\n<i>“Mmmm, and a knot like this...”</i> A furry toe circles the hyper-swollen bulb of your knot, <i>“must be so beautifully sensitive. So easy to bring off.”</i>");
							output("\n\nYou nod, dribbling and leaking. Your [pc.cock] flexes hard enough to lift her a few inches before slapping back down under its own weight.");
							output("\n\n<i>“Atta [pc.boyGirl]. So easy to make you cum. Perfect for knocking me up.”</i> She dismounts you, and you realize she’s not just a dog-girl anymore. She’s a dog-taur. She’s got four legs behind and a body large enough to look like a good fit. Stepping into place, she lines her pussy up with your [pc.cock].");
							output("\n\nShe doesn’t even have to move. Your thobbing eagerness throws your dick up to the right height, and your growth spurt drives the [pc.cockHead] into her waiting lips.");
							output("\n\n<i>“Ah! Such an eager stud.”</i> She prances back, swallowing your cock. Her body is made for you: big enough to take you and wet enough for her drippings to completely soak you. The folds ripple and squeeze and clutch at you, and you grow to fill her. <i>“Such a <b>good dog</b>.”</i>");
							output("\n\nYou almost cum. The way she says it is so pleased that it makes your head spin with delight, moreso than the tight heat surrounding you.");
							output("\n\n<i>“Now knock momma up.”</i> She backs up further, grunting with the effort of trying to take your knot. Her back paws skit and slip in her own slobbering pussyjuice as she fights for traction. <i>“Give me so many pups.”</i>");
							output("\n\nPop!");
							output("\n\nYou’re inside, and you’re cumming. You arch your back to drive it deeper and cry out. Jism sprays out of you in what feels like an endless torrent. Each eruption is like an entire orgasm in its own right. And you aren’t just shooting out seed, but also swelling. With each spurt, you stay a little larger and a little heavier.");
							output("\n\n<i>“<b>Good dog.</b>”</i>");
							output("\n\nYour orgasm starts all over again. You’re her breeder. You’re her alpha. You’re her good dog. You breed her until your eyes cross and the pleasure drives you into unconsciousness.");
							output("\n\nYou snap back to wakefulness. Checking your Codex, you can see it’s only been a minute, but it felt like twenty. You are completely drained and more than satisfied, for the moment. <b>But your [pc.cocks] " + (pc.cockTotal() == 1 ? "is":"are") + " even bigger</b>. You’re so stupidly large that most of the time you feel like a walking cock, and your inner <i>good dog</i> thrills at that.");
							for(x = 0; x < pc.cockTotal(); x++)
							{
								if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 6+rand(3);
								else pc.cocks[x].cLengthRaw += 4+rand(3);
							}
							pc.changeLust(40);
							pc.orgasm();
							pc.ballFullness = 0;
							pc.libido(0.5);
							pc.boostCum(1);
						}
					}
					else if(select == "rut")
					{
						output("\n\nYou sneeze. Scrunching up your nose, you fight the urge to do it again, aware of the ticklish sensation building in your sinuses, but you sneeze again.");
						output("\n\nYour [pc.cocks] fatten" + (pc.cockTotal() == 1 ? "s":"") + " in that moment, holding onto the additional engorgement as you realize how horny you are. You can’t fathom why you were doing transformation drugs when you could’ve been looking for a cute girl to fuck. Ausar sluts are a dime a dozen. You can stumble dick-first into one at the nearest bar, you’re sure of it. Even better, maybe you can track down a girl who has gone full furry. They’re usually nice and fertile.");
						output("\n\nFurry girls’ ovaries ought to dump out dozen eggs at the sight of you, twice as many once they smell your dick.");
						output("\n\nYou sneeze again.");
						output("\n\nYeah, you could pound them till they’re drooling cum and passed out, most assuredly pregnant. You don’t even care if your potential mate has a boyfriend. He can watch in the corner. You’re more than willing to fight for some prime pussy if that’s what it takes.");
						output("\n\nWait...");
						output("\n\nYou stop yourself and try to think past the fog of breeding instincts. There’s only one explanation: <b>you’ve gone into rut.</b> You could be good and wait it out, but it’d be way more fun to find a cute girl to bang pregnant. Two or three times if that’s what it takes.");
						pc.createStatusEffect("Rut", 10, 33, 1000, 4, false, "LustUp", "Your body is driven for aggressive breeding, increasing your libido and virility, as well as boosting your minimum cum output.\n\n+5 Libido\n+25 Minimum Lust\n+1000mLs Minimum Cum\n+400% Virility",false,28800,0xB793C4);
						pc.libido(1);
						pc.boostCum(2);
					}
					else if(select == "cumdrool")
					{
						if(pc.ballFullness == 100 || pc.hasStatusEffect("Blue Balls"))
						{
							output("\n\nYou smell pussy in the air. A cloud of pheromones surrounds you, potent and horny... and... and you forget how to think about it as every ounce of blood in your body fights to occupy your [pc.cocks]. You whine needfully, aware of how long you’ve gone without cumming. You’re so full that the mere scent of juicy, canine cunt is enough to make your aching loins tingle and clench.");
							output("\n\nYour knot" + (pc.cockTotal() > 1 ? "s swell":" swells") + " dangerously.");
							output("\n\nAnother whiff is too much. Howling in ruinous desire, you stand there and unload" + (!pc.isCrotchExposed() ? " into your [pc.crotchCovers]":"") + ". Rope after spurting rope of backed-up [pc.cum] sprays out. It runs down your [pc.legOrLegs]. You pump your [pc.hips] and suck in huge lungfulls of musk-scented air, uncaring of the show you’re putting on. All that matters is that you can’t hold it in anymore. The cum has to escape.");
							output("\n\nYou drain your [pc.balls] completely and utterly. The pheromonally overwhelming aroma demands it. Just as you feel like your ejaculation is slowing, it’ll tickle your nose again and take you right back to a exhaustingly-draining climax.");
							output("\n\nWhen it’s over, a strand of [pc.cumColor] release dangles from your [pc.cockHead], swaying heavily. That smell... that heavenly smell is gone, but there’s so much [pc.cum]. Did you always make that much? Or have you <b>become even more virile?</b>");
							output("\n\nWas there ever a girl in heat at all, or was that just the drugs?");
							output("\n\nYou stroke [pc.oneCock], groaning with the aftershocks of your climax.");
							output("\n\nWho cares?");
							pc.boostCum(2);
							pc.orgasm();
							pc.applyCumSoaked();
						}
						else
						{
							output("\n\nYour eyes cross, uncross, and cross again as the drug kicks in. It leaves your head muzzy and your crotch tingling. Dizzy, you slump to the ground" + (!pc.isCrotchExposed() ? " and fumble with your [pc.crotchCovers]. You need to let it out. You need to be free... to breed and cum":"You need to breed... and cum") + ". Just not yet. You’re too dizzy and warm and... and...");
							output("\n\nYour [pc.cocks] jump" + (pc.cockTotal() == 1 ? "s":"") + ". Warmth pools in your [pc.balls]. Warmth and pressure. The gentle yet insistent feeling of an unspent load grows more and more palpable in your mind as you sit there, looking down. You pant heavily, all but drooling on your dick" + (pc.cockTotal() > 1 ? "s":"") + " while you watch " + (pc.cockTotal() == 1 ? "it":"them") + ", intently aware of the mounting firmness and slow-burning desire.");
							output("\n\nWhen a dollop of [pc.cumColor] appears on your [pc.cockHeads], entirely without an orgasm, you feel like you ought to be surprised, but it makes a sick sort of sense to your drug-addled mind. Of course you’re leaking cum - you’re so full of it. As it dribbles out, you come to the conclusion that you aren’t squeezing out nearly enough loads.");
							output("\n\nYou should be shoving your cock in every pussy you come across, or at least painting muzzles and mouths with hot, [pc.cumVisc] loads. Jizz deserves to be free. Or at least presented to every horny bitch in the universe. It should be stuffed into tight holes or lovingly milked into maws.");
							output("\n\n More of your seed sputters and drools, heavy and warm on your [pc.cocks]. You watch it come out, excited and paradoxically relaxed, groaning and shifting in place. Part of you wishes this could go on forever, but you know it can’t.");
							output("\n\nNo matter how taut your [pc.balls] get" + (pc.balls <= 1 ? "s":"") + " or how much [pc.cum] you leak out, you know that eventually you’re going to have to get up and deal with the ache inside you. It’ll be messier. A lot messier. Because you’re a breeder and a seeder. You’re a walking cum tank whose body is learning how to better exude impregnating juices with every passing second.");
							output("\n\nThe flow slackens, but the tightness remains. Your body is absolutely packed with [pc.cumNoun]. You should find someone to cum inside. Someone fertile and canine preferably. Someone who will enjoy the fact that <b>you produce more cum when you orgasm than before.</b>");
							pc.boostCum(20);
							pc.applyBlueBalls();
						}
					}
					else output("\n\nERROR: " + select);
				}
				return false;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consumes the Red Rocket to no effect.");
			}
			return false;
		}
	}
}