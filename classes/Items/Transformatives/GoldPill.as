/*
GOLD MYR TF BREAKDOWN

Always Gives:
Chitin Limbs
Gold or Black Hair
+Dicksize (up to 2 ft.)
+Breastsize (up to GG)
Lactation Typechange
Human Skin
Elfin Ears
Human Face


Sometimes Gives:
Black, Insectile Eyes
Insect Feelers
Honey Jizz
Honey Girlspunk
+Libido
+Thin


Rare Procs:
Honeypot Perk (Convert Thickness to Boob Size)
Ant Abdomen
Second Breast Row
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
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	
	public class GoldPill extends ItemSlotClass
	{
		
		//constructor
		public function GoldPill()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Gold Pill";
			//Regular name
			this.longName = "gold pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a gold pill";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A simple-looking pill with white and gold stripes produced by Xenogen Biotech, this pill is loaded with a new, proprietary blend of nanomachines programmed to rebuild your body in the image of a gold myrmedion, one of the ant-like inhabitants of Myrellion.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Savin");
			var pc:Creature = target;
			if(target is PlayerCharacter) {
				output("You take the myr-themed pill out of its container and roll it between your fingers, looking it over. The colors are vibrant, almost cheerful, and the tiny Xenogen logo printed on the side of the pill is all but cartoonish. Well, no sense waiting. You pop the pill in your mouth and swallow, sighing as the pill slides down your throat. Your body begins to tingle almost immediately...");
				var changes:int = 0;
				var changeLimit:int = 2;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;
				//See Breakdown (above) for which effects go where. 

				if(changes < changeLimit)
				{
					//PC is gooey
					if(pc.hasGooSkin() && rand(2) == 0)
					{
						if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
						{
							output("\n\nYour gooey body begins to solidify, wracking you with strange sensations. Slowly but surely, your goo is replaced with skin, and your internals solidify into something more normal for the myr you’re striving to become! Before long, your body is covered with solid flesh! <b>You now have normal skin!</b>");
							pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
							pc.clearSkinFlags();
							changes++;
						}
						else output("\n\n" + pc.skinTypeLockedMessage());
					}
				}
				//Chitin Limbs & Human Skin
				if(changes < changeLimit)
				{
					var armLegSkinTF:Boolean = (pc.armType != GLOBAL.TYPE_MYR || (pc.legType != GLOBAL.TYPE_MYR && pc.legType != GLOBAL.TYPE_HUMAN) || pc.legCount != 2 || !pc.hasSkin());
					if(armLegSkinTF && rand(2) == 0)
					{
						//PC isn't a biped: 
						if(pc.legCount != 2 || (pc.legType != GLOBAL.TYPE_MYR && pc.legType != GLOBAL.TYPE_HUMAN))
						{
							if(pc.legTypeUnlocked(GLOBAL.TYPE_HUMAN))
							{
								output("\n\nYour [pc.legOrLegs] ");
								if(pc.legCount > 1) output("are");
								else output("is");
								output(" suddenly overcome by aching, and you’re overcome with the realization that myr don’t exactly have the same body shape you do. You whimper");
								if(pc.legCount != 2) output(" and kiss your [pc.legOrLegs] goodbye");
								output(", stumbling onto the ground as McAllister’s concoction works its genetic magic on you.");
								if(pc.isTaur() || pc.legCount > 3) output(" Your rear legs start to pull into your body, and your front legs begin to change shape, becoming more and more human-like. You bestial body slowly compresses, becoming as bipedal as the myr you seek to become.");
								else if(pc.isNaga()) output(" Your bestial lower body is wracked with a mix of pleasure and pain, and you watch with wide eyes as it splits apart, shedding its outer layers as it does so. Before long, you’ve got a pair of bare, bipedal legs!");
								output(" <b>You have terran-like legs now!</b>");
								pc.legType = GLOBAL.TYPE_HUMAN;
								pc.clearLegFlags();
								pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
								pc.legCount = 2;
								pc.genitalSpot = 0;
								changes++;
							}
							else output("\n\n" + pc.legTypeLockedMessage());
						}
						//Gain Chitin: 
						if(pc.armType != GLOBAL.TYPE_MYR || pc.legType != GLOBAL.TYPE_MYR)
						{
							var arms:Boolean = (pc.armType != GLOBAL.TYPE_MYR);
							var legs:Boolean = (pc.legType != GLOBAL.TYPE_MYR);
							if(legs && pc.legFlagsUnlocked(GLOBAL.FLAG_CHITINOUS))
							{
								output("\n\nYou grunt as an itching sensation begins to spread over your");
								if(arms)
								{
									output(" [pc.arms]");
									if(legs) output(" and ");
								}
								if(legs) output("[pc.legs]");
								var black:Boolean = (rand(2) == 0);
								output(". They’re giving way to a growing ");
								if(black) output("black");
								else output("red");
								output(" layer of hardened flesh - no, chitin! You watch with glee as <b>your");
								if(arms)
								{
									output(" arms");
									if(legs) output(" and ");
								}
								if(legs) output("legs");
								output(" cover themselves with plates of gold, insectile chitin</b>, just like a myr’s!");
								pc.armType = GLOBAL.TYPE_MYR;
								pc.legType = GLOBAL.TYPE_MYR;
								pc.legCount = 2;
								pc.genitalSpot = 0;
								pc.clearLegFlags();
								pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
								pc.addLegFlag(GLOBAL.FLAG_CHITINOUS);
								pc.clearArmFlags();
								pc.addArmFlag(GLOBAL.FLAG_CHITINOUS);
								if(pc.hasScales()) output(" <b>Your scales change color to match.</b>");
								pc.scaleColor = "gold";
								changes++;
							}
							else output("\n\n" + pc.legFlagsLockedMessage());
						}
						//Lose fur/scales/etc.
						if(!pc.hasSkin())
						{
							if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
							{
								output("\n\nAs you adjust your chitinous limbs, you’re also forced to watch your body-covering [pc.skinFurScalesNoun] shedding off, slowly wilting and then falling to the ground, revealing the [pc.skinTone] flesh beneath. <b>Most of your body is covered in bare skin now.</b>");
								pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
								pc.clearSkinFlags();
								changes++;
							}
							else output("\n\n" + pc.skinTypeLockedMessage());
						}
					}
				}
				//Black Hair/Red Hair
				if(!InCollection(pc.hairColor,"gold","black") && changes < changeLimit && rand(2) == 0)
				{
					if(rand(2) == 0)
					{
						if(pc.hairColorUnlocked("gold"))
						{
							output("\n\nYou feel a tingling in your scalp. Running a hand ");
							if(pc.hasHair()) output("through your [pc.hair], you realize it’s changed color - <b>you’re now sporting a head of brilliant gold hair!</b>");
							else output("across your head, you don’t feel any differences. A quick look in your Codex’s reflective backplate, though, shows that <b>your eyebrows and lashes have changed to a rich, dark gold - your hair color’s different!</b>");
							pc.hairColor = "gold";
							changes++;
						}
						else output("\n\n" + pc.hairColorLockedMessage());
					}
					else
					{
						if(pc.hairColorUnlocked("black"))
						{
							output("\n\nYou feel a tingling in your scalp. Running a hand ");
							if(pc.hasHair()) output("through your [pc.hair], you realize it’s changed color - <b>you’re now sporting a head of hair that’s black as night!</b>");
							else output("across your head, you don’t feel any differences. A quick look in your Codex’s reflective backplate, though, shows that <b>your eyebrows and lashes have changed to pitch black - your hair color’s different!</b>");
							pc.hairColor = "black";
							changes++;
						}
						else output("\n\n" + pc.hairColorLockedMessage());
					}
				}
				//Human Face
				if(changes < changeLimit && pc.faceType != GLOBAL.TYPE_HUMAN && rand(2) == 0)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
					{
						output("\n\nYou feel your [pc.face] start to strain, becoming ");
						if(pc.isGoo()) output("harder and firmer, taking on a more defined shape");
						else output("softer and more malleable");
						output(". You run a hand along your mutating features, and find that your face is taking on an altogether more human shape. You’re soon left with a solidifying visage: " + pc.mf("a manly jaw and sharp features,","a cute little nose and delicate features,") + " <b>an altogether human face</b>.");
						pc.faceType = GLOBAL.TYPE_HUMAN;
						pc.clearFaceFlags();
						changes++;
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
				}
				//Elfin Ears
				if(changes < changeLimit && pc.earType != GLOBAL.TYPE_SYLVAN && rand(2) == 0)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_SYLVAN))
					{
						output("\n\nYou feel a burning sensation in your [pc.ears], aching and straining and tearing. You clutch at your head, rubbing at your ears. The pill you swallowed works its scientific wonders, slowly starting to morph the shape of your ears. They become long and tapered, elfin in shape over the course of a few minutes.");
						pc.earType = GLOBAL.TYPE_SYLVAN;
						pc.clearEarFlags();
						pc.addEarFlag(GLOBAL.FLAG_TAPERED);
						pc.earLength = 4+rand(5);
						changes++;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
				}
				//+Dicksize (up to 2 ft.)
				if(pc.hasCock() && changes < changeLimit)
				{
					var x:int = pc.smallestCockIndex();
					//Gain 3-6 inches per use. 
					if(pc.cocks[x].cLength() < 18 && rand(2) == 0)
					{
						var newLength:int = pc.cocks[x].cLengthRaw + 3 + rand(4);
						if(pc.hasPerk("Hung")) newLength += 1 + rand(6);
						if(pc.cockLengthUnlocked(x, newLength))
						{
							output("\n\nYou feel a tightness swelling in your [pc.cock " + x + "], making your junk feel bloated and swollen. You reach down to grab your prick, and find that it feels <i>much</i> bigger than before. Stiffening under your ministrations, your dick stretches out to new lengths - a hefty ");
							pc.cocks[x].cLengthRaw = newLength;
							output(num2Text(Math.floor(pc.cocks[x].cLength())) + " inches long!");
							changes++;
						}
						else output("\n\n" + pc.cockLengthLockedMessage());
					}
				}
				//Lactation Typechange
				//Gain honey milk
				if(pc.hasVagina() && pc.milkType != GLOBAL.FLUID_TYPE_HONEY && changes < changeLimit && rand(2) == 0)
				{
					if(pc.milkTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY))
					{
						//If PC is already lactating:
						if(pc.canLactate())
						{
							output("\n\nYou feel a tightness in your [pc.chest], following by a squirt of [pc.milkNoun] that gushes out of your [pc.nipples]. Your eyes go wide, and your hands grab your tits as they discharge all over your ");
							if(!pc.isNude()) output("clothes");
							else output("nude body");
							output(". You blink, barely able to stay standing as waves of pleasure twist through your laden chest. As your burst of lactation winds down, though, you notice that what your tits are leaking isn’t [pc.milkNoun] anymore... it looks kinda like honey, now. <b>It looks like you’re lactating the honey-like nectar of a myr girl now!</b>");
						}
						//if PC isn't lactating
						else
						{
							output("\n\nYou feel a strange tightness in your chest - not painful, really, but a little alarming. After a few moments, your Codex alerts you that <b>were you to ever begin lactating in the future, you’d now produce a honey-like nectar of the same variety that myr do.</b>");
						}
						pc.milkType = GLOBAL.FLUID_TYPE_HONEY;
						changes++;
					}
					else output("\n\n" + pc.milkTypeLockedMessage());
				}
				//Breast Size Increase (Red: up to DD, Orange/Gold: up to GG
				if(pc.hasVagina() && changes < changeLimit)
				{
					var smallestBoobRow:int = 0;
					//find smallestIndex
					for(var b:int = 0; b < pc.bRows(); b++)
					{
						//See if testing row is smaller than smallest row
						if(pc.breastRows[smallestBoobRow].breastRating() > pc.breastRows[b].breastRating()) smallestBoobRow = b;
					}
					//Check if in size
					if(pc.breastRows[smallestBoobRow].breastRating() < 18 && rand(2) == 0)
					{
						if(pc.breastRatingUnlocked(smallestBoobRow, pc.breastRows[smallestBoobRow].breastRatingRaw + 1))
						{
							output("\n\nYou feel a slight pressure building in your [pc.chest], and a stretching in your skin. Pleasure, not pain, hits you like a brick wall, and you find yourself grabbing your chest and caressing your tits as they grow in your hands. A moan escapes your lips as your body trembles with pleasure, almost orgasming from the sensation of growing titflesh.");
							pc.breastRows[smallestBoobRow].breastRatingRaw++;
							if(rand(2) == 0) pc.breastRows[smallestBoobRow].breastRatingRaw++;
							//Bump up all smaller rows
							for(b = 0; b < pc.bRows(); b++)
							{
								//Grow other too-small rows.
								if(pc.breastRows[b].breastRating() < 18 && b != smallestBoobRow) pc.breastRows[b].breastRatingRaw++;
							}
							output("\n\nBy the time the growth begins to abate, you’re sure <b>you’re up to " + pc.breastCup(smallestBoobRow) + "s by now!</b>");
							changes++;
							pc.changeLust(20+rand(10));
						}
						else output("\n\n" + pc.breastRatingLockedMessage());
					}
				}
				//END OF SUPER COMMON SHIT!

				//Black, Insectile Eyes
				if(changes < changeLimit && pc.eyeType != GLOBAL.TYPE_MYR && rand(4) == 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_MYR))
					{
						output("\n\nYour eyes feel strange after a few moments, and your vision starts to swim. You clutch at them and find them... different... as you run your fingers near them. Larger, fuller... darker. Your vision completely blanks, leaving you momentarily blinded. When your vision returns, you feel like everything looks a little fuzzy, especially at long ranges. A quick glance at your Codex’s reflective back shows you that <b>your eyes are now black and featureless like a myr’s!</b>");
						pc.eyeType = GLOBAL.TYPE_MYR;
						pc.eyeColor = "black";
						changes++;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
				}
				//Insect Feelers
				//Gain slight vulnerability to Lust (Tease) & Lust (Chemical) damage
				if(!pc.hasAntennae(GLOBAL.TYPE_MYR) && changes < changeLimit && rand(4) == 0)
				{
					if(pc.antennaeUnlocked(2))
					{
						output("\n\nYou feel a pressure welling up on your brow, concentrating in two places just over your eyes. You run your fingers across your forehead, just in time to feel a pair of nubs poking up out of your [pc.skinFurScales]. The budding nubs quickly coalesce into <b>a pair of long, fleshy feelers</b> - feelers that prove to be exceptionally sensitive as you run your fingers along them, and find yourself shivering in pleasure.");
						pc.antennae = 2;
						pc.antennaeType = GLOBAL.TYPE_MYR;
						changes++;
					}
					else output("\n\n" + pc.antennaeLockedMessage());
				}
				//Honey Jizz
				if(changes < changeLimit && pc.cumType != GLOBAL.FLUID_TYPE_HONEY && pc.hasCock() && rand(3) == 0)
				{
					if(pc.cumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY))
					{
						output("\n\nA sudden tightness clenches in your [pc.balls], making your [pc.cocks] jump to attention. You grimace as the sensation intensifies, making you nearly double over as the myr pill’s changes wrack your body, altering the very fabric of your being");
						if(pc.balls > 0) output(", radiating out from your [pc.balls] to your manhood");
						output(". You grab ");
						if(pc.cockTotal() > 1) output("one of your rods");
						else output("your [pc.cock]");
						output(", instinctively stroking the rapidly hardening shaft as you feel... something... coming. Your breath quickens, turgid shaft quaking with effort as you pump your prick, working up what must be a load of cum, but immeasurably thicker than your previous spunk.");
						changes++;
						pc.orgasm();
						
						output("\n\nWith a cry of pleasure, your [pc.hips] buck into your hand, ramming out a thick streak of amber spooge that spatters across your thighs and crotch, glazing your groin in a creamy yellow. Your back arches instinctively, thrusting your crotch out as you continue to fap and cum, spraying yourself in sweet cock-nectar for what seems like an eternity, until all that pressure in your ");
						if(pc.balls > 0) output("[pc.balls]");
						else output("body");
						output(" finally fades away.\n\n<b>It looks like you’ll be cumming honey from here on out.</b>");
						pc.cumType = GLOBAL.FLUID_TYPE_HONEY;
						changes++;
					}
					else output("\n\n" + pc.cumTypeLockedMessage());
				}
				//Honey Girlspunk
				if(pc.hasVagina() && changes < changeLimit && pc.girlCumType != GLOBAL.FLUID_TYPE_HONEY && pc.hasVagina() && rand(3) == 0)
				{
					if(pc.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY))
					{
						output("\n\nA heat begins to radiate from your loins. Eager to grant yourself some release, you let your fingers wander, fondling your labia and caressing your [pc.clits] and rubbing your insides with mounting desire. The heat fades away but your lust remains, so you continue with your play.");
						if(pc.wettestVaginalWetness() <= 2) output("\n\nWhen your fluids begin to flow");
						else output("\n\nWhen your always flowing fluids are dripping");
						output(", your nostrils are greeted by a sweet scent. And your fingers can feel a sticky thick sap ");
						if(pc.wettestVaginalWetness() <= 2) output("dripping");
						else output("gushing");
						output(" from your [pc.vaginas]. <b>Looks like ");
						if(pc.totalVaginas() > 1)
						{
							output("your vaginas are secreting honey from now on.");
						}
						else output("you’ve got a literal honeypot now!");
						output("</b>");
						pc.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
						pc.changeLust(Math.round(pc.lustMax()/2));
						changes++;
					}
					else output("\n\n" + pc.girlCumTypeLockedMessage());
				}
				//Grow wings once! Requires legs!
				if(changes < changeLimit && pc.hasCock() && pc.legType == GLOBAL.TYPE_MYR && (pc.wingType != GLOBAL.TYPE_SMALLBEE && pc.wingType != GLOBAL.TYPE_MYR) && pc.wingTypeUnlocked(GLOBAL.TYPE_MYR) && rand(4) == 0) {
					if(!pc.hasWings()) {
						output("\n\nCramps attack your shoulder blades, forcing you to arch your back and cry out. You drop and roll on the ground to try and keep it together, and before you know, the pain is gone. In its place, there’s the pleasant ache of growing muscles and something sliding down your back. You crane your head over your shoulder");
						if(pc.armor.shortName != "") output(" and pull back your [pc.armor.longName]");
						output(" to take a look; <b>there are small, transparent wings pressed against your back</b>. They’re too small to allow you to fly, but you’re definitely getting more myr-like.");
						pc.shiftWings(GLOBAL.TYPE_MYR, 2);
					}
					//TF other wings!
					else {
						output("\n\nA cramp ruffles your [pc.wings], making them flutter wildly as they contort and twist. You can feel them changing as they flail around, thinning, shrinking, and warping with each gasp of air you drag into your lungs. A few seconds later, your body calms, and you’re able to look behind you. <b>You’ve grown small, transparent, myr-like wings!</b>");
						pc.wingType = GLOBAL.TYPE_MYR;
						if(pc.wingCount < 2) pc.wingCount = 2;
					}
					changes++;
				}
				else if (!pc.wingTypeUnlocked(GLOBAL.TYPE_MYR))
				{
					output("\n\n" + pc.wingTypeLockedMessage());
				}
				//+Thin
				//Slight reduction to thickness. 
				if(pc.thickness > 15 && changes < changeLimit && rand(3) == 0)
				{
					output("\n\nAs the pill works its magic, you find yourself feeling a little slimmer. Your [pc.belly] seems a little flatter and firmer, and you feel lighter overall. You guess you’ve gotten thinner!");
					pc.thickness-=(5+rand(5));
					changes++;
				}
				//+Femininity (if PC has cunt)
				if(pc.femininity < 85 && pc.hasVagina() && changes < changeLimit && rand(3) == 0)
				{
					output("\n\nAs the ant pill works its magic, you find that your cheeks feel softer, your chin gentler... you’ve got an overall more feminine profile, completely with longer lashes and poutier lips. Definitely cuter now!");
					pc.femininity += 5 + rand(3);
					changes++;
				}
				//RARE!
				//Lactation start
				//PC must have C+ cups
				if(changes < changeLimit && pc.hasVagina() && pc.biggestTitSize() >= 3 && !pc.canLactate() && rand(5) == 0)
				{
					output("\n\nYou feel a pressure welling up in your [pc.fullChest], like your tits are swelling up");
					if(pc.isChestGarbed()) output(" under your [pc.upperGarment]");
					output(". You don’t think too much of it... until you feel an unnatural wetness on your [pc.nipples]. You reach down and grab one of your tits, and the moment you squeeze it, you feel a shock of pleasure rip through you and liquid squirts out of your tit in a thin trickle. With a blink, you realize <b>you’re lactating!</b>");
					changes++;
					pc.milkMultiplier = 60;
				}
				//Libido Increase
				//Max 60. Gain +30 Lust
				if(changes < changeLimit && pc.libido() < 60 && rand(3) == 0)
				{
					output("\n\nYou’re definitely starting to feel a little hornier now, with the familiar heat of arousal coursing through you. Man, what you wouldn’t give for a cute little myr girl between your legs about now...");
					pc.slowStatGain("libido",5);
					pc.changeLust(30);
					changes++;
				}
				//Honeypot Perk (Convert Thickness to Boob Size)
				if(pc.hasVagina() && changes < changeLimit && rand(5) == 0 && pc.biggestTitSize() >= 5 && !pc.hasPerk("Honeypot") && pc.canLactate())
				{
					var boobDiff:Number = 0;
					//if PC has high thickness:
					if(pc.thickness >= 50)
					{
						output("\n\nYour entire body starts to tingle, an odd feeling just under the [pc.skin] that has you itching and scratching at yourself. Your arms, belly, and [pc.legOrLegs] all feel particularly strange... and oddly light. You watch as your body seems to tighten, losing its thickness. At the same time, your [pc.chest] tightens and stretches, seeming to gain every bit of thickness the rest of your body is losing.");
						output("\n\nAs pleasure overwhelms every other feeling, you recall the reason why gold myr are called honeypots so much: the more they eat, the bigger their tits and abdomens get, swelling with honey instead of fat. The way your body’s reacting now, <b>you think that you have the honeypot gene now!</b> Instead of gaining thickness, you’ll just become more and more curvaceous.");
						//Drop thickness to 20 and put remainder into boobs!
						boobDiff = pc.thickness - 20;
						boobDiff /= 10;
						pc.thickness = 20;
					}
					//if PC has low thickness:
					else
					{
						output("\n\nYou feel a little tingly all over, and your [pc.chest] starts to feel warm and tight. Looking yourself over, you could swear you look thinner... and that your tits look a little bigger. You run a hand over your chest, and feel a shiver of pleasure as you cup your breast. After a moment, you’re sure: <b>your tits are definitely bigger now, full of [pc.milkNoun]</b>. If only a little.");
						output("\n\nAs pleasure overwhelms every other feeling, you recall the reason why gold myr are called honeypots so much: the more they eat, the bigger their tits and abdomens get, swelling with honey instead of fat. The way your body’s reacting now, <b>you think that you have the honeypot gene now!</b> Instead of gaining thickness, you’ll just become more and more curvaceous.");
						boobDiff = 1;
						pc.thickness -= 10;
						if(pc.thickness < 1) pc.thickness = 1;
					}
					//Bump up boob sizes
					for(var bb:int = 0; bb < pc.bRows(); bb++)
					{
						pc.breastRows[bb].breastRatingHoneypotMod += boobDiff;
					}
					if(pc.milkFullness < 100) pc.milkFullness = 100;
					pc.createPerk("Honeypot",0,0,0,0,"Allows your body to convert excess thickness into delicious, boob-filling goodness.");
					// Perk Swapped!
					if(pc.hasPerk("Myr Venom"))
					{
						output("\n\nWith your new genes attained, your jaw begins to shiver all over and you feel your canines tingle. You rub your [pc.tongueNoun] along the roof of your mouth and across the back of your front teeth. As you do this, a pool of pink myr venom rapidly collects and a stream of the stuff dribbles down your [pc.lip]. Surprised, you reflexively swallow it before any more can come out. You almost instantly regret the action as an overwhelming feeling of desire and anticipation skyrockets in your [pc.groin], giving way to the lust-laden effects of the venom!");
						output("\n\nComposing yourself, you expect the venom to replenish itself after discharging so much at once, but instead it’s just regular, watery spit. After noticing the change in your saliva, you double check your Codex and confirm that <b>you have lost your lust-inducing venom from your previous transformation</b>. It seems the ability is not compatible with this drug...");
						// Lusty!
						pc.maxOutLust();
						// Remove perk!
						pc.removePerk("Myr Venom");
					}
					changes++;
				}
				// Alternately remove My Venom
				if(changes < changeLimit && pc.hasPerk("Myr Venom") && rand(4) == 0)
				{
					output("\n\nSuddenly, your jaw begins to shiver all over and you feel your canines tingle. You rub your [pc.tongueNoun] along the roof of your mouth and across the back of your front teeth. As you do this, a pool of pink myr venom rapidly collects and a stream of the stuff dribbles down your [pc.lip]. Surprised, you reflexively swallow it before any more can come out. You almost instantly regret the action as an overwhelming feeling of desire and anticipation skyrockets in your [pc.groin], giving way to the lust-laden effects of the venom!");
					output("\n\nComposing yourself, you expect the venom to replenish itself after discharging so much at once, but instead it’s just regular, watery spit. After noticing the change in your saliva, you double check your Codex and confirm that <b>you have lost your lust-inducing venom from your previous transformation</b>. It seems the ability is not compatible with this drug...");
					// Lusty!
					pc.maxOutLust();
					// Remove perk!
					pc.removePerk("Myr Venom");
					changes++;
				}
				//Ant Abdomen
				if((pc.tailCount == 0 || pc.tailType != GLOBAL.TYPE_MYR) && changes < changeLimit && rand(3) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_MYR) && pc.tailType != GLOBAL.TYPE_MYR)
					{
						if(pc.tailCountUnlocked(1))
						{
							if(pc.tailCount == 0) 
							{
								output("\n\nSomething feels... strange in your backside, like your spine is trying to curl up out of your back and out of your body. Pain hits you, making you stagger down onto the ground as something sprouts from your back. You reach back, feeling your body up... and realize that something bulbous and plated is growing from you. Minutes pass in a mix of agony and alien pleasure before your transformation seems to have completed, and <b>you’re left with a thick, insectile abdomen growing from your back</b>.");
							}
							else
							{
								output("\n\nSomething feels... strange in your [pc.tails], like ");
								if(pc.tailCount == 1) output("it’s trying to curl up into itself.");
								else output("they’re trying to curl into one another.");
								output(" Pain hits you, making you stagger down onto the ground as ");
								if(pc.tailCount == 1) output("your [pc.tail] becomes something else");
								else output("your [pc.tails] become something else");
								output(". You reach back, feeling your body up... and realize that something bulbous and plated is growing from you. Minutes pass in a mix of agony and alien pleasure before your transformation seems to have completed, and <b>you’re left with a thick, insectile abdomen growing from your back</b>.");
							}
							pc.tailCount = 1;
							pc.clearTailFlags();
							pc.addTailFlag(GLOBAL.FLAG_CHITINOUS);
							pc.addTailFlag(GLOBAL.FLAG_SMOOTH);
							pc.tailType = GLOBAL.TYPE_MYR;
							changes++;
						}
						else output("\n\n" + pc.tailCountLockedMessage());
					}
					else output("\n\n" + pc.tailTypeLockedMessage());
				}
				//Second Breast Row
				//If PC has only 1 row of tits. 
				if(pc.hasVagina() && changes < changeLimit && rand(5) == 0 && pc.bRows() == 1 && pc.biggestTitSize() >= 4 && pc.isPregnant())
				{
					if(pc.createBreastRowUnlocked(2))
					{
						output("\n\nYou feel something poking out of your [pc.skin], just below your [pc.chest]. With a discomforted grunt, you slip a hand ");
						if(pc.isChestGarbed()) output("under your clothes");
						else output("to your chest");
						output(" and run your fingers across your [pc.skinFurScales]. You quickly find a pair of small spots, little more than nubs of flesh, growing out of you, getting thicker and larger. The skin around them starts to bud up, forming into a pair of small, and <i>very</i> sensitive little mounds. You blink in surprise, ogling your body as you realize that <b>you’ve grown a second pair of breasts</b>!");
						changes++;
						pc.createBreastRow();
						pc.breastRows[1].breastRatingRaw = 1;
					}
					else output("\n\n" + pc.createBreastRowsLockedMessage());
				}
				if(changes == 0)
				{
					output("\n\nNothing happens. Fucking duds.");
				}
				return false;
			}
			else {
				output(target.capitalA + target.short + " eats the gold pill to no effect.");
			}
			return false;
		}
	}
}

