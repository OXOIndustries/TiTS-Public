package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Rock;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
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
			this.isPlural = false;
			
			isLustImmune = true;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 5;
			meleeWeapon.baseDamage.addFlag(DamageFlag.CRUSHING);
			this.meleeWeapon.attack = 5;
			this.meleeWeapon.longName = "tentacle";
			this.meleeWeapon.attackVerb = "smack";
			this.meleeWeapon.attackNoun = "smack";
			this.meleeWeapon.hasRandomProperties = true;

			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.attackNoun = "buckshot";
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
			
			this.level = 4;
			this.XPRaw = normalXP();
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
			
			isUniqueInFight = true;
			btnTargetText = "Sexbot";

			randomise();
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return mf("SEXBOT_MALE", "SEXBOT_FEMALE");
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(2 + rand(3));
			credits = 200 + rand(200);
			
			//Male or female configuration
			var manbot:Boolean = false;

			//Chance sets base % of getting a dudebot
			var chance:int = 50;
			//Pure dude? 25% chance of dude
			if (kGAMECLASS.pc != null)
			{
				if(kGAMECLASS.pc.hasCock() && !kGAMECLASS.pc.hasVagina()) chance = 25;
				//Dude with a cunt? 50% chance
				else if(kGAMECLASS.pc.hasCock()) chance = 50;
				//Just a cunt? 75%!
				else if(kGAMECLASS.pc.hasVagina()) chance = 75;
				//Neuter? 50/50
				else chance = 50;
			}

			//Factory settings override base chance
			if(kGAMECLASS.flags["SEXBOTS_GENDER_SETTING"] == 1) chance = 90;
			else if(kGAMECLASS.flags["SEXBOTS_GENDER_SETTING"] == -1) chance = 10;

			//Now run chance!
			manbot = (rand(100) < chance)

			//Second meeting is opposite gender of first.
			if(kGAMECLASS.flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined && flags["MET_SEXBOT_FEMALE_ON_TARKUS"] == undefined) manbot = false;
			if(kGAMECLASS.flags["MET_SEXBOT_MALE_ON_TARKUS"] == undefined && flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined) manbot = true;

			//Female bot:
			if(!manbot)
			{
				long = "The sexbot stands 6’ tall, made taller still by the high heels it has formed around its feet. The gray fiber cable which forms the core of its adaptable body is padded with silicone and plated by a sheer white latex coating, gleaming wetly as it moves and catches the light. It serves to highlight its alluring curves: its thick thighs and high, round bum, its thin waist and firm, D-cup boobs with their defined nipples almost believably bursting through its latex; it all combines to create a vision of impossible feminine perfection. Framed by its white, plastic bob cut its synthetic face is thin, calm, blandly beautiful, the smile curling its full lips small and confident. If it had tan skin and its eyes weren’t a backlit, flickering green it could have stepped fully formed from a lingerie advert. Entirely at odds to its calm, benign appearance, the four fibrous, flexible robo-tentacles the sexbot has sprouted out of its back circle their rubber-tipped grippers above its head, grabbing and clutching the air restlessly.";
				hipRatingRaw = 14;
				buttRatingRaw = 14;
				hairLength = 12;
				femininity = 100;
				breastRows[0].breastRatingRaw = 6;
				createVagina();
				vaginas[0].wetness(3,true);
				vaginas[0].looseness(2,true);
				vaginas[0].vaginaColor = "black";
			}
			else
			{
				long = "The sexbot stands 6’ tall. The gray fiber cable which forms the core of its adaptable body is padded with silicone and plated by a sheer white latex coating, gleaming wetly as it moves and catches the light. It serves to highlight its fit, supple body: its ropey, hard-looking hips and waist, its pert bum and the slight suggestions of ripples and plateaus of muscle underneath its latex combine to create a vision of beguiling, skilfully understated masculinity. This subtlety is rather undermined by the thick, white 8 inch penis which swings bluntly between its swimmer’s thighs; it pulses occasionally with a warm, red light. Framed by its spiky, plastic haircut its synthetic face is defined, calm, blandly beautiful, the smile curling its full lips small and confident. If its skin was tan and its eyes weren’t a backlit, flickering green it could have stepped fully formed from a deodorant advert. Entirely at odds to its calm, benign appearance, the four fibrous, flexible robo-tentacles the sexbot has sprouted out of its back circle their rubber-tipped grippers above its head, grabbing and clutching the air restlessly.";
				createCock();
				cocks[0].cLength(9,true);
				hipRatingRaw = 2;
				buttRatingRaw = 2;
				hairLength = 2;
				femininity = 0;
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Shield Recharge")) 
			{
				shieldRegeneration(target);
				return;
			}
			if(!target.hasStatusEffect("Grappled") && target.shields() <= 0 && CombatManager.getRoundCount() % 5 == 0)
			{
				grappleWithASexbot(target);
				return;
			}
			if(target.hasStatusEffect("Grappled"))
			{
				grappleWithASexbot(target);
				return;	
			}
			var choices:Array = new Array();
			//Electropulse
			//(Procs if PC still has shields)
			if (target.shields() > 0) 
			{
				choices[choices.length] = sexBotElectropulseAttack;
				choices[choices.length] = sexBotElectropulseAttack;
			}
			//Disable ranged weapon
			//(Procs if PC does not have shields and has fired at the sexbot)
			if(!target.rangedWeapon is Rock && !target.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON) && !target.hasStatusEffect("Gunlock")) choices[choices.length] = disablePCGunz;
			//Recharge shield
			//(Procs if Sexbot has lost shields)
			if(shields() <= 0) choices[choices.length] = shieldRegeneration;
			//Hack drone
			//(Procs if PC has a drone)
			if(target.hasPerk("Attack Drone") && target.shields() > 0 && !target.hasStatusEffect("Porno Hacked Drone") && !target.hasTamWolf()) choices[choices.length] = getDroneHacked;
			//Standard attack
			choices[choices.length] = standardRobosexualAttack;
			choices[choices.length] = standardRobosexualAttack;

			//Pick one to run!
			choices[rand(choices.length)](target);
		}
		
		private function grappleWithASexbot(target:Creature):void
		{
			author("Nonesuch");
			if(target.hasStatusEffect("Grappled"))
			{
				output("You grit your teeth as your ");
				if(target.hasCock())
				{
					output("[pc.cocks] strain");
					if(target.cockTotal() == 1) output("s");
				}
				else
				{
					output("[pc.vaginas] moisten");
					if(target.cockTotal() == 1) output("s");
				}
				output(" eagerly to the warm, seeking vibrations of the tentacle attached to your groin.");
				applyDamage(new TypeCollection( { tease: 5 + rand(5) } ), this, target, "minimal");
			}
			else
			{
				output("<i>“Beginning foreplay routine,”</i> drones the sexbot, its soothing tone entirely at odds to its tentacles’ feverish actions, wrapping themselves around you, trying to curl around your limbs and body lock you.");
				//Fail: 
				if(target.reflexes()/2 + rand(20) + 1 == 15)
				{
					output("\n\nYou manage to thrash your way out of its grip before it can pin you.");
				}
				//Succeed: 
				else
				{
					output("\n\nTwo strong, synthetic cables pin your arms to your side whilst another pulls tight around your waist. Your lash out desperately with your [pc.legOrLegs] but you cannot stop the sexbot’s remaining tentacle slowly ");
					if(target.isCrotchGarbed()) output("burrowing through your [pc.lowerGarments] and laying its soft rubber grip upon your ");
					if(target.hasCock()) output("[pc.cocks]");
					else output("[pc.vaginas]");
					output(". You groan in frustration as with a buzz it begins to vibrate, sending delicious sensation throbbing through your ");
					if(target.hasCock() || !target.hasClit()) output("groin");
					else output("[pc.clits]");
					output(".");

					output("\n\n<i>“You are encouraged to struggle as hard as you can,”</i> says the sexbot, green eyes glittering as it forcibly masturbates you. <i>“This unit prides itself on its bondage sub-routine, crash tested upon more than two hundred sentient beings to ensure every client may experience true helplessness.”</i>");
					applyDamage(new TypeCollection( { tease: 10 + rand(5)}), this, target, "minimal");
					target.createStatusEffect("Grappled",0,35,0,0,false,"Constrict","You're pinned in a grapple.",true,0);
				}
			}
		}
		
		private function standardRobosexualAttack(target:Creature):void
		{
			author("Nonesuch");
			output("Making a series of violent clacks and breathy sounds, the sexbot whips out its tentacles out at you, ");
			if(target.shields() > 0) output("beating with the relentlessness of a machine against your shield.\n");
			else output("snapping at pressure points on your throat and groin, aiming to weaken and drain you.\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, false);
		}
		
		private function getDroneHacked(target:Creature):void
		{
			author("Nonesuch");
			output("<i>“Empatrons are always pleased to see a friend you have brought along to share in the fun,”</i> the sexbot sighs, its flickering green gaze turning to your floating drone. “Stand by while I reconfigure it for optimum enjoyment.” Your robot buddy shudders and rolls in the air as the rogue droid attempts to take control of it.");
			//Fail: 
			if(rand(20) + 1 + target.intelligence()/2 < 12)
			{
				output("\n\nYou breathe a sigh of relief as your drone successfully fights off the outside interference and rights itself.");
			}
			//Success: 
			else
			{
				output("\n\nYour drone rights itself... and then turns itself to you, green light beaming out of its optical sensors. Images flicker all around it, endlessly changing images of soft flesh, breasts, ass, bulging phalluses, pink on pink, pink on brown, blue on mauve.... It’s accompanied with the moans, grunts and slurps of the extranet porn it is now helplessly streaming and projecting in ways you never thought it had the capacity to do. You bat it away, irritated, and it immediately flies back. It hovers near your shoulder, forcing the sounds and images into your head.");
				output("\n\n<i>“I hope you enjoy this taster, insert name here.”</i> The voice of the sexbot surfs calmly to you over a chorus of gleeful squeals and orgasmic groans.");
				target.createStatusEffect("Porno Hacked Drone", 2 + rand(3), 0, 0, 0, false, "Charmed", "Your drone has been hacked to broadcast porn at you! You'll have to wait for your programming to overcome the rogue process. Hopefully it won't take too long!", true, 0);
			}
		}
		
		private function shieldRegeneration(target:Creature):void
		{
			author("Nonesuch");
			//Round 1:
			if(!hasStatusEffect("Shield Recharge"))
			{
				output("The sexbot chatters and whirrs quietly to itself, then its eyes go dark and its limbs limp. Its background hum intensifies however, and you suspect it’s up to something");
				if(target.characterClass == GLOBAL.CLASS_ENGINEER) output(", probably diverting all available processing power and energy into recharging its shield. You should try and hit it with everything you’ve got before it can do so");
				output(".");
				createStatusEffect("Shield Recharge",1,0,0,0);
			}
			//Round 2:
			else if(statusEffectv1("Shield Recharge") == 1)
			{
				output("The sexbot continues to do nothing but hum ominously to itself.");
				addStatusValue("Shield Recharge",1,1);
			}
			//Round 3:
			else
			{
				output("The sexbot shudders back into life, its green eyes flickering back on. You notice with a sinking heart that its kinetic shield has also snapped and fizzed back into life.");
				shieldsRaw = shieldsMax();
				output("\n\n<i>“I apologise for the momentary downtime, insert name here,”</i> the wretched robot says sweetly. <i>“And for any loss of arousal it may have caused you.”</i>");
				removeStatusEffect("Shield Recharge");
			}
		}
		
		private function disablePCGunz(target:Creature):void
		{
			author("Nonesuch");
			output("<i>“Whilst this unit is fully equipped to deal with more vigorous forms of sexual congress,”</i> the sexbot drones, <i>“You are asked not to bring live weapons into our fun, insert name here. You are encouraged to continue firing your gun at me after I have switched it off if doing so arouses you.”</i> It flicks a hand at you, your " + target.rangedWeapon.longName + " shuddering as it is hit by the VI’s attempt to electronically lock it.");
			target.createStatusEffect("Gunlock",0,0,0,0,false,"Blocked","Your ranged weapon has been temporarily disabled. It should resume normal function once you get away from your foe.",true,0);
		}
		
		private function sexBotElectropulseAttack(target:Creature):void
		{
			author("Nonesuch");
			output("<i>“Electronic shielding devices may disrupt my scanning software, impairing my ability to properly pleasure you,”</i> says the sexbot, in a tone of infinite patience. <i>“Please switch all such devices off.”</i> It points a finger at you and with a sharp crack connects it to your shield with a momentary, searing white bolt of static.");
			
			var damage:TypeCollection = new TypeCollection( { electric: 15 }, DamageFlag.ONLY_SHIELD );
			damageRand(damage, 15);
			var damageResult:DamageResult = calculateDamage(damage, this, target);
			
			// TODO: Apply only to shields...
			
			if (damageResult.shieldDamage > 0)
			{
				if (target.shieldsRaw > 0) output(" Your shield crackles but holds.");
				else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
			}
			
			outputDamage(damageResult);	
		}
	}
}
