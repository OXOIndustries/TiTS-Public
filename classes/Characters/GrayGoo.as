package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.author;
	
	public class GrayGoo extends Creature
	{
		//constructor
		public function GrayGoo()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "gray goo";
			this.originalRace = "conglomerate";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This goo-like creature is made of a writhing mass of nano-bots, trillions of the little things coalesced into the form of an almost comically-busty woman, with wide hips and thick thighs over long legs that seem to have trouble maintaining their shape, as her feet are constantly turning to an amorphous liquid on the ground as she walks. Her arms, too, are constantly shifting, turning into masses of thin tentacles or else reforming into the shape of various sex toys and restraints, some parts of her intelligence clearly over-eager to milk all the “natural lube” she can out of you! ";
			this.customDodge = "The goo’s body twists and morphs outlandishly to avoid your attack.";
			this.customBlock = "The goo’s remarkable composition somehow allows her to take your attack unharmed.";
			this.isPlural = false;
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "dart";
			this.rangedWeapon.attackNoun = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering “skin”";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 12;
			this.reflexesRaw = 12;
			this.aimRaw = 3;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 8;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 50;
			this.HPMod = 10;
			this.HPRaw = this.HPMax();


			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "silver";
			this.tallness = 70;
			this.thickness = 45;
			this.tone = 0;
			this.hairColor = "silver";
			this.scaleColor = "gray";
			this.furColor = "gray";
			this.hairLength = 31;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_SQUISHY);
			addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			addSkinFlag(GLOBAL.FLAG_AMORPHOUS);
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 2;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
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
			this.hipRatingRaw = 15;
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
			this.buttRatingRaw = 13;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 5;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 20;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 188721;

			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 21;
			this.nippleColor = "steel gray";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "GrayGoo";
			credits = 50 + rand(200);
			sexualPreferences.setRandomPrefs(3 + rand(3));
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			if(rand(2) == 0) sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, sexualPreferences.getRandomLikesFactor());
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GRAY_GOO";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			// TODO this will need to be fettled to handle Anno + PC
			// aka this is one of the initial tester-fights for proper multicombat
			// most of the attacks will need to be reworded too
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Grappled")) grayGooRestrain(target);
			else
			{
				if((hasStatusEffect("Blinded") || HP() < maxHP()/2) && rand(5) == 0) grayGooReformatting();
				else
				{
					if(CombatManager.getRoundCount() % 4 == 0) grayGooRestrain(target);
					else if((!hasStatusEffect("Harden") && rand(3) == 0) || (lust() >= 75 && rand(2) == 0)) grayGooHarden(target);
					else grayGooTeaseAttackGo(target);
				}
			}
		}
		
		private function grayGooHarden(target:Creature):void
		{
			author("Savin");
			output("The nano-goo shudders for a moment as her shimmering skin flashes brighter, seeming to become harder and more solid than it has been so far. She giggles and smiles at you, giving you a come-hither crook of her finger as she slinks to the ground and spreads her legs invitingly.");
			if (!hasStatusEffect("Harden"))
			{
				createStatusEffect("Harden", 0, 30, 0, 0, false, "DefenseUp", "Defense against all forms of attack has been increased!", true, 0);
				baseHPResistances.kinetic.resistanceValue += 10.0;
			}
			//PC has options here!
			//[Do Nothing] [Quickie!]
			target.createStatusEffect("Goo Harden Offer", 0, 0, 0, 0, true, "", "", true, 0);
		}
		
		private function grayGooReformatting():void
		{
			author("Savin");
			// Restores light HP, removes status effects
			clearCombatStatuses();
			output("You see the goo-girl shudder, her eyes dimming for a moment. You hesitate, waiting to see what she’s doing. After a moment, her eyes light up again, a dopey grin on her face. <i>“All better now!”</i> she chirps before slotting a hand up her gooey twat. (+15 HP and all statuses cleared!)");
			lust(5);
			HP(15);
		}
		
		private function grayGooRestrain(target:Creature):void
		{
			author("Savin");
			if(!target.hasStatusEffect("Grappled"))
			{
				output("The nano-goo’s arms deform into thick tentacles of nanomachines, hurtling toward you! The tendrils wrap around your arms, splaying you out and leaving you to struggle in their surprisingly strong grasp.");
				target.createStatusEffect("Grappled", 0, 30, 0, 0, false, "Constrict", "You’re trapped in a gray goo’s hold!", true, 0);
			}
			//Turn 1: 
			else if(target.statusEffectv3("Grappled") == 0)
			{
				output("Seeing that you can’t quite wriggle free of her grasp, the gray goo giddily closes the distance between you, grabbing a handful of your [pc.butt] and squeezing just enough to make you groan.");
				target.addStatusValue("Grappled",3,1);
				applyDamage(new TypeCollection( { tease: 10 + rand(6) } ), this, target, "minimal");
			}
			//Turn 2
			else
			{
				//PC has cock: 
				if(target.hasCock()) output("The goo-girl spins around, planting her big ass right in your crotch. She giggles, giving you a seductive wink over her shoulder before starting to grind against your [pc.cocks], sending shocks of pleasure up your spine!");
				//PC has tits:
				else if(target.biggestTitSize() >= 2)
				{
					output("The goo-girl presses herself tight against you before mashing her face down into your bust, motor-boating your [pc.chest] as her hands squeeze and massage your [pc.butt], trying to ");
					if(target.armor.shortName != "") output("work your " + target.armor.longName + " off");
					else output("pull your cheeks apart to get at your behind");
					output("!");
				}
				//Savin forgets things and I nagged him till he wrote this
				else
				{
					output("The goo-girl wraps herself around you, pinning your");
					if(target.legCount == 1) output(" [pc.leg] down");
					else output(" [pc.legs] together");
					output(" before slithering around and burying her face in your [pc.butt], motorboating your ass-cheeks as her gooey limbs try to peel off your [pc.gear].");
				}
				applyDamage(new TypeCollection( { tease: 10 + rand(6) } ), this, target, "minimal");
			}
		}
		
		private function grayGooTeaseAttackGo(target:Creature):void
		{
			author("Savin");
			if(rand(2) == 0) output("The nano-goo-girl gives you a sultry grin before spinning around, leaning over to give you a good look at her big, full ass. She shakes what her programmers gave her, bouncing up and down as one of her arms turns into a huge horsecock-like dildo and rams it straight inside her, eliciting a gasp of pleasure from her big lips.");
			else 
			{
				output("The gray goo cups her huge tits enticingly, squeezing the over-sized orbs together with her shoulders as one of her arms shapes itself into a big, drooling cockhead. She thrusts between her cleavage, pumping up and down until it blows a thick, gooey load right on her face ");
				//if PC has a dick: 
				if(target.hasCock()) output("clearly offering you the chance to do the same.");
				else output("clearly offering to do the same to you!");
			}
			applyDamage(new TypeCollection( { tease: 3 } ), this, this, "suppress");
			applyDamage(new TypeCollection( { tease: 8 + rand(6) } ), this, target, "minimal");
		}
	}
}