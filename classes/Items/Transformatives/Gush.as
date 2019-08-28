//[BEFORE ANYTHING ELSE] Grows tits to C cup before all else.
//[FIRST DOSE ALWAYS] Start lactation on full bore
//Increase libido
//Tits grow 3-4 rating at a time.
//Bad-end if taken above a certain cup-size. R?

package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	
	public class Gush extends ItemSlotClass
	{
		//constructor
		public function Gush()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			//Used on inventory buttons
			this.shortName = "Gush";
			//Regular name
			this.longName = "Gush spraypen";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a spraypen loaded with Gush";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Illegal on almost every civilized planet, Gush is a drug synonymous with big-breasted, lactating addicts. It unerringly increases bust size and overall milkiness, but is said to raise libidos to uncontrollable levels.\n\n<b>Known to cause high amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
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
		public function gushBadEndPartI():void
		{
			clearOutput();
			var pc:PlayerCharacter = kGAMECLASS.pc;
			kGAMECLASS.showName("\nTITTIES!");
			//Milk slave - NT only
			//Get taken to the milk barn and repeatedly gangbanged by bulls that like dumber girls. Gianna is nice, though.
			if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet == "PLANET: NEW TEXAS")
			{
				output("How long you spent laying there in a pool of your own milk, lowing like some kind brainless sow, you don’t know. What you do know is that the pleasure from Gush never seemed to go away. Sure, the euphoria diminished, but your breasts are just so big and so wonderful that you never really saw a reason to stop tugging on them. Heck, after a while, your sore tits started leaking [pc.milk] again.");
				output("\n\nIt’s only been four hours since then, and you’re still leaking, still dribbling your marvelous [pc.milkNoun] all over yourself. You lick some off your fingers and hum in wonder at the taste, aware that at some point you should probably seek sustenance, but your fluid-filled boobs are just too heavy to lift. Maybe, just maybe, you could crawl if you really tried, but imagining your perfect [pc.nipplesNoun] dragging across the rough ground just seems wrong. They deserve to be in fingers... or milkers.");
				output("\n\nYou cum at the thought, not that you aren’t awash in a sea of lactic bliss at this very moment, but the upsurge in blissed-out milkiness is enough for you to notice. It’s almost enough to let you ignore the calloused hands grabbing you under the shoulders and lifting you up and over a broad, well-muscled shoulder.");
				if(pc.isTreated()) output(" There’s no way a Treated [pc.boy] like you could miss that scent, though. A marvelously musky bull must have picked you up on his way back from the fields, judging by the delightful sheen of sweat he’s covered in.");
				else output(" There’s no ignoring that pernicious scent, though: marvelously musky with just a hint of some kind of wood. Maybe ceder? Best of all, the hunk carrying you radiates it from every sweat-soaked pore. He must have just come in from the fields.");
				output("\n\nYou’re way too busy playing with your nipples and sniffing at the air to pay attention to his ramblings, but the bass of his voice absolutely demands your full, attention, momentarily overpowering the throbbing tingles in your tits.");
				output("\n\n<i>“Cows like you shouldn’t be left alone to get in trouble like that.”</i> His firm hand squeezes your buns");
				if(!pc.hasVagina() && pc.hasCock()) output(", steadfastly ignoring your drizzling [pc.cocks]");
				else if(pc.hasVagina()) output(", his thick finger daring to prod at a needy slit");
				output(". <i>“Got a man somewhere? Or you one of those milk barn girls?”</i>");

				output("\n\nYou fish around for the words to answer, but each time you do, your [pc.nipples] light up like buzzers and scatter all the letters apart into happy frissons of lactic delight. Instead, you let out a plaintive little moan.");
				output("\n\nThe bull man pats you comfortingly once more");
				if(!pc.hasVagina()) output(", this time openly squeezing and fondling at your [pc.butt]");
				else output(", this time openly fingering you while he walks. He even pulls out his moistened digit to sample your flavor");
				output(". <i>“Milk barn it is then. Don’t you worry, we’ll get you back in a proper stall and make sure you have all the food and water you need to milk yourself as much as you want.”</i> He pauses and adjusts a very insistent looking bulge beneath his overalls. <i>“I’ll even visit you. How’s that sound, girl?”</i>");
				output("\n\nIt sounds ");
				if(pc.hasVagina()) output("panty-creamingly good.");
				else output("good enough to make your [pc.nipples] squirt onto your host’s bulge. You wonder if he’ll use your [pc.milk] as lube and titfuck you after he gets you hooked up. It’s almost enough to make you cum on the spot.");
				//Next
			}
			//Tittymonster bad-end
			else
			{
				output("How long you spent laying there in a pool of your own milk, lowing like some kind brainless sow, you don’t know. What you do know is that the pleasure from Gush never seemed to go away. Sure, the euphoria diminished, but your breasts are just so big and so wonderful that you never really saw a reason to stop tugging on them. Heck, after a while, your sore tits started leaking [pc.milk] again.");
				output("\n\nIt’s only been four hours since then, and you’re still leaking, still dribbling your marvelous [pc.milkNoun] all over yourself. You lick some off your fingers and hum in wonder at the taste, aware that at some point you should probably seek sustenance, but your fluid-filled boobs are just too heavy to lift. Maybe, just maybe, you could crawl if you really tried, but imagining your perfect [pc.nipplesNoun] dragging across the rough ground just seems wrong. They deserve to be in fingers... or milkers.");
				output("\n\nYou cum at the thought, not that you aren’t awash in a sea of lactic bliss at this very moment, but the upsurge in blissed-out milkiness is enough for you to notice. Maybe you could get someone to milk you? You call out, your voice harsh from your parched throat. Funny how thirsty you’ve gotten, and how easy it is to ignore with boobs like this. Again and again you call out, each time a little more deliriously. Sometimes you just bleat out a moo. Whatever. At least you’ve got your perfect titties.");
				//Newpage
			}
			
			kGAMECLASS.processTime((4 * 60) + rand(15));
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",gushBadEndPartII);
		}
		public function gushBadEndPartII():void
		{
			clearOutput();
			var pc:PlayerCharacter = kGAMECLASS.pc;
			if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet == "PLANET: NEW TEXAS")
			{
				kGAMECLASS.currentLocation = "BrynnsStall";
				kGAMECLASS.generateMap();
				kGAMECLASS.showLocationName();
				kGAMECLASS.showBust("BRYNN_NUDE","CAMERON_NUDE");
				
				pc.removeAll();
				
				output("The milking chair is really soft and cushiony. It even has ");
				if(pc.legCount > 1) output("individual supports for your [pc.legs] to keep them comfortable and spread.");
				else output("supports and straps for your unconventional form, adjustable to thrust your crotch out at a moment’s notice.");
				output(" The cups feel way better on your [pc.nipples] than your hands ever did, and the food hose hanging above your mouth is there to slake your hunger and thirst whenever you want. You can even stroke your [pc.chest] or a stud’s cock while you drink.");
				//Nocunt
				if(!pc.hasVagina())
				{
					output("\n\nThere’s a little bit of a mediciny aftertaste, but it’s a small price to pay for the comfort you’re getting to partake in. Even your crotch gets in on the game, tingling with a glow of its own, getting hotter and hotter with every pump on your tits. When you can bear it no longer, you reach down with one hand and rub at it, discovering soft folds and a crease that feels even better when you push down on it. It’s slippery too, not with milk but something else. You add another finger shrug, frigging your new vagina while it deepens to handle a bull-sized load.");
					
					pc.createVagina();
					pc.vaginas[0].minLooseness = 2;
					pc.vaginas[0].minLooseness = 2;
					pc.vaginas[0].wetnessRaw = 4;
				}
				//Resume
				output("\n\nWhen");
				if(!kGAMECLASS.brynnIntroduced()) output(" a bull-horned stud");
				else output(" Brynn");
				output(" starts fucking you, you almost protest. How could you, though? You feel so good, and when his cock kisses your pussy lips, it takes all the straps on the chair to keep you from thrusting up and out of it, if only to bury him to the bottom of his cum-slicked sheath. He works his way in slowly, coating himself liberally with some kind of lubricant that’s making you all stretchy and wet.");
				output("\n\nYour resistance melts away beneath the pleasure. Your tits continue to gush their [pc.milkFlavor] warmth into the tubes. Surely this is the place for you. You can’t imagine being anywhere else, or anything really, not when there’s hard dicks lining up to see you and your amazing boobs. Maybe");
				if(kGAMECLASS.flags["MET_CAMERON"] == undefined) output(" that girly farmer boy");
				else output(" Cameron");
				output(" will come titfuck you next.");
				
				pc.cuntChange(0, kGAMECLASS.brynn.cockVolume(0), false);
				
				for (var i:int = 0; i < 8; i++)
				{
					pc.loadInCunt(kGAMECLASS.brynn, 0);
					kGAMECLASS.brynn.orgasm();
					pc.orgasm();
				}
			}
			else
			{
				kGAMECLASS.currentLocation = "GAME OVER";
				kGAMECLASS.generateMap();
				kGAMECLASS.showLocationName();
				kGAMECLASS.showBust("ZODEE");
				
				output("Water splashing your face rouses you. At some point you passed out, but there’s a nice blue lady there with cute little antennae and big, bouncy breasts of her own. You try to remember how to string together words while your fingers go back to work, pumping and tugging on backed-up teats. The [pc.milk] pours in out thick streams made all the thicker by your dehydration.");
				output("\n\nShe supplies the words for you. <i>“Too much Gush?”</i>");
				output("\n\nYou moan and nod, giving her pleading eyes. Maybe she’ll suck on your nipple.");
				output("\n\nSighing, she plugs your mouth with a water bottle and stands up, pulling out some kind of communicator. In this light, you can see that her blue skin is semi-translucent and as smooth as a latex sheet. She’s a rahn for sure, bound up in a nice, tight jump-suit that lets her rounded asscheeks hang free. You suckle the water, too fucked on your own sensuous milking to care about an ounce of propriety.");
				output("\n\nAfter a while, the blue woman turns back to you with a smile. <i>“You’re not going to be much good on your own anymore, babe, but don’t you worry.”</i>");
				output("\n\nYou moan into the water bottle, aroused by your own helplessness and yet unable to care. It feels too good to worry.");
				output("\n\n<i>“We’ll take good care of you, even get some top of the line milkers from New Texas to hook you up to. The governor owes me and Andgi a favor anyway.”</i>");
				output("\n\nThe sound of suckling on an empty water bottle fills the air until your host tires of it and yanks it from your mouth. In a moment of clarify, you think to slur, <i>“Wass yer name?”</i>");
				output("\n\nThe buxom alien pats your head. <i>“Aww, so you can still talk! Maybe I’ll sell you after all. Ones that can talk fetch a higher price.”</i> One hand crudely gropes at your plus-sized milkers, forcing out a thick eruption from a straining nipple. <i>“I’m Zo’dee, not that a prized milker like you will need to know that.”</i> She pauses and licks her lips. <i>“You don’t mind if I take a sample of my new property, do you?”</i>");
				output("\n\nNew property? Sample? Your head is swimming but your milking feels so damned good that you forget how to say no. What could be wrong with agreeing? You nod your head.");
				output("\n\nZo’dee giggles. <i>“Of course you’ll say yes, won’t you, my eager little [pc.milkNoun]-slut?”</i> She bends low for a drink, and when her lips meet your [pc.nipple], all you can do is moan your assent, forgetting your mission almost as fast as your new owner’s name.");
			}
			
			kGAMECLASS.showName("\nTITTIES!");
			kGAMECLASS.processTime((2 * 60) + 15 + rand(15));
			
			kGAMECLASS.badEnd();
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Gush
				var pc:PlayerCharacter = target as PlayerCharacter;
				//Just in case it didn't get unlocked before.
				CodexManager.unlockEntry("Gush");
				//Not read codex
				if(!CodexManager.entryViewed("Gush"))
				{
					output("You got warned about this stuff back in the S.C.A.R.E. program they subjected you to in school. Maybe you should at least look it up on the codex and make sure that it won’t turn you into a sentient boob or anything crazy - just to be sure.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				//Add mandatory taint!
				pc.taint(5);
				//First Time
				if(kGAMECLASS.flags["USED_GUSH"] == undefined)
				{
					output("You turn the subdermal spraypen over in your hands. Supposedly all you need to do is mist your [pc.fullChest] with it and the chemicals will do the rest.");
					if(pc.isChestGarbed()) output(" Gingerly removing your [pc.upperGarments]");
					else output(" Gingerly holding it in front of your bare [pc.skinFurScalesNoun]");
					output(", you aim and spray across your vulnerable flesh. The gel feels cool and slick against you at first, but goes warm and tingly within the span of a few seconds. You drop the spent spraypen and watch, feeling the pinpricks radiating through your [pc.chest].");
				}
				//Repeats
				else
				{
					output("You try hard to keep yourself from panting in excitement at the thought of taking another dose of gush. Your hands are shaking");
					if(pc.isChestGarbed()) output(", making removing your [pc.upperGarments] harder than it ought to be");
					else output(", making it harder than it ought to be to thumb off the safety on the spraypen");
					output(". Licking your lips excitedly, you point the tip at your right");
					if(pc.nipplesPerBreast > 1) output("most");
					output(" [pc.nipple] and begin unload the illicit contents across your chest, soaking your [pc.skinFurScalesNoun] in cool, moist gel that goes warm and tingly in seconds.");
				}
				//1. Not Lactating? Start.
				if(!pc.canLactate())
				{
					//First Time user
					if(kGAMECLASS.flags["USED_GUSH"] == undefined) 
					{
						output("\n\nIt takes a little longer for your body to fully absorb the liquid and for your brain to digest the enormity of what you’ve just done. You’re going to get big, leaky tits from this stuff - boobs that squirt [pc.milk] at the slightest provocation. One of your hands idly begins to paw at your drying ");
						if(pc.biggestTitSize() < 1) output("chest");
						else output("boobs");
						output(", your breath sounding entirely too hot and excited to your ears. When is it going to kick in? You don’t recall the Codex listing a delay before the Gush would kick in. Isn’t it supposed to be instantaneous?");
					}
					//Repeat
					else
					{
						output("\n\nYou know from experience that it takes a little while for the Gush to be fully absorbed by your body. While you wait, you wonder just why you ever let yourself stop lactating. How could you have given up such a marvelous gift, even if it was a bit cumbersome to deal with while sober?");
					}
					//merge first/repeat milkgets
					output("\n\nYou look back down at your tits.");
					if(pc.biggestTitSize() < 1) output(" Even when a flat chest, that seems like the right word for your pecs. They’re like titty seeds, and you just watered them!");
					else if(pc.biggestTitSize() < 15) output(" Even though they aren’t that big, that feels like the right word for them, right? They’re just young tits, waiting to bloom into big, juicy tittymelons.");
					else output(" You know that objectively, they must be considered huge tits, but right now, they look almost... too small, like plants that are waiting to be watered and ripen into lusciously massive melon-mammaries.");

					output("\n\nThat tingling warmth is getting worse, making it hard to think of anything else. It’s like a buzz in your boobs");
					if(pc.biggestTitSize() < 1) output(" - right, boobs is the proper word -");
					output(" that drowns out all your other concerns. There’s just something fascinating about them, the way they seem to pulse in your hands, the way your [pc.nipples] are all pebbly and sensitive. When did you grab them? How could you think about anything besides the delightful tingles in your chest?");
					output("\n\nIt’s almost impossible to pull your hands away, but you make do, if only so you can better view your burgeoning bosom as it grows.");
					if(pc.biggestTitSize() < 1) output(" You’re getting real tits now! They’re at least B-cups already");
					else output(" Your titties are getting pretty big now! They’re a cup size or two bigger already");
					output(" and swelling larger by the second, visibly pulsing with new growth. Moaning in excitement, you realize that one hand has reached back up to caress a sensitive [pc.nippleNoun]. You don’t try to stop it. How could you when they beg to be touched, tugged, and pinched? How could you do anything but maul your own all-important tits and worship at the altar of your bountiful bust?");
					output("\n\nBest of all, the sensations grow hotter and more potent moment by moment. Your chest isn’t just buzzing and throbbing with sensuous delight anymore, it’s demanding your undivided attention, guiding your fingers to press and rub at too-sensitive nipples, demanding your eyes remain locked on the top of an expansive boob-shelf. It’s so beautiful, so perfect, and only growing more alluring by the second. The rest of the world has fallen away behind their curve. Your past lovers? They couldn’t hold a candle next to the magnificence of your own hot, glistening teats.");
					output("\n\nYour busily tugging fingers grow wet while they work, coated in a thin sheen of [pc.milkColor] from their efforts. You’re lactating already? The thought sends a delicious thrill through your body and, most importantly, your [pc.nipples]. You tug one and focus in on that thought. <b>You’re lactating.</b>");

					//No new PG. Cox:
					if(pc.hasCock())
					{
						//Nocum
						if(pc.cumQ() < 5)
						{
							output(" Your [pc.cocks] twitch");
							if(pc.cockTotal() == 1) output("es");
							output(" wildly, squirting your meager reserves ");
							if(pc.isCrotchGarbed()) output("into your [pc.lowerGarment]");
							else output("onto the ground");
							output(" in a hands-free orgasm that pales next to the pleasure of expressing a single droplet of [pc.milk].");
						}
						//Cum
						else
						{
							//Crotchgarb!
							if(pc.isCrotchGarbed())
							{
								output(" Your [pc.cocks] dump");
								if(pc.cockTotal() == 1) output("s");
								output(" a thick load of [pc.cumNoun] directly into your [pc.lowerGarment]");
								if(pc.cumQ() >= 100) output(", enough to run down your [pc.legOrLegs] and puddle on the ground");
								output(", but the pleasure of that hands-free orgasm is nothing next to the ecstasy of expressing a single droplet of [pc.milk].");
							}
							//Noclothes in the way
							else
							{
								output(" Your [pc.cocks] dump");
								if(pc.cockTotal() == 1) output("s");
								output(" a thick load of [pc.cumNoun] onto the ground in front of you, pulsing in perfect time with the leakages from your nipples, yet the hands-free pleasure in your crotch is nothing compared to the titillating bliss radiating from your nipples with every fresh drop.");
							}
						}
					}
					//Vagooz
					if(pc.hasVagina())
					{
						//Had dicks
						if(pc.hasCock())
						{
							output(" And [pc.eachVagina] aches for something inside of it, not as badly as your chest needs to be caressed and squeezed, but enough to penetrate the drippy haze in your mind. If only you had the flexibility to bend double and cram your aching nips inside yourself!");
						}
						//No
						else
						{
							output(" Your [pc.vaginas] clench");
							if(pc.isSquirter()) output(" and squirt");
							if(pc.isCrotchGarbed()) output(" into your [pc.lowerGarment]");
							output(", heedlessly cumming without so much as a brush against your [pc.clits]. The orgasm pales in intensity next to the pleasure of expressing a single drop of [pc.milk]. Still, you find yourself idly considering if it’d be possible to bend double and cram a [pc.nippleNoun] into [pc.oneVagina], if only to satisfy both aches at once.");
						}
					}
					//Genderless
					if(!pc.hasCock() && !pc.hasVagina()) output(" Your [pc.asshole] clenches in a sudden, full-body orgasm, but the pleasure of the climax pales next to the bliss you get from expressing even a single droplet of [pc.milk].");
					//New PG
					output("\n\nYou need to find someone to fuck you and suckle the [pc.milk] that’s pouring out in streams!");
					pc.boostLactation(90, false);
					if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
					pc.milkFullnessAdd(100, false);
					pc.orgasm();
				}
				//2. Lactating? Lactate harder
				else
				{
					if(kGAMECLASS.flags["USED_GUSH"] == undefined)
					{
						output("\n\nIt takes a little longer for your body to fully absorb the liquid and for your brain to digest the enormity of what you’ve just done. You’re going to get leakier tits from this stuff - boobs that squirt [pc.milk] at the slightest provocation. One of your hands idly begins to paw at your drying ");
						if(pc.biggestTitSize() < 1) output("chest");
						else output("boobs");
						output(", your breath sounding entirely too hot and excited to your ears. When is it going to kick in? You don’t recall the Codex listing a delay before the Gush would kick in. Isn’t it supposed to be instantaneous?");
						output("\n\nYou can feel yourself blush, your heart thudding against your ribcage as if it wants to help push ");
						if(pc.biggestTitSize() < 1) output("out a pair of tits all on its own");
						else output("even more breast out of your body");
						output(". You fan at yourself in a vain attempt to deal with the prickly sensation of molten potential pouring into your [pc.chest] and clap a hand over the quivering muscle; a mistake, you realize, all too late.");
					}
					else 
					{
						output("\n\nYou remember the cool, chilly feeling all too well, enjoying it for the brief seconds it lasts before it’s wicked up by your [pc.skinFurScales] and converted into that warm, blessed tingling that tells you the drug is doing its job. Already, you can feel yourself blush, your heart thudding against your ribcage as if it wants to help push ");
						if(pc.biggestTitSize() < 1) output("out a pair of tits all on its own");
						else output("even more breast out of your body");
						output(". You fan at yourself in a vain attempt to deal with the prickly sensation of molten potential pouring into your [pc.chest] and clap a hand over the quivering muscle; a mistake, you realize, all too late.");
					}
					output("\n\nThe flesh under your palm feels <i>good</i> and... right, like it was molded to support the firm press of your digits, to feel every nook and cranny of your hand cup it and support it.");
					if(pc.biggestTitSize() < 1) output(" There’s more than there used to be too, a wonderful softness that can only be the beginnings of a decent rack.");
					else output(" There’s so much to hold on to, a marvelous new softness that can only be evidence of a perfectly swelling rack.");
					output(" A throaty " + pc.mf("growl","purr") + " escapes your throat as you give yourself over to the sensations, aware for the first time that Gush has well and truly kicked in.");
					output("\n\n");
					if(kGAMECLASS.flags["USED_GUSH"] != undefined) output("Just like before, y");
					else output("Y");
					output("ou find your sweater-puppies practically purring. They irresistibly demand your attention, suddenly the most important thing in the ");
					if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR)) output("room");
					else output("area");
					output(". How could you have ignored them for so long? The regret inside you is soon replaced by delight, washed away by a need to live in the moment, worshipping your ");
					if(pc.biggestTitSize() < 1) output("new-grown");
					else output("expanding");
					output(" boobs with both hands. You almost wonder when the second joined the first in pawing at your expanded assets, but feeling the [pc.milk] begin to drip from your [pc.nipples] banishes such wasted musings.");

					output("\n\nTugging on ");
					if(pc.totalNipples() == 2) output("both");
					else output("two of your");
					output(" [pc.nipples] now, you collapse to the ground");
					if(pc.isCrotchGarbed()) output(", briefly wondering what happened to your [pc.upperGarments]");
					output(". It’s almost impossible to keep the ecstasy from rolling back your eyes, let alone to remember that you’ve got ");
					if(!pc.hasVagina() && !pc.hasCock()) output("another erogenous zone available");
					else output("other erogenous zones to pleasure");
					if(pc.hasCock() && pc.cumQ() >= 100) 
					{
						if(!pc.isCrotchGarbed()) output(", evidenced by the [pc.cumVisc] discharge flooding your [pc.lowerGarment]");
						else output(", evidenced by the [pc.cumVisc] discharge flooding the ground");
					}
					else if(pc.hasVagina() && pc.isCrotchGarbed())
					{
						output(", evidenced by the "); 
						if(!pc.isSquirter()) output("dampness in your");
						else output("[pc.girlCum] splattering against your");
						output(" [pc.lowerGarment]");
					}
					output(".");

					output("\n\nThere’s no stopping the tidal wave of backed-up bliss; you can feel it pushing against your [pc.nipples] from the inside, released in squirts and sprays more orgasmic than any climax amidst your nethers. You tug at them in a wild frenzy, too delirious to register pain or discomfort. Any sensation at all from your blessed breasts might as well be ambrosia on your tongue, too godly to question or even understand, the sensations beyond your mind’s ability to conceive.");
					output("\n\nOn your ");
					if(pc.isTaur()) output("side");
					else output("back");
					output(", you mindlessly milk huge squirts of [pc.milk] onto ");
					if(!pc.isTaur()) output("yourself and ");
					output("the ground");
					if(pc.hasCock() && pc.cumQ() >= 500) output(" where it can mix with your [pc.cum]");
					output(". There’s so much!");
					if(pc.lactationQ() < 100) output(" You were so empty before, but somehow, Gush has made you... well, gush.");
					output(" Rivers of it wash down the sides of your growing tits, coating your hands until you might as well be wearing [pc.milkColor] gloves.");
					//if(pc.milkMultiplier < 125) pc.milkMultiplier = 125;
					pc.boostLactation(15, false);
					pc.milkFullnessAdd(100, false);
				}
				//Actually boost boobs 'n shit
				pc.lust(pc.lustMax());
				//libido gains with next page.
				for(x = 0; x < pc.bRows(); x++)
				{
					pc.breastRows[x].breastRatingRaw += 3 + rand(4);
					if(pc.hasPerk("Milky")) pc.breastRows[x].breastRatingRaw += 2;
				}
				kGAMECLASS.processTime(10+rand(5));
				//BAD END CHECK!
				if(pc.libido() >= 100 && pc.breastRows[0].breastRating() >= 72 && rand(3) == 0)
				{
					kGAMECLASS.clearMenu();
					kGAMECLASS.addButton(0,"Next",gushBadEndPartI);
					return true;
				}
				//epilogue - no bad end!
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0,"Next",notBadEndEpilogue4Gush);
				return true;
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the cream to no effect.");
			}
			return false;
		}
		public function notBadEndEpilogue4Gush():void
		{
			clearOutput();
			var pc:PlayerCharacter = kGAMECLASS.pc;
			output("You lose track of time under the psychosensory assault blasting out of your plentiful boobs. Thoughts of delight and pleasure bounce around, unattached to any sort of linear progression or chain of cognition as if they’re the only thing your brain has room for, and in a way, that’s true. Your beautiful bosom has monopolized your mind for its own ends, forcing your hands to endlessly worship your [pc.nipples]. Who are you to stop it, and why would you want to? It feels so good to pinch and tug and squirt!");
			output("\n\nSeconds, minutes, and maybe even hours are passing, but they’re of little consequence to you. You’re lead, squirming and moaning, from one [pc.milk]-dripping orgasm to the next, coating yourself so thickly in the [pc.milkVisc] fluid that its all you can smell anymore. Even if a whole crowd of aliens were to stop and stare, you wouldn’t be aware of them; your eyes are rolled back too far, and if they weren’t, you wouldn’t be looking at anything but your own fecund chest, drooling over how mind-meltingly sensual the very act of lactation has become.");
			output("\n\nSquirt. Gasp. Dribble. Moan and quiver. On and on, the cascades of ecstasy wash over you, exuded from your [pc.nipples] as easily as the constant streams, but eventually, even seemingly timeless pleasure must abate. You dimly become aware that your [pc.milkNoun] has stopped flowing, your reserves exhausted.");
			output("\n\nYour [pc.nipples] still feel amazing, of course, so you continue to gently tug at them, begging them to give you a few last drops of [pc.milkNoun], but all they give is gradually fading delight. You manage to drag your eyes out from behind half-closed lids to look down and sigh in disappointment. Your [pc.chest] are no longer quite so mesmerizing.... Yes, they’re absolutely gorgeous, but you’re sure that you could look away or stop milking them... if you wanted to.");
			output("\n\nAfter a few more minutes of raptly watching your finger’s attempts, you manage to stop yourself and catch your breath. What a trip! You still feel a wondrous kind of kinship with your [pc.chest] too, less like they’re a part of you and more like you’ve become a part of them, but that’s okay. There are worse things than having an enhanced portion of your body become so important.");
			//Dozen or so cums
			kGAMECLASS.processTime(20+rand(20));
			
			for(var i:int = 0; i < 9; i++)
			{
				pc.orgasm();
				if(i > 3 && rand(3) == 0) pc.orgasm();
			}

			//Summary of changes for the end!
			output("\n\nNow that you’ve had a chance to breathe, you suppose you ought to see what the Gush did to you. ");
			if(pc.biggestTitSize() <= 5) output("A simple squeeze of <b>your [pc.breastCupSize]s</b> confirms that you’ve got a decent size rack now.");
			else if(pc.biggestTitSize() <= 20) output("A two-handed squeeze of <b>your [pc.breastCupSize]s</b> is all it takes for you to come to grips with your even larger bosom. Not that you can complain; your gaze keeps being drawn into your own cleavage again and again.");
			else if(pc.biggestTitSize() <= 45) output("Your hands sink right into <b>your [pc.breastCupSize]s</b> when you try to weight them. No doubt about it, you’ve got more boob than any one person can properly handle. Maybe you can find a 4-armed lover to give you a proper milking.");
			else output("Your hands seem so small next to <b>your [pc.breastCupSize]s</b>, practically disappearing into their squishy mass as soon as you touch them. A shiver of delight races up your spine at the realization of just how giant your mammaries have become. They’ll stop traffic even if you keep them covered, and they’ll definitely stop traffic once your [pc.milk] gets backed up and leaks through your top.");

			//No new PG: Libido changes
			pc.slowStatGain("libido",10);
			pc.libido(3);

			if(pc.libido() < 30) output(" What’s more, you realize now that your [pc.fullChest] aren’t just ornaments. They can be instruments of pleasure when you decide to play them that way, and you do so want to play with them again.");
			else if(pc.libido() < 50) output(" Your heart beats faster just remembering the experience, your [pc.nipples] now hard enough to cut glass. Part of you hopes someone will notice and dare to tease you about them. Another hopes someone will be daring enough to reach out and squeeze one. <b>Your libido is definitely higher.</b>");
			//Sub 75
			else if(pc.libido() < 75) 
			{
				//Dix
				if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) 
				{
					output(" Still hard and wreathed in a halo of ");
					if(pc.cockTotal() == 1) output("its");
					else output("their");
					output(" own [pc.cum], your [pc.cocks] are more than a little thrilled by the memories Gush has left you with. Maybe... maybe you’ll be able to bend low enough to titfuck your [pc.cocks]... as a reward for being so good. You blink at the stray thought. <b>You’re definitely getting more libidinous!</b>");
				}
				//Cunts
				else if(pc.hasVagina())
				{
					output(" Still more than a little wet from your adventures with Gush, you dip a finger inside yourself and coo happily, imagining how everyone will react to your new, bigger titties and how they jut out so proudly from your chest. A messy cum later, you conclude that <b>you’re getting really libidinous.</b>");
				}
				//No genitals
				else output("\n\nSore and aching, your [pc.nipples] are nevertheless hard and jutting proudly forward. Even if you covered them, everyone would probably see how lewd your tits have gotten, and honestly, you couldn’t blame them. You have some randy, slutty teats now, and you hope someone will notice... or give them the squeezing they deserve. <b>By the void, this stuff is going to turn you into a slut!</b>");
			}
			//Sub 90
			else if(pc.libido() < 90)
			{
				output("\n\nStill tingling with residual afterglow, your [pc.nipples] should be raw and sore, but all you feel radiating from them is a desire for more. You wish they’d fill back up right now so that you could lie here and milk yourself all over again, painting yourself [pc.milkColor] in your excitement. And then... then you could get a crowd and let them drink from you one after another. You’d probably cum four or five times just from that. <b>Fuck! You’d better lay off this stuff if you want to stay out of trouble...</b>");
			}
			//Sub Max (Ostensibly 100, but could be changed by bimbo mods and the like)
			else
			{
				output("\n\nUgh, the comedown afterward is always the worst part. Sure, you’ve got the aftershocks of dozens of orgasms swaddling your thoughts in endorphins, but you also know that it’s over. Leaking [pc.milk] isn’t going to have you writhing on the floor all on its own. You’ll need hungry hotties to nurse at your titties if you want to feel anywhere near that good again. You catch yourself brushing your agonizingly sensitive [pc.nipplesNoun] and wonder just how soon you’ll have more [pc.milk] to give. <b>Is there anything better than getting milked? No, definitely not.</b>");
			}
			//Special shit: on new PGs
			//Boosted lactation speed - increases up to thrice human norms.
			if(pc.milkRate < 25 && rand(3) == 0)
			{
				output("\n\nResidual warmth lingers deep inside your [pc.fullChest], carrying a certain sense of... plenty with it. Already, the soreness of being completely empty is fading. Did it make you able to <b>fill your breasts even faster?</b> Oh, you’re going to have to milk yourself even more often now!");
				if(pc.hasVagina())
				{
					output(" Your [pc.vaginas] clench");
					if(pc.totalVaginas() == 1) output("es");
					output(" sympathetically, oozing [pc.girlCum].");
				}
				pc.milkRate += 5;
				pc.lust(5);
			}
			//Increased ability to store milk (capacity multiplier). Maxes out at 3x normal.
			else if(pc.milkStorageMultiplier < 3 && rand(2) == 0)
			{
				output("\n\nAfter a workout like that, you’re pretty confident <b>your [pc.chest] are going to be even better at holding milk</b>, something about more elastic mammary and duct tissue and fat deposit conversion. You remember reading it in your codex before, but it can’t compare to knowing you’re turning into a [pc.milkNoun]-squirting machine who could win milking competitions while cumming nonstop.");
				pc.milkStorageMultiplier += 0.25;
				pc.lust(10);
			}
			//Extra nipple per boob
			else if(rand(5) == 0 && pc.nipplesPerBreast < 4)
			{
				output("\n\nWhoah, fuck! Your hand was just kind of idly tugging at one of your [pc.nipples] when your knuckle brushed another one... one that shouldn’t be there. You look down in shock and arousal, suddenly and totally aware that <b>your tips have doubled into multiple teats connected by enlarged areolae!</b> And with twice the milkspouts comes twice the pleasure. You can barely resist tugging on them at this very moment. It’d feel sooo good.");
				pc.nipplesPerBreast *= 2;
				//+33 lust.
				pc.lust(33);
				//+1libido
				pc.libido(1);
			}
			kGAMECLASS.flags["USED_GUSH"] = 1;
			pc.milked(100);
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}

