package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.StorageClass;
	import classes.TITSSaveEdit.UI.Controls.VaginaSettings;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class DemonSyri extends Creature
	{
		//constructor
		public function DemonSyri()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "Demon Queen Syri";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "She’s a towering mound of muscular ausar meat: more than eight feet tall, olive-skin glistening with sweat and fuck-juices, black fur on her arms and legs bristling. Her thick tail slaps heavily on the stone floor with every step, swaying with overt enjoyment of your battle. Her eyes are a fiery, almost glowing orange, burning with rage and lust. The horns that grow from her head stick out to the sides like a prize bull’s, adorned with chains and rings. Syri’s fangs are long and sharp, catching the waning light from outside as she circles you, and her claws ball into brawler’s fists in preparation for her attacks.";
			this.customDodge = "The demon queen slides past your attack with graceful agility.";
			this.customBlock = "The demon queen meets your attack with one of her own, glancing it away.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			meleeWeapon.baseDamage.kinetic.damageValue = 10;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.attack = 8;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.baseHPResistances.tease.resistanceValue = -25.0;
			this.baseHPResistances.burning.resistanceValue = 33.3;
			this.baseHPResistances.freezing.resistanceValue = 33.3;
			this.baseHPResistances.electric.resistanceValue = 33.3;
			this.baseHPResistances.kinetic.resistanceValue = 25.0;
			
			this.armor.longName = "tough hide";
			this.armor.defense = 14;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 45;
			this.reflexesRaw = 30;
			this.aimRaw = 15;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 30;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 300;
			this.HPRaw = this.HPMax();
			
			// From Syri but minor tweaks
			this.femininity = 75;
			this.eyeType = 0;
			this.eyeColor = "fiery orange";
			this.tallness = 101;
			this.thickness = 45;
			this.tone = 75;
			this.hairColor = "black";
			this.scaleColor = "ebony";
			this.furColor = "black";
			this.hairLength = 10;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "olive";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_THICK];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_CANINE;
			this.earFlags = [GLOBAL.FLAG_FURRED];
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornLength = 9;
			this.hornType = GLOBAL.TYPE_BOVINE;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_THICK];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_THICK];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_THICK];
			this.hipRatingRaw = 12;
			this.buttRatingRaw = 11;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			
			/*
			var c:CockClass = new CockClass();
			c.cLengthRaw = 12;
			c.cType = GLOBAL.TYPE_CANINE;
			c.cockColor = "red";
			c.cThicknessRatioRaw = 1.5;
			c.knotMultiplier = 1.5;
			c.addFlag(GLOBAL.FLAG_TAPERED);
			c.addFlag(GLOBAL.FLAG_KNOTTED);
			cocks = [c];
			*/
			
			var v:VaginaClass = new VaginaClass();
			vaginas = [v];
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled");
			this.createStatusEffect("Inhuman Desire", 60);
			
			isUniqueInFight = true;
			btnTargetText = "TentacleGrdn";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "DEMONSYRI";
		}
		
		private var HasBellRingerQueued:Boolean = false;
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (HasBellRingerQueued)
			{
				bellRinger(target);
				return;
			}
			
			if (target.hasStatusEffect("Stunned"))
			{
				furyFlurry(target);
				return;
			}
			
			if (target.hasStatusEffect("Tripped"))
			{
				demonElbow(target);
				return;
			}
			
			var attacks:Array = [];
			
			attacks.push({ v: slam, w: 10 });
			if (target.hasArmor() && !target.hasStatusEffect("Sundered") && (HP() <= HPMax() || lust() > 0)) attacks.push({ v: rendingClaws, w: 25 });
			attacks.push({ v: getTheHorns, w: 5});
			
			weightedRand(attacks)(target);
			
		}
		
		private function slam(target:Creature):void
		{
			output("Syri lunges forward, charging like a raging bull and swinging her fists like sledgehammers!");
			if (combatMiss(this, target))
			{
				output(" You dodge to the side, letting her momentum carry her right past you.");
			}
			else
			{
				output(" You brace for impact just a moment too late, and feel her fist slam into your chest with all the force her brawny body can muster!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 20 } ), 10), this, target);
			}
		}
		
		private function rendingClaws(target:Creature):void
		{
			//Heavy Kinetic damage; leaves PC's armor Sundered. PC must be wearing armor, naturally.

			output("The demon queen roars with libidinous rage, hurling herself at you with claws outstretched.");
			
			if (combatMiss(this, target, -1, 3))
			{
				output(" You dodge and parry, forcing her back before her claws can tear into you!");
			}
			else
			{
				output(" Syri comes at you hard, slamming you into the legs of one of the statues behind you and slicing into your [pc.armor] with her razor-like claws and fangs. When she’s finished, <b>your armor is sundered!</b>");
				
				CombatAttacks.applySunder(target, 4, true);
				applyDamage(damageRand(new TypeCollection( { kinetic: 35 } ), 15), this, target);
			}
		}
		
		private function getTheHorns(target:Creature):void
		{
			//Heavy Penetrating damage. Must pass a Physique check or be knocked prone.

			output("Syri bellows, stamping her feet before throwing herself headlong at you!");
			if (combatMiss(this, target, -3, 2))
			{
				output(" You catch her by the steer-horns, throwing her charge aside.");
			}
			else
			{
				output(" You try to catch the bull by the horns, but she powers right through you, slamming you back with a shock of pain.");
				
				if ((target.physique + rand(30) + 1 < 35) && !target.isPlanted())
				{
					output(" The sheer force of impact barrels you backwards, throwing you on your ass. <b>You’re prone!</b>");
					applyDamage(damageRand(new TypeCollection( {kinetic: 35 }, DamageFlag.PENETRATING), 15), this, target);
					CombatAttacks.applyTrip(target);
				}
			}
		}
		
		private function demonElbow(target:Creature):void
		{
			//If PC is knocked down. Massive Crushing damage and lowers Physique for the rest of the fight.

			output("Before you’re able to get back up, Queen Syri snarls and lumps into the air, twisting so that her elbow is pointed right down at you. You have just enough time to lament your fate before a couple hundred pounds of asuar muscle slam down on you like the fist of an angry god. Pain explodes through your midriff, and it takes everything you have not to retch as all the air is knocked out of you.");
			
			applyDamage(damageRand(new TypeCollection({ kinetic: 50 }, DamageFlag.CRUSHING), 10), this, target);
			
			if (!target.hasStatusEffect("Crunched"))
			{
				target.createStatusEffect("Crunched", 1, 0, 0, 0, false, "DefenseDown", "The full, crushing weight of DemonSyri has left you reeling!", true, 0);
			}
			else
			{
				target.addStatusValue("Crunched", 1, 1);
			}
		}
		
		private function bellRinger(target:Creature):void
		{
			//Used once per 25% health Syri loses. Heavy Kinetic damage; inflicts Stun on a failed Physique test.

			output("Syri adjusts her stance into one of a boxer, primed for a prize fight. You have just enough time to brace yourself before she comes at you, swinging hard for your head.");
			
			if (combatMiss(this, target))
			{
				output(" You put up your dukes and block her incoming blows, managing to put enough distance between the two of you to keep fighting without turning into an outright grapple.");
			}
			else
			{
				output(" You try and block it just a second too late. Syri’s fist slams into your [pc.face], sending you reeling back with the impact!");
				applyDamage(damageRand(new TypeCollection({ kinetic: 50 }, DamageFlag.CRUSHING), 10), this, target);
				
				if ((target.physique + rand(25) + 1 < 35))
				{
					output(" <b>You’re stunned by the blow!</b>");
					CombatAttacks.applyStun(target, 2, true);
				}
			}
		}
		
		private function furyFlurry(target:Creature):void
		{
			output("Syri throws herself at you without preamble, bellowing like a beast and swinging wildly. You fall back under the wild assault,");
			
			var totalDamage:TypeCollection = new TypeCollection();
			var numHits:int = 0;
			
			for (var i:int = 0; i < 6; i++)
			{
				if (!combatMiss(this, target, -1, i))
				{
					totalDamage.kinetic.damageValue += 10;
					numHits++;
				}
			}
			
			if (numHits == 0)
			{
				output(" ducking and weaving until she’s out of steam.");
			}
			else if (numHits == 5)
			{
				output(" taking blow after blow!");
			}
			else
			{
				output(" sliding out of the way of her first few swings, but her relentless assault finally catches you!");
			}
			
			applyDamage(damageRand(totalDamage, 15), this, target);
		}
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{
			var sHealthPc:Number = HPQ();
			var gates:Array = [75, 50, 25];
			
			super.OnTakeDamage(incomingDamage);
			
			for (var i:int = 0; i < gates.length; i++)
			{
				if (sHealthPc >= gates[i] && HPQ() < gates[i])
				{
					HasBellRingerQueued = true;
					return;
				}
			}
		}
	}
}