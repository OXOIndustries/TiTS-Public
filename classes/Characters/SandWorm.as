package classes.Characters 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.StringUtil;
	import classes.Items.Miscellaneous.Hoverboard;
	import classes.Items.Miscellaneous.Kirkite;
	
	public class SandWorm extends Creature
	{
		public function SandWorm() 
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "sand worm";
			originalRace = "sand worm";
			a = "a ";
			capitalA = "A ";
			long = "";
			customDodge = "";
			customBlock = "";
			isPlural = false;
			
			isLustImmune = true;
			
			meleeWeapon.longName = "body";
			meleeWeapon.attackNoun = "ram";
			meleeWeapon.attackVerb = "ram";
			meleeWeapon.attack = 20;
			meleeWeapon.baseDamage.kinetic.damageValue = 40;
			meleeWeapon.baseDamage.addFlag(DamageFlag.CRUSHING);
			meleeWeapon.hasRandomProperties = true;
			
			rangedWeapon.longName = "saliva";
			rangedWeapon.attackNoun = "aphro-venom";
			rangedWeapon.attackVerb = "spit";
			rangedWeapon.attack = 20;
			rangedWeapon.baseDamage.drug.damageValue = 16;
			rangedWeapon.baseDamage.pheromone.damageValue = 4;
			rangedWeapon.hasRandomProperties = true;
			
			armor.longName = "chitin skin";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			shieldDisplayName = "ARMOR";
			shield.shields = 0;
			
			physiqueRaw = 15;
			reflexesRaw = 25;
			aimRaw = 20;
			intelligenceRaw = 10;
			willpowerRaw = 5;
			libidoRaw = 50;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 0;
			
			level = 6;
			//XPRaw = normalXP();
			XPRaw = 500;
			credits = 0;
			HPMod = 100;
			HPRaw = HPMax();
			
			femininity = 50;
			eyeType = GLOBAL.TYPE_SANDWORM;
			eyeColor = "black";
			tallness = 24 + rand(48);
			thickness = 50;
			tone = 50;
			hairColor = "black";
			scaleColor = "black";
			furColor = "black";
			hairLength = 0;
			hairType = 0;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_SKIN;
			skinTone = "black";
			skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_THICK);
			faceType = GLOBAL.TYPE_SANDWORM;
			faceFlags = new Array();
			tongueType = GLOBAL.TYPE_SANDWORM;
			lipMod = 0;
			earType = GLOBAL.TYPE_SANDWORM;
			antennae = 0;
			antennaeType = 0;
			horns = 0;
			hornType = 0;
			armType = GLOBAL.TYPE_SANDWORM;
			gills = false;
			wingType = 0;
			legType = GLOBAL.TYPE_SANDWORM;
			legCount = 1;
			legFlags = new Array();
			
			genitalSpot = 0;
			tailType = GLOBAL.TYPE_SANDWORM;
			tailCount = 1;
			addTailFlag(GLOBAL.FLAG_THICK);
			addTailFlag(GLOBAL.FLAG_LONG);
			tailGenitalArg = GLOBAL.TYPE_SANDWORM;
			
			tailGenital = GLOBAL.TAIL_GENITAL_NONE;
			tailVenom = 0;
			tailRecharge = 5;
			
			hipRatingRaw = 0;
			buttRatingRaw = 0;
			
			breastRows[0].breastRatingRaw = 0;
			nippleColor = "";
			milkMultiplier = 0;
			milkType = 0;
			milkRate = 0;
			
			ass.wetnessRaw = 0;
			
			vaginas = new Array();
			
			elasticity = 1;
			clitLength = 0.5;
			pregnancyMultiplierRaw = 1;
			
			cocks = new Array();
			
			cumMultiplierRaw = 1;
			cumType = 0;
			ballSizeRaw = 0;
			ballFullness = 0;
			ballEfficiency = 10;
			refractoryRate = 0;
			minutesSinceCum = 9999;
			timesCum = 0;
			
			createStatusEffect("Planted", 0, 0, 0, 0, false, "Icon_Constricted", "Solid footing to the ground prevents being tripped or staggered.", true, 0);
			createStatusEffect("Disarm Immune");
			createStatusEffect("Force It Gender");
			
			if(rand(10) == 0) inventory.push(new Kirkite());
			
			isUniqueInFight = false;
			btnTargetText = "Sand Worm";
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SANDWORM";
		}
		
		/*
		Enemy summary:
		Whack A Mole/Duck Hunt fighting style. It has a three turn combat sequence and it will cycle through them as combat goes on. The first two is where it is underground and all damage done to it is diminished by 95% while acting like a normal enemy. Characters with physique or aim of more than 80% their possible maximum have the diminishing percentage lowered to 45%. The first two causes it to burrow directly underneath the player if it has 30 or more energy and knocka the character over while doing 20 base physical damage unless they have a hoverboard. If it does not have enough energy it will rest to regain 20 points of energy. The last turn will be where it is above ground and is immune to all special attacks but will be defeated with one normal melee or ranged attack. While above ground it has a one shot victory weakness that has a [100 - ((AIM * ½) + (REFLEXES * ½))]% chance of missing and during this turn it will spit an aphrodisiac laced slime globule, that is its main form of fighting the player, for 20 points of base lust damage. Enemy has a very small chance of dropping a kirkite crystal on defeat, you know, to go with the whole "more common around green skins" thing. I know their skin isn’t green but they are completely green on the inside.
		*/
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if(target == null) return;
			
			var attacks:Array = [];
			
			if(hasStatusEffect("Burrowed"))
			{
				if(energy() >= 30 && !target.hasStatusEffect("Tripped")) attacks.push(attackBurrowRam);
				else if(energy() >= 20) attacks.push(turnSkip);
			}
			if(!hasStatusEffect("Burrowed"))
			{
				attacks.push(attackSpit);
			}
			if(energy() < 20) attacks.push(specialRest);
			
			if(attacks.length > 0) attacks[rand(attacks.length)](target);
			else turnSkip(target);
			
			// Change positions after turn ends. Switch position on the turn turn.
			changePosition(((CombatManager.getRoundCount() % 3 == 0) ? 1 : 0), true);
		}
		
		public function changePosition(position:int = 0, auto:Boolean = false):void
		{
			switch(position)
			{
				// if below ground:
				case 0:
					if(hasStatusEffect("Burrowed")) return;
					
					if(auto) output("\n\nThe sand worm quickly burrows itself underground, <b>protecting itself from any attacks</b>.");
					
					this.long = "The sand worm you’re fighting is currently burrowing in the sand around you. You can see where it is by following the small bulge it makes in the sandy earth. Whatever you try to do to it now will likely not have much effect on it. <b>Maybe you should wait until it is exposed so that you can do more damage?</b>";
					
					baseHPResistances.kinetic.damageValue = 95.0;
					baseHPResistances.electric.damageValue = 95.0;
					baseHPResistances.burning.damageValue = 95.0;
					baseHPResistances.freezing.damageValue = 95.0;
					baseHPResistances.corrosive.damageValue = 95.0;
					baseHPResistances.poison.damageValue = 95.0;
					baseHPResistances.psionic.damageValue = 95.0;
					baseHPResistances.drug.damageValue = 95.0;
					baseHPResistances.pheromone.damageValue = 95.0;
					baseHPResistances.tease.damageValue = 95.0;
					
					createStatusEffect("Burrowed", 0, 0, 0, 0, false, "Icon_DefUp", "Currently dug-in and hidden underground. <b>Resistances boosted!</b>", true, 0);
					break;
				// if above ground:
				case 1:
					if(!hasStatusEffect("Burrowed")) return;
					
					if(auto) output("\n\nThe sand worm pokes its head out from an opening in the ground, <b>potentially exposing itself to any attacks</b>.");
					
					this.long = "The majority of the creature’s vulnerable-looking front end is poking out of the sand, looking at you. The sand worm wiggles this way and that, almost like a charmed snake poking out of an urn. It may not look like it’s doing anything dangerous at the moment, but you have a feeling that it might have a tactical move at the ready. <b>To hit it now will likely result in a quick victory. Unfortunately the likelihood of hitting your surprisingly agile foe may be a long shot.</b>";
					
					baseHPResistances.kinetic.damageValue = -95.0;
					baseHPResistances.electric.damageValue = -95.0;
					baseHPResistances.burning.damageValue = -95.0;
					baseHPResistances.freezing.damageValue = -95.0;
					baseHPResistances.corrosive.damageValue = -95.0;
					baseHPResistances.poison.damageValue = -95.0;
					baseHPResistances.psionic.damageValue = -95.0;
					baseHPResistances.drug.damageValue = -95.0;
					baseHPResistances.pheromone.damageValue = -95.0;
					baseHPResistances.tease.damageValue = -95.0;
					
					removeStatusEffect("Burrowed");
					break;
			}
		}
		
		public function turnSkip(target:Creature):void
		{
			var plural:Boolean = ((target is PlayerCharacter) || target.isPlural);
			
			output("The sand worm continues to shift the ground beneath " + target.getCombatName() + ", possibly waiting for the right time to strike.");
		}
		
		private function specialRest(target:Creature):void
		{
			var plural:Boolean = ((target is PlayerCharacter) || target.isPlural);
			
			output("The ground has stopped shifting, and " + target.getCombatName() + " do" + (plural ? "" : "es") + "n’t hear the sound of the worm moving through the sands anymore. It must be resting for a bit... Ah, just there! " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " can see it moving again after the short pause, with <b>what seems to be renewed speed and vigor</b>.");
			
			energy(+20);
		}
		
		private function attackBurrowRam(target:Creature):void
		{
			var plural:Boolean = ((target is PlayerCharacter) || target.isPlural);
			
			output("The worm stops for a second before it redoubles its burrowing speed, encircling " + target.getCombatName() + ". Suddenly it takes a sharp turn in " + target.getCombatPronoun("hisher") + " direction!");
			// if has hoverboard:
			if(target.hasItemByClass(Hoverboard))
			{
				output(" Remembering that " + target.getCombatPronoun("heshe") + " " + (plural ? "have" : "has") + " a hoverboard, " + target.getCombatName() + " quickly read" + (plural ? "y" : "ies") + " it, just in time for the ground under " + target.getCombatPronoun("himher") + " to become uneven as the worm burrows past. It causes " + target.getCombatPronoun("himher") + " to wobble a bit, but ultimately " + target.getCombatPronoun("heshe") + " " + (plural ? "are" : "is") + " left unscathed; and " + target.getCombatPronoun("heshe") + " descend" + (plural ? "" : "s") + " back to the ground.");
			}
			// enemyBurrowRamMiss
			else if(combatMiss(this, target) || target.isPlanted())
			{
				output(" The worm quickly turns up the ground where " + target.getCombatPronoun("heshe") + " " + (plural ? "were" : "was") + " standing only a few moments ago.");
				if(target is PlayerCharacter) output(" Phew.");
				output(" Thanks to " + target.getCombatPronoun("hisher") + " " + (!target.isPlanted() ? "quick reflexes" : "strong footing") + " " + target.getCombatName() + " " + (plural ? "are" : "is") + " able to dodge its ramming attack without a scratch!");
			}
			// enemyBurrowRamHit
			else
			{
				output(" The worm turns up the ground beneath " + target.getCombatPronoun("himher") + ", knocking " + target.getCombatPronoun("himher") + " over with enough force to roll " + target.getCombatPronoun("himher") + " several meters away. " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " land" + (plural ? "" : "s") + " on a number of rocks and debris along the way. That is going to leave a bruise!");
				
				//CombatAttacks.SingleMeleeAttackImpl(this, target, false);
				var damage:TypeCollection = this.meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target, "melee");
				CombatAttacks.applyTrip(target);
			}
			
			energy(-30);
		}
		
		private function attackSpit(target:Creature):void
		{
			var plural:Boolean = ((target is PlayerCharacter) || target.isPlural);
			
			output("Several glands inside of its mouth go into overdrive as it leans backwards and readies for an attack. Like a catapult launching a boulder, it lobs a green globule of slime at " + target.getCombatName() + " with a whip-like action.");
			// enemySpitMiss
			if(rangedCombatMiss(this, target))
			{
				output(" " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " hurriedly dodge" + (plural ? "" : "s") + " to the side, narrowly avoiding being hit by the projectile!");
			}
			// enemySpitHitLustImmuneArmor
			else if(target.hasAirtightSuit())
			{
				output(" The slime hits " + target.getCombatPronoun("himher") + " straight in the chest and splatters all across your body. " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " can feel it coating the surface of your [pc.gear], but thankfully it can’t seem to penetrate it, and " + target.getCombatPronoun("heshe") + " " + (plural ? "are" : "is") + " left safe.");
			}
			// enemySpitHit
			else
			{
				output(" The slime hits " + target.getCombatPronoun("himher") + " straight in the chest, and splatters all across " + target.getCombatPronoun("hisher") + " body. " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " can almost feel it being absorbed by " + target.getCombatPronoun("hisher") + " skin through " + target.getCombatPronoun("hisher") + " [pc.gear]. The purpose of the slime is soon made clear as " + target.getCombatPronoun("heshe") + " feel" + (plural ? "" : "s") + " a tingling in " + target.getCombatPronoun("hisher") + " ass, and a lustful heat that spreads across " + target.getCombatPronoun("hisher") + " body. " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " find" + (plural ? "" : "s") + " " + ((target is PlayerCharacter) ? "your" : target.getCombatPronoun("himher")) + "self one step closer to being paralyzed by " + target.getCombatPronoun("hisher") + " own mounting needs.");
				
				//CombatAttacks.SingleRangedAttackImpl(this, target, false);
				var damage:TypeCollection = this.rangedDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target, "ranged");
			}
		}
	}
}

