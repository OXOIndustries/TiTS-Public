package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Accessories.FlashGoggles;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.*;
	
	public class ZilFemale extends Creature
	{
		//constructor
		public function ZilFemale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "female zil";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The zil girl tumbles out of the way with a swift contortion.";
			this.customBlock = "The zil’s chitinous armor deflects your attack.";
			this.isPlural = false;
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 2;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 4;
			this.HPRaw = this.HPMax();


			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 66;
			this.thickness = 45;
			this.tone = 40;
			this.hairColor = "black";
			this.scaleColor = this.scaleColor;
			this.furColor = "yellow";
			this.hairLength = 22;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
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
			this.wingType = 0;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_BEE;
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
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].type = GLOBAL.TYPE_BEE;
			this.vaginas[0].vaginaColor = "black and gold";
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 0;
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

			this.breastRows[0].breastRatingRaw = 3;
			this.nippleColor = "black";
			this.milkMultiplier = 100;
			this.milkFullness = 100;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Disarm Immune");
			this.createPerk("Appearance Enabled");
			
			isUniqueInFight = true;
			btnTargetText = "ZilFemale";
			sexualPreferences.setRandomPrefs(5 + rand(3));
			
			if(rand(10) == 0) inventory.push(new PrimitiveBow());
			else if (rand(3) == 0) inventory.push(new ZilHoney());
			else inventory.push(new ZilRation());

			kGAMECLASS.mhengaSSTDChance(this);
			
			Randomize();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ZILFEMALE";
		}
		
		private function Randomize():void
		{
			if(rand(3) == 0) hairColor = "blonde";
			
			long = "The female zil stands just shy of 5\'6\", and is covered from head to toes in shiny black chitin. A downy fuzz falls from her head down to her shoulders, resembling curly " + hairColor + " hair. She’s got dozens of sharp darts on her belt, noticeably discolored with chemicals, and a number of glass vials at hand full of who-knows what. Worse, she’s got a full bee-like abdomen behind her with a deadly-looking stinger. She moves with a liquid, feline grace, assuming a combat stance that leaves her crotch pointed at you to fill the air with lusty pheromones as her perky tits jut out at you, bobbing from side to side enticingly.";
		}
		public function pumpkingIt():void
		{
			isUniqueInFight = false;
			this.rangedWeapon = new LaserCarbine();
			this.inventory = [];
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		
		override public function setDefaultSexualPreferences():void
		{
			sexualPreferences.clearPrefs();
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			if(this.rangedWeapon is LaserCarbine)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target);
			}
			else
			{
				if (flags["HIT_A_ZILGIRL"] != undefined) 
				{
					flags["HIT_A_ZILGIRL"] = undefined;
					zilFemSting(target);
				}
				else if(rand(4) == 0) lustBangOut(target);
				else if((HP()/HPMax()) < 0.5 && rand(4) == 0) zilFemSting(target);
				else if(rand(4) == 0) pheromoneFanFromZilFemale(target);
				else if(rand(3) == 0) zilFemaleDartThrow(target);
				else if(rand(2) == 0) flurryOfFemBlows(target);
				else zilFemHarden(target);
			}
		}
		
		private function zilFemHarden(target:Creature):void
		{
			author("Savin");
			//Buffs kinetic defenses?
			output("Closing her onyx eyes, the zil flexes, and you hear quiet, barely audible cracks filling the busy, woodland air. You peer closer and realize that the zil’s carapace seems shinier, and perhaps a bit more formidable... just barely thicker, somehow.");
			
			var newRes:Number = (100 - baseHPResistances.kinetic.resistanceValue) / 5;
			baseHPResistances.kinetic.resistanceValue += newRes;
			createStatusEffect("Harden", 0, 30, 0, 0, false, "DefenseUp", "Defense against all forms of attack has been increased!", true, 0);
		}
		
		private function zilFemSting(target:Creature):void
		{
			author("Savin");
			//Counter-melee / last resort. Light physical,medium lust, slows victim
			output("Leaping at you, the zil girl spins around and dives ass-first toward you, her deadly stinger on full display!");
			
			// standard dodge/miss messages
			if (combatMiss(this, target))
			{
				output(" You avoid it at the last moment!");
			}
			else 
			{
				if(target.shieldsRaw > 0) output(" She isn’t moving fast enough to trigger your shield, slipping right on through.");
				output(" The stinger punches through your ");
				if(target.armor.shortName != "") output(target.armor.longName + " and [pc.skin]");
				else output("[pc.skin]");
				output(", pumping a thick load of some kind of chemical into you. You feel hot and flustered in seconds, blushing hard as your loins burn. Your whole body feels like it’s in a haze....");
				target.changeLust(15);
				if (target.hasStatusEffect("Zil Sting")) 
				{
					target.addStatusValue("Zil Sting",1,4);
				}
				else target.createStatusEffect("Zil Sting",4,0,0,0,false,"Poison","Reduces speed and increases libido.",false,55+rand(10),0xFF0000);
				target.reflexesMod -= 4;
				target.libidoMod += 4;
			}
		}
		
		private function flurryOfFemBlows(target:Creature):void
		{
			author("Savin");
			output("The zil launches a barrage of darts in your direction!\n");
			
			for (var i:int = 0; i < 3; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
		}
		
		private function lustBangOut(target:Creature):void
		{
			output("The zil girl dances away from you, just out of reach before grabbing one of the vials off her belt and throwing it at the ground just in front of you!");
	
			// Airtight check
			if(target.hasAirtightSuit())
			{
				output(" You attempt to dodge but the vial shatters, exploding in a pink cloud that blows over you. Fortunately for you, your airtight [pc.armor] refuses to allow the gas to seep in. The permeating lust cloud floats about, affecting the bee lady to a small degree.");
				lust(1);
			}
			else
			{
				//If Speed is higher and passes check:
				if(target.reflexes() + rand(20) + 1 > 15) {
					output(" You leap out of the way, rolling to the side as a pink haze envelopes the ground where you were standing a moment before. Though even at this distance, your skin tingles sensually...");
					target.changeLust(1);
				}
				//If Toughness is higher and passes check:
				if(target.physique() + rand(20) + 1 > 20) {
					output(" You cover your face behind your arms as the glass shatters. You cough and wheeze as a pink mist rolls around you, but quickly hold your breath as a your skin tingles lustily...")
					target.changeLust(2);
				}
				//Else if failed the check: 
				else {
					output(" You cry out as the vial shatters, exploding in a pink cloud that blows over you. You gag and cough and suddenly your hands are reaching to your crotch as if on their own. You yank back, but feel a hot haze washing across your exposed body. What the hell is this stuff?");
					target.changeLust(5);
					/* FEN NOTE: Cut as per Savin's request.
					//PC must pass an willpower check, else:
					if(!target.hasStatusEffect("Blinded"))
					{
						if(target.accessory is FlashGoggles) output("\n\nFortunately, your goggles shield your eyes from the pink cloud and you avoid being blinded!");
						else if(target.hasBlindImmunity()) output("\n\nFortunately, your eyes are unaffected by the pink cloud and you avoid being blinded!");
						else if(target.willpower() + rand(20) + 1 < 20) {
							output("\n\nSuddenly, you realize that in the wake of the pink cloud, your vision’s collapsed to just a few feet in front of you, and the zil girl is nowhere to be seen. You desperately rub at your eyes, but that only serves to make them burn as the lust-cloud sticks to your [pc.skin]. Oh, shit, <b>you’re blinded</b>!");
							CombatAttacks.applyBlind(target,rand(3) + 1 );
						}
					}*/
				}
			}
		}
		
		private function zilFemaleDartThrow(target:Creature):void
		{
			author("Savin");
			//Light physical + light poison damage/ DOT
			output("Pursing her black lips in anger, the zil girl leans back and lets fly with a red-tipped dart, sending it right at you!");
			// standard dodge/miss messages
			if (combatMiss(this, target)) 
			{
				output("\nYou twist to avoid the dart!");
			}
			//It hits!
			else 
			{
				var damage:TypeCollection = damage(true);
				damage.add(physique() / 2);
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				if (damageResult.shieldDamage > 0)
				{
					if (damageResult.hpDamage == 0) output(" The dart spangs uselessly off your shields!");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached."); 
				}
				
				if (damageResult.hpDamage > 0)
				{
					output(" The dart punches right through your ");
					if(!(target.armor is EmptySlot)) output(target.armor.longName);
					else output("[pc.skinFurScales]");
					output(" with surprising ease, and your [pc.skin] suddenly flushes, burning as whatever she coated this dart with boils your blood!");
					damageResult.lustDamage += 10;
					target.lust(10);
				}
				
				outputDamage(damageResult);
			}
		}
		
		private function pheromoneFanFromZilFemale(target:Creature):void
		{
			author("Savin");
			output("Suddenly, the zil girl drops her combat stance, and dips her fingers right into her honeypot, masturbating furiously.");
			if(target.hasAirtightSuit())
			{
				output(" You wonder what the hell she’s doing, but judging by the look on her face, she is being assaulted by a potent cloud of her own sex pheromones!");
				output("\n\nLuckily your [pc.armor] is airtight, so you don’t have to worry about being affected by it - but you can see <i>she</i> definitely is!");
				changeLust(8);
			}
			// Moderate toughness check pass
			else if(target.physique() + rand(20) + 1 > 20) {
				output(" You wonder what the hell she’s doing, but suddenly your senses are assaulted by a potent cloud of her sex pheromones!");
				output("\nYou hold your breath as long as you can, waving the lusty cloud away from you. Before long, the zil girl tires out, nearly cumming before she stumbles back with chest heaving. There’s a thick scent of sex in the air by the time you breathe again...");
				changeLust(5);
				target.changeLust(5);
			}
			else {
				output(" You wonder what the hell she’s doing, but suddenly your senses are assaulted by a potent cloud of her sex pheromones!");
				output("\nEventually, you can hold your breath no longer, and you’re forced to inhale the potent cloud deep into your lungs. Your heart hammers in your chest faster and faster while your [pc.skin] flushes and your lips unconsciously purse.");
				if(target.lust() < 33) output(" A tingling warmth in your crotch leaves no doubts as to the effectiveness of your alien foe’s ‘attack’.");
				else if(target.lust() <= 66) output(" The warm, incessantly building heat in your loins is getting hotter and hotter with every breathe you take.");
				else
				{
					output(" Your crotch feels so hot that you know you just HAVE to touch her soon. Damn this woman and her stupid... sexy... beautiful alien body.");
				}
				target.changeLust(10+target.libido()/10);
			}
		}
	}
}
