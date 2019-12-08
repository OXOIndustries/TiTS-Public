package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.GabilaniPanties;
	import classes.Items.Guns.*
	import classes.Items.Protection.HammerShield;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Toys.*;
	import classes.Items.Transformatives.Soak;
	import classes.Items.Upgrades.ExpandedBackpackI;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	
	public class Lumi extends Creature
	{
		//constructor
		public function Lumi()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;			
						
			this.typesBought[this.typesBought.length] = GLOBAL.ALL;
			this.sellMarkup = 1.3;
			this.buyMarkdown = .25;
			this.keeperBuy = "";
			this.keeperSell = "";
			this.keeperGreeting = "";

			this.short = "Lumi";
			this.originalRace = "gabilani";
			this.a = "";
			this.capitalA = "";
			this.long = "The Gabilani tech has amber skin, light-grey hair and a somewhat chubby build that is presently concealed under a white catsuit, emphasizing her wide hips, bountiful ass and thick thighs. She is holding a wacky sci-fi gun in one hand, while the other remains close to the grenades on her waist belt. A number of other belts are strung around her legs and fitted with all sorts of tech instruments, though some of them look suspiciously like sex toys. Her eyes are covered by anti-flash goggles, but a crazed smile belies her euphoria.";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.armor.longName = "white nanofiber catsuit";
			this.armor.defense = 5;
			
			rangedWeapon.baseDamage.drug.damageValue = 15;
			
			this.rangedWeapon.attack = 3;
			this.rangedWeapon.longName = "drug gun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "spray";
			
			this.characterClass = GLOBAL.CLASS_ENGINEER;
			this.physiqueRaw = 10;
			this.reflexesRaw = 20;
			this.aimRaw = 25;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 20;
			this.libidoRaw = 100;
			this.HPMod = 20;
			this.shield = new HammerShield;
			this.shield.shields = 150;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 20;
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 500;
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "turquoise";
			this.tallness = 41;
			this.thickness = 70;
			this.tone = 0;
			this.hairColor = "light-grey";
			this.scaleColor = "orange";
			//this.scaleColor = titsPtr.chars["PC"].scaleColor;
			this.furColor = "light-grey";
			//this.furColor = titsPtr.chars["PC"].furColor;
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "orange";
			//this.skinTone = titsPtr.chars["PC"].skinTone;
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.hornLength = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_DEMONIC;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 20;
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
			this.buttRatingRaw = 18;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			//this.ballSize = titsPtr.chars["PC"].ballSize;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 0;
			this.timesCum = 0;
			
			this.elasticity = 3;

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 3;
			this.vaginas[0].vaginaColor = "orange";
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 0;

			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 3;
			this.nippleColor = "orange";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			//sex prefs
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,			GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,					GLOBAL.REALLY_LIKES_SEXPREF);
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,					GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,					GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,		GLOBAL.KINDA_LIKES_SEXPREF);
			
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 0;
			baseHPResistances.electric.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 50.0;
			baseHPResistances.freezing.damageValue = 0;
			baseHPResistances.corrosive.damageValue = -30.0;
			baseHPResistances.poison.damageValue = 0;
			//baseHPResistances.psionic.damageValue = 100.0;
			baseHPResistances.drug.damageValue = 70.0;
			baseHPResistances.pheromone.damageValue = 50.0;
			baseHPResistances.tease.damageValue = -30.0;
			
			this.createStatusEffect("Blind Immune");
			createPerk("Gas Grenade", 0, 0, 0, 0, "Gas Grenade");
			createPerk("Charge Shield", 0, 0, 0, 0, "Charge Shield");
			createPerk("Deflector Regeneration", 0, 0, 0, 0, "Deflector Regeneration");			
			
			randomise();
			this._isLoading = false;
		}
		private function randomise():void
		{
			//starts combat with charged shield up
			var moddedInt:int = this.bimboIntelligence();
			var targetDamage:int = Math.round(10 + this.level * 3 + moddedInt);			
			this.createStatusEffect("Charged Shield", 2, targetDamage, 0, moddedInt, false, "DefenseUp", "Chance of blinding attackers - and damaging melee attackers for up to " + targetDamage + " electrical damage!", true, 0);
		
			credits = 500 + rand(501);
			var rn:int = 0;
			var loot:int = 0;

			if (rand(2) == 0)
			{
				if (rand(2) == 0) inventory.push(new Throbb);
				else inventory.push(new Soak);
				loot += 1;
			}
			if (rand(5) == 0)
			{
				rn = rand(8);
				if (rn == 0) inventory.push(new BubbleBuddy);
				else if (rn == 1) inventory.push(new GravCuffs);
				else if (rn == 2) inventory.push(new SukMastr);
				else if (rn == 3) inventory.push(new HoverHole);
				else if (rn == 4) inventory.push(new DildoTerran);				
				else if (rn == 5) inventory.push(new DildoCanine);				
				else if (rn == 6) inventory.push(new DildoEquine);				
				else inventory.push(new DildoFeline);
				loot += 1;
			}
			if (rand(10) == 0 && loot < 2)
			{
				inventory.push(new GabilaniPanties);
				loot += 1;
			}
			if (rand(10) == 0 && loot < 2) inventory.push(new ExpandedBackpackI);
		}
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			this.vaginalVirgin = false;
			if (cumFrom is PlayerCharacter)
			{
				sstdChecks(cumFrom,"vagina");
				return kGAMECLASS.tryKnockUpLumi();
			}
			return false;
		}
		override public function isPregnant(vIdx:int = 0):Boolean
		{
			return false;
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;		
			var rn:int = 0;
			
			if (!this.hasStatusEffect("FirstAction") && !this.hasStatusEffect("Disarmed"))
			{
				//always shots for her first action
				lumiDrugShot(target);
				this.createStatusEffect("FirstAction");					
			}
			else if (this.lust() > 60 && !this.hasStatusEffect("Medipen"))
			{
				//reduce lust once per combat
				this.lust(0,true);
				baseHPResistances.tease.damageValue += 80;
				this.createStatusEffect("Medipen");			
				output("<i>“Fuck, it’s getting hot in here!”</i> Lumi says as she shuffles around and rubs her thighs together. By this point, you can easily picture the wet mess her pussy is making inside the white catsuit. In the blink of an eye, she takes a medipen from one of her tool belts and pricks her leg. A relieved smile spreads across the goblin’s lips, and her restless shuffling ceases altogether. <i>“So, where were we again?”</i> She asks excitedly, now that her concentration has been restored.");
			}
			else if (this.shields() < 60 && this.energy() >= 33 && !this.hasStatusEffect("Deflector Regeneration") && !this.hasStatusEffect("DefRegenUsed"))
			{
				//use perk to regen shields once per battle
				CombatAttacks.DeflectorRegenerationImpl(alliedCreatures, hostileCreatures, this, target);
				this.energy(-33);
				this.createStatusEffect("DefRegenUsed");			
			}
			else if (this.energy() >= 15 && !this.hasStatusEffect("Charged Shield")&& !this.hasStatusEffect("ChargeShieldUsed"))
			{
				//use perk to make shield blind attackers and damage melee attackers (once per battle besides starting use)
				CombatAttacks.ChargeShieldImpl(alliedCreatures, hostileCreatures, this, target);
				this.energy(-15);
				this.createStatusEffect("ChargeShieldUsed");	
			}
			else if (target.hasStatusEffect("Stealth Field Generator") || target.hasStatusEffect("Taking Cover") || target.hasStatusEffect("Spear Wall"))
			{
				if (!target.hasAirtightSuit() && CombatAttacks.GasGrenade.IsAvailable(this)) CombatAttacks.GasGrenade.execute(alliedCreatures, hostileCreatures, this, target);
				else lumiTease(target);
			}
			else if (hasStatusEffect("Disarmed") || hasStatusEffect("Staggered"))
			{
				lumiTease(target);
			}
			else
			{
				rn = rand(10);
				if (rn < 4) lumiTease(target);
				else if (rn < 6 && !target.hasAirtightSuit() && CombatAttacks.GasGrenade.IsAvailable(this)) CombatAttacks.GasGrenade.execute(alliedCreatures, hostileCreatures, this, target);
				else lumiDrugShot(target);
			}
		}
		
		private function lumiDrugShot(target:Creature):void
		{
			output("The tech fires her gun, which spits a viscous, whitish liquid.");
			//Miss
			if(rangedCombatMiss(this, target)) output(" Fortunately, she misses her mark.");
			//Hit
			else
			{
				output("\nThe 'projectile' finds a breach in your defense, seeping through a patch of unprotected [pc.skinFurScalesNoun]. Sensual pleasure spreads from the affected area, and your head gets hazy for a hot second before you manage to refocus on the battle.");
				applyDamage(new TypeCollection( { drug: 15 + rand(10) } ), this, target, "ranged");
				applyDamage(new TypeCollection( { poison: 1 + rand(3) } ), this, target, "ranged");
			}
		}
	
		private function lumiTease(target:Creature):void
		{
			var rn:int = rand(3);
			if (rn == 0)
			{
				output("Lumi cups her breasts and gives them a little squeeze, to show just how firm and perky they are, not the least bit of sag. The motion causes her obscenely large nipples to press further against the fabric of the nanosuit, which molds to their shape, leaving almost nothing to the imagination. <i>“If you behave, I might even let you suck on them, you know. I bet they'd feel wonderful on your [pc.lipsChaste],”</i> she smiles and winks coyly.");
				applyDamage(new TypeCollection( { tease: 15 } ), this, target, "minimal");
			}
			else if (rn == 1)
			{
				output("The Gabilani turns at an angle that gives you a profile view of her plump body in all its luscious glory, then she shifts one of her thick legs to the side, emphasising her beautiful asscheeks, their curves perfectly delineated by the catsuit. Without warning, she raises an open palm and brings it down on her own assflesh with a loud slap, letting out a moan of pained pleasure as her butt jiggles from the force. <i>“To be honest, I love when someone spanks my ass while we fuck,”</i> she admits with a hint of embarrassment.");
				applyDamage(new TypeCollection( { tease: 15 + rand(5) } ), this, target, "minimal");
			}
			else
			{
				output("The tech plucks a particularly large purple dildo from her ‘tool belt’ and gives it a lick, then proceeds to rub it over her cheeks, lips, breasts and navel, until finally reaching the honeypot. She fixes you with a sultry gaze and starts rubbing the toy between the big lips of her pumped-up snatch. Soon enough, a damp patch appears on the catsuit, her fem-lube leaking faster than even the high-tech garment can absorb. Lumi bites her lower lip and gives you a look of pure need before resuming her battle stance.");
				applyDamage(new TypeCollection( { tease: 15 + rand(10) } ), this, target, "minimal");
			}
		}
	}
}
