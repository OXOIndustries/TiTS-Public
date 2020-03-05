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
		backToPrimaryOutput(true);
		userInterface.showingPCAppearance = false;
	}
}

public function backToAppearance(forTarget:Creature):void
{
	showLocationName();
	appearance(forTarget);
}

public function testAppearance(arg:String = ""):void
{
	if(arg == "")
	{
		clearOutput();
		output("Who test?");
		clearMenu();
		
		var npcList:Array = [];
		//npcList.push(["Button Name", arg]);
		npcList.push(["Azra", "AZRA"]);
		npcList.push(["Penny", "PENNY"]);
		npcList.push(["Anno", "ANNO"]);
		npcList.push(["Syri", "SYRI"]);
		npcList.push(["Emmy", "EMMY"]);
		npcList.push(["Gianna", "GIANNA"]);
		npcList.push(["Kiro", "KIRO"]);
		npcList.push(["Bea", "BEA"]);
		npcList.push(["Gene", "GENE"]);
		npcList.push(["Jumper", "Jumper"]);
		
		var btnSlot:int = -5;
		var i:int = 0;
		while (true)
		{
			if (i % 10 == 0 && (i < npcList.length || !i))
			{
				btnSlot += 5;
				addButton((btnSlot + 14), "Abort", mainGameMenu);
			}
			
			if (i == npcList.length) break;
			
			addButton(btnSlot, npcList[i][0], testAppearance, npcList[i][1]);
			btnSlot++;
			i++;
		}
		return;
	}
	switch(arg)
	{
		case "Jumper": appearance(new JumperBored(),testAppearance); break;
		default:
			if(chars[arg] != undefined) appearance(chars[arg], testAppearance);
			else
			{
				clearOutput();
				output("Character with ID: '" + arg + "' does not exist!");
				clearMenu();
				addButton(0, "Try Again", testAppearance);
				addButton(14, "Abort", mainGameMenu);
			}
			break;
	}
}

