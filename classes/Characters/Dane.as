package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.DecentShield;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class Dane extends Creature
	{	
		//constructor
		public function Dane()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Dane";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Dane stands tall; he's nearly eight feet of powerful, corded muscle. His most obvious feature is his quartet of arms. Evidently, the ausar has turned to genetic modifications for his enhanced stature. His fur is so white it practically glows, and his ivory hair is tied back in a short ponytail. His eyes are red too, marking him as an albino. In his upper arms, Dane wields a pair of electrified cutlasses, and in his lower ones, he's gripping a matched set of powder pistols. A lightweight set of high-tech armor guards his chest and thighs.";
			this.customDodge = "Dane casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.hasRandomProperties = true;
			
			meleeWeapon.baseDamage.electric.damageValue = 3;
			
			this.rangedWeapon = new HammerPistol();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			
			rangedWeapon.baseDamage.kinetic.damageValue = 3;
			
			this.armor.longName = "armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new DecentShield();
			
			this.level = 3;
			this.physiqueRaw = 8;
			this.reflexesRaw = 12;
			this.aimRaw = 6;
			this.intelligenceRaw = 11;
			this.willpowerRaw = 9;
			this.libidoRaw = 35;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.XPRaw = bossXP();
			
			this.credits = 1200;
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "crimson";
			this.tallness = 95;
			this.thickness = 75;
			this.tone = 85;
			this.hairColor = "white";
			this.scaleColor = "white";
			this.furColor = "white";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 1549;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pale pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			this.inventory.push(new ShockBlade());
			this.createPerk("Multiple Attacks",1,0,0,0,"");
			this.createPerk("Multiple Shots",1,0,0,0,"");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Dane";
			setDefaultSexualPreferences();
			//kGAMECLASS.mhengaSSTDChance(this);
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "DANE";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,					GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,					GLOBAL.KINDA_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(target.hasStatusEffect("Grappled"))
			{
				if(target.statusEffectv3("Grappled") == 0) daneCrotchSmother(target);
				else daneLickitongue(target);
			}
			//Headbutt - every fifth round until out of energy
			else if(CombatManager.getRoundCount() % 5 == 0 && energy() >= 25)
			{
				//As the PC attack
				CombatAttacks.HeadbuttImpl(alliedCreatures, hostileCreatures, this, target);
				energy( -25);
			}
			else if(CombatManager.getRoundCount() % 7 == 0)
			{
				daneGrappleAttack(target);
			}
			else if(rand(2) == 0 && energy() >= 25)
			{
				daneCrossSlashAttack(target);
				energy(-25);
			}
			else daneQuadStrike(target);
		}
		
		private function daneCrossSlashAttack(target:Creature):void
		{
			output("Dane reaches high with both swords and brings them down crossways simultaneously!");
			//Miss
			if(combatMiss(this, target)) output("\nYou duck under the swings.");
			//Hit
			else
			{
				output("\nThe blades hit you while crossed in a perfect 'x'!");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(3);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function daneLickitongue(target:Creature):void
		{
			if(target.hasAirtightSuit())
			{
				output("You feel something warm and wet rub and press against your [pc.crotch]. Dane's tongue tries to get at your nethers but your airtight [pc.armor] prevents that from happening.");
			}
			else
			{
				output("You feel something warm and wet ");
				if(!target.isNude()) output("worm past your [pc.lowerGarments] to ");
				output("lick your [pc.crotch]. It flutters around expertly, ");
				var choices:Array = new Array();
			
				if(target.hasCock()) choices[choices.length] = 0;
				if(target.hasVagina()) choices[choices.length] = 1;
				if(target.balls > 0) choices[choices.length] = 2;
				if(choices.length == 0) choices[choices.length] = 3;
			
				var select:int = choices[rand(choices.length)];
				if(select == 0) output("paying special attention to [pc.oneCock]. It loops about it, tugging and sliding, forcing you to feel incredible pleasure.");
				else if(select == 1) output("diving right into [pc.oneVagina]. Thrusting in and out, it slides and licks across every inner fold, driving you wild with desire.");
				else if(select == 2) output("lovingly polishing your [pc.balls] before sliding over your taint to your [pc.asshole]. There, it busily rims you, sometimes even sliding an inch inside your asshole.");
				else output("diving right into rimming your asshole. The thick intruder feels so wet and lewd that you can't help but offer up hot little pants of encouragement.");
				output(" Dane's tongue feels amazing.");
				target.changeLust(20+rand(10));
				if(target.lust() >= target.lustMax()) output("\n\nYou start begging him to fuck you, unable to hold back. Withdrawing that wonderful slab of flesh from your crotch, Dane drops you, laughing heartily. <i>“So be it.”</i>");
			}
		}
		
		private function daneCrotchSmother(target:Creature):void
		{
			output("Dane takes advantage of the grapple to flip you around, suspending you upside down at crotch level. One of his hands pulls open the bottom of his armor to expose his crotch; you can't tell which, he seems like he's all hands from your current position. A hard, red dog-cock is there, sticking out of a narrow slit. Meanwhile his hands roam over your body, busily fondling and rubbing. It feels and smells better than it has any right to.");
			output("\n\n<i>“Ready to give in yet? I've got something special to show you.”</i>");
			target.changeLust(5+rand(7));
			if(target.lust() >= target.lustMax()) output("\n\nYou nod, moaning in overwhelming lust.\n\nDane drops you. <i>“Good " + target.mfn("boy","girl","pet") + ".”</i>");
			target.addStatusValue("Grappled",3,1);
		}
		
		private function daneGrappleAttack(target:Creature):void
		{
			output("Charging forward, Dane sheaths his weapons simultaneously. His arms come open, open-palmed and grabbing for you!");
			//Miss
			if(combatMiss(this, target)) output("\nYou twist out of the way of his four-armed grapple in the nick of time. The buff Ausar snickers, pulling his weapons once more. <i>“Speed alone cannot win a fight.”</i>");
			//Hit
			else
			{
				output("\nYou try to twist out of the way, but there's just so many hands grabbing for you at once. Your arms are pinned to your [pc.hips] by one pair while the other bear hugs you against his broad, armored chest.");
				output("\n<b>You are grappled!</b>");
				CombatAttacks.applyGrapple(target, 35);
			}
		}
		
		private function daneQuadStrike(target:Creature):void
		{
			for (var i:int = 0; i < 2; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
			
			for (i = 0; i < 2; i++)
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				output("\n");
			}
		}
	}
}