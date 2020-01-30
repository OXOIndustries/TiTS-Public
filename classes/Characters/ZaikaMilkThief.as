package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	//import classes.Items.Miscellaneous.Throbb;
	//import classes.Items.Transformatives.Soak;
	//import classes.Items.Transformatives.LaquineEars;
	import classes.Items.Protection.DecentShield;
	//import classes.Items.Armor.JumperJumpsuit;
	//import classes.Items.Armor.JumperJumpsuitSlutty;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Util.RandomInCollection;
	
	public class ZaikaMilkThief extends Creature
	{
		//constructor
		public function ZaikaMilkThief()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "milk thief";
			this.originalRace = "zaika";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = ""; // Implementation in prepForCombat
			this.customBlock = "";
			this.customDodge = "She launches aside with a high-pitched whine of cybernetic effort.";
			this.isPlural = false;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 0;
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			rangedWeapon.baseDamage.kinetic.damageValue = 1;
			this.rangedWeapon.attack = 0;
			this.rangedWeapon.longName = "dart gun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "defensive augmentations";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//After aug armor is cracked, slightly weak to elec and kinetic. Rez drugs.
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.kinetic.damageValue = -25.0;
			baseHPResistances.drug.damageValue = 50.0;
			
			//Shield is actually "Aug armor". Elec rez, fire weak.
			this.shield = new DecentShield();
			this.shield.shields = 150;
			this.shield.resistances = new TypeCollection();
			this.shield.resistances.burning.damageValue = -50.0;
			this.shield.resistances.electric.damageValue = 25.0;
			//this.shield.resistances.burning.damageValue = 20.0;
			//this.shield.resistances.corrosive.damageValue = 20.0;
			
			this.shield.hasRandomProperties = true;

			this.physiqueRaw = 45;
			this.reflexesRaw = 45;
			this.aimRaw = 30;
			this.intelligenceRaw = 35;
			this.willpowerRaw = 38;
			this.libidoRaw = 45;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			this.level = 11;
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.XPRaw = normalXP();
			this.credits = 100;
			this.HPMod = 40;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "luminous";
			this.tallness = 5*12+rand(12);
			this.thickness = 25;
			this.tone = 59;
			this.hairColor = "pink";//set in random
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "";
			this.furColor = "pink";//Not used.
			this.hairLength = 9; //Chosen before Adj drew a bust. Defer to that.
			this.lipColor = "black";
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.tongueFlags = [GLOBAL.FLAG_LONG];
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.armFlags = [];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_ZAIKA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_ZAIKA;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailFlags = [GLOBAL.FLAG_TAILCOCK,GLOBAL.FLAG_TAILCUNT];
			//this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 2;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
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
			this.buttRatingRaw = 6;
			//No dicks here!
			this.cocks = new Array();
			this.cockVirgin = false;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 50;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 18;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 345;
			this.timesCum = 1234;

			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			//this.impregnationType = "";

			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "lilac";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "MilkThief";
			//this.impregnationType = "LapinaraPregnancy";
			kGAMECLASS.dhaalSSTDChance(this);
			randomise();
			//this.createPerk("Appearance Enabled");
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			//Force like milky & tailgenital. Dislike sweat?
			sexualPreferences.setRandomPrefs(2 + rand(3),2);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS, sexualPreferences.getRandomLikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, sexualPreferences.getRandomDislikeFactor());
			
			//Set da tid.
			this.breastRows[0].breastRatingRaw = RandomInCollection([2,8,33]);
			//smoltid!
			if(breastRows[0].breastRatingRaw == 2)
			{
				this.hairColor = "glowing green";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 5;
				this.ballEfficiency = 18;
				this.long = "This native zaika peers thoughtfully at you from underneath her luminescent, neon green hair, fixing you firmly in the path of her luminous, augmented eyes. For all her fierceness, she didn’t seem to bother with armor. Her clothing amounts to little more than a clear plastic suit with densely-packed elastic netting hanging supportively around her petite bust. Clear seams on her skin indicate cybernetics or other augmentations; you’d better not let her seeming nudity distract you from the fact she’s after your body.";
				this.lustRaw = 5;
			}
			//medtid!
			else if(breastRows[0].breastRatingRaw == 8)
			{
				this.long = "The zaika keeps you fixed in her hungry stare as she battles you, unbothered by the few strands of glowing blue hair that drift past her view. She sports a clear plastic bodysuit for clothing, covering her from neck to feet except for a mesh-filled gap across her well-formed breasts. Like all zaika, she lacks nipples. Cybernetic seams in her vibrant purple skin hint at subdermal armor plating and the possibility of augmented musculature. The heels of her feet are especially thick with them, indicative of heavy modding to enable her rooftop leaps.";
				this.hairColor = "glowing blue";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 18;
				this.ballEfficiency = 70;
				this.lustRaw = 10+rand(5);;
			}
			//swollus growus
			else
			{
				this.long = "The chesty zaika licks her lips as she circles you, brushing back her glowing coral hair with the unconcerned air of a runway model. You might have been able to ignore her bounteous bosom if she wasn’t dressed quite so revealingly. Clear plastic makes up the bulk of her see-through bodysuit save for the web of straining elastic strands supporting her tits. She might as well be naked! When she moves, her breasts wobble enticingly, like the netting is more of a suggestion than true support. You’d think she was some kind of cosplaying trollop if it wasn’t for the high-grade cybernetics that enabled her to make such an impressive jump.";
				this.hairColor = "glowing pink";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 100;
				this.ballEfficiency = 1000;
				this.lustRaw = 33+rand(10);;
			}
			this.credits = 100+rand(2000);
			this.tallness = 5+rand(13); //5-6 variance for normal zaika due to pollution.
			//Randomize HP & Shields slightly!
			this.HPMod = 100+rand(200);

			this.shield.shields = 200+rand(100);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			shieldDisplayName = "AUGS";



			this.long += "\n\nA multipurpose storage tank hangs lightly on the milk thief's back, sloshing heavily in spite of her sprightly movements. The interior is divided into multiple compartments, many of which are empty. Those that aren't seem as likely to house bizarre glowing chemicals as the milk of her previous victims. A clear tube connects the pump at the base of it to her weapon: a gun-shaped device as capable of suckling the milk out of a breast as hosing you down with pure acid.";
			
			/*
			if(rand(4) == 0) this.inventory.push(new LaquineEars());
			else if(rand(4) == 0) this.inventory.push(new Soak());
			else if(rand(4) == 0) this.inventory.push(new Throbb());
			else if(rand(13) == 0) this.inventory.push(new JumperJumpsuitSlutty());
			else if(rand(12) == 0) this.inventory.push(new JumperJumpsuit());
			*/
		}
		override public function get bustDisplay():String
		{
			if(this.hasCock(GLOBAL.TYPE_HUMAN)) return "BORED_JUMPER_TERRAN";
			else if(this.hasCock(GLOBAL.TYPE_CANINE)) return "BORED_JUMPER_CANINE";
			else if(this.hasCock(GLOBAL.TYPE_FELINE)) return "BORED_JUMPER_FELINE";
			else return "BORED_JUMPER_EQUINE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if(this.HP()/this.HPMax() <= 0.6 && !this.hasStatusEffect("Used Second Wind")) bunnySecondWind(alliedCreatures,hostileCreatures,target);
			else if(this.HP()/this.HPMax() <= 0.6 && !this.hasStatusEffect("Item Healed")) bunnyHealsAlot();
			else if(hasStatusEffect("Queue Stealth Field") && this.energy() >= 20) bunnyStealthField(alliedCreatures,hostileCreatures,target);
			else if(rand(3) == 0 && this.energy() >= 25) bunnyGasGrenado(alliedCreatures,hostileCreatures,target);
			else bunnyDarts(target);
			if(target.hasStatusEffect("Cum Soaked") || target.hasStatusEffect("Pussy Drenched")) cumCoveringSuperRes();
		}
		//Attacks go here
		//Shieldbelt with jet boosters, dart gun, gas grenades, and a stealth field. Left her real firepower upstairs and only brought what she’d need to subdue a resisting slave...

		//Gas Grenade: - 14 + level*2 damage. - 25 energy
		//GasGrenadeImpl
		public function bunnyGasGrenado(f:Array, h:Array, target:Creature):void
		{
			this.level = 1;
			CombatAttacks.GasGrenade.execute(f, h, this, target);
			this.level = 9;
		}
		public function bunnyDarts(target:Creature):void
		{
			//Dart Gun vs Shield - heavy shield damage!
			if(target.shields() > 0)
			{
				output("<i>“Let’s get rid of that silly shield, shall we?”</i> The bouncy pirate levels a dartgun at you and fires.");
				if(rangedCombatMiss(this, target)) output(" She misses!");
				else 
				{
					output(" The projectile bursts apart in a flash of shield-draining static!");
					applyDamage(new TypeCollection( { electric: 30+rand(4) } ), this, target, "minimal");
				}
			}
			//Dart gun vs unshielded
			else
			{
				output("Leveling her dartgun at you, the pirate squeezes off a pair of shots.");
				if(rangedCombatMiss(this, target)) output(" The drug-laced payload shatters ineffectually on the wall.");
				else
				{
					var both:Boolean = false;
					if(rand(5) != 0)
					{
						output(" One drug-laced dart strikes true!");
						applyDamage(new TypeCollection( { drug: 10+rand(3) } ), this, target, "minimal");
					}
					else 
					{
						both = true;
						output(" <b>Critical Success!</b> Both drug-laced darts strike true!");
						applyDamage(new TypeCollection( { drug: 20+rand(6) } ), this, target, "minimal");
					}
					//< 30
					if(target.lust() < 30) 
					{
						output("\n\nYou rip the venomous projectile");
						if(both) output("s");
						output(" away in irritation, a little flushed but more or less okay. It’ll take more than that to bring you to your knees!");
					}
					//< 50
					else if(target.lust() < 50)
					{
						output("\n\nYou spend a moment watching the light play across the laquine’s curvaceous form before you remember the dart");
						if(both) output("s");
						output(". Whatever. You’ve got this!");
					}
					//< 70
					else if(target.lust() < 70)
					{
						output("\n\nYou wobble slightly as you pry the emptied projectile");
						if(both) output("s");
						output(" out of your [pc.skinFurScales]. You’re turned on and breathing heavily, but that doesn’t mean you can’t resist the artifically stoked urges. No matter how sexy that bunny-slut may be.");
					}
					//< 90
					else if(target.lust() < 90)
					{
						output("\n\nYou stare in rapt attention at the bunny-slut’s curves, the light playing hypnotically across her sable suit. You fingers twitch with the need to touch her and squeeze her, to caress her worship her, but you pull yourself back before you do something you’ll regret.");
					}
					//< 100
					else if(target.lust() < target.lustMax())
					{
						output("\n\nLicking your [pc.lipsChaste], you discover your hand ");
						if(target.legCount > 1) output("between your [pc.legs]");
						else output("down below");
						output(", gently stroking your crotch. It’s all but glued there, held in place by an all-powerful force. You nearly sink to the ground on the spot. You’re hot and eager, and that magnificently cute bunny-pirate would fuck you so well... No! Not yet. You hold out... for now.");
					}
					//RIP
					else
					{
						output("\n\nStaring at the bunny-slut, you stupidly watch her prance around, light glistening on her suit, sweat dripping from her ears. She is the very picture of sexuality - a prize so arousing that you’d never be able to claim her. As you slump toward the ground, intent on masturbating, you realize that she’s won... and that’s so much hotter than anything your heat-addled mind could concoct.");
					}
				}
			}
		}
		//Stealth Field - used immediately after second wind.
		//StealthFieldGeneratorImpl - 20 energy
		public function bunnyStealthField(f:Array, h:Array, target:Creature):void
		{
			this.removeStatusEffect("Queue Stealth Field");
			CombatAttacks.StealthFieldGenerator.execute(f, h, this, target);
		}
		//Second wind if <60% HP (1x/combat): <i>“Used Second Wind”</i>
		public function bunnySecondWind(f:Array, h:Array, target:Creature):void
		{
			//SecondWindImpl
			CombatAttacks.SecondWind.execute(f, h, this, target);
			this.createStatusEffect("Queue Stealth Field");
		}
		//healing item here:
		public function bunnyHealsAlot():void
		{
			output("<i>“Damnit,”</i> the laquine curses, pulling a medipen from her pouch and jabbing it into her neck. She tosses the spent device away while her wounds knit into unblemished flesh. <i>“Would it kill you to have a little fun?”</i> (+Full HP)");
			this.createStatusEffect("Item Healed");
			this.HP(this.HPMax());
		}
		//Lust reduction
		public function cumCoveringSuperRes():void
		{
			output("\n\nHer excitement dulls when she notices the cum covering you. (-5 lust)");
			//(-5 lust damage)
			this.lust(-5);
		}
		
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			var heatSex:Boolean = false;
			if (flags["BJUMPER_HEAT_SEX"] == 1)
			{
				heatSex = true;
				flags["BJUMPER_HEAT_SEX"] = undefined;
			}
			this.vaginalVirgin = false;
			if (cumFrom is PlayerCharacter)
			{
				sstdChecks(cumFrom,"vagina");
				return kGAMECLASS.tryKnockUpBoredJumper(heatSex);
			}
			return false;
		}
		
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			if (kGAMECLASS.flags["BJUMPER_PREG_TIMER"] != undefined)
			{
				if(this.hasCock(GLOBAL.TYPE_EQUINE)) return (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_EQUINE);
				else if(this.hasCock(GLOBAL.TYPE_FELINE)) return (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_FELINE);
				else if(this.hasCock(GLOBAL.TYPE_CANINE)) return (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_CANINE);
				else return (flags["BJUMPER_PREG_TYPE"] == GLOBAL.TYPE_HUMAN);
			}
			
			return false;
		}
	}
}
