package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Miscellaneous.*;
	import classes.Items.Transformatives.KerokorasVenom;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class FrogGirl extends Creature
	{
		
		
		//constructor
		public function FrogGirl()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "kerokoras";
			this.originalRace = "kerokoras";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "PLACEHOLDAH!";
			this.customDodge = "The frog-girl twists out of the way on powerful legs.";
			this.customBlock = "The frog-girl's skin proves remarkably durable!";
			this.isPlural = false;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.attack = 2;
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 10;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 8;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 30;
			
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "varied";
			this.tallness = 1; //See initialization below - randomized!
			this.thickness = 33;
			this.tone = 50;
			this.hairColor = "green"; //No hair doh!
			this.scaleColor = "green"; //Same with scales
			this.furColor = "orange"; //Same fur fur
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 7;
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
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 998;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].type = GLOBAL.TYPE_LIZAN;
			this.vaginas[0].vaginaColor = "pink";
			//Goo is hyper friendly!
			this.elasticity = 1.0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.00;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 10;
			
			this.createStatusEffect("Disarm Immune");

			this.inventory.push(new KerokorasVenom());
			isUniqueInFight = true;
			btnTargetText = "Froggirl";
			
			sexualPreferences.setRandomPrefs(4 + rand(3));
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			randomise();
			updateDesc();
			kGAMECLASS.mhengaSSTDChance(this);
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			switch (rand(7))
			{
				case 0: skinTone = "orange and green"; break;
				case 1: skinTone = "mottled brown"; break;
				case 2: skinTone = "black and gold"; break;
				case 3: skinTone = "black and blue"; break;
				case 4: skinTone = "black and red"; break;
				case 5: skinTone = "red and blue"; break;
				case 6: skinTone = "black, blue, and yellow"; break;
				default: skinTone = "gold"; break;
			}
			
			lustRaw = 20 + rand(30);
			tallness = 54 + rand(13);
			
			vaginas[0].clits = 1;
			vaginas[0].wetnessRaw = 2 + rand(3);
			vaginas[0].loosenessRaw = 1 + rand(4);
			vaginas[0].bonusCapacity = 10;
			vaginas[0].type = GLOBAL.TYPE_LIZAN;
			vaginas[0].vaginaColor = skinTone;
			ass.wetnessRaw = 0;
			ass.loosenessRaw = 1 + rand(3);
			ass.bonusCapacity = 10;
		}
		
		private function updateDesc():void
		{
			long = "The short and sleek alien before you dodges about with practiced ease. Her " + skinTone + " skin shines with a coating of lust inducing toxins. A grin crosses her features as she gazes at you with unrestrained need. Despite the soft appearance of her body, you can see toned muscle coiled beneath her pliant flesh. She’s ready to fight if it means getting ";
			if(kGAMECLASS.pc.hasCock()) long += "into your pants.";
			else long += "you out of the way.";
		}
		
		override public function get bustDisplay():String
		{
			switch (skinTone)
			{
				case "orange and green": return "FROG_4";
				case "mottled brown": return "FROG_8";
				case "black and gold": return "FROG_5";
				case "black and blue": return "FROG_6";
				case "black and red": return "FROG_2";
				case "red and blue": return "FROG_1";
				case "black, blue, and yellow": return "FROG_3";
				default: return "FROG_7";
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];
			
			if(target.shields() < 1) attacks.push(getLickedBitch);
			//Kick
			//basic attack
			else attacks.push(frogGirlKickAttackkkkkuuuuu);
			//Show
			//basic lust attack, only used on males
			if (target.hasCock()) attacks.push(frogGirlBasicLustAttack);
			//Tongue lash
			//special attack: deals lust damage if no shields
			attacks.push(tongueLashAttack);
			attacks[rand(attacks.length)](target);
		}
		
		private function getLickedBitch(target:Creature):void
		{
			output("The agile lady skirts up to you, attempting to give you a lick from waist to neck.");
			if(combatMiss(target, target)) output(" You leap backwards, escaping her attack before she can pull it off.");
			else if(target.hasAirtightSuit())
			{
				output(" Her tongue caresses you, but your are left unaffected thanks to the impermeability of your [pc.armor].");
			}
			else
			{
				output(" Her tongue caresses you, and you feel the lust inducing venom seep into your body.");
				applyDamage(new TypeCollection( { tease: 6 + rand(6) } ), this, target, "minimal");
			}
		}
		
		private function frogGirlKickAttackkkkkuuuuu(target:Creature):void
		{
			output("The frog girl kicks at you with a muscled leg.");
			if(combatMiss(this, target)) output(" The kick grazes your arm, but her slippery skin negates any damage it would’ve done.");
			else
			{
				output(" You take the hit, grunting at the force of her attack");
				if(target.shields() > 0) output(", though your shield flares brightly");
				output(".");
				
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		
		private function frogGirlBasicLustAttack(target:Creature):void
		{
			output("The amorous amphibian turns on her heel, leaning over and spreading her cheeks to give you a perfect view of her glistening cunt. <i>“There’s no need to fight, you can have this for free,”</i> she says teasingly.");
			if (target.willpower()/2 + rand(20) + 1 >= 18) output("\nYou manage to ignore the spectacle, much to the kerokoras’ disappointment.");
			else 
			{
				output("\nYou flush at her actions, shaking your head to clear the thoughts it brings up.");
			}
		}
		
		private function tongueLashAttack(target:Creature):void
		{
			output("The lusty frog girl licks across her body with her long tongue, moaning as the oral muscle slips over her netherlips. Without warning she lashes it at you, whipping it like a flail.");
			var damage:TypeCollection;
			//miss: 
			if (combatMiss(this, target)) output("\nThe tongue flies by you, smashing into a tree and eliciting a pained gasp from its owner.");
			else 
			{
				output("\nThe tip of her tongue slams into you, ");
				if(target.shields() > 0) 
				{
					output("and you are staggered by the force of the blow hitting your shield");
					
					damage = meleeDamage();
					damage.addFlag(DamageFlag.ONLY_SHIELD);
					damageRand(damage, 15);
					var damageResult:DamageResult = calculateDamage(damage, this, target);
					
					if (target.shieldsRaw > 0) output(". It holds.");
					else output(". Your shield is breached!");
					
					outputDamage(damageResult);
				}
				else if (target.hasAirtightSuit())
				{
					output("and you are slimed by her toxic saliva. Luckily your [pc.armor] is airtight enough to prevent any of the fluid from seeping into your [pc.skin], but you definitely feel the impact of the hit.");
					damage = meleeDamage();
					damageRand(damage, 5 + rand(5));
					var damageResult2:DamageResult = calculateDamage(damage, this, target);
					outputDamage(damageResult2);
				}
				else
				{
					output("and you feel the toxin in her saliva work its way into your body.");
					var dr2:DamageResult = applyDamage(new TypeCollection( { tease: 10 + rand(10) } ), this, target, "suppress");
					outputDamage(dr2);
				}
			}
		}
	}
}
