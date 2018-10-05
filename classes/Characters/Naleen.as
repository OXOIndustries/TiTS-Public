package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Utility.possessive;
	
	public class Naleen extends Creature
	{
		public function Naleen()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "naleen";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A towering, serpentine predator from the waist down, the naleen is supporting a beautiful and quite busty humanoid torso that bares a more than passing resemblance to a feline, with brilliant orange and black tiger stripes and perky feline ears. Her long, fiery hair is braided down her back, ending in a green  leaf-woven bow just above her wide hips and full ass. Despite a body that screams raw sexuality, the naleen’s claws are razor sharp and pointed at you as she slithers around the battleground, ready to pounce with feline grace and reptilian power.";
			this.customDodge = "The naleen slides out of the way of your attack, serpentine body stretching and contorting in ways far beyond human ability.";
			this.customBlock = "The naleen girl catches your attack on her sharp claws, parrying the strike with feline grace.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 1;
			this.meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 6;
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
			this.HPMod = 15;
			this.HPRaw = this.HPMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 73;
			this.thickness = 42;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "green";
			this.furColor = "orange";
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
			this.lipMod = 2;
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
			this.hipRatingRaw = 16;
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
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 998;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 1000;
			this.vaginas[0].type = GLOBAL.TYPE_NAGA;
			this.vaginas[0].vaginaColor = "pink";
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 15;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			this.createPerk("Multiple Attacks",1,0,0,0,"");
			this.createStatusEffect("Disarm Immune");
			this.createPerk("Appearance Enabled");

			this.inventory.push(new NaleenNip());
			
			isUniqueInFight = true;
			btnTargetText = "Naleen";
			setDefaultSexualPreferences();
			this._isLoading = false;
			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "NALEEN";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.skinFlags.length == 0)
			{
				dataObject.skinFlags.push(GLOBAL.FLAG_FLUFFY);
			}
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Naleen Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			//Naleen Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(CombatManager.getRoundCount() % 5 == 0) naleenConstrict(target);
			else if(CombatManager.getRoundCount() % 6 == 0 && target.shieldsRaw <= 0) biteAttack(target);
			else if (target.hasStatusEffect("Naleen Coiled")) 
			{
				if(rand(5) == 0 || target.shieldsRaw > 0) naleenConstrict(target);
				else biteAttack(target);
			}
			else naleenDoubleAttack(target);
		}
		
		private function biteAttack(target:Creature):void
		{
			author("Savin");
			output("The naleen girl lunges at you with a predatory grin, jaw opening wide as she closes. You can almost see the glint of venom on her fangs!");
			
			// standard dodge/miss messages
			if (combatMiss(this, target)) 
			{
				output(" You manage to avoid " + a + possessive(short) + " bite!");
			}
			else 
			{
				output(" The naleen sinks her teeth into you, twin fangs piercing your tender [pc.skin]. You grunt in pain, but that’s replaced a moment later by an overwhelming feeling of calm, of peace, of slow dreariness. You just want to curl up in a ball and take a nap. Maybe with a beautiful kitty-snake to ");
				if(target.hasCock()) output("stroke you off");
				else if(target.hasVagina()) output("eat you out");
				else output("fuck your ass with her big tail");
				output(" until you’re fast asleep.");
				//Effect: Moderate Speed/Dex/Whatever drain. If reduced to 0, auto lose (as if by lust).
				if(!target.hasStatusEffect("Naleen Venom")) target.createStatusEffect("Naleen Venom",0,0,0,0,false,"Poison","This venom reduces strength, aim, reflexes, and willpower! If you take in too much of it while fighting a naleen, you’ll lose!",false,10,0xFF0000);
				target.physiqueMod -= .5;
				target.aimMod -= .5;
				target.willpowerMod -= .5;
				target.reflexesMod -= .5;
				target.addStatusValue("Naleen Venom", 1, .5);
				applyDamage(new TypeCollection( { drug: 10 + rand(10) } ), this, target, "minimal");
				if(target.lust() >= target.lustMax() || ((target.physique() == 0 || target.willpower() == 0) && target.hasStatusEffect("Naleen Venom"))) output("\n\n<b>You’re too doped up to care anymore. You give in.</b>");
			}
		}
		
		private function naleenConstrict(target:Creature):void
		{
			author("Savin");
			if(!target.hasStatusEffect("Naleen Coiled"))
			{
				output("The naleen lunges at you, but you nimbly dodge the attack. However, before you can blink, you feel leather and fur coursing across your body as the serpentine feline coils around you, squeezing tight!");
				
				target.createStatusEffect("Naleen Coiled",0,0,0,0,false,"Constrict","You’re trapped in the naleen’s coils!",true,0);
			}
			else
			{
				output("The naleen’s constricting embrace tightens slightly, coil after coil slithering around your compressing flesh.");
			}
			
			var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: 5 + rand(5) } ), 15);
			var damageResult:DamageResult = calculateDamage(damage, this, target, "constrict");
			
			if (damageResult.shieldDamage > 0)
			{
				if (damageResult.hpDamage == 0) output(" Your shield crackles but holds. ");
				else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. ");
			}
			
			if (damageResult.hpDamage > 0)
			{
				if (damageResult.shieldDamage == 0) output(" Your breath is taken away by a brutal squeezes, and in a moment you’re seeing stars!");
			}
			
			outputDamage(damageResult);
		}
		
		private function naleenDoubleAttack(target:Creature):void
		{
			author("Savin");
			output("The naleen surges forward, lunging at you and swinging her razor-sharp claws right at your throat!\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			output("\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
		}
	}
}
