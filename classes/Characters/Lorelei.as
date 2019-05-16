package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Items.Treasures.Savicite;
	import classes.Items.Protection.JoyCoEliteShield;
	import classes.Util.*;
	
	import classes.kGAMECLASS;
	
	public class Lorelei extends Creature
	{
		private var lustDamage:Number = 15;

		//constructor
		public function Lorelei()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;

			this.short = "Minuet";
			this.a = "";
			this.capitalA = "";
			this.originalRace = "human";
			this.long = "";
			this.customDodge = "Minuet dodges to one side from your attack with practiced ease. You’ll have to do better than that!";
			this.customBlock = "Block Placeholder";
			this.isPlural = false;

			// For lust resistances, like I said, she should be skewed towards being strong against every form of them, so that winning via lust won’t be as easy.
			this.baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 40.0;
			baseHPResistances.drug.damageValue = 25.0;
			baseHPResistances.psionic.damageValue = 30.0;
			baseHPResistances.pheromone.damageValue = 30.0; 
			//For damage resistances, her suit makes her slightly resistant against kinetic attacks; highly resistant against electric attacks; weak to burning attacks; and even against everything else.
			this.armor.shortName = "Suit";
			this.armor.hasRandomProperties = true;
			this.armor.resistances.kinetic.damageValue = 20;
			this.armor.resistances.electric.damageValue = 50;
			this.armor.resistances.burning.damageValue = -15;
			this.armor.sexiness = 10;
			// just eyeballing shield stats rn
			this.shield = new JoyCoEliteShield();
			this.shield.shields = 150;
			this.shield.hasRandomProperties = true;
			/*this.shield.resistances = new TypeCollection();
			this.shield.resistances.kinetic.damageValue = 20;
			this.shield.resistances.electric.damageValue = 50;
			this.shield.resistances.burning.damageValue = -15;*/

			this.meleeWeapon.shortName = "Shock Glove";
			this.meleeWeapon.baseDamage = new TypeCollection();
			this.meleeWeapon.baseDamage.electric.damageValue = 25;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 10;

			this.level = 9;
			this.characterClass = GLOBAL.CLASS_SMUGGLER;
			this.HPMod = 65;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.physiqueRaw = 35;
			this.reflexesRaw = 45;
			this.aimRaw = 15;
			this.intelligenceRaw = 40;
			this.willpowerRaw = 30;

			this.credits = 0;
			this.XPRaw = this.normalXP();
			this.inventory = [new Savicite()];

			this.createVagina();
			this.femininity = 80;

			//Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,			GLOBAL.REALLY_LIKES_SEXPREF);
			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,			GLOBAL.REALLY_DISLIKES_SEXPREF);

			this.createPerk("Riposte");
			this.createPerk("Iron Will");
			this.createPerk("Appearance Enabled");
			this.createPerk("Custom Appearance");

			this._isLoading = false;
		}

		override public function get bustDisplay():String
		{
			return "";
		}

		public static function encounterText():String
		{
			if (CombatManager.getHostileActors()[0].hasStatusEffect("Grappled")) return "";
			else return "Minuet stands tense, ready to strike at a moment’s notice. Her hands are open, with electric sparks arcing from her fingertips to her palms and back again. Every movement she makes is deliberate and calculated: she doesn’t so much as breathe out of sync with the rest of her body.";
		}

		//A hat with all of Lorey's attack functions
		private const attacks:Array = [holdPerson, dominatePerson, shockingGrasp, shockingGrasp, charmPerson, charmPerson];
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if (target.hasStatusEffect("Grappled")) graspingHand(target);
			else RandomInCollection(attacks)(target);
		}

		// Random physical attack 1:
		private function shockingGrasp(target:Creature):void
		{
			var roll:int = rand(100);
			output("Minuet swings at you with her right fist, aiming for your face!");
			// Make a Reflex check.
			if (roll < 45+reflexes() - target.reflexes())
			{
				// Continue here on critical fail:
				if (roll < 5+reflexes() - 2*target.reflexes())
				{
					output("\n\nHer fist makes direct contact! She hits surprisingly hard for someone with her frame. When her gloved fist makes contact with your [pc.skinFurScales], you feel an arc of electricity through you, shocking you from your neck all the way to the base of your spine!");
					// Small chance to stun. if it succeeds, continue here:
					if (rand(3) == 0)
					{
						output(" The shock is too much for you to handle in the heat of the fight, and your senses are knocked lopsided! <b>You are stunned until you can regain control over yourself!</b>");
						// PC is Stunned for one turn.
						CombatAttacks.applyStun(target, 1);
						applyDamage(damageRand(meleeDamage(), 15), this, target, "minimal");
					}
					// If it fails, do more damage;
					else applyDamage(damageRand(meleeDamage().multiply(1.5), 15), this, target, "minimal");
				}
				// Continue here on Reflex check, fail:
				else
				{
					output("\n\nYou see it coming in time to dodge the swipe, but Minuet was holding her needle in her closed fist. It cuts through the air, and it grazes against your [pc.skinFurScales] as her fist whiffs through the air. The needle cuts against you, not deeply enough to do any lasting damage, but enough to <i>hurt</i> in the heat of the moment.");
					// Do regular damage to the PC’s shields/HP.
					applyDamage(damageRand(meleeDamage(), 15), this, target, "minimal");
				}
			}
			// Reflex check, succeed:
			else output("\n\nYou see her swing coming ahead of time, and you step backward. Her fist arcs short through the air, whiffing you by a little less than a foot. As her fist rams through the air between you, you see the glint of her needle in her closed fist – thank goodness you avoided that!");
			// Do no damage.

			createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
		}

		//Random physical attack 2:
		private function holdPerson(target:Creature):void
		{
			var roll:int = 0;//rand(100);
			output("Minuet lunges forward, her left hand open and grasping for your wrist. She’s trying to get you into one of her arm locks!");
			// Make a Reflex check.
			if (roll < 45+reflexes() - target.reflexes())
			{
				//Continue here on critical fail:
				if (roll < 5+reflexes() - 2*target.reflexes())
				{
					output("\n\nYou’re too slow to avoid her lunge, and she succeeds in grabbing hold of your left wrist. Before you can try and overpower her, or to twist away from her, she has your arm tucked behind your back, pressed far enough behind you to hurt.");
					output("\n\nEvery movement you make is met with strong resistance from Minuet: no matter which way you try to twist or flex, she has you pinned, and flailing around is likely to do more damage to you than it’ll help. <b>You are grappled!</b>");
					CombatAttacks.applyGrapple(target, reflexes());
				}
				// Continue here on fail:
				else
				{
					output("\n\nYou manage to sidestep her lunge, but not before she closes the gap enough to put her hand against your torso. Electricity zaps through your");
					if (target.shields() > 0) output(" shield on contact, doing some minor damage to your shield.");
					else output(" body on contact, enough to hurt, but not enough to debilitate you and keep you out of the fight.");
					output("\n\nMinuet, satisfied with the damage she’s done, resumes her fighting stance, ready for what comes next.");
					// Do regular electric damage to the PC
					applyDamage(damageRand(meleeDamage(), 15), this, target, "minimal");
				}
			}
			// Continue here on success:
			else
			{
				output("\n\nYou step to one side as Minuet lunges at you, avoiding her grasp with a few inches to spare. The crackle of electricity from her gloved hand makes the");
				if (InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SKIN) && !target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) output((target.skinType == GLOBAL.SKIN_TYPE_FUR ? " fur" : " hair") + " on your arm stand on end.");
				else output(" air sizzle with energy, tickling the sensitive " + GLOBAL.SKIN_TYPE_NAMES[target.skinType].toLowerCase() + " on your arm.");
				output("\n\nMinuet grunts to herself as she re-rights her stance against you, keeping her left hand open and the electricity surging from her fingers and into her palm, ready at a moment’s notice to try again.");
				// Do no damage.
			}
 
			createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
		}

		private function charmPerson(target:Creature):void
		{
			// Random Lust attack 1:
			if (rand(2) == 0)
			{
				output("Minuet changes her stance, standing more upright, as she places a hand beneath her right boob and gives it a heft. As she does, the black material around her tit slowly begins to peel away in a perfect circle, revealing the tanned skin and pink, nubby nipple concealed within. The suit continues to peel, until every last inch of her titflesh is exposed to the air.");
				output("\n\n<i>“Come on, darling,”</i> she says, licking her lips and pinching her nipple in front of you. <i>“If you admit that you want to see more, just drop your weapons, and I’ll give you a show like you’ve never seen before....”</i>");
				output("\n\nTo punctuate her offer, the suit begins to peel away from her left boob as well – but it only reveals her nipple, leaving the rest of it completely concealed.");
			}
			// Random Lust attack 2:
			else
			{
				output("Minuet’s stance shifts, putting her left leg out towards you. As she does, her hand runs slowly and sensually up the side of her thigh, her fingers gently brushing against the fabric of her suit – and, as she does, her suit begins to peel, or maybe even unzip, along where her fingers touch. Where her hand goes, the suit splits in half, revealing the darkened flesh of her thigh underneath.");
				output("\n\n<i>“Mmmm,”</i> she moans, her tongue licking her lips, her eyes on you the whole time. She repeats the process for her other leg, giving you more thigh to ogle; and, when she’s done there, she puts her fingers underneath the cleavage of her boobs, and starts drawing a line down her stomach. Like with her legs, the suit splits at her touch, revealing her flat stomach underneath the fabric. And then her fingers start dipping lower, towards–");
				output("\n\nJust as they reach the valley of her crotch, her hand pulls away, and, in an instant, every incision in her suit is repaired. Or, perhaps they were never created in the first place, and it’s all a trick of the suit. Either way, you can’t get the image of her flawless, tanned skin out of your head, and the fact that you were about to see much more....");
			}

			// Do medium Lust damage
			applyDamage(damageRand(new TypeCollection({ tease : lustDamage }), 20), this, target, "minimal");

			if (target.lust() < target.lustMax()) output("\n\nStill, you have the willpower to keep your fantasies from obstructing your offense. For now....");
		}

		// Random Lust attack 3:
		private function dominatePerson(target:Creature):void
		{
			output("In a blink, Minuet lunges at you, closing the distance and stepping into your personal space.");
			if (target.reflexes() >= 25) output(" You managed to track her with your own highly-tuned reflexes, but she was simply too physically fast.");
			output(" But she doesn’t attempt to attack you, or grapple you: she’s right in front of you, standing face-to-face with you. Her nose is half an inch from bumping into yours.");
			output("\n\nAnd, without provocation (or invitation), she tilts her head to one side, and presses her lips full onto yours. You barely have the time to register the action at all, and already, you feel her tongue aggressively prodding at your [pc.lips], <i>demanding</i> entry into your mouth.");

			if (target.willpower() <= 15)
			{
				output("\n\nYou know that she’s the enemy, and that you’re trying to defend yourself from her... but she’s also a hot lady with big tits, and she’s trying to aggressively make out with you. You’re a weak-willed [pc.manWoman], and you part your lips, allowing her in.");
				output("\n\nAnd allow herself in she does: your mouth is flooded with her questing, dancing tongue, counting your teeth and tasting your own. When she reaches particularly deep into your mouth, you can’t help but suck on her tongue, just a little bit. The conflict may be momentarily forgotten, but you hope this moment lasts forever.");
				output("\n\nUnfortunately, Minuet does not share the sentiment, and almost as soon as it begins, it ends. She shoves you away from her and wipes at her chin with the back of her sleeve as she resumes her earlier stance.");
				output("\n\n<i>“I always have more sugar to give, honey,”</i> she teases, her tongue licking at her lips languidly. <i>“All you have to do is ask.”</i>");
				// Do major Lust damage
				applyDamage(damageRand(new TypeCollection({ tease : lustDamage*2 }), 20), this, target, "minimal");
			}
			else
			{
				output("\n\nHer naked attempt at trying to seduce you falls on tone-deaf ears (mostly), and you shove at her, pushing her away and widening the gap to a more ‘professional’ distance once again. You wipe at your mouth with the back of your hand, wiping the residue from your [pc.lipsChaste].");
				output("\n\nMinuet does the same, but she seems undeterred. She laughs to herself as she resumes her earlier, aggressive fighting stance. <i>“I do so enjoy the ones that play hard-to-get,”</i> she says. <i>“");
				if (target.hasCock()) output("But I’d rather just make you hard. Don’t pretend you wouldn’t let me.");
				else output("Let’s see if you’re hard-to-get-wet, too. Sixty seconds, and I bet I could have you parch a desert.");
				output("”</i>");
				// Do minor Lust damage
				applyDamage(damageRand(new TypeCollection({ tease : lustDamage/2 }), 20), this, target, "minimal");
			}

			if (target.lust() < target.lustMax()) output("\n\nTempting....");
		}

		private function graspingHand(target:Creature):void
		{
			// Random Grapple attack 1
			if (rand(2) == 0)
			{
			output("Minuet’s free hand wraps around your front, sensually rubbing at your [pc.belly], making its way lazily up to your [pc.chest] in broad circles. Once her palm finds one of your [pc.nippleNoun]s, she places her palm flatly against it, massaging the what she finds there – and you feel a small electric current zap into you.");
			output("\n\nIt’s not painful, though. Quite the contrary: it stimulates you, and within seconds, your nipples are rock-hard, pressing into Minuet’s hands, magnetized by the electricity and eagerly searching for more. You reflexively push your [pc.chest] into her hand, and you ‘ah!’ in pleasure at the stimulation; you hadn’t expected this, and now that you have it, your bodily response is to want more of it.");
			output("\n\n<i>“Be a good [pc.boyGirl],”</i> she whispers, <i>“and there will be plenty more where that comes from.”</i>");
			}
			// Random Grapple attack 2
			else
			{
				output("Minuet steps into you, pressing her soft body against yours, pinning your arm between you two. Her free hand wraps around to your front, sensually rubbing at your [pc.belly], making its way lazily down to your [pc.crotch] in broad circles. Once her hand finds the valley of your crotch, she brazenly, but gently, cups it, making sure to fit as much of your");
				if (target.hasCock()) output(" bulging [pc.cock]");
				else if (target.hasVagina()) output(" [pc.vagina]");
				else output(" groin");
				output(" into the palm of her hand.");
				output("\n\nYou tense, ready for <i>quite</i> the unwelcome shock against your nethers. And you get one – but it’s extremely subdued, to the point where it’s rather stimulating and pleasurable. Within seconds,");
				if (target.hasCock()) output(" your [pc.cock] begins to stiffen and rise, the beast awoken by the currents of ticklish, energizing");
				else output(" your [pc.vagOrAss] dampens and clenches, the pit awoken and hungry for anything halfway phallic to feed and satiate it, energized by the");
				output(" electricity coursing through it.");
				output("\n\nYour thrust your [pc.hips] into Minuet’s hand, and you can’t help but follow her palm when it rubs you in circles. You grunt in pleasure as she teases you; you feel weak in the [pc.legs] the longer it continues.");
				output("\n\nMinuet kisses your neck, enjoying the dance you’re putting on for her. <i>“Be a good [pc.boyGirl],”</i> she whispers, <i>“and I might just join you in this dance later.”</i>");
			}

			// Do minor Lust damage
			applyDamage(damageRand(new TypeCollection({ tease : lustDamage/2 }), 20), this, target, "minimal");

			if (target.lust() < target.lustMax()) output("\n\nTempting....");
		}

		public function struggleFailReaction(target:Creature):void
		{
			output("Unfortunately, your flailing is rather aimless, and all you manage to accomplish is allowing Minuet to strain your body all the harsher, causing pain to shoot up your arm. Still, you can’t give up!");
			// Do minor physical damage, display one of the random Grapple attack texts
			applyDamage(damageRand(meleeDamage().multiply(0.5), 15), this, target, "minimal");
		}

		public static function waitRoundReaction(target:Creature):void
		{
			output("You attempt to relax against Minuet.");
			if (target.lust() < 50) output("\n\nThere’s no sense in trying to break free from her; you’ll just hurt yourself in the process. She has you well and captured... at least, until you can think of something.");
			else if (target.lust() < 90) output("\n\nYou can’t lie: in a way, it’s kind of hot for her to handle you like this. You’ve gotten kind of <i>excited</i> since your fight had begun, and the dumb animal part of your brain wants to see where this leads.");
			else output("\n\nIt’s gotten way too hard to focus on the fight as you are: all you can think about is Minuet and her tits, and her hourglass form, and the way she’s pressing them both against you right now... maybe it’s not too late to apologize, then kiss and make up?");
			output("\n\nMinuet giggles lasciviously, noticing your total submission and refusal to act against her. <i>“Good for you, [pc.name],”</i> she says, pressing her body up against you. <i>“Just give me a moment or two, and we can both forget this ever happened....”</i>");
			// Display one of the random Grapple attack texts
		}
	}
}