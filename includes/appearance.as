import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.StorageClass;
import classes.GameData.Pregnancy.PregnancyManager;
import classes.Items.Piercings.LundsRings;
public function pcAppearance(e:MouseEvent = null):void 
{
	if (pc.short.length == 0) return;
	
	var pButton:SquareButton = (userInterface as GUI).appearanceButton;
	
	if (pButton.isActive && !pButton.isHighlighted)
	{
		userInterface.showSecondaryOutput();
		userInterface.appearanceButton.Glow();
		appearance(pc);
		userInterface.showingPCAppearance = true;
		userInterface.DeGlowButtons();
		pButton.Highlight();
	}
	else if (pButton.isActive && pButton.isHighlighted)
	{
		clearBust();
		backToPrimaryOutput();
		userInterface.showingPCAppearance = false;
	}
}

public function backToAppearance(forTarget:Creature):void
{
	showLocationName();
	appearance(forTarget);
}

public function appearance(forTarget:Creature):void
{
	setTarget(forTarget);

	clearOutput2();
	showLocationName();
	showName("\nAPPEARANCE");
	author("");
	clearGhostMenu();
	if(debug) addGhostButton(13, ("Debug: " + (debug ? "ON" : "OFF")), Cheats.toggleDebug, undefined, "Toggle Debug", "Turn debug mode off.");
	
	var rando:int = 0;
	var feedVal:int;
	
	// For the PC
	if(target != pc) return;
	
	showPCBust();
	addGhostButton(14, "Back", pcAppearance);
	
	//Creation stuff
	if(target.hasStatusEffect("In Creation"))
	{
		output2("You are currently creating yourself!");
		output2("\n\n<i>(Detailed information about your appearance will be displayed here.)</i>");
		return;
	}
	
	//Stinging Bruises & Lash Marks
	if (target.hasStatusEffect("Stinging Bruises")) target.HP(target.statusEffectv1("Stinging Bruises"));
	if (target.hasStatusEffect("Lash Marks")) target.HP(target.statusEffectv1("Lash Marks"));
	processTime(0);
	
	//Overall
	if(target.originalRace == target.race()) output2("You are " + indefiniteArticle(target.originalRace) + ".");
	else
	{
		output2("You started your journey as " + indefiniteArticle(target.originalRace) + ", but you’ve become "+indefiniteArticle(target.race())+" over the course of your adventures.");
	}
	output2(" You’re a good " + Math.floor(target.tallness / 12) + " feet");
	if(target.tallness % 12 != 0) output2(" and " + Math.round(target.tallness % 12) + " inches");
	output2(" tall by ancient imperial measurements and " + Math.round(target.tallness * 0.0254 * 100)/100 + " meters in the more accepted metric system.");
	
	var isNude:Boolean = (target.isNude());
	var showTits:Boolean = (target.isChestVisible() && target.hasBreasts());
	var showCrotch:Boolean = (target.isCrotchVisible());
	var showAss:Boolean = (target.isAssVisible());
	var allExposed:Boolean = (target.isChestExposed() && target.isCrotchExposed() && target.isAssExposed());
	output2(" Right now, you’re");
	if(isNude || target.armor is EmptySlot) output2(" not wearing a single scrap of armor,");
	else output2(" wearing " + target.armor.description + ",");
	if(isNude || target.lowerUndergarment is EmptySlot) output2(" going commando down south,");
	else output2(" using " + target.lowerUndergarment.description + " for underwear,");
	if(isNude || target.upperUndergarment is EmptySlot) output2(" and letting your torso breathe, unrestricted by any undertop.");
	else output2(" and girding your upper body with " + target.upperUndergarment.description + ".");
	if(!isNude && (showTits || showCrotch || showAss))
	{
		output2(" Your outfit leaves little to the imagination, " + (!allExposed ? "revealing" : "exposing") + " your");
		if(showTits)
		{
			output2(" breasts");
			if(showCrotch && showAss) output2(",");
			else if(target.isCrotchVisible() || showAss) output2(" and");
		}
		if(showCrotch)
		{
			output2(" crotch");
			if(target.isAssVisible()) output2(" and");
		}
		if(showAss) output2(" ass");
		output2(" to the world.");
	}
	if(target.isCoveredUp())
	{
		output2(" Though to play it safe - at least in public - you have managed to cover yourself up");
		if(target.accessory.hasFlag(GLOBAL.ITEM_FLAG_COVER_BODY)) output2(" with " + target.accessory.description);
		output2(".");
		allExposed = false;
	}
	if(allExposed && !target.canUseTailsOrFurAsClothes())
	{
		var exhibitionism:Number = target.exhibitionism();
		if(exhibitionism >= 100) output2(" You’re a shameless exhibitionist and proud of it, flaunting your naked body and giving the entire galaxy quite an eyeful!");
		else if(exhibitionism >= 66) output2(" Your naked body is like a second outfit for you, giving you naughty thoughts when in the public’s gaze.");
		else if(exhibitionism >= 50) output2(" Maybe you’re some kind of nudist, but it’s not like you mind being naked anyway.");
		else if(exhibitionism >= 33) output2(" It’s okay to show some nudity once in a while, right?");
		else if(exhibitionism >= 20) output2(" If anyone sees you this way, you can’t help but be aroused a little.");
		else if(exhibitionism >= 10) output2(" If anyone sees you now, they’re sure to think you’re a nudist...");
		else output2(" If anyone sees you now, they’re sure to think you’re a nudist!");
	}
	
	// Goo Armor Bonus text
	if(target.armor is GooArmor) output2("\n\n" + gooArmorDetails());

	//Face
	output2("\n\n");
	var faceFurScales:String = target.skinFurScales(true,true,false,true);
	if(target.hasFaceFlag(GLOBAL.FLAG_FURRED)) faceFurScales = target.furColor + " fur";
	else if(target.hasFaceFlag(GLOBAL.FLAG_SCALED)) faceFurScales = target.scaleColor + " scales";
	else if(target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) faceFurScales = target.furColor + " feathers";
	else if(target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) faceFurScales = target.scaleColor + " chitin";
	
	switch(target.faceType)
	{
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_HUMAN:
		case GLOBAL.TYPE_NALEEN_FACE:
		case GLOBAL.TYPE_SIREN:
		case GLOBAL.TYPE_SIMII:
			if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || target.faceType == GLOBAL.TYPE_NALEEN_FACE || InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX)) output2("Your face is human in shape and structure, with " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("Under your " + faceFurScales + " you have a human-shaped head with " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your face is fairly human in shape, but is covered in " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2("Your face is human-shaped with " + target.skin(true,true,true) + " and lightly framed with " + faceFurScales + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) output2("Your face is mostly human in shape, decorated with " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_BARK) output2("Your face is mostly human in shape, with hints of " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			// Special addons
			if(target.faceType == GLOBAL.TYPE_SIREN) output2(" A set of razor-sharp, retractable shark-teeth fill your mouth and gives your visage a slightly angular appearance.");
			else if(target.faceType == GLOBAL.TYPE_NALEEN_FACE) output2(" A set of retractable, needle-like fangs sit in place of your canines, just like a naleen.");
			else if(target.faceType == GLOBAL.TYPE_ARACHNID) output2(" A set of spider-like fangs protrude over your bottom lip.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(!target.hasMuzzle())
			{
				if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX)) output2("Your face is human in shape and structure, with " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("Under your " + faceFurScales + " you have a human-shaped head with " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your face is fairly human in shape, but is covered in " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2("Your face is human-shaped with " + target.skin(true,true,true) + " and lightly framed with " + faceFurScales + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) output2("Your face is mostly human in shape, decorated with " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_BARK) output2("Your face is mostly human in shape, with hints of " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				output2(" The constant twitches of your nose and the length of your incisors gives your visage a hint of bunny-like cuteness.");
			}
			else
			{
				output2("You have a short-muzzled face");
				if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" covered in " + faceFurScales + ".");
				else if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FEATHERS, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_BARK) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) output2(" framed with " + faceFurScales + ".");
				else if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX)) output2(" with " + target.skin(true,true,true) + ".");
				else output2(".");
				output2(" The constant twitches of your nose and the length of your incisors gives your visage an obvious bunny-like cuteness.");
			}
			break;
		case GLOBAL.TYPE_HUMANMASKED:
			//appearance for skinheads
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinType != GLOBAL.SKIN_TYPE_SCALES && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_SCALED)) {
				output2("Your face is human in shape and structure, with " + target.skin(true,true,true));
				if(InCollection(target.skinTone, "black", "ebony", "sable") && InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO)) output2(", though with your dusky hue, the black kui-tan mask you sport isn’t properly visible.");
				else output2(", though it is decorated with a sly-looking kui-tan mask over your eyes.");
			}
			//appearance furscales
			else {
				var furScaleColor:String = "";
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) furScaleColor = target.furColor;
				else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) furScaleColor = target.scaleColor;
				//(black/midnight furscales)
				if(InCollection(furScaleColor, "black", "midnight")) output2("Under your " + faceFurScales + " hides a black kui-tan mask, barely visible due to your inky hue, and");
				else 
				{
					if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" Your " + faceFurScales + " are decorated with a sly-looking kui-tan mask, and under them");
					else output2(" Your " + faceFurScales + " is decorated with a sly-looking kui-tan mask, and under it");
				}
			}
			break;
		case GLOBAL.TYPE_KUITAN:
			output2("You have a triangular kui-tan face, replete with sensitive whiskers and a little black nose; a mask shades the space around your eyes, set apart from your " + faceFurScales + " by a band of white.");
			//(if skin)
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2(" It looks a bit strange with only the skin and no fur.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" The presence of said scales gives your visage an eerie look, more reptile than mammal.");
			break;
		case GLOBAL.TYPE_SHEEP:
			output2("You have a short, " + target.mf("blunt","cute") + " muzzle much like a sheep’s.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + faceFurScales + " decorates it.");
			break;
		case GLOBAL.TYPE_VULPINE:
			output2("You have a tapered, shrewd-looking vulpine face with a speckling of downward-curved whiskers just behind the nose.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2(" Oddly enough, there’s no fur on your animalistic muzzle, just " + faceFurScales + "."); 
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + faceFurScales + " decorates your muzzle.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" Strangely, " + faceFurScales + " adorn every inch of your animalistic visage.");
			break;
		case GLOBAL.TYPE_MOUSEMAN:
			output2("Your face is generally human in shape and structure, with " + target.skin(true,true,true));
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2(" under your " + faceFurScales);
			output2(" and mousey buckteeth.");
			break;
		case GLOBAL.TYPE_MOUSE:
			output2("You have a snubby, tapered mouse’s face, with whiskers, a little pink nose, and ");
			if(!InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS) && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_SCALED) && !target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2(target.skin(true,true,true));
			else output2(target.skin(true,true,true) + " under your " + faceFurScales);
			output2(". Two large incisors complete it.");
			break;
		//Naga (same as snake)
		case GLOBAL.TYPE_SNAKE:
			output2("You have a face that resembles a combination between a human’s and a snake’s,");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2(" covered in a layer of " + faceFurScales + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" covered in " + faceFurScales + ", as one would expect of such a reptilian visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2(" framed with a border of " + faceFurScales + ", looking very much like a mythical feathered serpent.");
			else output2(" oddly uncovered by scales. Instead, your snake-like snout is covered in " + target.skin(true,true,true) + ".");
			if(rand(2) == 0) output2(" A set of retractable, needle-like fangs sit in place of your canines and are ready to dispense their venom.");
			else output2(" In addition, a pair of poisonous fangs protrude from your mouth over your lower lip.");
			break;
		//horse-face
		case GLOBAL.TYPE_EQUINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("Your face is almost entirely equine in appearance, even having " + faceFurScales + ". Underneath the fur, you believe you have " + target.skin(true,false,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("You have the face and head structure of a horse, overlaid with " + faceFurScales + ".");
			else output2("Your face is equine in shape and structure. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//dog-face
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a dog’s face, complete with wet nose and panting tongue. You’ve got " + faceFurScales + ", hiding your " + target.skin(true,true,true) + " underneath your furry visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("You have the facial structure of a dog, wet nose and all, but overlaid with " + faceFurScales + ".");
			else output2("You have a dog-like face, complete with a wet nose. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//wolf-face
		case GLOBAL.TYPE_LUPINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a wolf’s face, wide and majestic, with jaws filled with sharp teeth. You’ve got " + faceFurScales + ", hiding your " + target.skin(true,true,true) + " underneath your furry visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("You have the facial structure of a wolf, wide and majestic, but overlaid with " + faceFurScales + ", and having jaws filled with sharp teeth.");
			else output2("You have a wolf-like face, wide and majestic, with jaws filled with sharp teeth. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//Knock-off dog-face
		case GLOBAL.TYPE_WORG:
			//Fur/Feather:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) 
			{
				output2("You have the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from your lips. You’ve got " + faceFurScales + ", hiding your " + target.skin(true,true,true) + " underneath your ");
				if(target.hasFur() || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("furry");
				else output2("feathered");
				output2(" visage.");
			}
			//Scales:
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED))
			{
				output2("You have the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from your lips. Its overlaid with " + faceFurScales + ".");
			}
			//Others:
			else output2("You have the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from your lips. The odd visage is hairless and covered with " + target.skinFurScales(true,true,true,true) + ".");
			break;
		//cat-face
		case GLOBAL.TYPE_FELINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a cat-like face, complete with a moist nose and whiskers. Your " + faceFurScales + " hides " + target.skin(true,true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your facial structure blends humanoid features with those of a cat. A moist nose and whiskers are included, but overlaid with " + faceFurScales + ".");
			else output2("You have a cat-like face, complete with a cute, moist nose and whiskers. The " + target.skin(true,true,true) + " that is revealed by your lack of fur looks quite unusual on so feline a face.");
			break;
		//bird-face
		case GLOBAL.TYPE_AVIAN:
			if(target.hasBeak()) output2("You have a bird-like face, complete with " + indefiniteArticle(target.lipColor) + " beak");
			else output2("Your facial structure blends humanoid features with those of a bird, but lacking the signature beak");
			if(target.hasMuzzle()) {
				if(target.hasBeak()) output2(" - rather it looks like a beak, but is more like a muzzle in structure, retaining lips and teeth instead of sharp beak edges. But they are almost impossible to spot without closer inspection");
				else output2(". Instead you have a toothy reptilian muzzle, making your visage rather unsettling");
			}
			output2(".");
			if(target.hasFeathers() || target.hasScales() || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED))
			{
				output2(" It is adorned with " + faceFurScales);
				if(target.hasMuzzle() && !target.hasBeak()) output2(", completing the image");
				output2(".");
			}
			else output2(" The lack of feathers on your " + target.skinNoun() + " look rather strange.");
			if(target.hasBeak() && !target.hasFeathers() && !target.hasFur() && target.isBald()) output2(" You somewhat resemble a vulture.");
			break;
		//Minotaaaauuuur-face
		case GLOBAL.TYPE_BOVINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. Your " + faceFurScales + " thickens noticably on your head, looking shaggy and more than a little monstrous once laid over your visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your face resembles an anthropomorphic bovine’s, though strangely, it is covered in shimmering scales, right up to the flat, cow-like nose that protrudes from your face.");
			else {
				output2("You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose.");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO && !target.hasFaceFlag(GLOBAL.FLAG_GOOEY)) output2(" Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
			}
			break;
		//Panda-face
		case GLOBAL.TYPE_PANDA:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. Your " + faceFurScales + " hides " + target.skin(true,true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your face resembles an anthropomorphic panda’s, though strangely, it is covered in shimmering scales, right up to your black nose.");
			else {
				output2("You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose.");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO && !target.hasFaceFlag(GLOBAL.FLAG_GOOEY)) output2(" Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
			}
			break;
		case GLOBAL.TYPE_REDPANDA:
			output2(RandomInCollection([
				"You have a short, cute muzzle much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s. A coat of patterned " + target.furColor + " fur decorates your visage.",
				"Your face sports a blunt muzzle, much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s. A coat of patterned " + target.furColor + " fur decorates your visage.",
				"Your face has distinct markings and patterns along your " + target.furColor + ", short muzzle, much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s."
			]));
			break;
		//Lizard-face
		case GLOBAL.TYPE_LIZAN:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("You have a face resembling that of a lizard. Between the toothy maw, pointed snout, and the layer of " + faceFurScales + " covering your face, you have quite the fearsome visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your face is that of a lizard, complete with a toothy maw and pointed snout. " + StringUtil.upperCase(faceFurScales) + " complete the look, making you look quite fearsome.");
			else output2("You have a face resembling that of a lizard, and with your toothy maw, you have quite a fearsome visage. The reptilian visage does look a little odd with just " + target.skin(true,true,true) + " and not a single scale.");
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("Your head pushes out into a muzzle with white fur across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid badger. The rest of it is wrapped in " + faceFurScales + " that covers your " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2("Your head pushes out into a muzzle with white scales across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid, scaled badger. The rest of it is wrapped in " + faceFurScales + " that covers your " + target.skin(true,true,true) + ".");
			else output2("Your head pushes out into a curiously hairless badger-face, covered only with " + target.skin(true,true,true) + ".");
			break;
		case GLOBAL.TYPE_DRACONIC:
			output2("Your face is a narrow, reptilian muzzle. It looks like a predatory lizard’s at first glance, but with an unusual array of spikes along the under-jaw. It gives you a regal but fierce visage. Opening your mouth reveals several rows of dagger-like sharp teeth. The fearsome visage is decorated by " + faceFurScales + ".");
			break;
		case GLOBAL.TYPE_KANGAROO:
			output2("Your face is shaped like that of a kangaroo ");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) output2("but bald, not covered in fur");
			else output2("and covered with " + faceFurScales);
			output2(". It’s almost rabbit-like, except for the length of your muzzle.");
			break;
		case GLOBAL.TYPE_GABILANI:
			output2("You have a narrow-jawed gabilani face");
			if(target.skinType != GLOBAL.SKIN_TYPE_SKIN) output2(", covered in " + faceFurScales);
			else output2(", covered with " + faceFurScales);
			output2(", appearing almost goblinoid with alien facial features.");
			break;
		case GLOBAL.TYPE_FROG:
			output2("Your face is anuran in shape, reflecting the frog-like transformations you’ve undergone. The smooth visage is further exaggerated with a notable lack of a nose, having broadly spaced nostrils instead.");
			if((target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) && !target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) output2(" Your face is covered in " + target.skin(true,true,true) + ".");
			else output2(" Strangely enough, your face is also covered with " + faceFurScales + ".");
			break;
		case GLOBAL.TYPE_SHARK:
			output2("Your face is shark-like in shape, with a snout and an upper jaw that pushes past your lower one, and at the very tip, there are two nasal holes.");
			if((target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) && target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) output2(" The glistening surface is slick to the touch, as if you just lubed up not too long ago.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) output2(" The surface is covered in fine scales.");
			else if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2(" The surface is covered with " + faceFurScales + " , making you look like a rather odd hybrid.");
			else if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_BARK) || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) output2(" Hard" + faceFurScales + " covers the surface, " + (silly ? "making you look like Boaty McBoatface" : "giving you a tough, hydrodynamic look") + ".");
			else output2(" Even without scales, the surface is smooth and hairless, perfect for underwater exploration.");
			output2(" A set of razor-sharp, retractable shark-teeth fill your mouth and gives your visage a slightly menacing appearance.");
			break;
		case GLOBAL.TYPE_SWINE:
			output2("Your face is mostly human in shape and structure, with " + target.skin(true,true,true));
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) output2(" under your " + faceFurScales);
			output2(" but it’s adorned with a flat, pig-like nose.");
			break;
		case GLOBAL.TYPE_GOAT:
			output2("Your face is elongated forward and much like a goat’s in shape and structure.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			output2("Your moth-like face is covered in " + faceFurScales + " and has a sculpted look.");
			break;
	}
	if(target.hasStatusEffect("Mimbrane Face"))
	{
		if(target.statusEffectv3("Mimbrane Face") >= 3 && target.statusEffectv3("Mimbrane Face") < 8) output2(" Your lips appear slightly puffy.");
		else if(target.statusEffectv3("Mimbrane Face") >= 8 && target.statusEffectv3("Mimbrane Face") < 13) output2(" Your lips look deliciously pillowy.");
		else if(target.statusEffectv3("Mimbrane Face") >= 13) output2(" Your lips appear lusciously large and undeniably kissable.");
	}
	// Special face additions
	if(target.hasStatusEffect("Naoki Stripe") && target.skinTone != "purple") output2(" A distinctive purple stripe runs across the bridge of your nose.");
	// Freckles
	if(target.hasFaceFlag(GLOBAL.FLAG_FRECKLED))
	{
		if(target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFur()) output2(" Beneath your fur, f");
		else output2(" F");
		output2(target.mf("reckles spot your cheeks.","reckles cutely adorn your cheeks."));
	}
	//M/F stuff!
	output2(" Overall, your visage has " + target.faceDesc() + ".");
	
	//Eyes
	var hasMetallicEyes:Boolean = colorIsMetallic(target.eyeColor);
	var hasGemstoneEyes:Boolean = colorIsGemstone(target.eyeColor);
	var hasLuminousEyes:Boolean = colorIsLuminous(target.eyeColor);
	
	switch(target.eyeType)
	{
		case GLOBAL.TYPE_ARACHNID:
			output2(" In addition to your primary two eyes, you have a second, smaller pair on your forehead");
			if(hasMetallicEyes) output2(", all of which reflect back a metallic " + target.eyeColor + " in the light.");
			else if(hasGemstoneEyes) output2(", all of which shimmer " + target.eyeColor + " in the light like jewels.");
			else if(hasLuminousEyes) output2(", all of which beam " + target.eyeColor + " in the darkness.");
			else output2(", all of which are " + target.eyeColor + ".");
			break;
		case GLOBAL.TYPE_SHARK:
			output2(" Your eyes are a curious mix of piscine and feline features; a pair of black vertical slits instead of rounded pupils,");
			if(hasMetallicEyes) output2(" sat amongst metallically glistening pools of " + target.eyeColor + " irises.");
			else if(hasGemstoneEyes) output2(" each nestled in a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) output2(" each nestled within " + indefiniteArticle(target.eyeColor) + " iris.");
			else output2(" each sat within " + indefiniteArticle(target.eyeColor) + " iris.");
			output2(" A thick black ring lines your eye and your eyelids close from the side."); 
			break;
		case GLOBAL.TYPE_SIREN:
			output2("Your eyes are predatory in nature, each with a vertical slit surrounded by");
			if (hasMetallicEyes) output2(" a metallically glistening " + target.eyeColor + " iris.");
			else if (hasGemstoneEyes) output2(" a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if (hasLuminousEyes) output2(" " +  indefiniteArticle(target.eyeColor) + " iris.");
			else output2("  " + indefiniteArticle(target.eyeColor) + " iris.");
			output2(" Your sclera are completely pitch black, giving you a slightly dangerous air."); 
			break;
		case GLOBAL.TYPE_SHEEP:
			if(hasMetallicEyes) output2(" Metallically glistening in the light, your");
			else if(hasGemstoneEyes) output2(" Like jewels, shimmering in the light, your");
			else if(hasLuminousEyes) output2(" Like twinkling beacons, your");
			else output2(" Your");
			output2(" " + target.eyeColor + " eyes are sheep-like, sporting horizontal pupils.");
			break;
		case GLOBAL.TYPE_GOAT:
		case GLOBAL.TYPE_ADREMMALEX:
			if(hasMetallicEyes) output2(" Metallically glistening in the light, your");
			else if(hasGemstoneEyes) output2(" Like jewels, shimmering in the light, your");
			else if(hasLuminousEyes) output2(" Like twinkling beacons, your");
			else output2(" Your");
			output2(" " + target.eyeColor + " eyes sport " + (target.eyeType != GLOBAL.TYPE_ADREMMALEX ? "horizontal" : "cross-shaped") + " pupils, much like a vaguely alien goat.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			output2(" Your eyes have a curious mix of feline and dragonic features; a pair of black vertical slits instead of rounded pupils, ");
			if(hasMetallicEyes) output2(" sat amongst metallically glistening pools of " + target.eyeColor + " irises.");
			else if(hasGemstoneEyes) output2(" each nestled in a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) output2(" each nestled within " + indefiniteArticle(target.eyeColor) + " iris.");
			else output2(" each sat within " + indefiniteArticle(target.eyeColor) + " iris.");
			output2(" Tendrils of black crawl across your sclera, extending from a dark ring just barely visible at the edges.");
			break;
		case GLOBAL.TYPE_BEE:
			if(target.eyeColor == "gold") output2(" Your eyes are completely pitch black with the exception of your vibrant golden irises.");
			else if(target.eyeColor != "black") output2(" Your eyes are pitch black with " + target.eyeColor + " irises.");
			else output2(" The black sclera and iris of both of your eyes make them appear as solid black and very alien.");
			output2(" Their structure allows you to have a larger angle of vision as well as detecting the fastest of movements.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_WORG:
			output2(" Your canine eyes have large");
			if(hasMetallicEyes) output2(", metallically glistening " + target.eyeColor + " irises");
			else if(hasGemstoneEyes) output2(", shimmering " + target.eyeColor + " irises");
			else if(hasLuminousEyes) output2(" " + indefiniteArticle(target.eyeColor) + " irises");
			else output2(" " + indefiniteArticle(target.eyeColor) + " irises");
			output2(" occupying most of their surface when the pupils are not dilated");
			if(target.eyeType == GLOBAL.TYPE_WORG) output2(", each surrounded by a menacingly glowing sclera");
			output2(".");
			break;
		case GLOBAL.TYPE_FELINE:
		case GLOBAL.TYPE_SNAKE:
		case GLOBAL.TYPE_DEMONIC:
		case GLOBAL.TYPE_VULPINE:
			output2(" Your eyes bear a vertical slit instead of rounded pupils, ");
			if(hasMetallicEyes) output2("surrounded by a metallically glistening " + target.eyeColor + " iris");
			else if(hasGemstoneEyes) output2("surrounded by a gem-like shimmering " + target.eyeColor + " iris");
			else if(hasLuminousEyes) output2("surrounded by a brightly " + target.eyeColor + " iris");
			else output2("surrounded by " + indefiniteArticle(target.eyeColor) + " iris");
			if(target.eyeType != GLOBAL.TYPE_DEMONIC) output2(".");
			else
			{
				if(rand(3) == 0) output2(" and nestled within the inky blackness of your sclera.");
				else output2(" and nestled within the pitch black depths of your sclera.");
			}
			break;
		case GLOBAL.TYPE_AVIAN:
			if(target.eyeColor == "black") output2(" Your eyes resemble black beads, shiny and expressionless. Only the occasional flickering of your nictitating membranes reveal that they are not made of glass.");
			else output2(" Your eyes are human-like at first glance, but the black iris, " + target.eyeColor + " sclera, unblinking stare, and the occasional flickering of your nictitating membranes hint at their avian nature.");
			break;
		case GLOBAL.TYPE_LEITHAN:
			output2(" Your eyes each feature a secondary pupil, ");
			if(target.eyeColor == "blue")
			{
				output2("forming an intensely striking symbol of infinity nestled as they are amongst a single brilliantly bright blue iris.");
			}
			else if(hasMetallicEyes) output2("both embedded in a single, overly large metallical " + target.eyeColor + " iris.");
			else if(hasGemstoneEyes) output2("both embedded in a single shimmering " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) output2("both embedded in a single brightly " + target.eyeColor + " iris.");
			else output2("surrounded by a single " + target.eyeColor + " iris.");
			break;
		case GLOBAL.TYPE_MYR:
			output2(" Your eyes are gleaming, solid " + target.eyeColor + " orbs that seem to give little away.");
			break;
		case GLOBAL.TYPE_NYREA:
			output2(" Your eyes are solid " + target.eyeColor + " in color. They are well adapted to low light environments, befitting a cave-dwelling species like the nyrea.");
			break;
		case GLOBAL.TYPE_COCKVINE:
			if(InCollection(target.eyeColor, ["amber", "yellow", "gold"])) output2(" Glistening in the light like rich sap, your eyes are solid golden amber with hidden pupils.");
			else output2(" Like rich sap, your eyes are glistening amber, each with a solid, hexagonal-shaped " + target.eyeColor + " iris and an invisible pupil.");
			output2(" Strangely, they seem like a very natural part of you, despite their alien-like appearance.");
			break;
		case GLOBAL.TYPE_GABILANI:
			if(target.eyeColor == "black") output2(" Your alien eyes are dark as the void, with irises that are completely black and indistinguishible from the pupils themselves, making you appear disconcerting from afar.");
			else output2(" Your eyes are completely " + target.eyeColor + ", with irises of the same color and indistinguishible from the pupils themselves, making you appear quite alien.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.eyeColor == "black") output2(" Void black eyes with glowing iridescent");
			else
			{
				if(hasMetallicEyes) output2(" Metallically glistening " + target.eyeColor);
				else if(hasGemstoneEyes) output2(" Like jewels, shimmering " + target.eyeColor);
				else if(hasLuminousEyes) output2(" Like twinkling beacons, " + target.eyeColor);
				else output2(" " + StringUtil.capitalize(target.eyeColor));
				output2(" eyes with dark");
			}
			output2(" ‘plus’-shaped pupils assess your surroundings with little issue.");
			break;
		case GLOBAL.TYPE_SYNTHETIC:
			if(target.eyeColor == "black") output2(" Your eyes are pitch black with digitally-projected glowing white squares that form each iris,");
			else
			{
				output2(" Your eyes are mapped like a printed circuit board and ");
				if(hasMetallicEyes) output2(" glisten with rings of metallic " + target.eyeColor);
				else if(hasGemstoneEyes) output2(" light up with rings of shimmering " + target.eyeColor);
				else if(hasLuminousEyes) output2(" pulse to life with rings of " + target.eyeColor);
				else output2(" are decorated with rings of " + StringUtil.capitalize(target.eyeColor));
				output2(" around each iris,");
			}
			output2(" giving them a very synthetic appearance.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0)
			{
				output2(" Your eyes are bulgy and ");
				switch(target.eyeColor)
				{
					case "black": output2("abyssal"); break;
					case "cyan": output2("refractive"); break;
					case "white": output2("reflective"); break;
					case "gold": output2("radiant"); break;
					default: output2("iridescent"); break;
				}
				output2(", interfering with the natural light around them.");
			}
			else output2(" Your " + target.eyeColor + " orbs-for-eyes bulge slightly forward, bathed in a muted, ambient glow.");
			break;
		default:
			if(hasMetallicEyes) output2(" Metallically glistening " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			else if(hasGemstoneEyes) output2(" Like jewels, shimmering " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			else if(hasLuminousEyes) output2(" Like twinkling beacons, " + target.eyeColor + " eyes seem to draw the attention of everyone around you.");
			else
			{
				if(rand (10) == 0) output2(" Fairly unremarkable " + target.eyeColor);
				else if(rand(3) == 0) output2(" Regular " + target.eyeColor);
				else if(rand(2) == 0) output2(" Normal-looking " + target.eyeColor);
				else output2(" " + StringUtil.capitalize(target.eyeColor) + "-colored");
				output2(" eyes allow you to take in your surroundings without trouble.");
			}
			break;
	}
	
	//Hair
	var nonFurrySkin:Boolean = InCollection(target.skinType, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_LATEX);
	var isFloppyEars:Boolean = (InCollection(target.earType, GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE) && (target.RQ() < 50 || target.AQ() < 50 || target.earLength >= target.tallness/2));
	
	//if bald
	if(!target.hasHair())
	{
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output2(" You have no hair, only a" + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? "" : " thin") + " layer of " + target.skinNoun(false,true) + " where your hair should be.");
		else output2(" You have no hair, showing only shiny " + target.skinFurScales() + " where your hair should be.");
		
		var headNoun:String = "head";
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR) headNoun = "furred head";
		else if(rand(4) == 0) headNoun = "skull";
		
		switch(target.earType)
		{
			case GLOBAL.TYPE_HUMAN:
				// Human ears don't get acknowledged, I guess!
				break;
			case GLOBAL.TYPE_EQUINE:
				output2(" A pair of horse-like ears rise up from the top of your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_CANINE:
				output2(" A pair of pointed ausar-like ears protrude from your " + headNoun + ", pointed and alert.");
				break;
			case GLOBAL.TYPE_KORGONNE:
				output2(" A pair of triangular dog ears protrude from your " + headNoun + ", rounded at the top like a korgonne’s.");
				break;
			case GLOBAL.TYPE_BOVINE:
				output2(" A pair of round, floppy cow ears protrude from the sides of your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SHEEP:
				output2(" A pair of sheep-like ears flop cutely down the sides of your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_GOAT:
				output2(" A pair of " + num2Text(target.earLength) + "-inch long, flicking goat ears protrude from the sides of your " + headNoun);
				if(!nonFurrySkin) output2(" with tufts of fur on their backs");
				output2(".");
				break;
			case GLOBAL.TYPE_DRIDER:
				output2(" A pair of large pointy ears stick out from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_FELINE:
				output2(" A pair of cute")
				if(!nonFurrySkin) output2(", fuzzy");
				output2(" feline ears, sprout from atop your " + headNoun + ", each pivoting towards any sudden noises.");
				break;
			case GLOBAL.TYPE_AVIAN:
				output2(" A pair of small holes");
				if(!nonFurrySkin || target.hasFeathers()) output2(" hidden");
				output2(" on the sides of your " + headNoun + " make up your ears. Their location is prominently revealed by");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" fin-like protrusions");
				else output2(" tufts of feathers");
				output2(" which act as auricles.");
				break;
			case GLOBAL.TYPE_LIZAN:
				output2(" A pair of rounded protrusions with small holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" hidden");
				output2(" on the sides of your " + headNoun + " serve as your ears.");
				break;
			case GLOBAL.TYPE_LAPINE:
			case GLOBAL.TYPE_QUAD_LAPINE:
			case GLOBAL.TYPE_LEITHAN:
				if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) output2(" Two pairs of");
				else output2(" A pair of");
				if(isFloppyEars) output2(" floppy");
				else output2(" alert");
				output2(" rabbit ears stick up from the top of your " + headNoun + ",");
				if(target.earLength > target.tallness) output2(" dragging on the floor");
				if(target.earLength > target.tallness/2) output2(" swaying about");
				else if(isFloppyEars || rand(2) == 0) output2(" bouncing around");
				else output2(" swaying and darting");
				output2(" as you [target.walk].");
				break;
			case GLOBAL.TYPE_KANGAROO:
				output2(" A pair of long");
				if(!nonFurrySkin) output2(", furred");
				output2(" kangaroo ears stick out from your " + headNoun + " at an angle.");
				break;
			case GLOBAL.TYPE_VULPINE:
				output2(" A pair of large, adept fox ears sit high on your " + headNoun + ", always listening.");
				break;
			case GLOBAL.TYPE_LUPINE:
				output2(" A pair of pointed wolf-like ears protrude from your " + headNoun + ", pointed and alert.");
				break;
			case GLOBAL.TYPE_DEER:
				output2(" A pair of pointed, oval-shaped ears poke out from the sides of your " + headNoun + ", flicking and flopping about, making you look very much like a deer.");
				break;
			case GLOBAL.TYPE_DRACONIC:
			case GLOBAL.TYPE_GRYVAIN:
				output2(" A pair of rounded protrusions with small holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" hidden");
				output2(" on the sides of your " + headNoun + " serve as your ears. Bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_KUITAN:
				output2(" A pair of vaguely egg-shaped");
				if(!nonFurrySkin) output2(", furry");
				output2(" raccoon ears adorns your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_MOUSE:
				output2(" A pair of large, dish-shaped mouse ears stick up prominently atop of your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_VANAE:
				output2(" A pair of pointed, finned ears tops your " + headNoun + ", each one sensitive to the slightest sound.");
				break;
			case GLOBAL.TYPE_PANDA:
				output2(" A pair of rounded, panda-like ears protrude from your " + headNoun + ", " + target.mf("standing tall and proud", "looking absolutely adorable") + ".");
				break;
			case GLOBAL.TYPE_REDPANDA:
				if(target.tallness <= 72) output2("A pair of big " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears perk up on top of your head, listening closely to any surrounding noise.");
				else output2("A pair of cute, furry " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears poke out of the top of your head, listening closely to any surrounding noise.");
				break;
			case GLOBAL.TYPE_RASKVEL:
				output2(" A pair of");
				if(target.earLength >= (target.tallness * 0.6)) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long raskvel ears dangle from your " + headNoun + " down past your waist.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.earLength <= 1)
				{
					output2(" A pair of mostly-human ears with slightly pointed tips protrude from the sides of your " + headNoun + ", just like a fantasy elf’s.");
				}
				//2-4 inches: 
				else if(target.earLength <= 4)
				{
					output2(" A pair of triangular, elven ears protrude from the sides of your " + headNoun + ", sticking out a full " + num2Text(target.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				}
				//5+ inches:
				else
				{
					output2(" A pair of exquisitely long, elf-like ears extend a full " + num2Text(target.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
				}
				break;
			case GLOBAL.TYPE_GABILANI:
				output2(" A pair of long, triangular goblin ears point outwards");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + " inches");
				output2(" from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_DEMONIC:
				output2(" A pair of wicked-looking ears point outwards");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + " inches");
				output2(" from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_FROG:
			case GLOBAL.TYPE_OVIR:
				output2(" A pair of small indented holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" hidden");
				output2(" on the sides of your " + headNoun + " make up your ears.");
				break;
			case GLOBAL.TYPE_DOGGIE:
				output2(" A pair of");
				if(target.earLength >= 6) output2(" droopy");
				else if(target.earLength >= 3) output2(" floppy");
				else output2(" rounded");
				output2(" dog ears protrude");
				if(target.earLength >= 3) output2(" " + num2Text(target.earLength) + " inches");
				output2(" from your " + headNoun + ", each capable of being highly expressive.");
				break;
			case GLOBAL.TYPE_SIREN:
				output2(" A pair of feather-tipped ears point outwards");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + " inches");
				output2(" from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SHARK:
				output2(" A pair of triple-parted, sail-like ears protrude from the sides of your " + headNoun + ". The topmost sail points straight up while the other more smaller ones curve down.");
				break;
			case GLOBAL.TYPE_SWINE:
				output2(" A pair of pointed, floppy pig ears protrude from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SIMII:
				output2(" A pair of large, strangely-shaped ears protrude from your " + headNoun + ".");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				output2(" A pair of moth ears are recessed at the sides of your " + headNoun + ", looking like slightly raised mounds of membranous tissue.");
				break;
			default:
				output2(" There is nothing notable to mention about your ears.");
				break;
		}
	}
	//not bald
	else
	{
		switch(target.earType)
		{
			case GLOBAL.TYPE_HUMAN:
				output2(" Your " + target.hairDescript(true,true) + " looks good on you, accentuating your features well.");
				break;
			case GLOBAL.TYPE_EQUINE:
				output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of very horse-like ears that grow up from your head.");
				break;
			case GLOBAL.TYPE_CANINE:
				output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of pointed dog ears.");
				break;
			case GLOBAL.TYPE_KORGONNE:
				output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of triangular dog ears, rounded at the top like a korgonne’s.");
				break;
			case GLOBAL.TYPE_BOVINE:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of rounded cow ears that stick out sideways.");
				break;
			case GLOBAL.TYPE_SHEEP:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of sheep-like ears that flop cutely down the sides of your head.");
				break;
			case GLOBAL.TYPE_GOAT:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of " + num2Text(target.earLength) + "-inch long, flicking goat ears. They stick noticeably out to the sides");
				if(!nonFurrySkin) output2(" with tufts of fur on their backs");
				output2(".");
				break;
			case GLOBAL.TYPE_DRIDER:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute pointed ears, bigger than your old human ones.");
				break;
			case GLOBAL.TYPE_FELINE:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute");
				if(!nonFurrySkin) output2(", fuzzy");
				output2(" feline ears, sprouting from atop your head and pivoting towards any sudden noises.");
				break;
			case GLOBAL.TYPE_AVIAN:
				output2(" The " + target.hairDescript(true,true) + " atop your head covers two small openings that make up your ears, but the");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" fin-like protrusions");
				else output2(" tufts of feathers");
				output2(" which act as auricles are quite noticeable.");
				break;
			case GLOBAL.TYPE_LIZAN:
				output2(" The " + target.hairDescript(true,true) + " atop your head makes it nigh-impossible to notice the two small rounded openings that are your ears.");
				break;
			case GLOBAL.TYPE_LAPINE:
			case GLOBAL.TYPE_QUAD_LAPINE:
			case GLOBAL.TYPE_LEITHAN:
				if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) output2(" Two pairs of");
				else output2(" A pair of");
				if(isFloppyEars) output2(" floppy");
				else output2(" alert");
				output2(" rabbit ears stick up out of your " + target.hairDescript(true,true) + ",");
				if(target.earLength > target.tallness) output2(" dragging on the floor");
				if(target.earLength > target.tallness/2) output2(" swaying about");
				else if(isFloppyEars || rand(2) == 0) output2(" bouncing around");
				else output2(" swaying and darting");
				output2(" as you [target.walk].");
				break;
			case GLOBAL.TYPE_KANGAROO:
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of long");
				if(!nonFurrySkin) output2(", furred");
				output2(" kangaroo ears that stick out at an angle.");
				break;
			case GLOBAL.TYPE_VULPINE:
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of large, adept fox ears that always seem to be listening.");
				break;
			case GLOBAL.TYPE_LUPINE:
				output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of pointed wolf ears.");
				break;
			case GLOBAL.TYPE_DEER:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of rounded ears that point out sideways, flicking and flopping about, making you look very much like a deer.");
				break;
			case GLOBAL.TYPE_DRACONIC:
				output2(" The " + target.hairDescript(true, true) + " atop your head is parted by a pair of rounded protrusions with small holes on the sides of your head that serve as your ears. Bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of rounded protrusions with small holes on the sides of your head that serve as your ears. Long, bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_KUITAN:
				output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of egg-shaped");
				if(!nonFurrySkin) output2(", furry");
				output2(" raccoon ears.");
				break;
			case GLOBAL.TYPE_MOUSE:
				output2(" The " + target.hairDescript(true,true) + " atop your head is funneled between and around a pair of large, dish-shaped mouse ears that stick up prominently.");
				break;
			case GLOBAL.TYPE_VANAE:
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of pointed, fin-like ears, sensitive to the slightest sound.");
				break;
			case GLOBAL.TYPE_PANDA:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of round panda ears.");
				break;
			case GLOBAL.TYPE_REDPANDA:
				output2("The " + target.hairDescript(true,true) + " atop your head is parted by a pair of " + (target.tallness <= 72 ? "large" : "cute") + " " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears that are always listening to any surrounding noise.");
				break;
			case GLOBAL.TYPE_RASKVEL:
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of");
				if(target.earLength >= (target.tallness * 0.6)) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long raskvel ears that dangle down past your waist.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.earLength <= 1) output2(" The " + target.hairDescript(true,true) + " on your head nearly conceals a pair of mostly-human ears with slightly pointed tips, just like a fantasy elf’s.");
				//2-4 inches: 
				else if(target.earLength <= 4) output2(" The " + target.hairDescript(true,true) + " on your head can’t hide a pair of triangular, elven ears. They stick out a full " + num2Text(target.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else output2(" The " + target.hairDescript(true,true) + " atop your head can’t possibly hide a pair of exquisitely long, elf-like ears. They extend a full " + num2Text(target.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
				break;
			case GLOBAL.TYPE_GABILANI:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long, triangular goblin ears.");
				break;
			case GLOBAL.TYPE_DEMONIC:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch long,");
				output2(" wicked-looking demonic ears.");
				break;
			case GLOBAL.TYPE_FROG:
			case GLOBAL.TYPE_OVIR:
				output2(" The " + target.hairDescript(true,true) + " atop your head covers the two small openings that make up your ears.");
				break;
			case GLOBAL.TYPE_DOGGIE:
				output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of");
				if(target.earLength >= 6) output2(" droopy");
				else if(target.earLength >= 3) output2(" floppy");
				else output2(" rounded");
				if(target.earLength >= 3) output2(", " + num2Text(target.earLength) + "-inch long");
				output2(" dog ears, each capable of being highly expressive.");
				break;
			case GLOBAL.TYPE_SIREN:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch long,");
				output2(" feather-tipped ears.");
				break;
			case GLOBAL.TYPE_SHARK:
				output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of triple-parted, sail-like ears. The topmost sail points straight up while the other more smaller ones curve down.");
				break;
			case GLOBAL.TYPE_SWINE:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of pointed, floppy pig ears.");
				break;
			case GLOBAL.TYPE_SIMII:
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of large, strangely-shaped ears.");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				output2(" The " + target.hairDescript(true,true) + " atop your head hides the two raised mounds of membranous tissue that are your ears.");
				break;
			default:
				output2(" The " + target.hairDescript(true,true) + " atop your head hides non-descript ears.");
				break;
		}
	}
	// Additional ear stuffs
	if(target.earType == GLOBAL.TYPE_LEITHAN)
	{
		output2(" In addition,");
		if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch long");
		output2(" pointed elfin ears jut out below them, giving you exceptional hearing.");
	}
	if(target.hasStatusEffect("Laquine Ears"))
	{
		if(InCollection(target.earType, [GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE, GLOBAL.TYPE_LEITHAN]))
		{
			output2(" The headband-mounted bunny ears you are wearing make you look like you have");
			if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) output2(" six");
			else output2(" four");
			output2(" rabbit ears total.");
		}
		else output2(" You are wearing a headband mounted with a pair of perky faux rabbit ears that bounce around as you [target.walk].");
	}
	
	// Antennae
	if(target.hasAntennae())
	{
		if(!target.hasHair())
		{
			if(target.antennae == 1) output2(" A floppy [target.antenna] also appears");
			else if(rand(2) == 0) output2(" " + StringUtil.capitalize(num2Text(target.antennae)) + " floppy [target.antennae] also grow");
			else output2(" Floppy [target.antennae] also appear");
			output2(" on your head, bouncing and swaying in the breeze.");
		}
		else
		{
			if(InCollection(target.earType, [GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE]))
			{
				if(target.antennae == 1) output2(" A limp [target.antenna] also grows");
				else if(rand(2) == 0) output2(" " + StringUtil.capitalize(num2Text(target.antennae)) + " limp [target.antennae] also grow");
				else output2(" Limp [target.antennae] also grow");
				output2(" from just behind your hairline, waving and swaying in the breeze with your ears.");
			}
			else
			{
				if(target.antennae == 1) output2(" A floppy [target.antenna] also grows");
				else if(rand(2) == 0) output2(" " + StringUtil.capitalize(num2Text(target.antennae)) + " floppy [target.antennae] also grow");
				else output2(" Floppy [target.antennae] also grow");
				output2(" from just behind your hairline, bouncing and swaying in the breeze.");
			}
		}
	}
	
	//Tongue
	switch(target.tongueType)
	{
		case GLOBAL.TYPE_SNAKE:
			output2(" A snake-like tongue occasionally flits between your lips, tasting the air.");
			break;
		case GLOBAL.TYPE_DEMONIC:
			output2(" A slowly undulating tongue occasionally slips from between your lips. It hangs nearly two feet long when you let the whole thing slide out, though you can retract it to appear normal.");
			break;
		case GLOBAL.TYPE_DRACONIC:
			output2(" Your mouth contains a thick, fleshy tongue that, if you so desire, can telescope to a distance of about four feet. It has sufficient manual dexterity that you can use it almost like a third arm.");
			break;
		case GLOBAL.TYPE_LEITHAN:
			output2(" Your mouth contains a narrow but flexible tongue that, if you so desire, can extend a good distance out from your mouth. Its tip is forked, and you are capable of moving it around in an almost prehensile manner.");
			break;
		case GLOBAL.TYPE_RASKVEL:
			output2(" Your mouth contains a thick, purple tongue that, if you so desire, can extend a fair portion from your mouth. Its tip is blunted slightly.");
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" A lengthy, tapered tongue fills your mouth, able to stretch out almost nine inches in order to taste the very air.");
			else output2(" A tapered tongue fills your mouth, able to taste the very air when extended beyond your oral cavity.");
			break;
		case GLOBAL.TYPE_BEE:
			output2(" Your mouth contains a long, bright yellow tongue that can extend a foot past past your [target.lips] when fully extended. The tip has a tube inside it, capable of gathering sweet nectar from jungle flowers or lovers.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			output2(" Your mouth contains a long tongue that can extend a foot past past your [target.lips] when fully extended. The tip has a tube inside it, capable of gathering sweet nectar from jungle flowers or lovers.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth contains a long and stretchy frog tongue, capable of reaching much longer distances than most races.");
			else output2(" Your mouth contains a stretchy frog-like tongue.");
			break;
		case GLOBAL.TYPE_CANINE:
			output2(" Your mouth contains a flat tongue that constantly drips with slobber.");
			break;
		case GLOBAL.TYPE_KORGONNE:
			output2(" Your mouth contains a long blue tongue that dangles over your lower lip whenever you stop thinking about it.");
			break;
		case GLOBAL.TYPE_BOVINE:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth houses a broad, prehensile tongue which extends over a foot long with a smooth surface that is perfect for pleasuring sensitive areas.");
			else output2(" Your mouth contains a smooth, broad tongue, perfect for pleasuring sensitive spots.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			output2(" Your mouth contains a long, prehensile tentacle-like tongue.");
			break;
		default:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth contains a lengthy tongue.");
			else output2(" Your mouth contains " + indefiniteArticle(target.tongueDescript()) + ".");
			break;
	}
	if(target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) output2(" Because it constantly produces a steady stream of wet lube, the inside of your mouth stays well lubricated.");
	
	//Horns
	if(target.horns > 0)
	{
		var hornsNoun:String = target.hornsNoun();
		var hornStyle:int = -1;
		var hornMaterial:int = -1;
		var hornColor:String = "";
		
		if(target.hasStatusEffect("Horn Style"))
		{
			hornStyle = target.statusEffectv1("Horn Style");
			hornMaterial = target.statusEffectv2("Horn Style");
			hornColor = target.getStatusTooltip("Horn Style");
		}
		
		switch(target.hornType)
		{
			//Demonic horns
			case GLOBAL.TYPE_DEMONIC:
				if(target.horns <= 2) output2(" A " + (target.hornLength <= 2 ? "small pair of" : ("pair of " + num2Text(target.hornLength) + "-inch long")) + " pointed horns has broken through the " + target.skin() + " on your forehead, proclaiming some demonic taint to any who see them.");
				else if(target.horns <= 4) output2(" A quartet of " + (target.hornLength <= 4 ? "prominent" : (num2Text(target.hornLength) + "-inch long")) + " horns has broken through your " + target.skin() + ". The back pair are longer, and curve back along your head. The front pair protrude forward demonically.");
				else if(target.horns <= 6) output2(" Six horns have sprouted through your " + target.skin() + ", the back two pairs curve backwards over your head and down towards your neck, while the front two horns stand " + (target.hornLength < 8 ? "almost eight" : num2Text(target.hornLength)) + " inches long upwards and a little forward.");
				else output2(" A large number of thick demonic horns sprout through your " + target.skin() + ", each pair sprouting behind the ones before. The front jut forwards nearly " + num2Text(target.hornLength) + " inches while the rest curve back over your head, some of the points ending just below your ears. You estimate you have a total of " + num2Text(target.horns) + " horns.");
				break;
			//Minotaur horns
			case GLOBAL.TYPE_BOVINE:
				if(target.hornLength < 1) output2(" Two tiny horn-like nubs protrude from your forehead, resembling the horns of the young livestock kept by terrans.");
				else if(target.hornLength < 2) output2(" Two small, roughly one-inch long bovine horns protrude from your forehead. They’re kind of cute, actually.");
				else if(target.hornLength < 3) output2(" Two bovine horns, approximately two inches in length, jut from your forehead.");
				else if(target.hornLength < 4) output2(" A pair of bovine horns jut a full three inches from your forehead.");
				else if(target.hornLength < 5) output2(" Two horns protrude through the [target.skin] of your forehead. Each is about four inches in length and impossible to ignore.");
				else if(target.hornLength < 6) output2(" Two big, strong bovine horns jut from your forehead. Their weight is a constant reminder just how much you look like a " + target.mf("bull","cow") + ".");
				else if(target.hornLength < 8) output2(" Roughly half a foot of powerful, bovine horn protrudes from your skull. All you have to do is lower your head, and suddenly, you look quite dangerous.");
				else if(target.hornLength < 12) output2(" Two large horns sprout from your forehead, curving forwards like those of a bull.");
				else if(target.hornLength < 20) output2(" Two very large and dangerous looking horns sprout from your head, curving forward and over a foot long. They have dangerous looking points.");
				else output2(" Two huge horns erupt from your forehead, curving outward at first, then forwards. The weight of them is heavy, and they end in dangerous looking points.");
				break;
			//Lizard horns
			case GLOBAL.TYPE_LIZAN:
			case GLOBAL.TYPE_DRACONIC:
				if(target.horns == 2 && target.hornType != GLOBAL.TYPE_DRACONIC) output2(" A pair of " + num2Text(int(target.hornLength)) + "-inch horns grow from the sides of your head, sweeping backwards and adding to your imposing visage.");
				//Super lizard horns
				else output2(" Two pairs of horns, roughly a foot long, sprout from the sides of your head. They sweep back and give you a fearsome look, almost like the dragons from terran legends.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				output2(" A pair of " + num2Text(int(target.hornLength)) + "-inch horns grow from just above your forehead, sweeping backwards to follow the contour of your skull.");
				if(target.isBimbo()) output2(" They’d make the most <i>adorable</i> handlebars for anybody looking to bust a nut down your throat!");
				break;
			//Antlers!
			case GLOBAL.TYPE_DEER:
				if(rand(2) == 0) output2(" A pair of antlers sprout from your head, covered in velvet and indicating your status as a desirable mate.");
				else output2(" Velvet-covered antlers sprout from your head, declaring your status as a desirable mate and formidable opponent.");
				if(target.hornLength > 1) output2(" They are " + num2Text(int(target.hornLength)) + "-inch long and fork into " + num2Text(target.horns) + " points.");
				break;
			case GLOBAL.TYPE_DRYAD:
				output2(" Two");
				if(target.hornLength > 1) output2(" " + num2Text(int(target.hornLength)) + "-inch long");
				output2(" antlers, forking into " + num2Text(target.horns) + " points, have sprouted from the top of your head, forming a spiky, regal crown of branches.");
				break;
			//Goatliness is next to godliness.
			case GLOBAL.TYPE_GOAT:
				if(target.hornLength >= 6)
				{
					output2(" " + StringUtil.capitalize(num2Text(target.horns)));
					if(hornStyle > 0)
					{
						if(hornMaterial <= 0 && hornColor != "") output2(" " + hornColor);
						output2(" goat horns extend from the top of your forehead.");
						switch(hornStyle)
						{
							case 1:
								output2(" The curled goat horns coil out from the sides of your forehead, " + num2Text(int(target.hornLength)) + " inches to the left and right.");
								break;
							case 2:
								output2(" The bow-curved goat horns extend in opposite directions from the sides of your forehead, " + num2Text(int(target.hornLength)) + " inches to the left and right.");
								break;
							case 3:
								output2(" The thick ibex-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, curving towards your back in a regal manner.");
								break;
							case 4:
								output2(" The oryx-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, thin and mostly straight aside a slight bend towards the floor.");
								break;
							case 5:
								output2(" The markhor-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, twisted and alien in shape.");
								break;
						}
					}
					else output2(" curled goat horns twist back from your forehead, curling over your [target.ears] like a satyr out of terran legend.");
				}
				else output2(" " + StringUtil.capitalize(num2Text(target.horns)) + " goat horns stick stright out from your forehead, making you appear like a satyr out of terran legend.");
				break;
			//Ram horns
			case GLOBAL.TYPE_SHEEP:
				if(rand(2) == 0)
				{
					if(target.hornLength >= 10) output2(" Impressive curved ram horns sprout from your head, showing off to all who can see that you are more than capable of defending yourself and your territory.");
					else output2(" Slightly curved ewe horns emerge from your head, giving you a graceful appearance.");
				}
				else
				{
					if(target.hornLength >= 10) output2(" A pair of large ram horns grow from your head, showing off to all who can see that you are formidable opponent.");
					else output2(" A pair of sheep-like horns grow from your head, each with a naturally elegant curve.");
				}
				break;
			//Rhinoceros horn!
			case GLOBAL.TYPE_RHINO:
				// Default
				if(target.horns == 1) output2(" A thick, wide keratin horn emerges from your forehead, " + num2Text(int(target.hornLength)) + "-inches long and sporting a slight upward curve.");
				// More rhino-esque
				else if(target.horns == 2) output2(" Protruding from the bridge of your nose, a thick, " + num2Text(int(target.hornLength)) + "-inch long keratin horn emerges, sporting a slight upward curve and followed by a smaller, smoother bump of horn right behind it.");
				// Triceratops!
				else if(target.horns == 3) output2(" Two thick, wide keratin horns emerge from your forehead, " + num2Text(int(target.hornLength)) + "-inches long with a slight upward curve. A third, smaller horn protrudes from, and perpendicular to, your nose bridge.");
				// Too many horns...
				else output2(" Thick, keratin horns emerge from your forehead and face, all varying sizes, with the largest at about " + num2Text(int(target.hornLength)) + "-inches long. They all protrude forward and slightly curve upwards, creating a very menacing pincusion-like visage.");
				break;
			//Unicorn horn!
			case GLOBAL.TYPE_NARWHAL:
				output2(" A slender ivory horn extends from your forehead, " + num2Text(int(target.hornLength)) + "-inches long with a spiral pattern of ridges and grooves up its length, giving it a graceful appearance.");
				break;
		}
		if(hornMaterial > 0 && hornColor != "")
		{
			switch(hornMaterial)
			{
				case 1: output2(" Your " + hornsNoun + " " + (target.horns == 1 ? "is" : "are") + " not " + (target.horns == 1 ? "its" : "their") + " typical color, instead being " + hornColor + "."); break;
				case 2:
					output2(" Your " + hornsNoun + " appear" + (target.horns == 1 ? "s" : "") + " to be crafted from polished " + hornColor + ", and " + (target.horns == 1 ? "has" : "have") + " a pleasant, reflective shine.");
					if(silly && hornColor == "steel") output2(" You’re getting used to comments that " + (target.horns == 1 ? "it’s" : "they’re") + " a little too on the nose.");
					break;
				case 3: output2(" Your " + hornsNoun + " appear" + (target.horns == 1 ? "s" : "") + " to be made of cut, shaped and polished " + hornColor + ", giving you an almost regal appearance."); break;
			}
		}
	}
	else if(target.hasStatusEffect("Horn Bumps")) output2(" <b>Your forehead is red and irritated in two different places. The upraised bumps stand out quite visibly.</b>");
	
	//Misc. Head Ornaments
	if(target.hasStatusEffect("Hair Flower"))
	{
		if(target.statusEffectv1("Hair Flower") > 1)
		{
			if(rand(2) == 0) output2(StringUtil.capitalize(num2Text(target.statusEffectv1("Hair Flower"))) + " huge " + target.getStatusTooltip("Hair Flower") + " orchids grow from the sides of your head, their big long petals flopping gaily when you move.");
			else output2(" Nestled on your head, there are " + num2Text(target.statusEffectv1("Hair Flower")) + " " + target.getStatusTooltip("Hair Flower") + " orchids. It looks like you stuck them there but they’re very much a part of you, flourishing from your scalp merrily.");
		}
		else
		{
			if(rand(2) == 0) output2(" A huge " + target.getStatusTooltip("Hair Flower") + " orchid grows from the side of your head, its big long petals flopping gaily when you move.");
			else output2(" Nestled at one side of your head, there is " + indefiniteArticle(target.getStatusTooltip("Hair Flower")) + " orchid. It looks like you stuck it there but it’s very much a part of you, flourishing from your scalp merrily.");
		}
	}
	
	// Worn collars
	appearanceWornCollar();
	
	//BODY PG HERE
	output2("\n\nYou have a humanoid upper body with the usual torso, arms, hands, and fingers");
	
	switch(target.skinType)
	{
		case GLOBAL.SKIN_TYPE_FUR:
			output2(", mostly covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_SCALES:
			output2(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_CHITIN:
			output2(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_GOO:
			if(target.hasStatusEffect("Opaque Skin")) output2(", covered in a layer of glistening goo");
			else output2(", all of them glittering, semi-transparent goo");
			break;
		case GLOBAL.SKIN_TYPE_FEATHERS:
			output2(", covered in " + (rand(2) == 0 ? "patches" : "a layer") + " of " + target.skinFurScales(true, true));
			if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(" above the waist and similarly colored fur below");
			break;
		case GLOBAL.SKIN_TYPE_PLANT:
			output2(", covered in " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_BARK:
			output2(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		default:
			if(target.skinType == GLOBAL.SKIN_TYPE_LATEX || target.hasStatusEffect("Rubber Wrapped"))
			{
				output2(", sensually wrapped in a layer of");
				if(target.statusEffectv1("Latex Skin") > 0)
				{
					if(target.statusEffectv1("Latex Skin") < 2) output2(" semi-glossy");
					else if(target.statusEffectv1("Latex Skin") < 3) output2(" glossy");
					else output2(" extra-glossy");
				}
				output2(" " + (target.skinType == GLOBAL.SKIN_TYPE_LATEX ? target.skinTone : target.skinFurScalesColor()) + " latex");
			}
			break;
	}
	
	//WINGS!
	if(target.wingType != GLOBAL.TYPE_HUMAN)
	{
		output2(", and");
		switch(target.wingType)
		{
			case GLOBAL.TYPE_SMALLBEE:
			case GLOBAL.TYPE_MYR:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" insect-like wings sprout from your back, too small to allow you to fly. They shimmer beautifully in the light.");
				break;
			case GLOBAL.TYPE_BEE:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" large, insectile wings sprout from your back, reflecting the light through their clear membranes beautifully. They’ll bear your weight if you choose to fly.");
				break;
			case GLOBAL.TYPE_SMALLDEMONIC:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" tiny bat-like demon-wings sprout from your back, flapping cutely, otherwise of little use.");
				break;
			case GLOBAL.TYPE_DEMONIC:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" large bat-like demon-wings fold " + (target.statusEffectv1("Wing Position") == 1 ? "over your body" : "behind your shoulders") + ". With a muscle-twitch, you can extend them, and use them to soar gracefully through the air.");
				break;
			case GLOBAL.TYPE_SHARK:
				if(target.wingCount == 2) output2(" a pair of ");
				else if(target.wingCount == 4) output2(" a quartet of ");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				if(target.wingCount > 1) output2(" large shark-like fins have sprouted between your shoulder blades. With them you have far more control over swimming underwater.");
				else output2(" a large shark-like fin has sprouted between your shoulder blades. With it you have far more control over swimming underwater.");
				break;
			case GLOBAL.TYPE_AVIAN:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" large, feathery wings sprout from your back" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over your body" : "") + ". Though you usually keep the " + target.wingColor() + "-colored wings folded close, they can unfurl to allow you to soar as gracefully as a bird.");
				break;
			case GLOBAL.TYPE_SMALLDRACONIC:
				output2(" small, vestigial wings sprout from your shoulders. They might look like bat’s wings, but the membranes are covered in fine, delicate scales.");
				break;
			case GLOBAL.TYPE_DRACONIC:
				output2(" magnificent " + target.wingColor() + " wings sprout from your shoulders" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over your body" : "") + ". When unfurled they stretch further than your arm span, and a single beat of them is all you need to set out toward the sky. They look a bit like bat’s wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
				break;
			case GLOBAL.TYPE_DRAGONFLY:
				output2(" giant dragonfly wings hang from your shoulders. At a whim, you could twist them into a whirring rhythm fast enough to lift you off the ground and allow you to fly.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" " + target.wingColor() + " gossamer wings sprout from your back, displaying a prismatic sheen when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection.");
				break;
			case GLOBAL.TYPE_DARK_SYLVAN:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" gossamer wings sprout from your back, " + target.wingColor() + " with a pattern that makes them look as though they’re coated in wisps of shadow when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection.");
				break;
			case GLOBAL.TYPE_DOVE:
				if(target.wingCount == 2) output2(" a pair of");
				else output2(" " + num2Text(int(target.wingCount)));
				if(target.wingCount < 4) output2(" " + target.furColor + " wings adorn your back, feathered like a dove’s and big enough to be worn like a cloak when folded over your body. They’re strong enough to glide with, but nice and soft to the touch.");
				else if(target.wingCount < 6) output2(" wings sprout from your back, each covered in wonderfully soft " + target.wingColor() + " feathers and big enough to be worn like a robe when all " + num2Text(int(target.wingCount)) + " are folded over your body. They’re arranged so they don’t get in each other’s way when spread, thus you can still glide with them.");
				else output2(" wings sprout from your back, each covered in wonderfully soft " + target.wingColor() + " feathers and big enough to be worn like a luxurious ceremonial robe when all " + num2Text(int(target.wingCount)) + " are folded over your body, which you often find yourself doing to help with getting through tight spaces. Despite their sheer bulk, you can still glide with them.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				if(target.wingCount == 2) output2(" a pair of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" magnificent wings sprout from your shoulders" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over your body" : "") + ". When unfurled they stretch further than your arm span, and a single beat of them is all you need to set out toward the sky. They look a bit like bat’s wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
				break;
			case GLOBAL.TYPE_COCKVINE:
			case GLOBAL.TYPE_TENTACLE:
				if(target.wingCount == 3) output2(" a trio of");
				else if(target.wingCount == 4) output2(" a quartet of");
				else if(target.wingCount == 12) output2(" a dozen");
				else if(target.wingCount > 1) output2(" " + num2Text(int(target.wingCount)));
				output2(" oily, prehensile phalluses sprout from your shoulders and back. They are retractable at will and can move on their own volition.");
				if(target.wingType == GLOBAL.TYPE_COCKVINE) output2(" From afar, they may look like innocent vines, but up close, each tentacle contains a bulbous head with a leaking cum-slit");
				else if(target.wingType == GLOBAL.TYPE_TENTACLE) output2(" Each tentacle contains a hefty knot with a long, nub-lined shaft and tipped with a cum-drooling slit");
				else output2(" Each tentacle contains a bulbous head with a cum-leaking slit");
				output2(", perfect for mass breeding.");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				output2(" " + num2Text(int(target.wingCount)) + " " + target.wingColor() + " moth wings sprout from your back, covered in symmetrical, abstract patterns.");
				if(target.wingTexture() == GLOBAL.FLAG_FURRED) output2(" They’re covered in a soft fuzz and feel very light.");
				else output2(" They feel very light and delicate to the touch.");
				output2(" They fold behind you neatly and compactly, the ends in line with the back of your lower calves. They let you hover for a short time and glide easily, although true flight is deceptively difficult to maintain.");
				break;
		}
	}
	else output2(".");
	
	// Neck mane stuff
	if(target.hasPerk("Regal Mane"))
	{
		output2(" Above your shoulders and around your neck grows a");
		switch(target.perkv1("Regal Mane"))
		{
			case GLOBAL.FLAG_FURRED: output2(" mane of fluffy, " + target.furColor + " fur"); break;
			case GLOBAL.FLAG_SCALED: output2(" retractable frill covered in " + target.scaleColor + " scales"); break;
			case GLOBAL.FLAG_CHITINOUS: output2(" collar of spiky, " + target.chitinColor() + " chitin"); break;
			case GLOBAL.FLAG_GOOEY: output2(" flexible shell of smooth, " + target.skinTone + " goo"); break;
			case GLOBAL.FLAG_FEATHERED: output2(" mane of poofy, " + target.furColor + " feathers"); break;
			case GLOBAL.FLAG_SPIKED: output2(" collar of sinister-looking spikes"); break;
			case GLOBAL.FLAG_TENDRIL: output2(" wreath of plant-like vines"); break;
			case GLOBAL.FLAG_AMORPHOUS: output2("n amorphous brace of translucent slime"); break;
			default: output2(" magnificent mane"); break;
		}
		output2(", making you appear quite royal.");
	}
	// Fluff stuff
	if(!target.hasFur() && !target.hasFeathers() && (target.hasSkinFlag(GLOBAL.FLAG_FURRED) || target.hasSkinFlag(GLOBAL.FLAG_FEATHERED)))
	{
		output2(" Growing from your " + target.skinNoun(false, true) + " is a layer of downy " + (!target.hasSkinFlag(GLOBAL.FLAG_FEATHERED) ? "fur" : "feathers") + ".");
	}
	if(target.hasSkinFlag(GLOBAL.FLAG_FLUFFY))
	{
		if(target.biggestTitSize() > 2) output2(" Nestled between your breasts");
		else output2(" Poofing out your chest");
		output2(" is a fluffy ball of " + target.furColor + " " + ((target.hasFur() || target.hasFeathers()) ? target.skinNoun(false,true) : "fur") + ".");
	}
	if(target.hasFur() && target.perkv1("Wooly") >= 1)
	{
		output2(" Your chest and back are covered in a thick, bushy layer of wool.");
	}
	
	// Body Markings
	if(target.hasAccentMarkings())
	{
		var bodyPts:Array = ["back", "arms", (target.legCount == 1 ? target.legNoun() : target.legsNoun())];
		if(target.hasTail()) bodyPts.push(target.tailsDescript(true));
		
		switch(target.accentMarkings())
		{
			// Vanaebutt Skin
			case 0: output2(" Swirls of " + target.skinAccent + " trace brighter accents across much of your form."); break;
			// Others
			case 1: output2(" You have " + target.skinAccent + " stripes running all across your body; your " + CompressToList(bodyPts) + "."); break;
			case 2: output2(" You have " + target.skinAccent + " spots dotting every part of your body; your " + CompressToList(bodyPts) + "."); break;
			case 3: output2(" You have an off-color blotch on the frontal part of your body, covering your chin, " + target.chestDesc() + ", belly and inner thighs in " + target.skinAccent + "."); break;
			case 4: output2(" You have speckles of " + target.skinAccent + " covering your body."); break;
			case 5: output2(" You have dapples of " + target.skinAccent + " covering your body."); break;
			case 6: output2(" You have " + target.skinAccent + " piebald markings covering your body."); break;
			case 7: output2(" Parts of your " + ((target.hasFur() || target.hasFeathers()) ? "fur" : "body") + " show abstract " + target.skinAccent + " tattoos, ones that glow faintly with a pleasant aura."); break;
		}
	}
	// Freckles
	if(target.hasSkinFlag(GLOBAL.FLAG_FRECKLED))
	{
		if(target.hasFur() || target.hasFeathers()) output2(" Beneath your body fur, f");
		else output2(" F");
		output2("reckles dot various parts of your skin.");
	}
	
	// Cum Splattered!
	if(target.hasStatusEffect("Cum Soaked") || target.hasStatusEffect("Pussy Drenched"))
	{
		var fluidDesc:String = "";
		var fluidVisc:Array = [];
		var fluidLayer:int = 0;
		var fluidLayers:Number = 0;
		
		if(target.hasStatusEffect("Cum Soaked"))
		{
			fluidLayers += target.statusEffectv1("Cum Soaked");
			fluidLayer = Math.ceil(target.statusEffectv1("Cum Soaked"));
			if(fluidLayer > 3) fluidLayer = 3;
			fluidVisc = ["cum", "spooge", "gooey semen" , "goopey spunk"];
			fluidDesc += fluidVisc[fluidLayer];
		}
		if(target.hasStatusEffect("Cum Soaked") && target.hasStatusEffect("Pussy Drenched"))
		{
			fluidDesc += " and ";
		}
		if(target.hasStatusEffect("Pussy Drenched"))
		{
			fluidLayers += target.statusEffectv1("Pussy Drenched");
			fluidLayer = Math.ceil(target.statusEffectv1("Pussy Drenched"));
			if(fluidLayer > 3) fluidLayer = 3;
			fluidVisc = ["girl-lube", "girl-juice", "slimy girl-cum", "sloppy fem-cum"];
			fluidDesc += fluidVisc[fluidLayer];
		}
		
		output2(" You are soaked");
		if(fluidLayers <= 1) output2(" in visible splotches of");
		else if(fluidLayers <= 2) output2(" in a fine layer of");
		else if(fluidLayers <= 4) output2(" in layers of");
		else output2(" from top to bottom with thick layers of");
		output2(" " + fluidDesc + ", making your messy sexcapades obvious to everyone around you.");
	}
	// Mimbrane sweat
	if(flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined)
	{
		output2(" In addition, your body is soaked in");
		if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) output2(" a viscous layer");
		else if(target.statusEffectv1("Sweaty") <= 1) output2(" a light layer");
		else if(target.statusEffectv1("Sweaty") <= 2) output2(" visible layers");
		else if(target.statusEffectv1("Sweaty") <= 4) output2(" multiple layers");
		else output2(" thick layers");
		output2(" of oily, strawberry-scented " + (target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED) ? "lubrication" : "perspiration") + ", giving it a slick, sensual shine.");
	}
	// Lube skin!
	else if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
	{
		output2(" Your " + target.skin() + " is secreting");
		if(target.hasSkinFlag(GLOBAL.FLAG_APHRODISIAC_LACED))output2(" an aphrodisiac sweat");
		else output2(" a constant layer of lubrication");
		output2(", giving it a slick oiled shine.");
	}
	// Muscles - Sweaty ( Shazam Remix )
	else if(target.hasStatusEffect("Sweaty"))
	{
		output2(" In addition, your body");
		if(target.statusEffectv1("Sweaty") <= 1) output2(" is sprinkled with a light layer");
		else if(target.statusEffectv1("Sweaty") <= 2) output2(" glistens with visible layers");
		else if(target.statusEffectv1("Sweaty") <= 4) output2(" is covered in multiple layers");
		else output2(" looks soaked, completely drenched in thick layers");
		output2(" of sweat, signaling the exertion of your previous physical activities.");
	}
	// Roehm Goo
	if(target.hasStatusEffect("Roehm Slimed"))
	{
		output2(" Oozing off your body is a");
		if(target.statusEffectv4("Roehm Slimed") <= 1) output2(" thin layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 2) output2(" slick layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 3) output2(" thick layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 4) output2(" steady stream");
		else output2(" flowing blob");
		output2(" of sexually charged, saccharine slug slime - an obvious signature of a Roehm encounter, no doubt.");
	}
	// Pheromones
	if(target.hasPheromones()) output2(" " + ((target.hasPerk("Pheromone Sweat") && target.skinIsSoaked()) ? "Your entire body emits" : "Parts of your body emit") + " " + RandomInCollection(["aphrodisiac-laced", "lust-scented", "musky", "aromatic"]) + " pheromones, enticing potential mates.");
	
	// ARMS
	switch(target.armType)
	{
		//Wing arms
		case GLOBAL.TYPE_AVIAN:
			if(target.hasArmFlag(GLOBAL.FLAG_PAWS))
			{
				output2(" Your hands are tipped with sharp claws, like that of a bird, with");
				if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.hasFeathers()) output2(" rough skin,");
				output2(" short palms and long, padded fingers.");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Feather-shaped shingles of goo");
				else output2(" A feathery fringe");
				output2(" covers them down to your " + (target.hasArmFlag(GLOBAL.FLAG_FLUFFY) ? "wrists" : "elbows") + ", leaving your hands bare.");
			}
			else
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Feather-shaped shingles of goo");
				else output2(" Feathers");
				output2(" hang off your arms from shoulder to wrist, giving them a slightly wing-like look.");
			}
			break;
		case GLOBAL.TYPE_LEITHAN:
			output2(" Small claws protrude from the tips of your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" fingers in place of fingernails");
			if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) output2(", and your arms are covered from fingertip to elbow with a thick layer of chitinous plates");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(", and your arms are covered in scales up to the shoulders");
			output2(".");
			break;
		case GLOBAL.TYPE_EQUINE:
			output2(" Hard, hoof-like tips have grown in place of fingernails, covering the end of each");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" digit in shiny black. You can still feel through them all the same.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_VULPINE:
		case GLOBAL.TYPE_LUPINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			if(target.hasArmFlag(GLOBAL.FLAG_PAWS)) output2(" Soft pads rest on the tips of each of your fingers. ");
			if(target.armType == GLOBAL.TYPE_LUPINE) output2(" Your fingers are tipped with thick, canine claws as well");
			else output2(" Your fingers are tipped with short, canine claws as well");
			if(target.armType == GLOBAL.TYPE_CANINE && !target.hasArmFlag(GLOBAL.FLAG_PAWS)) output2(", just like one of the ausar");
			output2(".");
			break;
		case GLOBAL.TYPE_DEMONIC:
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			else output2(" human-shaped");
			output2(" hands appear very demonic, tipped with sharp claws that seem to have replaced your fingernails.");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY) && target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) output2(" In addition, your forearms are covered by sleek plates of hardened goo along the outside of each arm. Smaller pentagonal plates trail up your upper arms and over your shoulders.");
			else if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) output2(" In addition, your forearms are covered by sleek plates of jet-black chitin along the outside of each arm. Smaller pentagonal plates trail up your upper arms and over your shoulders.");
			else if(target.hasArmFlag(GLOBAL.FLAG_SPIKED)) output2(" In addition, a set of short jet-black bone spikes grow along the outside of each forearm and out of the back of your elbows, giving you an incredibly imposing look.");
			break;
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_DRIDER:
		case GLOBAL.TYPE_BEE:
		case GLOBAL.TYPE_NYREA:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Shiny hardened " + target.scaleColor + " goo covers your arms from the biceps down, resembling a pair of long " + target.scaleColor + " gloves from a distance.");
			else output2(" Shining black exoskeleton covers your arms from the biceps down, resembling a pair of long black gloves from a distance.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0) output2(" Your arms are almost skeletal, a fine exoskeleton of " + target.scaleColor + " " + (target.hasArmFlag(GLOBAL.FLAG_GOOEY) ? "goo" :"chitin") + " giving them a spindly look.");
			else output2(" Your lithe, graceful arms and hands are deceptively sturdy and covered in " + target.scaleColor + " " + (target.hasArmFlag(GLOBAL.FLAG_GOOEY) ? "goo" :"chitin") + ".");
			break;
		case GLOBAL.TYPE_MYR:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Shiny hardened " + target.scaleColor + " goo");
			else output2(" Shining " + target.scaleColor + " exoskeleton");
			output2(" covers parts of your arms in a gleaming patchwork.");
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" hands are " + (target.hasArmFlag(GLOBAL.FLAG_PAWS) ? "somewhat paw-like" : "still largely human") + " in shape and dexterity " + (target.hasArmFlag(GLOBAL.FLAG_PAWS) ? "with" : "aside from the") + " fairly feline claws that have replaced your fingernails.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" fingers are thick and capped with bear-like claws but maintain their human opposability.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) output2(" A fluffy layer of solid " + target.furColor + " fur covers your arms.");
			output2(" " + RandomInCollection([
				"Each of your arms are tipped with broad, bear-like paws",
				"Your fingers are tipped with cute, bear-like paw pads",
				"The palms of your hands, as well as your fingers are adorned with soft and cute pads"
			]) + ".");
			break;
		case GLOBAL.TYPE_KUITAN:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms end with gel-padded fingers. ");
			else if(!target.hasFur()) output2(" Dark brown pads rest on the tips of each of your fingers. ");
			else output2(" A coat of " + target.furColor + " fur covers your arms below the shoulders, and your fingers are tipped with dark brown pads. ");
			output2("They’re softer and more supple than the finest leather.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.hasArmFlag(GLOBAL.FLAG_THICK)) 
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your thick, gooey arms ");
				else output2(" Your thick, fur-covered arms ");
				output2("end with broad forearms and big fingers. In contrast, delicate pads line the underside.");
			}
			else
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms ");
				else output2(" Your furry arms ");
				output2("end with small, delicate paws. Each finger has a soft pad on the underside as well. You couldn’t ask for a less threatening pair of mits.");
			}
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms are tipped with clawed fingers.");
			else if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of thick " + target.furColor + " fur covers your arms while claws tip your fingers.");
			else output2(" Claws tip your fingers.");
			output2(" These claws aren’t very long or sharp, and you get the feeling that the only thing they’re truly useful for is digging into someone’s skin emphatically while you’re fucking them roughly.");
			break;
		case GLOBAL.TYPE_SIMII:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms end with large hands.");
			else if(!target.hasFur() && !target.hasArmFlag(GLOBAL.FLAG_FURRED))
			{
				if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" A visible patch of hair covers your arms and over the top of your large hands.");
				else output2(" Your arms end with large hands.");
			}
			else output2(" A coat of " + target.furColor + " fur covers your arms and over the top of your large hands.");
			break;
		case GLOBAL.TYPE_FROG:
			if(!target.hasFur() || !target.hasFeathers()) output2(" Your arms are incredibly smooth with a tendency to glisten in the light.");
			output2(" Your webbed hands are very amphibious in appearance. Each of your elongated fingers are capped with a round bulb, capable of sticking to flat surfaces like a suction cup.");
			break;
		case GLOBAL.TYPE_OVIR:
			output2(" Your arms and hands appear very human");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasArmFlag(GLOBAL.FLAG_SCALED) || target.hasArmFlag(GLOBAL.FLAG_GOOEY))
			{
				output2(", if not for them being covered in");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				output2(" " + target.scaleColor + " scales, giving them a subtle reptilian feel");
			}
			output2(".");
			break;
		case GLOBAL.TYPE_FLOWER:
			if(rand(2) == 0)
			{
				output2(" Ivy-like creepers crawl down the upper parts of your arms, festooning them in dark green leaves.");
				if(target.hasStatusEffect("Arm Flower")) output2(" They have additionally sprouted small " + target.getStatusTooltip("Arm Flower") + " flowers, proclaiming to the world that you are in need of pollination.");
			}
			else
			{
				output2(" Your biceps and shoulders are covered in delicate vines. The spade-like leaves bob as you move");
				if(target.hasStatusEffect("Arm Flower")) output2(", as do the small " + target.getStatusTooltip("Arm Flower") + " flowers you’re displaying up there");
				output2(".");
			}
			break;
		case GLOBAL.TYPE_SIREN:
			output2(" Your arms and hands appear very human");
			if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasArmFlag(GLOBAL.FLAG_FEATHERED) || target.hasArmFlag(GLOBAL.FLAG_GOOEY))
			{
				output2(", if not for them being");
				if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output2(" completely");
				output2(" covered in");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				output2(" " + target.furColor + " vestigial feathers");
				if(target.skinType != GLOBAL.SKIN_TYPE_FEATHERS && target.hasArmFlag(GLOBAL.FLAG_FEATHERED)) output2(" from elbow to wrist -- looking very much like natural arm warmers and");
				else output2(",");
				output2(" incapable of flight");
			}
			output2(".");
			break;
		case GLOBAL.TYPE_SHARK:
			output2(" From the elbows of your ");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2("gooey arms there are small, piscine fins that are constantly drip with ooze.");
			else
			{
				if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) output2("slick, ");
				if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(target.furColor + " furred arms there are small, piscine fins.");
				else output2(target.scaleColor + " scaled arms there are small, piscine fins.");
			}
			output2(" Your fingers are tipped with sharp black claws and are connected by webbing, perfect for giving you extra momentum while swimming.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			output2(" Your arms are actually bunches of tentacles, formed together into arm-like shapes. They end in long, wiggly tentacle fingers.");
			break;
		// Catch all
		default:
			if(target.hasArmFlag(GLOBAL.FLAG_FURRED))
			{
				output2(" Your arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) output2(" fluffy");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) output2(" thick");
				else output2(" light");
				output2(" layer of fur.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_SCALED))
			{
				output2(" Your arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_THICK)) output2(" thick");
				else if(target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) output2(" smooth");
				else output2(" light");
				output2(" layer of scales.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS))
			{
				output2(" Your arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_THICK)) output2(" thick");
				else if(target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) output2(" smooth");
				else output2(" light");
				output2(" layer of chitin.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_FEATHERED))
			{
				output2(" Your arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) output2(" fluffy");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) output2(" thick");
				else output2(" light");
				output2(" layer of feathers.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_GOOEY) && target.armType != GLOBAL.TYPE_GOOEY)
			{
				output2(" Your arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_AMORPHOUS)) output2("n amorphous");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) output2(" thick");
				else output2(" thin");
				output2(" layer of goo.");
			}
			break;
	}
	if(target.hasStatusEffect("Mimbrane Hand Left") || target.hasStatusEffect("Mimbrane Hand Right"))
	{
		var bothHands:Boolean = false;
		feedVal = 0;

		if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right")) bothHands = true;
		
		if(!bothHands)
		{
			if(target.hasStatusEffect("Mimbrane Hand Left")) feedVal = target.statusEffectv3("Mimbrane Hand Left");
			else feedVal = target.statusEffectv3("Mimbrane Hand Right");
		}
		else
		{
			//The feed values should be synced for hands, so use one of them!
			feedVal = target.statusEffectv3("Mimbrane Hand Right");
		}

		if(feedVal >= 3)
		{
			output2(" Your hand");
			if(bothHands) output2("s");
			output2(" appear");
			if(!bothHands) output2("s");
			if(feedVal < 8) output2(" to be slightly distended.");
			else if(feedVal < 13) output2(" puffy and inflated.");
			else output2(" unusually large, almost engorged.");
		}
	}
	
	//Done with head bits. Move on to body stuff
	//Horse legType, other legType texts appear lower
	if(target.legType == GLOBAL.TYPE_MLP)
	{
		output2(" From the waist down, you have an incredibly cute and cartoonish parody of a horse’s body, with");
		if(target.legCount == 2) output2(" both legs");
		else output2(" all " + num2Text(target.legCount) + " legs");
		output2(" ending in flat, rounded hooves.");
	}
	else if(target.legType == GLOBAL.TYPE_LIZAN && target.legCount == 6) output2(" From the waist down, you have a powerful, " + num2Text(target.legCount) + "-legged body that looks like a crossbreed of a lizard and a horse.");
	else if(target.legType == GLOBAL.TYPE_AVIAN && target.isTaur()) output2(" From the waist down you possess a sleek, " + num2Text(target.legCount) + "-legged body, appearing much like a crossbreed between a bird and that of an equine."); 
	else if(target.isTaur())
	{
		output2(" From the waist down, you have a bestial, " + num2Text(target.legCount) + "-legged form vaguely like that of a");
		switch(target.legType)
		{
			case GLOBAL.TYPE_DEER:
				output2(" deer"); break;
			case GLOBAL.TYPE_BOVINE:
			case GLOBAL.TYPE_GOAT:
				output2(" bovid"); break;
			case GLOBAL.TYPE_CANINE:
			case GLOBAL.TYPE_VULPINE:
			case GLOBAL.TYPE_LUPINE:
			case GLOBAL.TYPE_TANUKI:
			case GLOBAL.TYPE_KORGONNE:
				output2(" canid"); break;
			case GLOBAL.TYPE_FELINE:
				output2(" felid"); break;
			case GLOBAL.TYPE_PANDA:
				output2("n ursid"); break;
			case GLOBAL.TYPE_LAPINE:
				output2(" lagomorph"); break;
			case GLOBAL.TYPE_BADGER:
			case GLOBAL.TYPE_REDPANDA:
				output2(" mustelid"); break;
			case GLOBAL.TYPE_MOUSE:
				output2(" rodent"); break;
			case GLOBAL.TYPE_FROG:
				output2("n amphibian"); break;
			case GLOBAL.TYPE_LIZAN:
				output2(" lizard"); break;
			case GLOBAL.TYPE_SHARK:
				output2(" shark"); break;
			default:
				output2(" horse"); break;
		}
		output2(".");
	}
	//Hip info only displays if you aren't a centaur.
	var hipRating:Number = target.hipRating();
	if(!target.isTaur()) {
		if(target.thickness > 70) {
			output2(" You have " + target.hipsDescript());
			if(hipRating < 6) {
				if(target.tone < 65) output2(" buried under a noticeable muffin-top, and");
				else output2(" that blend into your pillar-like waist, and");
			}
			else if(hipRating < 10) output2(" that blend into the rest of your thick form, and");
			else if(hipRating < 15) output2(" that would be much more noticeable if you weren’t so wide-bodied, and");
			else if(hipRating < 20) output2(" that sway and emphasize your thick, curvy shape, and");
			else output2(" that sway hypnotically on your extra-curvy frame, and");
		}
		else if(target.thickness < 30) {
			output2(" You have " + target.hipsDescript());
			if(hipRating < 6) output2(" that match your trim, lithe body, and");
			else if(hipRating < 10) output2(" that sway to and fro, emphasized by your trim body, and");
			else if(hipRating < 15) output2(" that swell out under your trim waistline, and");
			else if(hipRating < 20) output2(", emphasized by your narrow waist, and");
			else output2(" that swell disproportionately wide on your lithe frame, and");
		}
		//STANDARD
		else {
			output2(" You have " + target.hipsDescript());
			if(hipRating < 6) output2(", and");
			else if(target.femininity > 50) {
				if(hipRating < 10) output2(" that draw the attention of those around you, and");
				else if(hipRating < 15) output2(" that make you move with a sexy, swinging gait, and");
				else if(hipRating < 20) output2(" that make it look like you’ve birthed many children, and");
				else output2(" that make you look more like an animal waiting to be bred than any kind of human, and");
			}
			else {
				if(hipRating < 10) output2(" that give you a graceful stride, and");
				else if(hipRating < 15) output2(" that add a little feminine swing to your gait, and");
				else if(hipRating < 20) output2(" that force you to sway and wiggle as you move, and");
				else {
					output2(" that give your ");
					if(target.balls > 0) output2("balls plenty of room to breathe");
					else if(target.hasCock()) output2(target.multiCockDescript() + " plenty of room to swing");
					else if(target.hasVagina()) output2(target.vaginasDescript() + " a nice, wide berth");
					else output2("vacant groin plenty of room");
					output2(", and");
				}
			}
		}
	}
	//ASS
	//Horse version
	var buttRating:Number = target.buttRating();
	if(target.isTaur()) {
		//FATBUTT
		if(target.tone < 65 || target.hasSoftButt()) {
			output2(" Your " + target.buttDescript());
			if(buttRating < 4) output2(" is lean, from what you can see of it.");
			else if(buttRating < 6) output2(" looks fairly average.");
			else if(buttRating < 10) output2(" is fairly plump and healthy.");
			else if(buttRating < 15) output2(" jiggles a bit as you trot around.");
			else if(buttRating < 20) output2(" jiggles and wobbles as you trot about.");
			else if(buttRating < 25) output2(" is eye-drawing in the extreme, particularly when it keeps wobbling long after you stop trotting around.");
			else output2(" is obscenely large, bordering freakish, even for a tauric being.");
		}
		//GIRL LOOK AT DAT BOOTY
		else {
			output2(" Your " + target.buttDescript());
			if(buttRating < 4) output2(" is barely noticable, showing off the muscles of your haunches.");
			else if(buttRating < 6) output2(" matches your toned, tauric frame quite well.");
			else if(buttRating < 10) output2(" gives hints of just how much muscle you could put into a kick.");
			else if(buttRating < 15) output2(" surges with muscle whenever you trot about.");
			else if(buttRating < 20) output2(" flexes its considerable mass as you move.");
			else if(buttRating < 25) output2(" is stacked with layers of muscle, huge even for a tauric being.");
			else output2(" is stacked with freakish amounts of muscle, so much so that it bulges and flexes obscenely while trotting around.");
		}
	}
	//Non-horse PCs
	else {
		//TUBBY ASS
		if(target.tone < 60 || target.hasSoftButt()) {
			output2(" your " + target.buttDescript());
			if(buttRating < 4) output2(" looks great under your gear.");
			else if(buttRating < 6) output2(" has the barest amount of sexy jiggle.");
			else if(buttRating < 10) output2(" fills out your clothing nicely.");
			else if(buttRating < 15) output2(" wobbles enticingly with every step.");
			else if(buttRating < 20) output2(" wobbles like a bowl full of jello as you [target.walk].");
			else if(buttRating < 25) output2(" is eye-catching in the extreme, wobbling hypnotically long after you stop moving.");
			else output2(" is obscenely large, bordering freakish, and makes it difficult to run.");
		}
		//FITBUTT
		else {
			output2(" your " + target.buttDescript());
			if(buttRating < 4) output2(" molds closely against your form.");
			else if(buttRating < 6) output2(" contracts with every motion, displaying the detailed curves of its lean musculature.");
			else if(buttRating < 10) 
			{
				if(!target.isAssExposed()) output2(" fills out your clothing nicely.");
				else output2(" is a nice, big canvas for displaying your well-developed musculature.");
			}
			else if(buttRating < 15) 
			{
				if(!target.isAssExposed()) output2(" stretches your gear, flexing it with each step.");
				else output2(" is big enough to draw the eye and strong enough to crush any hand daring enough to try for a grope.");
			}
			else if(buttRating < 20) 
			{
				if(!target.isAssExposed()) output2(" threatens to bust out from under your kit each time you clench it.");
				else output2(" flexes delightfully with every move you make. Any clothing you put over it would be in immediately danger of splitting in half.");
			}
			else if(buttRating < 25) output2(" is obscenely large and completely stacked with muscle.");
			else output2(" strains your ability to comprehend its size and near-freakish levels of muscular development.");
		}
	}
	// Extra hip blurbs
	if(hipRating >= 25 && target.hasLegs()) {
		if(rand(2) == 0) output2(" Your broad hips are so distended that someone could slide their head between the gap in your " + target.thighsDescript() + " where you stand. You wouldn’t even have to move a muscle.");
		else output2(" Your mammoth hips swing widely from side-to-side with every step you take. You have no hope of walking normally, the closest you could come would be a sashay.");
	}
	
	//Tramp Stamps
	if(target.hasPerk("Barcoded"))
	{
		if(rand(2) == 0) output2(" There’s a barcode on your left butt cheek, forever marking you as the property of Belle and Accu-Pitch Labs.");
		else output2(" On one of your ass cheeks is a barcode, placed there by Dr. Belle for her scientific research, and to remind you of your place as her pet.");
	}
	if(target.hasPerk("Slut Stamp")) output2(" To highlight your vulgarity, a tattoo is permanently printed on your lower back, advertising how much of a slut you are to anyone who sees it.");
	
	//TAILS
	switch(target.tailType)
	{
		case GLOBAL.TYPE_EQUINE:
			output2(" A long " + target.hairColor + " horsetail hangs from your " + target.buttDescript() + ", smooth and shiny.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_DOGGIE:
		case GLOBAL.TYPE_LUPINE:
			if(target.tailCount == 1)
			{
				output2(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output2(" long,");
				else if(target.tailType == GLOBAL.TYPE_DOGGIE) output2(" cute,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				else output2(" fuzzy");
				output2(" " + target.furColor + " ");
				if(target.tailType == GLOBAL.TYPE_LUPINE) output2("wolf-");
				else output2("dog");
				output2("tail sprouts just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output2(" long,");
				else if(target.tailType == GLOBAL.TYPE_DOGGIE) output2(" cute,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				else output2(" fuzzy");
				output2(" " + target.furColor + " ");
				if(target.tailType == GLOBAL.TYPE_LUPINE) output2("wolf-");
				else output2("dog");
				output2("tails sprout just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
			}
			break;
		case GLOBAL.TYPE_KORGONNE:
			if(target.tailCount == 1)
			{
				output2(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output2(" long,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				else output2(" curly");
				output2(" " + target.furColor + " ");
				output2("dog-");
				output2("tail sprouts just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output2(" long,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
				else output2(" curly");
				output2(" " + target.furColor + " ");
				output2("dog-");
				output2("tails sprout just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
			}
			break;
		case GLOBAL.TYPE_DEMONIC:
			if(target.tailCount == 1) output2(" A narrow tail ending in a spaded tip curls down from your " + target.buttDescript() + ", wrapping around your " + target.leg() + " sensually at every opportunity.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " narrow tails curl down from your " + target.buttDescript() + ", each ending in a spaded tip. They sensually wrap around your " + target.leg() + " at every opportunity.");
			
			break;
		case GLOBAL.TYPE_BOVINE:
			if(target.tailCount == 1)
			{
				output2(" A long cow tail with a");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" voluminous");
				else output2(" puffy");
				output2(" tip swishes back and forth as if swatting at flies.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " long cow tails with");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" voluminous");
				else output2(" puffy");
				output2(" tips swish back and forth as if swatting at flies.");
			}
			break;
		case GLOBAL.TYPE_SHEEP:
			if(target.tailCount == 1) output2(" A small lamb-like tail sprouts from your backside.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " small, lamb-like tails sprout from your backside.");
			break;
		case GLOBAL.TYPE_DRIDER:
		case GLOBAL.TYPE_ARACHNID:
			output2(" A large, spherical spider-abdomen has grown out from your backside, covered in shiny");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" hardened " + target.scaleColor + " goo");
			else output2(" black chitin");
			output2(". Though it’s heavy and bobs with every motion, it doesn’t seem to slow you down.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" Your bulging arachnid posterior feels fairly full of webbing.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Your arachnid rear bulges and feels very full of webbing.");
			if(target.tailVenom == 100) output2(" Your swollen spider-butt is distended with the sheer amount of webbing it’s holding.");
			*/
			break;
		case GLOBAL.TYPE_BEE:
			output2(" A large, insectile abdomen dangles from just above your backside, bobbing with its own weight as you shift. It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("ened " + target.scaleColor + " goo");
			else output2(" black chitin");
			output2(" and tipped with a needle-like stinger.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" A single drop of poison hangs from your exposed stinger.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Poisonous bee venom coats your stinger completely.");
			if(target.tailVenom == 100) output2(" Venom drips from your poisoned stinger regularly.");
			*/
			break;
		case GLOBAL.TYPE_MYR:
			output2(" A large, insectile abdomen dangles from just above your backside, bobbing with its own weight as you shift. It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("ened " + target.scaleColor + " goo");
			else output2(" " + target.scaleColor + " chitin");
			output2(" that is smooth to the touch.");
			break;
		case GLOBAL.TYPE_SHARK:
		case GLOBAL.TYPE_SIREN:
			output2(" A long, shark-tail trails down from your backside, swaying to and fro while ");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("dripping goo everywhere.");
			else output2("giving you a dangerous air.");
			output2(" Halfway across it grows a smaller dorsal fin.");
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.tailCount == 1)
			{
				output2(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else if(target.hasTailFlag(GLOBAL.FLAG_FURRED) || target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) output2(" soft " + target.furColor);
				else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) output2(" scaled " + target.scaleColor);
				output2(" cat-tail sprouts just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else if(target.hasTailFlag(GLOBAL.FLAG_FURRED) || target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) output2(" soft, " + target.furColor);
				else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) output2(" scaled, " + target.scaleColor);
				output2(" cat-tails sprout just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
			break;
		case GLOBAL.TYPE_LIZAN:
			output2(" A tapered tail hangs down from just above your " + target.buttDescript() + ". It sways back and forth, assisting you with keeping your balance.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.tailCount == 1)
			{
				output2(" A short,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else output2(" soft");
				output2(" bunny tail sprouts just above your " + target.buttDescript() + ", twitching constantly whenever you’re distracted.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " short,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else output2(" soft");
				output2(" bunny tails sprout just above your " + target.buttDescript() + ", twitching constantly whenever your attention is elsewhere. Or whenever they want, really. It’s hard to control that many rebellious little poofs.");
			}
			break;
		case GLOBAL.TYPE_AVIAN:
			output2(" A tail of");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" feathers fans out from just above your " + target.buttDescript() + ", twitching instinctively to help guide you if you were to take flight.");
			break;
		case GLOBAL.TYPE_KANGAROO:
			output2(" A conical, ");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("gooey, " + target.skinTone);
			else output2("furry, " + target.furColor);
			output2(" tail extends from your " + target.buttDescript() + ", bouncing up and down as you move and helping to counterbalance you.");
			break;
		case GLOBAL.TYPE_VULPINE:
			if(target.tailCount == 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" A swishing fox tail extends from your " + target.buttDescript() + ", curling around your body, all slick and shiny.");
				else output2(" A swishing, " + target.furColor + " fox tail extends from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
			}
			else
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing fox tails extend from your " + target.buttDescript() + ", curling around your body, all slick and shiny.");
				else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing, " + target.furColor + " fox tails extend from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
			}
			break;
		case GLOBAL.TYPE_DRACONIC:
			output2(" A thin,");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			else output2(" scaly");
			output2(", prehensile reptilian tail, almost as long as you are tall, swings behind you like a living bullwhip. Its tip menaces with spikes of bone, meant to deliver painful blows.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			output2(" A tapered, prehensile tail, almost as long as you are tall, swings behind you like a living bullwhip. Softly rounded at its tip, it quickly increases in girth closer to your body - almost as thick as your waist at its widest. The " + target.scaleColor + " scales sheathing your hefty tail’s length merge seamlessly with those of your lower back.");
			break;
		case GLOBAL.TYPE_KUITAN:
			if(target.furColor == "black") output2(" A solid-black kui-tan tail waves behind you.");
			else output2(" A black-and-" + target.furColor + "-ringed kui-tan tail waves behind you.");
			break;
		case GLOBAL.TYPE_DEER:
			output2(" A short");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" nub");
			else output2(" tuft");
			output2(" of deer tail sprouts just above your " + target.buttDescript() + ", sometimes twitching at the slightest movements.");
			break;
		case GLOBAL.TYPE_MOUSE:
			output2(" A naked, " + target.skinTone + " mouse tail pokes from your butt, dragging on the ground and twitching occasionally.");
			break;
		case GLOBAL.TYPE_CUNTSNAKE:
			var cuntSnakeTexture:String = "";
			
			var cuntSnakeAdjectives:Array = [];
			if(target.hasTailFlag(GLOBAL.FLAG_SMOOTH)) cuntSnakeAdjectives.push("smooth");
			if(target.hasTailFlag(GLOBAL.FLAG_STICKY)) cuntSnakeAdjectives.push("sticky");
			if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY))
			{
				if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) cuntSnakeAdjectives.push("fluffy");
				if(target.hasTailFlag(GLOBAL.FLAG_FEATHERED)) cuntSnakeAdjectives.push("downy");
			}
			if(cuntSnakeAdjectives.length > 0) cuntSnakeTexture += RandomInCollection(cuntSnakeAdjectives) + ", ";
			
			if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) cuntSnakeTexture += target.furColor + " fur";
			else if(target.hasTailFlag(GLOBAL.FLAG_FEATHERED)) cuntSnakeTexture += target.furColor + " feathers";
			else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) cuntSnakeTexture += target.scaleColor + " scales";
			else if(target.hasTailFlag(GLOBAL.FLAG_CHITINOUS)) cuntSnakeTexture += target.scaleColor + " chitin";
			else if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) cuntSnakeTexture += target.skinTone + " goo";
			else cuntSnakeTexture += target.skinFurScales(true) + " like the rest of you";
			
			if(target.tailCount <= 1) output2(" A sinuous, almost snake-like tail waves behind you, covered in " + cuntSnakeTexture + " except at the tip. There, it terminates in " + indefiniteArticle(target.tailVaginaDescript(false, true, true)) + " that always seems to crave fresh sperm.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " sinuous, almost snake-like tails wave behind you, covered in " + cuntSnakeTexture + " except at the tip. There, they terminate in " + plural(target.tailVaginaDescript(false, true, true)) + " that always seem to crave fresh sperm.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" A short, slimy panda tail sprouts just above your " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a gooey little accent.");
			else output2(" A short, soft panda tail sprouts just above your " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a furry little accent.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.tailCount <= 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) output2(" A long, bushy " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda tail sprouts from your backside. Its " + target.furColor + " ringed pattern is a hypnotizing sight to behold.");
				else if(rand(2) == 0) output2(" A long furry tail hangs from your backside. Its " + target.furColor + " ringed pattern is a hypnotizing sight to behold.");
				else output2(" A long, " + target.furColor + " ringed tail waves behind you.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " long");
				if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) output2(", bushy " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda tails sprout from your backside. Their " + target.furColor + " ringed patterns are a hypnotizing sight to behold.");
				else if(rand(2) == 0) output2(" furry tails hangs from your backside. Their " + target.furColor + " ringed patterns are a hypnotizing sight to behold.");
				else output2(", " + target.furColor + " ringed tails wave behind you.");
			}
			break;
		case GLOBAL.TYPE_RASKVEL:
			if(target.tailCount == 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" A gooey reptilian " + target.scaleColor + " tail sprouts just above your " + target.buttDescript() + ", dangling behind you.");
				else output2(" A scaled " + target.scaleColor + " tail sprouts just above your " + target.buttDescript() + ", dangling behind you. Softer, lighter scales cover its bottom.");
			}
			else
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " gooey reptilian " + target.scaleColor + " tails sprout just above your " + target.buttDescript() + ", all dangling behind you.");
				else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " scaled " + target.scaleColor + " tails sprout just above your " + target.buttDescript() + ", their undersides covered with softer, lighter scales.");
			}
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.tailCount == 1)
			{
				output2(" A little");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy " + target.furColor + " nub");
				else output2(" fluffy " + target.furColor + " tuft");
				output2(" dangles atop your" + target.buttDescript() + ". It mischievously flicks back and forth from time to time.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy little " + target.furColor + " nubs");
				else output2(" fluffy little " + target.furColor + " tufts");
				output2(" dangle atop your" + target.buttDescript() + ". They mischievously flick back and forth from time to time.");
			}
			break;
		case GLOBAL.TYPE_VANAE:
			if(target.tailCount == 1) output2(" Protruding from above your butt, a long, slippery tail wiggles behind you. It is lined with octopus-like suckers on the bottom, very much like a tentacle of some underwater... or perhaps tree-dwelling, creature.");
			else output2(" Protruding from above your butt, " + num2Text(target.tailCount) + " long, slippery tails wiggle behind you. They are lined with octopus-like suckers on the bottom, very much like the tentacles of some underwater... or perhaps tree-dwelling, creature.");
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.tailCount == 1) output2(" A thick, reptilian tail dangles behind you, swaying as a living counterbalance.");
			else
			{
				output2(StringUtil.upperCase(num2Text(target.tailCount)) + " thick, reptilian tails dangle behind you, swaying like living counterbalance. It’s difficult to keep the thick appendages from idly squirming");
				if(!target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" their scales");
				output2(" against one another.");
			}
			break;
		case GLOBAL.TYPE_COCKVINE:
			var cockvineTexture:String = "";
			
			var cockvineAdjectives:Array = [];
			if(target.hasTailFlag(GLOBAL.FLAG_SMOOTH)) cockvineAdjectives.push("smooth");
			if(target.hasTailFlag(GLOBAL.FLAG_STICKY)) cockvineAdjectives.push("sticky");
			if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY))
			{
				if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) cockvineAdjectives.push("fluffy");
				if(target.hasTailFlag(GLOBAL.FLAG_FEATHERED)) cockvineAdjectives.push("downy");
			}
			if(cockvineAdjectives.length > 0) cockvineTexture += RandomInCollection(cockvineAdjectives) + ", ";
			
			if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) cockvineTexture += target.furColor + " fur";
			else if(target.hasTailFlag(GLOBAL.FLAG_FEATHERED)) cockvineTexture += target.furColor + " feathers";
			else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) cockvineTexture += target.scaleColor + " scales";
			else if(target.hasTailFlag(GLOBAL.FLAG_CHITINOUS)) cockvineTexture += target.scaleColor + " chitin";
			else if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) cockvineTexture += target.skinTone + " goo";
			else if(target.skinType == GLOBAL.SKIN_TYPE_LATEX) cockvineTexture += target.skinTone + " latex";
			else cockvineTexture += target.skinTone + " skin";
			
			if(target.tailCount == 1) output2(" A writhing, sinuous appendage flows after you, bobbing and undulating with the slightest movement of your hips.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " writhing, sinuous appendages flow after you, all similar in appearance. Studying one of them, you see that it appears vine-like though very much alive and moving.");
			
			// Cockvine
			if(target.tailGenitalArg == GLOBAL.TYPE_COCKVINE && !target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				output2(" a proud purple head that’s distinctly cock-shaped in nature.");
			}
			// Horse
			else if(target.tailGenitalArg == GLOBAL.TYPE_EQUINE)
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a girthy, flared tip, distinctly reminiscent of");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor));
				else output2(" a");
				output2(" horse-cock.");
			}
			// Human
			else if(target.tailGenitalArg == GLOBAL.TYPE_HUMAN)
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a fleshy");
				if(target.tailGenitalColor != "") output2(" " + target.tailGenitalColor);
				else output2(" pink");
				output2(" head that’s distinctly cock-shaped in nature.");
			}
			// Bulbous
			else if(target.tailGenitalArg == GLOBAL.TYPE_CANINE)
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a thick bulge a few inches below a tapered,");
				if(target.tailGenitalColor != "") output2(" " + target.tailGenitalColor);
				else output2(" dark-red");
				output2(" tip.");
			}
			// Demonic
			else if(target.tailGenitalArg == GLOBAL.TYPE_DEMONIC)
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a thick bulge at the base and");
				if(target.tailGenitalColor != "") output2(" " + indefiniteArticle(target.tailGenitalColor));
				else output2(" a dark purple");
				output2(" shaft lined with sensitive nodules up to the tip.");
			}
			// Ribbed
			else if(target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				output2(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				output2(" a series of noticeable ridges that gradually thin as they appear closer to the tip.");
			}
			break;
		case GLOBAL.TYPE_FROG:
			output2(" Your stubby frog tail wiggles around at the back of your waist, just asking to be squeezed.");
			break;
		case GLOBAL.TYPE_SWINE:
			output2(" A curly, little pig tail sticks out above your " + target.buttDescript() + ", twirling when you’re happy.");
			break;
		case GLOBAL.TYPE_SIMII:
			output2(" Peeking out from behind, you have");
			if(target.tailCount == 1) output2(" a long, prehensile monkey tail that sways");
			else output2(" " + num2Text(target.tailCount) + " long, prehensile monkey tails that sway");
			output2(" to and fro with curiosity.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			if(target.tailCount == 1) output2(" A long, writhing, tentacle-like tail flows after you, bobbing and undulating with the slightest movement of your hips.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " long, writhing, tentacle tails flow after you, all similar in appearance. Studying one of them, you find that you have excellent control over their movements."); 
			break;
	}
	//Tail cunts
	if(target.hasTailCunt() && target.tailType != GLOBAL.TYPE_CUNTSNAKE)
	{
		output2(" When aroused, " + (target.tailCount <= 1 ? "its tip opens" : "the tip of each one will open") + " to reveal " + indefiniteArticle(target.tailVaginaDescript()));
		if(target.hasParasiteTail()) output2(" that always seems to crave fresh sperm");
		output2(".");
	}
	//Tail cocks
	if(target.hasTailCock() && target.tailType != GLOBAL.TYPE_COCKVINE)
	{
		output2(" When aroused, " + (target.tailCount <= 1 ? "its tip opens" : "the tip of each one will open") + " to reveal " + indefiniteArticle(target.tailCockDescript()));
		if(target.hasParasiteTail()) output2(" that always seems primed for breeding");
		output2(".");
	}
	//Ovipositor
	if(target.hasTailOvipositor())
	{
		output2(" In addition,");
		if(target.tailCount == 1) output2(" it is an organ");
		else output2(" your [target.tails] are organs");
		output2(" capable of laying eggs into an orifice.");
	}
	
	//LEGS
	//legType notez!
	//Horse body is placed higher for readability purposes
	switch(target.legType)
	{
		case GLOBAL.TYPE_HUMAN:
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? " gooey" : " normal") + " human legs extend below your waist, ending in normal human feet.");
			else output2(" You have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "normal") + " human legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_MYR:
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs extend below your waist, covered in numerous " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "semi-solid" : "chitin") + " plates all the way to your feet.");
			else output2(" You have human-like legs that end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened" : "chitinous") + " feet.");
			break;
		case GLOBAL.TYPE_EQUINE:
		case GLOBAL.TYPE_BOVINE:
			if(target.legCount == 2) output2(" Your legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in a pair of bestial hooves.");
			else if(target.legCount < 4) output2(" Your legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in bestial hooves.");
			else output2(" You have oddly-jointed legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_DEER:
			if(target.legCount < 4) output2(" Your legs are lithe and agile, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in hooves");
			else output2(" You have " + (rand(2) == 0 ? "thin, deer-like legs that are capped with" : "lithe, agile legs that end in") + " hooves");
			output2(", enabling you to nimbly leap and prance from place to place.");
			break;
		case GLOBAL.TYPE_SHEEP:
			if(target.thickness >= 50) output2(" Your " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "furry") + ", lamb-like legs end in hooves, allowing you to spring into action at a moment’s notice.");
			else if(target.thickness >= 25) output2(" Your slender, nimble legs end in hooves, allowing you to spring into action at a moment’s notice.");
			else output2(" Your willowy, sheep-like legs are capped off by hooves, allowing you to spring into action at a moment’s notice.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.legCount < 4) 
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in " + target.feet(true, true) + ".");
			}
			else
			{
				output2(" You have");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs that end in " + target.feet(true,true) + ".");
			}
			break;
		case GLOBAL.TYPE_NAGA:
			if(target.legCount == 1) output2(" Below your thighs, your flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between your crotch and [target.asshole]. It is");
			else if(target.legCount < 4) output2(" Below your thighs, " + num2Text(target.legCount) + " wiggling, snake-like appendages allow you to slither around. They are");
			else output2(" You have wiggling snake-like appendages to propel yourself around on, all");
			output2(" covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.scaleColor + "-colored scales") + ".");
			break;
		case GLOBAL.TYPE_SUCCUBUS:
			if(target.legCount < 4) output2(" Your perfectly lissom legs end in mostly human feet, apart from the horn protruding straight down from the heel that forces you to walk with a sexy, swaying gait. Surprisingly your mobility isn’t impaired by having your feet converted into natural high heels, although you are forced to totter about with your upper body thrust forward a little to compensate, leaving you permanently locked into an awkwardly sexy pose.");
			else output2(" You have perfectly lissom legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_DEMONIC:
			if(target.legCount < 4) output2(" Your lithe legs are capped with flexible clawed feet. Sharp black nails grow where once you had toe-nails, giving you fantastic grip.");
			else output2(" You have lithe legs that end in " + target.feet(true,true) + ". Sharp black nails grow in place of toenails.");
			break;
		case GLOBAL.TYPE_BEE:
			output2(" Shimmering, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened goo" : "armor-like chitin") + " girds your legs from your toes to your mid-thigh. The " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "coating is semi-" : "sable material is rock ") + "hard right up until the ring of soft fluff that grows over the uppermost edge.");
			break;
		case GLOBAL.TYPE_GOOEY:
			if(target.legCount == 1)
			{
				// Gel tail
				if(target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) output2(" In place of legs you have a semi-solid, gel-like lower body, shaped into a prehensile mass that bends and twists as you move.");
				// Goo moound
				else
				{
					output2(" In place of legs you have a shifting amorphous blob. Thankfully, it’s quite easy to propel yourself around on.");
					if(target.hasArmor()) output2(" The lowest portions of your " + target.armor.longName + " float around inside you, bringing you no discomfort.");
				}
			}
			else
			{
				// Goo mound
				if(target.hasLegFlag(GLOBAL.FLAG_AMORPHOUS))
				{
					output2(" In place of legs you have a shifting, amorphous blob. It splits apart just beneath your");
					if(target.hasGenitals()) output2(" genitals");
					else output2(" “crotch”");
					output2(" into " + num2Text(target.legCount) + " semi-solid limbs.");
				}
				// Gel legs
				else
				{
					if(target.isTaur()) output2(" Your legs are semi-solid, gel-like and end in " + target.feet());
					else
					{
						output2(" You have " + num2Text(target.legCount) + " semi-solid, gel-like limbs");
						if(target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) output2(", shaped into prehensile masses that bend and twist as you move");
						else if(target.hasLegFlag(GLOBAL.FLAG_TENDRIL)) output2(", shaped into tendrils that wriggle about when you move");
						else
						{
							if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(", shaped into digitigrade legs and");
							else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", shaped into plantigrade legs and");
							output2(" ending in " + target.feet());
						}
					}
					output2(". They are capable of shifting and morphing when you will them to.");
				}
			}
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.isTaur())
			{
				output2(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs end in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
			}
			break;
		case GLOBAL.TYPE_LIZAN:
			if(target.legCount < 4)
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are three long toes on the front and a small hind-claw on the back.");
			}
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with three long toes and a small hind-claw on the back.");
			break;
		case GLOBAL.TYPE_RASKVEL:
			if(target.legCount < 4)
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are four long toes tipping the humanoid soles.");
			}
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with four long toes at the front of the terran-like soles.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.legCount < 4) output2(" Your legs thicken below the waist as they turn into " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-covered" : "soft-furred") + " rabbit-like legs. You even have large bunny feet that make hopping around a little easier than walking.");
			else output2(" You have thick rabbit legs that terminate in " + target.feet(true,true) + ". At least jumping should be a breeze.");
			break;
		case GLOBAL.TYPE_AVIAN:
			output2(" You have powerful thighs perfect for launching you into the air which end in slender bird-like legs, covered with ");
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY))
			{
				output2("feather-shaped shingles of goo down to your " + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? " ankles" : " knees"));
			}
			else
			{
				output2(target.furColor + " plumage down to your " + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? " ankles" : " knees") + " and ");
				if(target.hasFeathers() || target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2("rough, " + target.skinTone + " skin");
				else output2(target.skinFurScales(true, true, true, true));
				output2(" below");
			}
			output2(". Your feet " + (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) ? "are digitigrade, with" : "have") + " long sharp claw-tipped toes.");
			break;
		case GLOBAL.TYPE_KANGAROO:
			if(target.legCount < 4) output2(" Your " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "furry") + " legs have short thighs and long calves, with even longer feet ending in prominently-nailed toes.");
			else output2(" You have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : target.furColor + "-furred") + " legs with short thighs and long calves, perfect for jumping.");
			break;
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_NYREA:
			if(target.legCount == 2) output2(" Your legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to your mid-thigh, looking more like a pair of ‘fuck-me-boots’ than exoskeleton.");
			else if(target.legCount < 4) output2(" Your legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to your mid-thigh, looking more like ‘fuck-me-boots’ than exoskeleton.");
			else output2(" " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "Hardened goo" : "Black chitin") + " covers your legs up to the mid-thigh, looking more like a set of ‘fuck-me-boots’ than insectile armor.");
			break;
		case GLOBAL.TYPE_DRIDER:
			if(target.isTaur()) output2(" Your legs are long and spindly, sprouting outwards from your sides like a spider.");
			else output2(" Where your legs would normally start you have grown the body of a spider, with " + num2Text(target.legCount) + " spindly legs that sprout from its sides.");
			break;
		case GLOBAL.TYPE_MYR:
			output2(" You have " + StringUtil.upperCase(num2Text(target.legCount)) + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened" : "chitinous") + " legs that end in pointed, single-toed feet. You can balance on them with ease, a touch of natural grace in your movements.");
			break;
		case GLOBAL.TYPE_VULPINE:
			output2(" Your legs are crooked into high knees with hocks and long feet, like those of a fox; cute bulbous toes decorate the ends.");
			break;
		case GLOBAL.TYPE_LUPINE:
			if(target.legCount < 4) 
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " powerful");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in large, bestial feet tipped with sharp canine claws.");
			}
			else
			{
				output2(" You have powerful");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs that end in large, bestial feet tipped with sharp canine claws.");
			}
			break;
		case GLOBAL.TYPE_DRACONIC:
			if(target.isTaur()) output2(" Your human-like legs are sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in clawed feet.");
			else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from your " + target.hipDescript() + ", sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and ending in clawed feet.");
			output2(" There are three long toes on the front, and a small hind-claw on the back.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			if(target.isTaur()) output2(" Your human-like legs are sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in clawed feet.");
			else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from your " + target.hipDescript() + ", sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and ending in mostly human feet, with the addition of scales and clawed toes.");
			break;
		case GLOBAL.TYPE_KUITAN:
			output2(" Your legs, though covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", are humanlike. Long feet on the ends bear equally long toes, and the pads on the bottoms are quite sensitive to the touch.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.isTaur())
			{
				output2(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			}
			output2(" You even have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "blunt" : "sharp-looking") + " claws growing from the tips of your short toes.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.hasLegFlag(GLOBAL.FLAG_FLUFFY)) output2(" Your fluffy, " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda-like legs end with soft and cute bear-like paws.");
			else if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(" Your furry, " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda-like legs end with broad and powerful-looking paws.");
			else output2(" Your solid " + target.furColor + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "furred") + " legs end with plush, bear-like paws.");
			break;
		case GLOBAL.TYPE_SIMII:
			output2(" Your legs");
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) output2(", though covered in goo,");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(", though covered in hair,");
			else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(", though covered in fur,");
			output2(" are humanlike in shape with long, dexterous toes that somewhat resemble fingers on a hand.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.legCount < 4)
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow down from your " + target.hipDescript() + ", ending in three-toed, webbed, frog-like feet. They look built for leaping and sticking to flat surfaces rather than running.");
			}
			else output2(" Your " + plural(target.leg(true)) + " look built for leaping than running, ending in three-toed, webbed, frog-like feet.");
			break;
		case GLOBAL.TYPE_GOAT:
			output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
			if(rand(2) == 0)
			{
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				output2(" legs grow from your " + target.hipDescript() + ",");
				if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) output2(" covered in goo and");
				else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(" covered in coarse fur and");
				output2(" providing a surprisingly strong sense of balance.");
			}
			else
			{
				output2(" double jointed legs covered in ");
				if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) output2(target.skinTone + " goo");
				else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) output2(target.furColor + " fur");
				else output2(target.skinFurScales(true,true,true,true));
				output2(" supports your body, looking much like a goat’s all the way down.");
			}
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.skinType != GLOBAL.SKIN_TYPE_SCALES)
			{
				if(target.isTaur()) output2(" Your legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in human-like feet.");
				else output2(" Your " + num2Text(target.legCount) + " legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales but are otherwise normal, human-like limbs.");
			}
			else
			{
				if(target.isTaur())
				{
					output2(" Your " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled"));
					if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", plantigrade");
					else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(", digitigrade");
					output2(" legs end in human-like feet.");
				}
				else
				{
					output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled"));
					if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", plantigrade");
					else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(", digitigrade");
					output2(" legs extend below your waist, ending in human-like feet.");
				}
			}
			break;
		case GLOBAL.TYPE_SHARK:
			if(target.legCount == 1)
			{
				output2(" Below your thighs, your flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between your crotch and [target.asshole]. It is covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.scaleColor + "-colored scales") + "and has small protruding fins on each side. It ends in a large caudal fin, perfect for underwater propulsion.");
			}
			else if(target.legCount == 2)
			{
				output2(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				output2(" legs are powerful, with small fins protruding from your ankles and webbed toes, perfect for swimming.");
			}
			else
			{
				output2(" Your " + num2Text(target.legCount));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				output2(" legs come with webbing and small fins to better propel you through water.");
			}
			break;
		case GLOBAL.TYPE_SIREN:
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY))
			{
				output2("You have " + StringUtil.upperCase(num2Text(target.legCount)) + " semi-solid legs and clawed");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(", digitigrade");
				output2(" feet.");
			}
			else
			{
				output2("You have " + (target.legCount == 2 ? "a pair of" : StringUtil.upperCase(num2Text(target.legCount))) + " powerful legs, with clawed");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(", digitigrade");
				output2(" feet, powerful enough to propel you through water.");
			}
			break;
		case GLOBAL.TYPE_TENTACLE:
			if(target.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) output2(" Your lower body is an ever-shifting mass of writhing tentacles. The strong, prehensile tentacles can easily and quickly carry you along.");
			else output2(" Your lower body consists of " + num2Text(target.legCount) + " imitation legs formed by your dexterous, prehensile tentacles. Your tentacle legs work just as well as real legs.");
			break;
		// Catch all
		default:
			if(target.isTaur() && target.hasFeet())
			{
				output2(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				output2(" " + target.legs(true, true) + " end in " + target.feet(true, true) + ".");
			}
			else if(!target.isTaur())
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				if(target.legCount == 1) output2(" " + target.leg(true, true) + " extends");
				else output2(" " + target.legs(true, true) + " extend");
				output2(" below your waist");
				if(target.hasFeet())
				{
					output2(", ending in ");
					if(target.legCount == 1) output2(indefiniteArticle(target.foot(true, true)));
					else output2(target.feet(true, true));
				}
				output2(".");
			}
			break;
	}
	// Mimbrane feet for applicable legTypes (any pair of humanoid legs with existing feet)!
	if(target.isBiped() && target.hasFeet() && target.hasToes())
	{
		if(target.hasStatusEffect("Mimbrane Foot Left") || target.hasStatusEffect("Mimbrane Foot Right"))
		{
			var bothFeet:Boolean = false;
			feedVal = 0;

			if(target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) bothFeet = true;
			
			if(!bothFeet)
			{
				if(target.hasStatusEffect("Mimbrane Foot Left")) feedVal = target.statusEffectv3("Mimbrane Foot Left");
				else feedVal = target.statusEffectv3("Mimbrane Foot Right");
			}
			// Don't foget to set feedVal for bothHands!
			else
			{
				//The feed values should be synced for feet, so use one of them!
				feedVal = target.statusEffectv3("Mimbrane Foot Right");
			}

			if(feedVal >= 3)
			{
				output2(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_HEELS))
				{
					if(bothFeet) output2(" feet appear");
					else output2(" foot appears");
				}
				else
				{
					if(bothFeet) output2(" [target.feet] appear");
					else output2(" [target.foot] appears");
				}
				if(feedVal < 8) output2(" to be slightly distended.");
				else if(feedVal < 13) output2(" puffy and inflated.");
				else output2(" unusually large and somewhat swollen, almost engorged.");
			}
		}
	}
	
	// CoC places the pregnancy output directly after leg output
	//Start a new paragraph with bellies if preggers, otherwise tack onto the end of the last one.
	if(target.isPregnant()) output2("\n\n");
	else output2(" ");

	//Calculating actual belly size.
	var tempBelly:Number = target.bellyRating();
	//Wide fat PCs got da belly
	var toneMod:Number = target.thickness - target.tone;
	//Prevent negatives for the uberfit:
	if(toneMod < 0) toneMod = 0;
	//Worst = 100. Scale down by factor of 5
	toneMod /= 5;
	//Add to our working belly amount for funtimes:
	tempBelly += toneMod;

	//Display belly size
	if(tempBelly <= 5)
	{
		if(target.tone >= 75) output2("Your " + RandomInCollection("belly", "midriff", "middle", "six pack") + " is rock-hard, shaped by a good diet, steady conditioning, or both.");
		else if(target.tone >= 50) output2("Your " + RandomInCollection("belly", "midriff", "middle", "six pack") + " is fairly well-toned.");
		else output2("Your [target.belly] is nice and smooth.");
	}
	else if(tempBelly <= 10) output2("Your [target.belly] is fairly average in appearance.");
	else if(tempBelly <= 15) output2("Your [target.belly] would just barely push past the waistband of a pair of pants. It’s a little bit of a muffin-top.");
	else if(tempBelly <= 20) output2("Your [target.belly] is pretty decent-sized. There’s no real hiding it.");
	else if(tempBelly <= 30) output2("Your [target.belly] is impossible to miss. Wearing loose clothing wouldn’t even help at this point.");
	//full round bulky
	else if(tempBelly <= 40) output2("Your [target.belly] is big enough that a passersby might think you pregnant at a glance.");
	//expansive extensive spacious
	else if(tempBelly <= 50) output2("Your [target.belly] would look more at home on a woman in the later stages of her pregnancy than an adventuring rusher.");
	//inflated excessive whopping
	else if(tempBelly <= 60) output2("Your [target.belly] is weighty enough to jiggle when you shift positions too suddenly, but still small enough for easy portability.");
	//distended immense bloated
	else if(tempBelly <= 70) output2("Your [target.belly] sticks out very noticeably, wobbling slightly with your motions. It would look right at home on a reclining, full-time breeding servant.");
	//over-inflated jumbo-sized
	else if(tempBelly <= 80) output2("Your [target.belly] is obscene testament to what the body can endure. When you look down, you have no hope of seeing your crotch, let alone your [target.feet].");
	//Very distended monumental massive
	else if(tempBelly <= 90) 
	{
		output2("Your [target.belly] is so big that it makes your [target.skin] tight and shiny");
		if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_FEATHERS))
			output2(" under your [target.skinFurScales]");
		output2(". Movement is a little impractical with the extra bulk.");
	}
	//ginormous over-inflated blimp-like
	else if(tempBelly < 120) output2("Your [target.belly] protrudes obscenely from your form, hanging heavily. Getting around is a struggle with so much extra mass on you.");
	else
	{
		output2("Your distended belly is so gargantuanly huge that you have no hope of seeing the floor anywhere near you, let alone your [target.legOrLegs]. It’s a small miracle that you can even stand upright with all that mass slung out in front of you.");
	}
	
	//Tack on preg flavor shit to the end of belly descripts.
	if(target.isPregnant())
	{	
		// Fragments pass through the Creature class to get data from the individual pregnancy handlers.
		// Creature -> Find largest pregnancy (based on pregData.contributedBellyRatingMod) ->
		// query preg manager for fragment -> preg manager finds target handler -> query handler for
		// fragment string. Check VenusPitcherFertilizedSeedCarrierHandler::pregBellyFragment for examples
		
		// A fragment is intended to range anywhere from a full scentence to a full paragraph, to be merged in with existing text
		// or stand as their own paragraphs.
		output2(" " + target.pregBellyFragment());
	}
	
	//Chesticles.
	boobStuff();
	//CROTCH STUFF!
	crotchStuff();
	
	// Extra menu stuff
	var btnIndex:int = 0;
	
	// Gender preference
	addGhostButton(btnIndex++, "PrefGender", selectGenderPref, undefined, "Preferred Gender", "Indicate the gender you would prefer your character to be considered.");
	
	// Wing position
	if(target.canCoverSelf(false, "wings")) addGhostButton(btnIndex++, StringUtil.toDisplayCase(target.wingsDescript(true)), selectWingPref, undefined, "Position " + StringUtil.toDisplayCase(target.wingsDescript(true)), "Change the position of your " + target.wingsDescript(true) + ".");
	
	//PC Goo'ed up?
	if(target.hairType == GLOBAL.HAIR_TYPE_GOO || target.hasStatusEffect("Goo Vent") || target.hasStatusEffect("Goo Crotch"))
	{
		output2("\n\nSince ");
		if(target.isGoo()) output2("you’re ");
		else output2("some parts of you are ");
		output2("made of goo, you can adjust ");
		if(target.isGoo()) output2("your body");
		else output2("them");
		output2(" if need be.");
		addGhostButton(btnIndex++,"Shift Goo",gooShiftMenu,undefined,"Shift Goo","Adjust the gooey parts of your body.");
	}
	
	// Mimbrane hooooook
	// [MIMBRANECODE]
	if(attachedMimbranes() > 0)
	{
		var mimNum:int = attachedMimbranes();
		
		if(kGAMECLASS.canSaveAtCurrentLocation) addGhostButton(btnIndex++, "Mimbrane" + (mimNum == 1 ? "" : "s"), mimbraneMenu, undefined, "Mimbrane" + (mimNum == 1 ? "" : "s"), "Interact with your parasitic mimbrane" + (mimNum == 1 ? "" : "s") + ".");
		else addDisabledGhostButton(btnIndex++, "Mimbrane" + (mimNum == 1 ? "" : "s"), "Mimbrane" + (mimNum == 1 ? "" : "s"), "You cannot access your mimbrane menu at this time.");
		
		// Detailed Mimbrane sentence that includes specific body regions.
		output2("\n\nFrom time to time, small chirps remind you that your body is not owned by just you alone. The");
		// Just one.
		if(mimNum == 1) 
		{
			output2(" parasite attached to");
			if(target.hasStatusEffect("Mimbrane Cock")) output2(" [target.eachCock]");
			else if(target.hasStatusEffect("Mimbrane Pussy")) output2(" [target.eachVagina]");
			else if(target.hasStatusEffect("Mimbrane Ass")) output2(" your [target.butt]");
			else if(target.hasStatusEffect("Mimbrane Balls")) output2(" your [target.balls]");
			else if(target.hasStatusEffect("Mimbrane Boobs")) output2(" your [target.chest]");
			else if(target.hasStatusEffect("Mimbrane Hand Left")) output2(" your left hand");
			else if(target.hasStatusEffect("Mimbrane Hand Right")) output2(" your right hand");
			else if(target.hasStatusEffect("Mimbrane Foot Left")) output2(" your left [target.foot]");
			else if(target.hasStatusEffect("Mimbrane Foot Right")) output2(" your right [target.foot]");
			else if(target.hasStatusEffect("Mimbrane Face")) output2(" your [target.face]");
			else output2(" your body");
			output2(" seems");
		}
		// More than one.
		else
		{
			output2(" parasites attached to");
			if(mimNum == 2)
			{
				if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls")) output2(" your cock and balls");
				else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Ass")) output2(" your tits and ass");
				else if(target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) output2(" your bodily glory holes");
				else if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Pussy")) output2(" your genitalia");
				else if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right")) output2(" both of your hands");
				else if(target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) output2(" your [target.feet]");
				else output2(" a couple of your appendages");
			}
			else if(mimNum == 3)
			{
				if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls") && target.hasStatusEffect("Mimbrane Ass")) output2(" your masculine bits");
				else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) output2(" your lady-like bits");
				else output2(" a few of your appendages");
			}
			else if(mimNum == 4)
			{
				if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls") && target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) output2(" your sensitive genitals");
				else if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right") && target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) output2(" your major limbs");
				else output2(" some of your appendages");
			}
			else output2(" a variety of your appendages");
			output2(" seem");
		}
		output2(" intelligent enough for some rudimentary communication....");
	}
	if (target.legType == GLOBAL.TYPE_TENTACLE) addGhostButton(btnIndex++, "Tentacle Legs", selectTentacleLegsPref, undefined, "Tentacle Legs", "Choose the form of your lower tentacles.");
	
	// Worn Objects
	var collarCount:int = hasCollars();
	if (collarCount > 0)
	{
		if(kGAMECLASS.canSaveAtCurrentLocation) addGhostButton(btnIndex++, (collarCount == 1 ? "Collar" : "Collars"), manageWornCollar, undefined, (collarCount == 1 ? "Collar" : "Collars"), "Manage which, if any, collar you’re wearing.");
		else addDisabledGhostButton(btnIndex++, (collarCount == 1 ? "Collar" : "Collars"), (collarCount == 1 ? "Collar" : "Collars"), "You cannot access your collar menu at this time.");
	}
	if (target.hasStatusEffect("Laquine Ears") && target.getStatusMinutes("Laquine Ears") <= 5)
	{
		if(kGAMECLASS.canSaveAtCurrentLocation) addGhostButton(btnIndex++, "Laquine Ears", LaquineEars.laquineEarsRemove, target, "Remove Laquine Ears", "The Laquine Ears have probably been used up by now, should you remove them?");
		else addDisabledGhostButton(btnIndex++, "Laquine Ears", "Remove Laquine Ears", "You cannot do this at this time.");
	}
	
	// Immobilization help
	if (immobilizationList().length > 0) addGhostButton(btnIndex++, "ImmobileHelp", immobilizationHelp, undefined, "Immobilization Help", "You can’t move--Call for help to fix your immobilized state!");
	
	setTarget(null);
}

private var COLLAR_LIST:Array = [
	"Jerynn’s",
	"Sera’s",
	"Sub-Tuner",
];

public function hasCollars():Number
{
	var c:int = 0;
	for (var i:int = 0; i < COLLAR_LIST.length; i++)
	{
		if (pc.hasKeyItem(COLLAR_LIST[i] + " Collar")) c++;
	}
	return c;
}

public function hasWornCollar():Boolean
{
	return getWornCollar() != null;
}

public function getWornCollar():StorageClass
{
	for (var i:int = 0; i < COLLAR_LIST.length; i++)
	{
		var itm:StorageClass = pc.getKeyItem(COLLAR_LIST[i] + " Collar");
		if (itm != null && itm.value1 == 1) return itm;
	}
	return null;
}

public function appearanceWornCollar():void
{
	var wornCollar:StorageClass = getWornCollar();
	if (wornCollar != null)
	{
		switch(wornCollar.storageName)
		{
			case "Sera’s Collar":
				output2(" Around your neck, a black leather and lace collar, replete with tiny pearls and a brass ring, is tightly fixed.");
				break;
			case "Sub-Tuner Collar":
				output2(" Your neck is adorned with Belle’s Sub-Tuner collar, covered with circuitry and locked around your nape with a magnetic seal, bearing a small holo-tag labeled " + (flags["SUBTUNER_NAMED"] == 2 ? "“[pc.name]”" : "“Subject 69”") + ".");
				break;
			default:
				output2(" You are currently wearing " + wornCollar.storageName + " around your neck.");
				break;
		}
	}
}
public function manageWornCollar():void
{
	clearOutput2();
	var wornCollar:StorageClass = getWornCollar();
	if (wornCollar != null)
	{
		switch(wornCollar.storageName)
		{
			case "Sera’s Collar":
				output2("You are currently wearing Sera’s Black Lace Collar.");
				output2("\n\nThis collar is composed of soft, rich leather around its ring, out of which wings of black lace sprout, contouring with the shape of your neck. Tiny pearls dangle from the lace, making small clicking sounds when you move energetically. A large brass ring connects to the back; a strange, blue gemstone is affixed to the front, glowing softly from within. ‘PROPERTY OF SERA’ is embossed into the leather. Altogether it’s an alluring, gothic piece of fetish-wear, elegant even - at least if you don’t know the purpose of the gemstone.");
				break;
			case "Sub-Tuner Collar":
				output2("Your neck is adorned with Belle’s Sub-Tuner collar, covered with circuitry and locked around your nape with a magnetic seal, bearing a small holo-tag labeled ");
				//anno/SyriCrew/SavedKiro: 
				if(flags["SUBTUNER_NAMED"] == 2) output2("“[pc.name]”");
				else output2("“Subject 69”");
				output2(".");
				break;
			default:
				output2("You are currently wearing " + wornCollar.storageName + ".");
				break;
		}
	}
	else
	{
		output2("You are not currently wearing a collar.");
	}
	
	clearGhostMenu();
	var btnIdx:int = 0;
	for (var i:int = 0; i < COLLAR_LIST.length; i++)
	{
		var itm:StorageClass = pc.getKeyItem(COLLAR_LIST[i] + " Collar");
		if (itm != null)
		{
			switch(COLLAR_LIST[i])
			{
				case "Sera’s":
					if(itm.value1 == 1) addGhostButton(btnIdx++, "Sera’s", toggleSeraCollarOff, undefined, "Sera’s Collar", "Remove this collar.");
					else addGhostButton(btnIdx++, "Sera’s", toggleSeraCollarOn, undefined, "Sera’s Collar", "Wear this collar.");
					break;
				default:
					if(itm.value1 == 1) addGhostButton(btnIdx++, COLLAR_LIST[i], toggleCollarManage, COLLAR_LIST[i], (COLLAR_LIST[i] + " Collar"), "Remove this collar.");
					else addGhostButton(btnIdx++, COLLAR_LIST[i], toggleCollarManage, COLLAR_LIST[i], (COLLAR_LIST[i] + " Collar"), "Wear this collar.");
					break;
			}
		}
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}

public function toggleCollarManage(newCollar:String):void
{
	toggleCollar(newCollar);
	manageWornCollar();
}
public function toggleCollar(newCollar:String):void
{
	var itm:StorageClass = pc.getKeyItem(newCollar + " Collar");
	
	// If this collar is already on, just remove it
	if (itm.value1 == 1)
	{
		itm.value1 = 0;
	}
	// Otherwise determine if we currently have a collar, unequip it, and then equip the new one
	else
	{	
		var wornCollar:StorageClass = getWornCollar();
		if (wornCollar != null) wornCollar.value1 = 0;
		itm.value1 = 1;
	}
}

public function boobStuff(forTarget:Creature = null):void
{
	if(forTarget != null) setTarget(forTarget);
	
	var rando:int = 0;
	output2("\n\n");
	if(target.gills)
	{
		output2("A pair of [target.gills] are growing out just below your neck, spreading out horizontally and draping down your chest. They allow you to stay in the water for quite a long time. ");
	}
	//Chesticles..I mean bewbz.
	if(target.breastRows.length == 1) {
		// Feminine A-Cups
		if(target.biggestTitSize() < 2 && target.biggestTitSize() >= 1 && target.mf("m","f") == "f") {
			if(rand(3) == 0) output2("You have the barest hint of breasts, " + num2Text(target.breastRows[0].breasts) + " teasing feminine rises on your chest");
			else if(rand(2) == 0) output2("You have tiny, cute mosquito bites for breasts, pert and sensitive");
			else output2("You have A-cup breasts, " + num2Text(target.breastRows[0].breasts) + " small, pert" + target.rawmfn(" trappy"," sporty","") + " boobs that almost vanish under anything thicker than spandex");
			output2(", capped with ");
		}
		// Default
		else if(target.biggestTitSize() > 1) output2("You have " + num2Text(target.breastRows[0].breasts) + " " + target.chestDesc() + ", capped with ");
		// Flat chests!
		else
		{
			// Feminine/Andro, Low/Medium Tone
			if((target.mfn("m","f","n") != "m") && target.tone < 60) {
				if(rand(3) == 0) output2("You have a waif’s chest, flat and innocent-looking");
				else if(rand(2) == 0) output2("You have a girly, soft, undefined flat chest");
				else output2("The top half of your body is willowy and breast-less, graceful yet vaguely austere");
			}
			// Masculine, High Tone, High Thickness
			else if((target.mf("m","f") == "m") && target.tone >= 60 && target.thickness >= 60) {
				if(rand(3) == 0) output2("You have a fuck-off six pack, bulging with heavy muscle. Above it, you have a broad chest");
				else if(rand(2) == 0) output2("You’re ripped as hell, sporting the kind of muscle guys want and girls want around them. Much can be said about your pecs");
				else output2("You have remarkably well defined, heavyweight abs, rounded and beefy. Above it, you have a muscled chest");
			}
			// Masculine, Low Tone, High Thickness
			else if((target.mf("m","f") == "m") && target.tone <= 30 && target.thickness >= 60) {
				if(rand(3) == 0) output2("You have a broad, incredibly masculine chest, bulky and assured");
				else if(rand(2) == 0) output2("You have a bear-like upper frame, voluminous and imminently cuddly");
				else output2("You have a wide, hearty, supremely manly chest");
			}
			// Masculine/Feminine/Andro, High Tone, Low Thickness
			else if(target.tone >= 60 && target.thickness <= 30) {
				if(rand(3) == 0) output2(target.mf("You have a narrow, well defined but unostentatious six pack. Above it, you have a chiseled chest", "You have a flat, athlete’s chest, supple and thin"));
				else if(rand(2) == 0) output2(target.mf("You have a sleek, tight featherweight’s six pack. Above it, you have a defined chest", "You have a no-nonsense flat chest, framed by rounded, subtle amounts of muscle"));
				else output2(target.mf("You have a flat, athlete’s chest, wiry with muscle", "Your firm, washboard, modest pecs make you look teasingly sexually ambiguous"));
			}
			// Basic
			else
			{
				output2("You have a");
				if(target.tone >= 100)
				{
					if(target.thickness > 70) output2("n immense chest with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
					else if(target.thickness >= 30) output2(" robust chest with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
					else output2(" chisled chest with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
				}
				else if(target.tone > 70)
				{
					if(target.thickness > 70) output2(" broad chest with " + target.mf("well defined","well toned") + " pectoral muscles");
					else if(target.thickness >= 30) output2(" healthy chest with " + target.mf("well defined","well toned") + " pectoral muscles");
					else output2(" fit chest with " + target.mf("well defined","well toned") + " pectoral muscles");
				}
				else if(target.tone >= 30)
				{
					if(target.thickness > 70) output2(" thick chest with " + target.mf("toned","lightly toned") + " pectoral muscles");
					else if(target.thickness >= 30) output2("n average chest with " + target.mf("toned","lightly toned") + " pectoral muscles");
					else output2(" soft chest with " + target.mf("toned","lightly toned") + " pectoral muscles");
				}
				else
				{
					if(target.thickness > 70) output2(" wide chest with unremarkable " + target.mf("pectoral muscles", "breasts"));
					else if(target.thickness >= 30) output2(" passable chest with unremarkable " + target.mf("pectoral muscles", "breasts"));
					else output2(" flat chest with unremarkable " + target.mf("pectoral muscles", "breasts"));
				}
			}
			output2(", capped with ");
		}
		//Normal nips
		if(InCollection(target.breastRows[0].nippleType, [GLOBAL.NIPPLE_TYPE_DICK, GLOBAL.NIPPLE_TYPE_NORMAL]))
		{ 
			//One nipple
			if(target.nipplesPerBreast == 1) output2(num2Text(target.nipplesPerBreast) + " " + int(target.nippleLength(0)*10)/10 + "-inch " + target.nippleDescript(0) + " each.");
			else output2(num2Text(target.nipplesPerBreast) + " " + int(target.nippleLength(0)*10)/10 + "-inch " + plural(target.nippleDescript(0)) + " each.");
			//Dicknipples mention areolae desc later.
			if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) output2(" The areolae are " + target.nippleColor + ".");
			else output2(" The " + target.areolaSizeDescript() + " areolae are " + target.nippleColor + ".");
			if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
			{
				//New J-Cup hotness
				output2(" With a lusty thought and a bit of focus, you can make " + num2Text(Math.round(target.nippleLength(0) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind your normal-looking, " + target.areolaSizeDescript() + ", areolae.");
				//OLD: output2(" With a lusty thought and a bit of focus, you can make " + num2Text(Math.round(target.nippleLength(0) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind your normal-looking areolae.");
			}
		}
		//Inverted type
		else {
			//One nipple
			if(target.nipplesPerBreast == 1) output2(num2Text(target.nipplesPerBreast) + " " + target.nippleDescript(0) + " each.");
			else output2(num2Text(target.nipplesPerBreast) + " " + plural(target.nippleDescript(0)) + " each.");
			switch(target.breastRows[0].nippleType)
			{
				case GLOBAL.NIPPLE_TYPE_FUCKABLE:
					output2(" The " + target.areolaSizeDescript() + " areolae are " + target.nippleColor + ".");
					output2(" While you may appear to have inverted nipples, your chest actually houses wet, slippery secrets. A finger or cock could easily slip inside you to give and get as much pleasure as any crotch-couched cunt.");
					break;
				case GLOBAL.NIPPLE_TYPE_LIPPLES:
					output2(" The plump, " + target.areolaSizeDescript() + ", " + target.nippleColor + " lips that you have in place of areolae could easily be parted to allow something stiff and hard inside your sensitive chest-based passages.");
					break;
				case GLOBAL.NIPPLE_TYPE_FLAT:
					output2(" There isn’t any actual nub to your nipples - just flat, " + target.areolaSizeDescript() + ", " + target.nippleColor + " areolae.");
					break;
				case GLOBAL.NIPPLE_TYPE_INVERTED:
					output2(" The " + target.areolaSizeDescript() + " areolae are " + target.nippleColor + ".");
					output2(" When you’re aroused enough, your " + int(target.nippleLength(0)*10)/10 + "-inch nipples pop out, ready for action.");
					break;
				case GLOBAL.NIPPLE_TYPE_TENTACLED:
					output2(" Once you are worked up, several long, prehensile tentacles emerge from their " + target.nippleColor + " home, seeking for an orifice to pleasure.");
					break;
			}
		}
		//Lactation and breast cup final!
		if(target.isLactating())
		{
			if(target.milkFullness < 50) output2(" Your " + target.breastDescript(0) + " are producing [target.milk] but are nowhere near full at the moment.");
			else if(target.milkFullness < 75) output2(" Your " + target.breastDescript(0) + " have a noticable amount of [target.milk] inside them now. Before long, they’ll start swelling.");
			else if(target.milkFullness < 100) output2(" Your " + target.breastDescript(0) + " are fairly full of [target.milk] and noticeably swollen.");
			else if(target.milkFullness < 150) output2(" Your " + target.breastDescript(0) + " are sore and sensitive from being so stuffed with [target.milk]. You should release the pressure soon.");
			else if(target.milkFullness < 200)
			{
				if(target.isMilkTank() && rand(2) == 0) output2(" Your " + target.breastDescript(0) + " are incredibly swollen with [target.milk], so much that they’re much bigger than normal. Your lactation shows no signs of slowing down in the slightest.");
				else if(target.isMilkTank()) output2(" At least you are certain your enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else output2(" Your " + target.breastDescript(0) + " are painfully swollen with [target.milk], so much that they’re much bigger than normal. The longer they stay like this, the more your lactation will slow.");
			}
			else
			{
				if(target.isMilkTank() && rand(2) == 0) output2(" <b>Your " + target.breastDescript(0) + " are so full that they might burst! They radiate a constant yet rhythmic pulse of pressure, a sign that you are quite the productive [target.milkNoun] factory!</b>");
				else if(target.isMilkTank()) output2(" Despite the uncomfortable fullness, you are at ease - you know your enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else output2(" <b>Your " + target.breastDescript(0) + " are so full that they feel about to burst! Spending time like this is going to slow your milk production.</b>");
			}
			//Don't forget about the bras! Primarily when mentioning the slowing of milk production.
			if(target.milkFullness > 150 && target.upperUndergarment.shortName != "")
			{
				if(target.upperUndergarment.shortName == "Bounty Bra" && target.isMilkTank()) output2(" The massaging vibrations eminating from your JoyCo maternity bra reminds you that you’ll never stop lactating, but you wonder if it is really necessary since your lactation seems to be on an endless outflow.");
				else if(target.upperUndergarment.shortName == "Bounty Bra") output2(" Luckily, the massaging vibrations emanating from your JoyCo maternity bra reminds you that you’ll never stop lactating as long as you continue to wear the " + target.upperUndergarment.shortName + ".");
				else output2(" Unfortunately, a bit of [target.milk] leaks out onto your " + target.upperUndergarment.description + "... Maybe you should invest in a maternity bra?");
			}
		}
		if(target.breastRows[0].breastRating() >= 1) output2(" You could easily fill " + indefiniteArticle(target.breastCup(0)) + " bra.");
	}
	//many rows
	else {
		output2("You have " + num2Text(target.breastRows.length) + " rows of breasts");
		if(target.biggestTitSize() < 1)
		{
			output2(", all");
			if(target.tone >= 100)
			{
				if(target.thickness > 70) output2(" immense with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
				else if(target.thickness >= 30) output2(" robust with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
				else output2(" chisled with " + target.mf("extremely pronounced","very pronounced") + " pectoral muscles");
			}
			else if(target.tone > 70)
			{
				if(target.thickness > 70) output2(" broad with " + target.mf("well defined","well toned") + " pectoral muscles");
				else if(target.thickness >= 30) output2(" healthy with " + target.mf("well defined","well toned") + " pectoral muscles");
				else output2(" fit with " + target.mf("well defined","well toned") + " pectoral muscles");
			}
			else if(target.tone >= 30)
			{
				if(target.thickness > 70) output2(" thick with " + target.mf("toned","lightly toned") + " pectoral muscles");
				else if(target.thickness >= 30) output2(" average with " + target.mf("toned","lightly toned") + " pectoral muscles");
				else output2(" soft with " + target.mf("toned","lightly toned") + " pectoral muscles");
			}
			else
			{
				if(target.thickness > 70) output2(" wide and fairly " + target.mfn("masculine","feminine","masculine") + " in look");
				else if(target.thickness >= 30) output2(" passable and fairly " + target.mfn("masculine","feminine","masculine") + " in look");
				else output2(" flat and fairly " + target.mfn("masculine","feminine","masculine") + " in look");
			}
			output2(".");
		}
		else
		{
			output2(", the topmost");
			if(target.breastRows[0].breasts == 2) output2(" pair");
			else output2(" set");
			output2(" starting at your chest.");
		}
		temp = 0;
		while (temp < target.breastRows.length) {
			// Feminine A-Cups
			if(target.breastRows[temp].breastRating() >= 1 && target.breastRows[temp].breastRating() < 2 && target.mf("m","f") == "f")
			{
				if(temp == 0) output2(" Your top row of breasts are ");
				else if(temp == (target.breastRows.length - 1)) output2(" Your bottom row of breasts are ");
				else output2(" Your next row of breasts are ");
				if(rand(3) == 0 && temp > 0) output2("bare hints, nothing more than " + num2Text(target.breastRows[0].breasts) + " teasing feminine rises below the ones above");
				else if(rand(2) == 0) output2("tiny, cute mosquito bites, pert and sensitive");
				else output2("A-cups, " + num2Text(target.breastRows[0].breasts) + " small, pert" + target.rawmfn(" trappy"," sporty","") + " boobs that almost vanish under anything thicker than spandex");
				output2(", capped with ");
			}
			// Default
			else
			{
				switch(temp)
				{
					case 0: output2(" Your uppermost row houses "); break;
					case 1: output2(" The second group holds "); break;
					case 2: output2(" Your third batch contains "); break;
					case 3: output2(" Your fourth set cradles "); break;
					case 4: output2(" Your fifth has "); break;
					default: output2(" Your " + num2Ordinal(temp + 1) + " row has "); break;
				}
				if(target.breastRows[temp].breastRating() >= 1) output2(num2Text(target.breastRows[temp].breasts) + " " + target.breastDescript(temp) + ", capped with ");
			}
			//DESCRIBE NIPPLE NAU!
			//Normal nips
			if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_DICK || target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL) { 
				//One nipple
				if(target.nipplesPerBreast == 1) {
					output2(num2Text(target.nipplesPerBreast) + " " + int(target.nippleLength(temp)*10)/10 + "-inch " + target.nippleDescript(temp) + " ");
					if(target.breastRows[temp].breastRating() < 1) output2("on each side.");
					else output2("each.");
				}
				else {
					output2(num2Text(target.nipplesPerBreast) + " " + int(target.nippleLength(temp)*10)/10 + "-inch " + plural(target.nippleDescript(temp)) + " ");
					if(target.breastRows[temp].breastRating() < 1) output2("on each side.");
					else output2("each.");
				}
				if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_DICK) {
					output2(" You can make " + num2Text(Math.round(target.nippleLength(temp) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind the normal-looking areolae.");
				}		
			}
			//Inverted type
			else {
				//One nipple
				if(target.nipplesPerBreast == 1) {
					output2(num2Text(target.nipplesPerBreast) + " " + target.nippleDescript(temp) + " ");
					if(target.breastRows[temp].breastRating() < 1) output2("on each side.");
					else output2("each.");
				}
				//Multi
				else {
					output2(num2Text(target.nipplesPerBreast) + " " + plural(target.nippleDescript(temp)) + " ");
					if(target.breastRows[temp].breastRating() < 1) output2("on each side.");
					else output2("each.");
				}				
				switch(target.breastRows[temp].nippleType)
				{
					case GLOBAL.NIPPLE_TYPE_FUCKABLE:
						output2(" They actually house wet, slippery, secret entrances.");
						break;
					case GLOBAL.NIPPLE_TYPE_LIPPLES:
						output2(" Plump lips cap them off in place of nipples.");
						break;
					case GLOBAL.NIPPLE_TYPE_FLAT:
						output2(" There isn’t any actual nub to the nipples - just flat areolae.");
						break;
					case GLOBAL.NIPPLE_TYPE_INVERTED:
						output2(" When you’re aroused enough, the nubs pop out, ready to play.");
						break;
					case GLOBAL.NIPPLE_TYPE_TENTACLED:
						output2(" They hide several long, prehensile tentacles, eager for an orifice to pleasure.");
						break;
				}
			}
			if(target.breastRows[temp].breastRating() >= 1) output2(" They could easily fill " + indefiniteArticle(target.breastCup(temp)) + " bra.");
			temp++;
		}
		//Done with tits. Move on.
		//Lactation and breast cup final!
		if(target.isLactating())
		{
			if(target.milkFullness < 50) output2(" Your [target.fullChest] are producing [target.milk] but are nowhere near full at the moment.");
			else if(target.milkFullness < 75) output2(" Your [target.fullChest] have a noticable amount of [target.milk] inside them now. Before long, they’ll start swelling.");
			else if(target.milkFullness < 100) output2(" Your [target.fullChest] are fairly full of [target.milk] and noticeably swollen.");
			else if(target.milkFullness < 150) output2(" Your [target.fullChest] are sore and sensitive from being so stuffed with [target.milk]. You should release the pressure soon.");
			else if(target.milkFullness < 200)
			{
				if(target.isMilkTank() && rand(2) == 0) output2(" Your [target.fullChest] are incredibly swollen with [target.milk], so much that they’re much bigger than normal. Your lactation shows no signs of slowing down in the slightest.");
				else if(target.isMilkTank()) output2(" At least you are certain your enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else output2(" Your [target.fullChest] are painfully swollen with [target.milk], so much that they’re much bigger than normal. The longer they stay like this, the more your lactation will slow.");
			}
			else
			{
				if(target.isMilkTank() && rand(2) == 0) output2(" <b>Your [target.fullChest] are so full that they might burst! They radiate a constant yet rhythmic pulse of pressure, a sign that you are quite the productive [target.milkNoun] factory!</b>");
				else if(target.isMilkTank()) output2(" Despite the uncomfortable fullness, you are at ease - you know your enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else output2(" <b>Your [target.fullChest] are so full that they feel about to burst! Spending time like this is going to slow your milk production.</b>");
			}
			//Bra specials
			if(target.milkFullness > 150 && target.upperUndergarment.shortName != "")
			{
				if(target.upperUndergarment.shortName == "Bounty Bra" && target.isMilkTank()) output2(" The massaging vibrations eminating from your JoyCo maternity bra reminds you that you’ll never stop lactating, but you wonder if it is really necessary since your lactation seems to be on an endless outflow.");
				else if(target.upperUndergarment.shortName == "Bounty Bra") output2(" Luckily, the massaging vibrations emanating from your JoyCo maternity bra reminds you that you’ll never stop lactating as long as you continue to wear the " + target.upperUndergarment.shortName + ".");
				else output2(" Unfortunately, a bit of [target.milk] leaks out onto your " + target.upperUndergarment.description + "... Maybe you should invest in a maternity bra?");
			}
		}
	}
	
	// Lund piercing
	if(target.breastRows[0].piercing is LundsRings && target is PlayerCharacter) output2("\n\nYour [pc.nipples] are each pierced with a small golden ring, courtesy of Lund. If you lift them to check, you can see inscriptions along the inside written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.");
	
	if(forTarget != null) setTarget(null);
}

public function crotchStuff(forTarget:Creature = null):void
{
	if(forTarget != null) setTarget(forTarget);
	
	var rando:int = 0;
	if(target.hasGenitals()) {
		output2("\n\n");
		//Crotchial stuff - mention snake
		if(target.hasStatusEffect("Genital Slit") && target.hasCock())
		{
			output2("Your masculine endowment");
			if((target.hasVagina() && target.hasCock()) || target.totalCocks() > 1) output2("s are ");
			else output2(" is ");
			output2("concealed within a well-hidden slit when not in use, though when the need arises, you can part your concealed entrance and reveal your true self. ");
			if(target.isTaur()) output2("You’re probably one of the most modest taurs out there because of this. ");
		}
		// No genital slits
		else
		{
			switch(target.genitalLocation())
			{
				case 0:
					output2("Your sexual equipment is located at your");
					if(!target.isHuman() || !target.isHalfHuman()) output2(" humanoid");
					output2(" waist. ");
					break;
				case 1:
					output2("Your sexual equipment is located in the middle of your");
					if(target.legCount == 1 && target.isNaga()) output2(" long tail");
					else output2(" lower body");
					output2(". ");
					break;
				case 2:
					if(target.isTaur())
					{
						if(target.originalRace == "half-leithan")
						{
							output2("Your sexual equipment is positioned at the back of your tauric hindquarters, rather than at your humanoid waist. ");
						}
						else
						{
							output2("Your sexual equipment is");
							if(target.race() != target.originalRace) output2(" no longer below your waist, but instead");
							output2(" at the back of your");
							if(target.legType == GLOBAL.TYPE_EQUINE) output2(" equine");
							else if(target.legType == GLOBAL.TYPE_BOVINE) output2(" bovine");
							else output2(" tauric");
							output2(" hindquarters. ");
						}
					}
					else
					{
						output2("Your sexual equipment is located at your rear");
						if(target.legCount > 1 && target.isNaga()) output2(" tails");
						else if(target.legCount > 1) output2(" legs");
						output2(". ");
					}
					break;
				case 3:
					output2("Your sexual equipment is located");
					if(target.isDrider()) output2(" at the end of your drider abdomen");
					else if(target.legCount == 1 && target.isNaga()) output2(" on the underside of your long tail");
					else output2(" on the underside of your lower body");
					output2(". ");
					break;
			}
		}
		
		//SINGLE DICKS!
		if(target.cockTotal() == 1) {
			output2("Your " + target.simpleCockNoun(0) + " is " + Math.floor(10*target.cocks[0].cLength())/10 + " inches long and ");
			if(Math.floor(10*target.cocks[0].thickness())/10 < 2) {
				if(Math.floor(10*target.cocks[0].thickness())/10 == 1) output2(int(10*target.cocks[0].thickness())/10 + " inch thick.");
				else output2(Math.round(10*target.cocks[0].thickness())/10 + " inches across.");
			}
			else output2(num2Text(Math.round(10*target.cocks[0].thickness())/10) + " inches across.");
			dickBonusForAppearance(null, 0);
			//Worm flavor
			if(target.hasStatusEffect("Infested")) output2(" Every now and again a slimy worm coated in spunk slips partway out of your " + target.cockDescript(0) + ", tasting the air like a snake’s tongue.");
		}
		//MULTICOCKS!
		else if(target.totalCocks() > 1)
		{
			temp = 0;
			rando = rand(4);
			output2("Where a penis would normally be located, you have instead grown " + target.multiCockDescript(false,true) + ":");
			while(temp < target.cocks.length) 
			{
				//middle cock description
				if(rando == 0) {
					if(temp == 0)output2("\nYour first ");
					else output2("\nYour next ");
					output2(target.simpleCockNoun(temp));
					output2(" is ");
					output2(int(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches wide.");
					else {
						if(target.cocks[temp].thickness() == 1) output2("one inch wide.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches wide.");
					}
				}
				if(rando == 1) {
					output2("\nYour " + num2Ordinal(temp + 1) + " ");
					output2(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
					else {
						if(target.cocks[temp].thickness() == 1) output2("one-inch thick.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick.");
					}
				}
				if(rando == 2) {
					output2("\nThe " + num2Ordinal(temp + 1) + " ");
					output2(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
					else {
						if(target.cocks[temp].thickness() == 1) output2("one-inch thick.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick.");
					}
				}
				if(rando == 3) {
					if(temp > 0) output2("\nYour next ");
					else output2("\nYour first ");
					output2(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches in diameter.");
					else {
						if(Math.round(target.cocks[temp].thickness()*10)/10 == 1) output2("one inch in diameter.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches in diameter.");
					}
				}
				dickBonusForAppearance(null, temp);
				temp++;
				rando++;
				if(rando > 3) rando = 0;
			}
			//All sheathed
			if(target.hasFullSheaths()) output2("\nEach of your manhoods naturally retract into an animalistic sheath when completely flaccid.");
			//Worm flavor
			if(target.hasStatusEffect("Infested")) output2("\nEvery now and again slimy worms coated in spunk slip partway out of your " + target.multiCockDescript() + ", tasting the air like tongues of snakes.");
			//DONE WITH COCKS, moving on!
		}
	}
	//Of Balls and Sacks!
	if(target.balls > 0) {
		var sTesticleDesc:String = target.ballsDescript(true,true);
		if(target.balls == 1) sTesticleDesc = target.ballDescript(true,true);
		
		// Scrotum type
		var ballsackType:int = target.scrotumType();
		var ballsackColor:String = target.scrotumColor();
		
		var sBallsackDesc:String = "";
		switch(ballsackType)
		{
			case GLOBAL.FLAG_FURRED:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += "Your fuzzy " + target.sackDescript(true,true) + " hugs your " + sTesticleDesc + " tightly against your body.";
				else if(target.cockTotal() == 0) sBallsackDesc += "A fuzzy " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under where a penis would normally grow.";
				else sBallsackDesc += "A fuzzy " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under your " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Covered in plush, " + (ballsackColor != "" ? ballsackColor : target.furColor) + " fluff makes it absolutely squeezable!";
				break;
			case GLOBAL.FLAG_SCALED:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += "Your scaly " + target.sackDescript(true,true) + " hugs your " + sTesticleDesc + " tightly against your body.";
				else if(target.cockTotal() == 0) sBallsackDesc += "A scaly " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under where a penis would normally grow.";
				else sBallsackDesc += "A scaly " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under your " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Covered in sleek, " + (ballsackColor != "" ? ballsackColor : target.scaleColor) + " scales makes it smooth to the touch.";
				break;
			case GLOBAL.FLAG_GOOEY:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += "Your " + target.sackDescript(true,true) + " clings tightly to your groin, dripping ooze and holding " + sTesticleDesc + " snugly against you.";
				else if(target.cockTotal() == 0) sBallsackDesc += "An oozing, semi-solid sack with " + sTesticleDesc + " swings heavily under where a penis would normally grow.";
				else sBallsackDesc += "An oozing, semi-solid sack with " + sTesticleDesc + " swings heavily beneath your " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Its gelatinous, " + (ballsackColor != "" ? ballsackColor : target.skinTone) + " mass can allow it to jiggle and flop with ease.";
				break;
			default:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += "Your " + target.sackDescript(true,true) + " clings tightly to your groin, holding your " + sTesticleDesc + " snugly against you.";
				else if(target.cockTotal() == 0) sBallsackDesc += StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true))) + " with " + sTesticleDesc + " swings heavily under where a penis would normally grow.";
				else sBallsackDesc += StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true))) + " with " + sTesticleDesc + " swings heavily beneath your " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " It is covered in smooth " + (ballsackColor != "" ? ballsackColor : target.skinTone) + " skin, allowing anyone to see it blush whenever you’re aroused.";
				break;
		}
		//Does it mention the dick at the end of the sentence? If so, dont use pronoun here:
		if(target.hasCock() && !target.hasStatusEffect("Uniball"))
		{
			if(target.balls == 1) sBallsackDesc += " You estimate the testicle to be about " + num2Text(Math.round(target.ballSize())) + " ";
			else sBallsackDesc += " You estimate each testicle to be about " + num2Text(Math.round(target.ballSize())) + " ";
		}
		//No dick mention? Great! Pronouns deployed!
		else if(target.balls == 1) sBallsackDesc += " You estimate it to be about " + num2Text(Math.round(target.ballSize())) + " ";
		else sBallsackDesc += " You estimate each of them to be about " + num2Text(Math.round(target.ballSize())) + " ";
		if(Math.round(target.ballSize()) == 1) sBallsackDesc += "inch";
		else sBallsackDesc += "inches";
		var ballDisplayDiameter:Number = Math.round(target.ballDiameter()*10)/10;
		sBallsackDesc += " around and " + ballDisplayDiameter + (ballDisplayDiameter != 1 ? " inches" : " inch") + " across.";
		//Vanaeballs
		if(target.statusEffectv4("Vanae Markings") > 0) sBallsackDesc += " Flowing across the surface of your nutsack are intricate markings that glow " + target.skinAccent + ", softly pulsing with life.";
		
		if(sBallsackDesc != "")
		{
			if(target.cockTotal() == 0 && !target.hasVagina()) output2("\n\n");
			else if(target.cockTotal() > 1) output2("\n\n");
			else output2(" ");
			output2(sBallsackDesc);
		}
	}
	//VAGOOZ
	if(target.vaginas.length > 0) {
		if(target.hasCock() || target.balls > 0) output2("\n\n");
		if(!target.hasCock() && target.isTaur()) output2("As a tauric creature, your womanly parts lie between your rear legs in a rather equine fashion. ");
		
		var vagSwellBonus:int = target.vaginalPuffiness(0);
		
		//Vaginal Numbers
		if(target.vaginaTotal() == 1) {
			output2("You have " + indefiniteArticle(target.vaginaDescript(0,false,false,true)) + ", with " + num2Text(target.vaginas[0].clits) + " " + Math.round(target.clitLength*10)/10 + "-inch clit");
			if(target.vaginas[0].clits > 1) output2("s");
			if(target.vaginas[0].hymen) output2(" and an intact hymen");
			output2(". ");

			if(target.hasStatusEffect("Mimbrane Pussy") && target.statusEffectv3("Mimbrane Pussy") > 3)
			{
				if(target.statusEffectv3("Mimbrane Pussy") < 8)
				{
					output2("Your pussy appears");
					if(vagSwellBonus <= 0) output2(" slightly");
					else if(vagSwellBonus <= 1) output2(" a bit");
					else output2(" very");
					output2(" swollen. ");
				}
				else if(target.statusEffectv3("Mimbrane Pussy") < 13)
				{
					output2("Your pussy appears noticably inflated");
					if(!target.isCrotchExposed())
					{
						output2(" and creates");
						if(vagSwellBonus <= 0) output2(" a slight");
						else if(vagSwellBonus <= 1) output2(" a large");
						else output2(" an enormous");
						output2(" bulge beneath your");
						if(target.armor.type == GLOBAL.ARMOR) output2(" armor");
						else output2(" clothing");
					}
					output2(". ");
				}
				else
				{
					output2("Your pussy appears delightfully plump");
					if(!target.isCrotchExposed())
					{
						output2(", creating");
						if(vagSwellBonus <= 0) output2(" an undeniable");
						else if(vagSwellBonus <= 1) output2(" a massive");
						else output2(" a gargantuan");
						output2(" bulge in your");
						if(target.armor.type == GLOBAL.ARMOR) output2(" armor");
						else output2(" clothing");
					}
					output2(". ");
				}
			}
			//Variances based on lustiness & wetness & such. THE DETAIL!
			if(target.vaginas[0].hasFlag(GLOBAL.FLAG_LUBRICATED))
			{
				if(target.libido() < 50 && target.lust() < 50) output2("Thin streams of [target.girlCum] occasionally dribble from ");
				else if(target.libido() < 80 && target.lust() < 80) output2("Thick streams of [target.girlCum] drool constantly from ");
				else output2("Immense streams of [target.girlCum] cascade profusely from ");
			}
			else if(target.libido() < 50 && target.lust() < 50) //not particularly horny
			{
				//Wetness
				if(target.vaginas[0].wetness() < 2) output2("No moisture presently escapes ");
				else if(target.vaginas[0].wetness() < 4) output2("Moisture gleams in ");
				else output2("Occasional beads of [target.girlCum] drip from ");
			}
			else if(target.libido() < 80 && target.lust() < 80) //kinda horny
			{
				//Wetness
				if(target.vaginas[0].wetness() < 1) {}
				else if(target.vaginas[0].wetness() < 2) output2("Moisture gleams in ");
				else if(target.vaginas[0].wetness() < 4) output2("Occasional beads of [target.girlCum] drip from ");
				else output2("Thin streams of [target.girlCum] occasionally dribble from ");
			}
			else //WTF horny!
			{
				//Wetness
				if(target.vaginas[0].wetness() < 1) {}
				else if(target.vaginas[0].wetness() < 2) output2("Occasional beads of [target.girlCum] drip from ");
				else if(target.vaginas[0].wetness() < 4) output2("Thin streams of [target.girlCum] occasionally dribble from ");
				else output2("Thick streams of [target.girlCum] drool constantly from ");
			}
			//Different description based on vag looseness
			if(target.vaginas[0].looseness() < 2) output2("your " + target.vaginaDescript(0) + ".");
			else if(target.vaginas[0].looseness() < 4) output2("your " + target.vaginaDescript(0) + ", its lips slightly parted.");
			else output2("the massive hole that is your " + target.vaginaDescript(0) + ".");
			//Flavor
			vaginaBonusForAppearance(null, 0, false);
			wombBonusForAppearance(null, 0);
		}
		//MULTICOOCH!
		else if(target.vaginaTotal() > 1) 
		{
			output2("You have " + num2Text(target.vaginas.length) + " " + target.vaginasDescript() + ",");
			if(target.matchedVaginas()) 
			{
				if(target.totalVaginas() == 2) output2(" both similar in appearance.");
				else output2(" all similar in appearance.");
			}
			else output2(" each a unique and beautiful flower.");
			temp = 0;
			while(temp < target.totalVaginas())
			{
				if(temp == 0) output2("\nYour first entrance");
				else if(temp == 1) output2("\nThe second slit");
				else output2("\nThe third and final vagina");
				output2(" is " + indefiniteArticle(target.vaginaDescript(temp,false,false,true)) + " with " + num2Text(target.vaginas[temp].clits) + " " + int(target.clitLength*10)/10 + "-inch clit");
				if(target.vaginas[temp].clits > 1) output2("s");
				//Virginal trumps all else
				if(target.vaginas[temp].hymen) output2(", still virginal in appearance.");
				//Else wetness -> size
				else
				{
					if(target.vaginas[temp].hasFlag(GLOBAL.FLAG_LUBRICATED))
					{
						if(target.lust() < 50) output2(", frequently drooling its ever-present [target.girlCumNoun]");
						else if(target.lust() < 75) output2(", constantly drooling thick strands of [target.girlCumNoun]");
						else output2(", profusely seeping immense streams of [target.girlCumNoun]");
					}
					//High wetness shit
					else if(target.vaginas[temp].wetness() >= 4)
					{
						if(target.lust() < 50) output2(", occassionally beading its ever-present [target.girlCumNoun]");
						else if(target.lust() < 75) output2(", frequently drooling its ever-present [target.girlCumNoun]");
						else output2(", constantly drooling thick strands of [target.girlCumNoun]");
					}
					//Medium wetness shit
					else if(target.vaginas[temp].wetness() >= 2)
					{
						if(target.lust() > 50) output2(", gleaming with barely-contained wetness");
					}
					//Size shit
					if(target.vaginas[temp].looseness() < 2) output2(", its lips primly pressed together as if waiting for something");
					else if(target.vaginas[temp].looseness() < 4) output2(", its lips slightly parted");
					else output2(", its lips loosened by frequent fucking");
					output2(".");
					if(!target.matchedVaginas())
					{
						vaginaBonusForAppearance(null, temp, false);
					}
				}
				if(temp == 0 && target.hasStatusEffect("Mimbrane Pussy") && target.statusEffectv3("Mimbrane Pussy") > 3)
				{
					if(target.statusEffectv3("Mimbrane Pussy") < 8)
					{
						output2(" It appears");
						if(vagSwellBonus <= 0) output2(" slightly");
						else if(vagSwellBonus <= 1) output2(" a bit");
						else output2(" very");
						output2(" swollen from the mimbrane.");
					}
					else if(target.statusEffectv3("Mimbrane Pussy") < 13)
					{
						output2(" It appears noticably inflated");
						if(!target.isCrotchExposed())
						{
							output2(" and creates");
							if(vagSwellBonus <= 0) output2(" a slight");
							else if(vagSwellBonus <= 1) output2(" a large");
							else output2(" an enormous");
							output2(" bulge beneath your");
							if(target.armor.type == GLOBAL.ARMOR) output2(" armor");
							else output2(" clothing");
						}
						output2(".");
					}
					else
					{
						output2(" It appears delightfully plump");
						if(!target.isCrotchExposed())
						{
							output2(", creating");
							if(vagSwellBonus <= 0) output2(" an undeniable");
							else if(vagSwellBonus <= 1) output2(" a massive");
							else output2(" a gargantuan");
							output2(" bulge in your");
							if(target.armor.type == GLOBAL.ARMOR) output2(" armor");
							else output2(" clothing");
						}
						output2(".");
					}
				}
				wombBonusForAppearance(null, temp);
				temp++;
			}
			if(target.matchedVaginas())
			{
				vaginaBonusForAppearance(null, 0, true);
			}
		}
	}
	if(target.hasVagina() && target.pluggedVaginas() > 0)
	{
		output2("\n\n<b>The smooth plug of set cundarian cum rubs against the lips of your [pc.vaginas] and [pc.eachClit] as you move, a constant source of aggravating arousal that you can do nothing about.</b>");
	}
	//Genderless lovun'
	if(!target.hasGenitals()) {
		output2("\n\nYou have a curious lack of any sexual endowments.");
	}
	//BUNGHOLIO
	if(target.ass != null) {
		output2("\n\nYou have one " + target.assholeDescript(true) + ", placed between your cheeks where it belongs");
		if(target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED))
		{
			if(target.libido() < 50 && target.lust() < 50) output2(" with thin streams of lube leaking out of its edges.");
			else if(target.libido() < 80 && target.lust() < 80) output2(" with thick streams of lubricant oozing constantly from the orifice quite liberally.");
			else output2(" with immense streams of lubricant gushing profusely from the orifice, unrestrained and unending.");
		}
		else if(target.libido() < 50 && target.lust() < 50) //not particularly horny
		{
			//Wetness
			if(target.ass.wetness() < 0) output2(" without any sign of moisture.");
			else if(target.ass.wetness() <= 2) output2(".");
			else if(target.ass.wetness() <= 4) output2(" with slight signs of moisture bordering its edges.");
			else output2(" with occasional beads of lube bordering its edges.");
		}
		else if(target.libido() < 80 && target.lust() < 80) //kinda horny
		{
			//Wetness
			if(target.ass.wetness() < 0) output2(", completely dry of any kind of moisture.");
			else if(target.ass.wetness() <= 2) output2(".");
			else if(target.ass.wetness() <= 3) output2(" with slight signs of moisture bordering its edges.");
			else if(target.ass.wetness() < 5) output2(" with occasional beads of lube bordering its edges.");
			else output2(" with thin streams of lube leaking out of its edges.");
		}
		else //WTF horny!
		{
			//Wetness
			if(target.ass.wetness() < 0) output2(", desperately in need of lubricant.");
			else if(target.ass.wetness() <= 2) output2(".");
			else if(target.ass.wetness() <= 3) output2(" with occasional beads of lubricant dripping from the orifice every so often.");
			else if(target.ass.wetness() < 5) output2(" with thin streams of lubricant occasionally dribbling from the orifice.");
			else output2(" with thick streams of lubricant oozing constantly from the orifice quite liberally.");
		}
		var assSwellBonus:int = target.analPuffiness();
		if(assSwellBonus >= 5) output2(" Your inhumanly soft, incredibly puffy and hyper-sized donut of a pucker protrudes greatly from between your buns like an obscene pubic mound, unable to be ignored when moving and unable to be hidden easily from view.");
		else if(assSwellBonus >= 4) output2(" Your soft, puffy and abnormally large donut of a pucker protrudes obscenely, like an obvious pubic mound that rubs against your buns with every movement you make.");
		else if(assSwellBonus >= 3) output2(" Your soft and puffy " + (target.hasPlumpAsshole() ? "donut of a pucker protrudes obscenely, like a pubic mound that rubs against your buns with every movement you make" : "pucker protrudes obscenely between your buns") + ".");
		else if(assSwellBonus >= 2) output2(" Your soft " + (target.hasPlumpAsshole() ? "donut of a pucker protrudes obscenely, almost like a miniature pubic mound that rubs against your buns with every step you take" : "pucker protrudes obscenely between your buns") + ".");
		else if(assSwellBonus >= 1) output2(" Your pucker is inhumanly soft and puffy, a " + (target.hasPlumpAsshole() ? "beckoning donut with a perfect little hole in the middle" : "little swollen between your buttcheeks") + ".");
		
		wombBonusForAppearance(null, 3);
	}
	
	if(forTarget != null) setTarget(null);
}

public function selectGenderPref():void
{
	clearOutput2();
	output2("Your current preferred gender is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Female", setGenderPref, "female");
	addGhostButton(1, "Male", setGenderPref, "male");
	addGhostButton(2, "Auto", setGenderPref, "auto");
	
	if(pc.hasStatusEffect("Force Fem Gender"))
	{
		output2("<b>Female</b>.");
		output2("\n\nNo matter your femininity value, genitalia presence, or any other contributing factors, where possible you will be considered female.");
		addDisabledGhostButton(0, "Female");
	}
	else if(pc.hasStatusEffect("Force Male Gender"))
	{
		output2("<b>Male</b>.");
		output2("\n\nNo matter your masculinity value, genitalia presence, or any other contributing factors, where possible you will be considered male.");
		addDisabledGhostButton(1, "Male");
	}
	else
	{
		output2("<b>Automatic</b>.");
		output2("\n\nPronouns used for your character will be based on contributions from a number of appearance properties, switching between male & female pronouns as appropriate.");
		addDisabledGhostButton(2, "Auto");
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}
public function setGenderPref(pref:String):void
{
	switch(pref)
	{
		case "auto":
			pc.removeStatusEffect("Force Male Gender");
			pc.removeStatusEffect("Force Fem Gender");
			break;
		case "male":
			pc.removeStatusEffect("Force Fem Gender");
			pc.createStatusEffect("Force Male Gender");
			break;
		case "female":
			pc.removeStatusEffect("Force Male Gender");
			pc.createStatusEffect("Force Fem Gender");
			break;
	}
	
	selectGenderPref();
}

public function selectWingPref():void
{
	clearOutput2();
	output2("Your current [pc.wingNoun] position is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Normal", setWingPref, 0, "Normal Position", "Your [pc.wingsNoun] fold" + (pc.wingCount == 1 ? "s" : "") + " normally behind you.");
	addGhostButton(1, "Body", setWingPref, 1, "Cover Your Body", "Fold your [pc.wingsNoun] to cover part of your body.");
	
	if(pc.statusEffectv1("Wing Position") == 1)
	{
		output2("<b>Body</b>.");
		output2("\n\nYour [pc.wings] " + (pc.wingCount == 1 ? "is" : "are") + " folded over your body, covering you");
		if(pc.hasGenitals() && pc.genitalLocation() <= 1) output2(" and your genitals");
		output2(" almost like clothing but not exactly.");
		addDisabledGhostButton(1, "Body", "Cover Your Body", "Your [pc.wingsNoun] " + (pc.wingCount == 1 ? "is" : "are") + " already positioned to cover your body.");
	}
	else
	{
		output2("<b>Normal</b>.");
		output2("\n\nYour [pc.wings] " + (pc.wingCount == 1 ? "rests in its" : "rest in their") + " normal position behind you.");
		addDisabledGhostButton(0, "Normal", "Normal Position", "Your [pc.wingsNoun] " + (pc.wingCount == 1 ? "is" : "are") + " already positioned normally behind you.");
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}
public function setWingPref(position:int):void
{
	if(!pc.hasStatusEffect("Wing Position"))
	{
		pc.createStatusEffect("Wing Position");
	}
	
	pc.setStatusValue("Wing Position", 1 , position);
	
	selectWingPref();
}

public function dickBonusForAppearance(forTarget:Creature = null, x:int = 0):void
{
	if(forTarget != null) setTarget(forTarget);
	
	trace("DICK FLAVOR FIRED!");
	switch(target.cocks[x].cType)
	{
		//Color shit
		case GLOBAL.TYPE_EQUINE:
			if(target.cocks[x].cockColor == "mottled pink and black") output2(" It’s mottled pink and black in a very animalistic pattern.");
			else output2(" It’s " + target.cocks[x].cockColor + " in color and laced with thick veins.");
			break;
		//More general descripts - gotta be before flare/knot due to "It" sentence subject.
		case GLOBAL.TYPE_RASKVEL:
			output2(" It’s fairly smooth and shapely in appearance, lacking in any severe or stimulating ridges.");
			break;
		//Tentacle cock flavor
		case GLOBAL.TYPE_TENTACLE:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) output2(" The entirety of its " + target.cocks[x].cockColor + " surface is covered in perspiring beads of slick moisture. It");
			else output2(" Its " + target.cocks[x].cockColor + " length");
			output2(" frequently shifts and moves of its own volition, the slightly oversized and mushroom-like head shifting in coloration to purplish-red whenever you become aroused.");
			break;
		//Cat cock flavor
		case GLOBAL.TYPE_FELINE:
			output2(" It ends in a " + (target.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED) ? "tapered" : "rounded") + " head");
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output2(", ringed in small, fleshy nubs that terrans have taken to calling “barbs” in spite of their softness. More of these “barbs” line the shaft, but they’re largest at the base, where they are likely to be rubbed against a clit mid-coitus.");
			else output2(" much like that of a feline.");
			break;
		//Birdy cock flavor
		case GLOBAL.TYPE_AVIAN:
			output2(" It is");
			if(!target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) && !target.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED)) output2(" smooth,");
			output2(" " + target.cockColor(x) + ", slightly wavy in shape, and tapers to a point when erect.");
			break;
		//Snake cock flavor
		case GLOBAL.TYPE_SNAKE:
			if(InCollection(target.originalRace, ["snake", "naga", "naleen", "leithan", "half-leithan"])) output2(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. The shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
			else output2(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. Unlike " + indefiniteArticle(target.originalRace) + " penis, the shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
			break;
		//Anemone cock flavor
		case GLOBAL.TYPE_ANEMONE:
		case GLOBAL.TYPE_SIREN:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output2(" From the slit of your foreskin pokes out a bundle of");
			else output2(" The crown is surrounded by");
			output2(" tiny tentacles with a venomous, aphrodisiac payload. At its base a number of similar, longer tentacles have formed, ");
			if(target.hasSheath(x)) output2("the sheath forcing them to coil around your shaft, ");
			output2("guaranteeing that pleasure will be forced upon your partners.");
			break;
		//Kangawang flavor
		case GLOBAL.TYPE_KANGAROO:
			output2(" It");
			if(target.hasSheath(x)) output2(" usually lies coiled inside a sheath, but");
			output2(" undulates gently and tapers to a point when erect, somewhat like a taproot.");
			break;
		//Draconic Cawk Flava flav
		case GLOBAL.TYPE_DRACONIC:
		case GLOBAL.TYPE_GRYVAIN:
			output2(" With its " + (target.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED) ? "tapered" : "bulbous") + " tip, there are few holes you wouldn’t be able to get into.");
			if(target.cocks[x].cType == GLOBAL.TYPE_DRACONIC) output2(" It has a strange, knot-like bulb at its base, but doesn’t usually flare during arousal as a dog’s knot would.");
			break;
		//Beees
		case GLOBAL.TYPE_BEE:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output2(" There’s a lot in common between human and zil genitals, but the alien member you’re packing has a much longer, stretchier foreskin than most terrans can pack. It also");
			else output2(" The zil-like member you’re packing ");
			output2(" looks vaguely glossy, like you oiled it up just a moment ago.");
			break;
		//Vanae flavor
		case GLOBAL.TYPE_VANAE:
			output2(" The marine-like phallus has a tip capped with a cephalopod-shaped sucker, used to grasp and tug through sensitive depths for insemination or stimulation.");
			break;
		//Nyrean Girl-Cock flavor
		case GLOBAL.TYPE_NYREA:
			output2(" The pseudo-penis is large and thick, with a shape similar to a horse phallus and lacking any veins. The flared tip is ringed with spikes meant to rupture the sperm sacs of a male nyrea and its slit is in the shape of an ‘x’.");
			break;
		//Little Green Man
		case GLOBAL.TYPE_HRAD:
			output2(" The phallic member");
			if(target.skinFurScalesColor() != target.cocks[x].cockColor) output2(" appears very much two-toned, with " + indefiniteArticle(target.skinFurScalesColor()) + " shaft and ending in " + indefiniteArticle(target.cocks[x].cockColor) + ",");
			else output2(" has a");
			output2(" pronounced bullet-shaped tip.");
			break;
		//Shark Cock:
		case GLOBAL.TYPE_SHARK:
			output2( "The aquatic phallus is tapered but still quite tubular in appearance. It glistens like you’ve lubed it up not too long ago and has two pelvic fins framing its base.");
			break;
		// pig dick
		case GLOBAL.TYPE_SWINE:
			output2(" The end twists in a corkscrew pattern, ");
			if(target.cocks[x].cLength() >= 18 && target.cocks[x].cThicknessRatio() <= 0.4) output2("and it is long and thin, like");
			else if(target.cocks[x].cLength() < 18 && target.cocks[x].cThicknessRatio() > 0.4) output2("but its length and width ratio is unlike that of");
			else if(target.cocks[x].cLength() < 18) output2("but it’s not lengthy like");
			else output2("but it’s wider than");
			output2(" a pig’s.");
			break;
		// Moths
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0) output2(" It’s a sensitive tube of stiff muscle that retracts inwards when soft. The head is pointed and slightly damp, suggesting self-lubrication.");
			else output2(" It’s essentially a flexible, semi-hollow, sensitive tube that retracts inwards when not aroused. The head of your moth-cock is slightly pointed but soft, springy and a little moist.");
			break;
	}
	
	//Nubby or Ribbed
	if((target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) && target.cocks[x].cType != GLOBAL.TYPE_FELINE) || target.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED))
	{
		output2(" It is");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output2(" covered in nub-like protrusions, spread out evenly across the shaft");
		else output2(" lined with rib-like protrusions");
		output2(", soft and rounded enough to massage any passage into which it is inserted.");
	}
	//Sheaths
	if(target.hasSheath(x) && !InCollection(target.cocks[x].cType, GLOBAL.TYPE_KANGAROO, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_SIREN))
	{
		if(target.cockTotal() == 1 || (target.cockTotal() > 1 && !target.hasFullSheaths())) output2(" The shaft of your manhood naturally retracts into an animalistic sheath when completely flaccid.");
	}
	//Lube
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED) && target.cocks[x].cType != GLOBAL.TYPE_TENTACLE)
	{
		output2(" Its surface is slick and slippery, covered in an abundant amount of moist lubrication.");
	}
	//Sticky
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_STICKY))
	{
		output2(" The length is glazed in a glossy sheen of saccharine oil that is sticky to the touch.");
	}
	//FLARE STUFF
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))
	{
		if(target.cocks[x].cType == GLOBAL.TYPE_EQUINE) output2(" The ‘head’ of your shaft flares proudly, just like a horse’s.");
		else output2(" The ‘head’ of your shaft widens quite noticeably, the better to stimulate your partners.");
	}
	//"Blunt" head - for non-flared flat-tops
	else if(target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT))
	{
		output2(" Your shaft ends in a blunted tip");
		if(target.cocks[x].cType == GLOBAL.TYPE_EQUINE) output2(" similar to a terran horse’s");
		output2(".");
	}
	//Double-headed
	else if(target.cocks[x].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED))
	{
		output2(" The head of your alien-looking cock consists of bulbous twin glans, ready to double the sensation of penetration.");
	}
	//Demon cock flavor
	if(target.cocks[x].cType == GLOBAL.TYPE_DEMONIC)
	{
		output2(" The ");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output2("flared ");
		else if(target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) output2("blunt ");
		output2("crown is ringed with a circle of rubbery protrusions that grow larger ");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output2("and push the foreskin down ");
		output2("as you get more aroused. The entire thing is shiny and covered with tiny, sensitive nodules that leave no doubt about its demonic influences.");
	}
	//Foreskins
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED) && !InCollection(target.cocks[x].cType, GLOBAL.TYPE_BEE, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_DEMONIC))
	{
		output2(" The head is also covered by stretchy foreskin, ensuring that it is kept protected and sensitive.");
	}
	
	//KNOT STUFF
	if(target.hasKnot(x))
	{
		trace("KNOT FIRED!");
		if(target.cocks[x].cType == GLOBAL.TYPE_DRACONIC)
		{
			if(target.cocks[x].knotMultiplier < 1.4) output2(" The small knot of thicker flesh near the base of your " + target.cockDescript(x) + " is ready to be lodged inside a female.");
			else if(target.cocks[x].knotMultiplier <= 2) output2(" The large bulge of flesh nestles just above the bottom of your " + target.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
			else output2(" The obscenely swollen lump of flesh near the base of your " + target.cockDescript(x) + " looks almost too big for your cock.");
		}
		else if(target.cocks[x].knotMultiplier > 1)
		{
			if(target.cocks[x].knotMultiplier < 1.4) output2(" A small knot of thicker flesh is near the base of your " + target.cockDescript(x) + ", ready to expand to help you lodge it inside a female.");
			else if(target.cocks[x].knotMultiplier <= 2) output2(" A large bulge of flesh nestles just above the bottom of your " + target.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
			else output2(" The obscenely swollen lump of flesh near the base of your " + target.cockDescript(x) + " looks almost too big for your cock.");
		}
		//List thickness
		output2(" The knot is " + Math.round(target.cocks[x].thickness() * target.cocks[x].knotMultiplier * 10)/10 + " inches wide" + (target.cocks[x].cType != GLOBAL.TYPE_DRACONIC ? " when at full size" : ", even when you’re not aroused") + ".");
		//Appended to knot texts!
		if(target.cocks[x].cType == GLOBAL.TYPE_KUITAN)
		{
			output2(" Two smaller ones line the length of the shaft, the hallmark of the kui-tan race.");
		}
	}
	else trace("NO KNOT");
	
	//Painted wieners
	if(target.hasStatusEffect("Painted Penis") && target.statusEffectv1("Painted Penis") == x)
	{
		output2(" Like some kind of perverse canvas, " + (target.cockTotal() == 1 ? "your" : "the") + " cock is painted");
		switch(flags["COCK_PAINTED_DESIGN"])
		{
			case 1: output2(" in a glossy, bright pink with a pattern of red lipstick prints and pretty stars along its length. Lines travel across its form, leading to text that reads, “fuck me” at the root."); break;
			case 2: output2(" in an iridescent, glittery rainbow of fractal patterns all along its length that twinkles in the light. Layered on top its glossy surface is a pattern of kiss marks dominated by a larger pair of plump green lips and text that reads, “Galaxy’s Best Dick” in big looping letters."); break;
			case 3: output2(" in an ultra-shiny black, adorned with a textured design emulating a faux horse harness across its length. A circular ornament near the harness’ baseband bears a line of embossed text that reads, “Free Stud Services” to show how much of a stallion you are."); break;
			case 4: output2(" in a glowing neon orange, striped with black lines to emulate a construction hazard sign. The knot is colored to resemble a massive metallic wrecking ball, chained to the urethra, and decorated with the text that reads, “Bitch Wrecker” in bright orange."); break;
			default: output2(" in a rich, regal-looking blue with jutting purple-to-red rounded-tipped spikes along the shaft and topped with a gem-decorated golden crown at the tip. There is text that reads, “Sex God” on its " + target.knotDescript(x) + ", showcasing its majesty."); break;
		}
	}
	//Candy colored cocks
	else if(target.cocks[x].cockColor == "red and white") {
		output2(" Like a candy cane, " + (target.cockTotal() == 1 ? "your" : "the") + " cock is striped red and white.");
	}
	
	// Mimbranes
	if(x == 0 && target.hasStatusEffect("Mimbrane Cock") && target.statusEffectv3("Mimbrane Cock") > 3)
	{
		output2(" The phallus itself");
		if(!target.isCrotchExposed()) output2(" feels");
		else output2(" looks");
		if(target.statusEffectv3("Mimbrane Cock") < 8) output2(" slightly swollen");
		else if(target.statusEffectv3("Mimbrane Cock") < 13) output2(" noticably inflated");
		else output2(" unnaturally plump");
		if(!target.isCrotchExposed())
		{
			output2(" under your");
			if(target.armor.type == GLOBAL.ARMOR) output2(" armor");
			else output2(" clothing");
		}
		output2(" due to the occupying mimbrane.");
	}
	//Ovipositor
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_OVIPOSITOR))
	{
		if(target.cockTotal() == 1) output2(" While phallic in shape, you are aware that your cock is capable of injecting more than just [target.cumNoun] into an orifice... namely eggs.");
		else output2(" The phallus doubles as an egg-injecting organ.");
	}
	
	if(forTarget != null) setTarget(null);
}

public function vaginaBonusForAppearance(forTarget:Creature = null, x:int = 0, eachOne:Boolean = false):void
{
	if(forTarget != null) setTarget(forTarget);
	
	switch(target.vaginas[x].type)
	{
		//Zil flavor!
		case GLOBAL.TYPE_BEE:
			if(target.vaginas[x].vaginaColor == "black and gold") {
				if(!eachOne) output2(" The exterior folds are a dusky black, while the inner lining of your tunnel is a glorious golden hue.");
				else output2("\nEach vagina’s exterior folds are a dusky black, while the inner linings of your tunnels are a glorious golden hue.");
			}
			break;
		//Naleen flavor
		case GLOBAL.TYPE_NAGA:
			if(!eachOne) output2(" The exterior lips are subtle and narrow, making your lengthy entrance a little more discrete.");
			else output2("\nEach vagina’s exterior lips are subtle and narrow, making your lengthy entrances a little more discrete.");
			break;
		//LEITHAN FLAVOR
		case GLOBAL.TYPE_LEITHAN:
		case GLOBAL.TYPE_EQUINE:
			if(!eachOne) output2(" The exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you’re aroused, you’re told that they wink.");
			else output2("\nEach vagina’s exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you’re aroused, you’re told that they wink.");
			break;
		//Lapinara flavor
		case GLOBAL.TYPE_LAPINARA:
			if(!eachOne) output2(" The exterior lips are chubby and the entrance seems eager to be packed with an ovipositor - or any phallus-shaped object.");
			else output2("\nEach vagina’s exterior lips are chubby and their entrances seem eager to be packed with ovipositors - or any other phallus-shaped objects.");
			break;
		//Vanae flavor
		case GLOBAL.TYPE_VANAE:
			if(!eachOne) output2(" The exterior folds glisten in the light, while the inner tunnel is lined with writhing, tentacle-like feelers.");
			else output2("\nEach vagina’s exterior folds glisten in the light, while the inner tunnels are lined with writhing, tentacle-like feelers.");
			break;
		//Kui-tan flavor
		case GLOBAL.TYPE_KUITAN:
			if(target.vaginas[x].vaginaColor == "black") {
				if(!eachOne) output2(" The exterior folds are dusky black, looking almost animalistic on your body.");
				else output2("\nEach vagina’s exterior folds are dusky black, looking almost animalistic on your body.");
			}
			else {
				if(!eachOne) output2(" The exterior mound is almost heart-shaped, full and thick near the top and narrower further down.");
				else output2("\nEach vagina’s exterior mound is almost heart-shaped, full and thick near the top and narrow at the bottom.");
			}	
			break;
		//Doggie flavor
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_VULPINE:
			if(!eachOne) output2(" The exterior lips are that of a bitch and have a tendency to swell when in heat, giving it a very animalistic bent.");
			else output2("\nEach vagina’s exterior lips are that of a bitch and have a tendency to swell when in heat, giving them a very animalistic bent.");
			break;
		case GLOBAL.TYPE_KORGONNE:
			if(!eachOne) output2(" The surrounding mound and lips is nice and plump, swelling at the slightest provocation.");
			else output2("\nEach vagina’s surrounding mound and lips are nice and plump, swelling at the slightest provocation.");
			output2(" Less visible are the bundled nerves inside, ready to delight at stretching around a knot.");
			break;
		//Kitty flavor
		case GLOBAL.TYPE_FELINE:
			if(!eachOne) output2(" The exterior lips are vestigial and featureless, making your entrance quite modest");
			else output2("\nEach vagina’s exterior lips are vestigial and featureless, making your entrances quite modest");
			if(target.hasFur() || target.hasFeathers()) output2(" and barely visible under your " + ((target.hasFeathers() && target.hasPartFur("leg")) ? "fur" : target.skinFurScales(false,false,false,true)));
			output2(".");
			break;
		//Birdy flavor
		case GLOBAL.TYPE_AVIAN:
			if(!eachOne) output2(" The exterior lips are thin, flat and mostly featureless, appearing much like a bird’s cloaca at glance");
			else output2("\nEach vagina’s exterior lips are thin, flat and mostly featureless, appearing much like a bird’s cloaca at glance");
			if(target.hasFur() || target.hasFeathers()) output2(" and barely visible under your " + ((target.hasFeathers() && target.hasPartFur("leg")) ? "fur" : target.skinFurScales(false,false,false,true)));
			output2(".");
			break;
		//Siren flavor
		case GLOBAL.TYPE_SIREN:
			if(!eachOne) output2(" The exterior opening is framed in writhing tentacles and the interior is lined with aphrodisiac-laced cilia.");
			else output2("\nEach vagina’s exterior openings are framed in writhing tentacles and the interiors are lined with aphrodisiac-laced cilia.");
			break;
		//Goblin flavor
		case GLOBAL.TYPE_GABILANI:
			if(!eachOne) output2(" The special muscles around your vagina are strong and powerful, making it possible to swallow any insertion without the need to push it in.");
			else output2("\nThe special muscles around your talented vaginas are strong and powerful, making it possible to swallow insertions without the need of external forces to push them in.");
			break;
		//Nyrean flavor
		case GLOBAL.TYPE_NYREA:
			if(!eachOne) output2(" The nyrean “pussy” is very soft, warm and puffy. Its interior is coated with your [target.girlCum], ready to rear any eggs you might have the (mis)fortune of fertilizing.");
			else output2("\nEach of your nyrean “pussies” are very soft, warm and puffy. The interior is coated with your [target.girlCum], ready to rear any eggs you might have the (mis)fortune of fertilizing.");
			break;
		//Flower flavor
		case GLOBAL.TYPE_FLOWER:
			if(!eachOne) output2(" Like an orchid, the exterior opening is framed in beautifully-colored flower petals and has a cute freckle dotting " + (target.vaginas[x].clits == 1 ? "its" : "every") + " clit.");
			else output2("\nLike a " + (target.totalVaginas(GLOBAL.TYPE_FLOWER) == 2 ? "pair" : "bouquet") + " of orchids, each vagina’s exterior openings are framed in beautifully-colored flower petals and has a cute freckle dotting every clit.");
			break;
		//Deer flavor
		case GLOBAL.TYPE_DEER:
			if(!eachOne) output2(" Your labia are swollen and fat, outlining your vagina, and often shine with a wet sheen regardless of your arousal. You’re told that they wink when you’re aroused.");
			else output2("\nEach vagina’s labia are swollen and fat, often shining with a wet sheen regardless of your arousal. You’re told that they wink when you’re aroused.");
			break;
		//Shark Vagina:
		case GLOBAL.TYPE_SHARK:
			if(!eachOne) output2(" The exterior lips are puffy and framed by fin-like flaps, while the interior of your vaginal canal is filled with tiny cilia that massage and pull any invaders deeper in.");
			else output2("\nEach vagina’s exterior lips are puffy and framed by fin-like flaps, while their interiors are filled with tiny cilia that massage and pull any invaders deeper in.");
			break;
		//Pork flavor
		case GLOBAL.TYPE_SWINE:
			if(!eachOne) output2(" The");
			else output2("\nEach vagina’s");
			output2(" exterior lips are typically featureless, except for when you’re aroused and they swell outward.");
			break;
		//Attack of the mouthginas!
		case GLOBAL.TYPE_MOUTHGINA:
			var mouthSize:String = "plump, bee stung";
			var mouthPuff:Number = target.vaginalPuffiness(x);
			if(mouthPuff <= 1) mouthSize = (RandomInCollection(["small", "petite", "supple"]) + ", womanly");
			else if(mouthPuff <= 2) mouthSize = (RandomInCollection(["pouty", "puffy", "cushiony", "plump", "succulent", "juicy", "luscious", "voluptuous"]) + ", bee-stung");
			else if(mouthPuff <= 3) mouthSize = (RandomInCollection(["hypnotic", "dazzling", "fat", "large", "engorged", "constantly pursed", "bloated", "pillowy", "whorish", "‘O’-shaped", "permanently puckered"]) + ", oversized");
			else mouthSize = (RandomInCollection(["jacquesian", "scylla-tier", "universe-distorting"]) + ", hyper-sized");
			
			if(!eachOne) output2(" Instead of the usual inner and outer labia, your opening is shaped like a mouth, with " + mouthSize + " lips, frozen in a permanent seductive expression.");
			else output2("\nInstead of the usual inner and outer labia, your vaginal openings are shaped like mouths, each with " + mouthSize + " lips, frozen in a permanent seductive expression.");
			if(target.vaginas[x].clits >= 1)
			{
				if(target.vaginas[x].clits == 1) output2(" A single metallic-colored, polished clit adorns your muff,");
				if(target.vaginas[x].clits == 2) output2(" A couple of metallic-colored, polished clits adorn your muff,");
				if(target.vaginas[x].clits > 2) output2(" Several metallic-colored, polished clits adorn your muff,");
				if(target.isBimbo()) output2(" looking totally adorable and");
				else if(target.vaginas[x].clits > 2) output2(" giving it a punk-ish look and");
				output2(" drawing all the attention - or wandering hands - to ");
				if(!eachOne) output2(" itself");
				else output2(" themselves");
				output2(".");
			}
			break;
	}
	
	//Tongue
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_TONGUE))
	{
		if(!eachOne) output2(" The interior also hosts a thick erogenous tongue.");
		else output2(" Their interiors each house a thick erogenous tongue.");
	}
	//Nubby
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_NUBBY) && target.vaginas[x].type != GLOBAL.TYPE_SIREN) {
		if(!eachOne) output2(" The lips and insides are covered in numerous nub-like protrusions.");
		else output2(" Their lips and insides are covered in numerous nub-like protrusions.");
	}
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_RIBBED))
	{
		if(!eachOne) output2(" The insides are lined with rib-like protrusions, soft and rounded enough to massage any insertion.");
		else output2(" Their insides are lined with rib-like protrusions, soft and rounded enough to massage any insertion.");
	}
	//Pumped
	var wasPumped:Boolean = target.hasStatusEffect("Pussy Pumped");
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && target.vaginas[x].type != GLOBAL.TYPE_MOUTHGINA)
	{
		if(!eachOne) output2(" The whole thing is ridiculously puffy and lush" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". Even" + (target.isCrotchExposed() ? " if you tried, there is just no hiding its" : " under clothing, it generates a") + " considerable camel-toe.");
		else output2(" They’re ridiculously puffy and lush" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". Even" + (target.isCrotchExposed() ? " if you tried, there is just no hiding their" : " under clothing, they fully display their") + " monumental moose-knuckles.");
	}
	//Slightly pumped
	else if(target.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && target.vaginas[x].type != GLOBAL.TYPE_MOUTHGINA)
	{
		if(!eachOne) output2(" The whole thing puffs out slightly, seemingly constantly engorged" + (wasPumped ? " ever since your play with a pussy pump" : " with girl flesh") + ".");
		else output2(" They’re puffed out slightly, seemingly constantly engorged" + (wasPumped ? " ever since your play with a pussy pump" : " with girl flesh") + ".");
	}
	//Ovipositor
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_OVIPOSITOR))
	{
		if(!eachOne) output2(" Moving its internal muscles, you know it has the ability to lay eggs into another orifice.");
		else output2(" Moving their internal muscles, you know they have the ability to lay eggs into another orifice.");
	}
	
	if(forTarget != null) setTarget(null);
}

public function wombBonusForAppearance(forTarget:Creature = null, x:int = 0):void
{
	if(forTarget != null) setTarget(forTarget);
	
	// Womb contents
	if(target.isPregnant(x))
	{
		var pData:PregnancyData = target.pregnancyData[x];
		if(pData.pregnancyBellyRatingContribution >= 10 && pData.pregnancyIncubation > -1)
		{
			output2(" Its " + (x < 3 ? "womb" : "inside") + " is currently gestating ");
			switch(PregnancyManager.getPregnancyChildType(target, x))
			{
				case GLOBAL.CHILD_TYPE_LIVE: output2(pData.pregnancyQuantity == 1 ? "a child" : "children"); break;
				case GLOBAL.CHILD_TYPE_EGGS: output2(pData.pregnancyQuantity == 1 ? "an egg" : "eggs"); break;
				case GLOBAL.CHILD_TYPE_SEED: output2(pData.pregnancyQuantity == 1 ? "a seedling" : "seedlings"); break;
				default: output2("an unknown mass"); break;
			}
			output2(".");
		}
	}
	
	if(forTarget != null) setTarget(null);
}

public function selectTentacleLegsPref():void
{
	clearOutput2();
	output2("Your lower tentacles are currently set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Normal", setTentacleLegsPref, undefined, "Normal Form", "Support yourself on a writhing mass of tentacles.");
	addGhostButton(1, "Legs", setTentacleLegsPref, undefined, "Legs Form", "Form your tentacles into two legs.");
	
	if(!pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS))
	{
		output2("<b>Legs</b>.");
		output2("\n\nYour lower tentacles are wound up together, acting as a facsimile of two normal legs.");
		addDisabledGhostButton(1, "Legs", "Legs Form", "Your tentacles are already formed into legs.");
	}
	else
	{
		output2("<b>Normal</b>.");
		output2("\n\nYour lower tentacles are an ever-shifting, writhing mass.");
		addDisabledGhostButton(0, "Normal", "Normal Form", "Your lower tentacles are already a shapeless mass of tentacles.");
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}
public function setTentacleLegsPref():void
{
	if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS))
	{
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.removeLegFlag(GLOBAL.FLAG_AMORPHOUS);
		pc.legCount = 2;
		pc.genitalSpot = 0;
	}
	else
	{
		pc.removeLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
		pc.legCount = 1;
		pc.genitalSpot = 1;
	}
	
	selectTentacleLegsPref();
}

// Color Checks
public function colorIsMetallic(sColor:String = ""):Boolean
{
	return (InCollection(sColor, "bronze", "copper", "silver", "gold", "platinum", "sable", "onyx", "brass", "cobalt"));
}
public function colorIsGemstone(sColor:String = ""):Boolean
{
	return (InCollection(sColor, "crimson", "garnet", "ruby", "citrine", "topaz", "amber", "peridot", "emerald", "jade", "turquoise", "aquamarine", "lapis", "sapphire", "violet", "amethyst", "opal", "pearl", "crystal", "diamond"));
}
public function colorIsLuminous(sColor:String = ""):Boolean
{
	return (sColor.indexOf("luminous") != -1 || sColor.indexOf("glowing") != -1 || sColor.indexOf("fiery") != -1);
}

