package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.TITSSaveEdit.Data.CoCVaginaClass;
	import classes.VaginaClass;
	import classes.CockClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.*;

	public class Frostwyrm extends Creature
	{
		//constructor
		public function Frostwyrm()
		{
			this._latestVersion = 3;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			//Bunch of cosmetic items are placeholders
			this.short = "Frostwyrm";
			this.originalRace = "frostwyrm";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The creature before you is a reptilian behemoth of monumental size, nearly the size of your Dad’s old Casstech at the shoulders. It is covered in interlocking white scales, each as large and hard as a shield. Spear-like talons grow from the ends of its six legs, digging gashes into the snow as it circles you. Your eyes are constantly drawn to its bestial maw, a lizard-like muzzle loaded with three rows of teeth, each as long as a sword. Four small red eyes regard you with malevolence, two on either side of its face. Behind it stretches a pair of leathery wings, somehow powerful enough to give the monster enough lift to fly, and a tail covered with brutal spikes. This is a creature made for violence, honed over millions of years into the perfect killing machine. \n\n\If you lose here, you don’t think you’re going to walk away alive. ";
			this.customBlock = "The attack just glances off the Wyrm’s scales.";
			this.isPlural = false;
			isLustImmune = true;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.psionic.resistanceValue = 45.0;
			baseHPResistances.kinetic.damageValue = 15.0;
			baseHPResistances.electric.damageValue = 15.0;
			baseHPResistances.burning.damageValue = 15.0;
			baseHPResistances.freezing.damageValue = 15.0;
			baseHPResistances.corrosive.damageValue = 15.0;
			
			this.meleeWeapon = new Fists();
			
			shield = new JoyCoPremiumShield();
			shield.shields = 300;
			shield.resistances.kinetic.resistanceValue = 0;
			shield.hasRandomProperties = true;
			
			this.armor.longName = "draconic scales";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 65;
			this.reflexesRaw = 30;
			this.aimRaw = 35;
			this.intelligenceRaw = 35;
			this.willpowerRaw = 50;
			this.libidoRaw = 20;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			this.level = 10;
			//Repeatable fight, so no boss xp?
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 600;
			this.HPRaw = this.HPMax();
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_SNAKE;
			this.eyeColor = "red";
			this.tallness = 120;
			this.thickness = 30;
			this.tone = 90;
			this.scaleColor = "white";
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_DRACONIC;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_DRACONIC;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_DRACONIC;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DRACONIC;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_DRACONIC;
			this.legType = GLOBAL.TYPE_DRACONIC;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 2;
			this.tailType = GLOBAL.TYPE_DRACONIC;
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
			this.tailRecharge = 0;
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
			this.buttRatingRaw = 20;
			
			this.vaginas = new Array();
			this.createVagina();
			this.shiftVagina(0, GLOBAL.TYPE_FROSTWYRM);
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].vaginaColor = "blue";
			
			this.cocks = new Array();
			this.createCock();
			this.shiftCock(0, GLOBAL.TYPE_FROSTWYRM);
			this.cocks[0].cLengthRaw = 36;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			
			this.balls = 2;
			this.cumMultiplierRaw = 3500;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 100;
			this.ballFullness = 100;
			this.ballEfficiency = 200;
			this.refractoryRate = 50;
			this.minutesSinceCum = 5256000;
			this.timesCum = 0;
			
			this.createPerk("Fixed CumQ",450000,0,0,0);
			
			this.cockVirgin = true;
			this.analVirgin = true;
			this.vaginalVirgin = true;
			
			this.elasticity = 1;
			this.fertilityRaw = 10;
			this.clitLength = 3;
			this.pregnancyMultiplierRaw = 1;
			
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 500;
			this.ass.loosenessRaw = 1;
			
			impregnationType = "FrostwyrmPregnancy";
			
			createStatusEffect("Disarm Immune");
			createStatusEffect("Stun Immune");
			createStatusEffect("Force It Gender");
			
			isUniqueInFight = true;
			btnTargetText = "Frostwyrm";
			
			sexualPreferences.setRandomPrefs(4 + rand(3), 2);
			//kGAMECLASS.uvetoSSTDChance(this);
			
			
			this._isLoading = false;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			//dataObject._neverSerialize = false;
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.cocks[0].cLengthRaw = 36;
			dataObject.cocks[0].cThicknessRatioRaw = 1.75;
		}
		
		override public function get bustDisplay():String
		{
			return "FROSTWYRM";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void 
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var enemyAttacks:Array = [];
			
			if (!target.hasStatusEffect("Stunned"))
			{	
				enemyAttacks.push( { v: wyrmPsiScream, w: 10 } );
			}
			if (!target.hasStatusEffect("Blinded") && !hasStatusEffect("Buffet Cooldown"))
			{
				enemyAttacks.push( { v: wyrmWingBuffet, w: 10 } );
			}
			if (!target.hasStatusEffect("Psychic Miasma"))
			{
				enemyAttacks.push( { v: wyrmPsiMiasma, w: 10 } );
			}
			
			enemyAttacks.push( { v: wyrmTailSlap, w: 10 } );
			enemyAttacks.push( { v: wyrmPsiBolt, w: 20 } );
			enemyAttacks.push( { v: wyrmRend, w: 20 } );
			
			weightedRand(enemyAttacks)(target);
			
			wyrmBarrier();
		}
		
		override public function isPregnant(x:int = 0):Boolean
		{
			return (kGAMECLASS.flags["FROSTWYRM_INCUBATION_TIMER"] != undefined);
		}
		
		private function wyrmPsiScream(target:Creature):void
		{
			output("The frostwyrm throws its head back and lets out a bellowing roar that echoes across the glacial rift, sending out shockwaves of energy that hammer against the very walls of your mind. You grab the sides of your head and groan in agony as the creature’s roar wracks your brain.");
			
			var bStun:Boolean = false;
			
			//PC fails willpower save and is stunned
			if (target.willpower() + rand(20) + 1 < willpower())
			{
				output("\n\nThe psychic onslaught leaves you staggered, reeling from the mental blow. <b>You’re Stunned</b>");
				bStun = true;
			}
			//PC passes willpower save
			else
			{
				output("\n\nThough you’re reeling, and suffering from an intense headache, you manage to pull yourself together in a hurry.");
			}
			
			var damMulti:Number = willpower() / target.willpower();
			if (damMulti > 2) damMulti = 2;
			if (damMulti < 1) damMulti = 1;
			
			applyDamage(new TypeCollection( { psionic: 5 * damMulti } ), this, target, "minimal");
			if(bStun) CombatAttacks.applyStun(target, 2);
		}
		
		//My Wings, a hurricane!
		private function wyrmWingBuffet(target:Creature):void
		{
			output("The wyrm rears back and gives you a bellowing shriek, furiously beating its wings at you. They generate a hurricane-like force, sending flurries of snow roaring out around you.");
			
			//Pass physical check, blinded
			if ((target.physique() + rand(20) + 1 > physique()) || target.isPlanted())
			{
				output("\n\nYou dig your [pc.feet] in and hold on for dear life, refusing to be blown away by the beast... but even then, you quickly realize that the snow is blasting all around you. It’s almost impossible to see -- <b>you’re all but blinded!</b>");
				CombatAttacks.applyBlind(target, rand(2) + 2);
			}
			//Fail physical check, blinded and tripped
			else
			{
				output("\n\nThe gail-force of the wind sends you flying to the ground, sprawling out across the ice. Worse, you quickly realize that the snow is blasting all around you. It’s almost impossible to see -- <b>you’re knocked down and all but blinded!</b>");
				CombatAttacks.applyBlind(target, rand(2) + 2);
				CombatAttacks.applyTrip(target);
			}
			
			createStatusEffect("Buffet Cooldown", 6);
		}
		
		private function wyrmPsiMiasma(target:Creature):void
		{
			output("The frostwyrm roars and sweeps its wings out, sending out a wave of energy that tears at your brain, filling you with lethargy and clouding your thoughts.");
			
			//PC fails willpower save
			if (target.willpower() + rand(20) + 1 < willpower())
			{
				output("\nPsychic energy assaults your mind, filling your brain with confused and swirling thoughts, and your vision becomes incredibly hazy. It’s hard to focus on the fight, and <b>your reflexes and aim both seem lowered</b> by the psychic miasma.");
				target.createStatusEffect("Psychic Miasma", 0, 0, 0, 0, false, "Icon_OffDown", "You’ve been struck by a psychic miasma, reducing your effective aim and reflexes by 5", true, 0, 0xFF0000);
				target.aimMod -= 5
				target.reflexesMod -= 5
			}
			//PC passes willpower save
			else
			{
				output("\n\nYou grab your head, desperately resisting the onslaught of psychic energy assaulting your mind.");
			}
		}
		
		//The shock of my tail, a thunderbolt!
		private function wyrmTailSlap(target:Creature):void
		{
			output("The wyrm’s tail flashes out of nowhere, coming at you like a falling tree from the snow.")
			
			if(combatMiss(this, target)) output("\nYou manage to duck down under the sweeping strike, avoiding what might have been a deadly blow.");
			else
			{
				output("\nYou take the blow right to the chest, sending you hurdling back through the air. When you land, you’re left gasping for breath, feeling like your chest has been completely crushed by the impact.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 125 }, DamageFlag.CRUSHING ), 20), this, target);
			}
		}
		
		//My breath, death!
		private function wyrmPsiBolt(target:Creature):void
		{
			output("The wyrm rears up and unleashes a ray of psychic energy, manifesting as a bolt of withering frost that shoots towards you like a spear of glassy blue death.")
			
			if(combatMiss(this, target)) output("\nYou leap out of the way, letting the frostbolt bury into the ground. It sticks there like a spear, quivering for a moment before shattering into shards of glass.");
			else
			{
				output("\nThe bolt hammers into you, wrapping you in frigid cold. Your whole body convulses and shivers, wracked by frostbite and shards of ice.");
				
				var damMulti:Number = willpower() / target.willpower();
				if (damMulti > 2) damMulti = 2;
				if (damMulti < 1) damMulti = 1;
				
				applyDamage(new TypeCollection( { psionic: 5 * damMulti, freezing: 50 * damMulti } ), this, target);
			}
		}
		
		//My claws, are spears!
		private function wyrmRend(target:Creature):void
		{
			output("The wyrm lunges at you, claws bared and snarling like a ravenous beast.");
			
			if(combatMiss(this, target)) output("\nYou duck one of the wyrm’s claw-swipes.");
			else
			{
				output("\nOne of the wyrm’s claws slices you, hammering into your chest with monumental force.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 33 }, DamageFlag.PENETRATING ), 20), this, target, "minimal");
			}
			
			if(combatMiss(this, target)) output("\nYou duck one of the wyrm’s claw-swipes.");
			else
			{
				output("\nOne of the wyrm’s claws slices you, hammering into your chest with monumental force.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 33 }, DamageFlag.PENETRATING ), 20), this, target, "minimal");
			}
			
			if(combatMiss(this, target)) output("\nYou duck one of the wyrm’s claw-swipes.");
			else
			{
				output("\nOne of the wyrm’s claws slices you, hammering into your chest with monumental force.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 33 }, DamageFlag.PENETRATING ), 20), this, target, "minimal");
			}
		}
		
		private function wyrmBarrier():void
		{
			if (CombatManager.getRoundCount() == 1)
			{
				output("\n\nThe air around the frostwyrm crackles and shimmers with strange energy. With this protection, the creature can amplify its psionic abilities.");
				willpowerRaw += 10;
				createStatusEffect("Psionic Amplifier",0,0,0,0,false,"Icon_OffUp","Undisturbed focus due to the barrier.",true);
			}
			
			else if (shields() <= 0)
			{
				output("\n\nWith the barrier down the wyrm’s concentration has been affected.");
				willpowerRaw -= 10;
				removeStatusEffect("Psionic Amplifier");
			}
			else return
		}		
		
	}
}