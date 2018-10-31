package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Melee.SurvivalAxe;
	import classes.Items.Guns.MyrRifle;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;

	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrGoldRemnant extends Creature
	{
		private var specialCD:int = 0;
					
		public function MyrGoldRemnant() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Gold Remnant";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "";

			this.isPlural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			rangedWeapon = new MyrRifle();

			armor.longName = "thick chitin";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 25;
			this.aimRaw = 20;
			this.intelligenceRaw = 18;
			this.willpowerRaw = 19;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.drug.damageValue = -25.0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 60;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			this.buttRatingRaw = 6;
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			isUniqueInFight = false;
			btnTargetText = "Gold Remnt";
			
			createPerk("Can Crit",0,0,0,0);
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			var foo:int = rand(20);
			if(foo < 3)
			{
				switch(foo){
					case 0:	inventory.push(new Picardine()); break;
					case 1:	inventory.push(new Kirkite()); break;
					case 2:	inventory.push(new Satyrite()); break;
				}
			}
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOLD_REMNANT_FIGHTER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature;
			//If in final fedQuest fight, only target PC if all others are dead
			if(kGAMECLASS.flags["FEDERATION_QUEST"] == 2)
			{
				var myrAlive:Boolean = false;
				for(var i:int = 0; i < hostileCreatures.length; i++)
					if(!(hostileCreatures[i] is PlayerCharacter) && hostileCreatures[i].HP() > 0)
						myrAlive = true;
				//If valid non-PC targets, select from them
				if(myrAlive)
					target = selectTarget(hostileCreatures.slice(1));
				else
					target = selectTarget(hostileCreatures.slice(0,1));
			}
			else target = selectTarget(hostileCreatures);
			if (target == null) return;
			
			
			
			if(hasStatusEffect("Riposting")) removeStatusEffect("Riposting");
			if(specialCD > 0) specialCD-=1;
			
			var attacks:Array = new Array();
			if(rangedWeapon is MyrRifle)
			{
				if(specialCD <= 0) attacks.push(myrRemnantGrenade);
				attacks.push(myrRemnantSnipe);
			}
			else attacks.push(myrRemnantTrunch);
			if(rand(3) == 0) attacks.push(myrRemnantReload);
			attacks.push(myrRemnantShoot);
			
			var attack:* = attacks[rand(attacks.length)];
			
			if(attack == myrRemnantGrenade) attack(hostileCreatures);
			else attack(target);
			
		}
		
		private function myrRemnantShoot(target:Creature):void
		{
			var damage:TypeCollection;
			var leftOverDamage:Number;
			
			if(rangedWeapon is MyrRifle)
			{
				output(StringUtil.capitalize(this.getCombatName(), false) + " takes aim with her bolt rifle, popping off a shot at " + target.getCombatName() + ". The bullet ");
			
				if (rangedCombatMiss(this, target)) 
				{
					output("ricochets off the concrete behind you.");
					kGAMECLASS.fedQuestCoverDamage(15);
				}
				else
				{
					output("strikes true!");
					
					damage = rangedDamage();
					
					//Leftover damage is what doesn't get eaten by cover.
					leftOverDamage = damage.getTotal() - (Math.round(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100))/3;
					
					//Cover soaks up it's % in damage.
					kGAMECLASS.fedQuestCoverDamage(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100);
					
					//Figure out how much is left
					damage = new TypeCollection( { kinetic: leftOverDamage } );
					applyDamage(damage, this, target, "minimal");
				}
			}
			else
			{
				output(StringUtil.capitalize(this.getCombatName(), false) + " thrusts out her big-bore revolver and snaps off a pair of quick shots at " + target.getCombatName() + ". ");
			
				if (rangedCombatMiss(this, target)) 
				{
					if (rangedCombatMiss(this, target))
					{
						output("She manages to miss twice, letting the recoil all but carry the gun over her head.");
						kGAMECLASS.fedQuestCoverDamage(10);
					}
					else
					{
						output("She lands a hit!");
						damage = rangedDamage();
						damage.multiply(.5);
					
						//Leftover damage is what doesn't get eaten by cover.
						leftOverDamage = damage.getTotal() - (Math.round(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100))/3;
						
						//Cover soaks up it's % in damage.
						kGAMECLASS.fedQuestCoverDamage(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100);
						
						//Figure out how much is left
						damage = new TypeCollection( { kinetic: leftOverDamage } );
						applyDamage(damage, this, target, "minimal");
					}
				}
				else
				{
					output("She lands two hits!");
					
					damage = rangedDamage();
					
					//Leftover damage is what doesn't get eaten by cover.
					leftOverDamage = damage.getTotal() - (Math.round(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100))/3;
					
					//Cover soaks up it's % in damage.
					kGAMECLASS.fedQuestCoverDamage(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100);
					
					//Figure out how much is left
					damage = new TypeCollection( { kinetic: leftOverDamage } );
					applyDamage(damage, this, target, "minimal");
				}
			}
		}
		
		private function myrRemnantReload(target:Creature):void
		{
			output(StringUtil.capitalize(this.getCombatName(), false) + " finds her weapon’s out of ammo, and has to duck down to reload!");
			createStatusEffect("Riposting");
		}
		
		private function myrRemnantTrunch(target:Creature):void
		{
			output(StringUtil.capitalize(this.getCombatName(), false) + " charges " + target.getCombatName() + ", swinging wildly with a crude club! ");
			
			if (combatMiss(this, target))
			{
				output(StringUtil.capitalize(target.getCombatName(), false) + " manage" + (target is PlayerCharacter || target.isPlural ? "" : "s") + " to dodge.");
			}
			else
			{
				output("She manages to get a good hit in!");
				
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.8);
				applyDamage(damage, this, target, "minimal");
				if((target.physique()/2 + rand(20) + 1 < this.physique()/2 + 13) && !target.isPlanted()) CombatAttacks.applyStagger(target, rand(3)+1);
			}
		}
		
		private function myrRemnantSnipe(target:Creature):void
		{
			aimMod += 20;
			
			output(StringUtil.capitalize(this.getCombatName(), false) + " shoulders her rifle and takes careful aim, lining up a shot on " + target.getCombatName() + ". When she finally squeezes the trigger, ");
			
			if (rangedCombatMiss(this, target)) 
			{
				output("her shot only just missed, impacting the wall just to the side. ");
				kGAMECLASS.fedQuestCoverDamage(25);
			}
			else
			{
				output(StringUtil.capitalize(target.getCombatName(), false) + " get" + (target is PlayerCharacter || target.isPlural ? "" : "s") + " hit by a deadly shot!");
				
				createStatusEffect("Quaramarta!");
				var damage:TypeCollection = rangedDamage();
				removeStatusEffect("Quaramarta!");
				
				//Leftover damage is what doesn't get eaten by cover.
				var leftOverDamage:Number = damage.getTotal() - (Math.round(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100))/3;
				
				//Cover soaks up it's % in damage.
				kGAMECLASS.fedQuestCoverDamage(damage.getTotal() * flags["GOLD_AMBUSH_COVER"]/100);
				
				//Figure out how much is left
				damage = new TypeCollection( { kinetic: leftOverDamage } );
				applyDamage(damage, this, target, "minimal");
			}
			
			aimMod -= 20;
		}
		
		private function myrRemnantGrenade(hostileCreatures:Array):void
		{
			output(StringUtil.capitalize(this.getCombatName(), false) + " takes something off her belt and affixes it to her rifle's barrel. She aims it your way and shoots it off, sending something big and black hurling your way! It impacts the ground behind you and explodes, sending a hail of shrapnel over your squad!");
			
			for (var x:int = 0; x < hostileCreatures.length; x++) if(hostileCreatures[x].HP() > 0)
			{
				output("\n");
				applyDamage(rangedDamage().multiply((rand(16)+65)*.01), this, hostileCreatures[x]);
			}
			
			specialCD = 4;
		}
	}

}