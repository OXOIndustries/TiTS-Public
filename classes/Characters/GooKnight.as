package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GameData.Pregnancy.PregnancyStageProgression;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @Author Fenoxo
	 * Stolen from Gedan a bit...
	 */
	public class GooKnight extends Creature
	{
		
		public function GooKnight() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "ganraen knight";
			this.originalRace = "ganrael";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The goo's liquid flexibility allows her to handily avoid your attack.";
			this.customBlock = "The goo's liquidity absorbs a great deal of punishment - without taking damage.";
			this.isPlural = false;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 10.0;
			baseHPResistances.pheromone.resistanceValue = 100.0;
			baseHPResistances.drug.resistanceValue = 100.0;
			baseHPResistances.tease.resistanceValue = -25.0;
			
			this.meleeWeapon.attack = 1;
			this.meleeWeapon.longName = "gooey sword";
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.hasRandomProperties = true;
			
			armor = new GooeyCoverings();
			armor.defense = 10;
			armor.resistances.addFlag(DamageFlag.MIRRORED);
			armor.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 19;
			this.aimRaw = 12;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 14;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 100;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "green";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "green";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
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
			this.hipRatingRaw = 2;
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
			
			this.createStatusEffect("Force Fem Gender");
			//this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "GooKnight";
			sexualPreferences.setRandomPrefs(2 + rand(3));
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			if(rand(2) == 0) sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, sexualPreferences.getRandomLikesFactor());
			
			if(rand(2) == 0) skinTone = "green";
			else skinTone = "blue";
			long = "The ganraen knight’s " + skinTone + " armor shines in the dimly lit cave, reflecting the pale glow of the pulsing fungi that cover the walls. She holds a simply shaped shield and sword, though the blade looks a bit more like a sharpened slab. Strategically placed joints prevent the armor from slowing her swift movements.";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOO_KNIGHT_" + skinTone.toUpperCase();
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(CombatManager.getRoundCount() == 1 && HP()/HPMax() > 0.66)
			{
				shieldWall();
			}
			else if(hasStatusEffect("Melee Counter")) counterSlash(target);
			else crystalGooAttacku(target);
			crystalGooLongUpdate();
		}
		
		private function crystalGooAttacku(target:Creature):void
		{
			output("The ganraen knight slashes her sword in your direction.");
			//miss: 
			if (combatMiss(this, target)) output("\nYou dodge out of the way before she can hit you.");
			else 
			{
				output("\nIt cuts at your ");
				if(target.shields() > 0) output("shield");
				else output("body");
				output(" before you can escape.");
				applyDamage(damageRand(meleeDamage(), 15), this, target);
			}
		}
		
		private function counterSlash(target:Creature):void
		{
			removeStatusEffect("Melee Counter");
			//used after you attack sometimes. Deals 1.5 times the damage she took from your attack.
			output("The [enemy.skinTone] knight rebounds from your attack with a fierce counter.");
			if (combatMiss(this, target)) output("\nYou duck under her returned attack, narrowly avoiding the blade.");
			else 
			{
				output("\nThe revenge-strengthened attack hits you with full force.");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(2);
				applyDamage(damageRand(damage, 15), this, target, "minimal");
			}
		}
		
		private function shieldWall():void
		{
			output("The crystal knight hoists her shield, preventing your attacks from being as effective while it stands.");
			baseHPResistances.kinetic.resistanceValue = 50.0;
		}
		
		private function crystalGooLongUpdate():void
		{
			long = "The ganraen knight’s " + skinTone + " armor shines in the dimly lit cave, reflecting the pale glow of the pulsing fungi that cover the walls. She holds a simply shaped shield and sword, though the blade looks a bit more like a sharpened slab. Strategically placed joints prevent the armor from slowing her swift movements.";
			if(lust() < 66) long += " You can’t see her face, but you hear labored breathing behind the helmet.";
			else long += " The knight’s hands keep shying toward her sex, but are blocked by the armor that protects her.";
			// 33% lust/66%/66% hp/33%
			if(HP()/HPMax() > .66) {}
			else if(HP()/HPMax() > .33) long += " The knight’s armor has begun to fall apart, revealing small portions of her gooey interior.";
			else long += " A chestplate, helmet, and skirt are all that remain of the knight’s armor, leaving most of her " + skinTone + " goo visible.";
			if(HP()/HPMax() <= 0.66 && baseHPResistances.kinetic.resistanceValue == 50) 
			{
				output("\n\n<b>Her gooey shield has crumbled after your onslaught!</b>");
				baseHPResistances.kinetic.resistanceValue = 10;
			}
		}
		
	}

}
