package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Armor.ChitPlate;
	import classes.Items.Guns.BothriocRifle;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.BothriocRapier;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	
	public class BothriocPidemme extends Creature
	{
		//constructor
		public function BothriocPidemme()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "bothrioc pidemme";
			originalRace = "bothrioc";
			a = "the ";
			capitalA = "The ";
			//this.long = "";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new BothriocRapier();
			this.rangedWeapon = new BothriocRifle();
			this.armor = new ChitPlate();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 32;
			this.aimRaw = 22;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 14;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 80 + rand(80);
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = RandomInCollection("black", "white", "electric blue", "rusty red");
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
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
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
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
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = false;
			btnTargetText = "VoidPirate";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "BOTHRIOC_PIDEMME";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Grappled"))
			{
				grappleFollowup(target);
				return;
			}
			
			var se:StorageClass = getStatusEffect("Bolo CD");
			if (se != null)
			{
				se.value1--;
				if (se.value1)
				{
					removeStatusEffect("Bolo CD");
					se = null;
				}
			}
			
			// enemy AI
			var enemyAttacks:Array = [];
			enemyAttacks.push( { v: rapierThrust, w: 10 } );
			enemyAttacks.push( { v: gunshot, w: 10 } );
			enemyAttacks.push( { v: tease, w: 10 } );
			
			if (_preppedBolo == false) enemyAttacks.push( { v: prepBolo, w: 10 } );

			var attack:Function = weightedRand(enemyAttacks);
			attack(target);
			
			enemyAttacks.splice(enemyAttacks.indexOf(attack), 1);
			
			if (InCollection(attack, rapierThrust, gunshot, tease) && _preppedBolo)
			{
				output("\n\n");
				boloShot(target, attack);
			}
			else
			{
				weightedRand(enemyAttacks)(target);
			}
			
		}
		
		private var _grappleRound:int = 0;
		
		private function grappleFollowup(target:Creature):void
		{
			if (_grappleRound == 0)
			{
				_grappleRound++;
				output("The bothrioc gently lays down flat against you and gives you a kiss on the cheek as their ovipositor extends out of their abdomen. You can feel the warm, wet tip of the ovipositor, questing its way");
				if (!target.isCrotchGarbed()) output(" through your [pc.lowerGarments]");
				else output(" into your crotch");
				if (target.hasCock() || target.hasVagina()) output(",");
				if (target.hasCock()) output(" stroking against your [pc.cock]");
				if (target.hasCock() && target.hasVagina()) output(" and");
				if (target.hasVagina()) output(" sliding between the lips of your [pc.vagina]");
				output("...");
			}
			else
			{
				output("The bothrioc’s warm oil has seeped into your [pc.skinFurScales] around your groin. It seems to radiate heat through you, making you feel helplessly aroused, a sensation enhanced by your tight binds. Meanwhile, the bothrioc continues to mold their lithe body against yours, one pair of hands massaging your [pc.chest] whilst the other caresses your face. Their thin, hard lips are glossy and incredibly smooth when they press against yours. While alien, it feels remarkable.");
				applyDamage(new TypeCollection( { tease: 2, drug: 3 } ), this, target, "minimal");
			}
		}
		
		private function rapierThrust(target:Creature):void
		{
			output("The slim, powerful legs of your opponent close the distance between the two of you in a flash, rapier held grimly and two-handed like a small lance. Suddenly, the thrust lashes out as the warrior abandons one hand in a twist of the body to cover over a meter of distance in the blink of an eye.");
			
			if (combatMiss(this, target))
			{
				output(" Parrying the attack isn’t easy, but you knock the rapier off course, causing its seeking tip to soar off in a wide angle.");
			}
			else
			{
				var dr:DamageResult = applyDamage(damageRand(meleeDamage(), 15), this, target, "suppress");
				
				if (dr.shieldDamage > 0 && dr.hpDamage <= 0)
				{
					output(" Thankfully most of the force behind the attack went into closing the distance, but rapiers are no joke even with seemingly little force behind them. While your shield is able to deflect the blow, it takes quite the toll on it.");
				}
				else
				{
					output(" Thankfully most of the force behind the attack went into closing the distance, but being stabbed by a rapier is no joke. Your wound grinds and stings as you move.");
				}
				
				outputDamage(dr);
			}
		}
		
		private function gunshot(target:Creature):void
		{
			output("In a smooth motion, the rapier in one of their lower hands is planted point-first into the ground beside the warrior as the other hand pulls the rifle out of its holster and kicks it up for the opposite upper hand to take hold of. The rapier arm comes up to steady the rifle neatly from beneath and a shot is sighted immediately as the body twists into a side-stance firing pose. A pull of the trigger flings an old-fashioned metal slug out of the barrel straight at you.");
			
			if (rangedCombatMiss(this, target))
			{
				output(" You dive to one side, and the shot whines off a rock behind you.");
			}
			else
			{
				var dr:DamageResult = applyDamage(damageRand(rangedDamage(), 15), this, target, "suppress");
				
			}
			
			" {Success, shielded: The shot spangs off of your shields.} {Success, unshielded: You wince as the crude weapon finds its mark.} {Failure: }");
		}
		
		private var _preppedBolo:Boolean = false;
		
		private function prepBolo(target:Creature):void
		{
			output("One of the bothrioc’s lower hands reaches into the collection of belts around their hips and pulls out a bolo. After passing it to the upper set of hands, a few quick swings has it spun up.");
			_preppedBolo = true;
			createStatusEffect("Bolo CD", 3, 0, 0, 0, true); // Not using builtin CD system to avoid back to back potential grapples
		}
		
		private function boloShot(target:Creature, lastAttack:Function):void
		{
			_preppedBolo = false;
			
			if (lastAttack == rapierThrust)
			{
				output("In the same breath as their rapier stab, the bothrioc flicks their bolo-swinging hand to hurl the wheel of rope and iron at you.");
			}
			else if (lastAttack == gunshot)
			{
				output("Following swiftly on the heels of the rifle shot, the bothrioc lets loose the bolo swinging above their head.");
			}
			else
			{
				output("The bothrioc turns away, displaying their round bum beneath their abdomen, looking over their shoulder with mischievous black eyes… and the next moment they hurl the bolos in their upper pair of hands overarm at you with all their strength.");
			}
			
			if (rangedCombatMiss(this, target))
			{
				output(" You dart out of the way, the furiously spinning weights careening past your [pc.legs] by a fraction.");
			}
			else
			{
				output(" The whirling trap hits you right in the middle, heavy ropes wrapping themselves around your limbs and weights thumping into you with hard momentum.\n\nYou try and tear yourself loose of the tangle, but before you can the bothrioc pounces on you, pinning you to the ground under them.\n\n<i>“Now then, precious,”</i> they whisper, caressing your face. <i>“Let’s have no more silly struggling, hmm?”</i>");
				
				target.createStatusEffect("Grappled", 0, 66, 0, 0, false, "Constrict", "The bolos is still tangled around your limbs!", true, 0);
				_grappleRound = 0;
			}
		}
		
		private function tease(target:Creature):void
		{
			if (rand(2) == 0)
			{
				output("The bothrioc’s circling hunter’s stance begins to accommodate hops, skips and twists, and with remarkable naturalness they segue into a belly dance. With each gyration of the hips and collapse of their stomach you’re treated to a surprisingly fertile and toned visage, despite the lack of anything between their legs to accompany it.");
			}
			else
			{
				output("The bothrioc plants their rapier for a second to free up both lower hands, quickly turning to the side as they heft their abdomen aloft. Their ovipositor reaches out lazily. It is a thick, prehensile appendage which drools slime obscenely.");
			}
			
			output("\n\nYou can’t help but let your guard down a little, daydream at the possibilities... before you know what’s happened the bothrioc has effortlessly slipped beyond your arms.");
			
			if (target.willpower() / 2 + rand(30) + 1 < target.libido() / 2 + rand(target.lust() / 4))
			{
				output(" The bothrioc leans into you, one hand caressing your [pc.chest] while another cops a feel of your [pc.ass] as they whisper into your ear");
				
				var o:Array = [];
				if (target.buttRating() >= 10) o.push(" <i>“Such a plush posterior" + (target.hipRating() >= 10 ? " and such fertile hips, too" : "") + ". You were born to carry our eggs and you know it, don’t you?”</i>");
				if (target.biggestTitSize() > 11) o.push(" <i>“You know, you’d make an excellent nurse for our many, many offspring." + (target.isLactating() ? " And I see you’ve come prepared,”</i> they add, laughing delightedly as a few spurts of [pc.milk] are coaxed out by their hand to spatter against their gleaming chitin." : "”</i>"));

				if (o.length == 0)
				{
					output(" <i>“You’re not quite the broodmare you should be, but our eggs will take care of that quite nicely, offworlder. Look forward to it.”</i>");
				}
				else
				{
					output(RandomInCollection(o));
				}
				output(" You shiver, between the touches and words sliding into your ear, and shove the creature away.");
				
				applyDamage(new TypeCollection( { tease: 3 + (Math.floor(target.libido() / 8)) } ), this, target, "minimal");
			}
			else
			{
				applyDamage(new TypeCollection( { tease: 3 } ), this, target, "minimal");
			}
		}
	}
}
