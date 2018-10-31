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
	import classes.Items.Guns.BoltActionRifle;
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
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrGoldFemaleDeserter extends Creature
	{
		public function MyrGoldFemaleDeserter() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "gold deserter";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "You’re facing off against a grizzled yet beautiful myr deserter. She’s dressed in a ragged Gilden Republic uniform. All the patches - her country, name, rank - have been torn off. Different rips in her uniform brazenly expose her cleavage and belly: the latter has a light, telltale scar.\n\nShe’s armed with a weathered combat shotgun with a sword bayonet on the end. She holds it in two hands, the other two clutching a pair of service revolvers.\n\nHer hair is a wild black and her lower lip is notably scarred.";
			this.customDodge = "The seasoned soldier throws herself sideways. Your attack misses her by an inch and she deftly tumbles back to her feet.";
			this.customBlock = "The female soldier brings up her bayonet blade and masterfully redirects your attack. You’ve been blocked!";

			this.isPlural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			rangedWeapon = new BoltActionRifle();
			rangedWeapon.longName = "shotgun";
			rangedWeapon.description = "a shotgun";
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "buckshot";
			rangedWeapon.hasRandomProperties = true;


			armor.longName = "thick chitin";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 17;
			this.reflexesRaw = 22;
			this.aimRaw = 17;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 16;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 50;
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
			
			isUniqueInFight = true;
			btnTargetText = "Gold Myr";
			
			credits = rand(200);
			if(rand(20) == 0) inventory.push(new Kirkite());
			else if(rand(20) == 0) inventory.push(new Satyrite());
			else if(rand(5) == 0) inventory.push(new RedMyrVenom());
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			if (flags["KNOW_GOLD_MYR_NAME"] != undefined)
			{
				short = "Lys";
				a = "";
				capitalA = "";
			}
			
			createPerk("Can Crit",0,0,0,0);
			//kGAMECLASS.myrellionSSTDChance(this);
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "LYS";
		}
		
		override public function isPregnant(x:int = 0):Boolean
		{
			return false;
		}
		
		// Placeholder shit, sue me. Calling the ill excuse etc.
		override public function bellyDescript(bForceSize:Boolean = false): String {
			var sBuilder:String = "";

			var belly:Number = 0;
			var sizeDescripts:Array = new Array();
			var pregDescripts:Array = new Array();

			sizeDescripts[sizeDescripts.length] = "toned";
			sizeDescripts[sizeDescripts.length] = "sculpted";
			sizeDescripts[sizeDescripts.length] = "flat";
			sizeDescripts[sizeDescripts.length] = "slim";
			
			//Size: 50%
			if(rand(2) == 0)
			{
				sBuilder += sizeDescripts[rand(sizeDescripts.length)];
				//Pregnant stuff & Size: 50% or 25% overall odds.
				if(isPregnant() && rand(2) == 0)
				{
					sBuilder += ", ";
					sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
				}
				else sBuilder += " ";
			}
			//Pregnant Stuff - 25% chance (note there's a 25% chance of occurring with belly size for 50% total)
			else if(isPregnant() && rand(2) == 0)
			{
				sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
			}
			
			//Noun selection:
			if(belly < 10 && rand(4) == 0) sBuilder += "midriff";
			else if(belly < 20 && rand(3) == 0) sBuilder += "middle";
			else sBuilder += "belly";
			
			return sBuilder;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(lust()/lustMax()*100 >= rand(100+1)) antGrillLustAttacku(target);
			//’Melee Strike’, ‘Shoot’, ‘Barrage’, or ‘Grenade Throw’. The other third of the time, they do lust attacks.
			else if(energy() >= 33 && rand(4) == 0) grenadeThrow(target);
			else if(rand(3) == 0) myrDeserterStrike(target);
			else if(rand(2) == 0) myrDeserterBarrage(target);
			else myrDeserterShot(target);
		}
		
		private function myrDeserterShot(target:Creature):void
		{
			output("The gold deserter reloads her combat shotgun and dashes up to you. Without aiming, she whips up the barrel and shoots.");

			if (rangedCombatMiss(this, target)) 
			{
				output("\nHer attack falls far short of hitting you. Instead, the buckshot whizzes past harmlessly.");
			}
			else
			{
				output("\nThere’s a cracking boom and a dull ache of impact");
				if(target.shields() > 0) output(", even through your shields.");
				applyDamage(rangedDamage(), this, target, "ranged");

				//Physique check. DC 25 vs trip!
				if((target.physique + rand(20) + 1 < 25 && target.shields() <= 0) && !target.isPlanted())
				{
					output("\nA hot, burning sensation sprays out from your chest. You’re knocked back and off your [pc.feet].");
					//Effect: Decent physical damage with small crit chance. If the PC’s shields are down, there is a 25% knockback chance. 100% knockback chance on crit.
					CombatAttacks.applyTrip(target);
				}
			}
		}
		
		private function myrDeserterBarrage(target:Creature):void
		{
			output("The grizzled soldier reloads her combat shotgun with fresh bullets. Pointing it at you, she unloads three consecutive blasts.");
			output("\n");
			//[Miss]: Her attack falls far short of hitting you. Instead, {Red: her bullets whiz past/Gold:the buckshot whizzes past} harmlessly.
			
			for (var i:int = 0; i < 3; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
		}
		
		private function grenadeThrow(target:Creature):void
		{
			output("The gold-skinned soldier moves two of her hands behind her back. Before you know it, she’s tossing a pin away with one hand. The other lobs a pineapple grenade at you!");

			if (rangedCombatMiss(this, target)) output("\nWith such shoddy vision, her grenade throw falls short of her mark. You dart back and easily dodge the resulting blast.");
			else
			{
				output("\n\nThere’s a loud explosion, followed by a deafening ringing noise.");
				var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: 25, burning: 25 } ), 15);
				applyDamage(damage, this, target);
			}
			energy(-33);
		}
		
		private function antGrillLustAttacku(target:Creature):void
		{
			//Lust Attack #1 (Both)
			if(rand(2) == 0)
			{
				output("With a sultry wink, the battle-scarred beauty runs her slender fingers down her torn top and tugs open her shirt. She flashes a honey-hued breast at you. It jiggles out of its confines and you get a good glimpse at her dark, pierced nipple.");
			}
			//Lust Attack #3 (Gold Only)
			else
			{
				output("The buxom gold deserter turns on the spot and raises her alien hindquarters. She exposes her glistening egg-slit to you. It winks invitingly at you, promising otherworldly pleasure.");
			}
			
			//DC 25 willpower check!
			if(target.willpower()/2 + rand(20) + 1 >= 25)
			{
				output("\n\nYou resist her erotic enticements... for now.");
			}
			else
			{
				output("\n\nYou try to resist her erotic enticements to little avail!");
				applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, target, "minimal");
			}
		}
		
		private function myrDeserterStrike(target:Creature):void
		{
			output("The battle-scarred beauty unloads a round of buckshot at you. While you’re dodging it, she darts in and stabs at you with her bayonet.");

			if (combatMiss(this, target)) output("\nHer feint fails - you duck under her slicing blow and scamper out of the way. She reloads her gun with a loud click and a focused stare.");
			else
			{
				output("\nHer feint succeeds - she lands a blow with her blade!");
				applyDamage(meleeDamage(), this, target, "melee");
			}
		}
	}

}