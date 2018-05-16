package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Protection.DecentShield;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	
	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class NyreanPraetorians extends Creature
	{
		
		public function NyreanPraetorians() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "nyrean praetorians";
			this.originalRace = "nyrea";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "A squad of elite nyrean huntresses are circling around you, each carrying a long spear and wearing primitive banded armor over her chain bikini-wear. They’re each wearing a long cape around their shoulders, displaying a blood red sigil that looks like some combination of a woman and a tentacle monster. The guardswomen move with trained rigidity, attacking you from one side, then the other, probing your defenses. They don’t let up - somebody’s always jabbing at you with a spear or trying to grab you, making you defend from every direction at once!";
			
			this.isPlural = true;
			
			this.shield = new DecentShield();
			this.meleeWeapon = new NyreanSpear();
			this.meleeWeapon.hasRandomProperties;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 5.0;
			
			this.physiqueRaw = 21;
			this.reflexesRaw = 21;
			this.aimRaw = 21;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 19;
			this.libidoRaw = 50;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			baseHPResistances.electric.damageValue = 10.0;
			baseHPResistances.burning.damageValue = 10.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.tease.damageValue = 50.0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 225;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
			
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
			this.buttRatingRaw = 10;
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
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 13;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			
			this.createPerk("Sneak Attack",0,0,0,0);
			createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Nyrea";
			
			tallness = 68 + (rand(12) - 6);
			rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);

			kGAMECLASS.myrellionSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "PRAETORIAN";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(!hasStatusEffect("Evasion Boost") && energy() >= 20 && (rand(4) == 0 || HP() < 100)) spearWallGoooo();
			else if(energy() >= 5 && rand(6) == 0) nyreanSpearButt(target);
			else if(energy() >= 5 && rand(4) == 0) poisonBlade(target);
			else if(energy() >= 10 && rand(3) == 0) nyreaGroupBackstabby(target);
			else spearFlurryNyreaShit(target);
		}
		
		private function spearFlurryNyreaShit(target:Creature):void
		{
			output("Several of the huntresses leap forward from one side, jabbing their spears at your chest.");
			
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
			// You manage to dodge, block, and parry every attack they send your way! // You block and dodge most of the attacks, but a few still manage to get through, hammering you down. // You try to defend yourself, but most if not all of the strikes get through, battering you brutally.
		}
		
		private function nyreaGroupBackstabby(target:Creature):void
		{
			output("Several of the huntresses attack you from the front, jabbing and stabbing and pushing you back. As they do, though, you ");
			if(combatMiss(this, target))
			{
				output("just barely notice another nyrea attempting to stab you in the back. You quickly spin around and shove her back, preventing the attack.");
			}
			else
			{
				output("fail to notice one of their sisters behind you grabbing a dagger and leaping to attack you, sinking the dagger into ");
				if(target.shields() <= 0) output("you");
				else output("your shields");
				output(".");
				//Hacky way to force backstab proc!
				target.createStatusEffect("Blinded");
				applyDamage(meleeDamage(), this, target, "melee");
				target.removeStatusEffect("Blinded");
			}
			energy(-10);
		}
		
		private function poisonBlade(target:Creature):void
		{
			output("One of the nyrea takes a pouch of some pulsating pink fungus from her belt and smears it all over the tip of her long spear. Once she’s done, the huntress leaps forward and lunges at you with her spear. ");
			if(combatMiss(this, target))
			{
				output("You manage to grab her spear before it can hit you, and you quickly snap the head off, tossing the poison aside.");
			}
			else
			{
				output("You try and dodge, but her sisters give you no room to maneuver; you end up getting sliced by it! Hissing with pain, you recoil and grab your bloodied [pc.skinNoun]... and quickly begin to feel the poison boiling through you, making your body burn with unbidden arousal.");
				applyDamage(new TypeCollection( { drug: 15, kinetic: meleeDamage() } ), this, target, "minimal");
				//4 rounds of lust damage!
				if(!target.hasStatusEffect("Aphro")) target.createStatusEffect("Aphro",5,4,0,0,false,"Icon_DrugVial","An aphrodisiac is in your blood, exciting you over time! It should fade quickly... unless you get redosed.",true,0);
				else 
				{
					output(" <b>The chemical in your blood is getting stronger!</b>");
					target.addStatusValue("Aphro",1,3);
					target.setStatusValue("Aphro",2,4);
				}
			}
			energy(-5);
		}
		
		private function nyreanSpearButt(target:Creature):void
		{
			output("One of the nyrea spins her spear around before swinging the blunt end at you like a club.");
			if(combatMiss(this, target)) output("\nYou dodge out of the way, narrowly avoiding a crushing blow.");
			else 
			{
				var bStun:Boolean = false;
				output("\nYou don’t manage to dodge in time, and get a thunderous wallop on the head for your trouble! You stagger back, clutching your aching head.");
				if(physique()/2 + rand(20) + 1 > target.physique()/2 + 10 && !target.hasStatusEffect("Stunned"))
				{
					output(" <b>You are stunned!</b>");
					bStun = true;
				}
				applyDamage(meleeDamage(), this, target, "melee");
				if(bStun) CombatAttacks.applyStun(target, 2);
			}
			energy(-5);
		}
		
		private function spearWallGoooo():void
		{
			output("The huntresses form a tighter ring, shoulder to shoulder, and brace their spears against you. It’s almost impossible to move now, and <b>hitting the huntresses is going to be damn hard.</b>");
			//+50% dodge vs ERRYTHING.
			createStatusEffect("Evasion Boost",50,0,0,0,false,"Icon_DefUp","The nyrea have created a wall of spears, granting them a 50% evade chance!",true,4);
			energy(-20);
		}
		
	}

}