package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	import classes.Items.Miscellaneous.Throbb;
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
	
	public class JumperBored extends Creature
	{
		//constructor
		public function JumperBored()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "bored Jumper";
			this.originalRace = "laquine";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = ""; // Implementation in prepForCombat
			this.customBlock = "";
			this.customDodge = "She easily hops aside, boosted by her belt’s jets.";
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
			
			this.armor.longName = "inky bodysuit";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;

			baseHPResistances.burning.damageValue = 40.0;
			baseHPResistances.freezing.damageValue = 40.0;
			
			this.shield = new JumperShield();
			this.shield.shields = 150;
			this.shield.hasRandomProperties = true;

			this.physiqueRaw = 27;
			this.reflexesRaw = 45;
			this.aimRaw = 40;
			this.intelligenceRaw = 23;
			this.willpowerRaw = 21;
			this.libidoRaw = 75;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 100;
			this.HPMod = +40;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "blue";
			this.tallness = 12*5+6;
			this.thickness = 33;
			this.tone = 49;
			this.hairColor = "brown";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "blue";
			this.furColor = "PLACEHOLDER";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "fair";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_LAPINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_LAPINE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_LAPINE;
			this.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_LAPINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LAPINE;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_FURRED);
			//this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 13;
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
			this.buttRatingRaw = 9;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 130;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 2;
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
			this.timesCum = 5885;

			this.elasticity = 1.25;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Jumper";
			//this.impregnationType = "LapinaraPregnancy";
			kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
			this.createPerk("Appearance Enabled");
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(3 + rand(3),0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, GLOBAL.REALLY_LIKES_SEXPREF);

			tallness = 60 + rand(13);
			

			vaginas[0].loosenessRaw = 1+rand(4);
			vaginas[0].wetnessRaw = 2+rand(4);

			this.createCock();
			//Hoss!
			if(rand(4) == 0)
			{
				this.cocks[0].cLengthRaw = 14;
				this.shiftCock(0,GLOBAL.TYPE_EQUINE);
				this.cocks[0].cockColor = "chocolate";

				this.furColor = "gray";
				this.hairColor = "pink";
				this.eyeColor = "purple";
			}
			else if(rand(3) == 0)
			{
				this.cocks[0].cLengthRaw = 12;
				this.shiftCock(0,GLOBAL.TYPE_CANINE);
				this.cocks[0].cockColor = "red";

				this.furColor = "white";
				this.hairColor = "purple";
				this.eyeColor = "amber";
			}
			else if(rand(2) == 0)
			{
				this.cocks[0].cLengthRaw = 13;
				this.shiftCock(0,GLOBAL.TYPE_FELINE);
				this.cocks[0].cockColor = "pink";

				this.furColor = "tawny";
				this.hairColor = "orange";
				this.eyeColor = "amber";
			}
			else
			{
				this.cocks[0].cLengthRaw = 12;
				this.shiftCock(0,GLOBAL.TYPE_HUMAN);
				this.cocks[0].cockColor = "pink";

				this.furColor = "smoky";
				this.hairColor = "pink";
				this.eyeColor = "purple";
			}
			this.long = "This bored laquine’s pirate affiliation is as plain as the glowing red letters on her glossy black zipsuit: they spell “Jumper” down the side. Beneath the lettering, a powerfully muscled thigh flexes with idle energy. Her wide hips and bubbly butt hint at her prowess as both a leaper and a breeder, but it’s the sizeable ";
			if(this.cocks[0].cType == GLOBAL.TYPE_EQUINE) this.long += "equine";
			else if(this.cocks[0].cType == GLOBAL.TYPE_CANINE) this.long += "canine";
			else if(this.cocks[0].cType == GLOBAL.TYPE_FELINE) this.long += "feline";
			else this.long += "terran-shaped";
			this.long += " bulge in the crotch that proudly declares what she’s here to get. You can drag your eyes up higher to take in her horny smile, but the outline of her turgid dick and luscious, E-cup tits lingers behind.\n\nThe ambient warmth looks to be affecting her more than you, slicking her fur down until it shines just like her latex suit. It must be a sauna under that slick, creaking material. Her ears are droopy from the heat, oozing over her shoulders like half-melted wax, but she shows no sign of minding. This bored Jumper likes the heat!";
			credits = 350+rand(150);
			if(rand(4) == 0) this.inventory.push(new LaquineEars());
			else if(rand(4) == 0) this.inventory.push(new Throbb());
			else if(rand(13) == 0) this.inventory.push(new JumperJumpsuitSlutty());
			else if(rand(12) == 0) this.inventory.push(new JumperJumpsuit());
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
	}
}
