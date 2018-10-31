package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class CaptainKhorgan extends Creature
	{
		//constructor
		public function CaptainKhorgan()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Captain Khorgan";
			this.originalRace = "thraggen";
			this.a = "";
			this.capitalA = "";
			this.long = "Captain Khorgan cuts a truly impressive figure: a towering, muscular thraggen woman with a lengthy braid of red hair trailing down her back. Her impressive bust is barely restrained by the tatters of her corset, threatening to spill free at any moment. In one hand, the captain is clutching a force cutlass, a shimmering blue hardlight blade more than capable of shearing through steel; with the other, she clutches the remote detonator for the planet-cracking bomb you’ve been sent to disarm. She’s breathing hard, chest heaving: and not from exertion. Her stiff nipples are poking through the ruins of her corset, and you can see an ever-growing damp patch on her pants, as if she’s getting off on the fight!";
			this.customBlock = "She easily deflects your attack.";
			this.isPlural = false;

			//this.meleeWeapon = new RaskvelWrench();
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "cutlass";
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.attackNoun = "blade";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "sexy bodice";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			//this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 21;
			this.reflexesRaw = 19;
			this.aimRaw = 18;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 20;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 55;

			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = -20.0;
			baseHPResistances.burning.damageValue = 10.0;
			baseHPResistances.electric.damageValue = 10.0;
				
			this.level = 5;
			this.XPRaw = bossXP();
			this.credits = 987;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 85;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";
			this.furColor = "unknown";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "green";
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
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 55;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 2862;

			this.elasticity = 1.6;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			//Savin wasn't around so I just threw a # in.
			this.breastRows[0].breastRatingRaw = 10;
			this.nippleColor = "dark green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Khorgan";
			sexualPreferences.setRandomPrefs(3 + rand(3));

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "CAPTAIN_KHORGAN";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(HP()/HPMax() * 100 < rand(100) - 30) gettingOffOnZePain(target);
			else if(rand(4) == 0) captainCutlassAttk(target);
			else if(rand(3) == 0) roundHouseKickFromCapn(target);
			else if(rand(2) == 0) crotchFaceSmash(target);
			else motorboatedByASpork(target);
		}
		
		private function gettingOffOnZePain(target:Creature):void
		{
			output("The captain heaves a heavy, husky sigh, her breathing less hard as it is a throaty panting. Putting some distance between the two of you, she cups one of her huge green tits through the sheer, tattered fabric of her corset, teasing the pert nipple beneath it. It’s almost like the more you hurt her, the more excited she gets.");
			output("\n\nGrinning she says, <i>“Come on, Steele... still not too late to surrender. If you keep up the foreplay, though, I don’t know what I might do...”</i>");
			HP(25);
			lust(5+rand(3));
			target.lust(2);
		}
		
		private function motorboatedByASpork(target:Creature):void
		{
			output("You find your guard battered down by a rapid-fire series of sword swipes, only for the captain to grab you by the shoulders and force your head into the gulf of her ample cleavage, burying your [pc.face] between her massive tits.");
			//Success: 
			if(target.willpower() + rand(20) + 1 < 25)
			{
				output("\n\nYou try to resist, but the sensation of being trapped in a jiggling sea of boobflesh is almost too good to fight back against. You only just keep yourself from grabbing Khorgan’s tits and taking out your own mounting lust on those big, perfect green orbs.");
				applyDamage(new TypeCollection( { tease: 7 + rand(3) } ), this, target, "minimal");
			}
			//Failure:
			else output("\n\nYou shove the captain back before she can get too into rubbing you down with her tits, leaving her almost popping out of her corset as you try and recover your footing.");
		}
		
		private function crotchFaceSmash(target:Creature):void
		{
			output("Amid a flurry of sword-swings, Captain Khorgan reaches out, grabbing your head and forcing you to your [pc.knees] with a mighty grunt. You give a gasp as your [pc.face] is thrust into the growing damp patch on her crotch, put face to face with her burning battle-lust.");
			//Success:
			if(target.willpower() + rand(20) + 1 < 20)
			{
				output("\n\nYou shudder as the potent, earthy smell of the captain’s arousal washes over you, smearing across your face through the the fabric of her pants. You try to deny it, but there’s a powerful heat starting to spread through your loins before she releases you.");
				applyDamage(new TypeCollection( { tease: 15 } ), this, target, "minimal");
			}
			else 
			{
				output("\n\nYou hold your breath, trying not to think too hard around the overzealous thraggen warrior trying to pelvic-thrust you into submission. Finally, with a feral grunt, you shove the captain off and resume your battle stance.");
				applyDamage(new TypeCollection( { tease: 2 } ), this, target, "minimal");
			}
		}
		
		private function captainCutlassAttk(target:Creature):void
		{
			output("The captain rushes at you, swinging her force cutlass in a brutal arc. You dodge the blow, but find another heading toward you almost immediately, trying to get through your still-staggered guard.");
			//If Miss:
			if(combatMiss(this, target)) output(" You deftly parry the strike!");
			else 
			{
				output("\n\nThe strike connects! You wince in pain as the force blade leaves a gloaming cut across your chest.");
				
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function roundHouseKickFromCapn(target:Creature):void
		{
			output("You parry a few sword-strokes, but find yourself pushed back by the captain’s unrelenting flurry of blows. Suddenly, one of her swings turns into a high feint, unbalancing you as she spins into a kick aimed right at your [pc.chest].");
			//If Miss: 
			if(combatMiss(this, target) || target.isPlanted()) output("\n\nYou grab the captain’s foot a hand’s breadth from your chest, stopping her in her tracks. Her face contorts in surprise before you fling her back, leaving her rolling in the dust -- and giving you a moment to breathe.");
			//If Hit:
			else
			{
				output("\n\nYou grunt as the kick connects, throwing you back ");
				if(!target.hasStatusEffect("Tripped") && target.reflexes() + rand(20) + 1 < 25)
				{
					CombatAttacks.applyTrip(target);
					output("onto your back!");
				}
				else output(".");
				output(" Oof!");
				
				applyDamage(new TypeCollection( { kinetic: 4 } ), this, target);
			}
		}
		
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return (kGAMECLASS.flags["KHORGAN_GAST_PREG_TIMER"] != undefined);
		}
	}
}