package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Melee.TaivrasSpear;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	
	import classes.GLOBAL;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;

	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Taivra extends Creature
	{
		
		public function Taivra() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Taivra";
			this.originalRace = "nyrea";
			this.a = "";
			this.capitalA = "";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "You’re facing down Queen Taivra, an alpha nyrea powerful enough to subjugate an entire city of her amazonian sisters. She stands nearly six feet tall, with pale yellow flesh left largely bare by her revealing armor - if you could call it that. She wears a bikini-style vest and bottom of padded chainmail, showing off her ample cleavage and her firm muscles and belly. Leather bracers and pauldrons complement her armor, and a blood red cape flows from her shoulders. A black Reaper shield belt hangs loosely from her hips, a trophy taken from an off-worlder, no doubt, and now adorned with fetishes and potion vials.";
			
			this.isPlural = false;
			
			this.shield = new ReaperArmamentsMarkIShield();
			this.meleeWeapon = new TaivrasSpear();
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 30;
			this.aimRaw = 25;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 29;
			this.libidoRaw = 80;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
			
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
			this.hipRatingRaw = 10;
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
			this.buttRatingRaw = 10;
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
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 22;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.2;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			createStatusEffect("Force Fem Gender");
			
			impregnationType = "RoyalEggPregnancy";
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Taivra";
			
			tallness = 68 + (rand(12) - 6);
			rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);
			
			inventory.push(new TaivrasSpear());
			
			long += "\n\nThe queen’s long black hair is tied into a tight ponytail behind her elfin ears, and her pitch-black eyes regard you with ";
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1) long += "cold contempt";
			else long += "playful mirth, like a cat stalking her prey";
			long += ". Her purple lips twist in a smile, and she twirls her towering longspear about herself in a series of flourishes and feints that would have impressed a core-world martial artist.";
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1) long += "\n\nDane, your cousin [rival.name]’s four-armed ausar bodyguard, is standing at your side. Though wounded by Queensguard, he’s still managing to stand - if only barely. He might not be at full strength, but it’s reassuring to have somebody watching your back.";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if (flags["FREED_DANE_FROM_TAIVRA"] == 1)
			{
				return "TAIVRADANE";
			}
			else
			{
				return "TAIVRA";
			}
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Dane Grappled")) taivraGrappleBreak();
			else if(rand(3) <= 1 || hasStatusEffect("Disarmed"))
			{
				if(rand(4) == 0) lustFungus(target);
				else if(rand(2) == 0) taivraCockTease(target);
				else tentacleCocks(target);
			}
			else
			{
				if(!target.hasStatusEffect("Blinded")) pocketSandAttack(target);
				else if(rand(2) == 0) taivraSpearSweep(target);
				else strikeAndSlash(target);
			}
			//Special Combat Actions:
			//Slavegasm
			//Play at the end of each of Taivra’s turns when she has any Lust. Reduces her lust by 10.
			if(lust() >= 10) taivraConstantLustReduction();
			//Flurry Attack
			//Taivra makes a Flurry attack after any turn!
			else if(!hasStatusEffect("Dane Grappled")) taivraBonusAttackShit(target);
			//COUSIN DOUCHEBAGGERY
			//Play during Queen Taivra combat if Dane’s free. Cousin gets free and buggers off.
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1 && flags["RIVAL_GOT_MYR_COORDS_FIRST"] == undefined) cousinDouchebaggery();
			if(kGAMECLASS.flags["FREED_DANE_FROM_TAIVRA"] == 1) daneTaivraAssistAI();
		}
		
		// Daneshit
		private function daneTaivraAssistAI():void
		{
			if(hasStatusEffect("Dane Grappled")) removeStatusEffect("Dane Grappled");
			else if(rand(2) == 0) quadGripSpearStab();
			//Wastes 1/4 of her turns!
			else if(CombatManager.getRoundCount() % 4 == 0 ) daneGrappleTaivra();
			else quadPummel();
		}
		
		private function daneGrappleTaivra():void 
		{
			output("\n\nCharging forward, Dane tosses away a splintered spear. His arms come open, open-palmed and grabbing for Taivra!");
			//Miss
			if(combatMiss(kGAMECLASS.chars["DANE"], this)) output("\nShe twists out of the way of his four-armed grapple in the nick of time. The buff Ausar snickers, liberating a spear from the ground. <i>\"Speed alone cannot win a fight.\"</i>");
			//Hit
			else
			{
				output("\nTaivra tries to twist out of the way, but there’s just so many hands grabbing for her at once. Her arms are pinned to her [pc.hips] by one pair while the other bear hugs her against his broad chest. <i>\"Now, [pc.name]! Hit her now!\"</i>");
				output("\n<b>Taivra is grappled!</b>");
				createStatusEffect("Dane Grappled",0,35,0,0,false,"Constrict","Taivra is pinned in a grapple.",true,0);
			}
		}
		
		private function taivraGrappleBreak():void
		{
			output("With a contemptuous sneer, Taivra breaks Dane’s grip and boots him backward. He converts the momentum into a combat roll and comes up with a fresh spear in his hand.");
		}
		
		private function quadGripSpearStab():void
		{
			output("\n\nDane secures a fresh spear from an insensate guard and strikes at the queen!");
			if(rand(10) <= 1) output(" She dodges!");
			else
			{
				output(" Much of it splinters from the impact.");
				var damage:TypeCollection = new TypeCollection( { kinetic: 33/2 } )
				damage.add(7);
				damage.multiply(1.5);
				damageRand(damage, 15);
				applyDamage(damage, kGAMECLASS.chars["DANE"], this, "melee");
			}
		}
		
		private function quadPummel():void
		{
			output("\n\nDane moves like a boxer, delivering punch after punch to the Queen.");
			for(var x:int = 0; x < 4; x++)
			{
				if(rand(10) <= 1) output("\nHe misses!");
				else
				{
					output("\nHe connects!");
					var damage:TypeCollection = new TypeCollection( { kinetic: 33/2 } )
					damageRand(damage, 15);
					applyDamage(damage, kGAMECLASS.chars["DANE"], this, "melee");
				}
			}
		}
		
		private function taivraSpearSweep(target:Creature):void
		{
			output("Taivra swings her spear in a wide arc, savagely slashing at you");
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1) output(" and your companion");
			output("! You ");
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1) output(" and Dane ");
			else output("are");
			if(combatMiss(this, target))
			{
				output(" able to dodge the strike.");
			}
			else
			{
				meleeWeapon.baseDamage.kinetic.damageValue += 20;
				output(" struck by the sweeping spear!");
				applyDamage(meleeDamage(), this, target, "melee");
				meleeWeapon.baseDamage.kinetic.damageValue -= 20;
			}
			output(" The nyrean queen sneers, twirling the haft around herself is a buzzing ring that cuts the air.");
		}
		
		private function strikeAndSlash(target:Creature):void
		{
			output("Taivra spins around, twirling her spear backwards before striking out at you. The butt of her spear ");
			if(combatMiss(this, target)) output("comes crashing down at your head.\nYou barely sidestep it!");
			else 
			{
				meleeWeapon.baseDamage.kinetic.damageValue -= 10;
				output("comes crashing down on your head, hard.");
				applyDamage(meleeDamage(), this, target, "melee");
				meleeWeapon.baseDamage.kinetic.damageValue += 10;
				if(physique()/2 + rand(20) + 1 > target.physique()/2 + 10 && !target.hasStatusEffect("Stunned"))
				{
					output(" <b>You are stunned!</b>");
					CombatAttacks.applyStun(target, 2);
				}
			}
			output(" A moment later and she’s dancing around you, slashing at you with the sharp end.");
			if(combatMiss(this, target)) output("\nYou barely dodge aside!");
			else
			{
				applyDamage(meleeDamage(), this, target, "melee");
			}
		}
		
		private function taivraCockTease(target:Creature):void
		{
			output("The queen saunters forward, long, bare legs carrying her towards you with a lascivious smile on her face. One of her thumbs hooks into the leather strap holding up her chain bottom, and the garment slides down to reveal the throbbing length of her equine-like cock, drooling with moisture from its X-shaped slit.");
			output("\n\n<i>“Come now,”</i> she purrs, stroking the shaft. <i>“Surrender now, and I’ll keep you as a favored pet. You’ve earned that much... perhaps I’ll even let you carry a clutch of my spawn.”</i>");
			output("\n\n");

			if(target.willpower()/2 + rand(20) + 1 >= 26) output("You shrug off the nyrea’s advances.");
			else 
			{
				output("You have to admit, the idea is uncomfortably tempting...");
				applyDamage(new TypeCollection( { tease: 18 } ), this, target, "minimal");
			}
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1)
			{
				if(rand(2) == 0) output("\nDane seems oddly taken with the queen...");
				else output("\nDane sneers at the queen’s offer, clearly not ready to be her next bottom bitch.");
			}
		}
		
		private function tentacleCocks(target:Creature):void
		{
			output("Swinging her hips like a whore on strut, Taivra runs her free hand along the lengths of several of her parasitic tentacle cocks. Her betas moan and squirm as the tails probing their sexes move and thrust. <i>“You know you want it,”</i> the queen teases, slapping her ass in a way that makes her taut cheeks and squirming tails quake.");
			output("\n");
			for(var x:int = 0; x < 4; x++)
			{
				if(target.willpower()/2 + rand(20) + 1 >= 26) output("\nYou shrug off the nyrea’s advances.");
				else
				{
					output("\nGetting railed by a dozen tentacle cocks... now that’s something new!");
					applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
				}
			}
		}
		
		private function lustFungus(target:Creature):void
		{
			output("Taivra grabs a vial of some pink fungal compound off her belt and hurls it at you.");
			if(rangedCombatMiss(this, target)) output("\nYou dodge it, and the vial shatters harmlessly against the stone wall.");
			else
			{
				output("\nThe vial shatters against your chest, bursting into a cloud of pink mist. You cough as the mist billows out, making your eyes water and flesh tingle. <b>You are surrounded by a cloud of lust-drug!</b>");
				applyDamage(new TypeCollection( { drug: 6 } ), this, target, "minimal");
				//4 rounds of lust damage!
				if(!target.hasStatusEffect("Aphro Gas")) CombatAttacks.applyAphroGas(target, 5, 4);
				else 
				{
					output(" <b>The chemical in your air is getting stronger!</b>");
					target.addStatusValue("Aphro Gas",1,3);
					target.setStatusValue("Aphro Gas",2,4);
				}
			}
		}
		
		private function pocketSandAttack(target:Creature):void
		{
			output("Taivra grabs a sack from her belt and hurls it at you, letting the thing tumble open in a cascade of fine grains of powdered rock. You’re smashed right in the face with a hail of sand");
			if (target.accessory is FlashGoggles)
			{
				output(", but your goggles protect your eyes.");
			}
			else if (target.hasBlindImmunity())
			{
				output(", but to little effect.");
			}
			else
			{
				output("! <b>You’re blinded!</b>");
				CombatAttacks.applyBlind(target, 2 + rand(3));
			}
		}
		
		private function taivraConstantLustReduction():void
		{
			output("\n\nTaivra’s back arches and moans. You cock an eyebrow curiously, until you realize that one of her tentacle cocks is throbbing, squirting seed into one of her beta sluts. The queen gives a sated sigh, looking calmer and more collected even as her bottom bitch’s psuedo-cock erupts in a shower of juice and cum.");
			lust(-10);
		}

		private function taivraBonusAttackShit(target:Creature):void
		{
			output("\n\nThe queen follows through with a quick jab at you, thrusting at your chest.");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
		}
		
		private function cousinDouchebaggery():void
		{
			output("\n\nAs you’re engaged with Taivra, you notice movement in the shadows behind her throne. Between warding off spear-thrusts and keeping yourself out of Dane’s berzerker swings, it takes you a moment to realize what’s going on: your scumbag cousin’s gotten free, and [rival.heShe]’s trying to get to the probe! [rival.HeShe] must have picked the lock after Dane wrecked the guards.");
			output("\n\nShit! You try and push forward to stop [rival.himHer], but the damn bug-queen almost spears you through the chest for your troubles. She forces you back with a flurry of strikes, refusing to let you anywhere near her throne... even as [rival.name] plants [rival.hisHer] hand on the scanner and activates it. DAMMIT!");
			output("\n\nYou cousin flashes you a shit-eating grin as the probe’s coordinates download onto [rival.hisHer] Codex. " + kGAMECLASS.chars["RIVAL"].mf("Jack gives you a sarcastic salute","Jill blows you an over-acted kiss") + " before leaping off the back of the throne and scampering off. Looks like you’re getting left in the dust again...");
			flags["RIVAL_GOT_MYR_COORDS_FIRST"] = 1;
		}
	}
}