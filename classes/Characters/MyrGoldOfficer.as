package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Guns.Vanquisher;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;

	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrGoldOfficer extends Creature
	{
		private var specialCD:int = 0;
					
		public function MyrGoldOfficer() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "gold officer";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "";

			this.isPlural = false;
			
			shield = new ReaperArmamentsMarkIShield();
			//meleeWeapon = new SurvivalAxe();
			//meleeWeapon.baseDamage.kinetic.damageValue = 25;
			rangedWeapon = new Vanquisher();
			rangedWeapon.baseDamage.kinetic.damageValue = 28;

			armor.longName = "thick chitin";
			armor.defense = 17;
			armor.hasRandomProperties = false;
			
			this.physiqueRaw = 27;
			this.reflexesRaw = 32;
			this.aimRaw = 27;
			this.intelligenceRaw = 32;
			this.willpowerRaw = 26;
			this.libidoRaw = 50;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.drug.damageValue = -25.0;
			
			this.level = 8;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 225;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			isUniqueInFight = true;
			btnTargetText = "GoldOfficer";
			
			createPerk("Can Crit",0,0,0,0);
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//credits = rand(200);
			sexualPreferences.setRandomPrefs(5, 0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			
			var foo:int = rand(3);
			switch(foo){
				case 0:	inventory.push(new Picardine()); break;
				case 1:	inventory.push(new Kirkite()); break;
				case 2:	inventory.push(new Satyrite()); break;
			}
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOLD_REMNANT_SI_OFFICER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.HPQ() <= 60 && kGAMECLASS.flags["FEDERATION_QUEST_WINDOW"] == undefined)
			{
				myrOfficerSmoke(target);
				return;
			}
			
			if((this.HPQ() <= 25 || this.LQ() >= 75) && rand(3) == 0)
			{
				myrOfficerHands(target);
				return;
			}
			
			var attacks:Array = new Array();
			if(target.shieldsRaw > 0)
			{
				attacks.push(myrOfficerShoot);
				attacks.push(myrOfficerShoot);
			}
			else
			{
				attacks.push(myrOfficerDaggers);
				attacks.push(myrOfficerDaggers);
			}
			attacks.push(myrOfficerShoot);
			attacks.push(myrOfficerBoob);
			attacks.push(myrOfficerCunt);
			attacks.push(myrOfficerAss);
			
			attacks[rand(attacks.length)](target);			
		}
		
		private function myrOfficerShoot(target:Creature):void
		{	
			output("The gold myr officer levels her handgun at you with two hands, using the other pair to hold steady her jiggling honeypots. She squeezes the trigger twice in rapid succession, ");
			
			aimMod += 15;
			if (!rangedCombatMiss(this, target)) 
			{
				output((target.shieldsRaw > 0 ? "hammering your shield" : "hammering you with lead") + ".");
				applyDamage(rangedDamage().multiply(.5), this, target, "minimal");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
			else output("though her shots go wide. She grimaces and flips her gun from one hand to the other. <i>“Damn. I guess I’ll have to get inventive to deal with you...”</i>");
			aimMod -= 15;
		}
		
		private function myrOfficerDaggers(target:Creature):void
		{
			output("The buxom myr spins around, drawing and throwing a tiny dagger in each of her free hands. The knives dig into ");
			
			aimMod -= 15;
			var hits:int = 3;
			for(var i:int = 0; i < 3; i++) if(rangedCombatMiss(this, target)) hits--;
			aimMod += 15;
			
			if (hits > 0)
			{
				output("you, cutting you as they sail past" + (hits < 3 ? " and the wall behind you" : "") + "! You feel a lance of pain as your [pc.skin] is sliced by the blade" + (hits > 1 ? "s" : "") + ", but the real problem comes after: a burning, tingling sensation that ripples through your body. Your flesh flushes, and your breathing quickens. It doesn’t take long to realize that <b>those daggers were coated in red myr venom!</b> ");
				if(target.isDependant(Creature.DEPENDANT_MYRVENOM)) output("And damn, does that sudden rush of lust make you want more!");
				
				var d:int = 10 + (target.isDependant(Creature.DEPENDANT_MYRVENOM)?6:0);
				var damage:TypeCollection = damageRand(new TypeCollection( { drug: d } ), 5);
				for(hits; hits > 0; hits--) applyDamage(damageRand(new TypeCollection( { drug: d } ), 5), this, target, "minimal");
			}
			else
			{
				output("the wall behind you!");
			}
		}
		
		private function myrOfficerSmoke(target:Creature):void
		{
			output("Gritting her teeth and wiping an unbecoming bead of sweat from her brow, the officer drops the magazine from her handgun and, with another of her four hands, draws a hand grenade from under her greatcoat.");
			output("\n\n<i>“You damn offworlders... thinking you have the right to come and stick your noses in our war. Well, I won’t let you bastards take our planet without a fight!”</i>");
			output("\n\nShe pulls the pin and lobs the grenade into the floor between you. You jump back, ready for the worst -- but instead of exploding, the grenade erupts into a billowing plume of green smoke, filling the tiny, sealed chamber in a matter of moments.");
			output("\n\n<i>“Myr eyesight isn’t great... I’m more than able to fight just by hearing. How about you?”</i>");
			kGAMECLASS.flags["FEDERATION_QUEST_WINDOW"] = 1;
			target.createStatusEffect("Smoke Grenade", 999, 0, 0, 0, false, "Blind", "Ranged attacks are far more likely to miss.", true, 0);
		}
		
		private function myrOfficerBoob(target:Creature):void
		{
			output("<i>“Why do you fight, starwalker?”</i> the officer asks, hooking two thumbs into the front of her blouse and pulling, showing off even more of that luscious amber cleavage. <i>“We gold myr learned long ago to forgo violence for love. Why don’t you stop this foolishness, and let me smother you in boob while you tell me all about your friends’ plans...”</i>");
			applyDamage(damageRand(new TypeCollection( { tease: 10 * (target.LQ() / 100) } ), 15), this, target, "tease");
		}
		
		private function myrOfficerCunt(target:Creature):void
		{
			output("The officer spins around on a high heel and reaches back with two hands, grabbing either side of her oversized pussy. She presents the drooling, golden fuckhole to you with a sensual smile over her shoulder. <i>“Come now." + (target.hasCock() ? " Surrender, and you can spend the days of your imprisonment pumping your alien seed in here until I’m a queen of my own. Would that really be so bad?" : "") + "”</i>");
			applyDamage(damageRand(new TypeCollection( { tease: (target.hasCock()?20:10) * (target.LQ() / 100) } ), 15), this, target, "tease");
		}
		
		private function myrOfficerAss(target:Creature):void
		{
			output("With a seductive smile, the myr officer turns and hikes her skirt up one of her legs, revealing long legs, thick thighs, and a butt that makes your mouth water. One of her hands delivers a slap to the bare, plump flesh of her rump, making it jiggle with the impact. <i>“No tightwad red’s gonna have an ass like this, you know,”</i> she smirks, shaking her hips so that her ant-like abdomen swings and its pussy-hole winks at you. <i>“Their legs are so locked together, they’ll probably just die out in a few years anyway! Why don’t you just lie down and see what a real woman’s body can do for you.”</i>");
			applyDamage(damageRand(new TypeCollection( { tease: 15 * (target.LQ() / 100) } ), 15), this, target, "tease");
		}
		
		private function myrOfficerHands(target:Creature):void
		{
			output("<i>“This isn’t going to do at all!”</i> the officer hisses, holstering her sidearm. <i>“Let’s try a more personal approach, shall we?”</i>");
			output("\n\nYou’re about to question her meaning, but she uses your moment of inaction to charge. She knocks your [pc.weapon] aside and dashes inside your gard. Immediately her hands are all over you, grabbing and squeezing and pinching in all the right places to drive you wild. She grabs your " + (target.hasCock() ? "[pc.cock]" : "") + (target.isHerm() ? " and " : "") + (target.hasVagina() ? "[pc.cunt]" : "") + (target.genitalCount() <= 0 ? "crotch" : "") + (target.balls > 0 ? ", running her chitinous fingers all over your [pc.balls]" : "") + ". Your [pc.nipples] are favored by two of her hands, pulling and twisting them until you yowl in pain and pleasure. The last of her four arms reaches around to " + (target.hasTail() ? "grab your [pc.tail], stroking it with furious desire" : "grab your [pc.butt], squeezing hard") + ". Pleasure shocks and shudders through you, making your [pc.skin] burn with desire.");
			output("\n\n<i>“Just surrender already,”</i> she purrs, nibbling at your [pc.ear]. <i>“I’ll get all your juicy secrets out this way if you’re a good [pc.boyGirl].”</i>");
			output("\n\nBefore you can answer, she spins out of your reach and draws her gun again, aiming it at your [pc.chest]. <i>“Or we can do it the hard way. Choice is yours.”</i>");
			//base of 20, each size check adds 0-20, hard-capped at 45 total
			var d:int = 20;
			d += 10 * (target.biggestCockLength()/30 > 2 ? 2 : target.biggestCockLength()/30);
			d += 10 * (target.ballSize()/10 > 2 ? 2 : target.ballSize()/10);
			d += 10 * (target.breastRows[0].breastRating()/10 > 2 ? 2 : target.breastRows[0].breastRating()/10);
			applyDamage(damageRand(new TypeCollection( { tease: (d > 45 ? 45 : d) } ), 5), this, target, "tease");
		}
	}

}