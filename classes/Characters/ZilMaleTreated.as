package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Combat.*;
	import classes.UIComponents.UIStyleSettings;
	import classes.Util.RandomInCollection;
	
	public class ZilMaleTreated extends ZilMale
	{
		//constructor
		public function ZilMaleTreated()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;

			this.short = "treated zil male";

			this.physiqueRaw = 35;
			this.reflexesRaw = 25;
			this.aimRaw = 20;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 25;
			this.libidoRaw = 85;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 75;
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 295;
			this.HPRaw = this.HPMax();
			
			this.femininity = 15;
			this.tallness = 7*12+6;
			this.thickness = 50;
			this.tone = 85;
			this.horns = 2;
			this.hornLength = 7;
			this.createStatusEffect("Horn Style");
			this.setStatusTooltip("Horn Style", "ebony");
			this.hornType = GLOBAL.TYPE_BOVINE;
			this.shiftCock(0, GLOBAL.TYPE_EQUINE);
			this.cocks[0].cockColor = "black";
			this.cocks[0].cLengthRaw = 16;
			this.cocks[0].cThicknessRatioRaw = 1.5;

			this.ballSizeRaw = 40;
			this.ballFullness = 1;
			
			impregnationType = "ZilBullPregnancy";
			this.virility(1.5);

			this.analVirgin = true;
			this.ass.bonusCapacity = 0;

			this.createStatusEffect("Disarm Immune");
			this.createPerk("Appearance Enabled");
			this.createPerk("Inhuman Desire", 40);
			
			isUniqueInFight = true;
			btnTargetText = "ZilBull";
			
			this._isLoading = false;

			this.removeStatusEffect("Flying");
			
			updateAssStats();

			sexualPreferences.setRandomPrefs(5+rand(3));

			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		public function updateAssStats():void
		{
			if(flags["BULLZIL_EZFIT"] != undefined)
			{
				var easyFitUses:int = Math.min(flags["BULLZIL_EZFIT"], 20);
				for(var i:int = 0; i < easyFitUses; i++)
				{
					if (ass.wetnessRaw < 2) ass.wetnessRaw += 1;
					else if (ass.wetnessRaw < 4) ass.wetnessRaw += 0.25;
					
					if (ass.loosenessRaw < 2) ass.loosenessRaw += 1;
					else if (ass.loosenessRaw < 3) ass.loosenessRaw += 0.2;
					
					if (ass.bonusCapacity < 500) ass.bonusCapacity += 40;
				}
			}
			if(flags["BULLZIL_BUTTGINITY_TAKEN"] != undefined) analVirgin = false;
		}
		
		override public function get bustDisplay():String
		{
			return "";
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if (HPQ() < 60)
			{
				if (target.hasStatusEffect("Stunned") || rand(3) == 0)
				{
					if (rand(4) == 0) makeOut(target);
					else if (rand(2) == 0) beeHug(target);
					else beeCharge(target);
				}
				else forcePalm(target);
			}
			else
			{
				if (rand(9) == 0) makeOut(target);
				else if (rand(4) == 0) beeHug(target);
				else if (rand(2) == 0) beeCharge(target);
				else cumFlick(target);
			}
		}

		//Basic lust attack.
		private function cumFlick(target:Creature):void
		{
			output("The bull zil gives a cocky smile as slowly walks towards you, using one hand to stroke the length of his obsidian shaft, drooling golden honey from the flare. He keeps doing it until he has a thick line of amber goo running along the underside of his shaft. He carefully scoops it up into his palm and looks as if he’s about to lick it out of his hand. Then, with the flick of the wrist, he tosses it towards your face.");
			if (target.hasAirtightSuit()) output("\n\nYou don’t bother trying to dodge the glob of honey and you get hit head on. Thankfully due to your [target.armor] any effect it might have is pretty much nullified, except for making you a bit stickier.");
			else if (rangedCombatMiss(this, target)) output("\n\nYou manage to avoid getting too much on you, only a couple of drops landing here or there. Nothing you can’t wipe off.");
			else
			{
				output("\n\nYou’re too busy backpedaling to avoid his attack; it ends up covering your lips. You’re about to wipe it off until you catch a whiff of it. His pheromones flood your mind, and you can’t help but part your lips just a bit, only to let out a weak moan. As you do that, a bit of his honey gets in your mouth... and it just takes so good. Sweet yet rich, savory and delightful. Before you know it you’re licking your lips clean and craving more. Would it really be so bad if you just obeyed and got on your knees?");
				applyDamage(damageRand(new TypeCollection({ tease : 15 }), 20), this, target, "minimal");
				applyBeeMusk(target);
			}
		}

		//Medium accuracy, low-medium damage. Low lust damage.
		private function beeCharge(target:Creature):void
		{
			output("The zil charges towards you, aiming to tackle you!");
			if (combatMiss(this, target, attack()-5)) output("\n\nAt the last second you manage to step out of the way, letting him ram into a nearby tree.");
			else
			{
				var dmg:TypeCollection = meleeDamage();
				output("\n\nUnable to get out of the way in time, he pins you up against a nearby tree. He holds you there, taking a moment to feel you up as you regain the strength to push him off.");
				if (target.hasAirtightSuit()) output(" As he manhandles you reaches for your neck seal and uses his brutish strength to pop it open. He pulls you tighter, pressing his body against the new opening in your once airtight suit. After a bit of struggling y");
				else
				{
					output(" Y");
					dmg.add(new TypeCollection({ tease : 10 }));
					applyBeeMusk(target);
				}
				output("ou’re able to finally get free, but not before breathing in his deep, manly musk...");
				applyDamage(damageRand(dmg, 20), this, target, "minimal");
			}
		}

		//Common attack, low accuracy. 100% hit rate against stunned targets.
		private function beeHug(target:Creature):void
		{
			output("The Treated zil begins flapping his wings and lowers himself to the ground. He follows you with his eyes for a moment before leaping forward, his wings propelling him at you at a frightening speed.");
			if (!target.hasStatusEffect("Stunned") && combatMiss(this, target, attack()-10)) output("\n\nYou step aside. He might be fast, but his bulky form takes away from his accuracy.");
			else
			{
				output("\n\nYou fail to dodge and are left in the zil’s grasp! Struggle as you might, you’re at his mercy. He holds you tight with one arm as his spare hand snakes towards your crotch. Stars, he smells so good. He holds you tight, making sure you take a deep breath of his pheromones, before he finally lets go of you. To be honest, a part of you wishes he didn’t...");
				applyDamage(damageRand(new TypeCollection({ tease : 20 }), 20), this, target, "minimal");
				applyBeeMusk(target);
			}
		}

		private function forcePalm(target:Creature):void
		{
			output("The zil lunges forward, shoving his open palm towards your solar plexus.");
			if (combatMiss(this, target)) output(" You grab his arm and push it away from you, letting the bull tumble forward into a nearby bush.");
			else
			{
				output(" It’s a direct hit! He knocks the wind clean out of you, and you’re left on the ground winded, desperately trying to regain your breath.");
				CombatAttacks.applyStun(target);
				applyDamage(damageRand(meleeDamage(), 20), this, target, "minimal");
			}
		}

		//Heavy lust attack, rare but easily missable 
		private function makeOut(target:Creature):void
		{
			output("The zil bull reaches out and tries grabbing for your arm.");
			if (combatMiss(this, target, attack()-10)) output("\n\nYou deftly pull your arm back, making no contact with the zil whatsoever.");
			else
			{
				output("\n\nHe’s able to grab your wrist and pulls you close, holding your arm against your back as he looks down at you. His wings unfold and wrap around you, soft like silk yet still firm enough to provide him with flight. Struggle as you might, you actually begin to feel sort of relaxed within his cocoon.");
				applyDamage(damageRand(new TypeCollection({ tease : 35 }), 20), this, target, "minimal");
				applyBeeMusk(target);
			}
		}

		// Player turn should be interrupted by fantasy when value is 1, value 2 keeps track of fantasies seen, value 3 total amount
		private static function applyBeeMusk(target:Creature):void
		{
			if (!target.isTreated()) return;
			if (!target.hasStatusEffect("Bee Musk")) target.createStatusEffect("Bee Musk", 1, 0, 0, 0, false, "Icon_Charmed", "It’s hard not to fantasize after getting a whiff of that musk!", true, 0, UIStyleSettings.gLustColour);
			else target.setStatusValue("Bee Musk", 1, 1);
		}

		public static function processBeeMuskStun(target:Creature):Boolean
		{
			if (target.statusEffectv1("Bee Musk") <= 0) return false;

			target.setStatusValue("Bee Musk", 1, 0);

			var availableFantasies:Array = [];
			// zilBullGonnaDoYourButt
			if ((target.statusEffectv2("Bee Musk") & 1) == 0) availableFantasies.push(0);
			// getSomeLittleBeeBullsInsideYa
			if ((target.statusEffectv2("Bee Musk") & 2) == 0 && target.hasVagina()) availableFantasies.push(1);
			// nomNomNomOnHoneyHorseDong
			if ((target.statusEffectv2("Bee Musk") & 4) == 0 && target.hasCock()) availableFantasies.push(2);
			// timeForTheBirdsAndTheBeesByWhichIMeanZilAndSomeGreatTits
			if ((target.statusEffectv2("Bee Musk") & 8) == 0 && target.hasBreasts()) availableFantasies.push(3);

			if (availableFantasies.length <= 0) return false;

			clearOutput();
			author("Altair");
			var fantasy:int = RandomInCollection(availableFantasies);
			switch (fantasy)
			{
				case 0:
					output("One whiff is all it takes for your treated mind to be invaded by fantasies of the zil bull. Just by looking at him, you feel a longing emptiness inside. Your face grows red as your blood vessels relax, sending a pleasurable wave of warmth throughout your body. Every inch just seems to give in to the heat, and everything starts feeling so heavy. You take a knee and wait for the feeling to pass.");
					output("\n\nTurning to face your opponent, you begin to wonder why you’re fighting in the first place. From his broad shoulders to his slender hips, your eyes are drawn to his crotch, his v-line an arrow pointing to the only things that matter: his throbbing pole of pitch black horsemeat, and his pair of dense cum factories hanging below. Even from here you can catch a faint whiff of his musky balls, part sweet and enticing, part raw and sweaty. Wouldn’t it just be good for you to crawl over and get a taste of his cock? Wouldn’t it feel amazing for you to sample a taste of his virile cum-honey?");
					output("\n\n<b>Wouldn’t it be perfect if you turned around and presented your ass like the willing fuckhole you are?</b>");
					break;
				case 1:
					output("His virile, masculine scent invades your mind within seconds. You feel a trickle of wetness trail down your trembling [pc.thighs] as a lustful heat invades your entire body. It’s not long until your knees buckle, the weight of your body too heavy to bear.");
					output("\n\nYou belong on your knees though. It only makes sense: a strong male is right before you, his balls churning a fresh load to fill you from within. The more you stare, the more you can almost hear the dangerously virile honey churning. Stars, what you would give just to feel the heat of his cum as it trickles down your face, the sweet taste dancing across your tongue as you savor its flavor.");
					output("\n\nGranted, while balls are fun and all, they’re useless without a thick fuckpole to shoot a load deep inside of you. Thankfully he’s packing in that regard too. There’s no better way to breed than with a fat, throbbing horsecock. You can nearly imagine him filling every inch of you, his blunt flare forcing its way into you as you delight in being spread apart, and of course how it’ll feel when his medial ring grinds up against your walls.");
					if (target.hasPerk("Breed Hungry"))
					{
						output("\n\nAll of that pales in comparison to what you really want though, what you <i>need</i>: him pinning you down and rutting your [pc.cunt] until you’re knocked up.");
						output("\n\nEven from a couple feet away you can smell it on him, he’s so virile that one drop of his pre would turn you into a mother to be! And if that’s the case... why are you just sitting around and looking at him? ");
						output("\n\nHis flare should be kissing your cervix, shooting rope after rope of his honey into your womb until you’re packed full and leaking his honey all across the jungle floor! ");
						output("\n\nYou want to hear his fat nuts slapping against your ass as he pulls your");
						if (target.hasHorns()) output(" horns");
						else if (target.hasTail()) output(" tail");
						else if (target.hasHair() && target.hairLength >= 3) output(" hair");
						else output(" arms behind your back");
						output(" and fucks you into the ground!");
						output("\n\nYou want to smother your face against his chest, huffing his musk as he turns you into the breeding bitch you were always meant to be!");
					}
					else output("\n\nYou can’t help but slide your hand down to your [pc.cunt] as these lewd fantasies fill your mind, only to pull it away in horror as you watch a single drop of the Zil’s precum fall onto the jungle floor! What an absolute waste! ");
					output("\n\n<b>Every drop of his honey should be stuffed deep inside of you!</b>");
					break;
				case 2:
					output("With clenched fists you succumb to his smell, the sweetness of honey combined with the musk of a bull in a sauna- it’s all too much to bear. You try to fight it for a bit, but you eventually fall to " + (target.hasKnees() ? "your knees" : "the ground") + ", a wave of warm delight coursing through your body.");
					output("\n\nYou can’t help but notice how well-defined the zil’s legs are, thick and firm, not unlike his rear end. One of the benefits of the Treatment, you muse, giving even guys fuckable asses. Granted, you figure his throat is probably tighter than his ass, although you doubt he’ll let your cock anywhere near his face.");
					output("\n\nMaybe if you submit to him, he’ll let you fuck his ass. You’d have to return the favor of course, and what better way than to do that than to suck his cock? " + (target.isTaur() ? "Right after you fuck him you could just return the favor by getting him off. It’d be an even deal. You get to blow your load deep inside of him; then all you have to do is take his delicious cock into your mouth and swallow every drop of his sweet honey." : "Better yet, why not service him while he’s getting his ass stuffed? All you’d have to do is lie on the ground and he’d do all the work. If anything it would be a reward for you, being able to savor the feeling of his thick flare in your mouth and the taste of his honey."));
					output("\n\nOn second thought, why not start by giving him a blowjob? You’d get to satisfy both him and your cravings while letting him decide what your reward will be.");
					if (target.IQ() < 20) output(" Besides, it’s not like you can suck and think at the same time. That’s <i>way</i> too hard.");
					output(" It’s probably best if you leave it all up to him.");
					output("\n\n<b>All you have to do is submit, and you’ll taste his meaty, treated fuckstick.</b>");
					break;
				case 3:
					output("He smells so good. Why does he have to be an enemy? If he wasn’t trying to force himself on you, you’re sure something could be arranged. But no, instead of asking nicely he’s instead subjecting you to an onslaught of mind-melting pheromones. Just one breath and you’re on " + (target.hasKnees() ? "your knees" : "the ground") + ", red faced and quivering. It’s not fair!");
					output("\n\nAs you try to get back to your [pc.footOrFeet], your eyes are drawn straight to the treated zil’s face. You didn’t notice it before, but he has very kissable lips.");
					output("\n\nWithin moments that mostly innocent thought rapidly spirals into larger, lewder fantasies - like how it would feel to press your lips against his, the feeling of his hair between your fingers as you pull him towards you. Would the chitin plates on his chest feel cold if you pressed yourself against him? Would you even notice them, being so small in comparison to the rest of his firm pectorals?");
					output("\n\nMaybe you could ask him for just a kiss? It wouldn’t hurt, and you’d be able to get another, deeper whiff of his musk. Plus if it’s not enough, you’ll just get " + (target.hasKnees() ? "on your knees" : "down") + " and breathe it in from a more potent source. You could just take his leathery scrotum and massage his nuts as you shove your nose right against them, huffing long and deep...");
					output("\n\nBut that’s not fair for him, is it? Once you get your fix of mind melting zil musk you’d take your tits out and");
					if (target.biggestTitSize() < 4) output(" do what you can to get him off, despite how small they are");
					else if (target.biggestTitSize() < 80) output(" give him a good old fashioned titfuck");
					else output(" utterly envelope his horsemeat with your massive mammaries. You’ll be able to massage his every inch with your breasts without seeing a hint of cock");
					output(". It’s only fair that he get off while you get high on his musk.");
					output("\n\n<b>You should walk over right now and beg to give him a titfuck!</b>");
					break;
			}

			target.addStatusValue("Bee Musk", 2, 1 << fantasy);
			target.addStatusValue("Bee Musk", 3, 1);

			kGAMECLASS.addButton(0, "Of Course", kGAMECLASS.getYourAssKickedBySteroidBee, fantasy, "Of Course", "Why wait any longer? Just give in and let him take what’s rightfully his.");
			if (target.willpower() + rand(20) < 20 + 5*target.statusEffectv3("Bee Musk")) kGAMECLASS.addDisabledButton(1, "Snap Out", "Snap Out Of It", "You can’t really bring yourself to...");
			else kGAMECLASS.addButton(1, "Snap Out", CombatManager.processCombat, undefined, "Snap Out Of It", "No! You’re not about to be beaten by the alien brute.");

			return true;
		}
	}
}
