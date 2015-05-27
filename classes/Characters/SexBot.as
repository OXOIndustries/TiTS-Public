package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class SexBot extends Creature
	{
		//constructor
		public function SexBot()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "sex bot";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customBlock = "Your attack fails to damage the 'bot.";
			this.plural = false;
			
			isLustImmune = true;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 5;
			meleeWeapon.baseDamage.addFlag(DamageFlag.CRUSHING);
			this.meleeWeapon.attack = 5;
			this.meleeWeapon.longName = "tentacle";
			this.meleeWeapon.attackVerb = "smack";
			this.meleeWeapon.hasRandomProperties = true;

			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "latex";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ImprovisedShield();

			this.physiqueRaw = 15;
			this.reflexesRaw = 15;
			this.aimRaw = 15;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 15;
			this.libidoRaw = 75;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 30;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.XPRaw = 250;
			this.level = 4;
			this.credits = 100;
			this.HPMod = -10;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "red";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
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
			this.vaginas = new Array();

			this.timesCum = 999999;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			//this.fertilityRaw = 0;
			this.createStatusEffect("Infertile");
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "light blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 10;
			
			this._isLoading = false;
		}
				
		override public function prepForCombat():void
		{
			var combatSexbot:SexBot = this.makeCopy();
			
			kGAMECLASS.setLocation("FIGHT:\nSEXBOT", "PLANET: TARKUS", "SYSTEM: REDACTED");
			combatSexbot.sexualPreferences.setRandomPrefs(2 + rand(3));
			
			//Determine armor sizes
			combatSexbot.credits = 200+rand(200);

			// Codex shit
			CodexManager.unlockEntry("Sexbot");


			//Male or female configuration
			var manbot:Boolean = false;

			//Chance sets base % of getting a dudebot
			var chance:int = 50;
			//Pure dude? 25% chance of dude
			if(kGAMECLASS.pc.hasCock() && !kGAMECLASS.pc.hasVagina()) chance = 25;
			//Dude with a cunt? 50% chance
			else if(kGAMECLASS.pc.hasCock()) chance = 50;
			//Just a cunt? 75%!
			else if(kGAMECLASS.pc.hasVagina()) chance = 75;
			//Neuter? 50/50
			else chance = 50;

			//Factory settings override base chance
			if(kGAMECLASS.flags["SEXBOTS_GENDER_SETTING"] == 1) chance = 90;
			else if(kGAMECLASS.flags["SEXBOTS_GENDER_SETTING"] == -1) chance = 10;

			//Now run chance!
			manbot = (rand(100) < chance)
			//Female bot:
			if(!manbot)
			{
				kGAMECLASS.userInterface.showBust("SEXBOT_FEMALE");
				combatSexbot.long = "You are fighting a sexbot. It stands 6’ tall, made taller still by the high heels it has formed around its feet. The grey fibre cable which forms the core of its adaptable body is padded with silicone and plated by a sheer white latex coating, gleaming wetly as it moves and catches the light. It serves to highlight its alluring curves: its thick thighs and high, round bum, its thin waist and firm, D-cup boobs with their defined nipples almost believably bursting through its latex; it all combines to create a vision of impossible feminine perfection. Framed by its white, plastic bob cut its synthetic face is thin, calm, blandly beautiful, the smile curling its full lips small and confident. If it had tan skin and its eyes weren’t a backlit, flickering green it could have stepped fully formed from a lingerie advert. Entirely at odds to its calm, benign appearance, the four fibrous, flexible robo-tentacles the sexbot has sprouted out of its back circle their rubber-tipped grippers above its head, grabbing and clutching the air restlessly.";
				combatSexbot.hipRatingRaw = 14;
				combatSexbot.buttRatingRaw = 14;
				combatSexbot.hairLength = 12;
				combatSexbot.femininity = 100;
				combatSexbot.breastRows[0].breastRatingRaw = 6;
				combatSexbot.createVagina();
				combatSexbot.vaginas[0].wetness(3,true);
				combatSexbot.vaginas[0].looseness(2,true);
				combatSexbot.vaginas[0].vaginaColor = "black";
			}
			else
			{
				kGAMECLASS.userInterface.showBust("SEXBOT_MALE")
				combatSexbot.long = "You are fighting a sexbot. It stands 6’ tall. The grey fibre cable which forms the core of its adaptable body is padded with silicone and plated by a sheer white latex coating, gleaming wetly as it moves and catches the light. It serves to highlight its fit, supple body: its ropey, hard-looking hips and waist, its pert bum and the slight suggestions of ripples and plateaus of muscle underneath its latex combine to create a vision of beguiling, skilfully understated masculinity. This subtlety is rather undermined by the thick, white 8 inch penis which swings bluntly between its swimmer’s thighs; it pulses occasionally with a warm, red light. Framed by its spiky, plastic haircut its synthetic face is defined, calm, blandly beautiful, the smile curling its full lips small and confident. If its skin was tan and its eyes weren’t a backlit, flickering green it could have stepped fully formed from a deodorant advert. Entirely at odds to its calm, benign appearance, the four fibrous, flexible robo-tentacles the sexbot has sprouted out of its back circle their rubber-tipped grippers above its head, grabbing and clutching the air restlessly.";
				combatSexbot.createCock();
				combatSexbot.cocks[0].cLength(9,true);
				combatSexbot.hipRatingRaw = 2;
				combatSexbot.buttRatingRaw = 2;
				combatSexbot.hairLength = 2;
				combatSexbot.femininity = 0;
			}
			kGAMECLASS.foes.push(combatSexbot);
		}
	}
}