public function appearance(forTarget:Creature, backTarget:Function = null):void
{
	setTarget(forTarget);

	var rando:int = 0;
	var feedVal:int;
	var i:int = 0;

	var outputRouter:Function = output2;

	// For the PC
	if(target == pc) 
	{
		clearOutput2();
		showPCBust();
		//showName("\nAPPEARANCE");
		setLocation("", "CODEX", "APPEARANCE");
		clearGhostMenu();
		addGhostButton(14, "Back", pcAppearance);
		if(debug) addGhostButton(13, ("Debug: " + (debug ? "ON" : "OFF")), Cheats.toggleDebug, undefined, "Toggle Debug", "Turn debug mode off.");
		//Creation stuff
		if(target.hasStatusEffect("In Creation"))
		{
			outputRouter("You are currently creating yourself!");
			outputRouter("\n\n<i>(Detailed information about your appearance will be displayed here.)</i>");
			return;
		}
	}
	// For the NPCs
	else
	{
		clearOutput();
		//NPCs use main output window.
		showName("\n" + target.short.toUpperCase());
		//setLocation("", target.short.toUpperCase(), "APPEARANCE");
		showBust(target.bustDisplay);
		outputRouter = output;
		switch(target)
		{
			default:
				break;
		}
		if(backTarget != null)
		{
			clearMenu();
			addButton(0,"Next",backTarget);
		}
		if (target.hasPerk("Custom Appearance"))
		{
			if (target is Lorelei) loreleiLooksGood();
			//Safeguard
			else loreleiLooksGood();
			return;
		}
	}
	author("Fenoxo’s Code");
	
	//Stinging Bruises & Lash Marks
	if (target.hasStatusEffect("Stinging Bruises")) target.HP(target.statusEffectv1("Stinging Bruises"));
	if (target.hasStatusEffect("Lash Marks")) target.HP(target.statusEffectv1("Lash Marks"));
	
	// Refresh statbars
	updatePCStats();
	
	//Overall
	if(target.originalRace == target.race() || target != pc) outputRouter((target == pc ? "You are":"[target.Short] is") + " " + (target.originalRace.indexOf("?") != -1 ? "of an unknown race" : indefiniteArticle(target.originalRace)) + ".");
	else
	{
		outputRouter((target == pc ? "You":"[target.HeShe]") + " started your journey as " + indefiniteArticle(target.originalRace) + ", but " + (target == pc ? "you’ve":"[target.heShe] has") + " become "+indefiniteArticle(target.race())+" over the course of " + (target == pc ? "your":"[target.hisHer]") + " adventures.");
	}
	outputRouter(" " + (target == pc ? "You’re":"[target.HeShe] is") + " a good " + Math.floor(target.tallness / 12) + " feet");
	if(target.tallness % 12 != 0) outputRouter(" and " + Math.round(target.tallness % 12) + " inches");
	outputRouter(" tall by ancient imperial measurements and " + Math.round(target.tallness * 0.0254 * 100)/100 + " meters in the more accepted metric system.");
	
	var isNude:Boolean = (target.isNude());
	var showTits:Boolean = (target.isChestVisible() && target.hasBreasts());
	var showCrotch:Boolean = (target.isCrotchVisible());
	var showAss:Boolean = (target.isAssVisible());
	var allExposed:Boolean = (target.isChestExposed() && target.isCrotchExposed() && target.isAssExposed());
	if(target == pc)
	{
		outputRouter(" Right now, you’re");
		if(isNude || target.armor is EmptySlot) outputRouter(" not wearing a single scrap of armor,");
		else outputRouter(" wearing " + target.armor.description + ",");
		if(isNude || target.lowerUndergarment is EmptySlot) outputRouter(" going commando down south,");
		else outputRouter(" using " + target.lowerUndergarment.description + " for underwear,");
		if(isNude || target.upperUndergarment is EmptySlot) outputRouter(" and letting your torso breathe, unrestricted by any undertop.");
		else outputRouter(" and girding your upper body with " + target.upperUndergarment.description + ".");
		if(!isNude && (showTits || showCrotch || showAss))
		{
			outputRouter(" Your outfit leaves little to the imagination, " + (!allExposed ? "revealing" : "exposing") + " your");
			if(showTits)
			{
				outputRouter(" breasts");
				if(showCrotch && showAss) outputRouter(",");
				else if(target.isCrotchVisible() || showAss) outputRouter(" and");
			}
			if(showCrotch)
			{
				outputRouter(" crotch");
				if(target.isAssVisible()) outputRouter(" and");
			}
			if(showAss) outputRouter(" ass");
			outputRouter(" to the world.");
		}
		if(target.isCoveredUp())
		{
			outputRouter(" Though to play it safe - at least in public - you have managed to cover yourself up");
			if(target.accessory.hasFlag(GLOBAL.ITEM_FLAG_COVER_BODY)) outputRouter(" with " + target.accessory.description);
			outputRouter(".");
			allExposed = false;
		}
		if(allExposed && !target.canUseTailsOrFurAsClothes())
		{
			var exhibitionism:Number = target.exhibitionism();
			if(exhibitionism >= 100) outputRouter(" You’re a shameless exhibitionist and proud of it, flaunting your naked body and giving the entire galaxy quite an eyeful!");
			else if(exhibitionism >= 66) outputRouter(" Your naked body is like a second outfit for you, giving you naughty thoughts when in the public’s gaze.");
			else if(exhibitionism >= 50) outputRouter(" Maybe you’re some kind of nudist, but it’s not like you mind being naked anyway.");
			else if(exhibitionism >= 33) outputRouter(" It’s okay to show some nudity once in a while, right?");
			else if(exhibitionism >= 20) outputRouter(" If anyone sees you this way, you can’t help but be aroused a little.");
			else if(exhibitionism >= 10) outputRouter(" If anyone sees you now, they’re sure to think you’re a nudist...");
			else outputRouter(" If anyone sees you now, they’re sure to think you’re a nudist!");
		}
		
		// Goo Armor Bonus text
		if(target.armor is GooArmor) outputRouter("\n\n" + gooArmorDetails());
	}
	//Face
	outputRouter("\n\n");
	var faceFurScales:String = target.skinFurScales(true,true,false,true);
	if(target.hasFaceFlag(GLOBAL.FLAG_FURRED)) faceFurScales = target.furColor + " fur";
	else if(target.hasFaceFlag(GLOBAL.FLAG_SCALED)) faceFurScales = target.scaleColor + " scales";
	else if(target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) faceFurScales = target.furColor + " feathers";
	else if(target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) faceFurScales = target.scaleColor + " chitin";
	
	switch(target.faceType)
	{
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_DZAAN:
		case GLOBAL.TYPE_HUMAN:
		case GLOBAL.TYPE_NALEEN_FACE:
		case GLOBAL.TYPE_SIREN:
		case GLOBAL.TYPE_SIMII:
			if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || target.faceType == GLOBAL.TYPE_NALEEN_FACE || InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX, GLOBAL.SKIN_TYPE_PLANT, GLOBAL.SKIN_TYPE_GEL])) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is human in shape and structure, with " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter("Under " + (target == pc ? "your":"[target.name]’s") + " " + faceFurScales + " " + (target == pc ? "you have":"[target.heShe] has") + " a human-shaped head with " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is fairly human in shape, but is covered in " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is human-shaped with " + target.skin(true,true,true) + " and lightly framed with " + faceFurScales + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is mostly human in shape, decorated with " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_BARK) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is mostly human in shape, with hints of " + faceFurScales + " over " + target.skin(true,true,true) + ".");
			// Special addons
			if(target.faceType == GLOBAL.TYPE_SIREN) outputRouter(" A set of razor-sharp, retractable shark-teeth fill " + (target == pc ? "your":"[target.hisHer]") + " " + (target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? "extended maw" : "mouth") + " and gives " + (target == pc ? "your":"[target.hisHer]") + " visage a" + (target.hasFaceFlag(GLOBAL.FLAG_MUZZLED) ? "n" : " slightly") + " angular appearance.");
			else if(target.faceType == GLOBAL.TYPE_NALEEN_FACE) outputRouter(" A set of retractable, needle-like fangs sit in place of " + (target == pc ? "your":"[target.hisHer]") + " canines, just like a naleen.");
			else if(target.faceType == GLOBAL.TYPE_ARACHNID) outputRouter(" A set of spider-like fangs protrude over " + (target == pc ? "your":"[target.hisHer]") + " bottom lip.");
			else if(target.faceType == GLOBAL.TYPE_DZAAN) outputRouter(" Small spots of keratin growths protrude in various areas of " + (target == pc ? "your":"[target.hisHer]") + " face, most notably near the forehead, eyes and cheekbones.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(!target.hasMuzzle())
			{
				if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX])) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is human in shape and structure, with " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter("Under " + (target == pc ? "your":"[target.name]’s") + " " + faceFurScales + " " + (target == pc ? "you have":"[target.heShe] has") + " a human-shaped head with " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is fairly human in shape, but is covered in " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is human-shaped with " + target.skin(true,true,true) + " and lightly framed with " + faceFurScales + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is mostly human in shape, decorated with " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				else if(target.skinType == GLOBAL.SKIN_TYPE_BARK) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is mostly human in shape, with hints of " + faceFurScales + " over " + target.skin(true,true,true) + ".");
				outputRouter(" The constant twitches of " + (target == pc ? "your":"[target.hisHer]") + " nose and the length of " + (target == pc ? "your":"[target.hisHer]") + " incisors gives " + (target == pc ? "your":"[target.hisHer]") + " visage a hint of bunny-like cuteness.");
			}
			else
			{
				outputRouter((target == pc ? "You have":"[target.Name] has") + " a short-muzzled face");
				if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES]) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter(" covered in " + faceFurScales + ".");
				else if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FEATHERS, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_BARK]) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter(" framed with " + faceFurScales + ".");
				else if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX])) outputRouter(" with " + target.skin(true,true,true) + ".");
				else outputRouter(".");
				outputRouter(" The constant twitches of " + (target == pc ? "your":"[target.hisHer]") + " nose and the length of " + (target == pc ? "your":"[target.hisHer]") + " incisors gives " + (target == pc ? "your":"[target.hisHer]") + " visage an obvious bunny-like cuteness.");
			}
			break;
		case GLOBAL.TYPE_HUMANMASKED:
			//appearance for skinheads
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinType != GLOBAL.SKIN_TYPE_SCALES && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_SCALED)) {
				outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is human in shape and structure, with " + target.skin(true,true,true));
				if(InCollection(target.skinTone, ["black", "ebony", "sable"]) && InCollection(target.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO])) outputRouter(", though with your dusky hue, the black kui-tan mask " + (target == pc ? "you sport":"[target.heShe] sports") + " isn’t properly visible.");
				else outputRouter(", though it is decorated with a sly-looking kui-tan mask over " + (target == pc ? "your":"[target.hisHer]") + " eyes.");
			}
			//appearance furscales
			else {
				var furScaleColor:String = "";
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) furScaleColor = target.furColor;
				else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) furScaleColor = target.scaleColor;
				//(black/midnight furscales)
				if(InCollection(furScaleColor, ["black", "midnight"])) outputRouter("Under " + (target == pc ? "your":"[target.name]’s") + " " + faceFurScales + " hides a black kui-tan mask, barely visible due to " + (target == pc ? "your":"[target.hisHer]") + " inky hue, and ");
				else 
				{
					if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " " + faceFurScales + " are decorated with a sly-looking kui-tan mask, and ");
					else outputRouter((target == pc ? "Your":"[target.Name]’s") + " " + faceFurScales + " is decorated with a sly-looking kui-tan mask, and ");
				}
				outputRouter("beneath sits " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin(true,true,true) + ".");
			}
			break;
		case GLOBAL.TYPE_KUITAN:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a triangular kui-tan face, replete with sensitive whiskers and a little black nose; a mask shades the space around " + (target == pc ? "your":"[target.hisHer]") + " eyes, set apart from " + (target == pc ? "your":"[target.hisHer]") + " " + faceFurScales + " by a band of white.");
			//(if skin)
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter(" It looks a bit strange with only the skin and no fur.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter(" The presence of said scales gives " + (target == pc ? "your":"[target.hisHer]") + " visage an eerie look, more reptile than mammal.");
			break;
		case GLOBAL.TYPE_SHEEP:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a short, " + target.mf("blunt","cute", true) + " muzzle much like a sheep’s.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of " + faceFurScales + " decorates it.");
			break;
		case GLOBAL.TYPE_VULPINE:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a tapered, shrewd-looking vulpine face with a speckling of downward-curved whiskers just behind the nose.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter(" Oddly enough, there’s no fur on " + (target == pc ? "your":"[target.hisHer]") + " animalistic muzzle, just " + faceFurScales + "."); 
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of " + faceFurScales + " decorates " + (target == pc ? "your":"[target.hisHer]") + " muzzle.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter(" Strangely, " + faceFurScales + " adorn every inch of " + (target == pc ? "your":"[target.hisHer]") + " animalistic visage.");
			break;
		case GLOBAL.TYPE_MOUSEMAN:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is generally human in shape and structure, with " + target.skin(true,true,true));
			if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS]) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(" under " + (target == pc ? "your":"[target.hisHer]") + " " + faceFurScales);
			outputRouter(" and mousey buckteeth.");
			break;
		case GLOBAL.TYPE_MOUSE:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a snubby, tapered mouse’s face, with whiskers, a little pink nose, and ");
			if(!InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS]) && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_SCALED) && !target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(target.skin(true,true,true));
			else outputRouter(target.skin(true,true,true) + " under " + (target == pc ? "your":"[target.hisHer]") + " " + faceFurScales);
			outputRouter(". Two large incisors complete it.");
			break;
		//Naga (same as snake)
		case GLOBAL.TYPE_SNAKE:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a face that resembles a combination between a human’s and a snake’s,");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter(" covered in a layer of " + faceFurScales + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter(" covered in " + faceFurScales + ", as one would expect of such a reptilian visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(" framed with a border of " + faceFurScales + ", looking very much like a mythical feathered serpent.");
			else outputRouter(" oddly uncovered by scales. Instead, " + (target == pc ? "your":"[target.hisHer]") + " snake-like snout is covered in " + target.skin(true,true,true) + ".");
			if(rand(2) == 0) outputRouter(" A set of retractable, needle-like fangs sit in place of " + (target == pc ? "your":"[target.hisHer]") + " canines and are ready to dispense their venom.");
			else outputRouter(" In addition, a pair of poisonous fangs protrude from " + (target == pc ? "your":"[target.hisHer]") + " mouth over " + (target == pc ? "your":"[target.hisHer]") + " lower lip.");
			break;
		//horse-face
		case GLOBAL.TYPE_EQUINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is almost entirely equine in appearance, even having " + faceFurScales + ". Underneath the fur, " + (target == pc ? "you believe you have":"[target.heShe] has") + " " + target.skin(true,false,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " the face and head structure of a horse, overlaid with " + faceFurScales + ".");
			else outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is equine in shape and structure. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//dog-face
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a dog’s face, complete with wet nose and panting tongue. " + (target == pc ? "You’ve got":"[target.HeShe] has") + " " + faceFurScales + ", hiding " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin(true,true,true) + " underneath " + (target == pc ? "your":"[target.hisHer]") + " furry visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " the facial structure of a dog, wet nose and all, but overlaid with " + faceFurScales + ".");
			else outputRouter((target == pc ? "You have":"[target.Name] has") + " a dog-like face, complete with a wet nose. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//wolf-face
		case GLOBAL.TYPE_LUPINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a wolf’s face, wide and majestic, with jaws filled with sharp teeth. " + (target == pc ? "You’ve got":"[target.HeShe] has") + " " + faceFurScales + ", hiding " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin(true,true,true) + " underneath " + (target == pc ? "your":"[target.hisHer]") + " furry visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " the facial structure of a wolf, wide and majestic, but overlaid with " + faceFurScales + ", and having jaws filled with sharp teeth.");
			else outputRouter((target == pc ? "You have":"[target.Name] has") + " a wolf-like face, wide and majestic, with jaws filled with sharp teeth. The odd visage is hairless and covered with " + faceFurScales + ".");
			break;
		//Knock-off dog-face
		case GLOBAL.TYPE_WORG:
			//Fur/Feather:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) 
			{
				outputRouter((target == pc ? "You have":"[target.Name] has") + " the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from " + (target == pc ? "your":"[target.hisHer]") + " lips. " + StringUtil.capitalize(faceFurScales) + " perfectly conceal" + ((target.hasScales() || target.hasFeathers()) ? "":"s") + " your " + target.skin(true,true,true) + ".");
			}
			//Scales:
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED))
			{
				outputRouter((target == pc ? "You have":"[target.Name] has") + " the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from " + (target == pc ? "your":"[target.hisHer]") + " lips. It is overlaid with " + faceFurScales + ".");
			}
			//Others:
			else outputRouter((target == pc ? "You have":"[target.Name] has") + " the face of a mythical worg, similar to a wolf but wider, with stronger jaws and sharper canines poking out from " + (target == pc ? "your":"[target.hisHer]") + " lips. The odd visage is hairless and covered with " + target.skinFurScales(true,true,true,true) + ".");
			break;
		//cat-face
		case GLOBAL.TYPE_FELINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a cat-like face, complete with a moist nose and whiskers. " + (target == pc ? "Your":"[target.HisHer]") + " " + faceFurScales + " hides " + target.skin(true,true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " facial structure blends humanoid features with those of a cat. A moist nose and whiskers are included, but overlaid with " + faceFurScales + ".");
			else outputRouter((target == pc ? "You have":"[target.Name] has") + " a cat-like face, complete with a cute, moist nose and whiskers. The " + target.skin(true,true,true) + " that is revealed by " + (target == pc ? "your":"[target.hisHer]") + " lack of fur looks quite unusual on so feline a face.");
			break;
		//bird-face
		case GLOBAL.TYPE_AVIAN:
			if(target.hasBeak()) outputRouter((target == pc ? "You have":"[target.Name] has") + " a bird-like face, complete with " + indefiniteArticle(target.lipColor) + " beak");
			else outputRouter((target == pc ? "Your":"[target.Name]’s") + " facial structure blends humanoid features with those of a bird, but lacking the signature beak");
			if(target.hasMuzzle()) {
				if(target.hasBeak()) outputRouter(" - rather it looks like a beak, but is more like a muzzle in structure, retaining lips and teeth instead of sharp beak edges. But they are almost impossible to spot without closer inspection");
				else outputRouter(". Instead " + (target == pc ? "you have":"[target.heShe] has") + " a toothy reptilian muzzle, making your visage rather unsettling");
			}
			outputRouter(".");
			if(target.hasFeathers() || target.hasScales() || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED))
			{
				outputRouter(" It is adorned with " + faceFurScales);
				if(target.hasMuzzle() && !target.hasBeak()) outputRouter(", completing the image");
				outputRouter(".");
			}
			else outputRouter(" The lack of feathers on " + (target == pc ? "your":"[target.hisHer]") + " " + target.skinNoun() + " looks rather strange.");
			if(target.hasBeak() && !target.hasFeathers() && !target.hasFur() && target.isBald()) outputRouter(" " + (target == pc ? "You":"[target.heShe]") + " somewhat resembles a vulture.");
			break;
		//Minotaaaauuuur-face
		case GLOBAL.TYPE_BOVINE:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. " + (target == pc ? "Your":"[target.HisHer]") + " " + faceFurScales + " thickens noticably on " + (target == pc ? "your":"[target.hisHer]") + " head, looking shaggy and more than a little monstrous once laid over " + (target == pc ? "your":"[target.hisHer]") + " visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face resembles an anthropomorphic bovine’s, though strangely, it is covered in shimmering scales, right up to the flat, cow-like nose that protrudes from " + (target == pc ? "your":"[target.hisHer]") + " face.");
			else {
				outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose.");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO && !target.hasFaceFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Despite your lack of fur elsewhere, " + (target == pc ? "your":"[target.hisHer]") + " visage does have a short layer of " + target.furColor + " fuzz.");
			}
			break;
		//Panda-face
		case GLOBAL.TYPE_PANDA:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. " + (target == pc ? "Your":"[target.HisHer]") + " " + faceFurScales + " hides " + target.skin(true,true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.HisHer]") + " face resembles an anthropomorphic panda’s, though strangely, it is covered in shimmering scales, right up to " + (target == pc ? "your":"[target.hisHer]") + " black nose.");
			else {
				outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of an anthropomorphic panda, with a short muzzle and black nose.");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO && !target.hasFaceFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Despite " + (target == pc ? "your":"[target.hisHer]") + " lack of fur elsewhere, " + (target == pc ? "your":"[target.hisHer]") + " visage does have a short layer of " + target.furColor + " fuzz.");
			}
			break;
		case GLOBAL.TYPE_REDPANDA:
			outputRouter(RandomInCollection([
				(target == pc ? "You have":"[target.Name] has") + " a short, cute muzzle much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s. A coat of patterned " + target.furColor + " fur decorates " + (target == pc ? "your":"[target.hisHer]") + " visage.",
				(target == pc ? "Your face":"[target.Name]’s face") + " sports a blunt muzzle, much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s. A coat of patterned " + target.furColor + " fur decorates " + (target == pc ? "your":"[target.hisHer]") + " visage.",
				(target == pc ? "Your":"[target.Name]’s") + " face has distinct markings and patterns along " + (target == pc ? "your":"[target.hisHer]") + " " + target.furColor + ", short muzzle, much like a " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda’s."
			]));
			break;
		//Lizard-face
		case GLOBAL.TYPE_LIZAN:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of a lizard. Between the toothy maw, pointed snout, and the layer of " + faceFurScales + " covering " + (target == pc ? "your":"[target.hisHer]") + " face, " + (target == pc ? "you have":"[target.heShe] has") + " quite the fearsome visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is that of a lizard, complete with a toothy maw and pointed snout. " + StringUtil.upperCase(faceFurScales) + " complete the look, making " + (target == pc ? "you look":"[target.himHer] look") + " quite fearsome.");
			else outputRouter((target == pc ? "You have":"[target.Name] has") + " a face resembling that of a lizard, and with " + (target == pc ? "your":"[target.hisHer]") + " toothy maw, you have quite a fearsome visage. The reptilian visage does look a little odd with just " + target.skin(true,true,true) + " and not a single scale.");
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " head pushes out into a muzzle with white fur across the nose and mouth as well as in a wide stripe up the center of " + (target == pc ? "your":"[target.hisHer]") + " brow, giving " + (target == pc ? "you":"[target.himHer]") + " the appearance of a humanoid badger. The rest of it is wrapped in " + faceFurScales + " that covers " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin(true,true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter((target == pc ? "Your":"[target.Name]’s") + " head pushes out into a muzzle with white scales across " + (target == pc ? "your":"[target.hisHer]") + " nose and mouth as well as in a wide stripe up the center of " + (target == pc ? "your":"[target.hisHer]") + " brow, giving " + (target == pc ? "you":"[target.himHer]") + " the appearance of a humanoid, scaled badger. The rest of it is wrapped in " + faceFurScales + " that covers " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin(true,true,true) + ".");
			else outputRouter((target == pc ? "Your":"[target.Name]’s") + " head pushes out into a curiously hairless badger-face, covered only with " + target.skin(true,true,true) + ".");
			break;
		case GLOBAL.TYPE_DRACONIC:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is a narrow, reptilian muzzle. It looks like a predatory lizard’s at first glance, but with an unusual array of spikes along the under-jaw. It gives " + (target == pc ? "you":"[target.himHer]") + " a regal but fierce visage. Opening " + (target == pc ? "your":"[target.hisHer]") + " mouth reveals several rows of dagger-like sharp teeth. The fearsome visage is decorated by " + faceFurScales + ".");
			break;
		case GLOBAL.TYPE_KANGAROO:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is shaped like that of a kangaroo ");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasFaceFlag(GLOBAL.FLAG_FURRED)) outputRouter("but bald, not covered in fur");
			else outputRouter("and covered with " + faceFurScales);
			outputRouter(". It’s almost rabbit-like, except for the length of " + (target == pc ? "your":"[target.hisHer]") + " muzzle.");
			break;
		case GLOBAL.TYPE_GABILANI:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " a narrow-jawed gabilani face");
			if(target.skinType != GLOBAL.SKIN_TYPE_SKIN) outputRouter(", covered in " + faceFurScales);
			else outputRouter(", covered with " + faceFurScales);
			outputRouter(", appearing almost goblinoid with alien facial features.");
			break;
		case GLOBAL.TYPE_FROG:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is anuran in shape, reflecting a frog-like appearance. The smooth visage is further exaggerated with a notable lack of a nose, having broadly spaced nostrils instead.");
			if((target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) && !target.hasFaceFlag(GLOBAL.FLAG_FURRED) && !target.hasFaceFlag(GLOBAL.FLAG_FEATHERED) && !target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " face is covered in " + target.skin(true,true,true) + ".");
			else outputRouter(" Strangely enough, " + (target == pc ? "your":"[target.name]’s") + " face is also covered with " + faceFurScales + ".");
			break;
		case GLOBAL.TYPE_SHARK:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is shark-like in shape, with a snout and an upper jaw that pushes past " + (target == pc ? "your":"[target.hisHer]") + " lower one, and at the very tip, there are two nasal holes.");
			if((target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) && target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" The glistening surface is slick to the touch, as if you just lubed up not too long ago.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasFaceFlag(GLOBAL.FLAG_SCALED)) outputRouter(" The surface is covered in fine scales.");
			else if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS]) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(" The surface is covered with " + faceFurScales + ", making " + (target == pc ? "you":"[target.himHer]") + " look like a rather odd hybrid.");
			else if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_BARK]) || target.hasFaceFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter(" Hard" + faceFurScales + " covers the surface, giving " + (target == pc ? "you":"[target.himHer]") + " a tough, hydrodynamic look.");
			else outputRouter(" Even without scales, the surface is smooth and hairless, perfect for underwater exploration.");
			outputRouter(" A set of razor-sharp, retractable shark-teeth fill " + (target == pc ? "your":"[target.hisHer]") + " mouth and gives " + (target == pc ? "your":"[target.hisHer]") + " visage a slightly menacing appearance.");
			break;
		case GLOBAL.TYPE_SWINE:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is mostly human in shape and structure, with " + target.skin(true,true,true));
			if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS]) || target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFaceFlag(GLOBAL.FLAG_SCALED) || target.hasFaceFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(" under " + (target == pc ? "your":"[target.hisHer]") + " " + faceFurScales);
			outputRouter(" but it’s adorned with a flat, pig-like nose.");
			break;
		case GLOBAL.TYPE_GOAT:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is elongated forward and much like a goat’s in shape and structure.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " moth-like face is covered in " + faceFurScales + " and has a sculpted look.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			//9999 check for scales
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face is the fearsome visage of a frostwyrm, a reptilian snout laden in rough, jagged scales that lend you an exotic sharpness. " + (target == pc ? "Your":"[target.hisHer]") + " jaws conceal two rows of razor-sharp fangs");
			if (target == pc) outputRouter(", which fortunately you’ve mastered keeping in check during oral sex.");
			else outputRouter(".");
			break;
		case GLOBAL.TYPE_XHELARFOG:
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " face has a curious lack of a visible nose");
			if (target.eyeCount() == 3) outputRouter(", though the thing truly cementing its alien nature is the trio of eyes decorating its upper half");
			outputRouter(".");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter((target == pc ? "You have":"[target.Name] has") + " the face of a saurmorian, with [target.skinFurScalesColor] metal scales that encase " + (target == pc ? "your":"[target.hisHer]") + " jaw, and run along the top of " + (target == pc ? "your":"[target.hisHer]") + " reptilian snout and down the back of " + (target == pc ? "your":"[target.hisHer]") + " neck. The sides of " + (target == pc ? "your":"[target.hisHer]") + " muzzle aren’t as densely covered, and show hints of " + indefiniteArticle(target.skinTone) + " hide beneath. " + (target == pc ? "Your":"[target.HisHer]") + " smile, meanwhile, contains a mouthful of sharp teeth.");
			break;
		case GLOBAL.TYPE_HYENA:
			if (target.hasPartFur("face")) outputRouter((target == pc ? "You have":"[target.Name] has") + " a hyena’s face with a perpetual grin and bone-crushing jaw filled with sharp teeth. " + (target == pc ? "Your":"[target.HisHer]") + " [target.furColor] fur hides the [target.skinColor] beneath, leaving you with quite the animalistic visage.");
			else if (target.hasPartScales("face")) outputRouter((target == pc ? "You have":"[target.Name] has") + " a hyena’s face with a small perpetual grin, overlaid with [target.skinFurScales], and bone-crushing jaws filled with sharp teeth.");
			else if (target.hasPartGoo("face")) outputRouter("[target.combatHeShe] [target.hasHave] a hyena’s face with a small perpetual grin and bone-crushing jaws filled with sharp teeth.");
			else outputRouter("[target.combatHeShe] [target.hasHave] a hyena’s face with a small perpetual grin and bone-crushing jaws filled with sharp teeth. The odd visage is hairless and covered with [target.skinFurScales].");
			break;
		case GLOBAL.TYPE_DEER:
			if (target.hasMuzzle())
			{
				outputRouter((target == pc ? "Your":"[target.HisHer]") + " face is entirely deer-like in appearance with a long, " + RandomInCollection("dainty", "elegant") + " snout");
				if (target.hasPartFur("face")) outputRouter(" covered in [target.skinFurScales]. Underneath " + (target == pc ? "your":"[target.hisHer]") + " fur, you believe " + (target == pc ? "you have":"[target.heShe] has") + " [target.skin].");
				else if (target.hasPartFeathers("face")) outputRouter(" covered in [target.skin] and lightly framed with [target.skinFurScales].");
				else if (target.hasPartScales("face") || target.hasPartChitin("face")) outputRouter(" decorated with [target.skinFurScales], making " + (target == pc ? "you":"[target.himHer]") + " look less mammalian.");
				else outputRouter(". It looks a little strange covered in nothing but [target.skinFurScales].");
			}
			else
			{
				if (target.hasPartFur("face")) outputRouter("Underneath " + (target == pc ? "your":"[target.hisHer]") + " [target.skinFurScales], " + (target == pc ? "you have":"[target.heShe] has") + " a mostly human face with a black button nose, making " + (target == pc ? "you":"[target.himHer]") + " appear more deer-like.");
				else if (target.hasPartFeathers("face") || target.hasPartScales("face") || target.hasPartChitin("face")) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a mostly human face with [target.skin] and a black deer-like nose, " + (target.hasPartFeathers("face") ? "lightly framed" : "decorated") + " with [target.skinFurScales].");
				else outputRouter((target == pc ? "Your":"[target.HisHer]") + " face is mostly human in shape and structure with [target.skinFurScales], aside from " + (target == pc ? "your":"[target.hisHer]") + " black button nose, making you appear more deer-like.");				
				if (target.hasFaceFlag(GLOBAL.FLAG_FRECKLED)) outputRouter(" White speckles adorn " + (target == pc ? "your":"[target.hisHer]") + " cheeks, further enhancing " + (target == pc ? "your":"[target.hisHer]") + " deer-like visage.");
			}
			break;
	}
	if(target.hasStatusEffect("Mimbrane Face") && target == pc)
	{
		feedVal = pc.mimbranePuffiness("Mimbrane Face");
		if(feedVal <= 0) {}
		else if(feedVal <= 1) outputRouter(" Your lips appear slightly puffy.");
		else if(feedVal <= 2) outputRouter(" Your lips look deliciously pillowy.");
		else outputRouter(" Your lips appear lusciously large and undeniably kissable.");
	}
	// Special face additions
	if(target.hasStatusEffect("Naoki Stripe") && target.skinTone != "purple") outputRouter(" A distinctive purple stripe runs across the bridge of " + (target == pc ? "your":"[target.hisHer]") + " nose.");
	// Freckles
	if(target.hasFaceFlag(GLOBAL.FLAG_FRECKLED) && target.faceType != GLOBAL.TYPE_DEER)
	{
		if(target.hasFaceFlag(GLOBAL.FLAG_FURRED) || target.hasFur()) outputRouter(" Beneath " + (target == pc ? "your":"[target.hisHer]") + " fur, f");
		else outputRouter(" F");
		outputRouter(target.mf("reckles spot " + (target == pc ? "your":"[target.hisHer]") + " cheeks.","reckles cutely adorn " + (target == pc ? "your":"[target.hisHer]") + " cheeks.", true));
	}
	//Premium Breeder Tattoo
	if (target.hasStatusEffect("Premium Breeder Cheek Tattoo"))
	{
		if (rand(2) == 0) outputRouter(" On your left cheek is a pink tattoo of a sperm, its long tail forming a heart, with smaller tadpoles clustered around its head. It has a faint luminescence, unmistakably branding you as a Premium Breeder.");
		else outputRouter(" Emblazoned on your left cheek is the mark of a Premium Breeder: A pink, luminous sperm, its long tail forming a heart, with other wigglers arranged around its head.");
	}
	//M/F stuff!
	outputRouter(" Overall, " + (target == pc ? "your":"[target.hisHer]") + " visage has " + target.faceDesc() + ".");
	
	//Eyes
	var hasMetallicEyes:Boolean = colorIsMetallic(target.eyeColor);
	var hasGemstoneEyes:Boolean = colorIsGemstone(target.eyeColor);
	var hasLuminousEyes:Boolean = colorIsLuminous(target.eyeColor);
	
	switch(target.eyeType)
	{
		case GLOBAL.TYPE_ARACHNID:
			outputRouter(" In addition to " + (target == pc ? "your":"[target.hisHer]") + " primary two eyes, " + (target == pc ? "you have":"[target.heShe] has") + " a second, smaller pair on " + (target == pc ? "your":"[target.hisHer]") + " forehead");
			if(hasMetallicEyes) outputRouter(", all of which reflect back a metallic " + target.eyeColor + " in the light.");
			else if(hasGemstoneEyes) outputRouter(", all of which shimmer " + target.eyeColor + " in the light like jewels.");
			else if(hasLuminousEyes) outputRouter(", all of which beam " + target.eyeColor + " in the darkness.");
			else outputRouter(", all of which are " + target.eyeColor + ".");
			break;
		case GLOBAL.TYPE_SHARK:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are a curious mix of piscine and feline features; a pair of black vertical slits instead of rounded pupils,");
			if(hasMetallicEyes) outputRouter(" sat amongst metallically glistening pools of " + target.eyeColor + " irises.");
			else if(hasGemstoneEyes) outputRouter(" each nestled in a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) outputRouter(" each nestled within " + indefiniteArticle(target.eyeColor) + " iris.");
			else outputRouter(" each sat within " + indefiniteArticle(target.eyeColor) + " iris.");
			outputRouter(" A thick black ring lines " + (target == pc ? "your":"[target.hisHer]") + " eye and " + (target == pc ? "your":"[target.hisHer]") + " eyelids close from the side."); 
			break;
		case GLOBAL.TYPE_SIREN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are predatory in nature, each with a vertical slit surrounded by");
			if (hasMetallicEyes) outputRouter(" a metallically glistening " + target.eyeColor + " iris.");
			else if (hasGemstoneEyes) outputRouter(" a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if (hasLuminousEyes) outputRouter(" " + indefiniteArticle(target.eyeColor) + " iris.");
			else outputRouter(" " + indefiniteArticle(target.eyeColor) + " iris.");
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " sclera are completely pitch black, giving " + (target == pc ? "you":"[target.himHer]") + " a slightly dangerous air."); 
			break;
		case GLOBAL.TYPE_SHEEP:
			if(hasMetallicEyes) outputRouter(" Metallically glistening in the light, " + (target == pc ? "your":"[target.hisHer]"));
			else if(hasGemstoneEyes) outputRouter(" Like jewels, shimmering in the light, " + (target == pc ? "your":"[target.hisHer]"));
			else if(hasLuminousEyes) outputRouter(" Like twinkling beacons, " + (target == pc ? "your":"[target.hisHer]"));
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
			outputRouter(" " + target.eyeColor + " eyes are sheep-like, sporting horizontal pupils.");
			break;
		case GLOBAL.TYPE_GOAT:
		case GLOBAL.TYPE_ADREMMALEX:
			if(hasMetallicEyes) outputRouter(" Metallically glistening in the light, " + (target == pc ? "your":"[target.hisHer]"));
			else if(hasGemstoneEyes) outputRouter(" Like jewels, shimmering in the light, " + (target == pc ? "your":"[target.hisHer]"));
			else if(hasLuminousEyes) outputRouter(" Like twinkling beacons, " + (target == pc ? "your":"[target.hisHer]"));
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
			outputRouter(" " + target.eyeColor + " eyes sport " + (target.eyeType != GLOBAL.TYPE_ADREMMALEX ? "horizontal" : "cross-shaped") + " pupils, much like a vaguely alien goat.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes have a curious mix of feline and draconic features; a pair of black vertical slits instead of rounded pupils,");
			if(hasMetallicEyes) outputRouter(" sat amongst metallically glistening pools of " + target.eyeColor + " irises.");
			else if(hasGemstoneEyes) outputRouter(" each nestled in a shimmering gemstone-like " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) outputRouter(" each nestled within " + indefiniteArticle(target.eyeColor) + " iris.");
			else outputRouter(" each sat within " + indefiniteArticle(target.eyeColor) + " iris.");
			outputRouter(" Tendrils of black crawl across " + (target == pc ? "your":"[target.hisHer]") + " sclera, extending from a dark ring just barely visible at the edges.");
			break;
		case GLOBAL.TYPE_BEE:
			if(target.eyeColor == "gold") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are completely pitch black with the exception of " + (target == pc ? "your":"[target.hisHer]") + " vibrant golden irises.");
			else if(target.eyeColor != "black") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are pitch black with " + target.eyeColor + " irises.");
			else outputRouter(" The black sclera and iris of both of " + (target == pc ? "your":"[target.hisHer]") + " eyes make them appear as solid black and very alien.");
			outputRouter(" Their structure allows " + (target == pc ? "you":"[target.himHer]") + " to have a larger angle of vision as well as detecting the fastest of movements.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_WORG:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " canine eyes have large");
			if(hasMetallicEyes) outputRouter(", metallically glistening " + target.eyeColor + " irises");
			else if(hasGemstoneEyes) outputRouter(", shimmering " + target.eyeColor + " irises");
			else if(hasLuminousEyes) outputRouter(" " + indefiniteArticle(target.eyeColor) + " irises");
			else outputRouter(" " + indefiniteArticle(target.eyeColor) + " irises");
			outputRouter(" occupying most of their surface when the pupils are not dilated");
			if(target.eyeType == GLOBAL.TYPE_WORG) outputRouter(", each surrounded by a menacingly glowing sclera");
			outputRouter(".");
			break;
		case GLOBAL.TYPE_FELINE:
		case GLOBAL.TYPE_SNAKE:
		case GLOBAL.TYPE_DEMONIC:
		case GLOBAL.TYPE_VULPINE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes bear a vertical slit instead of rounded pupils, ");
			if(hasMetallicEyes) outputRouter("surrounded by a metallically glistening " + target.eyeColor + " iris");
			else if(hasGemstoneEyes) outputRouter("surrounded by a gem-like shimmering " + target.eyeColor + " iris");
			else if(hasLuminousEyes) outputRouter("surrounded by a brightly " + target.eyeColor + " iris");
			else outputRouter("surrounded by " + indefiniteArticle(target.eyeColor) + " iris");
			if(target.eyeType != GLOBAL.TYPE_DEMONIC) outputRouter(".");
			else
			{
				if(rand(3) == 0) outputRouter(" and nestled within the inky blackness of " + (target == pc ? "your":"[target.hisHer]") + " sclera.");
				else outputRouter(" and nestled within the pitch black depths of " + (target == pc ? "your":"[target.hisHer]") + " sclera.");
			}
			break;
		case GLOBAL.TYPE_AVIAN:
			if(target.eyeColor == "black") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes resemble black beads, shiny and expressionless. Only the occasional flickering of " + (target == pc ? "your":"[target.hisHer]") + " nictitating membranes reveal that they are not made of glass.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are human-like at first glance, but the black iris, " + target.eyeColor + " sclera, unblinking stare, and the occasional flickering of " + (target == pc ? "your":"[target.hisHer]") + " nictitating membranes hint at their avian nature.");
			break;
		case GLOBAL.TYPE_LEITHAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes each feature a secondary pupil, ");
			if(target.eyeColor == "blue")
			{
				outputRouter("forming an intensely striking symbol of infinity nestled as they are amongst a single brilliantly bright blue iris.");
			}
			else if(hasMetallicEyes) outputRouter("both embedded in a single, overly large metallical " + target.eyeColor + " iris.");
			else if(hasGemstoneEyes) outputRouter("both embedded in a single shimmering " + target.eyeColor + " iris.");
			else if(hasLuminousEyes) outputRouter("both embedded in a single brightly " + target.eyeColor + " iris.");
			else outputRouter("surrounded by a single " + target.eyeColor + " iris.");
			break;
		case GLOBAL.TYPE_MYR:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are gleaming, solid " + target.eyeColor + " orbs that seem to give little away.");
			break;
		case GLOBAL.TYPE_NYREA:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are solid " + target.eyeColor + " in color. They are well adapted to low light environments, befitting a cave-dwelling species like the nyrea.");
			break;
		case GLOBAL.TYPE_COCKVINE:
			if(InCollection(target.eyeColor, ["amber", "yellow", "gold"])) outputRouter(" Glistening in the light like rich sap, " + (target == pc ? "your":"[target.hisHer]") + " eyes are solid golden amber with hidden pupils.");
			else outputRouter(" Like rich sap, " + (target == pc ? "your":"[target.hisHer]") + " eyes are glistening amber, each with a solid, hexagonal-shaped " + target.eyeColor + " iris and an invisible pupil.");
			outputRouter(" Strangely, they seem like a very natural part of " + (target == pc ? "you":"[target.himHer]") + ", despite their alien-like appearance.");
			break;
		case GLOBAL.TYPE_GABILANI:
			if(target.eyeColor == "black") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " alien eyes are dark as the void, with irises that are completely black and indistinguishible from the pupils themselves, making " + (target == pc ? "you":"[target.himHer]") + " appear disconcerting from afar.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are completely " + target.eyeColor + ", with irises of the same color and indistinguishible from the pupils themselves, making " + (target == pc ? "you":"[target.himHer]") + " appear quite alien.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.eyeColor == "black") outputRouter(" Void black eyes with glowing iridescent");
			else
			{
				if(hasMetallicEyes) outputRouter(" Metallically glistening " + target.eyeColor);
				else if(hasGemstoneEyes) outputRouter(" Like jewels, shimmering " + target.eyeColor);
				else if(hasLuminousEyes) outputRouter(" Like twinkling beacons, " + target.eyeColor);
				else outputRouter(" " + StringUtil.capitalize(target.eyeColor));
				outputRouter(" eyes with dark");
			}
			outputRouter(" ‘plus’-shaped pupils assess " + (target == pc ? "your":"[target.hisHer]") + " surroundings with little issue.");
			break;
		case GLOBAL.TYPE_SYNTHETIC:
			if(target.eyeColor == "black") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are pitch black with digitally-projected glowing white squares that form each iris,");
			else
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are mapped like a printed circuit board and ");
				if(hasMetallicEyes) outputRouter(" glisten with rings of metallic " + target.eyeColor);
				else if(hasGemstoneEyes) outputRouter(" light up with rings of shimmering " + target.eyeColor);
				else if(hasLuminousEyes) outputRouter(" pulse to life with rings of " + target.eyeColor);
				else outputRouter(" are decorated with rings of " + StringUtil.capitalize(target.eyeColor));
				outputRouter(" around each iris,");
			}
			outputRouter(" giving them a very synthetic appearance.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0)
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are bulgy and ");
				switch(target.eyeColor)
				{
					case "black": outputRouter("abyssal"); break;
					case "cyan": outputRouter("refractive"); break;
					case "white": outputRouter("reflective"); break;
					case "gold": outputRouter("radiant"); break;
					default: outputRouter("iridescent"); break;
				}
				outputRouter(", interfering with the natural light around them.");
			}
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.eyeColor + " orbs-for-eyes bulge slightly forward, bathed in a muted, ambient glow.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" Two [target.eyeColor] slits sit on " + (target == pc ? "your":"[target.hisHer]") + " face. The center of each slit is a slightly brighter shade, giving " + (target == pc ? "you":"[target.himHer]") + " a fiercely imposing appearance even when relaxed.");
			break;
		case GLOBAL.TYPE_JANERIA:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are solid, featureless orbs of [target.eyeColor], giving " + (target == pc ? "you":"[target.himHer]") + " a thoroughly disturbing visage.");
			break;
		case GLOBAL.TYPE_XHELARFOG:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are a");
			if (hasMetallicEyes) outputRouter(" metallic");
			outputRouter(" shade of [target.eyeColor] with no distinction between sclera and iris. Only the slightly paler shade of " + (target == pc ? "your":"[target.hisHer]") + " pupil allows people to tell where " + (target == pc ? "you’re":"[target.heShe]’s") + " looking.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are [target.eyeColor] orbs, each with a vertically slitted pupil set in a very slim iris that almost blends with the surrounding sclera.");
			break;
		case GLOBAL.TYPE_LIZAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " eyes are reptilian; black slits set within [target.eyeColor] orbs.");
			if (hasMetallicEyes) outputRouter(" They gleam brightly in the light, clear enough for you to see your face in them when you look" + (target == pc ? "." : " in the mirror."));
			else if (hasGemstoneEyes) outputRouter(" They seem to glow in the light, shimmering like jewels.");
			else if (target.eyeColor == "black") outputRouter(" They look unsettling, their many shades of black crawling together the longer you look at them.");
			outputRouter(" An off-" + target.eyeColor.split(" ").pop() + " line at the sides betray the presence of a second set of eyelids.");
			break;
		case GLOBAL.TYPE_DEER:
			outputRouter(" " + (target == pc ? "You have" : "[target.HeShe] has") + " large doe-eyes with huge [target.eyeColor] irises that");
			if (hasLuminousEyes) outputRouter(" gleam ominously in the dark.");
			else if (hasMetallicEyes) outputRouter(" metallically glisten in the light.");
			else if (hasGemstoneEyes) outputRouter(" shimmer in the light, like jewels.");
			else outputRouter(" make " + (target == pc ? "you" : "[target.himHer]") + " look cuter than a puppy.");
			break;
		default:
			if(hasMetallicEyes) outputRouter(" Metallically glistening " + target.eyeColor + " eyes allow " + (target == pc ? "you":"[target.himHer]") + " to take in " + (target == pc ? "your":"[target.hisHer]") + " surroundings without trouble.");
			else if(hasGemstoneEyes) outputRouter(" Like jewels, shimmering " + target.eyeColor + " eyes allow " + (target == pc ? "you":"[target.himHer]") + " to take in " + (target == pc ? "your":"[target.hisHer]") + " surroundings without trouble.");
			else if(hasLuminousEyes) outputRouter(" Like twinkling beacons, " + target.eyeColor + " eyes seem to draw the attention of everyone around " + (target == pc ? "you":"[target.himHer]") + ".");
			else
			{
				if(rand (10) == 0) outputRouter(" Fairly unremarkable " + target.eyeColor);
				else if(rand(3) == 0) outputRouter(" Regular " + target.eyeColor);
				else if(rand(2) == 0) outputRouter(" Normal-looking " + target.eyeColor);
				else outputRouter(" " + StringUtil.capitalize(target.eyeColor) + "-colored");
				outputRouter(" eyes allow " + (target == pc ? "you":"[target.himHer]") + " to take in " + (target == pc ? "your":"[target.hisHer]") + " surroundings without trouble.");
			}
			break;
	}
	
	//Hair
	var nonFurrySkin:Boolean = (InCollection(target.skinType, [GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_LATEX]) || target.hasPerk("Black Latex"));
	var isFloppyEars:Boolean = ((InCollection(target.earType, [GLOBAL.TYPE_QUAD_LAPINE]) && (target.RQ() < 50 || target.AQ() < 50 || target.earLength >= target.tallness/2)) || (target.earType == GLOBAL.TYPE_LAPINE && target.hasEarFlag(GLOBAL.FLAG_FLOPPY) && target.hasEarFlag(GLOBAL.FLAG_LONG)));
	
	//if bald
	if(!target.hasHair())
	{
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) outputRouter(" " + (target == pc ? "You have":"[target.Name] has") + " no hair, only a" + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? "" : " thin") + " layer of " + target.skinNoun(false,true) + " where " + (target == pc ? "your":"[target.hisHer]") + " hair should be.");
		else outputRouter(" " + (target == pc ? "You have":"[target.Name] has") + " no hair, showing only shiny " + target.skinFurScales() + " where " + (target == pc ? "your":"[target.hisHer]") + " hair should be.");
		
		var headNoun:String = "head";
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR) headNoun = "furred head";
		else if(rand(4) == 0) headNoun = "skull";
		
		switch(target.earType)
		{
			case GLOBAL.TYPE_HUMAN:
				// Human ears don't get acknowledged, I guess!
				break;
			case GLOBAL.TYPE_EQUINE:
				outputRouter(" A pair of horse-like ears rise up from the top of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_CANINE:
				outputRouter(" A pair of pointed ausar-like ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", pointed and alert.");
				break;
			case GLOBAL.TYPE_KORGONNE:
				outputRouter(" A pair of triangular dog ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", rounded at the top like a korgonne’s.");
				break;
			case GLOBAL.TYPE_BOVINE:
				outputRouter(" A pair of round, floppy cow ears protrude from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SHEEP:
				outputRouter(" A pair of sheep-like ears flop cutely down the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_GOAT:
				outputRouter(" A pair of " + num2Text(target.earLength) + "-inch long, flicking goat ears protrude from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun);
				if(!nonFurrySkin) outputRouter(" with tufts of fur on their backs");
				outputRouter(".");
				break;
			case GLOBAL.TYPE_DRIDER:
				outputRouter(" A pair of large pointy ears stick out from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_FELINE:
				outputRouter(" A pair of cute")
				if(!nonFurrySkin) outputRouter(", fuzzy");
				outputRouter(" feline ears, sprout from atop " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", each pivoting towards any sudden noises.");
				break;
			case GLOBAL.TYPE_AVIAN:
				outputRouter(" A pair of small holes");
				if(!nonFurrySkin || target.hasFeathers()) outputRouter(" hidden");
				outputRouter(" on the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " make up " + (target == pc ? "your":"[target.hisHer]") + " ears. Their location is prominently revealed by");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) outputRouter(" fin-like protrusions");
				else outputRouter(" tufts of feathers");
				outputRouter(" which act as auricles.");
				break;
			case GLOBAL.TYPE_LIZAN:
				outputRouter(" A pair of rounded protrusions with small holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) outputRouter(" hidden");
				outputRouter(" on the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " serve as " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
			case GLOBAL.TYPE_LAPINE:
			case GLOBAL.TYPE_QUAD_LAPINE:
			case GLOBAL.TYPE_LEITHAN:
				if(target.hasEarFlag(GLOBAL.FLAG_FLOPPY))
				{
					outputRouter(" A pair of bouncy lop-rabbit ears emerge from ");
					if(!target.hasHair()) outputRouter((target == pc ? "your":"[target.hisHer]") + " head");
					else outputRouter((target == pc ? "your":"[target.hisHer]") + " [target.hair]");
					outputRouter(" and ");
					if(target.earLength >= target.tallness) outputRouter("hang low enough to drag on the ground like head-mounted tails");
					else if(target.earLength > target.tallness/2) outputRouter("hang down to " + (target == pc ? "your":"[target.hisHer]") + " [target.thighs]");
					else if(target.earLength >= target.tallness/2.5) outputRouter("hang to " + (target == pc ? "your":"[target.hisHer]") + " waist");
					else if(target.earLength >= target.tallness/3) outputRouter("dangle just above " + (target == pc ? "your":"[target.hisHer]") + " waist");
					else if(target.earLength >= target.tallness/4) outputRouter("dangle down to " + (target == pc ? "your":"[target.hisHer]") + " [target.chestNoun]");
					else outputRouter("hang over your shoulders");
					outputRouter(".");
				}
				else
				{
					if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) outputRouter(" Two pairs of");
					else outputRouter(" A pair of");
					outputRouter(" alert rabbit ears stick up");
					if(target.earLength >= target.tallness/2) outputRouter(" partway before their " + num2Text(target.earLength) + "-inch length drags them downward under their own weight.");
					else
					{
						if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
						outputRouter(" from the top of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ",");
						if(target.earLength > target.tallness) outputRouter(" dragging on the floor");
						else if(target.earLength > target.tallness/2) outputRouter(" swaying about");
						else outputRouter(" swaying and darting");
						outputRouter(" as " + (target == pc ? "you [target.walk]":"[target.heShe] moves") + ".");
					}
				}
				break;
			case GLOBAL.TYPE_KANGAROO:
				outputRouter(" A pair of long");
				if(!nonFurrySkin) outputRouter(", furred");
				outputRouter(" kangaroo ears stick out from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " at an angle.");
				break;
			case GLOBAL.TYPE_VULPINE:
				outputRouter(" A pair of large, adept fox ears sit high on " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", always listening.");
				break;
			case GLOBAL.TYPE_LUPINE:
				outputRouter(" A pair of pointed wolf-like ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", pointed and alert.");
				break;
			case GLOBAL.TYPE_DEER:
				outputRouter(" A pair of pointed, oval-shaped ears poke out from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", flicking and flopping about, making " + (target == pc ? "you":"[target.himHer]") + " look very much like a deer.");
				break;
			case GLOBAL.TYPE_DRACONIC:
			case GLOBAL.TYPE_GRYVAIN:
				outputRouter(" A pair of rounded protrusions with small holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) outputRouter(" hidden");
				outputRouter(" on the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " serve as " + (target == pc ? "your":"[target.hisHer]") + " ears. Bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_KUITAN:
				outputRouter(" A pair of vaguely egg-shaped");
				if(!nonFurrySkin) outputRouter(", furry");
				outputRouter(" raccoon ears adorns " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_MOUSE:
				outputRouter(" A pair of large, dish-shaped mouse ears stick up prominently atop of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_VANAE:
				outputRouter(" A pair of pointed, finned ears tops " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", each one sensitive to the slightest sound.");
				break;
			case GLOBAL.TYPE_BADGER:
				outputRouter(" A pair of rounded, mustelid ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", pointing up as if sensing mischief in the air.");
				break;
			case GLOBAL.TYPE_PANDA:
				outputRouter(" A pair of rounded, panda-like ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", " + target.mf("standing tall and proud", "looking absolutely adorable", true) + ".");
				break;
			case GLOBAL.TYPE_REDPANDA:
				if(target.tallness <= 72) outputRouter("A pair of big " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears perk up on top of " + (target == pc ? "your":"[target.hisHer]") + " head, listening closely to any surrounding noise.");
				else outputRouter("A pair of cute, furry " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears poke out of the top of " + (target == pc ? "your":"[target.hisHer]") + " head, listening closely to any surrounding noise.");
				break;
			case GLOBAL.TYPE_RASKVEL:
				outputRouter(" A pair of");
				if(target.earLength >= (target.tallness * 0.6)) outputRouter(" " + num2Text(target.earLength) + "-inch");
				outputRouter(" long raskvel ears dangle from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " down past " + (target == pc ? "your":"[target.hisHer]") + " waist.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.earLength <= 1)
				{
					outputRouter(" A pair of mostly-human ears with slightly pointed tips protrude from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", just like a fantasy elf’s.");
				}
				//2-4 inches: 
				else if(target.earLength <= 4)
				{
					outputRouter(" A pair of triangular, elven ears protrude from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", sticking out a full " + num2Text(target.earLength) + " inches from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head. Small extra muscles let them twitch or droop expressively.");
				}
				//5+ inches:
				else
				{
					outputRouter(" A pair of exquisitely long, elf-like ears extend a full " + num2Text(target.earLength) + " inches from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit " + (target == pc ? "your":"[target.hisHer]") + " expression, letting even the most rugged face pull off a cutesy pout with ease.");
				}
				break;
			case GLOBAL.TYPE_GABILANI:
				outputRouter(" A pair of long, triangular goblin ears point outwards");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
				outputRouter(" from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_DEMONIC:
				outputRouter(" A pair of wicked-looking ears point outwards");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
				outputRouter(" from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_FROG:
			case GLOBAL.TYPE_OVIR:
				outputRouter(" A pair of small indented holes");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) outputRouter(" hidden");
				outputRouter(" on the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + " make up " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
			case GLOBAL.TYPE_DOGGIE:
				outputRouter(" A pair of");
				if(target.earLength >= 6) outputRouter(" droopy");
				else if(target.earLength >= 3) outputRouter(" floppy");
				else outputRouter(" rounded");
				outputRouter(" dog ears protrude");
				if(target.earLength >= 3) outputRouter(" " + num2Text(target.earLength) + " inches");
				outputRouter(" from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", each capable of being highly expressive.");
				break;
			case GLOBAL.TYPE_SIREN:
				outputRouter(" A pair of feather-tipped ears point outwards");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
				outputRouter(" from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SHARK:
				outputRouter(" A pair of triple-parted, sail-like ears protrude from the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ". The topmost sail points straight up while the other more smaller ones curve down.");
				break;
			case GLOBAL.TYPE_SWINE:
				outputRouter(" A pair of pointed, floppy pig ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_SIMII:
				outputRouter(" A pair of large, strangely-shaped ears protrude from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				outputRouter(" A pair of moth ears are recessed at the sides of " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ", looking like slightly raised mounds of membranous tissue.");
				break;
			case GLOBAL.TYPE_FROSTWYRM:
				outputRouter(" A trio of sharp, fin-like scales adorn either side of " + (target == pc ? "your":"[target.hisHer]") + " head, looking almost like exotic headphones and concealing " + (target == pc ? "your":"[target.hisHer]") + " ears within their protective armor.");
				break;
			case GLOBAL.TYPE_SAURMORIAN:
				outputRouter(" A pair of small openings on the sides of " + (target == pc ? "your":"[target.hisHer]") + " head, each partially obscured by a protective scale, serve as " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
			case GLOBAL.TYPE_HYENA:
				outputRouter(" A pair of pointed hyena-like ears protrude from [target.combatHisHer] [target.headNoun].");
				break;
			case GLOBAL.TYPE_DZAAN:
				outputRouter(" A pair of long, triangular dzaan ears point outwards");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
				outputRouter(" from " + (target == pc ? "your":"[target.hisHer]") + " " + headNoun + ".");
				break;
			default:
				outputRouter(" There is nothing notable to mention about " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
		}
	}
	//not bald
	else
	{
		switch(target.earType)
		{
			case GLOBAL.TYPE_HUMAN:
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.hairDescript(true,true) + " looks good on " + (target == pc ? "you":"[target.himHer]") + ", accentuating " + (target == pc ? "your":"[target.hisHer]") + " features well.");
				break;
			case GLOBAL.TYPE_EQUINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head parts around a pair of very horse-like ears that grow up from " + (target == pc ? "your":"[target.hisHer]") + " head.");
				break;
			case GLOBAL.TYPE_CANINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is overlapped by a pair of pointed dog ears.");
				break;
			case GLOBAL.TYPE_KORGONNE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is overlapped by a pair of triangular dog ears, rounded at the top like a korgonne’s.");
				break;
			case GLOBAL.TYPE_BOVINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of rounded cow ears that stick out sideways.");
				break;
			case GLOBAL.TYPE_SHEEP:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of sheep-like ears that flop cutely down the sides of " + (target == pc ? "your":"[target.hisHer]") + " head.");
				break;
			case GLOBAL.TYPE_GOAT:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of " + num2Text(target.earLength) + "-inch long, flicking goat ears. They stick noticeably out to the sides");
				if(!nonFurrySkin) outputRouter(" with tufts of fur on their backs");
				outputRouter(".");
				break;
			case GLOBAL.TYPE_DRIDER:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of cute pointed ears, bigger than " + (target == pc ? "your":"[target.hisHer]") + " old human ones.");
				break;
			case GLOBAL.TYPE_FELINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of cute");
				if(!nonFurrySkin) outputRouter(", fuzzy");
				outputRouter(" feline ears, sprouting from atop " + (target == pc ? "your":"[target.hisHer]") + " head and pivoting towards any sudden noises.");
				break;
			case GLOBAL.TYPE_AVIAN:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head covers two small openings that make up " + (target == pc ? "your":"[target.hisHer]") + " ears, but the");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) outputRouter(" fin-like protrusions");
				else outputRouter(" tufts of feathers");
				outputRouter(" which act as auricles are quite noticeable.");
				break;
			case GLOBAL.TYPE_SAURMORIAN:
			case GLOBAL.TYPE_LIZAN:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head makes it nigh-impossible to notice the two small rounded openings that are " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
			case GLOBAL.TYPE_LAPINE:
			case GLOBAL.TYPE_QUAD_LAPINE:
			case GLOBAL.TYPE_LEITHAN:
				if(target.hasEarFlag(GLOBAL.FLAG_FLOPPY))
				{
					outputRouter(" A pair of bouncy lop-rabbit ears emerge from ");
					if(!target.hasHair()) outputRouter((target == pc ? "your":"[target.hisHer]") + " head");
					else outputRouter((target == pc ? "your":"[target.hisHer]") + " [target.hair]");
					outputRouter(" and ");
					if(target.earLength >= target.tallness) outputRouter("hang low enough to drag on the ground like head-mounted tails");
					else if(target.earLength > target.tallness/2) outputRouter("hang down to " + (target == pc ? "your":"[target.hisHer]") + " [target.thighs]");
					else if(target.earLength >= target.tallness/2.5) outputRouter("hang to " + (target == pc ? "your":"[target.hisHer]") + " waist");
					else if(target.earLength >= target.tallness/3) outputRouter("dangle just above " + (target == pc ? "your":"[target.hisHer]") + " waist");
					else if(target.earLength >= target.tallness/4) outputRouter("dangle down to " + (target == pc ? "your":"[target.hisHer]") + " [target.chestNoun]");
					else outputRouter("hang over your shoulders");
					outputRouter(".");
				}
				else
				{
					if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) outputRouter(" Two pairs of");
					else outputRouter(" A pair of");
					outputRouter(" alert rabbit ears stick up");
					if(target.earLength >= target.tallness/2) outputRouter(" partway before their " + num2Text(target.earLength) + "-inch length drags them downward under their own weight.");
					else
					{
						if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + " inches");
						outputRouter(" from the top of " + (target == pc ? "your":"[target.hisHer]") + " " + target.hairDescript(true,true) + ",");
						if(target.earLength > target.tallness) outputRouter(" dragging on the floor");
						else if(target.earLength > target.tallness/2) outputRouter(" swaying about");
						else outputRouter(" swaying and darting");
						outputRouter(" as " + (target == pc ? "you [target.walk]":"[target.heShe] moves") + ".");
					}
				}
				break;
			case GLOBAL.TYPE_KANGAROO:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of long");
				if(!nonFurrySkin) outputRouter(", furred");
				outputRouter(" kangaroo ears that stick out at an angle.");
				break;
			case GLOBAL.TYPE_VULPINE:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of large, adept fox ears that always seem to be listening.");
				break;
			case GLOBAL.TYPE_LUPINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is overlapped by a pair of pointed wolf ears.");
				break;
			case GLOBAL.TYPE_DEER:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of rounded ears that point out sideways, flicking and flopping about, making " + (target == pc ? "you":"[target.himHer]") + " look very much like a deer.");
				break;
			case GLOBAL.TYPE_DRACONIC:
				outputRouter(" The " + target.hairDescript(true, true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of rounded protrusions with small holes on the sides of " + (target == pc ? "your":"[target.hisHer]") + " head that serve as " + (target == pc ? "your":"[target.hisHer]") + " ears. Bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of rounded protrusions with small holes on the sides of " + (target == pc ? "your":"[target.hisHer]") + " head that serve as " + (target == pc ? "your":"[target.hisHer]") + " ears. Long, bony fins sprout behind them.");
				break;
			case GLOBAL.TYPE_KUITAN:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head parts around a pair of egg-shaped");
				if(!nonFurrySkin) outputRouter(", furry");
				outputRouter(" raccoon ears.");
				break;
			case GLOBAL.TYPE_MOUSE:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is funneled between and around a pair of large, dish-shaped mouse ears that stick up prominently.");
				break;
			case GLOBAL.TYPE_VANAE:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of pointed, fin-like ears, sensitive to the slightest sound.");
				break;
			case GLOBAL.TYPE_BADGER:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of round badger ears that perk up as if sensing mischief in the air.");
				break;
			case GLOBAL.TYPE_PANDA:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of round panda ears.");
				break;
			case GLOBAL.TYPE_REDPANDA:
				outputRouter("The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of " + (target.tallness <= 72 ? "large" : "cute") + " " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda ears that are always listening to any surrounding noise.");
				break;
			case GLOBAL.TYPE_RASKVEL:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of");
				if(target.earLength >= (target.tallness * 0.6)) outputRouter(" " + num2Text(target.earLength) + "-inch");
				outputRouter(" long raskvel ears that dangle down past " + (target == pc ? "your":"[target.hisHer]") + " waist.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.earLength <= 1) outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head nearly conceals a pair of mostly-human ears with slightly pointed tips, just like a fantasy elf’s.");
				//2-4 inches: 
				else if(target.earLength <= 4) outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head can’t hide a pair of triangular, elven ears. They stick out a full " + num2Text(target.earLength) + " inches from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head can’t possibly hide a pair of exquisitely long, elf-like ears. They extend a full " + num2Text(target.earLength) + " inches from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit " + (target == pc ? "your":"[target.hisHer]") + " expression, letting even the most rugged face pull off a cutesy pout with ease.");
				break;
			case GLOBAL.TYPE_GABILANI:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + "-inch");
				outputRouter(" long, triangular goblin ears.");
				break;
			case GLOBAL.TYPE_DEMONIC:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + "-inch long,");
				outputRouter(" wicked-looking demonic ears.");
				break;
			case GLOBAL.TYPE_FROG:
			case GLOBAL.TYPE_OVIR:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head covers the two small openings that make up " + (target == pc ? "your":"[target.hisHer]") + " ears.");
				break;
			case GLOBAL.TYPE_DOGGIE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is overlapped by a pair of");
				if(target.earLength >= 6) outputRouter(" droopy");
				else if(target.earLength >= 3) outputRouter(" floppy");
				else outputRouter(" rounded");
				if(target.earLength >= 3) outputRouter(", " + num2Text(target.earLength) + "-inch long");
				outputRouter(" dog ears, each capable of being highly expressive.");
				break;
			case GLOBAL.TYPE_SIREN:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + "-inch long,");
				outputRouter(" feather-tipped ears.");
				break;
			case GLOBAL.TYPE_SHARK:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is overlapped by a pair of triple-parted, sail-like ears. The topmost sail points straight up while the other more smaller ones curve down.");
				break;
			case GLOBAL.TYPE_SWINE:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of pointed, floppy pig ears.");
				break;
			case GLOBAL.TYPE_SIMII:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of large, strangely-shaped ears.");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head hides the two raised mounds of membranous tissue that are your ears.");
				break;
			case GLOBAL.TYPE_FROSTWYRM:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a trio of sharp, fin-like scales adorn either side of " + (target == pc ? "your":"[target.hisHer]") + " head, looking almost like exotic headphones and concealing " + (target == pc ? "your":"[target.hisHer]") + " ears within their protective armor.");
				break;
			case GLOBAL.TYPE_HYENA:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of pointed hyena-like ears.");
				break;
			case GLOBAL.TYPE_DZAAN:
				outputRouter(" The " + target.hairDescript(true,true) + " on " + (target == pc ? "your":"[target.hisHer]") + " head is parted by a pair of");
				if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + "-inch");
				outputRouter(" long, triangular dzaan ears.");
				break;
			default:
				outputRouter(" The " + target.hairDescript(true,true) + " atop " + (target == pc ? "your":"[target.hisHer]") + " head hides non-descript ears.");
				break;
		}
	}
	// Additional ear stuffs
	if(target.earType == GLOBAL.TYPE_LEITHAN)
	{
		outputRouter(" In addition,");
		if(target.earLength > 1) outputRouter(" " + num2Text(target.earLength) + "-inch long");
		outputRouter(" pointed elfin ears jut out below them, giving " + (target == pc ? "you":"[target.himHer]") + " exceptional hearing.");
	}
	if(target.hasStatusEffect("Laquine Ears"))
	{
		if(InCollection(target.earType, [GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE, GLOBAL.TYPE_LEITHAN]))
		{
			outputRouter(" The headband-mounted bunny ears " + (target == pc ? "you are":"[target.heShe] is") + " wearing make " + (target == pc ? "you":"[target.himHer]") + " look like " + (target == pc ? "you have":"[target.heShe] has") + " ");
			if(target.earType == GLOBAL.TYPE_QUAD_LAPINE) outputRouter(" six");
			else outputRouter(" four");
			outputRouter(" rabbit ears total.");
		}
		else outputRouter(" " + (target == pc ? "You are":"[target.HeShe] is") + " wearing a headband mounted with a pair of perky faux rabbit ears that bounce around as " + (target == pc ? "you [target.walk]":"[target.heShe] moves") + ".");
	}
	
	// Antennae
	if(target.hasAntennae())
	{
		if(!target.hasHair())
		{
			if(target.antennae == 1) outputRouter(" A floppy [target.antenna] also appears");
			else if(rand(2) == 0) outputRouter(" " + StringUtil.capitalize(num2Text(target.antennae)) + " floppy [target.antennae] also grow");
			else outputRouter(" Floppy [target.antennae] also appear");
			outputRouter(" on " + (target == pc ? "your":"[target.hisHer]") + " head, bouncing and swaying in the breeze.");
		}
		else
		{
			if(InCollection(target.earType, [GLOBAL.TYPE_LAPINE, GLOBAL.TYPE_QUAD_LAPINE]))
			{
				if(target.antennae == 1) outputRouter(" A limp [target.antenna] also grows");
				else if(rand(2) == 0) outputRouter(" " + StringUtil.capitalize(num2Text(target.antennae)) + " limp [target.antennae] also grow");
				else outputRouter(" Limp [target.antennae] also grow");
				outputRouter(" from just behind " + (target == pc ? "your":"[target.hisHer]") + " hairline, waving and swaying in the breeze with " + (target == pc ? "your":"[target.hisHer]") + " ears.");
			}
			else
			{
				if(target.antennae == 1) outputRouter(" A floppy [target.antenna] also grows");
				else if(rand(2) == 0) outputRouter(" " + StringUtil.capitalize(num2Text(target.antennae)) + " floppy [target.antennae] also grow");
				else outputRouter(" Floppy [target.antennae] also grow");
				outputRouter(" from just behind " + (target == pc ? "your":"[target.hisHer]") + " hairline, bouncing and swaying in the breeze.");
			}
		}
	}
	
	//Tongue
	switch(target.tongueType)
	{
		case GLOBAL.TYPE_SNAKE:
			outputRouter(" A snake-like tongue occasionally flits between " + (target == pc ? "your":"[target.hisHer]") + " lips, tasting the air.");
			break;
		case GLOBAL.TYPE_DEMONIC:
			outputRouter(" A slowly undulating tongue occasionally slips from between " + (target == pc ? "your":"[target.hisHer]") + " lips. It hangs nearly two feet long when " + (target == pc ? "you let":"[target.heShe] lets") + " the whole thing slide out, though " + (target == pc ? "you":"[target.heShe]") + " can retract it to appear normal.");
			break;
		case GLOBAL.TYPE_DRACONIC:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a thick, fleshy tongue that, if " + (target == pc ? "you so desire":"[target.heShe] so desires") + ", can telescope to a distance of about four feet. It has sufficient manual dexterity that " + (target == pc ? "you":"[target.heShe]") + " can use it almost like a third arm.");
			break;
		case GLOBAL.TYPE_LEITHAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a narrow but flexible tongue that, if " + (target == pc ? "you so desire":"[target.heShe] so desires") + ", can extend a good distance out from " + (target == pc ? "your":"[target.hisHer]") + " mouth. Its tip is forked, and " + (target == pc ? "you are":"[target.heShe] is") + " capable of moving it around in an almost prehensile manner.");
			break;
		case GLOBAL.TYPE_RASKVEL:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a thick, purple tongue that, if " + (target == pc ? "you so desire":"[target.heShe] so desires") + ", can extend a fair portion from " + (target == pc ? "your":"[target.hisHer]") + " mouth. Its tip is blunted slightly.");
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) outputRouter(" A lengthy, tapered tongue fills " + (target == pc ? "your":"[target.hisHer]") + " mouth, able to stretch out almost nine inches in order to taste the very air.");
			else outputRouter(" A tapered tongue fills " + (target == pc ? "your":"[target.hisHer]") + " mouth, able to taste the very air when extended beyond " + (target == pc ? "your":"[target.hisHer]") + " oral cavity.");
			break;
		case GLOBAL.TYPE_BEE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a long, bright yellow tongue that can extend a foot past past " + (target == pc ? "your":"[target.hisHer]") + " [target.lipsChaste] when fully extended. The tip has a tube inside it, capable of gathering sweet nectar from jungle flowers or lovers.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a long tongue that can extend a foot past past " + (target == pc ? "your":"[target.hisHer]") + " [target.lipsChaste] when fully extended. The tip has a tube inside it, capable of gathering sweet nectar from jungle flowers or lovers.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a long and stretchy frog tongue, capable of reaching much longer distances than most races.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a stretchy frog-like tongue.");
			break;
		case GLOBAL.TYPE_CANINE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a flat tongue that constantly drips with slobber.");
			break;
		case GLOBAL.TYPE_KORGONNE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a long blue tongue that dangles over " + (target == pc ? "your":"[target.hisHer]") + " lower lip whenever " + (target == pc ? "you stop":"[target.heShe] stops") + " thinking about it.");
			break;
		case GLOBAL.TYPE_BOVINE:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth houses a broad, prehensile tongue which extends over a foot long with a smooth surface that is perfect for pleasuring sensitive areas.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a smooth, broad tongue, perfect for pleasuring sensitive spots.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a long, prehensile tentacle-like tongue.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " tongue is a");
			if (target.hasTongueFlag(GLOBAL.FLAG_LONG)) outputRouter(" long");
			outputRouter(" pink tube of");
			if (target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) outputRouter(" practically prehensile");
			outputRouter(" flesh, capable of extending up to four feet in length when " + (target == pc ? "you let":"[target.heShe] lets") + " it hang down all the way.");
			break;
		//Tired of seeing "your mouth contains a tongue."
		case GLOBAL.TYPE_HUMAN:
			break;
		default:
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains a lengthy tongue.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mouth contains " + indefiniteArticle(target.tongueDescript()) + ".");
			break;
	}
	if(target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" Because it constantly produces a steady stream of wet lube, the inside of " + (target == pc ? "your":"[target.hisHer]") + " mouth stays well lubricated.");
	
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
				if(target.horns <= 2) outputRouter(" A " + (target.hornLength <= 2 ? "small pair of" : ("pair of " + num2Text(int(target.hornLength)) + "-inch long")) + " pointed horns has broken through the " + target.skin() + " on " + (target == pc ? "your":"[target.hisHer]") + " forehead, proclaiming some demonic taint to any who see them.");
				else if(target.horns <= 4) outputRouter(" A quartet of " + (target.hornLength <= 4 ? "prominent" : (num2Text(int(target.hornLength)) + "-inch long")) + " horns has broken through " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin() + ". The back pair are longer, and curve back along " + (target == pc ? "your":"[target.hisHer]") + " head. The front pair protrude forward demonically.");
				else if(target.horns <= 6) outputRouter(" Six horns have sprouted through " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin() + ", the back two pairs curve backwards over " + (target == pc ? "your":"[target.hisHer]") + " head and down towards " + (target == pc ? "your":"[target.hisHer]") + " neck, while the front two horns stand " + (target.hornLength < 8 ? "almost eight" : num2Text(int(target.hornLength))) + " inches long upwards and a little forward.");
				else outputRouter(" A large number of thick demonic horns sprout through " + (target == pc ? "your":"[target.hisHer]") + " " + target.skin() + ", each pair sprouting behind the ones before. The front jut forwards nearly " + num2Text(int(target.hornLength)) + " inches while the rest curve back over " + (target == pc ? "your":"[target.hisHer]") + " head, some of the points ending just below " + (target == pc ? "your":"[target.hisHer]") + " ears. " + (target == pc ? "You estimate you have":"[target.HeShe] estimates [target.heShe] has") + " a total of " + num2Text(target.horns) + " horns.");
				break;
			//Minotaur horns
			case GLOBAL.TYPE_BOVINE:
				if(target.hornLength < 1) outputRouter(" Two tiny horn-like nubs protrude from " + (target == pc ? "your":"[target.hisHer]") + " forehead, resembling the horns of the young livestock kept by terrans.");
				else if(target.hornLength < 2) outputRouter(" Two small, roughly one-inch long bovine horns protrude from " + (target == pc ? "your":"[target.hisHer]") + " forehead. They’re kind of cute, actually.");
				else if(target.hornLength < 3) outputRouter(" Two bovine horns, approximately two inches in length, jut from " + (target == pc ? "your":"[target.hisHer]") + " forehead.");
				else if(target.hornLength < 4) outputRouter(" A pair of bovine horns jut a full three inches from " + (target == pc ? "your":"[target.hisHer]") + " forehead.");
				else if(target.hornLength < 5) outputRouter(" Two horns protrude through the [target.skin] of " + (target == pc ? "your":"[target.hisHer]") + " forehead. Each is about four inches in length and impossible to ignore.");
				else if(target.hornLength < 6) outputRouter(" Two big, strong bovine horns jut from " + (target == pc ? "your":"[target.hisHer]") + " forehead. Their weight is a constant reminder just how much you look like a " + target.mf("bull","cow") + ".");
				else if(target.hornLength < 8) outputRouter(" A pair of roughly half a foot of powerful, bovine horns protrude from " + (target == pc ? "your":"[target.hisHer]") + " skull. All " + (target == pc ? "you have":"[target.heShe] has") + " to do is lower " + (target == pc ? "your":"[target.hisHer]") + " head, and suddenly, " + (target == pc ? "you look":"[target.heShe] looks") + " quite dangerous.");
				else if(target.hornLength < 12) outputRouter(" Two large horns sprout from " + (target == pc ? "your":"[target.hisHer]") + " forehead, curving forwards like those of a bull.");
				else if(target.hornLength < 20) outputRouter(" Two very large and dangerous looking horns sprout from " + (target == pc ? "your":"[target.hisHer]") + " head, curving forward and over a foot long. They have dangerous looking points.");
				else outputRouter(" Two huge horns erupt from " + (target == pc ? "your":"[target.hisHer]") + " forehead, curving outward at first, then forwards. The weight of them is heavy, and they end in dangerous looking points.");
				break;
			//Lizard horns
			case GLOBAL.TYPE_LIZAN:
			case GLOBAL.TYPE_DRACONIC:
				if(target.horns == 2 && target.hornType != GLOBAL.TYPE_DRACONIC) outputRouter(" A pair of " + num2Text(int(target.hornLength)) + "-inch horns grow from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head, sweeping backwards and adding to " + (target == pc ? "your":"[target.hisHer]") + " imposing visage.");
				//Super lizard horns
				else outputRouter(" Two pairs of horns, roughly a foot long, sprout from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head. They sweep back and give " + (target == pc ? "you":"[target.himHer]") + " a fearsome look, almost like the dragons from terran legends.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				outputRouter(" A pair of " + num2Text(int(target.hornLength)) + "-inch horns grow from just above " + (target == pc ? "your":"[target.hisHer]") + " forehead, sweeping backwards to follow the contour of " + (target == pc ? "your":"[target.hisHer]") + " skull.");
				if(target.isBimbo()) outputRouter(" They’d make the most <i>adorable</i> handlebars for anybody looking to bust a nut down " + (target == pc ? "your":"[target.hisHer]") + " throat!");
				break;
			//Antlers!
			case GLOBAL.TYPE_DEER:
				if(rand(2) == 0) outputRouter(" A pair of antlers sprout from " + (target == pc ? "your":"[target.hisHer]") + " head, covered in velvet and indicating " + (target == pc ? "your":"[target.hisHer]") + " status as a desirable mate.");
				else outputRouter(" Velvet-covered antlers sprout from " + (target == pc ? "your":"[target.hisHer]") + " head, declaring " + (target == pc ? "your":"[target.hisHer]") + " status as a desirable mate and formidable opponent.");
				if(target.hornLength > 1) outputRouter(" They are " + num2Text(int(target.hornLength)) + "-inch long and fork into " + num2Text(target.horns) + " points.");
				break;
			case GLOBAL.TYPE_DRYAD:
				outputRouter(" Two");
				if(target.hornLength > 1) outputRouter(" " + num2Text(int(target.hornLength)) + "-inch long");
				outputRouter(" antlers, forking into " + num2Text(target.horns) + " points, have sprouted from the top of " + (target == pc ? "your":"[target.hisHer]") + " head, forming a spiky, regal crown of branches.");
				break;
			//Goatliness is next to godliness.
			case GLOBAL.TYPE_GOAT:
				if(target.hornLength >= 6)
				{
					outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)));
					if(hornStyle > 0)
					{
						if(hornMaterial <= 0 && hornColor != "") outputRouter(" " + hornColor);
						outputRouter(" goat horns extend from the top of " + (target == pc ? "your":"[target.hisHer]") + " forehead.");
						switch(hornStyle)
						{
							case 1:
								outputRouter(" The curled goat horns coil out from the sides of " + (target == pc ? "your":"[target.hisHer]") + " forehead, " + num2Text(int(target.hornLength)) + " inches to the left and right.");
								break;
							case 2:
								outputRouter(" The bow-curved goat horns extend in opposite directions from the sides of " + (target == pc ? "your":"[target.hisHer]") + " forehead, " + num2Text(int(target.hornLength)) + " inches to the left and right.");
								break;
							case 3:
								outputRouter(" The thick ibex-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, curving towards " + (target == pc ? "your":"[target.hisHer]") + " back in a regal manner.");
								break;
							case 4:
								outputRouter(" The oryx-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, thin and mostly straight aside a slight bend towards the floor.");
								break;
							case 5:
								outputRouter(" The markhor-like horns rise " + num2Text(int(target.hornLength)) + " inches into the air, twisted and alien in shape.");
								break;
						}
					}
					else outputRouter(" curled goat horns twist back from " + (target == pc ? "your":"[target.hisHer]") + " forehead, curling over " + (target == pc ? "your":"[target.hisHer]") + " [target.ears] like a satyr out of terran legend.");
				}
				else outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " goat horns stick straight out from " + (target == pc ? "your":"[target.hisHer]") + " forehead, making " + (target == pc ? "you":"[target.himHer]") + " appear like a satyr out of terran legend.");
				break;
			//Ram horns
			case GLOBAL.TYPE_SHEEP:
				if(rand(2) == 0)
				{
					if(target.hornLength >= 10) outputRouter(" Impressive curved ram horns sprout from " + (target == pc ? "your":"[target.hisHer]") + " head, showing off to all who can see that " + (target == pc ? "you are":"[target.heShe] is") + " more than capable of defending " + (target == pc ? "your":"[target.himHer]") + "self and " + (target == pc ? "your":"[target.hisHer]") + " territory.");
					else outputRouter(" Slightly curved ewe horns emerge from " + (target == pc ? "your":"[target.hisHer]") + " head, giving " + (target == pc ? "you":"[target.himHer]") + " a graceful appearance.");
				}
				else
				{
					if(target.hornLength >= 10) outputRouter(" A pair of large ram horns grow from " + (target == pc ? "your":"[target.hisHer]") + " head, showing off to all who can see that " + (target == pc ? "you are":"[target.heShe] is") + " a formidable opponent.");
					else outputRouter(" A pair of sheep-like horns grow from " + (target == pc ? "your":"[target.hisHer]") + " head, each with a naturally elegant curve.");
				}
				break;
			//Rhinoceros horn!
			case GLOBAL.TYPE_RHINO:
				// Default
				if(target.horns == 1) outputRouter(" A thick, wide keratin horn emerges from " + (target == pc ? "your":"[target.hisHer]") + " forehead, " + num2Text(int(target.hornLength)) + "-inches long and sporting a slight upward curve.");
				// More rhino-esque
				else if(target.horns == 2) outputRouter(" Protruding from the bridge of " + (target == pc ? "your":"[target.hisHer]") + " nose, a thick, " + num2Text(int(target.hornLength)) + "-inch long keratin horn emerges, sporting a slight upward curve and followed by a smaller, smoother bump of horn right behind it.");
				// Triceratops!
				else if(target.horns == 3) outputRouter(" Two thick, wide keratin horns emerge from " + (target == pc ? "your":"[target.hisHer]") + " forehead, " + num2Text(int(target.hornLength)) + "-inches long with a slight upward curve. A third, smaller horn protrudes from, and perpendicular to, " + (target == pc ? "your":"[target.hisHer]") + " nose bridge.");
				// Too many horns...
				else outputRouter(" Thick, keratin horns emerge from " + (target == pc ? "your":"[target.hisHer]") + " forehead and face, all varying sizes, with the largest at about " + num2Text(int(target.hornLength)) + "-inches long. They all protrude forward and slightly curve upwards, creating a very menacing pincusion-like visage.");
				break;
			//Unicorn horn!
			case GLOBAL.TYPE_NARWHAL:
				outputRouter(" A slender ivory horn extends from " + (target == pc ? "your":"[target.hisHer]") + " forehead, " + num2Text(int(target.hornLength)) + "-inches long with a spiral pattern of ridges and grooves up its length, giving it a graceful appearance.");
				break;
			case GLOBAL.TYPE_FROSTWYRM:
				outputRouter(" A pair of ivory, thick horns extend from " + (target == pc ? "your":"[target.hisHer]") + " forehead, arcing upward and over " + (target == pc ? "your":"[target.hisHer]") + " skull, sort of like they’re protecting " + (target == pc ? "you":"[target.himHer]") + " from anything that might fall onto " + (target == pc ? "your":"[target.hisHer]") + " head. They’re each");
				if (target.hornLength < 8 || target.hornLength > 12) outputRouter(num2Text(int(target.hornLength)) + "-inches long");
				else outputRouter(" maybe a foot long");
				outputRouter(" and as thick as two or three fingers together. They’re useless for attacking, but they provide decent coverage - and they no doubt add to your imposing visage");
				if (target.race() == "frostwyrm") outputRouter(" as a Frostwyrm.");
				else outputRouter(".");
				break;
			case GLOBAL.TYPE_XHELARFOG:
				outputRouter(" Sprouting from " + (target == pc ? "your forehead, you have":"[target.hisHer] forehead, [target.heShe] has") + " an upward pointing, slightly curved set of horns.");
				if (hornMaterial <= 0 || hornColor == "") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " curved horns are [target.skinColor] at their base, but fade into gold at their tips.");
				break;
			case GLOBAL.TYPE_SAURMORIAN:
				outputRouter(" A pair of dense, metal horns, roughly " + num2Text(int(target.hornLength)) + " inches long, curve up and along the back of " + (target == pc ? "your":"[target.hisHer]") + " skull");
				if (target.hornLength >= 18) outputRouter(" and over " + (target == pc ? "your":"[target.hisHer]") + " head before twisting upwards at the brow");
				if (target.horns == 3) outputRouter(". At the tip of " + (target == pc ? "your":"[target.hisHer]") + " [target.face], just above " + (target == pc ? "your":"[target.hisHer]") + " nose, sits a third, shorter horn");
				outputRouter(". They have a rather intimidating presence, as if reminiscent of a more savage time.");
				break;
			//Dzaan horns!
			case GLOBAL.TYPE_DZAAN:
				if(target.hornLength < 1) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " tiny keratin nubs protrude from " + (target == pc ? "your":"[target.hisHer]") + " forehead.");
				else if(target.hornLength < 2) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " small, roughly one-inch long keratin horns protrude from " + (target == pc ? "your":"[target.hisHer]") + " forehead. They’re kind of cute, actually.");
				else if(target.hornLength < 3) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " keratin horns, approximately two inches in length, jut from " + (target == pc ? "your":"[target.hisHer]") + " forehead.");
				else if(target.hornLength < 4) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " keratin horns jut a full three inches from " + (target == pc ? "your":"[target.hisHer]") + " forehead and curve upwards.");
				else if(target.hornLength < 5) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " keratin horns protrude through the [target.skin] of " + (target == pc ? "your":"[target.hisHer]") + " forehead and curve backwards. Each is about four inches in length and impossible to ignore.");
				else if(target.hornLength < 6) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " big, strong keratin horns jut from " + (target == pc ? "your":"[target.hisHer]") + " forehead and curve backwards.");
				else if(target.hornLength < 8) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " keratin horns protrude from " + (target == pc ? "your":"[target.hisHer]") + " skull, each powerful and half a foot long with a natural backwards-facing curve.");
				else if(target.hornLength < 12) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " large keratin horns sprout from " + (target == pc ? "your":"[target.hisHer]") + " forehead, curving back over " + (target == pc ? "your":"[target.hisHer]") + " head and looking quite alluring.");
				else if(target.hornLength < 20) outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " very large and dangerous looking keratin horns sprout from " + (target == pc ? "your":"[target.hisHer]") + " head, curving backward and over a foot long. They appear both imposing and alluring.");
				else outputRouter(" " + StringUtil.capitalize(num2Text(target.horns)) + " huge keratin horns erupt from " + (target == pc ? "your":"[target.hisHer]") + " forehead, curving upward and backwards. The weight of them is noticeable but their size commands attention.");
				break;
		}
		if(hornMaterial > 0 && hornColor != "")
		{
			switch(hornMaterial)
			{
				case 1: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + hornsNoun + " " + (target.horns == 1 ? "is" : "are") + " not " + (target.horns == 1 ? "its" : "their") + " typical color, instead being " + hornColor + "."); break;
				case 2:
					outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + hornsNoun + " appear" + (target.horns == 1 ? "s" : "") + " to be crafted from polished " + hornColor + ", and " + (target.horns == 1 ? "has" : "have") + " a pleasant, reflective shine.");
					if(silly && hornColor == "steel") outputRouter(" " + (target == pc ? "You’re":"[target.HeShe]’s") + " getting used to comments that " + (target.horns == 1 ? "it’s" : "they’re") + " a little too on the nose.");
					break;
				case 3: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + hornsNoun + " appear" + (target.horns == 1 ? "s" : "") + " to be made of cut, shaped and polished " + hornColor + ", giving " + (target == pc ? "you":"[target.himHer]") + " an almost regal appearance."); break;
			}
		}
	}
	else if(target.hasStatusEffect("Horn Bumps")) outputRouter(" <b>" + (target == pc ? "Your":"[target.HisHer]") + " forehead is red and irritated in two different places. The upraised bumps stand out quite visibly.</b>");
	
	//Misc. Head Ornaments
	if(target.hasStatusEffect("Hair Flower"))
	{
		if(target.statusEffectv1("Hair Flower") > 1)
		{
			if(rand(2) == 0) outputRouter(StringUtil.capitalize(num2Text(target.statusEffectv1("Hair Flower"))) + " huge " + target.getStatusTooltip("Hair Flower") + " orchids grow from the sides of " + (target == pc ? "your":"[target.hisHer]") + " head, their big long petals flopping gaily when " + (target == pc ? "you move":"[target.heShe] moves") + ".");
			else outputRouter(" Nestled on " + (target == pc ? "your":"[target.hisHer]") + " head, there are " + num2Text(target.statusEffectv1("Hair Flower")) + " " + target.getStatusTooltip("Hair Flower") + " orchids. It looks like " + (target == pc ? "you":"[target.heShe]") + " stuck them there, but they’re very much a part of " + (target == pc ? "you":"[target.himHer]") + ", flourishing from " + (target == pc ? "your":"[target.hisHer]") + " scalp merrily.");
		}
		else
		{
			if(rand(2) == 0) outputRouter(" A huge " + target.getStatusTooltip("Hair Flower") + " orchid grows from the side of " + (target == pc ? "your":"[target.hisHer]") + " head, its big long petals flopping gaily when " + (target == pc ? "you move":"[target.heShe] moves") + ".");
			else outputRouter(" Nestled at one side of " + (target == pc ? "your":"[target.hisHer]") + " head, there is " + indefiniteArticle(target.getStatusTooltip("Hair Flower")) + " orchid. It looks like " + (target == pc ? "you":"[target.heShe]") + " stuck it there, but it’s very much a part of " + (target == pc ? "you":"[target.himHer]") + ", flourishing from " + (target == pc ? "your":"[target.hisHer]") + " scalp merrily.");
		}
	}
	
	// Worn collars
	appearanceWornCollar();
	
	if (target.hasStatusEffect("Roxy Style Collar Mark"))
	{
		outputRouter(" A bright red loop of collar-tenderized skin is visible on your neck");
		if (target.hasFur()) outputRouter(" below your fur");
		outputRouter(", proof of Roxy’s lasting");
		if (silly) outputRouter(" snu-snu.");
		else outputRouter(" domination.");
	}
	
	//BODY PG HERE
	if(target == pc)
	{
		outputRouter("\n\n");
		if(target.hasPerk("True Doll")) outputRouter("Like a living sex doll, you have a plastic,");
		else outputRouter("You have a");
		outputRouter(" humanoid upper body with the usual torso, arms, hands, and fingers");
	}
	else outputRouter("\n\nFrom the waist up, [target.name] has your typical humanoid upper body: torso, arms, hands, and fingers");
	
	switch(target.skinType)
	{
		case GLOBAL.SKIN_TYPE_FUR:
			outputRouter(", mostly covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_SCALES:
			outputRouter(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_CHITIN:
			outputRouter(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_GOO:
			if(target.hasStatusEffect("Opaque Skin")) outputRouter(", covered in a layer of glistening goo");
			else outputRouter(", all of them glittering, semi-transparent goo");
			break;
		case GLOBAL.SKIN_TYPE_FEATHERS:
			outputRouter(", covered in " + (rand(2) == 0 ? "patches" : "a layer") + " of " + target.skinFurScales(true, true));
			if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(" above the waist and similarly colored fur below");
			break;
		case GLOBAL.SKIN_TYPE_PLANT:
			outputRouter(", covered in " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_BARK:
			outputRouter(", covered in a layer of " + target.skinFurScales(true, true));
			break;
		case GLOBAL.SKIN_TYPE_GEL:
			outputRouter(", covered by skin that is actually somewhat gelatinous, easily springing back against any force applied to it, and sealing over wounds in seconds. " + (target==pc?"Your":"[target.HisHer]") + " semi-gelatinous skin is slightly sticky to the touch");
			if(target==pc) outputRouter(", and you know that it can increase this tenfold should you need to climb something");
			outputRouter(". ");
			if(target.hasSkinFlag(GLOBAL.FLAG_SCALED_PRETTY)) outputRouter((target==pc?"You have":"[target.HeShe] has") + " rough [target.scaleColor] scales across " + (target==pc?"your":"[target.hisHer]") + " abdomen in a corset-like pattern");
			break;
	}
	if(target.skinType == GLOBAL.SKIN_TYPE_LATEX || target.hasStatusEffect("Rubber Wrapped"))
	{
		outputRouter(",");
		if(target.skinType != GLOBAL.SKIN_TYPE_LATEX && target.hasStatusEffect("Rubber Wrapped")) outputRouter(" all");
		outputRouter(" sensually wrapped in a layer of");
		if(target.statusEffectv1("Latex Skin") > 0)
		{
			if(target.statusEffectv1("Latex Skin") < 2) outputRouter(" semi-glossy");
			else if(target.statusEffectv1("Latex Skin") < 3) outputRouter(" glossy");
			else outputRouter(" extra-glossy");
		}
		outputRouter(" " + (target.skinType == GLOBAL.SKIN_TYPE_LATEX ? target.skinTone : target.skinFurScalesColor()) + " latex");
	}
	
	//WINGS!
	if(target.wingType != GLOBAL.TYPE_HUMAN)
	{
		outputRouter(", and");
		switch(target.wingType)
		{
			case GLOBAL.TYPE_SMALLBEE:
			case GLOBAL.TYPE_MYR:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" insect-like wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, too small to allow " + (target == pc ? "you":"[target.himHer]") + " to fly. They shimmer beautifully in the light.");
				break;
			case GLOBAL.TYPE_BEE:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" large, insectile wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, reflecting the light through their clear membranes beautifully.");
				if (!(target is ZilMaleTreated)) outputRouter(" They’ll bear " + (target == pc ? "your":"[target.hisHer]") + " weight if " + (target == pc ? "you choose":"[target.heShe] chooses") + " to fly.");
				break;
			case GLOBAL.TYPE_SMALLDEMONIC:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" tiny bat-like demon-wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, flapping cutely, otherwise of little use.");
				break;
			case GLOBAL.TYPE_DEMONIC:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" large bat-like demon-wings fold " + (target.statusEffectv1("Wing Position") == 1 ? "over " + (target == pc ? "your":"[target.hisHer]") + " body" : "behind " + (target == pc ? "your":"[target.hisHer]") + " shoulders") + ". With a muscle-twitch, " + (target == pc ? "you":"[target.heShe]") + " can extend them, and use them to soar gracefully through the air.");
				break;
			case GLOBAL.TYPE_SHARK:
				if(target.wingCount == 2) outputRouter(" a pair of ");
				else if(target.wingCount == 4) outputRouter(" a quartet of ");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				if(target.wingCount > 1) outputRouter(" large shark-like fins have sprouted between " + (target == pc ? "your":"[target.hisHer]") + " shoulder blades. With them " + (target == pc ? "you have":"[target.heShe] has") + " far more control over swimming underwater.");
				else outputRouter(" a large shark-like fin has sprouted between " + (target == pc ? "your":"[target.hisHer]") + " shoulder blades. With it " + (target == pc ? "you have":"[target.heShe] has") + " far more control over swimming underwater.");
				break;
			case GLOBAL.TYPE_AVIAN:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" large, feathery wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over " + (target == pc ? "your":"[target.hisHer]") + " body" : "") + ". Though " + (target == pc ? "you usually keep":"[target.heShe] usually keeps") + " the " + target.wingColor() + "-colored wings folded close, they can unfurl to allow " + (target == pc ? "you":"[target.himHer]") + " to soar as gracefully as a bird.");
				break;
			case GLOBAL.TYPE_SMALLDRACONIC:
				outputRouter(" small, vestigial wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " shoulders. They might look like bat’s wings, but the membranes are covered in fine, delicate scales.");
				break;
			case GLOBAL.TYPE_DRACONIC:
				outputRouter(" magnificent " + target.wingColor() + " wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " shoulders" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over " + (target == pc ? "your":"[target.hisHer]") + " body" : "") + ". When unfurled they stretch further than " + (target == pc ? "your":"[target.hisHer]") + " arm span, and a single beat of them is all " + (target == pc ? "you need":"[target.heShe] needs") + " to set out toward the sky. They look a bit like bat’s wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
				break;
			case GLOBAL.TYPE_DRAGONFLY:
				outputRouter(" giant dragonfly wings hang from " + (target == pc ? "your":"[target.hisHer]") + " shoulders. At a whim, " + (target == pc ? "you":"[target.heShe]") + " could twist them into a whirring rhythm fast enough to lift " + (target == pc ? "you":"[target.himHer]") + " off the ground and allow " + (target == pc ? "you":"[target.himHer]") + " to fly.");
				break;
			case GLOBAL.TYPE_SYLVAN:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" " + target.wingColor() + " gossamer wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, displaying a prismatic sheen when they flap. Despite their delicate appearance they have no problem carrying " + (target == pc ? "you":"[target.himHer]") + " aloft, and can fold up safely against " + (target == pc ? "your":"[target.hisHer]") + " back for protection.");
				break;
			case GLOBAL.TYPE_DARK_SYLVAN:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" gossamer wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, " + target.wingColor() + " with a pattern that makes them look as though they’re coated in wisps of shadow when they flap. Despite their delicate appearance they have no problem carrying " + (target == pc ? "you":"[target.himHer]") + " aloft, and can fold up safely against " + (target == pc ? "your":"[target.hisHer]") + " back for protection.");
				break;
			case GLOBAL.TYPE_DOVE:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else outputRouter(" " + num2Text(int(target.wingCount)));
				if(target.wingCount < 4) outputRouter(" " + target.wingColor() + " wings adorn " + (target == pc ? "your":"[target.hisHer]") + " back, feathered like a dove’s and big enough to be worn like a cloak when folded over " + (target == pc ? "your":"[target.hisHer]") + " body. They’re strong enough to glide with, but nice and soft to the touch.");
				else if(target.wingCount < 6) outputRouter(" wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, each covered in wonderfully soft " + target.wingColor() + " feathers and big enough to be worn like a robe when all " + num2Text(int(target.wingCount)) + " are folded over " + (target == pc ? "your":"[target.hisHer]") + " body. They’re arranged so they don’t get in each other’s way when spread, thus " + (target == pc ? "you":"[target.heShe]") + " can still glide with them.");
				else outputRouter(" wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, each covered in wonderfully soft " + target.wingColor() + " feathers and big enough to be worn like a luxurious ceremonial robe when all " + num2Text(int(target.wingCount)) + " are folded over " + (target == pc ? "your":"[target.hisHer]") + " body, which " + (target == pc ? "you often find your":"[target.heShe] often finds [target.himHer]") + "self doing to help with getting through tight spaces. Despite their sheer bulk, " + (target == pc ? "you":"[target.heShe]") + " can still glide with them.");
				break;
			case GLOBAL.TYPE_GRYVAIN:
				if(target.wingCount == 2) outputRouter(" a pair of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" magnificent wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " shoulders" + (target.statusEffectv1("Wing Position") == 1 ? " and fold over " + (target == pc ? "your":"[target.hisHer]") + " body" : "") + ". When unfurled they stretch further than " + (target == pc ? "your":"[target.hisHer]") + " arm span, and a single beat of them is all " + (target == pc ? "you need":"[target.heShe] needs") + " to set out toward the sky. They look a bit like bat’s wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
				break;
			case GLOBAL.TYPE_COCKVINE:
			case GLOBAL.TYPE_TENTACLE:
				if(target.wingCount == 3) outputRouter(" a trio of");
				else if(target.wingCount == 4) outputRouter(" a quartet of");
				else if(target.wingCount == 12) outputRouter(" a dozen");
				else if(target.wingCount > 1) outputRouter(" " + num2Text(int(target.wingCount)));
				outputRouter(" oily, prehensile phalluses sprout from " + (target == pc ? "your":"[target.hisHer]") + " shoulders and back. They are retractable at will and can move on their own volition.");
				if(target.wingType == GLOBAL.TYPE_COCKVINE) outputRouter(" From afar, they may look like innocent vines, but up close, each tentacle contains a bulbous head with a leaking cum-slit");
				else if(target.wingType == GLOBAL.TYPE_TENTACLE) outputRouter(" Each tentacle contains a hefty knot with a long, nub-lined shaft and tipped with a cum-drooling slit");
				else outputRouter(" Each tentacle contains a bulbous head with a cum-leaking slit");
				outputRouter(", perfect for mass breeding.");
				break;
			case GLOBAL.TYPE_MOTHRINE:
				outputRouter(" " + num2Text(int(target.wingCount)) + " " + target.wingColor() + " moth wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back, covered in symmetrical, abstract patterns.");
				if(target.wingTexture() == GLOBAL.FLAG_FURRED) outputRouter(" They’re covered in a soft fuzz and feel very light.");
				else outputRouter(" They feel very light and delicate to the touch.");
				outputRouter(" They fold behind " + (target == pc ? "you":"[target.himHer]") + " neatly and compactly, the ends in line with the back of " + (target == pc ? "your":"[target.hisHer]") + " lower calves. They let " + (target == pc ? "you":"[target.himHer]") + " hover for a short time and glide easily, although true flight is deceptively difficult to maintain.");
				break;
			case GLOBAL.TYPE_FROSTWYRM:
				outputRouter(" " + (target.wingCount == 2 ? "a pair of":num2Text(int(target.wingCount))) + " majestic reptilian wings sprout from " + (target == pc ? "your":"[target.hisHer]") + " back. Your arms are covered in [target.scaleColor] scales, each bone tipped with a small talon, while the membranes are a glittering silver shade that produces a mesmerizing display in the light. Thanks to " + (target == pc ? "your":"[target.hisHer]") + " smaller size, they have no trouble bearing " + (target == pc ? "you":"[target.himHer]") + " aloft even without the frostwyrm’s psionic abilities.");
				break;
			case GLOBAL.TYPE_JANERIA:
				outputRouter(" " + (target.wingCount == 4 ? "a quartet of":num2Text(int(target.wingCount))) + " large [target.skinColor] tentacles sprout from just behind " + (target == pc ? "your":"[target.hisHer]") + " shoulders, curling upward before drooping down so that the tips hang just a few inches above the ground. Each ends in a huge diamond-shaped pad, featureless but lightly sticky to the touch on one side while smooth and slippery on the other. When you curl the sticky sides of the pads inward, the result looks distinctly phallic.");
				break;
		}
	}
	else outputRouter(".");
	
	// Neck mane stuff
	if(target.hasPerk("Regal Mane"))
	{
		outputRouter(" Above " + (target == pc ? "your":"[target.hisHer]") + " shoulders and around " + (target == pc ? "your":"[target.hisHer]") + " neck grows a");
		switch(target.perkv1("Regal Mane"))
		{
			case GLOBAL.FLAG_FURRED: outputRouter(" mane of fluffy, " + target.furColor + " fur"); break;
			case GLOBAL.FLAG_SCALED: outputRouter(" retractable frill covered in " + target.scaleColor + " scales"); break;
			case GLOBAL.FLAG_CHITINOUS: outputRouter(" collar of spiky, " + target.chitinColor() + " chitin"); break;
			case GLOBAL.FLAG_GOOEY: outputRouter(" flexible shell of smooth, " + target.skinTone + " goo"); break;
			case GLOBAL.FLAG_FEATHERED: outputRouter(" mane of poofy, " + target.furColor + " feathers"); break;
			case GLOBAL.FLAG_SPIKED: outputRouter(" collar of sinister-looking spikes"); break;
			case GLOBAL.FLAG_TENDRIL: outputRouter(" wreath of plant-like vines"); break;
			case GLOBAL.FLAG_FLOWER_SHAPED: outputRouter("n aromatic mane of flower petals"); break;
			case GLOBAL.FLAG_AMORPHOUS: outputRouter("n amorphous brace of translucent slime"); break;
			default: outputRouter(" magnificent mane"); break;
		}
		outputRouter(", making " + (target == pc ? "you":"[target.himHer]") + " appear quite royal.");
	}
	// Fluff stuff
	if(!target.hasFur() && !target.hasFeathers() && (target.hasSkinFlag(GLOBAL.FLAG_FURRED) || target.hasSkinFlag(GLOBAL.FLAG_FEATHERED)))
	{
		outputRouter(" Growing from " + (target == pc ? "your":"[target.hisHer]") + " " + target.skinNoun(false, true) + " is a layer of downy " + (!target.hasSkinFlag(GLOBAL.FLAG_FEATHERED) ? "fur" : "feathers") + ".");
	}
	if(target.hasSkinFlag(GLOBAL.FLAG_FLUFFY))
	{
		if(target.biggestTitSize() > 2) outputRouter(" Nestled between " + (target == pc ? "your":"[target.hisHer]") + " breasts");
		else outputRouter(" Poofing out " + (target == pc ? "your":"[target.hisHer]") + " chest");
		outputRouter(" is a fluffy ball of " + target.furColor + " " + ((target.hasFur() || target.hasFeathers()) ? target.skinNoun(false,true) : "fur") + ".");
	}
	if(target.hasFur() && target.perkv1("Wooly") >= 1)
	{
		outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " chest and back are covered in a thick, bushy layer of wool.");
	}
	
	// Body Markings
	if(target.hasAccentMarkings())
	{
		var bodyPts:Array = ["back", "arms", (target.legCount == 1 ? target.legNoun() : target.legsNoun())];
		if(target.hasTail()) bodyPts.push(target.tailsDescript(true));
		
		switch(target.accentMarkings())
		{
			// Vanaebutt Skin
			case 0: outputRouter(" Swirls of " + target.skinAccent + " trace brighter accents across much of " + (target == pc ? "your":"[target.hisHer]") + " form."); break;
			// Others
			case 1: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.skinAccent + " stripes running all across " + (target == pc ? "your":"[target.hisHer]") + " body; " + (target == pc ? "your":"[target.hisHer]") + " " + CompressToList(bodyPts) + "."); break;
			case 2: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.skinAccent + " spots dotting every part of " + (target == pc ? "your":"[target.hisHer]") + " body; " + (target == pc ? "your":"[target.hisHer]") + " " + CompressToList(bodyPts) + "."); break;
			case 3: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " an off-color blotch on the frontal part of " + (target == pc ? "your":"[target.hisHer]") + " body, covering " + (target == pc ? "your":"[target.hisHer]") + " chin, " + target.chestDesc() + ", belly and inner thighs in " + target.skinAccent + "."); break;
			case 4: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " speckles of " + target.skinAccent + " covering " + (target == pc ? "your":"[target.hisHer]") + " body."); break;
			case 5: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " dapples of " + target.skinAccent + " covering " + (target == pc ? "your":"[target.hisHer]") + " body."); break;
			case 6: outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.skinAccent + " piebald markings covering " + (target == pc ? "your":"[target.hisHer]") + " body."); break;
			case 7: outputRouter(" Parts of " + (target == pc ? "your":"[target.hisHer]") + " " + ((target.hasFur() || target.hasFeathers()) ? "fur" : "body") + " show abstract " + target.skinAccent + " tattoos, ones that glow faintly with a pleasant aura."); break;
		}
	}
	// Freckles
	if(target.hasSkinFlag(GLOBAL.FLAG_FRECKLED))
	{
		if(target.hasFur() || target.hasFeathers()) outputRouter(" Beneath " + (target == pc ? "your":"[target.hisHer]") + " body fur, f");
		else outputRouter(" F");
		outputRouter("reckles dot various parts of " + (target == pc ? "your":"[target.hisHer]") + " skin.");
	}
	
	// Cum Splattered!
	if(target.hasStatusEffect("Cum Soaked") || target.hasStatusEffect("Pussy Drenched") || target.hasStatusEffect("Milk Bathed"))
	{
		var fluidList:Array = [];
		var fluidDesc:String = "";
		var fluidVisc:Array = [];
		var fluidLayer:int = 0;
		var fluidLayers:Number = 0;
		
		if(target.hasStatusEffect("Cum Soaked"))
		{
			fluidLayers += target.statusEffectv1("Cum Soaked");
			fluidLayer = Math.ceil(target.statusEffectv1("Cum Soaked"));
			if(fluidLayer > 3) fluidLayer = 3;
			fluidVisc = ["cum", "spooge", "gooey semen", "goopey spunk"];
			fluidList.push(fluidVisc[fluidLayer]);
		}
		if(target.hasStatusEffect("Pussy Drenched"))
		{
			fluidLayers += target.statusEffectv1("Pussy Drenched");
			fluidLayer = Math.ceil(target.statusEffectv1("Pussy Drenched"));
			if(fluidLayer > 3) fluidLayer = 3;
			fluidVisc = ["girl-lube", "girl-juice", "slimy girl-cum", "sloppy fem-cum"];
			fluidList.push(fluidVisc[fluidLayer]);
		}
		if(target.hasStatusEffect("Milk Bathed"))
		{
			fluidLayers += target.statusEffectv1("Milk Bathed");
			fluidLayer = Math.ceil(target.statusEffectv1("Milk Bathed"));
			if(fluidLayer > 3) fluidLayer = 3;
			fluidVisc = ["breastmilk", "tit-juice", "wet lactation", "sopping tit-milk"];
			fluidList.push(fluidVisc[fluidLayer]);
		}
		for(i = 0; i < fluidList.length; i++)
		{
			if(i != 0)
			{
				if(i == fluidList.length - 1) fluidDesc += " and";
				else fluidDesc += ", ";
			}
			fluidDesc += " " + fluidList[i];
		}
		
		outputRouter(" " + (target == pc ? "You are":"[target.HeShe] is") + " soaked");
		if(fluidLayers <= 1) outputRouter(" in visible splotches of");
		else if(fluidLayers <= 2) outputRouter(" in a fine layer of");
		else if(fluidLayers <= 4) outputRouter(" in layers of");
		else outputRouter(" from top to bottom with thick layers of");
		outputRouter(" " + fluidDesc + ", making " + (target == pc ? "your":"[target.hisHer]") + " messy sexcapades obvious to everyone around " + (target == pc ? "you":"[target.himHer]") + ".");
	}
	// Mimbrane sweat
	if(flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined)
	{
		outputRouter(" In addition, " + (target == pc ? "your":"[target.hisHer]") + " body is soaked in");
		if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" a viscous layer");
		else if(target.statusEffectv1("Sweaty") <= 1) outputRouter(" a light layer");
		else if(target.statusEffectv1("Sweaty") <= 2) outputRouter(" visible layers");
		else if(target.statusEffectv1("Sweaty") <= 4) outputRouter(" multiple layers");
		else outputRouter(" thick layers");
		outputRouter(" of oily, strawberry-scented " + (target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED) ? "lubrication" : "perspiration") + ", giving it a slick, sensual shine.");
	}
	// Lube skin!
	else if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
	{
		outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.skin() + " is secreting");
		if(target.hasSkinFlag(GLOBAL.FLAG_APHRODISIAC_LACED))outputRouter(" an aphrodisiac sweat");
		else outputRouter(" a constant layer of lubrication");
		outputRouter(", giving it a slick oiled shine.");
	}
	// Muscles - Sweaty ( Shazam Remix )
	else if(target.hasStatusEffect("Sweaty"))
	{
		outputRouter(" In addition, " + (target == pc ? "your":"[target.hisHer]") + " body");
		if(target.statusEffectv1("Sweaty") <= 1) outputRouter(" is sprinkled with a light layer");
		else if(target.statusEffectv1("Sweaty") <= 2) outputRouter(" glistens with visible layers");
		else if(target.statusEffectv1("Sweaty") <= 4) outputRouter(" is covered in multiple layers");
		else outputRouter(" looks soaked, completely drenched in thick layers");
		outputRouter(" of sweat, signaling the exertion of " + (target == pc ? "your":"[target.hisHer]") + " previous physical activities.");
	}
	// Roehm Goo
	if(target.hasStatusEffect("Roehm Slimed"))
	{
		outputRouter(" Oozing off " + (target == pc ? "your":"[target.hisHer]") + " body is a");
		if(target.statusEffectv4("Roehm Slimed") <= 1) outputRouter(" thin layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 2) outputRouter(" slick layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 3) outputRouter(" thick layer");
		else if(target.statusEffectv4("Roehm Slimed") <= 4) outputRouter(" steady stream");
		else outputRouter(" flowing blob");
		outputRouter(" of sexually charged, saccharine slug slime - an obvious signature of a Roehm encounter, no doubt.");
	}
	// Pheromones
	if(target.hasPheromones() && target == pc) outputRouter(" " + ((target.hasPerk("Pheromone Sweat") && target.skinIsSoaked()) ? "Your entire body emits" : "Parts of your body emit") + " " + RandomInCollection(["aphrodisiac-laced", "lust-scented", "musky", "aromatic"]) + " pheromones, enticing potential mates.");
	
	// ARMS
	switch(target.armType)
	{
		//Wing arms
		case GLOBAL.TYPE_AVIAN:
			if(target.hasArmFlag(GLOBAL.FLAG_PAWS))
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " hands are tipped with sharp claws, like that of a bird, with");
				if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.hasFeathers()) outputRouter(" rough skin,");
				outputRouter(" short palms and long, padded fingers.");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Feather-shaped shingles of goo");
				else outputRouter(" A feathery fringe");
				outputRouter(" covers them down to " + (target == pc ? "your":"[target.hisHer]") + " " + (target.hasArmFlag(GLOBAL.FLAG_FLUFFY) ? "wrists" : "elbows") + ", leaving " + (target == pc ? "your":"[target.hisHer]") + " hands bare.");
			}
			else
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Feather-shaped shingles of goo");
				else outputRouter(" Feathers");
				outputRouter(" hang off " + (target == pc ? "your":"[target.hisHer]") + " arms from shoulder to wrist, giving them a slightly wing-like look.");
			}
			break;
		case GLOBAL.TYPE_LEITHAN:
			outputRouter(" Small claws protrude from the tips of " + (target == pc ? "your":"[target.hisHer]"));
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			outputRouter(" fingers in place of fingernails");
			if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter(", and " + (target == pc ? "your":"[target.hisHer]") + " arms are covered from fingertip to elbow with a thick layer of chitinous plates");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) outputRouter(", and " + (target == pc ? "your":"[target.hisHer]") + " arms are covered in scales up to the shoulders");
			outputRouter(".");
			break;
		case GLOBAL.TYPE_EQUINE:
			outputRouter(" Hard, hoof-like tips have grown in place of fingernails, covering the end of each");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			outputRouter(" digit in shiny black. " + (target == pc ? "You":"[target.HeShe]") + " can still feel through them all the same.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_VULPINE:
		case GLOBAL.TYPE_LUPINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms, giving them a distinctly animalistic bent.");
			if(target.hasArmFlag(GLOBAL.FLAG_PAWS)) outputRouter(" Soft pads rest on the tips of each of " + (target == pc ? "your":"[target.hisHer]") + " fingers. ");
			if(target.armType == GLOBAL.TYPE_LUPINE) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fingers are tipped with thick, canine claws as well");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fingers are tipped with short, canine claws as well");
			if(target.armType == GLOBAL.TYPE_CANINE && !target.hasArmFlag(GLOBAL.FLAG_PAWS)) outputRouter(", just like one of the ausar");
			outputRouter(".");
			break;
		case GLOBAL.TYPE_DEMONIC:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			else outputRouter(" human-shaped");
			outputRouter(" hands appear very demonic, tipped with sharp claws that seem to have replaced " + (target == pc ? "your":"[target.hisHer]") + " fingernails.");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY) && target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) outputRouter(" In addition, " + (target == pc ? "your":"[target.hisHer]") + " forearms are covered by sleek plates of hardened goo along the outside of each arm. Smaller pentagonal plates trail up " + (target == pc ? "your":"[target.hisHer]") + " upper arms and over " + (target == pc ? "your":"[target.hisHer]") + " shoulders.");
			else if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) outputRouter(" In addition, " + (target == pc ? "your":"[target.hisHer]") + " forearms are covered by sleek plates of jet-black chitin along the outside of each arm. Smaller pentagonal plates trail up " + (target == pc ? "your":"[target.hisHer]") + " upper arms and over " + (target == pc ? "your":"[target.hisHer]") + " shoulders.");
			else if(target.hasArmFlag(GLOBAL.FLAG_SPIKED)) outputRouter(" In addition, a set of short jet-black bone spikes grow along the outside of each forearm and out of the back of " + (target == pc ? "your":"[target.hisHer]") + " elbows, giving " + (target == pc ? "you":"[target.himHer]") + " an incredibly imposing look.");
			break;
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_DRIDER:
		case GLOBAL.TYPE_BEE:
		case GLOBAL.TYPE_NYREA:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Shiny hardened " + target.scaleColor + " goo covers " + (target == pc ? "your":"[target.hisHer]") + " arms from the biceps down, resembling a pair of long " + target.scaleColor + " gloves from a distance.");
			else outputRouter(" Shining black exoskeleton covers " + (target == pc ? "your":"[target.hisHer]") + " arms from the biceps down, resembling a pair of long black gloves from a distance.");
			break;
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are almost skeletal, a fine exoskeleton of " + target.scaleColor + " " + (target.hasArmFlag(GLOBAL.FLAG_GOOEY) ? "goo" :"chitin") + " giving them a spindly look.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " lithe, graceful arms and hands are deceptively sturdy and covered in " + target.scaleColor + " " + (target.hasArmFlag(GLOBAL.FLAG_GOOEY) ? "goo" :"chitin") + ".");
			break;
		case GLOBAL.TYPE_MYR:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" Shiny hardened " + target.scaleColor + " goo");
			else outputRouter(" Shining " + target.scaleColor + " exoskeleton");
			outputRouter(" covers parts of " + (target == pc ? "your":"[target.hisHer]") + " arms in a gleaming patchwork.");
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms, giving them a distinctly animalistic bent.");
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			outputRouter(" hands are " + (target.hasArmFlag(GLOBAL.FLAG_PAWS) ? "somewhat paw-like" : "still largely human") + " in shape and dexterity " + (target.hasArmFlag(GLOBAL.FLAG_PAWS) ? "with" : "aside from the") + " fairly feline claws that have replaced " + (target == pc ? "your":"[target.hisHer]") + " fingernails.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms, giving them a distinctly animalistic bent.");
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			outputRouter(" fingers are thick and capped with bear-like claws but maintain their human opposability.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" A fluffy layer of solid " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms.");
			outputRouter(" " + RandomInCollection([
				"Each of " + (target == pc ? "your":"[target.hisHer]") + " arms are tipped with broad, bear-like paws",
				(target == pc ? "Your":"[target.HisHer]") + " fingers are tipped with cute, bear-like paw pads",
				"The palms of " + (target == pc ? "your":"[target.hisHer]") + " hands, as well as " + (target == pc ? "your":"[target.hisHer]") + " fingers are adorned with soft and cute pads"
			]) + ".");
			break;
		case GLOBAL.TYPE_KUITAN:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " gooey arms end with gel-padded fingers. ");
			else if(!target.hasFur()) outputRouter(" Dark brown pads rest on the tips of each of " + (target == pc ? "your":"[target.hisHer]") + " fingers. ");
			else outputRouter(" A coat of " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms below the shoulders, and " + (target == pc ? "your":"[target.hisHer]") + " fingers are tipped with dark brown pads. ");
			outputRouter("They’re softer and more supple than the finest leather.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.hasArmFlag(GLOBAL.FLAG_THICK)) 
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " thick, gooey arms ");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " thick, fur-covered arms ");
				outputRouter("end with broad forearms and big fingers. In contrast, delicate pads line the underside.");
			}
			else
			{
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " gooey arms ");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " furry arms ");
				outputRouter("end with small, delicate paws. Each finger has a soft pad on the underside as well. " + (target == pc ? "You":"[target.HeShe]") + " couldn’t ask for a less threatening pair of mits.");
			}
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " gooey arms are tipped with clawed fingers.");
			else if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) outputRouter(" A coat of thick " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms while claws tip " + (target == pc ? "your":"[target.hisHer]") + " fingers.");
			else outputRouter(" Claws tip " + (target == pc ? "your":"[target.hisHer]") + " fingers.");
			outputRouter(" These claws aren’t very long or sharp, and " + (target == pc ? "you get":"[target.heShe] gets") + " the feeling that the only thing they’re truly useful for is digging into someone’s skin emphatically while " + (target == pc ? "you’re":"[target.heShe]’s") + " fucking them roughly.");
			break;
		case GLOBAL.TYPE_SIMII:
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " gooey arms end with large hands.");
			else if(!target.hasFur() && !target.hasArmFlag(GLOBAL.FLAG_FURRED))
			{
				if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) outputRouter(" A visible patch of hair covers " + (target == pc ? "your":"[target.hisHer]") + " arms and over the top of " + (target == pc ? "your":"[target.hisHer]") + " large hands.");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms end with large hands.");
			}
			else outputRouter(" A coat of " + target.furColor + " fur covers " + (target == pc ? "your":"[target.hisHer]") + " arms and over the top of " + (target == pc ? "your":"[target.hisHer]") + " large hands.");
			break;
		case GLOBAL.TYPE_FROG:
			if(!target.hasFur() || !target.hasFeathers()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are incredibly smooth with a tendency to glisten in the light.");
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " webbed hands are very amphibious in appearance. Each of " + (target == pc ? "your":"[target.hisHer]") + " elongated fingers are capped with a round bulb, capable of sticking to flat surfaces like a suction cup.");
			break;
		case GLOBAL.TYPE_OVIR:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms and hands appear very human");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.hasArmFlag(GLOBAL.FLAG_SCALED) || target.hasArmFlag(GLOBAL.FLAG_GOOEY))
			{
				outputRouter(", if not for them being covered in");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				outputRouter(" " + target.scaleColor + " scales, giving them a subtle reptilian feel");
			}
			outputRouter(".");
			break;
		case GLOBAL.TYPE_FLOWER:
			if(rand(2) == 0)
			{
				outputRouter(" Ivy-like creepers crawl down the upper parts of " + (target == pc ? "your":"[target.hisHer]") + " arms, festooning them in dark green leaves.");
				if(target.hasStatusEffect("Arm Flower")) outputRouter(" They have additionally sprouted small " + target.getStatusTooltip("Arm Flower") + " flowers, proclaiming to the world that " + (target == pc ? "you are":"[target.heShe] is") + " in need of pollination.");
			}
			else
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " biceps and shoulders are covered in delicate vines. The spade-like leaves bob as " + (target == pc ? "you move":"[target.heShe] moves"));
				if(target.hasStatusEffect("Arm Flower")) outputRouter(", as do the small " + target.getStatusTooltip("Arm Flower") + " flowers " + (target == pc ? "you’re":"[target.heShe]’s") + " displaying up there");
				outputRouter(".");
			}
			break;
		case GLOBAL.TYPE_SIREN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms and hands appear very human");
			if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS || target.hasArmFlag(GLOBAL.FLAG_FEATHERED) || target.hasArmFlag(GLOBAL.FLAG_GOOEY))
			{
				outputRouter(", if not for them being");
				if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) outputRouter(" completely");
				outputRouter(" covered in");
				if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				outputRouter(" " + target.furColor + " vestigial feathers");
				if(target.skinType != GLOBAL.SKIN_TYPE_FEATHERS && target.hasArmFlag(GLOBAL.FLAG_FEATHERED)) outputRouter(" from elbow to wrist -- looking very much like natural arm warmers and");
				else outputRouter(",");
				outputRouter(" incapable of flight");
			}
			outputRouter(".");
			break;
		case GLOBAL.TYPE_SHARK:
			outputRouter(" From the elbows of " + (target == pc ? "your":"[target.hisHer]") + " ");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) outputRouter("gooey arms there are small, piscine fins that are constantly drip with ooze.");
			else
			{
				if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter("slick, ");
				if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) outputRouter(target.furColor + " furred arms there are small, piscine fins.");
				else outputRouter(target.scaleColor + " scaled arms there are small, piscine fins.");
			}
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fingers are tipped with sharp black claws and are connected by webbing, perfect for giving " + (target == pc ? "you":"[target.himHer]") + " extra momentum while swimming.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are actually bunches of tentacles, formed together into arm-like shapes. They end in long, wiggly tentacle fingers.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " forearms are covered in rough [target.scaleColor] scales that give them a serrated appearance, while " + (target == pc ? "your":"[target.hisHer]") + " fingers are slim and dextrous. Long, sharp talons have replaced " + (target == pc ? "your":"[target.hisHer]") + " nails, able to give someone a nasty scratch.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter(" The scales on " + (target == pc ? "your":"[target.hisHer]") + " hands act as claws, as they extend into sharp points beyond " + (target == pc ? "your":"[target.hisHer]") + " fingertips, and " + (target == pc ? "your":"[target.hisHer]") + " arms are covered in scales up to the shoulders.");
			break;
		case GLOBAL.TYPE_LIZAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms appear relatively normal, though");
			if (target.hasArmFlag(GLOBAL.FLAG_SCALED) && !target.hasScales()) outputRouter(" they are covered with scales up to the shoulder and");
			outputRouter(" " + (target == pc ? "your":"[target.hisHer]") + " fingers are tipped with claws instead of fingernails.");
			break;
		case GLOBAL.TYPE_HYENA:
			if (target.hasPartFur("arm")) outputRouter(" [target.CombatHisHer] arms are covered by a coat of [target.furColor] fur. The [target.furColor] runs down the full length till just before the wrists where it changes to a darker shade which flows down over [target.combatHisHer] hands.");
			else if (target.hasPartScales("arm")) outputRouter(" [target.CombatHisHer] hyena-like arms are covered by a thick hide of [pc.scaleColor] scales. Due to the scaly hide enveloping them they lack most of their distinguishing features. But rough pads still rest on the palms of [target.combatHisHer] hands and the tips of each of [target.combatHisHer] fingers, which are tipped with small blunt claws.");
			else if (target.hasPartGoo("arm")) outputRouter(" [target.CombatHisHer] gooey [target.skinColor] arms retain their hyena-like appearance.");
			else output(" [target.CombatHisHer] arms retain their hyena-like shape and claws despite being covered in [target.skinFurScalesNounSimple].");
			if (target.hasClawedHands() && !target.hasPartScales("arm")) outputRouter(" Each finger is tipped with blunt claws.");
			break;
		case GLOBAL.TYPE_DZAAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms appear relatively normal, though the shoulders are patterened with spots of keratin and " + (target == pc ? "your":"[target.hisHer]") + " fingernails are naturally darker in color and longer in length.");
			break;
		// Catch all
		default:
			if(target.hasArmFlag(GLOBAL.FLAG_FURRED))
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" fluffy");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) outputRouter(" thick");
				else outputRouter(" light");
				outputRouter(" layer of fur.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_SCALED))
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_THICK)) outputRouter(" thick");
				else if(target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) outputRouter(" smooth");
				else outputRouter(" light");
				outputRouter(" layer of scales.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS))
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_THICK)) outputRouter(" thick");
				else if(target.hasArmFlag(GLOBAL.FLAG_SMOOTH)) outputRouter(" smooth");
				else outputRouter(" light");
				outputRouter(" layer of chitin.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_FEATHERED))
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" fluffy");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) outputRouter(" thick");
				else outputRouter(" light");
				outputRouter(" layer of feathers.");
			}
			else if(target.hasArmFlag(GLOBAL.FLAG_GOOEY) && target.armType != GLOBAL.TYPE_GOOEY)
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " arms are covered in a");
				if(target.hasArmFlag(GLOBAL.FLAG_AMORPHOUS)) outputRouter("n amorphous");
				else if(target.hasArmFlag(GLOBAL.FLAG_THICK)) outputRouter(" thick");
				else outputRouter(" thin");
				outputRouter(" layer of goo.");
			}
			break;
	}
	if(target == pc && (target.hasStatusEffect("Mimbrane Hand Left") || target.hasStatusEffect("Mimbrane Hand Right")))
	{
		var bothHands:Boolean = (target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right"));
		feedVal = Math.max(pc.mimbranePuffiness("Mimbrane Hand Left"), pc.mimbranePuffiness("Mimbrane Hand Right"));
		if(feedVal > 0)
		{
			outputRouter(" Your hand");
			if(bothHands) outputRouter("s");
			outputRouter(" appear");
			if(!bothHands) outputRouter("s");
			if(feedVal <= 1) outputRouter(" to be slightly distended.");
			else if(feedVal <= 2) outputRouter(" puffy and inflated.");
			else outputRouter(" unusually large, almost engorged.");
		}
	}
	
	//Done with head bits. Move on to body stuff
	//Horse legType, other legType texts appear lower
	if(target.legType == GLOBAL.TYPE_MLP)
	{
		outputRouter(" From the waist down, " + (target == pc ? "you have":"[target.heShe] has") + " an incredibly cute and cartoonish parody of a horse’s body, with");
		if(target.legCount == 2) outputRouter(" both legs");
		else outputRouter(" all " + num2Text(target.legCount) + " legs");
		outputRouter(" ending in flat, rounded hooves.");
	}
	else if(target.legType == GLOBAL.TYPE_LIZAN && target.legCount == 6) outputRouter(" From the waist down, " + (target == pc ? "you have":"[target.heShe] has") + " a powerful, " + num2Text(target.legCount) + "-legged body that looks like a crossbreed of a lizard and a horse.");
	else if(target.legType == GLOBAL.TYPE_AVIAN && target.isTaur()) outputRouter(" From the waist down " + (target == pc ? "you possess":"[target.heShe] possesses") + " a sleek, " + num2Text(target.legCount) + "-legged body, appearing much like a crossbreed between a bird and that of an equine."); 
	else if(target.isTaur())
	{
		outputRouter(" From the waist down, " + (target == pc ? "you have":"[target.heShe] has") + " a bestial, " + num2Text(target.legCount) + "-legged form vaguely like that of a");
		switch(target.legType)
		{
			case GLOBAL.TYPE_DEER:
				outputRouter(" deer"); break;
			case GLOBAL.TYPE_BOVINE:
			case GLOBAL.TYPE_GOAT:
				outputRouter(" bovid"); break;
			case GLOBAL.TYPE_CANINE:
			case GLOBAL.TYPE_VULPINE:
			case GLOBAL.TYPE_LUPINE:
			case GLOBAL.TYPE_TANUKI:
			case GLOBAL.TYPE_KORGONNE:
				outputRouter(" canid"); break;
			case GLOBAL.TYPE_FELINE:
				outputRouter(" felid"); break;
			case GLOBAL.TYPE_PANDA:
				outputRouter("n ursid"); break;
			case GLOBAL.TYPE_LAPINE:
				outputRouter(" lagomorph"); break;
			case GLOBAL.TYPE_BADGER:
			case GLOBAL.TYPE_REDPANDA:
				outputRouter(" mustelid"); break;
			case GLOBAL.TYPE_MOUSE:
				outputRouter(" rodent"); break;
			case GLOBAL.TYPE_FROG:
				outputRouter("n amphibian"); break;
			case GLOBAL.TYPE_LIZAN:
				outputRouter(" lizard"); break;
			case GLOBAL.TYPE_SHARK:
				outputRouter(" shark"); break;
			case GLOBAL.TYPE_HYENA:
				outputRouter(" hyena"); break;
			default:
				outputRouter(" horse"); break;
		}
		outputRouter(".");
	}
	//Hip info only displays if you aren't a centaur.
	var hipRating:Number = target.hipRating();
	if(!target.isTaur()) {
		if(target.thickness > 70) {
			outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.hipsDescript());
			if(hipRating < 6) {
				if(target.tone < 65) outputRouter(" buried under a noticeable muffin-top, and");
				else outputRouter(" that blend into " + (target == pc ? "your":"[target.hisHer]") + " pillar-like waist, and");
			}
			else if(hipRating < 10) outputRouter(" that blend into the rest of " + (target == pc ? "your":"[target.hisHer]") + " thick form, and");
			else if(hipRating < 15) outputRouter(" that would be much more noticeable if " + (target == pc ? "you weren’t":"[target.heShe] wasn’t") + " so wide-bodied, and");
			else if(hipRating < 20) outputRouter(" that sway and emphasize " + (target == pc ? "your":"[target.hisHer]") + " thick, curvy shape, and");
			else outputRouter(" that sway hypnotically on " + (target == pc ? "your":"[target.hisHer]") + " extra-curvy frame, and");
		}
		else if(target.thickness < 30) {
			outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.hipsDescript());
			if(hipRating < 6) outputRouter(" that match " + (target == pc ? "your":"[target.hisHer]") + " trim, lithe body, and");
			else if(hipRating < 10) outputRouter(" that sway to and fro, emphasized by " + (target == pc ? "your":"[target.hisHer]") + " trim body, and");
			else if(hipRating < 15) outputRouter(" that swell out under " + (target == pc ? "your":"[target.hisHer]") + " trim waistline, and");
			else if(hipRating < 20) outputRouter(", emphasized by " + (target == pc ? "your":"[target.hisHer]") + " narrow waist, and");
			else outputRouter(" that swell disproportionately wide on " + (target == pc ? "your":"[target.hisHer]") + " lithe frame, and");
		}
		//STANDARD
		else {
			outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + target.hipsDescript());
			if(hipRating < 6) outputRouter(", and");
			else if(target.femininity > 50) {
				if(hipRating < 10) outputRouter(" that draw the attention of those around " + (target == pc ? "you":"[target.himHer]") + ", and");
				else if(hipRating < 15) outputRouter(" that make " + (target == pc ? "you":"[target.himHer]") + " move with a sexy, swinging gait, and");
				else if(hipRating < 20) outputRouter(" that make it look like " + (target == pc ? "you’ve":"[target.heShe] has") + " birthed many children, and");
				else outputRouter(" that make " + (target == pc ? "you":"[target.himHer]") + " look more like an animal waiting to be bred than any kind of human, and");
			}
			else {
				if(hipRating < 10) outputRouter(" that give " + (target == pc ? "you":"[target.himHer]") + " a graceful stride, and");
				else if(hipRating < 15) outputRouter(" that add a little feminine swing to your gait, and");
				else if(hipRating < 20) outputRouter(" that force " + (target == pc ? "you":"[target.himHer]") + " to sway and wiggle as " + (target == pc ? "you move":"[target.heShe] moves") + ", and");
				else {
					outputRouter(" that give " + (target == pc ? "your":"[target.hisHer]") + " ");
					if(target.balls > 0) outputRouter("balls plenty of room to breathe");
					else if(target.hasCock()) outputRouter(target.multiCockDescript() + " plenty of room to swing");
					else if(target.hasVagina()) outputRouter(target.vaginasDescript() + " a nice, wide berth");
					else outputRouter("vacant groin plenty of room");
					outputRouter(", and");
				}
			}
		}
	}
	//ASS
	//Horse version
	var buttRating:Number = target.buttRating();
	if(target.isTaur()) {
		//FATBUTT
		if(target.buttTone() < 65) {
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.buttDescript());
			if(buttRating < 4) outputRouter(" is lean, from what you can see of it.");
			else if(buttRating < 6) outputRouter(" looks fairly average.");
			else if(buttRating < 10) outputRouter(" is fairly plump and healthy.");
			else if(buttRating < 15) outputRouter(" jiggles a bit as " + (target == pc ? "you trot":"[target.heShe] trots") + " around.");
			else if(buttRating < 20) outputRouter(" jiggles and wobbles as " + (target == pc ? "you trot":"[target.heShe] trots") + " about.");
			else if(buttRating < 25) outputRouter(" is eye-drawing in the extreme, particularly when it keeps wobbling long after " + (target == pc ? "you stop":"[target.heShe] stops") + " trotting around.");
			else outputRouter(" is obscenely large, bordering freakish, even for a tauric being.");
		}
		//GIRL LOOK AT DAT BOOTY
		else {
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.buttDescript());
			if(buttRating < 4) outputRouter(" is barely noticable, showing off the muscles of " + (target == pc ? "your":"[target.hisHer]") + " haunches.");
			else if(buttRating < 6) outputRouter(" matches " + (target == pc ? "your":"[target.hisHer]") + " toned, tauric frame quite well.");
			else if(buttRating < 10) outputRouter(" gives hints of just how much muscle " + (target == pc ? "you":"[target.heShe]") + " could put into a kick.");
			else if(buttRating < 15) outputRouter(" surges with muscle whenever " + (target == pc ? "you trot":"[target.heShe] trots") + " about.");
			else if(buttRating < 20) outputRouter(" flexes its considerable mass as " + (target == pc ? "you move":"[target.heShe] moves") + ".");
			else if(buttRating < 25) outputRouter(" is stacked with layers of muscle, huge even for a tauric being.");
			else outputRouter(" is stacked with freakish amounts of muscle, so much so that it bulges and flexes obscenely while trotting around.");
		}
	}
	//Non-horse PCs
	else {
		//TUBBY ASS
		if(target.buttTone() < 60) {
			outputRouter(" " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript());
			if(buttRating < 4) outputRouter(" looks great under " + (target == pc ? "your":"[target.hisHer]") + " gear.");
			else if(buttRating < 6) outputRouter(" has the barest amount of sexy jiggle.");
			else if(buttRating < 10) outputRouter(" fills out " + (target == pc ? "your":"[target.hisHer]") + " clothing nicely.");
			else if(buttRating < 15) outputRouter(" wobbles enticingly with every step.");
			else if(buttRating < 20) outputRouter(" wobbles like a bowl full of jello as " + (target == pc ? "you [target.walk]":"[target.heShe] walks") + ".");
			else if(buttRating < 25) outputRouter(" is eye-catching in the extreme, wobbling hypnotically long after " + (target == pc ? "you stop":"[target.heShe] stops") + " moving.");
			else outputRouter(" is obscenely large, bordering freakish, and makes it difficult to run.");
		}
		//FITBUTT
		else {
			outputRouter(" " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript());
			if(buttRating < 4) outputRouter(" molds closely against " + (target == pc ? "your":"[target.hisHer]") + " form.");
			else if(buttRating < 6) outputRouter(" contracts with every motion, displaying the detailed curves of its lean musculature.");
			else if(buttRating < 10) 
			{
				if(!target.isAssExposed()) outputRouter(" fills out " + (target == pc ? "your":"[target.hisHer]") + " clothing nicely.");
				else outputRouter(" is a nice, big canvas for displaying " + (target == pc ? "your":"[target.hisHer]") + " well-developed musculature.");
			}
			else if(buttRating < 15) 
			{
				if(!target.isAssExposed()) outputRouter(" stretches " + (target == pc ? "your":"[target.hisHer]") + " gear, flexing it with each step.");
				else outputRouter(" is big enough to draw the eye and strong enough to crush any hand daring enough to try for a grope.");
			}
			else if(buttRating < 20) 
			{
				if(!target.isAssExposed()) outputRouter(" threatens to bust out from under " + (target == pc ? "your":"[target.hisHer]") + " kit each time " + (target == pc ? "you clench":"[target.heShe] clenches") + " it.");
				else outputRouter(" flexes delightfully with every move " + (target == pc ? "you make":"[target.heShe] makes") + ". Any clothing " + (target == pc ? "you put":"[target.heShe] puts") + " over it would be in immediately danger of splitting in half.");
			}
			else if(buttRating < 25) outputRouter(" is obscenely large and completely stacked with muscle.");
			else outputRouter(" strains " + (target == pc ? "your":"[target.hisHer]") + " ability to comprehend its size and near-freakish levels of muscular development.");
		}
	}
	// Extra hip blurbs
	if(hipRating >= 25 && target.hasLegs()) {
		if(rand(2) == 0) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " broad hips are so distended that someone could slide their head between the gap in " + (target == pc ? "your":"[target.hisHer]") + " " + target.thighsDescript(true) + " where " + (target == pc ? "you stand":"[target.heShe] stands") + ". " + (target == pc ? "You":"[target.HeShe]") + " wouldn’t even have to move a muscle.");
		else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " mammoth hips swing widely from side-to-side with every step " + (target == pc ? "you take":"[target.heShe] takes") + ". " + (target == pc ? "You have":"[target.HeShe] has") + " no hope of walking normally, the closest " + (target == pc ? "you":"[target.heShe]") + " could come would be a sashay.");
	}
	
	//Tramp Stamps
	if(target.hasPerk("Barcoded"))
	{
		if(rand(2) == 0) outputRouter(" There’s a barcode on " + (target == pc ? "your":"[target.hisHer]") + " left butt cheek, forever marking " + (target == pc ? "you":"[target.himHer]") + " as the property of Belle and Accu-Pitch Labs.");
		else outputRouter(" On one of " + (target == pc ? "your":"[target.hisHer]") + " ass cheeks is a barcode, placed there by Dr. Belle for her scientific research, and to remind " + (target == pc ? "you":"[target.himHer]") + " of " + (target == pc ? "your":"[target.hisHer]") + " place as her pet.");
	}
	if(target.hasPerk("Slut Stamp")) outputRouter(" To highlight " + (target == pc ? "your":"[target.hisHer]") + " vulgarity, a tattoo is permanently printed on " + (target == pc ? "your":"[target.hisHer]") + " lower back, advertising how much of a slut " + (target == pc ? "you are":"[target.heShe] is") + " to anyone who sees it.");
	if(target.hasPerk("Whore-Stamped")) outputRouter(" The word “WHORE” has been permanently tattooed on " + (target == pc ? "your":"[target.hisHer]") + " lower back in artful black lettering, broadcasting " + (target == pc ? "your":"[target.hisHer]") + " whorish nature to the world.");
	
	//TAILS
	switch(target.tailType)
	{
		case GLOBAL.TYPE_EQUINE:
			outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long ":"") + target.hairColor + " horsetail hangs from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", smooth and shiny.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_DOGGIE:
		case GLOBAL.TYPE_LUPINE:
			if(target.tailCount == 1)
			{
				outputRouter(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" long,");
				else if(target.tailType == GLOBAL.TYPE_DOGGIE) outputRouter(" cute,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				else outputRouter(" fuzzy");
				outputRouter(" " + target.furColor + " ");
				if(target.tailType == GLOBAL.TYPE_LUPINE) outputRouter("wolf-");
				else outputRouter("dog");
				outputRouter("tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", wagging to and fro whenever " + (target == pc ? "you are":"[target.heShe] is") + " happy.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" long,");
				else if(target.tailType == GLOBAL.TYPE_DOGGIE) outputRouter(" cute,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				else outputRouter(" fuzzy");
				outputRouter(" " + target.furColor + " ");
				if(target.tailType == GLOBAL.TYPE_LUPINE) outputRouter("wolf-");
				else outputRouter("dog");
				outputRouter("tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", wagging to and fro whenever " + (target == pc ? "you are":"[target.heShe] is") + " happy.");
			}
			break;
		case GLOBAL.TYPE_KORGONNE:
			if(target.tailCount == 1)
			{
				outputRouter(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" long,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				else outputRouter(" curly");
				outputRouter(" " + target.furColor + " ");
				outputRouter("dog-");
				outputRouter("tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", wagging to and fro whenever " + (target == pc ? "you are":"[target.heShe] is") + " happy.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" long,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
				else outputRouter(" curly");
				outputRouter(" " + target.furColor + " ");
				outputRouter("dog-");
				outputRouter("tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", wagging to and fro whenever " + (target == pc ? "you are":"[target.heShe] is") + " are happy.");
			}
			break;
		case GLOBAL.TYPE_DEMONIC:
			if(target.tailCount == 1) outputRouter(" A narrow tail ending in a spaded tip curls down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", wrapping around " + (target == pc ? "your":"[target.hisHer]") + " " + target.leg() + " sensually at every opportunity.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " narrow tails curl down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", each ending in a spaded tip. They sensually wrap around " + (target == pc ? "your":"[target.hisHer]") + " " + target.leg() + " at every opportunity.");
			
			break;
		case GLOBAL.TYPE_BOVINE:
			if(target.tailCount == 1)
			{
				outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long ":"") + "cow tail with a");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" voluminous");
				else outputRouter(" puffy");
				outputRouter(" tip swishes back and forth as if swatting at flies.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " long ": " ") + "cow tails with");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" voluminous");
				else outputRouter(" puffy");
				outputRouter(" tips swish back and forth as if swatting at flies.");
			}
			break;
		case GLOBAL.TYPE_SHEEP:
			if(target.tailCount == 1) outputRouter(" A small lamb-like tail sprouts from " + (target == pc ? "your":"[target.hisHer]") + " backside.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " small, lamb-like tails sprout from " + (target == pc ? "your":"[target.hisHer]") + " backside.");
			break;
		case GLOBAL.TYPE_DRIDER:
		case GLOBAL.TYPE_ARACHNID:
			outputRouter(" A large, spherical spider-abdomen has grown out from " + (target == pc ? "your":"[target.hisHer]") + " backside, covered in shiny");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" hardened " + target.scaleColor + " goo");
			else outputRouter(" black chitin");
			outputRouter(". Though it’s heavy and bobs with every motion, it doesn’t seem to slow " + (target == pc ? "you":"[target.himHer]") + " down.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) outputRouter(" Your bulging arachnid posterior feels fairly full of webbing.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) outputRouter(" Your arachnid rear bulges and feels very full of webbing.");
			if(target.tailVenom == 100) outputRouter(" Your swollen spider-butt is distended with the sheer amount of webbing it’s holding.");
			*/
			break;
		case GLOBAL.TYPE_BEE:
			outputRouter(" A large, insectile abdomen dangles from just above " + (target == pc ? "your":"[target.hisHer]") + " backside, bobbing with its own weight as " + (target == pc ? "you shift":"[target.heShe] shifts") + ". It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter("ened " + target.scaleColor + " goo");
			else outputRouter(" black chitin");
			outputRouter(" and tipped with a needle-like stinger.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) outputRouter(" A single drop of poison hangs from your exposed stinger.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) outputRouter(" Poisonous bee venom coats your stinger completely.");
			if(target.tailVenom == 100) outputRouter(" Venom drips from your poisoned stinger regularly.");
			*/
			break;
		case GLOBAL.TYPE_MYR:
			outputRouter(" A large, insectile abdomen dangles from just above " + (target == pc ? "your":"[target.hisHer]") + " backside, bobbing with its own weight as " + (target == pc ? "you shift":"[target.heShe] shifts") + ". It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter("ened " + target.scaleColor + " goo");
			else outputRouter(" " + target.scaleColor + " chitin");
			outputRouter(" that is smooth to the touch.");
			break;
		case GLOBAL.TYPE_SHARK:
		case GLOBAL.TYPE_SIREN:
			outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "shark-tail trails down from " + (target == pc ? "your":"[target.hisHer]") + " backside, swaying to and fro while ");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter("dripping goo everywhere.");
			else outputRouter("giving " + (target == pc ? "you":"[target.himHer]") + " a dangerous air.");
			outputRouter(" Halfway across it grows a smaller dorsal fin.");
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.tailCount == 1)
			{
				outputRouter(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy");
				else if(target.hasTailFlag(GLOBAL.FLAG_FURRED) || target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" soft " + target.furColor);
				else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) outputRouter(" scaled " + target.scaleColor);
				outputRouter(" cat-tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy");
				else if(target.hasTailFlag(GLOBAL.FLAG_FURRED) || target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" soft, " + target.furColor);
				else if(target.hasTailFlag(GLOBAL.FLAG_SCALED)) outputRouter(" scaled, " + target.scaleColor);
				outputRouter(" cat-tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
			break;
		case GLOBAL.TYPE_LIZAN:
			outputRouter(" A tapered tail hangs down from just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ". It sways back and forth, assisting " + (target == pc ? "you":"[target.himHer]") + " with keeping " + (target == pc ? "your":"[target.hisHer]") + " balance.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.tailCount == 1)
			{
				outputRouter(" A short,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy");
				else outputRouter(" soft");
				outputRouter(" bunny tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", twitching constantly whenever " + (target == pc ? "you’re":"[target.heShe]’s") + " distracted.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " short,");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy");
				else outputRouter(" soft");
				outputRouter(" bunny tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", twitching constantly whenever " + (target == pc ? "your":"[target.hisHer]") + " attention is elsewhere. Or whenever they want, really. It’s hard to control that many rebellious little poofs.");
			}
			break;
		case GLOBAL.TYPE_AVIAN:
			outputRouter(" A tail of");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			outputRouter(" feathers fans out from just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", twitching instinctively to help guide " + (target == pc ? "you":"[target.himHer]") + " if " + (target == pc ? "you were":"[target.heShe] was") + " to take flight.");
			break;
		case GLOBAL.TYPE_KANGAROO:
			outputRouter(" A conical, ");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter("gooey, " + target.skinTone);
			else outputRouter("furry, " + target.furColor);
			outputRouter(" tail extends from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", bouncing up and down as " + (target == pc ? "you move":"[target.heShe] moves") + " and helping to counterbalance " + (target == pc ? "you":"[target.himHer]") + ".");
			break;
		case GLOBAL.TYPE_VULPINE:
			if(target.tailCount == 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" A swishing fox tail extends from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling around " + (target == pc ? "your":"[target.hisHer]") + " body, all slick and shiny.");
				else outputRouter(" A swishing, " + target.furColor + " fox tail extends from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling around " + (target == pc ? "your":"[target.hisHer]") + " body - the soft fur feels lovely.");
			}
			else
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing fox tails extend from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling around " + (target == pc ? "your":"[target.hisHer]") + " body, all slick and shiny.");
				else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing, " + target.furColor + " fox tails extend from " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", curling around " + (target == pc ? "your":"[target.hisHer]") + " body - the soft fur feels lovely.");
			}
			break;
		case GLOBAL.TYPE_DRACONIC:
			outputRouter(" A thin,");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" gooey");
			else outputRouter(" scaly");
			outputRouter(", prehensile reptilian tail" + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? ", almost as long as " + (target == pc ? "you are":"[target.heShe] is") + " tall, ":" ") + "swings behind " + (target == pc ? "you":"[target.himHer]") + " like a living bullwhip. Its tip menaces with spikes of bone, meant to deliver painful blows.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			outputRouter(" A tapered, prehensile tail" + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? ", almost as long as " + (target == pc ? "you are":"[target.heShe] is") + " tall, ":" ") + "swings behind " + (target == pc ? "you":"[target.himHer]") + " like a living bullwhip. Softly rounded at its tip, it quickly increases in girth closer to " + (target == pc ? "your":"[target.hisHer]") + " body - almost as thick as " + (target == pc ? "your":"[target.hisHer]") + " waist at its widest. The " + target.scaleColor + " scales sheathing " + (target == pc ? "your":"[target.hisHer]") + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " hefty":"") + " tail’s length merge seamlessly with those of " + (target == pc ? "your":"[target.hisHer]") + " lower back.");
			break;
		case GLOBAL.TYPE_KUITAN:
			if(target.furColor == "black") outputRouter(" A solid-black kui-tan tail waves behind " + (target == pc ? "you":"[target.himHer]") + ".");
			else outputRouter(" A black-and-" + target.furColor + "-ringed kui-tan tail waves behind " + (target == pc ? "you":"[target.himHer]") + ".");
			break;
		case GLOBAL.TYPE_DEER:
			outputRouter(" A short");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" nub");
			else outputRouter(" tuft");
			outputRouter(" of deer tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", sometimes twitching at the slightest movements.");
			break;
		case GLOBAL.TYPE_MOUSE:
			outputRouter(" A naked, " + target.skinTone + " mouse tail pokes from " + (target == pc ? "your":"[target.hisHer]") + " butt, dragging on the ground and twitching occasionally.");
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
			else cuntSnakeTexture += target.skinFurScales(true) + " like the rest of " + (target == pc ? "you":"[target.himHer]");
			
			if(target.tailCount <= 1) outputRouter(" A sinuous, almost snake-like tail waves behind " + (target == pc ? "you":"[target.himHer]") + ", covered in " + cuntSnakeTexture + " except at the tip. There, it terminates in " + indefiniteArticle(target.tailVaginaDescript(false, true, true)) + " that always seems to crave fresh sperm.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " sinuous, almost snake-like tails wave behind " + (target == pc ? "you":"[target.himHer]") + ", covered in " + cuntSnakeTexture + " except at the tip. There, they terminate in " + plural(target.tailVaginaDescript(false, true, true)) + " that always seem to crave fresh sperm.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" A short, slimy panda tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a gooey little accent.");
			else outputRouter(" A short, soft panda tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a furry little accent.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.tailCount <= 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "bushy " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda tail sprouts from " + (target == pc ? "your":"[target.hisHer]") + " backside. Its " + target.furColor + " ringed pattern is a hypnotizing sight to behold.");
				else if(rand(2) == 0) outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long ":"") + "furry tail hangs from " + (target == pc ? "your":"[target.hisHer]") + " backside. Its " + target.furColor + " ringed pattern is a hypnotizing sight to behold.");
				else outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + target.furColor + " ringed tail waves behind " + (target == pc ? "you":"[target.himHer]") + ".");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " long":" "));
				if(target.hasTailFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(", bushy " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda tails sprout from " + (target == pc ? "your":"[target.hisHer]") + " backside. Their " + target.furColor + " ringed patterns are a hypnotizing sight to behold.");
				else if(rand(2) == 0) outputRouter(" furry tails hangs from " + (target == pc ? "your":"[target.hisHer]") + " backside. Their " + target.furColor + " ringed patterns are a hypnotizing sight to behold.");
				else outputRouter(", " + target.furColor + " ringed tails wave behind " + (target == pc ? "you":"[target.himHer]") + ".");
			}
			break;
		case GLOBAL.TYPE_RASKVEL:
			if(target.tailCount == 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" A gooey reptilian " + target.scaleColor + " tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", dangling behind " + (target == pc ? "you":"[target.himHer]") + ".");
				else outputRouter(" A scaled " + target.scaleColor + " tail sprouts just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", dangling behind " + (target == pc ? "you":"[target.himHer]") + ". Softer, lighter scales cover its bottom.");
			}
			else
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " gooey reptilian " + target.scaleColor + " tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", all dangling behind " + (target == pc ? "you":"[target.himHer]") + ".");
				else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " scaled " + target.scaleColor + " tails sprout just above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", their undersides covered with softer, lighter scales.");
			}
			break;
		case GLOBAL.TYPE_BADGER:
			if(target.tailCount == 1)
			{
				outputRouter(" A little");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy " + target.furColor + " nub");
				else outputRouter(" fluffy " + target.furColor + " tuft");
				outputRouter(" dangles atop " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ". It mischievously flicks back and forth from time to time.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" slimy little " + target.furColor + " nubs");
				else outputRouter(" fluffy little " + target.furColor + " tufts");
				outputRouter(" dangle atop " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ". They mischievously flick back and forth from time to time.");
			}
			break;
		case GLOBAL.TYPE_VANAE:
			if(target.tailCount == 1) outputRouter(" Protruding from above " + (target == pc ? "your":"[target.hisHer]") + " butt, a " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "slippery tail wiggles behind " + (target == pc ? "you":"[target.himHer]") + ". It is lined with octopus-like suckers on the bottom, very much like a tentacle of some underwater... or perhaps tree-dwelling, creature.");
			else outputRouter(" Protruding from above " + (target == pc ? "your":"[target.hisHer]") + " butt, " + num2Text(target.tailCount) + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " long, ":" ") + "slippery tails wiggle behind " + (target == pc ? "you":"[target.himHer]") + ". They are lined with octopus-like suckers on the bottom, very much like the tentacles of some underwater... or perhaps tree-dwelling, creature.");
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.tailCount == 1) outputRouter(" A thick, reptilian tail dangles behind " + (target == pc ? "you":"[target.himHer]") + ", swaying as a living counterbalance.");
			else
			{
				outputRouter(StringUtil.upperCase(num2Text(target.tailCount)) + " thick, reptilian tails dangle behind " + (target == pc ? "you":"[target.himHer]") + ", swaying like living counterbalance. It’s difficult to keep the thick appendages from idly squirming");
				if(!target.hasTailFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" their scales");
				outputRouter(" against one another.");
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
			
			if(target.tailCount == 1) outputRouter(" A writhing, sinuous appendage flows after " + (target == pc ? "you":"[target.himHer]") + ", bobbing and undulating with the slightest movement of " + (target == pc ? "your":"[target.hisHer]") + " hips.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " writhing, sinuous appendages flow after " + (target == pc ? "you":"[target.himHer]") + ", all similar in appearance. Studying one of them, you see that it appears vine-like though very much alive and moving.");
			
			// Cockvine
			if(target.tailGenitalArg == GLOBAL.TYPE_COCKVINE && !target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) outputRouter(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				outputRouter(" a proud purple head that’s distinctly cock-shaped in nature.");
			}
			// Horse
			else if(target.tailGenitalArg == GLOBAL.TYPE_EQUINE)
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a girthy, flared tip, distinctly reminiscent of");
				if(target.tailGenitalColor != "" && rand(2) == 0) outputRouter(" " + indefiniteArticle(target.tailGenitalColor));
				else outputRouter(" a");
				outputRouter(" horse-cock.");
			}
			// Human
			else if(target.tailGenitalArg == GLOBAL.TYPE_HUMAN)
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a fleshy");
				if(target.tailGenitalColor != "") outputRouter(" " + target.tailGenitalColor);
				else outputRouter(" pink");
				outputRouter(" head that’s distinctly cock-shaped in nature.");
			}
			// Bulbous
			else if(target.tailGenitalArg == GLOBAL.TYPE_CANINE)
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a thick bulge a few inches below a tapered,");
				if(target.tailGenitalColor != "") outputRouter(" " + target.tailGenitalColor);
				else outputRouter(" dark-red");
				outputRouter(" tip.");
			}
			// Demonic
			else if(target.tailGenitalArg == GLOBAL.TYPE_DEMONIC)
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in a thick bulge at the base and");
				if(target.tailGenitalColor != "") outputRouter(" " + indefiniteArticle(target.tailGenitalColor));
				else outputRouter(" a dark purple");
				outputRouter(" shaft lined with sensitive nodules up to the tip.");
			}
			// Ribbed
			else if(target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				outputRouter(" Most of the length of the thing is coated in " + cockvineTexture + ", culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) outputRouter(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				outputRouter(" a series of noticeable ridges that gradually thin as they appear closer to the tip.");
			}
			break;
		case GLOBAL.TYPE_FROG:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " stubby frog tail wiggles around at the back of " + (target == pc ? "your":"[target.hisHer]") + " waist, just asking to be squeezed.");
			break;
		case GLOBAL.TYPE_SWINE:
			outputRouter(" A curly, little pig tail sticks out above " + (target == pc ? "your":"[target.hisHer]") + " " + target.buttDescript() + ", twirling when " + (target == pc ? "you’re":"[target.heShe]’s") + " happy.");
			break;
		case GLOBAL.TYPE_SIMII:
			outputRouter(" Peeking out from behind, " + (target == pc ? "you have":"[target.heShe] has"));
			if(target.tailCount == 1) outputRouter(" a " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "prehensile monkey tail that sways");
			else outputRouter(" " + num2Text(target.tailCount) + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " long, ":" ") + "prehensile monkey tails that sway");
			outputRouter(" to and fro with curiosity.");
			break;
		case GLOBAL.TYPE_TENTACLE:
			if(target.tailCount == 1) outputRouter(" A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "writhing, tentacle-like tail flows after " + (target == pc ? "you":"[target.himHer]") + ", bobbing and undulating with the slightest movement of " + (target == pc ? "your":"[target.hisHer]") + " hips.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.tailCount)) + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? " long, ":" ") + "writhing, tentacle tails flow after " + (target == pc ? "you":"[target.himHer]") + ", all similar in appearance. Studying one of them, you find that " + (target == pc ? "you have":"[target.heShe] has") + " excellent control over their movements."); 
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" " + (target.tailCount == 1 ? "A " + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "long, ":"") + "flexible reptilian tail extends":"" + (target.hasTailFlag(GLOBAL.FLAG_LONG) ? "Long, flexible ":"Flexible ") + "reptilian tails extend") + " from " + (target == pc ? "your":"[target.hisHer]") + " back. " + (target.tailCount == 1 ? "The":"On each, the") + " whole surface is covered in rough [target.scaleColor] scales, particularly along the top where they form a long row of spikes and at its tip, where they congregate into a blunt ball, best used for smashing things if " + (target == pc ? "you":"[target.heShe]") + " needed.");
			break;
		case GLOBAL.TYPE_XHELARFOG:
			outputRouter(" " + (target==pc?"Your":"[target.HisHer]") + (target.tailCount==1?" tail is":" tails are") + " fairly short and stubby, thicker at the base.");
			if (target.hasTailFlag(GLOBAL.FLAG_SCALED)) outputRouter(" The overside is covered with [target.scaleColor] scale.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter(" " + (target.tailCount == 1 ? "A [target.tail] sits" : "[target.Tails] sit") + " just above your [target.ass], covered from base to tip in [target.skinFurScalesColor] metal scales.");
			if (target.hasTailFlag(GLOBAL.FLAG_SHORT)) outputRouter(" Though quite short, and very plump, " + (target == pc ? "you still use":"[target.heShe] still uses") + (target.tailCount == 1 ? "it" : "them") + " for some semblance of balance - " + (target.isBimbo() || target.exhibitionism() > 50 ? "the extra looks drawn to each bounce with every step is just a bonus." : "even if every step causes an eye-catching bounce and waggle."));
			else if (target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" It sways in time with " + (target == pc ? "your":"[target.hisHer]") + " steps, helping " + (target == pc ? "you":"[target.himHer]") + " maintain balance.");
			outputRouter(" The soft underside reveals " + indefiniteArticle(target.skinTone) + " hide.");
			break;
		case GLOBAL.TYPE_HYENA:
			outputRouter(" " + (target.tailCount == 1 ? "A" : StringUtil.capitalize(num2Text(target.tailCount))));
			if (target.hasTailFlag(GLOBAL.FLAG_LONG)) outputRouter(" long");
			else if (target.hasPartGoo("tail")) outputRouter(" gooey");
			else outputRouter(" bushy");
			outputRouter(" [target.furColor] " + (target.tailCount == 1 ? "tail sprouts" : "tails sprout") + " above your [target.butt] " + (target.hasPartGoo("tail") ? "resembling a wet paintbrush that had been dipped in black paint." : "resembling a paintbrush in appearance and ending in a coarse black tip."));
			break;
	}
	//Tail cunts
	if(target.hasTailCunt() && target.tailType != GLOBAL.TYPE_CUNTSNAKE)
	{
		outputRouter(" When aroused, " + (target.tailCount <= 1 ? "its tip opens" : "the tip of each one will open") + " to reveal " + indefiniteArticle(target.tailVaginaDescript()));
		if(target.hasParasiteTail()) outputRouter(" that always seems to crave fresh sperm");
		outputRouter(".");
	}
	//Tail cocks
	if(target.hasTailCock() && target.tailType != GLOBAL.TYPE_COCKVINE)
	{
		outputRouter(" When aroused, " + (target.tailCount <= 1 ? "its tip opens" : "the tip of each one will open") + " to reveal " + indefiniteArticle(target.tailCockDescript()));
		if(target.hasParasiteTail()) outputRouter(" that always seems primed for breeding");
		outputRouter(".");
	}
	//Ovipositor
	if(target.hasTailOvipositor())
	{
		outputRouter(" In addition,");
		if(target.tailCount == 1) outputRouter(" it is an organ");
		else outputRouter(" " + (target == pc ? "your":"[target.hisHer]") + " [target.tails] are organs");
		outputRouter(" capable of laying eggs into an orifice.");
	}
	
	//LEGS
	//legType notez!
	//Horse body is placed higher for readability purposes
	switch(target.legType)
	{
		case GLOBAL.TYPE_HUMAN:
			if(target.legCount < 4) outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? " gooey" : " normal") + " human legs extend below " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in normal human feet.");
			else outputRouter(" " + (target == pc ? "You have":"[target.heShe] has") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "normal") + " human legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_MYR:
			if(target.legCount < 4) outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs extend below " + (target == pc ? "your":"[target.hisHer]") + " waist, covered in numerous " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "semi-solid" : "chitin") + " plates all the way to " + (target == pc ? "your":"[target.hisHer]") + " feet.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " human-like legs that end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened" : "chitinous") + " feet.");
			break;
		case GLOBAL.TYPE_EQUINE:
		case GLOBAL.TYPE_BOVINE:
			if(target.legCount == 2) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in a pair of bestial hooves.");
			else if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in bestial hooves.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " oddly-jointed legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_DEER:
			if(target.legCount < 4) 
			{
				if(target.short == "Pwink" || target.short == "pwink") outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are thick and supple, narrowing significantly below the thighs to hoof-capped, plantigrade feet");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are lithe and agile, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in hooves");
			}
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + (rand(2) == 0 ? "thin, deer-like legs that are capped with" : "lithe, agile legs that end in") + " hooves");
			outputRouter(", enabling " + (target == pc ? "you":"[target.himHer]") + " to nimbly leap and prance from place to place.");
			break;
		case GLOBAL.TYPE_SHEEP:
			if(target.thickness >= 50) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "furry") + ", lamb-like legs end in hooves, allowing " + (target == pc ? "you":"[target.himHer]") + " to spring into action at a moment’s notice.");
			else if(target.thickness >= 25) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " slender, nimble legs end in hooves, allowing " + (target == pc ? "you":"[target.himHer]") + " to spring into action at a moment’s notice.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " willowy, sheep-like legs are capped off by hooves, allowing " + (target == pc ? "you":"[target.himHer]") + " to spring into action at a moment’s notice.");
			break;
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_KORGONNE:
			if(target.legCount < 4) 
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow downwards from " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in " + target.feet(true, true) + ".");
			}
			else
			{
				outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " ");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs that end in " + target.feet(true,true) + ".");
			}
			break;
		case GLOBAL.TYPE_NAGA:
			if(target.legCount == 1) outputRouter(" Below " + (target == pc ? "your":"[target.hisHer]") + " thighs, " + (target == pc ? "your":"[target.hisHer]") + " flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between " + (target == pc ? "your":"[target.hisHer]") + " crotch and [target.asshole]. It is");
			else if(target.legCount < 4) outputRouter(" Below " + (target == pc ? "your":"[target.hisHer]") + " thighs, " + num2Text(target.legCount) + " wiggling, snake-like appendages allow " + (target == pc ? "you":"[target.himHer]") + " to slither around. They are");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " wiggling snake-like appendages to propel " + (target == pc ? "your":"[target.himHer]") + "self around on, all");
			outputRouter(" covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.scaleColor + "-colored scales") + ".");
			break;
		case GLOBAL.TYPE_SUCCUBUS:
			if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " perfectly lissom legs end in " + (target.hasLegFlag(GLOBAL.FLAG_PAWS) ? "pawed feet with an addition of a" : "mostly human feet, apart from the") + " horn protruding straight down from the heel that forces " + (target == pc ? "you":"[target.himHer]") + " to walk with a sexy, swaying gait. Surprisingly " + (target == pc ? "your":"[target.hisHer]") + " mobility isn’t impaired by having " + (target == pc ? "your":"[target.hisHer]") + " feet converted into natural high heels, although " + (target == pc ? "you are":"[target.heShe] is") + " forced to totter about with " + (target == pc ? "your":"[target.hisHer]") + " upper body thrust forward a little to compensate, leaving " + (target == pc ? "you":"[target.himHer]") + " permanently locked into an awkwardly sexy pose.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " perfectly lissom legs that end in " + target.feet(true,true) + ".");
			break;
		case GLOBAL.TYPE_DEMONIC:
			if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " lithe legs are capped with flexible clawed feet. Sharp black nails grow where once " + (target == pc ? "you":"[target.heShe]") + " had toe-nails, giving " + (target == pc ? "you":"[target.himHer]") + " fantastic grip.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " lithe legs that end in " + target.feet(true,true) + ". Sharp black nails grow in place of toenails.");
			break;
		case GLOBAL.TYPE_BEE:
			outputRouter(" Shimmering, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened goo" : "armor-like chitin") + " girds " + (target == pc ? "your":"[target.hisHer]") + " legs from your toes to " + (target == pc ? "your":"[target.hisHer]") + " mid-thigh. The " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "coating is semi-" : "sable material is rock ") + "hard right up until the ring of soft fluff that grows over the uppermost edge.");
			break;
		case GLOBAL.TYPE_GOOEY:
			if(target.legCount == 1)
			{
				// Gel tail
				if(target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) outputRouter(" In place of legs, " + (target == pc ? "you have":"[target.heShe] has") + " a semi-solid, gel-like lower body, shaped into a prehensile mass that bends and twists as " + (target == pc ? "you move":"[target.heShe] moves") + ".");
				else if(target.hasLegFlag(GLOBAL.FLAG_TENDRIL)) outputRouter(" In place of legs, " + (target == pc ? "you have":"[target.heShe] has") + " a semi-solid, gel-like lower body, shaped into a tendril-like mass that wriggles about as " + (target == pc ? "you move":"[target.heShe] moves") + ".");
				// Goo moound
				else
				{
					outputRouter(" In place of legs, " + (target == pc ? "you have":"[target.heShe] has") + " a shifting amorphous blob. Thankfully, it’s quite easy " + (target == pc ? "to propel your":"for [target.himHer] to propel [target.himHer]") + "self around on.");
					if(target.hasArmor()) outputRouter(" The lowest portions of " + (target == pc ? "your":"[target.hisHer]") + " " + target.armor.longName + " float around inside " + (target == pc ? "you":"[target.himHer]") + ", bringing " + (target == pc ? "you":"[target.himHer]") + " no discomfort.");
				}
			}
			else
			{
				// Goo mound
				if(target.hasLegFlag(GLOBAL.FLAG_AMORPHOUS))
				{
					outputRouter(" In place of legs, " + (target == pc ? "you have":"[target.heShe] has") + " a shifting, amorphous blob. It splits apart just beneath " + (target == pc ? "your":"[target.hisHer]"));
					if(target.hasGenitals()) outputRouter(" genitals");
					else outputRouter(" “crotch”");
					outputRouter(" into " + num2Text(target.legCount) + " semi-solid limbs.");
				}
				// Gel legs
				else
				{
					if(target.isTaur()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are semi-solid, gel-like and end in " + target.feet());
					else
					{
						outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + num2Text(target.legCount) + " semi-solid, gel-like limbs");
						if(target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) outputRouter(", shaped into prehensile masses that bend and twist as " + (target == pc ? "you move":"[target.heShe] moves"));
						else if(target.hasLegFlag(GLOBAL.FLAG_TENDRIL)) outputRouter(", shaped into tendrils that wriggle about when " + (target == pc ? "you move":"[target.heShe] moves"));
						else
						{
							if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(", shaped into digitigrade legs and");
							else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(", shaped into plantigrade legs and");
							outputRouter(" ending in " + target.feet());
						}
					}
					outputRouter(". They are capable of shifting and morphing when " + (target == pc ? "you will":"[target.heShe] wills") + " them to.");
				}
			}
			break;
		case GLOBAL.TYPE_FELINE:
			if(target.isTaur())
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs end in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow downwards from " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
			}
			break;
		case GLOBAL.TYPE_LIZAN:
			if(target.legCount < 4)
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ", ending in clawed feet. There are three long toes on the front and a small hind-claw on the back.");
			}
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + plural(target.leg(true)) + " end in clawed feet, tipped with three long toes and a small hind-claw on the back.");
			break;
		case GLOBAL.TYPE_RASKVEL:
			if(target.legCount < 4)
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ", ending in clawed feet. There are four long toes tipping the humanoid soles.");
			}
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + plural(target.leg(true)) + " end in clawed feet, tipped with four long toes at the front of the terran-like soles.");
			break;
		case GLOBAL.TYPE_LAPINE:
			if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs thicken below the waist as they turn into " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-covered" : "soft-furred") + " rabbit-like legs. " + (target == pc ? "You even have":"[target.HeShe] even has") + " large bunny feet that make hopping around a little easier than walking.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " thick rabbit legs that terminate in " + target.feet(true,true) + ". At least jumping should be a breeze.");
			break;
		case GLOBAL.TYPE_AVIAN:
			outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " powerful thighs perfect for launching " + (target == pc ? "you":"[target.himHer]") + " into the air which end in slender bird-like legs, covered with ");
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY))
			{
				outputRouter("feather-shaped shingles of goo down to " + (target == pc ? "your":"[target.hisHer]") + " " + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? " ankles" : " knees"));
			}
			else
			{
				outputRouter(target.furColor + " plumage down to " + (target == pc ? "your":"[target.hisHer]") + " " + (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY) ? " ankles" : " knees") + " and ");
				if(target.hasFeathers() || target.skinType == GLOBAL.SKIN_TYPE_SKIN) outputRouter("rough, " + target.skinTone + " skin");
				else outputRouter(target.skinFurScales(true, true, true, true));
				outputRouter(" below");
			}
			outputRouter(". " + (target == pc ? "Your":"[target.HisHer]") + " feet " + (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) ? "are digitigrade, with" : "have") + " long sharp claw-tipped toes.");
			break;
		case GLOBAL.TYPE_KANGAROO:
			if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "furry") + " legs have short thighs and long calves, with even longer feet ending in prominently-nailed toes.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : target.furColor + "-furred") + " legs with short thighs and long calves, perfect for jumping.");
			break;
		case GLOBAL.TYPE_ARACHNID:
		case GLOBAL.TYPE_NYREA:
			if(target.legCount == 2) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to " + (target == pc ? "your":"[target.hisHer]") + " mid-thigh, looking more like a pair of ‘fuck-me-boots’ than exoskeleton.");
			else if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to " + (target == pc ? "your":"[target.hisHer]") + " mid-thigh, looking more like ‘fuck-me-boots’ than exoskeleton.");
			else outputRouter(" " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "Hardened goo" : "Black chitin") + " covers " + (target == pc ? "your":"[target.hisHer]") + " legs up to the mid-thigh, looking more like a set of ‘fuck-me-boots’ than insectile armor.");
			break;
		case GLOBAL.TYPE_DRIDER:
			if(target.isTaur()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are long and spindly, sprouting outwards from " + (target == pc ? "your":"[target.hisHer]") + " sides like a spider.");
			else outputRouter(" Where " + (target == pc ? "your":"[target.hisHer]") + " legs would normally start " + (target == pc ? "you have":"[target.heShe] has") + " grown the body of a spider, with " + num2Text(target.legCount) + " spindly legs that sprout from its sides.");
			break;
		case GLOBAL.TYPE_MYR:
			outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + StringUtil.upperCase(num2Text(target.legCount)) + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened" : "chitinous") + " legs that end in pointed, single-toed feet. " + (target == pc ? "You":"[target.HeShe]") + " can balance on them with ease, a touch of natural grace in " + (target == pc ? "your":"[target.hisHer]") + " movements.");
			break;
		case GLOBAL.TYPE_VULPINE:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are crooked into high knees with hocks and long feet, like those of a fox; cute bulbous toes decorate the ends.");
			break;
		case GLOBAL.TYPE_LUPINE:
			if(target.legCount < 4) 
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " powerful");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow downwards from " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in large, bestial feet tipped with sharp canine claws.");
			}
			else
			{
				outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " powerful");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs that end in large, bestial feet tipped with sharp canine claws.");
			}
			break;
		case GLOBAL.TYPE_DRACONIC:
			if(target.isTaur()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " human-like legs are sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in clawed feet.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ", sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and ending in clawed feet.");
			outputRouter(" There are three long toes on the front, and a small hind-claw on the back.");
			break;
		case GLOBAL.TYPE_GRYVAIN:
			if(target.isTaur()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " human-like legs are sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in clawed feet.");
			else outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ", sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and ending in mostly human feet, with the addition of scales and clawed toes.");
			break;
		case GLOBAL.TYPE_KUITAN:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs, though covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", are humanlike. Long feet on the ends bear equally long toes, and the pads on the bottoms are quite sensitive to the touch.");
			break;
		case GLOBAL.TYPE_PANDA:
			if(target.isTaur())
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			}
			else
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow downwards from " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			}
			outputRouter(" " + (target == pc ? "You even have":"[target.HeShe] even has") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "blunt" : "sharp-looking") + " claws growing from the tips of " + (target == pc ? "your":"[target.hisHer]") + " short toes.");
			break;
		case GLOBAL.TYPE_REDPANDA:
			if(target.hasLegFlag(GLOBAL.FLAG_FLUFFY)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fluffy, " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda-like legs end with soft and cute bear-like paws.");
			else if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " furry, " + ((target.furColor.indexOf("red") != -1 || target.furColor.indexOf("auburn") != -1 || target.furColor.indexOf("brown") != -1) ? "red" : "lesser") + " panda-like legs end with broad and powerful-looking paws.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " solid " + target.furColor + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "furred") + " legs end with plush, bear-like paws.");
			break;
		case GLOBAL.TYPE_SIMII:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs");
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) outputRouter(", though covered in goo,");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SKIN && !target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(", though covered in hair,");
			else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(", though covered in fur,");
			outputRouter(" are humanlike in shape with long, dexterous toes that somewhat resemble fingers on a hand.");
			break;
		case GLOBAL.TYPE_FROG:
			if(target.legCount < 4)
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ", ending in three-toed, webbed, frog-like feet. They look built for leaping and sticking to flat surfaces rather than running.");
			}
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + plural(target.leg(true)) + " look built for leaping than running, ending in three-toed, webbed, frog-like feet.");
			break;
		case GLOBAL.TYPE_GOAT:
			outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
			if(rand(2) == 0)
			{
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				outputRouter(" legs grow from " + (target == pc ? "your":"[target.hisHer]") + " " + target.hipDescript() + ",");
				if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) outputRouter(" covered in goo and");
				else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(" covered in coarse fur and");
				outputRouter(" providing a surprisingly strong sense of balance.");
			}
			else
			{
				outputRouter(" double jointed legs covered in ");
				if(target.hasLegFlag(GLOBAL.FLAG_GOOEY)) outputRouter(target.skinTone + " goo");
				else if(target.hasFur() || target.hasLegFlag(GLOBAL.FLAG_FURRED)) outputRouter(target.furColor + " fur");
				else outputRouter(target.skinFurScales(true,true,true,true));
				outputRouter(" supports " + (target == pc ? "your":"[target.hisHer]") + " body, looking much like a goat’s all the way down.");
			}
			break;
		case GLOBAL.TYPE_OVIR:
			if(target.skinType != GLOBAL.SKIN_TYPE_SCALES)
			{
				if(target.isTaur()) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in human-like feet.");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + num2Text(target.legCount) + " legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales but are otherwise normal, human-like limbs.");
			}
			else
			{
				if(target.isTaur())
				{
					outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled"));
					if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(", plantigrade");
					else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(", digitigrade");
					outputRouter(" legs end in human-like feet.");
				}
				else
				{
					outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled"));
					if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(", plantigrade");
					else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(", digitigrade");
					outputRouter(" legs extend below " + (target == pc ? "your":"[target.hisHer]") + " waist, ending in human-like feet.");
				}
			}
			break;
		case GLOBAL.TYPE_SHARK:
			if(target.legCount == 1)
			{
				outputRouter(" Below " + (target == pc ? "your":"[target.hisHer]") + " thighs, " + (target == pc ? "your":"[target.hisHer]") + " flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between " + (target == pc ? "your":"[target.hisHer]") + " crotch and [target.asshole]. It is covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.scaleColor + "-colored scales") + "and has small protruding fins on each side. It ends in a large caudal fin, perfect for underwater propulsion.");
			}
			else if(target.legCount == 2)
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				outputRouter(" legs are powerful, with small fins protruding from " + (target == pc ? "your":"[target.hisHer]") + " ankles and webbed toes, perfect for swimming.");
			}
			else
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + num2Text(target.legCount));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				outputRouter(" legs come with webbing and small fins to better propel " + (target == pc ? "you":"[target.himHer]") + " through water.");
			}
			break;
		case GLOBAL.TYPE_SIREN:
			if(target.hasLegFlag(GLOBAL.FLAG_GOOEY))
			{
				outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + StringUtil.upperCase(num2Text(target.legCount)) + " semi-solid legs and clawed");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(", plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(", digitigrade");
				outputRouter(" feet.");
			}
			else
			{
				outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " " + (target.legCount == 2 ? "a pair of" : StringUtil.upperCase(num2Text(target.legCount))) + " powerful legs, with clawed");
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(", plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(", digitigrade");
				outputRouter(" feet, strong enough to propel " + (target == pc ? "you":"[target.himHer]") + " through water.");
			}
			break;
		case GLOBAL.TYPE_TENTACLE:
			if(target.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " lower body is an ever-shifting mass of writhing tentacles. The strong, prehensile tentacles can easily and quickly carry " + (target == pc ? "you":"[target.himHer]") + " along.");
			else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " lower body consists of " + num2Text(target.legCount) + " imitation legs formed by " + (target == pc ? "your":"[target.hisHer]") + " dexterous, prehensile tentacles. " + (target == pc ? "Your":"[target.HisHer]") + " tentacle legs work just as well as real legs.");
			break;
		case GLOBAL.TYPE_MOUSE:
			if(rand(2) == 0) outputRouter(" Below " + (target == pc ? "your":"[target.hisHer]") + " waist are a pair of " + (target.hasLegFlag(GLOBAL.FLAG_FURRED) ? "furry":"fuzzy") + " mouse limbs that thin out towards the claw-tipped toes, their fragility making " + (target == pc ? "you":"[target.himHer]") + " look small and cute.");
			else if (target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer] ") + (target.hasLegFlag(GLOBAL.FLAG_FURRED) ? "furry":"fuzzy") + " legs thin out the closer one looks to " + (target == pc ? "your":"[target.hisHer]") + " feet, their mouse-like design, complete with little claws on " + (target == pc ? "your toes, makes you":"[target.hisHer] toes, makes [target.himHer]") + " look diminutive and less threatening.");
			else outputRouter(" " + (target == pc ? "You walk":"[target.HeShe] walks") + " on a pair of animalistic mouse limbs that curve past the knee, making it easier to run on " + (target == pc ? "your":"[target.hisHer]") + " claw-tipped toes than walk. The thinness of " + (target == pc ? "your legs makes you":"[target.hisHer] legs makes [target.himHer]") + " look cute and agile.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are thick and jointed in two places, giving " + (target == pc ? "you":"[target.himHer]") + " a ");
			if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter("digitigrade");
			else if (target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter("plantigrade");
			else outputRouter("strange"); //Just in case
			outputRouter(" appearance. They’re covered in rough, thick [target.scaleColor] scales so sharp that they’re practically spiked, while " + (target == pc ? "your":"[target.hisHer]") + " feet sport long, sharp talons for toes.");
			break;
		case GLOBAL.TYPE_JANERIA:
			outputRouter(" Subtle contours and indentations that run all the way down the length of " + (target == pc ? "your":"[target.hisHer]") + " legs make them look as though they were formed from a mass of tentacles woven together. " + (target == pc ? "Your":"[target.HisHer]") + " feet have foregone toes entirely in favor of a smooth, supple boot where the tips of the tentacles appear to join together.");
			break;
		case GLOBAL.TYPE_XHELARFOG:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " legs are mostly humanoid in structure, but " + (target == pc ? "your":"[target.hisHer]") + " feet are distinctly alien with only three toes at their front, and a single toe sprouting from their heel.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from " + (target == pc ? "your":"[target.hisHer]") + " [target.hips], encased in [target.skinFurScalesColor] scales - though " + (target == pc ? "your":"[target.hisHer]") + " inner thighs are bare, revealing [target.skinColor] hide. " + (target == pc ? "Your":"[target.HisHer]") + " feet are tipped with four toes, each with scales growing further into sharp points in place of claws. A small, vestigial scale-claw sits at " + (target == pc ? "your":"[target.hisHer]") + " heel, as if to assist with balance.");
			break;
		case GLOBAL.TYPE_HYENA:
			outputRouter(" [target.CombatHisHer] legs are crooked into high knees with hocks and fairly long digitigrade feet like those of a hyena, each ending with thick padded paws and toes tipped with blunt claws.");
			break;
		case GLOBAL.TYPE_DZAAN:
			if(target.legCount < 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " long, hyper-feminine legs end in " + (target.hasLegFlag(GLOBAL.FLAG_PAWS) ? "pawed" : "human-like") + " feet. The naturally short achilles tendon on each foot raises the heels high and forces " + (target == pc ? "you":"[target.himHer]") + " to walk tiptoed with a sexy, swaying gait. Surprisingly " + (target == pc ? "your":"[target.hisHer]") + " mobility isn’t impaired by having stripper-heels for feet, although " + (target == pc ? "you are":"[target.heShe] is") + " forced to totter about with " + (target == pc ? "your":"[target.hisHer]") + " upper body thrust forward dramatically to compensate, leaving " + (target == pc ? "you":"[target.himHer]") + " permanently locked into an awkwardly sexy pose.");
			else outputRouter(" " + (target == pc ? "You have":"[target.HeShe] has") + " long, hyper-feminine legs that end in " + target.feet(true,true) + ".");
			break;
		// Catch all
		default:
			if(target.isTaur() && target.hasFeet())
			{
				outputRouter(" " + (target == pc ? "Your":"[target.HisHer]"));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				outputRouter(" " + target.legs(true, true) + " end in " + target.feet(true, true) + ".");
			}
			else if(!target.isTaur())
			{
				outputRouter(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) outputRouter(" plantigrade");
				else if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) outputRouter(" digitigrade");
				if(target.legCount == 1) outputRouter(" " + target.leg(true, true) + " extends");
				else outputRouter(" " + target.legs(true, true) + " extend");
				outputRouter(" below " + (target == pc ? "your":"[target.hisHer]") + " waist");
				if(target.hasFeet())
				{
					outputRouter(", ending in ");
					if(target.legCount == 1) outputRouter(indefiniteArticle(target.foot(true, true)));
					else outputRouter(target.feet(true, true));
				}
				outputRouter(".");
			}
			break;
	}
	// Mimbrane feet for applicable legTypes (any pair of humanoid legs with existing feet)!
	if(target.isBiped() && target.hasFeet() && target.hasToes())
	{
		if(target == pc && target.hasStatusEffect("Mimbrane Foot Left") || target.hasStatusEffect("Mimbrane Foot Right"))
		{
			var bothFeet:Boolean = (target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right"));
			feedVal = Math.max(pc.mimbranePuffiness("Mimbrane Foot Left"), pc.mimbranePuffiness("Mimbrane Foot Right"));
			if(feedVal > 0)
			{
				outputRouter(" Your");
				if(target.hasLegFlag(GLOBAL.FLAG_HEELS))
				{
					if(bothFeet) outputRouter(" " + (target.hasLegFlag(GLOBAL.FLAG_PAWS) ? "paws" : "feet") + " appear");
					else outputRouter(" " + (target.hasLegFlag(GLOBAL.FLAG_PAWS) ? "paw" : "foot") + " appears");
				}
				else
				{
					if(bothFeet) outputRouter(" [target.feet] appear");
					else outputRouter(" [target.foot] appears");
				}
				if(feedVal <= 1) outputRouter(" to be slightly distended.");
				else if(feedVal <= 2) outputRouter(" puffy and inflated.");
				else outputRouter(" unusually large and somewhat swollen, almost engorged.");
			}
		}
	}
	
	// CoC places the pregnancy output directly after leg output
	//Start a new paragraph with bellies if preggers, otherwise tack onto the end of the last one.
	if(target.isPregnant()) outputRouter("\n\n");
	else outputRouter(" ");

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
		if(target.tone >= 75) outputRouter((target == pc ? "Your":"[target.HisHer]") + " " + RandomInCollection(["belly", "midriff", "middle", "six pack"]) + " is rock-hard, shaped by a good diet, steady conditioning, or both.");
		else if(target.tone >= 50) outputRouter((target == pc ? "Your":"[target.HisHer]") + " " + RandomInCollection(["belly", "midriff", "middle", "six pack"]) + " is fairly well-toned.");
		else outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is nice and smooth.");
	}
	else if(tempBelly <= 10) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is fairly average in appearance.");
	else if(tempBelly <= 15) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] would just barely push past the waistband of a pair of pants. It’s a little bit of a muffin-top.");
	else if(tempBelly <= 20) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is pretty decent-sized. There’s no real hiding it.");
	else if(tempBelly <= 30) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is impossible to miss. Wearing loose clothing wouldn’t even help at this point.");
	//full round bulky
	else if(tempBelly <= 40) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is big enough that a passersby might think " + (target == pc ? "you":"[target.himHer]") + " pregnant at a glance.");
	//expansive extensive spacious
	else if(tempBelly <= 50) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] would look more at home on a woman in the later stages of her pregnancy than an adventuring rusher.");
	//inflated excessive whopping
	else if(tempBelly <= 60) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is weighty enough to jiggle when " + (target == pc ? "you shift":"[target.heShe] shifts") + " positions too suddenly, but still small enough for easy portability.");
	//distended immense bloated
	else if(tempBelly <= 70) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] sticks out very noticeably, wobbling slightly with " + (target == pc ? "your":"[target.hisHer]") + " motions. It would look right at home on a reclining, full-time breeding servant.");
	//over-inflated jumbo-sized
	else if(tempBelly <= 80) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is obscene testament to what the body can endure. When " + (target == pc ? "you look":"[target.heShe] looks") + " down, " + (target == pc ? "you have":"[target.heShe] has") + " no hope of seeing " + (target == pc ? "your":"[target.hisHer]") + " crotch, let alone " + (target == pc ? "your":"[target.hisHer]") + " [target.feet].");
	//Very distended monumental massive
	else if(tempBelly <= 90) 
	{
		outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] is so big that it makes " + (target == pc ? "your":"[target.hisHer]") + " [target.skin] tight and shiny");
		if(InCollection(target.skinType, [GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_FEATHERS]))
			outputRouter(" under " + (target == pc ? "your":"[target.hisHer]") + " [target.skinFurScales]");
		outputRouter(". Movement is a little impractical with the extra bulk.");
	}
	//ginormous over-inflated blimp-like
	else if(tempBelly < 120) outputRouter((target == pc ? "Your":"[target.HisHer]") + " [target.belly] protrudes obscenely from " + (target == pc ? "your":"[target.hisHer]") + " form, hanging heavily. Getting around is a struggle with so much extra mass on " + (target == pc ? "you":"[target.himHer]") + ".");
	else
	{
		outputRouter((target == pc ? "Your":"[target.HisHer]") + " distended belly is so gargantuanly huge that " + (target == pc ? "you have":"[target.heShe] has") + " no hope of seeing the floor anywhere near " + (target == pc ? "you":"[target.himHer]") + ", let alone " + (target == pc ? "your":"[target.hisHer]") + " [target.legOrLegs]. It’s a small miracle that " + (target == pc ? "you":"[target.heShe]") + " can even stand upright with all that mass slung out in front of " + (target == pc ? "you":"[target.himHer]") + ".");
	}
	
	//Tack on preg flavor shit to the end of belly descripts.
	//PC only for now.
	if(target.isPregnant() && target == pc)
	{	
		// Fragments pass through the Creature class to get data from the individual pregnancy handlers.
		// Creature -> Find largest pregnancy (based on pregData.contributedBellyRatingMod) ->
		// query preg manager for fragment -> preg manager finds target handler -> query handler for
		// fragment string. Check VenusPitcherFertilizedSeedCarrierHandler::pregBellyFragment for examples
		
		// A fragment is intended to range anywhere from a full scentence to a full paragraph, to be merged in with existing text
		// or stand as their own paragraphs.
		outputRouter(" " + target.pregBellyFragment());
	}
	//9999
	//Premium Breeder Tattoo
	if (target.hasStatusEffect("Premium Breeder Crotch Tattoo"))
	{
		if (rand(2) == 0)
		{
			outputRouter(" Right above your groin is the same tattoo that’s on your cheek: the sperm heart radiating pinkness that marks you out as a Premium Breeder.");
			if (target.isPregnant() && tempBelly >= 30) outputRouter(" The way it’s stretched out currently by your heavily pregnant belly makes it look all the more sluttily appropriate.");
		}
		else
		{			
			outputRouter(" You have a tattoo on your lower belly, the pink heart-tailed sperm of a professional broodwhore.");
			if (target.isPregnant() && tempBelly >= 30) outputRouter(" It’s stretched out by your round, tautened belly, the most perfect advertisement of your skills imaginable.");
		}
	}
	//Chesticles.
	boobStuff(forTarget);
	//CROTCH STUFF!
	crotchStuff(forTarget);
	//Reset target since crotch/boobs clear it at the end.
	setTarget(forTarget);

	// Extra menu stuff
	var btnIndex:int = 0;
	
	//PC options!
	if(target == pc)
	{
		// Gender preference
		addGhostButton(btnIndex++, "PrefGender", selectGenderPref, undefined, "Preferred Gender", "Indicate the gender you would prefer your character to be considered.");
		// Silicone preference
		if(target.hasSilicone() > 0) addGhostButton(btnIndex++, "PrefSilicone", selectSiliconePref, undefined, "Preferred Silicone Description", "Indicate how you would like your silicone implants to be potentially described.");
		// Wing position
		if(target.canCoverSelf(false, "wings")) addGhostButton(btnIndex++, StringUtil.toDisplayCase(target.wingsDescript(true)), selectWingPref, undefined, "Position " + StringUtil.toDisplayCase(target.wingsDescript(true)), "Change the position of your " + target.wingsDescript(true) + ".");
		//PC Goo'ed up?
		if(target.hairType == GLOBAL.HAIR_TYPE_GOO || target.hasStatusEffect("Goo Vent") || target.hasStatusEffect("Goo Crotch"))
		{
			outputRouter("\n\nSince ");
			if(target.isGoo()) outputRouter("you’re ");
			else outputRouter("some parts of you are ");
			outputRouter("made of goo, you can adjust ");
			if(target.isGoo()) outputRouter("your body");
			else outputRouter("them");
			outputRouter(" if need be.");
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
			outputRouter("\n\nFrom time to time, small chirps remind you that your body is not owned by just you alone. The");
			// Just one.
			if(mimNum == 1) 
			{
				outputRouter(" parasite attached to");
				if(target.hasStatusEffect("Mimbrane Cock")) outputRouter(" [target.eachCock]");
				else if(target.hasStatusEffect("Mimbrane Pussy")) outputRouter(" [target.eachVagina]");
				else if(target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your [target.butt]");
				else if(target.hasStatusEffect("Mimbrane Balls")) outputRouter(" your [target.balls]");
				else if(target.hasStatusEffect("Mimbrane Boobs")) outputRouter(" your [target.chest]");
				else if(target.hasStatusEffect("Mimbrane Hand Left")) outputRouter(" your left hand");
				else if(target.hasStatusEffect("Mimbrane Hand Right")) outputRouter(" your right hand");
				else if(target.hasStatusEffect("Mimbrane Foot Left")) outputRouter(" your left [target.foot]");
				else if(target.hasStatusEffect("Mimbrane Foot Right")) outputRouter(" your right [target.foot]");
				else if(target.hasStatusEffect("Mimbrane Face")) outputRouter(" your [target.face]");
				else outputRouter(" your body");
				outputRouter(" seems");
			}
			// More than one.
			else
			{
				outputRouter(" parasites attached to");
				if(mimNum == 2)
				{
					if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls")) outputRouter(" your cock and balls");
					else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your tits and ass");
					else if(target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your bodily glory holes");
					else if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Pussy")) outputRouter(" your genitalia");
					else if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right")) outputRouter(" both of your hands");
					else if(target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) outputRouter(" your [target.feet]");
					else outputRouter(" a couple of your appendages");
				}
				else if(mimNum == 3)
				{
					if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls") && target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your masculine bits");
					else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your lady-like bits");
					else outputRouter(" a few of your appendages");
				}
				else if(mimNum == 4)
				{
					if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls") && target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) outputRouter(" your sensitive genitals");
					else if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right") && target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) outputRouter(" your major limbs");
					else outputRouter(" some of your appendages");
				}
				else outputRouter(" a variety of your appendages");
				outputRouter(" seem");
			}
			outputRouter(" intelligent enough for some rudimentary communication....");
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
		if (target.armor is Slavesuit) 
		{
			outputRouter("\n\n<b>You can zip or unzip the zippers on your slavesuit at will.</b>.. Or you could just check and see how you have it set up right now.");
			addGhostButton(btnIndex++,"Slavesuit",slavesuitOptionsDisplay,undefined,"Slavesuit","Check the status of you slave uniform.");
		}
		// Immobilization help
		if (immobilizationList().length > 0) addGhostButton(btnIndex++, "ImmobileHelp", immobilizationHelp, undefined, "Immobilization Help", "You can’t move--Call for help to fix your immobilized state!");
	}
	setTarget(null);
	
	outputRouter("\n\n");
}

private var COLLAR_LIST:Array = [
	"Jerynn’s",
	"Sera’s",
	"Sub-Tuner",
	"Vark's",
	"[lorelei.name]'s",
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

public function collarOwnerName():String
{
	if (!hasWornCollar()) return "Nobody";
	var ownerName:String = getWornCollar().storageName.split(" ")[0];
	if (ownerName == "Sub-Tuner") return "Belle";
	return ownerName.slice(0, ownerName.length-2);
}

public function appearanceWornCollar():void
{
	var wornCollar:StorageClass = getWornCollar();
	var outputRouter:Function = output2;
	if (wornCollar != null)
	{
		switch(wornCollar.storageName)
		{
			case "Sera’s Collar":
				outputRouter(" Around your neck, a black leather and lace collar, replete with tiny pearls and a brass ring, is tightly fixed.");
				break;
			case "Sub-Tuner Collar":
				outputRouter(" Your neck is adorned with Belle’s Sub-Tuner collar, covered with circuitry and locked around your nape with a magnetic seal, bearing a small holo-tag labeled " + (flags["SUBTUNER_NAMED"] == 2 ? "“[pc.name]”" : "“Subject 69”") + ".");
				break;
			case "Vark's Collar":
				outputRouter(" Around your neck is a thick leather collar, fashioned by your master, Vark. It’s laced with Savicite, the buckles and exposed surfaces sending jolts of pleasure into your [pc.skinScalesFurNoun] whenever it rubs against you, reminding you of the big sexy cat you belong to.");
				if (wornCollar.value2 == 1) outputRouter(" You didn’t know you wanted it at first, but you can’t say you haven’t come around to how good it feels.");
				break;
			default:
				outputRouter(" You are currently wearing " + wornCollar.storageName + " around your neck.");
				break;
		}
	}
}
public function manageWornCollar():void
{
	clearOutput2();
	var wornCollar:StorageClass = getWornCollar();
	var outputRouter:Function = output2;
	if (wornCollar != null)
	{
		switch(wornCollar.storageName)
		{
			case "Sera’s Collar":
				outputRouter("You are currently wearing Sera’s Black Lace Collar.");
				outputRouter("\n\nThis collar is composed of soft, rich leather around its ring, out of which wings of black lace sprout, contouring with the shape of your neck. Tiny pearls dangle from the lace, making small clicking sounds when you move energetically. A large brass ring connects to the back; a strange, blue gemstone is affixed to the front, glowing softly from within. ‘PROPERTY OF SERA’ is embossed into the leather. Altogether it’s an alluring, gothic piece of fetish-wear, elegant even - at least if you don’t know the purpose of the gemstone.");
				break;
			case "Sub-Tuner Collar":
				outputRouter("Your neck is adorned with Belle’s Sub-Tuner collar, covered with circuitry and locked around your nape with a magnetic seal, bearing a small holo-tag labeled ");
				//anno/SyriCrew/SavedKiro: 
				if(flags["SUBTUNER_NAMED"] == 2) outputRouter("“[pc.name]”");
				else outputRouter("“Subject 69”");
				outputRouter(".");
				break;
			case "Vark's Collar":
				outputRouter("Around your neck is a thick leather collar, fashioned by your master, Vark. It’s laced with Savicite, the buckles and exposed surfaces sending jolts of pleasure into your [pc.skinScalesFurNoun] whenever it rubs against you.");
				break;
			default:
				outputRouter("You are currently wearing " + wornCollar.storageName + ".");
				break;
		}
	}
	else
	{
		outputRouter("You are not currently wearing a collar.");
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
	var outputRouter:Function = output2;
	if(forTarget != pc) outputRouter = output;
	if(forTarget != null) setTarget(forTarget);
	
	var rando:int = 0;
	outputRouter("\n\n");
	if(target.gills)
	{
		outputRouter("A pair of [target.gills] are growing out from below " + (target == pc ? "your":"[target.hisHer]") + " jaw, down the sides of " + (target == pc ? "your":"[target.hisHer]") + " neck. They allow " + (target == pc ? "you":"[target.himHer]") + " to stay in the water for quite a long time. ");
	}
	//Chesticles..I mean bewbz.
	if(target.breastRows.length == 1) {
		// Feminine A-Cups
		if(target.biggestTitSize() < 2 && target.biggestTitSize() >= 1 && target.mf("m","f", true) == "f") {
			if(rand(3) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " the barest hint of breasts, " + num2Text(target.breastRows[0].breasts) + " teasing feminine rises on " + (target == pc ? "your":"[target.hisHer]") + " chest");
			else if(rand(2) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " tiny, cute mosquito bites for breasts, pert and sensitive");
			else outputRouter((target == pc ? "You have":"[target.HeShe] has") + " A-cup breasts, " + num2Text(target.breastRows[0].breasts) + " small, pert" + target.rawmfn(" trappy"," sporty","") + " boobs that almost vanish under anything thicker than spandex");
			outputRouter(", capped with ");
		}
		// Default
		else if(target.biggestTitSize() > 1) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " " + num2Text(target.breastRows[0].breasts) + " " + target.chestDesc() + ", capped with ");
		// Flat chests!
		else
		{
			// Feminine/Andro, Low/Medium Tone
			if((target.mfn("m","f","n", true) != "m") && target.tone < 60) {
				if(rand(3) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a waif’s chest, flat and innocent-looking");
				else if(rand(2) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a girly, soft, undefined flat chest");
				else outputRouter("The top half of " + (target == pc ? "your":"[target.hisHer]") + " body is willowy and breast-less, graceful yet vaguely austere");
			}
			// Masculine, High Tone, High Thickness
			else if((target.mf("m","f", true) == "m") && target.tone >= 60 && target.thickness >= 60) {
				if(rand(3) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a fuck-off six pack, bulging with heavy muscle. Above it, " + (target == pc ? "you have":"[target.heShe] has") + " a broad chest");
				else if(rand(2) == 0) outputRouter((target == pc ? "You’re":"[target.HeShe] is") + " ripped as hell, sporting the kind of muscle guys want and girls want around them. Much can be said about " + (target == pc ? "your":"[target.hisHer]") + " pecs");
				else outputRouter((target == pc ? "You have":"[target.HeShe] has") + " remarkably well defined, heavyweight abs, rounded and beefy. Above it, " + (target == pc ? "you have":"[target.heShe] has") + " a muscled chest");
			}
			// Masculine, Low Tone, High Thickness
			else if((target.mf("m","f", true) == "m") && target.tone <= 30 && target.thickness >= 60) {
				if(rand(3) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a broad, incredibly masculine chest, bulky and assured");
				else if(rand(2) == 0) outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a bear-like upper frame, voluminous and imminently cuddly");
				else outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a wide, hearty, supremely manly chest");
			}
			// Masculine/Feminine/Andro, High Tone, Low Thickness
			else if(target.tone >= 60 && target.thickness <= 30) {
				if(rand(3) == 0) outputRouter(target.mf((target == pc ? "You have":"[target.HeShe] has") + " a narrow, well defined but unostentatious six pack. Above it, " + (target == pc ? "you have":"[target.heShe] has") + " a chiseled chest", (target == pc ? "You have":"[target.HeShe] has") + " a flat, athlete’s chest, supple and thin", true));
				else if(rand(2) == 0) outputRouter(target.mf((target == pc ? "You have":"[target.HeShe] has") + " a sleek, tight featherweight’s six pack. Above it, " + (target == pc ? "you have":"[target.heShe] has") + " a defined chest", (target == pc ? "You have":"[target.HeShe] has") + " a no-nonsense flat chest, framed by rounded, subtle amounts of muscle", true));
				else outputRouter(target.mf((target == pc ? "You have":"[target.HeShe] has") + " a flat, athlete’s chest, wiry with muscle", (target == pc ? "Your":"[target.HisHer]") + " firm, washboard, modest pecs make " + (target == pc ? "you":"[target.himHer]") + " look teasingly sexually ambiguous", true));
			}
			// Basic
			else
			{
				outputRouter((target == pc ? "You have":"[target.HeShe] has") + " a");
				if(target.tone >= 100)
				{
					if(target.thickness > 70) outputRouter("n immense chest with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
					else if(target.thickness >= 30) outputRouter(" robust chest with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
					else outputRouter(" chisled chest with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
				}
				else if(target.tone > 70)
				{
					if(target.thickness > 70) outputRouter(" broad chest with " + target.mf("well defined","well toned", true) + " pectoral muscles");
					else if(target.thickness >= 30) outputRouter(" healthy chest with " + target.mf("well defined","well toned", true) + " pectoral muscles");
					else outputRouter(" fit chest with " + target.mf("well defined","well toned", true) + " pectoral muscles");
				}
				else if(target.tone >= 30)
				{
					if(target.thickness > 70) outputRouter(" thick chest with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
					else if(target.thickness >= 30) outputRouter("n average chest with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
					else outputRouter(" soft chest with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
				}
				else
				{
					if(target.thickness > 70) outputRouter(" wide chest with unremarkable " + target.mf("pectoral muscles", "breasts", true));
					else if(target.thickness >= 30) outputRouter(" passable chest with unremarkable " + target.mf("pectoral muscles", "breasts", true));
					else outputRouter(" flat chest with unremarkable " + target.mf("pectoral muscles", "breasts", true));
				}
			}
			outputRouter(", capped with ");
		}
		//Normal nips
		if(InCollection(target.breastRows[0].nippleType, [GLOBAL.NIPPLE_TYPE_DICK, GLOBAL.NIPPLE_TYPE_NORMAL]))
		{ 
			//One nipple
			if(target.nipplesPerBreast == 1) outputRouter(num2Text(target.nipplesPerBreast) + " " + num2Text(int(target.nippleLength(0)*10)/10) + "-inch " + target.nippleDescript(0) + " each.");
			else outputRouter(num2Text(target.nipplesPerBreast) + " " + num2Text(int(target.nippleLength(0)*10)/10) + "-inch " + plural(target.nippleDescript(0)) + " each.");
			//Dicknipples mention areolae desc later.
			if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) outputRouter(" The " + target.areolaeDescript(0, true) + " are " + target.nippleColor + ".");
			else outputRouter(" The " + target.areolaeDescript(0, true) + " are " + target.nippleColor + ".");
			if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
			{
				//New J-Cup hotness
				outputRouter(" With a lusty thought and a bit of focus, " + (target == pc ? "you":"[target.heShe]") + " can make " + num2Text(Math.round(target.nippleLength(0) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind " + (target == pc ? "your":"[target.hisHer]") + " " + target.areolaeDescript(0, true) + ".");
				//OLD: outputRouter(" With a lusty thought and a bit of focus, you can make " + num2Text(Math.round(target.nippleLength(0) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind your " + target.areolaeDescript(0, true) + ".");
			}
		}
		//Inverted type
		else {
			//One nipple
			if(target.nipplesPerBreast == 1) outputRouter(num2Text(target.nipplesPerBreast) + " " + target.nippleDescript(0) + " each.");
			else outputRouter(num2Text(target.nipplesPerBreast) + " " + plural(target.nippleDescript(0)) + " each.");
			switch(target.breastRows[0].nippleType)
			{
				case GLOBAL.NIPPLE_TYPE_FUCKABLE:
					outputRouter(" The " + target.areolaeDescript(0, true) + " are " + target.nippleColor + ".");
					outputRouter(" While " + (target == pc ? "you":"[target.heShe]") + " may appear to have inverted nipples, " + (target == pc ? "your":"[target.hisHer]") + " chest actually houses wet, slippery secrets. A finger or cock could easily slip inside " + (target == pc ? "you":"[target.himHer]") + " to give and get as much pleasure as any crotch-couched cunt.");
					break;
				case GLOBAL.NIPPLE_TYPE_LIPPLES:
					outputRouter(" The plump, " + target.areolaSizeDescript(0) + ", " + target.nippleColor + " lips that " + (target == pc ? "you have":"[target.heShe] has") + " in place of areolae could easily be parted to allow something stiff and hard inside " + (target == pc ? "your":"[target.hisHer]") + " sensitive chest-based passages.");
					break;
				case GLOBAL.NIPPLE_TYPE_FLAT:
					outputRouter(" There isn’t any actual nub to " + (target == pc ? "your":"[target.hisHer]") + " nipples - just " + target.nippleColor + ", " + target.areolaeDescript(0, true) + ".");
					break;
				case GLOBAL.NIPPLE_TYPE_INVERTED:
					outputRouter(" The " + target.areolaeDescript(0, true) + " are " + target.nippleColor + ".");
					outputRouter(" When " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused enough, " + (target == pc ? "your":"[target.hisHer]") + " " + num2Text(int(target.nippleLength(0)*10)/10) + "-inch nipples pop out, ready for action.");
					break;
				case GLOBAL.NIPPLE_TYPE_TENTACLED:
					outputRouter(" Once " + (target == pc ? "you are":"[target.heShe] is") + " worked up, several long, prehensile tentacles emerge from their " + target.nippleColor + " home, seeking for an orifice to pleasure.");
					break;
			}
		}
		//Lactation and breast cup final!
		if(target.isLactating())
		{
			if(target.milkFullness < 50) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are producing [target.milk] but are nowhere near full at the moment.");
			else if(target.milkFullness < 75) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " have a noticable amount of [target.milk] inside them now. Before long, they’ll start swelling.");
			else if(target.milkFullness < 100) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are fairly full of [target.milk] and noticeably swollen.");
			else if(target.milkFullness < 150) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are sore and sensitive from being so stuffed with [target.milk]. " + (target == pc ? "You":"[target.HeShe]") + " should release the pressure soon.");
			else if(target.milkFullness < 200)
			{
				if(target.isMilkTank() && rand(2) == 0) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are incredibly swollen with [target.milk], so much that they’re much bigger than normal. " + (target == pc ? "Your":"[target.HisHer]") + " lactation shows no signs of slowing down in the slightest.");
				else if(target.isMilkTank()) outputRouter(" At least " + (target == pc ? "you are":"[target.heShe] is") + " certain " + (target == pc ? "your":"[target.hisHer]") + " enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are painfully swollen with [target.milk], so much that they’re much bigger than normal. The longer they stay like this, the more " + (target == pc ? "your":"[target.hisHer]") + " lactation will slow.");
			}
			else
			{
				if(target.isMilkTank() && rand(2) == 0) outputRouter(" <b>" + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are so full that they might burst! They radiate a constant yet rhythmic pulse of pressure, a sign that " + (target == pc ? "you are":"[target.heShe] is") + " quite the productive [target.milkNoun] factory!</b>");
				else if(target.isMilkTank()) outputRouter(" Despite the uncomfortable fullness, " + (target == pc ? "you are":"[target.heShe] is") + " at ease - " + (target == pc ? "you know":"[target.heShe] knows") + " " + (target == pc ? "your":"[target.hisHer]") + " enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else outputRouter(" <b>" + (target == pc ? "Your":"[target.HisHer]") + " " + target.breastDescript(0) + " are so full that they feel about to burst! Spending time like this is going to slow " + (target == pc ? "your":"[target.hisHer]") + " milk production.</b>");
			}
			//Don't forget about the bras! Primarily when mentioning the slowing of milk production.
			if(target.milkFullness > 150 && target.upperUndergarment.shortName != "")
			{
				if(target.upperUndergarment.shortName == "Bounty Bra" && target.isMilkTank()) outputRouter(" The massaging vibrations eminating from " + (target == pc ? "your":"[target.hisHer]") + " JoyCo maternity bra reminds " + (target == pc ? "you":"[target.himHer]") + " that " + (target == pc ? "you":"[target.heShe]") + "’ll never stop lactating, but you wonder if it is really necessary since " + (target == pc ? "your":"[target.hisHer]") + " lactation seems to be on an endless outflow.");
				else if(target.upperUndergarment.shortName == "Bounty Bra") outputRouter(" Luckily, the massaging vibrations emanating from " + (target == pc ? "your":"[target.hisHer]") + " JoyCo maternity bra reminds " + (target == pc ? "you":"[target.himHer]") + " that " + (target == pc ? "you":"[target.heShe]") + "’ll never stop lactating as long as " + (target == pc ? "you continue":"[target.heShe] continues") + " to wear the " + target.upperUndergarment.shortName + ".");
				else outputRouter(" Unfortunately, a bit of [target.milk] leaks out onto " + (target == pc ? "your":"[target.hisHer]") + " " + target.upperUndergarment.description + "... Maybe " + (target == pc ? "you":"[target.heShe]") + " should invest in a maternity bra?");
			}
		}
		if(target.breastRows[0].breastRating() >= 1) outputRouter(" " + (target == pc ? "You":"[target.HeShe]") + " could easily fill " + indefiniteArticle(target.breastCup(0)) + " bra.");
	}
	//many rows
	else {
		outputRouter((target == pc ? "You have":"[target.HeShe] has") + " " + num2Text(target.breastRows.length) + " rows of breasts");
		if(target.biggestTitSize() < 1)
		{
			outputRouter(", all");
			if(target.tone >= 100)
			{
				if(target.thickness > 70) outputRouter(" immense with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
				else if(target.thickness >= 30) outputRouter(" robust with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
				else outputRouter(" chisled with " + target.mf("extremely pronounced","very pronounced", true) + " pectoral muscles");
			}
			else if(target.tone > 70)
			{
				if(target.thickness > 70) outputRouter(" broad with " + target.mf("well defined","well toned", true) + " pectoral muscles");
				else if(target.thickness >= 30) outputRouter(" healthy with " + target.mf("well defined","well toned", true) + " pectoral muscles");
				else outputRouter(" fit with " + target.mf("well defined","well toned", true) + " pectoral muscles");
			}
			else if(target.tone >= 30)
			{
				if(target.thickness > 70) outputRouter(" thick with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
				else if(target.thickness >= 30) outputRouter(" average with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
				else outputRouter(" soft with " + target.mf("toned","lightly toned", true) + " pectoral muscles");
			}
			else
			{
				if(target.thickness > 70) outputRouter(" wide and fairly " + target.mfn("masculine","feminine","masculine", true) + " in look");
				else if(target.thickness >= 30) outputRouter(" passable and fairly " + target.mfn("masculine","feminine","masculine", true) + " in look");
				else outputRouter(" flat and fairly " + target.mfn("masculine","feminine","masculine", true) + " in look");
			}
			outputRouter(".");
		}
		else
		{
			outputRouter(", the topmost");
			if(target.breastRows[0].breasts == 2) outputRouter(" pair");
			else outputRouter(" set");
			outputRouter(" starting at " + (target == pc ? "your":"[target.hisHer]") + " chest.");
		}
		temp = 0;
		while (temp < target.breastRows.length) {
			// Feminine A-Cups
			if(target.breastRows[temp].breastRating() >= 1 && target.breastRows[temp].breastRating() < 2 && target.mf("m","f", true) == "f")
			{
				if(temp == 0) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " top row of breasts are ");
				else if(temp == (target.breastRows.length - 1)) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " bottom row of breasts are ");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " next row of breasts are ");
				if(rand(3) == 0 && temp > 0) outputRouter("bare hints, nothing more than " + num2Text(target.breastRows[0].breasts) + " teasing feminine rises below the ones above");
				else if(rand(2) == 0) outputRouter("tiny, cute mosquito bites, pert and sensitive");
				else outputRouter("A-cups, " + num2Text(target.breastRows[0].breasts) + " small, pert" + target.rawmfn(" trappy"," sporty","") + " boobs that almost vanish under anything thicker than spandex");
				outputRouter(", capped with ");
			}
			// Default
			else
			{
				switch(temp)
				{
					case 0: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " uppermost row houses "); break;
					case 1: outputRouter(" The second group holds "); break;
					case 2: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " third batch contains "); break;
					case 3: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fourth set cradles "); break;
					case 4: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " fifth has "); break;
					default: outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " " + num2Ordinal(temp + 1) + " row has "); break;
				}
				if(target.breastRows[temp].breastRating() >= 1) outputRouter(num2Text(target.breastRows[temp].breasts) + " " + target.breastDescript(temp) + ", capped with ");
			}
			//DESCRIBE NIPPLE NAU!
			//Normal nips
			if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_DICK || target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL) {
				if(target.breastRows[temp].nippleType != GLOBAL.NIPPLE_TYPE_DICK) {
					outputRouter(target.areolaDescript(temp, true) + " and ");
				}
				//One nipple
				if(target.nipplesPerBreast == 1) {
					outputRouter(num2Text(target.nipplesPerBreast) + " " + num2Text(int(target.nippleLength(temp)*10)/10) + "-inch " + target.nippleDescript(temp) + " ");
					if(target.breastRows[temp].breastRating() < 1) outputRouter("on each side.");
					else outputRouter("each.");
				}
				else {
					outputRouter(num2Text(target.nipplesPerBreast) + " " + num2Text(int(target.nippleLength(temp)*10)/10) + "-inch " + plural(target.nippleDescript(temp)) + " ");
					if(target.breastRows[temp].breastRating() < 1) outputRouter("on each side.");
					else outputRouter("each.");
				}
				if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_DICK) {
					outputRouter(" " + (target == pc ? "You":"[target.HeShe]") + " can make " + num2Text(Math.round(target.nippleLength(temp) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind the " + target.areolaeDescript(temp, true) + ".");
				}
			}
			//Inverted type
			else {
				if(!InCollection(target.breastRows[temp].nippleType, [GLOBAL.NIPPLE_TYPE_LIPPLES, GLOBAL.NIPPLE_TYPE_FLAT])) {
					outputRouter(target.areolaDescript(temp, true) + " and ");
				}
				//One nipple
				if(target.nipplesPerBreast == 1) {
					outputRouter(num2Text(target.nipplesPerBreast) + " " + target.nippleDescript(temp) + " ");
					if(target.breastRows[temp].breastRating() < 1) outputRouter("on each side.");
					else outputRouter("each.");
				}
				//Multi
				else {
					outputRouter(num2Text(target.nipplesPerBreast) + " " + plural(target.nippleDescript(temp)) + " ");
					if(target.breastRows[temp].breastRating() < 1) outputRouter("on each side.");
					else outputRouter("each.");
				}
				switch(target.breastRows[temp].nippleType)
				{
					case GLOBAL.NIPPLE_TYPE_FUCKABLE:
						outputRouter(" They actually house wet, slippery, secret entrances.");
						break;
					case GLOBAL.NIPPLE_TYPE_LIPPLES:
						outputRouter(" Plump lips cap them off in place of nipples.");
						break;
					case GLOBAL.NIPPLE_TYPE_FLAT:
						outputRouter(" There isn’t any actual nub to the nipples - just " + target.areolaeDescript(temp, true) + ".");
						break;
					case GLOBAL.NIPPLE_TYPE_INVERTED:
						outputRouter(" When you’re aroused enough, the " + num2Text(int(target.nippleLength(0)*10)/10) + "-inch nubs pop out, ready to play.");
						break;
					case GLOBAL.NIPPLE_TYPE_TENTACLED:
						outputRouter(" They hide several long, prehensile tentacles, eager for an orifice to pleasure.");
						break;
				}
			}
			if(target.breastRows[temp].breastRating() >= 1) outputRouter(" They could easily fill " + indefiniteArticle(target.breastCup(temp)) + " bra.");
			temp++;
		}
		//Done with tits. Move on.
		//Lactation and breast cup final!
		if(target.isLactating())
		{
			if(target.milkFullness < 50) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are producing [target.milk] but are nowhere near full at the moment.");
			else if(target.milkFullness < 75) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] have a noticable amount of [target.milk] inside them now. Before long, they’ll start swelling.");
			else if(target.milkFullness < 100) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are fairly full of [target.milk] and noticeably swollen.");
			else if(target.milkFullness < 150) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are sore and sensitive from being so stuffed with [target.milk]. " + (target == pc ? "You":"[target.HeShe]") + " should release the pressure soon.");
			else if(target.milkFullness < 200)
			{
				if(target.isMilkTank() && rand(2) == 0) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are incredibly swollen with [target.milk], so much that they’re much bigger than normal. " + (target == pc ? "Your":"[target.HisHer]") + " lactation shows no signs of slowing down in the slightest.");
				else if(target.isMilkTank()) outputRouter(" At least " + (target == pc ? "you are":"[target.heShe] is") + " certain " + (target == pc ? "your":"[target.hisHer]") + " enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are painfully swollen with [target.milk], so much that they’re much bigger than normal. The longer they stay like this, the more " + (target == pc ? "your":"[target.hisHer]") + " lactation will slow.");
			}
			else
			{
				if(target.isMilkTank() && rand(2) == 0) outputRouter(" <b>" + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are so full that they might burst! They radiate a constant yet rhythmic pulse of pressure, a sign that " + (target == pc ? "you are":"[target.heShe] is") + " quite the productive [target.milkNoun] factory!</b>");
				else if(target.isMilkTank()) outputRouter(" Despite the uncomfortable fullness, " + (target == pc ? "you are":"[target.heShe] is") + " at ease - " + (target == pc ? "you know your":"[target.heShe] knows [target.hisHer]") + " enhanced [target.chestNoun] will never stop lactating, no matter what.");
				else outputRouter(" <b>" + (target == pc ? "Your":"[target.HisHer]") + " [target.fullChest] are so full that they feel about to burst! Spending time like this is going to slow " + (target == pc ? "your":"[target.hisHer]") + " milk production.</b>");
			}
			//Bra specials
			if(target.milkFullness > 150 && target.upperUndergarment.shortName != "")
			{
				if(target.upperUndergarment.shortName == "Bounty Bra" && target.isMilkTank()) outputRouter(" The massaging vibrations eminating from " + (target == pc ? "your":"[target.hisHer]") + " JoyCo maternity bra reminds " + (target == pc ? "your":"[target.himHer]") + " that " + (target == pc ? "you":"[target.heShe]") + "’ll never stop lactating, but " + (target == pc ? "you wonder":"[target.heShe] wonders") + " if it is really necessary since " + (target == pc ? "your":"[target.hisHer]") + " lactation seems to be on an endless outflow.");
				else if(target.upperUndergarment.shortName == "Bounty Bra") outputRouter(" Luckily, the massaging vibrations emanating from " + (target == pc ? "your":"[target.hisHer]") + " JoyCo maternity bra reminds " + (target == pc ? "you that you":"[target.himHer] that [target.heShe]") + "’ll never stop lactating as long as " + (target == pc ? "you continue":"[target.heShe] continues") + " to wear the " + target.upperUndergarment.shortName + ".");
				else outputRouter(" Unfortunately, a bit of [target.milk] leaks out onto " + (target == pc ? "your":"[target.hisHer]") + " " + target.upperUndergarment.description + "... Maybe " + (target == pc ? "you":"[target.heShe]") + " should invest in a maternity bra?");
			}
		}
	}
	
	// Painted Titties
	if(target.hasStatusEffect("Painted Tits"))
	{
		outputRouter("\n\nAccentuating " + (target == pc ? "your":"[target.hisHer]"));
		if(target.breastRows.length != 1) outputRouter(" " + num2Ordinal(target.statusEffectv1("Painted Tits") + 1) + " row of");
		outputRouter(" " + target.breastDescript(target.statusEffectv1("Painted Tits")) + " like a lewd mural, an eye-catching design has been painted on the surface.");
		/*
		switch(flags["BOOB_PAINTED_DESIGN"])
		{
			case 1: outputRouter(" "); break;
			case 2: outputRouter(" "); break;
			case 3: outputRouter(" "); break;
			case 4: outputRouter(" "); break;
			default: outputRouter(" "); break;
		}
		*/
	}
	// Lund piercing
	if(target.breastRows[0].piercing is LundsRings && target == pc) outputRouter("\n\nYour [pc.nipples] are each pierced with a small golden ring, courtesy of Lund. If you lift them to check, you can see inscriptions along the inside written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.");
	
	if(forTarget != null) setTarget(null);
}

public function crotchStuff(forTarget:Creature = null):void
{
	if(forTarget != null) setTarget(forTarget);
	
	var outputRouter:Function = output2;
	if(forTarget != pc) outputRouter = output;
	
	var rando:int = 0;
	var feedVal:int;
	
	if(target.hasGenitals()) {
		outputRouter("\n\n");
		//Crotchial stuff - mention snake
		if(target.hasStatusEffect("Genital Slit") && target.hasCock())
		{
			outputRouter((target == pc ? "Your":"[target.Name]’s") + " masculine endowment");
			if((target.hasVagina() && target.hasCock()) || target.totalCocks() > 1) outputRouter("s are ");
			else outputRouter(" is ");
			outputRouter("concealed within a well-hidden slit when not in use, though when the need arises, " + (target == pc ? "you":"[target.heShe]") + " can part " + (target == pc ? "your":"[target.hisHer]") + " concealed entrance and reveal " + (target == pc ? "your":"[target.hisHer]") + " true self. ");
			if(target.isTaur()) outputRouter((target == pc ? "You’re":"[target.HeShe]’s") + " probably one of the most modest taurs out there because of this. ");
		}
		// No genital slits
		else
		{
			switch(target.genitalLocation())
			{
				case 0:
					outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is located at " + (target == pc ? "your":"[target.hisHer]"));
					if(!target.isHuman() || !target.isHalfHuman()) outputRouter(" humanoid");
					outputRouter(" waist. ");
					break;
				case 1:
					outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is located in the middle of " + (target == pc ? "your":"[target.hisHer]"));
					if(target.legCount == 1 && target.isNaga()) outputRouter(" long tail");
					else outputRouter(" lower body");
					outputRouter(". ");
					break;
				case 2:
					if(target.isTaur())
					{
						if(target.originalRace == "half-leithan")
						{
							outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is positioned at the back of " + (target == pc ? "your":"[target.hisHer]") + " tauric hindquarters, rather than at " + (target == pc ? "your":"[target.hisHer]") + " humanoid waist. ");
						}
						else
						{
							outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is");
							if(target.race() != target.originalRace) outputRouter(" no longer below " + (target == pc ? "your":"[target.hisHer]") + " waist, but instead");
							outputRouter(" at the back of " + (target == pc ? "your":"[target.hisHer]"));
							if(target.legType == GLOBAL.TYPE_EQUINE) outputRouter(" equine");
							else if(target.legType == GLOBAL.TYPE_BOVINE) outputRouter(" bovine");
							else outputRouter(" tauric");
							outputRouter(" hindquarters. ");
						}
					}
					else
					{
						outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is located at " + (target == pc ? "your":"[target.hisHer]") + " rear");
						if(target.legCount > 1 && target.isNaga()) outputRouter(" tails");
						else if(target.legCount > 1) outputRouter(" legs");
						outputRouter(". ");
					}
					break;
				case 3:
					outputRouter((target == pc ? "Your":"[target.Name]’s") + " sexual equipment is located");
					if(target.isDrider()) outputRouter(" at the end of " + (target == pc ? "your":"[target.hisHer]") + " drider abdomen");
					else if(target.legCount == 1 && target.isNaga()) outputRouter(" on the underside of " + (target == pc ? "your":"[target.hisHer]") + " long tail");
					else outputRouter(" on the underside of " + (target == pc ? "your":"[target.hisHer]") + " lower body");
					outputRouter(". ");
					break;
			}
		}
		
		//SINGLE DICKS!
		if(target.cockTotal() == 1) {
			outputRouter((target == pc ? "Your":"[target.HisHer]") + " " + target.simpleCockNoun(0) + " is " + Math.floor(10*target.cocks[0].cLength())/10 + " inches long and ");
			if(Math.floor(10*target.cocks[0].thickness())/10 < 2) {
				if(Math.floor(10*target.cocks[0].thickness())/10 == 1) outputRouter(int(10*target.cocks[0].thickness())/10 + " inch thick");
				else outputRouter(Math.round(10*target.cocks[0].thickness())/10 + " inches across");
			}
			else outputRouter(num2Text(Math.round(10*target.cocks[0].thickness())/10) + " inches across");
			if(target.cocks[0].flaccidMultiplier != 1 && target.lust() < 100) outputRouter(" when fully erect");
			outputRouter(".");
			dickBonusForAppearance(forTarget, 0);
			//Dickbonus clears target at the end. Bring it back.
			if(forTarget != null) setTarget(forTarget);
			//Worm flavor
			if(target.hasStatusEffect("Infested")) outputRouter(" Every now and again a slimy worm coated in spunk slips partway out of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(0) + ", tasting the air like a snake’s tongue.");
		}
		//MULTICOCKS!
		else if(target.totalCocks() > 1)
		{
			temp = 0;
			rando = rand(4);
			outputRouter("Where a penis would normally be located, " + (target == pc ? "you have":"[target.heShe] has") + " instead grown " + target.multiCockDescript(false, true) + ":");
			while(temp < target.totalCocks()) 
			{
				//middle cock description
				if(rando == 0) {
					if(temp == 0)outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " first ");
					else outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " next ");
					outputRouter(target.simpleCockNoun(temp));
					outputRouter(" is ");
					outputRouter(int(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) outputRouter(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches wide");
					else {
						if(target.cocks[temp].thickness() == 1) outputRouter("one inch wide");
						else outputRouter(Math.round(target.cocks[temp].thickness()*10)/10 + " inches wide");
					}
					if(target.cocks[temp].flaccidMultiplier != 1 && target.lust() < 100) outputRouter(" when fully erect");
					outputRouter(".");
				}
				if(rando == 1) {
					outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " " + num2Ordinal(temp + 1) + " ");
					outputRouter(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) outputRouter(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick");
					else {
						if(target.cocks[temp].thickness() == 1) outputRouter("one-inch thick");
						else outputRouter(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick");
					}
					if(target.cocks[temp].flaccidMultiplier != 1 && target.lust() < 100) outputRouter(" when fully erect");
					outputRouter(".");
				}
				if(rando == 2) {
					outputRouter("\nThe " + num2Ordinal(temp + 1) + " ");
					outputRouter(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) outputRouter(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick");
					else {
						if(target.cocks[temp].thickness() == 1) outputRouter("one-inch thick");
						else outputRouter(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick");
					}
					if(target.cocks[temp].flaccidMultiplier != 1 && target.lust() < 100) outputRouter(" when fully erect");
					outputRouter(".");
				}
				if(rando == 3) {
					if(temp > 0) outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " next ");
					else outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " first ");
					outputRouter(target.simpleCockNoun(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) outputRouter(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches in diameter");
					else {
						if(Math.round(target.cocks[temp].thickness()*10)/10 == 1) outputRouter("one inch in diameter");
						else outputRouter(Math.round(target.cocks[temp].thickness()*10)/10 + " inches in diameter");
					}
					if(target.cocks[temp].flaccidMultiplier != 1 && target.lust() < 100) outputRouter(" when fully erect");
					outputRouter(".");
				}
				dickBonusForAppearance(forTarget, temp);
				//Dickbonus clears target at the end. Bring it back.
				if(forTarget != null) setTarget(forTarget);
				temp++;
				rando++;
				if(rando > 3) rando = 0;
			}
			//All sheathed
			if(target.hasFullSheaths()) outputRouter("\nEach of " + (target == pc ? "your":"[target.hisHer]") + " manhoods naturally retract into an animalistic sheath when completely flaccid.");
			//Worm flavor
			if(target.hasStatusEffect("Infested")) outputRouter("\nEvery now and again slimy worms coated in spunk slip partway out of " + (target == pc ? "your":"[target.hisHer]") + " " + target.multiCockDescript() + ", tasting the air like tongues of snakes.");
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
		
		var ballSize:Number = target.ballSize();
		var giantBalls:Boolean = (target.ballDiameter() >= (target.tallness/2));
		
		var sBallsackDesc:String = "";
		switch(ballsackType)
		{
			case GLOBAL.FLAG_FURRED:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += (target == pc ? "Your":"[target.HisHer]") + " fuzzy " + target.sackDescript(true,true,true) + " hugs " + (target == pc ? "your":"[target.hisHer]") + " " + sTesticleDesc + " tightly against " + (target == pc ? "your":"[target.hisHer]") + " body.";
				else if(target.cockTotal() == 0) sBallsackDesc += "A fuzzy " + target.sackDescript(true,true,true) + " filled with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " low under where a penis would normally grow.";
				else sBallsackDesc += "A fuzzy " + target.sackDescript(true,true,true) + " filled with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " low under " + (target == pc ? "your":"[target.hisHer]") + " " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Covered in plush, " + (ballsackColor != "" ? ballsackColor : target.furColor) + " fluff makes it absolutely squeezable!";
				break;
			case GLOBAL.FLAG_SCALED:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += (target == pc ? "Your":"[target.HisHer]") + " scaly " + target.sackDescript(true,true,true) + " hugs " + (target == pc ? "your":"[target.hisHer]") + " " + sTesticleDesc + " tightly against " + (target == pc ? "your":"[target.hisHer]") + " body.";
				else if(target.cockTotal() == 0) sBallsackDesc += "A scaly " + target.sackDescript(true,true,true) + " filled with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " low under where a penis would normally grow.";
				else sBallsackDesc += "A scaly " + target.sackDescript(true,true,true) + " filled with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " low under " + (target == pc ? "your":"[target.hisHer]") + " " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Covered in sleek, " + (ballsackColor != "" ? ballsackColor : target.scaleColor) + " scales makes it smooth to the touch.";
				break;
			case GLOBAL.FLAG_GOOEY:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += (target == pc ? "Your":"[target.HisHer]") + " " + target.sackDescript(true,true,true) + " clings tightly to " + (target == pc ? "your":"[target.hisHer]") + " groin, dripping ooze and holding " + sTesticleDesc + " snugly against " + (target == pc ? "you":"[target.himHer]") + ".";
				else if(target.cockTotal() == 0) sBallsackDesc += "An oozing, semi-solid sack with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " heavily under where a penis would normally grow.";
				else sBallsackDesc += "An oozing, semi-solid sack with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " heavily beneath " + (target == pc ? "your":"[target.hisHer]") + " " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " Its gelatinous, " + (ballsackColor != "" ? ballsackColor : target.skinTone) + " mass can allow it to jiggle and flop with ease.";
				break;
			default:
				if(target.hasStatusEffect("Uniball")) sBallsackDesc += (target == pc ? "Your":"[target.HisHer]") + " " + target.sackDescript(true,true,true) + " clings tightly to " + (target == pc ? "your":"[target.hisHer]") + " groin, holding " + (target == pc ? "your":"[target.hisHer]") + " " + sTesticleDesc + " snugly against " + (target == pc ? "you":"[target.himHer]") + ".";
				else if(target.cockTotal() == 0) sBallsackDesc += StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true,true))) + " with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " heavily under where a penis would normally grow.";
				else sBallsackDesc += StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true,true))) + " with " + sTesticleDesc + " " + (giantBalls ? "drags" : "swings") + " heavily beneath " + (target == pc ? "your":"[target.hisHer]") + " " + target.multiCockDescript() + ".";
				if(target.hasStatusEffect("Special Scrotum")) sBallsackDesc += " It is covered in smooth " + (ballsackColor != "" ? ballsackColor : target.skinTone) + " skin, allowing anyone to see it blush whenever " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused.";
				break;
		}
		//Does it mention the dick at the end of the sentence? If so, dont use pronoun here:
		if(target.hasCock() && !target.hasStatusEffect("Uniball"))
		{
			if(target.balls == 1) sBallsackDesc += " You estimate the testicle to be about " + num2Text(Math.round(ballSize)) + " ";
			else sBallsackDesc += " You estimate each testicle to be about " + num2Text(Math.round(ballSize)) + " ";
		}
		//No dick mention? Great! Pronouns deployed!
		else if(target.balls == 1) sBallsackDesc += " You estimate it to be about " + num2Text(Math.round(ballSize)) + " ";
		else sBallsackDesc += " You estimate each of them to be about " + num2Text(Math.round(ballSize)) + " ";
		if(Math.round(ballSize) == 1) sBallsackDesc += "inch";
		else sBallsackDesc += "inches";
		var ballDisplayDiameter:Number = Math.round(target.ballDiameter()*10)/10;
		sBallsackDesc += " around and " + ballDisplayDiameter + (ballDisplayDiameter != 1 ? " inches" : " inch") + " across.";
		//Vanaeballs
		if(target.statusEffectv4("Vanae Markings") > 0) sBallsackDesc += " Flowing across the surface of " + (target == pc ? "your":"[target.hisHer]") + " nutsack are intricate markings that glow " + target.skinAccent + ", softly pulsing with life.";
		
		if(sBallsackDesc != "")
		{
			if(target.cockTotal() == 0 && !target.hasVagina()) outputRouter("\n\n");
			else if(target.cockTotal() > 1) outputRouter("\n\n");
			else outputRouter(" ");
			outputRouter(sBallsackDesc);
		}
	}
	//VAGOOZ
	if(target.vaginas.length > 0) {
		if(target.hasCock() || target.balls > 0) outputRouter("\n\n");
		if(!target.hasCock() && target.isTaur()) outputRouter("As a tauric creature, " + (target == pc ? "your":"[target.hisHer]") + " womanly parts lie between " + (target == pc ? "your":"[target.hisHer]") + " rear legs in a rather equine fashion. ");
		
		var vagSwellBonus:int = 0;
		var vagWetness:Number = 0;
		
		//Vaginal Numbers
		if(target.vaginaTotal() == 1) {
			vagSwellBonus = target.vaginalPuffiness(0);
			
			outputRouter((target == pc ? "You have":"[target.HeShe] has") + " " + indefiniteArticle(target.vaginaDescript(0,false,false,true)) + ", with " + num2Text(target.vaginas[0].clits) + " " + Math.round(target.clitLength*10)/10 + "-inch clit");
			if(target.vaginas[0].clits > 1) outputRouter("s");
			if(target.vaginas[0].hymen) outputRouter(" and an intact hymen");
			outputRouter(". ");

			if(target == pc && target.hasStatusEffect("Mimbrane Pussy"))
			{
				feedVal = pc.mimbranePuffiness("Mimbrane Pussy");
				if(feedVal <= 0) {}
				else if(feedVal <= 1)
				{
					outputRouter("Your pussy appears");
					if(vagSwellBonus <= 0) outputRouter(" slightly");
					else if(vagSwellBonus <= 1) outputRouter(" a bit");
					else outputRouter(" very");
					outputRouter(" swollen. ");
				}
				else if(feedVal <= 2)
				{
					outputRouter("Your pussy appears noticably inflated");
					if(!target.isCrotchExposed())
					{
						outputRouter(" and creates");
						if(vagSwellBonus <= 0) outputRouter(" a slight");
						else if(vagSwellBonus <= 1) outputRouter(" a large");
						else outputRouter(" an enormous");
						outputRouter(" bulge beneath your");
						if(target.armor.type == GLOBAL.ARMOR) outputRouter(" armor");
						else outputRouter(" clothing");
					}
					outputRouter(". ");
				}
				else
				{
					outputRouter("Your pussy appears delightfully plump");
					if(!target.isCrotchExposed())
					{
						outputRouter(", creating");
						if(vagSwellBonus <= 0) outputRouter(" an undeniable");
						else if(vagSwellBonus <= 1) outputRouter(" a massive");
						else outputRouter(" a gargantuan");
						outputRouter(" bulge in " + (target == pc ? "your":"[target.hisHer]"));
						if(target.armor.type == GLOBAL.ARMOR) outputRouter(" armor");
						else outputRouter(" clothing");
					}
					outputRouter(". ");
				}
			}
			//Variances based on lustiness & wetness & such. THE DETAIL!
			vagWetness = target.vaginas[0].wetness();
			if(target.vaginas[0].hasFlag(GLOBAL.FLAG_LUBRICATED))
			{
				if(target.libido() < 50 && target.lust() < 50) outputRouter("Thin streams of [target.girlCum] occasionally dribble from ");
				else if(target.libido() < 80 && target.lust() < 80) outputRouter("Thick streams of [target.girlCum] drool constantly from ");
				else outputRouter("Immense streams of [target.girlCum] cascade profusely from ");
			}
			else if(target.libido() < 50 && target.lust() < 50) //not particularly horny
			{
				//Wetness
				if(vagWetness < 2) outputRouter("No moisture presently escapes ");
				else if(vagWetness < 4) outputRouter("Moisture gleams in ");
				else outputRouter("Occasional beads of [target.girlCum] drip from ");
			}
			else if(target.libido() < 80 && target.lust() < 80) //kinda horny
			{
				//Wetness
				if(vagWetness < 1) {}
				else if(vagWetness < 2) outputRouter("Moisture gleams in ");
				else if(vagWetness < 4) outputRouter("Occasional beads of [target.girlCum] drip from ");
				else outputRouter("Thin streams of [target.girlCum] occasionally dribble from ");
			}
			else //WTF horny!
			{
				//Wetness
				if(vagWetness < 1) {}
				else if(vagWetness < 2) outputRouter("Occasional beads of [target.girlCum] drip from ");
				else if(vagWetness < 4) outputRouter("Thin streams of [target.girlCum] occasionally dribble from ");
				else outputRouter("Thick streams of [target.girlCum] drool constantly from ");
			}
			//Different description based on vag looseness
			if(target.vaginas[0].looseness() < 2) outputRouter((target == pc ? "your":"[target.hisHer]") + " " + target.vaginaDescript(0) + ".");
			else if(target.vaginas[0].looseness() < 4) outputRouter((target == pc ? "your":"[target.hisHer]") + " " + target.vaginaDescript(0) + ", its lips slightly parted.");
			else outputRouter("the massive hole that is " + (target == pc ? "your":"[target.hisHer]") + " " + target.vaginaDescript(0) + ".");
			//Flavor
			vaginaBonusForAppearance(forTarget, 0, false);
			wombBonusForAppearance(forTarget, 0);
			//Genital Bonus clears target at the end. Bring it back.
			if(forTarget != null) setTarget(forTarget);
		}
		//MULTICOOCH!
		else if(target.vaginaTotal() > 1) 
		{
			outputRouter((target == pc ? "You have":"[target.Name] has") + " " + num2Text(target.vaginas.length) + " " + target.vaginasDescript() + ",");
			if(target.matchedVaginas()) 
			{
				if(target.totalVaginas() == 2) outputRouter(" both similar in appearance.");
				else outputRouter(" all similar in appearance.");
			}
			else outputRouter(" each a unique and beautiful flower.");
			temp = 0;
			while(temp < target.totalVaginas())
			{
				vagSwellBonus = target.vaginalPuffiness(temp);
				
				if(temp == 0) outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " first entrance");
				else if(temp == 1) outputRouter("\nThe second slit");
				else outputRouter("\nThe third and final vagina");
				outputRouter(" is " + indefiniteArticle(target.vaginaDescript(temp,false,false,true)) + " with " + num2Text(target.vaginas[temp].clits) + " " + int(target.clitLength*10)/10 + "-inch clit");
				if(target.vaginas[temp].clits > 1) outputRouter("s");
				//Virginal trumps all else
				if(target.vaginas[temp].hymen) outputRouter(", still virginal in appearance.");
				//Else wetness -> size
				else
				{
					vagWetness = target.vaginas[temp].wetness();
					if(target.vaginas[temp].hasFlag(GLOBAL.FLAG_LUBRICATED))
					{
						if(target.lust() < 50) outputRouter(", frequently drooling its ever-present [target.girlCumNoun]");
						else if(target.lust() < 75) outputRouter(", constantly drooling thick strands of [target.girlCumNoun]");
						else outputRouter(", profusely seeping immense streams of [target.girlCumNoun]");
					}
					//High wetness shit
					else if(vagWetness >= 4)
					{
						if(target.lust() < 50) outputRouter(", occassionally beading its ever-present [target.girlCumNoun]");
						else if(target.lust() < 75) outputRouter(", frequently drooling its ever-present [target.girlCumNoun]");
						else outputRouter(", constantly drooling thick strands of [target.girlCumNoun]");
					}
					//Medium wetness shit
					else if(vagWetness >= 2)
					{
						if(target.lust() > 50) outputRouter(", gleaming with barely-contained wetness");
					}
					//Size shit
					if(target.vaginas[temp].looseness() < 2) outputRouter(", its lips primly pressed together as if waiting for something");
					else if(target.vaginas[temp].looseness() < 4) outputRouter(", its lips slightly parted");
					else outputRouter(", its lips loosened by frequent fucking");
					outputRouter(".");
					if(!target.matchedVaginas())
					{
						vaginaBonusForAppearance(forTarget, temp, false);
						//Genital Bonus clears target at the end. Bring it back.
						if(forTarget != null) setTarget(forTarget);
					}
				}
				if(target == pc && temp == 0 && target.hasStatusEffect("Mimbrane Pussy"))
				{
					feedVal = pc.mimbranePuffiness("Mimbrane Pussy");
					if(feedVal <= 0) {}
					else if(feedVal <= 1)
					{
						outputRouter(" It appears");
						if(vagSwellBonus <= 0) outputRouter(" slightly");
						else if(vagSwellBonus <= 1) outputRouter(" a bit");
						else outputRouter(" very");
						outputRouter(" swollen from the mimbrane.");
					}
					else if(feedVal <= 2)
					{
						outputRouter(" It appears noticably inflated");
						if(!target.isCrotchExposed())
						{
							outputRouter(" and creates");
							if(vagSwellBonus <= 0) outputRouter(" a slight");
							else if(vagSwellBonus <= 1) outputRouter(" a large");
							else outputRouter(" an enormous");
							outputRouter(" bulge beneath your");
							if(target.armor.type == GLOBAL.ARMOR) outputRouter(" armor");
							else outputRouter(" clothing");
						}
						outputRouter(".");
					}
					else
					{
						outputRouter(" It appears delightfully plump");
						if(!target.isCrotchExposed())
						{
							outputRouter(", creating");
							if(vagSwellBonus <= 0) outputRouter(" an undeniable");
							else if(vagSwellBonus <= 1) outputRouter(" a massive");
							else outputRouter(" a gargantuan");
							outputRouter(" bulge in your");
							if(target.armor.type == GLOBAL.ARMOR) outputRouter(" armor");
							else outputRouter(" clothing");
						}
						outputRouter(".");
					}
				}
				wombBonusForAppearance(forTarget, temp);
				//Genital Bonus clears target at the end. Bring it back.
				if(forTarget != null) setTarget(forTarget);
				temp++;
			}
			if(target.matchedVaginas())
			{
				vaginaBonusForAppearance(forTarget, 0, true);
				//Genital Bonus clears target at the end. Bring it back.
				if(forTarget != null) setTarget(forTarget);
			}
		}
	}
	if(target.hasVagina() && target.pluggedVaginas() > 0)
	{
		outputRouter("\n\n<b>The smooth plug of set cundarian cum rubs against the lips of " + (target == pc ? "your":"[target.hisHer]") + " [pc.vaginas] and [pc.eachClit] as " + (target == pc ? "you move":"[target.heShe] moves") + ", a constant source of aggravating arousal that " + (target == pc ? "you":"[target.heShe]") + " can do nothing about.</b>");
	}
	//Genderless lovun'
	if(!target.hasGenitals()) {
		outputRouter("\n\n" + (target == pc ? "You have":"[target.Name] has") + " a curious lack of any sexual endowments.");
	}
	//BUNGHOLIO
	if(target.ass != null) {
		outputRouter("\n\n" + (target == pc ? "You have":"[target.Name] has") + " one " + target.assholeDescript(true) + ", placed between " + (target == pc ? "your":"[target.hisHer]") + " cheeks where it belongs");
		var assWetness:Number = target.ass.wetness();
		if(target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED))
		{
			if(target.libido() < 50 && target.lust() < 50) outputRouter(" with thin streams of lube leaking out of its edges.");
			else if(target.libido() < 80 && target.lust() < 80) outputRouter(" with thick streams of lubricant oozing constantly from the orifice quite liberally.");
			else outputRouter(" with immense streams of lubricant gushing profusely from the orifice, unrestrained and unending.");
		}
		else if(target.libido() < 50 && target.lust() < 50) //not particularly horny
		{
			//Wetness
			if(assWetness < 0) outputRouter(" without any sign of moisture.");
			else if(assWetness <= 2) outputRouter(".");
			else if(assWetness <= 4) outputRouter(" with slight signs of moisture bordering its edges.");
			else outputRouter(" with occasional beads of lube bordering its edges.");
		}
		else if(target.libido() < 80 && target.lust() < 80) //kinda horny
		{
			//Wetness
			if(assWetness < 0) outputRouter(", completely dry of any kind of moisture.");
			else if(assWetness <= 2) outputRouter(".");
			else if(assWetness <= 3) outputRouter(" with slight signs of moisture bordering its edges.");
			else if(assWetness < 5) outputRouter(" with occasional beads of lube bordering its edges.");
			else outputRouter(" with thin streams of lube leaking out of its edges.");
		}
		else //WTF horny!
		{
			//Wetness
			if(assWetness < 0) outputRouter(", desperately in need of lubricant.");
			else if(assWetness <= 2) outputRouter(".");
			else if(assWetness <= 3) outputRouter(" with occasional beads of lubricant dripping from the orifice every so often.");
			else if(assWetness < 5) outputRouter(" with thin streams of lubricant occasionally dribbling from the orifice.");
			else outputRouter(" with thick streams of lubricant oozing constantly from the orifice quite liberally.");
		}
		var assSwellBonus:int = target.analPuffiness();
		if(assSwellBonus >= 5) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " inhumanly soft, incredibly puffy and hyper-sized donut of a pucker protrudes greatly from between " + (target == pc ? "your":"[target.hisHer]") + " buns like an obscene pubic mound, unable to be ignored when moving and unable to be hidden easily from view.");
		else if(assSwellBonus >= 4) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " soft, puffy and abnormally large donut of a pucker protrudes obscenely, like an obvious pubic mound that rubs against " + (target == pc ? "your":"[target.hisHer]") + " buns with every movement " + (target == pc ? "you make":"[target.heShe] makes") + ".");
		else if(assSwellBonus >= 3) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " soft and puffy " + (target.hasPlumpAsshole() ? ("donut of a pucker protrudes obscenely, like a pubic mound that rubs against " + (target == pc ? "your":"[target.hisHer]") + " buns with every movement " + (target == pc ? "you make":"[target.heShe] makes")) : ("pucker protrudes obscenely between " + (target == pc ? "your":"[target.hisHer]") + " buns")) + ".");
		else if(assSwellBonus >= 2) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " soft " + (target.hasPlumpAsshole() ? ("donut of a pucker protrudes obscenely, almost like a miniature pubic mound that rubs against " + (target == pc ? "your":"[target.hisHer]") + " buns with every step " + (target == pc ? "you take":"[target.heShe] takes")) : ("pucker protrudes obscenely between " + (target == pc ? "your":"[target.hisHer]") + " buns")) + ".");
		else if(assSwellBonus >= 1) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " pucker is inhumanly soft and puffy, a " + (target.hasPlumpAsshole() ? ("beckoning donut with a perfect little hole in the middle") : ("little swollen between " + (target == pc ? "your":"[target.hisHer]") + " buttcheeks")) + ".");
		
		wombBonusForAppearance(forTarget, 3);
		
		// Womb Bonus clears target at the end. Bring it back.
		if(forTarget != null) setTarget(forTarget);
		
		if(target == pc && target.hasStatusEffect("Butt Bug (Female)")) outputRouter("\n\n" + appearanceButtBugBlurb());
	}
	if(forTarget != null) setTarget(null);
}

public function selectGenderPref():void
{
	clearOutput2();
	var outputRouter:Function = output2;
	outputRouter("Your current preferred gender is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Female", setGenderPref, "female");
	addGhostButton(1, "Male", setGenderPref, "male");
	addGhostButton(2, "Auto", setGenderPref, "auto");
	
	if(pc.hasStatusEffect("Force Fem Gender"))
	{
		outputRouter("<b>Female</b>.");
		outputRouter("\n\nNo matter your femininity value, genitalia presence, or any other contributing factors, where possible you will be considered female.");
		addDisabledGhostButton(0, "Female");
	}
	else if(pc.hasStatusEffect("Force Male Gender"))
	{
		outputRouter("<b>Male</b>.");
		outputRouter("\n\nNo matter your masculinity value, genitalia presence, or any other contributing factors, where possible you will be considered male.");
		addDisabledGhostButton(1, "Male");
	}
	else
	{
		outputRouter("<b>Automatic</b>.");
		outputRouter("\n\nPronouns used for your character will be based on contributions from a number of appearance properties, switching between male & female pronouns as appropriate.");
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

public function selectSiliconePref():void
{
	clearOutput2();
	var outputRouter:Function = output2;
	outputRouter("Your current preferred silicone description is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Full", setSiliconePref, 0);
	addGhostButton(1, "Moderate", setSiliconePref, 1);
	addGhostButton(2, "Light", setSiliconePref, 2);
	addGhostButton(3, "None", setSiliconePref, -1);
	
	if(!pc.hasStatusEffect("Silicone Preference"))
	{
		outputRouter("<b>Full</b>.");
		outputRouter("\n\nYour bio-silicone implants will be potentially described as fake and plastic, augmented and filled, as well as rounded and gravity defying.");
		addDisabledGhostButton(0, "Full");
	}
	else
	{
		if(pc.statusEffectv1("Silicone Preference") == 1)
		{
			outputRouter("<b>Moderate</b>.");
			outputRouter("\n\nYour bio-silicone implants will be potentially described as augmented and filled, as well as rounded and gravity defying, but not fake and plastic.");
			addDisabledGhostButton(1, "Moderate");
		}
		else if(pc.statusEffectv1("Silicone Preference") == 2)
		{
			outputRouter("<b>Light</b>.");
			outputRouter("\n\nYour bio-silicone implants will be potentially described as rounded and gravity defying, but not augmented and filled, nor fake and plastic.");
			addDisabledGhostButton(2, "Light");
		}
		else
		{
			outputRouter("<b>None</b>.");
			outputRouter("\n\nYour bio-silicone implants will not be specifically described.");
			addDisabledGhostButton(3, "None");
		}
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}
public function setSiliconePref(pref:int):void
{
	switch(pref)
	{
		case -1:
		case 1:
		case 2:
			pc.createStatusEffect("Silicone Preference");
			pc.setStatusValue("Silicone Preference", 1, pref);
			break;
		default:
			pc.removeStatusEffect("Silicone Preference");
			break;
	}
	
	selectSiliconePref();
}

public function selectWingPref():void
{
	clearOutput2();
	var outputRouter:Function = output2;
	outputRouter("Your current [pc.wingNoun] position is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Normal", setWingPref, 0, "Normal Position", "Your [pc.wingsNoun] fold" + (pc.wingCount == 1 ? "s" : "") + " normally behind you.");
	addGhostButton(1, "Body", setWingPref, 1, "Cover Your Body", "Fold your [pc.wingsNoun] to cover part of your body.");
	
	if(pc.statusEffectv1("Wing Position") == 1)
	{
		outputRouter("<b>Body</b>.");
		outputRouter("\n\nYour [pc.wings] " + (pc.wingCount == 1 ? "is" : "are") + " folded over your body, covering you");
		if(pc.hasGenitals() && pc.genitalLocation() <= 1) outputRouter(" and your genitals");
		outputRouter(" almost like clothing but not exactly.");
		addDisabledGhostButton(1, "Body", "Cover Your Body", "Your [pc.wingsNoun] " + (pc.wingCount == 1 ? "is" : "are") + " already positioned to cover your body.");
	}
	else
	{
		outputRouter("<b>Normal</b>.");
		outputRouter("\n\nYour [pc.wings] " + (pc.wingCount == 1 ? "rests in its" : "rest in their") + " normal position behind you.");
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
	
	pc.setStatusValue("Wing Position", 1, position);
	
	selectWingPref();
}

public function dickBonusForAppearance(forTarget:Creature = null, x:int = 0):void
{
	if(forTarget != null) setTarget(forTarget);

	var outputRouter:Function = output2;
	if(forTarget != pc) outputRouter = output;
	
	switch(target.cocks[x].cType)
	{
		//Color shit
		case GLOBAL.TYPE_EQUINE:
			if(target.cocks[x].cockColor == "mottled pink and black") outputRouter(" It’s mottled pink and black in a very animalistic pattern.");
			else outputRouter(" It’s " + target.cocks[x].cockColor + " in color and laced with thick veins.");
			break;
		//More general descripts - gotta be before flare/knot due to "It" sentence subject.
		case GLOBAL.TYPE_RASKVEL:
			outputRouter(" It’s fairly smooth and shapely in appearance, lacking in any severe or stimulating ridges.");
			break;
		//Tentacle cock flavor
		case GLOBAL.TYPE_TENTACLE:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" The entirety of its " + target.cocks[x].cockColor + " surface is covered in perspiring beads of slick moisture. It");
			else outputRouter(" Its " + target.cocks[x].cockColor + " length");
			outputRouter(" frequently shifts and moves of its own volition, the slightly oversized and mushroom-like head shifting in coloration to purplish-red whenever " + (target == pc ? "you become":"[target.heShe] becomes") + " aroused.");
			break;
		//Cat cock flavor
		case GLOBAL.TYPE_FELINE:
			outputRouter(" It ends in a " + (target.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED) ? "tapered" : "rounded") + " head");
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) outputRouter(", ringed in small, fleshy nubs that terrans have taken to calling “barbs” in spite of their softness. More of these “barbs” line the shaft, but they’re largest at the base, where they are likely to be rubbed against a clit mid-coitus.");
			else outputRouter(" much like that of a feline.");
			break;
		//Birdy cock flavor
		case GLOBAL.TYPE_AVIAN:
			outputRouter(" It is");
			if(!target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) && !target.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED)) outputRouter(" smooth,");
			outputRouter(" " + target.cockColor(x) + ", slightly wavy in shape, and tapers to a point when erect.");
			break;
		//Snake cock flavor
		case GLOBAL.TYPE_LIZAN:
		case GLOBAL.TYPE_SNAKE:
			if(InCollection(target.originalRace, ["snake", "naga", "naleen", "leithan", "half-leithan", "reptile-morph"])) outputRouter(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. The shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
			else outputRouter(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. Unlike " + indefiniteArticle(target.originalRace) + " penis, the shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
			break;
		//Anemone cock flavor
		case GLOBAL.TYPE_ANEMONE:
		case GLOBAL.TYPE_SIREN:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) outputRouter(" From the slit of " + (target == pc ? "your":"[target.hisHer]") + " foreskin pokes out a bundle of");
			else outputRouter(" The crown is surrounded by");
			outputRouter(" tiny tentacles with a venomous");
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) outputRouter(", aphrodisiac");
			outputRouter(" payload. At its base a number of similar, longer tentacles have formed");
			if(target.hasSheath(x) && !target.hasFullSheaths()) outputRouter(" the sheath forcing them to coil around " + (target == pc ? "your":"[target.hisHer]") + " shaft");
			outputRouter(", guaranteeing that pleasure will be forced upon " + (target == pc ? "your":"[target.hisHer]") + " partners.");
			break;
		//Kangawang flavor
		case GLOBAL.TYPE_KANGAROO:
			outputRouter(" It");
			if(target.hasSheath(x)) outputRouter(" usually lies coiled inside a sheath, but");
			outputRouter(" undulates gently and tapers to a point when erect, somewhat like a taproot.");
			break;
		//Draconic Cawk Flava flav
		case GLOBAL.TYPE_DRACONIC:
		case GLOBAL.TYPE_GRYVAIN:
			outputRouter(" With its " + (target.cocks[x].hasFlag(GLOBAL.FLAG_TAPERED) ? "tapered" : "bulbous") + " tip, there are few holes " + (target == pc ? "you":"[target.heShe]") + " wouldn’t be able to get into.");
			if(target.cocks[x].cType == GLOBAL.TYPE_DRACONIC) outputRouter(" It has a strange, knot-like bulb at its base, but doesn’t usually flare during arousal as a dog’s knot would.");
			break;
		//Beees
		case GLOBAL.TYPE_BEE:
			if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) outputRouter(" There’s a lot in common between human and zil genitals, but the alien member " + (target == pc ? "you’re":"[target.heShe]’s") + " packing has a much longer, stretchier foreskin than most terrans can pack. It also");
			else outputRouter(" The zil-like member " + (target == pc ? "you’re":"[target.heShe]’s") + " packing ");
			outputRouter(" looks vaguely glossy, like " + (target == pc ? "you":"[target.heShe]") + " oiled it up just a moment ago.");
			break;
		//Vanae flavor
		case GLOBAL.TYPE_VANAE:
			outputRouter(" The marine-like phallus has a tip capped with a cephalopod-shaped sucker, used to grasp and tug through sensitive depths for insemination or stimulation.");
			break;
		//Nyrean Girl-Cock flavor
		case GLOBAL.TYPE_NYREA:
			outputRouter(" The pseudo-penis is large and thick, with a shape similar to a horse phallus and lacking any veins. The flared tip is ringed with spikes meant to rupture the sperm sacs of a male nyrea and its slit is in the shape of an ‘x’.");
			break;
		//Little Green Man
		case GLOBAL.TYPE_HRAD:
			outputRouter(" The phallic member");
			if(target.skinFurScalesColor() != target.cocks[x].cockColor) outputRouter(" appears very much two-toned, with " + indefiniteArticle(target.skinFurScalesColor()) + " shaft and ending in " + indefiniteArticle(target.cocks[x].cockColor) + ",");
			else outputRouter(" has a");
			outputRouter(" pronounced bullet-shaped tip.");
			break;
		//Shark Cock:
		case GLOBAL.TYPE_SHARK:
			outputRouter( "The aquatic phallus is tapered but still quite tubular in appearance. It glistens like " + (target == pc ? "you’ve":"[target.heShe]") + " lubed it up not too long ago and has two pelvic fins framing its base.");
			break;
		// pig dick
		case GLOBAL.TYPE_SWINE:
			outputRouter(" The end twists in a corkscrew pattern, ");
			if(target.cocks[x].cLength() >= 18 && target.cocks[x].cThicknessRatio() <= 0.4) outputRouter("and it is long and thin, like");
			else if(target.cocks[x].cLength() < 18 && target.cocks[x].cThicknessRatio() > 0.4) outputRouter("but its length and width ratio is unlike that of");
			else if(target.cocks[x].cLength() < 18) outputRouter("but it’s not lengthy like");
			else outputRouter("but it’s wider than");
			outputRouter(" a pig’s.");
			break;
		// Moths
		case GLOBAL.TYPE_MOTHRINE:
			if(rand(2) == 0) outputRouter(" It’s a sensitive tube of stiff muscle that retracts inwards when soft. The head is pointed and slightly damp, suggesting self-lubrication.");
			else outputRouter(" It’s essentially a flexible, semi-hollow, sensitive tube that retracts inwards when not aroused. The head of your moth-cock is slightly pointed but soft, springy and a little moist.");
			break;
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter(" The entirety of " + (target == pc ? "your":"[target.hisHer]") + " [target.cockColor] shaft is smooth along its top and sides");
			if (target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) outputRouter(", with a number of faintly-visible, pulsing blue veins, and a number of smaller nubs lining the underside.");
			else outputRouter(".");
			if (target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) outputRouter(" The tip is blunt, wide, and flat, with a ring of muscle around the edges of the glans; this battering-ram of a cock will be sure to leave a memory on anyone " + (target == pc ? "you use":"[target.heShe] uses") + " it on.");
			break;
		case GLOBAL.TYPE_JANERIA:
			outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " [target.cockColor] dick is");
			//There has to be a better way but I don't wanna think that hard -lighterfluid
			if (target.cocks[x].hasFlag(GLOBAL.FLAG_SMOOTH))
			{
				outputRouter(" smooth");
				if (target.cocks[x].hasFlag(GLOBAL.FLAG_PREHENSILE))
				{
					outputRouter(" and prehensile");
					if (target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(", not to mention a little slippery to the touch");
				}
				else if (target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" and a little slippery to the touch");
			}
			else if (target.cocks[x].hasFlag(GLOBAL.FLAG_PREHENSILE))
			{
				outputRouter(" prehensile");
				if (target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) outputRouter(" and a little slippery to the touch");
			}
			else if (target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED))
			{
				outputRouter(" a little slippery to the touch");
			}
			else
			{
				outputRouter(" average");
			}
			outputRouter(". The diamond-shaped tip with a cumslit hidden along the underside makes it resemble the tentacle of some aquatic creature.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter(" The saurmorian phallus is ringed with thick, fattened ridge-like protrusions along its length, starting from the base and up the shaft until just below the");
			if (target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) outputRouter(" blunted");
			outputRouter(" tip.");
			break;
		case GLOBAL.TYPE_DEER:
			outputRouter(" The deer member is [target.cockColor " + x + "] in color and very horse-like in appearance with thick veins covering it’s length" + (target.hasCockFlag(GLOBAL.FLAG_TAPERED, x) ? ", however it ends in a pointed tip rather than a blunt one." : "."));
			break;
		case GLOBAL.TYPE_DZAAN:
			outputRouter(" The dzaan member has darker spots, made up of smooth keratin, dotted along its length.");
			break;
	}
	
	//Nubby or Ribbed
	if((target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_FELINE, GLOBAL.TYPE_FROSTWYRM])) || (target.cocks[x].hasFlag(GLOBAL.FLAG_RIBBED) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_SAURMORIAN])))
	{
		outputRouter(" It is");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) outputRouter(" covered in nub-like protrusions, spread out evenly across the shaft");
		else outputRouter(" lined with rib-like protrusions");
		outputRouter(", soft and rounded enough to massage any passage into which it is inserted.");
	}
	//Sheaths
	if(target.hasSheath(x) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_KANGAROO, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_SIREN]))
	{
		if(target.cockTotal() == 1 || (target.cockTotal() > 1 && !target.hasFullSheaths())) outputRouter(" The shaft of " + (target == pc ? "your":"[target.hisHer]") + " manhood naturally retracts into an animalistic sheath when completely flaccid.");
	}
	//Stinger-base
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_BASED) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE]))
	{
		outputRouter(" At its base a number of similar, longer tentacles have formed");
		if(target.hasSheath(x) && !target.hasFullSheaths()) outputRouter(" the sheath forcing them to coil around " + (target == pc ? "your":"[target.hisHer]") + " shaft");
		outputRouter(", guaranteeing that pleasure will be forced upon " + (target == pc ? "your":"[target.hisHer]") + " partners.");
	}
	//Lube
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_TENTACLE, GLOBAL.TYPE_JANERIA]))
	{
		outputRouter(" Its surface is slick and slippery, covered in an abundant amount of moist lubrication.");
	}
	//Sticky
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_STICKY))
	{
		outputRouter(" The length is glazed in a glossy sheen of saccharine oil that is sticky to the touch.");
	}
	//FLARE STUFF
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))
	{
		if(target.cocks[x].cType == GLOBAL.TYPE_EQUINE) outputRouter(" The ‘head’ of " + (target == pc ? "your":"[target.hisHer]") + " shaft flares proudly, just like a horse’s.");
		else outputRouter(" The ‘head’ of " + (target == pc ? "your":"[target.hisHer]") + " shaft widens quite noticeably, the better to stimulate " + (target == pc ? "your":"[target.hisHer]") + " partners.");
	}
	//"Blunt" head - for non-flared flat-tops
	else if(target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_FROSTWYRM, GLOBAL.TYPE_SAURMORIAN]))
	{
		outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " shaft ends in a blunted tip");
		if(target.cocks[x].cType == GLOBAL.TYPE_EQUINE) outputRouter(" similar to a terran horse’s");
		outputRouter(".");
	}
	//Double-headed
	else if(target.cocks[x].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED))
	{
		outputRouter(" The head of " + (target == pc ? "your":"[target.hisHer]") + " alien-looking cock consists of bulbous twin glans, ready to double the sensation of penetration.");
	}
	//Stinger-tip
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE]))
	{
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) outputRouter(" From the slit of " + (target == pc ? "your":"[target.hisHer]") + " foreskin pokes out a bundle of");
		else outputRouter(" The crown is surrounded by");
		outputRouter(" tiny tentacles with a venomous");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) outputRouter(", aphrodisiac");
		outputRouter(" payload.");
	}
	//Demon cock flavor
	if(target.cocks[x].cType == GLOBAL.TYPE_DEMONIC)
	{
		outputRouter(" The ");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) outputRouter("flared ");
		else if(target.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) outputRouter("blunt ");
		outputRouter("crown is ringed with a circle of rubbery protrusions that grow larger ");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) outputRouter("and push the foreskin down ");
		outputRouter("as " + (target == pc ? "you get":"[target.heShe] gets") + " more aroused. The entire thing is shiny and covered with tiny, sensitive nodules that leave no doubt about its demonic influences.");
	}
	//Foreskins
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED) && !InCollection(target.cocks[x].cType, [GLOBAL.TYPE_BEE, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_DEMONIC]))
	{
		outputRouter(" The head is also covered by stretchy foreskin, ensuring that it is kept protected and sensitive.");
	}
	
	//KNOT STUFF
	if(target.hasKnot(x))
	{
		trace("KNOT FIRED!");
		if(target.cocks[x].cType == GLOBAL.TYPE_DRACONIC)
		{
			if(target.cocks[x].knotMultiplier < 1.4) outputRouter(" The small knot of thicker flesh near the base of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + " is ready to be lodged inside a female.");
			else if(target.cocks[x].knotMultiplier <= 2) outputRouter(" The large bulge of flesh nestles just above the bottom of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
			else outputRouter(" The obscenely swollen lump of flesh near the base of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + " looks almost too big for " + (target == pc ? "your":"[target.hisHer]") + " cock.");
		}
		else if(target.cocks[x].knotMultiplier > 1)
		{
			if(target.cocks[x].knotMultiplier < 1.4) outputRouter(" A small knot of thicker flesh is near the base of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + ", ready to expand to help " + (target == pc ? "you":"[target.himHer]") + " lodge it inside a female.");
			else if(target.cocks[x].knotMultiplier <= 2) outputRouter(" A large bulge of flesh nestles just above the bottom of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
			else outputRouter(" The obscenely swollen lump of flesh near the base of " + (target == pc ? "your":"[target.hisHer]") + " " + target.cockDescript(x) + " looks almost too big for " + (target == pc ? "your":"[target.hisHer]") + " cock.");
		}
		//List thickness
		outputRouter(" The knot is " + Math.round(target.cocks[x].thickness() * target.cocks[x].knotMultiplier * 10)/10 + " inches wide" + (target.cocks[x].cType != GLOBAL.TYPE_DRACONIC ? " when at full size" : ", even when " + (target == pc ? "you’re":"[target.heShe]’s") + " not aroused") + ".");
		//Appended to knot texts!
		if(target.cocks[x].cType == GLOBAL.TYPE_KUITAN)
		{
			outputRouter(" Two smaller ones line the length of the shaft, the hallmark of the kui-tan race.");
		}
	}
	else trace("NO KNOT");
	
	//Painted wieners
	if(target.hasStatusEffect("Painted Penis") && target.statusEffectv1("Painted Penis") == x)
	{
		outputRouter(" Like some kind of perverse canvas, ");
		if(target.cockTotal() == 1) outputRouter((target == pc ? "your":"[target.hisHer]"));
		else outputRouter("the");
		outputRouter(" cock is painted");
		switch(flags["COCK_PAINTED_DESIGN"])
		{
			case 1: outputRouter(" in a glossy, bright pink with a pattern of red lipstick prints and pretty stars along its length. Lines travel across its form, leading to text that reads, “fuck me” at the root."); break;
			case 2: outputRouter(" in an iridescent, glittery rainbow of fractal patterns all along its length that twinkles in the light. Layered on top its glossy surface is a pattern of kiss marks dominated by a larger pair of plump green lips and text that reads, “Galaxy’s Best Dick” in big looping letters."); break;
			case 3: outputRouter(" in an ultra-shiny black, adorned with a textured design emulating a faux horse harness across its length. A circular ornament near the harness’ baseband bears a line of embossed text that reads, “Free Stud Services” to show how much of a stallion " + (target == pc ? "you are":"[target.heShe] is") + "."); break;
			case 4: outputRouter(" in a glowing neon orange, striped with black lines to emulate a construction hazard sign. The knot is colored to resemble a massive metallic wrecking ball, chained to the urethra, and decorated with the text that reads, “Bitch Wrecker” in bright orange."); break;
			default: outputRouter(" in a rich, regal-looking blue with jutting purple-to-red rounded-tipped spikes along the shaft and topped with a gem-decorated golden crown at the tip. There is text that reads, “Sex God” on its " + target.knotDescript(x) + ", showcasing its majesty."); break;
		}
	}
	//Candy colored cocks
	else if(target.cocks[x].cockColor == "red and white") {
		outputRouter(" Like a candy cane, ");
		if(target.cockTotal() == 1) outputRouter(target == pc ? "your":"[target.hisHer]");
		else outputRouter("the");
		outputRouter(" cock is striped red and white.");
	}
	
	// Mimbranes
	if(target == pc && x == 0 && target.hasStatusEffect("Mimbrane Cock"))
	{
		var feedVal:int = pc.mimbranePuffiness("Mimbrane Cock");
		if(feedVal > 0)
		{
			outputRouter(" The phallus itself");
			if(!target.isCrotchExposed()) outputRouter(" feels");
			else outputRouter(" looks");
			if(feedVal <= 1) outputRouter(" slightly swollen");
			else if(feedVal <= 2) outputRouter(" noticably inflated");
			else outputRouter(" unnaturally plump");
			if(!target.isCrotchExposed())
			{
				outputRouter(" under " + (target == pc ? "your":"[target.hisHer]"));
				if(target.armor.type == GLOBAL.ARMOR) outputRouter(" armor");
				else outputRouter(" clothing");
			}
			outputRouter(" due to the occupying mimbrane.");
		}
	}
	//Ovipositor
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_OVIPOSITOR))
	{
		if(target.cockTotal() == 1) outputRouter(" While phallic in shape, " + (target == pc ? "you are":"[target.heShe] is") + " aware that " + (target == pc ? "your":"[target.hisHer]") + " cock is capable of injecting more than just [target.cumNoun] into an orifice... namely eggs.");
		else outputRouter(" The phallus doubles as an egg-injecting organ.");
	}
	
	if(forTarget != null) setTarget(null);
}

public function vaginaBonusForAppearance(forTarget:Creature = null, x:int = 0, eachOne:Boolean = false):void
{
	if(forTarget != null) setTarget(forTarget);
	var outputRouter:Function = output2;
	if(forTarget != pc) outputRouter = output;
	
	switch(target.vaginas[x].type)
	{
		//Zil flavor!
		case GLOBAL.TYPE_BEE:
			if(target.vaginas[x].vaginaColor == "black and gold") {
				if(!eachOne) outputRouter(" The exterior folds are a dusky black, while the inner lining of " + (target == pc ? "your":"[target.hisHer]") + " tunnel is a glorious golden hue.");
				else outputRouter("\nEach vagina’s exterior folds are a dusky black, while the inner linings of " + (target == pc ? "your":"[target.hisHer]") + " tunnels are a glorious golden hue.");
			}
			break;
		//Naleen flavor
		case GLOBAL.TYPE_LIZAN:
		case GLOBAL.TYPE_NAGA:
			if(!eachOne) outputRouter(" The exterior lips are subtle and narrow, making " + (target == pc ? "your":"[target.hisHer]") + " lengthy entrance a little more discrete.");
			else outputRouter("\nEach vagina’s exterior lips are subtle and narrow, making " + (target == pc ? "your":"[target.hisHer]") + " lengthy entrances a little more discrete.");
			break;
		//LEITHAN FLAVOR
		case GLOBAL.TYPE_LEITHAN:
		case GLOBAL.TYPE_EQUINE:
			if(!eachOne) outputRouter(" The exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of " + (target == pc ? "your":"[target.hisHer]") + " arousal. When " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused, " + (target == pc ? "you’re":"[target.heShe]’s") + " told that they wink.");
			else outputRouter("\nEach vagina’s exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of " + (target == pc ? "your":"[target.hisHer]") + " arousal. When " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused, " + (target == pc ? "you’re":"[target.heShe]’s") + " told that they wink.");
			break;
		//Lapinara flavor
		case GLOBAL.TYPE_LAPINARA:
			if(!eachOne) outputRouter(" The exterior lips are chubby and the entrance seems eager to be packed with an ovipositor - or any phallus-shaped object.");
			else outputRouter("\nEach vagina’s exterior lips are chubby and their entrances seem eager to be packed with ovipositors - or any other phallus-shaped objects.");
			break;
		//Vanae flavor
		case GLOBAL.TYPE_VANAE:
			if(!eachOne) outputRouter(" The exterior folds glisten in the light, while the inner tunnel is lined with writhing, tentacle-like feelers.");
			else outputRouter("\nEach vagina’s exterior folds glisten in the light, while the inner tunnels are lined with writhing, tentacle-like feelers.");
			break;
		//Kui-tan flavor
		case GLOBAL.TYPE_KUITAN:
			if(target.vaginas[x].vaginaColor == "black") {
				if(!eachOne) outputRouter(" The exterior folds are dusky black, looking almost animalistic on " + (target == pc ? "your":"[target.hisHer]") + " body.");
				else outputRouter("\nEach vagina’s exterior folds are dusky black, looking almost animalistic on " + (target == pc ? "your":"[target.hisHer]") + " body.");
			}
			else {
				if(!eachOne) outputRouter(" The exterior mound is almost heart-shaped, full and thick near the top and narrower further down.");
				else outputRouter("\nEach vagina’s exterior mound is almost heart-shaped, full and thick near the top and narrow at the bottom.");
			}
			break;
		//Doggie flavor
		case GLOBAL.TYPE_CANINE:
		case GLOBAL.TYPE_VULPINE:
			if(!eachOne) outputRouter(" The exterior lips are that of a bitch and have a tendency to swell when in heat, giving it a very animalistic bent.");
			else outputRouter("\nEach vagina’s exterior lips are that of a bitch and have a tendency to swell when in heat, giving them a very animalistic bent.");
			break;
		case GLOBAL.TYPE_KORGONNE:
			if(!eachOne) outputRouter(" The surrounding mound and lips is nice and plump, swelling at the slightest provocation.");
			else outputRouter("\nEach vagina’s surrounding mound and lips are nice and plump, swelling at the slightest provocation.");
			outputRouter(" Less visible are the bundled nerves inside, ready to delight at stretching around a knot.");
			break;
		//Kitty flavor
		case GLOBAL.TYPE_FELINE:
			if(!eachOne) outputRouter(" The exterior lips are vestigial and featureless, making " + (target == pc ? "your":"[target.hisHer]") + " entrance quite modest");
			else outputRouter("\nEach vagina’s exterior lips are vestigial and featureless, making " + (target == pc ? "your":"[target.hisHer]") + " entrances quite modest");
			if(target.hasFur() || target.hasFeathers()) outputRouter(" and barely visible under " + (target == pc ? "your":"[target.hisHer]") + " " + ((target.hasFeathers() && target.hasPartFur("leg")) ? "fur" : target.skinFurScales(false,false,false,true)));
			outputRouter(".");
			break;
		//Birdy flavor
		case GLOBAL.TYPE_AVIAN:
			if(!eachOne) outputRouter(" The exterior lips are thin, flat and mostly featureless, appearing much like a bird’s cloaca at glance");
			else outputRouter("\nEach vagina’s exterior lips are thin, flat and mostly featureless, appearing much like a bird’s cloaca at glance");
			if(target.hasFur() || target.hasFeathers()) outputRouter(" and barely visible under " + (target == pc ? "your":"[target.hisHer]") + " " + ((target.hasFeathers() && target.hasPartFur("leg")) ? "fur" : target.skinFurScales(false,false,false,true)));
			outputRouter(".");
			break;
		//Siren flavor
		case GLOBAL.TYPE_ANEMONE:
		case GLOBAL.TYPE_SIREN:
			if(!eachOne) outputRouter(" The exterior opening is framed in writhing tentacles and the interior is lined with " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) ? "aphrodisiac-laced" : "pleasure-inducing") + " cilia.");
			else outputRouter("\nEach vagina’s exterior openings are framed in writhing tentacles and the interiors are lined with " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) ? "aphrodisiac-laced" : "pleasure-inducing") + " cilia.");
			break;
		//Goblin flavor
		case GLOBAL.TYPE_GABILANI:
			if(!eachOne) outputRouter(" The special muscles around " + (target == pc ? "your":"[target.hisHer]") + " vagina are strong and powerful, making it possible to swallow any insertion without the need to push it in.");
			else outputRouter("\nThe special muscles around " + (target == pc ? "your":"[target.hisHer]") + " talented vaginas are strong and powerful, making it possible to swallow insertions without the need of external forces to push them in.");
			break;
		//Nyrean flavor
		case GLOBAL.TYPE_NYREA:
			if(!eachOne) outputRouter(" The nyrean “pussy” is very soft, warm and puffy. Its interior is coated with " + (target == pc ? "your":"[target.hisHer]") + " [target.girlCum], ready to rear any eggs " + (target == pc ? "you":"[target.heShe]") + " might have the (mis)fortune of fertilizing.");
			else outputRouter("\nEach of " + (target == pc ? "your":"[target.hisHer]") + " nyrean “pussies” are very soft, warm and puffy. The interior is coated with " + (target == pc ? "your":"[target.hisHer]") + " [target.girlCum], ready to rear any eggs " + (target == pc ? "you":"[target.heShe]") + " might have the (mis)fortune of fertilizing.");
			break;
		//Flower flavor
		case GLOBAL.TYPE_FLOWER:
			if(!eachOne) outputRouter(" Like an orchid, the exterior opening is framed in beautifully-colored flower petals and has a cute freckle dotting " + (target.vaginas[x].clits == 1 ? "its" : "every") + " clit.");
			else outputRouter("\nLike a " + (target.totalVaginas(GLOBAL.TYPE_FLOWER) == 2 ? "pair" : "bouquet") + " of orchids, each vagina’s exterior openings are framed in beautifully-colored flower petals and has a cute freckle dotting every clit.");
			break;
		//Deer flavor
		case GLOBAL.TYPE_DEER:
			if(!eachOne) outputRouter(" " + (target == pc ? "Your":"[target.HisHer]") + " labia are swollen and fat, outlining " + (target == pc ? "your":"[target.hisHer]") + " vagina, and often shine with a wet sheen regardless of " + (target == pc ? "your":"[target.hisHer]") + " arousal. " + (target == pc ? "You’re":"[target.HeShe]’s") + " told that they wink when " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused.");
			else outputRouter("\nEach vagina’s labia are swollen and fat, often shining with a wet sheen regardless of " + (target == pc ? "your":"[target.hisHer]") + " arousal. " + (target == pc ? "You’re":"[target.HeShe]’s") + " told that they wink when " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused.");
			break;
		//Shark Vagina:
		case GLOBAL.TYPE_SHARK:
			if(!eachOne) outputRouter(" The exterior lips are puffy and framed by fin-like flaps, while the interior of " + (target == pc ? "your":"[target.hisHer]") + " vaginal canal is filled with tiny cilia that massage and pull any invaders deeper in.");
			else outputRouter("\nEach vagina’s exterior lips are puffy and framed by fin-like flaps, while their interiors are filled with tiny cilia that massage and pull any invaders deeper in.");
			break;
		//Pork flavor
		case GLOBAL.TYPE_SWINE:
			if(!eachOne) outputRouter(" The");
			else outputRouter("\nEach vagina’s");
			outputRouter(" exterior lips are typically featureless, except for when " + (target == pc ? "you’re":"[target.heShe]’s") + " aroused and they swell outward.");
			break;
		//Cold Fly Lizard flavor:
		case GLOBAL.TYPE_FROSTWYRM:
			outputRouter((eachOne ? "\nThe entire length of each":" The entire length of "+(target == pc?"your":"[target.hisHer]")) + " cunt is filled with folds that put a human woman’s to shame in their depth and quantity, catching even the smallest bit of texture on a dick and refusing to let go. Dozens of small but powerful muscles ensure " + (target == pc ? "your":"[target.hisHer]") + " fold-filled " + (eachOne ? "snatches":"snatch") + " can exert its grip on any dick no matter the size, while a few tweaks to the shape and position of " + (target == pc ? "your":"[target.hisHer]") + " " + (target.hasVaginas() || target.vaginas[0].clits > 1 ? "clits":"clit") + " ensure " + (target == pc ? "you’re":"[target.heShe]’s") + " optimized for being taken from behind.");
			break;
		case GLOBAL.TYPE_SAURMORIAN:
			outputRouter((eachOne ? "\nTheir lips" : " The lips") + " are quite plump, and always have a smooth and glossy sheen to them.");
			if (target.vaginas[x].hasFlag(GLOBAL.FLAG_RIBBED)) outputRouter(" The walls inside "+(target == pc?"your":"[target.hisHer]") + " vagina, meanwhile, are lined with soft, sensitive ribbing from entrance to womb.");
			break;
		//Attack of the mouthginas!
		case GLOBAL.TYPE_MOUTHGINA:
			var mouthSize:String = "plump, bee stung";
			var mouthPuff:Number = target.vaginalPuffiness(x);
			if(mouthPuff <= 1) mouthSize = (RandomInCollection(["small", "petite", "supple"]) + ", womanly");
			else if(mouthPuff <= 2) mouthSize = (RandomInCollection(["pouty", "puffy", "cushiony", "plump", "succulent", "juicy", "luscious", "voluptuous"]) + ", bee-stung");
			else if(mouthPuff <= 3) mouthSize = (RandomInCollection(["hypnotic", "dazzling", "fat", "large", "engorged", "constantly pursed", "bloated", "pillowy", "whorish", "‘O’-shaped", "permanently puckered"]) + ", oversized");
			else mouthSize = (RandomInCollection(["jacquesian", "scylla-tier", "universe-distorting"]) + ", hyper-sized");
			
			if(!eachOne) outputRouter(" Instead of the usual inner and outer labia, " + (target == pc ? "your":"[target.hisHer]") + " opening is shaped like a mouth, with " + mouthSize + " lips, frozen in a permanent seductive expression.");
			else outputRouter("\nInstead of the usual inner and outer labia, " + (target == pc ? "your":"[target.hisHer]") + " vaginal openings are shaped like mouths, each with " + mouthSize + " lips, frozen in a permanent seductive expression.");
			if(target.vaginas[x].clits >= 1)
			{
				if(target.vaginas[x].clits == 1) outputRouter(" A single polished, metallic-colored clit adorns " + (target == pc ? "your":"[target.hisHer]") + " muff,");
				if(target.vaginas[x].clits == 2) outputRouter(" A couple of polished, metallic-colored clits adorn " + (target == pc ? "your":"[target.hisHer]") + " muff,");
				if(target.vaginas[x].clits > 2) outputRouter(" Several polished, metallic-colored clits adorn " + (target == pc ? "your":"[target.hisHer]") + " muff,");
				if(target.isBimbo()) outputRouter(" looking totally adorable and");
				else if(target.vaginas[x].clits > 2) outputRouter(" giving it a punk-ish look and");
				outputRouter(" drawing all the attention - or wandering hands - to ");
				if(!eachOne) outputRouter(" itself");
				else outputRouter(" themselves");
				outputRouter(".");
			}
			break;
		default:
			if(!eachOne) outputRouter(" The exterior lips are normal and feminine for the most part.");
			else outputRouter("\n" + (target == pc ? "Your":"[target.HisHer]") + " feminine vaginas each match the other in both appearance and features.");
			break;
	}
	//Pumped
	var wasPumped:Boolean = target.hasStatusEffect("Pussy Pumped");
	var omitPumped:Boolean = false; //(target.vaginas[x].type == GLOBAL.TYPE_MOUTHGINA);
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED) && !omitPumped)
	{
		if(!eachOne) outputRouter(" The whole thing is freakishly fat and overflowing " + (target == pc ? "your":"[target.hisHer]") + " lap" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". There is no use hiding that colossal beachball of a cunt" + (target.isCrotchExposed() ? (", even if " + (target == pc ? "you":"[target.heShe]") + " tried") : (" under " + (target == pc ? "your":"[target.hisHer]") + " clothing")) + ".");
		else outputRouter(" Each vagina is freakishly fat and overflowing " + (target == pc ? "your":"[target.hisHer]") + " lap" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". There is no use hiding those colossal beachballs of a cunt" + (target.isCrotchExposed() ? (", even if " + (target == pc ? "you":"[target.heShe]") + " tried") : (" under " + (target == pc ? "your":"[target.hisHer]") + " clothing")) + ".");
	}
	else if(target.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !omitPumped)
	{
		if(!eachOne) outputRouter(" The whole thing is ridiculously puffy and lush" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". Even" + (target.isCrotchExposed() ? " if " + (target == pc ? "you":"[target.heShe]") + " tried, there is just no hiding its" : " under clothing, it generates a") + " considerable camel-toe.");
		else outputRouter(" Each vagina is ridiculously puffy and lush" + (wasPumped ? ", a result of repeated use of a pussy pump" : " with womanly flesh") + ". Even" + (target.isCrotchExposed() ? " if " + (target == pc ? "you":"[target.heShe]") + " tried, there is just no hiding their" : " under clothing, they fully display their") + " monumental moose-knuckles.");
	}
	//Slightly pumped
	else if(target.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !omitPumped)
	{
		if(!eachOne) outputRouter(" The whole thing puffs out slightly, seemingly constantly engorged" + (wasPumped ? " ever since " + (target == pc ? "your":"[target.hisHer]") + " play with a pussy pump" : " with girl flesh") + ".");
		else outputRouter(" Each vagina is puffed out slightly, seemingly constantly engorged" + (wasPumped ? " ever since " + (target == pc ? "your":"[target.hisHer]") + " play with a pussy pump" : " with girl flesh") + ".");
	}
	//Outer-Tentacles
	if((target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) && !InCollection(target.vaginas[x].type, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE])) {
		if(!eachOne) outputRouter(" Writhing" + (target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) ? " venom-injecting" : "") + " tendrils border the exterior around its lips.");
		else outputRouter(" Writhing" + (target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_TIPPED) ? " venom-injecting" : "") + " tendrils border the exterior around their lips.");
	}
	//Nubby or Inner-Tentacles
	if((target.vaginas[x].hasFlag(GLOBAL.FLAG_NUBBY) || target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_BASED)) && !InCollection(target.vaginas[x].type, [GLOBAL.TYPE_SIREN, GLOBAL.TYPE_ANEMONE, GLOBAL.TYPE_SHARK])) {
		if(!eachOne) outputRouter(" The lips and insides are covered in numerous " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_NUBBY) ? "nub" : "tentacle") + "-like " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_BASED) ? "stingers" : "protrusions") + ".");
		else outputRouter(" Their lips and insides are covered in numerous " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_NUBBY) ? "nub" : "tentacle") + "-like " + (target.vaginas[x].hasFlag(GLOBAL.FLAG_STINGER_BASED) ? "stingers" : "protrusions") + ".");
	}
	//Ribbed
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_RIBBED) && target.vaginas[x].type != GLOBAL.TYPE_SAURMORIAN)
	{
		if(!eachOne) outputRouter(" The insides are lined with rib-like protrusions, soft and rounded enough to massage any insertion.");
		else outputRouter(" Their insides are lined with rib-like protrusions, soft and rounded enough to massage any insertion.");
	}
	//Tongue
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_TONGUE))
	{
		if(!eachOne) outputRouter(" The interior also hosts a thick, erogenous tongue.");
		else outputRouter(" Their interiors each house a thick, erogenous tongue.");
	}
	//Ovipositor
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_OVIPOSITOR))
	{
		if(!eachOne) outputRouter(" Moving its internal muscles, " + (target == pc ? "you know":"[target.heShe] knows") + " it has the ability to lay eggs into another orifice.");
		else outputRouter(" Moving their internal muscles, " + (target == pc ? "you know":"[target.heShe] knows") + " know they have the ability to lay eggs into another orifice.");
	}
	
	if(forTarget != null) setTarget(null);
}

