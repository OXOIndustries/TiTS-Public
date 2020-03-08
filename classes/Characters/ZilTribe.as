package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Guns.ZilBow;
	import classes.Items.Melee.ZilSpear;
	import classes.Items.Miscellaneous.ZilHoney;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilTribe extends Creature
	{
		//constructor
		public function ZilTribe()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "zil tribe";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Every member that can raise a blade, bow or blunt instrument in anger, male and female alike is here. The flames of their torches glimmer off their black armor, beetle-like oval shields and the sticky war paint they have smeared across their wild, tar-eyed faces. You’ve backed yourself against the wall of a wax building so you don’t have to fight literally every single one of them at once, but the lithe bee people are a thicket of yellow, tar and flint all around you, closing off any notion of escape. A buzzing ululation is on all of their lips, a rising and falling war cry that seems to inspire them and drive them to frenzy, fearlessly flying at you regardless of where you’ve got your weapon aimed.\n\nThe ones that can’t reach you stamp their boots in the sand or fly above the foray, droning encouragement to those that can, eagerly awaiting their own opportunity to hurl themselves at the land-stealer champion.";
			this.customBlock = "";
			this.customDodge = "";
			this.isPlural = true;
			//Armor absorbs 50% of kinetic attacks, 30% of burning attacks, 50% of poison attacks, 150% of corrosive attacks, 50% of drug attacks, 30% of electric attacks.
			//Fen note: heavily adjusted this.
			this.armor.longName = "chitin";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.shield.shields = 100;
			this.shield.resistances.addFlag(DamageFlag.ABLATIVE);
			this.shield.resistances.corrosive.resistanceValue = -50.0;
			this.shield.resistances.kinetic.resistanceValue = 50.0;
			this.shield.resistances.burning.resistanceValue = 50.0;
			this.shield.resistances.electric.resistanceValue = 50.0;
			this.shield.hasRandomProperties = true;
			this.shieldDisplayName = "CHITIN";

			baseHPResistances = new TypeCollection();
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = 50;

			meleeWeapon.attackVerb = "stab";
			meleeWeapon.attackNoun = "stab";
			meleeWeapon.longName = "spear";
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;
			
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "arrow";
			rangedWeapon.longName = "spear";
			rangedWeapon.baseDamage.kinetic.damageValue = 4;
			rangedWeapon.addFlag(DamageFlag.PENETRATING);
			rangedWeapon.hasRandomProperties = true;

			this.physiqueRaw = 35;
			this.reflexesRaw = 1;
			this.aimRaw = 35;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 35;
			this.libidoRaw = 80;
			this.shieldsRaw = 100;
			this.energyRaw = 100;
			this.lustRaw = 20;
			this.level = 7;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 250;
			this.HPRaw = this.HPMax();

			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 54;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BEE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			this.cocks[0].cType = GLOBAL.TYPE_BEE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 1;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			impregnationType = "ZilPregnancy";
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].type = GLOBAL.TYPE_BEE;
			this.vaginas[0].vaginaColor = "black and gold";

			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Zil";
			
			this.inventory.push(new ZilHoney());
			inventory[0].quantity = 5;
			this.inventory.push(new ZilSpear());
			this.inventory.push(new ZilBow());
			
			kGAMECLASS.mhengaSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ZIL_TRIBE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			//Notes: Since this is the brute force option that can be avoided, it should be tough. I’m thinking four attacks per turn, with one of them always being the persistent pheromone attack.
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Number = 4;
			var choices:Array = [];
			var blocked:Array = [];
			var summered:Boolean = false;

			var select:Number = 0;
			while(attacks > 0)
			{
				if(attacks < 4) output("\n\n");
				choices = buildChoices(blocked,target);

				select = rand(choices.length);
				//Block shiiiit
				if(choices[select] == clobberAttack) blocked.push(clobberAttack);
				if(choices[select] == grabWoundedPCs) blocked.push(grabWoundedPCs);
				//Track high summer
				if(choices[select] == highSummer) summered = true;
			
				if(attacks > 1) choices[select](target);
				else if(!summered) highSummer(target);
				else choices[select](target);
				attacks--;
			}
		
		}
		public function buildChoices(blocked:Array,target:Creature):Array
		{
			var choices:Array = [];

			if(hasStatusEffect("Trip CD")) 
			{
				addStatusValue("Trip CD",1,-1);
				if(statusEffectv1("Trip CD") <= 0) removeStatusEffect("Trip CD");
			}
			if(hasStatusEffect("Armor Restore CD")) 
			{
				addStatusValue("Armor Restore CD",1,-1);
				if(statusEffectv1("Armor Restore CD") <= 0) removeStatusEffect("Armor Restore CD");
			}
			choices = [];
			choices.push(getStabbedBiyatch);
			choices.push(arrowAttack);
			//1x limit
			if(!isZilBlocked(clobberAttack,blocked)) choices.push(clobberAttack);
			choices.push(lustDartFoLyfe);
			if(!isZilBlocked(grabWoundedPCs,blocked))
			{
				if(this.HP() < 180 && !target.hasStatusEffect("Tripped") && !this.hasStatusEffect("Trip CD")) choices.push(grabWoundedPCs);
			}
			//Always one of these:
			choices.push(highSummer);
			//Lust over 65
			choices.push(squirtSome);
			//Armor restore
			if(!hasStatusEffect("Armor Restore CD") && this.shields() <= 10) choices.push(armorReplenish);
			//Only active if Lust 80 or more. Reduces lust by 60, tease damage to PC. Can only be used once
			if(this.lust() >= 80 && !this.hasStatusEffect("HoneyCane Used")) choices.push(honeyCane);

			return choices;
		}
		public function isZilBlocked(target:Function,blocked:Array):Boolean
		{
			for(var x:int = 0; x < blocked.length; x++)
			{
				if(target == blocked[x]) return true;
			}
			return false;
		}
		//Attacks
		//Spear Stab
		//Standard kinetic crushing.
		public function getStabbedBiyatch(target:Creature):void
		{
			output("One zil stabs at you viciously with their spear.");
			if(combatMiss(this, target)) output(" You avoid the blow.");
			else
			{
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Arrow
		//Standard kinetic penetrating.
		public function arrowAttack(target:Creature):void
		{
			output("An arrow hisses out of the mob towards you. You don’t even see who fired it.");
			if(rangedCombatMiss(this, target)) output(" You dodge out of its path.");
			else
			{
				var damage:TypeCollection = rangedDamage();
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Clobber
		//Kinetic crushing, causes stun if shield down. Only once per turn
		public function clobberAttack(target:Creature):void
		{
			meleeWeapon.attackVerb = "smash";
			meleeWeapon.attackNoun = "smash";
			meleeWeapon.longName = "club";
			meleeWeapon.baseDamage.kinetic.damageValue = 8;
			meleeWeapon.deleteFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;

			output("A wordless war hum vibrates out of the open mouth of a zil as they throw a whirling roundhouse you with their wooden club.");
			if(combatMiss(this, target)) output(" You avoid the blow.");
			else
			{
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
				if(target.shields() < 0 && this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
				{
					output(" You taste iron, and you’re knocked to a place where it seems as if the battle is coming from a long way away...");
					CombatAttacks.applyStun(target, 2);
				}
			}
			meleeWeapon.attackVerb = "stab";
			meleeWeapon.attackNoun = "stab";
			meleeWeapon.longName = "spear";
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;
		}
		//Dart
		//Small kinetic penetrating damage, drug lust damage.
		public function lustDartFoLyfe(target:Creature):void
		{
			output("A zil at close-quarters raises a blowpipe and puffs their cheeks around the hole.");
			if(rangedCombatMiss(this, target)) output(" You manage to sidestep the dart.");
			else
			{
				if(target.shields() > 0) output(" The dart breaks apart on your shield.");
				else
				{
					output(" The dart pricks into you, releasing its lusty, woozy payload.");
					applyDamage(new TypeCollection( { drug: 7 + rand(3) } ), this, target, "minimal");
				}
			}
		}
		//Wounded Grab
		//Only active if HP 180 or less. No damage, trips the PC if success. Only once per turn, two turn cooldown
		public function grabWoundedPCs(target:Creature):void
		{
			output("One of the zil you’ve driven wounded to the ground grabs desperately at your [pc.legs].");
			if((this.physique()/2 + rand(20) + 1 <= target.physique()/2 + 10) || target.isPlanted()) output(" You manage to wrench yourself out of his grip.");
			else
			{
				output(" You can’t stop yourself being pulled down in turn! The remaining zil cheer and close in, scenting victory.");
				CombatAttacks.applyTrip(target);
			}
			this.createStatusEffect("Trip CD",5,0,0,0);
		}
		//High Summer
		//One of their attacks is always this. Pheromone lust damage
		public function highSummer(target:Creature):void
		{
			output("The smell of so many zil packed together around you is impossible to avoid. The fragrant, arousing sugar is exacerbated by the warmth of their naked bodies and the sharpness of their anger and excitement, an intoxicating blend that cascades over your senses in waves...");
			applyDamage(new TypeCollection( { pheromone: 7 + rand(3) } ), this, target, "minimal");
		}
		//Squirt
		//Only active if Lust 65 or more. Pheromone lust damage
		public function squirtSome(target:Creature):void
		{
			output("One of the zil you’ve rendered too lust-addled to do anything but frig herself grits her teeth, grips her nipples and squirts syrupy, projectile arousal at you.");
			if(rangedCombatMiss(this, target)) output(" You duck out of the way.");
			else
			{
				output(" It splatters across you, and you groan as the scent and flavor of it works itself into your head...");
				applyDamage(new TypeCollection( { pheromone: 4 + rand(3) } ), this, target, "minimal");
			}
			this.lust(-5);
		}
		//Armor Replenish
		//Only active if Armor at <10. Raises armor by 70. Only once per turn, three turn cooldown
		public function armorReplenish(target:Creature):void
		{
			output("Whilst two zil box you in with their circling spear-tips, the rest of the mob rearrange themselves. Shields change hands, black carapace tightening up with concerted concentration. Before you know it you’re being assaulted on all sides again, the warrior wasps’ armor revitalized.");
			this.changeShields(70);
			this.createStatusEffect("Armor Restore CD",5,0,0,0);
		}
		//Honey-cane
		//Only active if Lust 80 or more. Reduces lust by 60, tease damage to PC. Can only be used once
		public function honeyCane(target:Creature):void
		{
			output("The zil are looking increasingly orange in the face, and more than just from battle frenzy. Honey is leaking down thighs, thick jet-boners are on display.... They shout and buzz at each in distraction - a decision seems to be reached - and before you know it they’ve reorganized. Three of the least affected by your antics leap forward, boxing you in with swinging clubs and torches, and the rest relieve themselves. Gratuitously. Ebony fingers dance across lithe flesh, squeeze, rub furiously, lips are bitten, gasps escape into the air, and honey squirts everywhere.");
			output("\n\nFrom left to right is a cornucopia of frenzied insectile lust, and it’s difficult not to be overwhelmed by it. It seems to have only been opened in front of you for a few mere moments though before a wave of freshly relieved wasp fighters are back on their feet and charging back into the fray, triumphantly resuming that deafening hum-cry of theirs.");
			this.lust(-60);
			applyDamage(new TypeCollection( { tease: 7 + rand(3) } ), this, target, "minimal");
			this.createStatusEffect("HoneyCane Used",0,0,0,0);
		}
	}
}
