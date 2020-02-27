package classes.Characters
{
	import classes.Creature;
    import classes.Characters.MilodanWarAlpha;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.rand;

	public class Eitan extends MilodanWarAlpha
	{
		public function Eitan()
		{
			XPRaw = 0;
			inventory = new Array();
			short = "Eitan";
			btnTargetText = "Eitan";
			long = "Eitan stands at the ready, his hands raised and his fingers flexed, ready to swipe with his claws at you. His feet tap lightly on the " + (kGAMECLASS.eitanIsCrew() ? "cargo bay" : "tent") + "'s floor, ready to spring in any direction at a moment's notice.\n\nWhat do you do?";
			customDodge = "Eitan is lighter on his feet than he looks: he dodges to one side, and your attack goes wide!";
			customBlock = "Displaying his combat prowess, Eitan confidently ripostes your strike, batting it away with his closed hand!";
			a = "";
			capitalA = "";
			impregnationType = "";
			removeSSTDs();
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
 
			// Eitan reaches 100 Lust
			if (hasStatusEffect("Not Busted") && lustQ() >= 100) phase2Configure();
			else if (target.hasStatusEffect("Grappled")) return; // Eitan reacts to fighting grapple instead of doing things himself
			else if (rand(hasStatusEffect("Not Busted") ? 3 : 2) == 0) tryGrapple(target);
			else if (rand(3) == 0) eitanProblyGonnaMiss(target);
			else if (rand(2) == 0) eitanPawnch(target);
			else eitanJab(target);
		}

		// Eitan attacks 1; low strength, high success rate:
		private function eitanJab(target:Creature):void
		{
			output("Eitan keeps his feet grounded and still as he jabs forward with one fist: a quick, surely, non-committal strike that he puts more speed into than strength.");
			if (blindMiss(this, target, true) || combatMiss(this, target, attack()*1.5)) output(" Luckily, you manage to see even this quick strike coming, and you twist to one side, letting his fist go wide.");
			else
			{
				output(" Unfortunately for you, his jab lands true, striking you in the chest!");
				applyDamage(damageRand(meleeDamage().multiply(.5), 20), this, target, "minimal");
			}
		}
 
		// Eitan attacks 2; medium strength, medium success rate, small chance to daze:
		private function eitanPawnch(target:Creature):void
		{
			output("Eitan steps forward, his arm reared back slightly, before it launches forward, his closed fist arcing towards you with a powerful hook.");
			if (blindMiss(this, target, true) || combatMiss(this, target, attack())) output(" You manage to " + (target.tallness > 6*12 ? "step back" : "duck") + " just in time, and Eitan's fist smashes through the air harmlessly " + (target.tallness > 6*12 ? "in front" : "above") + " you!");
			else
			{
				output(" It lands true, with his huge fist colliding into your face, sending you tumbling backward!");
				if (rand(100) < target.physique() + target.willpower() && rand(4) == 0)
				{
					output(" Your vision swims, and you have a hard time righting yourself - <b>you're staggered!</b>");
					CombatAttacks.applyStagger(target);
				}
				applyDamage(damageRand(meleeDamage(), 20), this, target, "minimal");
			}
		}

		// Eitan attacks 3; high strength, low success rate
		private function eitanProblyGonnaMiss(target:Creature):void
		{
			output("Suddenly, Eitan lunges forward, his arm raised high and his claws flexed.  You hear the air slice around his pointed claws as he swings his hand visciously towards you");
			if (blindMiss(this, target, true) || combatMiss(this, target, attack()*0.5)) output(", but for as fierce as the action is, it's highly telegraphed: you step backward, letting his hand swing through the air harmlessly between you two. That one could have really hurt if it landed! Hopefully he remembers that this is only a sparring match!");
			else
			{
				output(", and you don't react in time to defend yourself: you feel the force of his impact before you feel the tear of his claws on your body, and you're sent reeling backward, clutching at the claw marks he's left behind. That one really hurt! Hopefully he remembers this is just a spar!");
				applyDamage(damageRand(meleeDamage().multiply(2), 20), this, target, "minimal");
			}
		}

		// Eitan attempts to grapple
		private function tryGrapple(target:Creature):void
		{
			output("With a lunge, Eitan steps into your space, both arms open and swinging into you to try and catch you in his grasp.");
			if (blindMiss(this, target, true) || combatMiss(this, target, attack()*1.5)) output(" Despite his size and speed, though, you're too slippery for him, and you manage to back away before he can wrap his arms around you. That was close - getting caught by someone of his size would probably hurt a lot!");
			else
			{
				output(" Eitan is too big, and he's too fast for you to back away from, and before you know it, you're caught in a tight bear hug!");
				CombatAttacks.applyGrapple(target, physique());
			}
		}

		public function waitRoundReaction(target:Creature):void
		{
			output("You don't make any action for the moment.");
			if (hasStatusEffect("Not Busted"))
			{
				output("\n\nEitan hesitates, noticing you going slack in his grip. At first, from the look on his face, he's worried that he might have gone too far. One look at your face tells him that you're fine, though (relatively speaking).");
				output("\n\n<i>\"If this is what you like, [pc.name] Steele, then I can give you all the big, meaty hugs your body can take later,\"</i> he teases. His grip loosens slightly - but then starts again, crushing your body against his once more. <i>\"But first, you must admit defeat!\"</i>");
				applyDamage(damageRand(new TypeCollection({kinetic:physique()}), 20), this, target, "minimal");
				if (target.isDefeated()) output("\n\nFinally, your poor body can take no more: you choke out your last breath and you tap on Eitan's shoulder, letting him know that you give up.");
			}
			else
			{
				output("\n\nEitan drives his erect shaft in between your thighs, loudly clapping your body against his with every thrust. You're not sure who's getting the better end of the deal here. ");
				output("\n\n<i>\"Admit defeat, [pc.name] Steele,\"</i> Eitan growls in your ear, his breath hotly washing from his nose and down your neck, <i>\"and give us both the release we crave.\"</i>");
				output("\n\nWith your body pressed against his and with you utterly powerless to defend yourself, Eitan thrusts his cock, still " + (kGAMECLASS.eitanIsCrew() ? "hidden within the confines of his Steele Tech uniform" : "draped from tip to base in his loincloth") + ", in between your [pc.thighs], dragging his hot cock");
				if (target.hasVagina()) output(" against the vulva of your rapidly-soaking pussy.");
				else if (target.balls > 0) output(" into the crease of your [pc.sack], fucking the space in between your balls and making them bounce with every thrust.");
				else output(" across the space of your taint, grinding his stiff shaft into your form and scratching an itch you didn't realize you had.");
				// Do heavy lust damage to the PC
				applyDamage(damageRand(new TypeCollection({tease:30}), 20), this, target, "minimal");
				if (target.isDefeated()) output("\n\nYou can't stand the sexual onslaught from the rampant thigh-fucking, and your body tenses as you try to hold back an orgasm. You can't help but having a tiny, quivering, mini-orgasm - and that's more than enough for Eitan to know that you've lost.");
			}
		}

		public function struggleFailReaction(target:Creature):void
		{
			output("You struggle in Eitan's tight bear-hug lock, pushing against his arms from the inside to try and make some room between you two. But Eitan is just too strong for you to budge!");
			if (hasStatusEffect("Not Busted"))
			{
				output("\n\In reciprocation, Eitan squeezes both of his arms against you, compressing your body against his with his sheer strength. You feel like you'll be crushed into a cube at this rate!");
				applyDamage(damageRand(new TypeCollection({kinetic:physique()}), 20), this, target, "minimal");
				if (target.isDefeated()) output("\n\nFinally, your poor body can take no more: you choke out your last breath and you tap on Eitan's shoulder, letting him know that you give up.");
			}
			else
			{
				output("\n\nWith your body pressed against his and with you utterly powerless to defend yourself, Eitan thrusts his cock, still " + (kGAMECLASS.eitanIsCrew() ? "hidden within the confines of his Steele Tech uniform" : "draped from tip to base in his loincloth") + ", in between your [pc.thighs], dragging his hot cock");
				if (target.hasVagina()) output(" against the vulva of your rapidly-soaking pussy.");
				else if (target.balls > 0) output(" into the crease of your [pc.sack], fucking the space in between your balls and making them bounce with every thrust.");
				else output(" across the space of your taint, grinding his stiff shaft into your form and scratching an itch you didn't realize you had.");
				// Do heavy lust damage to the PC
				applyDamage(damageRand(new TypeCollection({tease:30}), 20), this, target, "minimal");
				if (target.isDefeated()) output("\n\nYou can't stand the sexual onslaught from the rampant thigh-fucking, and your body tenses as you try to hold back an orgasm. You can't help but having a tiny, quivering, mini-orgasm - and that's more than enough for Eitan to know that you've lost.");
			}
		}

		override public function phase2Configure():void
		{
			output("Your continued efforts to tease Eitan to submission have had their effect on him, and by now, he's sporting the largest, meanest erection he possibly could beneath that " + (kGAMECLASS.eitanIsCrew() ? "uniform" : "loincloth") + " of his. A bubble of his pre seems through the fabric and runs a long, thin stain down the underside of its exterior. Looks like Eitan's about to crack....");
			output("\n\n...But despite the obvious physical excitement, Eitan pays it less mind than you do. His stance is unchanged, and his focus is still on you - hell, you stealing glances at his erection is more liable to open you up for an attack.");
			output("\n\nThat said, though, despite his stalwartness, his mouth keeps curling and his thighs keep not-unintentionally grinding against each other. Eitan is mortal, and he's just as horny as he looks, but his combat training has given him more focus than you had thought. <b>If you keep teasing him, he'll crack eventually!</b>");
			// Set Eitan's Lust cap to 200
			output(" (<b>Max L: +<span class='lust'>" + 100 + "</span></b>)");
			removeStatusEffect("Not Busted");
		}
	}
}
