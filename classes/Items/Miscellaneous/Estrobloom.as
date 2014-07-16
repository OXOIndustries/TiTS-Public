package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Estrobloom extends ItemSlotClass
	{
		
		//constructor
		public function Estrobloom()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Estrobloom";
			
			//Regular name
			this.longName = "popsicle labelled 'Estrobloom'";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a popsicle labelled 'Estrobloom'";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Estrobloom is a chemical cocktail engineered by JoyCo designed to help its users \"bloom into the feminine flower they always deserved to be.\" Some planets have banned Estrobloom due to the disruption it can introduce to racial gender identities, but in more liberal systems the product flows unrestricted.\n\nIt comes in convenient popsicle form for easy use, and the wrapper lists a bevy of potential side effects: increases in hip and butt size, loss of muscle tone, longer hair, reduction of phallus size, and even lip swelling. It does guarantee, in big bold letters, that <b>every use will cause facial feminization</b>.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
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
				//A little flavor for the flavor, limit it to one flavor a color, so we just don't have every fruit flavor you can possibly think of in this array.
				var flavors:Array = [["strawberry","pink"],["cherry","red"],["orange","orange"],["banana","yellow"],["apple","green"],["blueberry","blue"],["grape","purple"]];
				var flavorIndex:int = rand(flavors.length);
				var popFlavor:String = flavors[flavorIndex][0];
				var popColor:String = flavors[flavorIndex][1];
				
				//Consume:
				if(target.hasStatusEffect("Taken Estrobloom")) 
				{
					kGAMECLASS.output("You waste no time in unwrapping the ");
					kGAMECLASS.output(popFlavor);
					kGAMECLASS.output(" popsicle and cramming it straight into your waiting gob. Your [pc.lips] seal tightly around the delicious, mutagenic treat, slurping the rapidly-melting, ");
					kGAMECLASS.output(popColor);
					kGAMECLASS.output(" syrupy goo down as quickly as possible. You finish it in less than half a minute, though you spend a moment running your [pc.tongue] across your [pc.lips] to harvest every lost drop of sticky goodness from them.");
				}
				else
				{
					kGAMECLASS.output("You unwrap the popsicle, cringing at the excessively loud snapping of the foil-lined wrapper. Why do they make these damned things so noisy to open, anyway? Shrugging, you put the wrapper away to reveal a slender, ");
					kGAMECLASS.output(popFlavor);
					kGAMECLASS.output("-scented popsicle. You gingerly slip the ");
					kGAMECLASS.output(popColor);
					kGAMECLASS.output("-colored treat past your [pc.lips], marveling at its syrupy-sweet taste. You'd never guess this was a transformative cocktail and not a mundane popsicle by the flavor alone.\n\nThe estrobloom melts in your mouth like cotton candy, and in less than a minute, you've reduced it to a ");
					kGAMECLASS.output(popColor);
					kGAMECLASS.output("-stained, wooden stick.");
					target.createStatusEffect("Taken Estrobloom",0,0,0,0,true,"","",false,0);
				}
				//DO ZE FEMINIZATION, SLOOTS
				y = target.femininity;
				//Feminity at max:
				if(target.femininity >= target.femininityMax())
				{
					kGAMECLASS.output("\n\nWarmth spreads to your face but vanishes with such suddenness that you have to wonder if it was ever there at all. You suppose your [pc.face] can't get any more feminine-looking.");
					if(!target.hasVagina()) kGAMECLASS.output(" Maybe if you grew a vagina, your body could go a little further down that road....");
					else if(target.hasCock()) kGAMECLASS.output(" Maybe if you got rid of your [pc.cocks], your body could go a little further down that road....");
					else kGAMECLASS.output(" It's already virtually perfect!");
				}
				//1 - 3-5 points
				else if(rand(3) == 0)
				{
					kGAMECLASS.output("\n\nA shiver of warmth tingles on your lips in spite of the Estrobloom's coolness. It radiates out into your jawbones as you sit there licking the spent stick, undoubtedly feminizing you.");
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
					kGAMECLASS.output("\n\nA whole body shudder works through you as you feel the transformative cocktail kick in. You can feel it in your cheeks and mouth, so warm you wonder if you're glowing, spreading slowly across your [pc.face] as it feminizes it.");
					x = 8+rand(4);
					target.modFem(x);
				}
				//4 - 12-15 points
				else if(rand(2) == 0)
				{
					kGAMECLASS.output("\n\nThe inside of your mouth is all tingly... but so are your lips! You purse them before pressing them together and sliding your [pc.tongue] between them. They feel like heated pads around the oral muscle. The sensation spreads outward through the whole of your [pc.face]. You can actually feel it changing as the Estrobloom works its magic.");
					x = 12+rand(4);
					target.modFem(x);
				}
				//5 - 16-20 points
				else
				{
					kGAMECLASS.output("\n\nYou fail to stifle a gasp when the Estrobloom kicks in. Your whole face feels like its practically glowing at this point, alight with electric buzzes of reforming flesh and remapped nerves. Your lips seem fuller and more sensitive, your jaw more svelte, and your nose cuter somehow.");
					x = 16+rand(5);
					target.modFem(x);
				}
				//Announce when passing a threshold:
				//<= 90
				if(y <= 90 && target.femininity > 90) kGAMECLASS.output(" <b>You can't help but marvel at yourself when you look at yourself. Your [pc.face] is the epitome of femininity. It's jaw-droppingly girly. Your eyelashes are long and thick. Your nose is adorable. Even your lips look ready for a night on the town.</b>");
				//<= 80
				else if(y <= 80 && target.femininity > 80) kGAMECLASS.output(" <b>Your eyelashes have gotten long and luxurious, your lips have gotten fuller, and even your nose looks cuter. You're gorgeous.</b>");
				//<= 72
				else if(y <= 72 && target.femininity > 72) kGAMECLASS.output(" <b>There's no doubt about it. You're definitely getting hotter. Your [pc.face] looks feminine and shapely, sure to draw attention.</b>");
				//<= 65
				else if(y <= 65 && target.femininity > 65) kGAMECLASS.output(" <b>Checking yourself with your codex, you're delighted to find that your cheekbones look positively pretty. You're looking a lot cuter after that last dose!</b>");
				//<= 55
				else if(y <= 55 && target.femininity > 55) kGAMECLASS.output(" <b>Your face is definitely starting to show touches of femininity at this point. Even your lips are a little fuller.</b>");
				//< 45
				else if(y < 45 && target.femininity >= 45) kGAMECLASS.output(" <b>You check yourself out and discover that your [pc.face] is completely androgynous now. Your face alone isn't going to tell anybody what gender you are, but if you take another couple Estroblooms....</b>");
				//< 35
				else if(y < 35 && target.femininity >= 35) kGAMECLASS.output(" <b>After looking at your [pc.face] in your codex's holocam, you can only find a few hints of your masculinity left.</b>");
				else if(y < 28 && target.femininity >= 28) kGAMECLASS.output(" <b>The profile of your face is getting less obviously masculine, but there's still the matter of your somewhat angular jawline to contend with.</b>");
				else if(y < 20 && target.femininity >= 20) kGAMECLASS.output(" <b>You're definitely getting a little less handsome from this stuff, but you're still a long way from pretty.</b>");
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

				//Default to no changes, then roll on the array for a change if some are available.
				var select:int = 9;
				if(choices.length > 0) select = choices[rand(choices.length)];

				//(RARE) Slowly boosts lip mod to 1
				if(select == 1)
				{
					kGAMECLASS.output("\n\nA resurgence of fiery tingles in your " + target.lipsDescript() + " alerts you that the popsicle isn't done with your face yet! You shudder as your tongue probes your swelling, molten-hot mouth, feeling it bloom with plush fullness, the change making your nerves feel twice as sensitive as your [pc.tongue] rolls across them. You have to stifle yourself lest you cry out from the pleasure. It's twice as good as licking your own nipples ");
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
					kGAMECLASS.output("\n\nThe nerves in your [pc.lips] light up like a fireworks display of sensation, suddenly and immensely the focus of your entire consciousness. You can feel the nerves switching on as they struggle to deal with the sensation of... growth. They're swelling up as they get even larger and puffier, so big and inviting that they beg to be kissed... or penetrated. Its going to be impossible not to draw attention with [pc.lips] like these. <b>Your system calms down after a few seconds, leaving with a bigger, more sensitive mouth to enjoy.</b>");
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
					target.tone -= 5+rand(3);
					if(target.tone < 0) target.tone = 0;
				}
				//Hair lengthening
				else if(select == 6)
				{
					//Bald -> 3"
					if(!target.hasHair())
					{
						kGAMECLASS.output("\n\nThe [pc.skin] of your head tingles at first, then itches. Finally, it transforms into a maddening need to scratch. You cannot help but give in, working your fingertips across your scalp as you feel [pc.hair] growing in a half-inch at a time. The longer it gets, the less it itches, and by the time the feeling fades, you're left with three inches of the stuff.");
						target.hairLength = 3;
					}
					//Elsewise grow 2-5" until ass-length.
					else
					{
						x = 2 + rand(4);
						kGAMECLASS.output("\n\nYour [pc.hair] tickles your scalp as it grows longer. You grab a strand and hold it taut, feeling each additional inch of new length. After you've gained " + kGAMECLASS.num2Text(x) + " inches, your expanded locks stop their frenzied expansion.");
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

						kGAMECLASS.output("\n\nThe teltale heat of Estrobloom's changes flares up in your expansive groin, specifically in your [pc.cock " + x + "]. Just as you look at it, the fleshy mass begins to shrink, and not from going flaccid either. It's getting smaller, and fast! It doesn't stop until its lost about a quarter of its former length, leaving you with only ");
						target.cocks[x].cLengthRaw *= .75;
						kGAMECLASS.output(kGAMECLASS.num2Text(Math.round(target.cocks[x].cLength()*10)/10) + " inches. If you keep taking this stuff, you're going to have a lot less dick to play with.");
					}
					//Otherwise lose 2-3", minimum 4.5/8"
					else
					{
						kGAMECLASS.output("\n\nA pleasant tingle in your [pc.cock " + x + "]");
						if(target.cockTotal() > 1) kGAMECLASS.output(" and in that cock alone");
						y = 2 + rand(3);
						if(target.cocks[x].cLengthRaw - y < 8 && target.hasPerk("Hung")) y = target.cocks[x].cLengthRaw - 8;
						else if(target.cocks[x].cLengthRaw - y < 4.5) y = target.cocks[x].cLengthRaw - 4.5;
						trace("Modified y: " + y);
						if(y < 1) y = 1;
						//round it
						y = Math.round(y*10)/10;
						kGAMECLASS.output(" warns you that something is about to happen down south. As it intensifies, you can't stop yourself from moaning. It feels good, but at the same time your penis is getting smaller. Losing a half inch feels almost as good as cumming. Losing the whole inch brings you to your knees. The next one makes your eyes cross and your [pc.hips] jerk, but no ejaculate emerges. When you recover, you're missing " + y + " inch");
						if(y > 1) kGAMECLASS.output("es");
						kGAMECLASS.output(" of length from the exquisitely pleased cock.");
						target.cocks[x].cLengthRaw -= y;
					}
				}
				//Shrink balls UNLESS balls have trap pouch tf.
				else if(select == 8)
				{
					kGAMECLASS.output("\n\nSomething pinches your [pc.balls] through your [pc.sack], but you can't seem to see anything that could possibly be hurting you down there. That riddle is solved when ");
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
					kGAMECLASS.output(". <b>You've got " + target.ballsDescript(false,true) + " now.</b>");
				}
				else if(select == 9)
				{
					kGAMECLASS.output("\n\nThat's it. Nothing else happens. There must not be much for Estrobloom to enhance at this point.");
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
