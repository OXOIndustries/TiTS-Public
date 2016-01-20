package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.KhansLabCoat;
	import classes.Items.Guns.KhansArcCaster;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	//Fight is in pitch black. Aim and Reflexes are significantly reduced. 
	public class KQ2Khan extends Creature
	{
		//constructor
		public function KQ2Khan()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Doctor Khan";
			this.originalRace = "kui-tan";
			this.a = "";
			this.capitalA = "";
			// this.long = "Several armed men in black-and-red heavy armor have stormed into the construction site, wildly firing machine pistols at you and your companion. It's almost impossible to see in here, except by the occasional muzzle flashes and showers of sparks as bullets slam into the metal bulkheads.\n\nNot far from you, Saen ducks into and out of cover, evading bursts of enemy fire and returning it as quick as she can.";
			//long = "";
			customBlock = "[PLACEHOLDER BLOCK]";
			isPlural = false;
			isLustImmune = false;
			
			meleeWeapon = new ShockBlade();
			rangedWeapon = new KhansArcCaster();
			
			shield = new JoyCoPremiumShield();
			shield.shields = 120;
			shield.resistances.burning.resistanceValue = 15.0;
			shield.resistances.electric.resistanceValue = 15.0;
			shield.resistances.kinetic.resistanceValue = 15.0;
			
			shield.hasRandomProperties = true;
			
			armor = new KhansLabCoat();
			
			baseHPResistances.tease.resistanceValue = -50.0;
			baseHPResistances.drug.resistanceValue = -50.0;
			baseHPResistances.pheromone.resistanceValue = -50.0;
			baseHPResistances.psionic.resistanceValue = -50.0;
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 10;
			this.aimRaw = 38;
			this.intelligenceRaw = 32;
			this.willpowerRaw = 25;
			this.libidoRaw = 40;
			this.shieldsRaw = 40;
			this.energyRaw = 100;
			this.lustRaw = 11;
			
			this.XPRaw = 500;
			this.level = 8;
			this.credits = 80 + rand(80);
			this.HPMod = 140;
			this.HPRaw = this.HPMax();
			shieldsRaw = shieldsMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
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
			createPerk("Inhuman Desire", 100, 0, 0, 0, "");
			
			isUniqueInFight = true;
			btnTargetText = "Dr Khan";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "BLACKVOID";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// enemy AI
			var enemyAttacks:Array = [];
			enemyAttacks.push( { v: arcCaster, w: 40 } );
			enemyAttacks.push( { v: labGirlsStriptease, w: 10 } );
			enemyAttacks.push( { v: lustbang, w: 30 } );
			if (lust() >= 110 && !hasStatusEffect("Worship Cooldown")) enemyAttacks.push( { v: ballWorship, w: lust() } );
			
			var attack:Function = weightedRand(enemyAttacks);
			
			if (attack == arcCaster) attack(target, hostileCreatures);
			else attack(hostileCreatures);
		}
		
		private function arcCaster(target:Creature, hostiles:Array):void
		{
			output("Khan levels his lightning gun at " + (target is PlayerCharacter ? "you" : "Kara") +" and pulls the trigger, sending a stream of crackling electricity arcing towards " + (target is PlayerCharacter ? "you" : "her") +".");
			
			if (rangedCombatMiss(this, target))
			{
				output(" The bolt goes wide, blasting into the wall.");
			}
			else
			{
				output(" The bolt strikes " + (target is PlayerCharacter ? "you" : "Kara") + " with searing force!");
				applyDamage(damageRand(rangedDamage(), 15), this, target, "minimal");
				
				if (rand(5) > 0)
				{					
					output(" The bolt arcs from " + (target is PlayerCharacter ? "you" : "Kara") +" to " + (target is PlayerCharacter ? "Kara" : "you") +", blasting " + (target is PlayerCharacter ? "her" : "you") +" as well!");
					applyDamage(damageRand(rangedDamage(), 15), this, target, "minimal");
				}
			}
		}
		
		private function labGirlsStriptease(hostiles:Array):void
		{
			output("<i>“Girls,”</i> Khan says, resting his hand-cannon on his shoulder and pulling what looks like a remote from a desk nearby. <i>“Why don’t you show our guests what they’ll be getting when they finally surrender, hmm?”</i>");

			output("\n\n<i>“Yes, Master,”</i> the gold myr women chant in unison, stepping away from the kui-tan man and towards you and Kara, letting their coats slip down their shoulders to flaunt their bodies. One of the girls shimmies down to her knees lapping her tongue along another's thighs and groin, letting the tip of a few fingers disappear into her drooling sex. The victim of these attentions moans and cups her breasts, squeezing out a little trickle of honey from each of her saucer-like nipples -- which another pair of sluts are quick to start lapping up, tongues and lips playing across her huge bosom.");
			
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i];
			}
			
			//DC 25 willpower check!
			if(pc.willpower()/2 + rand(20) + 1 >= 25)
			{
				output("\n\nYou take a deep breath, trying to keep your head clear.");
			}
			else
			{
				output("\n\nYou feel your lusts rising in response to the display, heat rising painfully in your [pc.crotch]. You’d give anything to get in on that...");
				applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, pc, "minimal");
			}
			
			if (kara)
			{
				if (kara.willpower() / 2 + rand(20) + 1 >= 25)
				{
					output("\n\nKara shakes her head vigorously, avoiding eye contact with the lusty babes as they return to their master’s side.");
				}
				else
				{
					output("\n\nBy the time the girls are done, Kara’s cheeks are burning a bright red, with a visible bulge in her pants as the myr girls return to their master’s side.");
					applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, kara, "minimal");
				}
			}
		}
		
		private function lustbang(hostiles:Array):void
		{
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i];
			}
			
			var hitPC:Boolean = false;
			
			output("<i>“Hand me one of my special concoctions!”</i> Khan snaps at one of his lab-coat-wearing harem girls. She quickly scampers over to a nearby desk and rushes back with a small pink grenade. <i>“Have a taste of my LUSTBANGS!”</i> he screams, throwing the grenade at you. It explodes in a cloud of pink mist which rolls over you");
			if (kara != null) output(" and Kara");
			output(".\nRather than choking on it, though");
			
			if (pc.reflexes() / 2 + rand(20) + 1 >= 25)
			{
				output(", you manage to cover your mouth and dive out of the cloud.");
			}
			else
			{
				hitPC = true;
				output(" you feel your skin flush with heat. Your [pc.crotch] burns with unwanted desire as the poison cloud overwhelms you!");
				
				applyDamage(new TypeCollection( { drug: 15 + rand(6) } ), this, pc, "minimal");
			}
			
			if (kara)
			{
				if (kara.reflexes() / 2 + rand(20) + 1 >= 25)
				{
					output("\nLooks like Kara got clear");
					if (!hitPC) output(", too");
					output(".");
				}
				else
				{
					output("\nKara’s looking much more flushed by the time the cloud clears");
					if (hitPC) output(", too");
					output(".");
					
					applyDamage(new TypeCollection( { drug: 15 + rand(6) } ), this, kara, "minimal");
				}
			}
		}
		
		private function ballWorship(hostiles:Array):void
		{
			createStatusEffect("Worship Cooldown", 4);
			
			output("<i>“Girls... I... I need some relief !”</i> Khan cries, wiggling around on his testicular throne and waving a small remote at his harem. The huge, swollen sacks of his balls jiggle and quake under him, and a visible gush of semen squirts out of his bound cock, splattering on the top of his nads. His harem is quick to leap to their master’s aid, hands playing across his swollen sac, tongues and breasts and wet cooches rubbing all over him. The scientist groans and bucks his hips as his harem worship his balls, spooge drooling from the tip of his cock.");
			
			var pc:Creature;
			var kara:Creature;
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is PlayerCharacter) pc = hostiles[i];
				if (hostiles[i] is Kara && !hostiles[i].isDefeated()) kara = hostiles[i];
			}
			
			if (pc.willpower() / 2 + rand(20) + 1 >= 25)
			{
				output("\n\nYou take a deep breath, trying to keep your head clear.");
			}
			else
			{
				output("\n\nYou feel your lusts rising in response to the display, heat rising painfully in your [pc.crotch]. You'd give anything to get in on that...");
				applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, pc, "minimal");
			}

			if (kara != null)
			{
				if (kara.willpower() / 2 + rand(20) + 1 >= 25)
				{
					output("\n\nKara shakes her head vigorously, avoiding eye contact with the huge-balled kui-tan.");
				}
				else
				{
					output("\n\nBy the time the girls are done, Kara's cheeks are burning a bright red, with a visible bulge in her pants.");
					applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, kara, "minimal");
				}
			}
		}
		
		override public function getCombatDescriptionExtension():void
		{
			var numDronesAlive:int = 0;
			var hostiles:Array = CombatManager.getHostileCharacters();
			
			for (var i:int = 0; i < hostiles.length; i++)
			{
				if (hostiles[i] is KQ2SecurityDroid && !hostiles[i].isDefeated()) numDronesAlive++;
			}
			
			if (numDronesAlive > 0)
			{
				output("\n\nAt the doctor's command");
				if (numDronesAlive > 1) output(" are several small security drones. Each");
				else output(" is a small security drone. The");
				output(" drone is about the size of your fist, just a ball of metal built around a hover-platform and a tiny zap-gun.");
				if (numDronesAlive > 1) output(" They're quick moving, though, and speed around you in a constant hail of electrical discharge.");
				else output(" It's quick moving, though, and speeds around you with a constant hail of electrical discharge.");
			}
		}
	}
}
