package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Utility.num2Text;
	
	public class Tittyblossom extends ItemSlotClass
	{
		
		//constructor
		public function Tittyblossom()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Tittyblossom";
			
			//Regular name
			this.longName = "popsicle labeled ‘Tittyblossom’";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a popsicle labeled ‘Tittyblossom’";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Marketed as “Estrobloom Plus” but better known colloquially as “Tittyblossom,” this hormone package is an enhanced version of the popular feminizing product Estrobloom. Packed with micromachines and stimulants to promote rapid breast growth in addition to standard feminization, Tittyblossom is a smash hit among those looking to enhance their feminine side.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var x:int = 0;
			var y:Number = 0;
			var choices:Array = new Array();
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//First use
				author("Various");
				
				target.createStatusEffect("Estrobloom Doses", 0, 0, 0, 0, true, "", "", false, 720);
				target.addStatusValue("Estrobloom Doses", 1, 1);
				target.setStatusMinutes("Estrobloom Doses", 720);
				var doses:int = target.statusEffectv1("Estrobloom Doses");
				
				//Consume:
				if(kGAMECLASS.flags["TAKEN_TITTYBLOSSOM"] == undefined) 
				{
					kGAMECLASS.flags["TAKEN_TITTYBLOSSOM"] = 1;
					kGAMECLASS.output("You carefully strip the wrapper, revealing an alluring, shimmering purple popsicle that makes its lesser cousin look slim by comparison. As you insert it between your [pc.lips], you are overcome by an intense flavor of blueberry - except it’s not. There’s something you can’t quite place your finger on.");
					target.createStatusEffect("TittiesUsed",1,0,0,0, true, "", "", false, 720);
				}
				//Repeat use
				else
				{
					if(!target.hasStatusEffect("TittiesUsed")) target.createStatusEffect("TittiesUsed",1,0,0,0, true, "", "", false, 720);
					else target.addStatusValue("TittiesUsed",1,1);
					if(target.statusEffectv1("TittiesUsed") < 2)
					{
						kGAMECLASS.output("You carefully strip the wrapper, revealing a purple popsicle. As you insert it between your [pc.lips] you are overcome by an intense flavor of blueberry - except it’s not. There’s something you can’t quite place your finger on.");
						//→ Just Estrobloom effects. If none proc, append the following
					}
					//Second use - within 12 hours?
					else if(target.statusEffectv1("TittiesUsed") < 3)
					{
						kGAMECLASS.output("You open the wrapper with more haste than the last, savoring the electric tingle it sends as you insert the large frozen stick into your maw.");
						
					}
					//Third use - within 6 hours? of second. Includes previous effects if proc.
					else if(target.statusEffectv1("TittiesUsed") < 4)
					{
						kGAMECLASS.output("You remove the wrapper, eyes glazing over a little as you practically inhale the purplish cocktail, consuming it within seconds. You wait for that vicarious tingle to flood through you, and it does.");
						target.addStatusValue("TittiesUsed",1,1);
					}
					//Fourth use - within 3 hours? of third.
					else
					{
						kGAMECLASS.output("You impatiently rip the popsicle from its confines and stuff it between your [pc.lips], eager to experience the flood of flavor and then sensation that comes after it.");
						target.addStatusValue("TittiesUsed",1,1);
					}
				}
				//DO ZE FEMINIZATION, SLOOTS
				y = target.femininity;
				//Feminity at max:
				if(target.femininity >= target.femininityMax())
				{
					kGAMECLASS.output("\n\nWarmth spreads to your face but vanishes with such suddenness that you have to wonder if it was ever there at all. You suppose your [pc.face] can’t get any more feminine-looking.");
					if(!target.hasVagina()) kGAMECLASS.output(" Maybe if you grew a vagina, your body could go a little further down that road....");
					else if(target.hasCock()) kGAMECLASS.output(" Maybe if you got rid of your [pc.cocks], your body could go a little further down that road....");
					else kGAMECLASS.output(" It’s already virtually perfect!");
				}
				//1 - 3-5 points
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA shiver of warmth tingles on your lips in spite of the Tittyblossom’s coolness. It radiates out into your jawbones as you sit there licking the spent stick, undoubtedly feminizing you.");
					x = 3+rand(3);
					target.modFem(x);
				}
				//2 - 5-7 points
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA gradual, insidious heat slowly suffuses the whole of your mouth. You gasp, only to have it seem to roll out with every exhalation, spreading to your cheeks and [pc.lips] first, then to your jaw and nose after. Getting girl");
					if(target.femininity >= 50) kGAMECLASS.output("ier");
					else kGAMECLASS.output("y");
					kGAMECLASS.output(" feels surprisingly... nice.");
					x = 5+rand(3);
					target.modFem(x);
				}
				//3 - 8 - 11 points
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA whole body shudder works through you as you feel the transformative cocktail kick in. You can feel it in your cheeks and mouth, so warm you wonder if you’re glowing, spreading slowly across your [pc.face] as it feminizes it.");
					x = 8+rand(4);
					target.modFem(x);
				}
				//4 - 12-15 points
				else if(rand(2) == 0)
				{
					kGAMECLASS.output("\n\nThe inside of your mouth is all tingly... but so are your lips! You purse them before pressing them together and sliding your [pc.tongue] between them. They feel like heated pads around the oral muscle. The sensation spreads outward through the whole of your [pc.face]. You can actually feel it changing as the Tittyblossom works its magic.");
					x = 12+rand(4);
					target.modFem(x);
				}
				//5 - 16-20 points
				else
				{
					kGAMECLASS.output("\n\nYou fail to stifle a gasp when the Tittyblossom kicks in. Your whole face feels like its practically glowing at this point, alight with electric buzzes of reforming flesh and remapped nerves. Your lips seem fuller and more sensitive, your jaw more svelte, and your nose cuter somehow.");
					x = 16+rand(5);
					target.modFem(x);
				}
				//Announce when passing a threshold:
				//<= 90
				if(y <= 90 && target.femininity > 90) kGAMECLASS.output(" <b>You can’t help but marvel at yourself when you look at yourself. Your [pc.face] is the epitome of femininity. It’s jaw-droppingly girly. Your eyelashes are long and thick. Your nose is adorable. Even your lips look ready for a night on the town.</b>");
				//<= 80
				else if(y <= 80 && target.femininity > 80) kGAMECLASS.output(" <b>Your eyelashes have gotten long and luxurious, your lips have gotten fuller, and even your nose looks cuter. You’re gorgeous.</b>");
				//<= 72
				else if(y <= 72 && target.femininity > 72) kGAMECLASS.output(" <b>There’s no doubt about it. You’re definitely getting hotter. Your [pc.face] looks feminine and shapely, sure to draw attention.</b>");
				//<= 65
				else if(y <= 65 && target.femininity > 65) kGAMECLASS.output(" <b>Checking yourself with your codex, you’re delighted to find that your cheekbones look positively pretty. You’re looking a lot cuter after that last dose!</b>");
				//<= 55
				else if(y <= 55 && target.femininity > 55) kGAMECLASS.output(" <b>Your face is definitely starting to show touches of femininity at this point. Even your lips are a little fuller.</b>");
				//< 45
				else if(y < 45 && target.femininity >= 45) kGAMECLASS.output(" <b>You check yourself out and discover that your [pc.face] is completely androgynous now. Your face alone isn’t going to tell anybody what gender you are, but if you take another couple Tittyblossoms....</b>");
				//< 35
				else if(y < 35 && target.femininity >= 35) kGAMECLASS.output(" <b>After looking at your [pc.face] in your codex’s holocam, you can only find a few hints of your masculinity left.</b>");
				else if(y < 28 && target.femininity >= 28) kGAMECLASS.output(" <b>The profile of your face is getting less obviously masculine, but there’s still the matter of your somewhat angular jawline to contend with.</b>");
				else if(y < 20 && target.femininity >= 20) kGAMECLASS.output(" <b>You’re definitely getting a little less handsome from this stuff, but you’re still a long way from pretty.</b>");
				else if(y < 10 && target.femininity >= 10) kGAMECLASS.output(" <b>A check with your codex confirms your jaw is getting noticeably less square.</b>");
				
				//Rare lip stuff!
				if(target.lipMod < 1 && target.lipModUnlocked(2)) choices[choices.length] = 1;
				else if (target.lipMod < 2 && target.lipModUnlocked(2)) choices[choices.length] = 2;
				
				//hip curviness
				if(target.hipRatingRaw < 12 && target.hipRatingUnlocked(12))
				{
					choices[choices.length] = 3;
					choices[choices.length] = 3;
					choices[choices.length] = 3;
					choices[choices.length] = 3;
					choices[choices.length] = 3;
				}
				//Bubble butt
				if(target.buttRatingRaw < 9 && target.buttRatingUnlocked(9))
				{
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
					choices[choices.length] = 4;
				}
				//Tone reduction to 30
				if(target.tone > 30 && target.toneUnlocked(30))
				{
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
					choices[choices.length] = 5;
				}
				//Hair length to ass length!
				if(target.hairLength <= 26 && target.hairLengthUnlocked(26))
				{
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
					choices[choices.length] = 6;
				}
				//Shrink cocks to 4.5" or 8" if hung
				if(target.hasCock())
				{
					trace("LONGEST COCK: " + target.longestCockLength() + " HUNG? " + target.hasPerk("Hung"));
					if (target.cockLengthUnlocked(target.longestCockIndex(), 4.5) && ((target.longestCockLength() > 4.5 && !target.hasPerk("Hung")) || target.longestCockLength() > 8))
					{
						choices[choices.length] = 7;
						choices[choices.length] = 7;
						choices[choices.length] = 7;
						choices[choices.length] = 7;
						choices[choices.length] = 7;
					}
				}
				//Shrink balls UNLESS balls have trap pouch tf.
				if(target.balls > 0 && target.ballSizeRaw >= 2 && target.ballSizeUnlocked(1) && (!target.hasStatusEffect("Uniball") || target.ballSizeRaw > 2))
				{
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
					choices[choices.length] = 8;
				}
				if(target.breastRows[0].breastRatingRaw < 20)
				{
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
					choices[choices.length] = 11;
				}
				if(target.hasBeard())
				{
					choices[choices.length] = 12;
					if (target.femininity >= 25) choices[choices.length] = 12;
					if (target.femininity >= 50) choices[choices.length] = 12;
					if (target.femininity >= 75) choices[choices.length] = 12;
					if (target.femininity >= 90) choices[choices.length] = 12;
				}
				if(doses >= 5 && target.hasPerk("Perma-cute"))
				{
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
					choices[choices.length] = 13;
				}
				//Default to no changes, then roll on the array for a change if some are available.
				var select:int = 9;
				if(choices.length > 0) select = choices[rand(choices.length)];
				//Always force boobies
				if(target.biggestTitSize() < 1) select = 10;
				//(RARE) Slowly boosts lip mod to 1
				if(select == 1)
				{
					kGAMECLASS.output("\n\nA resurgence of fiery tingles in your " + target.lipsDescript() + " alerts you that the popsicle isn’t done with your face yet! You shudder as your tongue probes your swelling, molten-hot mouth, feeling it bloom with plush fullness, the change making your nerves feel twice as sensitive as your [pc.tongue] rolls across them. You have to stifle yourself lest you cry out from the pleasure. It’s twice as good as licking your own nipples ");
					if(target.biggestTitSize() < 10) kGAMECLASS.output("would feel");
					else kGAMECLASS.output("feels");
					kGAMECLASS.output("! Unfortunately, the feeling fades before you get anywhere near an oral orgasm, leaving you with " + target.lipsDescript() + " and a slight increase in sensitivity.");
					//raise libido and lipmod
					target.libido(3);
					target.lipMod = 1;
				}
				//(RARE) Boost lip mod to 2!
				else if(select == 2)
				{
					kGAMECLASS.output("\n\nThe nerves in your [pc.lips] light up like a fireworks display of sensation, suddenly and immensely the focus of your entire consciousness. You can feel the nerves switching on as they struggle to deal with the sensation of... growth. They’re swelling up as they get even larger and puffier, so big and inviting that they beg to be kissed... or penetrated. Its going to be impossible not to draw attention with [pc.lips] like these. <b>Your system calms down after a few seconds, leaving with a bigger, more sensitive mouth to enjoy.</b>");
					//raise libido and lipmod
					target.libido(3);
					target.lipMod = 2;
				}
				//Makes hips curvy
				else if(select == 3)
				{
					//Armored
					if(target.isCrotchGarbed()) kGAMECLASS.output("\n\nYou can hear creaking, stretching sounds from your [pc.lowerGarments] as your waistline broadens with the new size of your [pc.hips].");
					//Unarmored
					else kGAMECLASS.output("\n\nYou adjust your stance a few times before you realize that your [pc.hips] are spreading and expanding, becoming a little bit more curvy.");
					target.hipRatingRaw++;
				}
				//and butts bubbly!
				else if(select == 4)
				{
					kGAMECLASS.output("\n\nStumbling a bit, you try to compensate for an altered center of gravity without knowing why. You stabilize yourself do a quick inspection, eventually identifying the culprit as your newly-enlarged backside.");
					target.buttRatingRaw++;
				}
				//Decreases muscle tone
				else if(select == 5)
				{
					kGAMECLASS.output("\n\nYour body is looking a little softer. Muscles are less distinct and hard angles are more rounded.");
					target.modTone( -(5 + rand(3)), false);
					if(target.tone < 0) target.tone = 0;
				}
				//Hair lengthening
				else if(select == 6)
				{
					//Bald -> 3"
					if(!target.hasHair())
					{
						kGAMECLASS.output("\n\nThe [pc.skin] of your head tingles at first, then itches. Finally, it transforms into a maddening need to scratch. You cannot help but give in, working your fingertips across your scalp as you feel [pc.hair] growing in a half-inch at a time. The longer it gets, the less it itches, and by the time the feeling fades, you’re left with three inches of the stuff.");
						target.hairLength = 3;
					}
					//Elsewise grow 2-5" until ass-length.
					else
					{
						x = 2 + rand(4);
						kGAMECLASS.output("\n\nYour [pc.hair] tickles your scalp as it grows longer. You grab a strand and hold it taut, feeling each additional inch of new length. After you’ve gained " + num2Text(x) + " inches, your expanded locks stop their frenzied expansion.");
						target.hairLength += x;
					}
				}
				//Shrink cocks to 4.5" or 8" if hung
				else if(select == 7)
				{
					x = target.longestCockIndex();
					//Cocks longer than 20" lose 25% of length
					if(target.cocks[x].cLengthRaw > 20)
					{

						kGAMECLASS.output("\n\nThe teltale heat of Tittyblossom’s changes flares up in your expansive groin, specifically in your [pc.cock " + x + "]. Just as you look at it, the fleshy mass begins to shrink, and not from going flaccid either. It’s getting smaller, and fast! It doesn’t stop until its lost about a quarter of its former length, leaving you with only ");
						target.cocks[x].cLengthRaw *= .75;
						if(target.hasPerk("Mini")) target.cocks[x].cLengthRaw *= .75;
						if(target.cocks[x].cLengthRaw < 1) target.cocks[x].cLengthRaw = 1;
						kGAMECLASS.output(num2Text(Math.round(target.cocks[x].cLength()*10)/10) + " inches. If you keep taking this stuff, you’re going to have a lot less dick to play with.");
					}
					//Otherwise lose 2-3", minimum 4.5/8"
					else
					{
						kGAMECLASS.output("\n\nA pleasant tingle in your [pc.cock " + x + "]");
						if(target.cockTotal() > 1) kGAMECLASS.output(" and in that cock alone");
						y = 2 + rand(3);
						if(target.hasPerk("Mini")) y *= 2;
						if(target.cocks[x].cLengthRaw - y < 8 && target.hasPerk("Hung")) y = target.cocks[x].cLengthRaw - 8;
						else if(target.cocks[x].cLengthRaw - y < 4.5) y = target.cocks[x].cLengthRaw - 4.5;
						//trace("Modified y: " + y);
						if(y < 1) y = 1;
						if(y >= target.cocks[x].cLengthRaw) y = target.cocks[x].cLengthRaw - 1;
						//round it
						y = Math.round(y*10)/10;
						kGAMECLASS.output(" warns you that something is about to happen down south. As it intensifies, you can’t stop yourself from moaning. It feels good, but at the same time your penis is getting smaller. Losing a half inch feels almost as good as cumming. Losing the whole inch brings you to your [pc.knees]. The next one makes your eyes cross and your [pc.hips] jerk, but no ejaculate emerges. When you recover, you’re missing " + y + " inch");
						if(y > 1) kGAMECLASS.output("es");
						kGAMECLASS.output(" of length from the exquisitely pleased cock.");
						target.cocks[x].cLengthRaw -= y;
					}
				}
				//Shrink balls UNLESS balls have trap pouch tf.
				else if(select == 8)
				{
					kGAMECLASS.output("\n\nSomething pinches your [pc.balls] through your [pc.sack], but you can’t seem to see anything that could possibly be hurting you down there. That riddle is solved when ");
					if(target.balls > 1) kGAMECLASS.output("they start");
					else kGAMECLASS.output("it starts");
					kGAMECLASS.output(" to diminish before your very eyes, losing mass while your [pc.sack] ");

					if(target.hasStatusEffect("Uniball"))
					{
						kGAMECLASS.output("keeps tight around ");
						if(target.balls == 1) kGAMECLASS.output("it");
						else kGAMECLASS.output("them");
					}
					else
					{
						kGAMECLASS.output("keeps pace with ");
						if(target.balls == 1) kGAMECLASS.output("it");
						else kGAMECLASS.output("them");
					}
					target.ballSizeRaw -= 2 + rand(3);
					if(target.ballSizeRaw > 10) target.ballSizeRaw -= 2 + rand(3);
					if(target.ballSizeRaw > 25) target.ballSizeRaw -= 2 + rand(3);
					if(target.ballSizeRaw > 35) target.ballSizeRaw -= 2 + rand(3);
					if(target.hasStatusEffect("Uniball")) kGAMECLASS.output(" like a vacuum-sealed bag");
					if(target.ballSizeRaw < 1) target.ballSizeRaw = 1;
					kGAMECLASS.output(". <b>You’ve got " + target.ballsDescript(false,true) + " now.</b>");
				}
				//Lose beard!
				else if(select == 12)
				{
					kGAMECLASS.output("\n\nAn irritating sensation centers on your chin and you can’t help but to scratch the itch with your [pc.fingers]. You notice that pieces of what was once your [pc.beard] are now littering your hands and falling to your [pc.feet]. It seems that the facial feminization also causes beard loss... <b>");
					if(kGAMECLASS.silly) kGAMECLASS.output("No matter how much of a viking you once were, now y");
					else kGAMECLASS.output("Y");
					kGAMECLASS.output("ou no longer have a beard!</b>");
					target.removeBeard();
				}
				//Growing TiTS
				// PC has a flat chest / tiny lil' moobs; always append as the last TF
				else if(select == 10)
				{
					kGAMECLASS.output("\n\nMinutes pass. You fidget around expectantly, awaiting the appearance of your new boobs. The label insisted there was a “good chance” of growth, right? You start pacing, ");
					if(target.armor.shortName != "") kGAMECLASS.output("adjusting your " + target.armor.longName + " and ");
					kGAMECLASS.output("feeling around your chest, looking for any sign of swelling. Finally after what seems like an eternity of anxious anticipation, you feel a tightness in your chest.");
					if(target.isChestGarbed()) kGAMECLASS.output(" You claw at your [pc.upperGarments], pulling it off to make room for your incoming expansion!");
					target.breastRows[0].breastRatingRaw += 1 + rand(3);
					kGAMECLASS.output(" You only just suppress a moan as the tightness turns into pleasure. The [pc.skin] of your once-small chest burgeons, filling out with balloon-like speed. You cup your new tits, shuddering at the suddenly sensitive flesh around your [pc.nipples]. Oh, that’s nice.... You now have [pc.breastCupSize]s!");
					target.changeLust(19+rand(5));
				}
				//Growing tits not first time
				else if(select == 11)
				{
					target.breastRows[0].breastRatingRaw += 1 + rand(2);
					//Expanding a Current Rack (up to D cups)
					if(target.breastRows[0].breastRating() < 7)
					{
						kGAMECLASS.output("\n\nYou feel a sudden tightness in your chest, just behind your tits. You grit your teeth through a flash moment of pain before it turns to pleasure. With a sigh of relief, you cup your boobs as the Tittyblossom lives up to its name, steadily expanding your bust");
						if(target.isChestGarbed()) kGAMECLASS.output(" until it strains against your [pc.upperGarment], demanding release from the now-too-tight confines");
						kGAMECLASS.output(". You now have a nice, firm pair of [pc.breastCupSize]s!");
						target.changeLust(9+rand(5));
					}
					//Expanding a Current Rack (Over D cups)
					else
					{
						kGAMECLASS.output("\n\nA sudden tightness clenches behind your buxom breasts, making you wince in pain before it turns into a delightful pleasure. You sigh");
						if(!target.isNude()) kGAMECLASS.output(", shrugging out of your [pc.gear]");
						kGAMECLASS.output(" as your tits swell in size, urged to even greater size by the hormone and nanomachine combination. You can’t stop yourself from cupping one and playing with it as it grows, pinching your [pc.nipple] as it grows even more sensitive. It takes every bit of willpower you have not to start masturbating on the spot, to find some release for the sexual tension coursing through your veins as the medicine does its work.");
						kGAMECLASS.output("\n\nFinally, the growth in your - now very sizable - tits subsides, leaving them bouncing with your every breath, nice and huge.");
						if(target.upperUndergarment.shortName == "") kGAMECLASS.output(" You’re probably going to want to invest in a bra, now... <i>or not</i> you think, giving yourself another squeeze.");
						kGAMECLASS.output(" You now have a hefty pair of [pc.breastCupSize]s!");
						target.changeLust(9+rand(5));
					}
					//Breasturbation
					// Proc if PC has high lust & grows D+ cups. Append to end of TF segment so it looks longer and more interesting.
					if(target.lust() >= 75)
					{
						author("Savin");
						kGAMECLASS.output("\n\nThe sight of your gorgeous new bosom, combined with the still-burning heat radiating through your [pc.nipples] and loins soon lulls you into a daze, leaving your moaning and teasing yourself, fingers working away at your stiff teats. Oh, that’s nice. Your [pc.knees] wobble");
						if(target.legCount == 1) kGAMECLASS.output("s");
						kGAMECLASS.output(" as you expand your play, hands roaming down the sheer swell of your nanomachine-enhanced bosom, kneading and caressing every new inch of boobflesh as you go.");
						kGAMECLASS.output("\n\nA particularly pleasant pinch of your [pc.nipple] sends enough of a shock through you that you give out a little moan, back arching as your teats stiffen under the sudden assault. Once the floodgate opens, you’re soon moaning and whimpering with every roaming touch. Your fingers go exploring, teasing and groping your [pc.chest]. Every pinch or squeeze elicits a gasp of pleasure from your lips as your lust rises, spreading like a heatwave from your tits through your chest and your");
						if(target.hasCock()) 
						{
							kGAMECLASS.output(" rapidly hardening cock");
							if(target.cockTotal() > 1) kGAMECLASS.output("s");
						}
						else if(target.hasVagina()) 
						{
							kGAMECLASS.output(" quivering quim");
							if(target.vaginaTotal() > 1) kGAMECLASS.output("s");
						}
						else kGAMECLASS.output(" tinging, faceless groin");
						kGAMECLASS.output(". With a shudder, you sink down to your [pc.knees]");
						if(target.legCount > 1) kGAMECLASS.output(", spreading ‘em wide");
						kGAMECLASS.output(" as you lose yourself to your lust.");

						kGAMECLASS.output("\n\nYour eyes flutter closed, mind slowly shutting down, overwhelmed by all the wonderful new boobflesh it has to play with. And play with it you do: minutes pass in blissful lust, exploring your [pc.chest] with increasing vigor, until you’re panting and gasping, chest heaving as you find yourself building an intensive pressure behind your chest. You only have time to think the word <i>boobgasm</i> before it hits you like a brick. With a scream of ecstasy, you throw your head back and cum, harder than you would ever have imagined");
						if(target.hasCock()) 
						{
							kGAMECLASS.output(". [pc.EachCock] sprays a thick load, hands-free as your grope yourself, splattered the ground with wasted seed");
							if(target.hasVagina()) kGAMECLASS.output("; y");
						}
						else if(target.hasVagina()) kGAMECLASS.output(". Y");
						if(target.hasVagina()) 
						{
						 	kGAMECLASS.output("our [pc.vaginas] quivers, leaking fem-cum as ");
						 	if(target.totalVaginas() == 1) kGAMECLASS.output("it desperately grasps for something to fuck as it sends shockwaves of pleasure through you");
						 	else kGAMECLASS.output("they desperately grasp for something to fuck as they send shockwaves of pleasure through you");
						}
						if(target.hasCock() || target.hasVagina()) kGAMECLASS.output(".");
						kGAMECLASS.output(" You only just stop yourself from collapsing as your orgasm wracks your body, radiating from your [pc.chest] and groin as you continue to grope and caress yourself.");
						kGAMECLASS.output("\n\nThe orgasm seems to last for ages, moments stretching to eternities as you succumb to bliss and your own explosive arousal, only groping yourself harder as you reach your climax, and slowly come down. When it ends, you find yourself drenched in sweat");
						if(target.hasCock() || target.hasVagina())
						{
							kGAMECLASS.output(" and ");
							if(!target.hasCock()) kGAMECLASS.output("[pc.girlCum]");
							else kGAMECLASS.output("[pc.cum]");
						}
						kGAMECLASS.output(", trying to catch your breath as you slump down to the ground on");
						if(target.legCount == 1) kGAMECLASS.output(" your");
						kGAMECLASS.output(" weak [pc.knees]. Holy shit...");
						kGAMECLASS.processTime(5);
						target.orgasm();
					}
					//Prevent "nothing happens" message.
					select = 10;
				}
				// Remove "Perma-cute" perk
				else if(select == 13)
				{
					kGAMECLASS.output("\n\nYour face... <i>tingles</i>. Weird, because you thought that was supposed to stop. Unless... Oh, right. <b>You have lost the “Perma-cute” perk, removing your protection from masculinity-altering transformatives.</b> You’re also noticing a slight pain... Wow, you didn’t miss the feeling of face bones and cartilage contorting like this. Looking at your face (this time with your codex’s camera to make sure you get a better look than at a black screen), you see that it has also become <b>significantly more feminine</b>, so it would appear that you won’t have boyish looks forever, anymore.");
					
					kGAMECLASS.output("\n\n(<b>Perk Lost: Perma-cute</b>)");
					target.removePerk("Perma-cute");
					target.modFem(10);
					
					kGAMECLASS.output("\n\n<i>It’s over!</i>");
				}
				//Cunt TF (requires no cunt)
				// If PC uses 5+ times in 24 hours, and doesn't already have a vagina. Procs last in scene
				if(target.statusEffectv1("TittiesUsed") >= 6)
				{
					//→ No vagoo
					if(!target.hasVagina())
					{
						target.createVagina();
						kGAMECLASS.output("\n\nYou are overcome with the sensation of blissful warmth, particularly at your crotch, yet when you reach down you don’t feel anything strange at all. In fact, the only outward signs of anything is a flush that spreads across your groin. Your crotch feels... empty, yearning to be filled...");
						//→ balls
						if(target.balls > 0 && target.ballSizeRaw >= 2)
						{
							kGAMECLASS.output("\n\nThen suddenly, an abrupt sucking sensation can be felt on your [pc.balls] - from the inside! You reach down once more only to find, with a start, ");
							//→ small balls and no trap pouch
							if(target.ballSizeRaw < 3 && !target.hasStatusEffect("Uniball"))
							{
								kGAMECLASS.output("that they are shrinking into you at an alarming rate!");
								target.ballSizeRaw = 0.5;
							}
							//→ huge balls and no trap pouch
							else if(!target.hasStatusEffect("Uniball"))
							{
								kGAMECLASS.output("that vast amounts are sinking into you at an alarming rate!");
								target.ballSizeRaw *= 0.5;
							}
							//→ trap pouch
							else
							{
								kGAMECLASS.output("that your trappy pouch puckers, and tightens against your holstered nuts.");
								target.ballSizeRaw = 1;
							}
						}
						kGAMECLASS.output("\n\nYou can’t help but shiver at the changes surging through you. Suddenly, you feel... juices... running down and slickening your leg. Wait, what? You give a gasp of pleasure as you feel your groin splitting open - not painfully, but rather with an eruption of ecstasy. Your [pc.knees] buckle");
						if(target.legCount == 1) kGAMECLASS.output("s");
						kGAMECLASS.output(" as your groin opens up, gushing a nearly-orgasmic flood of new feminine fluids as your new hole takes shape. You have a [pc.pussy] now");
						if(target.balls > 0 && target.ballSizeRaw < 0.75)
						{
							kGAMECLASS.output(" where your " + (target.balls == 1 ? "ballsack once was" : "balls once were"));
							target.removeBalls();
							target.resetCumProduction();
						}
						kGAMECLASS.output("!");
						kGAMECLASS.output("\n\nIntrigued, you can’t help but explore this new asset. Reaching down, you spread your quivering quim - soaking your fingers in juices - and as you slip a digit in you almost instantaneously clench up in orgasm, racking your body with a sensation so great you barely avoid crumpling to the floor. It seems your new vagina is especially sensitive... and probably will be for a while until you get used to having it. As your hands slip out of your new, beautiful pussy, you think... perhaps you should enjoy the added sensitivity while it lasts.");
						target.orgasm();
						author("Gruey");
						target.changeLust(30+rand(20));
						// +LOTS of Lust
					}
					//Prevent "nothing happens" message.
					select = 10;
				}
				else if(select == 9)
				{
					if(target.statusEffectv1("TittiesUsed") < 2) kGAMECLASS.output("\n\nYou wait, and yet nothing happens aside from a slight tingle. Was this a dud? You feel slightly more feminine than before, but you’re not sure you look it. Still, you can’t help but want another....");
					else kGAMECLASS.output("\n\nYou wait, and yet nothing happens aside from a slight tingle. Was this a dud? You feel slightly more feminine than before, but you’re not sure you look it. Still, you can’t help but want another....");
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consumes the popsicle to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
