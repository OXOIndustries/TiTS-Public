package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Armor.ChitPlate;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.StorageClass;
	import classes.VaginaClass;
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
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	public class BothriocQuadomme extends Creature
	{
		public function BothriocQuadomme()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "bothrioc dominatrix";
			originalRace = "bothrioc";
			a = "the ";
			capitalA = "The ";
			//long = "";
			customBlock = "The bothrioc’s armor deflects your attack with alarming ease.";
			isPlural = false;
			isLustImmune = false;
			
			meleeWeapon = new Fists();
			meleeWeapon.attackNoun = "kick";
			meleeWeapon.attackVerb = "kick";
			meleeWeapon.longName = "stiletto";
			meleeWeapon.baseDamage.kinetic.damageValue = 15;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;
			
			armor = new ChitPlate();
			
			shieldDisplayName = "ARMOR";
			shield = new BasicShield();
			shield.shields = 50;
			shield.resistances.addFlag(DamageFlag.BOTHRIOCARMOR);
			shield.hasRandomProperties = true;
			
			baseHPResistances.kinetic.damageValue = 30.0;
			baseHPResistances.electric.damageValue = 30.0;
			baseHPResistances.burning.damageValue = 30.0;
			baseHPResistances.pheromone.damageValue = 45.0;
			baseHPResistances.tease.resistanceValue = -10.0;
			
			physiqueRaw = 18;
			reflexesRaw = 25;
			aimRaw = 18;
			intelligenceRaw = 10;
			willpowerRaw = 8;
			libidoRaw = 30;
			shieldsRaw = shieldsMax();
			energyRaw = energyMax();
			lustRaw = 30;
			
			level = 9;
			XPRaw = bossXP();
			credits = 0;
			HPMod = 75;
			HPRaw = HPMax();
			
			femininity = 35;
			eyeType = GLOBAL.TYPE_BOTHRIOC;
			eyeColor = "black";
			tallness = 84;
			thickness = 20;
			tone = 70;
			hairColor = "black";
			scaleColor = "black";
			furColor = "black";
			hairLength = 12;
			hairType = GLOBAL.TYPE_BOTHRIOC;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_CHITIN;
			skinTone = "pale";
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			faceType = GLOBAL.TYPE_BOTHRIOC;
			faceFlags = [GLOBAL.FLAG_SMOOTH];
			tongueType = GLOBAL.TYPE_BOTHRIOC;
			tongueFlags = [GLOBAL.FLAG_LONG];
			lipMod = 2;
			earType = 0;
			antennae = 0;
			horns = 0;
			hornType = 0;
			armType = GLOBAL.TYPE_BOTHRIOC;
			armFlags = [GLOBAL.FLAG_CHITINOUS];
			gills = false;
			legType = GLOBAL.TYPE_BOTHRIOC;
			legCount = 4;
			legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_CHITINOUS, GLOBAL.FLAG_HEELS];
			genitalSpot = 0;
			tailType = GLOBAL.TYPE_BOTHRIOC;
			tailCount = 1;
			tailFlags = [GLOBAL.FLAG_CHITINOUS];
			tailGenitalArg = 0;
			tailGenital = 0;
			tailVenom = 0;
			tailRecharge = 5;
			hipRatingRaw = 0;
			buttRatingRaw = 2;
			cocks = [];
			var c:CockClass = new CockClass();
			cocks.push(c);
			c.cLengthRaw = 12;
			c.cThicknessRatioRaw = 1.75;
			c.cType = GLOBAL.TYPE_BOTHRIOC;
			c.addFlag(GLOBAL.FLAG_LUBRICATED);
			c.addFlag(GLOBAL.FLAG_OVIPOSITOR);
			c.addFlag(GLOBAL.FLAG_RIBBED);
			
			vaginas = [];
			var v:VaginaClass = new VaginaClass();
			vaginas.push(v);
			v.wetnessRaw = 2;
			v.loosenessRaw = 3;
			v.type = GLOBAL.TYPE_BOTHRIOC;
			
			balls = 0;
			cumMultiplierRaw = 6;
			impregnationType = "BothriocPregnancy";
			cumQualityRaw = 1;
			cumType = GLOBAL.FLUID_TYPE_CUM;
			ballSizeRaw = 1.5;
			ballFullness = 1;
			ballEfficiency = 10;
			refractoryRate = 6;
			minutesSinceCum = 3650;
			timesCum = 321;
			
			elasticity = 1;
			fertilityRaw = 1.05;
			clitLength = .5;
			pregnancyMultiplierRaw = 1;
			
			breastRows[0].breastRatingRaw = 0;
			nippleColor = "black";
			milkMultiplier = 0;
			milkType = GLOBAL.FLUID_TYPE_MILK;
			milkRate = 0;
			ass.wetnessRaw = 0;
			
			isUniqueInFight = true;
			btnTargetText = "B.Quadomme";
			
			createStatusEffect("Disarm Immune");
			createStatusEffect("Force It Gender");
			sexualPreferences.setRandomPrefs(2 + rand(3));
			
			inventory = [];
			if (rand(5) == 0) inventory.push(RandomInCollection(new Kirkite(), new Satyrite(), new Picardine()));
			
			kGAMECLASS.myrellionSSTDChance(this);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "BOTHRIOC_QUADOMME";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Grappled"))
			{
				molest(target);
				return;
			}
			else _molestTurns = 0;
			
			var webCD:StorageClass = getStatusEffect("Web CD");
			if (webCD != null)
			{
				webCD.value1--;
				if (webCD.value1 <= 0)
				{
					removeStatusEffect("Web CD");
					webCD = null;
				}
			}
			
			var grappleCD:StorageClass = getStatusEffect("Grapple CD");
			if (grappleCD != null)
			{
				grappleCD.value1--;
				if (grappleCD.value1 <= 0)
				{
					removeStatusEffect("Grapple CD");
					grappleCD = null;
				}
			}
			
			// PC subsequently does not use ranged weapon or grenade for two turns:
			var evade:StorageClass = getStatusEffect("Ranged Evade");
			if (evade != null)
			{
				evade.value1++;
				evade.value2 = 0;
				if (evade.value1 >= 3)
				{
					output("The dominatrix relaxes itself, going back to its apparently languid state now you’ve stopped shooting at it.");
					output("\n\n");
					removeStatusEffect("Ranged Evade");
					evade = null;
				}
			}
			
			var counter:StorageClass = getStatusEffect("Melee Counter");
			if (counter != null)
			{
				counter.value1++;
				counter.value2 = 0;
				if (counter.value1 >= 3)
				{
					removeStatusEffect("Melee Counter");
					counter = null;
				}
			}
			removeStatusEffect("Melee Hit");
			
			// enemy AI
			var enemyAttacks:Array = [];
			
			if(!hasStatusEffect("Web CD") && !target.hasStatusEffect("Web") && lust() >= 30) enemyAttacks.push( { v: reapplyWeb, w: 20 } );
			if(target.energy() >= 30) enemyAttacks.push( { v: energyDrain, w: 10 } );
			enemyAttacks.push( { v: loveBite, w: 10 } );
			enemyAttacks.push( { v: stilettoSock, w: 10 } );
			
			if(enemyAttacks.length > 0)
			{
				var attack:Function = weightedRand(enemyAttacks);
				attack(target);
			}
			else CombatAttacks.SingleMeleeAttackImpl(this, target);
			
			if(!hasStatusEffect("Grapple CD") && target.hasStatusEffect("Web") && !target.hasStatusEffect("Grapple"))
			{
				webStick(target);
			}
		}
		
		// Attack Web
		// Auto-succeeds with thermal weaponry. Otherwise strength roll
		public function attackWeb(attacker:Creature):void
		{
			kGAMECLASS.clearOutput();
			
			var bMelee:Boolean = (attacker.hasMeleeWeapon() && (attacker.meleeWeapon.baseDamage.burning.damageValue > 0 || attacker.meleeWeapon.baseDamage.corrosive.damageValue > 0));
			var bRanged:Boolean = (attacker.hasRangedWeapon() && (attacker.rangedWeapon.baseDamage.burning.damageValue > 0 || attacker.rangedWeapon.baseDamage.corrosive.damageValue > 0));
			var success:Boolean = ( bMelee || bRanged || (attacker.physique() + (rand(60) - 39) > 30) );
			
			output("Turning away from the dominatrix you");
			if(bMelee) output(" swing your " + attacker.meleeWeapon.longName + " at");
			else if(bRanged) output(" use your " + attacker.rangedWeapon.longName + " on");
			else output(" swing your arms at");
			output(" the ghostly veils and threads of gossamer trailing down from the ceiling, quickly trying to carve yourself out a bit of room so that every movement of yours isn’t coming into contact with human-sized flypaper.");
			
			if (success)
			{
				output(" You shake your wrists out and growl with satisfaction as the infuriating substance flops onto the ground all around you. <b>You have removed the bothrioc’s webs.</b>");
				output("\n\n<i>“Get it all out of your system?”</i> says the dominatrix with an edge of irritation. <i>“It’s not the web’s fault you’re so clumsy and aggressive, you know.”</i>");
				
				attacker.removeStatusEffect("Web");
				createStatusEffect("Web CD", 4, 0, 0, 0, true);
			}
			else
			{
				output(" As hard as you thrash at it though, you cannot slice your way cleanly through it. This stuff is like the galaxy’s most durable rubber coated in tar!");
				output("\n\n<i>“So vigorous and full of vim,”</i> sighs the bothrioc, watching from above with obvious satisfaction. <i>“Wasted on pointless struggles. Have I told you that you need a firm, guiding hand yet farlander? There are so many better tasks I could be putting that youthful energy of yours to.”</i>");
			}
			
			CombatManager.processCombat();
		}
		
		// Reapply Web
		// Loses 30 lust. Can only activate once every three turns
		private function reapplyWeb(target:Creature):void
		{
			output("The dominatrix closes its black eyes and points its insect abdomen downwards, directing its spinnerets at the ceiling. You are treated to a close up of its dripping ovipositor as it tenses up and then sprays clear, gooey gossamer all over the rock above. You heave a weary sigh as you feel strings of the stuff droop down all around you. <b>The bothrioc has reapplied its web.</b>");
			output("\n\n<i>“Stop pouting,”</i> it says, lazily opening its eyes to gaze at you smugly. <i>“You’ll come to love this stuff eventually.”</i>");
			
			CombatAttacks.applyWeb(target);
			createStatusEffect("Web CD", 6, 0, 0, 0, true);
			lust(-20);
		}
		private function webStick(target:Creature):void
		{
			// PC gets stuck
			if (!rangedCombatMiss(this, target))
			{
				output("\n\nAs you tackle the dominatrix you try your very best to keep yourself clear of the threads and thatches of its opaque, swaying silk, but in this cramped, dark space it’s almost impossible. Your arm gets stuck in a swathe of it, and as you are struggling with that first your other arm and then your " + target.lowerBody() + " gets pasted with gluey, devilishly strong gossamer too.");
				output("\n\n<i>“Oh dear,”</i> coos your opponent with malicious glee. <i>“Who would’ve thought fighting a bothrioc in its own web would be a bad idea? Never mind, succulent morsel. Let’s make it into the best mistake you’ve ever made.”</i>");
				
				CombatAttacks.applyGrapple(target);
				createStatusEffect("Grapple CD", 5, 0, 0, 0, true);
			}
		}
		// PC struggles
		public function webStruggle(attacker:Creature):void
		{
			var success:Boolean = ((attacker.hasMeleeWeapon() && attacker.meleeWeapon.baseDamage.burning.damageValue > 0) || (attacker.physique() + (rand(60) - 39) > 30));
			if (success)
			{
				output("With a wet ripping sound you manage to pull your arms clear. You fling off the torn gossamer, stagger back a couple of paces and meaningfully level your weapon at the dominatrix.");
				output("\n\n<i>“I do wish you’d stop struggling against the inevitable,”</i> it grumbles. <i>“You’re only making sure I make your bonds extra thick when you do finally give in.”</i>");
				attacker.removeStatusEffect("Grappled");
			}
			else
			{
				output("Desperately you writhe and pull against the sticky thread that binds you, desperately trying to work some slack into the elastic substance and wrench your way clear. But no matter how hard you struggle, you cannot extricate yourself; every wrench of your limbs only seems to get you even more tangled up. This stuff is meant to hold human-sized creatures, and it shows.");
			}
			
			CombatManager.processCombat();
		}
		
		// Molest
		// Only activates if PC is bound. Heavy tease damage
		private var _molestTurns:int = 0;
		private function molest(target:Creature):void
		{
			// First turn PC bound:
			if(_molestTurns <= 0)
			{
				output("The dominatrix glides downwards, its four legs tacking its webs until it is hanging directly over you. Tangled up in the sticky gossamer as you are you cannot stop it laying its four smooth hands on your form, sliding " + (target.isNude() ? "over your form" : "beneath your clothes") + ", testing, fingering and cusping your flesh.");
				output("\n\n<i>“No tricks, morsel,”</i> it whispers. <i>“No poison, pheromones: that is for brutes, nyrea, that sort of trash. I don’t need them. Once I’ve spent a bit of time with you I will be able to make you arch your back and lose all your words with a single stroke of my finger.”</i>");
			}
			// Subsequent turn:
			else
			{
				output("The dominatrix is all over you, its four hands stroking, grasping, lightly pinching your " + target.skin() + ", its warm, bare chest brushing gently against your " + target.chestDesc() + ". The worst part of it is how fast a learner it seems to be; with every caress it lavishes on the nape of your neck");
				if(target.hasCock()) output(", your hardening " + target.cocksDescript());
				if(target.hasVagina()) output(", your " + target.vaginasDescript());
				output(" and your increasingly " + (target.hasErectNipples() ? "erect" : "moist") + " " + target.nipplesNoun() + " it tightens its focus on your most sensitive areas, alternating the briskness with which it touches them so that you can never phase it out.");
				output("\n\n<i>“Give in,”</i> it breathes in your ear. <i>“I will make it so good for you if you would just learn to obey.”</i>");
			}
			_molestTurns++;
			applyDamage(new TypeCollection( { tease: 32 } ), this, target, "minimal");
		}
		
		// Energy Drain
		// Kinetic
		// HP and 30 energy loss
		private function energyDrain(target:Creature):void
		{
			output("The dominatrix suddenly shoots down behind your guard and strikes at you quickly from four different angles. You can’t block them all and you flinch as its chops hit home. It seems to be aiming at pressure points");
			if(target.hasArmor() && armor.defense > 0) output(" and specific parts of your armor");
			output("; when you drive it backwards and set yourself afresh you feel sapped and weary. The monstrous androgyne grins at you knowingly.");
			
			applyDamage(new TypeCollection( { kinetic: 8 }, DamageFlag.BYPASS_SHIELD ), this, target, "minimal");
			target.energy(-30);
		}
		
		// Love Bite
		// Kinetic/Penetrating, Tease
		// Standard attack. Small HP loss + lust gain
		private var _biteTurns:int = 0;
		private function loveBite(target:Creature):void
		{
			output("The quadomme eyes you slyly, sliding threads through its hands before abruptly abseiling down, clasping you around the shoulders");
			if(!target.isNude()) output(", baring your flesh");
			output(" and planting its sharp teeth in the softness between neck and collarbone and hollowing its cheeks. You don’t have time to do much more than gasp before it swings back towards the ceiling. It doesn’t feel like it injected anything into you, but... the preciseness with which it did that. Like it knew, just from looking, exactly which part of you to nibble to make " + ((target.lust() >= 66 && target.hasKnees()) ? "you feel a bit weak at the knees" : "heat draw to your [pc.skin]") + ".");
			if(_biteTurns > 0) output(" You’ve got to stop it from doing that, if only so you don’t wind up looking like you’re wearing a hickey necklace.");
			
			_biteTurns++;
			applyDamage(new TypeCollection( { kinetic: 8, tease: 16 }, DamageFlag.PENETRATING ), this, target, "minimal");
		}
		
		// Stiletto Sock
		// High damage Kinetic/Penetrating
		private function stilettoSock(target:Creature):void
		{
			output("The quadomme swings this way and that in its web, as if teasing you with its lithe, snow-white body... and then at the apex of a swing it rears around and delivers a strong, vicious kick at you, armored stiletto heel first.");
			
			applyDamage(new TypeCollection( { kinetic: 32 }, DamageFlag.PENETRATING ), this, target, "minimal");
		}
	}
}

