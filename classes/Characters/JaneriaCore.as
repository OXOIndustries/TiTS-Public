package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.Items.Protection.OzoneAegis;
	
	public class JaneriaCore extends Creature
	{
		private static const JS_SHOCK_COST:int = 40;
		//constructor
		public function JaneriaCore()
		{	
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Janeria Core";
			this.originalRace = "janeria";
			this.a = " ";
			this.capitalA = " ";
			this.tallness = 240;
			this.long = "This aquatic monster looms over you, easily twenty feet wide and blazing like a star from all the energy it’s stolen. Several of its massive tentacles are wrapped around the facility’s power generator, while the rest prepare to lash out at you with the lightning it’s stolen. On top of that it seems to be getting smarter and more psionically powerful with each passing moment. This may be the last chance anyone has to stop it before nothing can.";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "lash";
			this.meleeWeapon.attackNoun = "tendrils";
			this.meleeWeapon.attack = 5;			
			this.meleeWeapon.baseDamage.kinetic.damageValue = 50;			
			this.meleeWeapon.longName = "tendrils";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 50;
			this.reflexesRaw = 35;
			this.aimRaw = 35;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 30;
			this.libidoRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 20.0;
			baseHPResistances.burning.resistanceValue = -30.0;
			baseHPResistances.freezing.resistanceValue = -30.0;
			//baseHPResistances.electric.resistanceValue = -100.0; We need the damage to get through so we can add it to shields in OnTakeDamage, so we will have to heal it there
			//this is just to balance out the shield to be same as hp
			baseShieldResistances = new TypeCollection();
			baseShieldResistances.kinetic.resistanceValue = 10.0;
			baseShieldResistances.burning.resistanceValue = 35.0;
			baseShieldResistances.freezing.resistanceValue = -30.0;
			baseShieldResistances.electric.resistanceValue = -20.0;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shield = new OzoneAegis;
			this.shield.shields = 500;
			this.shield.defense = 20;
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "";
			this.thickness = 50;
			this.tone = 1;
			this.hairColor = "";
			this.furColor = "";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GEL;
			this.skinTone = "clear";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FROG;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_TENTACLE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_FROG;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_TENTACLE;
			this.legCount = 10;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_TENTACLE;
			this.tailCount = 0;
			//Used to set cunt or dick type for cunt/dick tails!
			//this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 0;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 0;
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 0;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
					
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			
			this.cocks = [];
			
			isUniqueInFight = true;
			btnTargetText = "Janeria Core";
			
			meldSpawn();
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "JANERIACORE";
		}
		//increase stats and abilities if any spawn are still alive
		private function meldSpawn():void
		{
			var spawnLeft:int = flags["UVETO_DEEPSEALAB_SPAWN"];
			if (spawnLeft > 0)
			{
				this.physiqueRaw += 3 * spawnLeft;
				this.reflexesRaw += 3 * spawnLeft;
				this.aimRaw += 3 * spawnLeft;
				this.intelligenceRaw += spawnLeft;
				this.willpowerRaw += spawnLeft;
				this.shield.shields += 50 * spawnLeft;
				this.shield.defense += 2 * spawnLeft;
				this.shieldsRaw = this.shieldsMax();
				this.HPMod += 25 * spawnLeft;
				this.HPRaw = this.HPMax();
				this.meleeWeapon.attack += 1 * spawnLeft;			
				this.meleeWeapon.baseDamage.kinetic.damageValue += 5 * spawnLeft;
			}			
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Generator Off")) this.long = "The monster before you has been gravely wounded by your timely shutdown of the generator fueling its power. Chunks of its once eerily beautiful body have turned gray and crumbled to dust, unable to hold itself together. Despite this it still crackles with more than enough electrical power and psionic might to take you with it if you don't finish it off quickly.";
			
			// OnTakeDamage output once we're sure we have a potential target
			if (OnTakeDamageOutput != null)
			{
				output(OnTakeDamageOutput + "\n\n");
				OnTakeDamageOutput = null;
			}	
			
			//check if the pc tried to use static burst
			if (target.hasStatusEffect("Static Heal"))
			{
				target.removeStatusEffect("Static Heal");
				this.shields(5);
			}
			
			//tick down turns of density shift
			if (target.hasStatusEffect("Density Shift"))
			{
				target.addStatusValue("Density Shift",1,-1);
				if (target.statusEffectv1("Density Shift") <= 0)
				{
					target.removeStatusEffect("Density Shift");
					target.reflexesMod += 10;
					target.aimMod += 10;
				}
			}
			
			var rn:int = rand(10);
			if (hasStatusEffect("Electric Flood Chargeup")) janeriaCoreElectricFlood(target);
			else if (target.hasStatusEffect("Grappled")) janeriaCoreSustainGrapple(target);
			else if (target.hasStatusEffect("Generator Off"))
			{
				//20% chance of each.  if health low than electro shock will not happen and tentacle slap goes to 40%
				if (rn < 2) janeriaCoreBeginGrapple(target);
				else if (rn < 4) janeriaCoreDensityShift(target);
				else if (rn < 6) janeriaCoreTelepathicOverwhelm(target);
				else if (this.HP() + this.shields() > JS_SHOCK_COST && rn < 8) janeriaCoreElectroshock(target);
				else janeriaCoreTentacleSlap(target);
			}
			else
			{
				//20% chance for grapple, density shft and overwhelm and tentacle slap. 10% for electroshock and electric flood.
				if (rn < 2) janeriaCoreBeginGrapple(target);
				else if (rn < 4)
				{
					
					if (target.hasStatusEffect("Density Shift"))
					{
						rn = rand(3);
						if (rn == 0) janeriaCoreElectroshock(target);
						else if (rn == 1) janeriaCoreElectricFloodCharging(target);
						else janeriaCoreDensityShift(target);
					}
					else janeriaCoreDensityShift(target);
				}
				else if (rn < 6) janeriaCoreTelepathicOverwhelm(target);
				else if (rn < 7) janeriaCoreElectroshock(target);
				else if (rn < 8) janeriaCoreElectricFloodCharging(target);
				else janeriaCoreTentacleSlap(target);				
			}					
		}
		
		private function janeriaCoreTentacleSlap(target:Creature):void
		{
			var slaps:int = 2;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 1) slaps += 1;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 3) slaps += 1;
			
			for (var i:int = 0; i < slaps; i++)
			{
				output("\nOne of the jellyfish’s tendrils elongates as it sweeps out towards you, stretching from four feet long to dozens in a heartbeat.");
				//Miss
				if(combatMiss(this, target)) output("\nYou manage to duck under the tentacle, which swiftly returns to its normal size.");
				//Hit
				else
				{
					output("\nThe slap connects with a sharp whip crack, sending you briefly staggering before you recover your stance.");
					var damage:TypeCollection = new TypeCollection( { kinetic: this.meleeWeapon.baseDamage.kinetic.damageValue });
					damageRand(damage, 15);
					applyDamage(damage, this, target, "melee");
				}
			}
		}
		
		private function janeriaCoreElectroshock(target:Creature):void
		{
			output("The electricity wreathing the monster gathers towards a point at the front of its dome, forming a bright pinprick of light. Suddenly the point flashes as a lightning bolt erupts towards you with a loud thundercrack!");
			
			var hpCost:int = 0;
			var genOff:Boolean = false;
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 5 * flags["UVETO_DEEPSEALAB_SPAWN"];
			
			//only cost shield/hp if generator is off
			if (target.hasStatusEffect("Generator Off")) {
				genOff = true;
				if (this.shields() >= JS_SHOCK_COST) this.shields( -JS_SHOCK_COST);
				else
				{
					hpCost = JS_SHOCK_COST - this.shields();
					this.shields( -JS_SHOCK_COST);
					this.HP(-hpCost);
				}
			}
			//Miss
			if(rangedCombatMiss(this, target)) output(" The lightning leaves a black scorch mark on the wall as you roll out of the way just in time." + (genOff ? " You have the satisfaction of seeing Janeria lose another one of its smaller tentacles from the power loss and with nothing to show for it." : " Janeria seems able to use its lightning with impunity as long as it has the generator to draw on, not even slightly affected by using that much power."));
			//Hit
			else
			{
				output(" You feel the searing heat of the electric blast wrack your body as it connects." + (genOff ? " Without the generator, though, Janeria’s starting to pay for using its power like this, losing further chunks of itself." : " There’s no sign of this being any sort of strain on it, as the generator instantly replaces all it used and more."));
				var damage:TypeCollection = new TypeCollection( { electric: 80 + bon });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
		}
		private function janeriaCoreBeginGrapple(target:Creature):void
		{
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 2 * flags["UVETO_DEEPSEALAB_SPAWN"];
			
			output("Janeria lashes out with its tentacles, the large ones shapeshifting into a mass of smaller filaments that arc out in all directions to leave you with no escape.");

			//Miss
			if(combatMiss(this, target)) output(" You just barely manage to slip through a small gap between the filaments before they close entirely, avoiding being tangled.");
			//Hit
			else
			{
				output(" You find yourself caught in the tendrils. A painful shock wracks your body, accompanied by a draining sensation. It's sucking out your energy! <b>You’ve been grappled!</b>");
				var damage:TypeCollection = new TypeCollection( { electric: 40 + bon });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				target.energy(-5);
				target.createStatusEffect("Grappled", 0, 60, 0, 0, false, "Constrict", "Janeria has entangled you in its tendrils!", true, 0);
			}
		}
		private function janeriaCoreSustainGrapple(target:Creature):void
		{
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 3 * flags["UVETO_DEEPSEALAB_SPAWN"];
			
			output("Janeria continues to drain you of your energy even as it subjects you to further painful shocks.");
			var damage:TypeCollection = new TypeCollection( { electric: 60 + bon });
			damageRand(damage, 15);
			applyDamage(damage, this, target, "minimal");
			target.energy(-5);
		}
		
		private function janeriaCoreDensityShift(target:Creature):void
		{
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 2 * flags["UVETO_DEEPSEALAB_SPAWN"];
			
			output("The water around you ripples as Janeria reaches out with its forming psionic might, thickening the water into an icy slurry.");
			//reflexes save
			var damage:TypeCollection = null;
			
			var rn:int = rand(100);
			//always a chance to fail no matter how good steele's stats are
			if (rn >= 95)
			{
				//crit failure!
				output(" <b>Reflexes Save Critical Failure</b> The ice is insidiously chilling, but more importantly the slurry gets into your armor’s joints, locking them up and making it hard to move. <b>Your reflexes are slowed, and it’s hard to aim!</b>");
				
				damage = new TypeCollection( { freezing: 80 + (bon * 2) });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				
				if (target.hasStatusEffect("Density Shift")) target.addStatusValue("Density Shift",1,4);
				else
				{	

					target.createStatusEffect("Density Shift", 4, 0, 0, 0, false, "Icon_Snowflake", "Icy slurry is making it hard to move. Aim and Reflex decreased!", true, 0);
					target.reflexesMod -= 10;
					target.aimMod -= 10;
				}			
			}
			else if (((target.reflexes() - bon) * 2) - this.reflexesRaw > rn || rn < 5)
			{
				output(" You manage to escape the area just in time, having to shake off a bit of the ice but otherwise none the worse for wear.");
			}
			else
			{
				output(" The ice is insidiously chilling, but more importantly the slurry gets into your armor’s joints, locking them up and making it hard to move. <b>Your reflexes are slowed, and it’s hard to aim!</b>");
				
				damage = new TypeCollection( { freezing: 40 + bon });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				
				if (target.hasStatusEffect("Density Shift")) target.addStatusValue("Density Shift",1,2);
				else
				{
					target.createStatusEffect("Density Shift", 2, 0, 0, 0, false, "Icon_Snowflake", "Icy slurry is making it hard to move. Aim and Reflex decreased!", true, 0);
					target.reflexesMod -= 10;
					target.aimMod -= 10;
				}			
			}			
		}
		
		private function janeriaCoreTelepathicOverwhelm(target:Creature):void
		{
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 2 * flags["UVETO_DEEPSEALAB_SPAWN"];
			
			output("The mental pressure of Janeria’s presence turns thick and overwhelming, attempting to drown your thoughts under its own.");
			//willpower save
			var damage:TypeCollection = null;
			
			var rn:int = rand(100);
			//always a change for failure no matter how good steele's stats are
			if (rn >= 95)
			{
				//crit failure!
				output(" <b>Willpower Save Critical Failure</b> The assault leaves you groaning in agony, managing to push Janeria out only after it leaves you feeling like you haven’t slept in days.");
				damage = new TypeCollection( { kinetic: 80 + (bon * 2) }, DamageFlag.BYPASS_SHIELD);
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				target.energy(-10);			
			}
			else if (((target.willpower() - bon ) * 2) - this.willpowerRaw > rn || rn < 5)
			{
				output(" You fight back, weathering the storm and forcing Janeria out of your mind with a firm mental shove. Its tendrils quake in annoyance at this display of your fortitude.");
			}
			else
			{
				output(" The assault leaves you groaning in agony, managing to push Janeria out only after it leaves you feeling like you haven’t slept in days.");
				damage = new TypeCollection( { kinetic: 40 + bon }, DamageFlag.BYPASS_SHIELD);
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");	
				target.energy(-5);			
			}
		}
		//set up for main attack. steele gets new buttons for options to take cover or turn off generator
		private function janeriaCoreElectricFloodCharging(target:Creature):void
		{
			output("Janeria pauses in its attacks for a moment as the tendrils wrapped around the generator seem to begin sucking harder. Energy builds up within the monster’s core, brighter and brighter until it’s almost blinding. <b>You need to take cover, but this might also be your chance!</b>");
			createStatusEffect("Electric Flood Chargeup",0,0,0,0);
		}
		
		private function janeriaCoreElectricFlood(target:Creature):void
		{
			var bon:int = 0;
			if (flags["UVETO_DEEPSEALAB_SPAWN"] >= 0) bon += 10 * flags["UVETO_DEEPSEALAB_SPAWN"];
			var damage:TypeCollection = null;
			
			removeStatusEffect("Electric Flood Chargeup");
			
			if (target.hasStatusEffect("Generator Off"))
			{
				output("The creature realizes its mistake a moment too late. The light erupts outward as a massive, all-consuming storm of lightning bolts, rippling across the entire room. It sears at your flesh and leaves you spasming with agony.");
				//damage steele
				damage = new TypeCollection( { electric: 120 + bon });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				
				output("\n\nAt least you’re given the satisfaction of seeing that Janeria’s actions have not been without consequence. The brilliance of its body has dimmed, and the sense of constant growth has stopped. Some of its tentacles have turned gray and cracked like old pavement, crumbling to dust as they fall off.");
				//damage janeria
				damage = new TypeCollection( { unresistablehp: 100 }, DamageFlag.BYPASS_SHIELD);
				damageRand(damage, 15);
				applyDamage(damage, target, this, "minimal");
				
				output("\n\nThe psychic pressure roars in fury. <i>You...what have you done?!</i>");
				output("\n\nYou just manage a smirk under your helmet. <b>Time to finish this!</b>");
			}
			else if (target.hasStatusEffect("Electric Flood Cover"))
			{
				target.removeStatusEffect("Electric Flood Cover");
				output("The light erupts outward as a massive, all-consuming storm of lightning bolts, rippling across the entire room. It sears at your flesh and leaves you spasming with agony. You can only imagine what it would be like if you had been out in the open!");
				damage = new TypeCollection( { electric: 22 + (bon/5) });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
			else
			{
				output("The light erupts outward as a massive, all-consuming storm of lightning bolts, rippling across the entire room. It sears at your flesh and leaves you spasming with agony.");
				damage = new TypeCollection( { electric: 120 + bon });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}	
		}
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{		
			var restoreDmg:Number = 0;
			
			if (incomingDamage.electric.damageValue > 0)
			{
				//first lets heal this electic damage since it is immune (also need to restore any damage done to shields)
				if (this.HP() + incomingDamage.electric.damageValue > this.maxHP()) restoreDmg = (this.HP() + incomingDamage.electric.damageValue) - this.maxHP();
				this.HP(incomingDamage.electric.damageValue);
				//now lets add it to shields
				this.shields(incomingDamage.electric.damageValue + restoreDmg);
				OnTakeDamageOutput = "As your attack connects, Janeria simply sucks in the electricity, unharmed and glowing even brighter. There’s no way that kind of attack can hurt it!";
			}
		}
	}
}
