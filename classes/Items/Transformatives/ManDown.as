/*

ManDown, for all your femboy TF needs.
The exact opposite of ManUp, giving your player all they need to be a femboy!
Scratch that. Estrobloom is the opposite. Whoopsies. Doesn’t focus at all on facial feminization like estrobloom, notably just more along the lines of de-masculinization. In any event, it makes your player as boy a boy can be without being a manly man or a girly girl boy. Not trap-stuff, femboy stuff. There’s a difference!

[warning: incessant rambling]
“But wait!”, you tell me. “Lenerator, you can already become a trap with that tf event at Beth’s! Why even write up an item?!” Hey! I just said this is a femboy TF item, not a trappy thing! And, well, for starters, the transformation when you agree to become a whore is... Well, you have to agree to become a whore. Some people might want a more dignified Steele-boy than that! It’s also a little forced. Sure, you agree to it, it isn’t unexpected, but it all happens in one go. Boop, you’re a boy and spend 3 weeks in the hole, while some random dicks spend a few hours in your hole at a time. heh. I have a pretty big list of reasons, but ultimately, it makes you more of a trap than a femboy, which makes a pain of having to go back and forth trying to fix the trappier stuff into boy-ier stuff. I’ve rambled enough, and god, I am sorry for that. There was just enough differences that I felt it warranted a whole other way to become a cute, non threatening boy. This also refrains from changing the color of any parts of you, or altering your hair at all. Lotsa other stuff, read and find out. Also, no forty fuckin libido forced on your pc.

“Wait, still, Lenerator, you! Estrobloom does this stuff too!” Not at all; estrobloom promises facial feminization with every use. ManDown is more specific in that your masculinity will be kept, if by a thread; it won’t push you at all towards a wholly androgynous or lightly (or heavily) feminine face. It also makes a point of not pushing your pecker to 1-inch sissiness. Makes you a smaller boy in general by reducing tone, thickness (reasonably, if you wanna be small but still a lil bigger!) and height. No savescumming required to get what you want out of it. unless what you want is a little more specific in which case im sorry
[rambling end]

ManDown, JoyCo’s product guaranteed to “take some of the man out of you”. Keeps your face recognizable as a boy’s face, but still a cute one at that. As in, makes your face “have the barest hint of masculinity in its structure”. Does a bunch of other boyish transformations to go with that. It’s generally intended to be along the lines of one-use-you’re-good tfs, but fixed in a way so that 3 uses is all you’d need due to the overdosing effect.

*/

