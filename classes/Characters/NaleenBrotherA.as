package classes.Characters
{
	import classes.Creature;
	import classes.Characters.Azra;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Utility.*
	
	public class NaleenBrotherA extends Creature
	{
		//constructor
		public function NaleenBrotherA()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "grinning naleen";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A naleen circles on the right. His build is typical of the kitty-snakes of Mhen’ga: snake from the waist down and furry, humanoid feline from the waist up. Sharp-clawed fingers wiggle eagerly at the sight of you, darting to a bandoleer of amber-colored bottles that ring his torso as if he cannot wait to unleash whatever is contained within. His ears are alert and playful. His dicks are too, jutting free from a reptilian slit to stab accusingly in your direction.";
			this.customDodge = "The naleen slides out of the way of your attack, serpentine body coiling upon itself with serpentine speed.";
			this.customBlock = "The naleen deflects your strikes with quick strikes of his own, effectively parrying your attack.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 90.0;
			baseHPResistances.drug.damageValue = 75.0;
			baseHPResistances.pheromone.damageValue = 75.0;
			baseHPResistances.psionic.damageValue = 75.0;
			
			this.physiqueRaw = 9;
			this.reflexesRaw = 11;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 1;
			this.libidoRaw = 60;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 10;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 73;
			this.thickness = 42;
			this.tone = 75;
			this.hairColor = "red";
			this.scaleColor = "green";
			this.furColor = "black";
			this.hairLength = 33;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NAGA;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_TENDRIL, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SNAKE;
			this.tailCount = 0;
			this.tailFlags = new Array();
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
			this.hipRatingRaw = 6;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 6;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 998;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.createCock();
			this.cocks[0].cLengthRaw = 8;
			this.cocks[1].cLengthRaw = 8;
			this.cocks[0].cockColor = "purple";
			this.cocks[0].cType = GLOBAL.TYPE_SNAKE;
			this.cocks[1].cockColor = "purple";
			this.cocks[1].cType = GLOBAL.TYPE_SNAKE;
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			this.createStatusEffect("Disarm Immune");
			this.createPerk("Inhuman Desire",50,0,0,0);
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//No loot on this fuckboy.
			//this.inventory.push(new NaleenNip());
			
			isUniqueInFight = true;
			btnTargetText = "NaleenBroA";
			setDefaultSexualPreferences();
			this._isLoading = false;
			//kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "NALEEN_BROTHER_A";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Naleen Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			//DISLIKES
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.hasStatusEffect("charging musk")) 
			{
				target = selectAzraTarget(hostileCreatures);
				chargeOver(target);
			}
			else if(target.hasStatusEffect("Naleen Coiled"))
			{
				biteAttackDudeleen(target);
			}
			else if(CombatManager.getRoundCount() % 5 == 0 && target is PlayerCharacter) naleenDudeConstrict(target);
			else if(!this.hasStatusEffect("charging musk") && rand(5) == 0)
			{
				//If Azra is up, target her... somehow.
				target = selectAzraTarget(hostileCreatures);
				chargeMuskAttack(target);
			}
			else zilmuskPowersActivate(target);
		}
		private function notifyTargetSelection(attacker:Creature, target:Creature, enemy:Creature):void
		{
			kGAMECLASS.setAttacker(attacker);
			kGAMECLASS.setTarget(target);
			kGAMECLASS.setEnemy(enemy);
		}
		private function selectAzraTarget(otherTeam:Array):Creature
		{
			var selTarget:Creature = null;
			
			var posTargets:Array = [];
			
			for (var i:int = 0; i < otherTeam.length; i++)
			{
				// If it hasn't been defeated already this turn
				if (otherTeam[i].HP() > 0 && otherTeam[i].lust() < otherTeam[i].lustMax())
				{
					var posTarget:Object = { v: otherTeam[i], w: 10 };
					posTargets.push(posTarget);
					
					// Force Azra to be the target
					if (otherTeam[i].short == "Azra")
					{
						selTarget = otherTeam[i];
						notifyTargetSelection(this, selTarget, this);
						return selTarget;
					}
					
					// Smugglers are slightly less likely to be targeted
					if (otherTeam[i].characterClass == GLOBAL.CLASS_SMUGGLER)
					{
						posTarget.w -= 1;
					}
					// Mercs slightly more
					else if (otherTeam[i].characterClass == GLOBAL.CLASS_MERCENARY)
					{
						posTarget.w += 1;
					}
					
				}
			}
			
			if (posTargets.length == 0) selTarget = null;
			else if (posTargets.length == 1) selTarget = posTargets[0].v;
			else selTarget = weightedRand(posTargets);
			
			notifyTargetSelection(this, selTarget, this);
			
			return selTarget;
		}
		//Naleen A Attacks
		//Zilmusk - used 2x as often as other moves.
		public function zilmuskPowersActivate(target:Creature):void
		{
			output("Pulling a bottle from his bandolier, the smiling naleen brother throws it at " + target.getCombatName() + "! It shatters to release a cloud of");
			if(target is Azra) output(" amber-tinted honey scent, by the faint whiff you catch. Azra seems rather enamored by it, her nostrils flaring excitedly.");
			else output("... sweet... sweet... whatever it is, it smells like honey and sex mixed together in a pot. Your blood burns from the delightful scent.");
			applyDamage(new TypeCollection( { tease: 10 + rand(6) } ), this, target, "minimal");
		}
		//constrict and bite
		//Take existing texts and playful them up a bit.
		//ONLY IF pc IS TARGET
		private function naleenDudeConstrict(target:Creature):void
		{
			if(!target.hasStatusEffect("Naleen Coiled"))
			{
				if(target is PlayerCharacter) output("The grinning naleen lunges at you, but you nimbly dodge the attack. However, before you can blink, you feel his leathery scales coursing across your body as he circles around you, squeezing tight! Your breath is knocked away, and in a moment you’re seeing stars!");
				else output("The grinning naleen lunges at Azra, catching her in his leathery grip and squeezing her tight!");
				
				target.createStatusEffect("Naleen Coiled",0,0,0,0,false,"Constrict",(target is PlayerCharacter ? "You’re trapped in the naleen’s coils!" : "Trapped in the naleen’s coils!"),true,0);(target is PlayerCharacter ? "" : "")
			}
			
			var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: 5 + rand(5) } ), 15);
			var damageResult:DamageResult = calculateDamage(damage, this, target, "dudeconstrict");
			
			if (damageResult.shieldDamage > 0)
			{
				if (damageResult.hpDamage == 0) output(" " + (target is PlayerCharacter ? "Your" : "Azra’s") + " shield crackles but holds. ");
				else output(" There is a concussive boom and tingling aftershock of energy as " + (target is PlayerCharacter ? "your" : "Azra’s") + " shield is breached. ");
			}
			
			if (damageResult.hpDamage > 0)
			{
				if (damageResult.shieldDamage == 0) output(" " + (target is PlayerCharacter ? "Your breath is taken away by a brutal squeezes, and in a moment you’re seeing stars!" : "Azra tries to catch her breath as the naleen brutally squeezes her!") + " ");
			}
			outputDamage(damageResult);
		}
		//ONLY CONSTRICTED TARGETS
		private function biteAttackDudeleen(target:Creature):void
		{
			author("Savin");
			if(target is PlayerCharacter)
			{
				output("The coils tighten ever so slightly, further immobilizing you. With a knowing grin, the naleen exposes his fangs and ");
				if(!target.isChestGarbed()) output("bites the exposed skin near your shoulder");
				else output("bites, punching through a thin spot in your [pc.upperGarment]");
				output(". You yell as you feel his venom pumping into your bloodstream. Ceasing your struggle momentarily, your thoughts become hazy and your movements sluggish; suddenly the idea of surrendering to this powerful male’s coils doesn’t sound like such a bad idea....");
			}
			else
			{
				output("The coils tighten ever so slightly, further immobilizing Azra. With a knowing grin, the naleen exposes his fangs and bites, punching through a thin spot in her armor. She yells as his venom pumps into her bloodstream. Her thoughts become hazy and movements sluggish - this is not good....");
			}
			//Effect: Moderate Speed/Dex/Whatever drain. If reduced to 0, auto lose (as if by lust).
			if(!target.hasStatusEffect("Naleen Venom")) target.createStatusEffect("Naleen Venom",0,0,0,0,false,"Poison","This venom reduces strength, aim, reflexes, and willpower! " + (target is PlayerCharacter ? "If you take in too much of it while fighting a naleen, you’ll lose" : "Taking too much of it while fighting may be crippling") + "!",false,10,0xFF0000);
			target.physiqueMod -= .5;
			target.aimMod -= .5;
			target.willpowerMod -= .5;
			target.reflexesMod -= .5;
			target.addStatusValue("Naleen Venom",1,.5);
			target.changeLust(10+rand(10));
			if(target.lust() >= target.lustMax() || ((target.physique() == 0 || target.willpower() == 0) && target.hasStatusEffect("Naleen Venom")))
			{
				if(target is PlayerCharacter) output("\n\n<b>You’re too doped up to care anymore. You give in.</b>");
				else output("\n\n<b>Azra is to intoxicated to fight back.</b>");
			}
		}
		//Charge musk
		public function chargeMuskAttack(target:Creature):void
		{
			output("The naleen meticulously plucks one vial at a time from his bandoleer, collecting them between his clawed fingers. One, two, three... four... He’s really loading up! You’d better do something to interrupt him, or someone is in for a world of hurt!");
			this.createStatusEffect("charging musk");
		}
		//Charge interrupted by stun, blind, staggered, or trip
		public function chargeOver(target:Creature):void
		{
			if(this.hasStatusEffect("Stunned") || this.hasStatusEffect("Stun") || this.hasStatusEffect("Blinded") || this.hasStatusEffect("Blind") || this.hasStatusEffect("Staggered") || this.hasStatusEffect("Trip") || this.hasStatusEffect("Tripped"))
			{
				output("The naleen drops seven or eight of his bottles at once. They shatter in a shower of tinkling shards and sweet-smelling musk. Bathed in the sugary pheromones, the naleen shudders once, then collapses into his coiling tail, hands and scales sliding sensuously across his form. He won’t be fighting anyone for a while.");
				var dr2:DamageResult = applyDamage(new TypeCollection( { tease: 100 } ), this, this, "suppress");
				outputDamage(dr2);
			}
			//Charge goes off! Hits Azra first, PC second time.
			else
			{
				//Azra
				if(target is Azra)
				{
					output("The naleen hucks seven or eight vials at Azra at once. There’s nothing she can do! They burst all around her in a cloud of libido-hijacking pheromones. She gasps once, drinking deeply of the tainted air, mouths, <i>“Oh my...”</i> and sinks to her knees, lost in raw, unfiltered sexual desire.\n\n<b>Azra is down!</b>");
					var dr3:DamageResult = applyDamage(new TypeCollection( { tease: 1000 } ), this, target, "suppress");
					outputDamage(dr3);
				}
				//PC - 100 damage!
				else
				{
					output("The naleen hucks seven or eight vials at you at once. There’s too many to dodge! They burst all around you in a cloud of libido-hijacking pheromones.");
					if(target.hasAirtightSuit()) output(" Fortunately, your airtight equipment saves you from its inebriating effects. Haha!");
					else 
					{
						output(" You gasp in alarm, inadvertently drinking deeply of the tainted air. It’s overwhelming. Tremendous lust surges through you");
						var dr4:DamageResult = applyDamage(new TypeCollection( { tease: 100 } ), this, target, "suppress");
						if(target.lust() < target.lustMax()) output(", though you somehow shake it off before you find yourself kneeling before these chimeric aggressors.");
						else output(", reaching into your crotch and stirring the pot of your lust until it threatens to boil over. You drop to your knees in desperation, resistance forgotten. All you can think about is getting off.");
						outputDamage(dr4);
					}
				}
			}
			this.removeStatusEffect("charging musk");
		}
	}
}
