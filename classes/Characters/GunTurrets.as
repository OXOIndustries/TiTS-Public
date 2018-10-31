package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	
	//**************************************************
	//Listed as chars["AUTOTURRETS"] in code elsewhere!
	//**************************************************
	public class GunTurrets extends Creature
	{
		//constructor
		public function GunTurrets()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "auto-turrets";
			this.originalRace = "automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A mass of turrets and floating drones have been set up like a firing squad in the foyer of the lift station, all barrels training on you. A rag-tag mix of makes and models, most of them look like they belong in antique tech shops - or scrap heaps. But that doesn’t mean they’re not dangerous: you’re surrounded by a hail of lead every time you try and move, made worse as the cat-girl controlling them takes pot-shots at you between the incoming volleys.";
			this.customDodge = "Somehow, the turrets’ swivelling moves them out of the way.";
			this.customBlock = "The armor plates soak up your attack.";
			this.isPlural = true;
			isLustImmune = true;
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "gun";
			this.rangedWeapon.attack = -2;
			rangedWeapon.baseDamage.kinetic.damageValue = 2;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 14;
			this.reflexesRaw = 4;
			this.aimRaw = 19;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 20;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 75;
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
			this.legCount = 3;
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
			
			isUniqueInFight = true;
			btnTargetText = "Turrets";
			
			this._isLoading = false;

		}
		
		override public function get bustDisplay():String
		{
			return "TAMTURRETS";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Turret Aimhacks"))
			{
				turretVolleyAttackMotherFucker(target);
				return;
			}
			if(HP()/HPMax() < 0.5 && !hasStatusEffect("Phase 2"))
			{
				tamtamPhaseTwoLetsGo(target);
				return;
			}
			var choices:Array = new Array();
			choices[choices.length] = turretVolleyAttackMotherFucker;
			choices[choices.length] = laserSightShot;
			choices[choices.length] = shootFasterAttack;
			choices[choices.length] = thermalDisruptorFromTam;
			if(hasStatusEffect("Phase 2"))
			{
				choices[choices.length] = tamwolfBiteGogogogogogo;
				choices[choices.length] = tamwolfBiteGogogogogogo;
				choices[choices.length] = tamwolfBiteGogogogogogo;
				if(!target.hasStatusEffect("Blinded")) choices[choices.length] = tamwolfOilslick;
			}
			choices[rand(choices.length)](target);
		}
		
		private function tamwolfOilslick(target:Creature):void
		{
			output("Beneath the wall of turrets, the cyberhound Tam-wolf spins around, positioning his back to you and hiking a leg. Oh, for fuck’s...");
			//Miss:
			if(rangedCombatMiss(this, target) || target.hasBlindImmunity()) output("\n\nYou’re able to get out of the way as a slick streak of machine oils squirts past you, splattering across the floor behind you. The drone-dog whines pitifully as his mistress, the <i>other</i> Tam, snaps, <i>“Bad doggy! You made a mess!”</i>");
			//Hit:
			else
			{
				output("\n\nYou try and cover your eyes, but too late! A streak of machine oil jets out of the drone dog, splattering across your face! <b>You are blinded!</b>");
				CombatAttacks.applyBlind(target, rand(3) + 1);
			}
		}
		
		private function tamwolfBiteGogogogogogo(target:Creature):void
		{
			output("The gunfire dies down, but just enough to give the great big robo-dog Tam-wolf a clear shot at you. With a fearsome digital growl, the cyberhound launches itself at you for a savage mauling!");
			//Miss:
			if(combatMiss(this, target)) output("\n\nYou dodge aside, letting the cyberhound’s momentum carry him past you. Still, the drone makes a solid landing, skidding to a halt with teeth bared.");
			//Hit:
			else
			{
				output("\n\nYou get your arm up in time to block the bite, but wince in pain as the cybehound’s fangs sink into ");
				if(target.armor.shortName == "") output("you");
				else output("your [pc.armor]");
				output(".");
				
				var damage:TypeCollection = damage(true);
				damage.add(physique() / 2);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		} 
		
		public function tamtamPhaseTwoLetsGo(target:Creature):void
		{
			// Play when the Turret Fight reaches half its normal health
			output("You’re slowly tearing through the turrets. The foyer has certainly seen better days: it’s littered with broken bits of machinery and destroyed turret husks, not to mention the walls riddled with bullet holes. Still, you’re making progress, and the cat-girl behind the counter is starting to look awfully nervous. Finally, she plants her hands on her (now that you look, surprisingly big) hips and scowls at you.");
			output("\n\n<i>“Look at what you did to my poor turrets! What did they ever do to you, huh!?”</i> she shouts over the din of gunfire as her pets continue to fire at you. <i>“Well fine! Boss said nobody gets past here, so I’ll just have to use my SUPER SECRET WEAPON! Come on out, boy!”</i>");
			output("\n\nWhat!? You look up just in time to see the door behind the desk being bashed open and a huge, quadrupedal black form rush out. It leaps over the desk, skidding to a halt between you and the guns, barring a set of glittering metallic teeth. It looks like ");
			if(target.characterClass != GLOBAL.CLASS_ENGINEER) output("some kind of crazy cyber dog");
			else output("a canid-formed Fenris-class attack drone");
			output(", complete with razor claws and fangs.");
			output("\n\n<i>“Go get " + target.mf("him","her") + ", Tam-wolf!”</i> the cat-girl cheers, pumping a fist into the air.");
			output("\n\n<i>“Yes, mistress Tam,”</i> a synthesized robotic voice answers, following by a bass-heavy digital growl.");
			
			long = "A mass of turrets and floating drones have been set up like a firing squad in the foyer of the lift station, all barrels training on you. A rag-tag mix of makes and models, most of them look like they belong in antique tech shops -- or scrap heaps. But that doesn’t mean they’re not dangerous: you’re surrounded by a hail of lead every time you try and move, made worse as the cat-girl controlling them takes pot-shots at you between the incoming volleys. Between you and the drones, making your life a lot tougher, is a powerfully built canine attack drone with razor-sharp fangs ready to tear into you!";
			short = "Tams and turrets";
			createStatusEffect("Phase 2",0,0,0,0,true,"","",true,0);
		}
		
		private function thermalDisruptorFromTam(target:Creature):void
		{
			output("Out of the corner of your eye, you catch sight of the cat-girl loading a big shell into what looks like a wrist-launcher. Oh, shit.");
			output("\n\n<i>“Hope you didn’t need your FACE!”</i> she cheers, leveling her wrist at you and firing!");
			//Miss:
			if(rangedCombatMiss(this, target))
			{
				output("\n\nYou dive just in time as a disruptor shell goes over you, blasting a massive hole in the wall! <i>“Oops!”</i> she giggles, <i>“Guess we’re redecorating!”</i>");
			}
			//Hit:
			else
			{
				output("\n\nThe disruptor shot slams straight into you, burning at you in a conflagration of fire!");
				if(!target.hasStatusEffect("Degraded Armor")) 
				{
					output(" <b>The effectiveness of your armor is temporarily reduced!</b>");
					target.createStatusEffect("Degraded Armor", 0, 0, 0, 0, false, "DefenseDown", "Your armor is temporarily degraded and will not provide any defensive benefit.", true, 0);
				}
				var damage:TypeCollection = new TypeCollection( { burning: 18 } );
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				
				var msg:String = "";
				msg += "\n\nThe cat-girl grins, blowing the smoke from her launcher’s barrel. <i>“Bam said the man! Feel free to surrender any time... I won’t be too rough on you!”</i>";
				msg += "\n\nHer grin turns savage. <i>“Just kidding! I like it";
				if (kGAMECLASS.silly && hasStatusEffect("Phase 2")) msg += " ruff";
				else msg += " rough";
				msg += "!”</i>";
				output(msg);
			}
		}
		
		private function shootFasterAttack(target:Creature):void
		{
			output("Amid the hail of incoming gunfire, you see the pink-haired cat-girl duck down behind the desk, fiddling with the holoband around her wrist. As she does so, laser sights appear beneath the turrets, all tracking towards you. Incoming!");
			createStatusEffect("Turret Aimhacks",0,0,0,0,true,"","",true,0);
		}
		
		private function turretVolleyAttackMotherFucker(target:Creature):void
		{
			output("You find yourself under a hail of gunfire, every turret in the room bearing down on you and firing full-auto, sacrificing accuracy for sheer volume of firepower. And it’s working: duck and weave as you might, there’s a stream of bullets crashing behind you, tearing into the walls with deafening force.\n");
			
			var asFlurry:Boolean = !hasStatusEffect("Turret Aimhacks");
			
			for (var i:int = 0; i < 4; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, asFlurry);
				output("\n");
			}
			
			if (hasStatusEffect("Turret Aimhacks")) removeStatusEffect("Turret Aimhacks");
		}
		
		private function laserSightShot(target:Creature):void
		{
			output("Ducking and weaving through the storm of bullets headed your way, you see the cat-girl standing stock still, a holographic scope appearing over the barrel of her laser pistol. <i>“Heads up!”</i> she grins, leveling the gun right at you.");
			//Miss:
			if(rangedCombatMiss(this, target))
			{
				output("\n\nShe squeezes the trigger, but just a second too late. You tumble to the side, the bolt crashing through the space you occupied a second before. A near miss -- very near.");
			}
			//Hit:
			else
			{
				output("\n\nShe squeezes the trigger, and a bright bolt of laser fire slams right into you, nearly knocking you off your [pc.feet]! Damn, she’s a deadeye!");
				var damage:TypeCollection = damage(false);
				damage.add(aim() / 2);
				damage.multiply(2.2);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
	}
}