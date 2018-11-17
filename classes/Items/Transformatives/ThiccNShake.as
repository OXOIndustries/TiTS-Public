/*
Thicc&Shake
By Odaous

Location- Vending Machines(Specifically the ones that sell Amazon Tea)
*/

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.CockClass;
	import classes.BreastRowClass;
	import classes.VaginaClass;
	import classes.Engine.Combat.inCombat;
	
	public class ThiccNShake extends ItemSlotClass
	{
		public function ThiccNShake()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.FOOD;
			
			shortName = "ThicShake";
			longName = "Thicc&Shake";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of Thicc&Shake";
			tooltip = "Thicc&Shake is newly developed JoyCo product for those wishing to having a more rich bottom half. The process is simple: after applying the batter onto the designated region of the body, one merely needs to shake and the nanomachines will begin their routines. The kinetic energy will trigger the machines to produce extra mass and adjust bone structure respectively, giving the user an easy-to-carry bottom-heavy figure. The effects of the cream will wear off 4 hours after use.\n\n<b>Warning:</b> Do not abuse this product, ill effects may occur. Please follow the proper instructions. This product is currently in a public trial phase. Please send over any suggestions, complaints, reviews, and concerns to our JoyCo customer service program.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1500;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearBust();
			kGAMECLASS.showName("\nTHICC&SHAKE");
			author("Odaous");
			
			var healing:int = 25;
			if(target.energy() + healing > target.energyMax())
			{
				healing = target.energyMax() - target.energy();
			}
			if(target is PlayerCharacter)
			{
				clearOutput();
				// Consuming:
				output("You squeeze the bottle, releasing its contents onto your hand. It is a very slow process due to how thick the substance is. Sitting heavy in your palm, the cream gives off the aroma of sweet cake batter. As you spread it on your [pc.hips] and [pc.ass], you feel like you are encasing yourself in liquid dough rather than a creamy lotion.");
				output("\n\nAfter a moment, the batter soaks in and you feel alight with deft sensation, demanding you to shake what your momma gave ya!");
				
				// Immediate effects: The player gains some energy.
				if (healing > 0)
				{
					output(" (<b>+" + healing + " Energy</b>)");
					target.energy(healing);
				}
				
				/*
				Effects
				Use item-Apply batter effects last about an hour.
				
				When using the Hip or Ass tease
				1.	If Hip is below 20 gain 2-5 in Hip
				2.	If Ass is below 20 gain 2-5 Ass
				3.	Increase Lust
				4.	Deals tease damage equal to the gains of Thicc&Shake.
				When using Masturbation option Shake
				1.	If Hip is below 20 gain 2-5 in Hip
				2.	If Ass is below 20 gain 2-5 in Ass
				3.	Increase Lust
				4.	Can cause orgasm
				When Overdosing(Activating the effect three times when both Hip and Ass are maxed out. Codex will warn PC when abusing nanomachines.)
				1.	Each use causes you to gain 5 in both Hip and Ass. Gain 10 taint. High libido increase
				2.	⅓ Chance to gain the “Fecund Figure” Perk.
				3.	⅓ chance to gain the “Buttslut” Perk
				4.	⅓ chance to gain the “Bubble Butt” Perk.
				5.	If Hip and Ass are at 35 gain the “Hips don’t Lie”
				*/
				
				// time: 4 hours of the effect
				var timerStamp:int = 240;
				
				// "Thicc&Shake"
				// v1: Number of doses.
				// v2: Number of shakes.
				// v3: Overdose event flag.
				// v4: 
				target.createStatusEffect("Thicc&Shake", 0, 0, 0, 0, false, "Icon_DrugPill", "Your hips and butt are covered in and under the effects of the Thicc&Shake batter.", false, 0,0xB793C4);
				target.addStatusValue("Thicc&Shake", 1, 1);
				target.setStatusMinutes("Thicc&Shake", timerStamp);
				
				IncrementFlag("THICC&SHAKE_USES");
			}
			//Not the player!
			else
			{
				if(inCombat()) output("\n\n");
				else clearOutput();
				output((inCombat() ? StringUtil.capitalize(target.getCombatName(), false) : (target.capitalA + target.short)) + " squeezes out and applies the Thicc&Shake batter");
				if (healing > 0) output(", replenishing some of [target.hisHer] energy! (<b>+" + healing + " Energy</b>)");
				else output(" but to no effect.");
				target.energy(healing);
			}
			return false;
		}
		
		public static function effectEnds(maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			if (target is PlayerCharacter)
			{
				AddLogEvent(ParseText("Your [pc.hips] feel less energized than before. You guess the Thicc&Shake has finally run its course."), "passive", maxEffectLength);
			}
		}
		
		// Dud Phase 1, 2, 3
		private static function effectDud(target:Creature):String
		{
			var msg:String = "";
			var doses:Number = target.statusEffectv1("Thicc&Shake");
			var phase:Number = target.statusEffectv2("Thicc&Shake");
			
			if(!inCombat())
			{
				if(phase == 1)
				{
					msg += "After a few minutes of wiggling, the nanomachines on your bottom don’t seem to respond. Weird.";
					
					kGAMECLASS.processTime(5);
					target.lust(10);
				}
				else if(phase == 2)
				{
					msg += "Gyrating, swinging, humping, nothing seems to work. It can’t be over already, can it? You want more cake! You wipe your brow from the sweat you worked up trying get these tiny bastards to work!";
					
					kGAMECLASS.processTime(15);
					kGAMECLASS.sweatyDebuff(1);
					kGAMECLASS.soreChange(1);
					target.lust(20);
				}
				else if(phase == 3)
				{
					msg += "Panting and exhausted from the arduous task of a hundred squats, you slump on the ground in a tired heap.";
					msg += "\n\n<i>“Why won’t these guys work?”</i> you groan, annoyed and upset from the lack of results.";
					
					kGAMECLASS.processTime(35);
					kGAMECLASS.sweatyDebuff(2);
					kGAMECLASS.soreChange(2);
					target.lust(50);
				}
				else
				{
					msg += "You attempt to wiggle your bottom to activate the Thicc&Shake nanomachines but to no effect...";
					
					kGAMECLASS.processTime(3);
					target.lust(5);
				}
			}
			else
			{
				msg += "\n\nAt the end of your tease, the Thicc&Shake nanomachines show no signs of change...";
			}
			if(msg != "" && target.hipRatingRaw >= 20 && target.buttRatingRaw >= 20) msg += " Perhaps your hips and ass are already too big?";
			
			if(phase >= 1 && target.statusEffectv3("Thicc&Shake") == 0)
			{
				// Queue overdose scene!
				var chance:int = Math.max((5 - doses), 5);
				if(phase >= 3 && (doses >= 5 || rand(chance) == 0 || (target.hipRatingRaw >= 20 && target.buttRatingRaw >= 20)) && !kGAMECLASS.disableExploreEvents())
				{
					msg += "\n\nYour Codex beeps, <i>“<b>Warning:</b> The stimulation of the Thicc&Shake nanomachines <b>will</b> cause unknown side effects!”</i>";
					
					var tEventCall:Function = (function(c_target:Creature):Function
					{
						return function():void
						{
							ThiccNShake.overdose(c_target);
						}
					})(target);
					
					kGAMECLASS.eventQueue.push(tEventCall);
					
					target.setStatusValue("Thicc&Shake", 3, 1);
				}
				else msg += "\n\nYour Codex beeps, <i>“<b>Warning:</b> Further stimulation of the Thicc&Shake nanomachines may cause unknown side effects!”</i>";
			}
			
			// Count shake activations
			target.addStatusValue("Thicc&Shake", 2, 1);
			
			return msg;
		}
		
		// When using with Tease
		public static function teaseCheck(target:Creature, usedHips:Boolean = true):String
		{
			var msg:String = "";
			var doses:Number = target.statusEffectv1("Thicc&Shake");
			var phase:Number = target.statusEffectv2("Thicc&Shake");
			
			if(phase >= 1) return effectDud(target);
			
			var addHips:Number = (target.hipRatingRaw >= 20 ? 0 : Math.min((2 + rand(4) + doses), 5));
			var addButt:Number = (target.buttRatingRaw >= 20 ? 0 : Math.min((2 + rand(4) + doses), 5));
			var newHips:Number = Math.min((target.hipRatingRaw + addHips), 20);
			var newButt:Number = Math.min((target.buttRatingRaw + addButt), 20);
			
			if(newHips < target.hipRatingRaw && !target.hipRatingUnlocked(newHips)) addHips = 0;
			if(newButt < target.buttRatingRaw && !target.buttRatingUnlocked(newButt)) addButt = 0;
			
			if(addHips + addButt <= 0) return effectDud(target);
			
			msg += "\n\nAt the end of your " + (usedHips ? "hip" : "ass") + " tease, you begin to feel a sensation like an oven warming up within your body. You shiver at the sudden warmth and noticeably continue your display of sensuality. Rocking your hips to and fro in slow cadence, the sensation only getting warmer as you gradually speed up and move faster.";
			if(addHips > 0)
			{
				msg += ParseText(" Your [pc.hips] stretch and ripen with each swing, the sensation nearly dazing you with lust.");
				
				target.hipRatingRaw = newHips;
			}
			if(addButt > 0)
			{
				msg += ParseText(" It only gets more delicious as your [pc.ass] bloats with meaty girth. Each butt cheek quakes with boundless eros and you can’t help but smack one for even greater stimulus.");
				
				target.buttRatingRaw = newButt;
			}
			msg += ParseText("\n\nThe feeling finally fades to a dull lustful ache--knowingly an effect of the Thicc&Shake batter. Wow, the stuff is no joke. Recovering, you wipe the sweat of your brow and survey your [pc.hips] and [pc.ass].");
			msg += "\n\nYou’re pretty sure your audience enjoyed the show as much as you did.";
			
			target.lust(5);
			
			// Count shake activations
			target.addStatusValue("Thicc&Shake", 2, 1);
			
			return msg;
		}
		
		// When using the “Shake” in Masturbate
		public static function masturbate(target:Creature):void
		{
			clearOutput();
			
			kGAMECLASS.clearBust();
			kGAMECLASS.showName("\nTHICC&SHAKE");
			author("Odaous");
			
			output(fapCheck(target));
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
		}
		private static function fapCheck(target:Creature):String
		{
			var msg:String = "";
			var doses:Number = target.statusEffectv1("Thicc&Shake");
			var phase:Number = target.statusEffectv2("Thicc&Shake");
			
			if(phase >= 1) return effectDud(target);
			
			var addHips:Number = (target.hipRatingRaw >= 20 ? 0 : Math.min((2 + rand(4) + doses), 5));
			var addButt:Number = (target.buttRatingRaw >= 20 ? 0 : Math.min((2 + rand(4) + doses), 5));
			var newHips:Number = Math.min((target.hipRatingRaw + addHips), 20);
			var newButt:Number = Math.min((target.buttRatingRaw + addButt), 20);
			
			if(newHips < target.hipRatingRaw && !target.hipRatingUnlocked(newHips)) addHips = 0;
			if(newButt < target.buttRatingRaw && !target.buttRatingUnlocked(newButt)) addButt = 0;
			
			if(addHips + addButt <= 0) return effectDud(target);
			
			msg += "Thinking to make use of the Thicc&Shake, you remove your gear and set it aside to prepare yourself. Upon swaying your [pc.hips] side to side, your lower half begins to swelter from an internal fire. Your breaths come out as gasps and moans while your";
			if(target.hasGenitals())
			{
				if(target.hasVagina()) msg += ParseText(" [pc.vaginas] glisten" + (target.vaginas.length == 1 ? "s" : "") + " with love juice");
				if(target.isHerm()) msg += " and";
				if(target.hasCock()) msg += ParseText(" [pc.cocks] surge" + (target.cocks.length == 1 ? "s" : "") + " with passion");
			}
			else msg += ParseText(" [pc.asshole] pulses with excitement");
			msg += ", demanding release!";
			msg += "\n\nYou slowly hump the air as if you were fucking an invisible lover. The gesture brings spikes of joy and pleasure to your senses as you notice the movements gradually getting harder and harder to do... as if you were dancing while half-submerged in a bowl of viscous oatmeal. The Thicc&Shake nanomachines are doing their work, piling on mass to your lower half.";
			if(addHips > 0)
			{
				msg += ParseText(" You feel your [pc.hips] widen with femininity");
				if(target.fertility() > 0) msg += " and fertility";
				msg += " that would cause even the most chaste individual to flush with desire.";
				
				target.hipRatingRaw = newHips;
			}
			if(addButt > 0)
			{
				msg += ParseText(" Your [pc.ass] exults with its new cornucopia of flesh, causing you to twerk in a lustful fervor.");
				
				target.buttRatingRaw = newButt;
			}
			msg += " You continue to hump and twerk as the heat intensifies within you.";
			
			var extraBlurbs:Array = [];
			var bonus:String = "";
			
			// For PC with breast size at C cup or larger:
			if(target.biggestTitSize() >= 3)
			{
				bonus = "";
				bonus += "You begin groping feverishly at your [pc.breasts] to get some release. You knead and squeeze them in rhythm of your growing bottom. For every inch of flesh you gain on your";
				if(addHips > 0) bonus += " [pc.hips]";
				if(addHips > 0 && addButt > 0) bonus += " and";
				if(addButt > 0) bonus += " [pc.ass]";
				bonus += ", you seem to squeeze them tighter.";
				extraBlurbs.push(ParseText(bonus));
			}
			// For PC with Lactating breast:
			if(target.isLactating())
			{
				bonus = "";
				bonus += "Your [pc.milkNoun] is being churned from the shake, building up and causing your [pc.nipples] to " + (target.hasErectNipples() ? "perk up" : "swell") + " and drool [pc.milk]. You tug at your [pc.nipples] and they begin to express sweet relief, your [pc.tongue] lolling out between your [pc.lips] from the pleasure of it all.";
				extraBlurbs.push(ParseText(bonus));
			}
			// For PC with Cock Tail:
			if(target.hasTailCock())
			{
				bonus = "";
				bonus += "Your [pc.tails] throb" + (target.tailCount == 1 ? "s" : "") + " in unison with your [pc.crotch]. " + (target.tailCount == 1 ? "It swings" : "They swing") + " wildly like an overly excited ausar’s! " + (target.tailCount == 1 ? "It" : "One of them") + " then charges pass your [pc.lips] and into your mouth and you can’t help but, suck! It bobs in and out with the rhythm of your thrashing hips. You can feel the cum swelling inside begging to come out. Dear god, the pleasure from it has you nearly drop to the ground--but even if you did, you would probably still be carelessly shaking your";
				if(addHips > 0) bonus += " [pc.hips]";
				if(addHips > 0 && addButt > 0) bonus += " and";
				if(addButt > 0) bonus += " [pc.ass]";
				bonus += " in the air.";
				extraBlurbs.push(ParseText(bonus));
			}
			// For PC with Vagina:
			if(target.hasVagina())
			{
				bonus = "";
				bonus += "Your [pc.vaginas] clench" + (target.vaginas.length == 1 ? "es" : "") + " hard despite the lack of penetration. You can fix that, you think, as you sink your fingers within [pc.oneVagina]. You swear that your [pc.vagina] squeezes so tight that it may leave a mark on your [pc.fingers]. You continue to finger yourself and hitting your G-spot, building up for the climax.";
				extraBlurbs.push(ParseText(bonus));
			}
			// For PC with Penis:
			if(target.hasCock())
			{
				bonus = "";
				bonus += "It’s hard to wrap your [pc.hand] around [pc.oneCock], but you get there. At first you only nestle it in your palm, unable to get the proper rhythm but eventually you begin pumping in matching pace with your hips. The combination of your hand and the active nanomachines bring you closer to the peak!";
				extraBlurbs.push(ParseText(bonus));
			}
			
			if(extraBlurbs.length > 0) msg += ("\n\n" + extraBlurbs[rand(extraBlurbs.length)]);
			
			msg += "\n\nIt finally comes as a crescendo of mind-numbing pleasure. Heavenly flesh explodes from";
			if(addButt > 0) msg += " your ass";
			if(addHips > 0 && addButt > 0) msg += " and";
			if(addHips > 0) msg += " your hips";
			msg += " and you can barely keep up as you moan and cum.";
			msg += "\n\nAfter you recover, you find yourself covered in sweat and the smell of sex.";
			
			kGAMECLASS.processTime(36);
			
			target.orgasm();
			
			// Count shake activations
			target.addStatusValue("Thicc&Shake", 2, 1);
			
			return msg;
		}
		
		// When Overdosing
		public static function overdose(target:Creature):void
		{
			clearOutput();
			
			kGAMECLASS.clearBust();
			kGAMECLASS.showName("THICCNESS\nOVERLOAD!");
			author("Odaous");
			
			output("<i>“Its not enough...”</i> you say out loud to yourself.");
			if(target.hasGenitals())
			{
				output(" Y");
				if(target.hasVagina()) output("our [pc.vagina] aches and clenches with hungry need");
				if(target.isHerm()) output(" and y");
				if(target.hasCock()) output("our [pc.cock] oozes precum in frustration");
				output(".");
			}
			output(" <i>“Need more... Need more...”</i> you continue in an absent-minded chant.");
			
			target.hipRatingRaw += 1;
			target.buttRatingRaw += 1;
			
			output("\n\nYou breathe from the past effort to get these damn Thicc&Shake machines to work! You brace your hands on your " + (target.hasLegs() ? "legs" : "[pc.legNoun]") + " and begin a slow rhythm of squats. It is so hard to do now - you’re so much heavier than you were before - but it just feels too fucking good!");
			
			target.hipRatingRaw += 1;
			target.buttRatingRaw += 1;
			
			output("\n\n<i>“C’mon... C’mon...”</i> you urge yourself, squatting faster and faster and focusing your thoughts on the building pleasure. A small spark lights up your world, causing you to gasp and look back, only to see the ultimate display of " + (target.fertility() > 0 ? "fertility" : "femininity") + " that is your hips-and-ass.");
			
			target.hipRatingRaw += 1;
			target.buttRatingRaw += 1;
			
			output("\n\nMore sparks go off, nearly knocking you to the ground with their lustful fury. Then you feel it--the awesome weight of new flesh. With each squat, a pound of flesh swells from your ass. Dear god, it’s even better than before that you might...");
			
			target.buttRatingRaw += 1;
			
			output("\n\nBoom,");
			if(target.hasGenitals())
			{
				output(" your");
				if(target.hasVagina()) output(" [pc.vaginas]");
				if(target.isHerm()) output(" and");
				if(target.hasCock()) output(" [pc.cocks]");
				output(" explode" + (target.totalGenitals() == 1 ? "s" : "") + " with");
				if(target.hasVagina()) output(" [pc.girlCum]");
				if(target.isHerm()) output(" and");
				if(target.hasCock()) output(" [pc.cum]");
			}
			else output(" your [pc.asshole] explodes with orgasmic contractions");
			output(", bringing you to the ground. Despite your body feeling numb and limp, you continue to flex your [pc.ass] for that precious flesh. Your [pc.tongue] hangs out of your mouth and eyes clouded, but still you twerk.");
			
			target.energy(35);
			target.hipRatingRaw += 1;
			
			output("\n\nPound after pound of flesh builds and builds. The pleasure of it all keeping you conscious. Then energy fills your body despite your fatigue. You brace your hands on the ground and begin assaulting the floor with your hips. Up and down, and up and down, your hips slam with such speed and force that even from a distance people could feel your efforts. Your hips ripen with each slam, gorgeous and delicious. Panting and gasping, nearly suffocating from the pleasure, but you can’t stop--<b>YOU WON’T STOP!</b>");
			if(target.hasGenitals())
			{
				output(" Your");
				if(target.hasVagina()) output(" [pc.vaginas]");
				if(target.isHerm()) output(" and");
				if(target.hasCock()) output(" [pc.cocks]");
				output(" " + (target.totalGenitals() == 1 ? "is" : "are") + " crying tears of joy that soak the ground beneath you.");
			}
			output(" You have to see what you’ve become! As you turn your head to indulge in the magnificent that is you, the world suddenly goes black.");
			output("\n\n");
			
			target.hipRatingRaw += 1;
			target.buttRatingRaw += 1;
			
			kGAMECLASS.processTime(25);
			
			kGAMECLASS.sweatyDebuff(3);
			kGAMECLASS.soreChange(3);
			
			target.orgasm();
			target.libido(5);
			target.taint(10);
			
			clearMenu();
			addButton(0, "Next", overdoseNext, target);
		}
		private static function overdoseNext(target:Creature):void
		{
			clearOutput();
			
			kGAMECLASS.clearBust();
			kGAMECLASS.showName("\nOVERTHICC!");
			author("Odaous");
			
			var doses:Number = target.statusEffectv1("Thicc&Shake");
			var maxHips:Boolean = (target.hipRatingRaw >= 20);
			var maxButt:Boolean = (target.buttRatingRaw >= 20);
			
			output("Your brain finally reboots from your slumber and your surroundings finally come back into focus. You rise only to be brought back down to the ground by gravity from an unknown weight.");
			output("\n\nYou begin to investigate and your eyes fall upon...");
			if(maxButt)
			{
				if(kGAMECLASS.silly) output(" <i>“By the stars, they should have sent a poet!”</i> You see");
				output(" your ass--now a monument of for all to worship.");
			}
			else output(" your ass--now far larger than it was previously.");
			if(maxHips) output(" Hips that would make broodmothers weep in frustration.");
			else output(" Hips very much wider than you are used to.");
			output(" Before you even take notice, one of your hands has already grasped the delicious cake that is your ass and its fingers sink into the warm yielding flesh. You gasp from the pleasure it brings and your hips tingle with sympathy from the touch. Not to be left out, your other hand follows with its fair share of curious roaming as well and soon they are both drowning in flesh.");
			output("\n\nYou finally stand and try to get use to the new size.");
			if(maxButt) output(" You have be careful though, one movement too fast and you will bring yourself down from the sheer momentum of your ass being dragged along.");
			if(maxHips) output(" Doors will" + (maxButt ? " also" : "") + " be a pain to deal with given the girth of your hips.");
			if(maxHips || maxButt) output(" A minor price to pay for a body like this.");
			else output(".. a slight struggle but nothing too serious.");
			
			var perkList:Array = [];
			
			// Gained the “Buttslut” Perk
			if(!target.hasPerk("Buttslut") && target.buttRatingRaw >= 10 && !target.analVirgin)
				perkList.push("Buttslut");
			// Gained the “Fecund Figure*”
			if(!target.hasPerk("Fecund Figure") && (target.isPregnant() || target.fertility() > 0))
				perkList.push("Fecund Figure");
			// Gained the “Bubble Butt” Perk
			if(!target.hasPerk("Bubble Butt") && target.buttRatingRaw >= 10 && !target.hasPerk("Buns of Steel"))
				perkList.push("Bubble Butt");
			// Gained the “Hips Don’t Lie” Perk
			if(!target.hasPerk("Hips Don't Lie") && target.hipRatingRaw >= 10)
				perkList.push("Hips Don't Lie");
			// Lose the “Buns of Steel” Perk
			if(target.hasPerk("Buns of Steel"))
				perkList.push("Buns of Steel");
			
			if(perkList.length > 0 && (doses >= 5 || rand(3) == 0))
			{
				switch(perkList[rand(perkList.length)])
				{
					case "Buttslut":
						output("\n\nYou are shocked by a spike of pleasure as you apparently have decided to play with your [pc.asshole]. The feeling is as great as");
						if(target.hasGenitals())
						{
							output(", if not more than, if you were playing with your");
							if(target.hasVagina()) output(" [pc.vaginas]");
							if(target.isHerm()) output(" and");
							if(target.hasCock()) output(" [pc.cocks]");
						}
						else output(" you can ever imagine");
						output(". You continue to plow your anus, until you experience a mini-orgasm. You could get use to this and you will. As you recover, you feel your [pc.ass] quake in agreement...?");
						output("\n\n(<b>Perk Gained: Buttslut</b> - Ensures your ass stays large and in charge, and allows you to heal from anal cumshots.)");
						
						target.createPerk("Buttslut", 0, 0, 0, 0, "Ensures your ass always remains bubbly and that fluids shot inside will heal your injuries.");
						
						target.lust(35);
						target.orgasm();
						break;
					case "Fecund Figure":
						output("\n\nYou notice that as you [pc.walk], there is an extra sway to your walk cycle than normal. Yes, you have [pc.hips], but this feels different... You think for a moment why that would be and one word flashes into your consciousness <i>“Pregnancy”</i>. You coo as that thought fills your mind. Your [pc.hips] gyrate slowly and swell with sympathy. Maybe you should head to a local sperm bank or find a random stud in a back alley...");
						output("\n\n(<b>Perk Gained: Fecund Figure</b> - Gradually, your hips and ass will permanently increase in size during pregnancy. <i>Perk can be lost when losing all vaginas.</i>)");
						
						target.createPerk("Fecund Figure", 1, 1, 0, 0, "Your broodmare body permanently changes you more into a fertility goddess while you are pregnant.");
						
						target.lust(35);
						break;
					case "Bubble Butt":
						output("\n\nYou rub your hand over your newly-sized behind.");
						if(target.tone >= 33) output(" Despite your toned body, your ass feels fat!");
						output(" Oh, your [pc.buttcheek] has become completely plush and malleable to the touch. You have a feeling that no matter how tight your body is, your bubble-like butt will always remain soft and spongy!");
						output("\n\n(<b>Perk Gained: Bubble Butt</b> - Ass remains soft regardless of muscle tone.)");
						
						target.createPerk("Bubble Butt", 0, 0, 0, 0, "Your ass is always soft, regardless of tone.");
						
						target.lust(35);
						break;
					case "Hips Don't Lie":
						output("\n\nYou can’t help but swing your [pc.hips] around. The weight, the power, the appeal--all very intoxicating. You need find partner and give them the ride of the lifetime. Though you wonder, maybe you will be too much for them? Ah, who cares! These hips need to slam into something, what it is doesn’t matter!");
						output("\n\n(<b>Perk Gained: Hips Don’t Lie</b> - Your hips don’t quit nor will they. Being any less fecund is an empty existence and your body will make certain to keep you looking like the fertile goddess you were meant to be.)");
						
						target.createPerk("Hips Don't Lie", 0, 0, 0, 0, "Your hips will always remain wide and girthy to give you the appearance of a fertility goddess.");
						
						target.lust(35);
						break;
					case "Buns of Steel":
						output("\n\nA shiver runs across your [pc.butts] and suddenly they don’t feel as extra tight and firm as they did before... You suppose this is one of the side effects of the Thicc&Shake cream....");
						output("\n\n(<b>Perk Lost: Buns of Steel</b>)");
						
						target.removePerk("Buns of Steel");
						break;
				}
			}
			output("\n\n");
			
			kGAMECLASS.processTime(24);
			
			target.removeStatusEffect("Thicc&Shake");
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
		}
	}
}