public function wombBonusForAppearance(forTarget:Creature = null, x:int = 0):void
{
	if(forTarget != null) setTarget(forTarget);
	var outputRouter:Function = output2;
	if(forTarget != pc) outputRouter = output;
	
	// Womb contents
	if(target.isPregnant(x))
	{
		var pData:PregnancyData = target.pregnancyData[x];
		if(pData.pregnancyBellyRatingContribution >= 10 && pData.pregnancyIncubation > -1)
		{
			outputRouter(" Its " + (x < 3 ? "womb" : "inside") + " is currently gestating ");
			switch(PregnancyManager.getPregnancyChildType(target, x))
			{
				case GLOBAL.CHILD_TYPE_LIVE: outputRouter(pData.pregnancyQuantity == 1 ? "a child" : "children"); break;
				case GLOBAL.CHILD_TYPE_EGGS: outputRouter(pData.pregnancyQuantity == 1 ? "an egg" : "eggs"); break;
				case GLOBAL.CHILD_TYPE_SEED: outputRouter(pData.pregnancyQuantity == 1 ? "a seedling" : "seedlings"); break;
				default: outputRouter("an unknown mass"); break;
			}
			outputRouter(".");
		}
	}
	
	if(forTarget != null) setTarget(null);
}

public function selectTentacleLegsPref():void
{
	clearOutput2();
	var outputRouter:Function = output2;
	outputRouter("Your lower tentacles are currently set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Normal", setTentacleLegsPref, undefined, "Normal Form", "Support yourself on a writhing mass of tentacles.");
	addGhostButton(1, "Legs", setTentacleLegsPref, undefined, "Legs Form", "Form your tentacles into two legs.");
	
	if(!pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && pc.legCount == 2)
	{
		outputRouter("<b>Legs</b>.");
		outputRouter("\n\nYour lower tentacles are wound up together, acting as a facsimile of two normal legs.");
		addDisabledGhostButton(1, "Legs", "Legs Form", "Your tentacles are already formed into legs.");
	}
	else if(pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS) && pc.legCount == 1)
	{
		outputRouter("<b>Normal</b>.");
		outputRouter("\n\nYour lower tentacles are an ever-shifting, writhing mass.");
		addDisabledGhostButton(0, "Normal", "Normal Form", "Your lower tentacles are already a shapeless mass of tentacles.");
	}
	else
	{
		outputRouter("<b>Custom</b>.");
		outputRouter("\n\nYou can revert the changes to your lower tentacles if you so choose.");
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
	return (InCollection(sColor, ["bronze", "copper", "silver", "gold", "platinum", "sable", "onyx", "brass", "cobalt"]));
}
public function colorIsGemstone(sColor:String = ""):Boolean
{
	return (InCollection(sColor, ["crimson", "garnet", "ruby", "citrine", "topaz", "amber", "peridot", "emerald", "jade", "turquoise", "aquamarine", "lapis", "sapphire", "violet", "amethyst", "opal", "pearl", "crystal", "diamond"]));
}
public function colorIsLuminous(sColor:String = ""):Boolean
{
	return (sColor.indexOf("luminous") != -1 || sColor.indexOf("glowing") != -1 || sColor.indexOf("fiery") != -1);
}
