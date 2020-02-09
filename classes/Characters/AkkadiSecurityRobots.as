package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.SecureMP;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Accessories.FlashGoggles;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.possessive;
	import classes.StringUtil;
	
	import classes.UIComponents.UIStyleSettings;

	public class AkkadiSecurityRobots extends Creature
	{
		
		public function AkkadiSecurityRobots(lives:int = 0) 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "drone";
			this.originalRace = "automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
//			this.customDodge = "Somehow, the robot manages to move out of the way of your fire.";
//			this.customBlock = "The hardened exterior of the robot absorbs your attack.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new ShockBlade();
			this.rangedWeapon = new SecureMP();
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.shields = 215;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 4;
			this.aimRaw = 14;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 20;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "steel gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
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

			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = false;
			btnTargetText = "Drone";
			
			this.lives = lives;
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if (hasStatusEffect("Valden-Possessed")) return "VALDEN";
			return "AKKADIROBOTS";
		}

		public static function encounterTextGen():String
		{
			var enctext:String = "You’re fighting Akkadi security bots!";
			enctext += "\n\nEach bot is a mechanical quadruped, more lizard-like than canid, with a squat body covered in sleek armor plates. Rather than a head, they have angled blast shields that face you, parted around the barrel of a gun and a laser sight that ceaselessly tracks your movements. There’s still ";
			if (CombatManager.enemiesAlive() == 1) enctext += "one standing!";
			else if (CombatManager.enemiesAlive() == 2) enctext += "two standing!";
			else enctext += "several robots in the fray!";
			return enctext;
		}
		
		//How to respawn these things argh
		private var lives:int;
		override public function isDefeated():Boolean
		{
			if (!super.isDefeated() || (hasStatusEffect("BotRevivinBlues"))) return false;
			if (hasStatusEffect("Valden-Possessed")
				|| (hasStatusEffect("DefeatChecked") && statusEffectv1("DefeatChecked") == CombatManager.getRoundCount()) 
				|| lives == 0
				|| (lives < 0))
			{
				if (hasStatusEffect("DefeatChecked")) setStatusValue("DefeatChecked", 1, CombatManager.getRoundCount());
				//Should only check once per round
				createStatusEffect("DefeatChecked", CombatManager.getRoundCount());
				return true;
			}
			--lives;
			createStatusEffect("BotRevivinBlues")
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is AkkadiSecurityRobots) (ally as AkkadiSecurityRobots).lives = lives;
			return false;
		}
		public function botHeal():void
		{
			if (super.isDefeated()) return;
			var botHealing:int = Math.min(5 + rand(16), HPMax() - HP());
			if (botHealing > 0) {
				output("\n\n" + possessive(StringUtil.toTitleCase(getCombatName())) + " repair protocols kick in.");
				var damageResult:DamageResult = new DamageResult();
				damageResult.hpDamage = (-1 * botHealing);
				outputDamage(damageResult);
				HP(botHealing);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (isBlind()
				|| target.hasStatusEffect("Stealth Field Generator")
				|| target.hasStatusEffect("Taking Cover"))
			{
				endTargetLink();
			}
			
			if (hasStatusEffect("BotRevivinBlues"))
				{
					output("<b>One of the " + (lives > 0 ? "remaining" : "numerous") + " drones in the rear takes " + possessive(StringUtil.toTitleCase(getCombatName())) + " place!</b>");
					removeStatuses();
					HP(HPMax());
					shields(shieldsMax());
					return;
				}
		
			if (hasStatusEffect("AKKADI BOT AI SKIP"))
			{
				//Skip meant to work on current turn only
				var skip:Boolean = statusEffectv1("AKKADI BOT AI SKIP") == CombatManager.getRoundCount();
				removeStatusEffect("AKKADI BOT AI SKIP");

				if (skip) return;
			}
			
			//Only the first to go can net or beep-boop-aim, valden doesn't count
			var isTeamLeader:Boolean = true;
			for (var i:int = 0; i < alliedCreatures.indexOf(this); ++i)
				if (alliedCreatures[i] is AkkadiSecurityRobots && !alliedCreatures[i].hasStatusEffect("Valden-Possessed") && !alliedCreatures[i].isDefeated())
					isTeamLeader = false;
			
			if (!target.hasStatusEffect("Akkadi Net Gun Tried") && isTeamLeader && rand(4) == 0)
				totalNetDamage(target, alliedCreatures);
			else if (!hasStatusEffect("Target Link") && isTeamLeader && rand(4) == 0)
				targetLink(alliedCreatures);
			else machinegunBurst(target);
		}
		
		private function machinegunBurst(target:Creature):void
		{
			output(StringUtil.toTitleCase(uniqueName) + " fires a burst of automatic weapons fire at you. Fist-sized beanbags pound into");
			if (rangedCombatMiss(this, target) || blindMiss(this, target))
			{
				output(" the wall behind you!");
			}
			else
			{
				output(" you!");
				applyDamage(damageRand(rangedDamage(), 35), this, target, "minimal");
			}
		}
		
		private function totalNetDamage(target:Creature, allies:Array):void
		{
			//Once per fight
			target.createStatusEffect("Akkadi Net Gun Tried",0,0,0,0,false,"","",true);
			//Them little bots work together so they can't act this turn. 
			for each (var ally:Creature in allies)
			{
				if (!ally.hasStatusEffect("AKKADI BOT AI SKIP")) ally.createStatusEffect("AKKADI BOT AI SKIP", CombatManager.getRoundCount());
				else ally.setStatusValue("AKKADI BOT AI SKIP", 1, CombatManager.getRoundCount())
			}
			
			output(" One of the drones anchors its clawed feet in the floor and launches something from a cannister on its back! The object erupts into a wide, weighted net that");
			if (target.reflexes() > 15 + rand(25) || blindMiss(this, target) || target.evasion() > rand(100))
			{
				output(" you just barely manage to avoid. The weights must be magnetic, as they stick to the wall as well. Nasty surprise!");	
			}
			else
			{
				output(" slams into you, smearing itself against the wall with sticky cables and magnetic weights. Your arms are pinned to your side, and your [pc.weapon] clatters to the ground. A cable connecting you to the offening bot goes taut, and its weapons level at you. Shit!");
				CombatAttacks.applyGrapple(target, 25);
			}
		}
		
		//Note: end effect through endTargetLink, not removeStatusEffect
		private function targetLink(alliedCreatures:Array):void
		{
			var isLoneBot:Boolean = true;		
			var comradesInArms:Boolean = false;
			for each (var ally:Creature in alliedCreatures)
			{
				if (!ally.hasStatusEffect("AKKADI BOT AI SKIP")) ally.createStatusEffect("AKKADI BOT AI SKIP", CombatManager.getRoundCount());
				else ally.setStatusValue("AKKADI BOT AI SKIP", 1, CombatManager.getRoundCount())
				
				if (ally is AkkadiSecurityRobots)
				{
					if (ally != this) isLoneBot = false;
					if (!ally.hasStatusEffect("Target Link"))
					{
						if (ally != this) comradesInArms = true;
						ally.createStatusEffect("Target Link", 3, 8, 0, 0, false, "Icon_RadioSignal", "The robot’s accuracy is increased. Better get its aim off you!", true, 0, UIStyleSettings.gStatusGoodColour);
					}
				}
			}
			
			if (isLoneBot) output("The remaining bot");
			else output("One of the robots");
			output(" raises up on its legs and focuses its targeting laser on you. You hear a whirring sound from the robot’s gun-head, and then it beeps ominously.");
			if (comradesInArms) output(" All the robots beep in unison after that, apparently sharing some sort of linked targeting!");
		}
		public function endTargetLink():void
		{
			if (!hasStatusEffect("Target Link")) return;
			setStatusValue("Target Link", 2, 0);
			setStatusTooltip("Target Link", "The link won’t work again during this fight.");
			setStatusIconShade("Target Link", UIStyleSettings.gStatusBadColour);
		}
/*

You're fighting Akkadi security bots!

Each bot is a mechanical biped, more lizard-like than canid, with a squat body covered in sleek armor plates. Rather than a head, they have angled blast shields that face you, parted around the barrel of a gun and a laser sight that ceaselessly tracks your movements. There's {still one/two standing // still several robots in the fray}!


Robots have medium Health, lots of Shields. Immune to Lust. Regenerate a small amount of Health each turn they are up due to repair protocols.

Machinegun Burst
//Single kinetic attack, medium damage, high accuracy

Drone {X} fires a burst of automatic weapons fire at you. Fist-sized beanbags pound into {you // the wall behind you}!

Net Gun
//Once per fight, between the whole group. Grapples the PC.

One of the drones anchors its clawed feet in the floor and launches something from a cannister on its back! The object erupts into a wide, weighted net that {you just barely manage to avoid. The weights must be magnetic, as they stick to the wall as well. Nasty surprise! //else: slams into you, smearing itself against the wall with sticky cables and magnetic weights. Your arms are pinned to your side, and your [pc.weapon] clatters to the ground. A cable connecting you to the offening bot goes taut, and its weapons level at you. Shit!}

//Escape Grapple
You finally manage to tear your way out of the net!

//TechSpec uses shock to escape
You send a burst of electricity back along the grappling line, right into the offending security bot. It lurches backward and squeals, disconnecting the grappling line. The magnets deactivate, releasing you from the robot's grasp.

Target Link
//Once per fight, between the whole group. Dramatically increase the bots' accuracy for 3 rounds. If the PC stealths or stuns/blinds them, the bonus ends.

{One of the robots // the remaining bot} raises up on its legs and focuses its targeting laser on you. You hear a whirring sound from the robot's gun-head, and then it beeps ominously. {All the robots beep in unison after that, apparently sharing some sort of linked targeting!}

*/
		
		/*private function akkadiSecurityRobotsMachinegunBurst(target:Creature):void
		{
			//Machinegun Burst
			//Single kinetic attack, medium damage, high accuracy
			output(StringUtil.capitalize(possessive(target.getCombatName()), false) + " fires a burst of automatic weapons fire at you. Fist-sized beanbags pound into ");
			if (rangedCombatMiss(this, target)) output("you!");
			else {
				output("the wall behind you!");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}*/
		
		//VALDEN STUFF BEGINS HERE
		

		public static function akkadiBaseValdenFightText():String
		{
			var eText:String = "You’re fighting a horde of security droids, controlled directly by Commander Valden.";
			eText += "\n\nThe man you tried to save may be nothing more than a digital echo of his consciousness, but he’s more than capable of bringing all his military experience to bear against you. ";
			for each (var drone:Creature in CombatManager.getHostileActors()) if (drone.hasStatusEffect("Valden-Possessed")) eText += StringUtil.toTitleCase(drone.uniqueName);
			eText += " has brilliant red sensors covering you, seeming to direct its kin to fight harder. The others march to its tune, firing their lasers in a hail of red streaks amid their inexorable advance.";
			
			return eText;
		}
		
		private static var wantStayStatuses:Array = [];
		private static var wantJumpStatuses:Array = ["Blinded", "Sundered", "Staggered"];
		private static var mustJumpStatuses:Array = ["Stunned", "Tripped", "Paralyzed", "Grappled"];
		//Called in applyHostileActions in GroundCombatContainer just before regular AI stuff
		//returns true if it overrides the host's turn
		public static function ValdenAI(hostCreature:Creature, alliedCreatures:Array, hostileCreatures:Array):Boolean
		{
			//Valden fights the PC only anyways. Sue me.
			var target:Creature = hostileCreatures[0];
			if (target == null) return false;
			
			if (hostCreature.isBlind()
				|| target.hasStatusEffect("Stealth Field Generator")
				|| target.hasStatusEffect("Taking Cover"))
			{
				if (hostCreature is AkkadiSecurityRobots) 
				{
					(hostCreature as AkkadiSecurityRobots).endTargetLink();
				}
			}
			
			//Consider jumping, mustJump should be true if the host npc cannot act normally
			//wantJump if valden might be better off possessing some other bot
			var statusName:String;
			var mustJump:Boolean = 	false;
			for each (statusName in mustJumpStatuses) if (hostCreature.hasStatusEffect(statusName)) mustJump = true;
			var wantJump:Boolean =	hostCreature.HPQ() < 40;
			for each (statusName in wantJumpStatuses) if (hostCreature.hasStatusEffect(statusName)) wantJump = true;
			//Short circuiting works on as3, right?
			if ((mustJump || wantJump) && tryJump(hostCreature)) return true;
			if (mustJump) return false;
			
			//Valden attacks, only if Valden didn't jump this turn.
			if (hostCreature is AkkadiSecurityRobots && hostCreature.statusEffectv1("Valden-Possessed") < CombatManager.getRoundCount() && rand(2) == 0)
			{
				output("\n\n");
				if (hostCreature.shields() < hostCreature.shieldsMax()*0.4 && rand(3) == 0) valdenHeal(hostCreature); 
				else if (!hostCreature.hasStatusEffect("Akkadi Tracer Rounds")) valdenTracerRound(hostCreature, target, alliedCreatures);
				return true;
			}
			return false;
		}
		
		private static function valdenHeal(hostCreature:Creature):void
		{
			output("The drone Valden is inhabiting takes a moment to plant its feet and turtle up behind the heavy metal bulwark that replaces its face. You watch with annoyance as its energy shields thrum, recharging from the damage you’ve inflicted. Damn!");
			var healing:int = Math.min(	Math.round((15 + rand(18) + rand(17))*hostCreature.shieldsMax()/100),
										hostCreature.shieldsMax() - hostCreature.shields());
			hostCreature.changeShields(healing);
		}
		
		private static function valdenTracerRound(hostCreature:Creature, target:Creature, alliedCreatures:Array):void
		{
			output("The lead drone levels its gunbarrel at you and holds for a moment, letting a particularly potent bolt build up before letting lose a shrieking ray of radiant energy straight at you!");
			if (rangedCombatMiss(hostCreature, target) || blindMiss(hostCreature, target)) output(" You just barely find cover in time!")
			else
			{
				output(" The bolt slams into you, burning horribly. The other drones seem transfixed by you for a moment before they let loose shrill noises and start charging, weapons blasting away!");
				var damage:TypeCollection = hostCreature.rangedDamage();
				//extra fire damaging hot damage burnation
				damage.burning.damageValue += 15;
				applyDamage(damageRand(damage, 15), hostCreature, target, "minimal");
				target.createStatusEffect("Tracer Rounds", 2,0,0,0,false,"Icon_DefDown","Aiming at you will be easier.",true,0,UIStyleSettings.gStatusBadColour);
				if (rand(5) == 0) CombatAttacks.applyBurn(target);
				for each (var ally:Creature in alliedCreatures)
				{
					if (ally is AkkadiSecurityRobots)
					{
						ally.createStatusEffect("Tracer Rounds", 2, 5);
					}
				}
			}
		}

		//Number rating how much valden wants to jump into dis bodeh, higher = better
		private static function valdenDesirability(target:Creature):int
		{
			var statusName:String;
			//could be 0, but positive numbers be intuitive yo
			var desirability:int = 100;
			if (target.HPQ() < 40) desirability -= 100;
			desirability += target.shields()/10;
			desirability += target.HP()/5;
			//slight bias to saying and actually doing something, ends in 5 for tie-breaking
			if (target.hasStatusEffect("Valden-Possessed")) desirability += 15;
			for each (statusName in wantStayStatuses) if (target.hasStatusEffect(statusName)) desirability += 10;
			for each (statusName in wantJumpStatuses) if (target.hasStatusEffect(statusName)) desirability -= 10;
			for each (statusName in mustJumpStatuses) if (target.hasStatusEffect(statusName)) desirability -= 50;
			return desirability;
		}
		//Returns true if we could jump and used the turn
		public static var valdenShieldBuffMult:Number = 0.4;
		private static function tryJump(oldHost:Creature):Boolean
		{
			//One jump per round, jumpy lad
			if (oldHost.statusEffectv1("Valden-Possessed") >= CombatManager.getRoundCount()) return false;
			//But jump to who?
			var bots:Array = new Array();
			for each (var ally:Creature in CombatManager.getHostileActors())
				if (ally is AkkadiSecurityRobots && !ally.isDefeated())
					bots.push({bot: ally, score: valdenDesirability(ally)});
			if (bots.length <= 1) return false;
			var score:int = -999;
			var newHost:Creature = bots[0].bot;
			for each (var candidate:Object in bots)
			{
				if (score < candidate.score)
				{
					score = candidate.score;
					newHost = candidate.bot;
				}
			}
			//Already in best available bot
			if (newHost == oldHost) return false;
			
			devaldenize(oldHost, true, newHost);
			return true;
		}
		public static function devaldenize(target:Creature, loud:Boolean = true, newValden:Creature = null):void
		{
			if (loud)
			{
				output("\n\n<i>“Damn!”</i> Valden spits from the");
				if (target.HPQ() < 33) output(" damaged");
				else if (target.hasStatusEffect("Blinded")) output(" blind");
				else output (" afflicted");
				output(" drone’s speakers. <i>“Come on! I’m a damn computer, fucking unkillable! Keep trying, and see where this gets you!”</i>");
			}
			target.removeStatusEffect("Valden-Possessed");
			target.shields(-target.shields()*valdenShieldBuffMult);
			if (newValden != null) valdenize(newValden, loud);
		}
		public static function valdenize(target:Creature, loud:Boolean = true):void
		{
			if (loud)
			{
				output("\n\nBefore you can blink, the drone’s sensors fade back down to the same tone as all the others... except for " + StringUtil.toTitleCase(target.uniqueName) + ", which flares with a sudden inflict of energy.");
				output("\n\n<i>“There we go! I’m back in the game, good as new! How about you?”</i> " + StringUtil.toTitleCase(target.uniqueName) + " bellows in Valden’s voice. <i>“Let’s dance!”</i>");
			}
			if (target.hasStatusEffect("Valden-Possessed")) target.setStatusValue("Valden-Possessed", 1, CombatManager.getRoundCount());
			else target.createStatusEffect("Valden-Possessed", CombatManager.getRoundCount())
			//-1 shield just to force a redraw. if anyone knows a better way to do it, pls fix.
			target.shields(-1);
			target.changeShields(target.shields()*valdenShieldBuffMult+1);
			CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, target);
		}
	}
}