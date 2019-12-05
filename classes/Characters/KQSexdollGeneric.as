package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Transformatives.Soak;
	import classes.Items.Transformatives.LaquineEars;
	import classes.Items.Protection.JumperShield;
	import classes.Items.Armor.JumperJumpsuit;
	import classes.Items.Armor.JumperJumpsuitSlutty;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class KQSexdollGeneric extends Creature
	{
		//constructor
		public function KQSexdollGeneric()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "";
			this.originalRace = "";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = ""; // Implementation in prepForCombat
			this.customBlock = "";
			this.customDodge = "She dances out of the way, somehow making a hasty dodge appear erotic.";
			this.isPlural = false;
			
			this.armor.longName = "birthday suit";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;

			//Built tough for rugged fukkin'
			baseHPResistances.kinetic.damageValue = 50.0;
			//Naked folks suck at handling cold...
			baseHPResistances.freezing.damageValue = -100.0;
			//Half damage from drugs!
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			
			//this.shield = new JumperShield();
			//this.shield.shields = 150;
			//this.shield.hasRandomProperties = true;

			this.physiqueRaw = 35;
			this.reflexesRaw = 45;
			this.aimRaw = 40;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 20;
			this.libidoRaw = 150;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.hairType = GLOBAL.TYPE_HUMAN;
			//this.scaleColor = "blue";
			//this.furColor = "PLACEHOLDER";
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.lipMod = 1;

			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			this.legCount = 2;
			this.cocks = new Array();
			this.createCock();
			this.cockVirgin = false;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 100;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 18;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 24;
			this.timesCum = 31113;

			this.elasticity = 4;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			//this.impregnationType = "BoredJumperPregnancy";

			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Sexdoll";
			//this.impregnationType = "LapinaraPregnancy";
			//kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
			this.createPerk("Appearance Enabled");
			this.createPerk("Inhuman Desire",150);
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(3 + rand(3),-1);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE, sexualPreferences.getRandomLikeFactor());

			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, sexualPreferences.getRandomDislikeFactor());

			//sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, GLOBAL.REALLY_DISLIKES_SEXPREF);

			var selectDoll:Number = rand(4);

			//Vulpatra
			if(selectDoll == 0)
			{
				this.originalRace= "vulpatra";
				this.short = "vulpatra fuckdoll";
				this.long = "The vulpatra fuckdoll’s stature makes her less imposing than many things you’ve encountered on your journey, but her small frame packs more eroticism per cubic inch than most pornstar’s you’ve seen. Shimmery blue fur compliments her every move with waves of glimmering reflection, and the rest of her joins right in. Her breasts sway pendulously no matter how she shimmies and swivels. Her cock, proportional to her frame, still manages to wiggle atop her cutely positioned balls, and a few feet above it all, she licks her purple-painted lips with obvious hunger, fluttering her cute, glitter-rimmed eyes like she’s the innocent in the room.\n\nYou’d be tempted to give her fluffy ears a scratch if they didn’t have puffy slits concealed inside them... and if she wasn’t trying to sexually subjugate you, of course.";
				this.tallness = 39;
				this.thickness = 70;
				this.tone = 10;
				this.furColor = "blue";
				this.hairColor = "purple";
				this.hairLength = 18;
				this.eyeColor = "purple";
				this.lipColor = "pink";
				this.skinType = GLOBAL.SKIN_TYPE_FUR;
				this.skinTone = "tan";
				this.skinFlags = [GLOBAL.FLAG_FURRED];
				this.faceType = GLOBAL.TYPE_VULPINE;
				this.faceFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_MUZZLED];
				this.armType = GLOBAL.TYPE_VULPINE;
				this.armFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_PAWS];
				this.breastRows[0].breastRatingRaw = 17;
				this.cocks[0].cLengthRaw = 6.5;
				this.cocks[0].cType = GLOBAL.TYPE_VULPINE;
				this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
				this.cocks[0].cockColor = "red";
				this.balls = 2;
				this.ballSizeRaw = 6.6;
				this.lipColor = "purple";
				this.earType = GLOBAL.TYPE_VULPINE;
				this.earFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_LONG];
				this.tailCount = 1;
				this.tailType = GLOBAL.TYPE_VULPINE;
				this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_FURRED,GLOBAL.FLAG_FLUFFY];
				this.antennae = 2;
				this.legType = GLOBAL.TYPE_VULPINE;
				this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_FURRED,GLOBAL.FLAG_HEELS,GLOBAL.FLAG_PAWS];
				this.buttRatingRaw = 25;
				this.hipRatingRaw = 14;
				this.vaginas[0].wetnessRaw = 4;
				this.vaginas[0].loosenessRaw = 3;
				this.vaginas[0].bonusCapacity = 100;
				this.vaginas[0].vaginaColor = "red";
				this.nippleColor = "purple";
			}
			// Laquine
			else if(selectDoll == 1)
			{
				this.impregnationType = "LaquinePregnancy";
				this.originalRace= "laquine";
				this.short = "laquine fuckdoll";
				this.long = "Bouncing up and down in front of you is the lapine embodiment to all things whorishly glamorous. A luminous coat of magenta fur covers the grinning fuckpet from the tips of her upright ears to each flexing toe. White sparkles flash between the fibrous strands. She hops from one foot to the other on a bedazzling routine that makes her look like a porny snowglobe in motion. At first you’re distracted by the multiple leaking nipples on her perky boobs, and then you’re watching the heaviest pair of broodmotherly hips enlarged by the power of mad science. They don’t swing or gyrate: they hew; they move as if determined to establish a gravity well.\n\nNeither of those assets compare to the nearly-unflappable girth leaking and flinging purplish pre. The horsebunny’s horsecock isn’t naturally colored: it’s been painted, meticulously textured by the hand of a sex goddess. Gleaming bands of white-purple bolt sleeves and eye-crossing coral swirls together to create the most obscene penis aboard. The flowing patterns synergize with the veins, the medial ring, the sheath, and the contrasting design found on the surface of her sagging nutsack.";
				this.createStatusEffect("Painted Penis",0,2,5,5,false,"LustUp","With her phallus professionally painted, the doll feels slightly more libidinous.",false,28800,0xB793C4);
				this.eyeColor = "blue";
				this.tallness = 12*6+4;
				this.thickness = 45;
				this.tone = 45;
				this.hairColor = "white";
				this.hairLength = 12;
				this.lipColor = "pink";
				this.skinType = GLOBAL.SKIN_TYPE_FUR;
				this.skinTone = "fair";
				this.furColor = "magenta";
				this.skinFlags = new Array();
				this.faceType = GLOBAL.TYPE_LAPINE;
				this.faceFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_MUZZLED];
				this.tongueType = GLOBAL.TYPE_LAPINE;
				
				this.earType = GLOBAL.TYPE_LAPINE;
				this.earFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_FURRED];
				this.antennae = 0;
				this.antennaeType = GLOBAL.TYPE_HUMAN;
				this.horns = 0;
				this.hornType = 0;
				this.hornLength = 0;
				this.armType = GLOBAL.TYPE_LAPINE;
				this.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
				this.legType = GLOBAL.TYPE_LAPINE;
				this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED,GLOBAL.FLAG_HEELS];
				this.tailType = GLOBAL.TYPE_LAPINE;
				this.tailCount = 1;
				this.tailFlags = new Array();
				this.addTailFlag(GLOBAL.FLAG_FURRED);
				//hipRating
				//0 - boyish
				//2 - slender
				//4 - average
				//6 - noticable/ample
				//10 - curvy//flaring
				//15 - child-bearing/fertile
				//20 - inhumanly wide
				this.hipRatingRaw = 20;
				//buttRating
				//0 - buttless
				//2 - tight
				//4 - average
				//6 - noticable
				//8 - large
				//10 - jiggly
				//13 - expansive
				//16 - huge
				//20 - inconceivably large/big/huge etc
				this.buttRatingRaw = 16;
				this.ballSizeRaw = 20;
				this.breastRows[0].breastRatingRaw = 7;
				this.nipplesPerBreast = 4;
				this.nippleColor = "pink";
				this.cocks[0].cLengthRaw = 16;
				this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
				this.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
				this.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
				this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
				this.cocks[0].cockColor = "pink";
			}
			//Ultra-pale human futa with black lipstick and 1-foot dingledong. Hair like dis.
			else if(selectDoll == 2)
			{
				this.originalRace= "terran";
				this.short = "goth fuckdoll";
				if(kGAMECLASS.silly) this.short = "big tiddy goth fuckdoll";
				this.long = "The terran walks like a snake slithers. Her wide hips swivel in long, looping figure eights no matter how quickly she’s trying to get around, a motion that keeps her flawless footlong dick bobbing in attention-grabbing patterns. When you manage to yank your gaze up and away, it unerringly lands upon her plush, augmented tits. Somehow, her nipples look more like latex than skin, shining enticingly enough for you to wonder what they’d taste like. Looking higher offers no respite, only sensuously smiling black lips and a wide-eyed, imploring expression that begs you to give in and let her spend the day " + ((kGAMECLASS.pc.hasCock() || kGAMECLASS.pc.hasVagina()) ? "riding":"sodomizing") + " you.";
				this.eyeColor = "blue";
				this.tallness = 12*5+4;
				this.thickness = 33;
				this.tone = 5;
				this.hairColor = "purple";
				this.hairLength = 16;
				this.lipColor = "black";
				this.skinType = GLOBAL.SKIN_TYPE_SKIN;
				this.skinTone = "fair";
				this.furColor = "magenta";
				this.skinFlags = new Array();
				this.faceType = GLOBAL.TYPE_HUMAN
				this.faceFlags = [];
				this.tongueType = GLOBAL.TYPE_HUMAN;
				
				this.earType = GLOBAL.TYPE_HUMAN;
				this.earFlags = [];
				this.antennae = 0;
				this.antennaeType = GLOBAL.TYPE_HUMAN;
				this.horns = 0;
				this.hornType = 0;
				this.hornLength = 0;
				this.armType = GLOBAL.TYPE_HUMAN;
				this.armFlags = [];
				this.legType = GLOBAL.TYPE_HUMAN;
				this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_HEELS];
				this.tailType = GLOBAL.TYPE_HUMAN;
				this.tailCount = 0;
				this.tailFlags = [];
				//hipRating
				//0 - boyish
				//2 - slender
				//4 - average
				//6 - noticable/ample
				//10 - curvy//flaring
				//15 - child-bearing/fertile
				//20 - inhumanly wide
				this.hipRatingRaw = 15;
				//buttRating
				//0 - buttless
				//2 - tight
				//4 - average
				//6 - noticable
				//8 - large
				//10 - jiggly
				//13 - expansive
				//16 - huge
				//20 - inconceivably large/big/huge etc
				this.buttRatingRaw = 10;
				this.ballSizeRaw = 14;
				this.breastRows[0].breastRatingRaw = 22;
				this.nipplesPerBreast = 1;
				this.nippleColor = "black";
				this.cocks[0].cLengthRaw = 12;
				//this.cocks[0].cocks[slot].addFlag(GLOBAL.FLAG_BLUNT);
				//this.cocks[0].cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
				//this.cocks[0].cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
				this.cocks[0].cockColor = "pink";
			}
			//Demon-morph with 24”</i> rust-red demoncock with black latex nubs :3
			else
			{
				this.originalRace= "terran?";
				this.short = "demonic fuckdoll"
				if(kGAMECLASS.silly) this.short = "Lethice cosplayer";
				this.long = "Modded to the point where her original race is long forgotten, this demonic toy-turned-security officer shows no signs of regretting her transformation. Instead, she prances about with an excess of energy, her hard, jutting, demonic dick dominating your view with its full two feet of corrupted glory. Rust red in color, it’s dotted with dozens of glossy nodules that promise to tickle your inner walls with inhuman pleasure. The sweaty sack below sits high and tight, clearly straining against sudden new growth.\n\nThe demon’s horns would make excellent handholds, should you subjugate her, though you’d best look out if she lowers her head. You’ve no doubt her ";
				if(kGAMECLASS.pc.hasCock()) this.long += "blowjobs are";
				else if(kGAMECLASS.pc.hasVagina()) this.long += "tongue is";
				else this.long += "rimjobs are";
				this.long += " as dangerous as the pointed tips.";
				this.eyeColor = "red";
				this.tallness = 12*5+8;
				this.thickness = 45;
				this.tone = 5;
				this.hairColor = "black";
				this.hairLength = 7;
				this.lipColor = "black";
				this.skinType = GLOBAL.SKIN_TYPE_SKIN;
				this.skinTone = "pale";
				this.furColor = "magenta";
				this.skinFlags = new Array();
				this.faceType = GLOBAL.TYPE_HUMAN
				this.faceFlags = [];
				this.tongueType = GLOBAL.TYPE_DEMONIC;
				
				this.earType = GLOBAL.TYPE_DEMONIC;
				this.earFlags = [];
				this.antennae = 0;
				this.antennaeType = GLOBAL.TYPE_HUMAN;
				this.horns = 2;
				this.hornType = GLOBAL.TYPE_DEMONIC;
				this.hornLength = 8;
				this.armType = GLOBAL.TYPE_HUMAN;
				this.armFlags = [];
				this.legType = GLOBAL.TYPE_HUMAN;
				this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_HEELS];
				this.tailType = GLOBAL.TYPE_DEMONIC;
				this.tailCount = 1;
				this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
				//hipRating
				//0 - boyish
				//2 - slender
				//4 - average
				//6 - noticable/ample
				//10 - curvy//flaring
				//15 - child-bearing/fertile
				//20 - inhumanly wide
				this.hipRatingRaw = 10;
				//buttRating
				//0 - buttless
				//2 - tight
				//4 - average
				//6 - noticable
				//8 - large
				//10 - jiggly
				//13 - expansive
				//16 - huge
				//20 - inconceivably large/big/huge etc
				this.buttRatingRaw = 8;
				this.ballSizeRaw = 17;
				this.breastRows[0].breastRatingRaw = 13;
				this.nipplesPerBreast = 1;
				this.nippleColor = "black";
				this.cocks[0].cLengthRaw = 24;
				this.cocks[0].cType = GLOBAL.TYPE_DEMONIC;
				this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
				//this.cocks[0].cocks[slot].addFlag(GLOBAL.FLAG_FLARED);
				//this.cocks[0].cocks[slot].addFlag(GLOBAL.FLAG_SHEATHED);
				this.cocks[0].cockColor = "rust red";
			}
			credits = 0;
		}
		
		override public function get bustDisplay():String
		{
			if(this.hasCock(GLOBAL.TYPE_EQUINE)) return "KQ_SEXDOLL_LAQUINE";
			else if(this.hasCock(GLOBAL.TYPE_VULPINE)) return "KQ_SEXDOLL_VULPATRA";
			else if(this.hasCock(GLOBAL.TYPE_DEMONIC)) return "KQ_SEXDOLL_DEMON";
			else return "KQ_SEXDOLL_TERRAN";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//Masturbates if blinded, causing small tease damage
			if(this.isBlind()) 
			{
				blindFap(target);
				return;
			}
			//25% chance to cheer you on if you tease her
			if(this.hasStatusEffect("Cheerleader"))
			{
				if(rand(3) == 0)
				{
					cheerleadingRoutineGo(target);
					return;
				}
				else this.removeStatusEffect("Cheerleader");
			}
			//Chance to beg for cummies if at high lust for very low tease damage.
			if(this.lust()/this.lustMax() >= 0.75 && rand(3) == 0) 
			{
				beggingForCummies(target);
				return;
			}
			//If tripped, twerks, causing light lust damage, then getting up.
			if(this.hasStatusEffect("Tripped") || this.hasStatusEffect("Trip") || (this.hasStatusEffect("Staggered") && rand(3) == 0)) 
			{
				straightTrippingFools(target);
				return;
			}

			var choices:Array = [];

			//Sexy Shield Hack
			//reqs shields, ofc
			if(target.shields() > 0 && this.HP() < this.HPMax()) 
			{
				choices.push(shieldHacky);
				choices.push(shieldHacky);
			}
			//Hidden fingie injectors (lustdam), requires no shields
			if(target.shields() <= 0) choices.push(hiddenFingieInjectors);
			//Swirly Hypnoeyes stun? (aim vs reflex)
			//Fen note: the stun never wound up happening.
			choices.push(swirlyHypnoBS);
			//Exhaled lust gas (lustdam) - only once airtight ("lustgasdisable")
			if(!this.hasStatusEffect("lustgasdisable")) choices.push(lustGasExhale);
			//Dick tease! (Shortstacks jump to your face and grind?)
			choices.push(dickTeaseAttack);
			//Combat Moves
			//Titty tease! (low lust damage)
			choices.push(tittyTeaseAttack);

			choices[rand(choices.length)](target);
		}
		//Combat Moves
		//Titty tease! (low lust damage)
		public function tittyTeaseAttack(target:Creature):void
		{
			//v1
			if(rand(3) == 0) output("A swivel to the side is all it takes to send the sexdolls breasts bouncing, and she artfully maneuvers herself to better display the expanse of jiggling cleavage to you, reaching up to gently slap them back into motion as they slow. <i>“Come over here, and you can play with my tits.”</i> Trickles of purplish milk spill from her nipples in enticing streams.");
			//v2
			else if(rand(2) == 0) output("The slutty sexdoll grabs her whorish tits in her hands and pulls them apart, slowly revealing a growing canyon of " + (!this.hasFur() ? "glossy":"fluffy") + ", flushed breast. <i>“Come to momma,”</i> she coos. <i>“I’ll make you feel so good.”</i> She gently presses them together, creating a line of perfect, unbroken cleavage, then bounces the obediently wobbling mounds up and down to a hypnotic, alternating tempo.");
			//v3 (bounce!)
			else output("The sexdoll decides to jump in place instead of fighting, hopping at the perfect tempo to make her over-endowed chest bounce as obscenely as possible. Her [enemy.nippleColor] nips follow a hypnotic, up-and-down path, surrounded by quivering mountains that would feel sooo good to sink your fingers into. <i>“Come give ‘em a squeeze, hot stuff!”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nYou keep your gaze averted from the worst of it, unwilling to dabble in a bit of boobworship with your friend on the line.");
			else
			{
				output("\n\nYou lick your [pc.lipsChaste] before flushing in embarrassment.");
				applyDamage(new TypeCollection( { tease: 8+rand(3) } ), this, target, "minimal");
			}
		}
		//Dick tease! (Shortstacks jump to your face and grind?)
		public function dickTeaseAttack(target:Creature):void
		{
			//v3 (vulpatra only)
			if(this.hasCock(GLOBAL.TYPE_VULPINE) && rand(2) == 0)
			{
				output("The petite, fluffy fuckdoll displays surprising agility by crouching down, then springing forward like a horny missile. ");
				if(combatMiss(this,target)) 
				{
					output("You barely dodge out of the way, watching her crotch sail by a few inches from her face. Miraculously, her erection seems to reach out toward you, almost brushing your cheek on its way by.");
					//{1 lust dam}
					applyDamage(new TypeCollection( { tease: 1 } ), this, target, "minimal");
				}
				else
				{
					var muskAmount:Number = 7;
					var teaseAmount:Number = 7;
					output("You try to dodge, but she lands on your shoulders before you can make the slightest adjustment to your position, slamming her hard, slick meat into your cheek. Her roiling balls droop onto your collarbone while she heedlessly humps your face, fanning her mixed-gender musk at you in cloying waves.");

					if(target.hasAirtightSuit()) 
					{
						output("\n\nAn airtight suit might keep the scent out, but nothing can distract you from the sight of cock grinding on your visor.");
						muskAmount = 0;
					}
					else if(target.willpower()/2 + rand(20) + 1 >= 25)
					{
						output("\n\nYou might have the willpower to resist somewhat, but to ignore such a display is impossible; you’re strong-willed, not dead.");
						muskAmount = 3;
						teaseAmount = 3;
					}
					else 
					{
						output("\n\nYou fumble at the shortstack’s meaty thighs as she relentlessly teases you with her warm, fragrant loins, blushing hotter and harder by the second.");
					}
					output(" When you force the petite prick-vixen off, she smoothly lands on her high-heeled feet, counterbalanced by a twitching, happy tail.");
					applyDamage(new TypeCollection( { tease: teaseAmount, pheromone: muskAmount } ), this, target, "minimal");
				}
				return;
			}
			//v1
			if(rand(2) == 0) output("The fuckdoll thrusts her hips toward, proudly displaying her [enemy.cock]. <i>“Isn’t it beautiful?”</i> She gently shimmies her plusher-than-normal hips around, bouncing the rock-hard thickness excitedly. <i>“It’d feel soooo good in your mouth. For both of us.”</i> She hefts the plump rod in her hands, angling the [enemy.cockHead] directly at your face. <i>“Come suck me, and I’ll make you cum soooo hard.”</i>");
			//v2 helicopter!
			else output("Lurching into motion, the sapient sexdoll swivels her hips in a rapid orbit that sets her [enemy.cock] to spinning. She rotates faster and faster until her length is a spinning blur of temptation, fanning invisible musk in your direction. She giggles dopily and stays just out of reach, forcing you to look at her hypnotically spinning erection if you want to keep your eye on her.");
			//v1+2 resists:
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nYou don’t have time to go around ogling strange women’s cocks!");
			else 
			{
				output("\n\nYour gaze lingers on the artifully engineered fuckdoll’s [enemy.cockNounSimple] for far longer than you’d like to admit.");
				applyDamage(new TypeCollection( { tease: 8+rand(2) } ), this, target, "minimal");
			}
		}
		//Exhaled lust gas (lustdam) - only once airtight
		public function lustGasExhale(target:Creature):void
		{
			output("<i>“Let me set the mood. Here.”</i> The winking sexdoll leans forward, puckers her lips, and lays her palm out like a red carpet for the kiss she’s about to blow. A moment later, a cloud of thick, billowing pink burbles through her glossy angel bows, diffusing its sickly sweet aroma through the local air.");
			if(target.hasAirtightSuit()) 
			{
				this.createStatusEffect("lustgasdisable");
				output(" <i>“Just because you’re all packed tight in that suit doesn’t mean you won’t appreciate the fuck-flavoring when we strip you out of iiiit!”</i>");
			}
			else 
			{
				output(" You can’t escape it, and you can’t hold your breath forever. Eventually, you have to take a breath. You have to let the tainted oxygen seep into your lungs and hope it doesn’t push you over the edge into submission, and you definitely need to stop checking her out while you’re doing it...");
				applyDamage(new TypeCollection( { drug: 12+rand(2) } ), this, target, "minimal");
			}
		}
		//Hidden fingie injectors (lustdam), requires no shields
		//If taken damage
		public function hiddenFingieInjectors(target:Creature):void
		{
			output("<i>“Somebody likes to play rough!”</i> The fuckdoll prances forward and lashes out with her ");
			if(this.hasArmFlag(GLOBAL.FLAG_PAWS)) output("claws");
			else output("fingernails");
			if(combatMiss(this,target)) output(", missing at the last second. <i>“Awww, nuts!”</i>");
			else 
			{
				output(", digging them deep enough into your skin for you to feel something pumping into you, injected through secret channels in the cybernetic slut’s digit-daggers.");
				//react 1
				if(target.lust() < 33) output("\n\nIs it getting warm in here?");
				//react 2
				else if(target.lust() < 66) output("\n\nMaybe it’s the drugs, but these little pricks don’t feel so bad...");
				//react3
				else if(target.lust() < 80) output("\n\nWhile she’s this close, you brazenly ogle her exposed chest for a moment before remembering to push her away.");
				//React4
				else if(target.lust() < 90) output("\n\nIt’s impossible to keep yourself from giving one of her nipples a rough pinch in responsible. A little teasing back feels warranted, necessary even. It’s a shame you need to push her away...");
				//React 5
				else output("\n\nSwooning eagerly, abruptly too aware of how great the forceful slut smells - clean but enticing. Better yet is the sight of her perfect breasts, the heft and thickness of her rigid shaft, and the plump, promising weight of her nuts. You’re left reaching for them when she dances away, giggling.");
				applyDamage(new TypeCollection( { kinetic: 1 } ), this, target, "minimal");
				applyDamage(new TypeCollection( { drug: 15+rand(4) } ), this, target, "minimal");
			}
		}
		//Swirly Hypnoeyes stun? (aim vs reflex)
		//Fen note: the stun never wound up happening.
		public function swirlyHypnoBS(target:Creature):void
		{
			var resist:Boolean = false;
			//Vulpatra vers
			if(this.hasCock(GLOBAL.TYPE_VULPINE))
			{
				output("<i>“Check this out!”</i> The vulpatra leans forward, and her eyes strobe into a kaleidoscope of color. You start to react, but it doesn’t matter. She’s getting closer, filling more and more of your vision. Pushing her away is impossible. You can’t avoid her without looking at her, and when you’re looking at her, you’re getting horny, aching and " + (target.hasCock() ? "hard":"willing") + " at the prospect of a night with the furry minx. She scales your unresisting form until she’s staring at you, face-to-face, beaming mesmerizing, sluttifying colors straight into your eyes, yet that isn’t enough for her. She tilts her head forward until her antenna brushes your forehead, and then, rainbow bliss is blasting through your brain along every thought-channel, filling every nook and cranny with the knowledge that this petite little fluffball could make you feel better than any other woman in the galaxy. She’s the perfect fuck, you realize as she drops to the ground and scampers away, tail wiggling mischievously.\n\n");
				if(!this.hasStatusEffect("hypno")) output("Maybe next time you can grab it and drag her back for more fun...");
				else output("You try to grab it, but you move slower with your head full of explicit images of her every feature. Balls, pussy, cock, and boobs all flutter through your increasingly willing brain.");
			}
			else if(!this.hasStatusEffect("hypno"))
			{
				output("<i>“It’ll be so much sexier if you submit,”</i> the prick-toting tramp promises. She bats her eyelashes once, then opens wide. You’re tempted to crack a joke about her crazy eyes when they start to strobe, flashing brilliant, eye-searing colors that shift and swirl in incomprehensible yet spellbinding patterns. <i>“Give in,”</i> she coos, bathing your brain in thought-derailing patterns. <i>“...and let me fuck you.”</i> You’re on the cusp of giving in when she stumbles on her own outsized heels, disrupting the patterns in time for you to shield your eyes and think about something other than how good it would feel to let her fuck you.");
				output("\n\nThough it would feel good...");
			}
			//repeat hypnobutts.
			else
			{
				output("Flashing strobes lance out of the augmented sexdoll’s eyes once more, but this time you’re ready for it.");
				if(target.reflexes()/2 + rand(20) + 1 >= this.aim()/2+10)
				{
					output(" You raise your hand in time to shield your eyes. Blinking didn’t seem like enough, but like this, you’re safe.\n\n<i>“Party pooper.”</i>");
					resist = true;
				}
				else
				{
					output(" You consider raising your hand, then blinking, then dismiss both as insufficient. The colors are too intense, too mesmerizing to shield yourself from. Clearly your best option is to look down, between the doll’s thighs. If you’re staring straight at her dick, the hypnotic visuals won’t impact you so directly, leaving space for thoughts of your own - like how tasty that [enemy.cockNoun] looks. It would fit so perfectly, so warmly, in your mouth. You’re halfway through fantasizing about dropping to your knees and cupping it two-handed when bemused giggles stir you from your trance.\n\n<i>“Awww, it’s okay if you wanna suck my cock. Just do it.”</i> She blows you a kiss.\n\nYou’d be lying if you said you weren’t tempted - sorely tempted.");
				}
			}
			if(!this.hasStatusEffect("hypno")) this.createStatusEffect("hypno");
			if(!resist)
			{
				applyDamage(new TypeCollection( { psionic: 11 } ), this, target, "minimal");
			}
		}
		//Sexy Shield Hack
		//reqs shields, ofc
		public function shieldHacky(target:Creature):void
		{
			var d:TypeCollection = damageRand(new TypeCollection( { electric: Math.round(35 + this.level * 2.5 + this.bimboIntelligence() / 1.5) } ), 15);
			d.addFlag(DamageFlag.ONLY_SHIELD);
			
			if(!this.hasStatusEffect("shielded"))
			{
				output("<i>“Oh honey, there’s no need for protection with me.”</i> The doll lifts her arm and fuzzy, holographic control panel appears above her wrist. Instead of the technical controls one would expect, it’s filled with a variety of obscene symbols, but the medieval-styled shield with a heart emblazoned upon it is the glyph she dials in on. A single press has an antenna rising from behind her ear, and your shield fuzzing and fizzing, glowing with briefly flickering patterns resembling bulging, alien genitalia. Each time, the readout on your shield belt drops a little bit lower. She hacked your shields!");
				this.createStatusEffect("shielded");
				applyDamage(d, this, target, "minimal");
				applyDamage(new TypeCollection( { tease: 3 } ), this, target, "minimal");
			}
			//Repeat
			else
			{
				output("The hermaphroditic doll brings out her shield hacking subroutine once more.");
				if(target.intelligence()/2 + rand(20) + 1 >= this.intelligence()/2 + 17) output(" This time you’re ready for it, and the only thing her hack wastes is both your time.");
				else 
				{
					output(" This time, your invisible barrier throws up patterns of cascading, sparkling hearts as it is forced to tear itself to pieces.");
					applyDamage(d, this, target, "minimal");
					applyDamage(new TypeCollection( { tease: 3 } ), this, target, "minimal");
				}
			}
		}
		//Masturbates if blinded, causing small tease damage
		public function blindFap(target:Creature):void
		{
			output("<i>“Ohhh, you like sensory deprivation too?”</i> the " + (this.hasCock(GLOBAL.TYPE_VULPINE) ? "petite minx":"full-bodied fuckdoll") + " wastes no time in dropping to the ground, gyrating and leaking excitement from her mixed anatomy. <i>“I looooove a little sens-dep play. Nothing reminds you how good sex can feel like Mistress Po shutting off your vision, ya know?”</i> Two-handed, she grabs her [enemy.cock] and sets to stroking, wringing the impassioned sausage for all she’s worth. <i>“Listen to it,”</i> she coos, fapping fast enough to create audible slaps. Pinkish juices pool around her. <i>“Isn’t it hot? Doesn’t it make you wanna crawl over here and join me?”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nNo... not today. You’re too focused for such a distraction.");
			else 
			{
				output("\n\nIt does.");
				applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			}
		}
		//If tripped, twerks, causing light lust damage, then getting up. (Staggered too?)
		public function straightTrippingFools(target:Creature):void
		{
			output("The toppled tart wastes no time in rolling up onto her hands and knees, but instead of springing up into a ready position, she presents as she is, lifting her ass up over her head to better display the curves of ripe derriere. That bubbly heiny is so much rounder, so much plumper than any species could ever grow on its own. It’s a work of engineered art, and she puts it to work with an aggressive, bouncing twerk. Those cheeks clap and jiggle, cycling through dozens of wobbly, ass-centric patterns that beg for you to grab on and try to take her for a ride.");
			output("\n\nBefore you can do any such thing, the fuckdoll bounces onto her heels and looks back at you with an alluring smile.");
			applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			this.removeStatusEffect("Tripped");
			this.removeStatusEffect("Staggered");
			this.removeStatusEffect("Trip");
		}
		//Chance to run away if below 25% hp and not over 50% max lust.
		public function enemyFlees(target:Creature):void
		{
			output("<i>“If you’re not even gonna try to have fun... I’m... I’m gonna go find someone fun to fuck while I get repaired!”</i> The sexdoll turns tail and runs, not once looking back.");
			CombatManager.abortCombat();
			return;
		}
		//Chance to beg for cummies if at high lust for very low tease damage.
		public function beggingForCummies(target:Creature):void
		{
			//v1
			if(rand(3) == 0) output("<i>“Could you just give in already? Please?”</i> The dolled-up hermaphrodite squirms with barely suppressed need, all but on the edge already. <i>“I wanna fuck you sooo bad. All you have to do is let me. I’ll make you feel so good.”</i> Her cock twitches, drooling glowing purplish goo onto the floor. <i>“And we’ll cum so hard together! Please!”</i>");
			//v2
			else if(rand(2) == 0) output("<i>“Ummm,”</i> the sexpot rambles, <i>“do you think you’d mind crawling over here and just giving in to my... uh...”</i> She blushes. <i>“..." + (kGAMECLASS.silly ? "my bulgie wulgie?":"my cock.") + "”</i> She whines, high pitched and needy. <i>“I’m so fucking hard for you, " + (target.mf("stud","slut")) + ". Just give in already.”</i> Biting her lip, she caresses her breasts absently. <i>“I’ll make it all worth it, but you’ve gotta like, let me.”</i>");
			//v3
			else output("\n\n<i>“Do we have to keep this up?”</i> The naked seductress gyrates with overwhelming erotic energy, swiveling her hips like she’s fucking the air and getting fucked at the same time. <i>“Stop r-r-resisting and just let me fuck you already. Any hole. Any organ.”</i> She sucks on her fingers for a moment. <i>“I’ll do it. I’ll fuck you sidewise. I’ll fuck you in zero G. I’ll make you moan so loud and so long you lose your voice.”</i> Her hips twitch violently enough to eject a rope of glowing cum. <i>“I’ll rut your holes till you’re more comfortable crawling around presenting than walking. F-fuck!”</i>");
			//Resist
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nNo matter how whorish her exhortations, you resist.");
			//Fail
			else
			{
				output("\n\nYou can intend to resist all you want, it doesn’t make what she’s saying and doing any less hot.");
				applyDamage(new TypeCollection( { tease: 4+rand(2) } ), this, target, "minimal");
			}
		}
		//25% chance to cheer you on if you tease her
		public function cheerleadingRoutineGo(target:Creature):void
		{
			if(rand(3) == 0) output("Like a cheerleader on the sidelines of a sporting event, the sexdoll cheers you on with near religious fervor. <i>“Yeaaaah! That’s the spirit! Mmm, show me more!”</i>");
			//alt:
			else if(rand(2) == 0) output("The sexdoll claps for your performance. <i>“Are you sure Mistress hasn’t had a chance to program you yet? You move like one of us...”</i>");
			//Alt2
			else output("<i>“Mmmm, show me more of that, honey!”</i> The sexdoll leans forward and licks her lips, watching with rapt attention. <i>“Tease me to pieces, you sexy slut!”</i>");
		}
	}
}
