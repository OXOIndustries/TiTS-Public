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
	import classes.Items.Guns.TrenchShotgun;
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
	
	public class Lieve extends Creature
	{
		private var specialCD:int = 0;
					
		public function Lieve() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Lieve";
			this.originalRace = "myrmedion";
			this.a = "";
			this.capitalA = "";
			this.tallness = 62;
			this.scaleColor = "black";
			
			this.long = "";

			this.isPlural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			rangedWeapon = new TrenchShotgun();

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
			
			isUniqueInFight = true;
			btnTargetText = "Lieve";
			
			createPerk("Can Crit",0,0,0,0);
			credits = rand(200);
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "LIEVE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures[0] is Estallia ? hostileCreatures.slice(1) : hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Lieve Buff") && statusEffectv1("Lieve Buff") <= 0) removeStatusEffect("Lieve Buff");
			else if (hasStatusEffect("Lieve Buff")) addStatusValue("Lieve Buff", 1, -1);
			if(hasStatusEffect("Riposting") && statusEffectv1("Riposting") <= 0) removeStatusEffect("Riposting");
			else if (hasStatusEffect("Riposting")) addStatusValue("Riposting", 1, -1);
			
			if(CombatManager.getRoundCount()%5 == 1) lieveFocus(alliedCreatures);
			else if(CombatManager.getRoundCount()%5 == 3) lieveHeal(alliedCreatures);
			else if(HPQ() < 50 && specialCD == 0) lieveCover(target);
			else if(rand(3) == 0) lieveGrenade(hostileCreatures);
			else lieveShoot(target);
		}
		
		private function lieveShoot(target:Creature):void
		{
			output("Lieve shoulders her shotgun and pops off a shot at " + target.getCombatName() + " with both barrels! ");
			var hits:int = 2;
			for(var i:int = 0; i < 2; i++) if(rangedCombatMiss(this, target)) hits-=1;
			
			if(hits == 0) output(StringUtil.capitalize(target.getCombatName(), false) + " manages to evade the blasts!");
			else
			{
				output("She lands "+hits+" hit" + (hits > 1 ? "s" : "") + " on " + target.getCombatName() + "!");
				for(i = 0; i < hits; i++) applyDamage(rangedDamage().multiply((rand(26)+90)*.01), this, target, "minimal");
			}
		}
		
		private function lieveFocus(alliedCreatures:Array):void
		{
			output("<i>“Everyone, focus fire! Keep it together, girls,”</i> Lieve shouts, marshalling her remaining troops to fight harder.");
			output("\n<b>Your party’s accuracy and crit chance have been boosted!</b>");
			for (var x:int = 0; x < alliedCreatures.length; x++) alliedCreatures[x].createStatusEffect("Lieve Buff", 3, 0, 0, 0, false, "OffenseUp", "Lieve’s orders have boosted morale!\nCritical chance and accuracy increased.", true, 0, 0xFFFFFF);
			addStatusValue("Lieve Buff", 1, -1);
		}
		
		public function lieveHeal(alliedCreatures:Array):void
		{
			var target:Creature = alliedCreatures[0];
			var x:int = 0;
			for (x = 0; x < alliedCreatures.length; x++) 
				if(alliedCreatures[x].HP() > 0 && alliedCreatures[x].HPQ() < target.HPQ() && alliedCreatures[x] != this)
					target = alliedCreatures[x];
			
			output("<i>“Come on, keep your head in the game!”</i> Lieve shouts, grabbing " + target.getCombatName() + " by the shoulder. <i>“All of you! Fight for you lives. For your country. For the Federation!”</i>");
			output("\n\n<i>“FOR THE FEDERATION!”</i> the reply comes, from every red myr’s mouth.");
			output("\n<b>Your party has been healed</b>");
			for (x = 0; x < alliedCreatures.length; x++) if(alliedCreatures[x].HP() > 0) alliedCreatures[x].HP(target == alliedCreatures[x] ? 75 : 40);
			
		}
		
		private function lieveCover(target:Creature):void
		{
			output("Lieve ducks down, finding herself some better cover -- she’s no use to you dead, after all!");
			this.createStatusEffect("Riposting", 3, 0, 0, 0, false, "EvasionUp", "Lieve is taking cover!\n Evasion increased.", true, 0, 0xFFFFFF);
			
			specialCD = 1;
		}
		
		private function lieveGrenade(hostileCreatures:Array):void
		{
			output("<i>“Fire in the hole!”</i> Lieve shouts, taking a truncheon-shaped metal stick from her belt and hurling it at the golds. It detonates a second later, showering the enemy in flames and shrapnel! ");
			
			for (var x:int = 0; x < hostileCreatures.length; x++) if(hostileCreatures[x].HP() > 0)
			{
				var eName:String = hostileCreatures[x].getCombatName() + (hostileCreatures[x].getCombatName() == "gold remnant" ? " "+String.fromCharCode(65+x) : "");
				if(rangedCombatMiss(this, hostileCreatures[x])) output("\n"+eName.substring(0, 1).toUpperCase()+eName.substring(1, eName.length)+" dodges behind cover.");
				else 
				{
					output("\n"+eName.substring(0, 1).toUpperCase()+eName.substring(1, eName.length)+" is blasted by the grenade!");
					applyDamage(rangedDamage().multiply((rand(16)+80)*.01), this, hostileCreatures[x], "minimal");
				}
			}
		}
	}

}