package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class ManDown extends ItemSlotClass
	{
		public function ManDown()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "ManDown";
			longName = "injector labeled ‘ManDown’";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "an injector labeled ‘ManDown’";
			
			tooltip = "With the success of JoyCo’s ‘Futazona’ transformative, they decided to further expand on gender-bending transformation products. This one is an injector that could be easily mistaken as ManUp in its appearance, save for the blue fluid visible within being a lighter tone. The box containing the syringe, thankfully, is very different from its more masculine twin. A picture of a soft, twinkish boy is shown, giving a thumbs up with a speech bubble claiming ‘it really works!’. It guarantees that the user will retain or be pushed towards more boyish features while also accentuating their feminine ones. It’s pricier than ManUp, however, due to the difficulty of balancing male and female hormones and gene-coding in such a way that wouldn’t be erroneous. There’s a disclaimer that says its facial altering effects could be permanent with extended, abnormal usage.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1500;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Available at: Sera, wherever JoyCo products are sold
			
			kGAMECLASS.clearOutput();
			author("Lenerator");
			kGAMECLASS.showName("\nMANDOWN");
			
			if(target is PlayerCharacter)
			{
				output("Unwrapping the syringe from its packaging, you click the safety on your ManDown injector off, exposing the needle. Now that it’s prepared, you bring it to your neck, as instructed, and sense a slight sting as its payload flows into your bloodstream. You begin to feel the drug’s effects as the needle is promptly pulled out and thrown away, the nanomachines getting to work on your body in effort to make you a cute, effeminate boy.");
				
				var i:int = 0;
				
				target.createStatusEffect("ManDown Doses", 0, 0, 0, 0, true, "", "", false, 720);
				target.addStatusValue("ManDown Doses", 1, 1);
				target.setStatusMinutes("ManDown Doses", 720);
				var doses:int = target.statusEffectv1("ManDown Doses");
				
				// Up to 4 may occur at a time, with the rare dick/balls combo not counting against that.
				var changes:int = 0;
				var changeLimit:int = Math.min(doses, 4);
				
				/*
				
				Estrobloom megadose is taken:
				Player has “Perma-cute” perk	Remove “Perma-cute” perk, set at 25% femininity
				
				“Perma-cute” Perk -
				(think “Androgynous” but weighted more on the boy side and well... not androgynous)
				Description: As a side effect of too much ManDown, your face is now permanently fixed at being absolutely adorable, yet still showing enough boyish features that it’d be pretty easy to guess your gender. Or, to be confused for a really cute boy, if you go back from it. [also changes the face line in player description]
				Appearance blurb: 
				•Your face has the barest touch of masculinity to it, evident by a few little features in your bone structure. That aside, it’s got eyelashes long enough to bat cutely without looking like overdone fakes, on top of kissable lips and an upturned, smallish nose. 
				•Your face would appear androgynous, but a few small masculine traits it carries would make it unlikely for anyone to have any real trouble with your gender. Its also has soft, pleasing lips and a cute unthreatening nose, to boot.
				
				*/
				
				var cocked:Boolean = false;
				var cLength:Number = 5;
				if(target.hasPerk("Mini")) cLength = 3;
				if(target.hasPerk("Hung")) cLength = 7;
				var tSize:Number = 1;
				if(target.hasPerk("Bulgy")) tSize *= 2;
				var isCovered:Boolean = (!target.isCrotchExposed());
				var nFem:Number = 40;
				var nLip:Number = 3;
				var bLocked:Boolean = false;
				if(target.hasBreasts())
				{
					for(i = 0; i < target.breastRows.length; i++)
					{
						if(!target.breastRatingUnlocked(i, 0)) bLocked = true;
					}
				}
				
				// ManDown is overdosed:
				// also! if you use the stuff two times in one hour, the next use is overdosing, changing the tf scenes to a new one entirely, not including boy-parts-growing (which has its chance jacked up a ton, too.) when od’d, it has a new effect and all other effects get turbo’d: 
				// All stats affected by ManDown are not fixed as shown >>>>
				// Butt rating becomes 9, hips become 8, height becomes 70, tone becomes 40, skin is smoothed, etc.
				if(changes < changeLimit && doses >= 3
					&&	(target.hasCock() || target.createCockUnlocked())
					&&	(!target.hasVagina() || target.removeVaginasUnlocked())
					&&
					(	target.tallness > 70
					||	target.tone > 40
					||	target.femininity != nFem
					||	target.biggestTitSize(true) != 0
					||	target.lipMod != nLip
					||	!target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)
					||	target.hasBeard()
					||	target.hipRatingRaw != 8
					||	target.buttRatingRaw != 9
					)
				)
				{
					output("\n\nThis has got to be your " + num2Ordinal(doses) + " time in a short span of using ManDown... But hey, anything to get at being the cute boy you’ve wanted to be. The effects must be working, because you feel--");
					output("\n\nYou crash to the ground before you can manage to mentally describe what you’re feeling. Uh oh. What’s going on?! You are totally paralyzed, helpless at whatever may happen to you! Everything’s tingly, bones move on their own, skin moves to work with your changing flesh... You can barely tell what’s happening in the haze of it all. You drift into a light nap before being awaken to the realization that you probably shouldn’t try to sleep after overdosing such a drug... But after a moment, you feel control return to your body, though now... It’s much different from your body, as it was before. <b>Every aspect that ManDown can change has been done to the best of the drug’s ability.</b> You’re probably not going to experience a drastic difference if you decide to use it again.");
					
					if(!target.hasCock()) target.createCock(cLength, 1);
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cLengthRaw != cLength) target.cocks[i].cLengthRaw = cLength;
						if(target.cocks[i].cThicknessRatioRaw > 1.5) target.cocks[i].cThicknessRatioRaw = 1.5;
					}
					if(target.balls < 2) target.balls = 2;
					if(target.ballSizeRaw < tSize) target.ballSizeRaw = tSize;
					
					if(target.tallness > 70) target.tallness = 70;
					if(target.tone > 40) target.tone = 40;
					target.femininity = nFem;
					if(target.biggestTitSize(true) != 0)
					{
						for(i = 0; i < target.breastRows.length; i++)
						{
							target.breastRows[i].breastRatingRaw = 0;
						}
					}
					target.lipMod = nLip;
					if(target.hasVagina()) target.removeVaginas();
					if(!target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)) target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					if(target.hasBeard()) target.removeBeard();
					target.hipRatingRaw = 8;
					target.buttRatingRaw = 9;
					
					changes = changeLimit;
				}
				// Player does not have “Perma-cute” perk
				// Add “Perma-cute” perk
				// there’s a way detailed at the end to counteract the lock on your face’s masculinity, and in doing so a new transformation is added to Estrobloom as an addition:
				if(changes < changeLimit && doses >= 3 && target.femininity == nFem && !target.hasPerk("Perma-cute") && rand(3) == 0)
				{
					output("\n\nYou feel a tingle in your face after using the mod... And considering it already changed your face to how the box advertised, you’re a little worried it could turn the wrong direction into being too masculine or too feminine... But then, the tingling stops, and you check your codex’s black screen to look at yourself. Still seems the same? Wait... Wasn’t there a disclaimer? You pick up the box that previously housed the injector, reading it thoroughly, and much more closely.");
					output("\n\n<i>“<b>Warning:</b> Do not use multiple doses in a short span. May cause permanent changes to bone structure and cartilage of face. In the event instructions are misread or disregarded, a mega dose of Estrobloom may be necessary to counteract the effect.”</i>");
					output("\n\nOh, there was a disclaimer. Whoops. Oh well, your face is actually pretty nice this way, come to think of it. Now, you could take almost any mod without having to worry about getting too girly or boyish. Then again, it did say it’s somewhat reversible... Hm, you’d probably need <b>five doses of Estrobloom</b> in a short time to count as a mega dose. For now, though, you relish in your new, cute boy aesthetic.");
					
					output("\n\n(<b>Perk Gained: Perma-cute</b> - Your masculinity will stay in place unless you take enough Estrobloom to forcibly counteract it.)");
					target.createPerk("Perma-cute", nFem, nFem, 0, 0, "Your masculinity is permanently fixed to retain a cute, boyish appearance.");
					
					changes = changeLimit;
				}
				// No penis/testicles
				// Grow human penis/testicles with length of 5 inches and ball size of 1 and count of 2 [low chance of occurrence, raises significantly with ODing, 20% to 80%]
				if(!target.hasCock() && target.balls <= 0)
				{
					var penisChance:int = 20;
					if(doses >= 2) penisChance = 40;
					if(doses >= 3) penisChance = 60;
					if(doses >= 4) penisChance = 80;
					
					if(rand(100) < penisChance)
					{
						output("\n\nThere’s a rumbling at your pubic region, and before long, a little bump pushes its way against your [pc.skinColor] skin, threatening to break through...");
						if(target.hasVagina()) output(" It looks a lot like your clit, come to think of it.");
						output(" Until you see it actually is your skin, taking form of a cute boy-dick, standing at " + num2Text(cLength) + " inches of currently hypersensitive flesh! You pump away at your newfound prick, feeling great sensation and coming close to orgasm... Only, that doesn’t ever seem to come. What gives..?");
						output("\n\nNot much can be put into that thought before you feel more pressure from your skin, now under your newly-formed cock. Two lumps are pushing their way through, going through what must be a similar process that your penis just underwent. They must be your balls! You rub on them as they grow out of you, hoping to coax your first penile orgasm from them... They’re terribly sensitive, shutters sent through your cerebellum as you toy with them and your dick, until they make a cute, cohesive sack formed around them, clinging against your perineum and dick underside tightly. You pump harder and harder on your cock as you massage your balls, bathing in the new and fantastic sensations brought by your hypersensitive flesh. Man, being a femboy is gonna fuckin’ rule! That thought rings throughout your head as you feel it -- cum, frothing forth and dripping out of your cock, short spurts going forward and painting the ground below. <b>You now have a penis and two testicles!</b>");
						
						target.createCock(cLength, 1);
						target.balls = 2;
						target.ballSizeRaw = tSize;
						target.orgasm();
						
						cocked = true;
					}
				}
				// Taller than 68 inches
				// Reduce height by 2-3 inches 
				if(changes < changeLimit && target.tallness > 68 && rand(3) == 0)
				{
					var minTall:Number = 2 + rand(2);
					
					if(target.tallnessUnlocked(target.tallness - minTall))
					{
						output("\n\nYou ponder on all that you’ll do as a cute ‘lil femboy, the hearts you’ll break, the love you’ll chase... But you were apparently so deep in those thoughts that you didn’t pay mind to the shrinking world! By the time you’ve come to reality, it would look like <b>you’re " + num2Text(minTall) + " inches closer to the ground</b>.");
						
						target.tallness -= minTall;
					}
					else output("\n\n" + target.tallnessLockedMessage());
					
					changes++;
				}
				// Tone greater than 45
				// Reduce tone by 4
				if(changes < changeLimit && target.tone > 45 && rand(3) == 0)
				{
					var minTone:Number = 4;
					
					if(target.toneUnlocked(target.tone - minTone))
					{
						output("\n\nYour flesh feels different, you think, as you place your hand against your [pc.belly]. It loses some of its hardness, becoming softer and more pliable, overlying muscle shrinking away. <b>It seems you’ve lost some of your body’s toned physique.</b>");
						
						target.tone -= minTone;
					}
					else output("\n\n" + target.toneLockedMessage());
					
					changes++;
				}
				// Thickness greater than 60
				// Reduce thickness by 2-3
				if(changes < changeLimit && target.thickness > 60 && rand(3) == 0)
				{
					var isTight:Boolean = (target.tone >= 30);
					var minThicc:Number = 2 + rand(2);
					
					if(target.thicknessUnlocked(target.thickness - minThicc))
					{
						output("\n\nFeeling against your [pc.belly] in response to a tingling in the area, you notice as " + (isTight ? "the extra mass" : "layers of fat") + " on your body begin to seemingly melt away and retreat into you, " + (isTight ? "width" : "flabbiness") + " reducing as part of the ManDown. <b>Your thickness level has dropped, less body " + (isTight ? "mass" : "fat") + " encompassing your composition.</b>");
						
						target.thickness -= minThicc;
					}
					else output("\n\n" + target.thicknessLockedMessage());
					
					changes++;
				}
				// Masculinity greater/lesser than 20%
				// Set masculinity to 20%
				if(changes < changeLimit && target.femininity != nFem && rand(3) == 0)
				{
					if(target.femininityUnlocked(nFem))
					{
						output("\n\nYour face tingles, flesh becoming sensitive as you feel the strange, slightly painful sensation of what must be the bones of your skull changing, your face’s shape and features redefined before your eyes. Well, the only thing before your eyes is really a slight bit of " + (target.femininity < nFem ? "growth" : "reduction") + " in your visible eyelashes");
						if(target.hasSmallNose()) output(", and your nose taking a more upturned, button-y shape, but nothing overly drawn-out");
						output(". <b>Glancing at your codex’s reflection, it would appear your face now has enough masculinity to identify you as a boy, but lacking enough to appear as a cute and dainty twink.</b>");
						
						target.femininity = nFem;
					}
					else output("\n\n" + target.femininityLockedMessage());
					
					changes++;
				}
				// Cock changes
				if(target.hasCock())
				{
					// Penis length greater than 7 inches
					// Reduce penis length by 2-4 inches
					var minLength:Number = 2 + rand(3);
					
					var cList:Array = [];
					var cIdx:int = -1;
					
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cLengthRaw > (cLength + minLength) && target.cockLengthUnlocked(i, (cLength + minLength))) cList.push(i);
					}
					
					if(changes < changeLimit && cList.length > 0 && rand(3) == 0)
					{
						cIdx = cList[rand(cList.length)];
						
						if(target.cocks[cIdx].cLengthRaw > 24) minLength += 12;
						if(target.cocks[cIdx].cLengthRaw > 36) minLength += 12;
						if(target.cocks[cIdx].cLengthRaw > 48) minLength += 12;
						
						output("\n\nYep, this mod definitely works to make you more feminine while retaining masculinity, you think, as you watch your [pc.cock " + cIdx + "] shrink to a more manageable, cuter size, burning benignly with blissful sensation as it does. <b>Your cock has shrunk by " + num2Text(minLength) + " inches</b>");
						
						target.cocks[cIdx].cLengthRaw -= minLength;
						
						if(target.cocks[cIdx].cLengthRaw <= 12) output(", now resembling a much cuter and boyish shape");
						output(".");
						
						changes++;
					}
					
					// Penis thickness ratio greater than 1.5
					// Reduce penis thickness by .2-.6
					var minWidth:Number = 0.2 * Math.min(doses, 3);
					
					cList = [];
					
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cThicknessRatioRaw > 1.5 && target.cockThicknessUnlocked(i, 1.5)) cList.push(i);
					}
					
					if(changes < changeLimit && cList.length > 0 && rand(3) == 0)
					{
						cIdx = cList[rand(cList.length)];
						
						output("\n\n");
						if(isCovered) output("In your [pc.crotchCover] is a sensitive and tingly feeling, your [pc.cock " + cIdx + "] jumping at the sensation and coaxing");
						else output("Your exposed cock coaxes");
						output(" you to touch its eager length. Regardless of any lust you feel, it compels you to touch and stroke at it, and by the time some pre has worked its way to your fingertips, you see");
						if(isCovered) output(" (and feel)");
						output(" that <b>your penis has become a little less wide</b>");
						
						target.cocks[cIdx].cThicknessRatioRaw -= minWidth;
						
						if(target.cocks[cIdx].cThicknessRatioRaw <= 1.5) output(", now more true to your cock’s length");
						output(".");
						
						changes++;
					}
				}
				// Trappy Smoothpouch!
				if(changes < changeLimit && target.balls >= 2 && !target.hasStatusEffect("Uniball") && rand(3) == 0)
				{
					output("\n\nIt starts with a tingle in your crotch to get your attention.");
					if(isCovered) output(" You pull open your [pc.crotchCover] curiously.");
					output(" Then, every fold, hair, wrinkle, and blemish on your [pc.sack] smooths away, leaving nothing behind by perfect, glossy [pc.skinNoun]. It pulls a little tighter, compacting around your [pc.balls] without actually shrinking them, framing them into an adorable pouch.");
					
					target.createStatusEffect("Uniball", 0, 0, 0, 0, true, "", "", false, 0);
					
					changes++;
				}
				// Breasts exist
				// Reduce breasts to flat chest
				if(changes < changeLimit && target.biggestTitSize(true) != 0 && rand(3) == 0)
				{
					if(!bLocked)
					{
						output("\n\nYour chest... It’s on fire! You scratch and scratch and scratch at it, your [pc.breasts] unmoved by your slashes, until you watch as the boobs below you shrink until they’ve become nothing but average pectoral muscles, fitting for a boy, and covered in your desperate scratch marks... But no, they’re less what you’d call pecs in any regard and a lot closer to just... <b>Well, a new, flat chest.</b> You’re certainly not barrel-chested, either.");
						
						for(i = 0; i < target.breastRows.length; i++)
						{
							target.breastRows[i].breastRatingRaw = 0;
						}
					}
					else output("\n\n" + target.breastRatingLockedMessage());
					
					changes++;
				}
				// Lip mod more/less than 3
				// Set lip mod to 3
				if(changes < changeLimit && target.lipMod != nLip && rand(3) == 0)
				{
					if(target.lipModUnlocked(nLip))
					{
						output("\n\nYour lips begin to tingle like water was flowing off of their surfaces, feeling as if you had just been stung by a very particular and rude bee. Touching against the soft surface of them, you note that <b>your lips are now shaped like a succulent, pouty cupid’s bow</b>. They’re not overbearing, either; the perfect size, as the mod advertised.");
						
						target.lipMod = nLip;
					}
					else output("\n\n" + target.lipModLockedMessage());
					
					changes++;
				}
				// Has vagina(s)
				// Remove any vaginas
				if(changes < changeLimit && target.hasVagina() && rand(3) == 0)
				{
					if(target.removeVaginasUnlocked())
					{
						output("\n\nYou feel a sudden gush from your lower lips, as if your [pc.vagina] was expelling any lubricants within... While your femspunk paints your [pc.thighs], a tightening feeling is felt when you grasp at your now virginesque cunt. Slipping a finger inside, it’s quickly cast out by crushing tightness, the vaginal opening sealing itself over. You run your hand over and down your now-barren pubic spot only to find a smooth, yet still sensitive and soft ");
						if(target.hasCock()) output("boy-");
						output("mound left in its wake.");
						if(target.vaginas.length > 0) output(" Not only that, but the process continues with your other womanhood" + (target.vaginas.length == 2 ? "" : "s") + " as well...");
						output(" <b>Your vagina" + (target.vaginas.length > 0 ? " is" : "s are") + " gone, replaced by a smooth perineum.</b>");
						
						target.removeVaginas();
					}
					else output("\n\n" + target.removeVaginasLockedMessage());
					
					changes++;
				}
				// Has skin
				// Skin gains “smooth” flag
				if(changes < changeLimit && target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasSkinFlag(GLOBAL.FLAG_SMOOTH) && rand(3) == 0)
				{
					output("\n\nAs the mod does its work on your body, you feel it dancing up and down your skin; in which you eagerly touch and marvel at the sensation of your body hairs falling out, any lumps, creases, or folds <b>now made into youthfully smooth skin</b>.");
					
					target.addSkinFlag(GLOBAL.FLAG_SMOOTH);
					
					changes++;
				}
				// Has beard
				// Remove beard
				if(changes < changeLimit && target.hasBeard() && rand(3) == 0)
				{
					output("\n\nYour [pc.eyes] gaze lower down, against your [pc.face], and you notice what must be the work of ManDown. Your facial hair growth has");
					output(" either back into your skin");
					output(" has fallen out, drifting unto the ground");
					output(". <b>Your face is now smooth and beardless.</b>");
					
					target.removeBeard();
					
					changes++;
				}
				// Hip/thigh rating less than 8
				// Increase hip rating by 1-2
				if(changes < changeLimit && target.hipRatingRaw < 8 && rand(3) == 0)
				{
					var addHip:Number = 1 + rand(2);
					
					if(target.hipRatingUnlocked(target.hipRatingRaw + addHip))
					{
						output("\n\nYou feel a pain in your general pelvis area, something internal, clearly, because it’s like your bones themselves are fusing and refusing... Looking at your sides, you see why. <b>Your hips are now bigger and flirtier.</b> Your thighs grew as well to match, not in any way overwhelmingly; they’re cute, thickie-boy thighs.");
						
						target.hipRatingRaw += addHip;
					}
					else output("\n\n" + target.hipRatingLockedMessage());
					
					changes++;
				}
				// Hip/thigh rating greater than 11
				// Reduce hip rating by 2-3
				if(changes < changeLimit && target.hipRatingRaw > 11 && rand(3) == 0)
				{
					var minHip:Number = 2 + rand(2);
					
					if(target.hipRatingUnlocked(target.hipRatingRaw - minHip))
					{
						output("\n\nThere’s an odd feeling at your pelvis, uncomfortable as your skin folds in on itself and smoothes out... It’s clear why, because <b>your hips are now smaller</b>, matching a boyish but not unfeminine figure.");
						
						target.hipRatingRaw -= minHip;
					}
					else output("\n\n" + target.hipRatingLockedMessage());
					
					changes++;
				}
				// Butt rating lower than 9	Increase butt rating by 1-2
				if(changes < changeLimit && target.buttRatingRaw < 9 && rand(3) == 0)
				{
					var addButt:Number = 1 + rand(2);
					
					if(target.buttRatingUnlocked(target.buttRatingRaw + addButt))
					{
						output("\n\nYou yawn, awaiting for the mod to do more of its work, considering taking up a seat as your in wait of doing so... But before you can act on the thought, your built-in seat gets a sudden expansion in growth, you see, as you watch behind yourself when <b>your [pc.ass] pushes outward, now larger and more feminine</b>.");
						
						target.buttRatingRaw += addButt;
					}
					else output("\n\n" + target.buttRatingLockedMessage());
					
					changes++;
				}
				// Butt rating greater than 12	Reduce butt rating by 2-3
				if(changes < changeLimit && target.buttRatingRaw > 12 && rand(3) == 0)
				{
					var minButt:Number = 2 + rand(2);
					
					if(target.buttRatingUnlocked(target.buttRatingRaw - minButt))
					{
						output("\n\nFeeling a sudden little snap at your backside, you watch as the [pc.butt] behind you becomes more lithe and boy-like in its construction, still shaped well but <b>now a notably smaller butt</b>.");
						
						target.buttRatingRaw -= minButt;
					}
					else output("\n\n" + target.buttRatingLockedMessage());
					
					changes++;
				}
				
				// No changes
				if(changes <= 0 && !cocked)
				{
					output("\n\nYou feel a slight tingle, aaaannnndd...");
					output("\n\nNope. That’s about it.");
					if(	target.isFemboy()
					&&	target.tallness <= 70
					&&	target.tone <= 45
					&&	target.thickness <= 60
					&&	target.femininity == nFem
					&&	target.lipMod == nLip
					&&	target.hasSkinFlag(GLOBAL.FLAG_SMOOTH)
					&&	!target.hasBeard()
					&&	(target.hipRatingRaw >= 8 && target.hipRatingRaw <= 11)
					&&	(target.buttRatingRaw >= 9 && target.buttRatingRaw <= 12)
					)
					{
						output(" You reckon there’s nothing more that using ManDown could do for you. Maybe, if you wanted a trappier sort of look, you could use Estrobloom...");
						if(target.hasPerk("Perma-cute")) output(" But you’re going to need a lot to change your supposedly-permanent face.");
					}
					else output(" Perhaps it was a dud or you’re just very unlucky...");
				}
				
				output("\n\n");
			}
			else
			{
				output(target.capitalA + target.short + " injects the drug to no effect.");
			}
			return false;
		}
	}
}
