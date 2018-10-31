package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	public class CarlsRobot extends Creature
	{
		public function CarlsRobot()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "machina";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The robot hovers in the air, spindly arms twitching and flicking in the air at every moment. Its steel-gray dome has lost its shine from both combat and the fatigue of the jungle, though it still looks fully operational and, at the moment, lethal. Each of its many tools are pointed at you, threateningly. You’re in for it now!";
			this.customDodge = "The machina lazily lists to the side, causing your attack to go wayward!";
			this.customBlock = "The machina’s thick plates cause the attack to glance off into the wilderness!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.longName = "pincers";
			this.meleeWeapon.attackNoun = "claw";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "metal plates";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 5;
			this.aimRaw = 9;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 1;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "metal";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 0;
			this.legFlags = new Array();
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
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
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 0;
			
			this.createStatusEffect("Infertile");
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.ass.bonusCapacity = 0;
			
			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Machina";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MACHINA";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.skinFlags.length == 0)
			{
				dataObject.skinFlags.push(GLOBAL.FLAG_FLUFFY);
			}
		}
				
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (HP() <= HPMax() * .1) suicideBullshit(target);
			else if(hasStatusEffect("Repair Queued") || (HP() < HPMax()/2 && rand(10) <= 2))
			{
				botRepairGo();
			}
			else if(HP() < HPMax()/2 && rand(10) <= 2) weldGunAttack(target);
			else if(rand(3) == 0) theSpinner(target);
			else machinaAttackNormal(target);
		}
		
		private function suicideBullshit(target:Creature):void
		{
			output("Rattled and damaged, even smoking somewhere, the machina wobbles closer to the earth. You relax a bit, thinking that this might be the robot’s final ‘death throes’. You’re quick to go back on the alert as the machine reaches into the brush with a grasping appendage, pulling out... a weapon?! You are not sure what sort it is, too dirty and masked by plants, but you don’t have a lot of time to figure out. The thick firearm explodes out in short order, sending a massive pellet your way!\n\n");

			//insert miss chances, damage, etc
			if (rangedCombatMiss(this, target)) 
			{
				output("You dodge out of the way!");
			}
			//Blind chances!
			//Extra miss for blind
			else if (hasStatusEffect("Blinded") && rand(10) > 0) 
			{
				output(capitalA + possessive(short) + " blinded shots fail to connect!");
			}
			//Shit, got hit.
			else
			{
				output(capitalA + short + " connects with " + mfn("his", "her", "its") + " massive gun!");
				var damage:TypeCollection = new TypeCollection( { kinetic: 15 } );
				damage.add(aim() / 2);
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target, "ranged");

				if (damageResult.shieldDamage > 0)
				{
					if (target.shieldsRaw > 0) output(" Your shield crackles but holds.");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
				}
				
				if (damageResult.hpDamage > 0)
				{
					output(" The hit carries on through to damage you!");
				}
				
				outputDamage(damageResult);
			}
			//*PC survives by HP, dodging, whatever.*
			if(HP() >= 1 && lust() <= 99) {
				output("\n\nSeeing its failure, the machine prepares to fire again - this time, though, the weapon explodes in a <i>different</i> way; you manage to duck as shrapnel goes flying over your head from the faulty firearm, and it’s the machina that takes the brunt of the blast. As you rise back up, you hear a pathetic sounding whir, petering out to nothing in short order. You’re left with a crumpled heap of a machine on the jungle floor.");
				HP(-1000);
			}
			//*PC doesn’t.*
			else output("\n\nSeeing its success the machine tosses away the firearm in short order, though as you fall backwards in pain you’re not really in the mindset to care.");
		}
		
		private function botRepairGo():void
		{
			if(!hasStatusEffect("Repair Queued"))
			{
				output("As it attacks, the spare appendages race up its form and begin to mend the damage to its structure! You’ll have to jostle it if you want to stop it before it completes!");
				createStatusEffect("Repair Queued",HP(),0,0,0,true,"","",true,0);
			}
			//*That turn, PC does good damage*
			else if(statusEffectv1("Repair Queued") > HP() + 5)
			{
				output("Your attack causes the machine to bounce severely, and the tool-appendages fall away from the chassis. You prevented it from repairing!");
				removeStatusEffect("Repair Queued");
			}
			//*That turn, if PC does poor damage.*
			else
			{
				output("You were unable to shake the robot up enough to interrupt it, so now you can only watch as the holes of damage and scarred metal are mended before your very eyes, showing just how vain your progress was.");
				HP(Math.round(HPMax()/3));
				removeStatusEffect("Repair Queued");
			}
		}
		
		private function weldGunAttack(target:Creature):void
		{
			output("One of the machine’s appendages raises upwards and flattens out in the span of half a second, and molten-red flames burst out and fly across the arena at you! The intense heat only lasts for a moment, however, as the modified welder immediately overheats.");
		applyDamage(new TypeCollection( { burning: 10 + rand(5) } ), this, target);
		}
		
		private function theSpinner(target:Creature):void
		{
			output("You hear a loud whir from the corrupt machine before it jerks forwards, coming at you as the main body starts to rotate. Not too soon after it is spinning at a blur of a pace, appendages sprawled outwards and in range of you! Watch out!\n");
			//*Up to seven normal damage attacks.*
			var damage:TypeCollection = meleeDamage();
			damage.kinetic.damageValue -= 3;
			if (damage.kinetic.damageValue < 1) damage.kinetic.damageValue = 1;
			
			var attacks:uint = 5 + ((rand(2) == 0) ? 1 : 0) + ((rand(3) == 0) ? 1 : 0);
			
			for (var i:uint = 0; i < attacks; i++)
			{
				if (combatMiss(this, target))
				{
					output("You manage to avoid " + a + possessive(short) + " " + meleeWeapon.attackVerb + ".");
				}
				else if (rand(100) <= 45 && !target.isImmobilized())
				{
					if (target.customDodge.length > 0) output(target.customDodge);
					else output("You manage to avoid " + a + possessive(short) + " " + meleeWeapon.attackVerb + ".");
				}
				else if (kGAMECLASS.mimbraneFeetBonusEvade(target, this))
				{
					output(kGAMECLASS.mimbraneFeetBonusEvadeBonus());
				}
				else
				{
					output(capitalA + short + " connects with " + mfn("his", "her", "its") + " " + meleeWeapon.longName + "!");
					
					applyDamage(damage, this, target, "melee");
				}
				output("\n");
			}
		}
		
		private function machinaAttackNormal(target:Creature):void
		{
			output("The machine jerks towards you, zig-zagging unexpectedly as it closes in - one of the grasping appendages reaches out to club at you!\n");
			physique(5);
			CombatAttacks.SingleMeleeAttackImpl(this, target, false);
			physique(-5);
		}
	}
}
