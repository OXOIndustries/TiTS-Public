package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Protection.RustedShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.weightedRand;
	import classes.GameData.CodexManager;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class SydianCboy extends Creature
	{
		//constructor
		public function SydianCboy()
		{
			
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "sydian cuntboy";
			this.originalRace = "sydian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "At seven feet and change, the flushed and furious sydian you’re up against stands a touch taller than the other males you’ve faced, but holds himself with the perfect grace of a much smaller and less muscular man. Whilst he doesn’t have a single stitch of clothing, relying only on carapace to give him a sense of modesty, he seems to have found a rusted shield emitter somewhere.";
			if (this.hasCock()) long +="\n\nThe two eight inch feelers atop his head and the four at the tip of his powerful tail seem to drip heavily with natural aphrodisiac - as does his cock. Judging by the wetness dripping from the cunt you know he has, and the slight note of lust in his pitch-black eyes, he might be more than a little hopped up on his own supply.";
			else long += "\n\nThe two eight inch feelers atop his head and the four at the tip of his powerful tail seem to drip heavily with natural aphrodisiac - as does the orange flash of a... vagina... you notice between his legs. Judging by how wet he seems and the slight note of lust in his pitch-black eyes, he might be more than a little hopped-up on his own supply.";
			this.customDodge = "The sydian cuntboy darts to the side at the last moment, your attack not even grazing him.";
			this.customBlock = "A chitin plated arm comes up to block your attack, and the sydian takes no damage!";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;

			this.shield = new RustedShield();

			this.physiqueRaw = 30;
			this.reflexesRaw = 20;
			this.aimRaw = 20;
			this.intelligenceRaw = 13;
			this.willpowerRaw = 10;
			this.libidoRaw = 50;
			this.shieldsRaw = 50;
			this.energyRaw = 100;
			this.lustRaw = 30;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 10;
			this.HPRaw = this.HPMax();
			
			this.femininity = 10;
			this.eyeType = GLOBAL.TYPE_SYDIAN;
			this.eyeColor = "black";
			this.tallness = 85;
			this.thickness = 60;
			this.tone = 90;
			this.hairColor = "crimson";
			this.scaleColor = "orange";
			this.furColor = "orange";
			this.hairLength = 5;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "rust orange";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SYDIAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_SYDIAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SYDIAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_SYDIAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SYDIAN;
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
			/*this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.5;*/
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].type = GLOBAL.TYPE_SYDIAN;

			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "SydianPregnancy";
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_SYDIAN_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 50;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 100;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 20;
			this.minutesSinceCum = 9999;
			this.timesCum = 1722;
			
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
			this.ass.bonusCapacity += 15
			this.ass.loosenessRaw = 2;

			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force Male Gender");
			
			isUniqueInFight = true;
			btnTargetText = "Sydian";
			kGAMECLASS.tarkusSSTDChance(this);
			
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if (this.hasCock()) return "SYDIAN_CBOY_HERM";
			else return "SYDIAN_CBOY";
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(4 + rand(3));
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (hasStatusEffect("Charge Follow Up")) chargeySequal(target);
			else
			{
				var choices:Array = [];
				choices.push({ v: degradeAndEnjoy, w: 10 });
				choices.push({ v: chargeyCharge, w: 10 });
				if (!target.hasStatusEffect("Tripped")) choices.push({ v: trippyTripTrip, w: 10 });
				else choices.push({ v: proneLustingLyingDown, w: 20 });
				if (!hasStatusEffect("Suplex Cooldown") && HPQ() < 100) choices.push({ v: sydianSuplex, w: 10 }); 

				var attack:Function = weightedRand(choices);
				attack(target);
			}
			updateDesc();
		}

		public function updateDesc():void
		{
			long = "At seven feet and change, the flushed and furious sydian you’re up against stands a touch taller than the other males you’ve faced, but holds himself with the perfect grace of a much smaller and less muscular man. Whilst he doesn’t have a single stitch of clothing, relying only on carapace to give him a sense of modesty, he seems to have found a rusted shield emitter somewhere.";
			if (this.hasCock()) long +="\n\nThe two eight inch feelers atop his head and the four at the tip of his powerful tail seem to drip heavily with natural aphrodisiac - as does his cock. Judging by the wetness dripping from the cunt you know he has, and the slight note of lust in his pitch-black eyes, he might be more than a little hopped up on his own supply.";
			else long += "\n\nThe two eight inch feelers atop his head and the four at the tip of his powerful tail seem to drip heavily with natural aphrodisiac - as does the orange flash of a... vagina... you notice between his legs. Judging by how wet he seems and the slight note of lust in his pitch-black eyes, he might be more than a little hopped-up on his own supply.";
			long +="\n\n";
			if (this.lustQ() <= 33)
			{
				//{Low Lust, High HP:
				if (this.HPQ() > 66) long += "Despite that, he seems capable of staying focused on forcing you into submission.";
				//{Low Lust, Mid HP:
				else if (this.HPQ() > 33) long += "He looks a little wobbly on his feet, but his scuffed up armor and leaky cunt don’t seem to bother him yet.";
				//{Low Lust, Low HP:
				else long += "Of course, beaten down as he is, he has more pressing matters on his hands.";
			}
			else if (this.lustQ() <= 66)
			{
				//{Mid Lust, High HP:
				if (this.HPQ() > 66) long += "It’s beginning to distract him a little, his tail occasionally flicking between his wettened thighs.";
				//{Mid Lust, Mid HP: 
				else if (this.HPQ() > 33) long += "He’s starting to get wobbly on his feet, though whether from arousal or the damage he’s taken you couldn’t say.";
				//{Mid Lust, Low HP: 
				else long += "Whilst he certainly looks more aroused than he did at the start of this fight, he seems more bothered by the noticeable dents and cracks in his armor plating.";
			}
			else
			{
				//{High Lust, High HP: 
				if (this.HPQ() > 66) long += "...That might be an understatement, actually. Whenever he’s not using his tail to balance himself, or attacking you with it, it’s between his legs, working his cunt in an attempt to bring himself some kind of relief.";
				//{High Lust, Mid HP: 
				else if (this.HPQ() > 33) long += "He’s wobbly on his feet from the damage he’s taken, and his tail certainly isn’t helping him by trying to plunge into his soaked vagina whenever he’s not focused entirely on using it.";
				//{High Lust, Low HP: 
				else long += "You’re not sure whether the fact his legs look ready to buckle under him has more to do with the liberal streams of wetness pouring from between his legs," + (this.hasCock() ? " the stiffness of his cock,":"") + " or the noticeable dents and cracks in his armor plating.";
			}
		}

		//HP damage:
		//{Won’t trigger if the sydian is at full HP. Probably needs some kind of recharge as it ignores shields and the lust damage isn’t avoidable. Deals minor lust damage.}
		public function sydianSuplex(target:Creature):void
		{
			author("GothPastel");
			if (combatMiss(this, target))
			{
				//High Evasion Miss:
				if (target.reflexes()/2 + rand(20) + 1 >= this.reflexes()/2+10)
				{
					output("Your attacker moves to grab you, but you step out of the way easily!");
				}
				//Regular Miss:
				else
				{
					output("Your attacker grabs hold of you, but you pull yourself loose before he can do any damage.");
					if (!target.hasAirtightSuit())
					{
						output(" - not that it stops a thin veneer of aphrodisiac from slipping off his rough hands and wicking into your skin.");
						applyDamage(new TypeCollection( { drug: 5 } ), this, target, "minimal");
					}
				}
			}
			else 
			{
				output("Your attacker grabs hold of you and suplexes you to the ground with inhuman ease!");
				if (target.hasAirtightSuit())
				{
					//{Shields up & airtight armor:
					if (target.shields() > 0) output(" Your shields do nothing to protect you, but your armor blocks the veneer of aphrodisiac on the Sydian’s rough hands from affecting you.");
					//Shields down & airtight armor:
					else output(" Your armor blocks the veneer of aphrodisiac on the Sydian’s rough hands from affecting you.");
				}
				else
				{
					//shields up and airtight armor:
					if (target.shields() > 0) output(" Your shields do nothing to protect you and y");
					//else:
					else output(" Y");
					output("ou feel the thin veneer of aphrodisiac on the Sydian's rough hands wicking into your skin.");
				}
				applyDamage(new TypeCollection( { kinetic: 30 }, DamageFlag.BYPASS_SHIELD ), this, target, "minimal");
				if (!target.hasAirtightSuit()) applyDamage(new TypeCollection( { drug: 15 } ), this, target, "minimal");
			}
			//I have now discovered there is an automatic updateCooldowns function in GroundCombatManager. God bless.
			createStatusEffect("Suplex Cooldown", 4);
		}

		//Shield/HP damage 1:
		//{Can trigger at any point}
		public function chargeyCharge(target:Creature):void
		{
			author("GothPastel");
			//Miss:
			if (combatMiss(this,target)) output("The Sydian charges you, shoulder first, but a well-timed dodge to the side sends him staggering as he misses.");
			//Hit, Shields up: 
			//Maybe: inflict 'staggered' status effect or something similar for 1 round.
			else 
			{
				output("The Sydian charges you, shoulder first, knocking you back");
				var stag:Boolean = false;
				if (!target.hasStatusEffect("Stagger") && target.physique()/2 + rand(20) < this.physique()/2 + rand(20))
				{
					output(" and leaving you a little unsteady on your feet");
					createStatusEffect("Charge Follow Up");
					stag = true;
				}
				output(".");
				applyDamage(damageRand(new TypeCollection( { kinetic: 10 } ), 15), this, target, "minimal");
				if (stag) CombatAttacks.applyStagger(target, 1);
			}
		}

		//Shield/HP damage 2:
		//{Triggers turn immediately after a successful shield/HP damage 1 attack if staggered for high damage}
		public function chargeySequal(target:Creature):void
		{
			author("GothPastel");
			//Hit:
			if (!combatMiss(this,target))
			{
				output("Taking advantage of your newfound unsteadiness, the Sydian lashes out with a fist, connecting with you easily!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 30 } ), 15), this, target, "minimal");
			}
			//Miss:
			else output("Taking advantage of your newfound unsteadiness, the Sydian lashes out with a fist - but you manage to get back to your senses and spin out of the way at the last moment!");
			
			removeStatusEffect("Charge Follow Up");
		}

		//Trip:
		//{Does no damage, but leaves the PC prone}
		public function trippyTripTrip(target:Creature):void
		{
			author("GothPastel");
			//Hit: 
			if (!combatMiss(this,target)) 
			{
				output("The Sydian’s tail swings out towards you! Try as you might, you can’t get out of the way in time, and the thick limb knocks your feet out from under you - leaving you flat on your back.");
				CombatAttacks.applyTrip(target);
			}
			//Miss: 
			else output("The Sydian’s tail swings out towards you! You jump right over it, treating the attack like a high stakes game of jump rope.");
		}

		//Light lust attack:
		//{Degrades armor on first attack, deals minor lust damage after}
		public function degradeAndEnjoy(target:Creature):void
		{
			author("GothPastel");
			//Miss:
			if (combatMiss(this, target)) output("Dripping with natural aphrodisiac, the feathered tip of the Sydian’s tail flies towards you, but you sidestep at the last moment!");
			else
			{
				//Hit, armor degradation:
				if (target.hasArmor() && !target.hasStatusEffect("Degraded Armor"))
				{
					output("Dripping with natural aphrodisiac, the feathered tip of the Sydian’s tail flies towards you, smearing across your [pc.armor], degrading it. <b>Your armor is degraded and won’t provide any protection for the rest of the fight!</b>");
					target.createStatusEffect("Degraded Armor", 0, 0, 0, 0, false, "DefenseDown", "Your armor is temporarily degraded and will not provide any defensive benefit.", true, 0);
				}
				//Hit, lust damage:
				else
				{
					output("Dripping with natural aphrodisiac, the feathered tip of the Sydian’s tail flies towards you, smearing across your [pc.armor] and soaking through into your skin. The trails leave your skin flushed and heart pounding - turning you on a lot more than a regular caress would warrant!");
					applyDamage(damageRand(new TypeCollection( { drug: 15 } ), 15), this, target, "minimal");
				}
			}
		}

		//Heavy lust attack:
		//{PC must be prone to trigger}
		public function proneLustingLyingDown(target:Creature):void
		{
			author("GothPastel");
			output("The Sydian drops to all fours and skitters over your prone form! You find yourself treated to a close-up view of a drippy orange puss as aphrodisiac-coated fingers steal");
			if (!target.hasAirtightSuit()) output(" under your [pc.clothing] and");
			output(" across your body.");

			//willpower check
			var resist:Boolean = (target.willpower() + rand(20) + 1 >= this.lustQ()/2 + 10);
			var damage:TypeCollection = new TypeCollection( { drug: 20, tease: 8 } );
			if (resist) damage = new TypeCollection( { drug: 5, tease: 5 } );
			
			//Resist:
			if (resist) output("You resist huffing in a lungful of his scent, but the tracks of aphrodisiac soaking into your skin turn you on a little nonetheless.");
			//Hit:
			else output("You can’t resist huffing in a lungful of desperately aroused scent, leaving you panting and horny when the Sydian just as quickly pulls away!");
			applyDamage(damageRand(damage, 15), this, target, "minimal");
		}
	}
}