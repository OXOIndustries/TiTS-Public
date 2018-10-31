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
	import classes.Items.Guns.HuntingRifle;
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
	
	public class MyrRedCommando extends Creature
	{
		private var specialCD:int = 0;
					
		public function MyrRedCommando() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Red Commando";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "black";
			
			this.long = "";

			this.isPlural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			rangedWeapon = new HuntingRifle();

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
			this.skinTone = "red";
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
			btnTargetText = "Red Cmndo";
			
			createPerk("Can Crit",0,0,0,0);
			credits = rand(200);
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "RED_COMMANDO";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures[0] is Estallia ? hostileCreatures.slice(1) : hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Riposting")) removeStatusEffect("Riposting");
			if(hasStatusEffect("Lieve Buff") && statusEffectv1("Lieve Buff") <= 0) removeStatusEffect("Lieve Buff");
			else if (hasStatusEffect("Lieve Buff")) addStatusValue("Lieve Buff", 1, -1);
			
			var attacks:Array = new Array();
			attacks.push(myrCommandoShoot);
			attacks.push(myrCommandoShoot);
			attacks.push(myrCommandoShoot);
			attacks.push(myrCommandoAxe);
			if(rand(2) == 0) attacks.push(myrCommandoReload);
			
			attacks[rand(attacks.length)](target);
		}
		
		private function myrCommandoShoot(target:Creature):void
		{
			if(rand(3) == 0)
			{
				output(StringUtil.capitalize(this.getCombatName(), false) + " braces her rifle against her shoulder and starts squeezing the trigger as fast as she can, laying down a volley of shots at " + target.getCombatName() + ". ");
				var hits:int = 3;
				for(var i:int = 0; i < 3; i++) if(rangedCombatMiss(this, target)) hits-=1;
				
				if(hits == 0) output("Her entire barrage goes wide!");
				else
				{
					output("She drives " + target.getCombatName() + " back with the assault!");
					for(i = 0; i < hits; i++) applyDamage(rangedDamage().multiply((rand(16)+65)*.01), this, target, "minimal");
				}
			}
			else
			{
				output(StringUtil.capitalize(this.getCombatName(), false) + " takes aim with her rifle and squeezes off a few shots at " + target.getCombatName() + ", ");
				if(rangedCombatMiss(this, target)) output("but her shots go wide.");
				else
				{
					output("hammering her target.");
					applyDamage(rangedDamage(), this, target, "minimal");
				}
			}
		}
		
		private function myrCommandoReload(target:Creature):void
		{
			output("You hear a meaty <b>click!</b> from " + this.getCombatName() + "’s rifle. She curses and ducks behind cover, pulling a stripper clip out of her belt and ramming bullets into the side of her rifle.");
			createStatusEffect("Riposting");
		}
		
		private function myrCommandoAxe(target:Creature):void
		{
			output(StringUtil.capitalize(this.getCombatName(), false) + " lunges out of cover when " + target.getCombatName() + " gets too close, swinging her handaxe in a brutal overhead blow! ");
			
			if (combatMiss(this, target))
			{
				output(StringUtil.capitalize(target.getCombatName(), false) + " manages to block the strike!");
			}
			else
			{
				output("She lands the attack with crushing force!");
				
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.8);
				applyDamage(damage, this, target, "minimal");
				if(target.physique()/2 + rand(20) + 1 < this.physique()/2 + 13) CombatAttacks.applySunder(target, rand(2)+1, true);
			}
		}
	}

}